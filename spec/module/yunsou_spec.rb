require 'spec_helper'

describe Qcloudapi::Module::Yunsou do
  let(:response) do 
    JSON.generate({
      retcode: 0,
      errmsg: "succ",
      data: {
        app_id: 14950002,
        result: [{
          doc_id: "1000",
          errno: 0,
          result: "succ"
        }],
        seq: 1427872563,
        total_result: "succ"
      },
      code: 0,
      message: ""
    })
  end

  it 'add doc' do
    Qcloudapi.secret_id = 'secret_id'
    Qcloudapi.secret_key = 'secret_key'

    params = {:appId => 1, :op_type => 'add', 'contents.0.name' => 'test'}
    expect(Time).to receive(:now).and_return(Time.at(1440205640))
    expect(RestClient).to receive(:get).with('https://yunsou.api.qcloud.com/v2/index.php', {:params=>{:appId=>1, :op_type=>"add", "contents.0.name"=>"test", "Action"=>"DataManipulation", "SecretId"=>"secret_id", "Timestamp"=>1440205640, "Nonce"=>5640, "RequestClient"=>"SDK_RUBY_1.0.0", "Signature"=>"uxWWHj0TcLlyFiHabKl5OiunGmc="}}).and_return(response)

    service = Qcloudapi::Module::Yunsou.new
    result = service.DataManipulation(params)
    expect(result['code']).to eq(0)
  end
end
