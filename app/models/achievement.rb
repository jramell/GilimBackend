class Achievement < ActiveRecord::Base
  belongs_to :event
  validates :event_id, presence: true
end
