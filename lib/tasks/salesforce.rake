# lib/tasks/salesforce.rake

require_relative '../services/create_companies_from_salesforce'

namespace :salesforce do
  desc 'Salesforceから取引先（companies）を取得して保存'
  task get_companies: :environment do
    puts 'Salesforce 取引先データの取得を開始します...'

    CreateCompaniesFromSalesforce.call

    puts 'データの取得と保存が完了しました'
  end
end
