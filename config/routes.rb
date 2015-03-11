Rails.application.routes.draw do

    root 'application#index'

    devise_for :users, controllers: {
        passwords: "devise_overrides/passwords"
    }

    resources :admins
    resources :customers
    resources :compagnies

    #Default redirection
    get '*path' => 'application#index'

end
