class Family < ActiveRecord::Base
  has_many :category_families
  has_many :categories, through: :category_families
  has_many :supply_items

  def num_people
    num_married_adults + num_unmarried_adults +
    num_children_over_two + num_children_under_two
  end

  def num_adults
    num_married_adults + num_unmarried_adults
  end

  def supply_quantity_hash  #since supplies added by admin and will be designed via dropdown, not worried about lack of normalization. Seems unnecessary to make a table out of this.
    {"adult" => num_adults,
     "person" => num_people,
     "household" => 1,
     "baby" => num_children_under_two,
     "child" => num_children_over_two
     "other" => 0}
  end


  def create_supply_items
    Supply.all.each do |supply|
      supply_items.create(supply: supply, quantity: supply_quantity_hash[supply.multiplier_type])
    end
  end

end
