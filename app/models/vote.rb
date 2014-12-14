class Vote < ActiveRecord::Base
	belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
	belongs_to :votable, polymorphic: true

	validates_uniqueness_of :creator, scope: [:votable_type, :votable_id]
end