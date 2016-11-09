namespace :settings_data do
  desc "Settings data tools"

  task :init => :environment do
    FactoryGirl.create(:setting,
      key: "EMAIL_SALES_ORDER",
      label: "Email sales order",
      value: "sale@mlvegankitchen.com"
    )

    FactoryGirl.create(:setting,
      key: "EMAIL_PURCHASE_ORDER",
      label: "Email purchase order",
      value: "purchase@mlvegankitchen.com"
    )
  end
end
