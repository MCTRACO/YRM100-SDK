; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [64 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [192 x i64] [
	i64 u0x01109b0e4d99e61f, ; 0: System.ComponentModel.Annotations.dll => 36
	i64 u0x02abedc11addc1ed, ; 1: lib_Mono.Android.Runtime.dll.so => 62
	i64 u0x032267b2a94db371, ; 2: lib_Xamarin.AndroidX.AppCompat.dll.so => 20
	i64 u0x0517ef04e06e9f76, ; 3: System.Net.Primitives => 48
	i64 u0x0581db89237110e9, ; 4: lib_System.Collections.dll.so => 35
	i64 u0x0600544dd3961080, ; 5: HarfBuzzSharp => 16
	i64 u0x07dcdc7460a0c5e4, ; 6: System.Collections.NonGeneric => 33
	i64 u0x08f3c9788ee2153c, ; 7: Xamarin.AndroidX.DrawerLayout => 22
	i64 u0x09138715c92dba90, ; 8: lib_System.ComponentModel.Annotations.dll.so => 36
	i64 u0x092266563089ae3e, ; 9: lib_System.Collections.NonGeneric.dll.so => 33
	i64 u0x09d144a7e214d457, ; 10: System.Security.Cryptography => 55
	i64 u0x0c59ad9fbbd43abe, ; 11: Mono.Android => 63
	i64 u0x0e14e73a54dda68e, ; 12: lib_System.Net.NameResolution.dll.so => 47
	i64 u0x13f1e5e209e91af4, ; 13: lib_Java.Interop.dll.so => 61
	i64 u0x17125c9a85b4929f, ; 14: lib_netstandard.dll.so => 59
	i64 u0x17f10bff77f05b2e, ; 15: Avalonia.Remote.Protocol => 13
	i64 u0x1a86fbe2485a9f00, ; 16: Avalonia.DesignerSupport.dll => 3
	i64 u0x1a91866a319e9259, ; 17: lib_System.Collections.Concurrent.dll.so => 32
	i64 u0x1aac34d1917ba5d3, ; 18: lib_System.dll.so => 58
	i64 u0x1c753b5ff15bce1b, ; 19: Mono.Android.Runtime.dll => 62
	i64 u0x1cbd96398ee943a6, ; 20: YRM100.Reader => 31
	i64 u0x1d3dd0218cdc9fa5, ; 21: Avalonia.Markup.Xaml => 5
	i64 u0x1da87c3fe68efc1d, ; 22: Avalonia.Vulkan.dll => 10
	i64 u0x1e1a605292ce6795, ; 23: Avalonia.Themes.Fluent => 15
	i64 u0x2174319c0d835bc9, ; 24: System.Runtime => 54
	i64 u0x2407aef2bbe8fadf, ; 25: System.Console => 40
	i64 u0x240abe014b27e7d3, ; 26: Xamarin.AndroidX.Core.dll => 21
	i64 u0x2662c629b96b0b30, ; 27: lib_Xamarin.Kotlin.StdLib.dll.so => 29
	i64 u0x276caadc40e47f0d, ; 28: YRM100.Reader.dll => 31
	i64 u0x277e4a36150ed3a3, ; 29: Avalonia.Base.dll => 1
	i64 u0x27b410442fad6cf1, ; 30: Java.Interop.dll => 61
	i64 u0x2801845a2c71fbfb, ; 31: System.Net.Primitives.dll => 48
	i64 u0x2927d345f3daec35, ; 32: SkiaSharp.dll => 18
	i64 u0x2937d81e11ec0ddf, ; 33: Avalonia.Markup.Xaml.dll => 5
	i64 u0x2a6507a5ffabdf28, ; 34: System.Diagnostics.TraceSource.dll => 42
	i64 u0x2af298f63581d886, ; 35: System.Text.RegularExpressions.dll => 56
	i64 u0x2b17908826439236, ; 36: Avalonia.Metal.dll => 7
	i64 u0x2b52706233239866, ; 37: Avalonia.Remote.Protocol.dll => 13
	i64 u0x2d169d318a968379, ; 38: System.Threading.dll => 57
	i64 u0x309ee9eeec09a71e, ; 39: lib_Xamarin.AndroidX.Fragment.dll.so => 23
	i64 u0x31195fef5d8fb552, ; 40: _Microsoft.Android.Resource.Designer.dll => 0
	i64 u0x341abc357fbb4ebf, ; 41: lib_System.Net.Sockets.dll.so => 49
	i64 u0x353590da528c9d22, ; 42: System.ComponentModel.Annotations => 36
	i64 u0x38869c811d74050e, ; 43: System.Net.NameResolution.dll => 47
	i64 u0x3a51880eea7585d2, ; 44: lib_Avalonia.Markup.Xaml.dll.so => 5
	i64 u0x3b6f59802ed335c2, ; 45: Avalonia.MicroCom.dll => 8
	i64 u0x3c7c495f58ac5ee9, ; 46: Xamarin.Kotlin.StdLib => 29
	i64 u0x3d9c2a242b040a50, ; 47: lib_Xamarin.AndroidX.Core.dll.so => 21
	i64 u0x43375950ec7c1b6a, ; 48: netstandard.dll => 59
	i64 u0x434c4e1d9284cdae, ; 49: Mono.Android.dll => 63
	i64 u0x4515080865a951a5, ; 50: Xamarin.Kotlin.StdLib.dll => 29
	i64 u0x45c40276a42e283e, ; 51: System.Diagnostics.TraceSource => 42
	i64 u0x4972c623c86d2c28, ; 52: lib_Avalonia.DesignerSupport.dll.so => 3
	i64 u0x49e952f19a4e2022, ; 53: System.ObjectModel => 50
	i64 u0x4ab01d3ffaf3dd27, ; 54: lib_Avalonia.Dialogs.dll.so => 4
	i64 u0x4ca7077b553ba065, ; 55: Avalonia.Controls => 2
	i64 u0x4cc5f15266470798, ; 56: lib_Xamarin.AndroidX.Loader.dll.so => 27
	i64 u0x4d479f968a05e504, ; 57: System.Linq.Expressions.dll => 44
	i64 u0x4d55a010ffc4faff, ; 58: System.Private.Xml => 52
	i64 u0x4dd9247f1d2c3235, ; 59: Xamarin.AndroidX.Loader.dll => 27
	i64 u0x4e32f00cb0937401, ; 60: Mono.Android.Runtime => 62
	i64 u0x50ed43b4a9b11edd, ; 61: MicroCom.Runtime => 17
	i64 u0x526ce79eb8e90527, ; 62: lib_System.Net.Primitives.dll.so => 48
	i64 u0x529ffe06f39ab8db, ; 63: Xamarin.AndroidX.Core => 21
	i64 u0x54795225dd1587af, ; 64: lib_System.Runtime.dll.so => 54
	i64 u0x547a34f14e5f6210, ; 65: Xamarin.AndroidX.Lifecycle.Common.dll => 24
	i64 u0x5588627c9a108ec9, ; 66: System.Collections.Specialized => 34
	i64 u0x571c5cfbec5ae8e2, ; 67: System.Private.Uri => 51
	i64 u0x579a06fed6eec900, ; 68: System.Private.CoreLib.dll => 60
	i64 u0x57c542c14049b66d, ; 69: System.Diagnostics.DiagnosticSource => 41
	i64 u0x5a27319ca17d5e68, ; 70: MicroCom.Runtime.dll => 17
	i64 u0x5a8f6699f4a1caa9, ; 71: lib_System.Threading.dll.so => 57
	i64 u0x5ae9cd33b15841bf, ; 72: System.ComponentModel => 39
	i64 u0x5db0cbbd1028510e, ; 73: lib_System.Runtime.InteropServices.dll.so => 53
	i64 u0x5e467bc8f09ad026, ; 74: System.Collections.Specialized.dll => 34
	i64 u0x5eb8046dd40e9ac3, ; 75: System.ComponentModel.Primitives => 37
	i64 u0x60f62d786afcf130, ; 76: System.Memory => 46
	i64 u0x622eef6f9e59068d, ; 77: System.Private.CoreLib => 60
	i64 u0x6376ee64ab136329, ; 78: lib_Avalonia.Themes.Fluent.dll.so => 15
	i64 u0x641c60df5c993ae3, ; 79: Avalonia.DesignerSupport => 3
	i64 u0x6692e924eade1b29, ; 80: lib_System.Console.dll.so => 40
	i64 u0x6a4d7577b2317255, ; 81: System.Runtime.InteropServices.dll => 53
	i64 u0x6ce874bff138ce2b, ; 82: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 26
	i64 u0x71ad672adbe48f35, ; 83: System.ComponentModel.Primitives.dll => 37
	i64 u0x73e4ce94e2eb6ffc, ; 84: lib_System.Memory.dll.so => 46
	i64 u0x76012e7334db86e5, ; 85: lib_Xamarin.AndroidX.SavedState.dll.so => 28
	i64 u0x78979a5b2d9eda26, ; 86: Avalonia.OpenGL => 9
	i64 u0x78a45e51311409b6, ; 87: Xamarin.AndroidX.Fragment.dll => 23
	i64 u0x78ed4ab8f9d800a1, ; 88: Xamarin.AndroidX.Lifecycle.ViewModel => 26
	i64 u0x7a7e7eddf79c5d26, ; 89: lib_Xamarin.AndroidX.Lifecycle.ViewModel.dll.so => 26
	i64 u0x7bef86a4335c4870, ; 90: System.ComponentModel.TypeConverter => 38
	i64 u0x7d14464ae904af64, ; 91: lib_Avalonia.Metal.dll.so => 7
	i64 u0x7dfc3d6d9d8d7b70, ; 92: System.Collections => 35
	i64 u0x7e946809d6008ef2, ; 93: lib_System.ObjectModel.dll.so => 50
	i64 u0x7ecc13347c8fd849, ; 94: lib_System.ComponentModel.dll.so => 39
	i64 u0x7fbd557c99b3ce6f, ; 95: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 25
	i64 u0x803f1de6fe44738a, ; 96: lib_Avalonia.dll.so => 11
	i64 u0x812c069d5cdecc17, ; 97: System.dll => 58
	i64 u0x8277f2be6b5ce05f, ; 98: Xamarin.AndroidX.AppCompat => 20
	i64 u0x8308a506644563bb, ; 99: Avalonia.Metal => 7
	i64 u0x84d8c58a8cabb5df, ; 100: Yrm100.Protocol.dll => 30
	i64 u0x84f9060cc4a93c8f, ; 101: lib_SkiaSharp.dll.so => 18
	i64 u0x8808a9d7c53dc4c0, ; 102: lib_HarfBuzzSharp.dll.so => 16
	i64 u0x8930322c7bd8f768, ; 103: netstandard => 59
	i64 u0x897a606c9e39c75f, ; 104: lib_System.ComponentModel.Primitives.dll.so => 37
	i64 u0x8a21b916d9796fa5, ; 105: Avalonia.MicroCom => 8
	i64 u0x8ad229ea26432ee2, ; 106: Xamarin.AndroidX.Loader => 27
	i64 u0x8b4ff5d0fdd5faa1, ; 107: lib_System.Diagnostics.DiagnosticSource.dll.so => 41
	i64 u0x8d7b8ab4b3310ead, ; 108: System.Threading => 57
	i64 u0x8da188285aadfe8e, ; 109: System.Collections.Concurrent => 32
	i64 u0x8fb4480c06374c78, ; 110: lib_Avalonia.Android.dll.so => 12
	i64 u0x90263f8448b8f572, ; 111: lib_System.Diagnostics.TraceSource.dll.so => 42
	i64 u0x903101b46fb73a04, ; 112: _Microsoft.Android.Resource.Designer => 0
	i64 u0x90393bd4865292f3, ; 113: lib_System.IO.Compression.dll.so => 43
	i64 u0x91a74f07b30d37e2, ; 114: System.Linq.dll => 45
	i64 u0x9216ea747d0be31f, ; 115: lib_Avalonia.Controls.dll.so => 2
	i64 u0x9246426168cfbd4a, ; 116: Avalonia.Dialogs.dll => 4
	i64 u0x9388aad9b7ae40ce, ; 117: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 24
	i64 u0x944077d8ca3c6580, ; 118: System.IO.Compression.dll => 43
	i64 u0x96a7347adc67c496, ; 119: lib_Avalonia.Skia.dll.so => 14
	i64 u0x96cfafe6410410d8, ; 120: lib_Avalonia.Vulkan.dll.so => 10
	i64 u0x9799aee8e42cced3, ; 121: Avalonia.Skia.dll => 14
	i64 u0x97b8c771ea3e4220, ; 122: System.ComponentModel.dll => 39
	i64 u0x97e144c9d3c6976e, ; 123: System.Collections.Concurrent.dll => 32
	i64 u0x991d510397f92d9d, ; 124: System.Linq.Expressions => 44
	i64 u0x9b68e31c09020a8f, ; 125: Avalonia.Markup.dll => 6
	i64 u0x9d5dbcf5a48583fe, ; 126: lib_Xamarin.AndroidX.Activity.dll.so => 19
	i64 u0x9ef542cf1f78c506, ; 127: Xamarin.AndroidX.Lifecycle.LiveData.Core => 25
	i64 u0x9f9c5c252feedc26, ; 128: Avalonia.OpenGL.dll => 9
	i64 u0xa0d8259f4cc284ec, ; 129: lib_System.Security.Cryptography.dll.so => 55
	i64 u0xa28642c7ac33c167, ; 130: Avalonia.Markup => 6
	i64 u0xa5f1ba49b85dd355, ; 131: System.Security.Cryptography.dll => 55
	i64 u0xa67dbee13e1df9ca, ; 132: Xamarin.AndroidX.SavedState.dll => 28
	i64 u0xa68a420042bb9b1f, ; 133: Xamarin.AndroidX.DrawerLayout.dll => 22
	i64 u0xaa443ac34067eeef, ; 134: System.Private.Xml.dll => 52
	i64 u0xab9c1b2687d86b0b, ; 135: lib_System.Linq.Expressions.dll.so => 44
	i64 u0xac5376a2a538dc10, ; 136: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 25
	i64 u0xadc90ab061a9e6e4, ; 137: System.ComponentModel.TypeConverter.dll => 38
	i64 u0xae282bcd03739de7, ; 138: Java.Interop => 61
	i64 u0xae53579c90db1107, ; 139: System.ObjectModel.dll => 50
	i64 u0xb220631954820169, ; 140: System.Text.RegularExpressions => 56
	i64 u0xb751d0c56f186f53, ; 141: Yrm100.Protocol => 30
	i64 u0xb81a2c6e0aee50fe, ; 142: lib_System.Private.CoreLib.dll.so => 60
	i64 u0xba48785529705af9, ; 143: System.Collections.dll => 35
	i64 u0xbb65706fde942ce3, ; 144: System.Net.Sockets => 49
	i64 u0xc0d928351ab5ca77, ; 145: System.Console.dll => 40
	i64 u0xc12b8b3afa48329c, ; 146: lib_System.Linq.dll.so => 45
	i64 u0xc1ff9ae3cdb6e1e6, ; 147: Xamarin.AndroidX.Activity.dll => 19
	i64 u0xc4f72c53a5b1ad3e, ; 148: Avalonia.Android.dll => 12
	i64 u0xc50fded0ded1418c, ; 149: lib_System.ComponentModel.TypeConverter.dll.so => 38
	i64 u0xc5325b2fcb37446f, ; 150: lib_System.Private.Xml.dll.so => 52
	i64 u0xc5a0f4b95a699af7, ; 151: lib_System.Private.Uri.dll.so => 51
	i64 u0xc674822f2d239e99, ; 152: lib_Avalonia.Markup.dll.so => 6
	i64 u0xc858a28d9ee5a6c5, ; 153: lib_System.Collections.Specialized.dll.so => 34
	i64 u0xcbd4fdd9cef4a294, ; 154: lib__Microsoft.Android.Resource.Designer.dll.so => 0
	i64 u0xcc2876b32ef2794c, ; 155: lib_System.Text.RegularExpressions.dll.so => 56
	i64 u0xcf23d8093f3ceadf, ; 156: System.Diagnostics.DiagnosticSource.dll => 41
	i64 u0xd1268c6d5c152eea, ; 157: lib_Avalonia.OpenGL.dll.so => 9
	i64 u0xd333d0af9e423810, ; 158: System.Runtime.InteropServices => 53
	i64 u0xd3651b6fc3125825, ; 159: System.Private.Uri.dll => 51
	i64 u0xd39aebbd4a9ef4b7, ; 160: lib_Yrm100.Protocol.dll.so => 30
	i64 u0xd45462df8fe5e800, ; 161: lib_MicroCom.Runtime.dll.so => 17
	i64 u0xd6694f8359737e4e, ; 162: Xamarin.AndroidX.SavedState => 28
	i64 u0xd88b5f5bbc332508, ; 163: Avalonia.Base => 1
	i64 u0xdad05a11827959a3, ; 164: System.Collections.NonGeneric.dll => 33
	i64 u0xdb1b4b8779f49288, ; 165: lib_Avalonia.MicroCom.dll.so => 8
	i64 u0xdbf9607a441b4505, ; 166: System.Linq => 45
	i64 u0xdd2b722d78ef5f43, ; 167: System.Runtime.dll => 54
	i64 u0xdfefe13b112aff31, ; 168: lib_Avalonia.Base.dll.so => 1
	i64 u0xe0142572c095a480, ; 169: Xamarin.AndroidX.AppCompat.dll => 20
	i64 u0xe38f2586e1a6af0e, ; 170: Avalonia.Controls.dll => 2
	i64 u0xe4648f9beb38b02f, ; 171: Avalonia => 11
	i64 u0xe5434e8a119ceb69, ; 172: lib_Mono.Android.dll.so => 63
	i64 u0xe67ddaf3b05935e8, ; 173: lib_Avalonia.Remote.Protocol.dll.so => 13
	i64 u0xedc4817167106c23, ; 174: System.Net.Sockets.dll => 49
	i64 u0xedc632067fb20ff3, ; 175: System.Memory.dll => 46
	i64 u0xefec0b7fdc57ec42, ; 176: Xamarin.AndroidX.Activity => 19
	i64 u0xf09e47b6ae914f6e, ; 177: System.Net.NameResolution => 47
	i64 u0xf368e771ca059e99, ; 178: Avalonia.Android => 12
	i64 u0xf3ddfe05336abf29, ; 179: System => 58
	i64 u0xf4727d423e5d26f3, ; 180: SkiaSharp => 18
	i64 u0xf4c1dd70a5496a17, ; 181: System.IO.Compression => 43
	i64 u0xf57137e5984abfa8, ; 182: Avalonia.dll => 11
	i64 u0xf9ae35b3d65d7bb8, ; 183: Avalonia.Themes.Fluent.dll => 15
	i64 u0xfa1c7a6f8c25dfa5, ; 184: lib_YRM100.Reader.dll.so => 31
	i64 u0xfbe99333ee5a53d9, ; 185: Avalonia.Vulkan => 10
	i64 u0xfc4186c2448201c7, ; 186: Avalonia.Dialogs => 4
	i64 u0xfc70c50e7e4385e2, ; 187: Avalonia.Skia => 14
	i64 u0xfd22f00870e40ae0, ; 188: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 22
	i64 u0xfd583f7657b6a1cb, ; 189: Xamarin.AndroidX.Fragment => 23
	i64 u0xfddbe9695626a7f5, ; 190: Xamarin.AndroidX.Lifecycle.Common => 24
	i64 u0xfeca84fe7f34860b ; 191: HarfBuzzSharp.dll => 16
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [192 x i32] [
	i32 36, i32 62, i32 20, i32 48, i32 35, i32 16, i32 33, i32 22,
	i32 36, i32 33, i32 55, i32 63, i32 47, i32 61, i32 59, i32 13,
	i32 3, i32 32, i32 58, i32 62, i32 31, i32 5, i32 10, i32 15,
	i32 54, i32 40, i32 21, i32 29, i32 31, i32 1, i32 61, i32 48,
	i32 18, i32 5, i32 42, i32 56, i32 7, i32 13, i32 57, i32 23,
	i32 0, i32 49, i32 36, i32 47, i32 5, i32 8, i32 29, i32 21,
	i32 59, i32 63, i32 29, i32 42, i32 3, i32 50, i32 4, i32 2,
	i32 27, i32 44, i32 52, i32 27, i32 62, i32 17, i32 48, i32 21,
	i32 54, i32 24, i32 34, i32 51, i32 60, i32 41, i32 17, i32 57,
	i32 39, i32 53, i32 34, i32 37, i32 46, i32 60, i32 15, i32 3,
	i32 40, i32 53, i32 26, i32 37, i32 46, i32 28, i32 9, i32 23,
	i32 26, i32 26, i32 38, i32 7, i32 35, i32 50, i32 39, i32 25,
	i32 11, i32 58, i32 20, i32 7, i32 30, i32 18, i32 16, i32 59,
	i32 37, i32 8, i32 27, i32 41, i32 57, i32 32, i32 12, i32 42,
	i32 0, i32 43, i32 45, i32 2, i32 4, i32 24, i32 43, i32 14,
	i32 10, i32 14, i32 39, i32 32, i32 44, i32 6, i32 19, i32 25,
	i32 9, i32 55, i32 6, i32 55, i32 28, i32 22, i32 52, i32 44,
	i32 25, i32 38, i32 61, i32 50, i32 56, i32 30, i32 60, i32 35,
	i32 49, i32 40, i32 45, i32 19, i32 12, i32 38, i32 52, i32 51,
	i32 6, i32 34, i32 0, i32 56, i32 41, i32 9, i32 53, i32 51,
	i32 30, i32 17, i32 28, i32 1, i32 33, i32 8, i32 45, i32 54,
	i32 1, i32 20, i32 2, i32 11, i32 63, i32 13, i32 49, i32 46,
	i32 19, i32 47, i32 12, i32 58, i32 18, i32 43, i32 11, i32 15,
	i32 31, i32 10, i32 4, i32 14, i32 22, i32 23, i32 24, i32 16
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 27, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [27 x %struct.MarshalMethodsManagedClass] [
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000c5, ; class name: Android.Views.View/IOnFocusChangeListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 0
	%struct.MarshalMethodsManagedClass {
		i32 u0x020001cf, ; class name: Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 1
	%struct.MarshalMethodsManagedClass {
		i32 u0x020001ef, ; class name: Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 2
	%struct.MarshalMethodsManagedClass {
		i32 u0x020001d2, ; class name: Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 3
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000204, ; class name: Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 4
	%struct.MarshalMethodsManagedClass {
		i32 u0x020001be, ; class name: Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 5
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000d1, ; class name: Android.Views.ViewTreeObserver/IOnGlobalLayoutListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 6
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000bf, ; class name: Android.Views.View, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 7
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000df, ; class name: Android.Views.Choreographer/IFrameCallbackInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 8
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000f7, ; class name: Android.Views.ISurfaceHolderCallbackInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 9
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000064, ; class name: AndroidX.Core.View.WindowInsetsAnimationCompat/Callback, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 10
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000052, ; class name: AndroidX.Core.View.IOnApplyWindowInsetsListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 11
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000192, ; class name: Android.Hardware.Display.DisplayManager/IDisplayListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 12
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200013c, ; class name: Android.Views.InputMethods.IInputConnectionInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 13
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200013b, ; class name: Android.Views.InputMethods.IInputConnection, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 14
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000015, ; class name: AndroidX.Activity.ContextAware.IOnContextAvailableListenerInvoker, Xamarin.AndroidX.Activity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 15
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000031, ; class name: AndroidX.AppCompat.App.ActionBar/IOnMenuVisibilityListenerInvoker, Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 16
	%struct.MarshalMethodsManagedClass {
		i32 u0x020000c3, ; class name: Android.Views.View/IOnClickListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	}, ; 17
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000049, ; class name: AndroidX.AppCompat.Widget.Toolbar/IOnMenuItemClickListenerInvoker, Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 18
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000041, ; class name: AndroidX.Core.View.ActionProvider/ISubUiVisibilityListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 19
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000045, ; class name: AndroidX.Core.View.ActionProvider/IVisibilityListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 20
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200006b, ; class name: AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 21
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200001b, ; class name: AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListenerInvoker, Xamarin.AndroidX.DrawerLayout, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 22
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000033, ; class name: AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListenerInvoker, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 23
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000032, ; class name: AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 24
	%struct.MarshalMethodsManagedClass {
		i32 u0x02000043, ; class name: AndroidX.Fragment.App.IFragmentOnAttachListenerInvoker, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
		ptr null; MonoClass* klass
	}, ; 25
	%struct.MarshalMethodsManagedClass {
		i32 u0x0200021d, ; class name: Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
		ptr null; MonoClass* klass
	} ; 26
], align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [27 x ptr] [
	ptr @.mm.0, ; 0 ('Android.Views.View/IOnFocusChangeListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.1, ; 1 ('Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.2, ; 2 ('Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.3, ; 3 ('Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.4, ; 4 ('Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.5, ; 5 ('Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.6, ; 6 ('Android.Views.ViewTreeObserver/IOnGlobalLayoutListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.7, ; 7 ('Android.Views.View, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.8, ; 8 ('Android.Views.Choreographer/IFrameCallbackInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.9, ; 9 ('Android.Views.ISurfaceHolderCallbackInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.10, ; 10 ('AndroidX.Core.View.WindowInsetsAnimationCompat/Callback, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.11, ; 11 ('AndroidX.Core.View.IOnApplyWindowInsetsListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.12, ; 12 ('Android.Hardware.Display.DisplayManager/IDisplayListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.13, ; 13 ('Android.Views.InputMethods.IInputConnectionInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.14, ; 14 ('Android.Views.InputMethods.IInputConnection, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.15, ; 15 ('AndroidX.Activity.ContextAware.IOnContextAvailableListenerInvoker, Xamarin.AndroidX.Activity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.16, ; 16 ('AndroidX.AppCompat.App.ActionBar/IOnMenuVisibilityListenerInvoker, Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.17, ; 17 ('Android.Views.View/IOnClickListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
	ptr @.mm.18, ; 18 ('AndroidX.AppCompat.Widget.Toolbar/IOnMenuItemClickListenerInvoker, Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.19, ; 19 ('AndroidX.Core.View.ActionProvider/ISubUiVisibilityListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.20, ; 20 ('AndroidX.Core.View.ActionProvider/IVisibilityListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.21, ; 21 ('AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.22, ; 22 ('AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListenerInvoker, Xamarin.AndroidX.DrawerLayout, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.23, ; 23 ('AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListenerInvoker, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.24, ; 24 ('AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.25, ; 25 ('AndroidX.Fragment.App.IFragmentOnAttachListenerInvoker, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null')
	ptr @.mm.26 ; 26 ('Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065')
], align 8

@mm_method_names = dso_local local_unnamed_addr constant [98 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000003f060004b7, ; name: n_OnFocusChange_Landroid_view_View_Z_mm_wrapper(IntPtr,IntPtr,IntPtr,SByte)
		ptr @.MarshalMethodName.0_name; char* name
	}, ; 0
	%struct.MarshalMethodName {
		i64 u0x0000003f060011b5, ; name: n_Close_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.1_name; char* name
	}, ; 1
	%struct.MarshalMethodName {
		i64 u0x0000003f060011b6, ; name: n_Read_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.2_name; char* name
	}, ; 2
	%struct.MarshalMethodName {
		i64 u0x0000003f060011b7, ; name: n_Read_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.3_name; char* name
	}, ; 3
	%struct.MarshalMethodName {
		i64 u0x0000003f060011b8, ; name: n_Read_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.4_name; char* name
	}, ; 4
	%struct.MarshalMethodName {
		i64 u0x0000003f06001399, ; name: n_Equals_Ljava_lang_Object__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.5_name; char* name
	}, ; 5
	%struct.MarshalMethodName {
		i64 u0x0000003f0600139a, ; name: n_GetHashCode_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.6_name; char* name
	}, ; 6
	%struct.MarshalMethodName {
		i64 u0x0000003f0600139b, ; name: n_ToString_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.7_name; char* name
	}, ; 7
	%struct.MarshalMethodName {
		i64 u0x0000003f060011d5, ; name: n_Close_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.1_name; char* name
	}, ; 8
	%struct.MarshalMethodName {
		i64 u0x0000003f060011d6, ; name: n_Flush_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.8_name; char* name
	}, ; 9
	%struct.MarshalMethodName {
		i64 u0x0000003f060011d7, ; name: n_Write_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.9_name; char* name
	}, ; 10
	%struct.MarshalMethodName {
		i64 u0x0000003f060011d8, ; name: n_Write_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.10_name; char* name
	}, ; 11
	%struct.MarshalMethodName {
		i64 u0x0000003f060011d9, ; name: n_Write_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.11_name; char* name
	}, ; 12
	%struct.MarshalMethodName {
		i64 u0x0000003f06001451, ; name: n_Run_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.12_name; char* name
	}, ; 13
	%struct.MarshalMethodName {
		i64 u0x0000003f060010f7, ; name: n_OnBackPressed_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.13_name; char* name
	}, ; 14
	%struct.MarshalMethodName {
		i64 u0x0000003f060010f8, ; name: n_OnCreate_Landroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.14_name; char* name
	}, ; 15
	%struct.MarshalMethodName {
		i64 u0x0000003f060010f9, ; name: n_OnStop_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.15_name; char* name
	}, ; 16
	%struct.MarshalMethodName {
		i64 u0x0000003f060010fa, ; name: n_OnStart_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.16_name; char* name
	}, ; 17
	%struct.MarshalMethodName {
		i64 u0x0000003f060010fb, ; name: n_OnResume_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.17_name; char* name
	}, ; 18
	%struct.MarshalMethodName {
		i64 u0x0000003f060010fc, ; name: n_OnDestroy_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.18_name; char* name
	}, ; 19
	%struct.MarshalMethodName {
		i64 u0x0000003f060010fd, ; name: n_OnActivityResult_IILandroid_content_Intent__mm_wrapper(IntPtr,IntPtr,Int32,Int32,IntPtr)
		ptr @.MarshalMethodName.19_name; char* name
	}, ; 20
	%struct.MarshalMethodName {
		i64 u0x0000003f060010fe, ; name: n_OnRequestPermissionsResult_IarrayLjava_lang_String_arrayI_mm_wrapper(IntPtr,IntPtr,Int32,IntPtr,IntPtr)
		ptr @.MarshalMethodName.20_name; char* name
	}, ; 21
	%struct.MarshalMethodName {
		i64 u0x0000003f06000518, ; name: n_OnGlobalLayout_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.21_name; char* name
	}, ; 22
	%struct.MarshalMethodName {
		i64 u0x0000003f0600048e, ; name: n_DispatchKeyEvent_Landroid_view_KeyEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.22_name; char* name
	}, ; 23
	%struct.MarshalMethodName {
		i64 u0x0000003f0600048f, ; name: n_OnVisibilityAggregated_Z_mm_wrapper(IntPtr,IntPtr,SByte)
		ptr @.MarshalMethodName.23_name; char* name
	}, ; 24
	%struct.MarshalMethodName {
		i64 u0x0000003f06000490, ; name: n_OnVisibilityChanged_Landroid_view_View_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.24_name; char* name
	}, ; 25
	%struct.MarshalMethodName {
		i64 u0x0000003f06000491, ; name: n_OnConfigurationChanged_Landroid_content_res_Configuration__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.25_name; char* name
	}, ; 26
	%struct.MarshalMethodName {
		i64 u0x0000003f060005d6, ; name: n_DoFrame_J_mm_wrapper(IntPtr,IntPtr,Int64)
		ptr @.MarshalMethodName.26_name; char* name
	}, ; 27
	%struct.MarshalMethodName {
		i64 u0x0000003f06000492, ; name: n_Invalidate_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.27_name; char* name
	}, ; 28
	%struct.MarshalMethodName {
		i64 u0x0000003f06000800, ; name: n_SurfaceChanged_Landroid_view_SurfaceHolder_III_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32,Int32)
		ptr @.MarshalMethodName.28_name; char* name
	}, ; 29
	%struct.MarshalMethodName {
		i64 u0x0000003f06000801, ; name: n_SurfaceCreated_Landroid_view_SurfaceHolder__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.29_name; char* name
	}, ; 30
	%struct.MarshalMethodName {
		i64 u0x0000003f06000802, ; name: n_SurfaceDestroyed_Landroid_view_SurfaceHolder__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.30_name; char* name
	}, ; 31
	%struct.MarshalMethodName {
		i64 u0x000000150600045e, ; name: n_OnStart_Landroidx_core_view_WindowInsetsAnimationCompat_Landroidx_core_view_WindowInsetsAnimationCompat_BoundsCompat__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.31_name; char* name
	}, ; 32
	%struct.MarshalMethodName {
		i64 u0x000000150600045f, ; name: n_OnProgress_Landroidx_core_view_WindowInsetsCompat_Ljava_util_List__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.32_name; char* name
	}, ; 33
	%struct.MarshalMethodName {
		i64 u0x00000015060002c9, ; name: n_OnApplyWindowInsets_Landroid_view_View_Landroidx_core_view_WindowInsetsCompat__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.33_name; char* name
	}, ; 34
	%struct.MarshalMethodName {
		i64 u0x0000003f06000edc, ; name: n_OnDisplayAdded_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.34_name; char* name
	}, ; 35
	%struct.MarshalMethodName {
		i64 u0x0000003f06000edd, ; name: n_OnDisplayChanged_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.35_name; char* name
	}, ; 36
	%struct.MarshalMethodName {
		i64 u0x0000003f06000ede, ; name: n_OnDisplayRemoved_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.36_name; char* name
	}, ; 37
	%struct.MarshalMethodName {
		i64 u0x0000003f06000493, ; name: n_DispatchDraw_Landroid_graphics_Canvas__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.37_name; char* name
	}, ; 38
	%struct.MarshalMethodName {
		i64 u0x0000003f06000494, ; name: n_DispatchGenericPointerEvent_Landroid_view_MotionEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.38_name; char* name
	}, ; 39
	%struct.MarshalMethodName {
		i64 u0x0000003f06000495, ; name: n_DispatchTouchEvent_Landroid_view_MotionEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.39_name; char* name
	}, ; 40
	%struct.MarshalMethodName {
		i64 u0x0000003f06000496, ; name: n_OnCheckIsTextEditor_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.40_name; char* name
	}, ; 41
	%struct.MarshalMethodName {
		i64 u0x0000003f06000497, ; name: n_OnCreateInputConnection_Landroid_view_inputmethod_EditorInfo__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.41_name; char* name
	}, ; 42
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b62, ; name: n_GetHandler_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.42_name; char* name
	}, ; 43
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b63, ; name: n_BeginBatchEdit_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.43_name; char* name
	}, ; 44
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b64, ; name: n_ClearMetaKeyStates_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.44_name; char* name
	}, ; 45
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b65, ; name: n_CloseConnection_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.45_name; char* name
	}, ; 46
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b66, ; name: n_CommitCompletion_Landroid_view_inputmethod_CompletionInfo__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.46_name; char* name
	}, ; 47
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b67, ; name: n_CommitContent_Landroid_view_inputmethod_InputContentInfo_ILandroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,IntPtr)
		ptr @.MarshalMethodName.47_name; char* name
	}, ; 48
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b68, ; name: n_CommitCorrection_Landroid_view_inputmethod_CorrectionInfo__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.48_name; char* name
	}, ; 49
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b69, ; name: n_CommitText_Ljava_lang_CharSequence_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.49_name; char* name
	}, ; 50
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b1b, ; name: n_CommitText_Ljava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,IntPtr)
		ptr @.MarshalMethodName.50_name; char* name
	}, ; 51
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b6a, ; name: n_DeleteSurroundingText_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.51_name; char* name
	}, ; 52
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b6b, ; name: n_DeleteSurroundingTextInCodePoints_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.52_name; char* name
	}, ; 53
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b6c, ; name: n_EndBatchEdit_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.53_name; char* name
	}, ; 54
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b6d, ; name: n_FinishComposingText_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.54_name; char* name
	}, ; 55
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b6e, ; name: n_GetCursorCapsMode_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.55_name; char* name
	}, ; 56
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b6f, ; name: n_GetExtractedText_Landroid_view_inputmethod_ExtractedTextRequest_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.56_name; char* name
	}, ; 57
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b70, ; name: n_GetSelectedText_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.57_name; char* name
	}, ; 58
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b71, ; name: n_GetTextAfterCursor_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.58_name; char* name
	}, ; 59
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b72, ; name: n_GetTextBeforeCursor_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.59_name; char* name
	}, ; 60
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b73, ; name: n_PerformContextMenuAction_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.60_name; char* name
	}, ; 61
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b74, ; name: n_PerformEditorAction_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.61_name; char* name
	}, ; 62
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b75, ; name: n_PerformPrivateCommand_Ljava_lang_String_Landroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.62_name; char* name
	}, ; 63
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b76, ; name: n_ReportFullscreenMode_Z_mm_wrapper(IntPtr,IntPtr,SByte)
		ptr @.MarshalMethodName.63_name; char* name
	}, ; 64
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b77, ; name: n_RequestCursorUpdates_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.64_name; char* name
	}, ; 65
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b1c, ; name: n_RequestCursorUpdates_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.65_name; char* name
	}, ; 66
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b78, ; name: n_SendKeyEvent_Landroid_view_KeyEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.66_name; char* name
	}, ; 67
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b79, ; name: n_SetComposingRegion_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.67_name; char* name
	}, ; 68
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b1d, ; name: n_SetComposingRegion_IILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,Int32,Int32,IntPtr)
		ptr @.MarshalMethodName.68_name; char* name
	}, ; 69
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b7a, ; name: n_SetComposingText_Ljava_lang_CharSequence_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.69_name; char* name
	}, ; 70
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b1e, ; name: n_SetComposingText_Ljava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,IntPtr)
		ptr @.MarshalMethodName.70_name; char* name
	}, ; 71
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b7b, ; name: n_SetSelection_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)
		ptr @.MarshalMethodName.71_name; char* name
	}, ; 72
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b1f, ; name: n_GetSurroundingText_III_mm_wrapper(IntPtr,IntPtr,Int32,Int32,Int32)
		ptr @.MarshalMethodName.72_name; char* name
	}, ; 73
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b20, ; name: n_PerformHandwritingGesture_Landroid_view_inputmethod_HandwritingGesture_Ljava_util_concurrent_Executor_Ljava_util_function_IntConsumer__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.73_name; char* name
	}, ; 74
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b21, ; name: n_PerformSpellCheck_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.74_name; char* name
	}, ; 75
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b22, ; name: n_PreviewHandwritingGesture_Landroid_view_inputmethod_PreviewableHandwritingGesture_Landroid_os_CancellationSignal__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.75_name; char* name
	}, ; 76
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b23, ; name: n_ReplaceText_IILjava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,Int32,Int32,IntPtr,Int32,IntPtr)
		ptr @.MarshalMethodName.76_name; char* name
	}, ; 77
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b24, ; name: n_RequestTextBoundsInfo_Landroid_graphics_RectF_Ljava_util_concurrent_Executor_Ljava_util_function_Consumer__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.77_name; char* name
	}, ; 78
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b25, ; name: n_SetImeConsumesInput_Z_mm_wrapper(IntPtr,IntPtr,SByte)
		ptr @.MarshalMethodName.78_name; char* name
	}, ; 79
	%struct.MarshalMethodName {
		i64 u0x0000003f06000b26, ; name: n_TakeSnapshot_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.79_name; char* name
	}, ; 80
	%struct.MarshalMethodName {
		i64 u0x00000013060000ab, ; name: n_OnContextAvailable_Landroid_content_Context__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.80_name; char* name
	}, ; 81
	%struct.MarshalMethodName {
		i64 u0x00000014060001aa, ; name: n_OnMenuVisibilityChanged_Z_mm_wrapper(IntPtr,IntPtr,Byte)
		ptr @.MarshalMethodName.81_name; char* name
	}, ; 82
	%struct.MarshalMethodName {
		i64 u0x0000003f060004ac, ; name: n_OnClick_Landroid_view_View__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.82_name; char* name
	}, ; 83
	%struct.MarshalMethodName {
		i64 u0x00000014060004c4, ; name: n_OnMenuItemClick_Landroid_view_MenuItem__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.83_name; char* name
	}, ; 84
	%struct.MarshalMethodName {
		i64 u0x0000001506000263, ; name: n_OnSubUiVisibilityChanged_Z_mm_wrapper(IntPtr,IntPtr,Byte)
		ptr @.MarshalMethodName.84_name; char* name
	}, ; 85
	%struct.MarshalMethodName {
		i64 u0x0000001506000274, ; name: n_OnActionProviderVisibilityChanged_Z_mm_wrapper(IntPtr,IntPtr,Byte)
		ptr @.MarshalMethodName.85_name; char* name
	}, ; 86
	%struct.MarshalMethodName {
		i64 u0x000000150600050b, ; name: n_OnControllableInsetsChanged_Landroidx_core_view_WindowInsetsControllerCompat_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.86_name; char* name
	}, ; 87
	%struct.MarshalMethodName {
		i64 u0x00000016060000cb, ; name: n_OnDrawerClosed_Landroid_view_View__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.87_name; char* name
	}, ; 88
	%struct.MarshalMethodName {
		i64 u0x00000016060000cc, ; name: n_OnDrawerOpened_Landroid_view_View__mm_wrapper(IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.88_name; char* name
	}, ; 89
	%struct.MarshalMethodName {
		i64 u0x00000016060000cd, ; name: n_OnDrawerSlide_Landroid_view_View_F_mm_wrapper(IntPtr,IntPtr,IntPtr,Single)
		ptr @.MarshalMethodName.89_name; char* name
	}, ; 90
	%struct.MarshalMethodName {
		i64 u0x00000016060000ce, ; name: n_OnDrawerStateChanged_I_mm_wrapper(IntPtr,IntPtr,Int32)
		ptr @.MarshalMethodName.90_name; char* name
	}, ; 91
	%struct.MarshalMethodName {
		i64 u0x00000017060002f0, ; name: n_OnBackStackChanged_mm_wrapper(IntPtr,IntPtr)
		ptr @.MarshalMethodName.91_name; char* name
	}, ; 92
	%struct.MarshalMethodName {
		i64 u0x00000017060002e3, ; name: n_OnBackStackChangeCommitted_Landroidx_fragment_app_Fragment_Z_mm_wrapper(IntPtr,IntPtr,IntPtr,Byte)
		ptr @.MarshalMethodName.92_name; char* name
	}, ; 93
	%struct.MarshalMethodName {
		i64 u0x00000017060002e4, ; name: n_OnBackStackChangeStarted_Landroidx_fragment_app_Fragment_Z_mm_wrapper(IntPtr,IntPtr,IntPtr,Byte)
		ptr @.MarshalMethodName.93_name; char* name
	}, ; 94
	%struct.MarshalMethodName {
		i64 u0x0000001706000392, ; name: n_OnAttachFragment_Landroidx_fragment_app_FragmentManager_Landroidx_fragment_app_Fragment__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.94_name; char* name
	}, ; 95
	%struct.MarshalMethodName {
		i64 u0x0000003f06001501, ; name: n_Activate_mm(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)
		ptr @.MarshalMethodName.95_name; char* name
	}, ; 96
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.96_name; char* name
	} ; 97
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Marshal methods backing fields, pointers to native functions
@native_cb_onFocusChange_0_0_60004b7 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_close_0_1_60011b5 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_1_60011b6 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_1_60011b7 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_read_0_1_60011b8 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_equals_0_2_6001399 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_hashCode_0_2_600139a = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_toString_0_2_600139b = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_close_0_3_60011d5 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_flush_0_3_60011d6 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_3_60011d7 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_3_60011d8 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_write_0_3_60011d9 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_run_0_4_6001451 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onBackPressed_0_5_60010f7 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onCreate_0_5_60010f8 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onStop_0_5_60010f9 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onStart_0_5_60010fa = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onResume_0_5_60010fb = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDestroy_0_5_60010fc = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onActivityResult_0_5_60010fd = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onRequestPermissionsResult_0_5_60010fe = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onGlobalLayout_0_6_6000518 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_dispatchKeyEvent_0_7_600048e = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onVisibilityAggregated_0_7_600048f = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onVisibilityChanged_0_7_6000490 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onConfigurationChanged_0_7_6000491 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_doFrame_0_8_60005d6 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_invalidate_0_7_6000492 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_surfaceChanged_0_9_6000800 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_surfaceCreated_0_9_6000801 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_surfaceDestroyed_0_9_6000802 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onStart_1_10_600045e = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onProgress_1_10_600045f = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onApplyWindowInsets_1_11_60002c9 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDisplayAdded_0_12_6000edc = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDisplayChanged_0_12_6000edd = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDisplayRemoved_0_12_6000ede = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_dispatchDraw_0_7_6000493 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_dispatchGenericPointerEvent_0_7_6000494 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_dispatchTouchEvent_0_7_6000495 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onCheckIsTextEditor_0_7_6000496 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onCreateInputConnection_0_7_6000497 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getHandler_0_13_6000b62 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_beginBatchEdit_0_13_6000b63 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_clearMetaKeyStates_0_13_6000b64 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_closeConnection_0_13_6000b65 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_commitCompletion_0_13_6000b66 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_commitContent_0_13_6000b67 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_commitCorrection_0_13_6000b68 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_commitText_0_13_6000b69 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_commitText_0_14_6000b1b = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_deleteSurroundingText_0_13_6000b6a = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_deleteSurroundingTextInCodePoints_0_13_6000b6b = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_endBatchEdit_0_13_6000b6c = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_finishComposingText_0_13_6000b6d = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getCursorCapsMode_0_13_6000b6e = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getExtractedText_0_13_6000b6f = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getSelectedText_0_13_6000b70 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getTextAfterCursor_0_13_6000b71 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getTextBeforeCursor_0_13_6000b72 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_performContextMenuAction_0_13_6000b73 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_performEditorAction_0_13_6000b74 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_performPrivateCommand_0_13_6000b75 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_reportFullscreenMode_0_13_6000b76 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_requestCursorUpdates_0_13_6000b77 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_requestCursorUpdates_0_14_6000b1c = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_sendKeyEvent_0_13_6000b78 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_setComposingRegion_0_13_6000b79 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_setComposingRegion_0_14_6000b1d = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_setComposingText_0_13_6000b7a = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_setComposingText_0_14_6000b1e = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_setSelection_0_13_6000b7b = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_getSurroundingText_0_14_6000b1f = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_performHandwritingGesture_0_14_6000b20 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_performSpellCheck_0_14_6000b21 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_previewHandwritingGesture_0_14_6000b22 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_replaceText_0_14_6000b23 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_requestTextBoundsInfo_0_14_6000b24 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_setImeConsumesInput_0_14_6000b25 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_takeSnapshot_0_14_6000b26 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onContextAvailable_2_15_60000ab = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onMenuVisibilityChanged_3_16_60001aa = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onClick_0_17_60004ac = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onMenuItemClick_3_18_60004c4 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onSubUiVisibilityChanged_1_19_6000263 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onActionProviderVisibilityChanged_1_20_6000274 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onControllableInsetsChanged_1_21_600050b = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDrawerClosed_4_22_60000cb = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDrawerOpened_4_22_60000cc = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDrawerSlide_4_22_60000cd = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onDrawerStateChanged_4_22_60000ce = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onBackStackChanged_5_23_60002f0 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onBackStackChangeCommitted_5_24_60002e3 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onBackStackChangeStarted_5_24_60002e4 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_onAttachFragment_5_25_6000392 = internal dso_local unnamed_addr global ptr null, align 8
@native_cb_activate_0_26_6001501 = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.mm.27)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Method: System.Void Android.Views.View/IOnFocusChangeListenerInvoker::n_OnFocusChange_Landroid_view_View_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.SByte)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View/IOnFocusChangeListener::OnFocusChange(Android.Views.View,System.Boolean)
; Implemented: System.Void Android.Views.View/IOnFocusChangeListener::OnFocusChange(Android.Views.View,System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_view_View_1OnFocusChangeListenerImplementor_n_1onFocusChange(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i1 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onFocusChange_0_0_60004b7, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 0, i32 noundef 100664503, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onFocusChange_0_0_60004b7)
	%cb2 = load ptr, ptr @native_cb_onFocusChange_0_0_60004b7, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i1 noundef %1)
	ret void
}

