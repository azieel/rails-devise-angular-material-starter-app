Rails.application.routes.draw do

    root 'application#index'
    devise_for :users, controllers: {
        passwords: "devise_overrides/passwords",
        sessions: "devise_overrides/sessions"
    }

    namespace :api do
        namespace :v1 do
            resources :admins
            resources :customers
            resources :compagnies
        end
    end

    #Default redirection
    get '*path' => 'application#index'

end
