require 'spec_helper'

describe 'Authorization', type: :feature do
  let(:login_page) { PageObjects::LoginPage.new }
  let(:account_page) { PageObjects::AccountPage.new }
  let(:signup_page) { PageObjects::SignupPage.new }
  let(:forgot_pwd_page) { PageObjects::PasswordRecoverPage.new }

  context 'non login' do
    context 'account page' do
      it 'should redirect you to login page' do
        account_page.load
        expect(account_page).to have_content('Login as Existing Customer')
      end
    end

    context 'login page' do
      it 'should show login page' do
        login_page.load
        expect(login_page).to have_content('Login as Existing Customer')
        expect(login_page).to have_xpath("//div[@id='existing-customer']")
      end
    end

    context 'signup page' do
      it 'should show signup page' do
        signup_page.load
        expect(signup_page).to have_content('New Customer')
        expect(signup_page).to have_new_user_form
      end
    end

    context 'forgot pwd page' do
      it 'should show password recover page' do
        forgot_pwd_page.load
        expect(forgot_pwd_page).to have_content('Forgot Password?')
      end
    end

    context 'admin panel' do
      it 'should redirect you to login page' do
        visit '/admin'
        expect(page).to have_content('Login as Existing Customer')
      end
    end
  end

  context 'normal user login' do
    before do
      login_page.load
      login_page.login(CREDENTIALS['user']['email'], CREDENTIALS['user']['password'])
    end

    context 'account page' do
      it 'should show account page' do
        account_page.load
        expect(account_page).to have_content('My Account')
        expect(account_page).to have_account_summary
        expect(account_page).to have_content(CREDENTIALS['user']['email'])
      end
    end

    context 'login page' do
      it 'should redirect user to home page with warnning msg' do
        login_page.load
        expect(login_page).to have_content('You are already signed in.')
      end
    end

    context 'signup page' do
      it 'should redirect user to home page with warnning msg' do
        signup_page.load
        expect(signup_page).to have_content('You are already signed in.')
      end
    end

    context 'forgot pwd page' do
      it 'should redirect user to home page with warnning msg`' do
        forgot_pwd_page.load
        expect(forgot_pwd_page).to have_content('You are already signed in.')
      end
    end

    context 'admin panel' do
      it 'should show forbidden page' do
        visit '/admin'
        expect(page).to have_content('Authorization Failure')
      end
    end
  end

  context 'admin user login' do
    before do
      login_page.load
      login_page.login(CREDENTIALS['admin']['email'], CREDENTIALS['admin']['password'])
    end

    context 'admin panel' do
      it 'should show admin panel successfully' do
        visit '/admin'
        expect(page).to have_css('body.admin')
      end
    end
  end

end
