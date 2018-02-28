Rails.application.routes.draw do

  # ホーム
  get "/home/about" => "home#about"

  # ユーザー
  get "/user/sign_up" => "user#sign_up"
  post "/user/sign_up_action" => "user#sign_up_action"
  get "/user/sign_in" => "user#sign_in"
  post "/user/sign_in_action" => "user#sign_in_action"
  post "/user/sign_out_action" => "user#sign_out_action"
  get "/user/:id" => "user#show"

  # プロジェクト
  get "/" => "project#index"
  get "/project/new" => "project#new"
  post "/project/new_action" => "project#new_action"

end
