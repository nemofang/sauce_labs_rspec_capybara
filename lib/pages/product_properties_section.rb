module PageObjects
  class ProductPropertiesSection < SitePrism::Section
    elements :properties, 'table#product-properties tr'
  end
end
