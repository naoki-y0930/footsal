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
    @anotherEntries.each do |ae|
     ae.user.messages.each do |message|
      if message.read_flg == 1
         unreads << message.read_flg
      end
     end
   end
     @unreads = 0
     @unreads += unreads.sum
     content_tag(:span, @unreads, class: 'unread-num')
  end

end
