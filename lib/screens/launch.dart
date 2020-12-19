import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart_test/blocs/reader_bloc.dart';

import 'read.dart';

class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  ReaderBloc readerBloc;

  @override
  void dispose() {
    readerBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    readerBloc = Provider.of<ReaderBloc>(context);
    return Scaffold(
      body: Center(
        child: Container(
          height: 300.0,
          child: Column(
            children: [
              Text(
                'Shakespears Snonnets',
                style: TextStyle(fontSize: 26.0),
              ),
              Text(
                'Sonnet 64',
                style: TextStyle(fontSize: 15.0),
              ),
              SizedBox(height: 80.0),
              RaisedButton(
                onPressed: () {
                  // launch reader
                  readerBloc.startReading();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Read()));
                },
                child: Text(
                  'Engage',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
