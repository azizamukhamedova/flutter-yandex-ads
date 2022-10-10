package ru.kovardin.flutter_yandex_ads

enum class EventType(val type: String) {
    BANNER("banner"),
    INTERSTITIAL("interstitial"),
    NATIVE("native"),
    REWARDED("rewarded"),
}