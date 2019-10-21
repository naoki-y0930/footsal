class HomeController < ApplicationController
before_action :new_message_badge, if: :user_signed_in?

  def home
    if User.last(3).nil?
    else
     @newuser = User.last(3)
   end
  end

    def caution
    end

    def privacy
    end

    def terms
    end

    def timeout
    end
 end
