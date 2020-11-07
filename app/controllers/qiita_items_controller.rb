class QiitaItemsController < ApplicationController
  # GET /qiita_items
  def index
    # シンプルな方法
    # uri = URI.parse('https://qiita.com')
    # http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = true
    # req = Net::HTTP::Get.new(
    #   '/api/v2/items',
    #   'Authorization' => "Bearer #{Rails.application.credentials.qiita[:token]}"
    # )
    # res = http.request(req)
    # @qiita_items = res.body
    # response_json = JSON.parse(@qiita_items)
    # render json: response_json
    # render json: response_json.map {|item| item.slice('title') }

    response_json = QiitaApiClient.get_items
    render json: response_json
  end
end
