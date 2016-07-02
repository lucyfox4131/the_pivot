class Cart
  attr_accessor :contents

  def initialize(initial_contents)
    @contents = initial_contents || []
  end

  def add_cart_item(item, quantity)
    if contents.empty?
      contents << {
                    "class_type"  => item.class.to_s,
                    "id"          => item.id,
                    "quantity"    => quantity
                  }
    else
      contents.each do |cart_item|
        cart_item_exists = cart_item["class_type"] == item.class.to_s && cart_item["id"] == item.id
        if cart_item_exists
          cart_item["quantity"] += quantity
        else
          contents << {"class_type" => item.class.to_s, "id" => item.id, "quantity" => quantity}
          return contents
        end
      end
    end
    # if item.is_a? Integer
    #   contents[item.to_s] ||= 0
    #   contents[item.to_s] += quantity.to_i
    # else
    #   contents["#{item.purpose}, #{item.id}"] ||= 0
    #   contents["#{item.purpose}, #{item.id}"] += quantity.to_i
    # end
  end



  def delete_cart_item(item)
    contents.each do |cart_item|
      if cart_item["class_type"] == item.class.to_s && cart_item["id"] == item.id
        contents.delete(cart_item)
      end
    end
    # if cart_item.is_a? Loan
    #   contents.delete("#{cart_item.purpose}, #{cart_item.id}")
    # else
    #   contents.delete(cart_item.to_s)
    # end
  end

  def change_cart_item_quantity(item, new_cart_item_quantity)
    contents.each do |cart_item|
      if cart_item["class_type"] == item.class.to_s && cart_item["id"] == item.id
        if new_cart_item_quantity.to_i == 0
          contents.delete(cart_item)
        else
          cart_item["quantity"] = new_cart_item_quantity.to_i
        end
      end
    end
  end

  def total_items
    sum = 0
    contents.each do |cart_item|
      if cart_item["class_type"] == "Loan"
        sum += 1
      else
        sum += cart_item["quantity"].to_i
      end
    end
    sum
    # sum = 0
    # contents.keys.each do |key|
    #   if key.to_i.to_s == key
    #     sum += contents[key]
    #   else
    #     sum += 1
    #   end
    # end
    # sum
  end

  def total_price
    total_price = 0
    contents.each do |cart_item|
      if cart_item["class_type"] == "Loan"
        total_price += cart_item["quantity"].to_i
      else
        total_price += SupplyItem.find(cart_item["id"]).supply.value.to_i * cart_item["quantity"].to_i
      end
    end
    total_price.to_f
    # contents.each do |item, amount|
    #   if item.to_i.to_s == item
    #     total_price += SupplyItem.find(item).supply.value * amount.to_i
    #   else
    #     total_price += amount
    #   end
    # end
    # total_price.to_f
  end

  def get_supply_items
    contents.map do |cart_item|
      if cart_item["class_type"] == "Loan"
        loan = Loan.find(cart_item["id"])
        LoanDecorator.new(loan, cart_item["quantity"])
      else
        supply_item = SupplyItem.find(cart_item["id"])
        SupplyItemDecorator.new(supply_item, cart_item["quantity"])
      end
    end
  end

  def get_cart_item_list
    get_supply_items
  end

  def get_supply_items_hash
    get_supply_items.inject({}) do |hash, cart_item|
      hash[cart_item] = cart_item.quantity
      hash
    end
  end

  def get_supply_list_from_cart
    get_supply_items.map do |cart_item|
      cart_item.supply
    end
  end

  def get_loan_items
    contents.map do |cart_item|
      if cart_item[:class_type] == "Loan"
        Loan.find(cart_item[:id].to_i)
      end
    end.compact
  end
end
