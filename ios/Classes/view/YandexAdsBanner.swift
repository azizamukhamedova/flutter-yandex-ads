import Flutter
import UIKit
import YandexMobileAds

class YandexAdsBanner: NSObject, FlutterPlatformViewFactory {
    private var api: YandexApi

    init(api: YandexApi) {
        self.api = api
        super.init()
    }

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return Banner(
                frame: frame,
                viewIdentifier: viewId,
                arguments: args,
                api: api)
    }

    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

class Banner: NSObject, FlutterPlatformView {
    private var banner: YMAAdView!
    private var api: YandexApi!
    private var id: String = ""

    init(frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, api: YandexApi?) {
        super.init()

        let params = args as! [String: String]
        let id = params["id"]

        self.api = api
        self.id = id ?? ""

        banner = YMAAdView(adUnitID: id ?? "", adSize: YMAAdSize.flexibleSize(with: .init(width: 320, height: 100)))
        banner.delegate = self
        banner.removeFromSuperview()
        banner.loadAd()
    }

    func view() -> UIView {
        return banner
    }
}

extension Banner: YMAAdViewDelegate {
    func adViewDidLoad(_ adView: YMAAdView) {
        let response = EventResponse()

        if let callback = api.callbacks[EventKey(id: id, name: "onAdLoaded", type: EventType.BANNER.rawValue)] {
            callback(response, nil)
        }
    }

    func adViewDidFailLoading(_ adView: YMAAdView, error: Error) {
        let response = EventResponse()
        response.code = 0
        response.description = "\(error)"

        if let callback = api.callbacks[EventKey(id: id, name: "onAdFailedToLoad", type: EventType.BANNER.rawValue)] {
            callback(response, nil)
        }
    }

    func adViewDidClick(_ adView: YMAAdView) {
        let response = EventResponse()

        if let callback = api.callbacks[EventKey(id: id, name: "onAdClicked", type: EventType.BANNER.rawValue)] {
            callback(response, nil)
        }
    }

    func adViewWillLeaveApplication(_ adView: YMAAdView) {
        let response = EventResponse()

        if let callback = api.callbacks[EventKey(id: id, name: "onLeftApplication", type: EventType.BANNER.rawValue)] {
            callback(response, nil)
        }
    }

    func adView(_ adView: YMAAdView, willPresentScreen viewController: UIViewController?) {
        let response = EventResponse()

        if let callback = api.callbacks[EventKey(id: id, name: "onAdShown", type: EventType.BANNER.rawValue)] {
            callback(response, nil)
        }
    }

    func adView(_ adView: YMAAdView, didDismissScreen viewController: UIViewController?) {
        let response = EventResponse()

        if let callback = api.callbacks[EventKey(id: id, name: "onAdDismissed", type: EventType.BANNER.rawValue)] {
            callback(response, nil)
        }
    }

    func adView(_ adView: YMAAdView, didTrackImpressionWith impressionData: YMAImpressionData?) {
        let response = EventResponse()
        response.data = impressionData?.rawData ?? ""

        if let callback = api.callbacks[EventKey(id: id, name: "onImpression", type: EventType.BANNER.rawValue)] {
            callback(response, nil)
        }
    }
}

