# This migration comes from enju_circulation_engine (originally 20141020120523)
class AddLibraryIdToCheckout < ActiveRecord::Migration
  def change
    add_reference :checkouts, :library, index: true, foreign_key: true
  end
end
