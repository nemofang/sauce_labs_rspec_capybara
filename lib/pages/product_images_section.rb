module PageObjects
  class ProductImagesSection < SitePrism::Section
    element :main_image, '#main-image img'
    elements :thumbnails, '#thumbnails img'
  end
end
