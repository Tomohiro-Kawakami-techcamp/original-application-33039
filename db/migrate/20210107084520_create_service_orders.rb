class CreateServiceOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :service_orders do |t|
      t.references  :user,                    foreign_key: true
      t.references  :service,                 foreign_key: true
      t.timestamps
    end
  end
end
