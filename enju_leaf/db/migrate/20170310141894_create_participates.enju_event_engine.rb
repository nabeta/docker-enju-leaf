# This migration comes from enju_event_engine (originally 20090519203307)
class CreateParticipates < ActiveRecord::Migration
  def self.up
    create_table :participates do |t|
      t.references :agent, index: true, null: false
      t.references :event, index: true, null: false
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :participates
  end
end