; Method: System.Void Java.IO.InputStream::n_Close_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.InputStream::Close()
; Implemented: System.Void Android.Runtime.InputStreamAdapter::Close()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_InputStreamAdapter_n_1close(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_close_0_1_60011b5, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 1, i32 noundef 100667829, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_close_0_1_60011b5)
	%cb2 = load ptr, ptr @native_cb_close_0_1_60011b5, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Int32 Java.IO.InputStream::n_Read_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read()
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_1_60011b6, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 1, i32 noundef 100667830, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_1_60011b6)
	%cb2 = load ptr, ptr @native_cb_read_0_1_60011b6, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass)
	ret i32 %1
}

; Method: System.Int32 Java.IO.InputStream::n_Read_arrayB_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read(System.Byte[])
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read(System.Byte[])
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read___3B(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_1_60011b7, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 1, i32 noundef 100667831, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_1_60011b7)
	%cb2 = load ptr, ptr @native_cb_read_0_1_60011b7, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes)
	ret i32 %1
}

; Method: System.Int32 Java.IO.InputStream::n_Read_arrayBII_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.IO.InputStream::Read(System.Byte[],System.Int32,System.Int32)
; Implemented: System.Int32 Android.Runtime.InputStreamAdapter::Read(System.Byte[],System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_InputStreamAdapter_n_1read___3BII(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes, i32 noundef %offset, i32 noundef %length) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_read_0_1_60011b8, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 1, i32 noundef 100667832, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_read_0_1_60011b8)
	%cb2 = load ptr, ptr @native_cb_read_0_1_60011b8, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %bytes, i32 noundef %offset, i32 noundef %length)
	ret i32 %1
}

