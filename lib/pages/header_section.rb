module PageObjects
  class HeaderSection < SitePrism::Section
    element :logo, '#logo'
    element :login_link, 'li#link-to-login a'
    element :my_account, 'a', text: 'My Account'
    element :logout_link, 'a', text: 'Logout'
    element :search_taxon, 'select#taxon'
    element :search_field, 'input#keywords'
    element :search_button, 'input.btn-success'

    element :home_link, '#home-link'
    element :cart_link, '#link-to-cart'
  end
end
