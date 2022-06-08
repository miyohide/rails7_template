class LineItem < ApplicationRecord
  belongs_to :line_item_date

  validates :name, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }

  delegate :quote,  to: :line_item_date

  # total_price はアイテムの個数 * 単価で求められる合計金額を返す
  def total_price
    quantity * unit_price
  end
end
