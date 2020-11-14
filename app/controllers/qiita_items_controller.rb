class QiitaItemsController < ApplicationController
  def index
    response_json = QiitaApiClient.get_items

    # faradayのシンプルな方法
    # response = Faraday.get('https://qiita.com/api/v2/items') do |request|
    #   request.headers['Authorization'] = "Bearer #{Rails.application.credentials.qiita[:token]}"
    # end
    # response_json = JSON.parse(response.body)

    # レスポンスを簡略化するため、titleプロパティのみ返すようにしている
    render json: response_json.map {|item| item.slice('title') }
  end
end
