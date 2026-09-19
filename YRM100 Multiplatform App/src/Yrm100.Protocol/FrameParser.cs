namespace Yrm100.Protocol;

/// <summary>Incrementally extracts binary frames from arbitrary serial read chunks.</summary>
public sealed class FrameParser
{
    private readonly List<byte> buffer = [];
    private readonly byte header;
    private readonly byte footer;

    public FrameParser(byte header = R200Protocol.Header, byte footer = R200Protocol.Footer)
    {
        this.header = header;
        this.footer = footer;
    }

    public IReadOnlyList<byte[]> Push(ReadOnlySpan<byte> bytes)
    {
        var frames = new List<byte[]>();
        foreach (var value in bytes) buffer.Add(value);

        while (true)
        {
            var start = buffer.IndexOf(header);
            if (start < 0) { buffer.Clear(); return frames; }
            if (start > 0) buffer.RemoveRange(0, start);
            if (buffer.Count < 7) return frames;

            var payloadLength = (buffer[3] << 8) | buffer[4];
            var frameLength = 5 + payloadLength + 2;
            if (frameLength < 7 || frameLength > 1024) { buffer.RemoveAt(0); continue; }
            if (buffer.Count < frameLength) return frames;
            if (buffer[frameLength - 1] != footer) { buffer.RemoveAt(0); continue; }

            var frame = buffer.Take(frameLength).ToArray();
            buffer.RemoveRange(0, frameLength);
            if (R200Protocol.Checksum(frame.AsSpan(1, frameLength - 3)) == frame[^2]) frames.Add(frame);
        }
    }
}