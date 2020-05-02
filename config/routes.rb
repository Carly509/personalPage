Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :direct_messages
  devise_for :users
  get "home/download_pdf"

  root 'home#index'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  match "/404", to: "errors#not_found", :via => [:get, :post]
  match "/422", to: "errors#unacceptable", :via => [:get, :post]
  match "/500", to: "errors#internal_server_error", :via => [:get, :post]
  # 301 redirect from old URLs
  #match "/old_path_to_posts/:id", to: redirect("/posts/%{id}s"), :via => [:get, :post]

    # Force www redirect
  # Start server with rails s -p 3000 -b lvh.me
  # Then go to http://www.lvh.me:3000
  constraints(host: /^(?!www\.)/i) do
    match '(*any)' => redirect { |params, request|
      URI.parse(request.url).tap { |uri| uri.host = "www.#{uri.host}" }.to_s
    }, :via => [:get, :post]
  end
  
end
