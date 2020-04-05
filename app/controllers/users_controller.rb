# frozen_string_literal: true

class UsersController < ApplicationController
  PER = 8

  def index
    @user_posts = Post.all.order(created_at: :desc).page(params[:page]).per(PER)
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def confirm
    @user = User.new(user_params)
    render('users/new') if @user.invalid?
  end

  def create
    @user = User.new(user_params)
    if params[:back]
      render('users/new')
    elsif @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'ユーザー登録が完了しました'
      redirect_to("/users/#{@user.id}/index")
    else
      render('users/new')
    end
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = 'ログインしました'
      redirect_to("/users/#{@user.id}/index")
    else
      @error_message = 'メールアドレスまたはパスワードが間違っています'
      @email = params[:email]
      @password = params[:password]
      render('users/login_form')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'ログアウトしました'
    redirect_to('/login')
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy

    flash[:notice] = '退会が完了しました。'
    redirect_to('/')
  end

  def user_params
    params.require(:user).permit(:last_name,
                                 :first_name,
                                 :last_name_kana,
                                 :first_name_kana,
                                 :email,
                                 :password,
                                 :image_name)
  end
end
