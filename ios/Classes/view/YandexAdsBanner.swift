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

    init(frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, api api: YandexApi?) {
        super.init()

        let params = args as! [String: String]
        let id = params["id"]
        let adOwnerId = params["ad_owner_id"]
        let adfPFirst = params["adf_p1"]
        let adfPSecond = params["adf_p2"]

        self.api = api
        self.id = id ?? ""
        
        var parameters = [String: String]()
        parameters["adf_ownerid"] = adOwnerId
        parameters["adf_p1"] = adfPFirst
        parameters["adf_p2"] = adfPSecond
        parameters["adf_pfc"] = ""
        parameters["adf_pfb"] = ""
        parameters["adf_pt"] = "b"
        parameters["adf_pd"] = ""
        parameters["adf_pw"] = ""
        parameters["adf_pv"] = ""
        parameters["adf_prr"] = ""
        parameters["adf_pdw"] = ""
        parameters["adf_pdh"] = ""
        let request = YMAMutableAdRequest()
        request.parameters = parameters

        banner = YMAAdView(adUnitID: id ?? "", adSize: YMAAdSize.fixedSize(with: .init(width: 300, height: 250)))
        banner.delegate = self
        banner.removeFromSuperview()
        banner.loadAd(with: request)
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

