module Qcloudapi
  module Common
    class Error
      attr_accessor :code, :message, :ext

      def initialize(code, message, ext)
        @code = code
        @message = message
        @ext = ext
      end
    end
  end
end
