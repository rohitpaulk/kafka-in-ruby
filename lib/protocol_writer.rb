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

  # Represents a sequence of characters or null. For non-null strings, first
  # the length N is given as an INT16. Then N bytes follow which are the UTF-8
  # encoding of the character sequence. A null value is encoded with length of
  # -1 and there are no following bytes.
  def self.write_nullable_string(io, value)
    if value.nil?
      write_int16(io, -1)
      return
    end

    write_int16(io, value.bytesize)
    io.write(value)
  end
end
