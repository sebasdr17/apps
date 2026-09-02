import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sebastian Alberto Dimas Rodriguez',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Sebastian Alberto Dimas Rodriguez'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // Cambio 1: ahora incrementa de dos en dos.
  void _incrementCounter() {
    setState(() {
      _counter += 2;
    });
  }

  // Cambio 2: nuevo método para reiniciar el contador a cero.
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // Cambio 2: ahora hay dos botones flotantes, uno para incrementar
      // y otro para reiniciar. Se agrupan en una Column dentro de
      // floatingActionButton (que admite un solo widget hijo).
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'reset',
            onPressed: _resetCounter,
            tooltip: 'Reset',
            backgroundColor: Colors.redAccent,
            child: const Icon(Icons.restart_alt),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: _incrementCounter,
            tooltip: 'Increment by 2',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}