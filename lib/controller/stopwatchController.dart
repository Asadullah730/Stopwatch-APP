import 'dart:async';
import 'package:get/get.dart';

class StopwatchController extends GetxController {
  RxInt milliseconds = 0.obs;
  Timer? _timer;
  RxBool isRunning = false.obs;

  void start() {
    if (!isRunning.value) {
      isRunning.value = true;
      _timer = Timer.periodic(Duration(milliseconds: 10), (_) {
        milliseconds.value += 10;
      });
    }
  }

  void stop() {
    _timer?.cancel();
    isRunning.value = false;
  }

  void reset() {
    stop();
    milliseconds.value = 0;
  }

  String get formattedTime {
    final int ms = milliseconds.value;
    final int minutes = (ms ~/ 60000);
    final int seconds = ((ms % 60000) ~/ 1000);
    final int centiseconds = ((ms % 1000) ~/ 10);
    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}:'
        '${centiseconds.toString().padLeft(2, '0')}';
  }
}
