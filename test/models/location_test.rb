require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = create(:location)
  end

  test "can view price_tier" do
    refute_empty @location.address.street, "Should not be empty!!!"
  end

  test "generates a code when one not present on save" do
    location = build(:location)
    assert location.code.nil?

    location.save

    assert location.code.present?
  end

  test "generates a code when one not present on create" do
    location = create(:location)
    assert location.code.present?
  end

  test "does not generate a code if one is present" do
    location = create(:location, code:'prefix')
    assert location.code.present?

    location.save

    assert_equal(location.code, 'prefix')
  end

  test "generates a code if one is duplicated" do
    create(:location, code:'prefix')

    location = create(:location, code:'prefix')
    assert location.code.present?

    location.save

    assert location.code.present?
    assert_not_equal(location.code, 'prefix')
  end

  test "should downcase code" do
    location1 = create(:location, code:'Prefix')
    assert_equal(location1.code, 'prefix')

    location2 = create(:location)
    assert_equal(location2.code, location2.code.downcase)
  end

  test "returns stock level when get previous stock level" do
    create_list(:item, 2, :product)
    location = create(:location)

    today = Date.today
    3.times do |index|
      date = today - index
      stock = create(:stock_with_stock_levels, location: location, taken_at: date)

      Item.all.each do |item|
        create(:stock_level, stock: stock, item: item)
      end
    end

    assert_equal(location.previous_stock_level, location2.code.downcase)
  end
end
