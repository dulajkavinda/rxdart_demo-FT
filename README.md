# Understanding RXDart Streams

### Types of subjects in RxDart

---

| Standard Subject      | Publisher Subject |
| :---        |    :----:   |
| The base for all Subjects. If you'd like to create a new Subject, extend from this class.      | Exactly like a normal broadcast StreamController with one exception: this class is both a Stream and Sink.       | 

| Behaviour Subject      | Replay Subject |
| :---        |    :----:   |
| A special StreamController that captures the latest item that has been added to the controller, and emits that as the first item to any new listener.   | A special StreamController that captures all of the items that have been added to the controller, and emits those as the first items to any new listener.        | 







## Implementation

---

1. Build a BLoC class and create four subject streams

```dart
final _dartStream = StreamController<String>();
final _publishStream = PublishSubject<String>();
final _behaviourStream = BehaviorSubject<String>();
final _replayStream = ReplaySubject<String>();
```

  2.  Write the main function that calls from the widget, for this application its **startReading()**

```dart
startReading() async {
    Future<String> loadAsset() async {
      return await rootBundle.loadString('assets/sonnet.txt');
    }
    var contents = loadAsset();
    contents.then((value) {
      print(value);
    });
  }
```

3.  Wrap the main method with **Provider** class

```dart
return Provider(
      create: (context) => ReaderBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Launch(),
      ),
    );
```

 4.   Then create a **ReaderBloc** instance in the widget

```dart
readerBloc = Provider.of<ReaderBloc>(context);
```

 5.   Call the method using the **bloc** instance  

```dart
readerBloc.startReading();
```

## Notes

---

All of the RxDart streams are multiple subscription, but StreamController is single subscription. So you get to listen once to the stream. So if you want to listing with multiple subscriptions  you need to add **asBroadcastStream** to the **StreamController.**

```dart
Stream<String> get dartStream => _dartStream.stream.asBroadcastStream();
```

## How it all Works?

---

**BehaviorSubject** remembers the previous value and get that value.

**PubishSubject** does't get the current value, instead it gets the value to come down next. This is exactly like a broadcast **StreamController**

**ReplaySubject** tracks all history of value that is added to the stream. We can cap the values that kept in the stream.


