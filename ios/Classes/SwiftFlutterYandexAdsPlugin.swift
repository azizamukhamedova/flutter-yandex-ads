import Flutter
import UIKit

public class SwiftFlutterYandexAdsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let messenger : FlutterBinaryMessenger = registrar.messenger()

    // api setup
    let api = YandexApi()
    YandexAdsApiSetup(messenger, api)

    // widgets
    registrar.register(YandexAdsBanner(api: api), withId: "yandex-ads-banner")

    // components
    YandexAdsInterstitialSetup(messenger, YandexAdsInterstitialComponent(api: api))

  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