; Method: System.SByte Java.Lang.Object::n_Equals_Ljava_lang_Object__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Java.Lang.Object::Equals(Java.Lang.Object)
; Implemented: System.Boolean Android.Runtime.JavaObject::Equals(Java.Lang.Object)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_mono_android_runtime_JavaObject_n_1equals(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_equals_0_2_6001399, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 2, i32 noundef 100668313, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_equals_0_2_6001399)
	%cb2 = load ptr, ptr @native_cb_equals_0_2_6001399, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.Int32 Java.Lang.Object::n_GetHashCode_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Int32 Java.Lang.Object::GetHashCode()
; Implemented: System.Int32 Android.Runtime.JavaObject::GetHashCode()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_mono_android_runtime_JavaObject_n_1hashCode(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_hashCode_0_2_600139a, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 2, i32 noundef 100668314, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_hashCode_0_2_600139a)
	%cb2 = load ptr, ptr @native_cb_hashCode_0_2_600139a, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass)
	ret i32 %1
}

; Method: System.IntPtr Java.Lang.Object::n_ToString_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.String Java.Lang.Object::ToString()
; Implemented: System.String Android.Runtime.JavaObject::ToString()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_mono_android_runtime_JavaObject_n_1toString(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_toString_0_2_600139b, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 2, i32 noundef 100668315, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_toString_0_2_600139b)
	%cb2 = load ptr, ptr @native_cb_toString_0_2_600139b, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass)
	ret ptr %1
}

