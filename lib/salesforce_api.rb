class SalesforceApi
  attr_reader :client

  def initialize
    @client = Restforce.new(
      host: ENV['SALESFORCE_HOST'],
      username: ENV['SALESFORCE_USER'],
      password: ENV['SALESFORCE_PASSWORD'],
      client_id: ENV['SALESFORCE_CLIENT_ID'],
      client_secret: ENV['SALESFORCE_CLIENT_SECRET']
    )
  end
end
