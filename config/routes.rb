Todolist::Application.routes.draw do
  
 root :to => 'users#login'
  resources :lists do
   resources :sublists 
  end  
end
