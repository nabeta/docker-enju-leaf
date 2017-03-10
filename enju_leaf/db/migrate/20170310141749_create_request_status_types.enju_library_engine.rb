# This migration comes from enju_library_engine (originally 130)
class CreateRequestStatusTypes < ActiveRecord::Migration
  def change
    create_table :request_status_types do |t|
      t.string :name, :null => false
      t.text :display_name
      t.text :note
      t.integer :position

      t.timestamps
    end
  end
end
