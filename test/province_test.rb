gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/province'
require_relative '../lib/data'

class ProvinceTest < Minitest::Test

  describe Province do
    before { @asia = Province.new(sample_province_data) }

    it "knows its shortfall" do
      assert_equal(5, @asia.shortfall)
    end

    it "knows its profit" do
      assert_equal(@asia.profit, 230)
    end
  end
end
