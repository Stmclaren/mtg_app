class CreateAiRecommendations < ActiveRecord::Migration[8.1]
  def change
    create_table :ai_recommendations do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :deck, null: false, foreign_key: true
      t.text :prompt
      t.text :response
      t.string :status
      t.jsonb :metadata

      t.timestamps
    end
  end
end
