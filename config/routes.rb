Rails.application.routes.draw do
  root 'static_pages#home'
  get '/checkCharacter', to: 'static_pages#checkCharacter'
end
