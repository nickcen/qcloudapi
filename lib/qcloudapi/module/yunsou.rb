module Qcloudapi
  module Module
    class Yunsou < Qcloudapi::Module::Base
      ['DataManipulation', 'DataSearch'].each do |action|
        define_method action do |params|
          self.dispatchRequest(action, params, 'yunsou.api.qcloud.com', 'GET', '/v2/index.php')
        end
      end
    end
  end
end
