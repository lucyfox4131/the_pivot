class Role < ActiveRecord::Base
  validates :username, presence: true
  validates :password_digest, presence: true
  validates :cell, presence: true
  validates :email, presence: true

  has_many :user_roles
  has_many :users, through: :user_roles
end
