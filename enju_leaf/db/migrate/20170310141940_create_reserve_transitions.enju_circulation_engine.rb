# This migration comes from enju_circulation_engine (originally 20140518050147)
class CreateReserveTransitions < ActiveRecord::Migration
  def change
    create_table :reserve_transitions do |t|
      t.string :to_state
      if ActiveRecord::Base.configurations[Rails.env]["adapter"].try(:match, /mysql/)
        t.text :metadata
      else
        t.text :metadata, default: "{}"
      end
      t.integer :sort_key
      t.integer :reserve_id
      t.timestamps
    end

    add_index :reserve_transitions, :reserve_id
    add_index :reserve_transitions, [:sort_key, :reserve_id], unique: true
  end
end