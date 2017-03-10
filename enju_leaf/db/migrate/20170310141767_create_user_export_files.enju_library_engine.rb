# This migration comes from enju_library_engine (originally 20140709113413)
class CreateUserExportFiles < ActiveRecord::Migration
  def change
    create_table :user_export_files do |t|
      t.references :user, index: true
      t.attachment :user_export
      t.datetime :executed_at

      t.timestamps
    end
  end
end
