module Api
  module V1
    class OpenGraphEntitiesController < ApplicationController
      # TODO: Add before authenticate.
      # before_action :authenticate_user
      def index
        og_entities = OpenGraphEntity.order('created_at DESC').page params[:page]
        render json: {status: 'SUCCESS', message: 'Loaded open graph entities', data: og_entities}, status: :ok
      end

      def create
        begin
          unless OpenGraphEntity.find_by_url(og_entity_params).nil?
            render json: {status: 'SUCCESS', message: 'Open graph entity already exist in our database'}, status: :ok
            return
          end

          open_graph_data = OpenGraphService.new(og_entity_params).call
          if open_graph_data.nil?
            render json: {status: 'ERROR', message: 'OG data is incomplete/missing'}, status: :bad_request
            return
          end

          OpenGraphEntity.create!(
            'title': open_graph_data.title,
            'type': open_graph_data.type,
            'url': open_graph_data.url,
            'description': open_graph_data.description,
            'images': open_graph_data.images
          )
        rescue ActiveRecord::RecordInvalid => invalid
          render json: {status: 'ERROR', message: "OG data is incomplete/missing #{invalid.message}"}, status: :bad_request
          return
        rescue Exception => exception
          render json: {status: 'ERROR', message: "Error while fetching open graph entity, #{exception.message}"}, status: :bad_request
          return
        end

        render json: {status: 'SUCCESS', message: 'Open graph entity fetched successfully'}, status: :ok
      end

      private

      def og_entity_params
        params.require(:url)
      end
    end
  end
end
