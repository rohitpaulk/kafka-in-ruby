require_relative "test_helper"
require "minitest/autorun"

class ProtocolWriterTest < Minitest::Test
  def setup
    @io = StringIO.new
  end

  def test_write_int32
    ProtocolWriter.write_int32(@io, 42)
    assert_equal "\x00\x00\x00\x2A", @io.string
  end

  def test_write_int16
    ProtocolWriter.write_int16(@io, 300)
    assert_equal "\x01\x2C", @io.string
  end

  def test_write_unsigned_varint_single_byte
    io = StringIO.new
    ProtocolWriter.write_unsigned_varint(io, 1)
    assert_equal "\x01", io.string
  end

  def test_write_unsigned_varint_double_byte
    io = StringIO.new
    ProtocolWriter.write_unsigned_varint(io, 150)
    assert_equal "\x96\x01", io.string
  end

  def test_write_unsigned_varint_zero
    ProtocolWriter.write_unsigned_varint(@io, 0)
    assert_equal "\x00", @io.string
  end

  # def test_write_unsigned_varint_large_number
  #   ProtocolWriter.write_unsigned_varint(@io, 1234567)
  #   assert_equal "\xA7\x86\x68", @io.string
  # end
end
