class DonationItem < ActiveRecord::Base
  belongs_to :supply_item
  belongs_to :loan
  belongs_to :donation

  def family_nationality
    if supply_item
      supply_item.family.nationality.name
    else
      loan.family.nationality.name
    end
  end

  def family
    supply_item ? supply_item.family : loan.family
  end

  def family_size
    supply_item ? supply_item.family.num_people : loan.family.num_people
  end

  def family_description
    "#{family_nationality} family of #{family_size}"
  end

  def name
    supply_item ? supply_item.supply.name : loan.purpose
  end

  def value
    supply_item ? supply_item.supply.value : loan.requested_amount
  end

  def subtotal
    if supply_item
      value * quantity
    else
      quantity
    end
  end

  def self.total_items
    sum(:quantity)
  end
end
