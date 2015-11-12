Rails.application.routes.draw do
  # Fixing wrong routes from PaypalExpress gem ...
  get '/paypal', :to => "spree/paypal#express", :as => :paypal_express

  get '/locales', to: "locales#switch", as: :locales
  get '/distributeurs', to: 'specials_pages#distributeurs'
  mount Ckeditor::Engine => '/ckeditor'
  mount Spree::Core::Engine, at: '/'
end
