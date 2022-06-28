import 'package:flutter/material.dart';

class Initial extends StatefulWidget {
  const Initial({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  bool _lights = false;
  bool _door = false;
  int distance = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Container(
          color: const Color.fromARGB(255, 23, 35, 68),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    gradient: LinearGradient(colors: <Color>[
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(255, 33, 25, 80),
                    ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Final Destiny',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Image(
                      image: NetworkImage(
                          'https://images.vexels.com/media/users/3/142812/isolated/preview/992801ae3182fa95353e941cfcac9293-diseno-de-escudo-logo-emblema.png'),
                      width: 150,
                      height: 150,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Color.fromARGB(255, 37, 89, 158),
                  ),
                  child: SwitchListTile(
                    title: const Text('Luces',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    activeColor: const Color.fromARGB(255, 9, 189, 9),
                    inactiveThumbColor: Colors.black,
                    inactiveTrackColor: Colors.white,
                    value: _lights,
                    onChanged: (bool value) {
                      setState(() {
                        _lights = value;
                      });
                    },
                    secondary: const Icon(
                      Icons.lightbulb_outline,
                      color: Colors.white,
                    ),
                  )),
              const SizedBox(height: 3),
              Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Color.fromARGB(255, 37, 89, 158),
                  ),
                  child: SwitchListTile(
                    title: const Text('Cochera',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    activeColor: const Color.fromARGB(255, 9, 189, 9),
                    inactiveThumbColor: Colors.black,
                    inactiveTrackColor: Colors.white,
                    value: _door,
                    onChanged: (bool value) {
                      setState(() {
                        _door = value;
                      });
                    },
                    secondary: const Icon(
                      Icons.sensor_door_outlined,
                      color: Colors.white,
                    ),
                  )),
              const SizedBox(height: 20),
              Container(
                width: 140,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 37, 89, 158),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "$distance metros",
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
