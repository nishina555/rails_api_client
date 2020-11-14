
class QiitaApiClient
  class HTTPError < StandardError
    def initialize(response)
      super "status=#{response.status} body=#{response.body}"
    end
  end
  class << self

    def connection
      Faraday::Connection.new('https://qiita.com') do |builder|
        builder.authorization :Bearer, "#{Rails.application.credentials.qiita[:token]}"
        builder.request  :url_encoded # リクエストパラメータを URL エンコードする
        builder.response :logger # レスポンスを標準出力する
        builder.adapter Faraday.default_adapter # アダプターの選択。デフォルトはNet::HTTP
        builder.response :json, :content_type => "application/json" # レスポンスボディをJSONパースする
      end
    end


    def get_items
      response = connection.get(
        '/api/v2/items'
      )
      if response.success?
        response.body
      else
        raise QiitaApiClient::HTTPError.new(response)
      end
    end

    # def get_items
    #   response = connection.get do |request|
    #     request.url '/api/v2/items'
    #     request.headers['Authorization'] = "Bearer #{Rails.application.credentials.qiita[:token]}"
    #   end
    #   if response.success?
    #     JSON.parse(response.body)
    #   else
    #     raise QiitaApiClient::HTTPError.new(response)
    #   end
    # end
  end


  # def initialize
  #   # @token = 'hoge'
  #   @token = Rails.application.credentials.qiita[:token]
  # end

  # def get_items
  #   request = Net::HTTP::Get.new(
  #     '/api/v2/items',
  #     'Authorization' => "Bearer #{@token}"
  #   )
  #   http_client.request(request)
  #   response = http_client.request(request)
  #   case response
  #   when Net::HTTPSuccess
  #     JSON.parse(response.body)
  #   else
  #     raise QiitaApiClient::HTTPError.new(response)
  #   end
  # end

  # class << self
  #   def client
  #     QiitaApiClient.new
  #   end

  #   def get_items
  #     client.get_items
  #   end
  # end

  # private

  # QIITA_HOST = 'https://qiita.com'

  # def http_client
  #   uri = URI.parse(QIITA_HOST)
  #   http_client = Net::HTTP.new(uri.host, uri.port)
  #   http_client.use_ssl = true
  #   http_client
  # end
end