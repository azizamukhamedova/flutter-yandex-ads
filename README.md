# flutter_yandex_ads

Yandex ADS for flutter applicaitions

[Donnations](https://www.tinkoff.ru/cf/6xz8n4h0LzO)

## Roadmap

Android
- [x] Banner
- [x] Interstitial
- [ ] Native
- [ ] Rewarded

iOS
- [x] Banner
- [x] Interstitial
- [ ] Native
- [ ] Rewarded


## Getting Started

Install package

```yaml
flutter_yandex_ads:
  git:
    url: https://gitflic.ru/project/kovardin/flutter-yandex-ads.git
```

For android add to AndroidManifest.xml

```xml

<uses-permission android:name="com.google.android.gms.permission.AD_ID" tools:node="remove"/>
```

For AdMob on android add this code:

```xml
<meta-data
   android:name="com.google.android.gms.ads.APPLICATION_ID"
   android:value="ca-app-pub-3940256099942544~1458002511"/>
```

where `ca-app-pub-3940256099942544~1458002511` is app id from admob

## Mediation

For AdMob mediation integration, add the following code on ios in to Info.plist:

```xml
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-3940256099942544~1458002511</string>
```

For SKAdNetwork on ios add this code to Info.plist:

```xml
<key>SKAdNetworkItems</key>
<array>
<!-- Yandex Ads -->
<dict>
    <key>SKAdNetworkIdentifier</key>
    <string>zq492l623r.skadnetwork</string>
</dict>
<dict>
    <!-- AdMob -->
    <key>SKAdNetworkIdentifier</key>
    <string>cstr6suwn9.skadnetwork</string>
</dict>
<dict>
    <!-- MyTarget -->
    <key>SKAdNetworkIdentifier</key>
    <string>n9x2a789qt.skadnetwork</string>
</dict>
<dict>
    <!-- MyTarget -->
    <key>SKAdNetworkIdentifier</key>
    <string>r26jy69rpl.skadnetwork</string>
</dict>
<dict>
    <!-- Start.io -->
    <key>SKAdNetworkIdentifier</key>
    <string>5l3tpt7t6e.skadnetwork</string>
</dict>
<dict>
    <!-- UnityAds -->
    <key>SKAdNetworkIdentifier</key>
    <string>4dzt52r2t5.skadnetwork</string>
</dict>
<dict>
    <!-- IronSource -->
    <key>SKAdNetworkIdentifier</key>
    <string>su67r6k2v3.skadnetwork</string>
</dict>
<dict>
    <!-- Applovin -->
    <key>SKAdNetworkIdentifier</key>
    <string>ludvb6z3bs.skadnetwork</string>
</dict>
<dict>
    <!-- Mintegral -->
    <key>SKAdNetworkIdentifier</key>
    <string>KBD757YWX3.skadnetwork</string>
</dict>
</array>
```
And set for ios in Podfile

```
use_frameworks! :linkage => :static
```


Call initialization in main.dart

```dart
FlutterYandexAds ads = new FlutterYandexAds();
ads.initialize();
```

Created banner widget:

```dart
Container(
  height: 100,
  child: YandexAdsBannerWidget(
    ads: ads,
    id: 'R-M-DEMO-320x50',
    onAdLoaded: () {
      print('onAdLoaded');
    },
    onAdFailedToLoad: (AdLoadError err) {
      print('onAdFailedToLoad code: ${err.code}, description: ${err.description}');
    },
    onImpression: (String? data) {
      print("on ad impression ${data ?? ''}");
    },
    onAdClicked: () {
      print('onAdClicked');
    },
  ),
)
```

## Advanced development

Generate pigeons files fo

```
flutter pub run pigeon \
  --input pigeons/yandex.dart \
  --dart_out lib/pigeons/yandex.dart \
  --java_out ./android/src/main/kotlin/ru/kovardin/flutter_yandex_ads/pigeons/Yandex.java \
  --java_package "ru.kovardin.flutter_yandex_ads.pigeons" \
  --objc_header_out ./ios/Classes/pigeons/Yandex.h \
  --objc_source_out ./ios/Classes/pigeons/Yandex.m


flutter pub run pigeon \
  --input pigeons/interstitial.dart \
  --dart_out lib/pigeons/interstitial.dart \
  --java_out ./android/src/main/kotlin/ru/kovardin/flutter_yandex_ads/pigeons/Interstitial.java \
  --java_package "ru.kovardin.flutter_yandex_ads.pigeons" \
  --objc_header_out ./ios/Classes/pigeons/Interstitial.h \
  --objc_source_out ./ios/Classes/pigeons/Interstitial.m


flutter pub run pigeon \
  --input pigeons/rewarded.dart \
  --dart_out lib/pigeons/rewarded.dart \
  --java_out ./android/src/main/kotlin/ru/kovardin/flutter_yandex_ads/pigeons/Rewarded.java \
  --java_package "ru.kovardin.flutter_yandex_ads.pigeons" \
  --objc_header_out ./ios/Classes/pigeons/Rewarded.h \
  --objc_source_out ./ios/Classes/pigeons/Rewarded.m
