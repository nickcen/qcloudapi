module Qcloudapi
  module Common
    # 签名类
    class Sign
      # 生成签名
      def self.sign(src_str, secret_key, method = 'HmacSHA1')
        case method
        when 'HmacSHA1'
          digest = OpenSSL::Digest.new('sha1')
          signStr = Base64.strict_encode64("#{OpenSSL::HMAC.digest(digest, secret_key, src_str)}")
        else
          throw new Exception("#{method} is not a supported encrypt method");
        end
      end

      # 生成拼接签名源文字符串
      def self.make_sign_plain_text(request_host, request_params, request_method = 'GET', request_path = '/v2/index.php')
        param_str = request_params.map do |k, v|
          key = k.to_s.gsub('_', '.') 
          "#{key}=#{v.to_s}"
        end.compact.sort.join('&')
        
        "#{request_method}#{request_host}#{request_path}?#{param_str}"
      end
    end
  end
end
