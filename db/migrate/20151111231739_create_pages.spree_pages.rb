# This migration comes from spree_pages (originally 20110614102624)
class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.string :permalink
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
