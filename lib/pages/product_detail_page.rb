module PageObjects
  class ProductDetailPage < SitePrism::Page
    set_url '/products{/slug}'

    section :header, HeaderSection, '#spree-header'
    section :breadcrumb, BreadcrumbsSection, '.breadcrumb'
    section :product_images, ProductImagesSection, '#product-images'
    section :product_properties, ProductPropertiesSection, "div[data-hook='product_properties']"
    section :product_description, ProductDescriptionSection, '#product-description'
    section :similiar_items, SimilarItemsSection, '#taxon-crumbs'

    def add_to_cart(num = 1)
      product_description.quantity.set(num)
      product_description.add_to_cart_btn.click
      CartPage.new
    end
  end
end

