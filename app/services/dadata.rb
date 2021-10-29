module Dadata 
  def self.gender(name)
    require 'httparty'
    query = [name].to_json

    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Token #{Rails.application.credentials.dadata_api_key}",
      "X-secret" => Rails.application.credentials.dadata_secret_key
    }
    
    response = HTTParty.post(
      "https://cleaner.dadata.ru/api/v1/clean/name",
      :body => query,
      :headers => headers 
    )
    if response.code == 200
      return gender = response[0]["gender"]
    end
  end 
end