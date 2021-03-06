require "yaml"
require "config/hash"
require "../../i18n"
require "../backend"

module I18n
  module Backend
    class Hash < Base
      # constructor
      def initialize(data = {} of String => String : ::Hash)
        @_data = ::Config::Hash.new(data)
      end

      def load(data : ::Hash)
        @_data = ::Config::Hash.new(data)

        return self
      end

      # lookup for the key and return the value
      def lookup(locale : String, key : String)
        if (!@_data[locale])
          return
        end

        return @_data.get("#{locale}.#{key}")
      end

      # return the available locales
      def available_locales
        return @_data.to_h.keys
      end
    end
  end

  def from_hash(default_locale : String, data : ::Hash)
    return self.new_object(default_locale, Backend::Hash.new(data))
  end
end
