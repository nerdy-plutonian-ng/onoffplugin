import 'package:flutter_test/flutter_test.dart';
import 'package:onoffplugin/onoffplugin.dart';
import 'package:onoffplugin/onoffplugin_method_channel.dart';
import 'package:onoffplugin/onoffplugin_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOnoffpluginPlatform
    with MockPlatformInterfaceMixin
    implements OnoffpluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Stream<Object?> listenToPulse() {
    // TODO: implement listenToPulse
    throw UnimplementedError();
  }

  @override
  Future<bool?> stopListening() {
    // TODO: implement stopListening
    throw UnimplementedError();
  }
}

void main() {
  final OnoffpluginPlatform initialPlatform = OnoffpluginPlatform.instance;

  test('$MethodChannelOnoffplugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOnoffplugin>());
  });

  test('getPlatformVersion', () async {
    Onoffplugin onoffpluginPlugin = Onoffplugin();
    MockOnoffpluginPlatform fakePlatform = MockOnoffpluginPlatform();
    OnoffpluginPlatform.instance = fakePlatform;

    // expect(await onoffpluginPlugin.getPlatformVersion(), '42');
  });
}
