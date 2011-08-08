Forms::Plugin.routes.draw do
  extend Wheelhouse::RouteExtensions
  
  resources :forms do
    resources :submissions
  end
end
