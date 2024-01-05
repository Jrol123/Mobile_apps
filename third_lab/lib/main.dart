import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme:
          ThemeData(colorScheme: const ColorScheme.dark(), useMaterial3: true),
      home: const MyHomePage(
          title: Text('Calculator',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
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

  final Widget title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _textField = "0";

  // TODO Объединить _math в одну функцию
  void _mathNumber(String ct) {
    setState(() {
      if (_textField != "0" && _textField != "error" || ct == ".") {
        _textField += ct;
      } else {
        _textField = ct;
      }
    });
  }

  void _mathOperation(String sym) {
    setState(() {
      _textField += sym;
    });
  }

  void _remove() {
    setState(() {
      if (_textField == "" || _textField == "0" || _textField == "error") {
        _textField = "0";
      } else {
        _textField = _textField.substring(0, _textField.length - 1);
      }
    });
  }

  void _removeAll() {
    setState(() {
      _textField = "0";
    });
  }

  /*
  Проблемы с переполнением (1e-7)
   */
  void _solve() {
    setState(() {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_textField);
        ContextModel cm = ContextModel();
        print(_textField);
        _textField = (exp.evaluate(EvaluationType.REAL, cm)).toString();
        // await Clipboard.setData(ClipboardData(text: _textField));
      } catch (e) {
        _textField = "error";
      }
    });
  }

  /*
  TODO Объединить 2 виджета в 1.

   */
  Widget _buildNumButton(String num) {
    return ElevatedButton(
        onPressed: () => _mathNumber(num),
        child: Text(num.toString(), style: const TextStyle(fontSize: 20)));
  }

  Widget _buildActButton(String sym) {
    return ElevatedButton(
        onPressed: () => _mathOperation(sym),
        child: Text(sym, style: const TextStyle(fontSize: 20)));
  }

  /*
  TODO Добавить отступы по бокам кнопок
  
  TODO Добавить центровку numpad-а, а спецкнопки оставить справа 

   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Align(alignment: Alignment.center, child: widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _textField,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TODO Заставить numpad прижаться к правой части
                Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildNumButton("1"),
                              _buildNumButton("2"),
                              _buildNumButton("3"),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildNumButton("4"),
                              _buildNumButton("5"),
                              _buildNumButton("6"),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildNumButton("7"),
                              _buildNumButton("8"),
                              _buildNumButton("9"),
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildNumButton("00"),
                            _buildNumButton("0"),
                            _buildNumButton(".")
                          ],
                        )
                      ]),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActButton("+"),
                    _buildActButton("-"),
                    _buildActButton("*"),
                    _buildActButton("/")
                  ],
                ),
                SizedBox(
                  height: 48.0 * 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          onPressed: _removeAll,
                          child:
                              const Text("C", style: TextStyle(fontSize: 20))),
                      ElevatedButton(
                          onPressed: _remove, child: const Icon(Icons.delete)),
                      ElevatedButton(onPressed: _solve, child: const Text("="))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
