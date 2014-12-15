class Item < ActiveRecord::Base
	belongs_to :user

	scope :incomplete, -> { where(complete: false) }
	scope :complete, -> { where(complete: true) }
	# scope :for_user, -> (user) { where(user_id: user.id)}
	# Item.for_user(current_user).complete
	default_scope { order('updated_at DESC') }
end
