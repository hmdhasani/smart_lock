class CreateMotions < ActiveRecord::Migration
  def change
    create_table :motions do |t|
      t.integer :lock_id

      t.timestamps
    end
  end
end
