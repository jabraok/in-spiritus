FactoryGirl.define do
  factory :credit_note_item do
    quantity 5
    unit_price 10

    before(:create) do |credit_note, evaluator|
      credit_note.item = Item.all.sample
    end
  end
end
