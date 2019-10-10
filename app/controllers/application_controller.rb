class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate!
    if admin_signed_in?
      authenticate_admin!
    else
      authenticate_user!
    end
  end

  def after_sign_in_path_for(resource)
    #ログイン時
    case resource
    when User
    flash[:entry] = "ようこそ、フッサルへ！！"
    home_path
  when Admin
    admins_path
  end
 end

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :captain_name, :team_name, :tell])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:tell])
  end

  end
