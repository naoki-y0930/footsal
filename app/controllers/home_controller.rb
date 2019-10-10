class HomeController < ApplicationController

  def home
    @newuser = User.last(3)
  end

end
