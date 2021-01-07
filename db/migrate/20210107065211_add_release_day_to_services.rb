class AddReleaseDayToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :release_day, :string
  end
end
