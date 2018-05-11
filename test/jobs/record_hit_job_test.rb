require 'test_helper'

class RecordHitJobTest < ActiveJob::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'hit is being created' do
    url = universal_resource_identifiers(:first_one)
    assert_equal 0, url.hits.count

    user_agent = UserAgent.parse('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.56 Safari/536.5')

    RecordHitJob.perform_now(url, {ip_address: '172.217.31.14',
                                   bot_hit: false,
                                   http_referer: nil,
                                   browser: user_agent.browser,
                                   version: user_agent.version.to_s,
                                   platform: user_agent.platform,
                                   request_dump: 'some large request dump'})

    assert_equal 1, url.hits.count
    assert_equal '172.217.31.14', url.hits.take.ip_address
    assert_equal 'Chrome', url.hits.take.browser
    assert_equal '19.0.1084.56', url.hits.take.version
    assert_equal 'Macintosh', url.hits.take.platform
  end

end
