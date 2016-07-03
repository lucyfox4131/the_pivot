class Charity < ActiveRecord::Base
  validates :name, presence: true
  validates :status, presence: true
  validates :description, presence: true

  before_create :create_slug
  has_many :families
  has_many :user_roles
  has_many :users, through: :user_roles
  has_many :roles, through: :user_roles

  enum status: %w(pending online offline)

  def create_slug
    self.slug = self.name.parameterize
  end

  def self.pending_charities
    where(status: 0)
  end

  def self.online_charities
    where(status: 1)
  end

  def self.offline_charities
    where(status: 2)
  end
end
