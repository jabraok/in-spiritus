class LocationResource < JSONAPI::Resource
  attributes  :name,
              :delivery_rate,
              :active

  has_one  :company
  has_one  :address

  has_many :visit_days
  has_many :item_desires
  has_many :item_credit_rates
  has_many :credit_notes
  has_many :orders
  has_many :stocks
  has_many :notification_rules

  filter :active
end
