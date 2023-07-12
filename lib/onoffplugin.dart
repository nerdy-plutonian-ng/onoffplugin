import 'package:flutter/material.dart';
import 'package:onoffplugin/pulse_widget.dart';

import 'onoffplugin_platform_interface.dart';

class Onoffplugin {
  Future<bool?> stopListening() {
    return OnoffpluginPlatform.instance.stopListening();
  }

  Stream<Object?> listenToPulse() {
    return OnoffpluginPlatform.instance.listenToPulse();
  }

  Widget pulseWidget = const PulseWidget();
}
