class Todo < ActiveRecord::Base
	validates :title, :is_completed, presence: true
end