; Method: System.Void Java.IO.OutputStream::n_Close_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Close()
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Close()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1close(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_close_0_3_60011d5, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 3, i32 noundef 100667861, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_close_0_3_60011d5)
	%cb2 = load ptr, ptr @native_cb_close_0_3_60011d5, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Flush_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Flush()
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Flush()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1flush(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_flush_0_3_60011d6, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 3, i32 noundef 100667862, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_flush_0_3_60011d6)
	%cb2 = load ptr, ptr @native_cb_flush_0_3_60011d6, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_arrayB_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Byte[])
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Byte[])
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write___3B(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_3_60011d7, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 3, i32 noundef 100667863, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_3_60011d7)
	%cb2 = load ptr, ptr @native_cb_write_0_3_60011d7, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_arrayBII_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Byte[],System.Int32,System.Int32)
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Byte[],System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write___3BII(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer, i32 noundef %offset, i32 noundef %length) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_3_60011d8, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 3, i32 noundef 100667864, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_3_60011d8)
	%cb2 = load ptr, ptr @native_cb_write_0_3_60011d8, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %buffer, i32 noundef %offset, i32 noundef %length)
	ret void
}

; Method: System.Void Java.IO.OutputStream::n_Write_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.IO.OutputStream::Write(System.Int32)
; Implemented: System.Void Android.Runtime.OutputStreamAdapter::Write(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_runtime_OutputStreamAdapter_n_1write__I(ptr noundef %env, ptr noundef %klass, i32 noundef %oneByte) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_write_0_3_60011d9, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 3, i32 noundef 100667865, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_write_0_3_60011d9)
	%cb2 = load ptr, ptr @native_cb_write_0_3_60011d9, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %oneByte)
	ret void
}

; Method: System.Void Java.Lang.IRunnableInvoker::n_Run_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Java.Lang.IRunnable::Run()
; Implemented: System.Void Java.Lang.IRunnable::Run()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_java_lang_RunnableImplementor_n_1run(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_run_0_4_6001451, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 4, i32 noundef 100668497, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_run_0_4_6001451)
	%cb2 = load ptr, ptr @native_cb_run_0_4_6001451, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnBackPressed_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnBackPressed()
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnBackPressed()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onBackPressed(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onBackPressed_0_5_60010f7, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 5, i32 noundef 100667639, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onBackPressed_0_5_60010f7)
	%cb2 = load ptr, ptr @native_cb_onBackPressed_0_5_60010f7, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnCreate_Landroid_os_Bundle__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnCreate(Android.OS.Bundle)
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnCreate(Android.OS.Bundle)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onCreate(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onCreate_0_5_60010f8, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 5, i32 noundef 100667640, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onCreate_0_5_60010f8)
	%cb2 = load ptr, ptr @native_cb_onCreate_0_5_60010f8, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnStop_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnStop()
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnStop()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onStop(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onStop_0_5_60010f9, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 5, i32 noundef 100667641, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onStop_0_5_60010f9)
	%cb2 = load ptr, ptr @native_cb_onStop_0_5_60010f9, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnStart_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnStart()
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnStart()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onStart(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onStart_0_5_60010fa, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 5, i32 noundef 100667642, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onStart_0_5_60010fa)
	%cb2 = load ptr, ptr @native_cb_onStart_0_5_60010fa, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnResume_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnResume()
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnResume()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onResume(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onResume_0_5_60010fb, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 5, i32 noundef 100667643, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onResume_0_5_60010fb)
	%cb2 = load ptr, ptr @native_cb_onResume_0_5_60010fb, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnDestroy_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnDestroy()
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnDestroy()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onDestroy(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDestroy_0_5_60010fc, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 5, i32 noundef 100667644, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDestroy_0_5_60010fc)
	%cb2 = load ptr, ptr @native_cb_onDestroy_0_5_60010fc, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnActivityResult_IILandroid_content_Intent__mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnActivityResult(System.Int32,Android.App.Result,Android.Content.Intent)
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnActivityResult(System.Int32,Android.App.Result,Android.Content.Intent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onActivityResult(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onActivityResult_0_5_60010fd, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 5, i32 noundef 100667645, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onActivityResult_0_5_60010fd)
	%cb2 = load ptr, ptr @native_cb_onActivityResult_0_5_60010fd, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, ptr noundef %2)
	ret void
}

; Method: System.Void Android.App.Activity::n_OnRequestPermissionsResult_IarrayLjava_lang_String_arrayI_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.App.Activity::OnRequestPermissionsResult(System.Int32,System.String[],Android.Content.PM.Permission[])
; Implemented: System.Void Avalonia.Android.AvaloniaActivity::OnRequestPermissionsResult(System.Int32,System.String[],Android.Content.PM.Permission[])
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_n_1onRequestPermissionsResult(ptr noundef %env, ptr noundef %klass, i32 noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onRequestPermissionsResult_0_5_60010fe, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 5, i32 noundef 100667646, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onRequestPermissionsResult_0_5_60010fe)
	%cb2 = load ptr, ptr @native_cb_onRequestPermissionsResult_0_5_60010fe, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, ptr noundef %1, ptr noundef %2)
	ret void
}

; Method: System.Void Android.Views.ViewTreeObserver/IOnGlobalLayoutListenerInvoker::n_OnGlobalLayout_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ViewTreeObserver/IOnGlobalLayoutListener::OnGlobalLayout()
; Implemented: System.Void Android.Views.ViewTreeObserver/IOnGlobalLayoutListener::OnGlobalLayout()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaActivity_1GlobalLayoutListener_n_1onGlobalLayout__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onGlobalLayout_0_6_6000518, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 6, i32 noundef 100664600, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onGlobalLayout_0_6_6000518)
	%cb2 = load ptr, ptr @native_cb_onGlobalLayout_0_6_6000518, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.Views.ViewTreeObserver/IOnGlobalLayoutListenerInvoker::n_OnGlobalLayout_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ViewTreeObserver/IOnGlobalLayoutListener::OnGlobalLayout()
; Implemented: System.Void Android.Views.ViewTreeObserver/IOnGlobalLayoutListener::OnGlobalLayout()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc641fe58d40b3a958ab_AndroidInsetsManager_n_1onGlobalLayout__(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onGlobalLayout_0_6_6000518, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 6, i32 noundef 100664600, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onGlobalLayout_0_6_6000518)
	%cb2 = load ptr, ptr @native_cb_onGlobalLayout_0_6_6000518, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.SByte Android.Views.View::n_DispatchKeyEvent_Landroid_view_KeyEvent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.View::DispatchKeyEvent(Android.Views.KeyEvent)
; Implemented: System.Boolean Avalonia.Android.AvaloniaView::DispatchKeyEvent(Android.Views.KeyEvent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc6431345fe65afe8d98_AvaloniaView_n_1dispatchKeyEvent__Landroid_view_KeyEvent_2(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_dispatchKeyEvent_0_7_600048e, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 7, i32 noundef 100664462, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_dispatchKeyEvent_0_7_600048e)
	%cb2 = load ptr, ptr @native_cb_dispatchKeyEvent_0_7_600048e, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.View::n_DispatchKeyEvent_Landroid_view_KeyEvent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.View::DispatchKeyEvent(Android.Views.KeyEvent)
; Implemented: System.Boolean Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl/ViewImpl::DispatchKeyEvent(Android.Views.KeyEvent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc64bd239b21961e24ab_TopLevelImpl_1ViewImpl_n_1dispatchKeyEvent__Landroid_view_KeyEvent_2(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_dispatchKeyEvent_0_7_600048e, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 7, i32 noundef 100664462, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_dispatchKeyEvent_0_7_600048e)
	%cb2 = load ptr, ptr @native_cb_dispatchKeyEvent_0_7_600048e, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.Void Android.Views.View::n_OnVisibilityAggregated_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.SByte)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View::OnVisibilityAggregated(System.Boolean)
; Implemented: System.Void Avalonia.Android.AvaloniaView::OnVisibilityAggregated(System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaView_n_1onVisibilityAggregated(ptr noundef %env, ptr noundef %klass, i1 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onVisibilityAggregated_0_7_600048f, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 7, i32 noundef 100664463, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onVisibilityAggregated_0_7_600048f)
	%cb2 = load ptr, ptr @native_cb_onVisibilityAggregated_0_7_600048f, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i1 noundef %0)
	ret void
}

; Method: System.Void Android.Views.View::n_OnVisibilityChanged_Landroid_view_View_I_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View::OnVisibilityChanged(Android.Views.View,Android.Views.ViewStates)
; Implemented: System.Void Avalonia.Android.AvaloniaView::OnVisibilityChanged(Android.Views.View,Android.Views.ViewStates)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaView_n_1onVisibilityChanged(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onVisibilityChanged_0_7_6000490, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 7, i32 noundef 100664464, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onVisibilityChanged_0_7_6000490)
	%cb2 = load ptr, ptr @native_cb_onVisibilityChanged_0_7_6000490, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1)
	ret void
}

; Method: System.Void Android.Views.View::n_OnConfigurationChanged_Landroid_content_res_Configuration__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View::OnConfigurationChanged(Android.Content.Res.Configuration)
; Implemented: System.Void Avalonia.Android.AvaloniaView::OnConfigurationChanged(Android.Content.Res.Configuration)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_AvaloniaView_n_1onConfigurationChanged(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onConfigurationChanged_0_7_6000491, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 7, i32 noundef 100664465, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onConfigurationChanged_0_7_6000491)
	%cb2 = load ptr, ptr @native_cb_onConfigurationChanged_0_7_6000491, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void Android.Views.Choreographer/IFrameCallbackInvoker::n_DoFrame_J_mm_wrapper(System.IntPtr,System.IntPtr,System.Int64)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.Choreographer/IFrameCallback::DoFrame(System.Int64)
; Implemented: System.Void Android.Views.Choreographer/IFrameCallback::DoFrame(System.Int64)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_ChoreographerTimer_n_1doFrame(ptr noundef %env, ptr noundef %klass, i64 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_doFrame_0_8_60005d6, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 8, i32 noundef 100664790, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_doFrame_0_8_60005d6)
	%cb2 = load ptr, ptr @native_cb_doFrame_0_8_60005d6, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i64 noundef %0)
	ret void
}

; Method: System.Void Android.Views.View::n_Invalidate_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View::Invalidate()
; Implemented: System.Void Avalonia.Android.InvalidationAwareSurfaceView::Invalidate()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_InvalidationAwareSurfaceView_n_1invalidate(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_invalidate_0_7_6000492, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 7, i32 noundef 100664466, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_invalidate_0_7_6000492)
	%cb2 = load ptr, ptr @native_cb_invalidate_0_7_6000492, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void Android.Views.ISurfaceHolderCallbackInvoker::n_SurfaceChanged_Landroid_view_SurfaceHolder_III_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ISurfaceHolderCallback::SurfaceChanged(Android.Views.ISurfaceHolder,Android.Graphics.Format,System.Int32,System.Int32)
; Implemented: System.Void Android.Views.ISurfaceHolderCallback::SurfaceChanged(Android.Views.ISurfaceHolder,Android.Graphics.Format,System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_InvalidationAwareSurfaceView_n_1surfaceChanged__Landroid_view_SurfaceHolder_2III(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_surfaceChanged_0_9_6000800, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %4
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 9, i32 noundef 100665344, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_surfaceChanged_0_9_6000800)
	%cb2 = load ptr, ptr @native_cb_surfaceChanged_0_9_6000800, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %4
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %4]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3)
	ret void
}

