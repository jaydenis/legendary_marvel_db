'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "a8d4c35f5d387e69ff5d11f572bad553",
"index.html": "fa0846e76305de30d2952bd9031ec62e",
"/": "fa0846e76305de30d2952bd9031ec62e",
"main.dart.js": "5e33230d01483eeaaa140608e1c4d6d7",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "eba1c437c43eca9f12b80cce0f0a9943",
"assets/AssetManifest.json": "9da3c147352849c8dcad1a0b3301dc32",
"assets/NOTICES": "aba81ac989138fa9387107658f56a95c",
"assets/FontManifest.json": "2451add22d0732b11a7ed3608cb90adf",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_icons/fonts/Octicons.ttf": "73b8cff012825060b308d2162f31dbb2",
"assets/packages/flutter_icons/fonts/Feather.ttf": "6beba7e6834963f7f171d3bdd075c915",
"assets/packages/flutter_icons/fonts/Entypo.ttf": "744ce60078c17d86006dd0edabcd59a7",
"assets/packages/flutter_icons/fonts/FontAwesome5_Brands.ttf": "c39278f7abfc798a241551194f55e29f",
"assets/packages/flutter_icons/fonts/MaterialCommunityIcons.ttf": "3c851d60ad5ef3f2fe43ebd263490d78",
"assets/packages/flutter_icons/fonts/AntDesign.ttf": "3a2ba31570920eeb9b1d217cabe58315",
"assets/packages/flutter_icons/fonts/Foundation.ttf": "e20945d7c929279ef7a6f1db184a4470",
"assets/packages/flutter_icons/fonts/weathericons.ttf": "4618f0de2a818e7ad3fe880e0b74d04a",
"assets/packages/flutter_icons/fonts/Ionicons.ttf": "b2e0fc821c6886fb3940f85a3320003e",
"assets/packages/flutter_icons/fonts/FontAwesome5_Solid.ttf": "b70cea0339374107969eb53e5b1f603f",
"assets/packages/flutter_icons/fonts/FontAwesome5_Regular.ttf": "f6c6f6c8cb7784254ad00056f6fbd74e",
"assets/packages/flutter_icons/fonts/FontAwesome.ttf": "b06871f281fee6b241d60582ae9369b9",
"assets/packages/flutter_icons/fonts/Zocial.ttf": "5cdf883b18a5651a29a4d1ef276d2457",
"assets/packages/flutter_icons/fonts/EvilIcons.ttf": "140c53a7643ea949007aa9a282153849",
"assets/packages/flutter_icons/fonts/SimpleLineIcons.ttf": "d2285965fe34b05465047401b8595dd0",
"assets/packages/flutter_icons/fonts/MaterialIcons.ttf": "a37b0c01c0baf1888ca812cc0508f6e2",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "aa1ec80f1b30a51d64c72f669c1326a7",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5178af1d278432bec8fc830d50996d6f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b37ae0f14cbc958316fac4635383b6e8",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/images/boxart/legendary_captain_america_75th.jpg": "ab43eda3b0e5f2ad1b0896de68c6907e",
"assets/assets/images/boxart/legendary_guardians_of_the_galaxy.jpg": "dd25957dc517ec9ae783fff4de7ee056",
"assets/assets/images/boxart/legendary_guardians_of_the_galaxy_vol2.jpg": "d072b004a8a42c4e555d99b0d00aaf4b",
"assets/assets/images/boxart/legendary_noir.jpg": "02c7d77f285d78e792b10ad1d7b5f03d",
"assets/assets/images/boxart/legendary_venom.png": "6fed420d751d55739d85b4b3043a2c9f",
"assets/assets/images/boxart/legendary_ant_man.jpg": "ce8d95141030cce2e8662515f02f1eb4",
"assets/assets/images/boxart/legendary_secret_wars_vol_1.png": "a81caf954046b1b5803adf5d5cbafae7",
"assets/assets/images/boxart/legendary_annihilation.png": "5b6022428be631c99f7b811090e2f5fe",
"assets/assets/images/boxart/legendary_messiah_complex.jpg": "fa6f89f3b33c209754a3a05f01451a6f",
"assets/assets/images/boxart/legendary_painttownred.jpg": "c31f5e22b60fdcd16371f11b7cc405e5",
"assets/assets/images/boxart/legendary_realm_of_kings.png": "1a18fe58baff3559b8adb4dd5479d898",
"assets/assets/images/boxart/legendary_champions.jpg": "ea28c2e728e35466d25239fe7bc12435",
"assets/assets/images/boxart/legendary_core.jpg": "25e4cdbd0474abfbf06b1deed2574898",
"assets/assets/images/boxart/legendary_dimensions.jpg": "0cbb17196299b25ed4ada218bec6ab29",
"assets/assets/images/boxart/legendary_secret_wars_vol_2.jpg": "94a9572b22e16f6ba11f929aec649e48",
"assets/assets/images/boxart/legendary_civil_war.jpg": "298d19e2ecd6fd71632a6b18ed9fb6a5",
"assets/assets/images/boxart/legendary_new_mutants.png": "e3d94ac536f4ea9651511d97b301b28d",
"assets/assets/images/boxart/legendary_deadpool.jpg": "b8842a831c4c983d8ef944b9220e2351",
"assets/assets/images/boxart/legendary_dark_city.jpg": "ebd429b9e107ed58a64138eba6031038",
"assets/assets/images/boxart/legendary_fantastic_four.jpg": "2f6124ad61eef1c5b7923440bbf8e49e",
"assets/assets/images/boxart/legendary_spider_man_homecoming.jpg": "611e9820dd16db25a4d8277275e732fd",
"assets/assets/images/boxart/legendary_villains_fear_itself.jpg": "697e7038f70f3bd5b6e8b7e19f70b57b",
"assets/assets/images/boxart/legendary_doctor_strange.jpg": "8aef84f3ea79dacf2d4bbe218768164d",
"assets/assets/images/boxart/legendary_revelations.jpg": "4428c4d74b0932dafebaec5279a00499",
"assets/assets/images/boxart/legendary_shield.png": "51710cb54d7292212a58ce8555811bfc",
"assets/assets/images/boxart/legendary_heroes_of_asgard.png": "0ba11b6e908d48cb5c2dbd29cd6fd9f2",
"assets/assets/images/boxart/legendary_into_the_cosmos.png": "45bbac06f79dca2d1affb0aeaed736c2",
"assets/assets/images/boxart/legendary_world_war_hulk.jpg": "b4ba6a6ee1282154db5fcf91eb6f377b",
"assets/assets/images/boxart/marvel_legendary_deck_building_game.jpg": "2ca330064a69ee6bb5abc9d6617f5136",
"assets/assets/images/boxart/legendary_xmen.jpg": "704288f89a49f5caaedeb5c9f48d7bdd",
"assets/assets/images/boxart/legendary_villains.jpg": "dc2666e879a98405ce19ac1f945031b2",
"assets/assets/images/promotion.jpg": "786fdb70ecbc98bddeb2518cc6f50d37",
"assets/assets/images/welcome_3.svg": "040e50ed8fda95c5b30230ae353566fb",
"assets/assets/images/welcome_2.svg": "0754c8d8907a9bd48e612d7da0329b79",
"assets/assets/images/welcome_1.svg": "f87ee387d576bb813e82e17efb6c2463",
"assets/assets/images/marvel_legendary_deck_building_game.jpg": "2ca330064a69ee6bb5abc9d6617f5136",
"assets/assets/icons/search_icon.svg": "531bd87652ef494fc2394aaace6b5491",
"assets/assets/icons/arrow_back_icon.svg": "2a5ac11f716af8a1b9e4e9cce5ba2b8a",
"assets/assets/icons/welcome2.svg": "8b7e7c589890468049a09da63b6eaae1",
"assets/assets/icons/welcome3.svg": "4da1ef06168cd36d122d2873b7535f4e",
"assets/assets/icons/help_icon.svg": "1cebdbf226d5e4d5665d531c846501bf",
"assets/assets/icons/home_icon.svg": "b82164ab163ac2ccd6d922c8993fcbfa",
"assets/assets/icons/welcome1.svg": "a7cb576981ee25f6cc5ff6836dfb800b",
"assets/assets/icons/promotion_icon.svg": "cb98e814122cb6c964d8dc32a94da62e",
"assets/assets/icons/about_icon.svg": "39dfa1f526b48791eaaf8202d9dc997c",
"assets/assets/icons/deals.svg": "4514d0885ff27d4dc6a544fdc797855f",
"assets/assets/icons/profile_icon.svg": "8723e966bbb1bbbbd2657642ccdbb60b",
"assets/assets/icons/arrow_right_icon.svg": "490f494fede341f180ba3260174117b4",
"assets/assets/icons/heart_icon.svg": "2ecf75816eba6c831d64168f78b73afb",
"assets/assets/icons/phone_icon.svg": "15e06f7936132e7e85762428b89578af",
"assets/assets/icons/clock_icon.svg": "187262167672b360c6f5b0a790cb98fc",
"assets/assets/icons/email_icon.svg": "885a11915bd0e41586d167d745965f55",
"assets/assets/icons/arrow_forward_icon.svg": "3a1adefb0bbf2b04bbe3351f192d1130",
"assets/assets/icons/filter_icon.svg": "e5604e78e3244f41d41fc0e8cacadab3",
"assets/assets/icons/bell_icon.svg": "32ee6b9e1c4b3384cb50419567c2bb12",
"assets/assets/icons/logout_icon.svg": "d4b44d0eddf18ca2c0b9be8fb777bf1a",
"assets/assets/icons/order_icon.svg": "64af296c9a99e2b1cbf7bf6937515d03",
"assets/assets/fonts/NotoSans-Regular.ttf": "2fd9c16b805724d590c0cff96da070a4",
"assets/assets/fonts/NotoSans-Bold.ttf": "a165a42685795361b25593effb32fdb1",
"assets/assets/fonts/NotoSans-BoldItalic.ttf": "4f6ff3639c1e5728b905b650c1a06e75",
"assets/assets/fonts/NotoSans-Italic.ttf": "154da4697acc779b55af0a67f1241e4e",
"canvaskit/canvaskit.js": "43fa9e17039a625450b6aba93baf521e",
"canvaskit/profiling/canvaskit.js": "f3bfccc993a1e0bfdd3440af60d99df4",
"canvaskit/profiling/canvaskit.wasm": "a9610cf39260f60fbe7524a785c66101",
"canvaskit/canvaskit.wasm": "04ed3c745ff1dee16504be01f9623498"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
