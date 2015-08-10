Rails.application.routes.draw do
  match '*all', to: 'application#preflight', via: [:options]

  scope 'api' do
    resources :skateparks, only: [:index, :show]
    resources :users, except: [:update, :edit, :new]

    # serves up users' favorites
    get '/users/:id/favorites/' => 'users#favorites'

    # create a favorite, maybe make this more restful
    post '/users/:user_id/favorites/:skatepark_id' => 'favorites#create'
    get '/users/:id/authenticate' => 'users#authenticate'

  end
end
