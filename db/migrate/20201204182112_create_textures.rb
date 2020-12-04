class CreateTextures < ActiveRecord::Migration[6.0]
  def change
    create_table :textures, id: :uuid do |t|
      t.string :name
      t.boolean :default
      t.boolean :transparent
      t.timestamps
    end
  end
end
