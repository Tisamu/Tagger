Rails.application.routes.draw do
  root to: "post#new"

  devise_for :users, controllers: {registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post "post/create", to: "post#create"
  delete "post/delete", to: "post#delete"
  get "user/posts/:username", to: "post#show", as:"user_posts"
  get "tag/:tag", to: "tag#show", as: "tag_show"

end
