class RoomsConnection
  def self.conn
    We::Call::Connection.new(host: ENV["ROOMS_URL"], timeout: (ENV['ROOMS_TIMEOUT'] || 3).to_f, open_timeout: (ENV['ROOMS_OPEN_TIMEOUT'] || 2.0).to_f) do |conn|
      conn.headers['Content-Type'] = 'application/json'
    end
  end

  def self.get_health
    response = conn.get(ENV["HEALTH_CHECK_ENDPOINT"])

    response = JSON.parse(response.body).with_indifferent_access
    response[:result]
  end
end
