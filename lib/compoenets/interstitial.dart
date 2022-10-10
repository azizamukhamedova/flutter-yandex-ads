import 'package:flutter_yandex_ads/pigeons/interstitial.dart';
import 'package:flutter_yandex_ads/yandex.dart';

class YandexAdsIntersttialComponents {
  YandexAdsIntersttialComponents({
    Function? onAdLoaded,
    Function? onAdFailedToLoad,
    Function? onImpression,
    Function? onAdClicked,
    Function? onLeftApplication,
    Function? onReturnedToApplication,
    Function? onAdShown,
    Function? onAdDismissed,
    required this.id,
    required this.ads,
  }) {
    interstitial = YandexAdsInterstitial();
    if (onAdLoaded != null) {
      ads.setOnAdLoaded(id, EventTypes.INTERSTITIAL, onAdLoaded);
    }

    if (onAdFailedToLoad != null) {
      ads.setOnAdFailedToLoad(id, EventTypes.INTERSTITIAL, onAdFailedToLoad);
    }

    if (onImpression != null) {
      ads.setOnImpression(id, EventTypes.INTERSTITIAL, onImpression);
    }

    if (onAdClicked != null) {
      ads.setOnAdCLicked(id, EventTypes.INTERSTITIAL, onAdClicked);
    }

    if (onLeftApplication != null) {
      ads.setOnLeftApplication(id, EventTypes.INTERSTITIAL, onLeftApplication);
    }

    if (onReturnedToApplication != null) {
      ads.setOnReturnedToApplication(id, EventTypes.INTERSTITIAL, onReturnedToApplication);
    }

    if (onAdShown != null) {
      ads.setOnAdShown(id, EventTypes.INTERSTITIAL, onAdShown);
    }

    if (onAdDismissed != null) {
      ads.setOnAdDismissed(id, EventTypes.INTERSTITIAL, onAdDismissed);
    }
  }

  final String id;
  final FlutterYandexAds ads;
  late YandexAdsInterstitial interstitial;

  void load() {
    interstitial.load(id);
  }

  void show() {
    interstitial.show();
  }
}
