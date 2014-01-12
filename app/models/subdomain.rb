class Subdomain
  def self.matches?(request)
    request.subdomain.present? && !Blog::SUBDOMAIN_BLACK_LIST.include?(request.subdomain)
  end
end