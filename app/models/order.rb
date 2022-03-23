class Order < ApplicationRecord
  belongs_to :customer

  enum status: { creditcard: 0, bank_transfer: 1 }
end
