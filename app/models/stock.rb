class Stock < ApplicationRecord

  def self.new_lookup(ticket_symbl)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:pub_key],
                                  secret_token: Rails.application.credentials.iex_client[:secret_token],
                                  endpoint: Rails.application.credentials.iex_client[:sand_box]
                                  )    
    client.price(ticket_symbl)
  end

end
