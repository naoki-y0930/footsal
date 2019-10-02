class UsersController < ApplicationController

  def index
    @users = User.all.reverse_order
  end

  def show

  end

  def edit

  end

  def update

  end

  private
  def user_params

  end
end
