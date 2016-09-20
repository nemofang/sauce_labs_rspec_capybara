module PageObjects
  class SearchResultPage < SitePrism::Page
    set_url '/products{?query*}'
    # search_result_page.load(query: {'taxon'=> '', 'keywords'=> 'ruby'}) #=> /products?taxon=&keyboards=ruby

    section :header, HeaderSection, '#spree-header'
    section :sidebar, SidebarSection, 'aside#sidebar'
    sections :products, ProductItemSection, "[data-hook='products_list_item']"
  end
end
