class PostsController < ApplicationController
  before_action :authenticate!, only: [:new, :show, :edit, :update]
  before_action :new_message_badge, if: :user_signed_in?

  def index
     @teamdetails = TeamDetail.all
     @posts = Post.all.reverse_order
     @plan = Post.where(conditions: "予定を合わせて対戦")
     @now = Post.where(conditions: "いますぐ試合したい")
     @pleasant = Post.where(conditions: "わいわい試合したい")
     @serious = Post.where(conditions: "真剣勝負!")
     render :index, layout: false
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if admin_signed_in?
      flash[:posterror] = 'ログインユーザーのみ投稿できます'
      render :new
    else
      @post.user_id = current_user.id
    if  @post.save
      redirect_to posts_path
    else
      render action: :new
    end
   end
  end

  def show
    if admin_signed_in?
      @post = Post.find(params[:id])
      @user = @post.user
      @team = TeamDetail.find_by(user_id: @user.id)
    else
    @post = Post.find(params[:id])
    @user = @post.user
    @team = TeamDetail.find_by(user_id: @user.id)
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
     unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
       end
       if @isRoom
       else
         @room = Room.new
         @entry = Entry.new
       end
     end
   end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:destroypostmessage] = '削除しました'
      redirect_to posts_path
    else
      render :show
  end
end

  private
  def post_params
    params.require(:post).permit(:title, :body, :conditions)
  end
end
