Todolist::Application.routes.draw do
  
 root :to => 'users#login'
  resources :lists do
   resources :sublists do
     member do
       put 'update_status'
      end 
   end
  end  
end
