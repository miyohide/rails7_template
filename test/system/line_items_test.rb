require "application_system_test_case"

class LineItemSystemTest < ApplicationSystemTestCase
  include ActionView::Helpers::NumberHelper

  setup do
    login_as users(:accountant)

    @quote = quotes(:first)
    @line_item_date = line_item_dates(:today)
    @line_item = line_items(:room_today)

    visit quote_path(@quote)
  end

  test "新しいline itemを作成する" do
    assert_selector "h1", text: "First quote"

    within "##{dom_id(@line_item_date)}" do
      click_on "Add item", match: :first
    end
    assert_selector "h1", text: "First quote"

    fill_in "商品名", with: "Animation"
    fill_in "量", with: 1
    fill_in "単価", with: 1234
    click_on "商品の追加"

    assert_selector "h1", text: "First quote"
    assert_text "Animation"
    assert_text number_to_currency(1234)

    assert_text number_to_currency(@quote.total_price)
  end

  test "line itemを更新する" do
    assert_selector "h1", text: "First quote"

    within "##{dom_id(@line_item)}" do
      click_on "Edit"
    end
    assert_selector "h1", text: "First quote"

    fill_in "商品名", with: "Capybara article"
    fill_in "単価", with: 1234
    click_on "商品の更新"

    assert_text "Capybara article"
    assert_text number_to_currency(1234)

    assert_text number_to_currency(@quote.total_price)
  end

  test "Destroying a line item" do
    within "##{dom_id(@line_item_date)}" do
      assert_text @line_item.name
    end

    within "##{dom_id(@line_item)}" do
      click_on "Delete"
    end

    within "##{dom_id(@line_item_date)}" do
      assert_no_text @line_item.name
    end

    assert_text number_to_currency(@quote.total_price)
  end
end
