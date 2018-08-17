Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home'
  get '/products/all', to: 'products#index', as: 'products'
  get '/products/:id', to: 'products#show', as: 'product'
  get '/categories/:id', to: 'categories#show', as: 'category'
  get '/express_checkout', to: 'payment#express_checkout'
  get '/checkout_details', to: 'payment#checkout_details'
  get '/cart', to: 'cart#index', as: 'cart'
  get '/avisolegal', to: 'home#legal', as: 'legal'
  get '/infopago', to: 'home#infopago', as: 'infopago'
  get '/perfil', to: 'home#perfil', as: 'perfil'
  get '/userorders', to: 'home#userorders', as: 'userorders'
  post '/purchase', to: 'payment#purchase'
  post '/addprod', to: 'cart#addprod'
  post '/updprod', to: 'cart#updprod'
  post '/deleteprod', to: 'cart#deleteprod'

  default_url_options :host => 'home#home'

end
