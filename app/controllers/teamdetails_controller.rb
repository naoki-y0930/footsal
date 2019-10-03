class TeamdetailsController < ApplicationController



  def new
    @team = TeamDetail.new
  end

  def create
    @team = TeamDetail.new(team_params)
    @team.user_id = current_user.id
    if @team.save
      flash[:entry] = "ようこそ、フッサルへ！！"
      redirect_to home_path
    else
      flash[:teamerror] = "エラーが発生しました。もう一度お願いします。"
      render :new
    end
  end

  private

  def team_params
    params.require(:team_detail).permit(:experience, :beginner, :male, :female, :introduction, :team_level, :active_area, :active_time, :user_id)

  end

end
