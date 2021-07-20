module Dadata 
  def self.gender(name)
      require 'httparty'
      query = [name].to_json

      headers = {
        "Content-Type" => "application/json",
        "Authorization" => "Token 49e590d74a8832d8b78c636c58ea4c649ca17325",
        "X-secret" => "a4938ef039de3553ae6b629677c42bff090b4eac"
      }
      
      response = HTTParty.post(
        "https://cleaner.dadata.ru/api/v1/clean/name",
        :body => query,
        :headers => headers 
      )

      return gender = response[0]["gender"]
  end 
end   