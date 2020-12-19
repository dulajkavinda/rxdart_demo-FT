# Understanding RXDart Streams

### Types of subjects in RxDart

---

### Standard Subject

---

The base for all Subjects. If you'd like to create a new Subject, extend from this class.

### Publisher Subject

---

Exactly like a normal broadcast StreamController with one exception: this class is both a Stream and Sink.

### Behaviour Subject

---

A special StreamController that captures the latest item that has been added to the controller, and emits that as the first item to any new listener.

### Replay Subject

---

A special StreamController that captures all of the items that have been added to the controller, and emits those as the first items to any new listener.

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

## Design

---

![Understanding%20RXDart%20Streams%20157e2138515f4deaaf7a8c838204f908/Screenshot_1608361014.png](Understanding%20RXDart%20Streams%20157e2138515f4deaaf7a8c838204f908/Screenshot_1608361014.png)

![Understanding%20RXDart%20Streams%20157e2138515f4deaaf7a8c838204f908/Screenshot_1608361031.png](Understanding%20RXDart%20Streams%20157e2138515f4deaaf7a8c838204f908/Screenshot_1608361031.png)

![Understanding%20RXDart%20Streams%20157e2138515f4deaaf7a8c838204f908/Screenshot_1608361022.png](Understanding%20RXDart%20Streams%20157e2138515f4deaaf7a8c838204f908/Screenshot_1608361022.png)

![Understanding%20RXDart%20Streams%20157e2138515f4deaaf7a8c838204f908/Screenshot_1608361009.png](Understanding%20RXDart%20Streams%20157e2138515f4deaaf7a8c838204f908/Screenshot_1608361009.png)

![Understanding%20RXDart%20Streams%20157e2138515f4deaaf7a8c838204f908/Screenshot_1608361000.png](Understanding%20RXDart%20Streams%20157e2138515f4deaaf7a8c838204f908/Screenshot_1608361000.png)