; Method: System.Void Android.Views.ISurfaceHolderCallbackInvoker::n_SurfaceChanged_Landroid_view_SurfaceHolder_III_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ISurfaceHolderCallback::SurfaceChanged(Android.Views.ISurfaceHolder,Android.Graphics.Format,System.Int32,System.Int32)
; Implemented: System.Void Android.Views.ISurfaceHolderCallback::SurfaceChanged(Android.Views.ISurfaceHolder,Android.Graphics.Format,System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64bd239b21961e24ab_TopLevelImpl_1ViewImpl_n_1surfaceChanged__Landroid_view_SurfaceHolder_2III(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_surfaceChanged_0_9_6000800, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %4
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 9, i32 noundef 100665344, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_surfaceChanged_0_9_6000800)
	%cb2 = load ptr, ptr @native_cb_surfaceChanged_0_9_6000800, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %4
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %4]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3)
	ret void
}

; Method: System.Void Android.Views.ISurfaceHolderCallbackInvoker::n_SurfaceCreated_Landroid_view_SurfaceHolder__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ISurfaceHolderCallback::SurfaceCreated(Android.Views.ISurfaceHolder)
; Implemented: System.Void Android.Views.ISurfaceHolderCallback::SurfaceCreated(Android.Views.ISurfaceHolder)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_InvalidationAwareSurfaceView_n_1surfaceCreated__Landroid_view_SurfaceHolder_2(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_surfaceCreated_0_9_6000801, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 9, i32 noundef 100665345, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_surfaceCreated_0_9_6000801)
	%cb2 = load ptr, ptr @native_cb_surfaceCreated_0_9_6000801, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void Android.Views.ISurfaceHolderCallbackInvoker::n_SurfaceCreated_Landroid_view_SurfaceHolder__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ISurfaceHolderCallback::SurfaceCreated(Android.Views.ISurfaceHolder)
; Implemented: System.Void Android.Views.ISurfaceHolderCallback::SurfaceCreated(Android.Views.ISurfaceHolder)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64bd239b21961e24ab_TopLevelImpl_1ViewImpl_n_1surfaceCreated__Landroid_view_SurfaceHolder_2(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_surfaceCreated_0_9_6000801, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 9, i32 noundef 100665345, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_surfaceCreated_0_9_6000801)
	%cb2 = load ptr, ptr @native_cb_surfaceCreated_0_9_6000801, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void Android.Views.ISurfaceHolderCallbackInvoker::n_SurfaceDestroyed_Landroid_view_SurfaceHolder__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ISurfaceHolderCallback::SurfaceDestroyed(Android.Views.ISurfaceHolder)
; Implemented: System.Void Android.Views.ISurfaceHolderCallback::SurfaceDestroyed(Android.Views.ISurfaceHolder)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc6431345fe65afe8d98_InvalidationAwareSurfaceView_n_1surfaceDestroyed__Landroid_view_SurfaceHolder_2(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_surfaceDestroyed_0_9_6000802, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 9, i32 noundef 100665346, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_surfaceDestroyed_0_9_6000802)
	%cb2 = load ptr, ptr @native_cb_surfaceDestroyed_0_9_6000802, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void Android.Views.ISurfaceHolderCallbackInvoker::n_SurfaceDestroyed_Landroid_view_SurfaceHolder__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.ISurfaceHolderCallback::SurfaceDestroyed(Android.Views.ISurfaceHolder)
; Implemented: System.Void Android.Views.ISurfaceHolderCallback::SurfaceDestroyed(Android.Views.ISurfaceHolder)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64bd239b21961e24ab_TopLevelImpl_1ViewImpl_n_1surfaceDestroyed__Landroid_view_SurfaceHolder_2(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_surfaceDestroyed_0_9_6000802, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 9, i32 noundef 100665346, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_surfaceDestroyed_0_9_6000802)
	%cb2 = load ptr, ptr @native_cb_surfaceDestroyed_0_9_6000802, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.IntPtr AndroidX.Core.View.WindowInsetsAnimationCompat/Callback::n_OnStart_Landroidx_core_view_WindowInsetsAnimationCompat_Landroidx_core_view_WindowInsetsAnimationCompat_BoundsCompat__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: AndroidX.Core.View.WindowInsetsAnimationCompat/BoundsCompat AndroidX.Core.View.WindowInsetsAnimationCompat/Callback::OnStart(AndroidX.Core.View.WindowInsetsAnimationCompat,AndroidX.Core.View.WindowInsetsAnimationCompat/BoundsCompat)
; Implemented: AndroidX.Core.View.WindowInsetsAnimationCompat/BoundsCompat Avalonia.Android.Platform.AndroidInsetsManager::OnStart(AndroidX.Core.View.WindowInsetsAnimationCompat,AndroidX.Core.View.WindowInsetsAnimationCompat/BoundsCompat)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc641fe58d40b3a958ab_AndroidInsetsManager_n_1onStart(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onStart_1_10_600045e, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 21, i32 noundef 10, i32 noundef 100664414, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onStart_1_10_600045e)
	%cb2 = load ptr, ptr @native_cb_onStart_1_10_600045e, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret ptr %3
}

; Method: System.IntPtr AndroidX.Core.View.WindowInsetsAnimationCompat/Callback::n_OnProgress_Landroidx_core_view_WindowInsetsCompat_Ljava_util_List__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: AndroidX.Core.View.WindowInsetsCompat AndroidX.Core.View.WindowInsetsAnimationCompat/Callback::OnProgress(AndroidX.Core.View.WindowInsetsCompat,System.Collections.Generic.IList`1<AndroidX.Core.View.WindowInsetsAnimationCompat>)
; Implemented: AndroidX.Core.View.WindowInsetsCompat Avalonia.Android.Platform.AndroidInsetsManager::OnProgress(AndroidX.Core.View.WindowInsetsCompat,System.Collections.Generic.IList`1<AndroidX.Core.View.WindowInsetsAnimationCompat>)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc641fe58d40b3a958ab_AndroidInsetsManager_n_1onProgress(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onProgress_1_10_600045f, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 21, i32 noundef 10, i32 noundef 100664415, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onProgress_1_10_600045f)
	%cb2 = load ptr, ptr @native_cb_onProgress_1_10_600045f, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret ptr %3
}

; Method: System.IntPtr AndroidX.Core.View.IOnApplyWindowInsetsListenerInvoker::n_OnApplyWindowInsets_Landroid_view_View_Landroidx_core_view_WindowInsetsCompat__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: AndroidX.Core.View.WindowInsetsCompat AndroidX.Core.View.IOnApplyWindowInsetsListener::OnApplyWindowInsets(Android.Views.View,AndroidX.Core.View.WindowInsetsCompat)
; Implemented: AndroidX.Core.View.WindowInsetsCompat AndroidX.Core.View.IOnApplyWindowInsetsListener::OnApplyWindowInsets(Android.Views.View,AndroidX.Core.View.WindowInsetsCompat)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc641fe58d40b3a958ab_AndroidInsetsManager_n_1onApplyWindowInsets(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onApplyWindowInsets_1_11_60002c9, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 21, i32 noundef 11, i32 noundef 100664009, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onApplyWindowInsets_1_11_60002c9)
	%cb2 = load ptr, ptr @native_cb_onApplyWindowInsets_1_11_60002c9, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret ptr %3
}

; Method: System.Void Android.Hardware.Display.DisplayManager/IDisplayListenerInvoker::n_OnDisplayAdded_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Hardware.Display.DisplayManager/IDisplayListener::OnDisplayAdded(System.Int32)
; Implemented: System.Void Android.Hardware.Display.DisplayManager/IDisplayListener::OnDisplayAdded(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc641fe58d40b3a958ab_AndroidScreens_1DisplayListener_n_1onDisplayAdded(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDisplayAdded_0_12_6000edc, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 12, i32 noundef 100667100, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDisplayAdded_0_12_6000edc)
	%cb2 = load ptr, ptr @native_cb_onDisplayAdded_0_12_6000edc, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret void
}

; Method: System.Void Android.Hardware.Display.DisplayManager/IDisplayListenerInvoker::n_OnDisplayChanged_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Hardware.Display.DisplayManager/IDisplayListener::OnDisplayChanged(System.Int32)
; Implemented: System.Void Android.Hardware.Display.DisplayManager/IDisplayListener::OnDisplayChanged(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc641fe58d40b3a958ab_AndroidScreens_1DisplayListener_n_1onDisplayChanged(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDisplayChanged_0_12_6000edd, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 12, i32 noundef 100667101, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDisplayChanged_0_12_6000edd)
	%cb2 = load ptr, ptr @native_cb_onDisplayChanged_0_12_6000edd, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret void
}

; Method: System.Void Android.Hardware.Display.DisplayManager/IDisplayListenerInvoker::n_OnDisplayRemoved_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Hardware.Display.DisplayManager/IDisplayListener::OnDisplayRemoved(System.Int32)
; Implemented: System.Void Android.Hardware.Display.DisplayManager/IDisplayListener::OnDisplayRemoved(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc641fe58d40b3a958ab_AndroidScreens_1DisplayListener_n_1onDisplayRemoved(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDisplayRemoved_0_12_6000ede, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 12, i32 noundef 100667102, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDisplayRemoved_0_12_6000ede)
	%cb2 = load ptr, ptr @native_cb_onDisplayRemoved_0_12_6000ede, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret void
}

; Method: System.Void Android.Views.View::n_DispatchDraw_Landroid_graphics_Canvas__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View::DispatchDraw(Android.Graphics.Canvas)
; Implemented: System.Void Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl/ViewImpl::DispatchDraw(Android.Graphics.Canvas)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc64bd239b21961e24ab_TopLevelImpl_1ViewImpl_n_1dispatchDraw(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_dispatchDraw_0_7_6000493, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 7, i32 noundef 100664467, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_dispatchDraw_0_7_6000493)
	%cb2 = load ptr, ptr @native_cb_dispatchDraw_0_7_6000493, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.SByte Android.Views.View::n_DispatchGenericPointerEvent_Landroid_view_MotionEvent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.View::DispatchGenericPointerEvent(Android.Views.MotionEvent)
; Implemented: System.Boolean Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl/ViewImpl::DispatchGenericPointerEvent(Android.Views.MotionEvent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc64bd239b21961e24ab_TopLevelImpl_1ViewImpl_n_1dispatchGenericPointerEvent(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_dispatchGenericPointerEvent_0_7_6000494, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 7, i32 noundef 100664468, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_dispatchGenericPointerEvent_0_7_6000494)
	%cb2 = load ptr, ptr @native_cb_dispatchGenericPointerEvent_0_7_6000494, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.View::n_DispatchTouchEvent_Landroid_view_MotionEvent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.View::DispatchTouchEvent(Android.Views.MotionEvent)
; Implemented: System.Boolean Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl/ViewImpl::DispatchTouchEvent(Android.Views.MotionEvent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc64bd239b21961e24ab_TopLevelImpl_1ViewImpl_n_1dispatchTouchEvent(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_dispatchTouchEvent_0_7_6000495, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 7, i32 noundef 100664469, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_dispatchTouchEvent_0_7_6000495)
	%cb2 = load ptr, ptr @native_cb_dispatchTouchEvent_0_7_6000495, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.View::n_OnCheckIsTextEditor_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.View::OnCheckIsTextEditor()
; Implemented: System.Boolean Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl/ViewImpl::OnCheckIsTextEditor()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc64bd239b21961e24ab_TopLevelImpl_1ViewImpl_n_1onCheckIsTextEditor(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onCheckIsTextEditor_0_7_6000496, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 7, i32 noundef 100664470, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onCheckIsTextEditor_0_7_6000496)
	%cb2 = load ptr, ptr @native_cb_onCheckIsTextEditor_0_7_6000496, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass)
	ret i1 %1
}

; Method: System.IntPtr Android.Views.View::n_OnCreateInputConnection_Landroid_view_inputmethod_EditorInfo__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.Views.InputMethods.IInputConnection Android.Views.View::OnCreateInputConnection(Android.Views.InputMethods.EditorInfo)
; Implemented: Android.Views.InputMethods.IInputConnection Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl/ViewImpl::OnCreateInputConnection(Android.Views.InputMethods.EditorInfo)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc64bd239b21961e24ab_TopLevelImpl_1ViewImpl_n_1onCreateInputConnection(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onCreateInputConnection_0_7_6000497, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 7, i32 noundef 100664471, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onCreateInputConnection_0_7_6000497)
	%cb2 = load ptr, ptr @native_cb_onCreateInputConnection_0_7_6000497, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret ptr %2
}

; Method: System.IntPtr Android.Views.InputMethods.IInputConnectionInvoker::n_GetHandler_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.OS.Handler Android.Views.InputMethods.IInputConnection::get_Handler()
; Implemented: Android.OS.Handler Android.Views.InputMethods.IInputConnection::get_Handler()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1getHandler(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getHandler_0_13_6000b62, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666210, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getHandler_0_13_6000b62)
	%cb2 = load ptr, ptr @native_cb_getHandler_0_13_6000b62, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass)
	ret ptr %1
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_BeginBatchEdit_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::BeginBatchEdit()
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::BeginBatchEdit()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1beginBatchEdit(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_beginBatchEdit_0_13_6000b63, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666211, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_beginBatchEdit_0_13_6000b63)
	%cb2 = load ptr, ptr @native_cb_beginBatchEdit_0_13_6000b63, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass)
	ret i1 %1
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_ClearMetaKeyStates_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::ClearMetaKeyStates(Android.Views.MetaKeyStates)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::ClearMetaKeyStates(Android.Views.MetaKeyStates)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1clearMetaKeyStates(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_clearMetaKeyStates_0_13_6000b64, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666212, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_clearMetaKeyStates_0_13_6000b64)
	%cb2 = load ptr, ptr @native_cb_clearMetaKeyStates_0_13_6000b64, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret i1 %2
}

