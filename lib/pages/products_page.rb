module PageObjects
  class ProductsPage < SitePrism::Page
    set_url '/products'

    section :header, HeaderSection, '#spree-header'
    section :sidebar, SidebarSection, 'aside#sidebar'
    sections :products, ProductItemSection, "[data-hook='products_list_item']"
    section :pagination, PaginationSection, 'ul.pagination'

    def go_to_pdp
      products.first.link.click
      ProductDetailPage.new
    end
  end
end
