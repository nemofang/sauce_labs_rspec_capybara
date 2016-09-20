module PageObjects
  class SidebarSection < SitePrism::Section
    # Show on home/products or search result page without scope
    element :taxonomies, '#taxonomies'
    elements :root_taxonomies, '.taxonomy-root'
    elements :taxon_links, 'a'

    # Show when search within scope
    element :sidebar_search, '#sidebar_products_search'
    element :filter_title, '.filter-title'
    elements :filters, '.list-group-item input'
    element :search_button, 'input.btn'
  end
end
