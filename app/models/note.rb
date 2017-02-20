class Note < ApplicationRecord
	belongs_to :user

	def start_time
  	created_at.to_datetime
	end
end

