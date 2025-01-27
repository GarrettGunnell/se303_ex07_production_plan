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
      @asia.producers[0].production = 20

      assert_equal(@asia.shortfall, -6)
      assert_equal(@asia.profit, 292)
    end

    it "can have no demand" do
      @asia.demand = 0

      assert_equal(@asia.shortfall, -25)
      assert_equal(@asia.profit, 0)
    end

    it "can have negative demand" do
      @asia.demand = -1

      assert_equal(@asia.shortfall, -26)
      assert_equal(@asia.profit, -10)
    end
  end

  describe "No producers" do
    before do
      data = {
        name: "No producers",
        producers: [],
        demand: 30,
        price: 20
      }

      @noProducers = Province.new(data)
    end

    it "calculate shortfall" do
      assert_equal(@noProducers.shortfall, 30)
    end

    it "calculates profit" do
      assert_equal(@noProducers.profit, 0)
    end
  end
end
