class Stock < ApplicationRecord

  has_many :user_stocks, dependent: :destroy
  has_many :users, through: :user_stocks
  validates :name, :ticker, presence: true


  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
        publishable_token: Rails.application.credentials.aws[:secret_access_key],
        endpoint: 'https://cloud.iexapis.com/v1'
    )
    begin
      new({ticker: ticker_symbol, name: ticker_symbol , last_price: Stock.calculate_random_price})
    rescue => exception
      return nil
    end
    #return {ticket: ticker_symbol, name: client.company(ticker_symbol).company_name , last_price: client.price(ticker_symbol)}

  end

  def self.check_db(ticker_symbol)
    Stock.where(ticker: ticker_symbol).first
  end

  private
  def self.calculate_random_price
    rand * rand*1000
  end
end
