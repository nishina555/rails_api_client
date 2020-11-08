class QiitaApiClient
  def initialize
    @token = Rails.application.credentials.qiita[:token]
  end

  def get_items
    req = Net::HTTP::Get.new(
      '/api/v2/items',
      'Authorization' => "Bearer #{@token}"
    )
    http_client.request(req)
    res = http_client.request(req)
    @qiita_items = res.body
    JSON.parse(@qiita_items)
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
  def http_client
    uri = URI.parse('https://qiita.com')
    http_client = Net::HTTP.new(uri.host, uri.port)
    http_client.use_ssl = true
    http_client
  end
end