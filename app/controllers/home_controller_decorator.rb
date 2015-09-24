module Spree
	HomeController.class_eval do
		def index
	      @hp_taxon = Taxon.find_by_permalink!("homepage")
	    end
	end
end
