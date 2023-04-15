Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  scope "/:locale" do
    resources :books, :except => :show
    resources :content_tutorials, path: "tutorials", except: :index
    resources :content_articles, path: "articles", except: :index
    resources :content_recipes, path: "recipes", except: :index
  end

  # Defines the root path route ("/")
  root "contents#index"

  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end

end
