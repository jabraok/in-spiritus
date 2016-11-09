class SettingResource < JSONAPI::Resource
  attributes :label,
             :key,
             :description,
             :value
end
