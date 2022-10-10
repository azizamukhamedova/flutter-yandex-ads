// Autogenerated from Pigeon (v4.1.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import <Foundation/Foundation.h>
@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN


///The codec used by YandexAdsInterstitial.
NSObject<FlutterMessageCodec> *YandexAdsInterstitialGetCodec(void);

@protocol YandexAdsInterstitial
- (void)loadId:(NSString *)id error:(FlutterError *_Nullable *_Nonnull)error;
- (void)showWithError:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void YandexAdsInterstitialSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<YandexAdsInterstitial> *_Nullable api);

NS_ASSUME_NONNULL_END
