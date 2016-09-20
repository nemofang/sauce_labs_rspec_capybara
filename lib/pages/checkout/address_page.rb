module PageObjects
  class CheckoutAddressPage < SitePrism::Page
    set_url '/checkout/address'

    section :checkout_header, CheckoutHeaderSection, "input[data-hook='checkout_header']"
    section :checkout_summay, OrderSummarySection, '#checkout-summary'

    element :customer_email, '#order_email'

    def fill_billing_add
      within('div#billing') do
        fill_add
      end
    end

    def fill_shipping_add
      within('div#shipping') do
        fill_add
      end
    end

    def go_to_next_step
      click_on 'Save and Continue'
      CheckoutDeliveryPage.new
    end

    private

    def fill_add
      fill_in 'First Name', with: Faker::Name.first_name
      fill_in 'Last Name', with: Faker::Name.first_name
      fill_in 'Street Address*', with: Faker::Address.street_address
      fill_in 'City', with: Faker::Address.city
      select 'United States of America', from: 'order[bill_address_attributes][country_id]'
      select 'California', from: 'order[bill_address_attributes][state_id]'
      fill_in 'Zip', with: Faker::Address.zip
      fill_in 'Phone', with: Faker::PhoneNumber.cell_phone
    end

  end
end
