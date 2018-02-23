class UserController < ApplicationController

  # 新規登録画面表示時
  def sign_up
    @user = User.new
  end

  # 新規登録時
  def sign_up_action
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      flash[:flash] = "ログインしました"
      section[:user_id] = @user.id
      redirect_to("/project/index")
    else
      render(user/sign_up)
    end
  end

  # ログイン画面表示時
  def sign_in
    @user = User.new
  end

  # ログイン時
  def sign_in_action
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      flash[:flash] = "ログインしました"
      section[:user_id] = @user.id
      redirect_to("/project/index")
    else
      render(user/sign_in)
    end
  end

  # ログアウト時
  def sign_out_action
    flash[:notice] = "ログアウトしました"
    section[:user_id] = nil
  end

  # ユーザー詳細画面表示時
  def show
    @user = User.find(params[:id])
  end

end
