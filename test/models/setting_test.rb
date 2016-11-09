require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  test "validates key value is uniqueness" do
    key = "THE_KEY"
    create(:setting, key: key)

    setting = build(:setting, key: key)
    assert setting.invalid?

    setting.key = "THE_UNIQUE_KEY"
    assert setting.valid?
  end
end
