module Qcloudapi
  module Common
    class Request
      @@version = 'SDK_RUBY_1.0.0';

      
      # 发起请求
      def self.send(params, request_host, request_method, request_path)
        ts = Time.now.to_i
        params['SecretId'] = Qcloudapi.secret_id
        params['Timestamp'] = ts
        params['Nonce'] = ts % 10000
        params['RequestClient'] = @@version

        plain_text = Qcloudapi::Common::Sign.make_sign_plain_text(request_host, params, request_method, request_path)

        params['Signature'] = Qcloudapi::Common::Sign.sign(plain_text, Qcloudapi.secret_key)

        url = "https://#{request_host}#{request_path}"
        if (request_method == 'GET') 
          result = RestClient.get url, {:params => params}
        else
          # TODO
        end

        JSON.parse(result)
      end
    end
  end
end
