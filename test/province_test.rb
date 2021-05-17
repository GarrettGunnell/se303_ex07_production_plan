gem 'minitest', '~> 5.4'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/province'
require_relative '../lib/data'

class ProvinceTest < Minitest::Test

  describe Province do
    before { @asia = Province.new(sample_province_data) }

    it "calculates shortfall" do
      assert_equal(5, @asia.shortfall)
    end

    it "calculates profit" do
      assert_equal(@asia.profit, 230)
    end

    it "can change production" do
      @asia.producers[0].production = 20;

      assert_equal(@asia.shortfall, -6);
      assert_equal(@asia.profit, 292);
    end
  end
end
