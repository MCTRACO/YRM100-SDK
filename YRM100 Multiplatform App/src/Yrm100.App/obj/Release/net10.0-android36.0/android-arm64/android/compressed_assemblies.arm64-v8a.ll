; ModuleID = 'compressed_assemblies.arm64-v8a.ll'
source_filename = "compressed_assemblies.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.CompressedAssemblyDescriptor = type {
	i32, ; uint32_t uncompressed_file_size
	i1, ; bool loaded
	i32 ; uint32_t buffer_offset
}

@compressed_assembly_count = dso_local local_unnamed_addr constant i32 64, align 4

@compressed_assembly_descriptors = dso_local local_unnamed_addr global [64 x %struct.CompressedAssemblyDescriptor] [
	%struct.CompressedAssemblyDescriptor {
		i32 2560, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 0; uint32_t buffer_offset
	}, ; 0: _Microsoft.Android.Resource.Designer
	%struct.CompressedAssemblyDescriptor {
		i32 1334272, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2560; uint32_t buffer_offset
	}, ; 1: Avalonia.Base
	%struct.CompressedAssemblyDescriptor {
		i32 676864, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 1336832; uint32_t buffer_offset
	}, ; 2: Avalonia.Controls
	%struct.CompressedAssemblyDescriptor {
		i32 208384, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2013696; uint32_t buffer_offset
	}, ; 3: Avalonia.DesignerSupport
	%struct.CompressedAssemblyDescriptor {
		i32 188928, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2222080; uint32_t buffer_offset
	}, ; 4: Avalonia.Dialogs
	%struct.CompressedAssemblyDescriptor {
		i32 46080, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2411008; uint32_t buffer_offset
	}, ; 5: Avalonia.Markup.Xaml
	%struct.CompressedAssemblyDescriptor {
		i32 22528, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2457088; uint32_t buffer_offset
	}, ; 6: Avalonia.Markup
	%struct.CompressedAssemblyDescriptor {
		i32 13312, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2479616; uint32_t buffer_offset
	}, ; 7: Avalonia.Metal
	%struct.CompressedAssemblyDescriptor {
		i32 15360, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2492928; uint32_t buffer_offset
	}, ; 8: Avalonia.MicroCom
	%struct.CompressedAssemblyDescriptor {
		i32 55296, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2508288; uint32_t buffer_offset
	}, ; 9: Avalonia.OpenGL
	%struct.CompressedAssemblyDescriptor {
		i32 163840, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2563584; uint32_t buffer_offset
	}, ; 10: Avalonia.Vulkan
	%struct.CompressedAssemblyDescriptor {
		i32 4096, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2727424; uint32_t buffer_offset
	}, ; 11: Avalonia
	%struct.CompressedAssemblyDescriptor {
		i32 90112, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2731520; uint32_t buffer_offset
	}, ; 12: Avalonia.Android
	%struct.CompressedAssemblyDescriptor {
		i32 57856, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2821632; uint32_t buffer_offset
	}, ; 13: Avalonia.Remote.Protocol
	%struct.CompressedAssemblyDescriptor {
		i32 93696, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2879488; uint32_t buffer_offset
	}, ; 14: Avalonia.Skia
	%struct.CompressedAssemblyDescriptor {
		i32 560128, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 2973184; uint32_t buffer_offset
	}, ; 15: Avalonia.Themes.Fluent
	%struct.CompressedAssemblyDescriptor {
		i32 33792, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 3533312; uint32_t buffer_offset
	}, ; 16: HarfBuzzSharp
	%struct.CompressedAssemblyDescriptor {
		i32 14336, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 3567104; uint32_t buffer_offset
	}, ; 17: MicroCom.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 92672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 3581440; uint32_t buffer_offset
	}, ; 18: SkiaSharp
	%struct.CompressedAssemblyDescriptor {
		i32 55296, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 3674112; uint32_t buffer_offset
	}, ; 19: Xamarin.AndroidX.Activity
	%struct.CompressedAssemblyDescriptor {
		i32 323072, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 3729408; uint32_t buffer_offset
	}, ; 20: Xamarin.AndroidX.AppCompat
	%struct.CompressedAssemblyDescriptor {
		i32 415232, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4052480; uint32_t buffer_offset
	}, ; 21: Xamarin.AndroidX.Core
	%struct.CompressedAssemblyDescriptor {
		i32 39424, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4467712; uint32_t buffer_offset
	}, ; 22: Xamarin.AndroidX.DrawerLayout
	%struct.CompressedAssemblyDescriptor {
		i32 193024, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4507136; uint32_t buffer_offset
	}, ; 23: Xamarin.AndroidX.Fragment
	%struct.CompressedAssemblyDescriptor {
		i32 15872, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4700160; uint32_t buffer_offset
	}, ; 24: Xamarin.AndroidX.Lifecycle.Common
	%struct.CompressedAssemblyDescriptor {
		i32 16384, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4716032; uint32_t buffer_offset
	}, ; 25: Xamarin.AndroidX.Lifecycle.LiveData.Core
	%struct.CompressedAssemblyDescriptor {
		i32 25088, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4732416; uint32_t buffer_offset
	}, ; 26: Xamarin.AndroidX.Lifecycle.ViewModel
	%struct.CompressedAssemblyDescriptor {
		i32 35840, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4757504; uint32_t buffer_offset
	}, ; 27: Xamarin.AndroidX.Loader
	%struct.CompressedAssemblyDescriptor {
		i32 11776, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4793344; uint32_t buffer_offset
	}, ; 28: Xamarin.AndroidX.SavedState
	%struct.CompressedAssemblyDescriptor {
		i32 13312, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4805120; uint32_t buffer_offset
	}, ; 29: Xamarin.Kotlin.StdLib
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4818432; uint32_t buffer_offset
	}, ; 30: Yrm100.Protocol
	%struct.CompressedAssemblyDescriptor {
		i32 27648, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4830720; uint32_t buffer_offset
	}, ; 31: YRM100.Reader
	%struct.CompressedAssemblyDescriptor {
		i32 27136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4858368; uint32_t buffer_offset
	}, ; 32: System.Collections.Concurrent
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4885504; uint32_t buffer_offset
	}, ; 33: System.Collections.NonGeneric
	%struct.CompressedAssemblyDescriptor {
		i32 10752, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4891136; uint32_t buffer_offset
	}, ; 34: System.Collections.Specialized
	%struct.CompressedAssemblyDescriptor {
		i32 25600, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4901888; uint32_t buffer_offset
	}, ; 35: System.Collections
	%struct.CompressedAssemblyDescriptor {
		i32 13824, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4927488; uint32_t buffer_offset
	}, ; 36: System.ComponentModel.Annotations
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4941312; uint32_t buffer_offset
	}, ; 37: System.ComponentModel.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 98304, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 4950528; uint32_t buffer_offset
	}, ; 38: System.ComponentModel.TypeConverter
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5048832; uint32_t buffer_offset
	}, ; 39: System.ComponentModel
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5054464; uint32_t buffer_offset
	}, ; 40: System.Console
	%struct.CompressedAssemblyDescriptor {
		i32 44544, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5066752; uint32_t buffer_offset
	}, ; 41: System.Diagnostics.DiagnosticSource
	%struct.CompressedAssemblyDescriptor {
		i32 11776, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5111296; uint32_t buffer_offset
	}, ; 42: System.Diagnostics.TraceSource
	%struct.CompressedAssemblyDescriptor {
		i32 28672, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5123072; uint32_t buffer_offset
	}, ; 43: System.IO.Compression
	%struct.CompressedAssemblyDescriptor {
		i32 11264, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5151744; uint32_t buffer_offset
	}, ; 44: System.Linq.Expressions
	%struct.CompressedAssemblyDescriptor {
		i32 61440, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5163008; uint32_t buffer_offset
	}, ; 45: System.Linq
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5224448; uint32_t buffer_offset
	}, ; 46: System.Memory
	%struct.CompressedAssemblyDescriptor {
		i32 27136, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5229568; uint32_t buffer_offset
	}, ; 47: System.Net.NameResolution
	%struct.CompressedAssemblyDescriptor {
		i32 38912, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5256704; uint32_t buffer_offset
	}, ; 48: System.Net.Primitives
	%struct.CompressedAssemblyDescriptor {
		i32 104960, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5295616; uint32_t buffer_offset
	}, ; 49: System.Net.Sockets
	%struct.CompressedAssemblyDescriptor {
		i32 15872, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5400576; uint32_t buffer_offset
	}, ; 50: System.ObjectModel
	%struct.CompressedAssemblyDescriptor {
		i32 71680, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5416448; uint32_t buffer_offset
	}, ; 51: System.Private.Uri
	%struct.CompressedAssemblyDescriptor {
		i32 72192, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5488128; uint32_t buffer_offset
	}, ; 52: System.Private.Xml
	%struct.CompressedAssemblyDescriptor {
		i32 9216, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5560320; uint32_t buffer_offset
	}, ; 53: System.Runtime.InteropServices
	%struct.CompressedAssemblyDescriptor {
		i32 9728, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5569536; uint32_t buffer_offset
	}, ; 54: System.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 14848, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5579264; uint32_t buffer_offset
	}, ; 55: System.Security.Cryptography
	%struct.CompressedAssemblyDescriptor {
		i32 271360, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5594112; uint32_t buffer_offset
	}, ; 56: System.Text.RegularExpressions
	%struct.CompressedAssemblyDescriptor {
		i32 12288, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5865472; uint32_t buffer_offset
	}, ; 57: System.Threading
	%struct.CompressedAssemblyDescriptor {
		i32 5120, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5877760; uint32_t buffer_offset
	}, ; 58: System
	%struct.CompressedAssemblyDescriptor {
		i32 5632, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5882880; uint32_t buffer_offset
	}, ; 59: netstandard
	%struct.CompressedAssemblyDescriptor {
		i32 1823744, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 5888512; uint32_t buffer_offset
	}, ; 60: System.Private.CoreLib
	%struct.CompressedAssemblyDescriptor {
		i32 168448, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7712256; uint32_t buffer_offset
	}, ; 61: Java.Interop
	%struct.CompressedAssemblyDescriptor {
		i32 22368, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7880704; uint32_t buffer_offset
	}, ; 62: Mono.Android.Runtime
	%struct.CompressedAssemblyDescriptor {
		i32 908800, ; uint32_t uncompressed_file_size
		i1 false, ; bool loaded
		i32 7903072; uint32_t buffer_offset
	} ; 63: Mono.Android
], align 4

@uncompressed_assemblies_data_size = dso_local local_unnamed_addr constant i32 8811872, align 4

@uncompressed_assemblies_data_buffer = dso_local local_unnamed_addr global [8811872 x i8] zeroinitializer, align 1

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/10.0.1xx @ d549e1dc4e2a083b08b4f24cb5495e81b99d79b5"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
