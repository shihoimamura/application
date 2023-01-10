class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy] # destroyアクションを追加

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      
      redirect_to posts_path, notice: "投稿しました！"
    else

      render :new
    end
  end

  def show
    
  end

  def edit
    @post = Post.find(params[:id])
   
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"削除しました！"
  end

  def confirm
    @post = Post.new(post_params)
  end
  
  private

  def post_params
    params.require(:post).permit(:image, :content, :image_cache)
    # params.require(:feed).permit(:image, :image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
