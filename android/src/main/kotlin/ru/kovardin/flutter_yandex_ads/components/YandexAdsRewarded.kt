package ru.kovardin.flutter_yandex_ads.components

import android.util.Log
import ru.kovardin.flutter_yandex_ads.pigeons.Rewarded

class YandexAdsRewarded: Rewarded.YandexAdsRewarded {
    override fun load() {
        Log.d("rewarded", "load")
    }
}