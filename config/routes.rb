Rails.application.routes.draw do
  
  root 'application#index'
  devise_for :users, controllers: {
    passwords: "devise_overrides/passwords"
  }
  get '*path' => 'application#index'
  
end
