import 'package:flutter_yandex_ads/pigeons/yandex.dart';

class FlutterYandexAds {
  final api = YandexAdsApi();

  void initialize() {
    api.initialize();
  }

  void setOnAdLoaded(String id, String type, Function onAdLoaded) {
    api.onAdLoaded(EventRequest(id: id, name: 'onAdLoaded', type: type)).then((value) {
      onAdLoaded();
    });
  }

  void setOnAdFailedToLoad(String id, String type, Function onAdFailedToLoad) {
    api.onAdFailedToLoad(EventRequest(id: id, name: 'onAdFailedToLoad', type: type)).then((value) {
      onAdFailedToLoad(AdLoadError(
        code: value.code ?? 0,
        description: value.description ?? '',
      ));
    });
  }

  void setOnImpression(String id, String type, Function callback) {
    api.onImpression(EventRequest(id: id, name: 'onImpression', type: type)).then((value) {
      callback(value.data);
    });
  }

  void setOnAdCLicked(String id, String type, Function callback) {
    api.onAdClicked(EventRequest(id: id, name: 'onAdClicked', type: type)).then((value) {
      callback();
    });
  }

  void setOnLeftApplication(String id, String type, Function callback) {
    api.onLeftApplication(EventRequest(id: id, name: 'onLeftApplication', type: type)).then((value) {
      callback();
    });
  }

  void setOnReturnedToApplication(String id, String type, Function callback) {
    api.onReturnedToApplication(EventRequest(id: id, name: 'onReturnedToApplication', type: type)).then((value) {
      callback();
    });
  }

  void setOnAdShown(String id, String type, Function callback) {
    api.onAdShown(EventRequest(id: id, name: 'onAdShown', type: type)).then((value) {
      callback();
    });
  }

  void setOnAdDismissed(String id, String type, Function callback) {
    api.onAdShown(EventRequest(id: id, name: 'onAdDismissed', type: type)).then((value) {
      callback();
    });
  }
}

class AdLoadError {
  final int code;
  final String description;

  AdLoadError({required this.code, required this.description});
}

class EventTypes {
  static const BANNER = 'banner';
  static const INTERSTITIAL = 'interstitial';
  static const NATIVE = 'native';
  static const REWARDED = 'rewarded';
}
