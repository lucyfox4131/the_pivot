class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  validates :password, presence: true
  validates :role, presence: true

  has_many :donations
  has_many :donation_items, through: :donations

  enum role: ['default', 'admin']
end
