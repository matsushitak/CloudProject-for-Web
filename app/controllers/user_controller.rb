class UserController < ApplicationController

  # 新規登録画面表示時
  def sign_up
    @user = User.new
  end

  # 新規登録時
  def sign_up_action
    @name = params[:name]
    @email = params[:email]
    @password = params[:password]
    @user = User.new(name: @name, email: @email, password: @password)
    if @user.save
      flash[:flash] = "登録完了しました"
      session[:user_id] = @user.id
      redirect_to("/")
    else
      @error_message = "不正です"
      render("user/sign_up")
    end
  end

  # ログイン画面表示時
  def sign_in
    @user = User.new
  end

  # ログイン時
  def sign_in_action
    @email = params[:email]
    @password = params[:password]
    @user = User.find_by(email: @email)
    if @user && @user.authenticate(@password)
      flash[:flash] = "ログインしました"
      session[:user_id] = @user.id
      redirect_to("/")
    else
      @error_message = "不正です"
      render("user/sign_in")
    end
  end

  # ログアウト時
  def sign_out_action
    flash[:notice] = "ログアウトしました"
    session[:user_id] = nil
    redirect_to("/")
  end

  # ユーザー詳細画面表示時
  def show
    @user = User.find(params[:id])
  end

end
