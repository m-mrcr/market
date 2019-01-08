class Market

  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors.push(vendor)
  end

  def vendor_names
    names = []
    @vendors.each do |vendor|
      names << vendor.name
    end
    return names
  end

  def vendors_that_sell(item)
    vendors = []
    @vendors.each do |vendor|
      if vendor.inventory.has_key?(item) == true
        vendors << vendor
      end
    end
    return vendors
  end

  def sorted_item_list
    sorted_item_list = []
    @vendors.each do |vendor|
      vendor.inventory.keys.each do |product|
        sorted_item_list.push(product) unless sorted_item_list.include?(product)
      end
    end
    return sorted_item_list.sort
  end

  def total_inventory
    inventory = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |product, quantity|
        inventory[product] += quantity
      end
    end
    return inventory
  end

  def sell(item, quantity)
    if total_inventory[item] <= quantity
      return false
    end
    if total_inventory[item] >= quantity
      @vendors.each do |vendor|
        if vendor.inventory.has_key?(item)
            vendor.inventory[item] -= quantity
        end
      end
      return true
    end
  end

end
