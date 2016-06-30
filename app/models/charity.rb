class Charity < ActiveRecord::Base
  validates :name, presence: true
  validates :status, presence: true
  validates :description, presence: true

  before_create :create_slug
  has_many :families

  def create_slug
    self.slug = self.name.parameterize
  end
end
