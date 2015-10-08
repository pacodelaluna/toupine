class SpecialsPagesController < ApplicationController
  
  helper 'spree/base'
  include Spree::Core::ControllerHelpers
  include Spree::Core::ControllerHelpers::Order
  include Spree::Core::ControllerHelpers::Auth
  include Spree::Core::ControllerHelpers::Store
  include Spree::Core::Engine.routes.url_helpers

  def distributeurs
  end
end