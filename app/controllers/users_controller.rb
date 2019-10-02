class UsersController < ApplicationController

  def index
    @users = User.all.reverse_order
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to action: 'index'
  end

  private
  def user_params
    params.require(:user).permit(:name, :captain_name, :team_name, :tell, :password, :image)
  end
end
