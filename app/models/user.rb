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
  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :charities, through: :user_roles

  attr_accessor :current_password

  def password_correct?
    if !password.blank?
      user = User.find_by_id(id)
      if !user.authenticate(current_password)
        errors.add(:current_password, "is incorrect.")
      end
    end
  end

  def charity
    charities.first unless !charities
  end

  def platform_admin?
    roles.exists?(name: "platform_admin")
  end

  def charity_admin?
    roles.exists?(name: "charity_admin") || roles.exists?(name: "primary_charity_admin")
  end

  def primary_charity_admin?
    roles.exists?(name: "primary_charity_admin")
  end

  def admin?
    platform_admin? || charity_admin? || primary_charity_admin?
  end

  def other_user?
    !charity_admin? && !platform_admin? && !primary_charity_admin?
  end

  def remove_admin_status
    demote_user
    charities.clear
  end

  def demote_user
    if admin?
      roles.delete(name: "charity_admin") || roles.delete(name: "primary_charity_admin")
    end
  end

  def any_charity_admin?
    primary_charity_admin? || charity_admin?
  end

  def self.all_admins
    User.all.map do |user|
      user if user.any_charity_admin?
    end.compact
  end

  def charity_admins(current_user_charity)
    User.all.map do |user|
      if !user.charities.empty? && user.charities.first == current_user_charity
        if !user.roles.empty? && user.roles.first.name == "charity_admin"
          user
        end
      end
    end.compact
  end
end
