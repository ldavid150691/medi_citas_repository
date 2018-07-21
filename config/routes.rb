Rails.application.routes.draw do
  resources :cities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "customer_users" => "customer_users#call" #Alias de naveacion de pagina web(controlador/accion (Metodo))
  post "customer_users/managePost"# Peticiones POST submit matricular controlador/accion
end
