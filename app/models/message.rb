class Message < ActiveRecord::Base
  belongs_to :sender, class_name: "User", foreign_key: 'sender_id'
  belongs_to :receiver, class_name: "User",foreign_key: 'reciever_id'

  def mark_as_viewed
    self.update(viewed: true)
  end
end
