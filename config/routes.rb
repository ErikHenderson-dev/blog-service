Rails.application.routes.draw do
  scope ENV['BASE_HREF'] do
    resources :articles, only: %i[index show create destroy]
    resources :comments, only: %i[index show create destroy]
    resources :categories, only: %i[index show create destroy]
  end
end
