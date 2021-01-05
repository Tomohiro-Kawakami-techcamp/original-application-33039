class ChangeDataMemberIdToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :member_id, :integer
  end
end
