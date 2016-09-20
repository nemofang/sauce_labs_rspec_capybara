module PageObjects
  class AccountPage < SitePrism::Page
    set_url '/account'

    section :header, HeaderSection, '#spree-header'
    element :account_summary, '.account-summary'
  end
end
