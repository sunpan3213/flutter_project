package com.example.wanandroid

import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    companion object {
        const val FLUTTER_ANDROID_LOG_CHANNEL = "flutter_android_log"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, FLUTTER_ANDROID_LOG_CHANNEL)
                .setMethodCallHandler { call, result ->
                    var tag: String = call.argument("tag") ?: "LogUtils"
                    var message: String = call.argument("msg") ?: "unknown log message"
                    when (call.method) {
                        "logD" -> Log.d(tag, message)
                        "logE" -> Log.e(tag, message)
                    }
                    result.success(null)
                }
    }
}
