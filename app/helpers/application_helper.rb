module ApplicationHelper
  def product_images(product)
    if product.images.any?
      images = product.images
    else
      images = product.variant_images
    end
    images.first
  end

  def bite 
  	'bite'
  end

  def current_currency
    Spree::Config[:currency]
  end

  def blog_entry_permalink(e)
    unless e.published_at.nil?
      blog_entry_permalink_path :year => e.published_at.strftime("%Y"), :month => e.published_at.strftime("%m"), :day => e.published_at.strftime("%d"), :slug => e.permalink
    else
      blog_entry_permalink_path :year => "na", :month => "na", :day => "na", :slug => e.permalink
    end
  end

  def get_lang
    lang = []

    I18n.available_locales.each do |locale|
        lang <<  [ I18n.t(locale), locale]
    end

    return lang
  end


  def get_similar_products(product)
    pdt = []
    i = 0
    product.taxons.first.products("RANDOM()").each do |pt|
      if pt.id != product.id && i < 4
        pdt <<  pt
        ++i
      end
    end

    pdt
  end

end
