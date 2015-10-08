# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false
  config.allow_guest_checkout = false
  config.admin_products_per_page = 50
  config.orders_per_page = 50
  config.default_country_id =  75
  config.address_requires_state = false
end

Spree.user_class = "Spree::LegacyUser"

SpreeEditor::Config.tap do |config|
  config.current_editor = 'CKEditor'
  config.ids = 'product_description page_body event_body blog_entry_body'
end