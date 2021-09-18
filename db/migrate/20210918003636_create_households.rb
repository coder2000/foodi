class CreateHouseholds < ActiveRecord::Migration[7.0]
  def change
    create_table :households, id: :uuid do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :subdomain, unique: true

      t.timestamps
    end
  end
end
