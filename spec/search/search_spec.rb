require 'spec_helper'

describe 'Search' do
  let(:home_page) { PageObjects::HomePage.new }

  before do
    home_page.load
  end

  context 'with default scope' do
    it 'should show search products' do
      search_result_page = home_page.search('jersey')
      expect(search_result_page).to have_content("Search results for 'jersey'")
      expect(search_result_page.sidebar).to have_taxonomies
      expect(search_result_page.sidebar).not_to have_sidebar_search
      expect(search_result_page.products.size).to eq(4)
    end

    it 'should be empty if no result' do
      search_result_page = home_page.search('This product does not exit')
      expect(search_result_page).to have_content('No products found')
      expect(search_result_page.sidebar).to have_taxonomies
      expect(search_result_page.sidebar).not_to have_sidebar_search
      expect(search_result_page.products.size).to eq(0)
    end
  end

  context 'with specific scope' do
    it 'should show results inside scope' do
      search_result_page = home_page.search('Ruby', 'Brand')
      expect(search_result_page).to have_content("Search results for 'Ruby'")
      expect(search_result_page.sidebar).not_to have_taxonomies
      expect(search_result_page.sidebar).to have_sidebar_search
      expect(search_result_page.products.size).to eq(8)
    end

    it 'should be empty if no result' do
      search_result_page = home_page.search('iPhone 7 Plus', 'Categories')
      expect(search_result_page).to have_content('No products found')
      expect(search_result_page.sidebar).not_to have_taxonomies
      expect(search_result_page.sidebar).to have_sidebar_search
      expect(search_result_page.products.size).to eq(0)
    end

    context 'filter search result' do
      it 'should filter the search result' do
        search_result_page = home_page.search('Ruby', 'Brand')
        expect(search_result_page).to have_products, count: 8
        search_result_page.sidebar.filters.first.set(true)
        search_result_page.sidebar.search_button.click
        expect(search_result_page.products.size).to eq(0)
      end
    end
  end

end
