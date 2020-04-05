# frozen_string_literal: true

class ProfileController < ApplicationController
  protect_from_forgery except: :regist

  def show
    @user = User.find_by(id: params[:id])
  end

  def regist_form
    @user = User.find_by(id: params[:id])
  end

  def regist
    @user = User.find_by(id: params[:id])
    @user.nickname = params[:nickname]
    @user.introduction = params[:introduction]

    if params[:image_name]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image_name]
      File.binwrite("public/user_icon_images/#{@user.image_name}", image.read)
    end
    if @user.save
      flash[:notice] = 'プロフィールを登録しました'
      redirect_to("/users/#{@user.id}/index")
    else
      render('profile/regist_form')
    end
  end

  def confirm
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if params[:image_name]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image_name]
      File.binwrite("public/user_icon_images/#{@user.image_name}", image.read)
      if @user.update(nickname: params[:nickname], introduction: params[:introduction], image_name: @user.image_name)
        flash[:notice] = 'プロフィールの編集が完了しました'
        redirect_to("/users/#{@user.id}/index")
      else
        render('profile/edit')
      end
    elsif @user.update(nickname: params[:nickname], introduction: params[:introduction])
      flash[:notice] = 'プロフィールの編集が完了しました'
      redirect_to("/users/#{@user.id}/index")
    else
      render('profile/edit')
    end
  end
end
