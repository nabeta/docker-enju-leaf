# This migration comes from enju_circulation_engine (originally 20141014065831)
class AddShelfIdToCheckout < ActiveRecord::Migration
  def change
    add_reference :checkouts, :shelf, index: true, foreign_key: true
  end
end
