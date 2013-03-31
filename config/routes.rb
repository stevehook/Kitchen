Kitchen::Application.routes.draw do
  devise_for :users

  resources :recipes do
    collection do
      get 'search'
      get 'lookup'
    end
    resources :recipe_photos, :except => [:index, :show]
  end

  resources :blog_posts, :path => 'blog' do
    resources :blog_post_photos, :except => [:index, :show]
  end

  resources :classes
  resources :subscriptions, :only => [:create, :show, :destroy]

  resources :feedbacks, :only => [:new, :create] do
  end

  root :to => 'home#index'
end
