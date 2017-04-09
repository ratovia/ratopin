Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "receiver#home"
  get '/admin' => "receiver#admin"

  get '/ipad' => "receiver#ipad"
  get '/myhouse' => "receiver#myhouse"
  get '/train' => "receiver#train"
  get '/eat' => "receiver#eat"

end
