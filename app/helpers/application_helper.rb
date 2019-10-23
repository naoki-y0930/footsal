module ApplicationHelper

  def new_message_badge
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
     content_tag(:span, @unreads, class: 'unread-num')
  end

end
