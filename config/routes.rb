Rails.application.routes.draw do
  resources :rules, defaults: { :format => :json }
end
