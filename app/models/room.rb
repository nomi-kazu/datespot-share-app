class Room < ApplicationRecord
  has_many :messages,      dependent: :destroy
  has_many :entries,       dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :users, through: :entries

  def create_notification_message!(current_user, message_id, visited_id)
    @roommember = Entry.where(room_id: @room.id).where.not(user_id: current_user.id)
    @theid = @roommember.find_by(room_id: @room.id)

    notification = current_user.active_notifications.new(
      room_id: @room.id,
      message_id: @message.id,
      visited_id: @theid.user_id,
      visitor_id: current_user.id,
      action: 'dm'
    )
    notification.checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end

end
