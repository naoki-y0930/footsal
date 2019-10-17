class HomeController < ApplicationController


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
