module PageObjects
  class ProductDescriptionSection < SitePrism::Section
    element :product_title, '.product-title'
    element :description, "div[data-hook='description']"
    element :cart_form, '#cart-form'
    element :price, '#product-price span.price.selling'
    element :quantity, '#quantity'
    element :add_to_cart_btn, '#add-to-cart-button'
  end
end
