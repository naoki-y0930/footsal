class UsersController < ApplicationController

  def index
     @users = User.all.reverse_order
  end

  def show
     @user = User.find(params[:id])
     @team = TeamDetail.find_by(user_id: @user.id)
  end

  def edit
     @user = User.find(params[:id])
     # edit画面に入ると消える.でもこれがないと入力できない
     # @user.build_team_detail
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
