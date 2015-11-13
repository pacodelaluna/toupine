module Spree::ContactUs
  ContactsController.class_eval do
    def create
    @contact = Spree::ContactUs::Contact.new(params[:contact_us_contact])

    if @contact.save
      if Spree::ContactUs::Config.contact_tracking_message.present?
        flash[:contact_tracking] = Spree::ContactUs::Config.contact_tracking_message
      end
      redirect_to("/contact_success", :notice => Spree.t('contact_us.notices.success'))
    else
      flash[:error] = Spree.t('contact_us.notices.error')
      render :new
    end
  end
  end
end