# lib/tasks/salesforce.rake

namespace :salesforce do
  desc 'Salesforceから取引先（companies）を取得して保存'
  task get_companies: :environment do
    puts 'Salesforce 取引先データの取得を開始します...'

    puts '==> Sending POST request to http://localhost:3000/auth/salesforce'

    conn = Faraday.new
    response = conn.post('http://localhost:3000/auth/salesforce')

    puts "==> Response status: #{response.status}"
    puts '==> Response headers:'
    response.headers.each do |key, value|
      puts "  #{key}: #{value}"
    end

    puts "\n==> Response body:"
    puts response.body

    puts 'データの取得と保存が完了しました'
  end
end
