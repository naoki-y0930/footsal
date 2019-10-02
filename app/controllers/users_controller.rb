class UsersController < ApplicationController

  def index
    @users = User.all.reverse_order
  end

  def show
    @user = User.find(params[:id])
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
    params.require(:user).permit(:name, :captain_name, :team_name, :tell, :password, :image)
  end
end
