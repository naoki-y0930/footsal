class PostsController < ApplicationController

  def index
     @posts = Post.all.reverse_order
     @plan = Post.where(conditions: "予定を合わせて対戦")
     @now = Post.where(conditions: "いますぐ試合したい")
     @pleasant = Post.where(conditions: "わいわい試合したい")
     @serious = Post.where(conditions: "真剣勝負!")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render action: :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :conditions)
  end
end
