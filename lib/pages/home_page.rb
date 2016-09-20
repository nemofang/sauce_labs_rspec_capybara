module PageObjects
  class HomePage < SitePrism::Page
    set_url '/'

    section :header, HeaderSection, '#spree-header'
    section :sidebar, SidebarSection, 'aside#sidebar'
    sections :products, ProductItemSection, "[data-hook='products_list_item']"
    section :pagination, PaginationSection, 'ul.pagination'

    def search(query, scope = 'All departments')
      header.search_taxon.select(scope)
      header.search_field.set(query)
      header.search_button.click
      SearchResultPage.new
    end
  end
end
