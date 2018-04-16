class APIConnection
  def self.get_health(name)
    conn = We::Call::Connection.new(host: ENV["#{name}_URL"],
                                     timeout: (ENV["#{name}_CONNECTION_TIMEOUT"] || 3).to_f,
                                     open_timeout: (ENV["#{name}_CONNECTION_OPEN_TIMEOUT"] || 2.0).to_f) do |conn|
      conn.headers['Content-Type'] = 'application/json'
    end
    response = conn.get(ENV["OKCOMPUTER_INDEX_ENDPOINT"])

    JSON.parse(response.body).with_indifferent_access
  rescue => e
    Rails.logger.info(e)
    return "failed"
  end
end
