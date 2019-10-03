class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    # home_after_login_path
    #ログイン時
    flash[:entry] = "ようこそ、フッサルへ！！"
    home_path
  end



  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :captain_name, :team_name, :tell])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:tell])
  end

  end
