Rails.application.routes.draw do
  get 'books/index'

  resources :books, only:[:index, :show]
end
