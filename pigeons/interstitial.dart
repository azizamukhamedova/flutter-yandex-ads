import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class YandexAdsInterstitial {
  void load(String id);
  void show();
}
