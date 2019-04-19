Rails.application.routes.draw do
  mount Spina::Engine => '/blog'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  resources :health_check, only: :index
end
