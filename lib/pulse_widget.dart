import 'package:flutter/material.dart';

import 'onoffplugin.dart';

class PulseWidget extends StatefulWidget {
  const PulseWidget({super.key});

  @override
  State<PulseWidget> createState() => _PulseWidgetState();
}

class _PulseWidgetState extends State<PulseWidget> {
  final plugin = Onoffplugin();
  var isOn = false;
  var isListening = false;

  startListening() {
    setState(() {
      isListening = true;
    });
    plugin.listenToPulse().listen((event) {
      setState(() {
        isOn = event as bool;
      });
    }).onError((e) {
      setState(() {
        isListening = false;
      });
    });
  }

  stopListening() {
    plugin.stopListening().then((value) {
      setState(() {
        isListening = !(value as bool);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.circle,
              size: 64,
              color: !isListening
                  ? Colors.grey
                  : isOn
                      ? Colors.green
                      : Colors.red,
            ),
            IconButton(
                onPressed: isListening ? stopListening : startListening,
                icon: Icon(isListening ? Icons.stop : Icons.play_arrow))
          ],
        ),
      ),
    );
  }
}
