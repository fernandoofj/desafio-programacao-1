require 'test_helper'

class OrderImportServiceTest < ActiveSupport::TestCase
  
  FILE = File.expand_path(File.dirname(__FILE__) + '/../resources/sample.tab')
  
  test "new service has no orders" do
    
    service = Import::OrderImportService.new(StringIO.new())
    
    assert service.orders.empty?
    assert_equal 0, service.total
  end
  
  test "import sample" do
    File.open(FILE) do |stream|
      service = Import::OrderImportService.new(stream)
      service.import
      assert_equal 5, service.orders.size
      assert_equal 99.0, service.total
    end
  end
end