class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { cant: 0, wait: 1, making: 2, complete: 3 }
end
