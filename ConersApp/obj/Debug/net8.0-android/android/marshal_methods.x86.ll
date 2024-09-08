; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [419 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [832 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 26230656, ; 3: Microsoft.Extensions.DependencyModel => 0x1903f80 => 246
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 337
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 371
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39109920, ; 7: Newtonsoft.Json.dll => 0x254c520 => 277
	i32 39485524, ; 8: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 9: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 10: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 11: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 412
	i32 68219467, ; 12: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 13: Microsoft.Maui.Graphics.dll => 0x44bb714 => 274
	i32 82292897, ; 14: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83768722, ; 15: Microsoft.AspNetCore.Cryptography.Internal => 0x4fe3592 => 192
	i32 101534019, ; 16: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 355
	i32 117431740, ; 17: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 18: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 355
	i32 122350210, ; 19: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 20: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 375
	i32 142721839, ; 21: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 22: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 23: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 24: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 311
	i32 176265551, ; 25: System.ServiceProcess => 0xa81994f => 132
	i32 176714968, ; 26: Microsoft.AspNetCore.WebUtilities.dll => 0xa8874d8 => 225
	i32 179062648, ; 27: Microsoft.AspNetCore.Mvc.Razor => 0xaac4778 => 214
	i32 182336117, ; 28: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 357
	i32 184328833, ; 29: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 30: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 409
	i32 199333315, ; 31: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 410
	i32 204291415, ; 32: Syncfusion.Blazor.Data => 0xc2d3d57 => 281
	i32 205061960, ; 33: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 34: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 309
	i32 220171995, ; 35: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 36: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 331
	i32 230752869, ; 37: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 38: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 39: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 40: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 252019042, ; 41: Microsoft.AspNetCore.Razor.Runtime => 0xf058162 => 221
	i32 254259026, ; 42: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 186
	i32 261689757, ; 43: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 314
	i32 262645399, ; 44: Blazorise => 0xfa7a697 => 173
	i32 276479776, ; 45: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 46: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 333
	i32 280482487, ; 47: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 330
	i32 280992041, ; 48: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 381
	i32 291076382, ; 49: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 50: System.Net.Ping.dll => 0x11d123fd => 69
	i32 300686228, ; 51: Microsoft.AspNetCore.Authentication.Abstractions.dll => 0x11ec1b94 => 182
	i32 310070955, ; 52: Microsoft.AspNetCore.Mvc => 0x127b4eab => 206
	i32 317674968, ; 53: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 409
	i32 318968648, ; 54: Xamarin.AndroidX.Activity.dll => 0x13031348 => 300
	i32 321597661, ; 55: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 56: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 394
	i32 336788001, ; 57: Microsoft.AspNetCore.Antiforgery => 0x1412fa21 => 181
	i32 338324308, ; 58: Microsoft.AspNetCore.Mvc.DataAnnotations.dll => 0x142a6b54 => 211
	i32 342366114, ; 59: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 332
	i32 344827588, ; 60: Microsoft.AspNetCore.ResponseCaching.Abstractions => 0x148da6c4 => 222
	i32 356389973, ; 61: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 393
	i32 360082299, ; 62: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 63: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 64: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 65: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 66: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 384051609, ; 67: Microsoft.AspNetCore.Routing.dll => 0x16e42999 => 223
	i32 385762202, ; 68: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 69: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 70: _Microsoft.Android.Resource.Designer => 0x17969339 => 415
	i32 403441872, ; 71: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 72: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 405
	i32 441335492, ; 73: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 315
	i32 442565967, ; 74: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 75: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 328
	i32 451504562, ; 76: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 77: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 78: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 79: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 80: System.dll => 0x1bff388e => 164
	i32 476646585, ; 81: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 330
	i32 486930444, ; 82: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 343
	i32 490002678, ; 83: Microsoft.AspNetCore.Hosting.Server.Abstractions.dll => 0x1d34d8f6 => 197
	i32 498788369, ; 84: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 85: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 392
	i32 503918385, ; 86: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 386
	i32 513247710, ; 87: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 260
	i32 526420162, ; 88: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 89: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 375
	i32 530272170, ; 90: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 91: Microsoft.Extensions.Logging => 0x20216150 => 255
	i32 540030774, ; 92: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 93: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 94: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 95: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 96: Jsr305Binding => 0x213954e7 => 368
	i32 559063233, ; 97: Microsoft.AspNetCore.Razor.Language.dll => 0x2152a0c1 => 220
	i32 569601784, ; 98: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 366
	i32 571435654, ; 99: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 249
	i32 577335427, ; 100: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 101: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 400
	i32 601371474, ; 102: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 103: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 104: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 105: Xamarin.AndroidX.CustomView => 0x2568904f => 320
	i32 627931235, ; 106: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 398
	i32 639843206, ; 107: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 326
	i32 643868501, ; 108: System.Net => 0x2660a755 => 81
	i32 662205335, ; 109: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 110: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 362
	i32 666292255, ; 111: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 307
	i32 672442732, ; 112: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 113: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 114: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 380
	i32 690569205, ; 115: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 116: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 377
	i32 693804605, ; 117: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 118: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 119: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 372
	i32 700358131, ; 120: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 121: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 395
	i32 709152836, ; 122: System.Security.Cryptography.Pkcs.dll => 0x2a44d044 => 292
	i32 709557578, ; 123: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 383
	i32 720511267, ; 124: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 376
	i32 722857257, ; 125: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 724146010, ; 126: Microsoft.AspNetCore.Authorization.Policy.dll => 0x2b29975a => 185
	i32 730737221, ; 127: Microsoft.AspNetCore.Mvc.Razor.dll => 0x2b8e2a45 => 214
	i32 734129105, ; 128: Microsoft.AspNetCore.Razor => 0x2bc1ebd1 => 219
	i32 735137430, ; 129: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 130: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 131: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 297
	i32 759454413, ; 132: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 133: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 134: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 135: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 404
	i32 789151979, ; 136: Microsoft.Extensions.Options => 0x2f0980eb => 259
	i32 790371945, ; 137: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 321
	i32 804008546, ; 138: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 190
	i32 804250400, ; 139: Blazorise.Animate => 0x2fefe320 => 174
	i32 804715423, ; 140: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 141: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 335
	i32 809499826, ; 142: Microsoft.AspNetCore.Mvc.ViewFeatures => 0x303ffcb2 => 218
	i32 809851609, ; 143: System.Drawing.Common.dll => 0x30455ad9 => 289
	i32 818807279, ; 144: Microsoft.AspNetCore.Mvc.Cors.dll => 0x30ce01ef => 210
	i32 823281589, ; 145: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 146: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 147: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 148: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 149: Xamarin.AndroidX.Print => 0x3246f6cd => 348
	i32 872446091, ; 150: Microsoft.AspNetCore.Razor.dll => 0x3400788b => 219
	i32 873119928, ; 151: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 152: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 153: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 154: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 155: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 911441577, ; 156: Blazorise.Licensing.dll => 0x36537ea9 => 175
	i32 926902833, ; 157: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 407
	i32 928116545, ; 158: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 371
	i32 940221205, ; 159: Microsoft.CodeAnalysis.Razor => 0x380aa315 => 228
	i32 952186615, ; 160: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 161: Newtonsoft.Json => 0x38f24a24 => 277
	i32 956575887, ; 162: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 376
	i32 966729478, ; 163: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 369
	i32 967690846, ; 164: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 332
	i32 972467304, ; 165: Microsoft.AspNetCore.Razor.Language => 0x39f6ac68 => 220
	i32 975236339, ; 166: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 167: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 168: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 169: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 170: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 171: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 172: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 251
	i32 1001831731, ; 173: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1009232667, ; 174: Microsoft.AspNetCore.Html.Abstractions.dll => 0x3c27ab1b => 198
	i32 1012816738, ; 175: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 352
	i32 1019214401, ; 176: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 177: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 245
	i32 1029334545, ; 178: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 382
	i32 1031528504, ; 179: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 370
	i32 1035644815, ; 180: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 305
	i32 1036536393, ; 181: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 182: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 183: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 339
	i32 1054642859, ; 184: Microsoft.AspNetCore.Html.Abstractions => 0x3edc92ab => 198
	i32 1067306892, ; 185: GoogleGson => 0x3f9dcf8c => 178
	i32 1082857460, ; 186: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 187: Xamarin.Kotlin.StdLib => 0x409e66d8 => 373
	i32 1095180906, ; 188: Microsoft.AspNet.Identity.Core => 0x4147226a => 179
	i32 1098259244, ; 189: System => 0x41761b2c => 164
	i32 1099692271, ; 190: Microsoft.DotNet.PlatformAbstractions => 0x418bf8ef => 230
	i32 1106973742, ; 191: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 241
	i32 1110309514, ; 192: Microsoft.Extensions.Hosting.Abstractions => 0x422dfa8a => 252
	i32 1112354281, ; 193: Microsoft.AspNetCore.Authentication.Abstractions => 0x424d2de9 => 182
	i32 1118262833, ; 194: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 395
	i32 1121599056, ; 195: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 338
	i32 1127624469, ; 196: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 257
	i32 1138436374, ; 197: Microsoft.Data.SqlClient.dll => 0x43db2916 => 229
	i32 1145483052, ; 198: System.Windows.Extensions.dll => 0x4446af2c => 295
	i32 1149092582, ; 199: Xamarin.AndroidX.Window => 0x447dc2e6 => 365
	i32 1157931901, ; 200: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 232
	i32 1168523401, ; 201: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 401
	i32 1170634674, ; 202: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 203: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 247
	i32 1175144683, ; 204: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 361
	i32 1178241025, ; 205: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 346
	i32 1186231468, ; 206: Newtonsoft.Json.Bson.dll => 0x46b474ac => 278
	i32 1202000627, ; 207: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 232
	i32 1203215381, ; 208: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 399
	i32 1204270330, ; 209: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 307
	i32 1204575371, ; 210: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 237
	i32 1208641965, ; 211: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 212: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1220193633, ; 213: Microsoft.Net.Http.Headers => 0x48baad61 => 275
	i32 1224544870, ; 214: Microsoft.AspNetCore.Mvc.RazorPages.dll => 0x48fd1266 => 216
	i32 1234928153, ; 215: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 397
	i32 1236289705, ; 216: Microsoft.AspNetCore.Hosting.Server.Abstractions => 0x49b048a9 => 197
	i32 1243150071, ; 217: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 366
	i32 1253011324, ; 218: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 219: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 381
	i32 1264511973, ; 220: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 356
	i32 1266143716, ; 221: Microsoft.AspNetCore.Mvc.TagHelpers.dll => 0x4b77d1e4 => 217
	i32 1267360935, ; 222: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 360
	i32 1267908789, ; 223: Microsoft.AspNetCore.Routing => 0x4b92c0b5 => 223
	i32 1273260888, ; 224: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 312
	i32 1275534314, ; 225: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 377
	i32 1278448581, ; 226: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 304
	i32 1291457549, ; 227: EntityFramework.SqlServer.dll => 0x4cfa140d => 176
	i32 1293217323, ; 228: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 323
	i32 1309188875, ; 229: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 230: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 365
	i32 1324164729, ; 231: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 232: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 233: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 234: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 411
	i32 1376866003, ; 235: Xamarin.AndroidX.SavedState => 0x52114ed3 => 352
	i32 1379779777, ; 236: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1384052088, ; 237: Syncfusion.Blazor.Core => 0x527ef578 => 280
	i32 1402170036, ; 238: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 239: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 316
	i32 1408764838, ; 240: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 241: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 242: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 243: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 379
	i32 1434145427, ; 244: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 245: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 369
	i32 1439761251, ; 246: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 247: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 248: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1454105418, ; 249: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 248
	i32 1457743152, ; 250: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 251: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1460893475, ; 252: System.IdentityModel.Tokens.Jwt => 0x57137723 => 290
	i32 1461004990, ; 253: es\Microsoft.Maui.Controls.resources => 0x57152abe => 385
	i32 1461234159, ; 254: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 255: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 256: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 257: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 306
	i32 1470490898, ; 258: Microsoft.Extensions.Primitives => 0x57a5e912 => 260
	i32 1479771757, ; 259: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 260: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 261: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 262: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 353
	i32 1493001747, ; 263: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 389
	i32 1494371055, ; 264: Microsoft.AspNet.Identity.Core.dll => 0x59124aef => 179
	i32 1498168481, ; 265: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 263
	i32 1502141782, ; 266: Syncfusion.Blazor.SplitButtons.dll => 0x5988dd56 => 285
	i32 1514721132, ; 267: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 384
	i32 1521091094, ; 268: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 251
	i32 1527852131, ; 269: Microsoft.AspNetCore.Mvc.Localization.dll => 0x5b112c63 => 213
	i32 1536373174, ; 270: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 271: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 272: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1546581739, ; 273: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 190
	i32 1550322496, ; 274: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 275: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 404
	i32 1565862583, ; 276: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 277: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1566350289, ; 278: Microsoft.AspNetCore.Mvc.Cors => 0x5d5c9bd1 => 210
	i32 1573704789, ; 279: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 280: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 281: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 322
	i32 1592978981, ; 282: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 283: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 370
	i32 1601112923, ; 284: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 285: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 286: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 287: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 342
	i32 1622358360, ; 288: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 289: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 364
	i32 1625077857, ; 290: Microsoft.AspNetCore.Antiforgery.dll => 0x60dcb861 => 181
	i32 1628113371, ; 291: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x610b09db => 266
	i32 1628395155, ; 292: Microsoft.AspNet.Identity.EntityFramework.dll => 0x610f5693 => 180
	i32 1632842087, ; 293: Microsoft.Extensions.Configuration.Json => 0x61533167 => 242
	i32 1635184631, ; 294: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 326
	i32 1636350590, ; 295: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 319
	i32 1639515021, ; 296: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 297: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 298: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654881142, ; 299: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 189
	i32 1657153582, ; 300: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 301: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 358
	i32 1658251792, ; 302: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 367
	i32 1660418603, ; 303: Blazorise.Animate.dll => 0x62f7fa2b => 174
	i32 1670060433, ; 304: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 314
	i32 1675553242, ; 305: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 306: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 307: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 308: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1681164956, ; 309: BackendClassLibrary => 0x64348a9c => 413
	i32 1689493916, ; 310: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 231
	i32 1691477237, ; 311: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 312: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 313: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 374
	i32 1701541528, ; 314: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 315: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 335
	i32 1726116996, ; 316: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 317: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 318: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 310
	i32 1736233607, ; 319: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 402
	i32 1743415430, ; 320: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 380
	i32 1744735666, ; 321: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 322: System.IO.Pipelines.dll => 0x68139a0d => 291
	i32 1746316138, ; 323: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 324: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 325: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1760259689, ; 326: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 188
	i32 1763938596, ; 327: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 328: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 329: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 357
	i32 1767075704, ; 330: Microsoft.Extensions.Configuration.UserSecrets.dll => 0x69536f78 => 243
	i32 1770582343, ; 331: Microsoft.Extensions.Logging.dll => 0x6988f147 => 255
	i32 1776026572, ; 332: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 333: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 334: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 335: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 396
	i32 1788241197, ; 336: Xamarin.AndroidX.Fragment => 0x6a96652d => 328
	i32 1788562814, ; 337: Syncfusion.Blazor.Core.dll => 0x6a9b4d7e => 280
	i32 1793755602, ; 338: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 388
	i32 1794500907, ; 339: Microsoft.Identity.Client.dll => 0x6af5e92b => 262
	i32 1808609942, ; 340: Xamarin.AndroidX.Loader => 0x6bcd3296 => 342
	i32 1813058853, ; 341: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 373
	i32 1813201214, ; 342: Xamarin.Google.Android.Material => 0x6c13413e => 367
	i32 1818569960, ; 343: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 347
	i32 1818787751, ; 344: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1819327070, ; 345: Microsoft.AspNetCore.Http.Features.dll => 0x6c70ba5e => 202
	i32 1820883333, ; 346: Microsoft.AspNetCore.Cryptography.Internal.dll => 0x6c887985 => 192
	i32 1824175904, ; 347: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 348: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 349: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 256
	i32 1829150748, ; 350: System.Windows.Extensions => 0x6d06a01c => 295
	i32 1842015223, ; 351: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 408
	i32 1847515442, ; 352: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 297
	i32 1853025655, ; 353: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 405
	i32 1858542181, ; 354: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 355: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1871986876, ; 356: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0x6f9440bc => 266
	i32 1875935024, ; 357: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 387
	i32 1879696579, ; 358: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 359: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 308
	i32 1888955245, ; 360: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 361: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1894524299, ; 362: Microsoft.DotNet.PlatformAbstractions.dll => 0x70ec258b => 230
	i32 1895982436, ; 363: Syncfusion.Blazor.Inputs => 0x71026564 => 282
	i32 1898237753, ; 364: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 365: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 366: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1921968366, ; 367: Microsoft.AspNetCore.Mvc.Formatters.Json => 0x728ee8ee => 212
	i32 1928288591, ; 368: Microsoft.AspNetCore.Http.Abstractions => 0x72ef594f => 200
	i32 1939592360, ; 369: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953680223, ; 370: Microsoft.AspNetCore.DataProtection.Abstractions => 0x7472cb5f => 194
	i32 1956758971, ; 371: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 372: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 354
	i32 1967298789, ; 373: Microsoft.AspNetCore.Diagnostics.Abstractions.dll => 0x754298e5 => 195
	i32 1968388702, ; 374: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 238
	i32 1983156543, ; 375: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 374
	i32 1985761444, ; 376: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 299
	i32 1986222447, ; 377: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 267
	i32 1998845772, ; 378: Microsoft.EntityFrameworkCore.InMemory.dll => 0x7723f74c => 233
	i32 2003115576, ; 379: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 384
	i32 2011961780, ; 380: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 381: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 339
	i32 2025202353, ; 382: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 379
	i32 2031763787, ; 383: Xamarin.Android.Glide => 0x791a414b => 296
	i32 2045470958, ; 384: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 385: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 240
	i32 2055257422, ; 386: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 334
	i32 2060060697, ; 387: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 388: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 383
	i32 2069514766, ; 389: Newtonsoft.Json.Bson => 0x7b5a4a0e => 278
	i32 2070888862, ; 390: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 391: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 250
	i32 2075706075, ; 392: Microsoft.AspNetCore.Http.Abstractions.dll => 0x7bb8c2db => 200
	i32 2076659885, ; 393: Microsoft.Extensions.WebEncoders => 0x7bc750ad => 261
	i32 2079903147, ; 394: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2085039813, ; 395: System.Security.Cryptography.Xml.dll => 0x7c472ec5 => 293
	i32 2090596640, ; 396: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2092734687, ; 397: Microsoft.AspNetCore.JsonPatch => 0x7cbc98df => 203
	i32 2113455254, ; 398: Microsoft.AspNetCore.Mvc.ApiExplorer.dll => 0x7df8c496 => 208
	i32 2120057885, ; 399: Microsoft.AspNetCore.Mvc.Formatters.Json.dll => 0x7e5d841d => 212
	i32 2127167465, ; 400: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 401: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 402: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 403: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 404: Microsoft.Maui => 0x80bd55ad => 272
	i32 2169148018, ; 405: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 391
	i32 2181898931, ; 406: Microsoft.Extensions.Options.dll => 0x820d22b3 => 259
	i32 2182738860, ; 407: Microsoft.AspNetCore.Mvc.Core.dll => 0x8219f3ac => 209
	i32 2192057212, ; 408: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 256
	i32 2193016926, ; 409: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2197979891, ; 410: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 246
	i32 2201107256, ; 411: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 378
	i32 2201231467, ; 412: System.Net.Http => 0x8334206b => 64
	i32 2204417087, ; 413: Microsoft.Extensions.ObjectPool => 0x8364bc3f => 258
	i32 2207618523, ; 414: it\Microsoft.Maui.Controls.resources => 0x839595db => 393
	i32 2217644978, ; 415: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 361
	i32 2222056684, ; 416: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2242871324, ; 417: Microsoft.AspNetCore.Http.dll => 0x85af801c => 199
	i32 2244775296, ; 418: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 343
	i32 2252106437, ; 419: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2252897993, ; 420: Microsoft.EntityFrameworkCore => 0x86487ec9 => 231
	i32 2253551641, ; 421: Microsoft.IdentityModel.Protocols => 0x86527819 => 265
	i32 2256313426, ; 422: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 423: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 424: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 239
	i32 2267999099, ; 425: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 298
	i32 2270573516, ; 426: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 387
	i32 2279755925, ; 427: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 350
	i32 2285293097, ; 428: Microsoft.AspNetCore.Mvc.Abstractions => 0x8836ce29 => 207
	i32 2291847450, ; 429: Microsoft.AspNetCore.DataProtection.dll => 0x889ad11a => 193
	i32 2293034957, ; 430: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 431: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 432: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 433: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 397
	i32 2305521784, ; 434: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 435: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 302
	i32 2320631194, ; 436: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2321784778, ; 437: Microsoft.AspNetCore.Mvc.Abstractions.dll => 0x8a639fca => 207
	i32 2336114998, ; 438: Microsoft.AspNetCore.Mvc.Localization => 0x8b3e4936 => 213
	i32 2340441535, ; 439: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 440: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 441: System.Net.Primitives => 0x8c40e0db => 70
	i32 2354730003, ; 442: Syncfusion.Licensing => 0x8c5a5413 => 287
	i32 2360546104, ; 443: Microsoft.AspNetCore.Localization.dll => 0x8cb31338 => 204
	i32 2368005991, ; 444: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 445: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 264
	i32 2371007202, ; 446: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 238
	i32 2378619854, ; 447: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 448: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 449: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 392
	i32 2401565422, ; 450: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 451: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 325
	i32 2411328690, ; 452: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 186
	i32 2421380589, ; 453: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 454: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 312
	i32 2427245696, ; 455: Microsoft.CodeAnalysis.Razor.dll => 0x90acd480 => 228
	i32 2427813419, ; 456: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 389
	i32 2435356389, ; 457: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 458: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2436099724, ; 459: Microsoft.EntityFrameworkCore.InMemory => 0x9133ee8c => 233
	i32 2442556106, ; 460: Microsoft.JSInterop.dll => 0x919672ca => 268
	i32 2451271121, ; 461: Microsoft.AspNetCore.Mvc.RazorPages => 0x921b6dd1 => 216
	i32 2454642406, ; 462: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458592288, ; 463: Microsoft.AspNetCore.Authentication.Core => 0x928b2420 => 183
	i32 2458678730, ; 464: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 465: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2462798629, ; 466: Blazorise.dll => 0x92cb5325 => 173
	i32 2465532216, ; 467: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 315
	i32 2471841756, ; 468: netstandard.dll => 0x93554fdc => 167
	i32 2472658475, ; 469: Syncfusion.Blazor.Popups => 0x9361c62b => 283
	i32 2475788418, ; 470: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 471: Microsoft.Maui.Controls => 0x93dba8a1 => 270
	i32 2483903535, ; 472: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 473: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 474: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 475: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 476: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 337
	i32 2522472828, ; 477: Xamarin.Android.Glide.dll => 0x9659e17c => 296
	i32 2528662365, ; 478: Microsoft.AspNetCore.JsonPatch.dll => 0x96b8535d => 203
	i32 2533808983, ; 479: Syncfusion.Blazor.Popups.dll => 0x9706db57 => 283
	i32 2537015816, ; 480: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 184
	i32 2538310050, ; 481: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 482: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 390
	i32 2562349572, ; 483: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 484: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 485: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 338
	i32 2581819634, ; 486: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 360
	i32 2585220780, ; 487: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 488: System.Net.Ping => 0x9a20430d => 69
	i32 2585813321, ; 489: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 187
	i32 2589602615, ; 490: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 491: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 247
	i32 2593268061, ; 492: Microsoft.AspNetCore.Routing.Abstractions.dll => 0x9a92215d => 224
	i32 2593496499, ; 493: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 399
	i32 2594125473, ; 494: Microsoft.AspNetCore.Hosting.Abstractions => 0x9a9f36a1 => 196
	i32 2605712449, ; 495: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 378
	i32 2611529777, ; 496: Microsoft.AspNetCore.Mvc.dll => 0x9ba8c831 => 206
	i32 2615233544, ; 497: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 329
	i32 2616218305, ; 498: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 257
	i32 2617129537, ; 499: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 500: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 501: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 319
	i32 2624644809, ; 502: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 324
	i32 2626831493, ; 503: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 394
	i32 2627185994, ; 504: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 505: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 506: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 333
	i32 2633959305, ; 507: Microsoft.AspNetCore.Http.Extensions.dll => 0x9cff0789 => 201
	i32 2634653062, ; 508: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 234
	i32 2640290731, ; 509: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 264
	i32 2641978034, ; 510: Blazorise.Licensing => 0x9d7962b2 => 175
	i32 2651809848, ; 511: Syncfusion.Blazor.SplitButtons => 0x9e0f6838 => 285
	i32 2663391936, ; 512: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 298
	i32 2663698177, ; 513: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 514: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 515: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 516: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 517: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2692077919, ; 518: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 189
	i32 2693849962, ; 519: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 520: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 358
	i32 2715334215, ; 521: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 522: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 523: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2722434549, ; 524: Microsoft.CodeAnalysis.dll => 0xa2450df5 => 226
	i32 2724373263, ; 525: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 526: Xamarin.AndroidX.Activity => 0xa2e0939b => 300
	i32 2735172069, ; 527: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 528: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 184
	i32 2737747696, ; 529: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 306
	i32 2740051746, ; 530: Microsoft.Identity.Client => 0xa351df22 => 262
	i32 2740948882, ; 531: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 532: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 533: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 400
	i32 2755643133, ; 534: Microsoft.EntityFrameworkCore.SqlServer => 0xa43fc6fd => 235
	i32 2758225723, ; 535: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 271
	i32 2764765095, ; 536: Microsoft.Maui.dll => 0xa4caf7a7 => 272
	i32 2765824710, ; 537: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 538: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 372
	i32 2778768386, ; 539: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 363
	i32 2779977773, ; 540: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 351
	i32 2785988530, ; 541: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 406
	i32 2788224221, ; 542: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 329
	i32 2801831435, ; 543: Microsoft.Maui.Graphics => 0xa7008e0b => 274
	i32 2803228030, ; 544: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 545: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 385
	i32 2810250172, ; 546: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 316
	i32 2819470561, ; 547: System.Xml.dll => 0xa80db4e1 => 163
	i32 2820942282, ; 548: MudBlazor.dll => 0xa82429ca => 276
	i32 2821205001, ; 549: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 550: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 351
	i32 2824502124, ; 551: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 552: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 398
	i32 2833784645, ; 553: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 205
	i32 2838993487, ; 554: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 340
	i32 2841355853, ; 555: System.Security.Permissions => 0xa95ba64d => 294
	i32 2847789619, ; 556: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 234
	i32 2849599387, ; 557: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2850549256, ; 558: Microsoft.AspNetCore.Http.Features => 0xa9e7ee08 => 202
	i32 2853208004, ; 559: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 363
	i32 2855708567, ; 560: Xamarin.AndroidX.Transition => 0xaa36a797 => 359
	i32 2861098320, ; 561: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 562: Microsoft.Maui.Essentials => 0xaa8a4878 => 273
	i32 2868557005, ; 563: Syncfusion.Licensing.dll => 0xaafab4cd => 287
	i32 2870099610, ; 564: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 301
	i32 2875164099, ; 565: Jsr305Binding.dll => 0xab5f85c3 => 368
	i32 2875220617, ; 566: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 567: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 327
	i32 2887636118, ; 568: System.Net.dll => 0xac1dd496 => 81
	i32 2892341533, ; 569: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 188
	i32 2899753641, ; 570: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 571: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 572: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 573: mscorlib.dll => 0xad2a79b6 => 166
	i32 2906598491, ; 574: Microsoft.AspNet.Identity.EntityFramework => 0xad3f2c5b => 180
	i32 2909740682, ; 575: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 576: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 250
	i32 2916751541, ; 577: EntityFramework => 0xadda18b5 => 177
	i32 2916838712, ; 578: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 364
	i32 2919462931, ; 579: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 580: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 303
	i32 2921417940, ; 581: System.Security.Cryptography.Xml => 0xae214cd4 => 293
	i32 2930358886, ; 582: Microsoft.AspNetCore.DataProtection.Abstractions.dll => 0xaea9ba66 => 194
	i32 2936416060, ; 583: System.Resources.Reader => 0xaf06273c => 98
	i32 2937463941, ; 584: RazorClassLibrary1 => 0xaf162485 => 414
	i32 2940926066, ; 585: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 586: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2944313911, ; 587: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 288
	i32 2959614098, ; 588: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 589: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 590: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978368250, ; 591: Microsoft.AspNetCore.Hosting.Abstractions.dll => 0xb1864afa => 196
	i32 2978675010, ; 592: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 323
	i32 2987532451, ; 593: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 354
	i32 2996646946, ; 594: Microsoft.AspNetCore.Http => 0xb29d3422 => 199
	i32 2996846495, ; 595: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 336
	i32 3012788804, ; 596: System.Configuration.ConfigurationManager => 0xb3938244 => 288
	i32 3016983068, ; 597: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 356
	i32 3023353419, ; 598: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 599: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 331
	i32 3033331042, ; 600: Microsoft.AspNetCore.Authentication.Core.dll => 0xb4ccf562 => 183
	i32 3036999524, ; 601: Microsoft.AspNetCore.Http.Extensions => 0xb504ef64 => 201
	i32 3038032645, ; 602: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 415
	i32 3050706616, ; 603: Microsoft.AspNetCore.Mvc.Razor.Extensions => 0xb5d616b8 => 215
	i32 3056245963, ; 604: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 353
	i32 3057625584, ; 605: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 344
	i32 3059408633, ; 606: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 607: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3060069052, ; 608: MudBlazor => 0xb664f2bc => 276
	i32 3069363400, ; 609: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 236
	i32 3075834255, ; 610: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 611: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 391
	i32 3084678329, ; 612: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 267
	i32 3090735792, ; 613: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3093090641, ; 614: Microsoft.Extensions.WebEncoders.dll => 0xb85cd151 => 261
	i32 3099732863, ; 615: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 616: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 617: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3113762169, ; 618: Microsoft.AspNetCore.Routing.Abstractions => 0xb9983d79 => 224
	i32 3121463068, ; 619: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 620: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 621: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 622: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 623: GoogleGson.dll => 0xbba64c02 => 178
	i32 3151576809, ; 624: Microsoft.AspNetCore.Mvc.Core => 0xbbd93ee9 => 209
	i32 3155681111, ; 625: Microsoft.AspNetCore.DataProtection => 0xbc17df57 => 193
	i32 3159123045, ; 626: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 627: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3162781277, ; 628: Microsoft.AspNetCore.Cors.dll => 0xbc84365d => 191
	i32 3178803400, ; 629: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 345
	i32 3192346100, ; 630: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 631: System.Web => 0xbe592c0c => 153
	i32 3195844289, ; 632: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 236
	i32 3204380047, ; 633: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 634: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 635: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 322
	i32 3213246214, ; 636: System.Security.Permissions.dll => 0xbf863f06 => 294
	i32 3220365878, ; 637: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 638: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3228018376, ; 639: Microsoft.AspNetCore.ResponseCaching.Abstractions.dll => 0xc067a6c8 => 222
	i32 3251039220, ; 640: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 641: Xamarin.AndroidX.CardView => 0xc235e84d => 310
	i32 3265493905, ; 642: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 643: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 644: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 645: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 646: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 647: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3291386345, ; 648: ConersApp.dll => 0xc42e91e9 => 0
	i32 3299363146, ; 649: System.Text.Encoding => 0xc4a8494a => 135
	i32 3300764913, ; 650: Microsoft.AspNetCore.WebUtilities => 0xc4bdacf1 => 225
	i32 3303498502, ; 651: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 652: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 386
	i32 3312457198, ; 653: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 263
	i32 3316684772, ; 654: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 655: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 320
	i32 3317144872, ; 656: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 657: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 308
	i32 3345895724, ; 658: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 349
	i32 3346324047, ; 659: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 346
	i32 3357674450, ; 660: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 403
	i32 3358260929, ; 661: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 662: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 301
	i32 3362522851, ; 663: Xamarin.AndroidX.Core => 0xc86c06e3 => 317
	i32 3366347497, ; 664: Java.Interop => 0xc8a662e9 => 168
	i32 3374879918, ; 665: Microsoft.IdentityModel.Protocols.dll => 0xc92894ae => 265
	i32 3374999561, ; 666: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 350
	i32 3381016424, ; 667: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 382
	i32 3395150330, ; 668: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 669: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 670: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 321
	i32 3406629867, ; 671: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 248
	i32 3421170118, ; 672: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 240
	i32 3428513518, ; 673: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 244
	i32 3429136800, ; 674: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 675: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 676: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 324
	i32 3445260447, ; 677: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 678: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 269
	i32 3463511458, ; 679: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 390
	i32 3464190856, ; 680: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 187
	i32 3471940407, ; 681: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 682: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 683: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 403
	i32 3484440000, ; 684: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 402
	i32 3485117614, ; 685: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 686: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 687: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 313
	i32 3500000672, ; 688: Microsoft.JSInterop => 0xd09dc5a0 => 268
	i32 3509114376, ; 689: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 690: System.Security.dll => 0xd1854eb4 => 130
	i32 3517728004, ; 691: Syncfusion.Blazor.Themes => 0xd1ac4504 => 286
	i32 3530686833, ; 692: ConersApp => 0xd2720171 => 0
	i32 3530912306, ; 693: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 694: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3545306353, ; 695: Microsoft.Data.SqlClient => 0xd35114f1 => 229
	i32 3560100363, ; 696: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 697: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 698: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 410
	i32 3592435036, ; 699: Microsoft.Extensions.Localization.Abstractions => 0xd620355c => 254
	i32 3597029428, ; 700: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 299
	i32 3598340787, ; 701: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 702: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 703: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 704: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 348
	i32 3633644679, ; 705: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 303
	i32 3634693993, ; 706: Syncfusion.Blazor.Spinner.dll => 0xd8a50769 => 284
	i32 3638274909, ; 707: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 708: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 334
	i32 3643446276, ; 709: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 407
	i32 3643854240, ; 710: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 345
	i32 3645089577, ; 711: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3653734595, ; 712: EntityFramework.dll => 0xd9c790c3 => 177
	i32 3657292374, ; 713: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 239
	i32 3660523487, ; 714: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 715: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3675390461, ; 716: Syncfusion.Blazor.Buttons => 0xdb1201fd => 279
	i32 3682565725, ; 717: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 309
	i32 3684561358, ; 718: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 313
	i32 3687428684, ; 719: Microsoft.AspNetCore.Localization => 0xdbc9b24c => 204
	i32 3689375977, ; 720: System.Drawing.Common => 0xdbe768e9 => 289
	i32 3697841164, ; 721: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 412
	i32 3700866549, ; 722: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 723: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 318
	i32 3716563718, ; 724: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 725: Xamarin.AndroidX.Annotation => 0xdda814c6 => 302
	i32 3719388979, ; 726: Syncfusion.Blazor.Buttons.dll => 0xddb15f33 => 279
	i32 3721167343, ; 727: Syncfusion.Blazor.Data.dll => 0xddcc81ef => 281
	i32 3722202641, ; 728: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 242
	i32 3724971120, ; 729: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 344
	i32 3732100267, ; 730: System.Net.NameResolution => 0xde7354ab => 67
	i32 3732214720, ; 731: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 205
	i32 3737834244, ; 732: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 733: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 734: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3757377913, ; 735: EntityFramework.SqlServer => 0xdff50979 => 176
	i32 3758424670, ; 736: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 241
	i32 3765508441, ; 737: Microsoft.Extensions.ObjectPool.dll => 0xe0711959 => 258
	i32 3776403777, ; 738: Microsoft.Extensions.Localization.Abstractions.dll => 0xe1175941 => 254
	i32 3786282454, ; 739: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 311
	i32 3792276235, ; 740: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 741: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 269
	i32 3802395368, ; 742: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3807198597, ; 743: System.Security.Cryptography.Pkcs => 0xe2ed3d85 => 292
	i32 3819260425, ; 744: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 745: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829324472, ; 746: Microsoft.AspNetCore.Mvc.Razor.Extensions.dll => 0xe43edab8 => 215
	i32 3829621856, ; 747: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 748: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 245
	i32 3844307129, ; 749: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 750: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 751: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 752: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 753: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 754: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 755: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 359
	i32 3888767677, ; 756: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 349
	i32 3889960447, ; 757: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 411
	i32 3896106733, ; 758: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 759: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 317
	i32 3897693976, ; 760: RazorClassLibrary1.dll => 0xe8521718 => 414
	i32 3898971068, ; 761: Microsoft.Extensions.Localization.dll => 0xe86593bc => 253
	i32 3900550681, ; 762: Syncfusion.Blazor.Inputs.dll => 0xe87dae19 => 282
	i32 3901907137, ; 763: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 764: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 765: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 362
	i32 3928044579, ; 766: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 767: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 768: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 347
	i32 3945713374, ; 769: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 770: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3954195687, ; 771: Microsoft.Extensions.Localization => 0xebb03ce7 => 253
	i32 3955647286, ; 772: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 305
	i32 3959773229, ; 773: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 336
	i32 3963903781, ; 774: Microsoft.Extensions.Configuration.UserSecrets => 0xec445f25 => 243
	i32 3980434154, ; 775: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 406
	i32 3987592930, ; 776: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 388
	i32 4003436829, ; 777: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 778: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 304
	i32 4023392905, ; 779: System.IO.Pipelines => 0xefd01a89 => 291
	i32 4025784931, ; 780: System.Memory => 0xeff49a63 => 62
	i32 4026527876, ; 781: Microsoft.CodeAnalysis.CSharp => 0xeffff084 => 227
	i32 4029710644, ; 782: Microsoft.AspNetCore.Razor.Runtime.dll => 0xf0308134 => 221
	i32 4044155772, ; 783: Microsoft.Net.Http.Headers.dll => 0xf10ceb7c => 275
	i32 4046471985, ; 784: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 271
	i32 4054681211, ; 785: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4062636684, ; 786: BackendClassLibrary.dll => 0xf226ea8c => 413
	i32 4068434129, ; 787: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 788: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4078967171, ; 789: Microsoft.Extensions.Hosting.Abstractions.dll => 0xf3201983 => 252
	i32 4094352644, ; 790: Microsoft.Maui.Essentials.dll => 0xf40add04 => 273
	i32 4099507663, ; 791: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 792: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 793: Xamarin.AndroidX.Emoji2 => 0xf479582c => 325
	i32 4101842092, ; 794: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 237
	i32 4102112229, ; 795: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 401
	i32 4109590703, ; 796: Syncfusion.Blazor.Spinner => 0xf4f360af => 284
	i32 4116094207, ; 797: Microsoft.AspNetCore.Mvc.ApiExplorer => 0xf5569cff => 208
	i32 4125707920, ; 798: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 396
	i32 4126470640, ; 799: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 244
	i32 4127667938, ; 800: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 801: System.AppContext => 0xf6318da0 => 6
	i32 4141580284, ; 802: Microsoft.AspNetCore.Authorization.Policy => 0xf6db7ffc => 185
	i32 4147896353, ; 803: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 804: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 408
	i32 4151237749, ; 805: System.Core => 0xf76edc75 => 21
	i32 4157215678, ; 806: Syncfusion.Blazor.Themes.dll => 0xf7ca13be => 286
	i32 4159265925, ; 807: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 808: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 809: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4169285646, ; 810: Microsoft.AspNetCore.Mvc.ViewFeatures.dll => 0xf882400e => 218
	i32 4180982454, ; 811: Microsoft.AspNetCore.Diagnostics.Abstractions => 0xf934bab6 => 195
	i32 4181436372, ; 812: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 813: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 341
	i32 4185676441, ; 814: System.Security => 0xf97c5a99 => 130
	i32 4194278001, ; 815: Microsoft.EntityFrameworkCore.SqlServer.dll => 0xf9ff9a71 => 235
	i32 4196171640, ; 816: Microsoft.CodeAnalysis => 0xfa1c7f78 => 226
	i32 4196529839, ; 817: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 818: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4217598431, ; 819: Microsoft.AspNetCore.Cors => 0xfb6371df => 191
	i32 4245218886, ; 820: Microsoft.CodeAnalysis.CSharp.dll => 0xfd08e646 => 227
	i32 4256097574, ; 821: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 318
	i32 4258378803, ; 822: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 340
	i32 4258913604, ; 823: Microsoft.AspNetCore.Mvc.DataAnnotations => 0xfdd9dd44 => 211
	i32 4260525087, ; 824: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 825: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 290
	i32 4271975918, ; 826: Microsoft.Maui.Controls.dll => 0xfea12dee => 270
	i32 4274976490, ; 827: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4277663213, ; 828: Microsoft.AspNetCore.Mvc.TagHelpers => 0xfef7f5ed => 217
	i32 4292120959, ; 829: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 341
	i32 4294648842, ; 830: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 249
	i32 4294763496 ; 831: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 327
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [832 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 246, ; 3
	i32 337, ; 4
	i32 371, ; 5
	i32 48, ; 6
	i32 277, ; 7
	i32 80, ; 8
	i32 145, ; 9
	i32 30, ; 10
	i32 412, ; 11
	i32 124, ; 12
	i32 274, ; 13
	i32 102, ; 14
	i32 192, ; 15
	i32 355, ; 16
	i32 107, ; 17
	i32 355, ; 18
	i32 139, ; 19
	i32 375, ; 20
	i32 77, ; 21
	i32 124, ; 22
	i32 13, ; 23
	i32 311, ; 24
	i32 132, ; 25
	i32 225, ; 26
	i32 214, ; 27
	i32 357, ; 28
	i32 151, ; 29
	i32 409, ; 30
	i32 410, ; 31
	i32 281, ; 32
	i32 18, ; 33
	i32 309, ; 34
	i32 26, ; 35
	i32 331, ; 36
	i32 1, ; 37
	i32 59, ; 38
	i32 42, ; 39
	i32 91, ; 40
	i32 221, ; 41
	i32 186, ; 42
	i32 314, ; 43
	i32 173, ; 44
	i32 147, ; 45
	i32 333, ; 46
	i32 330, ; 47
	i32 381, ; 48
	i32 54, ; 49
	i32 69, ; 50
	i32 182, ; 51
	i32 206, ; 52
	i32 409, ; 53
	i32 300, ; 54
	i32 83, ; 55
	i32 394, ; 56
	i32 181, ; 57
	i32 211, ; 58
	i32 332, ; 59
	i32 222, ; 60
	i32 393, ; 61
	i32 131, ; 62
	i32 55, ; 63
	i32 149, ; 64
	i32 74, ; 65
	i32 145, ; 66
	i32 223, ; 67
	i32 62, ; 68
	i32 146, ; 69
	i32 415, ; 70
	i32 165, ; 71
	i32 405, ; 72
	i32 315, ; 73
	i32 12, ; 74
	i32 328, ; 75
	i32 125, ; 76
	i32 152, ; 77
	i32 113, ; 78
	i32 166, ; 79
	i32 164, ; 80
	i32 330, ; 81
	i32 343, ; 82
	i32 197, ; 83
	i32 84, ; 84
	i32 392, ; 85
	i32 386, ; 86
	i32 260, ; 87
	i32 150, ; 88
	i32 375, ; 89
	i32 60, ; 90
	i32 255, ; 91
	i32 51, ; 92
	i32 103, ; 93
	i32 114, ; 94
	i32 40, ; 95
	i32 368, ; 96
	i32 220, ; 97
	i32 366, ; 98
	i32 249, ; 99
	i32 120, ; 100
	i32 400, ; 101
	i32 52, ; 102
	i32 44, ; 103
	i32 119, ; 104
	i32 320, ; 105
	i32 398, ; 106
	i32 326, ; 107
	i32 81, ; 108
	i32 136, ; 109
	i32 362, ; 110
	i32 307, ; 111
	i32 8, ; 112
	i32 73, ; 113
	i32 380, ; 114
	i32 155, ; 115
	i32 377, ; 116
	i32 154, ; 117
	i32 92, ; 118
	i32 372, ; 119
	i32 45, ; 120
	i32 395, ; 121
	i32 292, ; 122
	i32 383, ; 123
	i32 376, ; 124
	i32 109, ; 125
	i32 185, ; 126
	i32 214, ; 127
	i32 219, ; 128
	i32 129, ; 129
	i32 25, ; 130
	i32 297, ; 131
	i32 72, ; 132
	i32 55, ; 133
	i32 46, ; 134
	i32 404, ; 135
	i32 259, ; 136
	i32 321, ; 137
	i32 190, ; 138
	i32 174, ; 139
	i32 22, ; 140
	i32 335, ; 141
	i32 218, ; 142
	i32 289, ; 143
	i32 210, ; 144
	i32 86, ; 145
	i32 43, ; 146
	i32 160, ; 147
	i32 71, ; 148
	i32 348, ; 149
	i32 219, ; 150
	i32 3, ; 151
	i32 42, ; 152
	i32 63, ; 153
	i32 16, ; 154
	i32 53, ; 155
	i32 175, ; 156
	i32 407, ; 157
	i32 371, ; 158
	i32 228, ; 159
	i32 105, ; 160
	i32 277, ; 161
	i32 376, ; 162
	i32 369, ; 163
	i32 332, ; 164
	i32 220, ; 165
	i32 34, ; 166
	i32 158, ; 167
	i32 85, ; 168
	i32 32, ; 169
	i32 12, ; 170
	i32 51, ; 171
	i32 251, ; 172
	i32 56, ; 173
	i32 198, ; 174
	i32 352, ; 175
	i32 36, ; 176
	i32 245, ; 177
	i32 382, ; 178
	i32 370, ; 179
	i32 305, ; 180
	i32 35, ; 181
	i32 58, ; 182
	i32 339, ; 183
	i32 198, ; 184
	i32 178, ; 185
	i32 17, ; 186
	i32 373, ; 187
	i32 179, ; 188
	i32 164, ; 189
	i32 230, ; 190
	i32 241, ; 191
	i32 252, ; 192
	i32 182, ; 193
	i32 395, ; 194
	i32 338, ; 195
	i32 257, ; 196
	i32 229, ; 197
	i32 295, ; 198
	i32 365, ; 199
	i32 232, ; 200
	i32 401, ; 201
	i32 153, ; 202
	i32 247, ; 203
	i32 361, ; 204
	i32 346, ; 205
	i32 278, ; 206
	i32 232, ; 207
	i32 399, ; 208
	i32 307, ; 209
	i32 237, ; 210
	i32 29, ; 211
	i32 52, ; 212
	i32 275, ; 213
	i32 216, ; 214
	i32 397, ; 215
	i32 197, ; 216
	i32 366, ; 217
	i32 5, ; 218
	i32 381, ; 219
	i32 356, ; 220
	i32 217, ; 221
	i32 360, ; 222
	i32 223, ; 223
	i32 312, ; 224
	i32 377, ; 225
	i32 304, ; 226
	i32 176, ; 227
	i32 323, ; 228
	i32 85, ; 229
	i32 365, ; 230
	i32 61, ; 231
	i32 112, ; 232
	i32 57, ; 233
	i32 411, ; 234
	i32 352, ; 235
	i32 99, ; 236
	i32 280, ; 237
	i32 19, ; 238
	i32 316, ; 239
	i32 111, ; 240
	i32 101, ; 241
	i32 102, ; 242
	i32 379, ; 243
	i32 104, ; 244
	i32 369, ; 245
	i32 71, ; 246
	i32 38, ; 247
	i32 32, ; 248
	i32 248, ; 249
	i32 103, ; 250
	i32 73, ; 251
	i32 290, ; 252
	i32 385, ; 253
	i32 9, ; 254
	i32 123, ; 255
	i32 46, ; 256
	i32 306, ; 257
	i32 260, ; 258
	i32 9, ; 259
	i32 43, ; 260
	i32 4, ; 261
	i32 353, ; 262
	i32 389, ; 263
	i32 179, ; 264
	i32 263, ; 265
	i32 285, ; 266
	i32 384, ; 267
	i32 251, ; 268
	i32 213, ; 269
	i32 31, ; 270
	i32 138, ; 271
	i32 92, ; 272
	i32 190, ; 273
	i32 93, ; 274
	i32 404, ; 275
	i32 49, ; 276
	i32 141, ; 277
	i32 210, ; 278
	i32 112, ; 279
	i32 140, ; 280
	i32 322, ; 281
	i32 115, ; 282
	i32 370, ; 283
	i32 157, ; 284
	i32 76, ; 285
	i32 79, ; 286
	i32 342, ; 287
	i32 37, ; 288
	i32 364, ; 289
	i32 181, ; 290
	i32 266, ; 291
	i32 180, ; 292
	i32 242, ; 293
	i32 326, ; 294
	i32 319, ; 295
	i32 64, ; 296
	i32 138, ; 297
	i32 15, ; 298
	i32 189, ; 299
	i32 116, ; 300
	i32 358, ; 301
	i32 367, ; 302
	i32 174, ; 303
	i32 314, ; 304
	i32 48, ; 305
	i32 70, ; 306
	i32 80, ; 307
	i32 126, ; 308
	i32 413, ; 309
	i32 231, ; 310
	i32 94, ; 311
	i32 121, ; 312
	i32 374, ; 313
	i32 26, ; 314
	i32 335, ; 315
	i32 97, ; 316
	i32 28, ; 317
	i32 310, ; 318
	i32 402, ; 319
	i32 380, ; 320
	i32 149, ; 321
	i32 291, ; 322
	i32 169, ; 323
	i32 4, ; 324
	i32 98, ; 325
	i32 188, ; 326
	i32 33, ; 327
	i32 93, ; 328
	i32 357, ; 329
	i32 243, ; 330
	i32 255, ; 331
	i32 21, ; 332
	i32 41, ; 333
	i32 170, ; 334
	i32 396, ; 335
	i32 328, ; 336
	i32 280, ; 337
	i32 388, ; 338
	i32 262, ; 339
	i32 342, ; 340
	i32 373, ; 341
	i32 367, ; 342
	i32 347, ; 343
	i32 2, ; 344
	i32 202, ; 345
	i32 192, ; 346
	i32 134, ; 347
	i32 111, ; 348
	i32 256, ; 349
	i32 295, ; 350
	i32 408, ; 351
	i32 297, ; 352
	i32 405, ; 353
	i32 58, ; 354
	i32 95, ; 355
	i32 266, ; 356
	i32 387, ; 357
	i32 39, ; 358
	i32 308, ; 359
	i32 25, ; 360
	i32 94, ; 361
	i32 230, ; 362
	i32 282, ; 363
	i32 89, ; 364
	i32 99, ; 365
	i32 10, ; 366
	i32 212, ; 367
	i32 200, ; 368
	i32 87, ; 369
	i32 194, ; 370
	i32 100, ; 371
	i32 354, ; 372
	i32 195, ; 373
	i32 238, ; 374
	i32 374, ; 375
	i32 299, ; 376
	i32 267, ; 377
	i32 233, ; 378
	i32 384, ; 379
	i32 7, ; 380
	i32 339, ; 381
	i32 379, ; 382
	i32 296, ; 383
	i32 88, ; 384
	i32 240, ; 385
	i32 334, ; 386
	i32 154, ; 387
	i32 383, ; 388
	i32 278, ; 389
	i32 33, ; 390
	i32 250, ; 391
	i32 200, ; 392
	i32 261, ; 393
	i32 116, ; 394
	i32 293, ; 395
	i32 82, ; 396
	i32 203, ; 397
	i32 208, ; 398
	i32 212, ; 399
	i32 20, ; 400
	i32 11, ; 401
	i32 162, ; 402
	i32 3, ; 403
	i32 272, ; 404
	i32 391, ; 405
	i32 259, ; 406
	i32 209, ; 407
	i32 256, ; 408
	i32 84, ; 409
	i32 246, ; 410
	i32 378, ; 411
	i32 64, ; 412
	i32 258, ; 413
	i32 393, ; 414
	i32 361, ; 415
	i32 143, ; 416
	i32 199, ; 417
	i32 343, ; 418
	i32 157, ; 419
	i32 231, ; 420
	i32 265, ; 421
	i32 41, ; 422
	i32 117, ; 423
	i32 239, ; 424
	i32 298, ; 425
	i32 387, ; 426
	i32 350, ; 427
	i32 207, ; 428
	i32 193, ; 429
	i32 131, ; 430
	i32 75, ; 431
	i32 66, ; 432
	i32 397, ; 433
	i32 172, ; 434
	i32 302, ; 435
	i32 143, ; 436
	i32 207, ; 437
	i32 213, ; 438
	i32 106, ; 439
	i32 151, ; 440
	i32 70, ; 441
	i32 287, ; 442
	i32 204, ; 443
	i32 156, ; 444
	i32 264, ; 445
	i32 238, ; 446
	i32 121, ; 447
	i32 127, ; 448
	i32 392, ; 449
	i32 152, ; 450
	i32 325, ; 451
	i32 186, ; 452
	i32 141, ; 453
	i32 312, ; 454
	i32 228, ; 455
	i32 389, ; 456
	i32 20, ; 457
	i32 14, ; 458
	i32 233, ; 459
	i32 268, ; 460
	i32 216, ; 461
	i32 135, ; 462
	i32 183, ; 463
	i32 75, ; 464
	i32 59, ; 465
	i32 173, ; 466
	i32 315, ; 467
	i32 167, ; 468
	i32 283, ; 469
	i32 168, ; 470
	i32 270, ; 471
	i32 15, ; 472
	i32 74, ; 473
	i32 6, ; 474
	i32 23, ; 475
	i32 337, ; 476
	i32 296, ; 477
	i32 203, ; 478
	i32 283, ; 479
	i32 184, ; 480
	i32 91, ; 481
	i32 390, ; 482
	i32 1, ; 483
	i32 136, ; 484
	i32 338, ; 485
	i32 360, ; 486
	i32 134, ; 487
	i32 69, ; 488
	i32 187, ; 489
	i32 146, ; 490
	i32 247, ; 491
	i32 224, ; 492
	i32 399, ; 493
	i32 196, ; 494
	i32 378, ; 495
	i32 206, ; 496
	i32 329, ; 497
	i32 257, ; 498
	i32 88, ; 499
	i32 96, ; 500
	i32 319, ; 501
	i32 324, ; 502
	i32 394, ; 503
	i32 31, ; 504
	i32 45, ; 505
	i32 333, ; 506
	i32 201, ; 507
	i32 234, ; 508
	i32 264, ; 509
	i32 175, ; 510
	i32 285, ; 511
	i32 298, ; 512
	i32 109, ; 513
	i32 158, ; 514
	i32 35, ; 515
	i32 22, ; 516
	i32 114, ; 517
	i32 189, ; 518
	i32 57, ; 519
	i32 358, ; 520
	i32 144, ; 521
	i32 118, ; 522
	i32 120, ; 523
	i32 226, ; 524
	i32 110, ; 525
	i32 300, ; 526
	i32 139, ; 527
	i32 184, ; 528
	i32 306, ; 529
	i32 262, ; 530
	i32 54, ; 531
	i32 105, ; 532
	i32 400, ; 533
	i32 235, ; 534
	i32 271, ; 535
	i32 272, ; 536
	i32 133, ; 537
	i32 372, ; 538
	i32 363, ; 539
	i32 351, ; 540
	i32 406, ; 541
	i32 329, ; 542
	i32 274, ; 543
	i32 159, ; 544
	i32 385, ; 545
	i32 316, ; 546
	i32 163, ; 547
	i32 276, ; 548
	i32 132, ; 549
	i32 351, ; 550
	i32 161, ; 551
	i32 398, ; 552
	i32 205, ; 553
	i32 340, ; 554
	i32 294, ; 555
	i32 234, ; 556
	i32 140, ; 557
	i32 202, ; 558
	i32 363, ; 559
	i32 359, ; 560
	i32 169, ; 561
	i32 273, ; 562
	i32 287, ; 563
	i32 301, ; 564
	i32 368, ; 565
	i32 40, ; 566
	i32 327, ; 567
	i32 81, ; 568
	i32 188, ; 569
	i32 56, ; 570
	i32 37, ; 571
	i32 97, ; 572
	i32 166, ; 573
	i32 180, ; 574
	i32 172, ; 575
	i32 250, ; 576
	i32 177, ; 577
	i32 364, ; 578
	i32 82, ; 579
	i32 303, ; 580
	i32 293, ; 581
	i32 194, ; 582
	i32 98, ; 583
	i32 414, ; 584
	i32 30, ; 585
	i32 159, ; 586
	i32 288, ; 587
	i32 18, ; 588
	i32 127, ; 589
	i32 119, ; 590
	i32 196, ; 591
	i32 323, ; 592
	i32 354, ; 593
	i32 199, ; 594
	i32 336, ; 595
	i32 288, ; 596
	i32 356, ; 597
	i32 165, ; 598
	i32 331, ; 599
	i32 183, ; 600
	i32 201, ; 601
	i32 415, ; 602
	i32 215, ; 603
	i32 353, ; 604
	i32 344, ; 605
	i32 170, ; 606
	i32 16, ; 607
	i32 276, ; 608
	i32 236, ; 609
	i32 144, ; 610
	i32 391, ; 611
	i32 267, ; 612
	i32 125, ; 613
	i32 261, ; 614
	i32 118, ; 615
	i32 38, ; 616
	i32 115, ; 617
	i32 224, ; 618
	i32 47, ; 619
	i32 142, ; 620
	i32 117, ; 621
	i32 34, ; 622
	i32 178, ; 623
	i32 209, ; 624
	i32 193, ; 625
	i32 95, ; 626
	i32 53, ; 627
	i32 191, ; 628
	i32 345, ; 629
	i32 129, ; 630
	i32 153, ; 631
	i32 236, ; 632
	i32 24, ; 633
	i32 161, ; 634
	i32 322, ; 635
	i32 294, ; 636
	i32 148, ; 637
	i32 104, ; 638
	i32 222, ; 639
	i32 89, ; 640
	i32 310, ; 641
	i32 60, ; 642
	i32 142, ; 643
	i32 100, ; 644
	i32 5, ; 645
	i32 13, ; 646
	i32 122, ; 647
	i32 0, ; 648
	i32 135, ; 649
	i32 225, ; 650
	i32 28, ; 651
	i32 386, ; 652
	i32 263, ; 653
	i32 72, ; 654
	i32 320, ; 655
	i32 24, ; 656
	i32 308, ; 657
	i32 349, ; 658
	i32 346, ; 659
	i32 403, ; 660
	i32 137, ; 661
	i32 301, ; 662
	i32 317, ; 663
	i32 168, ; 664
	i32 265, ; 665
	i32 350, ; 666
	i32 382, ; 667
	i32 101, ; 668
	i32 123, ; 669
	i32 321, ; 670
	i32 248, ; 671
	i32 240, ; 672
	i32 244, ; 673
	i32 163, ; 674
	i32 167, ; 675
	i32 324, ; 676
	i32 39, ; 677
	i32 269, ; 678
	i32 390, ; 679
	i32 187, ; 680
	i32 17, ; 681
	i32 171, ; 682
	i32 403, ; 683
	i32 402, ; 684
	i32 137, ; 685
	i32 150, ; 686
	i32 313, ; 687
	i32 268, ; 688
	i32 155, ; 689
	i32 130, ; 690
	i32 286, ; 691
	i32 0, ; 692
	i32 19, ; 693
	i32 65, ; 694
	i32 229, ; 695
	i32 147, ; 696
	i32 47, ; 697
	i32 410, ; 698
	i32 254, ; 699
	i32 299, ; 700
	i32 79, ; 701
	i32 61, ; 702
	i32 106, ; 703
	i32 348, ; 704
	i32 303, ; 705
	i32 284, ; 706
	i32 49, ; 707
	i32 334, ; 708
	i32 407, ; 709
	i32 345, ; 710
	i32 14, ; 711
	i32 177, ; 712
	i32 239, ; 713
	i32 68, ; 714
	i32 171, ; 715
	i32 279, ; 716
	i32 309, ; 717
	i32 313, ; 718
	i32 204, ; 719
	i32 289, ; 720
	i32 412, ; 721
	i32 78, ; 722
	i32 318, ; 723
	i32 108, ; 724
	i32 302, ; 725
	i32 279, ; 726
	i32 281, ; 727
	i32 242, ; 728
	i32 344, ; 729
	i32 67, ; 730
	i32 205, ; 731
	i32 63, ; 732
	i32 27, ; 733
	i32 160, ; 734
	i32 176, ; 735
	i32 241, ; 736
	i32 258, ; 737
	i32 254, ; 738
	i32 311, ; 739
	i32 10, ; 740
	i32 269, ; 741
	i32 11, ; 742
	i32 292, ; 743
	i32 78, ; 744
	i32 126, ; 745
	i32 215, ; 746
	i32 83, ; 747
	i32 245, ; 748
	i32 66, ; 749
	i32 107, ; 750
	i32 65, ; 751
	i32 128, ; 752
	i32 122, ; 753
	i32 77, ; 754
	i32 359, ; 755
	i32 349, ; 756
	i32 411, ; 757
	i32 8, ; 758
	i32 317, ; 759
	i32 414, ; 760
	i32 253, ; 761
	i32 282, ; 762
	i32 2, ; 763
	i32 44, ; 764
	i32 362, ; 765
	i32 156, ; 766
	i32 128, ; 767
	i32 347, ; 768
	i32 23, ; 769
	i32 133, ; 770
	i32 253, ; 771
	i32 305, ; 772
	i32 336, ; 773
	i32 243, ; 774
	i32 406, ; 775
	i32 388, ; 776
	i32 29, ; 777
	i32 304, ; 778
	i32 291, ; 779
	i32 62, ; 780
	i32 227, ; 781
	i32 221, ; 782
	i32 275, ; 783
	i32 271, ; 784
	i32 90, ; 785
	i32 413, ; 786
	i32 87, ; 787
	i32 148, ; 788
	i32 252, ; 789
	i32 273, ; 790
	i32 36, ; 791
	i32 86, ; 792
	i32 325, ; 793
	i32 237, ; 794
	i32 401, ; 795
	i32 284, ; 796
	i32 208, ; 797
	i32 396, ; 798
	i32 244, ; 799
	i32 50, ; 800
	i32 6, ; 801
	i32 185, ; 802
	i32 90, ; 803
	i32 408, ; 804
	i32 21, ; 805
	i32 286, ; 806
	i32 162, ; 807
	i32 96, ; 808
	i32 50, ; 809
	i32 218, ; 810
	i32 195, ; 811
	i32 113, ; 812
	i32 341, ; 813
	i32 130, ; 814
	i32 235, ; 815
	i32 226, ; 816
	i32 76, ; 817
	i32 27, ; 818
	i32 191, ; 819
	i32 227, ; 820
	i32 318, ; 821
	i32 340, ; 822
	i32 211, ; 823
	i32 7, ; 824
	i32 290, ; 825
	i32 270, ; 826
	i32 110, ; 827
	i32 217, ; 828
	i32 341, ; 829
	i32 249, ; 830
	i32 327 ; 831
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
