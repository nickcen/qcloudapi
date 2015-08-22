require 'spec_helper'

describe Qcloudapi::Common::Sign do
  let(:expected_plain_text) do 
    'GETtest_host/v2/index.php?a=1&b=2&c.d=3'
  end

  let(:secret_key) do 
    'testkey'
  end

  let(:expected_sign) do 
    '3FBje0jx9qyB6RfVYcQhgNRuIdI='
  end

  it 'make_sign_plain_text' do
    params = {'a' => 1, 'b' => 2, 'c_d' => 3}

    plain_text = Qcloudapi::Common::Sign.make_sign_plain_text('test_host', params)
    expect(plain_text).to eq(expected_plain_text)
  end

  it 'sign the string' do
    sign = Qcloudapi::Common::Sign.sign(expected_plain_text, secret_key)
    expect(sign).to eq(expected_sign)
  end
end
