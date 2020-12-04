class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name
      t.integer :label_id
      t.boolean :active, default: true, null: false
      t.timestamps
    end
  end
end
