Rails.application.routes.draw do
  scope ENV['BASE_HREF'] do
    # root to: 'home#index'

    resources :articles, only: %i[index]
    resources :comments, only: %i[index]
    resources :categories, only: %i[index]
  end
end
