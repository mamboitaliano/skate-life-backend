Rails.application.routes.draw do

  scope 'api' do
    resources :skateparks, only: [:index, :show]
    resources :users, except: [:update, :edit, :show]

    post 'favorites/:park_id/:user_id' => 'favorites#create'
  end
  
end
