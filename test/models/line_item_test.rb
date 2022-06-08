require "test_helper"

class LineItemTest < ActiveSupport::TestCase
  test "#total_price は1行のアイテムの合計値段を返す" do
    assert_equal 250, line_items(:catering_today).total_price
  end
end
