require 'yaml'
require 'tempfile'
require_relative '../../app'

RSpec.configure do |config|
  config.mock_framework = :rspec
end

module Helpers
  def self.config_file
      a = <<EOF
--- !ruby/object:PostBuilder
post_id: 1
title: Fast
tags:
author:
featured: true
summary:
long_read:
post_date: 2014-01-10
link: "fast"
partial: "partials/posts/test_post"

--- !ruby/object:PostBuilder
post_id: 2
title: Fast
tags:
author:
featured: true
summary:
long_read:
post_date: 2014-01-10
link: "fast"
partial: "partials/posts/test_post"
EOF
  end
end