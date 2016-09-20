module PageObjects
  class SignupFormSection < SitePrism::Section
    element :email_field, 'input#spree_user_email'
    element :password_field, 'input#spree_user_password'
    element :password_confirmation, 'input#spree_user_password_confirmation'
    element :create_account, "input[value='Create']"
    element :login_as_existing_customer, 'a', text: 'Login as Existing Customer'
  end
end
