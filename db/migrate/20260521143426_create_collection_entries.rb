class CreateCollectionEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :collection_entries do |t|
      t.references :collection, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.integer :quantity
      t.boolean :foil

      t.timestamps
    end
  end
end
