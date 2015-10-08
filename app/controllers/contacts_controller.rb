
  class ContactsController  < ApplicationController
  
    helper "spree/products"
    helper 'spree/base'
    include Spree::Core::ControllerHelpers
    include Spree::Core::ControllerHelpers::Order
    include Spree::Core::ControllerHelpers::Auth
    include Spree::Core::ControllerHelpers::Store
    include Spree::Core::Engine.routes.url_helpers
    
    def new
      @contact = Spree::Contact.new
    end
    
    def create
      @contact = Spree::Contact.new(params[:contact])
      
      if @contact.save
        #todo mailer here
        
        
        redirect_to(spree.root_path, :notice => t('spree.contacts.notices.success'))
      else
        render :new
      end
    end
    
    private
    def accurate_title
      t('spree.contacts.new.contact')
    end
    
  end
