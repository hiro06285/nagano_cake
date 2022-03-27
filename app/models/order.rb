class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { creditcard: 0, bank_transfer: 1 }
  enum status: { wait: 0, confirm: 1, making: 2, ready: 3, complete: 4 }
end
