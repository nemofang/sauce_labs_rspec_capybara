require 'spec_helper'

describe 'Sign Up' do
  let(:signup_page) { PageObjects::SignupPage.new }

  before { signup_page.load }

  context 'page' do
    it 'should show correct content' do
      expect(signup_page).to have_content('New Customer')
      expect(signup_page).to have_new_user_form
    end
  end

  context 'external links' do
    context 'login link' do
      it 'should redirect user to login page' do
        login_page = signup_page.click_login_link
        expect(login_page).to have_content('Login as Existing Customer')
      end
    end
  end

  context 'success' do
    it 'should create new user and log you in' do
      home_page = signup_page.signup
      expect(home_page).to have_content('Welcome! You have signed up successfully.')
      expect(home_page.header).to have_my_account
    end
  end

  context 'error' do
    context 'empty inputs' do
      it 'should show according error msgs' do
        signup_page.new_user_form.create_account.click
        expect(signup_page).to have_content("Email can't be blank")
        expect(signup_page).to have_content("Password can't be blank")
      end
    end

    context 'password too short' do
      it 'shhould show according error msgs' do
        signup_page.new_user_form.email_field.set Faker::Internet.email
        signup_page.new_user_form.password_field.set '1234'
        signup_page.new_user_form.password_confirmation.set '1234'
        signup_page.new_user_form.create_account.click
        expect(signup_page).to have_content('Password is too short (minimum is 6 characters)')
      end
    end

    context 'password does not match' do
      it 'should show according error msgs' do
        signup_page.new_user_form.email_field.set Faker::Internet.email
        signup_page.new_user_form.password_field.set Faker::Internet.password(8)
        signup_page.new_user_form.password_confirmation.set Faker::Internet.password(8)
        signup_page.new_user_form.create_account.click
        expect(signup_page).to have_content("Password Confirmation doesn't match Password")
      end
    end
  end
end
