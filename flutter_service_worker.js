'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "941f317d6c63053b5387618cdbfa3627",
"/": "941f317d6c63053b5387618cdbfa3627",
"main.dart.js": "58381df52f0af296aa8543bbc5c25d56",
"styles/base.css": "804ee9ffa3769d06d030012dbb9614bd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/favicon.ico": "3de039fbcd55391b009e19ca8a2c5592",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "32483f0ace2dfc18e9536a6a9494310d",
"assets/LICENSE": "c465fb8e1dfe16d84187c7f1a08647db",
"assets/images/img_flutterlogo.png": "3e20672ff0f68134b214fb4467dd6ba8",
"assets/images/img_jasindo_partner.png": "44ec13e62d214a1ffb71adc948eeaa74",
"assets/images/img_flutterlogo.psd": "f7476e51f860922a3fa6af571ebb2fd4",
"assets/images/img_company_512px.png": "7824e6239515613fd8ae780fa87799f0",
"assets/images/img_jasindo_logo.png": "3de039fbcd55391b009e19ca8a2c5592",
"assets/images/img_chat_personal_512px.png": "efec19feb37638fa44a93cb18575c78d",
"assets/images/img_wallpaper_UnicornoftheSea.jpg": "7438aec5f00ddcf41beea52b462f59a5",
"assets/images/img_wallpaper_FormentorHolidays.jpg": "edb2edf9f4b191229301d6c46f76e574",
"assets/images/img_wallpaper_NBNMSipapu.jpg": "a8480d4cc28bfdf68268259c286ea046",
"assets/images/img_wallpaper_AlgonquinGrouse.jpg": "8680ce13cfc9e78cab05285951088127",
"assets/images/img_chat_personal_32px.png": "9c15e7469d2c1d6c5c3836877ce491d7",
"assets/images/img_rekankerjaku_logo0.psd": "d6bfdd7fe29f87f4e0cc14bab2e6a074",
"assets/images/img_rekankerjaku_logo4.png": "2892b53e6b515ec7941be9ffc199c64c",
"assets/images/img_rekankerjaku_logo3.psd": "6b762f0652cfcc14fb9fd34fff15dde4",
"assets/images/img_rekankerjaku_logo3.png": "709ee6a3ca86ce128b9f342163b0f235",
"assets/images/img_rekankerjaku_logo2.png": "106ad8141a4d43f38d0e833865eb78a6",
"assets/images/img_event_512px.png": "33a13363ebe79668f6d8a17a2ffdc456",
"assets/images/img_rekankerjaku_logo0.png": "c3e27d1cc0a28e2e9714889dcc1e116c",
"assets/images/img_rekankerjaku_logo4.psd": "5581f66781ecb42e97579b39835f1fb9",
"assets/images/img_rekankerjaku_logo1.png": "d7fa3695cf78d15b19b5b5b20e0b68f5",
"assets/images/img_jasindo_company.png": "3c7e066f034d905338b19ef7d9e46e67",
"assets/images/img_wallpaper_WatChaloem.jpg": "4d5995f4b5e52006758baca70e5ebce8",
"assets/images/img_users_group_512px.png": "9e0509fbadc1fe1dd167a901c953d075",
"assets/images/img_jasindo_header.png": "a935b5283b4bbb03b0dd0efd960b0dad",
"assets/images/img_wallpaper_VanCherryBlossom.jpg": "1efc840e359f93168d1431e6aaa527f1",
"assets/images/img_wallpaper.jpg": "9de48084ebdeaa84512188ff307222cf",
"assets/images/img_wallpaper_NoCaliCoast.jpg": "94c6160580d394ed508a1d6e46c13bd5",
"assets/images/img_wallpaper_CharlestonAzaleas.jpg": "26446bed39899d67391f9d3eb8b990f9",
"assets/images/img_wallpaper_HimachalFalls.jpg": "8661dcb28a93838770de3bf65fe6f4a2",
"assets/images/img_wallpaper_SpainBeeEaters.jpg": "ca9837dd98c040c5e5c1c818b2b57a53",
"assets/AssetManifest.json": "36ffaeb55f92f227e38a7c947faffa5e",
"assets/FontManifest.json": "6ff2d56e480ec40fda849e020574df19",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"assets/packages/flutter_inappbrowser/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappbrowser/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/icon/favicon.ico": "3de039fbcd55391b009e19ca8a2c5592",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/fonts/FiraSans-Regular.ttf": "54dfa44c774e878a6b5327a47dfa7c97"
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
        return fetch(event.request);
      })
  );
});
