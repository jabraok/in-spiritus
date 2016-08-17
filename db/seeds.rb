#### Users
admin = User.create(first_name:'Tony', last_name:'Starks', email:'admin@wutang.com', authentication_token:'admin_token', password:'password')
admin.set_admin_role!
admin.save

FactoryGirl.create_list(:user, 2)

FactoryGirl.create_list(:item, 10, tag: Item::PRODUCT_TYPE, is_sold: true, is_purchased: false)

FactoryGirl.create_list(:price_tier, 3, items: Item.products)

FactoryGirl.create_list(:companie_with_locations, 10, is_customer: true, is_vendor: false)
FactoryGirl.create_list(:companie_with_locations, 10, is_customer: false, is_vendor: true)

FactoryGirl.create_list(:notification_rule_with_location, 5)

FactoryGirl.create_list(:sales_order_with_items_and_notification, 5)
FactoryGirl.create_list(:purchase_order_with_items_and_notifications, 5)

FactoryGirl.create_list(:credit_note_with_credit_note_items, 5)

FactoryGirl.create_list(:route_plan_with_route_visits, 1, user: admin)


# (0..20).each do |i|
#   Company
# end

# Location
#   .customer
#   .each do |location|
#     Item.sold.each do |item|
#       ItemDesire.create(item:item, location:location, enabled:true)
#     end
#
#     (0..6).each do |day|
#       VisitDay.create(day:day, location:location, enabled:true)
#     end
#
#     NotificationRule.create(first_name:'Aram', email:'az@mlvegankitchen.com', location:location)
#   end
#
# VisitWindow.all.each do |vw|
#   (0..6).each do |day|
#     VisitWindowDay.create(day:day, visit_window:vw)
#   end
# end
