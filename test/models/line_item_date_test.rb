require "test_helper"

class LineItemDateTest < ActiveSupport::TestCase
  test "#previous_date はquoteが存在しているとき、直近の前の日付のものを返す（来週の場合）" do
    assert_equal line_item_dates(:today), line_item_dates(:next_week).previous_date
  end

  test "#previos_date はquoteが存在しているとき、直近の前の日付のものを返す（再来週の場合）" do
    assert_equal line_item_dates(:next_week), line_item_dates(:week_after_next).previous_date
  end

  test "#previous_date は前のquoteが存在していなかったとき、nilを返す" do
    assert_nil line_item_dates(:today).previous_date
  end
end
