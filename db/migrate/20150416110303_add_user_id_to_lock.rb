class AddUserIdToLock < ActiveRecord::Migration
  def change
    add_column :locks, :user_id, :integer
  end
end
