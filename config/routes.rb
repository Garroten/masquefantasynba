Nbaweb::Application.routes.draw do  

  resources :players


  #get "home/index"
  #default route
  root :to => "home#index"
  
  #assists
  match "/assists/daybefore"        =>"assists#daybefore"
  match "/assists/fivedaysbefore"   =>"assists#fivedaysbefore"
  match "/assists/tendaysbefore"    =>"assists#tendaysbefore"
  resources :assists

  #blocks
  match "/blocks/daybefore"   =>"blocks#daybefore"
  resources :blocks
end
