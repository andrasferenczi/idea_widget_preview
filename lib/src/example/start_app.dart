import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:idea_widget_preview/preview.dart';

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class StartAppPreview extends PreviewProvider {
  @override
  List<Preview> get previews => [
    Preview(
      title: "Simple without size",
      builder: (BuildContext context) {
        return StartApp();
      },
    ),
    Preview(
      title: "Simple",
      device: Device(
        info: Devices.ios.iPhone13,
      ),
      builder: (BuildContext context) {
        return StartApp();
      },
    )
  ];
}
