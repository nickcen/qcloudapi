module Qcloudapi
  module Module
    class Base < Qcloudapi::Common::Base
      # 发起接口请求
      protected
      def dispatchRequest(action, params, request_host, request_method, request_path)
        params['Action'] = action;

        response = Qcloudapi::Common::Request.send(params, request_host, request_method, request_path)

        handle_response(response)
      end

      # 处理返回      
      def handle_response(raw_response)
        if raw_response['code'] != 0
          self.set_error(raw_response['code'], raw_response['message'], raw_response['detail'])
          false
        else
          raw_response
        end
      end
    end
  end
end
