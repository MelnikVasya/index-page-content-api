module StubRequest
  HEADERS = {
    'Accept'=>'*/*',
    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    'User-Agent'=>'Ruby'
  }

  def setup
    stub_request(:get, 'http://empty.example.com/').with(headers: HEADERS).to_return(status: 200)
    stub_request(:get, 'http://invalid.example.com/').with(headers: HEADERS).to_return(status: 404)
    stub_request(:get, 'http://example.com/').with(headers: HEADERS).to_return(
      status: 200, body: "<h1>Example Domain</h1><a href='http://www.iana.org/domains/example' />"
    )
  end
end
