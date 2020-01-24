Rails.application.routes.draw do
  match "*path", to: "routing#redirect", via: :all
end
