gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/province'
require_relative '../lib/data'

class ProvinceTest < Minitest::Test

  describe Province do
    it "knows its shortfall" do
      asia = Province.new(sample_province_data)
      assert_equal(5, asia.shortfall)
    end

    it "knows its profit" do
      asia = Province.new(sample_province_data)
      assert_equal(asia.profit, 230)
    end
  end
end
