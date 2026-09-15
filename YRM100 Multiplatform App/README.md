# YRM100 Multiplatform Reader

This project is a modern replacement for the Windows-only WinForms demo. It uses Avalonia and .NET 8 so the same application architecture can target macOS, Windows, Linux, and Android.

## Structure

- `src/Yrm100.Protocol`: platform-neutral R200/YRM100 frames, checksum, streaming parser, and inventory decoding.
- `src/Yrm100.App`: Avalonia shell and desktop serial transport. Android transport should be supplied through the same transport boundary using the Android USB host/Bluetooth implementation for the hardware in use.

The protocol implementation is based on the supplied Arduino sketch and the XML documentation shipped with the original C# demo. The write operation intentionally requires the tag's current two-byte CRC, matching the Arduino implementation and the supplied customer note.

## Build

Install the .NET 8 SDK, then from this directory run:

```text
dotnet restore
dotnet build YRM100.sln
dotnet run --project src/Yrm100.App/Yrm100.App.csproj -f net8.0
dotnet test tests/Yrm100.Protocol.Tests/Yrm100.Protocol.Tests.csproj
```

For Android, install the Android workload and use the `net8.0-android` target. The current shell demonstrates desktop serial communication; Android USB/Bluetooth access belongs in an Android-specific transport adapter and should not leak into `Yrm100.Protocol`.

## Hardware defaults

The desktop shell uses 115200 baud, 8 data bits, no parity, and one stop bit, matching the supplied Arduino code. Confirm the module configuration before changing the baud rate.