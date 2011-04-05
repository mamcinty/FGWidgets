class CreateTrackings < ActiveRecord::Migration
  def self.up
    create_table :trackings do |t|
      t.references :tracker
      t.string :url
      t.date :expiration

      t.timestamps
    end
  end

  def self.down
    drop_table :trackings
  end
end
