Bundler.setup :default, :test

require "minitest/spec"
require "mocha"

class MiniTest::Unit::TestCase
end

MiniTest::Unit.autorun
