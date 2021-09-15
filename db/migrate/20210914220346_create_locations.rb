class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations, id: :uuid do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
