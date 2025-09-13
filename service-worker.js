// Nombre de la caché
const CACHE_NAME = 'dulce-costo-cache-v1';
// Archivos a cachear
const urlsToCache = [
  '/',
  '/index.html'
];

// Evento de instalación del Service Worker
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        console.log('Cache abierta');
        return cache.addAll(urlsToCache);
      })
  );
});

// Evento de activación del Service Worker
self.addEventListener('activate', event => {
  const cacheWhitelist = [CACHE_NAME];
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          if (cacheWhitelist.indexOf(cacheName) === -1) {
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});

// Evento fetch para servir contenido desde la caché
self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        // Si encontramos una respuesta en la caché, la devolvemos
        if (response) {
          return response;
        }
        // Si no, hacemos la petición a la red
        return fetch(event.request);
      }
    )
  );
});
