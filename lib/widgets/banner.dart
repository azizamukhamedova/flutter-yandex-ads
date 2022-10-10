import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_yandex_ads/yandex.dart';

class YandexAdsBannerWidget extends StatelessWidget {
  YandexAdsBannerWidget({
    Key? key,
    Function? onAdLoaded,
    Function? onAdFailedToLoad,
    Function? onImpression,
    Function? onAdClicked,
    Function? onLeftApplication,
    Function? onReturnedToApplication,
    required this.id,
    required this.ads,
  }) : super(key: key) {
    if (onAdLoaded != null) {
      ads.setOnAdLoaded(id, EventTypes.BANNER, onAdLoaded);
    }

    if (onAdFailedToLoad != null) {
      ads.setOnAdFailedToLoad(id, EventTypes.BANNER, onAdFailedToLoad);
    }

    if (onImpression != null) {
      ads.setOnImpression(id, EventTypes.BANNER, onImpression);
    }

    if (onAdClicked != null) {
      ads.setOnAdCLicked(id, EventTypes.BANNER, onAdClicked);
    }

    if (onLeftApplication != null) {
      ads.setOnLeftApplication(id, EventTypes.BANNER, onLeftApplication);
    }

    if (onReturnedToApplication != null) {
      ads.setOnReturnedToApplication(id, EventTypes.BANNER, onReturnedToApplication);
    }
  }

  final String id;
  final FlutterYandexAds ads;

  Widget build(BuildContext context) {
    const String viewType = 'yandex-ads-banner';

    final Map<String, dynamic> creationParams = <String, dynamic>{
      'id': id,
    };

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return AndroidView(
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        );
      case TargetPlatform.iOS:
        return UiKitView(
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        );
      default:
        throw UnsupportedError('Unsupported platform view');
    }
  }
}
