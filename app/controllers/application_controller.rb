class ApplicationController < ActionController::Base

  before_action :setup_current_user

  # 現在のユーザーを設定
  def setup_current_user
    if session[:user_id] != nil
      @current_user = User.find(session[:user_id])
    end
  end

end
