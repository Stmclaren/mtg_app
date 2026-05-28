class CreateDecks < ActiveRecord::Migration[8.1]
  def change
    create_table :decks do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :name
      t.string :format
      t.string :description
      t.boolean :public

      t.timestamps
    end
  end
end
