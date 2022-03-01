class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string  :name
      t.string  :image_id
      t.text    :introduction
      t.integer :non_taxed_price
      t.boolean :sales_status

      t.timestamps
    end
  end
end
