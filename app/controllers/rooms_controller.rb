class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
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
    render :index, layout: false
   end

   def create
     # @entry2.userが、もし自分が入っているroomの相手ユーザーと同じなら
     # （@entry2.user_idが@anotherEntriesに存在していたら）
     # 作成したroom,@entry1,@entry2を削除する
     @currentEntries = current_user.entries
     myRoomIds = []

     @currentEntries.each do |entry|
       myRoomIds << entry.room.id
     end
     @anotherEntries = Entry.where(room_id: myRoomIds).where( 'user_id != ?', current_user.id)

     @room = Room.create
     @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
     @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id))

     if @anotherEntries.exists?(user_id: @entry2.user_id)
          @room.destroy
          @entry1.destroy
          @entry2.destroy
          redirect_to "/rooms/" and return
        else
          redirect_to "/rooms/#{@room.id}" and return
      end
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
