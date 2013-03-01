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
  match "/blocks/daybefore"         =>"blocks#daybefore"
  match "/blocks/fivedaysbefore"    =>"blocks#fivedaysbefore"
  match "/blocks/tendaysbefore"     =>"blocks#tendaysbefore"
  resources :blocks
  
  #fouls
  match "/fouls/daybefore"          =>"fouls#daybefore"
  match "/fouls/fivedaysbefore"     =>"fouls#fivedaysbefore"
  match "/fouls/tendaysbefore"      =>"fouls#tendaysbefore"
  resources :fouls
  
  #rebounds
  match "/rebounds/daybefore"       =>"rebounds#daybefore"
  match "/rebounds/fivedaysbefore"  =>"rebounds#fivedaysbefore"
  match "/rebounds/tendaysbefore"   =>"rebounds#tendaysbefore"
  resources :rebounds
  
  #steals
  match "/steals/daybefore"         =>"steals#daybefore"
  match "/steals/fivedaysbefore"    =>"steals#fivedaysbefore"
  match "/steals/tendaysbefore"     =>"steals#tendaysbefore"
  resources :steals
  
  #turnovers
  match "/turnovers/daybefore"      =>"turnovers#daybefore"
  match "/turnovers/fivedaysbefore" =>"turnovers#fivedaysbefore"
  match "/turnovers/tendaysbefore"  =>"turnovers#tendaysbefore"
  resources :turnovers
  
  #turnovers
  match "/scores/daybefore"         =>"scores#daybefore"
  match "/scores/fivedaysbefore"    =>"scores#fivedaysbefore"
  match "/scores/tendaysbefore"     =>"scores#tendaysbefore"
  resources :scores
  
end
