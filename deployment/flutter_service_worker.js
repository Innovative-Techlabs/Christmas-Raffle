'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "047dffb654d70519439104a514930ed1",
"index.html": "246ebd60ff8f07a6c7a8f811223770c6",
"/": "246ebd60ff8f07a6c7a8f811223770c6",
"main.dart.js": "23599bd181c203d45d5cf4deabacaad9",
"version.json": "5f86ea42558a9121237a5c70e39e37ee",
"assets/assets/5.png": "db1a9f3e8f213203963ebfb5143cbe5a",
"assets/assets/circle_rewards_logo.jpeg": "97767991a16f12017d88f570e6766ff6",
"assets/assets/cr_logo.png": "51b07a9fedd81ef01684b92ec2be8c3f",
"assets/assets/prize.png": "aa8a146700be7734c1faa589d76c1056",
"assets/assets/santorini.jpg": "143fc4a07256ce58e581f588279f5398",
"assets/assets/anisuma.jpg": "ea4e11a80df0e1f2a0a587ef645417d1",
"assets/assets/enaki.jpg": "40be76759d78faab9da41dcbaa9ce302",
"assets/assets/trademark.jpg": "78e22fa8a6b318bb32605e9800187d5f",
"assets/assets/tribe.jpg": "4d5311dee2e5fb9bcb7635f0cd9f88b5",
"assets/assets/jaffs.jpg": "a27be00e94a3d3a9fbfedacca8c551f6",
"assets/assets/bang.jpg": "a7d5b54b5cf30a25688d55e8d83f054e",
"assets/assets/ella.jpg": "8317eb8f98c0a8ad9754ad324c8d0fe9",
"assets/assets/harvest.jpg": "4633097ded05147f3fc70e8801743617",
"assets/assets/kaya.jpg": "92d9a561d6f25a7907ad2fb0db153edb",
"assets/assets/boabab.jpg": "fe5e1886b0155fab571576178c549959",
"assets/assets/recreation.jpg": "6886bbd91f707e27001df9a865608911",
"assets/assets/vmx.jpg": "bd707e0197ba87a2fd0262b177efdc14",
"assets/assets/nungwi.png": "a3ee16710281c0af81ce33295db14242",
"assets/assets/jiko.jpg": "74baac40f80b4dece53e0784b6b3ace9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/fonts/MaterialIcons-Regular.otf": "616fa9e4212cd123356c94f3112992aa",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "9d4717438b3fa97a0da2edba99f42ac0",
"assets/AssetManifest.bin": "296af0ed46bdd7c0a199b2a822d47d84",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "084123e04aa8f7bdda080ffb60d13be7",
"assets/NOTICES": "ab8822ee6833714224aa26269494d73d",
"android-icon-144x144.png": "8319bd19e5e490ef0a75d51065aa6cf7",
"android-icon-192x192.png": "a95febc9ebbf059e46a7e7d63becb3dd",
"android-icon-36x36.png": "32b9f2265f5ead55a2b6549c825f99bd",
"android-icon-48x48.png": "bdcf2a6e48d9ff3e459a0377c3ff1bde",
"android-icon-72x72.png": "94ce12564819104d93ea97ef0f11f58b",
"android-icon-96x96.png": "01d9caa1e3b92c925e6fa673702ee153",
"apple-icon-114x114.png": "445166fff0c17ab241f869a2d98d3cf4",
"apple-icon-120x120.png": "fd9aa3f3a16b701373d4e7b06bdffed2",
"apple-icon-144x144.png": "8319bd19e5e490ef0a75d51065aa6cf7",
"apple-icon-152x152.png": "695407182fea1640508f4620f8765daa",
"apple-icon-180x180.png": "68c54bf28f165b4c6a69cbbc847690c8",
"apple-icon-57x57.png": "16e00a9390a79cf0a3abb8b071456aa6",
"apple-icon-60x60.png": "11103c5de6308bc42691cf2425540533",
"apple-icon-72x72.png": "94ce12564819104d93ea97ef0f11f58b",
"apple-icon-76x76.png": "2138a2767aac74faf1f54923c40ab97a",
"apple-icon-precomposed.png": "836a224093f21c236b65abedc9825b16",
"apple-icon.png": "836a224093f21c236b65abedc9825b16",
"browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"favicon-16x16.png": "3b6a83d50928e21135f78b42d2250f2e",
"favicon-32x32.png": "dcb005172403ed741a106870e499b7f2",
"favicon-96x96.png": "01d9caa1e3b92c925e6fa673702ee153",
"favicon.ico": "ac3814e3392571a4e3ef291e1333e002",
"manifest.json": "b58fcfa7628c9205cb11a1b2c3e8f99a",
"ms-icon-144x144.png": "8319bd19e5e490ef0a75d51065aa6cf7",
"ms-icon-150x150.png": "6b48d891dacb07e59ffeae8498e2b4b0",
"ms-icon-310x310.png": "5cf011ee44b63a88b452c20dd12fe008",
"ms-icon-70x70.png": "930f0e04e57057a69c5f445d5232378b",
"splash/img/light-1x.png": "af7953c72a301764ff7930a8432202b3",
"splash/img/light-2x.png": "726b2f094d53d06dd94f6435c49c4ef2",
"splash/img/light-3x.png": "ae0b16b23163c9f8d6b8bdce815f5b2d",
"splash/img/light-4x.png": "76bd997523bffaf46c51ed1ddb2c878d",
"splash/img/dark-1x.png": "af7953c72a301764ff7930a8432202b3",
"splash/img/dark-2x.png": "726b2f094d53d06dd94f6435c49c4ef2",
"splash/img/dark-3x.png": "ae0b16b23163c9f8d6b8bdce815f5b2d",
"splash/img/dark-4x.png": "76bd997523bffaf46c51ed1ddb2c878d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
