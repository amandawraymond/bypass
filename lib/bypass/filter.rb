module Bypass
  class Filter
    attr_reader :content, :fragment
    
    URL_PATTERN = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[\-;:&=\+\$,\w]+@)?[A-Za-z0-9\.\-]+|(?:www\.|[\-;:&=\+\$,\w]+@)[A-Za-z0-9\.\-]+)((?:\/[\+~%\/\.\w\-]*)?\??(?:[\-\+=&;%@\.\w]*)#?(?:[\.\!\/\\\w]*))?)/g;
    
    def initialize(content, options = {})
      @content = content.to_s.encode("UTF-8")
      @fragment = options.fetch(:fragment, true)
    end

    def replace
      raise NotImplementedError
    end
    
    def to_s
      content
    end
  
  private
  
    def gsub_urls(text, &block)
      text.gsub(URL_PATTERN) do |match|
        yield(match.to_s)
      end
    end

    def parse_uri(uri)
      Bypass::URI.parse(uri.to_s.strip)
    rescue => ex
      nil
    end
  end
end