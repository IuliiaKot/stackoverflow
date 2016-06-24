class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :votable, polymorphic: true
  validates_uniqueness_of :user_id, scope: [:votable_id , :votable_type]
end
