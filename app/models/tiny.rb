class Tiny < ApplicationRecord
  validate :validate_url
  before_save :randomize_short

  def short_url
    "http://localhost:3000/#{short}"
  end

  protected
  def validate_url
    if !valid_url?(long)
      errors.add(:long, "invalid url")
    end
  end

  def valid_url?(uri)
    (uri = URI.parse(uri)) && uri.host
  rescue URI::InvalidURIError
    false
  end

  def randomize_short
    # Min 4 chars
    length = 4
    while (generated_url = SecureRandom.hex(length)) && Tiny.where(short: generated_url).count > 0
      # increase the length and try again
      length += 1
    end
    self.short = generated_url
  end
end
