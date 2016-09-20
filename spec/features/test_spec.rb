require 'spec_helper'

describe 'Home Page' do
  it 'Should show the home page products' do
    visit '/'
    expect(page).to have_css("div[data-hook='homepage_products']")
  end
end
