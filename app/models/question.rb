class Question < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, :body, presence: true

  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
