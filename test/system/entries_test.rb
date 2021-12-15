require "application_system_test_case"

class EntriesTest < ApplicationSystemTestCase
    setup do
        @entry = entries(:breakfast)
    end

    test "visiting the index" do
        visit entries_url
        assert_selector "h1", text: "Foodlog – #{DateTime.now.to_s(:nice_date)}"
    end

    test "creating a Entry" do
        visit entries_url
        click_on "Create new entry"

        fill_in "Calories", with: @entry.calories
        fill_in "Meal type", with: @entry.meal_type
        fill_in "Proteins", with: @entry.proteins
        fill_in "Carbo", with: @entry.carbo
        fill_in "Fats", with: @entry.fats 
        click_on "Create Entry"

        assert_text "Entry was successfully created."
        #click_on "Back"
    end
    test "unsuccessfully creating an Entry" do
        visit entries_url
        click_on "Create new entry"

        fill_in "Meal type", with: @entry.meal_type
        fill_in "Proteins", with: @entry.proteins
        fill_in "Carbo", with: @entry.carbo
        fill_in "Fats", with: @entry.fats 
        click_on "Create Entry"

        assert_text "prohibited this entry from being saved"
    end
end