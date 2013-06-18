
TNConfigTool::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
   resources :saml
   resources :history

   root :to => 'history#show'
  post 'saml/consume'

  get "history/show" => "history#show"
  
  
end
