Rails.application.routes.draw do
  get '/locales', to: "locales#switch", as: :locales
  get '/distributeurs', to: 'specials_pages#distributeurs'
  mount Ckeditor::Engine => '/ckeditor'
  mount Spree::Core::Engine, at: '/'
end
