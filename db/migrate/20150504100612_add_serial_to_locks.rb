class AddSerialToLocks < ActiveRecord::Migration
  def change
  	add_column :locks, :serial, :string
  end
end
