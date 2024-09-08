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

@assembly_image_cache = dso_local local_unnamed_addr global [407 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [814 x i64] [
	i64 15690660930947125, ; 0: Microsoft.DotNet.PlatformAbstractions.dll => 0x37be92af148835 => 230
	i64 24362543149721218, ; 1: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 315
	i64 98382396393917666, ; 2: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 260
	i64 120698629574877762, ; 3: Mono.Android => 0x1accec39cafe242 => 171
	i64 131669012237370309, ; 4: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 273
	i64 160518225272466977, ; 5: Microsoft.Extensions.Hosting.Abstractions => 0x23a4679b5576e21 => 252
	i64 196720943101637631, ; 6: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 58
	i64 210515253464952879, ; 7: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 302
	i64 229794953483747371, ; 8: System.ValueTuple.dll => 0x330654aed93802b => 151
	i64 232391251801502327, ; 9: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 343
	i64 255552998601729709, ; 10: Blazorise.dll => 0x38be81926f126ad => 173
	i64 295915112840604065, ; 11: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 346
	i64 316157742385208084, ; 12: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 309
	i64 350667413455104241, ; 13: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 132
	i64 374214195677100225, ; 14: Microsoft.CodeAnalysis.Razor => 0x53179d40b3df8c1 => 228
	i64 422779754995088667, ; 15: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 56
	i64 435118502366263740, ; 16: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 345
	i64 444513321921118114, ; 17: Microsoft.EntityFrameworkCore.InMemory => 0x62b3a82db097fa2 => 233
	i64 482535784737928357, ; 18: Microsoft.AspNetCore.Diagnostics.Abstractions.dll => 0x6b24fbd58b7f4a5 => 195
	i64 535107122908063503, ; 19: Microsoft.Extensions.ObjectPool.dll => 0x76d1517d9b7670f => 258
	i64 545109961164950392, ; 20: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 377
	i64 560278790331054453, ; 21: System.Reflection.Primitives => 0x7c6829760de3975 => 95
	i64 634256334200181332, ; 22: Microsoft.CodeAnalysis.CSharp.dll => 0x8cd54c6888b1254 => 227
	i64 634308326490598313, ; 23: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 328
	i64 648449422406355874, ; 24: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x8ffc15065568ba2 => 241
	i64 649145001856603771, ; 25: System.Security.SecureString => 0x90239f09b62167b => 129
	i64 668723562677762733, ; 26: Microsoft.Extensions.Configuration.Binder.dll => 0x947c88986577aad => 240
	i64 670564002081277297, ; 27: Microsoft.Identity.Client.dll => 0x94e526837380571 => 262
	i64 683390398661839228, ; 28: Microsoft.Extensions.FileProviders.Embedded => 0x97be3f26326c97c => 249
	i64 702024105029695270, ; 29: System.Drawing.Common => 0x9be17343c0e7726 => 280
	i64 750875890346172408, ; 30: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 145
	i64 798450721097591769, ; 31: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 303
	i64 799765834175365804, ; 32: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 849051935479314978, ; 33: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 380
	i64 864641107619353643, ; 34: Microsoft.AspNetCore.Mvc.DataAnnotations => 0xbffd2819dda142b => 211
	i64 872800313462103108, ; 35: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 314
	i64 895210737996778430, ; 36: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 329
	i64 940822596282819491, ; 37: System.Transactions => 0xd0e792aa81923a3 => 150
	i64 960778385402502048, ; 38: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 104
	i64 982068613551266738, ; 39: Microsoft.AspNetCore.ResponseCaching.Abstractions.dll => 0xda1023367c89bb2 => 222
	i64 1001381392624924420, ; 40: Microsoft.AspNetCore.Authentication.Core.dll => 0xde59f1230183704 => 183
	i64 1010599046655515943, ; 41: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 95
	i64 1120440138749646132, ; 42: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 358
	i64 1121665720830085036, ; 43: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 388
	i64 1268860745194512059, ; 44: System.Drawing.dll => 0x119be62002c19ebb => 36
	i64 1278906455852160409, ; 45: Microsoft.EntityFrameworkCore.SqlServer.dll => 0x11bf96a54a059599 => 235
	i64 1301626418029409250, ; 46: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 28
	i64 1315114680217950157, ; 47: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 298
	i64 1369545283391376210, ; 48: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 336
	i64 1404195534211153682, ; 49: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 50
	i64 1425944114962822056, ; 50: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 115
	i64 1476839205573959279, ; 51: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 70
	i64 1486715745332614827, ; 52: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 270
	i64 1492954217099365037, ; 53: System.Net.HttpListener => 0x14b809f350210aad => 65
	i64 1513467482682125403, ; 54: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 170
	i64 1515118852840071656, ; 55: Microsoft.AspNet.Identity.EntityFramework.dll => 0x1506c891b807a1e8 => 180
	i64 1537168428375924959, ; 56: System.Threading.Thread.dll => 0x15551e8a954ae0df => 145
	i64 1556147632182429976, ; 57: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 386
	i64 1576750169145655260, ; 58: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 357
	i64 1624659445732251991, ; 59: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 297
	i64 1628611045998245443, ; 60: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 332
	i64 1636321030536304333, ; 61: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 322
	i64 1639340239664632727, ; 62: Microsoft.AspNetCore.Cryptography.Internal.dll => 0x16c01b432b36d397 => 192
	i64 1651782184287836205, ; 63: System.Globalization.Calendars => 0x16ec4f2524cb982d => 40
	i64 1659332977923810219, ; 64: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 89
	i64 1682513316613008342, ; 65: System.Net.dll => 0x17597cf276952bd6 => 81
	i64 1731380447121279447, ; 66: Newtonsoft.Json => 0x18071957e9b889d7 => 277
	i64 1735388228521408345, ; 67: System.Net.Mail.dll => 0x181556663c69b759 => 66
	i64 1743969030606105336, ; 68: System.Memory.dll => 0x1833d297e88f2af8 => 62
	i64 1767386781656293639, ; 69: System.Private.Uri.dll => 0x188704e9f5582107 => 86
	i64 1776954265264967804, ; 70: Microsoft.JSInterop.dll => 0x18a9027d533bd07c => 268
	i64 1795316252682057001, ; 71: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 296
	i64 1825687700144851180, ; 72: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 106
	i64 1835311033149317475, ; 73: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 376
	i64 1836611346387731153, ; 74: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 343
	i64 1854145951182283680, ; 75: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 102
	i64 1875417405349196092, ; 76: System.Drawing.Primitives => 0x1a06d2319b6c713c => 35
	i64 1875917498431009007, ; 77: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 293
	i64 1881198190668717030, ; 78: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 398
	i64 1897575647115118287, ; 79: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 345
	i64 1920760634179481754, ; 80: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 271
	i64 1959996714666907089, ; 81: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 398
	i64 1972384582241139858, ; 82: Microsoft.CodeAnalysis.CSharp => 0x1b5f5153d0f0bc92 => 227
	i64 1972385128188460614, ; 83: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 119
	i64 1981742497975770890, ; 84: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 330
	i64 1983698669889758782, ; 85: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 372
	i64 2019660174692588140, ; 86: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 390
	i64 2040001226662520565, ; 87: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 142
	i64 2062890601515140263, ; 88: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 141
	i64 2064708342624596306, ; 89: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 366
	i64 2080945842184875448, ; 90: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 53
	i64 2102659300918482391, ; 91: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 35
	i64 2106033277907880740, ; 92: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 141
	i64 2133195048986300728, ; 93: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 277
	i64 2165310824878145998, ; 94: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 290
	i64 2165725771938924357, ; 95: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 300
	i64 2192948757939169934, ; 96: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 232
	i64 2200176636225660136, ; 97: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 257
	i64 2262844636196693701, ; 98: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 314
	i64 2269733267185212154, ; 99: Microsoft.AspNetCore.Html.Abstractions.dll => 0x1f7fb66185761afa => 198
	i64 2287834202362508563, ; 100: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 101: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2291110528038595319, ; 102: RazorClassLibrary1.dll => 0x1fcba8e2ece5eaf7 => 405
	i64 2295368378960711535, ; 103: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x1fdac961189e0f6f => 190
	i64 2302323944321350744, ; 104: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 394
	i64 2304837677853103545, ; 105: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 342
	i64 2315304989185124968, ; 106: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 51
	i64 2316229908869312383, ; 107: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x2024e6d4884a6f7f => 266
	i64 2329709569556905518, ; 108: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 325
	i64 2335503487726329082, ; 109: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 136
	i64 2337758774805907496, ; 110: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 101
	i64 2345003039313485788, ; 111: ConersApp => 0x208b1fd7037ddfdc => 0
	i64 2414730492268170344, ; 112: Microsoft.AspNetCore.Mvc.Localization.dll => 0x2182d896c3f2cc68 => 213
	i64 2470498323731680442, ; 113: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 307
	i64 2479423007379663237, ; 114: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 352
	i64 2497223385847772520, ; 115: System.Runtime => 0x22a7eb7046413568 => 116
	i64 2547086958574651984, ; 116: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 291
	i64 2592350477072141967, ; 117: System.Xml.dll => 0x23f9e10627330e8f => 163
	i64 2602673633151553063, ; 118: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 397
	i64 2612152650457191105, ; 119: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 267
	i64 2624866290265602282, ; 120: mscorlib.dll => 0x246d65fbde2db8ea => 166
	i64 2632269733008246987, ; 121: System.Net.NameResolution => 0x2487b36034f808cb => 67
	i64 2656907746661064104, ; 122: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 244
	i64 2662981627730767622, ; 123: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 372
	i64 2706075432581334785, ; 124: System.Net.WebSockets => 0x258de944be6c0701 => 80
	i64 2741613924229396860, ; 125: EntityFramework.SqlServer.dll => 0x260c2b56a0f5397c => 176
	i64 2781169761569919449, ; 126: Microsoft.JSInterop => 0x2698b329b26ed1d9 => 268
	i64 2783046991838674048, ; 127: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 101
	i64 2787234703088983483, ; 128: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 347
	i64 2789714023057451704, ; 129: Microsoft.IdentityModel.JsonWebTokens.dll => 0x26b70e1f9943eab8 => 263
	i64 2815524396660695947, ; 130: System.Security.AccessControl => 0x2712c0857f68238b => 117
	i64 2851879596360956261, ; 131: System.Configuration.ConfigurationManager => 0x2793e9620b477965 => 279
	i64 2895129759130297543, ; 132: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 377
	i64 2923871038697555247, ; 133: Jsr305Binding => 0x2893ad37e69ec52f => 359
	i64 2974029546067041986, ; 134: Microsoft.AspNetCore.Mvc.Formatters.Json.dll => 0x2945e01d74d79ec2 => 212
	i64 3017136373564924869, ; 135: System.Net.WebProxy => 0x29df058bd93f63c5 => 78
	i64 3017704767998173186, ; 136: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 358
	i64 3021884968805928991, ; 137: Microsoft.AspNetCore.Authorization.Policy => 0x29efe45e55c5101f => 185
	i64 3106852385031680087, ; 138: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 114
	i64 3110390492489056344, ; 139: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 121
	i64 3135773902340015556, ; 140: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 48
	i64 3168817962471953758, ; 141: Microsoft.Extensions.Hosting.Abstractions.dll => 0x2bf9e725d304955e => 252
	i64 3168887168596639127, ; 142: Microsoft.AspNetCore.Mvc.Razor.Extensions.dll => 0x2bfa2617217efd97 => 215
	i64 3266690593535380875, ; 143: Microsoft.AspNetCore.Authorization => 0x2d559dc982c94d8b => 184
	i64 3281594302220646930, ; 144: System.Security.Principal => 0x2d8a90a198ceba12 => 128
	i64 3289520064315143713, ; 145: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 323
	i64 3303437397778967116, ; 146: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 294
	i64 3311221304742556517, ; 147: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 82
	i64 3325875462027654285, ; 148: System.Runtime.Numerics => 0x2e27e21c8958b48d => 110
	i64 3328853167529574890, ; 149: System.Net.Sockets.dll => 0x2e327651a008c1ea => 75
	i64 3344514922410554693, ; 150: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 369
	i64 3396143930648122816, ; 151: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 247
	i64 3402534845034375023, ; 152: System.IdentityModel.Tokens.Jwt.dll => 0x2f383b6a0629a76f => 281
	i64 3429672777697402584, ; 153: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 273
	i64 3437845325506641314, ; 154: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 53
	i64 3493805808809882663, ; 155: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 349
	i64 3494946837667399002, ; 156: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 238
	i64 3508450208084372758, ; 157: System.Net.Ping => 0x30b084e02d03ad16 => 69
	i64 3522470458906976663, ; 158: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 348
	i64 3523004241079211829, ; 159: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 237
	i64 3531994851595924923, ; 160: System.Numerics => 0x31042a9aade235bb => 83
	i64 3551103847008531295, ; 161: System.Private.CoreLib.dll => 0x31480e226177735f => 172
	i64 3567343442040498961, ; 162: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 392
	i64 3571415421602489686, ; 163: System.Runtime.dll => 0x319037675df7e556 => 116
	i64 3577814467263827498, ; 164: BackendClassLibrary => 0x31a6f34d49838e2a => 404
	i64 3638003163729360188, ; 165: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 239
	i64 3647754201059316852, ; 166: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 156
	i64 3655542548057982301, ; 167: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 238
	i64 3659371656528649588, ; 168: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 288
	i64 3716579019761409177, ; 169: netstandard.dll => 0x3393f0ed5c8c5c99 => 167
	i64 3727469159507183293, ; 170: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 341
	i64 3753897248517198740, ; 171: Microsoft.AspNetCore.Components.WebView.dll => 0x341885a8952f1394 => 189
	i64 3772598417116884899, ; 172: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 315
	i64 3794322307918838949, ; 173: Microsoft.AspNetCore.Metadata.dll => 0x34a824092ed7bca5 => 205
	i64 3869221888984012293, ; 174: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 255
	i64 3869649043256705283, ; 175: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 32
	i64 3889433610606858880, ; 176: Microsoft.Extensions.FileProviders.Physical.dll => 0x35fa0b4301afd280 => 250
	i64 3890352374528606784, ; 177: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 271
	i64 3919223565570527920, ; 178: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 122
	i64 3933965368022646939, ; 179: System.Net.Requests => 0x369840a8bfadc09b => 72
	i64 3966267475168208030, ; 180: System.Memory => 0x370b03412596249e => 62
	i64 4005135229510678782, ; 181: Microsoft.AspNetCore.DataProtection.Abstractions => 0x379519456862f8fe => 194
	i64 4006972109285359177, ; 182: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 161
	i64 4009997192427317104, ; 183: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 113
	i64 4073500526318903918, ; 184: System.Private.Xml.dll => 0x3887fb25779ae26e => 88
	i64 4073631083018132676, ; 185: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 269
	i64 4120493066591692148, ; 186: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 403
	i64 4148881117810174540, ; 187: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 105
	i64 4154383907710350974, ; 188: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 189: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 146
	i64 4168469861834746866, ; 190: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 118
	i64 4187479170553454871, ; 191: System.Linq.Expressions => 0x3a1cea1e912fa117 => 58
	i64 4201423742386704971, ; 192: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 309
	i64 4202567570116092282, ; 193: Newtonsoft.Json.Bson => 0x3a5284f05958a17a => 278
	i64 4205801962323029395, ; 194: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4225924121207573736, ; 195: Microsoft.AspNetCore.Authentication.Abstractions => 0x3aa57f992c550ce8 => 182
	i64 4235503420553921860, ; 196: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 52
	i64 4243591448627561453, ; 197: Microsoft.AspNetCore.Http.Extensions.dll => 0x3ae443f06354c3ed => 201
	i64 4250192876909962317, ; 198: Microsoft.AspNetCore.Hosting.Abstractions => 0x3afbb7e72f1d244d => 196
	i64 4282138915307457788, ; 199: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 92
	i64 4356591372459378815, ; 200: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 400
	i64 4373617458794931033, ; 201: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 55
	i64 4384840217421645357, ; 202: Microsoft.AspNetCore.Components.Forms => 0x3cda14f22443862d => 187
	i64 4397634830160618470, ; 203: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 129
	i64 4431618353714093320, ; 204: Microsoft.AspNetCore.Antiforgery => 0x3d804569b93add08 => 181
	i64 4477672992252076438, ; 205: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 152
	i64 4484706122338676047, ; 206: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 41
	i64 4513320955448359355, ; 207: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 234
	i64 4533124835995628778, ; 208: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 92
	i64 4612482779465751747, ; 209: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 232
	i64 4636684751163556186, ; 210: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 353
	i64 4672453897036726049, ; 211: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 50
	i64 4679594760078841447, ; 212: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 370
	i64 4716677666592453464, ; 213: System.Xml.XmlSerializer => 0x417501590542f358 => 162
	i64 4743821336939966868, ; 214: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 215: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 327
	i64 4794310189461587505, ; 216: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 291
	i64 4795410492532947900, ; 217: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 348
	i64 4809057822547766521, ; 218: System.Drawing => 0x42bd349c3145ecf9 => 36
	i64 4814660307502931973, ; 219: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 67
	i64 4853321196694829351, ; 220: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 109
	i64 5055365687667823624, ; 221: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 292
	i64 5081566143765835342, ; 222: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 99
	i64 5099468265966638712, ; 223: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 99
	i64 5103417709280584325, ; 224: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5112836352847824253, ; 225: Microsoft.AspNetCore.WebUtilities.dll => 0x46f47192ee32c57d => 225
	i64 5119492727527269518, ; 226: Microsoft.AspNet.Identity.Core.dll => 0x470c1782ee75648e => 179
	i64 5177565741364132164, ; 227: Microsoft.AspNetCore.Http => 0x47da689c1f3db944 => 199
	i64 5182934613077526976, ; 228: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5197073077358930460, ; 229: Microsoft.AspNetCore.Components.Web.dll => 0x481fb66db7b9aa1c => 188
	i64 5205316157927637098, ; 230: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 334
	i64 5223612245689175824, ; 231: Microsoft.AspNetCore.Mvc.Localization => 0x487dffa95caf0f10 => 213
	i64 5244375036463807528, ; 232: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 233: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 128
	i64 5278787618751394462, ; 234: System.Net.WebClient.dll => 0x4942055efc68329e => 76
	i64 5280980186044710147, ; 235: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 326
	i64 5290786973231294105, ; 236: System.Runtime.Loader => 0x496ca6b869b72699 => 109
	i64 5376510917114486089, ; 237: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 352
	i64 5408338804355907810, ; 238: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 350
	i64 5423376490970181369, ; 239: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 106
	i64 5440320908473006344, ; 240: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5446034149219586269, ; 241: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 242: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 305
	i64 5457765010617926378, ; 243: System.Xml.Serialization => 0x4bbde05c557002ea => 157
	i64 5471532531798518949, ; 244: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 396
	i64 5488847537322884930, ; 245: System.Windows.Extensions => 0x4c2c4dc108687f42 => 286
	i64 5507995362134886206, ; 246: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 247: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 399
	i64 5527431512186326818, ; 248: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 49
	i64 5570799893513421663, ; 249: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 43
	i64 5573260873512690141, ; 250: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 126
	i64 5574231584441077149, ; 251: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 295
	i64 5591791169662171124, ; 252: System.Linq.Parallel => 0x4d9a087135e137f4 => 59
	i64 5593115988096097561, ; 253: Microsoft.AspNetCore.Routing.dll => 0x4d9ebd5b8a069d19 => 223
	i64 5610815111739789596, ; 254: Microsoft.AspNetCore.Authentication.Core => 0x4ddd9e9de3a4d11c => 183
	i64 5650097808083101034, ; 255: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 119
	i64 5692067934154308417, ; 256: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 355
	i64 5724799082821825042, ; 257: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 318
	i64 5741990095351817038, ; 258: Microsoft.Extensions.Localization.Abstractions.dll => 0x4fafa591c141a34e => 254
	i64 5757522595884336624, ; 259: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 304
	i64 5783556987928984683, ; 260: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5896680224035167651, ; 261: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 324
	i64 5959344983920014087, ; 262: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 344
	i64 5979151488806146654, ; 263: System.Formats.Asn1 => 0x52fa3699a489d25e => 38
	i64 5984759512290286505, ; 264: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 124
	i64 6068057819846744445, ; 265: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 393
	i64 6071643957938795858, ; 266: Blazorise => 0x5442d002c396b552 => 173
	i64 6102788177522843259, ; 267: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 344
	i64 6200764641006662125, ; 268: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 393
	i64 6222399776351216807, ; 269: System.Text.Json.dll => 0x565a67a0ffe264a7 => 137
	i64 6251069312384999852, ; 270: System.Transactions.Local => 0x56c0426b870da1ac => 149
	i64 6278736998281604212, ; 271: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 85
	i64 6284145129771520194, ; 272: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 90
	i64 6319713645133255417, ; 273: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 328
	i64 6357457916754632952, ; 274: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 406
	i64 6401687960814735282, ; 275: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 325
	i64 6459596646370694080, ; 276: Microsoft.AspNetCore.JsonPatch.dll => 0x59a518eceb3ad3c0 => 203
	i64 6478287442656530074, ; 277: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 381
	i64 6504860066809920875, ; 278: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 300
	i64 6548213210057960872, ; 279: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 311
	i64 6557084851308642443, ; 280: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 356
	i64 6560151584539558821, ; 281: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 259
	i64 6589202984700901502, ; 282: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 361
	i64 6591971792923354531, ; 283: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 326
	i64 6617685658146568858, ; 284: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 133
	i64 6702137467294796250, ; 285: Microsoft.AspNetCore.Mvc.Razor => 0x5d02c6845df149da => 214
	i64 6713440830605852118, ; 286: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 96
	i64 6739853162153639747, ; 287: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 288: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 389
	i64 6772837112740759457, ; 289: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 105
	i64 6777482997383978746, ; 290: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 392
	i64 6786606130239981554, ; 291: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 33
	i64 6798329586179154312, ; 292: System.Windows => 0x5e5884bd523ca188 => 154
	i64 6814185388980153342, ; 293: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 158
	i64 6876862101832370452, ; 294: System.Xml.Linq => 0x5f6f85a57d108914 => 155
	i64 6894844156784520562, ; 295: System.Numerics.Vectors => 0x5faf683aead1ad72 => 82
	i64 6911788284027924527, ; 296: Microsoft.AspNetCore.Hosting.Server.Abstractions => 0x5feb9ad2f830f02f => 197
	i64 6920570528939222495, ; 297: Microsoft.AspNetCore.Components.WebView => 0x600ace3ab475a5df => 189
	i64 7011053663211085209, ; 298: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 320
	i64 7060448593242414269, ; 299: System.Security.Cryptography.Xml => 0x61fbc096731edcbd => 284
	i64 7060896174307865760, ; 300: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 143
	i64 7083547580668757502, ; 301: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 87
	i64 7101497697220435230, ; 302: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 303: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 321
	i64 7105430439328552570, ; 304: System.Security.Cryptography.Pkcs => 0x629b8f56a06d167a => 283
	i64 7112547816752919026, ; 305: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 51
	i64 7123594442286643413, ; 306: Microsoft.AspNetCore.Razor.Runtime => 0x62dc1767207138d5 => 221
	i64 7192745174564810625, ; 307: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 290
	i64 7212891875261709792, ; 308: Blazorise.Licensing => 0x641956f1ec467de0 => 175
	i64 7220009545223068405, ; 309: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 396
	i64 7270811800166795866, ; 310: System.Linq => 0x64e71ccf51a90a5a => 61
	i64 7299370801165188114, ; 311: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 54
	i64 7316205155833392065, ; 312: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7331765743953618630, ; 313: Microsoft.AspNetCore.Http.dll => 0x65bfaa1948bba6c6 => 199
	i64 7338192458477945005, ; 314: System.Reflection => 0x65d67f295d0740ad => 97
	i64 7349431895026339542, ; 315: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 289
	i64 7377312882064240630, ; 316: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7462780778010324374, ; 317: BackendClassLibrary.dll => 0x67911f93fdeb2d96 => 404
	i64 7473077275758116397, ; 318: Microsoft.DotNet.PlatformAbstractions => 0x67b5b430309b3e2d => 230
	i64 7488575175965059935, ; 319: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 155
	i64 7489048572193775167, ; 320: System.ObjectModel => 0x67ee71ff6b419e3f => 84
	i64 7496222613193209122, ; 321: System.IdentityModel.Tokens.Jwt => 0x6807eec000a1b522 => 281
	i64 7592577537120840276, ; 322: System.Diagnostics.Process => 0x695e410af5b2aa54 => 29
	i64 7637303409920963731, ; 323: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 45
	i64 7654504624184590948, ; 324: System.Net.Http => 0x6a3a4366801b8264 => 64
	i64 7694700312542370399, ; 325: System.Net.Mail => 0x6ac9112a7e2cda5f => 66
	i64 7708790323521193081, ; 326: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 387
	i64 7714652370974252055, ; 327: System.Private.CoreLib => 0x6b0ff375198b9c17 => 172
	i64 7725404731275645577, ; 328: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 329
	i64 7735176074855944702, ; 329: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 330: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 364
	i64 7791074099216502080, ; 331: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 47
	i64 7820441508502274321, ; 332: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7824823231109474690, ; 333: Microsoft.AspNetCore.Authorization.Policy.dll => 0x6c975b4560812982 => 185
	i64 7836164640616011524, ; 334: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 297
	i64 7939716343021325499, ; 335: MudBlazor.dll => 0x6e2f89f293264cbb => 276
	i64 7972383140441761405, ; 336: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 236
	i64 8014722069583580780, ; 337: Microsoft.AspNetCore.Components.Forms.dll => 0x6f3a03422b034e6c => 187
	i64 8025517457475554965, ; 338: WindowsBase => 0x6f605d9b4786ce95 => 165
	i64 8031450141206250471, ; 339: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 108
	i64 8064050204834738623, ; 340: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 341: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 323
	i64 8085230611270010360, ; 342: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 63
	i64 8087206902342787202, ; 343: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 27
	i64 8103644804370223335, ; 344: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8113615946733131500, ; 345: System.Reflection.Extensions => 0x70995ab73cf916ec => 93
	i64 8138277578025671259, ; 346: Microsoft.AspNetCore.Cors => 0x70f0f856b9bf1a5b => 191
	i64 8167236081217502503, ; 347: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 168
	i64 8185542183669246576, ; 348: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 349: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 368
	i64 8231203754134385653, ; 350: Blazorise.Animate.dll => 0x723b1c341f0ab3f5 => 174
	i64 8246048515196606205, ; 351: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 274
	i64 8264926008854159966, ; 352: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 29
	i64 8290740647658429042, ; 353: System.Runtime.Extensions => 0x730ea0b15c929a72 => 103
	i64 8318905602908530212, ; 354: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8342572048615572890, ; 355: Microsoft.AspNetCore.Cors.dll => 0x73c6c513ced5859a => 191
	i64 8368701292315763008, ; 356: System.Security.Cryptography => 0x7423997c6fd56140 => 126
	i64 8398329775253868912, ; 357: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 306
	i64 8399132193771933415, ; 358: Microsoft.Extensions.WebEncoders => 0x748fb63acf52cee7 => 261
	i64 8400357532724379117, ; 359: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 338
	i64 8410671156615598628, ; 360: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 91
	i64 8426919725312979251, ; 361: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 327
	i64 8476857680833348370, ; 362: System.Security.Permissions.dll => 0x75a3d925fd9d0312 => 285
	i64 8518412311883997971, ; 363: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8519205576476231015, ; 364: Microsoft.AspNetCore.Mvc.Core.dll => 0x763a4c55ca648567 => 209
	i64 8563666267364444763, ; 365: System.Private.Uri => 0x76d841191140ca5b => 86
	i64 8598790081731763592, ; 366: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 317
	i64 8601935802264776013, ; 367: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 350
	i64 8611142787134128904, ; 368: Microsoft.AspNetCore.Hosting.Server.Abstractions.dll => 0x7780ecbdb94c0308 => 197
	i64 8614108721271900878, ; 369: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 391
	i64 8623059219396073920, ; 370: System.Net.Quic.dll => 0x77ab42ac514299c0 => 71
	i64 8626175481042262068, ; 371: Java.Interop => 0x77b654e585b55834 => 168
	i64 8638972117149407195, ; 372: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 373: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 337
	i64 8645670454055795788, ; 374: Microsoft.EntityFrameworkCore.InMemory.dll => 0x77fb9778a315fc4c => 233
	i64 8648495978913578441, ; 375: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8677882282824630478, ; 376: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 391
	i64 8684531736582871431, ; 377: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 44
	i64 8725526185868997716, ; 378: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 27
	i64 8853378295825400934, ; 379: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 365
	i64 8886598895004054153, ; 380: Microsoft.AspNetCore.Mvc.Cors.dll => 0x7b538a9c9e187289 => 210
	i64 8893249077141143629, ; 381: Microsoft.AspNetCore.Mvc.ApiExplorer.dll => 0x7b6b2aeace11804d => 208
	i64 8941376889969657626, ; 382: System.Xml.XDocument => 0x7c1626e87187471a => 158
	i64 8951477988056063522, ; 383: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 340
	i64 8954753533646919997, ; 384: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 112
	i64 8955323522379913726, ; 385: Microsoft.Identity.Client => 0x7c47b34bd82799fe => 262
	i64 9045785047181495996, ; 386: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 401
	i64 9052662452269567435, ; 387: Microsoft.IdentityModel.Protocols => 0x7da184898b0b4dcb => 265
	i64 9111603110219107042, ; 388: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 237
	i64 9138683372487561558, ; 389: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 121
	i64 9250544137016314866, ; 390: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 231
	i64 9312692141327339315, ; 391: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 355
	i64 9324707631942237306, ; 392: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 296
	i64 9413000421947348542, ; 393: Microsoft.AspNetCore.Hosting.Abstractions.dll => 0x82a1b202f4c6163e => 196
	i64 9427266486299436557, ; 394: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 264
	i64 9468215723722196442, ; 395: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 159
	i64 9500688326720985260, ; 396: Microsoft.EntityFrameworkCore.SqlServer => 0x83d939b243e798ac => 235
	i64 9554839972845591462, ; 397: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 131
	i64 9575902398040817096, ; 398: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 360
	i64 9584643793929893533, ; 399: System.IO.dll => 0x85037ebfbbd7f69d => 57
	i64 9643464320970503839, ; 400: Microsoft.AspNet.Identity.EntityFramework => 0x85d477b4e799b69f => 180
	i64 9650158550865574924, ; 401: Microsoft.Extensions.Configuration.Json => 0x85ec4012c28a7c0c => 242
	i64 9659729154652888475, ; 402: System.Text.RegularExpressions => 0x860e407c9991dd9b => 138
	i64 9662334977499516867, ; 403: System.Numerics.dll => 0x8617827802b0cfc3 => 83
	i64 9667360217193089419, ; 404: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 30
	i64 9678050649315576968, ; 405: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 307
	i64 9702891218465930390, ; 406: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9780093022148426479, ; 407: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 357
	i64 9808709177481450983, ; 408: Mono.Android.dll => 0x881f890734e555e7 => 171
	i64 9819168441846169364, ; 409: Microsoft.IdentityModel.Protocols.dll => 0x8844b1ac75f77f14 => 265
	i64 9825649861376906464, ; 410: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 304
	i64 9834056768316610435, ; 411: System.Transactions.dll => 0x8879968718899783 => 150
	i64 9836529246295212050, ; 412: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 94
	i64 9864374015518639636, ; 413: Microsoft.AspNetCore.Cryptography.Internal => 0x88e54be746950614 => 192
	i64 9907349773706910547, ; 414: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 317
	i64 9924019376719386149, ; 415: EntityFramework => 0x89b9330b1d73d625 => 177
	i64 9933555792566666578, ; 416: System.Linq.Queryable.dll => 0x89db145cf475c552 => 60
	i64 9938556199016768930, ; 417: Microsoft.AspNetCore.Routing => 0x89ecd834cea6a5a2 => 223
	i64 9956195530459977388, ; 418: Microsoft.Maui => 0x8a2b8315b36616ac => 272
	i64 9974604633896246661, ; 419: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 157
	i64 9991543690424095600, ; 420: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 376
	i64 9994308163963284983, ; 421: Newtonsoft.Json.Bson.dll => 0x8ab2ea52b0d16df7 => 278
	i64 10017511394021241210, ; 422: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 257
	i64 10038780035334861115, ; 423: System.Net.Http.dll => 0x8b50e941206af13b => 64
	i64 10051358222726253779, ; 424: System.Private.Xml => 0x8b7d990c97ccccd3 => 88
	i64 10078727084704864206, ; 425: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 79
	i64 10089571585547156312, ; 426: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 47
	i64 10092835686693276772, ; 427: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 270
	i64 10105485790837105934, ; 428: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 143
	i64 10143853363526200146, ; 429: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 373
	i64 10205853378024263619, ; 430: Microsoft.Extensions.Configuration.Binder => 0x8da279930adb4fc3 => 240
	i64 10226222362177979215, ; 431: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 366
	i64 10229024438826829339, ; 432: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 311
	i64 10236703004850800690, ; 433: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 74
	i64 10243523786148452761, ; 434: Microsoft.AspNetCore.Http.Abstractions => 0x8e284e9c69a49999 => 200
	i64 10245369515835430794, ; 435: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 91
	i64 10321854143672141184, ; 436: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 363
	i64 10357309525532190134, ; 437: Microsoft.AspNetCore.Mvc.RazorPages.dll => 0x8fbc8e235a1da5b6 => 216
	i64 10360651442923773544, ; 438: System.Text.Encoding => 0x8fc86d98211c1e68 => 135
	i64 10364469296367737616, ; 439: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 90
	i64 10376576884623852283, ; 440: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 349
	i64 10406448008575299332, ; 441: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 369
	i64 10430153318873392755, ; 442: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 308
	i64 10458986597687352396, ; 443: Microsoft.AspNetCore.Routing.Abstractions => 0x9125c8e581b9dc4c => 224
	i64 10506226065143327199, ; 444: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 371
	i64 10521980565667308266, ; 445: Microsoft.AspNetCore.Razor.dll => 0x920595939e29e2ea => 219
	i64 10546663366131771576, ; 446: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 112
	i64 10566960649245365243, ; 447: System.Globalization.dll => 0x92a562b96dcd13fb => 42
	i64 10595762989148858956, ; 448: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 159
	i64 10670374202010151210, ; 449: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 450: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 103
	i64 10722976995944589488, ; 451: EntityFramework.dll => 0x94cfaac3d9f668b0 => 177
	i64 10734191584620811116, ; 452: Microsoft.Extensions.FileProviders.Embedded.dll => 0x94f7825fc04f936c => 249
	i64 10785150219063592792, ; 453: System.Net.Primitives => 0x95ac8cfb68830758 => 70
	i64 10811915265162633087, ; 454: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 234
	i64 10822644899632537592, ; 455: System.Linq.Queryable => 0x9631c23204ca5ff8 => 60
	i64 10830817578243619689, ; 456: System.Formats.Tar => 0x964ecb340a447b69 => 39
	i64 10847732767863316357, ; 457: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 298
	i64 10889380495983713167, ; 458: Microsoft.Data.SqlClient.dll => 0x971ed9dddf2d1b8f => 229
	i64 10899834349646441345, ; 459: System.Web => 0x9743fd975946eb81 => 153
	i64 10929237632997888614, ; 460: Microsoft.AspNetCore.Html.Abstractions => 0x97ac73b8bcab9266 => 198
	i64 10943875058216066601, ; 461: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 56
	i64 10964653383833615866, ; 462: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 34
	i64 10972388274974066310, ; 463: Microsoft.AspNetCore.Razor.Language => 0x9845c1007b7d8686 => 220
	i64 11002576679268595294, ; 464: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 256
	i64 11009005086950030778, ; 465: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 272
	i64 11019817191295005410, ; 466: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 295
	i64 11023048688141570732, ; 467: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 468: System.Xml => 0x992e31d0412bf7fc => 163
	i64 11050168729868392624, ; 469: Microsoft.AspNetCore.Http.Features => 0x995a15e9dbef58b0 => 202
	i64 11051904132540108364, ; 470: Microsoft.Extensions.FileProviders.Composite.dll => 0x99604040c7b98e4c => 248
	i64 11071824625609515081, ; 471: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 361
	i64 11103970607964515343, ; 472: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 382
	i64 11136029745144976707, ; 473: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 359
	i64 11162124722117608902, ; 474: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 354
	i64 11188319605227840848, ; 475: System.Threading.Overlapped => 0x9b44e5671724e550 => 140
	i64 11218356222449480316, ; 476: Microsoft.AspNetCore.Components => 0x9baf9b8c02e4f27c => 186
	i64 11220793807500858938, ; 477: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 385
	i64 11226290749488709958, ; 478: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 259
	i64 11235648312900863002, ; 479: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 89
	i64 11289839951755190085, ; 480: Blazorise.Animate => 0x9cad919eb7619f45 => 174
	i64 11329751333533450475, ; 481: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 147
	i64 11340910727871153756, ; 482: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 310
	i64 11341245327015630248, ; 483: System.Configuration.ConfigurationManager.dll => 0x9d643289535355a8 => 279
	i64 11347436699239206956, ; 484: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 162
	i64 11392833485892708388, ; 485: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 339
	i64 11432101114902388181, ; 486: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 487: Mono.Android.Export => 0x9edabf8623efc131 => 169
	i64 11448276831755070604, ; 488: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 31
	i64 11485890710487134646, ; 489: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 107
	i64 11508496261504176197, ; 490: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 320
	i64 11513602507638267977, ; 491: System.IO.Pipelines.dll => 0x9fc8887aa0d36049 => 282
	i64 11518296021396496455, ; 492: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 383
	i64 11529969570048099689, ; 493: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 354
	i64 11530571088791430846, ; 494: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 255
	i64 11564861549255168062, ; 495: Microsoft.CodeAnalysis.dll => 0xa07ea44e47ed903e => 226
	i64 11580057168383206117, ; 496: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 293
	i64 11591352189662810718, ; 497: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 347
	i64 11597940890313164233, ; 498: netstandard => 0xa0f429ca8d1805c9 => 167
	i64 11672361001936329215, ; 499: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 321
	i64 11692977985522001935, ; 500: System.Threading.Overlapped.dll => 0xa245cd869980680f => 140
	i64 11705530742807338875, ; 501: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 379
	i64 11707554492040141440, ; 502: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 59
	i64 11743665907891708234, ; 503: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 144
	i64 11868746509924019608, ; 504: Microsoft.AspNetCore.Mvc.ApiExplorer => 0xa4b64211452dad98 => 208
	i64 11991047634523762324, ; 505: System.Net => 0xa668c24ad493ae94 => 81
	i64 12040886584167504988, ; 506: System.Net.ServicePoint => 0xa719d28d8e121c5c => 74
	i64 12048689113179125827, ; 507: Microsoft.Extensions.FileProviders.Physical => 0xa7358ae968287843 => 250
	i64 12058074296353848905, ; 508: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 251
	i64 12063623837170009990, ; 509: System.Security => 0xa76a99f6ce740786 => 130
	i64 12096697103934194533, ; 510: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 511: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 512: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 93
	i64 12137774235383566651, ; 513: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 351
	i64 12145679461940342714, ; 514: System.Text.Json => 0xa88e1f1ebcb62fba => 137
	i64 12191646537372739477, ; 515: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 287
	i64 12198439281774268251, ; 516: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0xa9498fe58c538f5b => 266
	i64 12201331334810686224, ; 517: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 113
	i64 12269460666702402136, ; 518: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12310909314810916455, ; 519: Microsoft.Extensions.Localization.dll => 0xaad922cbbb5a2e67 => 253
	i64 12313367145828839434, ; 520: System.IO.Pipelines => 0xaae1de2e1c17f00a => 282
	i64 12332222936682028543, ; 521: System.Runtime.Handles => 0xab24db6c07db5dff => 104
	i64 12375446203996702057, ; 522: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12439275739440478309, ; 523: Microsoft.IdentityModel.JsonWebTokens => 0xaca12f61007bf865 => 263
	i64 12441092376399691269, ; 524: Microsoft.AspNetCore.Authentication.Abstractions.dll => 0xaca7a399c11fbe05 => 182
	i64 12449521524599790614, ; 525: Microsoft.AspNetCore.Mvc.dll => 0xacc595ddc1599c16 => 206
	i64 12451044538927396471, ; 526: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 319
	i64 12466513435562512481, ; 527: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 333
	i64 12475113361194491050, ; 528: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 406
	i64 12487638416075308985, ; 529: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 313
	i64 12493213219680520345, ; 530: Microsoft.Data.SqlClient => 0xad60cf3b3e458899 => 229
	i64 12517810545449516888, ; 531: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 33
	i64 12538491095302438457, ; 532: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 301
	i64 12550732019250633519, ; 533: System.IO.Compression => 0xae2d28465e8e1b2f => 46
	i64 12681088699309157496, ; 534: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 384
	i64 12699999919562409296, ; 535: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 30
	i64 12700543734426720211, ; 536: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 302
	i64 12708238894395270091, ; 537: System.IO => 0xb05cbbf17d3ba3cb => 57
	i64 12708922737231849740, ; 538: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 134
	i64 12717050818822477433, ; 539: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 114
	i64 12742166704152928552, ; 540: Microsoft.CodeAnalysis.Razor.dll => 0xb0d5451b45d86128 => 228
	i64 12753841065332862057, ; 541: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 356
	i64 12823819093633476069, ; 542: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 397
	i64 12828192437253469131, ; 543: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 367
	i64 12835242264250840079, ; 544: System.IO.Pipes => 0xb21ff0d5d6c0740f => 55
	i64 12843321153144804894, ; 545: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 260
	i64 12843770487262409629, ; 546: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 547: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 77
	i64 12963446364377008305, ; 548: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 280
	i64 12982280885948128408, ; 549: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 312
	i64 12991459499837607210, ; 550: Microsoft.CodeAnalysis => 0xb44aef9559b1cd2a => 226
	i64 13003699287675270979, ; 551: Microsoft.AspNetCore.Components.WebView.Maui => 0xb4766b9b07e27743 => 190
	i64 13068258254871114833, ; 552: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 111
	i64 13070736518021853291, ; 553: Microsoft.AspNetCore.JsonPatch => 0xb564959c856b306b => 203
	i64 13086625805112021739, ; 554: Microsoft.AspNetCore.DataProtection.Abstractions.dll => 0xb59d08d5762992eb => 194
	i64 13122923747915422861, ; 555: Microsoft.AspNetCore.Localization => 0xb61dfd9ed9095c8d => 204
	i64 13129914918964716986, ; 556: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 316
	i64 13162471042547327635, ; 557: System.Security.Permissions => 0xb6aa7dace9662293 => 285
	i64 13173818576982874404, ; 558: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 102
	i64 13221551921002590604, ; 559: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 371
	i64 13222659110913276082, ; 560: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 385
	i64 13308002692117796025, ; 561: Microsoft.AspNetCore.Routing.Abstractions.dll => 0xb8af85f08d9f94b9 => 224
	i64 13343850469010654401, ; 562: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 170
	i64 13370592475155966277, ; 563: System.Runtime.Serialization => 0xb98de304062ea945 => 115
	i64 13381594904270902445, ; 564: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 379
	i64 13401370062847626945, ; 565: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 351
	i64 13404347523447273790, ; 566: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 306
	i64 13404984788036896679, ; 567: Microsoft.AspNetCore.Http.Abstractions.dll => 0xba0812a45e7447a7 => 200
	i64 13431476299110033919, ; 568: System.Net.WebClient => 0xba663087f18829ff => 76
	i64 13454009404024712428, ; 569: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 362
	i64 13463706743370286408, ; 570: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 85
	i64 13465488254036897740, ; 571: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 364
	i64 13467053111158216594, ; 572: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 399
	i64 13491513212026656886, ; 573: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 299
	i64 13540124433173649601, ; 574: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 400
	i64 13545416393490209236, ; 575: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 383
	i64 13550417756503177631, ; 576: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 247
	i64 13572454107664307259, ; 577: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 341
	i64 13578472628727169633, ; 578: System.Xml.XPath => 0xbc706ce9fba5c261 => 160
	i64 13580399111273692417, ; 579: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13618112415141049676, ; 580: Microsoft.AspNetCore.Mvc.Core => 0xbcfd4116f7d1b54c => 209
	i64 13621154251410165619, ; 581: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 312
	i64 13637569584472253285, ; 582: Microsoft.AspNetCore.Mvc => 0xbd4261483a23e365 => 206
	i64 13647894001087880694, ; 583: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 584: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 292
	i64 13702626353344114072, ; 585: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 32
	i64 13710614125866346983, ; 586: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 117
	i64 13713329104121190199, ; 587: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 37
	i64 13717397318615465333, ; 588: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13755568601956062840, ; 589: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 378
	i64 13768883594457632599, ; 590: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 52
	i64 13814445057219246765, ; 591: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 381
	i64 13828521679616088467, ; 592: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 365
	i64 13881769479078963060, ; 593: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13882652712560114096, ; 594: System.Windows.Extensions.dll => 0xc0a91716b04239b0 => 286
	i64 13911222732217019342, ; 595: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 123
	i64 13921917134693230900, ; 596: Microsoft.AspNetCore.WebUtilities => 0xc13495df5dd06934 => 225
	i64 13928444506500929300, ; 597: System.Windows.dll => 0xc14bc67b8bba9714 => 154
	i64 13939962644205322370, ; 598: Microsoft.AspNetCore.Razor.Language.dll => 0xc174b22af612c082 => 220
	i64 13955418299340266673, ; 599: Microsoft.Extensions.DependencyModel.dll => 0xc1ab9b0118299cb1 => 246
	i64 13959074834287824816, ; 600: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 319
	i64 14075334701871371868, ; 601: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 131
	i64 14082136096249122791, ; 602: Microsoft.AspNetCore.Metadata => 0xc36dcc2b4fa28fe7 => 205
	i64 14100563506285742564, ; 603: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 373
	i64 14124974489674258913, ; 604: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 301
	i64 14125464355221830302, ; 605: System.Threading.dll => 0xc407bafdbc707a9e => 148
	i64 14133832980772275001, ; 606: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 231
	i64 14178052285788134900, ; 607: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 288
	i64 14199657271608119382, ; 608: Microsoft.AspNetCore.Localization.dll => 0xc50f510e367e9056 => 204
	i64 14212104595480609394, ; 609: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 120
	i64 14220608275227875801, ; 610: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 28
	i64 14226382999226559092, ; 611: System.ServiceProcess => 0xc56e43f6938e2a74 => 132
	i64 14232023429000439693, ; 612: System.Resources.Writer.dll => 0xc5824de7789ba78d => 100
	i64 14254574811015963973, ; 613: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 134
	i64 14261073672896646636, ; 614: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 339
	i64 14261232074598307362, ; 615: Microsoft.AspNetCore.Mvc.Abstractions => 0xc5ea130339d6d622 => 207
	i64 14298246716367104064, ; 616: System.Web.dll => 0xc66d93a217f4e840 => 153
	i64 14327695147300244862, ; 617: System.Reflection.dll => 0xc6d632d338eb4d7e => 97
	i64 14327709162229390963, ; 618: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 125
	i64 14331727281556788554, ; 619: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 289
	i64 14346402571976470310, ; 620: System.Net.Ping.dll => 0xc718a920f3686f26 => 69
	i64 14461014870687870182, ; 621: System.Net.Requests.dll => 0xc8afd8683afdece6 => 72
	i64 14464374589798375073, ; 622: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 394
	i64 14486659737292545672, ; 623: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 324
	i64 14495724990987328804, ; 624: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 342
	i64 14522721392235705434, ; 625: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 375
	i64 14528548208938697926, ; 626: Microsoft.AspNetCore.Mvc.Abstractions.dll => 0xc99fc59ed7edc4c6 => 207
	i64 14545984428646047311, ; 627: Blazorise.Licensing.dll => 0xc9ddb7c519cf9e4f => 175
	i64 14551742072151931844, ; 628: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 136
	i64 14561513370130550166, ; 629: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 124
	i64 14569958227297576184, ; 630: Microsoft.AspNetCore.Mvc.Razor.Extensions => 0xca32e3d0125a24f8 => 215
	i64 14574160591280636898, ; 631: System.Net.Quic => 0xca41d1d72ec783e2 => 71
	i64 14622043554576106986, ; 632: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 111
	i64 14644440854989303794, ; 633: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 334
	i64 14669215534098758659, ; 634: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 244
	i64 14690985099581930927, ; 635: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 152
	i64 14705122255218365489, ; 636: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 386
	i64 14711489710198462279, ; 637: Microsoft.AspNetCore.Mvc.ViewFeatures.dll => 0xcc29b5f255319747 => 218
	i64 14744092281598614090, ; 638: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 402
	i64 14792063746108907174, ; 639: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 362
	i64 14832630590065248058, ; 640: System.Security.Claims => 0xcdd816ef5d6e873a => 118
	i64 14835122486566269605, ; 641: Microsoft.AspNetCore.Mvc.TagHelpers.dll => 0xcde0f14d3b3132a5 => 217
	i64 14852515768018889994, ; 642: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 310
	i64 14889905118082851278, ; 643: GoogleGson.dll => 0xcea391d0969961ce => 178
	i64 14892012299694389861, ; 644: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 403
	i64 14904040806490515477, ; 645: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 370
	i64 14912225920358050525, ; 646: System.Security.Principal.Windows => 0xcef2de7759506add => 127
	i64 14935719434541007538, ; 647: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 133
	i64 14954917835170835695, ; 648: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 245
	i64 14984936317414011727, ; 649: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 77
	i64 14987728460634540364, ; 650: System.IO.Compression.dll => 0xcfff1ba06622494c => 46
	i64 14988210264188246988, ; 651: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 313
	i64 14997925763760621062, ; 652: Microsoft.AspNetCore.Razor.Runtime.dll => 0xd02356050ca18606 => 221
	i64 15004680457737980385, ; 653: Microsoft.Extensions.Configuration.UserSecrets => 0xd03b5560cbb7c9e1 => 243
	i64 15015154896917945444, ; 654: System.Net.Security.dll => 0xd0608bd33642dc64 => 73
	i64 15024878362326791334, ; 655: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 63
	i64 15071021337266399595, ; 656: System.Resources.Reader.dll => 0xd127060e7a18a96b => 98
	i64 15076659072870671916, ; 657: System.ObjectModel.dll => 0xd13b0d8c1620662c => 84
	i64 15111608613780139878, ; 658: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 387
	i64 15115185479366240210, ; 659: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 43
	i64 15133485256822086103, ; 660: System.Linq.dll => 0xd204f0a9127dd9d7 => 61
	i64 15150743910298169673, ; 661: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 340
	i64 15188318564056798176, ; 662: Microsoft.AspNetCore.Mvc.TagHelpers => 0xd2c7bf434a1393e0 => 217
	i64 15227001540531775957, ; 663: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 239
	i64 15234786388537674379, ; 664: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 37
	i64 15250465174479574862, ; 665: System.Globalization.Calendars.dll => 0xd3a489469852174e => 40
	i64 15272359115529052076, ; 666: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 303
	i64 15279429628684179188, ; 667: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 368
	i64 15299439993936780255, ; 668: System.Xml.XPath.dll => 0xd452879d55019bdf => 160
	i64 15332518387094693223, ; 669: Microsoft.AspNetCore.Mvc.DataAnnotations.dll => 0xd4c80c3ce6eca567 => 211
	i64 15338463749992804988, ; 670: System.Resources.Reader => 0xd4dd2b839286f27c => 98
	i64 15355483035186022585, ; 671: Microsoft.AspNet.Identity.Core => 0xd519a276b2ccc8b9 => 179
	i64 15370028218478381000, ; 672: Microsoft.Extensions.Localization.Abstractions => 0xd54d4f3b162247c8 => 254
	i64 15370334346939861994, ; 673: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 308
	i64 15391712275433856905, ; 674: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 245
	i64 15427448221306938193, ; 675: Microsoft.AspNetCore.Components.Web => 0xd6194e6b4dbb6351 => 188
	i64 15481710163200268842, ; 676: Microsoft.Extensions.FileProviders.Composite => 0xd6da155e291b5a2a => 248
	i64 15526743539506359484, ; 677: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 135
	i64 15527772828719725935, ; 678: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 679: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 65
	i64 15536481058354060254, ; 680: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 374
	i64 15541854775306130054, ; 681: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 125
	i64 15557562860424774966, ; 682: System.Net.Sockets => 0xd7e790fe7a6dc536 => 75
	i64 15565247197164990907, ; 683: Microsoft.AspNetCore.Http.Extensions => 0xd802dddb8c29f1bb => 201
	i64 15582737692548360875, ; 684: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 332
	i64 15592226634512578529, ; 685: Microsoft.AspNetCore.Authorization.dll => 0xd862b7834f81b7e1 => 184
	i64 15609085926864131306, ; 686: System.dll => 0xd89e9cf3334914ea => 164
	i64 15620595871140898079, ; 687: Microsoft.Extensions.DependencyModel => 0xd8c7812eef49651f => 246
	i64 15637608551555227372, ; 688: Microsoft.AspNetCore.Mvc.Razor.dll => 0xd903f220440f5eec => 214
	i64 15661133872274321916, ; 689: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 156
	i64 15664356999916475676, ; 690: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 374
	i64 15710114879900314733, ; 691: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15735700225633954557, ; 692: Microsoft.Extensions.Localization => 0xda606ffbe0f22afd => 253
	i64 15743187114543869802, ; 693: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 382
	i64 15755368083429170162, ; 694: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 49
	i64 15777549416145007739, ; 695: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 346
	i64 15783653065526199428, ; 696: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 375
	i64 15817206913877585035, ; 697: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 144
	i64 15827202283623377193, ; 698: Microsoft.Extensions.Configuration.Json.dll => 0xdba5849eef9f6929 => 242
	i64 15847085070278954535, ; 699: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 139
	i64 15852824340364052161, ; 700: Microsoft.AspNetCore.Http.Features.dll => 0xdc008bbee610c6c1 => 202
	i64 15885744048853936810, ; 701: System.Resources.Writer => 0xdc75800bd0b6eaaa => 100
	i64 15928521404965645318, ; 702: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 269
	i64 15934062614519587357, ; 703: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 123
	i64 15937190497610202713, ; 704: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 120
	i64 15963349826457351533, ; 705: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 142
	i64 15971679995444160383, ; 706: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 39
	i64 16018552496348375205, ; 707: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 68
	i64 16027684189145026053, ; 708: Microsoft.AspNetCore.DataProtection => 0xde6dc5da0a224e05 => 193
	i64 16046481083542319511, ; 709: Microsoft.Extensions.ObjectPool => 0xdeb08d870f90b197 => 258
	i64 16054465462676478687, ; 710: System.Globalization.Extensions => 0xdecceb47319bdadf => 41
	i64 16153500642854367575, ; 711: Microsoft.Extensions.WebEncoders.dll => 0xe02cc33ff060f157 => 261
	i64 16154507427712707110, ; 712: System => 0xe03056ea4e39aa26 => 164
	i64 16219561732052121626, ; 713: System.Net.Security => 0xe1177575db7c781a => 73
	i64 16288847719894691167, ; 714: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 388
	i64 16315482530584035869, ; 715: WindowsBase.dll => 0xe26c3ceb1e8d821d => 165
	i64 16321164108206115771, ; 716: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 256
	i64 16337011941688632206, ; 717: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 127
	i64 16344871930018146979, ; 718: Microsoft.AspNetCore.ResponseCaching.Abstractions => 0xe2d4a66be7fc2aa3 => 222
	i64 16361933716545543812, ; 719: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 318
	i64 16423015068819898779, ; 720: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 367
	i64 16454459195343277943, ; 721: System.Net.NetworkInformation => 0xe459fb756d988f77 => 68
	i64 16488421939578743064, ; 722: ConersApp.dll => 0xe4d2a46507592918 => 0
	i64 16496768397145114574, ; 723: Mono.Android.Export.dll => 0xe4f04b741db987ce => 169
	i64 16523284800709429098, ; 724: Microsoft.AspNetCore.DataProtection.dll => 0xe54e7ffb6ce5876a => 193
	i64 16586971685355653868, ; 725: Microsoft.AspNetCore.Mvc.RazorPages => 0xe630c2ddc5160aec => 216
	i64 16589693266713801121, ; 726: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 331
	i64 16621146507174665210, ; 727: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 305
	i64 16649148416072044166, ; 728: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 274
	i64 16677317093839702854, ; 729: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 338
	i64 16702652415771857902, ; 730: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 151
	i64 16709499819875633724, ; 731: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 45
	i64 16737807731308835127, ; 732: System.Runtime.Intrinsics => 0xe848a3736f733137 => 108
	i64 16758309481308491337, ; 733: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 48
	i64 16762783179241323229, ; 734: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 96
	i64 16765015072123548030, ; 735: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 31
	i64 16793451114543296636, ; 736: Microsoft.AspNetCore.Mvc.ViewFeatures => 0xe90e52d02b3db07c => 218
	i64 16822611501064131242, ; 737: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 738: mscorlib => 0xe99c30c1484d7f4f => 166
	i64 16856067890322379635, ; 739: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16890310621557459193, ; 740: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 138
	i64 16933958494752847024, ; 741: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 78
	i64 16942731696432749159, ; 742: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 395
	i64 16977952268158210142, ; 743: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 54
	i64 16989020923549080504, ; 744: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 331
	i64 16998075588627545693, ; 745: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 336
	i64 17008137082415910100, ; 746: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17024911836938395553, ; 747: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 294
	i64 17031351772568316411, ; 748: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 335
	i64 17037200463775726619, ; 749: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 322
	i64 17047433665992082296, ; 750: Microsoft.Extensions.Configuration.FileExtensions => 0xec94a699197e4378 => 241
	i64 17047637518392099970, ; 751: Microsoft.AspNetCore.Antiforgery.dll => 0xec9560002f620482 => 181
	i64 17062143951396181894, ; 752: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17071469805149661853, ; 753: Microsoft.Extensions.Configuration.UserSecrets.dll => 0xecea0b56d9c0aa9d => 243
	i64 17079998892748052666, ; 754: Microsoft.AspNetCore.Components.dll => 0xed08587fce5018ba => 186
	i64 17089008752050867324, ; 755: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 402
	i64 17118171214553292978, ; 756: System.Threading.Channels => 0xed8ff6060fc420b2 => 139
	i64 17126545051278881272, ; 757: Microsoft.Net.Http.Headers.dll => 0xedadb5fbdb33b1f8 => 275
	i64 17137864900836977098, ; 758: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 267
	i64 17187273293601214786, ; 759: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17201328579425343169, ; 760: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 761: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 122
	i64 17205988430934219272, ; 762: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 251
	i64 17230721278011714856, ; 763: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 87
	i64 17234219099804750107, ; 764: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 149
	i64 17260702271250283638, ; 765: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17311256152179951039, ; 766: Microsoft.AspNetCore.Mvc.Formatters.Json => 0xf03defc05e7b45bf => 212
	i64 17333249706306540043, ; 767: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 34
	i64 17338386382517543202, ; 768: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 79
	i64 17342750010158924305, ; 769: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 380
	i64 17360349973592121190, ; 770: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 360
	i64 17438153253682247751, ; 771: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 395
	i64 17470386307322966175, ; 772: System.Threading.Timer => 0xf27347c8d0d5709f => 147
	i64 17509662556995089465, ; 773: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 80
	i64 17514990004910432069, ; 774: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 378
	i64 17522591619082469157, ; 775: GoogleGson => 0xf32cc03d27a5bf25 => 178
	i64 17590473451926037903, ; 776: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 287
	i64 17623389608345532001, ; 777: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 390
	i64 17627500474728259406, ; 778: System.Globalization => 0xf4a176498a351f4e => 42
	i64 17685921127322830888, ; 779: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17702523067201099846, ; 780: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 401
	i64 17704177640604968747, ; 781: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 333
	i64 17710060891934109755, ; 782: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 330
	i64 17712670374920797664, ; 783: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 107
	i64 17727630781806093631, ; 784: Microsoft.AspNetCore.Diagnostics.Abstractions => 0xf605324562d5253f => 195
	i64 17777860260071588075, ; 785: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 110
	i64 17790600151040787804, ; 786: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 264
	i64 17830780619298983968, ; 787: Microsoft.AspNetCore.Razor => 0xf773a880713c5020 => 219
	i64 17838668724098252521, ; 788: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17891337867145587222, ; 789: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 363
	i64 17911643751311784505, ; 790: Microsoft.Net.Http.Headers => 0xf892f1178448ba39 => 275
	i64 17928294245072900555, ; 791: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 44
	i64 17980511283171830800, ; 792: RazorClassLibrary1 => 0xf9879bbf495c2c10 => 405
	i64 17981332794496557478, ; 793: EntityFramework.SqlServer => 0xf98a86e84c0ca1a6 => 176
	i64 17992315986609351877, ; 794: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 161
	i64 18017743553296241350, ; 795: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 236
	i64 18025913125965088385, ; 796: System.Threading => 0xfa28e87b91334681 => 148
	i64 18096026207707417514, ; 797: MudBlazor => 0xfb21fff5848f4baa => 276
	i64 18099568558057551825, ; 798: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 389
	i64 18116111925905154859, ; 799: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 299
	i64 18121036031235206392, ; 800: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 335
	i64 18146411883821974900, ; 801: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 38
	i64 18146811631844267958, ; 802: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18203743254473369877, ; 803: System.Security.Cryptography.Pkcs.dll => 0xfca0b00ad94c6915 => 283
	i64 18225059387460068507, ; 804: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 146
	i64 18245806341561545090, ; 805: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 806: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 316
	i64 18305135509493619199, ; 807: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 337
	i64 18318849532986632368, ; 808: System.Security.dll => 0xfe39a097c37fa8b0 => 130
	i64 18324163916253801303, ; 809: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 384
	i64 18380184030268848184, ; 810: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 353
	i64 18427086088365902170, ; 811: Microsoft.AspNetCore.Mvc.Cors => 0xffba292a9e97895a => 210
	i64 18428404840311395189, ; 812: System.Security.Cryptography.Xml.dll => 0xffbed8907bd99375 => 284
	i64 18439108438687598470 ; 813: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 94
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [814 x i32] [
	i32 230, ; 0
	i32 315, ; 1
	i32 260, ; 2
	i32 171, ; 3
	i32 273, ; 4
	i32 252, ; 5
	i32 58, ; 6
	i32 302, ; 7
	i32 151, ; 8
	i32 343, ; 9
	i32 173, ; 10
	i32 346, ; 11
	i32 309, ; 12
	i32 132, ; 13
	i32 228, ; 14
	i32 56, ; 15
	i32 345, ; 16
	i32 233, ; 17
	i32 195, ; 18
	i32 258, ; 19
	i32 377, ; 20
	i32 95, ; 21
	i32 227, ; 22
	i32 328, ; 23
	i32 241, ; 24
	i32 129, ; 25
	i32 240, ; 26
	i32 262, ; 27
	i32 249, ; 28
	i32 280, ; 29
	i32 145, ; 30
	i32 303, ; 31
	i32 18, ; 32
	i32 380, ; 33
	i32 211, ; 34
	i32 314, ; 35
	i32 329, ; 36
	i32 150, ; 37
	i32 104, ; 38
	i32 222, ; 39
	i32 183, ; 40
	i32 95, ; 41
	i32 358, ; 42
	i32 388, ; 43
	i32 36, ; 44
	i32 235, ; 45
	i32 28, ; 46
	i32 298, ; 47
	i32 336, ; 48
	i32 50, ; 49
	i32 115, ; 50
	i32 70, ; 51
	i32 270, ; 52
	i32 65, ; 53
	i32 170, ; 54
	i32 180, ; 55
	i32 145, ; 56
	i32 386, ; 57
	i32 357, ; 58
	i32 297, ; 59
	i32 332, ; 60
	i32 322, ; 61
	i32 192, ; 62
	i32 40, ; 63
	i32 89, ; 64
	i32 81, ; 65
	i32 277, ; 66
	i32 66, ; 67
	i32 62, ; 68
	i32 86, ; 69
	i32 268, ; 70
	i32 296, ; 71
	i32 106, ; 72
	i32 376, ; 73
	i32 343, ; 74
	i32 102, ; 75
	i32 35, ; 76
	i32 293, ; 77
	i32 398, ; 78
	i32 345, ; 79
	i32 271, ; 80
	i32 398, ; 81
	i32 227, ; 82
	i32 119, ; 83
	i32 330, ; 84
	i32 372, ; 85
	i32 390, ; 86
	i32 142, ; 87
	i32 141, ; 88
	i32 366, ; 89
	i32 53, ; 90
	i32 35, ; 91
	i32 141, ; 92
	i32 277, ; 93
	i32 290, ; 94
	i32 300, ; 95
	i32 232, ; 96
	i32 257, ; 97
	i32 314, ; 98
	i32 198, ; 99
	i32 8, ; 100
	i32 14, ; 101
	i32 405, ; 102
	i32 190, ; 103
	i32 394, ; 104
	i32 342, ; 105
	i32 51, ; 106
	i32 266, ; 107
	i32 325, ; 108
	i32 136, ; 109
	i32 101, ; 110
	i32 0, ; 111
	i32 213, ; 112
	i32 307, ; 113
	i32 352, ; 114
	i32 116, ; 115
	i32 291, ; 116
	i32 163, ; 117
	i32 397, ; 118
	i32 267, ; 119
	i32 166, ; 120
	i32 67, ; 121
	i32 244, ; 122
	i32 372, ; 123
	i32 80, ; 124
	i32 176, ; 125
	i32 268, ; 126
	i32 101, ; 127
	i32 347, ; 128
	i32 263, ; 129
	i32 117, ; 130
	i32 279, ; 131
	i32 377, ; 132
	i32 359, ; 133
	i32 212, ; 134
	i32 78, ; 135
	i32 358, ; 136
	i32 185, ; 137
	i32 114, ; 138
	i32 121, ; 139
	i32 48, ; 140
	i32 252, ; 141
	i32 215, ; 142
	i32 184, ; 143
	i32 128, ; 144
	i32 323, ; 145
	i32 294, ; 146
	i32 82, ; 147
	i32 110, ; 148
	i32 75, ; 149
	i32 369, ; 150
	i32 247, ; 151
	i32 281, ; 152
	i32 273, ; 153
	i32 53, ; 154
	i32 349, ; 155
	i32 238, ; 156
	i32 69, ; 157
	i32 348, ; 158
	i32 237, ; 159
	i32 83, ; 160
	i32 172, ; 161
	i32 392, ; 162
	i32 116, ; 163
	i32 404, ; 164
	i32 239, ; 165
	i32 156, ; 166
	i32 238, ; 167
	i32 288, ; 168
	i32 167, ; 169
	i32 341, ; 170
	i32 189, ; 171
	i32 315, ; 172
	i32 205, ; 173
	i32 255, ; 174
	i32 32, ; 175
	i32 250, ; 176
	i32 271, ; 177
	i32 122, ; 178
	i32 72, ; 179
	i32 62, ; 180
	i32 194, ; 181
	i32 161, ; 182
	i32 113, ; 183
	i32 88, ; 184
	i32 269, ; 185
	i32 403, ; 186
	i32 105, ; 187
	i32 18, ; 188
	i32 146, ; 189
	i32 118, ; 190
	i32 58, ; 191
	i32 309, ; 192
	i32 278, ; 193
	i32 17, ; 194
	i32 182, ; 195
	i32 52, ; 196
	i32 201, ; 197
	i32 196, ; 198
	i32 92, ; 199
	i32 400, ; 200
	i32 55, ; 201
	i32 187, ; 202
	i32 129, ; 203
	i32 181, ; 204
	i32 152, ; 205
	i32 41, ; 206
	i32 234, ; 207
	i32 92, ; 208
	i32 232, ; 209
	i32 353, ; 210
	i32 50, ; 211
	i32 370, ; 212
	i32 162, ; 213
	i32 13, ; 214
	i32 327, ; 215
	i32 291, ; 216
	i32 348, ; 217
	i32 36, ; 218
	i32 67, ; 219
	i32 109, ; 220
	i32 292, ; 221
	i32 99, ; 222
	i32 99, ; 223
	i32 11, ; 224
	i32 225, ; 225
	i32 179, ; 226
	i32 199, ; 227
	i32 11, ; 228
	i32 188, ; 229
	i32 334, ; 230
	i32 213, ; 231
	i32 25, ; 232
	i32 128, ; 233
	i32 76, ; 234
	i32 326, ; 235
	i32 109, ; 236
	i32 352, ; 237
	i32 350, ; 238
	i32 106, ; 239
	i32 2, ; 240
	i32 26, ; 241
	i32 305, ; 242
	i32 157, ; 243
	i32 396, ; 244
	i32 286, ; 245
	i32 21, ; 246
	i32 399, ; 247
	i32 49, ; 248
	i32 43, ; 249
	i32 126, ; 250
	i32 295, ; 251
	i32 59, ; 252
	i32 223, ; 253
	i32 183, ; 254
	i32 119, ; 255
	i32 355, ; 256
	i32 318, ; 257
	i32 254, ; 258
	i32 304, ; 259
	i32 3, ; 260
	i32 324, ; 261
	i32 344, ; 262
	i32 38, ; 263
	i32 124, ; 264
	i32 393, ; 265
	i32 173, ; 266
	i32 344, ; 267
	i32 393, ; 268
	i32 137, ; 269
	i32 149, ; 270
	i32 85, ; 271
	i32 90, ; 272
	i32 328, ; 273
	i32 406, ; 274
	i32 325, ; 275
	i32 203, ; 276
	i32 381, ; 277
	i32 300, ; 278
	i32 311, ; 279
	i32 356, ; 280
	i32 259, ; 281
	i32 361, ; 282
	i32 326, ; 283
	i32 133, ; 284
	i32 214, ; 285
	i32 96, ; 286
	i32 3, ; 287
	i32 389, ; 288
	i32 105, ; 289
	i32 392, ; 290
	i32 33, ; 291
	i32 154, ; 292
	i32 158, ; 293
	i32 155, ; 294
	i32 82, ; 295
	i32 197, ; 296
	i32 189, ; 297
	i32 320, ; 298
	i32 284, ; 299
	i32 143, ; 300
	i32 87, ; 301
	i32 19, ; 302
	i32 321, ; 303
	i32 283, ; 304
	i32 51, ; 305
	i32 221, ; 306
	i32 290, ; 307
	i32 175, ; 308
	i32 396, ; 309
	i32 61, ; 310
	i32 54, ; 311
	i32 4, ; 312
	i32 199, ; 313
	i32 97, ; 314
	i32 289, ; 315
	i32 17, ; 316
	i32 404, ; 317
	i32 230, ; 318
	i32 155, ; 319
	i32 84, ; 320
	i32 281, ; 321
	i32 29, ; 322
	i32 45, ; 323
	i32 64, ; 324
	i32 66, ; 325
	i32 387, ; 326
	i32 172, ; 327
	i32 329, ; 328
	i32 1, ; 329
	i32 364, ; 330
	i32 47, ; 331
	i32 24, ; 332
	i32 185, ; 333
	i32 297, ; 334
	i32 276, ; 335
	i32 236, ; 336
	i32 187, ; 337
	i32 165, ; 338
	i32 108, ; 339
	i32 12, ; 340
	i32 323, ; 341
	i32 63, ; 342
	i32 27, ; 343
	i32 23, ; 344
	i32 93, ; 345
	i32 191, ; 346
	i32 168, ; 347
	i32 12, ; 348
	i32 368, ; 349
	i32 174, ; 350
	i32 274, ; 351
	i32 29, ; 352
	i32 103, ; 353
	i32 14, ; 354
	i32 191, ; 355
	i32 126, ; 356
	i32 306, ; 357
	i32 261, ; 358
	i32 338, ; 359
	i32 91, ; 360
	i32 327, ; 361
	i32 285, ; 362
	i32 9, ; 363
	i32 209, ; 364
	i32 86, ; 365
	i32 317, ; 366
	i32 350, ; 367
	i32 197, ; 368
	i32 391, ; 369
	i32 71, ; 370
	i32 168, ; 371
	i32 1, ; 372
	i32 337, ; 373
	i32 233, ; 374
	i32 5, ; 375
	i32 391, ; 376
	i32 44, ; 377
	i32 27, ; 378
	i32 365, ; 379
	i32 210, ; 380
	i32 208, ; 381
	i32 158, ; 382
	i32 340, ; 383
	i32 112, ; 384
	i32 262, ; 385
	i32 401, ; 386
	i32 265, ; 387
	i32 237, ; 388
	i32 121, ; 389
	i32 231, ; 390
	i32 355, ; 391
	i32 296, ; 392
	i32 196, ; 393
	i32 264, ; 394
	i32 159, ; 395
	i32 235, ; 396
	i32 131, ; 397
	i32 360, ; 398
	i32 57, ; 399
	i32 180, ; 400
	i32 242, ; 401
	i32 138, ; 402
	i32 83, ; 403
	i32 30, ; 404
	i32 307, ; 405
	i32 10, ; 406
	i32 357, ; 407
	i32 171, ; 408
	i32 265, ; 409
	i32 304, ; 410
	i32 150, ; 411
	i32 94, ; 412
	i32 192, ; 413
	i32 317, ; 414
	i32 177, ; 415
	i32 60, ; 416
	i32 223, ; 417
	i32 272, ; 418
	i32 157, ; 419
	i32 376, ; 420
	i32 278, ; 421
	i32 257, ; 422
	i32 64, ; 423
	i32 88, ; 424
	i32 79, ; 425
	i32 47, ; 426
	i32 270, ; 427
	i32 143, ; 428
	i32 373, ; 429
	i32 240, ; 430
	i32 366, ; 431
	i32 311, ; 432
	i32 74, ; 433
	i32 200, ; 434
	i32 91, ; 435
	i32 363, ; 436
	i32 216, ; 437
	i32 135, ; 438
	i32 90, ; 439
	i32 349, ; 440
	i32 369, ; 441
	i32 308, ; 442
	i32 224, ; 443
	i32 371, ; 444
	i32 219, ; 445
	i32 112, ; 446
	i32 42, ; 447
	i32 159, ; 448
	i32 4, ; 449
	i32 103, ; 450
	i32 177, ; 451
	i32 249, ; 452
	i32 70, ; 453
	i32 234, ; 454
	i32 60, ; 455
	i32 39, ; 456
	i32 298, ; 457
	i32 229, ; 458
	i32 153, ; 459
	i32 198, ; 460
	i32 56, ; 461
	i32 34, ; 462
	i32 220, ; 463
	i32 256, ; 464
	i32 272, ; 465
	i32 295, ; 466
	i32 21, ; 467
	i32 163, ; 468
	i32 202, ; 469
	i32 248, ; 470
	i32 361, ; 471
	i32 382, ; 472
	i32 359, ; 473
	i32 354, ; 474
	i32 140, ; 475
	i32 186, ; 476
	i32 385, ; 477
	i32 259, ; 478
	i32 89, ; 479
	i32 174, ; 480
	i32 147, ; 481
	i32 310, ; 482
	i32 279, ; 483
	i32 162, ; 484
	i32 339, ; 485
	i32 6, ; 486
	i32 169, ; 487
	i32 31, ; 488
	i32 107, ; 489
	i32 320, ; 490
	i32 282, ; 491
	i32 383, ; 492
	i32 354, ; 493
	i32 255, ; 494
	i32 226, ; 495
	i32 293, ; 496
	i32 347, ; 497
	i32 167, ; 498
	i32 321, ; 499
	i32 140, ; 500
	i32 379, ; 501
	i32 59, ; 502
	i32 144, ; 503
	i32 208, ; 504
	i32 81, ; 505
	i32 74, ; 506
	i32 250, ; 507
	i32 251, ; 508
	i32 130, ; 509
	i32 25, ; 510
	i32 7, ; 511
	i32 93, ; 512
	i32 351, ; 513
	i32 137, ; 514
	i32 287, ; 515
	i32 266, ; 516
	i32 113, ; 517
	i32 9, ; 518
	i32 253, ; 519
	i32 282, ; 520
	i32 104, ; 521
	i32 19, ; 522
	i32 263, ; 523
	i32 182, ; 524
	i32 206, ; 525
	i32 319, ; 526
	i32 333, ; 527
	i32 406, ; 528
	i32 313, ; 529
	i32 229, ; 530
	i32 33, ; 531
	i32 301, ; 532
	i32 46, ; 533
	i32 384, ; 534
	i32 30, ; 535
	i32 302, ; 536
	i32 57, ; 537
	i32 134, ; 538
	i32 114, ; 539
	i32 228, ; 540
	i32 356, ; 541
	i32 397, ; 542
	i32 367, ; 543
	i32 55, ; 544
	i32 260, ; 545
	i32 6, ; 546
	i32 77, ; 547
	i32 280, ; 548
	i32 312, ; 549
	i32 226, ; 550
	i32 190, ; 551
	i32 111, ; 552
	i32 203, ; 553
	i32 194, ; 554
	i32 204, ; 555
	i32 316, ; 556
	i32 285, ; 557
	i32 102, ; 558
	i32 371, ; 559
	i32 385, ; 560
	i32 224, ; 561
	i32 170, ; 562
	i32 115, ; 563
	i32 379, ; 564
	i32 351, ; 565
	i32 306, ; 566
	i32 200, ; 567
	i32 76, ; 568
	i32 362, ; 569
	i32 85, ; 570
	i32 364, ; 571
	i32 399, ; 572
	i32 299, ; 573
	i32 400, ; 574
	i32 383, ; 575
	i32 247, ; 576
	i32 341, ; 577
	i32 160, ; 578
	i32 2, ; 579
	i32 209, ; 580
	i32 312, ; 581
	i32 206, ; 582
	i32 24, ; 583
	i32 292, ; 584
	i32 32, ; 585
	i32 117, ; 586
	i32 37, ; 587
	i32 16, ; 588
	i32 378, ; 589
	i32 52, ; 590
	i32 381, ; 591
	i32 365, ; 592
	i32 20, ; 593
	i32 286, ; 594
	i32 123, ; 595
	i32 225, ; 596
	i32 154, ; 597
	i32 220, ; 598
	i32 246, ; 599
	i32 319, ; 600
	i32 131, ; 601
	i32 205, ; 602
	i32 373, ; 603
	i32 301, ; 604
	i32 148, ; 605
	i32 231, ; 606
	i32 288, ; 607
	i32 204, ; 608
	i32 120, ; 609
	i32 28, ; 610
	i32 132, ; 611
	i32 100, ; 612
	i32 134, ; 613
	i32 339, ; 614
	i32 207, ; 615
	i32 153, ; 616
	i32 97, ; 617
	i32 125, ; 618
	i32 289, ; 619
	i32 69, ; 620
	i32 72, ; 621
	i32 394, ; 622
	i32 324, ; 623
	i32 342, ; 624
	i32 375, ; 625
	i32 207, ; 626
	i32 175, ; 627
	i32 136, ; 628
	i32 124, ; 629
	i32 215, ; 630
	i32 71, ; 631
	i32 111, ; 632
	i32 334, ; 633
	i32 244, ; 634
	i32 152, ; 635
	i32 386, ; 636
	i32 218, ; 637
	i32 402, ; 638
	i32 362, ; 639
	i32 118, ; 640
	i32 217, ; 641
	i32 310, ; 642
	i32 178, ; 643
	i32 403, ; 644
	i32 370, ; 645
	i32 127, ; 646
	i32 133, ; 647
	i32 245, ; 648
	i32 77, ; 649
	i32 46, ; 650
	i32 313, ; 651
	i32 221, ; 652
	i32 243, ; 653
	i32 73, ; 654
	i32 63, ; 655
	i32 98, ; 656
	i32 84, ; 657
	i32 387, ; 658
	i32 43, ; 659
	i32 61, ; 660
	i32 340, ; 661
	i32 217, ; 662
	i32 239, ; 663
	i32 37, ; 664
	i32 40, ; 665
	i32 303, ; 666
	i32 368, ; 667
	i32 160, ; 668
	i32 211, ; 669
	i32 98, ; 670
	i32 179, ; 671
	i32 254, ; 672
	i32 308, ; 673
	i32 245, ; 674
	i32 188, ; 675
	i32 248, ; 676
	i32 135, ; 677
	i32 20, ; 678
	i32 65, ; 679
	i32 374, ; 680
	i32 125, ; 681
	i32 75, ; 682
	i32 201, ; 683
	i32 332, ; 684
	i32 184, ; 685
	i32 164, ; 686
	i32 246, ; 687
	i32 214, ; 688
	i32 156, ; 689
	i32 374, ; 690
	i32 5, ; 691
	i32 253, ; 692
	i32 382, ; 693
	i32 49, ; 694
	i32 346, ; 695
	i32 375, ; 696
	i32 144, ; 697
	i32 242, ; 698
	i32 139, ; 699
	i32 202, ; 700
	i32 100, ; 701
	i32 269, ; 702
	i32 123, ; 703
	i32 120, ; 704
	i32 142, ; 705
	i32 39, ; 706
	i32 68, ; 707
	i32 193, ; 708
	i32 258, ; 709
	i32 41, ; 710
	i32 261, ; 711
	i32 164, ; 712
	i32 73, ; 713
	i32 388, ; 714
	i32 165, ; 715
	i32 256, ; 716
	i32 127, ; 717
	i32 222, ; 718
	i32 318, ; 719
	i32 367, ; 720
	i32 68, ; 721
	i32 0, ; 722
	i32 169, ; 723
	i32 193, ; 724
	i32 216, ; 725
	i32 331, ; 726
	i32 305, ; 727
	i32 274, ; 728
	i32 338, ; 729
	i32 151, ; 730
	i32 45, ; 731
	i32 108, ; 732
	i32 48, ; 733
	i32 96, ; 734
	i32 31, ; 735
	i32 218, ; 736
	i32 23, ; 737
	i32 166, ; 738
	i32 22, ; 739
	i32 138, ; 740
	i32 78, ; 741
	i32 395, ; 742
	i32 54, ; 743
	i32 331, ; 744
	i32 336, ; 745
	i32 10, ; 746
	i32 294, ; 747
	i32 335, ; 748
	i32 322, ; 749
	i32 241, ; 750
	i32 181, ; 751
	i32 16, ; 752
	i32 243, ; 753
	i32 186, ; 754
	i32 402, ; 755
	i32 139, ; 756
	i32 275, ; 757
	i32 267, ; 758
	i32 13, ; 759
	i32 15, ; 760
	i32 122, ; 761
	i32 251, ; 762
	i32 87, ; 763
	i32 149, ; 764
	i32 22, ; 765
	i32 212, ; 766
	i32 34, ; 767
	i32 79, ; 768
	i32 380, ; 769
	i32 360, ; 770
	i32 395, ; 771
	i32 147, ; 772
	i32 80, ; 773
	i32 378, ; 774
	i32 178, ; 775
	i32 287, ; 776
	i32 390, ; 777
	i32 42, ; 778
	i32 26, ; 779
	i32 401, ; 780
	i32 333, ; 781
	i32 330, ; 782
	i32 107, ; 783
	i32 195, ; 784
	i32 110, ; 785
	i32 264, ; 786
	i32 219, ; 787
	i32 7, ; 788
	i32 363, ; 789
	i32 275, ; 790
	i32 44, ; 791
	i32 405, ; 792
	i32 176, ; 793
	i32 161, ; 794
	i32 236, ; 795
	i32 148, ; 796
	i32 276, ; 797
	i32 389, ; 798
	i32 299, ; 799
	i32 335, ; 800
	i32 38, ; 801
	i32 15, ; 802
	i32 283, ; 803
	i32 146, ; 804
	i32 8, ; 805
	i32 316, ; 806
	i32 337, ; 807
	i32 130, ; 808
	i32 384, ; 809
	i32 353, ; 810
	i32 210, ; 811
	i32 284, ; 812
	i32 94 ; 813
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
