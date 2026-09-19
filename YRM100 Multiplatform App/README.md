# YRM100 Multiplatform Reader

This project is a modern replacement for the Windows-only WinForms demo. It uses Avalonia and .NET 10 so the same application architecture can target macOS, Windows, Linux, and Android.

## Structure

- `src/Yrm100.Protocol`: platform-neutral R200/YRM100 frames, checksum, streaming parser, and inventory decoding.
- `src/Yrm100.App`: Avalonia shell and serial transport boundary. Desktop uses `System.IO.Ports`; Android uses the `IAndroidUsbSerialTransport` seam for USB Host access.

The protocol implementation is based on the supplied Arduino sketch and the XML documentation shipped with the original C# demo. The write operation intentionally requires the tag's current two-byte CRC, matching the Arduino implementation and the supplied customer note.

## Build

Install the .NET 10 SDK and Android workload, then from this directory run:

```text
dotnet restore
dotnet build YRM100.sln
dotnet run --project src/Yrm100.App/Yrm100.App.csproj -f net8.0
dotnet test tests/Yrm100.Protocol.Tests/Yrm100.Protocol.Tests.csproj
```

To create a macOS application bundle for the current machine:

```text
./macos/package.sh
open "dist/YRM100 Reader.app"
```

Set `ARCHITECTURE=x86_64` when packaging for an Intel Mac. The default is the current machine architecture. This bundle requires the .NET 10 runtime on the target Mac. Signing and notarization are intentionally left to the deployment environment.
For Android, use the `net10.0-android36.0` target. The app uses Android USB Host directly for CH340 and CP210x devices: it requests permission, claims the bulk interface, configures 115200/8/N/1, and forwards received bytes through `DataReceived`.

## Hardware defaults

The desktop shell uses 115200 baud, 8 data bits, no parity, and one stop bit, matching the supplied Arduino code. Confirm the module configuration before changing the baud rate.

On macOS, CH340 ports commonly appear as `/dev/cu.wchusbserial*` and CP210x ports as `/dev/cu.SLAB_USBtoUART`. On Windows they appear as `COM*`; on Linux they commonly appear as `/dev/ttyUSB*`. The port catalog prioritizes these names while still showing every detected port.

On Android, enable USB Host support on the device. When the adapter is connected, select its USB device in the app, approve the permission dialog, press **Connect** again, and then use the reader controls.