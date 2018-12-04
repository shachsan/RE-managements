class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.string :unit_no
      t.integer :size
      t.integer :bedrooms
      t.float :rent
      t.boolean :electricity
      t.boolean :water
      t.boolean :gas
      t.references :lease, foreign_key: true
      t.references :building, foreign_key: true
      t.references :agent, foreign_key: true

      t.timestamps
    end
  end
end
