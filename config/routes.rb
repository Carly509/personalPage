Rails.application.routes.draw do
  # resources :messages
  # get 'admin/messages', to: 'messages#index'
  # get    'admin/login',   to: 'sessions#new'
  # post   'admin/login',   to: 'sessions#create'
  # get     'admin/new', to:  'users#new'
  # get     'admin/all', to:  'users#index'
  # delete 'admin/logout',  to: 'sessions#destroy'
  # get    'about',   to: 'posts#contact'
  root 'posts#home'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  match "/404", to: "errors#not_found", :via => [:get, :post]
  match "/422", to: "errors#unacceptable", :via => [:get, :post]
  match "/500", to: "errors#internal_server_error", :via => [:get, :post]
  # 301 redirect from old URLs
  match "/old_path_to_posts/:id", to: redirect("/posts/%{id}s"), :via => [:get, :post]

    # Force www redirect
  # Start server with rails s -p 3000 -b lvh.me
  # Then go to http://www.lvh.me:3000
  constraints(host: /^(?!www\.)/i) do
    match '(*any)' => redirect { |params, request|
      URI.parse(request.url).tap { |uri| uri.host = "www.#{uri.host}" }.to_s
    }, :via => [:get, :post]
  end
  
end
