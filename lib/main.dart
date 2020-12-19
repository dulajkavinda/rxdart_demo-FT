import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart_test/blocs/reader_bloc.dart';
import 'package:rxdart_test/screens/launch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ReaderBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Launch(),
      ),
    );
  }
}
