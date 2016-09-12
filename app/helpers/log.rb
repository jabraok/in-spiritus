class Log

  def self.info message
    message = self.format_message message
    Rails.logger.info message
  end

  def self.error message
    message = self.format_message message
    Rails.logger.error message
  end

  def self.alert message
    self.error message
    self.alert_slack message
  end

  private
  def self.format_message message
    "#{ Time.now.strftime("%Y/%m/%d %H:%M:%S") } #{ message }"
  end

  def self.alert_slack message
    uri = URI.parse("https://hooks.slack.com/services/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")
    header = {
      'Content-Type': 'application/json'
    }
    data = { text: message }

    # Create the HTTP objects
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, header)
    request.body = JSON.generate(data)

    # Send the request
    http.request(request)
  end
end
