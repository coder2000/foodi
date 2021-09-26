class AddSlugToUsers < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true, algorithm: :concurrently
  end
end
