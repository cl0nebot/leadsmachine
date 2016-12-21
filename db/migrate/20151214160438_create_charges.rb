class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :stripe_id, index: true
      t.integer :amount
      t.string :card_last4
      t.string :card_type
      t.string :card_exp_month
      t.string :card_exp_year
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
