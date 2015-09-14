class Todo < ActiveRecord::Base
	validates :title, presence: true
	validates :is_completed, inclusion: { in: [true, false] }
end
