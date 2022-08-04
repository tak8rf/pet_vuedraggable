class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(5)
    @calendars = Post.all
  end
  
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post=Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "作成しました"
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice:"削除しました"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  def search
    @posts = Post.search(params[:keyword]).page(params[:page]).per(5)
    @keyword = params[:keyword]
    @calendars = Post.all
    render "index"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :start_time)
  end
end
