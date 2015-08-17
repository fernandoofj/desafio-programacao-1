require 'test_helper'

module ParserTest

  class StreamParserTest < ActiveSupport::TestCase

    TABBED_INPUT = "H1\tH2\t\t\H3\nR1H1\tR1H2\t\tR1H3\nR2H1\tR2H2\tR2H3"
    CSV_INPUT = "H1,H2,H3\nR1H1,R1H2,R1H3\nR2H1,R2H2,R2H3"

    test "initialize" do
      Parser::StreamParser.new(StringIO.new)
    end

    test "empty input" do
      parser = Parser::StreamParser.new(StringIO.new)
      parser.parse {
        flunk "Block should not have been called for empty input"
      }
    end

    test "parse with default separator" do
      parser = Parser::StreamParser.new(StringIO.new(TABBED_INPUT))
      count = 0
      parser.parse { |line|
        assert_equal 3, line.size, "Expected three columns per line"
        count += 1
      }
      assert_equal 2, count, "Expected two lines"
    end

    test "parse with another separator" do
      parser = Parser::StreamParser.new(StringIO.new(CSV_INPUT),",")
      count = 0
      parser.parse { |line|
        assert_equal 3, line.size, "Expected three columns per line"
        count += 1
      }
      assert_equal 2, count, "Expected two lines"
    end

    test "parse including header" do
      parser = Parser::StreamParser.new(StringIO.new(TABBED_INPUT),/\t+/,false)
      count = 0
      parser.parse { |line|
        assert_equal 3, line.size, "Expected three columns per line"
        count += 1
      }
      assert_equal 3, count, "Expected three lines"
    end
  end
end
