Rails.application.routes.draw do

  # Housekeeping / General
  get '/' => 'application#index'

  # Sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # User
  get '/signup' => 'user#new'
  post '/user' => 'user#create'
  get '/user/:id/suggestions' => 'user#suggest'

  # Rating
  get '/rate' => 'user#rate_new'
  post '/rate' => 'user#add_item'

end
