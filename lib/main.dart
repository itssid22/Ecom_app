import 'package:f_2_app/pages/cart_page.dart';
import 'package:f_2_app/pages/login_page.dart';
import 'package:f_2_app/utils/routes.dart';
import 'package:f_2_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_language_fonts/google_language_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var name = "siddhant";
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,

      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      // ThemeData(
      //     // brightness: Brightness.dark,//hum ye brightness  hata rahe hai dark mode enable karne ke liye

      //     ),
      // ThemeData(
      //   primarySwatch: Colors.green,
      //   appBarTheme: AppBarTheme(
      //       color: Colors.white,
      //       elevation: 1.0,
      //       iconTheme: IconThemeData(color: Colors.black),
      //       titleTextStyle: TextStyle(
      //         color: Colors.black,
      //       )),
      // ),
      debugShowCheckedModeBanner: false,

      initialRoute: MyRoutes.HomeRoute,
      routes: {
        // "/": (context) => LoginPage(),

        "/home": (context) =>
            HomePage(), //yaha jo hum /home likh rahe hai ,use hatakar hum MyRoute.homeRoute:
        MyRoutes.HomeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        // "/login":(context)=> LoginPage(),// vaise hi hum /login ko replace kar denge MyRoutes.loginRoute:
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
