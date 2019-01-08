require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/vendor'

class VendorTest < MiniTest::Test
  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_instance_of Vendor, vendor
  end

  def test_it_initiates_with_a_name
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal "Rocky Mountain Fresh", vendor.name
  end

  def test_it_initiates_with_empty_hash_as_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")
    expected = {}
    assert_equal expected, vendor.inventory
  end

  def test_it_shows_zero_when_out_of_stock
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal 0, vendor.check_stock("Peaches")
  end

  def test_it_shows_quantity_available_when_in_stock
    vendor = Vendor.new("Rocky Mountain Fresh")

    vendor.stock("Peaches", 30)

    assert_equal 30, vendor.check_stock("Peaches")
  end

  def test_it_can_add_to_stock
    vendor = Vendor.new("Rocky Mountain Fresh")

    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)
    assert_equal 55, vendor.check_stock("Peaches")
  end

  def test_it_can_add_another_item
    vendor = Vendor.new("Rocky Mountain Fresh")
    vendor.stock("Peaches", 30)
    vendor.stock("Peaches", 25)
    vendor.stock("Tomatoes", 12)

    expected = {"Peaches"=>55, "Tomatoes"=>12}

    assert_equal expected, vendor.inventory
  end

end
