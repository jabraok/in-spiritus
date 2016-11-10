namespace :settings_data do
  desc "Settings data tools"

  task :init => :environment do
    FactoryGirl.create(:setting,
      key: "sales_order_email",
      label: "Sales Email Address",
      description: "The email to send new sales orders from",
      value: "sale@mlvegankitchen.com"
    )

    FactoryGirl.create(:setting,
      key: "purchase_order_email",
      label: "Purchases Email Address",
      description: "The email to send new purchase orders from",
      value: "purchase@mlvegankitchen.com"
    )
  end
end
