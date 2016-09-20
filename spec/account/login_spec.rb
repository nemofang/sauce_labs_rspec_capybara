require 'spec_helper'

describe 'Login' do
  let(:login_page) { PageObjects::LoginPage.new }

  before { login_page.load }

  context 'page' do
    it 'should show correctly' do
      expect(login_page).to have_content('Login as Existing Customer')
    end
  end

  context 'external links' do
    context 'new account link' do
      it 'should show signup page' do
        signup_page = login_page.click_new_account
        expect(signup_page).to have_content('New Customer')
      end
    end

    context 'forgot pwd link' do
      it 'should show password recover page' do
        pwd_recover_page = login_page.click_forgot_pwd
        expect(pwd_recover_page).to have_content('Forgot Password?')
      end
    end
  end

  context 'empty input' do
    it 'should show error message' do
      login_page.login('', '')
      expect(login_page).to have_content('Invalid email or password.')
    end
  end

  context 'wrong user or pwd' do
    it 'should show error message' do
      login_page.login(CREDENTIALS['user']['email'], 'adadsfs')
      expect(login_page).to have_content('Invalid email or password.')
    end
  end

  context 'correct user/password' do
    it 'should login successfully' do
      home_page = login_page.login(CREDENTIALS['user']['email'], CREDENTIALS['user']['password'])
      expect(home_page).to have_content('Logged in successfully')
      expect(home_page.header).to have_my_account
    end
  end
end
