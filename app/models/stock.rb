class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbl)
    begin
      client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:pub_key],
      secret_token: Rails.application.credentials.iex_client[:secret_token],
      endpoint: Rails.application.credentials.iex_client[:sand_box]
      )    
      # client.price(ticket_symbl)
      new(ticker: ticker_symbl, name: client.company(ticker_symbl).company_name , last_price: client.price(ticker_symbl))      
    rescue => exception
      return nil
    end
  end

end
