class CreateTrackers < ActiveRecord::Migration
  def self.up
    create_table :trackers do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :trackers
  end
end
