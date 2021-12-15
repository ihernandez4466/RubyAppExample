require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  #validation
  test "is valid with valid attributes" do
    entry = Entry.new(meal_type: "Breakfast", carbo: 234, proteins: 23, fats: 20, calories: 98)
    assert entry.save
  end

  test "should not save entry without required attribute" do
    entry = Entry.new(carbo: 234, proteins: 23, fats: 20, calories: 98)
    assert_not entry.save
  end
end
