Todolist::Application.routes.draw do
  devise_for :users
  # root :to => 'users#login'
   resources :lists do
     resources :sublists do
       member do
         put 'update_status'
       end 
     end
     member do
       get 'sublists_is_completed'
       get 'sublists_isnot_completed'
    end   
   end 
end
