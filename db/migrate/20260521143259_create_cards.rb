class CreateCards < ActiveRecord::Migration[8.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :set
      t.string :rarity
      t.string :card_type
      t.string :colour
      t.integer :mana_value
      t.integer :collector_number
      t.string :image_url
      t.string :legal_formats

      t.timestamps
    end
  end
end
