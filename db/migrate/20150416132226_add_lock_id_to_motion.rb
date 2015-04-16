class AddLockIdToMotion < ActiveRecord::Migration
  def change
    add_column :motions, :lock_id, :integer
  end
end
