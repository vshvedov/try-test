Rails.application.routes.draw do
  api vendor_string: 'thecompany', default_version: 1 do
    version 1 do
      get :users, to: 'users#index'

      resources :posts, except: [:new] do
        get :comments
        post :add_comment, to: 'comments#create'
      end

      resources :comments, except: [:new, :create]
    end
  end

  root 'welcome#index'
end
