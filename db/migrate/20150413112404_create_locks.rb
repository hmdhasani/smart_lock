class CreateLocks < ActiveRecord::Migration
  def change
    create_table :locks do |t|
      t.string :name
      t.integer :state

      t.timestamps
    end
  end
end
