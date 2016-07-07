class Category < ActiveRecord::Base
  validates :name, presence: true
  validates :slug, presence: true

  has_many :category_families
  has_many :families, through: :category_families

  def to_param
    slug
  end

  def find_families
    if name == "Loan"
      Loan.active.families
    else
      self.families.active
    end
  end
end
