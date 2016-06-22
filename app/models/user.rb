class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :username, :email, presence: true
  validates :password, presence: true, length: { minimum: 6}

  has_many :questions
  has_many :answers

  has_secure_password
end
