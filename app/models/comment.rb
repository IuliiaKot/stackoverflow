class Comment < ActiveRecord::Base
  # Remember to create a migration!
  validates :body, presence: true

  belong_to :commentable, polymorphic: true
end
