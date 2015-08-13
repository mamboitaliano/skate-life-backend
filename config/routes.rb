Rails.application.routes.draw do
  match '*all', to: 'application#preflight', via: [:options]

  scope 'api' do
    resources :skateparks, only: [:index, :show]
    resources :users, except: [:update, :edit, :new]

    # serves up users' favorites
    get '/users/:id/favorites/' => 'users#favorites'

    # create a favorite, maybe make this more restful
    post '/users/:id/favorites/:skatepark_id' => 'favorites#create'
    post '/users/:id/authenticate' => 'users#authenticate'

    # attend and leave skateparks
    post '/users/:id/skateparks/:skatepark_id' => 'users#attend_park'
    delete '/users/:id/skateparks/:skatepark_id' => 'users#leave_park'

    get '/skateparks/:id/attendee_count' => 'skateparks#attendee_count'
  end
end
