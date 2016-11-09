class Setting < ActiveRecord::Base
  validates :key, uniqueness: true
end
