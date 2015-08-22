module Qcloudapi
  module Common
    class Base
      attr_accessor :error
      
      # 设置错误信息
      def set_error(code, message, ext = '')
        @error = Qcloudapi::Common::Error.new(code, message, text)
      end
    end
  end
end
