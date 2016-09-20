module PageObjects
  class CartPage < SitePrism::Page
    set_url '/cart'

    section :header, HeaderSection, '#spree-header'

    def checkout
      click_on 'Checkout'
      if header.has_logout_link?
        CheckoutAddressPage.new
      else
        CheckoutRegistrationPage.new
      end
    end
  end
end
