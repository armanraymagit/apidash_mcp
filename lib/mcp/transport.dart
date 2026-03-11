import 'dart:async';
import 'dart:convert';
import 'dart:io';

abstract class Transport {
  Stream<String> get stream;
  void send(String message);
  Future<void> close();
}

class StdIOTransport implements Transport {
  final StreamController<String> _controller = StreamController<String>();
  late final StreamSubscription _subscription;

  StdIOTransport() {
    _subscription = stdin
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen((line) {
      if (line.trim().isNotEmpty) {
        _controller.add(line);
      }
    });
  }

  @override
  Stream<String> get stream => _controller.stream;

  @override
  void send(String message) {
    stdout.writeln(message);
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await _controller.close();
  }
}
