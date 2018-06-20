Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'board#index'
    get '/boards' => 'board#index'
    get '/board/new' => 'board#new'
    get '/board/:id' => 'board#show'
    post '/boards' => 'board#create'
    get '/board/:id/edit' => 'board#edit'
    put '/board/:id' => 'board#update'
    patch '/board/:id' => 'board#update'
    delete '/board/:id' => 'board#destroy'
    
    get '/users' => 'user#index'
    get '/sign_up' => 'user#new'
    get '/sign_in' => 'user#sign_in'
    get '/logout' => 'user#logout'
    post '/sign_in' => 'user#login'
    get '/user/:id' => 'user#show'
    post '/users' => 'user#create'
    get '/user/:id/edit' => 'user#edit'
    patch '/user/:id' => 'user#update'
    put '/user/:id' => 'user#update'
    
    
  
end
