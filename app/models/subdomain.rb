class Subdomain
  BLACK_LIST = %w[www admin api xdite]
  def self.matches?(request)
    request.subdomain.present? && !BLACK_LIST.include?(request.subdomain)
  end
end