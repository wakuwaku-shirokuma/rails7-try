class Auth::SalesforceController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    uri = URI('https://login.salesforce.com/services/oauth2/authorize')

    # salesforce側でコールバックURLに127.0.0.1が使えないのでlocalhostを使っている
    redirect_uri = "http://localhost#{callback_auth_salesforce_path}"
    uri.query = {
      response_type: 'code',
      client_id: ENV['SALESFORCE_CLIENT_ID'],
      redirect_uri: redirect_uri
    }.to_query

    redirect_to(uri.to_s, allow_other_host: true)
  end

  def callback
    code = params[:code]
    salesforce_oauth = SalesforceOauth.retrieve_access_token(code)

    # salesforce_user_info(salesforce_oauth)

    # アカウントデータ取得
    accounts_data = SalesforceAccount.retrieve_all(
      salesforce_oauth.instance_url,
      salesforce_oauth.access_token
    )

    account_names = accounts_data['records'].map { |acc| acc['Name'] }

    render plain: "Accounts:\n" + account_names.join("\n")
  end

  def salesforce_user_info(salesforce_oauth)
    salesforce_user_info = SalesforceUserInfo.retrieve(salesforce_oauth.access_token)
    given_name = salesforce_user_info.given_name

    render plain: "Instance Url: #{salesforce_oauth.instance_url},\n Access Token: #{salesforce_oauth.access_token},\ Given Name: #{given_name}"
  end
end