; Method: System.Void Android.Views.InputMethods.IInputConnectionInvoker::n_CloseConnection_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.InputMethods.IInputConnection::CloseConnection()
; Implemented: System.Void Android.Views.InputMethods.IInputConnection::CloseConnection()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1closeConnection(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_closeConnection_0_13_6000b65, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666213, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_closeConnection_0_13_6000b65)
	%cb2 = load ptr, ptr @native_cb_closeConnection_0_13_6000b65, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_CommitCompletion_Landroid_view_inputmethod_CompletionInfo__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::CommitCompletion(Android.Views.InputMethods.CompletionInfo)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::CommitCompletion(Android.Views.InputMethods.CompletionInfo)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1commitCompletion(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_commitCompletion_0_13_6000b66, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666214, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_commitCompletion_0_13_6000b66)
	%cb2 = load ptr, ptr @native_cb_commitCompletion_0_13_6000b66, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_CommitContent_Landroid_view_inputmethod_InputContentInfo_ILandroid_os_Bundle__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::CommitContent(Android.Views.InputMethods.InputContentInfo,Android.Views.InputMethods.InputContentFlags,Android.OS.Bundle)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::CommitContent(Android.Views.InputMethods.InputContentInfo,Android.Views.InputMethods.InputContentFlags,Android.OS.Bundle)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1commitContent(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_commitContent_0_13_6000b67, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666215, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_commitContent_0_13_6000b67)
	%cb2 = load ptr, ptr @native_cb_commitContent_0_13_6000b67, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	%4 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, ptr noundef %2)
	ret i1 %4
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_CommitCorrection_Landroid_view_inputmethod_CorrectionInfo__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::CommitCorrection(Android.Views.InputMethods.CorrectionInfo)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::CommitCorrection(Android.Views.InputMethods.CorrectionInfo)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1commitCorrection(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_commitCorrection_0_13_6000b68, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666216, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_commitCorrection_0_13_6000b68)
	%cb2 = load ptr, ptr @native_cb_commitCorrection_0_13_6000b68, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_CommitText_Ljava_lang_CharSequence_I_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::CommitText(Java.Lang.ICharSequence,System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::CommitText(Java.Lang.ICharSequence,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1commitText__Ljava_lang_CharSequence_2I(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_commitText_0_13_6000b69, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666217, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_commitText_0_13_6000b69)
	%cb2 = load ptr, ptr @native_cb_commitText_0_13_6000b69, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_CommitText_Ljava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::CommitText(Java.Lang.ICharSequence,System.Int32,Android.Views.InputMethods.TextAttribute)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::CommitText(Java.Lang.ICharSequence,System.Int32,Android.Views.InputMethods.TextAttribute)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1commitText__Ljava_lang_CharSequence_2ILandroid_view_inputmethod_TextAttribute_2(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_commitText_0_14_6000b1b, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 14, i32 noundef 100666139, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_commitText_0_14_6000b1b)
	%cb2 = load ptr, ptr @native_cb_commitText_0_14_6000b1b, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	%4 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, ptr noundef %2)
	ret i1 %4
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_DeleteSurroundingText_II_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::DeleteSurroundingText(System.Int32,System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::DeleteSurroundingText(System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1deleteSurroundingText(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_deleteSurroundingText_0_13_6000b6a, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666218, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_deleteSurroundingText_0_13_6000b6a)
	%cb2 = load ptr, ptr @native_cb_deleteSurroundingText_0_13_6000b6a, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_DeleteSurroundingTextInCodePoints_II_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::DeleteSurroundingTextInCodePoints(System.Int32,System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::DeleteSurroundingTextInCodePoints(System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1deleteSurroundingTextInCodePoints(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_deleteSurroundingTextInCodePoints_0_13_6000b6b, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666219, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_deleteSurroundingTextInCodePoints_0_13_6000b6b)
	%cb2 = load ptr, ptr @native_cb_deleteSurroundingTextInCodePoints_0_13_6000b6b, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_EndBatchEdit_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::EndBatchEdit()
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::EndBatchEdit()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1endBatchEdit(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_endBatchEdit_0_13_6000b6c, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666220, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_endBatchEdit_0_13_6000b6c)
	%cb2 = load ptr, ptr @native_cb_endBatchEdit_0_13_6000b6c, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass)
	ret i1 %1
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_FinishComposingText_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::FinishComposingText()
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::FinishComposingText()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1finishComposingText(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_finishComposingText_0_13_6000b6d, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666221, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_finishComposingText_0_13_6000b6d)
	%cb2 = load ptr, ptr @native_cb_finishComposingText_0_13_6000b6d, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass)
	ret i1 %1
}

; Method: System.Int32 Android.Views.InputMethods.IInputConnectionInvoker::n_GetCursorCapsMode_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.Text.CapitalizationMode Android.Views.InputMethods.IInputConnection::GetCursorCapsMode(Android.Text.CapitalizationMode)
; Implemented: Android.Text.CapitalizationMode Android.Views.InputMethods.IInputConnection::GetCursorCapsMode(Android.Text.CapitalizationMode)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i32 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1getCursorCapsMode(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getCursorCapsMode_0_13_6000b6e, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666222, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getCursorCapsMode_0_13_6000b6e)
	%cb2 = load ptr, ptr @native_cb_getCursorCapsMode_0_13_6000b6e, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i32 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret i32 %2
}

; Method: System.IntPtr Android.Views.InputMethods.IInputConnectionInvoker::n_GetExtractedText_Landroid_view_inputmethod_ExtractedTextRequest_I_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.Views.InputMethods.ExtractedText Android.Views.InputMethods.IInputConnection::GetExtractedText(Android.Views.InputMethods.ExtractedTextRequest,Android.Views.InputMethods.GetTextFlags)
; Implemented: Android.Views.InputMethods.ExtractedText Android.Views.InputMethods.IInputConnection::GetExtractedText(Android.Views.InputMethods.ExtractedTextRequest,Android.Views.InputMethods.GetTextFlags)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1getExtractedText(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getExtractedText_0_13_6000b6f, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666223, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getExtractedText_0_13_6000b6f)
	%cb2 = load ptr, ptr @native_cb_getExtractedText_0_13_6000b6f, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1)
	ret ptr %3
}

; Method: System.IntPtr Android.Views.InputMethods.IInputConnectionInvoker::n_GetSelectedText_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Java.Lang.ICharSequence Android.Views.InputMethods.IInputConnection::GetSelectedTextFormatted(Android.Views.InputMethods.GetTextFlags)
; Implemented: Java.Lang.ICharSequence Android.Views.InputMethods.IInputConnection::GetSelectedTextFormatted(Android.Views.InputMethods.GetTextFlags)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1getSelectedText(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getSelectedText_0_13_6000b70, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666224, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getSelectedText_0_13_6000b70)
	%cb2 = load ptr, ptr @native_cb_getSelectedText_0_13_6000b70, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret ptr %2
}

; Method: System.IntPtr Android.Views.InputMethods.IInputConnectionInvoker::n_GetTextAfterCursor_II_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Java.Lang.ICharSequence Android.Views.InputMethods.IInputConnection::GetTextAfterCursorFormatted(System.Int32,Android.Views.InputMethods.GetTextFlags)
; Implemented: Java.Lang.ICharSequence Android.Views.InputMethods.IInputConnection::GetTextAfterCursorFormatted(System.Int32,Android.Views.InputMethods.GetTextFlags)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1getTextAfterCursor(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getTextAfterCursor_0_13_6000b71, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666225, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getTextAfterCursor_0_13_6000b71)
	%cb2 = load ptr, ptr @native_cb_getTextAfterCursor_0_13_6000b71, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1)
	ret ptr %3
}

; Method: System.IntPtr Android.Views.InputMethods.IInputConnectionInvoker::n_GetTextBeforeCursor_II_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Java.Lang.ICharSequence Android.Views.InputMethods.IInputConnection::GetTextBeforeCursorFormatted(System.Int32,Android.Views.InputMethods.GetTextFlags)
; Implemented: Java.Lang.ICharSequence Android.Views.InputMethods.IInputConnection::GetTextBeforeCursorFormatted(System.Int32,Android.Views.InputMethods.GetTextFlags)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1getTextBeforeCursor(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getTextBeforeCursor_0_13_6000b72, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666226, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getTextBeforeCursor_0_13_6000b72)
	%cb2 = load ptr, ptr @native_cb_getTextBeforeCursor_0_13_6000b72, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1)
	ret ptr %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_PerformContextMenuAction_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::PerformContextMenuAction(System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::PerformContextMenuAction(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1performContextMenuAction(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_performContextMenuAction_0_13_6000b73, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666227, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_performContextMenuAction_0_13_6000b73)
	%cb2 = load ptr, ptr @native_cb_performContextMenuAction_0_13_6000b73, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_PerformEditorAction_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::PerformEditorAction(Android.Views.InputMethods.ImeAction)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::PerformEditorAction(Android.Views.InputMethods.ImeAction)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1performEditorAction(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_performEditorAction_0_13_6000b74, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666228, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_performEditorAction_0_13_6000b74)
	%cb2 = load ptr, ptr @native_cb_performEditorAction_0_13_6000b74, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_PerformPrivateCommand_Ljava_lang_String_Landroid_os_Bundle__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::PerformPrivateCommand(System.String,Android.OS.Bundle)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::PerformPrivateCommand(System.String,Android.OS.Bundle)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1performPrivateCommand(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_performPrivateCommand_0_13_6000b75, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666229, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_performPrivateCommand_0_13_6000b75)
	%cb2 = load ptr, ptr @native_cb_performPrivateCommand_0_13_6000b75, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_ReportFullscreenMode_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.SByte)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::ReportFullscreenMode(System.Boolean)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::ReportFullscreenMode(System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1reportFullscreenMode(ptr noundef %env, ptr noundef %klass, i1 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_reportFullscreenMode_0_13_6000b76, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666230, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_reportFullscreenMode_0_13_6000b76)
	%cb2 = load ptr, ptr @native_cb_reportFullscreenMode_0_13_6000b76, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i1 noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_RequestCursorUpdates_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::RequestCursorUpdates(System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::RequestCursorUpdates(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1requestCursorUpdates__I(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_requestCursorUpdates_0_13_6000b77, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666231, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_requestCursorUpdates_0_13_6000b77)
	%cb2 = load ptr, ptr @native_cb_requestCursorUpdates_0_13_6000b77, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_RequestCursorUpdates_II_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::RequestCursorUpdates(System.Int32,System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::RequestCursorUpdates(System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1requestCursorUpdates__II(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_requestCursorUpdates_0_14_6000b1c, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 14, i32 noundef 100666140, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_requestCursorUpdates_0_14_6000b1c)
	%cb2 = load ptr, ptr @native_cb_requestCursorUpdates_0_14_6000b1c, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_SendKeyEvent_Landroid_view_KeyEvent__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::SendKeyEvent(Android.Views.KeyEvent)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::SendKeyEvent(Android.Views.KeyEvent)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1sendKeyEvent(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_sendKeyEvent_0_13_6000b78, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666232, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_sendKeyEvent_0_13_6000b78)
	%cb2 = load ptr, ptr @native_cb_sendKeyEvent_0_13_6000b78, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_SetComposingRegion_II_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingRegion(System.Int32,System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingRegion(System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1setComposingRegion__II(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_setComposingRegion_0_13_6000b79, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666233, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_setComposingRegion_0_13_6000b79)
	%cb2 = load ptr, ptr @native_cb_setComposingRegion_0_13_6000b79, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_SetComposingRegion_IILandroid_view_inputmethod_TextAttribute__mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingRegion(System.Int32,System.Int32,Android.Views.InputMethods.TextAttribute)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingRegion(System.Int32,System.Int32,Android.Views.InputMethods.TextAttribute)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1setComposingRegion__IILandroid_view_inputmethod_TextAttribute_2(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_setComposingRegion_0_14_6000b1d, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 14, i32 noundef 100666141, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_setComposingRegion_0_14_6000b1d)
	%cb2 = load ptr, ptr @native_cb_setComposingRegion_0_14_6000b1d, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	%4 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, ptr noundef %2)
	ret i1 %4
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_SetComposingText_Ljava_lang_CharSequence_I_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingText(Java.Lang.ICharSequence,System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingText(Java.Lang.ICharSequence,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1setComposingText__Ljava_lang_CharSequence_2I(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_setComposingText_0_13_6000b7a, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666234, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_setComposingText_0_13_6000b7a)
	%cb2 = load ptr, ptr @native_cb_setComposingText_0_13_6000b7a, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_SetComposingText_Ljava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingText(Java.Lang.ICharSequence,System.Int32,Android.Views.InputMethods.TextAttribute)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::SetComposingText(Java.Lang.ICharSequence,System.Int32,Android.Views.InputMethods.TextAttribute)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1setComposingText__Ljava_lang_CharSequence_2ILandroid_view_inputmethod_TextAttribute_2(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_setComposingText_0_14_6000b1e, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 14, i32 noundef 100666142, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_setComposingText_0_14_6000b1e)
	%cb2 = load ptr, ptr @native_cb_setComposingText_0_14_6000b1e, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	%4 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1, ptr noundef %2)
	ret i1 %4
}

; Method: System.SByte Android.Views.InputMethods.IInputConnectionInvoker::n_SetSelection_II_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::SetSelection(System.Int32,System.Int32)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::SetSelection(System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1setSelection(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_setSelection_0_13_6000b7b, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 13, i32 noundef 100666235, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_setSelection_0_13_6000b7b)
	%cb2 = load ptr, ptr @native_cb_setSelection_0_13_6000b7b, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1)
	ret i1 %3
}

; Method: System.IntPtr Android.Views.InputMethods.IInputConnection::n_GetSurroundingText_III_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32,System.Int32)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.Views.InputMethods.SurroundingText Android.Views.InputMethods.IInputConnection::GetSurroundingText(System.Int32,System.Int32,System.Int32)
; Implemented: Android.Views.InputMethods.SurroundingText Android.Views.InputMethods.IInputConnection::GetSurroundingText(System.Int32,System.Int32,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1getSurroundingText(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_getSurroundingText_0_14_6000b1f, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 14, i32 noundef 100666143, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_getSurroundingText_0_14_6000b1f)
	%cb2 = load ptr, ptr @native_cb_getSurroundingText_0_14_6000b1f, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	%4 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, i32 noundef %2)
	ret ptr %4
}

; Method: System.Void Android.Views.InputMethods.IInputConnection::n_PerformHandwritingGesture_Landroid_view_inputmethod_HandwritingGesture_Ljava_util_concurrent_Executor_Ljava_util_function_IntConsumer__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.InputMethods.IInputConnection::PerformHandwritingGesture(Android.Views.InputMethods.HandwritingGesture,Java.Util.Concurrent.IExecutor,Java.Util.Functions.IIntConsumer)
; Implemented: System.Void Android.Views.InputMethods.IInputConnection::PerformHandwritingGesture(Android.Views.InputMethods.HandwritingGesture,Java.Util.Concurrent.IExecutor,Java.Util.Functions.IIntConsumer)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1performHandwritingGesture(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_performHandwritingGesture_0_14_6000b20, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 14, i32 noundef 100666144, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_performHandwritingGesture_0_14_6000b20)
	%cb2 = load ptr, ptr @native_cb_performHandwritingGesture_0_14_6000b20, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1, ptr noundef %2)
	ret void
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_PerformSpellCheck_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::PerformSpellCheck()
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::PerformSpellCheck()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1performSpellCheck(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_performSpellCheck_0_14_6000b21, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 14, i32 noundef 100666145, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_performSpellCheck_0_14_6000b21)
	%cb2 = load ptr, ptr @native_cb_performSpellCheck_0_14_6000b21, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass)
	ret i1 %1
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_PreviewHandwritingGesture_Landroid_view_inputmethod_PreviewableHandwritingGesture_Landroid_os_CancellationSignal__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::PreviewHandwritingGesture(Android.Views.InputMethods.PreviewableHandwritingGesture,Android.OS.CancellationSignal)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::PreviewHandwritingGesture(Android.Views.InputMethods.PreviewableHandwritingGesture,Android.OS.CancellationSignal)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1previewHandwritingGesture(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_previewHandwritingGesture_0_14_6000b22, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 14, i32 noundef 100666146, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_previewHandwritingGesture_0_14_6000b22)
	%cb2 = load ptr, ptr @native_cb_previewHandwritingGesture_0_14_6000b22, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	%3 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret i1 %3
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_ReplaceText_IILjava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(System.IntPtr,System.IntPtr,System.Int32,System.Int32,System.IntPtr,System.Int32,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::ReplaceText(System.Int32,System.Int32,Java.Lang.ICharSequence,System.Int32,Android.Views.InputMethods.TextAttribute)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::ReplaceText(System.Int32,System.Int32,Java.Lang.ICharSequence,System.Int32,Android.Views.InputMethods.TextAttribute)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1replaceText(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_replaceText_0_14_6000b23, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %5
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 14, i32 noundef 100666147, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_replaceText_0_14_6000b23)
	%cb2 = load ptr, ptr @native_cb_replaceText_0_14_6000b23, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %5
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %5]
	%6 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4)
	ret i1 %6
}

; Method: System.Void Android.Views.InputMethods.IInputConnection::n_RequestTextBoundsInfo_Landroid_graphics_RectF_Ljava_util_concurrent_Executor_Ljava_util_function_Consumer__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.InputMethods.IInputConnection::RequestTextBoundsInfo(Android.Graphics.RectF,Java.Util.Concurrent.IExecutor,Java.Util.Functions.IConsumer)
; Implemented: System.Void Android.Views.InputMethods.IInputConnection::RequestTextBoundsInfo(Android.Graphics.RectF,Java.Util.Concurrent.IExecutor,Java.Util.Functions.IConsumer)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1requestTextBoundsInfo(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1, ptr noundef %2) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_requestTextBoundsInfo_0_14_6000b24, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %3
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 14, i32 noundef 100666148, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_requestTextBoundsInfo_0_14_6000b24)
	%cb2 = load ptr, ptr @native_cb_requestTextBoundsInfo_0_14_6000b24, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %3
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %3]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1, ptr noundef %2)
	ret void
}

