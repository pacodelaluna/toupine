# This migration comes from spree_pages (originally 20120403121743)
class RenamePagesToNamespace < ActiveRecord::Migration
  def change
    rename_table :pages, :spree_pages
  end
end
