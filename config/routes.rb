Rails.application.routes.draw do

  scope 'api' do
    resources :skateparks, only: [:index, :show]
    resources :users, except: [:update, :edit, :show]

    # serves up users' favorites
    get '/users/:id/favorites/' => 'users#favorites'

    # create a favorite, maybe make this more restful
    # post '/favorites/:skatepark_id/:user_id' => 'favorites#create'
    post '/users/:user_id/favorites/:skatepark_id' => 'favorites#create'

  end
  
end