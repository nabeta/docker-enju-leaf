# This migration comes from enju_library_engine (originally 20120319173203)
class CreateAccepts < ActiveRecord::Migration
  def change
    create_table :accepts do |t|
      t.references :basket, index: true
      t.references :item, index: true
      t.references :librarian, index: true

      t.timestamps
    end
  end
end
