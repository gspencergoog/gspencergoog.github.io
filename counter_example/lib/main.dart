import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// This is a stateless widget that forms the main widget for the application. It
// is said to be stateless because its attributes are fixed at creation, so it
// can't keep any modified application state itself, the state it uses all comes
// from its inputs. The power of stateless widgets is that they are immutable, but can still 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run" on the
        // command line, or the run button in your IDE. You'll see the
        // application has a purple toolbar. Then, without quitting the app, try
        // changing the colorScheme below to use a seedColor of Colors.green and
        // then invoke "hot reload" (press "r" in the console where you ran
        // "flutter run", save your changes to "hot reload" in a Flutter IDE, or
        // press the "hot reload" button in a Flutter IDE, denoted by a
        // lightning bolt ⚡).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. This is what is meant by
        // "stateful hot reload". To reset the state, use hot restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // This makes the theme conform to a more up-to-date version of the
        // Material Design specification. Soon, this will be the default, and
        // this flag won't be necessary.
        //
        // See https://m3.material.io/ for more information about Material
        // Design.
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Counter Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks and behaves.
  //
  // Widgets are the configuration for the State object. This class holds the
  // values (in this case the title) provided by the parent (in this case the
  // App widget) and used by the build method of the State. Fields in a Widget
  // subclass are always marked "final" because Widget subclasses are meant to
  // be lightweight configuration objects that are rebuilt with new values
  // rather than modified. Modifiable state belongs in the associated State
  // object.

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 3;

  void _incrementCounterBy(int amount) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to run the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and nothing would appear to happen.
      _counter += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is run every time setState is called as, for example, the
    // _incrementCounter method does above.
    //
    // The Flutter framework has been optimized to make running build methods
    // fast, so that you can rebuild anything that needs updating rather than
    // having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // The default background color is the primary color of the ColorScheme
        // set on the Theme, which in this case happens to be the same white as
        // the default Scaffold background color, so this sets it to use another
        // color from the scheme instead, to have some contrast.
        //
        // Using Theme.of(context) means that this build function will
        // automatically be called again to rebuild if the theme changes.
        //
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // This takes the value from the MyHomePage object that was created by
        // the App.build method, and uses it to set the AppBar title.
        title: Text(widget.title),
      ),
      // AnimatedContainer is similar to a Container widget, in that it defines
      // a region that has some display attributes and a child, but it also
      // animates any changes to its parameters.
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          shape: StarBorder(
            side: const BorderSide(),
            points: _counter.toDouble(),
            // TRY THIS: Try changing the parameters here. When you hot reload
            // them, the border will animate to the new values automatically,
            // over the duration set in the AnimatedContainer, above.
            pointRounding: 0.4,
            valleyRounding: 0.4,
            innerRadiusRatio: .5,
          ),
        ),
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // TRY THIS: Invoke "debug painting" (press "p" in the console, or
          // choose the "Toggle Debug Paint" action in the IDE), to see the
          // wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 8.0),
            child: FloatingActionButton(
              onPressed: _counter > 3 ? () => _incrementCounterBy(-1) : null,
              tooltip: 'Decrement',
              disabledElevation: 0,
              child: const Icon(Icons.remove),
            ),
          ),
          FloatingActionButton(
            onPressed: () => _incrementCounterBy(1),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
