module Bypass
  class Filter
    attr_reader :content, :fragment
    
    URL_PATTERN = %r{
              (?: ((?:ed2k|ftp|http|https|irc|mailto|news|gopher|nntp|telnet|webcal|xmpp|callto|feed|svn|urn|aim|rsync|tag|ssh|sftp|rtsp|afs|file):)// | www\. )
              [^\s<\u00A0"]+
            }ix

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
			text.gsub(URL_PATTERN) do |url|	
				url = "http://" + url unless (url.match(/^http:\/\//i) || url.match(/^https:\/\//i))
				yield(url.to_s)
			end
	    end

	    def parse_uri(uri)
	      Bypass::URI.parse(uri.to_s.strip)
	    rescue => ex
	      nil
	    end

  	end
end