package com.nerdymykl.onoffplugin

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kotlinx.coroutines.*

/** OnoffpluginPlugin */
class OnoffpluginPlugin: FlutterPlugin, MethodCallHandler, EventChannel.StreamHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity

  companion object {
    var isOn = false;

    var isListening = false;
  }

  private lateinit var channel : MethodChannel

  private lateinit var eventChannel: EventChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "onoffplugin")
    channel.setMethodCallHandler(this)
    eventChannel = EventChannel(flutterPluginBinding.binaryMessenger,"onoffplugin")
    eventChannel.setStreamHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "stopListening") {
      isListening = false
      result.success(true)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onListen(p0: Any?, p1: EventChannel.EventSink?) {
    startPulse(p1)
  }

  override fun onCancel(p0: Any?) {
    eventChannel.setStreamHandler(null)
  }

  private fun startPulse(eventSink : EventChannel.EventSink?){
    CoroutineScope(Dispatchers.Main).launch{
      isListening = true
      while (isListening) {
        isOn = !isOn
        eventSink?.success(isOn)
        delay(3000)
      }
    }
  }
}
