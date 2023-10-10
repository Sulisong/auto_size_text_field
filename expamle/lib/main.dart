import 'package:auto_size_text_field/auto_size_text_field.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _textEditingControllerOne;
  late TextEditingController _textEditingControllerTwo;
  late TextEditingController _textEditingControllerThree;
  late TextEditingController _textEditingControllerFour;
  late TextEditingController _textEditingControllerFive;

  @override
  void initState() {
    super.initState();
    _textEditingControllerOne = TextEditingController();
    _textEditingControllerTwo = TextEditingController();
    _textEditingControllerThree = TextEditingController();
    _textEditingControllerFour = TextEditingController();
    _textEditingControllerFive = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 48),
              Text(
                'Fixed width (full width of parent\'s BoxConstraints)',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AutoSizeTextField(
                  controller: _textEditingControllerOne,
                  minFontSize: 24,
                  style: TextStyle(fontSize: 64),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              Text(
                'Auto adjusted width based on contents',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AutoSizeTextField(
                  textAlign: TextAlign.center,
                  fullwidth: false,
                  controller: _textEditingControllerTwo,
                  minFontSize: 24,
                  style: TextStyle(fontSize: 64),
                ),
              ),
              SizedBox(height: 48),
              Text('Auto adjusted width with hintText and minWidth'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AutoSizeTextField(
                  controller: _textEditingControllerThree,
                  decoration: InputDecoration(hintText: 'Hint Text'),
                  fullwidth: false,
                  minFontSize: 24,
                  minWidth: 280,
                  style: TextStyle(fontSize: 64),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 48),

              Text('Auto adjusted width with prefix and suffix text'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AutoSizeTextField(
                  minWidth: 100,
                  controller: _textEditingControllerFour,
                  decoration: InputDecoration(
                    prefixText: '\$',
                    suffixText: '😁',
                  ),
                  fullwidth: false,
                  minFontSize: 24,
                  style: TextStyle(fontSize: 64),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 48),
              Text(
                'multi line text with input padding',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 200,
                    maxWidth: 300,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.amber),
                  ),
                  child: AutoSizeTextField(
                    controller: _textEditingControllerFive,
                    fullwidth: false,
                    minFontSize: 0,
                    maxLines: null,
                    style: TextStyle(fontSize: 50),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.all(20)
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    _textEditingControllerFive?.clear();
                  },
                  child: Text('clear'))
            ],
          ),
        ),
      ), //,his trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
