class Message < ApplicationRecord

  validates_presence_of :user_id, :body, :group_id

  belongs_to :user
  belongs_to :group

end
