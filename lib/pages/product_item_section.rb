module PageObjects
  class ProductItemSection < SitePrism::Section
    element :link, 'a'
    element :name, 'span.info'
    element :price, 'span.price'
  end
end
