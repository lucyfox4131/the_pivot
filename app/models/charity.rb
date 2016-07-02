class Charity < ActiveRecord::Base
  validates :name, presence: true
  validates :status, presence: true
  validates :description, presence: true

  before_create :create_slug
  has_many :families
  has_many :user_roles
  has_many :users, through: :user_roles
  has_many :roles, through: :user_roles

  def create_slug
    self.slug = self.name.parameterize
  end
end
