class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @currentEntries = current_user.entries
    myRoomIds = []

    @currentEntries.each do |entry|
     myRoomIds << entry.room.id
    end
    @anotherEntries = Entry.where(room_id: myRoomIds).where( 'user_id != ?', current_user.id)

    unreads = []
    @anotherEntries.each do |ae|
     ae.user.messages.each do |message|
      if message.read_flg == 1
         unreads << message.read_flg
      end
    end
  end
       @unreads = 0
       @unreads += unreads.sum

    render :index, layout: false
   end

   def create
     @room = Room.create
     @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
     @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))
     redirect_to "/rooms/#{@room.id}"
   end

   def show
     @room = Room.find(params[:id])
     if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
     @messages.each do |message|
      if message.read_flg == 1 && message.user_id != current_user.id
          message.read_flg = 0
          message.save
      end
     end
      @message = Message.new
      @entries = @room.entries
      @otherentry = @entries.find_by( 'user_id != ?', current_user.id)
    else
      redirect_back(fallback_location: users_path)
   end
  render :show, layout: false
 end

end
