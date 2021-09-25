class CreateIdentities < ActiveRecord::Migration[7.0]
  def change
    create_table :identities, id: :uuid do |t|
      t.string :provider, null: false
      t.string :uid, null: false

      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
