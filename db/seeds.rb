#### Users
admin = User.create(first_name:'Tony', last_name:'Starks', email:'admin@wutang.com', authentication_token:'admin_token', password:'password')
admin.set_admin_role!
admin.save

FactoryGirl.create_list(:user, 2, :driver)

FactoryGirl.create_list(:item, 20, tag: Item::PRODUCT_TYPE, is_sold: true, is_purchased: false)

FactoryGirl.create_list(:price_tier, 5, items: Item.product)

FactoryGirl.create_list(:company_with_locations, 20)
FactoryGirl.create_list(:company_with_locations, 5, :vendor)

sequence_number = 1
Company.customer.each do |company|
  company.locations.each do |location|
    notification_rule = FactoryGirl.create(
      :notification_rule,
      location: location)

    5.times do
      order_number = "SO-#{Date.tomorrow.strftime('%y%m%d')}-#{sequence_number}"
      sequence_number += 1

      order = FactoryGirl.create(
        :order_with_items,
        :sales_order,
        items: Item.product,
        location: location,
        order_number: order_number)

      FactoryGirl.create(
        :notification,
        :renderer,
        order:order,
        notification_rule: notification_rule)
    end

    Item.product.each do |item|
      FactoryGirl.create(
        :item_desire,
        location:location,
        item: item)

      FactoryGirl.create(
        :item_credit_rate,
        location:location,
        item: item)
    end
  end
end

Company.vendor.each do |company|
  items = FactoryGirl.create_list(
    :item, 10,
    tag: Item::INGREDIENT_TYPE,
    company: company,
    is_sold: false,
    is_purchased: true)

  company.locations.each do |location|
    notification_rule = FactoryGirl.create(
      :notification_rule,
      location: location)

    3.times do
      order_number = "PO-#{Date.tomorrow.strftime('%y%m%d')}-#{sequence_number}"
      sequence_number += 1

      order = FactoryGirl.create(
        :order_with_items,
        :purchase_order,
        items: items,
        location: location)

      FactoryGirl.create(
        :notification,
        :renderer,
        order:order,
        notification_rule: notification_rule)
    end
  end
end

3.times do
  route_visits = RouteVisit.all.sample 30

  # Set position value for route visits
  position = 0
  route_visits.each do |rv|
    rv.position = position
    position += 10
  end

  FactoryGirl.create(
    :route_plan,
    user: User.all.sample,
    route_visits: route_visits)
end
