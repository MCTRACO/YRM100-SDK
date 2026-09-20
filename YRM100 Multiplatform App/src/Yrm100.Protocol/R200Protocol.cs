namespace Yrm100.Protocol;

/// <summary>Builds and validates the binary protocol used by the YRM100/R200 module.</summary>
public static class R200Protocol
{
    public const byte Header = 0xAA;
    public const byte Footer = 0xDD;
    public const byte CommandReadSingle = 0x22;
    public const byte CommandReadMulti = 0x27;
    public const byte CommandStopRead = 0x28;
    public const byte CommandSetSerial = 0x11;
    public const byte CommandWriteMemory = 0x49;

    public static byte[] ReadSingle() => [Header, 0x00, CommandReadSingle, 0x00, 0x00, 0x22, Footer];

    public static byte[] ReadMulti(ushort loopCount = 0xFFFF)
    {
        var frame = new byte[] { Header, 0x00, CommandReadMulti, 0x00, 0x03, 0x22,
            (byte)(loopCount >> 8), (byte)loopCount, 0x00, Footer };
        frame[^2] = Checksum(frame.AsSpan(1, frame.Length - 3));
        return frame;
    }

    public static byte[] StopRead() => [Header, 0x00, CommandStopRead, 0x00, 0x00, 0x28, Footer];

    public static byte[] SetSerial(byte highByte, byte lowByte)
    {
        var frame = new byte[] { Header, 0x00, CommandSetSerial, 0x00, 0x02, 0x00, highByte, lowByte, Footer };
        frame[^2] = Checksum(frame.AsSpan(1, frame.Length - 3));
        return frame;
    }

    /// <summary>
    /// Creates the 32-byte EPC write command used by the Arduino sample.
    /// The tag's current CRC is required because it is part of the write payload.
    /// </summary>
    public static byte[] WriteEpc(ReadOnlySpan<byte> currentCrc, ReadOnlySpan<byte> epc,
        byte memoryBank = 0x01, uint accessPassword = 0)
    {
        if (currentCrc.Length != 2) throw new ArgumentException("The current tag CRC must contain two bytes.", nameof(currentCrc));
        if (epc.Length != 14) throw new ArgumentException("The EPC must contain 14 bytes.", nameof(epc));

        var frame = new byte[32];
        frame[0] = Header;
        frame[2] = CommandWriteMemory;
        frame[4] = 0x19;
        frame[5] = (byte)(accessPassword >> 24);
        frame[6] = (byte)(accessPassword >> 16);
        frame[7] = (byte)(accessPassword >> 8);
        frame[8] = (byte)accessPassword;
        frame[9] = memoryBank;
        frame[13] = 0x08;
        currentCrc.CopyTo(frame.AsSpan(14, 2));
        epc.CopyTo(frame.AsSpan(16, 14));
        frame[30] = Checksum(frame.AsSpan(1, 29));
        frame[31] = Footer;
        return frame;
    }

    /// <summary>Returns the least-significant byte of the sum of the supplied bytes.</summary>
    public static byte Checksum(ReadOnlySpan<byte> bytes)
    {
        var sum = 0;
        foreach (var value in bytes) sum = (sum + value) & 0xFF;
        return (byte)sum;
    }
}

/// <summary>YRM1002 command frames documented by the supplied SDK reference.</summary>
public static class Yrm1002Protocol
{
    public const byte Header = 0xBB;
    public const byte Footer = 0x7E;
    public const byte CommandReadSingle = 0x22;
    public const byte CommandReadMulti = 0x27;
    public const byte CommandStopRead = 0x28;
    public const byte CommandWriteData = 0x49;
    public const byte CommandKill = 0x65;
    public const byte CommandSetPower = 0xB6;

    public static byte[] ReadSingle() => Build(CommandReadSingle, []);

    public static byte[] ReadMulti(ushort loopCount = 0x2710) =>
        Build(CommandReadMulti, [0x22, (byte)(loopCount >> 8), (byte)loopCount]);

    public static byte[] StopRead() => Build(CommandStopRead, []);

    /// <summary>Sets PA output power in dBm times 100, as required by the YRM1003 SDK.</summary>
    public static byte[] SetPower(double powerDbm)
    {
        if (powerDbm is < 0 or > 30) throw new ArgumentOutOfRangeException(nameof(powerDbm), "Power must be between 0 and 30 dBm.");
        var scaled = (ushort)Math.Round(powerDbm * 100, MidpointRounding.AwayFromZero);
        return Build(CommandSetPower, [(byte)(scaled >> 8), (byte)scaled]);
    }

    /// <summary>Writes whole 16-bit words to a tag memory bank.</summary>
    public static byte[] WriteData(ReadOnlySpan<byte> accessPassword, byte memoryBank,
        ushort startAddress, ReadOnlySpan<byte> data)
    {
        if (accessPassword.Length != 4) throw new ArgumentException("The access password must contain four bytes.", nameof(accessPassword));
        if (data.Length == 0 || data.Length % 2 != 0) throw new ArgumentException("Write data must contain one or more whole words.", nameof(data));

        var payload = new byte[9 + data.Length];
        accessPassword.CopyTo(payload);
        payload[4] = memoryBank;
        payload[5] = (byte)(startAddress >> 8);
        payload[6] = (byte)startAddress;
        payload[7] = (byte)(data.Length / 2 >> 8);
        payload[8] = (byte)(data.Length / 2);
        data.CopyTo(payload.AsSpan(9));
        return Build(CommandWriteData, payload);
    }

    public static byte[] Kill(ReadOnlySpan<byte> killPassword)
    {
        if (killPassword.Length != 4) throw new ArgumentException("The kill password must contain four bytes.", nameof(killPassword));
        return Build(CommandKill, killPassword);
    }

    private static byte[] Build(byte command, ReadOnlySpan<byte> payload)
    {
        var frame = new byte[7 + payload.Length];
        frame[0] = Header;
        frame[2] = command;
        frame[3] = (byte)(payload.Length >> 8);
        frame[4] = (byte)payload.Length;
        payload.CopyTo(frame.AsSpan(5));
        frame[^2] = R200Protocol.Checksum(frame.AsSpan(1, frame.Length - 3));
        frame[^1] = Footer;
        return frame;
    }
}