module Spree
	HomeController.class_eval do
		def index
	      @hp_taxon = Taxon.find_by_permalink!("homepage")
	      @blog_entries = Spree::BlogEntry.visible.page(@pagination_page).first(4)
	    end
	end
end
