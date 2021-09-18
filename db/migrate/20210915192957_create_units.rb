class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units, id: :uuid do |t|
      t.string :name
      t.text :description
      t.string :plural

      t.references :household, type: :uuid

      t.timestamps
    end
  end
end
