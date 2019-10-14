class HomeController < ApplicationController

  def home
    if User.last(3).nil?
    else
     @newuser = User.last(3)
   end
  end

end
