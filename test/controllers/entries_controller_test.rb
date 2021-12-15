require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get entries_url #get request to entry path 'entries_url'
    assert_response :success
  end

  test "should get new" do
    get new_entry_url
    assert_response :success
  end

  test "should create entry" do
    assert_difference('Entry.count', 1) do
      post entries_url, params: { entry: { meal_type: @entry.meal_type, calories: @entry.calories, carbohydrates: @entry.carbohydrates, fats: @entry.fats, proteins: @entry.proteins } }
    end

    assert_redirected_to entry_url(Entry.last)
  end

  test "should show entry" do
    get entries_url(@entry)
    assert_response :success
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete entry_url(@entry)
    end

    assert_redirected_to entries_url
  end
end
