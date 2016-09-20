module PageObjects
  class PasswordRecoverPage < SitePrism::Page
    set_url '/password/recover'

    element :email_field, 'input#spree_user_email'
    element :reset_pwd_btn, "input[value='Reset my password']"

    def reset_pwd(email)
      email_field.set(email)
      reset_pwd_btn.click
    end
  end
end
