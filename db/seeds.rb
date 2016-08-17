#### Users
admin = User.create(first_name:'Tony', last_name:'Starks', email:'admin@wutang.com', authentication_token:'admin_token', password:'password')
admin.set_admin_role!
admin.save

FactoryGirl.create_list(:item, 10, tag: Item::PRODUCT_TYPE, is_sold: true, is_purchased: false)

FactoryGirl.create_list(:price_tier, 3, items: Item.products)

FactoryGirl.create_list(:companies_with_locations, 20)

FactoryGirl.create_list(:orders_with_notifications, 10)

# create 10 customers
# create 10 vendors

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
