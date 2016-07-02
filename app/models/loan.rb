class Loan < ActiveRecord::Base
  validates :purpose, presence: true
  validates :requested_amount, presence: true
  validates :description, presence: true

  scope :active, -> { where(status: "active")}

  belongs_to :family

  def donation_range
    donation_range = []
    (0..requested_amount).step(15) do |n|
      donation_range << n
    end
    donation_range.take(10)
  end

  def quantity_in_cart(cart)
    cart.contents.find do |key, value|
      if key == "#{self.purpose}, #{self.id}"
        return value
      end
    end
  end

  def retire_loan
    update(status: "retired")
  end

  def active?
    status == "active"
  end

  def retired?
    status == "retired"
  end

end
