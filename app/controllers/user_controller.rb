class UserController < ApplicationController

  # 新規登録画面表示時
  def sign_up
    @user = User.new
  end

  # 新規登録時
  def sign_up_action
    @name = params[:name]
    @email = params[:email]
    @password_1 = params[:password_1]
    @password_2 = params[:password_2]
    if @password_1 != @password_2
      @error_message = "同じパスワードを入力してください"
      render("user/sign_up")
      return
    end
    if User.find_by(email: @email)
      @error_message = "このメールアドレスは登録されています"
      render("user/sign_up")
      return
    end
    @user = User.new(name: @name, email: @email, password: @password_1)
    if @user.save
      flash[:flash] = "登録完了しました"
      session[:user_id] = @user.id
      redirect_to("/")
    else
      @error_message = "正しく入力してください"
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
      @error_message = "メールアドレス・パスワードが正しくありません"
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
