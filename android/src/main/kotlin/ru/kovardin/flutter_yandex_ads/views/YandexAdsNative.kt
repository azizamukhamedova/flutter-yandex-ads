package ru.kovardin.flutter_yandex_ads.views

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class YandexAdsNative: PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        return Native(context, 1);
    }
}

class Native(context: Context?, id: Int) : PlatformView {
    var textView: TextView
    init {
        textView = TextView(context!!)
        textView.textSize = 14f
        textView.setBackgroundColor(Color.rgb(255, 255, 255))
        textView.text = "Rendered on a native Android view (id: $id)"
    }

    override fun getView(): View {
        return textView;
    }

    override fun dispose() {}
}