; Method: System.SByte Android.Views.InputMethods.IInputConnection::n_SetImeConsumesInput_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.SByte)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Boolean Android.Views.InputMethods.IInputConnection::SetImeConsumesInput(System.Boolean)
; Implemented: System.Boolean Android.Views.InputMethods.IInputConnection::SetImeConsumesInput(System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1setImeConsumesInput(ptr noundef %env, ptr noundef %klass, i1 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_setImeConsumesInput_0_14_6000b25, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 14, i32 noundef 100666149, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_setImeConsumesInput_0_14_6000b25)
	%cb2 = load ptr, ptr @native_cb_setImeConsumesInput_0_14_6000b25, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, i1 noundef %0)
	ret i1 %2
}

; Method: System.IntPtr Android.Views.InputMethods.IInputConnection::n_TakeSnapshot_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: Android.Views.InputMethods.TextSnapshot Android.Views.InputMethods.IInputConnection::TakeSnapshot()
; Implemented: Android.Views.InputMethods.TextSnapshot Android.Views.InputMethods.IInputConnection::TakeSnapshot()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define ptr @Java_crc643ec2256bd5ff4bdb_AvaloniaInputConnection_n_1takeSnapshot(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_takeSnapshot_0_14_6000b26, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 14, i32 noundef 100666150, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_takeSnapshot_0_14_6000b26)
	%cb2 = load ptr, ptr @native_cb_takeSnapshot_0_14_6000b26, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	%1 = tail call noundef ptr %fn(ptr noundef %env, ptr noundef %klass)
	ret ptr %1
}

; Method: System.Void AndroidX.Activity.ContextAware.IOnContextAvailableListenerInvoker::n_OnContextAvailable_Landroid_content_Context__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Activity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Activity.ContextAware.IOnContextAvailableListener::OnContextAvailable(Android.Content.Context)
; Implemented: System.Void AndroidX.Activity.ContextAware.IOnContextAvailableListener::OnContextAvailable(Android.Content.Context)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_activity_contextaware_OnContextAvailableListenerImplementor_n_1onContextAvailable(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onContextAvailable_2_15_60000ab, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 19, i32 noundef 15, i32 noundef 100663467, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onContextAvailable_2_15_60000ab)
	%cb2 = load ptr, ptr @native_cb_onContextAvailable_2_15_60000ab, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void AndroidX.AppCompat.App.ActionBar/IOnMenuVisibilityListenerInvoker::n_OnMenuVisibilityChanged_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.Byte)
; Assembly: Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.AppCompat.App.ActionBar/IOnMenuVisibilityListener::OnMenuVisibilityChanged(System.Boolean)
; Implemented: System.Void AndroidX.AppCompat.App.ActionBar/IOnMenuVisibilityListener::OnMenuVisibilityChanged(System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_appcompat_app_ActionBar_1OnMenuVisibilityListenerImplementor_n_1onMenuVisibilityChanged(ptr noundef %env, ptr noundef %klass, i1 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onMenuVisibilityChanged_3_16_60001aa, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 20, i32 noundef 16, i32 noundef 100663722, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onMenuVisibilityChanged_3_16_60001aa)
	%cb2 = load ptr, ptr @native_cb_onMenuVisibilityChanged_3_16_60001aa, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i1 noundef %0)
	ret void
}

; Method: System.Void Android.Views.View/IOnClickListenerInvoker::n_OnClick_Landroid_view_View__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: System.Void Android.Views.View/IOnClickListener::OnClick(Android.Views.View)
; Implemented: System.Void Android.Views.View/IOnClickListener::OnClick(Android.Views.View)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_androidx_appcompat_widget_Toolbar_1NavigationOnClickEventDispatcher_n_1onClick(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onClick_0_17_60004ac, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 17, i32 noundef 100664492, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onClick_0_17_60004ac)
	%cb2 = load ptr, ptr @native_cb_onClick_0_17_60004ac, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Byte AndroidX.AppCompat.Widget.Toolbar/IOnMenuItemClickListenerInvoker::n_OnMenuItemClick_Landroid_view_MenuItem__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Boolean AndroidX.AppCompat.Widget.Toolbar/IOnMenuItemClickListener::OnMenuItemClick(Android.Views.IMenuItem)
; Implemented: System.Boolean AndroidX.AppCompat.Widget.Toolbar/IOnMenuItemClickListener::OnMenuItemClick(Android.Views.IMenuItem)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define i1 @Java_mono_androidx_appcompat_widget_Toolbar_1OnMenuItemClickListenerImplementor_n_1onMenuItemClick(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onMenuItemClick_3_18_60004c4, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 20, i32 noundef 18, i32 noundef 100664516, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onMenuItemClick_3_18_60004c4)
	%cb2 = load ptr, ptr @native_cb_onMenuItemClick_3_18_60004c4, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	%2 = tail call noundef i1 %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret i1 %2
}

; Method: System.Void AndroidX.Core.View.ActionProvider/ISubUiVisibilityListenerInvoker::n_OnSubUiVisibilityChanged_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.Byte)
; Assembly: Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Core.View.ActionProvider/ISubUiVisibilityListener::OnSubUiVisibilityChanged(System.Boolean)
; Implemented: System.Void AndroidX.Core.View.ActionProvider/ISubUiVisibilityListener::OnSubUiVisibilityChanged(System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_core_view_ActionProvider_1SubUiVisibilityListenerImplementor_n_1onSubUiVisibilityChanged(ptr noundef %env, ptr noundef %klass, i1 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onSubUiVisibilityChanged_1_19_6000263, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 21, i32 noundef 19, i32 noundef 100663907, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onSubUiVisibilityChanged_1_19_6000263)
	%cb2 = load ptr, ptr @native_cb_onSubUiVisibilityChanged_1_19_6000263, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i1 noundef %0)
	ret void
}

; Method: System.Void AndroidX.Core.View.ActionProvider/IVisibilityListenerInvoker::n_OnActionProviderVisibilityChanged_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.Byte)
; Assembly: Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Core.View.ActionProvider/IVisibilityListener::OnActionProviderVisibilityChanged(System.Boolean)
; Implemented: System.Void AndroidX.Core.View.ActionProvider/IVisibilityListener::OnActionProviderVisibilityChanged(System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_core_view_ActionProvider_1VisibilityListenerImplementor_n_1onActionProviderVisibilityChanged(ptr noundef %env, ptr noundef %klass, i1 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onActionProviderVisibilityChanged_1_20_6000274, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 21, i32 noundef 20, i32 noundef 100663924, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onActionProviderVisibilityChanged_1_20_6000274)
	%cb2 = load ptr, ptr @native_cb_onActionProviderVisibilityChanged_1_20_6000274, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i1 noundef %0)
	ret void
}

; Method: System.Void AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListenerInvoker::n_OnControllableInsetsChanged_Landroidx_core_view_WindowInsetsControllerCompat_I_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListener::OnControllableInsetsChanged(AndroidX.Core.View.WindowInsetsControllerCompat,System.Int32)
; Implemented: System.Void AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListener::OnControllableInsetsChanged(AndroidX.Core.View.WindowInsetsControllerCompat,System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_core_view_WindowInsetsControllerCompat_1OnControllableInsetsChangedListenerImplementor_n_1onControllableInsetsChanged(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onControllableInsetsChanged_1_21_600050b, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 21, i32 noundef 21, i32 noundef 100664587, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onControllableInsetsChanged_1_21_600050b)
	%cb2 = load ptr, ptr @native_cb_onControllableInsetsChanged_1_21_600050b, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i32 noundef %1)
	ret void
}

; Method: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListenerInvoker::n_OnDrawerClosed_Landroid_view_View__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.DrawerLayout, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerClosed(Android.Views.View)
; Implemented: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerClosed(Android.Views.View)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_drawerlayout_widget_DrawerLayout_1DrawerListenerImplementor_n_1onDrawerClosed(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDrawerClosed_4_22_60000cb, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 22, i32 noundef 100663499, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDrawerClosed_4_22_60000cb)
	%cb2 = load ptr, ptr @native_cb_onDrawerClosed_4_22_60000cb, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListenerInvoker::n_OnDrawerOpened_Landroid_view_View__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.DrawerLayout, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerOpened(Android.Views.View)
; Implemented: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerOpened(Android.Views.View)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_drawerlayout_widget_DrawerLayout_1DrawerListenerImplementor_n_1onDrawerOpened(ptr noundef %env, ptr noundef %klass, ptr noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDrawerOpened_4_22_60000cc, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 22, i32 noundef 100663500, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDrawerOpened_4_22_60000cc)
	%cb2 = load ptr, ptr @native_cb_onDrawerOpened_4_22_60000cc, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0)
	ret void
}

; Method: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListenerInvoker::n_OnDrawerSlide_Landroid_view_View_F_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Single)
; Assembly: Xamarin.AndroidX.DrawerLayout, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerSlide(Android.Views.View,System.Single)
; Implemented: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerSlide(Android.Views.View,System.Single)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_drawerlayout_widget_DrawerLayout_1DrawerListenerImplementor_n_1onDrawerSlide(ptr noundef %env, ptr noundef %klass, ptr noundef %0, float noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDrawerSlide_4_22_60000cd, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 22, i32 noundef 100663501, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDrawerSlide_4_22_60000cd)
	%cb2 = load ptr, ptr @native_cb_onDrawerSlide_4_22_60000cd, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, float noundef %1)
	ret void
}

; Method: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListenerInvoker::n_OnDrawerStateChanged_I_mm_wrapper(System.IntPtr,System.IntPtr,System.Int32)
; Assembly: Xamarin.AndroidX.DrawerLayout, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerStateChanged(System.Int32)
; Implemented: System.Void AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListener::OnDrawerStateChanged(System.Int32)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_drawerlayout_widget_DrawerLayout_1DrawerListenerImplementor_n_1onDrawerStateChanged(ptr noundef %env, ptr noundef %klass, i32 noundef %0) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onDrawerStateChanged_4_22_60000ce, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %1
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 22, i32 noundef 22, i32 noundef 100663502, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onDrawerStateChanged_4_22_60000ce)
	%cb2 = load ptr, ptr @native_cb_onDrawerStateChanged_4_22_60000ce, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %1
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %1]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, i32 noundef %0)
	ret void
}

; Method: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListenerInvoker::n_OnBackStackChanged_mm_wrapper(System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChanged()
; Implemented: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChanged()
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_fragment_app_FragmentManager_1OnBackStackChangedListenerImplementor_n_1onBackStackChanged(ptr noundef %env, ptr noundef %klass) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onBackStackChanged_5_23_60002f0, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 23, i32 noundef 23, i32 noundef 100664048, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onBackStackChanged_5_23_60002f0)
	%cb2 = load ptr, ptr @native_cb_onBackStackChanged_5_23_60002f0, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass)
	ret void
}

; Method: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::n_OnBackStackChangeCommitted_Landroidx_fragment_app_Fragment_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Byte)
; Assembly: Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChangeCommitted(AndroidX.Fragment.App.Fragment,System.Boolean)
; Implemented: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChangeCommitted(AndroidX.Fragment.App.Fragment,System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_fragment_app_FragmentManager_1OnBackStackChangedListenerImplementor_n_1onBackStackChangeCommitted(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i1 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onBackStackChangeCommitted_5_24_60002e3, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 23, i32 noundef 24, i32 noundef 100664035, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onBackStackChangeCommitted_5_24_60002e3)
	%cb2 = load ptr, ptr @native_cb_onBackStackChangeCommitted_5_24_60002e3, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i1 noundef %1)
	ret void
}

; Method: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::n_OnBackStackChangeStarted_Landroidx_fragment_app_Fragment_Z_mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.Byte)
; Assembly: Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChangeStarted(AndroidX.Fragment.App.Fragment,System.Boolean)
; Implemented: System.Void AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener::OnBackStackChangeStarted(AndroidX.Fragment.App.Fragment,System.Boolean)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_fragment_app_FragmentManager_1OnBackStackChangedListenerImplementor_n_1onBackStackChangeStarted(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i1 noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onBackStackChangeStarted_5_24_60002e4, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 23, i32 noundef 24, i32 noundef 100664036, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onBackStackChangeStarted_5_24_60002e4)
	%cb2 = load ptr, ptr @native_cb_onBackStackChangeStarted_5_24_60002e4, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, i1 noundef %1)
	ret void
}

; Method: System.Void AndroidX.Fragment.App.IFragmentOnAttachListenerInvoker::n_OnAttachFragment_Landroidx_fragment_app_FragmentManager_Landroidx_fragment_app_Fragment__mm_wrapper(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
; Registered: System.Void AndroidX.Fragment.App.IFragmentOnAttachListener::OnAttachFragment(AndroidX.Fragment.App.FragmentManager,AndroidX.Fragment.App.Fragment)
; Implemented: System.Void AndroidX.Fragment.App.IFragmentOnAttachListener::OnAttachFragment(AndroidX.Fragment.App.FragmentManager,AndroidX.Fragment.App.Fragment)
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_androidx_fragment_app_FragmentOnAttachListenerImplementor_n_1onAttachFragment(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_onAttachFragment_5_25_6000392, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %2
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 23, i32 noundef 25, i32 noundef 100664210, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_onAttachFragment_5_25_6000392)
	%cb2 = load ptr, ptr @native_cb_onAttachFragment_5_25_6000392, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %2
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %2]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %0, ptr noundef %1)
	ret void
}

; Method: System.Void Java.Interop.TypeManager/JavaTypeManager::n_Activate_mm(System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr,System.IntPtr)
; Assembly: Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065
; Registered: none
; Implemented: none
;
; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" uwtable
define void @Java_mono_android_TypeManager_n_1activate(ptr noundef %env, ptr noundef %klass, ptr noundef %jnienv, ptr noundef %jclass, ptr noundef %typename_ptr, ptr noundef %signature_ptr) local_unnamed_addr #3
{
	%cb1 = load ptr, ptr @native_cb_activate_0_26_6001501, align 8, !tbaa !3
	%isNull = icmp eq ptr %cb1, null
	br i1 %isNull, label %loadCallback, label %callbackLoaded

loadCallback: ; preds = %0
	%get_func_ptr = load ptr, ptr @get_function_pointer, align 8, !tbaa !3
	call void %get_func_ptr(i32 noundef 63, i32 noundef 26, i32 noundef 100668673, ptr nonnull noundef align(8) dereferenceable(8) @native_cb_activate_0_26_6001501)
	%cb2 = load ptr, ptr @native_cb_activate_0_26_6001501, align 8, !tbaa !3
	br label %callbackLoaded

callbackLoaded: ; preds = %loadCallback, %0
	%fn = phi ptr
		 [%cb2, %loadCallback],
		 [%cb1, %0]
	tail call void %fn(ptr noundef %env, ptr noundef %klass, ptr noundef %jnienv, ptr noundef %jclass, ptr noundef %typename_ptr, ptr noundef %signature_ptr)
	ret void
}

