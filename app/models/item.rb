class Item < ActiveRecord::Base
	belongs_to :user

	scope :incomplete, -> { where(complete: false) }
	scope :complete, -> { where(complete: true) }
	# scope :for_user, -> (user) { where(user_id: user.id)}
	# Item.for_user(current_user).complete
	default_scope { order('updated_at DESC') }

	def days_left
		(DateTime.now.to_date - created_at.to_date).to_i
	end
end
