class CreateCollections < ActiveRecord::Migration[8.1]
  def change
    create_table :collections do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
