using Yrm100.Protocol;

namespace Yrm100.Protocol.Tests;

public sealed class R200ProtocolTests
{
    [Fact]
    public void ReadSingleMatchesArduinoCommand()
    {
        Assert.Equal(new byte[] { 0xAA, 0x00, 0x22, 0x00, 0x00, 0x22, 0xDD }, R200Protocol.ReadSingle());
    }

    [Fact]
    public void ReadMultiCalculatesChecksum()
    {
        Assert.Equal(new byte[] { 0xAA, 0x00, 0x27, 0x00, 0x03, 0x22, 0xFF, 0xFF, 0x4A, 0xDD }, R200Protocol.ReadMulti());
    }

    [Fact]
    public void WriteEpcIncludesCurrentCrcAndChecksum()
    {
        var frame = R200Protocol.WriteEpc([0x12, 0x34], "ALALTECTESTCDE"u8);

        Assert.Equal(32, frame.Length);
        Assert.Equal(new byte[] { 0x12, 0x34 }, frame[14..16]);
        Assert.Equal(0xDD, frame[^1]);
        Assert.Equal(R200Protocol.Checksum(frame.AsSpan(1, 29)), frame[30]);
    }

    [Fact]
    public void ParserHandlesSplitFrames()
    {
        var parser = new FrameParser();
        var expected = R200Protocol.ReadSingle();

        Assert.Empty(parser.Push(expected.AsSpan(0, 3)));
        var frames = parser.Push(expected.AsSpan(3)).ToArray();

        Assert.Single(frames);
        Assert.Equal(expected, frames[0]);
    }
}