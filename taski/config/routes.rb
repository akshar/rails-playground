Rails.application.routes.draw do
  get '/contact' => "pages#about"
  get '/about' => "pages#about"
  get '/error' => "pages#error"
  root to: "pages#home"
  resources :projects
  get "/blog" => redirect("http://google.com")
  get "*path"  => redirect("/error")
end
