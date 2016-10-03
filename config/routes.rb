# == Route Map
#
#                   Prefix Verb   URI Pattern                                       Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                          devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                          devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                         devise/sessions#destroy
#            user_password POST   /users/password(.:format)                         devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                     devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                    devise/passwords#edit
#                          PATCH  /users/password(.:format)                         devise/passwords#update
#                          PUT    /users/password(.:format)                         devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                           registrations#cancel
#        user_registration POST   /users(.:format)                                  registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                          registrations#new
#   edit_user_registration GET    /users/edit(.:format)                             registrations#edit
#                          PATCH  /users(.:format)                                  registrations#update
#                          PUT    /users(.:format)                                  registrations#update
#                          DELETE /users(.:format)                                  registrations#destroy
#                     root GET    /                                                 posts#index
#                    users GET    /users(.:format)                                  users#index
#                          POST   /users(.:format)                                  users#create
#                 new_user GET    /users/new(.:format)                              users#new
#                edit_user GET    /users/:id/edit(.:format)                         users#edit
#                     user GET    /users/:id(.:format)                              users#show
#                          PATCH  /users/:id(.:format)                              users#update
#                          PUT    /users/:id(.:format)                              users#update
#                          DELETE /users/:id(.:format)                              users#destroy
#            post_comments GET    /posts/:post_id/comments(.:format)                comments#index
#                          POST   /posts/:post_id/comments(.:format)                comments#create
#         new_post_comment GET    /posts/:post_id/comments/new(.:format)            comments#new
#        edit_post_comment GET    /posts/:post_id/comments/:id/edit(.:format)       comments#edit
#             post_comment GET    /posts/:post_id/comments/:id(.:format)            comments#show
#                          PATCH  /posts/:post_id/comments/:id(.:format)            comments#update
#                          PUT    /posts/:post_id/comments/:id(.:format)            comments#update
#                          DELETE /posts/:post_id/comments/:id(.:format)            comments#destroy
#                    posts GET    /posts(.:format)                                  posts#index
#                          POST   /posts(.:format)                                  posts#create
#                 new_post GET    /posts/new(.:format)                              posts#new
#                edit_post GET    /posts/:id/edit(.:format)                         posts#edit
#                     post GET    /posts/:id(.:format)                              posts#show
#                          PATCH  /posts/:id(.:format)                              posts#update
#                          PUT    /posts/:id(.:format)                              posts#update
#                          DELETE /posts/:id(.:format)                              posts#destroy
#         comment_comments GET    /comments/:comment_id/comments(.:format)          comments#index
#                          POST   /comments/:comment_id/comments(.:format)          comments#create
#      new_comment_comment GET    /comments/:comment_id/comments/new(.:format)      comments#new
#     edit_comment_comment GET    /comments/:comment_id/comments/:id/edit(.:format) comments#edit
#          comment_comment GET    /comments/:comment_id/comments/:id(.:format)      comments#show
#                          PATCH  /comments/:comment_id/comments/:id(.:format)      comments#update
#                          PUT    /comments/:comment_id/comments/:id(.:format)      comments#update
#                          DELETE /comments/:comment_id/comments/:id(.:format)      comments#destroy
#                 comments GET    /comments(.:format)                               comments#index
#                          POST   /comments(.:format)                               comments#create
#              new_comment GET    /comments/new(.:format)                           comments#new
#             edit_comment GET    /comments/:id/edit(.:format)                      comments#edit
#                  comment GET    /comments/:id(.:format)                           comments#show
#                          PATCH  /comments/:id(.:format)                           comments#update
#                          PUT    /comments/:id(.:format)                           comments#update
#                          DELETE /comments/:id(.:format)                           comments#destroy
#

Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'posts#index'

  resources :users

  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
end
