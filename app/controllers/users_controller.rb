class UsersController < ApplicationController
  before_action :authenticate!, only: [:show, :edit, :update]

  def search
    # 検索する値が「""」と等しい場合はfalseで処理は実行されない（検索を選択していないとblankが返ってくる）
    # 値が「""」以外であればtrueとなる（処理実行）。
    @search = TeamDetail.all
    if params[:team_level] != ""
      @search = @search.where(team_level: params[:team_level])
    end
    if params[:active_area] != ""
      @search = @search.where(active_area: params[:active_area])
    end
    if params[:active_time] != ""
      @search = @search.where(active_time: params[:active_time])
    end
    if params[:male] != ""
      @search = @search.where(male: params[:male])
    end
    if params[:female] != ""
      @search = @search.where(female: params[:female])
    end
    if params[:experience] != ""
      @search = @search.where(experience: params[:experience])
    end
    if params[:beginner] != ""
      @search = @search.where(beginner: params[:beginner])
    end
  end

  def seek
    @seek = User.find(params[:seek])
  end

  def index
     @users = User.page(params[:page]).per(5).reverse_order
  end

  def show
     @user = User.find(params[:id])
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

  def edit
     @user = User.find(params[:id])
      if @user == current_user
     else
      redirect_to users_path
     end
  end

  def update
     @user = User.find(params[:id])
   if @user.update(user_params)
      redirect_to user_path(@user.id)
     else
      flash.now[:alert] = "正しく記入してください。"
      render :edit
    end
  end

  def destroy
     User.find(params[:id]).destroy
    if user_signed_in?
      flash[:unsubscribe] = "ご利用ありがとうございました！"
     redirect_to home_path
    else
     redirect_to home_path
    end
  end

   private
  def user_params
    params.require(:user).permit(:name, :captain_name, :team_name, :tell, :password, :image,
    team_detail_attributes:[:id, :experience, :beginner, :male, :female, :introduction, :team_level, :active_area, :active_time])
  end
 end
