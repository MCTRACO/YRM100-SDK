; ModuleID = 'environment.arm64-v8a.ll'
source_filename = "environment.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.ApplicationConfig = type {
	i1, ; bool uses_mono_llvm
	i1, ; bool uses_mono_aot
	i1, ; bool aot_lazy_load
	i1, ; bool uses_assembly_preload
	i1, ; bool broken_exception_transitions
	i1, ; bool jni_add_native_method_registration_attribute_present
	i1, ; bool have_runtime_config_blob
	i1, ; bool have_assemblies_blob
	i1, ; bool marshal_methods_enabled
	i1, ; bool ignore_split_configs
	i8, ; uint8_t bound_stream_io_exception_type
	i32, ; uint32_t package_naming_policy
	i32, ; uint32_t environment_variable_count
	i32, ; uint32_t system_property_count
	i32, ; uint32_t number_of_assemblies_in_apk
	i32, ; uint32_t bundled_assembly_name_width
	i32, ; uint32_t number_of_dso_cache_entries
	i32, ; uint32_t number_of_aot_cache_entries
	i32, ; uint32_t number_of_shared_libraries
	i32, ; uint32_t android_runtime_jnienv_class_token
	i32, ; uint32_t jnienv_initialize_method_token
	i32, ; uint32_t jnienv_registerjninatives_method_token
	i32, ; uint32_t jni_remapping_replacement_type_count
	i32, ; uint32_t jni_remapping_replacement_method_index_entry_count
	i32, ; uint32_t mono_components_mask
	ptr, ; char* android_package_name
	i1 ; bool managed_marshal_methods_lookup_enabled
}

%struct.AssemblyStoreAssemblyDescriptor = type {
	i32, ; uint32_t data_offset
	i32, ; uint32_t data_size
	i32, ; uint32_t debug_data_offset
	i32, ; uint32_t debug_data_size
	i32, ; uint32_t config_data_offset
	i32 ; uint32_t config_data_size
}

%struct.AssemblyStoreRuntimeData = type {
	ptr, ; uint8_t data_start
	i32, ; uint32_t assembly_count
	i32, ; uint32_t index_entry_count
	ptr ; AssemblyStoreAssemblyDescriptor assemblies
}

%struct.AssemblyStoreSingleAssemblyRuntimeData = type {
	ptr, ; uint8_t image_data
	ptr, ; uint8_t debug_info_data
	ptr, ; uint8_t config_data
	ptr ; AssemblyStoreAssemblyDescriptor descriptor
}

%struct.DSOApkEntry = type {
	i64, ; uint64_t name_hash
	i32, ; uint32_t offset
	i32 ; int32_t fd
}

%struct.DSOCacheEntry = type {
	i64, ; uint64_t hash
	i64, ; uint64_t real_name_hash
	i1, ; bool ignore
	i1, ; bool is_jni_library
	ptr, ; char* name
	ptr ; void* handle
}

%struct.XamarinAndroidBundledAssembly = type {
	i32, ; int32_t file_fd
	ptr, ; char* file_name
	i32, ; uint32_t data_offset
	i32, ; uint32_t data_size
	ptr, ; uint8_t data
	i32, ; uint32_t name_length
	ptr ; char* name
}

; 0x25e6972616d58
@format_tag = dso_local local_unnamed_addr constant i64 666756936985944, align 8

@mono_aot_mode_name = dso_local local_unnamed_addr constant ptr @.env.0, align 8

; Application environment variables array, name:value
@app_environment_variables = dso_local local_unnamed_addr constant [4 x ptr] [
	ptr @.env.var.0, ; 0 ('MONO_GC_PARAMS')
	ptr @.env.var.1, ; 1 ('major=marksweep-conc')
	ptr @.env.var.2, ; 2 ('XA_HTTP_CLIENT_HANDLER_TYPE')
	ptr @.env.var.3 ; 3 ('Xamarin.Android.Net.AndroidMessageHandler')
], align 8

; System properties defined by the application
@app_system_properties = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@application_config = dso_local local_unnamed_addr constant %struct.ApplicationConfig {
	i1 false, ; bool uses_mono_llvm
	i1 true, ; bool uses_mono_aot
	i1 true, ; bool aot_lazy_load
	i1 false, ; bool uses_assembly_preload
	i1 false, ; bool broken_exception_transitions
	i1 false, ; bool jni_add_native_method_registration_attribute_present
	i1 true, ; bool have_runtime_config_blob
	i1 true, ; bool have_assemblies_blob
	i1 true, ; bool marshal_methods_enabled
	i1 false, ; bool ignore_split_configs
	i8 0, ; uint8_t bound_stream_io_exception_type
	i32 3, ; uint32_t package_naming_policy
	i32 4, ; uint32_t environment_variable_count
	i32 0, ; uint32_t system_property_count
	i32 64, ; uint32_t number_of_assemblies_in_apk
	i32 0, ; uint32_t bundled_assembly_name_width
	i32 36, ; uint32_t number_of_dso_cache_entries
	i32 576, ; uint32_t number_of_aot_cache_entries
	i32 73, ; uint32_t number_of_shared_libraries
	i32 u0x02000178, ; uint32_t android_runtime_jnienv_class_token
	i32 u0x06000dc5, ; uint32_t jnienv_initialize_method_token
	i32 u0x06000dc4, ; uint32_t jnienv_registerjninatives_method_token
	i32 0, ; uint32_t jni_remapping_replacement_type_count
	i32 0, ; uint32_t jni_remapping_replacement_method_index_entry_count
	i32 u0x00000000, ; uint32_t mono_components_mask
	ptr @.ApplicationConfig.0_android_package_name, ; char* android_package_name
	i1 false; bool managed_marshal_methods_lookup_enabled
}, align 8

; DSO cache entries
@dso_cache = dso_local local_unnamed_addr global [36 x %struct.DSOCacheEntry] [
	%struct.DSOCacheEntry {
		i64 u0x01848c0093f0afd8, ; from name: libSystem.Security.Cryptography.Native.Android
		i64 u0x4818e42ca66bbd75, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.3_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle
	}, ; 0
	%struct.DSOCacheEntry {
		i64 u0x04bb981b3c3ff40f, ; from name: System.Security.Cryptography.Native.Android.so
		i64 u0x4818e42ca66bbd75, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.3_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle
	}, ; 1
	%struct.DSOCacheEntry {
		i64 u0x0582d422de762780, ; from name: libmono-component-marshal-ilgen.so
		i64 u0x0582d422de762780, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle
	}, ; 2
	%struct.DSOCacheEntry {
		i64 u0x0600544dd3961080, ; from name: HarfBuzzSharp
		i64 u0x264b4ef3914e9f5f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.7_name, ; name: libHarfBuzzSharp.so
		ptr null; void* handle
	}, ; 3
	%struct.DSOCacheEntry {
		i64 u0x07e1516b937259a4, ; from name: System.Globalization.Native.so
		i64 u0x74b568291c419777, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.0_name, ; name: libSystem.Globalization.Native.so
		ptr null; void* handle
	}, ; 4
	%struct.DSOCacheEntry {
		i64 u0x12e73d483788709d, ; from name: SkiaSharp.so
		i64 u0x43db119dcc3147fa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.8_name, ; name: libSkiaSharp.so
		ptr null; void* handle
	}, ; 5
	%struct.DSOCacheEntry {
		i64 u0x1a1918dd01662b19, ; from name: libmonosgen-2.0.so
		i64 u0x1a1918dd01662b19, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.5_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle
	}, ; 6
	%struct.DSOCacheEntry {
		i64 u0x202e3ec65b20d368, ; from name: libHarfBuzzSharp
		i64 u0x264b4ef3914e9f5f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.7_name, ; name: libHarfBuzzSharp.so
		ptr null; void* handle
	}, ; 7
	%struct.DSOCacheEntry {
		i64 u0x264b4ef3914e9f5f, ; from name: libHarfBuzzSharp.so
		i64 u0x264b4ef3914e9f5f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.7_name, ; name: libHarfBuzzSharp.so
		ptr null; void* handle
	}, ; 8
	%struct.DSOCacheEntry {
		i64 u0x28b5c8fca080abd5, ; from name: libSystem.Globalization.Native
		i64 u0x74b568291c419777, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.0_name, ; name: libSystem.Globalization.Native.so
		ptr null; void* handle
	}, ; 9
	%struct.DSOCacheEntry {
		i64 u0x2b87bb6ac8822015, ; from name: libmonodroid
		i64 u0x4434c7fd110c8d8b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.6_name, ; name: libmonodroid.so
		ptr null; void* handle
	}, ; 10
	%struct.DSOCacheEntry {
		i64 u0x3807dd20062deb45, ; from name: monodroid
		i64 u0x4434c7fd110c8d8b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.6_name, ; name: libmonodroid.so
		ptr null; void* handle
	}, ; 11
	%struct.DSOCacheEntry {
		i64 u0x40f32024ffd1c0be, ; from name: System.IO.Compression.Native.so
		i64 u0xc3cb80650fe5a0ab, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle
	}, ; 12
	%struct.DSOCacheEntry {
		i64 u0x43db119dcc3147fa, ; from name: libSkiaSharp.so
		i64 u0x43db119dcc3147fa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.8_name, ; name: libSkiaSharp.so
		ptr null; void* handle
	}, ; 13
	%struct.DSOCacheEntry {
		i64 u0x4434c7fd110c8d8b, ; from name: libmonodroid.so
		i64 u0x4434c7fd110c8d8b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.6_name, ; name: libmonodroid.so
		ptr null; void* handle
	}, ; 14
	%struct.DSOCacheEntry {
		i64 u0x4818e42ca66bbd75, ; from name: libSystem.Security.Cryptography.Native.Android.so
		i64 u0x4818e42ca66bbd75, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.3_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle
	}, ; 15
	%struct.DSOCacheEntry {
		i64 u0x4cd7bd0032e920e1, ; from name: libSystem.Native
		i64 u0xa337ccc8aef94267, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Native.so
		ptr null; void* handle
	}, ; 16
	%struct.DSOCacheEntry {
		i64 u0x61c4cca6c77a9014, ; from name: libmonosgen-2.0
		i64 u0x1a1918dd01662b19, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.5_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle
	}, ; 17
	%struct.DSOCacheEntry {
		i64 u0x74b568291c419777, ; from name: libSystem.Globalization.Native.so
		i64 u0x74b568291c419777, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.0_name, ; name: libSystem.Globalization.Native.so
		ptr null; void* handle
	}, ; 18
	%struct.DSOCacheEntry {
		i64 u0x81bc2b0b52670f30, ; from name: System.Security.Cryptography.Native.Android
		i64 u0x4818e42ca66bbd75, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.3_name, ; name: libSystem.Security.Cryptography.Native.Android.so
		ptr null; void* handle
	}, ; 19
	%struct.DSOCacheEntry {
		i64 u0x9190f4cb761b1d3c, ; from name: libSystem.IO.Compression.Native
		i64 u0xc3cb80650fe5a0ab, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle
	}, ; 20
	%struct.DSOCacheEntry {
		i64 u0x936d971cc035eac2, ; from name: mono-component-marshal-ilgen
		i64 u0x0582d422de762780, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle
	}, ; 21
	%struct.DSOCacheEntry {
		i64 u0x9c62065cdbdf43a5, ; from name: monosgen-2.0
		i64 u0x1a1918dd01662b19, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.5_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle
	}, ; 22
	%struct.DSOCacheEntry {
		i64 u0x9ff54ae8a9311b68, ; from name: System.Native
		i64 u0xa337ccc8aef94267, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Native.so
		ptr null; void* handle
	}, ; 23
	%struct.DSOCacheEntry {
		i64 u0xa337ccc8aef94267, ; from name: libSystem.Native.so
		i64 u0xa337ccc8aef94267, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Native.so
		ptr null; void* handle
	}, ; 24
	%struct.DSOCacheEntry {
		i64 u0xa76ab5a3894f5a01, ; from name: System.Globalization.Native
		i64 u0x74b568291c419777, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.0_name, ; name: libSystem.Globalization.Native.so
		ptr null; void* handle
	}, ; 25
	%struct.DSOCacheEntry {
		i64 u0xab177aa6a32873ac, ; from name: monodroid.so
		i64 u0x4434c7fd110c8d8b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 true, ; bool is_jni_library
		ptr @.DSOCacheEntry.6_name, ; name: libmonodroid.so
		ptr null; void* handle
	}, ; 26
	%struct.DSOCacheEntry {
		i64 u0xc3cb80650fe5a0ab, ; from name: libSystem.IO.Compression.Native.so
		i64 u0xc3cb80650fe5a0ab, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle
	}, ; 27
	%struct.DSOCacheEntry {
		i64 u0xccf5ce5cbae59392, ; from name: libSkiaSharp
		i64 u0x43db119dcc3147fa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.8_name, ; name: libSkiaSharp.so
		ptr null; void* handle
	}, ; 28
	%struct.DSOCacheEntry {
		i64 u0xd334d108d628ab4f, ; from name: System.IO.Compression.Native
		i64 u0xc3cb80650fe5a0ab, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.1_name, ; name: libSystem.IO.Compression.Native.so
		ptr null; void* handle
	}, ; 29
	%struct.DSOCacheEntry {
		i64 u0xd565cc57ed541a90, ; from name: monosgen-2.0.so
		i64 u0x1a1918dd01662b19, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.5_name, ; name: libmonosgen-2.0.so
		ptr null; void* handle
	}, ; 30
	%struct.DSOCacheEntry {
		i64 u0xde6fb4b955d66724, ; from name: libmono-component-marshal-ilgen
		i64 u0x0582d422de762780, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle
	}, ; 31
	%struct.DSOCacheEntry {
		i64 u0xe0d15587b4505ecd, ; from name: mono-component-marshal-ilgen.so
		i64 u0x0582d422de762780, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.4_name, ; name: libmono-component-marshal-ilgen.so
		ptr null; void* handle
	}, ; 32
	%struct.DSOCacheEntry {
		i64 u0xecb906ed9649ed1c, ; from name: System.Native.so
		i64 u0xa337ccc8aef94267, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.2_name, ; name: libSystem.Native.so
		ptr null; void* handle
	}, ; 33
	%struct.DSOCacheEntry {
		i64 u0xf4727d423e5d26f3, ; from name: SkiaSharp
		i64 u0x43db119dcc3147fa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.8_name, ; name: libSkiaSharp.so
		ptr null; void* handle
	}, ; 34
	%struct.DSOCacheEntry {
		i64 u0xfdf2eea75962e071, ; from name: HarfBuzzSharp.so
		i64 u0x264b4ef3914e9f5f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.7_name, ; name: libHarfBuzzSharp.so
		ptr null; void* handle
	} ; 35
], align 8

@dso_jni_preloads_idx_stride = dso_local local_unnamed_addr constant i32 4, align 4

@dso_jni_preloads_idx_count = dso_local local_unnamed_addr constant i64 4, align 8

; Indices into dso_cache[] of DSO libraries to preload because of JNI use
@dso_jni_preloads_idx = dso_local local_unnamed_addr constant [4 x i32] [
	i32 15, ; libSystem.Security.Cryptography.Native.Android.so
	i32 0, ; libSystem.Security.Cryptography.Native.Android
	i32 1, ; System.Security.Cryptography.Native.Android.so
	i32 19 ; System.Security.Cryptography.Native.Android
], align 4

