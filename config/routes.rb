Forms::Plugin::Routes.draw do  
  namespace :admin, :module => :forms, :as => :forms do
    resources :forms do
      resources :submissions
    end
  end
end
