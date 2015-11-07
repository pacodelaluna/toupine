class AddNetWeightToProducts < ActiveRecord::Migration
  def change
  	add_column :spree_products, :net_weight, :string
  end
end