; AOT DSO cache entries
@aot_dso_cache = dso_local local_unnamed_addr global [576 x %struct.DSOCacheEntry] [
	%struct.DSOCacheEntry {
		i64 u0x003beba4753b78eb, ; from name: libaot-System.Net.NameResolution
		i64 u0x7f280e9be5453eba, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle
	}, ; 0
	%struct.DSOCacheEntry {
		i64 u0x00711b227e0a93a3, ; from name: Avalonia.Dialogs.dll.so
		i64 u0x0e88e656cbbcbbc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Avalonia.Dialogs.dll.so
		ptr null; void* handle
	}, ; 1
	%struct.DSOCacheEntry {
		i64 u0x00cdc5f9ca43c45e, ; from name: libaot-netstandard.so
		i64 u0xb6ab21527197f7f1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle
	}, ; 2
	%struct.DSOCacheEntry {
		i64 u0x00d09d7ee2baa65e, ; from name: libaot-Xamarin.AndroidX.Activity
		i64 u0x8a05820e9e77c0c3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 3
	%struct.DSOCacheEntry {
		i64 u0x012b4b954988e31e, ; from name: libaot-Avalonia.Remote.Protocol
		i64 u0x5243c77c100497fa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Avalonia.Remote.Protocol.dll.so
		ptr null; void* handle
	}, ; 4
	%struct.DSOCacheEntry {
		i64 u0x019ef78eca126b3d, ; from name: aot-Mono.Android.so
		i64 u0x359895a3c1bd5685, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 5
	%struct.DSOCacheEntry {
		i64 u0x01f05117c40ba779, ; from name: System.Net.Sockets.dll.so
		i64 u0x4c5401149da6445e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle
	}, ; 6
	%struct.DSOCacheEntry {
		i64 u0x0276f95ae24bb1ea, ; from name: libaot-Xamarin.AndroidX.SavedState
		i64 u0x039588659cdd2f6a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.SavedState.dll.so
		ptr null; void* handle
	}, ; 7
	%struct.DSOCacheEntry {
		i64 u0x02c3fcc5df9c23c8, ; from name: aot-Avalonia.MicroCom.dll.so
		i64 u0xd7b79701607da010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Avalonia.MicroCom.dll.so
		ptr null; void* handle
	}, ; 8
	%struct.DSOCacheEntry {
		i64 u0x02ce506e1a16ff6a, ; from name: aot-System.Collections.dll.so
		i64 u0xb3f9fc836ae7ebb5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 9
	%struct.DSOCacheEntry {
		i64 u0x02df486d5080f7fa, ; from name: libaot-System.Text.RegularExpressions.so
		i64 u0x7c2c39dae387b52d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 10
	%struct.DSOCacheEntry {
		i64 u0x031aeea51ada0ffd, ; from name: aot-System.Threading
		i64 u0x5f435aa7f5fde870, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 11
	%struct.DSOCacheEntry {
		i64 u0x039588659cdd2f6a, ; from name: libaot-Xamarin.AndroidX.SavedState.dll.so
		i64 u0x039588659cdd2f6a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.SavedState.dll.so
		ptr null; void* handle
	}, ; 12
	%struct.DSOCacheEntry {
		i64 u0x03eecb77e2c2ebd5, ; from name: libaot-Avalonia.Markup
		i64 u0xcf830f414728cec6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Avalonia.Markup.dll.so
		ptr null; void* handle
	}, ; 13
	%struct.DSOCacheEntry {
		i64 u0x040f66771b9ec3f7, ; from name: System.Collections.Specialized.so
		i64 u0x355b66670e6bf2e4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 14
	%struct.DSOCacheEntry {
		i64 u0x042ed5fd9a061e3d, ; from name: aot-Avalonia.so
		i64 u0x94fe7e3e9bc50f2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Avalonia.dll.so
		ptr null; void* handle
	}, ; 15
	%struct.DSOCacheEntry {
		i64 u0x04f70c204f1c2cec, ; from name: aot-Xamarin.AndroidX.AppCompat
		i64 u0x42c7eb0880ff24a4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 16
	%struct.DSOCacheEntry {
		i64 u0x0517ef04e06e9f76, ; from name: System.Net.Primitives
		i64 u0xaac4801194f87f4f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 17
	%struct.DSOCacheEntry {
		i64 u0x053cfa13bdb5a125, ; from name: Yrm100.Protocol.dll.so
		i64 u0x79f30a8f30bc39e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Yrm100.Protocol.dll.so
		ptr null; void* handle
	}, ; 18
	%struct.DSOCacheEntry {
		i64 u0x05411110dc51e939, ; from name: libaot-System.Collections.so
		i64 u0xb3f9fc836ae7ebb5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 19
	%struct.DSOCacheEntry {
		i64 u0x0600544dd3961080, ; from name: HarfBuzzSharp
		i64 u0x34fa94470888dd75, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-HarfBuzzSharp.dll.so
		ptr null; void* handle
	}, ; 20
	%struct.DSOCacheEntry {
		i64 u0x06d677d160d55768, ; from name: libaot-System.Diagnostics.TraceSource
		i64 u0x2119cc81025daa05, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle
	}, ; 21
	%struct.DSOCacheEntry {
		i64 u0x06de7ebf7e865e5c, ; from name: System.Private.CoreLib.so
		i64 u0xe1af59ffe15719e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 22
	%struct.DSOCacheEntry {
		i64 u0x0722e2daaafe82e6, ; from name: aot-Xamarin.AndroidX.SavedState.so
		i64 u0x039588659cdd2f6a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.SavedState.dll.so
		ptr null; void* handle
	}, ; 23
	%struct.DSOCacheEntry {
		i64 u0x077be473fe3d3eef, ; from name: aot-Mono.Android.dll.so
		i64 u0x359895a3c1bd5685, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 24
	%struct.DSOCacheEntry {
		i64 u0x07869dd1c492a791, ; from name: libaot-System.IO.Compression.dll.so
		i64 u0x07869dd1c492a791, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 25
	%struct.DSOCacheEntry {
		i64 u0x0799af1d269ee311, ; from name: aot-System.Diagnostics.DiagnosticSource
		i64 u0x77156c94b5eff927, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 26
	%struct.DSOCacheEntry {
		i64 u0x07c517aba7be7144, ; from name: aot-Xamarin.AndroidX.Activity.dll.so
		i64 u0x8a05820e9e77c0c3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 27
	%struct.DSOCacheEntry {
		i64 u0x07dcdc7460a0c5e4, ; from name: System.Collections.NonGeneric
		i64 u0x6fd15fb6a42c9afc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 28
	%struct.DSOCacheEntry {
		i64 u0x087e53f50e8fa54a, ; from name: aot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		i64 u0x38e4553d8764fa45, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 29
	%struct.DSOCacheEntry {
		i64 u0x08f3c9788ee2153c, ; from name: Xamarin.AndroidX.DrawerLayout
		i64 u0x4bea014989424a56, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 30
	%struct.DSOCacheEntry {
		i64 u0x09d144a7e214d457, ; from name: System.Security.Cryptography
		i64 u0xd0e82017367ac826, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 31
	%struct.DSOCacheEntry {
		i64 u0x0a147b2c00acff78, ; from name: aot-System.Collections
		i64 u0xb3f9fc836ae7ebb5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 32
	%struct.DSOCacheEntry {
		i64 u0x0a410faf43ed0ea7, ; from name: aot-System.ComponentModel.TypeConverter
		i64 u0xcb7e41356728fd07, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 33
	%struct.DSOCacheEntry {
		i64 u0x0afb5f902ded4901, ; from name: Avalonia.Metal.dll.so
		i64 u0x52c039815d238d2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Avalonia.Metal.dll.so
		ptr null; void* handle
	}, ; 34
	%struct.DSOCacheEntry {
		i64 u0x0ba878709e165317, ; from name: aot-Yrm100.Protocol
		i64 u0x79f30a8f30bc39e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Yrm100.Protocol.dll.so
		ptr null; void* handle
	}, ; 35
	%struct.DSOCacheEntry {
		i64 u0x0bbe9d20bf639a6d, ; from name: Mono.Android.dll.so
		i64 u0x359895a3c1bd5685, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 36
	%struct.DSOCacheEntry {
		i64 u0x0c3d4343ddcd5d2f, ; from name: aot-netstandard
		i64 u0xb6ab21527197f7f1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle
	}, ; 37
	%struct.DSOCacheEntry {
		i64 u0x0c59ad9fbbd43abe, ; from name: Mono.Android
		i64 u0x359895a3c1bd5685, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 38
	%struct.DSOCacheEntry {
		i64 u0x0c644d6a2b020c43, ; from name: libaot-Xamarin.Kotlin.StdLib.dll.so
		i64 u0x0c644d6a2b020c43, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 39
	%struct.DSOCacheEntry {
		i64 u0x0c680fa42a3f17fe, ; from name: aot-SkiaSharp
		i64 u0x3cb282562b838c95, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-SkiaSharp.dll.so
		ptr null; void* handle
	}, ; 40
	%struct.DSOCacheEntry {
		i64 u0x0c763ee75e26732f, ; from name: aot-System.IO.Compression.so
		i64 u0x07869dd1c492a791, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 41
	%struct.DSOCacheEntry {
		i64 u0x0c80586329c76c49, ; from name: Avalonia.MicroCom.so
		i64 u0xd7b79701607da010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Avalonia.MicroCom.dll.so
		ptr null; void* handle
	}, ; 42
	%struct.DSOCacheEntry {
		i64 u0x0c920480fa0c2eaa, ; from name: aot-System.Threading.dll.so
		i64 u0x5f435aa7f5fde870, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 43
	%struct.DSOCacheEntry {
		i64 u0x0c95146e3fdcf631, ; from name: libaot-Mono.Android.so
		i64 u0x359895a3c1bd5685, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 44
	%struct.DSOCacheEntry {
		i64 u0x0dd6f35447704ccb, ; from name: aot-System.Private.CoreLib.dll.so
		i64 u0xe1af59ffe15719e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 45
	%struct.DSOCacheEntry {
		i64 u0x0e85db2a1cd0e11a, ; from name: System.Threading.dll.so
		i64 u0x5f435aa7f5fde870, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 46
	%struct.DSOCacheEntry {
		i64 u0x0e88e656cbbcbbc6, ; from name: libaot-Avalonia.Dialogs.dll.so
		i64 u0x0e88e656cbbcbbc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Avalonia.Dialogs.dll.so
		ptr null; void* handle
	}, ; 47
	%struct.DSOCacheEntry {
		i64 u0x0e9650d13d768643, ; from name: libaot-Avalonia.so
		i64 u0x94fe7e3e9bc50f2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Avalonia.dll.so
		ptr null; void* handle
	}, ; 48
	%struct.DSOCacheEntry {
		i64 u0x0ee139ab935710eb, ; from name: aot-Mono.Android.Runtime
		i64 u0x156ae2b2e8a39884, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 49
	%struct.DSOCacheEntry {
		i64 u0x0f6ec7bc00b37705, ; from name: libaot-System.Runtime
		i64 u0xbbc0e6e747d7877a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 50
	%struct.DSOCacheEntry {
		i64 u0x0f973de6fa66af12, ; from name: Xamarin.AndroidX.AppCompat.dll.so
		i64 u0x42c7eb0880ff24a4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 51
	%struct.DSOCacheEntry {
		i64 u0x0fe18bfe5526f30d, ; from name: libaot-System.Collections.Concurrent
		i64 u0x65cd21401fecc3dc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 52
	%struct.DSOCacheEntry {
		i64 u0x103ebac2da4f3fab, ; from name: aot-Yrm100.Protocol.so
		i64 u0x79f30a8f30bc39e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Yrm100.Protocol.dll.so
		ptr null; void* handle
	}, ; 53
	%struct.DSOCacheEntry {
		i64 u0x10880d1b2b9c64e3, ; from name: libaot-Avalonia.OpenGL
		i64 u0x9a9f0f27449e14da, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Avalonia.OpenGL.dll.so
		ptr null; void* handle
	}, ; 54
	%struct.DSOCacheEntry {
		i64 u0x10b0940d9b6b7345, ; from name: aot-YRM100.Reader.so
		i64 u0x327465e605eba9a7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-YRM100.Reader.dll.so
		ptr null; void* handle
	}, ; 55
	%struct.DSOCacheEntry {
		i64 u0x11a3ab1311372d7b, ; from name: aot-Avalonia.Dialogs.dll.so
		i64 u0x0e88e656cbbcbbc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Avalonia.Dialogs.dll.so
		ptr null; void* handle
	}, ; 56
	%struct.DSOCacheEntry {
		i64 u0x12e73d483788709d, ; from name: SkiaSharp.so
		i64 u0x3cb282562b838c95, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-SkiaSharp.dll.so
		ptr null; void* handle
	}, ; 57
	%struct.DSOCacheEntry {
		i64 u0x13d1a53b1840ddcb, ; from name: Avalonia.Vulkan.dll.so
		i64 u0xa7f15d3a1f546d9b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Avalonia.Vulkan.dll.so
		ptr null; void* handle
	}, ; 58
	%struct.DSOCacheEntry {
		i64 u0x13e4c9b4a68b70b1, ; from name: aot-System.Linq
		i64 u0x2fb7a3952b307fae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 59
	%struct.DSOCacheEntry {
		i64 u0x14509a44f2bd8f81, ; from name: System.Console.dll.so
		i64 u0xc2da5dca6ccd8b0a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 60
	%struct.DSOCacheEntry {
		i64 u0x14c874ac8b04a442, ; from name: aot-System.Runtime.InteropServices.so
		i64 u0x5ae6db1ddadc230b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 61
	%struct.DSOCacheEntry {
		i64 u0x156ae2b2e8a39884, ; from name: libaot-Mono.Android.Runtime.dll.so
		i64 u0x156ae2b2e8a39884, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 62
	%struct.DSOCacheEntry {
		i64 u0x16f6f94c92af6425, ; from name: aot-HarfBuzzSharp.dll.so
		i64 u0x34fa94470888dd75, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-HarfBuzzSharp.dll.so
		ptr null; void* handle
	}, ; 63
	%struct.DSOCacheEntry {
		i64 u0x176b201d45ff9ef3, ; from name: libaot-SkiaSharp
		i64 u0x3cb282562b838c95, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-SkiaSharp.dll.so
		ptr null; void* handle
	}, ; 64
	%struct.DSOCacheEntry {
		i64 u0x17f10bff77f05b2e, ; from name: Avalonia.Remote.Protocol
		i64 u0x5243c77c100497fa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Avalonia.Remote.Protocol.dll.so
		ptr null; void* handle
	}, ; 65
	%struct.DSOCacheEntry {
		i64 u0x18596f9bfb8c7071, ; from name: aot-System.Diagnostics.TraceSource.so
		i64 u0x2119cc81025daa05, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle
	}, ; 66
	%struct.DSOCacheEntry {
		i64 u0x191b3f8d6487e980, ; from name: aot-Xamarin.AndroidX.Lifecycle.Common
		i64 u0xc25aa808516eb94a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.dll.so
		ptr null; void* handle
	}, ; 67
	%struct.DSOCacheEntry {
		i64 u0x195f8312b1c63709, ; from name: libaot-netstandard
		i64 u0xb6ab21527197f7f1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle
	}, ; 68
	%struct.DSOCacheEntry {
		i64 u0x1a9b4d0dd66b41d1, ; from name: libaot-Yrm100.Protocol
		i64 u0x79f30a8f30bc39e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Yrm100.Protocol.dll.so
		ptr null; void* handle
	}, ; 69
	%struct.DSOCacheEntry {
		i64 u0x1abba82243dae9e0, ; from name: Avalonia.Skia.dll.so
		i64 u0xce3991481c3a2f14, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Avalonia.Skia.dll.so
		ptr null; void* handle
	}, ; 70
	%struct.DSOCacheEntry {
		i64 u0x1b2b7f3d7c12198e, ; from name: Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		i64 u0x8a1d474b582068bb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		ptr null; void* handle
	}, ; 71
	%struct.DSOCacheEntry {
		i64 u0x1b3005759978ff72, ; from name: Xamarin.AndroidX.Core.dll.so
		i64 u0x28a319e875b39488, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 72
	%struct.DSOCacheEntry {
		i64 u0x1c3e8fd6e2975272, ; from name: aot-YRM100.Reader.dll.so
		i64 u0x327465e605eba9a7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-YRM100.Reader.dll.so
		ptr null; void* handle
	}, ; 73
	%struct.DSOCacheEntry {
		i64 u0x1cb5727558458466, ; from name: aot-System.Collections.NonGeneric
		i64 u0x6fd15fb6a42c9afc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 74
	%struct.DSOCacheEntry {
		i64 u0x1cbd96398ee943a6, ; from name: YRM100.Reader
		i64 u0x327465e605eba9a7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-YRM100.Reader.dll.so
		ptr null; void* handle
	}, ; 75
	%struct.DSOCacheEntry {
		i64 u0x1d3dd0218cdc9fa5, ; from name: Avalonia.Markup.Xaml
		i64 u0x5afe641f0eb3380f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Avalonia.Markup.Xaml.dll.so
		ptr null; void* handle
	}, ; 76
	%struct.DSOCacheEntry {
		i64 u0x1e1a605292ce6795, ; from name: Avalonia.Themes.Fluent
		i64 u0x2151e7b9f3592593, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Avalonia.Themes.Fluent.dll.so
		ptr null; void* handle
	}, ; 77
	%struct.DSOCacheEntry {
		i64 u0x1e821bd8427d5c24, ; from name: aot-System.Runtime.InteropServices
		i64 u0x5ae6db1ddadc230b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 78
	%struct.DSOCacheEntry {
		i64 u0x1ea8ccf94a46eb45, ; from name: Avalonia.DesignerSupport.so
		i64 u0xfc800994bb34a441, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Avalonia.DesignerSupport.dll.so
		ptr null; void* handle
	}, ; 79
	%struct.DSOCacheEntry {
		i64 u0x1fc7bca32ed3d697, ; from name: Xamarin.AndroidX.SavedState.so
		i64 u0x039588659cdd2f6a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.SavedState.dll.so
		ptr null; void* handle
	}, ; 80
	%struct.DSOCacheEntry {
		i64 u0x2119cc81025daa05, ; from name: libaot-System.Diagnostics.TraceSource.dll.so
		i64 u0x2119cc81025daa05, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle
	}, ; 81
	%struct.DSOCacheEntry {
		i64 u0x211bdd5d55e8484b, ; from name: aot-System.Private.Uri.so
		i64 u0xe57af9ab00f5c61d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 82
	%struct.DSOCacheEntry {
		i64 u0x2151e7b9f3592593, ; from name: libaot-Avalonia.Themes.Fluent.dll.so
		i64 u0x2151e7b9f3592593, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Avalonia.Themes.Fluent.dll.so
		ptr null; void* handle
	}, ; 83
	%struct.DSOCacheEntry {
		i64 u0x2174319c0d835bc9, ; from name: System.Runtime
		i64 u0xbbc0e6e747d7877a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 84
	%struct.DSOCacheEntry {
		i64 u0x21972b3a3a55f75c, ; from name: aot-Xamarin.AndroidX.Lifecycle.Common.so
		i64 u0xc25aa808516eb94a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.dll.so
		ptr null; void* handle
	}, ; 85
	%struct.DSOCacheEntry {
		i64 u0x21b67f975a60e15a, ; from name: libaot-System.Text.RegularExpressions
		i64 u0x7c2c39dae387b52d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 86
	%struct.DSOCacheEntry {
		i64 u0x21bfe38d456b5dd0, ; from name: System.Net.NameResolution.so
		i64 u0x7f280e9be5453eba, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle
	}, ; 87
	%struct.DSOCacheEntry {
		i64 u0x22e993b6513630cc, ; from name: libaot-Avalonia.Metal
		i64 u0x52c039815d238d2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Avalonia.Metal.dll.so
		ptr null; void* handle
	}, ; 88
	%struct.DSOCacheEntry {
		i64 u0x2407aef2bbe8fadf, ; from name: System.Console
		i64 u0xc2da5dca6ccd8b0a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 89
	%struct.DSOCacheEntry {
		i64 u0x2436aed1e86579d5, ; from name: aot-Xamarin.AndroidX.Fragment.so
		i64 u0x8ab6d3431da5497e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 90
	%struct.DSOCacheEntry {
		i64 u0x2457561d6ef924e4, ; from name: libaot-System.ObjectModel
		i64 u0x914167d87d2ee1b1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 91
	%struct.DSOCacheEntry {
		i64 u0x24d07ebecd2ca947, ; from name: libaot-Avalonia.OpenGL.so
		i64 u0x9a9f0f27449e14da, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Avalonia.OpenGL.dll.so
		ptr null; void* handle
	}, ; 92
	%struct.DSOCacheEntry {
		i64 u0x2565c4c3b04e33e0, ; from name: aot-System.ComponentModel.Annotations.so
		i64 u0xbf7d944f85fcd72c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-System.ComponentModel.Annotations.dll.so
		ptr null; void* handle
	}, ; 93
	%struct.DSOCacheEntry {
		i64 u0x2604cf15d10cf90e, ; from name: aot-System.Net.Sockets
		i64 u0x4c5401149da6445e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle
	}, ; 94
	%struct.DSOCacheEntry {
		i64 u0x26c50d1c104cf4a2, ; from name: aot-Avalonia.Remote.Protocol.dll.so
		i64 u0x5243c77c100497fa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Avalonia.Remote.Protocol.dll.so
		ptr null; void* handle
	}, ; 95
	%struct.DSOCacheEntry {
		i64 u0x2738d40e9dee8687, ; from name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core
		i64 u0x38e4553d8764fa45, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 96
	%struct.DSOCacheEntry {
		i64 u0x27a6eefa9a4dc4d9, ; from name: aot-System.Private.Xml.dll.so
		i64 u0x52bbd048717682d4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 97
	%struct.DSOCacheEntry {
		i64 u0x28152ea581664c10, ; from name: aot-Avalonia.Themes.Fluent.dll.so
		i64 u0x2151e7b9f3592593, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Avalonia.Themes.Fluent.dll.so
		ptr null; void* handle
	}, ; 98
	%struct.DSOCacheEntry {
		i64 u0x2849d252e4f42821, ; from name: aot-Xamarin.AndroidX.Core.so
		i64 u0x28a319e875b39488, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 99
	%struct.DSOCacheEntry {
		i64 u0x28a319e875b39488, ; from name: libaot-Xamarin.AndroidX.Core.dll.so
		i64 u0x28a319e875b39488, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 100
	%struct.DSOCacheEntry {
		i64 u0x28e25efdf7b4cc36, ; from name: System.Net.Primitives.so
		i64 u0xaac4801194f87f4f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 101
	%struct.DSOCacheEntry {
		i64 u0x29c5c11b3828c4d7, ; from name: aot-SkiaSharp.so
		i64 u0x3cb282562b838c95, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-SkiaSharp.dll.so
		ptr null; void* handle
	}, ; 102
	%struct.DSOCacheEntry {
		i64 u0x2a60975f967613b9, ; from name: aot-System.Text.RegularExpressions.so
		i64 u0x7c2c39dae387b52d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 103
	%struct.DSOCacheEntry {
		i64 u0x2a6fc9f511ce6292, ; from name: libaot-System.Private.Xml
		i64 u0x52bbd048717682d4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 104
	%struct.DSOCacheEntry {
		i64 u0x2b20ec3e8ca14022, ; from name: aot-System.ObjectModel.so
		i64 u0x914167d87d2ee1b1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 105
	%struct.DSOCacheEntry {
		i64 u0x2c3037a6cc5d862d, ; from name: aot-Mono.Android.Runtime.so
		i64 u0x156ae2b2e8a39884, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 106
	%struct.DSOCacheEntry {
		i64 u0x2ddeb9b279c82c8e, ; from name: aot-System.Private.Xml
		i64 u0x52bbd048717682d4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 107
	%struct.DSOCacheEntry {
		i64 u0x2ef9790309d55e46, ; from name: aot-System.Diagnostics.DiagnosticSource.so
		i64 u0x77156c94b5eff927, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 108
	%struct.DSOCacheEntry {
		i64 u0x2f1ec89e14fae803, ; from name: libaot-Xamarin.AndroidX.Loader
		i64 u0x74b0aefe8f467d50, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 109
	%struct.DSOCacheEntry {
		i64 u0x2f61d85c51a6db93, ; from name: System.ComponentModel.TypeConverter.so
		i64 u0xcb7e41356728fd07, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 110
	%struct.DSOCacheEntry {
		i64 u0x2fb7a3952b307fae, ; from name: libaot-System.Linq.dll.so
		i64 u0x2fb7a3952b307fae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 111
	%struct.DSOCacheEntry {
		i64 u0x30190f88602104ca, ; from name: aot-Avalonia.Vulkan
		i64 u0xa7f15d3a1f546d9b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Avalonia.Vulkan.dll.so
		ptr null; void* handle
	}, ; 112
	%struct.DSOCacheEntry {
		i64 u0x3115a4d74708120a, ; from name: aot-Avalonia.dll.so
		i64 u0x94fe7e3e9bc50f2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Avalonia.dll.so
		ptr null; void* handle
	}, ; 113
	%struct.DSOCacheEntry {
		i64 u0x322ac199914afc70, ; from name: aot-System.Collections.so
		i64 u0xb3f9fc836ae7ebb5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 114
	%struct.DSOCacheEntry {
		i64 u0x327465e605eba9a7, ; from name: libaot-YRM100.Reader.dll.so
		i64 u0x327465e605eba9a7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-YRM100.Reader.dll.so
		ptr null; void* handle
	}, ; 115
	%struct.DSOCacheEntry {
		i64 u0x32ca1c5f140ca346, ; from name: YRM100.Reader.dll.so
		i64 u0x327465e605eba9a7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-YRM100.Reader.dll.so
		ptr null; void* handle
	}, ; 116
	%struct.DSOCacheEntry {
		i64 u0x3304b4516332575c, ; from name: System.Collections.dll.so
		i64 u0xb3f9fc836ae7ebb5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 117
	%struct.DSOCacheEntry {
		i64 u0x332e06e9aae9a08d, ; from name: System.Net.NameResolution.dll.so
		i64 u0x7f280e9be5453eba, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle
	}, ; 118
	%struct.DSOCacheEntry {
		i64 u0x3392615f71405f95, ; from name: MicroCom.Runtime.dll.so
		i64 u0x6114909d114168f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-MicroCom.Runtime.dll.so
		ptr null; void* handle
	}, ; 119
	%struct.DSOCacheEntry {
		i64 u0x34fa94470888dd75, ; from name: libaot-HarfBuzzSharp.dll.so
		i64 u0x34fa94470888dd75, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-HarfBuzzSharp.dll.so
		ptr null; void* handle
	}, ; 120
	%struct.DSOCacheEntry {
		i64 u0x353590da528c9d22, ; from name: System.ComponentModel.Annotations
		i64 u0xbf7d944f85fcd72c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-System.ComponentModel.Annotations.dll.so
		ptr null; void* handle
	}, ; 121
	%struct.DSOCacheEntry {
		i64 u0x355b66670e6bf2e4, ; from name: libaot-System.Collections.Specialized.dll.so
		i64 u0x355b66670e6bf2e4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 122
	%struct.DSOCacheEntry {
		i64 u0x359895a3c1bd5685, ; from name: libaot-Mono.Android.dll.so
		i64 u0x359895a3c1bd5685, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 123
	%struct.DSOCacheEntry {
		i64 u0x35b53eb45b4382aa, ; from name: aot-System.ObjectModel
		i64 u0x914167d87d2ee1b1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 124
	%struct.DSOCacheEntry {
		i64 u0x361b91086beb2292, ; from name: Xamarin.AndroidX.DrawerLayout.dll.so
		i64 u0x4bea014989424a56, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 125
	%struct.DSOCacheEntry {
		i64 u0x371d40ce3e377b20, ; from name: libaot-Xamarin.AndroidX.Fragment
		i64 u0x8ab6d3431da5497e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 126
	%struct.DSOCacheEntry {
		i64 u0x37352c004dac7330, ; from name: aot-Avalonia.Base
		i64 u0x7f962a4ef6dfe3fc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Avalonia.Base.dll.so
		ptr null; void* handle
	}, ; 127
	%struct.DSOCacheEntry {
		i64 u0x3888ef1b66745e12, ; from name: aot-System.so
		i64 u0x7b91ac8ddc528deb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 128
	%struct.DSOCacheEntry {
		i64 u0x38a82198a4cd2a73, ; from name: libaot-System.ComponentModel.dll.so
		i64 u0x38a82198a4cd2a73, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 129
	%struct.DSOCacheEntry {
		i64 u0x38e4553d8764fa45, ; from name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		i64 u0x38e4553d8764fa45, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 130
	%struct.DSOCacheEntry {
		i64 u0x3946fbf7818b0a69, ; from name: libaot-Avalonia.Vulkan.so
		i64 u0xa7f15d3a1f546d9b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Avalonia.Vulkan.dll.so
		ptr null; void* handle
	}, ; 131
	%struct.DSOCacheEntry {
		i64 u0x3958023028090c19, ; from name: Avalonia.Android.so
		i64 u0x590856c0dd3ba8e5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Avalonia.Android.dll.so
		ptr null; void* handle
	}, ; 132
	%struct.DSOCacheEntry {
		i64 u0x39724e27f46db55d, ; from name: libaot-Mono.Android.Runtime
		i64 u0x156ae2b2e8a39884, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 133
	%struct.DSOCacheEntry {
		i64 u0x39eaef171e11f70c, ; from name: aot-Avalonia.Remote.Protocol.so
		i64 u0x5243c77c100497fa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Avalonia.Remote.Protocol.dll.so
		ptr null; void* handle
	}, ; 134
	%struct.DSOCacheEntry {
		i64 u0x3a427a5d01338ac7, ; from name: aot-System.Net.Primitives
		i64 u0xaac4801194f87f4f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 135
	%struct.DSOCacheEntry {
		i64 u0x3a884f7ec156a095, ; from name: libaot-System.Memory
		i64 u0xad582851e7d05243, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 136
	%struct.DSOCacheEntry {
		i64 u0x3b7ab39715dd2d17, ; from name: Avalonia.dll.so
		i64 u0x94fe7e3e9bc50f2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Avalonia.dll.so
		ptr null; void* handle
	}, ; 137
	%struct.DSOCacheEntry {
		i64 u0x3bd583f7f0cda846, ; from name: aot-Avalonia.Controls
		i64 u0xf02626d2f9400114, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Avalonia.Controls.dll.so
		ptr null; void* handle
	}, ; 138
	%struct.DSOCacheEntry {
		i64 u0x3bff39ec83492179, ; from name: aot-System.Net.Primitives.so
		i64 u0xaac4801194f87f4f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 139
	%struct.DSOCacheEntry {
		i64 u0x3c7c495f58ac5ee9, ; from name: Xamarin.Kotlin.StdLib
		i64 u0x0c644d6a2b020c43, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 140
	%struct.DSOCacheEntry {
		i64 u0x3cb282562b838c95, ; from name: libaot-SkiaSharp.dll.so
		i64 u0x3cb282562b838c95, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-SkiaSharp.dll.so
		ptr null; void* handle
	}, ; 141
	%struct.DSOCacheEntry {
		i64 u0x3d109711a2d4ada8, ; from name: System.Net.Primitives.dll.so
		i64 u0xaac4801194f87f4f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 142
	%struct.DSOCacheEntry {
		i64 u0x3d8ae075ff99d11a, ; from name: aot-Yrm100.Protocol.dll.so
		i64 u0x79f30a8f30bc39e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Yrm100.Protocol.dll.so
		ptr null; void* handle
	}, ; 143
	%struct.DSOCacheEntry {
		i64 u0x3e13ed2e5bfc76a1, ; from name: aot-System.Private.Xml.so
		i64 u0x52bbd048717682d4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 144
	%struct.DSOCacheEntry {
		i64 u0x3fb0c88b4714166e, ; from name: aot-Avalonia.Android
		i64 u0x590856c0dd3ba8e5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Avalonia.Android.dll.so
		ptr null; void* handle
	}, ; 145
	%struct.DSOCacheEntry {
		i64 u0x41342781d40c38c6, ; from name: aot-System.Text.RegularExpressions
		i64 u0x7c2c39dae387b52d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 146
	%struct.DSOCacheEntry {
		i64 u0x41d4d75fcb324e8f, ; from name: Avalonia.Dialogs.so
		i64 u0x0e88e656cbbcbbc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Avalonia.Dialogs.dll.so
		ptr null; void* handle
	}, ; 147
	%struct.DSOCacheEntry {
		i64 u0x428c198084da5ebb, ; from name: libaot-System.ComponentModel.Annotations.so
		i64 u0xbf7d944f85fcd72c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-System.ComponentModel.Annotations.dll.so
		ptr null; void* handle
	}, ; 148
	%struct.DSOCacheEntry {
		i64 u0x42c7eb0880ff24a4, ; from name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		i64 u0x42c7eb0880ff24a4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 149
	%struct.DSOCacheEntry {
		i64 u0x43198e1a840d8a61, ; from name: aot-System.ComponentModel.Annotations.dll.so
		i64 u0xbf7d944f85fcd72c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-System.ComponentModel.Annotations.dll.so
		ptr null; void* handle
	}, ; 150
	%struct.DSOCacheEntry {
		i64 u0x43878f709b5ae552, ; from name: aot-Xamarin.AndroidX.Loader
		i64 u0x74b0aefe8f467d50, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 151
	%struct.DSOCacheEntry {
		i64 u0x44b4c8e72786eb98, ; from name: libaot-System.Private.Uri.so
		i64 u0xe57af9ab00f5c61d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 152
	%struct.DSOCacheEntry {
		i64 u0x458a25734d977509, ; from name: aot-Xamarin.AndroidX.SavedState.dll.so
		i64 u0x039588659cdd2f6a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.SavedState.dll.so
		ptr null; void* handle
	}, ; 153
	%struct.DSOCacheEntry {
		i64 u0x45c40276a42e283e, ; from name: System.Diagnostics.TraceSource
		i64 u0x2119cc81025daa05, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle
	}, ; 154
	%struct.DSOCacheEntry {
		i64 u0x460a478ff8b73c13, ; from name: Avalonia.so
		i64 u0x94fe7e3e9bc50f2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Avalonia.dll.so
		ptr null; void* handle
	}, ; 155
	%struct.DSOCacheEntry {
		i64 u0x4610877cf9ab8b85, ; from name: aot-System.Memory.dll.so
		i64 u0xad582851e7d05243, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 156
	%struct.DSOCacheEntry {
		i64 u0x46a6dbe69fa02451, ; from name: aot-Avalonia.Skia.so
		i64 u0xce3991481c3a2f14, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Avalonia.Skia.dll.so
		ptr null; void* handle
	}, ; 157
	%struct.DSOCacheEntry {
		i64 u0x46fe6fb82f79008c, ; from name: libaot-Java.Interop.so
		i64 u0x6ce045494a545eab, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 158
	%struct.DSOCacheEntry {
		i64 u0x473ce30f3ccafc7d, ; from name: aot-Avalonia.Skia
		i64 u0xce3991481c3a2f14, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Avalonia.Skia.dll.so
		ptr null; void* handle
	}, ; 159
	%struct.DSOCacheEntry {
		i64 u0x480561f32abe06f9, ; from name: libaot-Avalonia.Base.so
		i64 u0x7f962a4ef6dfe3fc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Avalonia.Base.dll.so
		ptr null; void* handle
	}, ; 160
	%struct.DSOCacheEntry {
		i64 u0x480ae1b0fafcfa88, ; from name: aot-System.Collections.NonGeneric.so
		i64 u0x6fd15fb6a42c9afc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 161
	%struct.DSOCacheEntry {
		i64 u0x48468d64edfccee1, ; from name: netstandard.so
		i64 u0xb6ab21527197f7f1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle
	}, ; 162
	%struct.DSOCacheEntry {
		i64 u0x484b4d9129a63928, ; from name: aot-Avalonia.Dialogs.so
		i64 u0x0e88e656cbbcbbc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Avalonia.Dialogs.dll.so
		ptr null; void* handle
	}, ; 163
	%struct.DSOCacheEntry {
		i64 u0x49c2d5c15f8f2efa, ; from name: aot-MicroCom.Runtime.so
		i64 u0x6114909d114168f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-MicroCom.Runtime.dll.so
		ptr null; void* handle
	}, ; 164
	%struct.DSOCacheEntry {
		i64 u0x49e952f19a4e2022, ; from name: System.ObjectModel
		i64 u0x914167d87d2ee1b1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 165
	%struct.DSOCacheEntry {
		i64 u0x4bea014989424a56, ; from name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		i64 u0x4bea014989424a56, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 166
	%struct.DSOCacheEntry {
		i64 u0x4beb4f32e5e8b27b, ; from name: aot-Xamarin.AndroidX.AppCompat.so
		i64 u0x42c7eb0880ff24a4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 167
	%struct.DSOCacheEntry {
		i64 u0x4c4f412062b8bb3e, ; from name: libaot-Avalonia.DesignerSupport
		i64 u0xfc800994bb34a441, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Avalonia.DesignerSupport.dll.so
		ptr null; void* handle
	}, ; 168
	%struct.DSOCacheEntry {
		i64 u0x4c5401149da6445e, ; from name: libaot-System.Net.Sockets.dll.so
		i64 u0x4c5401149da6445e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle
	}, ; 169
	%struct.DSOCacheEntry {
		i64 u0x4c99806689e74f14, ; from name: libaot-Xamarin.Kotlin.StdLib
		i64 u0x0c644d6a2b020c43, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 170
	%struct.DSOCacheEntry {
		i64 u0x4ca7077b553ba065, ; from name: Avalonia.Controls
		i64 u0xf02626d2f9400114, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Avalonia.Controls.dll.so
		ptr null; void* handle
	}, ; 171
	%struct.DSOCacheEntry {
		i64 u0x4cfc35da95507261, ; from name: Xamarin.AndroidX.Fragment.so
		i64 u0x8ab6d3431da5497e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 172
	%struct.DSOCacheEntry {
		i64 u0x4d12310dad3f4532, ; from name: aot-System.Linq.Expressions.so
		i64 u0xda1d7acd827eb320, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 173
	%struct.DSOCacheEntry {
		i64 u0x4d3bf30c9f0aa921, ; from name: Avalonia.DesignerSupport.dll.so
		i64 u0xfc800994bb34a441, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Avalonia.DesignerSupport.dll.so
		ptr null; void* handle
	}, ; 174
	%struct.DSOCacheEntry {
		i64 u0x4d55a010ffc4faff, ; from name: System.Private.Xml
		i64 u0x52bbd048717682d4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 175
	%struct.DSOCacheEntry {
		i64 u0x4e32f00cb0937401, ; from name: Mono.Android.Runtime
		i64 u0x156ae2b2e8a39884, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 176
	%struct.DSOCacheEntry {
		i64 u0x4e5b84a95fc00071, ; from name: libaot-Yrm100.Protocol.so
		i64 u0x79f30a8f30bc39e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Yrm100.Protocol.dll.so
		ptr null; void* handle
	}, ; 177
	%struct.DSOCacheEntry {
		i64 u0x4ebc3efb9cd1b61e, ; from name: aot-SkiaSharp.dll.so
		i64 u0x3cb282562b838c95, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-SkiaSharp.dll.so
		ptr null; void* handle
	}, ; 178
	%struct.DSOCacheEntry {
		i64 u0x4fb15a4a8810e42f, ; from name: aot-System.Memory.so
		i64 u0xad582851e7d05243, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 179
	%struct.DSOCacheEntry {
		i64 u0x505aa28bc8344a29, ; from name: libaot-Avalonia.Markup.so
		i64 u0xcf830f414728cec6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Avalonia.Markup.dll.so
		ptr null; void* handle
	}, ; 180
	%struct.DSOCacheEntry {
		i64 u0x50ed43b4a9b11edd, ; from name: MicroCom.Runtime
		i64 u0x6114909d114168f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-MicroCom.Runtime.dll.so
		ptr null; void* handle
	}, ; 181
	%struct.DSOCacheEntry {
		i64 u0x50f8d125d8dd00cf, ; from name: libaot-System.Console
		i64 u0xc2da5dca6ccd8b0a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 182
	%struct.DSOCacheEntry {
		i64 u0x5175c7f043f8e788, ; from name: Xamarin.AndroidX.Loader.so
		i64 u0x74b0aefe8f467d50, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 183
	%struct.DSOCacheEntry {
		i64 u0x51c50b4f4c87593e, ; from name: System.dll.so
		i64 u0x7b91ac8ddc528deb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 184
	%struct.DSOCacheEntry {
		i64 u0x51d764b5025be70f, ; from name: libaot-Avalonia.Vulkan
		i64 u0xa7f15d3a1f546d9b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Avalonia.Vulkan.dll.so
		ptr null; void* handle
	}, ; 185
	%struct.DSOCacheEntry {
		i64 u0x52429a82a66c40af, ; from name: aot-System.Collections.Specialized.dll.so
		i64 u0x355b66670e6bf2e4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 186
	%struct.DSOCacheEntry {
		i64 u0x5243c77c100497fa, ; from name: libaot-Avalonia.Remote.Protocol.dll.so
		i64 u0x5243c77c100497fa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Avalonia.Remote.Protocol.dll.so
		ptr null; void* handle
	}, ; 187
	%struct.DSOCacheEntry {
		i64 u0x5281ae8971f058b6, ; from name: aot-Avalonia.Metal
		i64 u0x52c039815d238d2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Avalonia.Metal.dll.so
		ptr null; void* handle
	}, ; 188
	%struct.DSOCacheEntry {
		i64 u0x5298030147080bcb, ; from name: Xamarin.AndroidX.Activity.so
		i64 u0x8a05820e9e77c0c3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 189
	%struct.DSOCacheEntry {
		i64 u0x529ffe06f39ab8db, ; from name: Xamarin.AndroidX.Core
		i64 u0x28a319e875b39488, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 190
	%struct.DSOCacheEntry {
		i64 u0x52bbd048717682d4, ; from name: libaot-System.Private.Xml.dll.so
		i64 u0x52bbd048717682d4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 191
	%struct.DSOCacheEntry {
		i64 u0x52c039815d238d2a, ; from name: libaot-Avalonia.Metal.dll.so
		i64 u0x52c039815d238d2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Avalonia.Metal.dll.so
		ptr null; void* handle
	}, ; 192
	%struct.DSOCacheEntry {
		i64 u0x52fead1d33d2d460, ; from name: libaot-Xamarin.AndroidX.SavedState.so
		i64 u0x039588659cdd2f6a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.SavedState.dll.so
		ptr null; void* handle
	}, ; 193
	%struct.DSOCacheEntry {
		i64 u0x5328f4443e4bcd75, ; from name: aot-Avalonia.MicroCom
		i64 u0xd7b79701607da010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Avalonia.MicroCom.dll.so
		ptr null; void* handle
	}, ; 194
	%struct.DSOCacheEntry {
		i64 u0x5358cf8607ef3839, ; from name: Avalonia.Android.dll.so
		i64 u0x590856c0dd3ba8e5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Avalonia.Android.dll.so
		ptr null; void* handle
	}, ; 195
	%struct.DSOCacheEntry {
		i64 u0x5424938e04124349, ; from name: aot-System.Private.CoreLib
		i64 u0xe1af59ffe15719e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 196
	%struct.DSOCacheEntry {
		i64 u0x5515e5c54e3280ad, ; from name: Avalonia.Markup.dll.so
		i64 u0xcf830f414728cec6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Avalonia.Markup.dll.so
		ptr null; void* handle
	}, ; 197
	%struct.DSOCacheEntry {
		i64 u0x5525381bef4d9b6a, ; from name: aot-System.ComponentModel
		i64 u0x38a82198a4cd2a73, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 198
	%struct.DSOCacheEntry {
		i64 u0x553b3f85d61de6a2, ; from name: aot-Xamarin.AndroidX.Activity
		i64 u0x8a05820e9e77c0c3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 199
	%struct.DSOCacheEntry {
		i64 u0x5588627c9a108ec9, ; from name: System.Collections.Specialized
		i64 u0x355b66670e6bf2e4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 200
	%struct.DSOCacheEntry {
		i64 u0x5594b077481089e1, ; from name: aot-Xamarin.Kotlin.StdLib.dll.so
		i64 u0x0c644d6a2b020c43, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 201
	%struct.DSOCacheEntry {
		i64 u0x562760c15bec01ba, ; from name: System.Linq.Expressions.so
		i64 u0xda1d7acd827eb320, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 202
	%struct.DSOCacheEntry {
		i64 u0x5633aba1fd262138, ; from name: System.ObjectModel.so
		i64 u0x914167d87d2ee1b1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 203
	%struct.DSOCacheEntry {
		i64 u0x56dfb6d308b9e745, ; from name: aot-System.Collections.Concurrent
		i64 u0x65cd21401fecc3dc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 204
	%struct.DSOCacheEntry {
		i64 u0x56e8575851fa23df, ; from name: System.Diagnostics.DiagnosticSource.dll.so
		i64 u0x77156c94b5eff927, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 205
	%struct.DSOCacheEntry {
		i64 u0x5715a67f1b3b8990, ; from name: aot-Avalonia.Themes.Fluent.so
		i64 u0x2151e7b9f3592593, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Avalonia.Themes.Fluent.dll.so
		ptr null; void* handle
	}, ; 206
	%struct.DSOCacheEntry {
		i64 u0x5715f89db0aca1ea, ; from name: libaot-System.Runtime.InteropServices.so
		i64 u0x5ae6db1ddadc230b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 207
	%struct.DSOCacheEntry {
		i64 u0x571c5cfbec5ae8e2, ; from name: System.Private.Uri
		i64 u0xe57af9ab00f5c61d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 208
	%struct.DSOCacheEntry {
		i64 u0x573f908812386eb5, ; from name: aot-System.Diagnostics.TraceSource.dll.so
		i64 u0x2119cc81025daa05, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle
	}, ; 209
	%struct.DSOCacheEntry {
		i64 u0x5777ddba4d29c37e, ; from name: Xamarin.AndroidX.Fragment.dll.so
		i64 u0x8ab6d3431da5497e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 210
	%struct.DSOCacheEntry {
		i64 u0x579f7955a9783e96, ; from name: System.Linq.so
		i64 u0x2fb7a3952b307fae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 211
	%struct.DSOCacheEntry {
		i64 u0x57a4ed98ea0b9a8f, ; from name: libaot-Avalonia.Controls
		i64 u0xf02626d2f9400114, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Avalonia.Controls.dll.so
		ptr null; void* handle
	}, ; 212
	%struct.DSOCacheEntry {
		i64 u0x57c542c14049b66d, ; from name: System.Diagnostics.DiagnosticSource
		i64 u0x77156c94b5eff927, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 213
	%struct.DSOCacheEntry {
		i64 u0x58563b2a09321748, ; from name: aot-Avalonia.Metal.so
		i64 u0x52c039815d238d2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Avalonia.Metal.dll.so
		ptr null; void* handle
	}, ; 214
	%struct.DSOCacheEntry {
		i64 u0x58b50b261727dd95, ; from name: libaot-Avalonia.Dialogs.so
		i64 u0x0e88e656cbbcbbc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Avalonia.Dialogs.dll.so
		ptr null; void* handle
	}, ; 215
	%struct.DSOCacheEntry {
		i64 u0x590856c0dd3ba8e5, ; from name: libaot-Avalonia.Android.dll.so
		i64 u0x590856c0dd3ba8e5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Avalonia.Android.dll.so
		ptr null; void* handle
	}, ; 216
	%struct.DSOCacheEntry {
		i64 u0x5a196e3fd4834caf, ; from name: aot-Xamarin.AndroidX.Core
		i64 u0x28a319e875b39488, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 217
	%struct.DSOCacheEntry {
		i64 u0x5ae6db1ddadc230b, ; from name: libaot-System.Runtime.InteropServices.dll.so
		i64 u0x5ae6db1ddadc230b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 218
	%struct.DSOCacheEntry {
		i64 u0x5ae9cd33b15841bf, ; from name: System.ComponentModel
		i64 u0x38a82198a4cd2a73, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 219
	%struct.DSOCacheEntry {
		i64 u0x5af23c65728efd35, ; from name: System.ComponentModel.so
		i64 u0x38a82198a4cd2a73, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 220
	%struct.DSOCacheEntry {
		i64 u0x5afe641f0eb3380f, ; from name: libaot-Avalonia.Markup.Xaml.dll.so
		i64 u0x5afe641f0eb3380f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Avalonia.Markup.Xaml.dll.so
		ptr null; void* handle
	}, ; 221
	%struct.DSOCacheEntry {
		i64 u0x5b4292e687b69639, ; from name: aot-Xamarin.AndroidX.AppCompat.dll.so
		i64 u0x42c7eb0880ff24a4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 222
	%struct.DSOCacheEntry {
		i64 u0x5bacada79b845b29, ; from name: aot-System.ComponentModel.TypeConverter.dll.so
		i64 u0xcb7e41356728fd07, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 223
	%struct.DSOCacheEntry {
		i64 u0x5bf0c23bdb13c0d6, ; from name: libaot-System.Security.Cryptography.so
		i64 u0xd0e82017367ac826, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 224
	%struct.DSOCacheEntry {
		i64 u0x5c09c211c5359c6b, ; from name: aot-System.Net.Sockets.dll.so
		i64 u0x4c5401149da6445e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle
	}, ; 225
	%struct.DSOCacheEntry {
		i64 u0x5ce13c3c91c923d0, ; from name: libaot-SkiaSharp.so
		i64 u0x3cb282562b838c95, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-SkiaSharp.dll.so
		ptr null; void* handle
	}, ; 226
	%struct.DSOCacheEntry {
		i64 u0x5cf2c11c2ae1eb7d, ; from name: System.Net.Sockets.so
		i64 u0x4c5401149da6445e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle
	}, ; 227
	%struct.DSOCacheEntry {
		i64 u0x5e09e43f438b0192, ; from name: libaot-Avalonia.Android
		i64 u0x590856c0dd3ba8e5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Avalonia.Android.dll.so
		ptr null; void* handle
	}, ; 228
	%struct.DSOCacheEntry {
		i64 u0x5e37149bf674aa76, ; from name: aot-Avalonia.Remote.Protocol
		i64 u0x5243c77c100497fa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Avalonia.Remote.Protocol.dll.so
		ptr null; void* handle
	}, ; 229
	%struct.DSOCacheEntry {
		i64 u0x5eb8046dd40e9ac3, ; from name: System.ComponentModel.Primitives
		i64 u0xccde8a4563eee10b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 230
	%struct.DSOCacheEntry {
		i64 u0x5f435aa7f5fde870, ; from name: libaot-System.Threading.dll.so
		i64 u0x5f435aa7f5fde870, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 231
	%struct.DSOCacheEntry {
		i64 u0x5fb2a0ec0d6c19ef, ; from name: aot-Avalonia
		i64 u0x94fe7e3e9bc50f2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Avalonia.dll.so
		ptr null; void* handle
	}, ; 232
	%struct.DSOCacheEntry {
		i64 u0x5ff8a747b135ea37, ; from name: libaot-System.ComponentModel
		i64 u0x38a82198a4cd2a73, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 233
	%struct.DSOCacheEntry {
		i64 u0x603382e24604d9de, ; from name: aot-Xamarin.AndroidX.Lifecycle.ViewModel.so
		i64 u0x8a1d474b582068bb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		ptr null; void* handle
	}, ; 234
	%struct.DSOCacheEntry {
		i64 u0x60f62d786afcf130, ; from name: System.Memory
		i64 u0xad582851e7d05243, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 235
	%struct.DSOCacheEntry {
		i64 u0x6114909d114168f8, ; from name: libaot-MicroCom.Runtime.dll.so
		i64 u0x6114909d114168f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-MicroCom.Runtime.dll.so
		ptr null; void* handle
	}, ; 236
	%struct.DSOCacheEntry {
		i64 u0x61aea01d668e24bc, ; from name: libaot-Avalonia.Dialogs
		i64 u0x0e88e656cbbcbbc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Avalonia.Dialogs.dll.so
		ptr null; void* handle
	}, ; 237
	%struct.DSOCacheEntry {
		i64 u0x622eef6f9e59068d, ; from name: System.Private.CoreLib
		i64 u0xe1af59ffe15719e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 238
	%struct.DSOCacheEntry {
		i64 u0x6250af18a9734a88, ; from name: aot-System.Console.so
		i64 u0xc2da5dca6ccd8b0a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 239
	%struct.DSOCacheEntry {
		i64 u0x6260add1b87d7669, ; from name: netstandard.dll.so
		i64 u0xb6ab21527197f7f1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle
	}, ; 240
	%struct.DSOCacheEntry {
		i64 u0x62f0a7158b84723e, ; from name: aot-Xamarin.AndroidX.SavedState
		i64 u0x039588659cdd2f6a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.SavedState.dll.so
		ptr null; void* handle
	}, ; 241
	%struct.DSOCacheEntry {
		i64 u0x64124dac20f9924e, ; from name: libaot-System.Security.Cryptography
		i64 u0xd0e82017367ac826, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 242
	%struct.DSOCacheEntry {
		i64 u0x641c60df5c993ae3, ; from name: Avalonia.DesignerSupport
		i64 u0xfc800994bb34a441, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Avalonia.DesignerSupport.dll.so
		ptr null; void* handle
	}, ; 243
	%struct.DSOCacheEntry {
		i64 u0x64be874ebbce6bd2, ; from name: aot-System.Private.CoreLib.so
		i64 u0xe1af59ffe15719e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 244
	%struct.DSOCacheEntry {
		i64 u0x65037a642d353597, ; from name: aot-System.dll.so
		i64 u0x7b91ac8ddc528deb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 245
	%struct.DSOCacheEntry {
		i64 u0x654a1612f95f8409, ; from name: aot-_Microsoft.Android.Resource.Designer.dll.so
		i64 u0x9cbca1c74026e295, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 246
	%struct.DSOCacheEntry {
		i64 u0x65cd21401fecc3dc, ; from name: libaot-System.Collections.Concurrent.dll.so
		i64 u0x65cd21401fecc3dc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 247
	%struct.DSOCacheEntry {
		i64 u0x66b951a38d5be82b, ; from name: YRM100.Reader.so
		i64 u0x327465e605eba9a7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-YRM100.Reader.dll.so
		ptr null; void* handle
	}, ; 248
	%struct.DSOCacheEntry {
		i64 u0x67afd0bf45d8aeec, ; from name: libaot-System.Threading
		i64 u0x5f435aa7f5fde870, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 249
	%struct.DSOCacheEntry {
		i64 u0x67ef4c1a9d5f7c55, ; from name: libaot-System.Private.Xml.so
		i64 u0x52bbd048717682d4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 250
	%struct.DSOCacheEntry {
		i64 u0x6826feb0fb5a8799, ; from name: System.Text.RegularExpressions.dll.so
		i64 u0x7c2c39dae387b52d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 251
	%struct.DSOCacheEntry {
		i64 u0x68f3b8b1aeb8e58f, ; from name: libaot-System.so
		i64 u0x7b91ac8ddc528deb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 252
	%struct.DSOCacheEntry {
		i64 u0x6905afa0f27e3ea9, ; from name: aot-Avalonia.Android.dll.so
		i64 u0x590856c0dd3ba8e5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Avalonia.Android.dll.so
		ptr null; void* handle
	}, ; 253
	%struct.DSOCacheEntry {
		i64 u0x69301321d9e020fe, ; from name: aot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		i64 u0x8a1d474b582068bb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		ptr null; void* handle
	}, ; 254
	%struct.DSOCacheEntry {
		i64 u0x69f8bcaead2613c0, ; from name: System.Runtime.InteropServices.so
		i64 u0x5ae6db1ddadc230b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 255
	%struct.DSOCacheEntry {
		i64 u0x6a039c1f557cc435, ; from name: System.Collections.so
		i64 u0xb3f9fc836ae7ebb5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 256
	%struct.DSOCacheEntry {
		i64 u0x6b191693b6226982, ; from name: Mono.Android.so
		i64 u0x359895a3c1bd5685, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 257
	%struct.DSOCacheEntry {
		i64 u0x6c3e41346855f8e3, ; from name: libaot-System.ObjectModel.so
		i64 u0x914167d87d2ee1b1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 258
	%struct.DSOCacheEntry {
		i64 u0x6ca6ae298583cf7b, ; from name: libaot-Avalonia
		i64 u0x94fe7e3e9bc50f2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Avalonia.dll.so
		ptr null; void* handle
	}, ; 259
	%struct.DSOCacheEntry {
		i64 u0x6ce045494a545eab, ; from name: libaot-Java.Interop.dll.so
		i64 u0x6ce045494a545eab, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 260
	%struct.DSOCacheEntry {
		i64 u0x6e25484b7e4208bb, ; from name: Avalonia.Base.dll.so
		i64 u0x7f962a4ef6dfe3fc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Avalonia.Base.dll.so
		ptr null; void* handle
	}, ; 261
	%struct.DSOCacheEntry {
		i64 u0x6e8d35737ec9d942, ; from name: System.Memory.so
		i64 u0xad582851e7d05243, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 262
	%struct.DSOCacheEntry {
		i64 u0x6ef00c5a40a84578, ; from name: libaot-System.Diagnostics.DiagnosticSource.so
		i64 u0x77156c94b5eff927, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 263
	%struct.DSOCacheEntry {
		i64 u0x6f7d52bca595ee57, ; from name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.so
		i64 u0x38e4553d8764fa45, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 264
	%struct.DSOCacheEntry {
		i64 u0x6fd15fb6a42c9afc, ; from name: libaot-System.Collections.NonGeneric.dll.so
		i64 u0x6fd15fb6a42c9afc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 265
	%struct.DSOCacheEntry {
		i64 u0x70680ffd8b50cafe, ; from name: libaot-System.Diagnostics.TraceSource.so
		i64 u0x2119cc81025daa05, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle
	}, ; 266
	%struct.DSOCacheEntry {
		i64 u0x70a7344e5dcbb2a7, ; from name: aot-Avalonia.Vulkan.dll.so
		i64 u0xa7f15d3a1f546d9b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Avalonia.Vulkan.dll.so
		ptr null; void* handle
	}, ; 267
	%struct.DSOCacheEntry {
		i64 u0x71119f59fccb3f0b, ; from name: aot-System.ComponentModel.Primitives.dll.so
		i64 u0xccde8a4563eee10b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 268
	%struct.DSOCacheEntry {
		i64 u0x71c78e8bfefd0b77, ; from name: libaot-Avalonia.Android.so
		i64 u0x590856c0dd3ba8e5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Avalonia.Android.dll.so
		ptr null; void* handle
	}, ; 269
	%struct.DSOCacheEntry {
		i64 u0x72390be79b9026fa, ; from name: libaot-System.Console.so
		i64 u0xc2da5dca6ccd8b0a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 270
	%struct.DSOCacheEntry {
		i64 u0x7247abfd5606ac26, ; from name: libaot-System.Diagnostics.DiagnosticSource
		i64 u0x77156c94b5eff927, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 271
	%struct.DSOCacheEntry {
		i64 u0x72de88ad1e1d7001, ; from name: System.so
		i64 u0x7b91ac8ddc528deb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 272
	%struct.DSOCacheEntry {
		i64 u0x73046072daa4b321, ; from name: aot-System.Net.NameResolution
		i64 u0x7f280e9be5453eba, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle
	}, ; 273
	%struct.DSOCacheEntry {
		i64 u0x7393060acfd95c29, ; from name: aot-Xamarin.AndroidX.Activity.so
		i64 u0x8a05820e9e77c0c3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 274
	%struct.DSOCacheEntry {
		i64 u0x74b0aefe8f467d50, ; from name: libaot-Xamarin.AndroidX.Loader.dll.so
		i64 u0x74b0aefe8f467d50, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 275
	%struct.DSOCacheEntry {
		i64 u0x74fa322550202c16, ; from name: aot-Xamarin.AndroidX.Lifecycle.Common.dll.so
		i64 u0xc25aa808516eb94a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.dll.so
		ptr null; void* handle
	}, ; 276
	%struct.DSOCacheEntry {
		i64 u0x7526b6f2e6ab9467, ; from name: aot-Avalonia.OpenGL.dll.so
		i64 u0x9a9f0f27449e14da, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Avalonia.OpenGL.dll.so
		ptr null; void* handle
	}, ; 277
	%struct.DSOCacheEntry {
		i64 u0x7648004a8fe5501d, ; from name: System.Diagnostics.DiagnosticSource.so
		i64 u0x77156c94b5eff927, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 278
	%struct.DSOCacheEntry {
		i64 u0x764e09afb7f22c1f, ; from name: libaot-System.Private.CoreLib
		i64 u0xe1af59ffe15719e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 279
	%struct.DSOCacheEntry {
		i64 u0x77156c94b5eff927, ; from name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		i64 u0x77156c94b5eff927, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 280
	%struct.DSOCacheEntry {
		i64 u0x77d6cb511ba0e5d1, ; from name: aot-Avalonia.Skia.dll.so
		i64 u0xce3991481c3a2f14, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Avalonia.Skia.dll.so
		ptr null; void* handle
	}, ; 281
	%struct.DSOCacheEntry {
		i64 u0x78979a5b2d9eda26, ; from name: Avalonia.OpenGL
		i64 u0x9a9f0f27449e14da, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Avalonia.OpenGL.dll.so
		ptr null; void* handle
	}, ; 282
	%struct.DSOCacheEntry {
		i64 u0x78ed4ab8f9d800a1, ; from name: Xamarin.AndroidX.Lifecycle.ViewModel
		i64 u0x8a1d474b582068bb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		ptr null; void* handle
	}, ; 283
	%struct.DSOCacheEntry {
		i64 u0x78f5da5f3dbb8df3, ; from name: libaot-System.ComponentModel.so
		i64 u0x38a82198a4cd2a73, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 284
	%struct.DSOCacheEntry {
		i64 u0x79a8fe47cb19c9aa, ; from name: aot-Avalonia.OpenGL.so
		i64 u0x9a9f0f27449e14da, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Avalonia.OpenGL.dll.so
		ptr null; void* handle
	}, ; 285
	%struct.DSOCacheEntry {
		i64 u0x79f30a8f30bc39e2, ; from name: libaot-Yrm100.Protocol.dll.so
		i64 u0x79f30a8f30bc39e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Yrm100.Protocol.dll.so
		ptr null; void* handle
	}, ; 286
	%struct.DSOCacheEntry {
		i64 u0x7a2788d31205c975, ; from name: Avalonia.Markup.Xaml.dll.so
		i64 u0x5afe641f0eb3380f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Avalonia.Markup.Xaml.dll.so
		ptr null; void* handle
	}, ; 287
	%struct.DSOCacheEntry {
		i64 u0x7a567208cef34cb5, ; from name: Avalonia.Remote.Protocol.dll.so
		i64 u0x5243c77c100497fa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Avalonia.Remote.Protocol.dll.so
		ptr null; void* handle
	}, ; 288
	%struct.DSOCacheEntry {
		i64 u0x7aa7acc28fe6692d, ; from name: aot-System.ComponentModel.TypeConverter.so
		i64 u0xcb7e41356728fd07, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 289
	%struct.DSOCacheEntry {
		i64 u0x7abe2531e9b9835b, ; from name: System.Private.Xml.dll.so
		i64 u0x52bbd048717682d4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 290
	%struct.DSOCacheEntry {
		i64 u0x7adcf889f929072e, ; from name: libaot-Mono.Android.Runtime.so
		i64 u0x156ae2b2e8a39884, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 291
	%struct.DSOCacheEntry {
		i64 u0x7b91ac8ddc528deb, ; from name: libaot-System.dll.so
		i64 u0x7b91ac8ddc528deb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 292
	%struct.DSOCacheEntry {
		i64 u0x7bc1dafa26b25d7d, ; from name: Avalonia.Themes.Fluent.so
		i64 u0x2151e7b9f3592593, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Avalonia.Themes.Fluent.dll.so
		ptr null; void* handle
	}, ; 293
	%struct.DSOCacheEntry {
		i64 u0x7bef86a4335c4870, ; from name: System.ComponentModel.TypeConverter
		i64 u0xcb7e41356728fd07, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 294
	%struct.DSOCacheEntry {
		i64 u0x7c2c39dae387b52d, ; from name: libaot-System.Text.RegularExpressions.dll.so
		i64 u0x7c2c39dae387b52d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 295
	%struct.DSOCacheEntry {
		i64 u0x7d09412e094065be, ; from name: aot-Xamarin.AndroidX.Core.dll.so
		i64 u0x28a319e875b39488, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 296
	%struct.DSOCacheEntry {
		i64 u0x7d1f01eebb7c71c5, ; from name: aot-Avalonia.Base.so
		i64 u0x7f962a4ef6dfe3fc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Avalonia.Base.dll.so
		ptr null; void* handle
	}, ; 297
	%struct.DSOCacheEntry {
		i64 u0x7d3e1ad921799a8b, ; from name: aot-Avalonia.Base.dll.so
		i64 u0x7f962a4ef6dfe3fc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Avalonia.Base.dll.so
		ptr null; void* handle
	}, ; 298
	%struct.DSOCacheEntry {
		i64 u0x7dec6152c2473976, ; from name: libaot-_Microsoft.Android.Resource.Designer.so
		i64 u0x9cbca1c74026e295, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 299
	%struct.DSOCacheEntry {
		i64 u0x7dfc3d6d9d8d7b70, ; from name: System.Collections
		i64 u0xb3f9fc836ae7ebb5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 300
	%struct.DSOCacheEntry {
		i64 u0x7edbb351f3f9be56, ; from name: libaot-System.Private.CoreLib.so
		i64 u0xe1af59ffe15719e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 301
	%struct.DSOCacheEntry {
		i64 u0x7eeb7a5c8f17111a, ; from name: libaot-Avalonia.Themes.Fluent.so
		i64 u0x2151e7b9f3592593, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Avalonia.Themes.Fluent.dll.so
		ptr null; void* handle
	}, ; 302
	%struct.DSOCacheEntry {
		i64 u0x7f280e9be5453eba, ; from name: libaot-System.Net.NameResolution.dll.so
		i64 u0x7f280e9be5453eba, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle
	}, ; 303
	%struct.DSOCacheEntry {
		i64 u0x7f8f286bea7d27c8, ; from name: libaot-System.Collections.Specialized.so
		i64 u0x355b66670e6bf2e4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 304
	%struct.DSOCacheEntry {
		i64 u0x7f962a4ef6dfe3fc, ; from name: libaot-Avalonia.Base.dll.so
		i64 u0x7f962a4ef6dfe3fc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Avalonia.Base.dll.so
		ptr null; void* handle
	}, ; 305
	%struct.DSOCacheEntry {
		i64 u0x7fb3d22a29fb88db, ; from name: _Microsoft.Android.Resource.Designer.dll.so
		i64 u0x9cbca1c74026e295, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 306
	%struct.DSOCacheEntry {
		i64 u0x7feafaeaaa627797, ; from name: libaot-Xamarin.AndroidX.DrawerLayout
		i64 u0x4bea014989424a56, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 307
	%struct.DSOCacheEntry {
		i64 u0x800dd28c71d7ee1d, ; from name: libaot-System.Collections.NonGeneric.so
		i64 u0x6fd15fb6a42c9afc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 308
	%struct.DSOCacheEntry {
		i64 u0x8220c1c2a56b3b46, ; from name: libaot-YRM100.Reader
		i64 u0x327465e605eba9a7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-YRM100.Reader.dll.so
		ptr null; void* handle
	}, ; 309
	%struct.DSOCacheEntry {
		i64 u0x8277f2be6b5ce05f, ; from name: Xamarin.AndroidX.AppCompat
		i64 u0x42c7eb0880ff24a4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 310
	%struct.DSOCacheEntry {
		i64 u0x82a2e2148ec96b41, ; from name: libaot-System.Linq.so
		i64 u0x2fb7a3952b307fae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 311
	%struct.DSOCacheEntry {
		i64 u0x8308a506644563bb, ; from name: Avalonia.Metal
		i64 u0x52c039815d238d2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Avalonia.Metal.dll.so
		ptr null; void* handle
	}, ; 312
	%struct.DSOCacheEntry {
		i64 u0x84a855406853f510, ; from name: aot-System.IO.Compression
		i64 u0x07869dd1c492a791, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 313
	%struct.DSOCacheEntry {
		i64 u0x84e8bced721c84a8, ; from name: aot-Avalonia.Markup.Xaml.dll.so
		i64 u0x5afe641f0eb3380f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Avalonia.Markup.Xaml.dll.so
		ptr null; void* handle
	}, ; 314
	%struct.DSOCacheEntry {
		i64 u0x8532df22d4a7f8dc, ; from name: System.ComponentModel.TypeConverter.dll.so
		i64 u0xcb7e41356728fd07, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 315
	%struct.DSOCacheEntry {
		i64 u0x8584a5172bd7d8bc, ; from name: Xamarin.AndroidX.Lifecycle.LiveData.Core.so
		i64 u0x38e4553d8764fa45, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 316
	%struct.DSOCacheEntry {
		i64 u0x858cd519f13e3ea3, ; from name: aot-System.Security.Cryptography
		i64 u0xd0e82017367ac826, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 317
	%struct.DSOCacheEntry {
		i64 u0x85a5aacd32b8490d, ; from name: libaot-Avalonia.Metal.so
		i64 u0x52c039815d238d2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Avalonia.Metal.dll.so
		ptr null; void* handle
	}, ; 318
	%struct.DSOCacheEntry {
		i64 u0x873a0490d9a4a1f0, ; from name: libaot-Avalonia.Remote.Protocol.so
		i64 u0x5243c77c100497fa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Avalonia.Remote.Protocol.dll.so
		ptr null; void* handle
	}, ; 319
	%struct.DSOCacheEntry {
		i64 u0x87532963d7155867, ; from name: aot-System.Memory
		i64 u0xad582851e7d05243, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 320
	%struct.DSOCacheEntry {
		i64 u0x87e71d68120b9580, ; from name: aot-Java.Interop.dll.so
		i64 u0x6ce045494a545eab, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 321
	%struct.DSOCacheEntry {
		i64 u0x8930322c7bd8f768, ; from name: netstandard
		i64 u0xb6ab21527197f7f1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle
	}, ; 322
	%struct.DSOCacheEntry {
		i64 u0x89c9595aeecca3fc, ; from name: libaot-System.IO.Compression.so
		i64 u0x07869dd1c492a791, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 323
	%struct.DSOCacheEntry {
		i64 u0x8a05820e9e77c0c3, ; from name: libaot-Xamarin.AndroidX.Activity.dll.so
		i64 u0x8a05820e9e77c0c3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 324
	%struct.DSOCacheEntry {
		i64 u0x8a1d474b582068bb, ; from name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		i64 u0x8a1d474b582068bb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		ptr null; void* handle
	}, ; 325
	%struct.DSOCacheEntry {
		i64 u0x8a21b916d9796fa5, ; from name: Avalonia.MicroCom
		i64 u0xd7b79701607da010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Avalonia.MicroCom.dll.so
		ptr null; void* handle
	}, ; 326
	%struct.DSOCacheEntry {
		i64 u0x8ab573a2f264ef6e, ; from name: libaot-Java.Interop
		i64 u0x6ce045494a545eab, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 327
	%struct.DSOCacheEntry {
		i64 u0x8ab6d3431da5497e, ; from name: libaot-Xamarin.AndroidX.Fragment.dll.so
		i64 u0x8ab6d3431da5497e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 328
	%struct.DSOCacheEntry {
		i64 u0x8ad229ea26432ee2, ; from name: Xamarin.AndroidX.Loader
		i64 u0x74b0aefe8f467d50, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 329
	%struct.DSOCacheEntry {
		i64 u0x8b06991f459cf97b, ; from name: System.IO.Compression.so
		i64 u0x07869dd1c492a791, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 330
	%struct.DSOCacheEntry {
		i64 u0x8b4d507f5a0176eb, ; from name: Xamarin.AndroidX.Lifecycle.Common.dll.so
		i64 u0xc25aa808516eb94a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.dll.so
		ptr null; void* handle
	}, ; 331
	%struct.DSOCacheEntry {
		i64 u0x8b6737c4464ef9c9, ; from name: aot-System.Collections.Specialized
		i64 u0x355b66670e6bf2e4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 332
	%struct.DSOCacheEntry {
		i64 u0x8c4bfb5857ce9a32, ; from name: aot-Avalonia.Markup.so
		i64 u0xcf830f414728cec6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Avalonia.Markup.dll.so
		ptr null; void* handle
	}, ; 333
	%struct.DSOCacheEntry {
		i64 u0x8c65c97522650bf3, ; from name: libaot-Avalonia.Skia
		i64 u0xce3991481c3a2f14, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Avalonia.Skia.dll.so
		ptr null; void* handle
	}, ; 334
	%struct.DSOCacheEntry {
		i64 u0x8c8039436d9f3da6, ; from name: aot-Xamarin.AndroidX.Lifecycle.ViewModel
		i64 u0x8a1d474b582068bb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		ptr null; void* handle
	}, ; 335
	%struct.DSOCacheEntry {
		i64 u0x8d7b8ab4b3310ead, ; from name: System.Threading
		i64 u0x5f435aa7f5fde870, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 336
	%struct.DSOCacheEntry {
		i64 u0x8da188285aadfe8e, ; from name: System.Collections.Concurrent
		i64 u0x65cd21401fecc3dc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 337
	%struct.DSOCacheEntry {
		i64 u0x8dfc8e7ddc866e85, ; from name: aot-System.ComponentModel.Annotations
		i64 u0xbf7d944f85fcd72c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-System.ComponentModel.Annotations.dll.so
		ptr null; void* handle
	}, ; 338
	%struct.DSOCacheEntry {
		i64 u0x8e7bcc98607276e4, ; from name: System.Collections.Concurrent.dll.so
		i64 u0x65cd21401fecc3dc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 339
	%struct.DSOCacheEntry {
		i64 u0x8f88a5f7ea54fc02, ; from name: libaot-Avalonia.Skia.so
		i64 u0xce3991481c3a2f14, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Avalonia.Skia.dll.so
		ptr null; void* handle
	}, ; 340
	%struct.DSOCacheEntry {
		i64 u0x8ffee21e4a07ff09, ; from name: Avalonia.Base.so
		i64 u0x7f962a4ef6dfe3fc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Avalonia.Base.dll.so
		ptr null; void* handle
	}, ; 341
	%struct.DSOCacheEntry {
		i64 u0x900c844fa701040b, ; from name: aot-System.Net.NameResolution.dll.so
		i64 u0x7f280e9be5453eba, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle
	}, ; 342
	%struct.DSOCacheEntry {
		i64 u0x903101b46fb73a04, ; from name: _Microsoft.Android.Resource.Designer
		i64 u0x9cbca1c74026e295, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 343
	%struct.DSOCacheEntry {
		i64 u0x914167d87d2ee1b1, ; from name: libaot-System.ObjectModel.dll.so
		i64 u0x914167d87d2ee1b1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 344
	%struct.DSOCacheEntry {
		i64 u0x933c13d587fd4708, ; from name: aot-System.Collections.Specialized.so
		i64 u0x355b66670e6bf2e4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 345
	%struct.DSOCacheEntry {
		i64 u0x9345748e3d9d87ff, ; from name: libaot-System.Linq.Expressions.so
		i64 u0xda1d7acd827eb320, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 346
	%struct.DSOCacheEntry {
		i64 u0x93b2bf77d26dbbcf, ; from name: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		i64 u0x38e4553d8764fa45, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 347
	%struct.DSOCacheEntry {
		i64 u0x93e4c54304a2e819, ; from name: libaot-System.Collections.Concurrent.so
		i64 u0x65cd21401fecc3dc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 348
	%struct.DSOCacheEntry {
		i64 u0x945436fe733eac24, ; from name: libaot-System.Net.Primitives
		i64 u0xaac4801194f87f4f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 349
	%struct.DSOCacheEntry {
		i64 u0x94a26486dc3dc992, ; from name: aot-HarfBuzzSharp.so
		i64 u0x34fa94470888dd75, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-HarfBuzzSharp.dll.so
		ptr null; void* handle
	}, ; 350
	%struct.DSOCacheEntry {
		i64 u0x94c36bd34f077936, ; from name: System.Private.Uri.dll.so
		i64 u0xe57af9ab00f5c61d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 351
	%struct.DSOCacheEntry {
		i64 u0x94fe7e3e9bc50f2a, ; from name: libaot-Avalonia.dll.so
		i64 u0x94fe7e3e9bc50f2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Avalonia.dll.so
		ptr null; void* handle
	}, ; 352
	%struct.DSOCacheEntry {
		i64 u0x9527948cf7bb1991, ; from name: libaot-System.Threading.so
		i64 u0x5f435aa7f5fde870, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 353
	%struct.DSOCacheEntry {
		i64 u0x9533e2ba75a1f095, ; from name: HarfBuzzSharp.dll.so
		i64 u0x34fa94470888dd75, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-HarfBuzzSharp.dll.so
		ptr null; void* handle
	}, ; 354
	%struct.DSOCacheEntry {
		i64 u0x956f26e96f96282b, ; from name: Mono.Android.Runtime.so
		i64 u0x156ae2b2e8a39884, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 355
	%struct.DSOCacheEntry {
		i64 u0x95ccfe1d9785405e, ; from name: aot-Xamarin.Kotlin.StdLib
		i64 u0x0c644d6a2b020c43, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 356
	%struct.DSOCacheEntry {
		i64 u0x95ed0349cb4cb979, ; from name: System.Text.RegularExpressions.so
		i64 u0x7c2c39dae387b52d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 357
	%struct.DSOCacheEntry {
		i64 u0x963ee8bdd5b1c36f, ; from name: Xamarin.AndroidX.Activity.dll.so
		i64 u0x8a05820e9e77c0c3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 358
	%struct.DSOCacheEntry {
		i64 u0x96753d66e2619fc0, ; from name: aot-System.Security.Cryptography.dll.so
		i64 u0xd0e82017367ac826, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 359
	%struct.DSOCacheEntry {
		i64 u0x974407ee353a91bf, ; from name: libaot-Xamarin.Kotlin.StdLib.so
		i64 u0x0c644d6a2b020c43, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 360
	%struct.DSOCacheEntry {
		i64 u0x97529a82db270486, ; from name: aot-System.Runtime.InteropServices.dll.so
		i64 u0x5ae6db1ddadc230b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 361
	%struct.DSOCacheEntry {
		i64 u0x9779a7876628f915, ; from name: aot-System.ComponentModel.Primitives
		i64 u0xccde8a4563eee10b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 362
	%struct.DSOCacheEntry {
		i64 u0x984a5bf1c8ad2a21, ; from name: libaot-System.Runtime.so
		i64 u0xbbc0e6e747d7877a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 363
	%struct.DSOCacheEntry {
		i64 u0x9866db260f4a3bb0, ; from name: MicroCom.Runtime.so
		i64 u0x6114909d114168f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-MicroCom.Runtime.dll.so
		ptr null; void* handle
	}, ; 364
	%struct.DSOCacheEntry {
		i64 u0x98834bb0d43301d2, ; from name: aot-System.Collections.Concurrent.dll.so
		i64 u0x65cd21401fecc3dc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 365
	%struct.DSOCacheEntry {
		i64 u0x98ba904da6358519, ; from name: libaot-Xamarin.AndroidX.DrawerLayout.so
		i64 u0x4bea014989424a56, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 366
	%struct.DSOCacheEntry {
		i64 u0x991d510397f92d9d, ; from name: System.Linq.Expressions
		i64 u0xda1d7acd827eb320, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 367
	%struct.DSOCacheEntry {
		i64 u0x99e783e6676e7adf, ; from name: System.Runtime.InteropServices.dll.so
		i64 u0x5ae6db1ddadc230b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 368
	%struct.DSOCacheEntry {
		i64 u0x9a6f648da172667e, ; from name: _Microsoft.Android.Resource.Designer.so
		i64 u0x9cbca1c74026e295, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 369
	%struct.DSOCacheEntry {
		i64 u0x9a9f0f27449e14da, ; from name: libaot-Avalonia.OpenGL.dll.so
		i64 u0x9a9f0f27449e14da, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Avalonia.OpenGL.dll.so
		ptr null; void* handle
	}, ; 370
	%struct.DSOCacheEntry {
		i64 u0x9bf632171724cea8, ; from name: aot-Avalonia.Themes.Fluent
		i64 u0x2151e7b9f3592593, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Avalonia.Themes.Fluent.dll.so
		ptr null; void* handle
	}, ; 371
	%struct.DSOCacheEntry {
		i64 u0x9cbca1c74026e295, ; from name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		i64 u0x9cbca1c74026e295, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 372
	%struct.DSOCacheEntry {
		i64 u0x9cbd1d72a9e5192f, ; from name: System.Runtime.dll.so
		i64 u0xbbc0e6e747d7877a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 373
	%struct.DSOCacheEntry {
		i64 u0x9d9a18bc4dc5b765, ; from name: aot-YRM100.Reader
		i64 u0x327465e605eba9a7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-YRM100.Reader.dll.so
		ptr null; void* handle
	}, ; 374
	%struct.DSOCacheEntry {
		i64 u0x9eb4ae89ecef09f8, ; from name: System.Diagnostics.TraceSource.so
		i64 u0x2119cc81025daa05, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle
	}, ; 375
	%struct.DSOCacheEntry {
		i64 u0x9ed669484281002d, ; from name: libaot-System.Net.Sockets.so
		i64 u0x4c5401149da6445e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle
	}, ; 376
	%struct.DSOCacheEntry {
		i64 u0x9ef542cf1f78c506, ; from name: Xamarin.AndroidX.Lifecycle.LiveData.Core
		i64 u0x38e4553d8764fa45, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 377
	%struct.DSOCacheEntry {
		i64 u0x9f256518cca4cffd, ; from name: Avalonia.Markup.so
		i64 u0xcf830f414728cec6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Avalonia.Markup.dll.so
		ptr null; void* handle
	}, ; 378
	%struct.DSOCacheEntry {
		i64 u0x9f473a65f10d6fa9, ; from name: aot-System.Console
		i64 u0xc2da5dca6ccd8b0a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 379
	%struct.DSOCacheEntry {
		i64 u0x9fb9cf8caf290772, ; from name: libaot-Avalonia.MicroCom.so
		i64 u0xd7b79701607da010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Avalonia.MicroCom.dll.so
		ptr null; void* handle
	}, ; 380
	%struct.DSOCacheEntry {
		i64 u0xa0a8ab51c91c583c, ; from name: libaot-Avalonia.MicroCom
		i64 u0xd7b79701607da010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Avalonia.MicroCom.dll.so
		ptr null; void* handle
	}, ; 381
	%struct.DSOCacheEntry {
		i64 u0xa20a4c62c593bec4, ; from name: libaot-Avalonia.DesignerSupport.so
		i64 u0xfc800994bb34a441, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Avalonia.DesignerSupport.dll.so
		ptr null; void* handle
	}, ; 382
	%struct.DSOCacheEntry {
		i64 u0xa28642c7ac33c167, ; from name: Avalonia.Markup
		i64 u0xcf830f414728cec6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Avalonia.Markup.dll.so
		ptr null; void* handle
	}, ; 383
	%struct.DSOCacheEntry {
		i64 u0xa2b4fd670b3d1621, ; from name: libaot-System.ComponentModel.Primitives
		i64 u0xccde8a4563eee10b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 384
	%struct.DSOCacheEntry {
		i64 u0xa3600d7904da7121, ; from name: libaot-System.ComponentModel.TypeConverter
		i64 u0xcb7e41356728fd07, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 385
	%struct.DSOCacheEntry {
		i64 u0xa36762ce482f6584, ; from name: Java.Interop.so
		i64 u0x6ce045494a545eab, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 386
	%struct.DSOCacheEntry {
		i64 u0xa3dc3bd6aae2cea1, ; from name: Xamarin.AndroidX.Loader.dll.so
		i64 u0x74b0aefe8f467d50, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 387
	%struct.DSOCacheEntry {
		i64 u0xa57746d2a371c785, ; from name: aot-System.Runtime.so
		i64 u0xbbc0e6e747d7877a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 388
	%struct.DSOCacheEntry {
		i64 u0xa60a110abd739693, ; from name: libaot-HarfBuzzSharp.so
		i64 u0x34fa94470888dd75, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-HarfBuzzSharp.dll.so
		ptr null; void* handle
	}, ; 389
	%struct.DSOCacheEntry {
		i64 u0xa6792e826db2954e, ; from name: libaot-Xamarin.AndroidX.AppCompat
		i64 u0x42c7eb0880ff24a4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 390
	%struct.DSOCacheEntry {
		i64 u0xa6d29cffa841bf87, ; from name: Mono.Android.Runtime.dll.so
		i64 u0x156ae2b2e8a39884, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 391
	%struct.DSOCacheEntry {
		i64 u0xa74504a0d2e71024, ; from name: Avalonia.Controls.dll.so
		i64 u0xf02626d2f9400114, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Avalonia.Controls.dll.so
		ptr null; void* handle
	}, ; 392
	%struct.DSOCacheEntry {
		i64 u0xa7b7eaf43544b3a7, ; from name: System.Collections.Specialized.dll.so
		i64 u0x355b66670e6bf2e4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 393
	%struct.DSOCacheEntry {
		i64 u0xa7f15d3a1f546d9b, ; from name: libaot-Avalonia.Vulkan.dll.so
		i64 u0xa7f15d3a1f546d9b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Avalonia.Vulkan.dll.so
		ptr null; void* handle
	}, ; 394
	%struct.DSOCacheEntry {
		i64 u0xa84451db4a425556, ; from name: libaot-System.Net.NameResolution.so
		i64 u0x7f280e9be5453eba, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle
	}, ; 395
	%struct.DSOCacheEntry {
		i64 u0xa92d20ab378a1b3f, ; from name: libaot-YRM100.Reader.so
		i64 u0x327465e605eba9a7, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.11_name, ; name: libaot-YRM100.Reader.dll.so
		ptr null; void* handle
	}, ; 396
	%struct.DSOCacheEntry {
		i64 u0xa99fc710fdd6e008, ; from name: System.Threading.so
		i64 u0x5f435aa7f5fde870, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 397
	%struct.DSOCacheEntry {
		i64 u0xa9ec80581451e827, ; from name: Yrm100.Protocol.so
		i64 u0x79f30a8f30bc39e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Yrm100.Protocol.dll.so
		ptr null; void* handle
	}, ; 398
	%struct.DSOCacheEntry {
		i64 u0xaaba20554af6cac2, ; from name: System.ObjectModel.dll.so
		i64 u0x914167d87d2ee1b1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 399
	%struct.DSOCacheEntry {
		i64 u0xaac4801194f87f4f, ; from name: libaot-System.Net.Primitives.dll.so
		i64 u0xaac4801194f87f4f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 400
	%struct.DSOCacheEntry {
		i64 u0xab58dfeac8661c19, ; from name: libaot-System.Net.Primitives.so
		i64 u0xaac4801194f87f4f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 401
	%struct.DSOCacheEntry {
		i64 u0xac514f7563a2b76f, ; from name: aot-Avalonia.MicroCom.so
		i64 u0xd7b79701607da010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Avalonia.MicroCom.dll.so
		ptr null; void* handle
	}, ; 402
	%struct.DSOCacheEntry {
		i64 u0xad582851e7d05243, ; from name: libaot-System.Memory.dll.so
		i64 u0xad582851e7d05243, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 403
	%struct.DSOCacheEntry {
		i64 u0xad5ac1aa096477f8, ; from name: Avalonia.Themes.Fluent.dll.so
		i64 u0x2151e7b9f3592593, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Avalonia.Themes.Fluent.dll.so
		ptr null; void* handle
	}, ; 404
	%struct.DSOCacheEntry {
		i64 u0xad9f4fa2d9f664bb, ; from name: Avalonia.Vulkan.so
		i64 u0xa7f15d3a1f546d9b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Avalonia.Vulkan.dll.so
		ptr null; void* handle
	}, ; 405
	%struct.DSOCacheEntry {
		i64 u0xae282bcd03739de7, ; from name: Java.Interop
		i64 u0x6ce045494a545eab, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 406
	%struct.DSOCacheEntry {
		i64 u0xae8282b3068f87cd, ; from name: Xamarin.AndroidX.DrawerLayout.so
		i64 u0x4bea014989424a56, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 407
	%struct.DSOCacheEntry {
		i64 u0xaebea2758bf90369, ; from name: aot-Avalonia.Metal.dll.so
		i64 u0x52c039815d238d2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Avalonia.Metal.dll.so
		ptr null; void* handle
	}, ; 408
	%struct.DSOCacheEntry {
		i64 u0xaef55035077cd01c, ; from name: System.ComponentModel.dll.so
		i64 u0x38a82198a4cd2a73, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 409
	%struct.DSOCacheEntry {
		i64 u0xaf2fccd8d6eb63cb, ; from name: aot-System.Net.Primitives.dll.so
		i64 u0xaac4801194f87f4f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.57_name, ; name: libaot-System.Net.Primitives.dll.so
		ptr null; void* handle
	}, ; 410
	%struct.DSOCacheEntry {
		i64 u0xb1aad4a0f591b204, ; from name: SkiaSharp.dll.so
		i64 u0x3cb282562b838c95, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-SkiaSharp.dll.so
		ptr null; void* handle
	}, ; 411
	%struct.DSOCacheEntry {
		i64 u0xb220631954820169, ; from name: System.Text.RegularExpressions
		i64 u0x7c2c39dae387b52d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 412
	%struct.DSOCacheEntry {
		i64 u0xb289cfbb89eaff05, ; from name: aot-Avalonia.Vulkan.so
		i64 u0xa7f15d3a1f546d9b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Avalonia.Vulkan.dll.so
		ptr null; void* handle
	}, ; 413
	%struct.DSOCacheEntry {
		i64 u0xb29024b995e4ccc2, ; from name: libaot-System.ComponentModel.TypeConverter.so
		i64 u0xcb7e41356728fd07, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 414
	%struct.DSOCacheEntry {
		i64 u0xb2a3b0b9445d4908, ; from name: libaot-System.Private.Uri
		i64 u0xe57af9ab00f5c61d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 415
	%struct.DSOCacheEntry {
		i64 u0xb2d0ce1b008afb2a, ; from name: libaot-System.Linq
		i64 u0x2fb7a3952b307fae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 416
	%struct.DSOCacheEntry {
		i64 u0xb2ff2a0c722122f7, ; from name: libaot-MicroCom.Runtime.so
		i64 u0x6114909d114168f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-MicroCom.Runtime.dll.so
		ptr null; void* handle
	}, ; 417
	%struct.DSOCacheEntry {
		i64 u0xb373ed6de60e4cfc, ; from name: System.Linq.Expressions.dll.so
		i64 u0xda1d7acd827eb320, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 418
	%struct.DSOCacheEntry {
		i64 u0xb3f9fc836ae7ebb5, ; from name: libaot-System.Collections.dll.so
		i64 u0xb3f9fc836ae7ebb5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 419
	%struct.DSOCacheEntry {
		i64 u0xb48e9e71b06b9446, ; from name: aot-Mono.Android
		i64 u0x359895a3c1bd5685, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 420
	%struct.DSOCacheEntry {
		i64 u0xb6ab21527197f7f1, ; from name: libaot-netstandard.dll.so
		i64 u0xb6ab21527197f7f1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle
	}, ; 421
	%struct.DSOCacheEntry {
		i64 u0xb6d728fc05376c3e, ; from name: Avalonia.MicroCom.dll.so
		i64 u0xd7b79701607da010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Avalonia.MicroCom.dll.so
		ptr null; void* handle
	}, ; 422
	%struct.DSOCacheEntry {
		i64 u0xb71bb9a8d392fa40, ; from name: System.Linq.dll.so
		i64 u0x2fb7a3952b307fae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 423
	%struct.DSOCacheEntry {
		i64 u0xb751d0c56f186f53, ; from name: Yrm100.Protocol
		i64 u0x79f30a8f30bc39e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.10_name, ; name: libaot-Yrm100.Protocol.dll.so
		ptr null; void* handle
	}, ; 424
	%struct.DSOCacheEntry {
		i64 u0xb7879ed14a810ab4, ; from name: Java.Interop.dll.so
		i64 u0x6ce045494a545eab, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 425
	%struct.DSOCacheEntry {
		i64 u0xb80075262344d8c0, ; from name: aot-Xamarin.AndroidX.Lifecycle.LiveData.Core.so
		i64 u0x38e4553d8764fa45, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 426
	%struct.DSOCacheEntry {
		i64 u0xb804ec2e45f682de, ; from name: libaot-System.Net.Sockets
		i64 u0x4c5401149da6445e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle
	}, ; 427
	%struct.DSOCacheEntry {
		i64 u0xb80e4cd92e569c19, ; from name: System.Collections.NonGeneric.so
		i64 u0x6fd15fb6a42c9afc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 428
	%struct.DSOCacheEntry {
		i64 u0xb88aaf70962c6080, ; from name: aot-System.Linq.dll.so
		i64 u0x2fb7a3952b307fae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 429
	%struct.DSOCacheEntry {
		i64 u0xb8c4e6d79b2bf900, ; from name: System.Private.CoreLib.dll.so
		i64 u0xe1af59ffe15719e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 430
	%struct.DSOCacheEntry {
		i64 u0xba9767ca98b44381, ; from name: aot-System.Linq.Expressions
		i64 u0xda1d7acd827eb320, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 431
	%struct.DSOCacheEntry {
		i64 u0xbb1af0a7aa8398a5, ; from name: System.ComponentModel.Primitives.so
		i64 u0xccde8a4563eee10b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 432
	%struct.DSOCacheEntry {
		i64 u0xbb295bd4e1b78198, ; from name: aot-System.ObjectModel.dll.so
		i64 u0x914167d87d2ee1b1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.59_name, ; name: libaot-System.ObjectModel.dll.so
		ptr null; void* handle
	}, ; 433
	%struct.DSOCacheEntry {
		i64 u0xbb65706fde942ce3, ; from name: System.Net.Sockets
		i64 u0x4c5401149da6445e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle
	}, ; 434
	%struct.DSOCacheEntry {
		i64 u0xbbc0e6e747d7877a, ; from name: libaot-System.Runtime.dll.so
		i64 u0xbbc0e6e747d7877a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 435
	%struct.DSOCacheEntry {
		i64 u0xbd4494ce9e125d5c, ; from name: libaot-HarfBuzzSharp
		i64 u0x34fa94470888dd75, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-HarfBuzzSharp.dll.so
		ptr null; void* handle
	}, ; 436
	%struct.DSOCacheEntry {
		i64 u0xbd6f490f32036ae3, ; from name: aot-System
		i64 u0x7b91ac8ddc528deb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 437
	%struct.DSOCacheEntry {
		i64 u0xbe5ea3f3d8c611a9, ; from name: libaot-System.IO.Compression
		i64 u0x07869dd1c492a791, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 438
	%struct.DSOCacheEntry {
		i64 u0xbe84f8732e7e09b2, ; from name: libaot-System.Collections.NonGeneric
		i64 u0x6fd15fb6a42c9afc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 439
	%struct.DSOCacheEntry {
		i64 u0xbec0dc4c059f35ee, ; from name: aot-Avalonia.Markup
		i64 u0xcf830f414728cec6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Avalonia.Markup.dll.so
		ptr null; void* handle
	}, ; 440
	%struct.DSOCacheEntry {
		i64 u0xbeef23a25818ef92, ; from name: aot-System.Collections.Concurrent.so
		i64 u0x65cd21401fecc3dc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 441
	%struct.DSOCacheEntry {
		i64 u0xbf11b5f468e08371, ; from name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.so
		i64 u0x8a1d474b582068bb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		ptr null; void* handle
	}, ; 442
	%struct.DSOCacheEntry {
		i64 u0xbf7d944f85fcd72c, ; from name: libaot-System.ComponentModel.Annotations.dll.so
		i64 u0xbf7d944f85fcd72c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-System.ComponentModel.Annotations.dll.so
		ptr null; void* handle
	}, ; 443
	%struct.DSOCacheEntry {
		i64 u0xbfcbe3b519c50cd3, ; from name: aot-Avalonia.OpenGL
		i64 u0x9a9f0f27449e14da, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Avalonia.OpenGL.dll.so
		ptr null; void* handle
	}, ; 444
	%struct.DSOCacheEntry {
		i64 u0xc04083f5f9aaaaaa, ; from name: Xamarin.AndroidX.AppCompat.so
		i64 u0x42c7eb0880ff24a4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 445
	%struct.DSOCacheEntry {
		i64 u0xc25aa808516eb94a, ; from name: libaot-Xamarin.AndroidX.Lifecycle.Common.dll.so
		i64 u0xc25aa808516eb94a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.dll.so
		ptr null; void* handle
	}, ; 446
	%struct.DSOCacheEntry {
		i64 u0xc2b46ace5ffdf725, ; from name: aot-Java.Interop.so
		i64 u0x6ce045494a545eab, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 447
	%struct.DSOCacheEntry {
		i64 u0xc2da5dca6ccd8b0a, ; from name: libaot-System.Console.dll.so
		i64 u0xc2da5dca6ccd8b0a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 448
	%struct.DSOCacheEntry {
		i64 u0xc3b501bdf4608508, ; from name: aot-System.ComponentModel.so
		i64 u0x38a82198a4cd2a73, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 449
	%struct.DSOCacheEntry {
		i64 u0xc3b9705c2cd71984, ; from name: Xamarin.AndroidX.Lifecycle.ViewModel.so
		i64 u0x8a1d474b582068bb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		ptr null; void* handle
	}, ; 450
	%struct.DSOCacheEntry {
		i64 u0xc3d288445e5a2dee, ; from name: libaot-MicroCom.Runtime
		i64 u0x6114909d114168f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-MicroCom.Runtime.dll.so
		ptr null; void* handle
	}, ; 451
	%struct.DSOCacheEntry {
		i64 u0xc423b88904a6141e, ; from name: System.Private.Uri.so
		i64 u0xe57af9ab00f5c61d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 452
	%struct.DSOCacheEntry {
		i64 u0xc4846655abe50016, ; from name: System.ComponentModel.Primitives.dll.so
		i64 u0xccde8a4563eee10b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 453
	%struct.DSOCacheEntry {
		i64 u0xc4f15f68eb8c7cf3, ; from name: Avalonia.OpenGL.dll.so
		i64 u0x9a9f0f27449e14da, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Avalonia.OpenGL.dll.so
		ptr null; void* handle
	}, ; 454
	%struct.DSOCacheEntry {
		i64 u0xc555328858f6cc44, ; from name: aot-Xamarin.AndroidX.DrawerLayout.dll.so
		i64 u0x4bea014989424a56, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 455
	%struct.DSOCacheEntry {
		i64 u0xc71cbf09d1338f8c, ; from name: Xamarin.Kotlin.StdLib.so
		i64 u0x0c644d6a2b020c43, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 456
	%struct.DSOCacheEntry {
		i64 u0xc76cac9b73ac4631, ; from name: aot-Avalonia.Controls.dll.so
		i64 u0xf02626d2f9400114, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Avalonia.Controls.dll.so
		ptr null; void* handle
	}, ; 457
	%struct.DSOCacheEntry {
		i64 u0xc8914d714ccff201, ; from name: aot-System.Private.Uri
		i64 u0xe57af9ab00f5c61d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 458
	%struct.DSOCacheEntry {
		i64 u0xc94a5bba3d99dc4e, ; from name: libaot-Xamarin.AndroidX.Activity.so
		i64 u0x8a05820e9e77c0c3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 459
	%struct.DSOCacheEntry {
		i64 u0xc98e355277e9a130, ; from name: aot-Avalonia.DesignerSupport.dll.so
		i64 u0xfc800994bb34a441, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Avalonia.DesignerSupport.dll.so
		ptr null; void* handle
	}, ; 460
	%struct.DSOCacheEntry {
		i64 u0xcb0c13d562c0b850, ; from name: libaot-_Microsoft.Android.Resource.Designer
		i64 u0x9cbca1c74026e295, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 461
	%struct.DSOCacheEntry {
		i64 u0xcb7e41356728fd07, ; from name: libaot-System.ComponentModel.TypeConverter.dll.so
		i64 u0xcb7e41356728fd07, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.47_name, ; name: libaot-System.ComponentModel.TypeConverter.dll.so
		ptr null; void* handle
	}, ; 462
	%struct.DSOCacheEntry {
		i64 u0xcb9a87159d1a3ac5, ; from name: aot-Avalonia.Markup.Xaml.so
		i64 u0x5afe641f0eb3380f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Avalonia.Markup.Xaml.dll.so
		ptr null; void* handle
	}, ; 463
	%struct.DSOCacheEntry {
		i64 u0xcc3e2d383c80f91e, ; from name: libaot-Xamarin.AndroidX.Lifecycle.Common
		i64 u0xc25aa808516eb94a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.dll.so
		ptr null; void* handle
	}, ; 464
	%struct.DSOCacheEntry {
		i64 u0xcca4402beeb8c8a3, ; from name: aot-System.Text.RegularExpressions.dll.so
		i64 u0x7c2c39dae387b52d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.65_name, ; name: libaot-System.Text.RegularExpressions.dll.so
		ptr null; void* handle
	}, ; 465
	%struct.DSOCacheEntry {
		i64 u0xccde8a4563eee10b, ; from name: libaot-System.ComponentModel.Primitives.dll.so
		i64 u0xccde8a4563eee10b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 466
	%struct.DSOCacheEntry {
		i64 u0xce3991481c3a2f14, ; from name: libaot-Avalonia.Skia.dll.so
		i64 u0xce3991481c3a2f14, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Avalonia.Skia.dll.so
		ptr null; void* handle
	}, ; 467
	%struct.DSOCacheEntry {
		i64 u0xcecb7834942dfd2e, ; from name: libaot-Avalonia.Markup.Xaml
		i64 u0x5afe641f0eb3380f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Avalonia.Markup.Xaml.dll.so
		ptr null; void* handle
	}, ; 468
	%struct.DSOCacheEntry {
		i64 u0xcf07d50965be005c, ; from name: aot-System.Collections.NonGeneric.dll.so
		i64 u0x6fd15fb6a42c9afc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 469
	%struct.DSOCacheEntry {
		i64 u0xcf37a833127bfcfc, ; from name: aot-System.Net.Sockets.so
		i64 u0x4c5401149da6445e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.58_name, ; name: libaot-System.Net.Sockets.dll.so
		ptr null; void* handle
	}, ; 470
	%struct.DSOCacheEntry {
		i64 u0xcf830f414728cec6, ; from name: libaot-Avalonia.Markup.dll.so
		i64 u0xcf830f414728cec6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Avalonia.Markup.dll.so
		ptr null; void* handle
	}, ; 471
	%struct.DSOCacheEntry {
		i64 u0xd00ab911f3bb07ec, ; from name: Xamarin.Kotlin.StdLib.dll.so
		i64 u0x0c644d6a2b020c43, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 472
	%struct.DSOCacheEntry {
		i64 u0xd042075e5c1f43f1, ; from name: libaot-System.Linq.Expressions
		i64 u0xda1d7acd827eb320, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 473
	%struct.DSOCacheEntry {
		i64 u0xd09fa589a39c6f4e, ; from name: aot-System.Net.NameResolution.so
		i64 u0x7f280e9be5453eba, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle
	}, ; 474
	%struct.DSOCacheEntry {
		i64 u0xd0e82017367ac826, ; from name: libaot-System.Security.Cryptography.dll.so
		i64 u0xd0e82017367ac826, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 475
	%struct.DSOCacheEntry {
		i64 u0xd0eb5648c8619dd3, ; from name: libaot-Avalonia.Base
		i64 u0x7f962a4ef6dfe3fc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Avalonia.Base.dll.so
		ptr null; void* handle
	}, ; 476
	%struct.DSOCacheEntry {
		i64 u0xd0fc7ac60a41b4c9, ; from name: System.Memory.dll.so
		i64 u0xad582851e7d05243, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 477
	%struct.DSOCacheEntry {
		i64 u0xd1d253eb41908cb5, ; from name: aot-Xamarin.AndroidX.Fragment
		i64 u0x8ab6d3431da5497e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 478
	%struct.DSOCacheEntry {
		i64 u0xd2358b262070265d, ; from name: Avalonia.OpenGL.so
		i64 u0x9a9f0f27449e14da, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.20_name, ; name: libaot-Avalonia.OpenGL.dll.so
		ptr null; void* handle
	}, ; 479
	%struct.DSOCacheEntry {
		i64 u0xd24573ad15205bc1, ; from name: Xamarin.AndroidX.Core.so
		i64 u0x28a319e875b39488, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 480
	%struct.DSOCacheEntry {
		i64 u0xd2475965a9e31837, ; from name: aot-System.Threading.so
		i64 u0x5f435aa7f5fde870, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.66_name, ; name: libaot-System.Threading.dll.so
		ptr null; void* handle
	}, ; 481
	%struct.DSOCacheEntry {
		i64 u0xd333d0af9e423810, ; from name: System.Runtime.InteropServices
		i64 u0x5ae6db1ddadc230b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 482
	%struct.DSOCacheEntry {
		i64 u0xd38113e40f50660b, ; from name: aot-Avalonia.Dialogs
		i64 u0x0e88e656cbbcbbc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Avalonia.Dialogs.dll.so
		ptr null; void* handle
	}, ; 483
	%struct.DSOCacheEntry {
		i64 u0xd3b374a020395487, ; from name: libaot-Xamarin.AndroidX.Core
		i64 u0x28a319e875b39488, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 484
	%struct.DSOCacheEntry {
		i64 u0xd4bb298a95f7827b, ; from name: aot-Xamarin.AndroidX.DrawerLayout.so
		i64 u0x4bea014989424a56, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 485
	%struct.DSOCacheEntry {
		i64 u0xd4ca367710a2ffa1, ; from name: System.Collections.NonGeneric.dll.so
		i64 u0x6fd15fb6a42c9afc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.42_name, ; name: libaot-System.Collections.NonGeneric.dll.so
		ptr null; void* handle
	}, ; 486
	%struct.DSOCacheEntry {
		i64 u0xd4d27f08b1450804, ; from name: System.Runtime.so
		i64 u0xbbc0e6e747d7877a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 487
	%struct.DSOCacheEntry {
		i64 u0xd52767571e1f65af, ; from name: aot-System.Runtime.dll.so
		i64 u0xbbc0e6e747d7877a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 488
	%struct.DSOCacheEntry {
		i64 u0xd571447114c5aacb, ; from name: aot-System.Linq.Expressions.dll.so
		i64 u0xda1d7acd827eb320, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 489
	%struct.DSOCacheEntry {
		i64 u0xd6694f8359737e4e, ; from name: Xamarin.AndroidX.SavedState
		i64 u0x039588659cdd2f6a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.SavedState.dll.so
		ptr null; void* handle
	}, ; 490
	%struct.DSOCacheEntry {
		i64 u0xd6a7a25e912a138e, ; from name: libaot-System
		i64 u0x7b91ac8ddc528deb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 491
	%struct.DSOCacheEntry {
		i64 u0xd73d5f2325f4e10a, ; from name: libaot-System.ComponentModel.Primitives.so
		i64 u0xccde8a4563eee10b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 492
	%struct.DSOCacheEntry {
		i64 u0xd7845c8bf07d04e9, ; from name: aot-System.Console.dll.so
		i64 u0xc2da5dca6ccd8b0a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 493
	%struct.DSOCacheEntry {
		i64 u0xd788c113da082c63, ; from name: libaot-Mono.Android
		i64 u0x359895a3c1bd5685, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.71_name, ; name: libaot-Mono.Android.dll.so
		ptr null; void* handle
	}, ; 494
	%struct.DSOCacheEntry {
		i64 u0xd7b79701607da010, ; from name: libaot-Avalonia.MicroCom.dll.so
		i64 u0xd7b79701607da010, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.19_name, ; name: libaot-Avalonia.MicroCom.dll.so
		ptr null; void* handle
	}, ; 495
	%struct.DSOCacheEntry {
		i64 u0xd80e1a831361a643, ; from name: aot-Avalonia.DesignerSupport
		i64 u0xfc800994bb34a441, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Avalonia.DesignerSupport.dll.so
		ptr null; void* handle
	}, ; 496
	%struct.DSOCacheEntry {
		i64 u0xd820f7778b6dda67, ; from name: libaot-Xamarin.AndroidX.Fragment.so
		i64 u0x8ab6d3431da5497e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 497
	%struct.DSOCacheEntry {
		i64 u0xd86251721c84b1ee, ; from name: aot-System.Diagnostics.DiagnosticSource.dll.so
		i64 u0x77156c94b5eff927, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.50_name, ; name: libaot-System.Diagnostics.DiagnosticSource.dll.so
		ptr null; void* handle
	}, ; 498
	%struct.DSOCacheEntry {
		i64 u0xd88b5f5bbc332508, ; from name: Avalonia.Base
		i64 u0x7f962a4ef6dfe3fc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.12_name, ; name: libaot-Avalonia.Base.dll.so
		ptr null; void* handle
	}, ; 499
	%struct.DSOCacheEntry {
		i64 u0xd8b23283eb26ad3e, ; from name: aot-System.Linq.so
		i64 u0x2fb7a3952b307fae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 500
	%struct.DSOCacheEntry {
		i64 u0xd9f772c73b7aa267, ; from name: aot-Xamarin.AndroidX.DrawerLayout
		i64 u0x4bea014989424a56, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.33_name, ; name: libaot-Xamarin.AndroidX.DrawerLayout.dll.so
		ptr null; void* handle
	}, ; 501
	%struct.DSOCacheEntry {
		i64 u0xda1d7acd827eb320, ; from name: libaot-System.Linq.Expressions.dll.so
		i64 u0xda1d7acd827eb320, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.53_name, ; name: libaot-System.Linq.Expressions.dll.so
		ptr null; void* handle
	}, ; 502
	%struct.DSOCacheEntry {
		i64 u0xda3e671b21710f18, ; from name: aot-Java.Interop
		i64 u0x6ce045494a545eab, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.69_name, ; name: libaot-Java.Interop.dll.so
		ptr null; void* handle
	}, ; 503
	%struct.DSOCacheEntry {
		i64 u0xda57789a55e0db56, ; from name: System.ComponentModel.Annotations.dll.so
		i64 u0xbf7d944f85fcd72c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-System.ComponentModel.Annotations.dll.so
		ptr null; void* handle
	}, ; 504
	%struct.DSOCacheEntry {
		i64 u0xdb433c9db2de9c49, ; from name: Xamarin.AndroidX.SavedState.dll.so
		i64 u0x039588659cdd2f6a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.39_name, ; name: libaot-Xamarin.AndroidX.SavedState.dll.so
		ptr null; void* handle
	}, ; 505
	%struct.DSOCacheEntry {
		i64 u0xdbb9e1e0ecaa9f17, ; from name: System.IO.Compression.dll.so
		i64 u0x07869dd1c492a791, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 506
	%struct.DSOCacheEntry {
		i64 u0xdbf9607a441b4505, ; from name: System.Linq
		i64 u0x2fb7a3952b307fae, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.54_name, ; name: libaot-System.Linq.dll.so
		ptr null; void* handle
	}, ; 507
	%struct.DSOCacheEntry {
		i64 u0xdc0230ef3b6efdb3, ; from name: aot-Xamarin.AndroidX.Loader.dll.so
		i64 u0x74b0aefe8f467d50, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 508
	%struct.DSOCacheEntry {
		i64 u0xdc37b4a8a684fa94, ; from name: libaot-Avalonia.Markup.Xaml.so
		i64 u0x5afe641f0eb3380f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Avalonia.Markup.Xaml.dll.so
		ptr null; void* handle
	}, ; 509
	%struct.DSOCacheEntry {
		i64 u0xde5702cd751b5645, ; from name: System.Security.Cryptography.so
		i64 u0xd0e82017367ac826, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 510
	%struct.DSOCacheEntry {
		i64 u0xe047cec24633c1a6, ; from name: aot-System.ComponentModel.dll.so
		i64 u0x38a82198a4cd2a73, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.48_name, ; name: libaot-System.ComponentModel.dll.so
		ptr null; void* handle
	}, ; 511
	%struct.DSOCacheEntry {
		i64 u0xe0dc14843be66eb7, ; from name: Avalonia.Skia.so
		i64 u0xce3991481c3a2f14, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Avalonia.Skia.dll.so
		ptr null; void* handle
	}, ; 512
	%struct.DSOCacheEntry {
		i64 u0xe106423bc739c2b2, ; from name: aot-_Microsoft.Android.Resource.Designer.so
		i64 u0x9cbca1c74026e295, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 513
	%struct.DSOCacheEntry {
		i64 u0xe125cb42da1b888c, ; from name: aot-System.Security.Cryptography.so
		i64 u0xd0e82017367ac826, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 514
	%struct.DSOCacheEntry {
		i64 u0xe1af59ffe15719e2, ; from name: libaot-System.Private.CoreLib.dll.so
		i64 u0xe1af59ffe15719e2, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.72_name, ; name: libaot-System.Private.CoreLib.dll.so
		ptr null; void* handle
	}, ; 515
	%struct.DSOCacheEntry {
		i64 u0xe29b7559d8668b8d, ; from name: aot-Xamarin.AndroidX.Fragment.dll.so
		i64 u0x8ab6d3431da5497e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 516
	%struct.DSOCacheEntry {
		i64 u0xe2cf8c52e543554c, ; from name: aot-Xamarin.Kotlin.StdLib.so
		i64 u0x0c644d6a2b020c43, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.40_name, ; name: libaot-Xamarin.Kotlin.StdLib.dll.so
		ptr null; void* handle
	}, ; 517
	%struct.DSOCacheEntry {
		i64 u0xe2d6e4280ed3e258, ; from name: aot-Avalonia.Controls.so
		i64 u0xf02626d2f9400114, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Avalonia.Controls.dll.so
		ptr null; void* handle
	}, ; 518
	%struct.DSOCacheEntry {
		i64 u0xe37eee0db1282aa3, ; from name: aot-netstandard.so
		i64 u0xb6ab21527197f7f1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle
	}, ; 519
	%struct.DSOCacheEntry {
		i64 u0xe456dd9cd8a3e128, ; from name: System.Security.Cryptography.dll.so
		i64 u0xd0e82017367ac826, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.64_name, ; name: libaot-System.Security.Cryptography.dll.so
		ptr null; void* handle
	}, ; 520
	%struct.DSOCacheEntry {
		i64 u0xe4648f9beb38b02f, ; from name: Avalonia
		i64 u0x94fe7e3e9bc50f2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.22_name, ; name: libaot-Avalonia.dll.so
		ptr null; void* handle
	}, ; 521
	%struct.DSOCacheEntry {
		i64 u0xe4783a2ad9b467c2, ; from name: libaot-Xamarin.AndroidX.Lifecycle.Common.so
		i64 u0xc25aa808516eb94a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.dll.so
		ptr null; void* handle
	}, ; 522
	%struct.DSOCacheEntry {
		i64 u0xe56064c191eca87a, ; from name: Avalonia.Remote.Protocol.so
		i64 u0x5243c77c100497fa, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.24_name, ; name: libaot-Avalonia.Remote.Protocol.dll.so
		ptr null; void* handle
	}, ; 523
	%struct.DSOCacheEntry {
		i64 u0xe57af9ab00f5c61d, ; from name: libaot-System.Private.Uri.dll.so
		i64 u0xe57af9ab00f5c61d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 524
	%struct.DSOCacheEntry {
		i64 u0xe63b3b2e2f3d3bc0, ; from name: aot-Avalonia.Android.so
		i64 u0x590856c0dd3ba8e5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Avalonia.Android.dll.so
		ptr null; void* handle
	}, ; 525
	%struct.DSOCacheEntry {
		i64 u0xe71f793ff733560f, ; from name: libaot-Avalonia.Themes.Fluent
		i64 u0x2151e7b9f3592593, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.26_name, ; name: libaot-Avalonia.Themes.Fluent.dll.so
		ptr null; void* handle
	}, ; 526
	%struct.DSOCacheEntry {
		i64 u0xe7d4f39d45a0cbba, ; from name: Avalonia.Controls.so
		i64 u0xf02626d2f9400114, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Avalonia.Controls.dll.so
		ptr null; void* handle
	}, ; 527
	%struct.DSOCacheEntry {
		i64 u0xe7fb811d00b98871, ; from name: aot-System.Runtime
		i64 u0xbbc0e6e747d7877a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.63_name, ; name: libaot-System.Runtime.dll.so
		ptr null; void* handle
	}, ; 528
	%struct.DSOCacheEntry {
		i64 u0xe937380fb4202c99, ; from name: aot-System.Diagnostics.TraceSource
		i64 u0x2119cc81025daa05, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle
	}, ; 529
	%struct.DSOCacheEntry {
		i64 u0xea0ab7fb8be2840c, ; from name: libaot-System.Memory.so
		i64 u0xad582851e7d05243, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.55_name, ; name: libaot-System.Memory.dll.so
		ptr null; void* handle
	}, ; 530
	%struct.DSOCacheEntry {
		i64 u0xea487fc29181e58f, ; from name: aot-Avalonia.Markup.dll.so
		i64 u0xcf830f414728cec6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.17_name, ; name: libaot-Avalonia.Markup.dll.so
		ptr null; void* handle
	}, ; 531
	%struct.DSOCacheEntry {
		i64 u0xeb2eb87760c7a2f5, ; from name: libaot-System.Collections
		i64 u0xb3f9fc836ae7ebb5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.44_name, ; name: libaot-System.Collections.dll.so
		ptr null; void* handle
	}, ; 532
	%struct.DSOCacheEntry {
		i64 u0xec8d0cdc2bedf4f6, ; from name: libaot-System.Collections.Specialized
		i64 u0x355b66670e6bf2e4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.43_name, ; name: libaot-System.Collections.Specialized.dll.so
		ptr null; void* handle
	}, ; 533
	%struct.DSOCacheEntry {
		i64 u0xed4191e57023378a, ; from name: aot-Mono.Android.Runtime.dll.so
		i64 u0x156ae2b2e8a39884, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.70_name, ; name: libaot-Mono.Android.Runtime.dll.so
		ptr null; void* handle
	}, ; 534
	%struct.DSOCacheEntry {
		i64 u0xed46da2e8bc1b60c, ; from name: libaot-System.Runtime.InteropServices
		i64 u0x5ae6db1ddadc230b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.62_name, ; name: libaot-System.Runtime.InteropServices.dll.so
		ptr null; void* handle
	}, ; 535
	%struct.DSOCacheEntry {
		i64 u0xeecc5e7f67a30ad6, ; from name: aot-HarfBuzzSharp
		i64 u0x34fa94470888dd75, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-HarfBuzzSharp.dll.so
		ptr null; void* handle
	}, ; 536
	%struct.DSOCacheEntry {
		i64 u0xeeebcc3e64ef8b19, ; from name: aot-Xamarin.AndroidX.Loader.so
		i64 u0x74b0aefe8f467d50, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 537
	%struct.DSOCacheEntry {
		i64 u0xef4f6acb2a118eb6, ; from name: aot-netstandard.dll.so
		i64 u0xb6ab21527197f7f1, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.68_name, ; name: libaot-netstandard.dll.so
		ptr null; void* handle
	}, ; 538
	%struct.DSOCacheEntry {
		i64 u0xefdc45d9474bd3e8, ; from name: libaot-Xamarin.AndroidX.Core.so
		i64 u0x28a319e875b39488, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.32_name, ; name: libaot-Xamarin.AndroidX.Core.dll.so
		ptr null; void* handle
	}, ; 539
	%struct.DSOCacheEntry {
		i64 u0xefec0b7fdc57ec42, ; from name: Xamarin.AndroidX.Activity
		i64 u0x8a05820e9e77c0c3, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.30_name, ; name: libaot-Xamarin.AndroidX.Activity.dll.so
		ptr null; void* handle
	}, ; 540
	%struct.DSOCacheEntry {
		i64 u0xefedcbe674d5eacb, ; from name: aot-System.IO.Compression.dll.so
		i64 u0x07869dd1c492a791, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 541
	%struct.DSOCacheEntry {
		i64 u0xf02626d2f9400114, ; from name: libaot-Avalonia.Controls.dll.so
		i64 u0xf02626d2f9400114, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Avalonia.Controls.dll.so
		ptr null; void* handle
	}, ; 542
	%struct.DSOCacheEntry {
		i64 u0xf09e47b6ae914f6e, ; from name: System.Net.NameResolution
		i64 u0x7f280e9be5453eba, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.56_name, ; name: libaot-System.Net.NameResolution.dll.so
		ptr null; void* handle
	}, ; 543
	%struct.DSOCacheEntry {
		i64 u0xf0ec9bb1b696d67c, ; from name: aot-System.Private.Uri.dll.so
		i64 u0xe57af9ab00f5c61d, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.60_name, ; name: libaot-System.Private.Uri.dll.so
		ptr null; void* handle
	}, ; 544
	%struct.DSOCacheEntry {
		i64 u0xf1136a512f613f6b, ; from name: aot-Xamarin.AndroidX.Lifecycle.LiveData.Core
		i64 u0x38e4553d8764fa45, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.36_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so
		ptr null; void* handle
	}, ; 545
	%struct.DSOCacheEntry {
		i64 u0xf230d2e5cab6cc66, ; from name: Avalonia.Metal.so
		i64 u0x52c039815d238d2a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.18_name, ; name: libaot-Avalonia.Metal.dll.so
		ptr null; void* handle
	}, ; 546
	%struct.DSOCacheEntry {
		i64 u0xf368e771ca059e99, ; from name: Avalonia.Android
		i64 u0x590856c0dd3ba8e5, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.23_name, ; name: libaot-Avalonia.Android.dll.so
		ptr null; void* handle
	}, ; 547
	%struct.DSOCacheEntry {
		i64 u0xf3ddfe05336abf29, ; from name: System
		i64 u0x7b91ac8ddc528deb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.67_name, ; name: libaot-System.dll.so
		ptr null; void* handle
	}, ; 548
	%struct.DSOCacheEntry {
		i64 u0xf3f9a9021a345fb2, ; from name: System.Diagnostics.TraceSource.dll.so
		i64 u0x2119cc81025daa05, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.51_name, ; name: libaot-System.Diagnostics.TraceSource.dll.so
		ptr null; void* handle
	}, ; 549
	%struct.DSOCacheEntry {
		i64 u0xf4727d423e5d26f3, ; from name: SkiaSharp
		i64 u0x3cb282562b838c95, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.29_name, ; name: libaot-SkiaSharp.dll.so
		ptr null; void* handle
	}, ; 550
	%struct.DSOCacheEntry {
		i64 u0xf4c1dd70a5496a17, ; from name: System.IO.Compression
		i64 u0x07869dd1c492a791, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.52_name, ; name: libaot-System.IO.Compression.dll.so
		ptr null; void* handle
	}, ; 551
	%struct.DSOCacheEntry {
		i64 u0xf4fa59b00364ce58, ; from name: aot-_Microsoft.Android.Resource.Designer
		i64 u0x9cbca1c74026e295, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.9_name, ; name: libaot-_Microsoft.Android.Resource.Designer.dll.so
		ptr null; void* handle
	}, ; 552
	%struct.DSOCacheEntry {
		i64 u0xf56fba8789171dc1, ; from name: System.Collections.Concurrent.so
		i64 u0x65cd21401fecc3dc, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.41_name, ; name: libaot-System.Collections.Concurrent.dll.so
		ptr null; void* handle
	}, ; 553
	%struct.DSOCacheEntry {
		i64 u0xf5939193240a19a2, ; from name: libaot-Avalonia.Controls.so
		i64 u0xf02626d2f9400114, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.13_name, ; name: libaot-Avalonia.Controls.dll.so
		ptr null; void* handle
	}, ; 554
	%struct.DSOCacheEntry {
		i64 u0xf5e5ace884bd7ee0, ; from name: System.Console.so
		i64 u0xc2da5dca6ccd8b0a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.49_name, ; name: libaot-System.Console.dll.so
		ptr null; void* handle
	}, ; 555
	%struct.DSOCacheEntry {
		i64 u0xf8718889d7058ae0, ; from name: aot-Avalonia.Markup.Xaml
		i64 u0x5afe641f0eb3380f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Avalonia.Markup.Xaml.dll.so
		ptr null; void* handle
	}, ; 556
	%struct.DSOCacheEntry {
		i64 u0xf87fb6188e2c6efd, ; from name: aot-MicroCom.Runtime
		i64 u0x6114909d114168f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-MicroCom.Runtime.dll.so
		ptr null; void* handle
	}, ; 557
	%struct.DSOCacheEntry {
		i64 u0xf8ef7c8304d8b7ad, ; from name: aot-MicroCom.Runtime.dll.so
		i64 u0x6114909d114168f8, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.28_name, ; name: libaot-MicroCom.Runtime.dll.so
		ptr null; void* handle
	}, ; 558
	%struct.DSOCacheEntry {
		i64 u0xf939906020c4837c, ; from name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel
		i64 u0x8a1d474b582068bb, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.37_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so
		ptr null; void* handle
	}, ; 559
	%struct.DSOCacheEntry {
		i64 u0xf9cf3eb6b014d601, ; from name: System.Private.Xml.so
		i64 u0x52bbd048717682d4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.61_name, ; name: libaot-System.Private.Xml.dll.so
		ptr null; void* handle
	}, ; 560
	%struct.DSOCacheEntry {
		i64 u0xf9ebb9dec3ac46d7, ; from name: libaot-System.ComponentModel.Annotations
		i64 u0xbf7d944f85fcd72c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-System.ComponentModel.Annotations.dll.so
		ptr null; void* handle
	}, ; 561
	%struct.DSOCacheEntry {
		i64 u0xfa7fdaf486654464, ; from name: aot-Avalonia.DesignerSupport.so
		i64 u0xfc800994bb34a441, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Avalonia.DesignerSupport.dll.so
		ptr null; void* handle
	}, ; 562
	%struct.DSOCacheEntry {
		i64 u0xfbe99333ee5a53d9, ; from name: Avalonia.Vulkan
		i64 u0xa7f15d3a1f546d9b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.21_name, ; name: libaot-Avalonia.Vulkan.dll.so
		ptr null; void* handle
	}, ; 563
	%struct.DSOCacheEntry {
		i64 u0xfc4186c2448201c7, ; from name: Avalonia.Dialogs
		i64 u0x0e88e656cbbcbbc6, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.15_name, ; name: libaot-Avalonia.Dialogs.dll.so
		ptr null; void* handle
	}, ; 564
	%struct.DSOCacheEntry {
		i64 u0xfc6c9bea56ea680c, ; from name: Xamarin.AndroidX.Lifecycle.Common.so
		i64 u0xc25aa808516eb94a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.dll.so
		ptr null; void* handle
	}, ; 565
	%struct.DSOCacheEntry {
		i64 u0xfc70c50e7e4385e2, ; from name: Avalonia.Skia
		i64 u0xce3991481c3a2f14, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.25_name, ; name: libaot-Avalonia.Skia.dll.so
		ptr null; void* handle
	}, ; 566
	%struct.DSOCacheEntry {
		i64 u0xfc800994bb34a441, ; from name: libaot-Avalonia.DesignerSupport.dll.so
		i64 u0xfc800994bb34a441, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.14_name, ; name: libaot-Avalonia.DesignerSupport.dll.so
		ptr null; void* handle
	}, ; 567
	%struct.DSOCacheEntry {
		i64 u0xfc99ea2a0aaa809c, ; from name: System.ComponentModel.Annotations.so
		i64 u0xbf7d944f85fcd72c, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.45_name, ; name: libaot-System.ComponentModel.Annotations.dll.so
		ptr null; void* handle
	}, ; 568
	%struct.DSOCacheEntry {
		i64 u0xfd583f7657b6a1cb, ; from name: Xamarin.AndroidX.Fragment
		i64 u0x8ab6d3431da5497e, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.34_name, ; name: libaot-Xamarin.AndroidX.Fragment.dll.so
		ptr null; void* handle
	}, ; 569
	%struct.DSOCacheEntry {
		i64 u0xfdb9df46aedd5238, ; from name: libaot-Xamarin.AndroidX.AppCompat.so
		i64 u0x42c7eb0880ff24a4, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.31_name, ; name: libaot-Xamarin.AndroidX.AppCompat.dll.so
		ptr null; void* handle
	}, ; 570
	%struct.DSOCacheEntry {
		i64 u0xfddbe9695626a7f5, ; from name: Xamarin.AndroidX.Lifecycle.Common
		i64 u0xc25aa808516eb94a, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.35_name, ; name: libaot-Xamarin.AndroidX.Lifecycle.Common.dll.so
		ptr null; void* handle
	}, ; 571
	%struct.DSOCacheEntry {
		i64 u0xfdf2eea75962e071, ; from name: HarfBuzzSharp.so
		i64 u0x34fa94470888dd75, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.27_name, ; name: libaot-HarfBuzzSharp.dll.so
		ptr null; void* handle
	}, ; 572
	%struct.DSOCacheEntry {
		i64 u0xfe7484c7056f3117, ; from name: libaot-Xamarin.AndroidX.Loader.so
		i64 u0x74b0aefe8f467d50, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.38_name, ; name: libaot-Xamarin.AndroidX.Loader.dll.so
		ptr null; void* handle
	}, ; 573
	%struct.DSOCacheEntry {
		i64 u0xfe7538e4cca3352f, ; from name: aot-System.ComponentModel.Primitives.so
		i64 u0xccde8a4563eee10b, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.46_name, ; name: libaot-System.ComponentModel.Primitives.dll.so
		ptr null; void* handle
	}, ; 574
	%struct.DSOCacheEntry {
		i64 u0xff35f69531a6f1fe, ; from name: Avalonia.Markup.Xaml.so
		i64 u0x5afe641f0eb3380f, ; uint64_t real_name_hash
		i1 false, ; bool ignore
		i1 false, ; bool is_jni_library
		ptr @.DSOCacheEntry.16_name, ; name: libaot-Avalonia.Markup.Xaml.dll.so
		ptr null; void* handle
	} ; 575
], align 8

@dso_apk_entries = dso_local local_unnamed_addr global [73 x %struct.DSOApkEntry] zeroinitializer, align 8

; Bundled assembly name buffers, all empty (unused when assembly stores are enabled)
@bundled_assemblies = dso_local local_unnamed_addr global [0 x %struct.XamarinAndroidBundledAssembly] zeroinitializer, align 8

@assembly_store_bundled_assemblies = dso_local local_unnamed_addr global [64 x %struct.AssemblyStoreSingleAssemblyRuntimeData] zeroinitializer, align 8

@assembly_store = dso_local local_unnamed_addr global %struct.AssemblyStoreRuntimeData {
	ptr null, ; uint8_t* data_start
	i32 0, ; uint32_t assembly_count
	i32 0, ; uint32_t index_entry_count
	ptr null; AssemblyStoreAssemblyDescriptor* assemblies
}, align 8

; Strings
@.env.0 = private unnamed_addr constant [7 x i8] c"normal\00", align 1

; Application environment variables name:value pairs
@.env.var.0 = private unnamed_addr constant [15 x i8] c"MONO_GC_PARAMS\00", align 1
@.env.var.1 = private unnamed_addr constant [21 x i8] c"major=marksweep-conc\00", align 1
@.env.var.2 = private unnamed_addr constant [28 x i8] c"XA_HTTP_CLIENT_HANDLER_TYPE\00", align 1
@.env.var.3 = private unnamed_addr constant [42 x i8] c"Xamarin.Android.Net.AndroidMessageHandler\00", align 1

;ApplicationConfig
@.ApplicationConfig.0_android_package_name = private unnamed_addr constant [14 x i8] c"YRM100.Reader\00", align 1

;DSOCacheEntry
@.DSOCacheEntry.0_name = private unnamed_addr constant [34 x i8] c"libSystem.Globalization.Native.so\00", align 1
@.DSOCacheEntry.1_name = private unnamed_addr constant [35 x i8] c"libSystem.IO.Compression.Native.so\00", align 1
@.DSOCacheEntry.2_name = private unnamed_addr constant [20 x i8] c"libSystem.Native.so\00", align 1
@.DSOCacheEntry.3_name = private unnamed_addr constant [50 x i8] c"libSystem.Security.Cryptography.Native.Android.so\00", align 1
@.DSOCacheEntry.4_name = private unnamed_addr constant [35 x i8] c"libmono-component-marshal-ilgen.so\00", align 1
@.DSOCacheEntry.5_name = private unnamed_addr constant [19 x i8] c"libmonosgen-2.0.so\00", align 1
@.DSOCacheEntry.6_name = private unnamed_addr constant [16 x i8] c"libmonodroid.so\00", align 1
@.DSOCacheEntry.7_name = private unnamed_addr constant [20 x i8] c"libHarfBuzzSharp.so\00", align 1
@.DSOCacheEntry.8_name = private unnamed_addr constant [16 x i8] c"libSkiaSharp.so\00", align 1
@.DSOCacheEntry.9_name = private unnamed_addr constant [51 x i8] c"libaot-_Microsoft.Android.Resource.Designer.dll.so\00", align 1
@.DSOCacheEntry.10_name = private unnamed_addr constant [30 x i8] c"libaot-Yrm100.Protocol.dll.so\00", align 1
@.DSOCacheEntry.11_name = private unnamed_addr constant [28 x i8] c"libaot-YRM100.Reader.dll.so\00", align 1
@.DSOCacheEntry.12_name = private unnamed_addr constant [28 x i8] c"libaot-Avalonia.Base.dll.so\00", align 1
@.DSOCacheEntry.13_name = private unnamed_addr constant [32 x i8] c"libaot-Avalonia.Controls.dll.so\00", align 1
@.DSOCacheEntry.14_name = private unnamed_addr constant [39 x i8] c"libaot-Avalonia.DesignerSupport.dll.so\00", align 1
@.DSOCacheEntry.15_name = private unnamed_addr constant [31 x i8] c"libaot-Avalonia.Dialogs.dll.so\00", align 1
@.DSOCacheEntry.16_name = private unnamed_addr constant [35 x i8] c"libaot-Avalonia.Markup.Xaml.dll.so\00", align 1
@.DSOCacheEntry.17_name = private unnamed_addr constant [30 x i8] c"libaot-Avalonia.Markup.dll.so\00", align 1
@.DSOCacheEntry.18_name = private unnamed_addr constant [29 x i8] c"libaot-Avalonia.Metal.dll.so\00", align 1
@.DSOCacheEntry.19_name = private unnamed_addr constant [32 x i8] c"libaot-Avalonia.MicroCom.dll.so\00", align 1
@.DSOCacheEntry.20_name = private unnamed_addr constant [30 x i8] c"libaot-Avalonia.OpenGL.dll.so\00", align 1
@.DSOCacheEntry.21_name = private unnamed_addr constant [30 x i8] c"libaot-Avalonia.Vulkan.dll.so\00", align 1
@.DSOCacheEntry.22_name = private unnamed_addr constant [23 x i8] c"libaot-Avalonia.dll.so\00", align 1
@.DSOCacheEntry.23_name = private unnamed_addr constant [31 x i8] c"libaot-Avalonia.Android.dll.so\00", align 1
@.DSOCacheEntry.24_name = private unnamed_addr constant [39 x i8] c"libaot-Avalonia.Remote.Protocol.dll.so\00", align 1
@.DSOCacheEntry.25_name = private unnamed_addr constant [28 x i8] c"libaot-Avalonia.Skia.dll.so\00", align 1
@.DSOCacheEntry.26_name = private unnamed_addr constant [37 x i8] c"libaot-Avalonia.Themes.Fluent.dll.so\00", align 1
@.DSOCacheEntry.27_name = private unnamed_addr constant [28 x i8] c"libaot-HarfBuzzSharp.dll.so\00", align 1
@.DSOCacheEntry.28_name = private unnamed_addr constant [31 x i8] c"libaot-MicroCom.Runtime.dll.so\00", align 1
@.DSOCacheEntry.29_name = private unnamed_addr constant [24 x i8] c"libaot-SkiaSharp.dll.so\00", align 1
@.DSOCacheEntry.30_name = private unnamed_addr constant [40 x i8] c"libaot-Xamarin.AndroidX.Activity.dll.so\00", align 1
@.DSOCacheEntry.31_name = private unnamed_addr constant [41 x i8] c"libaot-Xamarin.AndroidX.AppCompat.dll.so\00", align 1
@.DSOCacheEntry.32_name = private unnamed_addr constant [36 x i8] c"libaot-Xamarin.AndroidX.Core.dll.so\00", align 1
@.DSOCacheEntry.33_name = private unnamed_addr constant [44 x i8] c"libaot-Xamarin.AndroidX.DrawerLayout.dll.so\00", align 1
@.DSOCacheEntry.34_name = private unnamed_addr constant [40 x i8] c"libaot-Xamarin.AndroidX.Fragment.dll.so\00", align 1
@.DSOCacheEntry.35_name = private unnamed_addr constant [48 x i8] c"libaot-Xamarin.AndroidX.Lifecycle.Common.dll.so\00", align 1
@.DSOCacheEntry.36_name = private unnamed_addr constant [55 x i8] c"libaot-Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so\00", align 1
@.DSOCacheEntry.37_name = private unnamed_addr constant [51 x i8] c"libaot-Xamarin.AndroidX.Lifecycle.ViewModel.dll.so\00", align 1
@.DSOCacheEntry.38_name = private unnamed_addr constant [38 x i8] c"libaot-Xamarin.AndroidX.Loader.dll.so\00", align 1
@.DSOCacheEntry.39_name = private unnamed_addr constant [42 x i8] c"libaot-Xamarin.AndroidX.SavedState.dll.so\00", align 1
@.DSOCacheEntry.40_name = private unnamed_addr constant [36 x i8] c"libaot-Xamarin.Kotlin.StdLib.dll.so\00", align 1
@.DSOCacheEntry.41_name = private unnamed_addr constant [44 x i8] c"libaot-System.Collections.Concurrent.dll.so\00", align 1
@.DSOCacheEntry.42_name = private unnamed_addr constant [44 x i8] c"libaot-System.Collections.NonGeneric.dll.so\00", align 1
@.DSOCacheEntry.43_name = private unnamed_addr constant [45 x i8] c"libaot-System.Collections.Specialized.dll.so\00", align 1
@.DSOCacheEntry.44_name = private unnamed_addr constant [33 x i8] c"libaot-System.Collections.dll.so\00", align 1
@.DSOCacheEntry.45_name = private unnamed_addr constant [48 x i8] c"libaot-System.ComponentModel.Annotations.dll.so\00", align 1
@.DSOCacheEntry.46_name = private unnamed_addr constant [47 x i8] c"libaot-System.ComponentModel.Primitives.dll.so\00", align 1
@.DSOCacheEntry.47_name = private unnamed_addr constant [50 x i8] c"libaot-System.ComponentModel.TypeConverter.dll.so\00", align 1
@.DSOCacheEntry.48_name = private unnamed_addr constant [36 x i8] c"libaot-System.ComponentModel.dll.so\00", align 1
@.DSOCacheEntry.49_name = private unnamed_addr constant [29 x i8] c"libaot-System.Console.dll.so\00", align 1
@.DSOCacheEntry.50_name = private unnamed_addr constant [50 x i8] c"libaot-System.Diagnostics.DiagnosticSource.dll.so\00", align 1
@.DSOCacheEntry.51_name = private unnamed_addr constant [45 x i8] c"libaot-System.Diagnostics.TraceSource.dll.so\00", align 1
@.DSOCacheEntry.52_name = private unnamed_addr constant [36 x i8] c"libaot-System.IO.Compression.dll.so\00", align 1
@.DSOCacheEntry.53_name = private unnamed_addr constant [38 x i8] c"libaot-System.Linq.Expressions.dll.so\00", align 1
@.DSOCacheEntry.54_name = private unnamed_addr constant [26 x i8] c"libaot-System.Linq.dll.so\00", align 1
@.DSOCacheEntry.55_name = private unnamed_addr constant [28 x i8] c"libaot-System.Memory.dll.so\00", align 1
@.DSOCacheEntry.56_name = private unnamed_addr constant [40 x i8] c"libaot-System.Net.NameResolution.dll.so\00", align 1
@.DSOCacheEntry.57_name = private unnamed_addr constant [36 x i8] c"libaot-System.Net.Primitives.dll.so\00", align 1
@.DSOCacheEntry.58_name = private unnamed_addr constant [33 x i8] c"libaot-System.Net.Sockets.dll.so\00", align 1
@.DSOCacheEntry.59_name = private unnamed_addr constant [33 x i8] c"libaot-System.ObjectModel.dll.so\00", align 1
@.DSOCacheEntry.60_name = private unnamed_addr constant [33 x i8] c"libaot-System.Private.Uri.dll.so\00", align 1
@.DSOCacheEntry.61_name = private unnamed_addr constant [33 x i8] c"libaot-System.Private.Xml.dll.so\00", align 1
@.DSOCacheEntry.62_name = private unnamed_addr constant [45 x i8] c"libaot-System.Runtime.InteropServices.dll.so\00", align 1
@.DSOCacheEntry.63_name = private unnamed_addr constant [29 x i8] c"libaot-System.Runtime.dll.so\00", align 1
@.DSOCacheEntry.64_name = private unnamed_addr constant [43 x i8] c"libaot-System.Security.Cryptography.dll.so\00", align 1
@.DSOCacheEntry.65_name = private unnamed_addr constant [45 x i8] c"libaot-System.Text.RegularExpressions.dll.so\00", align 1
@.DSOCacheEntry.66_name = private unnamed_addr constant [31 x i8] c"libaot-System.Threading.dll.so\00", align 1
@.DSOCacheEntry.67_name = private unnamed_addr constant [21 x i8] c"libaot-System.dll.so\00", align 1
@.DSOCacheEntry.68_name = private unnamed_addr constant [26 x i8] c"libaot-netstandard.dll.so\00", align 1
@.DSOCacheEntry.69_name = private unnamed_addr constant [27 x i8] c"libaot-Java.Interop.dll.so\00", align 1
@.DSOCacheEntry.70_name = private unnamed_addr constant [35 x i8] c"libaot-Mono.Android.Runtime.dll.so\00", align 1
@.DSOCacheEntry.71_name = private unnamed_addr constant [27 x i8] c"libaot-Mono.Android.dll.so\00", align 1
@.DSOCacheEntry.72_name = private unnamed_addr constant [37 x i8] c"libaot-System.Private.CoreLib.dll.so\00", align 1

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
