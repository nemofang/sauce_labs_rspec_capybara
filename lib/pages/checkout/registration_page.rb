module PageObjects
  class CheckoutRegistrationPage < SitePrism::Page
    set_url '/checkout/registration'

    section :new_user_form, SignupFormSection, 'div#new-customer'
    element :guest_email, '#order_email'

    def checkout_as_guest
      guest_email.set Faker::Internet.email
      click_on 'Continue'
      CheckoutAddressPage.new
    end

    def register_to_checkout
      new_user_form.email_field.set Faker::Internet.email
      new_user_form.password_field.set '12345678'
      new_user_form.password_confirmation.set '12345678'
      new_user_form.create_account.click
      CheckoutAddressPage.new
    end
  end
end
