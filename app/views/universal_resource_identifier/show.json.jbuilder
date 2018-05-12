json.(@uri, :long_url, :short_url_id, :created_at, :updated_at)
json.hits @uri.hits.where(['created_at >= ?', (Time.now - 1.week)]), :browser, :version, :platform, :ip_address, :latitude, :longitude, :bot_hit, :http_referer, :created_at, :updated_at