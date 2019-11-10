class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?

   @session_time = 24.hours
   auto_session_timeout @session_time
  def session_time
    @session_time = 24.hours
  end

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

    def after_sign_out_path_for(resource)
       flash[:logout] = "ログアウトしました"
       root_path
    end


  def new_message_badge
    if user_signed_in?
    @currentEntries = current_user.entries
    myRoomIds = []

    @currentEntries.each do |entry|
     myRoomIds << entry.room.id
    end
    @anotherEntries = Entry.where(room_id: myRoomIds).where( 'user_id != ?', current_user.id)
    # 総未読数取得
    unreads = []
    @room_messages = Message.where(room_id: myRoomIds)
    @room_messages.each do |message|
      if message.read_flg == 1 && message.user_id != current_user.id
         unreads << message.read_flg
       end
      end
     @unreads = 0
     @unreads += unreads.sum
   else
   end
  end




    def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :captain_name, :team_name, :tell])
     devise_parameter_sanitizer.permit(:sign_in, keys: [:tell])
    end

  end
