class ProtocolWriter
  def self.write_int32(io, value)
    io.write([value].pack("l>")) # 4-byte signed integer
  end

  def self.write_int16(io, value)
    io.write([value].pack("s>")) # 2-byte signed integer
  end

  def self.write_unsigned_varint(io, value)
    # If the original value is 0, write a single zero byte
    if value.zero?
      io.write([0].pack("C"))
      return
    end

    while value > 0
      byte = value & 0b01111111 # Extract the 7 least significant bits
      value >>= 7 # Shift the value right by 7 bits

      # If there are more bits to encode, set the continuation bit
      if value > 0
        byte |= 0b10000000
      end

      io.write([byte].pack("C")) # Write byte
    end
  end

  # TODO: Verify this
  # def self.write_nullable_string(io, value)
  #   length = value ? value.length : -1
  #   write_int16(io, length)
  #   io.write(value) if length != -1
  # end
end
