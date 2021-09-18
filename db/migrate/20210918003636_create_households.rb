class CreateHouseholds < ActiveRecord::Migration[7.0]
  def change
    create_table :households, id: :uuid do |t|

      t.timestamps
    end
  end
end
