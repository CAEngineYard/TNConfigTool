
TNConfigTool::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
   resources :saml

   post 'saml/consume'

  get "history/view" => "history#view"
  
  
end
