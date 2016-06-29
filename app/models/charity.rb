class Charity < ActiveRecord::Base
  before_create :create_slug
  has_many :families
  
  def create_slug
    self.slug = self.name.parameterize
  end
end
