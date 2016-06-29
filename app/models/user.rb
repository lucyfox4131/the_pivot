class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :role, presence: true
  validate :password_correct?, on: :update
  validates :cell, format: { with: /\d{10}/, message: "was not in correct format of 1112223333" }, :allow_blank => true

  has_many :donations
  has_many :donation_items, through: :donations

  enum role: ["default", "admin"]
#[default, business_admin, platform_admin]
  attr_accessor :current_password

  def password_correct?
    if !password.blank?
      user = User.find_by_id(id)
      if !user.authenticate(current_password)
        errors.add(:current_password, "is incorrect.")
      end
    end
  end
end
