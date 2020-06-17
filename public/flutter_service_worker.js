'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "e416935b94894f87900942982c99e2ac",
"/main.dart.js": "33c94ea9d30f7d16e4f0e66fe52d758b",
"/assets/LICENSE": "0f14d60a1f3cfc527f112c4c272dc474",
"/assets/AssetManifest.json": "d028ea694b42282be8996802a311f59a",
"/assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/assets/Google-Pixel-3-1-oemho1lff21uxskyryotrzdgzupzuoyrxhovaza3mo.png": "49aed483e5bc8ea02bf21fdd1cf0d3aa",
"/assets/assets/Screenshot%202020-02-07%20at%2012.05.21%20AM.png": "ba8b55ca51a952d184939782e3f5b15d",
"/assets/assets/header_screenshot.png": "e34e6b72b40deb85d788ab1d382ebf39",
"/assets/assets/coverImage.png": "d2726be69b95fa80e9450be955b15640",
"/assets/assets/Markszen_quiz_maker-oemi2wflfse0fx030vvjoqer03huigy1n0w5df93a8.png": "7313fcf69351050c67704da8bd558a39",
"/assets/assets/markszen_quiz_maker_app_usercategoriescreen-oemmszca2l7t7ty7vejbutbck16tau5kcuh1hv2leo.png": "a40c962355bd6c71d650e9eab5638866",
"/assets/assets/google_play_button.png": "f3cc4c4560beac398eda0ec85949da4b",
"/assets/assets/app_store_badge.png": "ae7be9530c10b37833b0bcc95061e9b4",
"/assets/assets/testimonial.jpg": "14eed6d88ee7608b91a3de849e551d8d",
"/assets/assets/googlepixel1.png": "acaa26037da32bab77c06151ecd4fbfb",
"/assets/assets/test.png": "1b7c2584ba476e4e0e000efcf6aca260",
"/assets/assets/Markszen_quiz_maker_result_screen-oemmhwspku28h614im9ihlvwonr6n67di1v60jhiow.png": "fbe50de1cbd591c686ee7dda2725b16c",
"/assets/assets/Markszen_quiz_maker_result_screen.png": "c3700cff3398046ef1c11e976b08c14b"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
