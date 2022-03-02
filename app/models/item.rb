class Item < ApplicationRecord
  belongs_to :genre
  attachment :image
  def add_tax_non_taxed_price
    (self.non_taxed_price * 1.10).round
  end
end
