# lib/services/create_companies_from_salesforce.rb

require 'salesforce_api'

class CreateCompaniesFromSalesforce
  def self.call
    new.call
  end

  def initialize
    @client = SalesforceApi.new.client
  end

  def call
    salesforce_ids = Company.pluck(:salesforce_id)

    @client.query('SELECT Id, Name FROM Account').each do |record|
      next if salesforce_ids.include?(record.Id)

      puts record.Id
      puts record.Name

      # Company.create!(
      #   salesforce_id: record.Id,
      #   name: record.Name
      # )
    end
  end
end
