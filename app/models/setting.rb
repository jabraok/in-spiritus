# 1. check cache
# 2. check db
#
# Setting.get_value(config.CONSTANT)
# Setting.get_value("driver_email")

class Setting < ActiveRecord::Base
  validates :key, uniqueness: true

  after save model

  def self.get_value(key)
    raise "invalid param" if key.blank?

    # find in cache first
    value =  Setting.read_cache(key)

    if value.nil? then
      setting = Setting.where(:key=>key)

      if setting.nil? then
        value = setting.value
        Setting.set_cache(key, value)
      end
    end

    value
  end

  def self.set_cache(key, value)
    actual_key = "SETTING_" + key;
    Rails.cache.write(actual_key, value, time_to_idle: 60.seconds, timeToLive: 1.day)
  end

  def self.read_cache(key)
    actual_key = "SETTING_" + key;
    Rails.cache.read(actual_key)
  end
end
