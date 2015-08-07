Rails.application.routes.draw do

  scope 'api' do
    resources :skateparks, only: [:index, :show]
    resources :users, except: [:update, :edit, :show]

    # create a favorite, maybe make this more restful
    post '/favorites/:skatepark_id/:user_id' => 'favorites#create'

    get '/users/:id/favorites/' => 'users#favorites'
  end
  
end