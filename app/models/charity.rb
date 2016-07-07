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

  def pending
    status == "pending"
  end

  def online
    status == "online"
  end

  def offline
    status == "offline"
  end

  def self.create_new_charity(params, current_user)
    charity = Charity.new(name: params[:charity][:name],
                          description: params[:charity][:description],
                          status: 0)
    role = Role.find_by(name: "primary_charity_admin")
    UserRole.create(user: current_user, role: role, charity: charity)
    return charity
  end
end
