class SalesforceAccount
  class << self
    def retrieve_all(instance_url, access_token)
      conn = Faraday.new(
        url: instance_url,
        headers: {
          'Authorization' => "Bearer #{access_token}",
          'Content-Type' => 'application/json'
        }
      )

      api_version = 'v63.0'
      response = conn.get("/services/data/#{api_version}/query", {
                            q: 'SELECT Id, Name FROM Account LIMIT 15'
                          })

      if response.status != 200
        Rails.logger.error("Account fetch failed: #{response.body}")
        raise response.body
      end

      JSON.parse(response.body)
    end
  end
end
