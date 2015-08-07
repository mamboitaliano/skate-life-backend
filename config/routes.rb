Rails.application.routes.draw do

  scope 'api' do
    resources :skateparks
    resources :users, except: [:update]
  end
  
end
