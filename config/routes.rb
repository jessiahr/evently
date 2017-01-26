Rails.application.routes.draw do
  resources :organizations do
    resources :events
  end
  get 'events' => 'events#index'
end
