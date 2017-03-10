# This migration comes from enju_library_engine (originally 20140720170735)
class AddDefaultUserGroupIdToUserImportFile < ActiveRecord::Migration
  def change
    add_reference :user_import_files, :default_user_group
  end
end
