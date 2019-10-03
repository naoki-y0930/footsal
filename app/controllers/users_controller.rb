class UsersController < ApplicationController

  def search
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
    # binding.pry
     # @search = TeamDetail.search(params[:team_level])
     # @search = TeamDetail.search(params[:active_area])
     # @search = TeamDetail.search(params[:active_time])
  end

  def index
     @users = User.all.reverse_order
  end

  def show
     @user = User.find(params[:id])
     @team = TeamDetail.find_by(user_id: @user.id)
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
