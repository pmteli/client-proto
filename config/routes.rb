DemoFirstengage::Application.routes.draw do

  scope "backbone" do
    resources :buildings
  end

  #root 'main#index'

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#portfolio'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end
  resources :utility do
    get 'index', on: :collection
    get 'save_filter', on: :collection
    get 'view_chart', on: :collection
    get 'view_metric', on: :collection
    get 'chart_view', on: :collection
    get 'list_view', on: :collection
    get 'reports', on: :collection
    post 'filter_users', on: :collection
    get 'view_report', on: :collection
    get 'download_report', on: :collection
  end

  resources :dashboard do
    get 'index', on: :collection
    get 'coming_soon', on: :collection
  end

  resources :home do
    get 'index', on: :collection
    get 'eon_index', on: :collection
    get 'portfolio', on: :collection
    get 'list_view', on: :collection
    get 'map_view', on: :collection
    get 'your_cost', on: :collection
    get 'your_electric', on: :collection
    get 'your_gas', on: :collection
    get 'your_savings', on: :collection
    get 'your_usage', on: :collection
    get 'load_building', on: :collection
    get 'energy_analysis', on: :collection
    get 'energy_performance', on: :collection
  end

  resources :your_electric do
    get 'index', on: :collection
    get 'usage', on: :collection
    get 'cost', on: :collection
    get 'weather', on: :collection
    get 'schedule', on: :collection
    get 'weather_impact', on: :collection
    get 'peak_demand_days', on: :collection
    get 'daily_load_profile', on: :collection
    get 'operating_schedule', on: :collection
    get 'occupancy_ratio', on: :collection
    get 'end_use_distribution', on: :collection
    get 'meter_data', on: :collection
    get 'aggregated_meter_chart', on: :collection
    get 'download_csv', on: :collection
  end

  resources :your_cost do
    get 'index', on: :collection
    get 'usage', on: :collection
    get 'cost', on: :collection
    get 'weather', on: :collection
    get 'schedule', on: :collection
    get 'recommendations', on: :collection
    get 'gas', on: :collection
    get 'electric', on: :collection
  end

  resources :your_gas do
    get 'index', on: :collection
    get 'usage', on: :collection
    get 'cost', on: :collection
    get 'weather', on: :collection
    get 'schedule', on: :collection
    get 'recommendations', on: :collection
  end

  resources :your_usage do
    get 'index', on: :collection
    get 'usage', on: :collection
    get 'cost', on: :collection
    get 'weather', on: :collection
    get 'schedule', on: :collection
    get 'recommendations', on: :collection
    get 'gas', on: :collection
    get 'electric', on: :collection
    get 'monthly_chart', on: :collection
    get 'daily_chart', on: :collection
    get 'weather_analytics', on: :collection
    get 'energy_analytics', on: :collection
  end

  #resources :first_engage do
  #  get 'index', on: :collection
  #  get 'coming_soon', on: :collection
  #  get 'ytd_chart', on: :collection
  #  get 'last_month_chart', on: :collection
  #  get 'your_cost', on: :collection
  #  get 'your_electric', on: :collection
  #  get 'your_gas', on: :collection
  #  get 'your_savings', on: :collection
  #end


  #namespace :ff_engage do
  #  resources :your_cost do
  #    get 'index', on: :collection
  #    get 'usage', on: :collection
  #    get 'weather', on: :collection
  #    get 'schedule', on: :collection
  #  end
  #end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
