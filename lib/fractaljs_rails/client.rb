require 'connection_pool'
require 'Faraday'

module FractaljsRails
  class Client
    POOL_SIZE = 16
    POOL_ACCESS_MUTEX = Mutex.new

    def initialize(options)
      @base_url = options[:base_url]
    end

    def pool
      POOL_ACCESS_MUTEX.synchronize do
        @pool ||= ConnectionPool::Wrapper.new(size: POOL_SIZE) do
          Faraday.new(url: @base_url, &method(:prepare_connection))
        end
      end
      @pool
    end
    alias_method :conn, :pool

    private

    def prepare_connection(faraday)
      faraday.headers['Content-Type'] = 'application/json'
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end
end
