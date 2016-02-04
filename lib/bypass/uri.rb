# require "addressable/uri"

# module Bypass
#   class URI < Addressable::URI
    
#     URIREGEX = /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[\-;:&=\+\$,\w]+@)?[A-Za-z0-9\.\-]+|(?:www\.|[\-;:&=\+\$,\w]+@)[A-Za-z0-9\.\-]+)((?:\/[\+~%\/\.\w\-]*)?\??(?:[\-\+=&;%@\.\w]*)#?(?:[\.\!\/\\\w]*))?)/g;

#     def append_to_query_values(params = {})
#       pairs = params.keys.map do |raw_key|
#         key = CGI.escape(raw_key.to_s)
#         val = CGI.escape(params[raw_key])
#         [key, val].join("=")
#       end

#       pairs.unshift(query) if query
#       self.query = pairs.join("&")
#     end
#   end
# end
