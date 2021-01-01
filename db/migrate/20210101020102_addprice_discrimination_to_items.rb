class AddpriceDiscriminationToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :price_discrimination, :integer
  end
end