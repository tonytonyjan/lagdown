module LagdownRenderer
  class << self
    def render source
      RDiscount.new(source, :no_superscript).to_html
    end
  end
end