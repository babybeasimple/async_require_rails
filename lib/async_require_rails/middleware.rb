module AsyncRequireRails
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      case env['REQUEST_METHOD']
      when 'GET', 'HEAD'
        path = env['PATH_INFO'].chomp('/')
        if match = path.match(/(async-require\/)(.*)/)
          response(match[2])
        else
          @app.call(env)
        end
      end
    end

  private

    def response(path)
      [200, {'Content-Type' => 'text/javascript'}, [proxy_request(path)]]
    end

    def proxy_request(path)
      Net::HTTP.get(URI("http://localhost:6969/#{path}"))
    end
  end
end
