module PageObjects
  class CheckoutHeaderSection < SitePrism::Section
    element :checkout_title, "h1[data-hook='checkout_title']"
    element :first_step, 'li.first a'
    element :last_step, 'li.last a'
    element :active_step, 'li.active a'

    elements :completed_steps, 'li.completed a'
  end
end
