module PageObjects
  class LoginPage < SitePrism::Page
    set_url '/login'

    element :email_field, 'input#spree_user_email'
    element :pwd_field, 'input#spree_user_password'
    element :remember_me, 'input#spree_user_remember_me'
    element :login_btn, "input[value='Login']"

    def login(email, pwd)
      email_field.set(email)
      pwd_field.set(pwd)
      login_btn.click
      HomePage.new
    end

    def click_new_account
      click_link('Create a new account')
      SignupPage.new
    end

    def click_forgot_pwd
      click_link('Forgot Password?')
      PasswordRecoverPage.new
    end
  end
end
