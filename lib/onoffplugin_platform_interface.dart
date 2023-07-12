import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'onoffplugin_method_channel.dart';

abstract class OnoffpluginPlatform extends PlatformInterface {
  /// Constructs a OnoffpluginPlatform.
  OnoffpluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static OnoffpluginPlatform _instance = MethodChannelOnoffplugin();

  /// The default instance of [OnoffpluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelOnoffplugin].
  static OnoffpluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [OnoffpluginPlatform] when
  /// they register themselves.
  static set instance(OnoffpluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> stopListening() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Stream<Object?> listenToPulse() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
