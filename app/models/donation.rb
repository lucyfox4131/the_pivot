class Donation < ActiveRecord::Base
  validates :status, presence: true, inclusion: %w(Pledged Received Cancelled)

  belongs_to :user
  has_many :donation_items

  def date
    created_at.to_date
  end

  def total
    donation_items.reduce(0) do |sum, item|
      sum += item.subtotal
    end
  end

  def self.stats
    num_items = DonationItem.total_items
    num_families = Family.count
    money_raised =  Donation.all.reduce(0) do |sum, donation|
      sum += donation.total
    end
    {num_items: num_items, num_families: num_families, money_raised: money_raised.to_f}
  end

  def create_donation_item(cart_item, donation)
    if cart_item["class_type"] == "Loan"
      DonationItem.create(quantity: cart_item["quantity"],
                          loan: Loan.find(cart_item["id"]),
                          donation: donation)
    else
      DonationItem.create(quantity: cart_item["quantity"],
                          supply_item: SupplyItem.find(cart_item["id"]),
                          donation: donation)
    end
  end

end
