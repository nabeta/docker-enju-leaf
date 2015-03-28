# This migration comes from enju_circulation_engine (originally 20110328130826)
class AddCurrentCheckoutCountToUserGroupHasCheckoutType < ActiveRecord::Migration
  def self.up
    add_column :user_group_has_checkout_types, :current_checkout_count, :integer
  end

  def self.down
    remove_column :user_group_has_checkout_types, :current_checkout_count
  end
end
