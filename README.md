### qcloudapi

qcloudapi是为了让Ruby开发者能够在自己的代码里更快捷方便的使用腾讯云的API而开发的SDK工具包。

#### 更新历史

* [08/21/15] 添加云搜模块

#### 资源

* [公共参数](http://wiki.qcloud.com/wiki/%E5%85%AC%E5%85%B1%E5%8F%82%E6%95%B0)
* [API列表](http://wiki.qcloud.com/wiki/API)
* [错误码](http://wiki.qcloud.com/wiki/%E9%94%99%E8%AF%AF%E7%A0%81)

#### 入门

1. 申请安全凭证。
在第一次使用云API之前，用户首先需要在腾讯云网站上申请安全凭证，安全凭证包括 SecretId 和 SecretKey, SecretId 是用于标识 API 调用者的身份，SecretKey是用于加密签名字符串和服务器端验证签名字符串的密钥。SecretKey 必须严格保管，避免泄露。

2. 下载SDK，放入到您的程序目录。
使用方法请参考下面的例子。

#### 例子
    require 'qcloudapi'

    Qcloudapi.secret_id = '你的secretId'
    Qcloudapi.secret_key = '你的secretKey'
    
    
    // 请求参数，请参考wiki文档上对应接口的说明
    params = {:appId => 1, :op_type => 'add', 'contents.0.name' => 'test'}
    
    service = Qcloudapi::Module::Yunsou.new

    // 请求方法为对应接口的接口名，请参考wiki文档上对应接口的接口名
    result = service.DataManipulation(params)
    
    if (result == false) {
        // 请求失败，解析错误信息
        error = service->getError();
        puts "Error code: #{error.code} message: #{error.message}"
    } else {
        // 请求成功
        puts result
    }