require "test_helper"

class QuoteTest < ActiveSupport::TestCase
  test "#total_price はすべてのアイテムの行の合計金額を足し合わせたものを返す" do
    assert_equal 2500, quotes(:first).total_price
  end
end
