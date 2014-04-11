class AddStripeAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_token, :string
    add_column :users, :stripe_customer_id, :string
  end
end
