class AddNameToHouseholds < ActiveRecord::Migration[7.0]
  def change
    add_column :households, :name, :string
  end
end
