module PageObjects
  class BreadcrumbsSection < SitePrism::Section
    elements :breadcrumb_links, 'li a'
    element :current_link, 'li.active a'
  end
end
