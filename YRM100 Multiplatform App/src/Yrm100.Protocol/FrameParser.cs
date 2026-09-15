namespace Yrm100.Protocol;

/// <summary>Incrementally extracts binary frames from arbitrary serial read chunks.</summary>
public sealed class FrameParser
{
    private readonly List<byte> buffer = [];

    public IEnumerable<byte[]> Push(ReadOnlySpan<byte> bytes)
    {
        foreach (var value in bytes) buffer.Add(value);

        while (true)
        {
            var start = buffer.IndexOf(R200Protocol.Header);
            if (start < 0) { buffer.Clear(); yield break; }
            if (start > 0) buffer.RemoveRange(0, start);
            if (buffer.Count < 7) yield break;

            var payloadLength = (buffer[3] << 8) | buffer[4];
            var frameLength = 5 + payloadLength + 2;
            if (frameLength < 7 || frameLength > 1024) { buffer.RemoveAt(0); continue; }
            if (buffer.Count < frameLength) yield break;
            if (buffer[frameLength - 1] != R200Protocol.Footer) { buffer.RemoveAt(0); continue; }

            var frame = buffer.Take(frameLength).ToArray();
            buffer.RemoveRange(0, frameLength);
            if (R200Protocol.Checksum(frame.AsSpan(1, frameLength - 3)) == frame[^2]) yield return frame;
        }
    }
}