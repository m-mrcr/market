class Vendor

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(product)
    quantity = 0
    @inventory.select do |item|
      if item = product
        quantity = @inventory[product]
      else quantity = 0
      end
    end
    return quantity
  end

  def stock(product, quantity)
    @inventory[product] += quantity
  end

end
