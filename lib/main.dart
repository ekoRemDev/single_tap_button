import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Single Click'),
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
  ValueNotifier<bool> isPressed = ValueNotifier<bool>(false);
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
            ValueListenableBuilder(
              valueListenable: isPressed,
              builder: (context, value, child) {
                return ElevatedButton(
                    onPressed: isPressed.value
                        ? null
                        : () {
                            isPressed.value = true;
                            _incrementCounter();
                          },
                    child: !isPressed.value
                        ? const Text('Press Me')
                        : const Text('Already pressed Me'));
              },
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ValueListenableBuilder(
              valueListenable: isPressed,
              builder: (context, value, child) {
                return GestureDetector(
                  onDoubleTap: () {
                    isPressed.value = false;
                  },
                  child: isPressed.value
                      ? const Text('Double tap on me to enable button')
                      : const Text(''),
                );
              },
            ),



          ],
        ),
      ),
    );
  }
}
