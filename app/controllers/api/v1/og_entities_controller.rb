module Api
  module V1
    class OgEntitiesController < ApplicationController
      # TODO : Add before authentication here.

      def index
        og_entities = OgEntity.order('created_at DESC').page params[:page]
        render json: {status: 'SUCCESS', message: 'Loaded open graph entities', data: og_entities}, status: :ok
      end

      def create
        begin
          open_graph_data = OpenGraphService.new(og_entity_params).call
          if open_graph_data.nil?
            render json: {status: 'ERROR', message: 'OG data is incomplete/missing'}, status: :bad_request
            return
          end

          OgEntity.create!(
            'title': open_graph_data.title,
            'type': open_graph_data.type,
            'url': open_graph_data.url,
            'description': open_graph_data.description,
            'images': open_graph_data.images
          )
        rescue ActiveRecord::RecordInvalid => invalid
          render json: {status: 'ERROR', message: 'OG data is incomplete/missing'}, status: :bad_request
          return
        rescue Exception => e
          render json: {status: 'ERROR', message: "Error while fetching og entity, #{e.message}"}, status: :bad_request
          return
        end

        render json: {status: 'SUCCESS', message: 'Og entity fetched successfully'}, status: :ok
      end

      private

      def og_entity_params
        params.require(:url)
      end
    end
  end
end
