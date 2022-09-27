class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.decimal :last_price

      t.timestamps
    end
  end
end
# client = IEX::Api::Client.new(
#   publishable_token: "pk_f2e24b54e86048588c9cd68b85d6105a",
#   secret_token: "sk_cfd7bd047ca34bd6828cbd1bd64cc102",
#   endpoint: 'https://cloud.iexapis.com/v1')
