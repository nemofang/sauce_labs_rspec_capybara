module PageObjects
  class CheckoutPaymentPage < SitePrism::Page
    set_url '/checkout/payment'

    section :checkout_header, CheckoutHeaderSection, "input[data-hook='checkout_header']"
    section :checkout_summay, OrderSummarySection, '#checkout-summary'

    element :use_existing_card_yes, '#use_existing_card_yes'
    element :use_existing_card_no, '#use_existing_card_no'
    elements :payment_methods, '#payment-method-fields li input'

    def use_new_card
      use_existing_card_no.set true
    end

    def filling_cc_info
      within('#payment-methods') do
        fill_in 'Name on card', with: Faker::Internet.name
        fill_in 'Card Number', with: '4111111111111111'
        fill_in 'Expiration', with: '12/22'
        fill_in 'Card Code', with: '222'
      end
    end

    def go_to_next_step
      click_on 'Save and Continue'
      CheckoutConfirmPage.new
    end
  end
end
