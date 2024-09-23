Rails.application.routes.draw do
  scope '/api' do
    resources :articles, only: %i[index show create update destroy]
    resources :comments, only: %i[index show create update destroy]
    resources :categories, only: %i[index show create update destroy]
  end
end
