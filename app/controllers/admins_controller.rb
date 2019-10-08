class AdminsController < ApplicationController

  def seek
    @seek = User.search(params[:seek])
  end

  def index

  end

  def people
     @users = User.all
  end

  def person
     @user = User.find(params[:id])
     @team = TeamDetail.find_by(user_id: @user.id)
  end

  def person_edit
     @user = User.find(params[:id])
     @team = TeamDetail.find_by(user_id: @user.id)
  end

  def update
     @user = User.find(params[:id])
   if @user.update(user_params)
      redirect_to person_path(@user)
     else
      flash.now[:alert] = "正しく記入してください。"
      render :person_edit
    end
  end

  private
 def user_params
   params.require(:user).permit(:name, :captain_name, :team_name, :tell, :password, :image,
   team_detail_attributes:[:id, :experience, :beginner, :male, :female, :introduction, :team_level, :active_area, :active_time])
 end

end
