class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :gender
      t.string :country
      t.string :state
      t.string :address
      t.timestamps null: false
    end
  end
end
