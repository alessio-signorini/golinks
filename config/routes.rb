Rails.application.routes.draw do
  root 'home#index'
  match "*path", to: "routing#redirect", via: :all
end
