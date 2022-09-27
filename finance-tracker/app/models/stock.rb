class Stock < ApplicationRecord


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

  private
  def self.calculate_random_price
    rand * rand*1000
  end
end
