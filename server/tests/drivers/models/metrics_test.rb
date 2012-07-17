require 'minitest/autorun'

load File.join(File.dirname(__FILE__), '..', '..', '..', 'lib', 'deltacloud', 'models', 'base_model.rb')
load File.join(File.dirname(__FILE__), '..', '..', '..', 'lib', 'deltacloud', 'models', 'metric.rb')

describe Metric do

  before do
    @metric = Metric.new(:id => 'metric1', :entity => 'inst1')
  end

  it 'cat be extended by add_property' do
    @metric.add_property :network, { :max => 100, :min => 10, :avg => 50 }
    @metric.properties.wont_be_empty
    @metric.properties.each do |p|
      p.must_be_kind_of Metric::Property
    end
  end

end
