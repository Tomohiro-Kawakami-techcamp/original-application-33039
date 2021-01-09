class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string  :content,                       null: false
      t.string  :limit_day,                     null: false
      t.references  :user,                    foreign_key: true
      t.timestamps
    end
  end
end