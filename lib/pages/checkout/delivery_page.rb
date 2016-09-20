module PageObjects
  class CheckoutDeliveryPage < SitePrism::Page
    set_url '/checkout/delivery'

    section :checkout_header, CheckoutHeaderSection, "input[data-hook='checkout_header']"
    section :checkout_summay, OrderSummarySection, '#checkout-summary'
    elements :shipping_methods, 'li.shipping-method input'

    def go_to_next_step
      click_on 'Save and Continue'
      CheckoutPaymentPage.new
    end
  end
end
