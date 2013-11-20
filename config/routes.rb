InviteMe::Engine.routes.draw do

  resources :requests, only: [:index, :create] do
    put :invite
  end

  root to: 'requests#new'
end
