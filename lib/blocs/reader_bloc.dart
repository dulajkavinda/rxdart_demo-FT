import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class ReaderBloc {
  final _dartStream = StreamController<String>();
  final _publishStream = PublishSubject<String>();
  final _behaviourStream = BehaviorSubject<String>();
  final _replayStream = ReplaySubject<String>();

  Stream<String> get dartStream => _dartStream.stream.asBroadcastStream();
  Stream<String> get publish => _publishStream.stream;
  Stream<String> get behaviour => _behaviourStream.stream;
  Stream<String> get replay =>
      _replayStream.stream.map((l) => _replayStream.values.join("\n"));

  startReading() async {
    Future<String> loadAsset() async {
      return await rootBundle.loadString('assets/sonnet.txt');
    }

    List<String> data;
    var contents = loadAsset();

    List<String> x = await contents.then((value) {
      data = value.split("\n");
      return data;
    });

    for (String l in x) {
      print(l);

      _dartStream.add(l);
      _publishStream.add(l);
      _behaviourStream.add(l);
      _replayStream.add(l);

      await Future.delayed(Duration(milliseconds: 4500));
    }
  }

  dispose() {
    _dartStream.close();
    _publishStream.close();
    _behaviourStream.close();
    _replayStream.close();
  }
}
