import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: HomePage(),
    );
  }
}

class SwitchState extends InheritedWidget {
  final bool value;
  const SwitchState({
    required this.value,
    required Widget child,
  })  : assert(value != null),
        assert(child != null),
        super(child: child);

  @override
  bool updateShouldNotify(covariant SwitchState oldWidget) =>
      oldWidget.value != value;

  static bool? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SwitchState>()?.value;
}

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _value = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Transform.scale(
            scale: 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.favorite,
                  size: 25.0,
                  color: Colors.orange,
                ),
                Switch(
                  inactiveThumbColor: Colors.amber[300],
                  inactiveTrackColor: Colors.amber[100],
                  value: _value,
                  onChanged: (value) => setState(() => this._value = value),
                ),
                const Icon(Icons.bolt, color: Colors.blue, size: 25.0),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (_value) == false
                ? SwitchState(value: this._value, child: FirstState())
                : SwitchState(value: this._value, child: SecondState())
          ],
        ),
      );
}

class FirstState extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: 650,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Image(image: AssetImage('assets/images/bunny_.jpeg')),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(3.0),
              height: 120.0,
              width: 300.0,
              decoration: BoxDecoration(
                  color: Colors.amber[300],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 3,
                        color: Colors.grey.withOpacity(0.5))
                  ]),
              child: Column(
                children: [
                  const Text('Bunny Tsukino',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w300,
                          wordSpacing: 10,
                          fontFamily: 'Hurricane')),
                  const SizedBox(height: 10.0),
                  const Text(
                      "Careless fourteen-year-old girl with an enormous capacity for love, compassion, and understanding.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                      ))
                ],
              ),
            )
          ],
        ),
      );
}

class SecondState extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        height: 650,
        width: 400,
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            const Image(
              image: AssetImage('assets/images/sailor_moon.jpeg'),
              height: 500.0,
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 120.0,
              width: 300.0,
              decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 3,
                        color: Colors.grey.withOpacity(0.5))
                  ]),
              child: Column(
                children: const [
                  const Text('Sailor Moon',
                      style: TextStyle(
                          fontSize: 35,
                          wordSpacing: 10,
                          fontFamily: 'Hurricane')),
                  const Text(
                      "The warrior girl who is a defender of goodness and justice. Fighting the evil that is trying to take over the universe",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15,
                      ))
                ],
              ),
            )
          ],
        ),
      );
}
