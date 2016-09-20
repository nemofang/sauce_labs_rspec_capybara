module PageObjects
  class OrderSummarySection < SitePrism::Section
    element :order_total, 'span#summary-order-total'
  end
end
