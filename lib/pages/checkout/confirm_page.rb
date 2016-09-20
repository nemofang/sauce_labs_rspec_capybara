module PageObjects
  class CheckoutConfirmPage < SitePrism::Page
    set_url '/checkout/confirm'

    section :checkout_header, CheckoutHeaderSection, "input[data-hook='checkout_header']"

    element :order_bill_add_edit_link, "div[data-hook='order-bill-address'] a"
    element :order_ship_add_edit_link, "div[data-hook='order-ship-address'] a"
    element :order_shipment_edit_link, "div[data-hook='order-shipment'] a"
    element :order_payment_edit_link, "div[data-hook='order-shipment'] a"

    def place_order
      click_on 'Place Order'
      OrderDetailPage.new
    end

    def edit_bill_add
      order_bill_add_edit_link.click
      CheckoutAddressPage.new
    end

    def edit_ship_add
      order_ship_add_edit_link.click
      CheckoutAddressPage.new
    end

    def edit_shipment
      order_shipment_edit_link.click
      CheckoutDeliveryPage.new
    end

    def edit_payment
      order_payment_edit_link.click
      CheckoutPaymentPage.new
    end

  end
end
