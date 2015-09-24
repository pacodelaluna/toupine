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

end
