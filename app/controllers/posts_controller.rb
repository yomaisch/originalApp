class PostsController < ApplicationController
  PER = 8

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def search
    @posts = Post.search(params[:search])
    @posts = @posts.all.order(created_at: :desc).page(params[:page]).per(PER)
  end

  def new
  	@user = User.find_by(id: params[:id])
  	@post = Post.new
  end

  def create
  	@user = User.find_by(id: params[:id])
  	@post = Post.new(content: params[:content],
  					url: params[:url],
  					user_id: @current_user.id)
  	if @post.save
  		flash[:notice] = "アピールを投稿しました"
  		redirect_to("/users/#{@user.id}/index")
  	else
  		render("posts/#{@user.id}/new")
  	end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy

    flash[:notice] = "投稿が削除されました"
    redirect_to("/users/#{@current_user.id}/index")
  end

end
