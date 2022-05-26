require "test_helper"

class LineItemDateTest < ActiveSupport::TestCase
  test "#previous_date はquoteが存在しているとき、その前の日付のものを返す" do
    assert_equal line_item_dates(:today), line_item_dates(:next_week).previous_date
  end

  test "#previous_date はquoteが存在していなかったとき、nilを返す" do
    assert_nil line_item_dates(:today).previous_date
  end
end
