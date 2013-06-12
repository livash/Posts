SocialNetwork::Application.routes.draw do
  resources :users, :friend_circles, :friend_circle_memberships
  resource :session, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :show, :destroy]

end
