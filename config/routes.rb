Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :open_graph_entities, only: [:create, :index]
    end
  end
end
