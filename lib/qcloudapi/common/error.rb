module Qcloudapi
  module Common
    class Error
      attr_accessor :code, :message, :text

      def initialize(code, message, text)
        @code = code
        @message = message
        @text = text
      end
    end
  end
end
