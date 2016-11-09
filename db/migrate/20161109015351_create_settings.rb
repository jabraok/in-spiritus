class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :label, null: false
      t.string :key, null: false
      t.string :description, null: false
      t.string :value, null: false

      t.timestamps null: false
    end
  end
end
