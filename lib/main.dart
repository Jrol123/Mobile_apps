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
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text('Flutter heading',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w900))),
            backgroundColor: Colors.blue,
          ),
          body: Center(
              child: Column(
            children: [
              const Text(
                '11',
                style: TextStyle(color: Colors.red, fontSize: 40),
              ),
              const Text('22',
                  style: TextStyle(color: Colors.red, fontSize: 40)),
              const Text('33',
                  style: TextStyle(color: Colors.red, fontSize: 40)),
              ElevatedButton(onPressed: () => {}, child: const Text('kek'), style: ButtonStyle(minimumSize: ),)
            ],
          )),
        ));
  }
}
