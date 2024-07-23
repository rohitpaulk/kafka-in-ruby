class ProtocolReader
  def self.read_int32(io)
    io.read(4).unpack1("l>") # 4-byte signed integer
  end

  def self.read_int16(io)
    io.read(2).unpack1("s>") # 2-byte signed integer
  end

  def self.read_nullable_string(io)
    length = read_int16(io)

    (length == -1) ? nil : io.read(length)
  end
end
