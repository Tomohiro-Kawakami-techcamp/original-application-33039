class AddColumnServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :target, :string
  end
end