; Strings
@.mm.0 = private unnamed_addr constant [130 x i8] c"Android.Views.View/IOnFocusChangeListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.1 = private unnamed_addr constant [101 x i8] c"Java.IO.InputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.2 = private unnamed_addr constant [98 x i8] c"Java.Lang.Object, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.3 = private unnamed_addr constant [102 x i8] c"Java.IO.OutputStream, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.4 = private unnamed_addr constant [108 x i8] c"Java.Lang.IRunnableInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.5 = private unnamed_addr constant [102 x i8] c"Android.App.Activity, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.6 = private unnamed_addr constant [143 x i8] c"Android.Views.ViewTreeObserver/IOnGlobalLayoutListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.7 = private unnamed_addr constant [100 x i8] c"Android.Views.View, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.8 = private unnamed_addr constant [131 x i8] c"Android.Views.Choreographer/IFrameCallbackInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.9 = private unnamed_addr constant [125 x i8] c"Android.Views.ISurfaceHolderCallbackInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.10 = private unnamed_addr constant [134 x i8] c"AndroidX.Core.View.WindowInsetsAnimationCompat/Callback, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 1
@.mm.11 = private unnamed_addr constant [133 x i8] c"AndroidX.Core.View.IOnApplyWindowInsetsListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 1
@.mm.12 = private unnamed_addr constant [145 x i8] c"Android.Hardware.Display.DisplayManager/IDisplayListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.13 = private unnamed_addr constant [132 x i8] c"Android.Views.InputMethods.IInputConnectionInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.14 = private unnamed_addr constant [125 x i8] c"Android.Views.InputMethods.IInputConnection, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.15 = private unnamed_addr constant [148 x i8] c"AndroidX.Activity.ContextAware.IOnContextAvailableListenerInvoker, Xamarin.AndroidX.Activity, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 1
@.mm.16 = private unnamed_addr constant [149 x i8] c"AndroidX.AppCompat.App.ActionBar/IOnMenuVisibilityListenerInvoker, Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 1
@.mm.17 = private unnamed_addr constant [124 x i8] c"Android.Views.View/IOnClickListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.18 = private unnamed_addr constant [149 x i8] c"AndroidX.AppCompat.Widget.Toolbar/IOnMenuItemClickListenerInvoker, Xamarin.AndroidX.AppCompat, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 1
@.mm.19 = private unnamed_addr constant [144 x i8] c"AndroidX.Core.View.ActionProvider/ISubUiVisibilityListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 1
@.mm.20 = private unnamed_addr constant [139 x i8] c"AndroidX.Core.View.ActionProvider/IVisibilityListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 1
@.mm.21 = private unnamed_addr constant [170 x i8] c"AndroidX.Core.View.WindowInsetsControllerCompat/IOnControllableInsetsChangedListenerInvoker, Xamarin.AndroidX.Core, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 1
@.mm.22 = private unnamed_addr constant [151 x i8] c"AndroidX.DrawerLayout.Widget.DrawerLayout/IDrawerListenerInvoker, Xamarin.AndroidX.DrawerLayout, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 1
@.mm.23 = private unnamed_addr constant [155 x i8] c"AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListenerInvoker, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 1
@.mm.24 = private unnamed_addr constant [148 x i8] c"AndroidX.Fragment.App.FragmentManager/IOnBackStackChangedListener, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 1
@.mm.25 = private unnamed_addr constant [137 x i8] c"AndroidX.Fragment.App.IFragmentOnAttachListenerInvoker, Xamarin.AndroidX.Fragment, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null\00", align 1
@.mm.26 = private unnamed_addr constant [122 x i8] c"Java.Interop.TypeManager/JavaTypeManager, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=84e04ff9cfb79065\00", align 1
@.mm.27 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [76 x i8] c"n_OnFocusChange_Landroid_view_View_Z_mm_wrapper(IntPtr,IntPtr,IntPtr,SByte)\00", align 1
@.MarshalMethodName.1_name = private unnamed_addr constant [34 x i8] c"n_Close_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.2_name = private unnamed_addr constant [33 x i8] c"n_Read_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.3_name = private unnamed_addr constant [47 x i8] c"n_Read_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.4_name = private unnamed_addr constant [61 x i8] c"n_Read_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.5_name = private unnamed_addr constant [61 x i8] c"n_Equals_Ljava_lang_Object__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.6_name = private unnamed_addr constant [40 x i8] c"n_GetHashCode_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.7_name = private unnamed_addr constant [37 x i8] c"n_ToString_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.8_name = private unnamed_addr constant [34 x i8] c"n_Flush_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.9_name = private unnamed_addr constant [48 x i8] c"n_Write_arrayB_mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.10_name = private unnamed_addr constant [62 x i8] c"n_Write_arrayBII_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.11_name = private unnamed_addr constant [42 x i8] c"n_Write_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.12_name = private unnamed_addr constant [32 x i8] c"n_Run_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.13_name = private unnamed_addr constant [42 x i8] c"n_OnBackPressed_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.14_name = private unnamed_addr constant [64 x i8] c"n_OnCreate_Landroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.15_name = private unnamed_addr constant [35 x i8] c"n_OnStop_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.16_name = private unnamed_addr constant [36 x i8] c"n_OnStart_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.17_name = private unnamed_addr constant [37 x i8] c"n_OnResume_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.18_name = private unnamed_addr constant [38 x i8] c"n_OnDestroy_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.19_name = private unnamed_addr constant [91 x i8] c"n_OnActivityResult_IILandroid_content_Intent__mm_wrapper(IntPtr,IntPtr,Int32,Int32,IntPtr)\00", align 1
@.MarshalMethodName.20_name = private unnamed_addr constant [106 x i8] c"n_OnRequestPermissionsResult_IarrayLjava_lang_String_arrayI_mm_wrapper(IntPtr,IntPtr,Int32,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.21_name = private unnamed_addr constant [43 x i8] c"n_OnGlobalLayout_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.22_name = private unnamed_addr constant [76 x i8] c"n_DispatchKeyEvent_Landroid_view_KeyEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.23_name = private unnamed_addr constant [59 x i8] c"n_OnVisibilityAggregated_Z_mm_wrapper(IntPtr,IntPtr,SByte)\00", align 1
@.MarshalMethodName.24_name = private unnamed_addr constant [82 x i8] c"n_OnVisibilityChanged_Landroid_view_View_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.25_name = private unnamed_addr constant [94 x i8] c"n_OnConfigurationChanged_Landroid_content_res_Configuration__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.26_name = private unnamed_addr constant [44 x i8] c"n_DoFrame_J_mm_wrapper(IntPtr,IntPtr,Int64)\00", align 1
@.MarshalMethodName.27_name = private unnamed_addr constant [39 x i8] c"n_Invalidate_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.28_name = private unnamed_addr constant [100 x i8] c"n_SurfaceChanged_Landroid_view_SurfaceHolder_III_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,Int32,Int32)\00", align 1
@.MarshalMethodName.29_name = private unnamed_addr constant [79 x i8] c"n_SurfaceCreated_Landroid_view_SurfaceHolder__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.30_name = private unnamed_addr constant [81 x i8] c"n_SurfaceDestroyed_Landroid_view_SurfaceHolder__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.31_name = private unnamed_addr constant [160 x i8] c"n_OnStart_Landroidx_core_view_WindowInsetsAnimationCompat_Landroidx_core_view_WindowInsetsAnimationCompat_BoundsCompat__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.32_name = private unnamed_addr constant [109 x i8] c"n_OnProgress_Landroidx_core_view_WindowInsetsCompat_Ljava_util_List__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.33_name = private unnamed_addr constant [121 x i8] c"n_OnApplyWindowInsets_Landroid_view_View_Landroidx_core_view_WindowInsetsCompat__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.34_name = private unnamed_addr constant [51 x i8] c"n_OnDisplayAdded_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.35_name = private unnamed_addr constant [53 x i8] c"n_OnDisplayChanged_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.36_name = private unnamed_addr constant [53 x i8] c"n_OnDisplayRemoved_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.37_name = private unnamed_addr constant [74 x i8] c"n_DispatchDraw_Landroid_graphics_Canvas__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.38_name = private unnamed_addr constant [90 x i8] c"n_DispatchGenericPointerEvent_Landroid_view_MotionEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.39_name = private unnamed_addr constant [81 x i8] c"n_DispatchTouchEvent_Landroid_view_MotionEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.40_name = private unnamed_addr constant [48 x i8] c"n_OnCheckIsTextEditor_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.41_name = private unnamed_addr constant [97 x i8] c"n_OnCreateInputConnection_Landroid_view_inputmethod_EditorInfo__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.42_name = private unnamed_addr constant [39 x i8] c"n_GetHandler_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.43_name = private unnamed_addr constant [43 x i8] c"n_BeginBatchEdit_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.44_name = private unnamed_addr constant [55 x i8] c"n_ClearMetaKeyStates_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.45_name = private unnamed_addr constant [44 x i8] c"n_CloseConnection_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.46_name = private unnamed_addr constant [94 x i8] c"n_CommitCompletion_Landroid_view_inputmethod_CompletionInfo__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.47_name = private unnamed_addr constant [126 x i8] c"n_CommitContent_Landroid_view_inputmethod_InputContentInfo_ILandroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,IntPtr)\00", align 1
@.MarshalMethodName.48_name = private unnamed_addr constant [94 x i8] c"n_CommitCorrection_Landroid_view_inputmethod_CorrectionInfo__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.49_name = private unnamed_addr constant [78 x i8] c"n_CommitText_Ljava_lang_CharSequence_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.50_name = private unnamed_addr constant [125 x i8] c"n_CommitText_Ljava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,IntPtr)\00", align 1
@.MarshalMethodName.51_name = private unnamed_addr constant [65 x i8] c"n_DeleteSurroundingText_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.52_name = private unnamed_addr constant [77 x i8] c"n_DeleteSurroundingTextInCodePoints_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.53_name = private unnamed_addr constant [41 x i8] c"n_EndBatchEdit_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.54_name = private unnamed_addr constant [48 x i8] c"n_FinishComposingText_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.55_name = private unnamed_addr constant [54 x i8] c"n_GetCursorCapsMode_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.56_name = private unnamed_addr constant [107 x i8] c"n_GetExtractedText_Landroid_view_inputmethod_ExtractedTextRequest_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.57_name = private unnamed_addr constant [52 x i8] c"n_GetSelectedText_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.58_name = private unnamed_addr constant [62 x i8] c"n_GetTextAfterCursor_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.59_name = private unnamed_addr constant [63 x i8] c"n_GetTextBeforeCursor_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.60_name = private unnamed_addr constant [61 x i8] c"n_PerformContextMenuAction_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.61_name = private unnamed_addr constant [56 x i8] c"n_PerformEditorAction_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.62_name = private unnamed_addr constant [102 x i8] c"n_PerformPrivateCommand_Ljava_lang_String_Landroid_os_Bundle__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.63_name = private unnamed_addr constant [57 x i8] c"n_ReportFullscreenMode_Z_mm_wrapper(IntPtr,IntPtr,SByte)\00", align 1
@.MarshalMethodName.64_name = private unnamed_addr constant [57 x i8] c"n_RequestCursorUpdates_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.65_name = private unnamed_addr constant [64 x i8] c"n_RequestCursorUpdates_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.66_name = private unnamed_addr constant [72 x i8] c"n_SendKeyEvent_Landroid_view_KeyEvent__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.67_name = private unnamed_addr constant [62 x i8] c"n_SetComposingRegion_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.68_name = private unnamed_addr constant [109 x i8] c"n_SetComposingRegion_IILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,Int32,Int32,IntPtr)\00", align 1
@.MarshalMethodName.69_name = private unnamed_addr constant [84 x i8] c"n_SetComposingText_Ljava_lang_CharSequence_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.70_name = private unnamed_addr constant [131 x i8] c"n_SetComposingText_Ljava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,IntPtr,Int32,IntPtr)\00", align 1
@.MarshalMethodName.71_name = private unnamed_addr constant [56 x i8] c"n_SetSelection_II_mm_wrapper(IntPtr,IntPtr,Int32,Int32)\00", align 1
@.MarshalMethodName.72_name = private unnamed_addr constant [69 x i8] c"n_GetSurroundingText_III_mm_wrapper(IntPtr,IntPtr,Int32,Int32,Int32)\00", align 1
@.MarshalMethodName.73_name = private unnamed_addr constant [184 x i8] c"n_PerformHandwritingGesture_Landroid_view_inputmethod_HandwritingGesture_Ljava_util_concurrent_Executor_Ljava_util_function_IntConsumer__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.74_name = private unnamed_addr constant [46 x i8] c"n_PerformSpellCheck_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.75_name = private unnamed_addr constant [156 x i8] c"n_PreviewHandwritingGesture_Landroid_view_inputmethod_PreviewableHandwritingGesture_Landroid_os_CancellationSignal__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.76_name = private unnamed_addr constant [140 x i8] c"n_ReplaceText_IILjava_lang_CharSequence_ILandroid_view_inputmethod_TextAttribute__mm_wrapper(IntPtr,IntPtr,Int32,Int32,IntPtr,Int32,IntPtr)\00", align 1
@.MarshalMethodName.77_name = private unnamed_addr constant [156 x i8] c"n_RequestTextBoundsInfo_Landroid_graphics_RectF_Ljava_util_concurrent_Executor_Ljava_util_function_Consumer__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.78_name = private unnamed_addr constant [56 x i8] c"n_SetImeConsumesInput_Z_mm_wrapper(IntPtr,IntPtr,SByte)\00", align 1
@.MarshalMethodName.79_name = private unnamed_addr constant [41 x i8] c"n_TakeSnapshot_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.80_name = private unnamed_addr constant [80 x i8] c"n_OnContextAvailable_Landroid_content_Context__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.81_name = private unnamed_addr constant [59 x i8] c"n_OnMenuVisibilityChanged_Z_mm_wrapper(IntPtr,IntPtr,Byte)\00", align 1
@.MarshalMethodName.82_name = private unnamed_addr constant [63 x i8] c"n_OnClick_Landroid_view_View__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.83_name = private unnamed_addr constant [75 x i8] c"n_OnMenuItemClick_Landroid_view_MenuItem__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.84_name = private unnamed_addr constant [60 x i8] c"n_OnSubUiVisibilityChanged_Z_mm_wrapper(IntPtr,IntPtr,Byte)\00", align 1
@.MarshalMethodName.85_name = private unnamed_addr constant [69 x i8] c"n_OnActionProviderVisibilityChanged_Z_mm_wrapper(IntPtr,IntPtr,Byte)\00", align 1
@.MarshalMethodName.86_name = private unnamed_addr constant [120 x i8] c"n_OnControllableInsetsChanged_Landroidx_core_view_WindowInsetsControllerCompat_I_mm_wrapper(IntPtr,IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.87_name = private unnamed_addr constant [70 x i8] c"n_OnDrawerClosed_Landroid_view_View__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.88_name = private unnamed_addr constant [70 x i8] c"n_OnDrawerOpened_Landroid_view_View__mm_wrapper(IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.89_name = private unnamed_addr constant [77 x i8] c"n_OnDrawerSlide_Landroid_view_View_F_mm_wrapper(IntPtr,IntPtr,IntPtr,Single)\00", align 1
@.MarshalMethodName.90_name = private unnamed_addr constant [57 x i8] c"n_OnDrawerStateChanged_I_mm_wrapper(IntPtr,IntPtr,Int32)\00", align 1
@.MarshalMethodName.91_name = private unnamed_addr constant [47 x i8] c"n_OnBackStackChanged_mm_wrapper(IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.92_name = private unnamed_addr constant [101 x i8] c"n_OnBackStackChangeCommitted_Landroidx_fragment_app_Fragment_Z_mm_wrapper(IntPtr,IntPtr,IntPtr,Byte)\00", align 1
@.MarshalMethodName.93_name = private unnamed_addr constant [99 x i8] c"n_OnBackStackChangeStarted_Landroidx_fragment_app_Fragment_Z_mm_wrapper(IntPtr,IntPtr,IntPtr,Byte)\00", align 1
@.MarshalMethodName.94_name = private unnamed_addr constant [131 x i8] c"n_OnAttachFragment_Landroidx_fragment_app_FragmentManager_Landroidx_fragment_app_Fragment__mm_wrapper(IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.95_name = private unnamed_addr constant [57 x i8] c"n_Activate_mm(IntPtr,IntPtr,IntPtr,IntPtr,IntPtr,IntPtr)\00", align 1
@.MarshalMethodName.96_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }
attributes #3 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable }

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
