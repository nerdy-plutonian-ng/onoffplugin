import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'onoffplugin_platform_interface.dart';

/// An implementation of [OnoffpluginPlatform] that uses method channels.
class MethodChannelOnoffplugin extends OnoffpluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('onoffplugin');

  @visibleForTesting
  final eventChannel = const EventChannel('onoffplugin');

  @override
  Future<bool?> stopListening() {
    return methodChannel.invokeMethod<bool>('stopListening');
  }

  @override
  Stream<Object?> listenToPulse() {
    return eventChannel.receiveBroadcastStream();
  }
}
