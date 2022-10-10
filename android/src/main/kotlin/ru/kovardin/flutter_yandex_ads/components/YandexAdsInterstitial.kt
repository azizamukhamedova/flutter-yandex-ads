package ru.kovardin.flutter_yandex_ads.components

import android.content.Context
import android.util.Log
import com.yandex.mobile.ads.common.AdRequest
import com.yandex.mobile.ads.common.AdRequestError
import com.yandex.mobile.ads.common.ImpressionData
import com.yandex.mobile.ads.interstitial.InterstitialAd
import com.yandex.mobile.ads.interstitial.InterstitialAdEventListener
import ru.kovardin.flutter_yandex_ads.EventKey
import ru.kovardin.flutter_yandex_ads.EventType
import ru.kovardin.flutter_yandex_ads.YandexApi
import ru.kovardin.flutter_yandex_ads.pigeons.Interstitial
import ru.kovardin.flutter_yandex_ads.pigeons.Yandex


class YandexAdsInterstitial(private val api: YandexApi, private val context: Context) : Interstitial.YandexAdsInterstitial {
    private var interstitial: InterstitialAd? = null

    override fun load(id: String) {
        if (interstitial == null) {
            interstitial = InterstitialAd(context)
            interstitial?.setAdUnitId(id)
            interstitial?.setInterstitialAdEventListener(object : InterstitialAdEventListener {
                override fun onAdLoaded() {
                    val builder = Yandex.EventResponse.Builder()

                    val response = builder.build()
                    api.callbacks.remove(EventKey(id = id, name = "onAdLoaded", type = EventType.INTERSTITIAL.type))?.success(response)
                }

                override fun onAdFailedToLoad(error: AdRequestError) {
                    val builder = Yandex.EventResponse.Builder()
                    builder.setCode(error.code.toLong())
                    builder.setDescription(error.description)

                    val response = builder.build()
                    api.callbacks.remove(EventKey(id = id, name = "onAdFailedToLoad", type = EventType.INTERSTITIAL.type))?.success(response)
                }

                override fun onAdShown() {
                    val builder = Yandex.EventResponse.Builder()

                    val response = builder.build()
                    val key = EventKey(id = id, name = "onAdShown", type = EventType.INTERSTITIAL.type)
                    api.callbacks.remove(key)?.success(response)
                }

                override fun onAdDismissed() {
                    val builder = Yandex.EventResponse.Builder()

                    val response = builder.build()
                    api.callbacks.remove(EventKey(id = id, name = "onAdDismissed", type = EventType.INTERSTITIAL.type))?.success(response)
                }

                override fun onAdClicked() {
                    val builder = Yandex.EventResponse.Builder()

                    val response = builder.build()
                    api.callbacks.remove(EventKey(id = id, name = "onAdClicked", type = EventType.INTERSTITIAL.type))?.success(response)
                }

                override fun onLeftApplication() {
                    val builder = Yandex.EventResponse.Builder()

                    val response = builder.build()
                    api.callbacks.remove(EventKey(id = id, name = "onLeftApplication", type = EventType.INTERSTITIAL.type))?.success(response)
                }

                override fun onReturnedToApplication() {
                    val builder = Yandex.EventResponse.Builder()

                    val response = builder.build()
                    api.callbacks.remove(EventKey(id = id, name = "onReturnedToApplication", type = EventType.INTERSTITIAL.type))?.success(response)
                }

                override fun onImpression(data: ImpressionData?) {
                    val builder = Yandex.EventResponse.Builder()
                    builder.setData(data?.rawData ?: "")

                    val response = builder.build()
                    api.callbacks.remove(EventKey(id = id, name = "onImpression", type = EventType.INTERSTITIAL.type))?.success(response)
                }
            })
        }

        val request = AdRequest.Builder().build()
        interstitial?.loadAd(request)
    }

    override fun show() {
        interstitial?.show()
    }
}