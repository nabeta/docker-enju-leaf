# This migration comes from enju_event_engine (originally 20140720192418)
class AddDefaultLibraryIdToEventImportFile < ActiveRecord::Migration
  def change
    add_reference :event_import_files, :default_library
  end
end
