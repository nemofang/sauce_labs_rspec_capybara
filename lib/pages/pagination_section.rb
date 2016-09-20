module PageObjects
  class PaginationSection < SitePrism::Section
    element :prev, 'li.prev a'
    element :next, 'li.next_page a'
    element :first, 'li.first a'
    element :last, 'li.last a'
    elements :pages, 'li.page a'
    element :active_page, 'li.active a'
  end
end
