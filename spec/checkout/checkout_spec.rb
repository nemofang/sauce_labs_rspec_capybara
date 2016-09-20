require 'spec_helper'

describe 'checkout' do
  let(:products_page) { PageObjects::ProductsPage.new }
  let(:login_page) { PageObjects::LoginPage.new }

  before { products_page.load }

  context 'guest checkout' do
    it 'should place order successfully' do
      pdp = products_page.go_to_pdp
      cart_page = pdp.add_to_cart
      registration_page = cart_page.checkout
      expect(registration_page).to have_content('Registration')
      expect(registration_page).to have_xpath("//form[@id='new_spree_user']")
      add_page = registration_page.checkout_as_guest
      add_page.fill_billing_add
      payment_page = add_page.go_to_next_step.go_to_next_step
      payment_page.filling_cc_info
      confirm_page = payment_page.go_to_next_step
      order_detail_page = confirm_page.place_order
      expect(order_detail_page).to have_content('Your order has been processed successfully')
      expect(order_detail_page).to have_xpath("//fieldset[@id='order_summary']")
    end
  end

  context 'login user' do
    before do
      login_page.load
      login_page.login(CREDENTIALS['user']['email'], CREDENTIALS['user']['password'])
    end

    context 'using new cc' do
      it 'should place order successfully' do
        pdp = products_page.go_to_pdp
        cart_page = pdp.add_to_cart
        add_page = cart_page.checkout
        add_page.fill_billing_add
        payment_page = add_page.go_to_next_step.go_to_next_step
        payment_page.use_new_card
        payment_page.filling_cc_info
        confirm_page = payment_page.go_to_next_step
        order_detail_page = confirm_page.place_order
        expect(order_detail_page).to have_content('Your order has been processed successfully')
        expect(order_detail_page).to have_xpath("//fieldset[@id='order_summary']")
      end
    end

    context 'using existing cc' do
      it 'should place order successfully' do
        pdp = products_page.go_to_pdp
        cart_page = pdp.add_to_cart
        add_page = cart_page.checkout
        add_page.fill_billing_add
        payment_page = add_page.go_to_next_step.go_to_next_step
        confirm_page = payment_page.go_to_next_step
        order_detail_page = confirm_page.place_order
        expect(order_detail_page).to have_content('Your order has been processed successfully')
        expect(order_detail_page).to have_xpath("//fieldset[@id='order_summary']")
      end
    end
  end

  # TODO: needs to add more tests, for example error cases coverage, edit shipping add before placing order etc.
end
