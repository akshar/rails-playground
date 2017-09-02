Rails.application.routes.draw do

  resources :tasks , except: [:index]


  get '/contact' => "pages#about"
  get '/about' => "pages#about"
  get '/error' => "pages#error"
  root to: "pages#home"

  resources :projects do
    resources :tasks , except: [:index] , controller: "projects/tasks"
  end

  get "/blog" => redirect("http://google.com")
  get "*path"  => redirect("/error")
end
