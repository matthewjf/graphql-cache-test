class CreateVariations < ActiveRecord::Migration[6.0]
  def change
    create_table :variations, id: :uuid do |t|
      t.string :name
      t.integer :height
      t.integer :width
      t.boolean :active
      t.references :product, null: false, foreign_key: true, type: :uuid
      t.references :texture, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
