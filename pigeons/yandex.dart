import 'package:pigeon/pigeon.dart';


class EventRequest {
  late String name;
  late String id;
  late String type;
}

class EventResponse {
  String? data;
  int? code;
  String? description;
}

@HostApi()
abstract class YandexAdsApi {
  void initialize();

  // dispatchers

  @async
  EventResponse onAdLoaded(EventRequest request);

  @async
  EventResponse onAdFailedToLoad(EventRequest request);

  @async
  EventResponse onImpression(EventRequest request);

  @async
  EventResponse onAdClicked(EventRequest request);

  @async
  EventResponse onLeftApplication(EventRequest request);

  @async
  EventResponse onReturnedToApplication(EventRequest request);

  @async
  EventResponse onAdShown(EventRequest request);

  @async
  EventResponse onAdDismissed(EventRequest request);
}
