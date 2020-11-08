class QiitaApiClient
  # class HTTPError < StandardError
  #   def initialize(response)
  #     super "code=#{response.code} body=#{response.body}"
  #   end
  # end

  def initialize
    @token = 'hoge'
    # @token = Rails.application.credentials.qiita[:token]
  end

  def get_items
    request = Net::HTTP::Get.new(
      '/api/v2/items',
      'Authorization' => "Bearer #{@token}"
    )
    http_client.request(request)
    response = http_client.request(request)
    case response
    when Net::HTTPSuccess
      JSON.parse(response.body)
    else
      raise "code= #{response.code}, body = #{response.body}"
      # raise QiitaApiClient::HTTPError.new(response)
    end
  end

  class << self
    def client
      QiitaApiClient.new
    end

    def get_items
      # require 'net/http'
      client.get_items
      # uri = URI.parse('https://qiita.com')
      # http = Net::HTTP.new(uri.host, uri.port)
      # http.use_ssl = true
      # req = Net::HTTP::Get.new(
      #   '/api/v2/items',
      #   'Authorization' => "Bearer #{Rails.application.credentials.qiita[:token]}"
      # )
      # http.request(req)
      # res = http.request(req)
      # @qiita_items = res.body
      # JSON.parse(@qiita_items)
    end
  end

  private

  QIITA_HOST = 'https://qiita.com'

  def http_client
    uri = URI.parse(QIITA_HOST)
    http_client = Net::HTTP.new(uri.host, uri.port)
    http_client.use_ssl = true
    http_client
  end
end