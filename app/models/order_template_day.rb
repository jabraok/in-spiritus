class OrderTemplateDay < ActiveRecord::Base

  belongs_to :order_template, touch: true, optional: true
end
