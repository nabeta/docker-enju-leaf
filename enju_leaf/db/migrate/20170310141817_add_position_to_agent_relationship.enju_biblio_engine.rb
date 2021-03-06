# This migration comes from enju_biblio_engine (originally 20100814091104)
class AddPositionToAgentRelationship < ActiveRecord::Migration
  def self.up
    add_column :manifestation_relationships, :position, :integer
    add_column :agent_relationships, :position, :integer
  end

  def self.down
    remove_column :agent_relationships, :position
    remove_column :manifestation_relationships, :position
  end
end
