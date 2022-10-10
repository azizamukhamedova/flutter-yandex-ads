//
// Created by Artem Kovardin on 09.03.2022.
//

import Foundation
import YandexMobileAds

class YandexAdsInterstitialComponent: NSObject, YandexAdsInterstitial {
    private var interstitial: YMAInterstitialAd? = nil
    private var api: YandexApi
    private var id: String!

    init(api: YandexApi) {
        self.api = api
        super.init()
    }

    func loadId(_ id: String, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        self.id = id

        interstitial = YMAInterstitialAd(adUnitID: id)
        interstitial?.delegate = self;
        interstitial?.load()
    }

    func showWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        if let controller = UIApplication.shared.delegate?.window??.rootViewController as? FlutterViewController, let interstitial = interstitial {
            interstitial.present(from: controller)
        }
    }
}


extension YandexAdsInterstitialComponent: YMAInterstitialAdDelegate {
    func interstitialAdDidLoad(_ interstitialAd: YMAInterstitialAd) {
        let response = EventResponse()

        if let callback = api.callbacks[EventKey(id: id, name: "onAdLoaded", type: EventType.INTERSTITIAL.rawValue)] {
            callback(response, nil)
        }
    }

    func interstitialAdDidFail(toLoad interstitialAd: YMAInterstitialAd, error: Error) {
        let response = EventResponse()
        response.code = error._code as NSNumber

        if let callback = api.callbacks[EventKey(id: id, name: "onAdFailedToLoad", type: EventType.INTERSTITIAL.rawValue)] {
            callback(response, nil)
        }
    }

    func interstitialAdWillLeaveApplication(_ interstitialAd: YMAInterstitialAd) {
        let response = EventResponse()

        if let callback = api.callbacks[EventKey(id: id, name: "onLeftApplication", type: EventType.INTERSTITIAL.rawValue)] {
            callback(response, nil)
        }
    }

    func interstitialAdDidFail(toPresent interstitialAd: YMAInterstitialAd, error: Error) {
        print("Failed to present interstitial. Error: \(error)")
    }

    func interstitialAdWillAppear(_ interstitialAd: YMAInterstitialAd) {
        print("Interstitial ad will appear")
    }

    func interstitialAdDidAppear(_ interstitialAd: YMAInterstitialAd) {
        let response = EventResponse()

        if let callback = api.callbacks[EventKey(id: id, name: "onAdShown", type: EventType.INTERSTITIAL.rawValue)] {
            callback(response, nil)
        }
    }

    func interstitialAdWillDisappear(_ interstitialAd: YMAInterstitialAd) {
        print("Interstitial ad will disappear")
    }

    func interstitialAdDidDisappear(_ interstitialAd: YMAInterstitialAd) {
        let response = EventResponse()

        if let callback = api.callbacks[EventKey(id: id, name: "onAdDismissed", type: EventType.INTERSTITIAL.rawValue)] {
            callback(response, nil)
        }
    }

    func interstitialAd(_ interstitialAd: YMAInterstitialAd, willPresentScreen webBrowser: UIViewController?) {
        print("Interstitial ad will present screen")
    }

    func interstitialAd(_ interstitialAd: YMAInterstitialAd, didTrackImpressionWith impressionData: YMAImpressionData?) {
        print("Interstitial ad did track impression data")

        let response = EventResponse()
        response.data = impressionData?.rawData ?? ""

        if let callback = api.callbacks[EventKey(id: id, name: "onImpression", type: EventType.INTERSTITIAL.rawValue)] {
            callback(response, nil)
        }
    }
}
