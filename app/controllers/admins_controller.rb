class AdminsController < ApplicationController

  def index

  end

  def people
     @users = User.all
  end

  def person
     @user = User.find(params[:id])
     @team = TeamDetail.find_by(user_id: @user.id)
  end

end
