class PostsController < ApplicationController
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
    Post.create(post_parameter)
    redirect_to posts_path
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
    if @post.update(post_parameter)
      redirect_to posts_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private

  def post_parameter
    params.require(:post).permit(:title, :content, :start_time)
  end
end
