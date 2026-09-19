namespace Yrm100.Protocol;

/// <summary>Decoded tag data from an inventory response.</summary>
public sealed record RfidTag(byte[] Pc, byte[] Epc, byte[] Crc, sbyte Rssi)
{
    public string EpcHex => Convert.ToHexString(Epc);
    public string CrcHex => Convert.ToHexString(Crc);
}

/// <summary>Decodes the inventory response layout used by the existing C# sample.</summary>
public static class InventoryDecoder
{
    public static RfidTag? TryDecode(ReadOnlySpan<byte> frame)
    {
        if (frame.Length < 10 || (frame[0] != R200Protocol.Header && frame[0] != Yrm1002Protocol.Header) ||
            (frame[^1] != R200Protocol.Footer && frame[^1] != Yrm1002Protocol.Footer)) return null;
        var pcLengthBits = frame[6];
        var pcAndEpcLength = (pcLengthBits / 8 + 1) * 2;
        var epcLength = pcAndEpcLength - 2;
        var epcStart = 8;
        var crcStart = epcStart + epcLength;
        if (crcStart + 2 >= frame.Length) return null;
        return new RfidTag(frame.Slice(6, 2).ToArray(), frame.Slice(epcStart, epcLength).ToArray(),
            frame.Slice(crcStart, 2).ToArray(), unchecked((sbyte)frame[5]));
    }
}