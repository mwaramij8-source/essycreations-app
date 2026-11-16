/* Essy Creations - minimal service worker: network first, offline page fallback */
var CACHE = 'essy-offline-v1';
var OFFLINE = '/download-app/offline.html';
self.addEventListener('install', function (e) {
  e.waitUntil(caches.open(CACHE).then(function (c) { return c.addAll([OFFLINE, '/app-icons/icon-192.png']); }));
  self.skipWaiting();
});
self.addEventListener('activate', function (e) { e.waitUntil(self.clients.claim()); });
self.addEventListener('fetch', function (e) {
  if (e.request.mode !== 'navigate') return;          // let everything else go straight to the network
  e.respondWith(fetch(e.request).catch(function () { return caches.match(OFFLINE); }));
});
