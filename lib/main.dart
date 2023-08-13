import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const AmicoApp());
}

class AmicoApp extends StatelessWidget {
  const AmicoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amico App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const FrontPage(title: 'Amico'),
    );
  }
}

class FrontPage extends StatefulWidget {
  const FrontPage({super.key, required this.title});

  final String title;

  @override
  State<FrontPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FrontPage> {
  String value = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Amico te ayuda a crear el plan perfecto',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Center(
                child: TextFormField(
                  key: _formKey,
                  controller: myController,
                  decoration: const InputDecoration(
                    hintText: '¿Que quieres hacer hoy?',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa a donde te gustaria ir';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CupertinoButton(
                  color: Colors.blueGrey,
                  onPressed: () => {
                        setState(() {
                          value = myController.text;
                        })
                      },
                  child: const Text('Preguntar')),
            ),
            Text('$value')
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
