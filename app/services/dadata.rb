module Dadata 
  def self.gender(name)
    require 'httparty'
    query = [name].to_json

    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Token 49e590d74",
      "X-secret" => "a1b2c3d4"
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