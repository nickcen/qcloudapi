require 'rest-client'
require 'Base64'

require File.dirname(__FILE__) + '/qcloudapi/version'
require File.dirname(__FILE__) + '/qcloudapi/common/base'
require File.dirname(__FILE__) + '/qcloudapi/common/error'
require File.dirname(__FILE__) + '/qcloudapi/common/request'
require File.dirname(__FILE__) + '/qcloudapi/common/sign'
require File.dirname(__FILE__) + '/qcloudapi/module/base'
require File.dirname(__FILE__) + '/qcloudapi/module/yunsou'

module Qcloudapi
  class << self
    attr_accessor :secret_id, :secret_key
  end
end
