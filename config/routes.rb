Rails.application.routes.draw do
  get  '/',            to: 'token#new'
  post '/',            to: 'token#create'
  get  '/:token',      to: 'token#show'
  get  '/:token/info', to: 'token#info'
end
