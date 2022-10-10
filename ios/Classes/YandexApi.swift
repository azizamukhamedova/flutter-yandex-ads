import Flutter
import UIKit

class YandexApi: NSObject, YandexAdsApi {
    var callbacks: [EventKey: (EventResponse?, FlutterError?) -> Void] = [:]

    func initializeWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
    }

    func onAdLoadedRequest(_ request: EventRequest?, completion: @escaping (EventResponse?, FlutterError?) -> Void) {
        callbacks[EventKey(id: request?.id ?? "", name: request?.name ?? "", type: request?.type ?? "")] = completion
    }

    func onAdFailed(toLoad request: EventRequest?, completion: @escaping (EventResponse?, FlutterError?) -> Void) {
        callbacks[EventKey(id: request?.id ?? "", name: request?.name ?? "", type: request?.type ?? "")] = completion
    }

    func onImpressionRequest(_ request: EventRequest?, completion: @escaping (EventResponse?, FlutterError?) -> Void) {
        callbacks[EventKey(id: request?.id ?? "", name: request?.name ?? "", type: request?.type ?? "")] = completion
    }

    func onAdClickedRequest(_ request: EventRequest?, completion: @escaping (EventResponse?, FlutterError?) -> Void) {
        callbacks[EventKey(id: request?.id ?? "", name: request?.name ?? "", type: request?.type ?? "")] = completion
    }

    func onLeftApplicationRequest(_ request: EventRequest?, completion: @escaping (EventResponse?, FlutterError?) -> Void) {
        callbacks[EventKey(id: request?.id ?? "", name: request?.name ?? "", type: request?.type ?? "")] = completion
    }

    func onReturned(toApplicationRequest request: EventRequest?, completion: @escaping (EventResponse?, FlutterError?) -> Void) {
        callbacks[EventKey(id: request?.id ?? "", name: request?.name ?? "", type: request?.type ?? "")] = completion
    }

    func onAdShownRequest(_ request: EventRequest?, completion: @escaping (EventResponse?, FlutterError?) -> Void) {
        callbacks[EventKey(id: request?.id ?? "", name: request?.name ?? "", type: request?.type ?? "")] = completion
    }

    func onAdDismissedRequest(_ request: EventRequest?, completion: @escaping (EventResponse?, FlutterError?) -> Void) {
        callbacks[EventKey(id: request?.id ?? "", name: request?.name ?? "", type: request?.type ?? "")] = completion
    }
}
