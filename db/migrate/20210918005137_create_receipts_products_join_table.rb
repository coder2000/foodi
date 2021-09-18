class CreateReceiptsProductsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :receipts, :products, column_options: {type: :uuid} do |t|
      t.index [:receipt_id, :product_id]
    end
  end
end
