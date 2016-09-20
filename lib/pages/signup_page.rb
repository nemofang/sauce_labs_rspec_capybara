module PageObjects
  class SignupPage < SitePrism::Page
    set_url '/signup'

    section :new_user_form, SignupFormSection, 'div#new-customer'

    def signup
      new_user_form.email_field.set Faker::Internet.email
      new_user_form.password_field.set '12345678'
      new_user_form.password_confirmation.set '12345678'
      new_user_form.create_account.click
      HomePage.new
    end

    def click_login_link
      new_user_form.login_as_existing_customer.click
      LoginPage.new
    end
  end
end
