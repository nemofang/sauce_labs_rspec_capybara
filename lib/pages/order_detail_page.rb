module PageObjects
  class OrderDetailPage < SitePrism::Page
    set_url '/orders{/order_num}'

    def go_back_to_store
      click_link 'Go Back To Store'
      HomePage.new
    end
  end
end
