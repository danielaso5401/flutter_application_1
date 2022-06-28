// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:async';

import 'inital.dart';

// ignore: use_key_in_widget_constructors
class ConectBluetooth extends StatefulWidget {
  @override
  _ConectBluetooth createState() => _ConectBluetooth();
}

class _ConectBluetooth extends State<ConectBluetooth> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  // ignore: unused_field
  String _address = "...";
  // ignore: unused_field
  String _name = "...";

  @override
  void initState() {
    super.initState();

    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    Future.doWhile(() async {
      // Wait if adapter not enabled
      if (await FlutterBluetoothSerial.instance.isEnabled == null) {
        return false;
      }
      await Future.delayed(const Duration(milliseconds: 0xDD));
      return true;
    }).then((_) {
      // Update the address field
      FlutterBluetoothSerial.instance.address.then((address) {
        setState(() {
          _address = address!;
        });
      });
    });

    FlutterBluetoothSerial.instance.name.then((name) {
      setState(() {
        _name = name!;
      });
    });

    // Listen for futher state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;
      });
    });
  }

  @override
  void dispose() {
    FlutterBluetoothSerial.instance.setPairingRequestHandler(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 23, 35, 68),
        body: ListView(children: <Widget>[
          const Divider(),
          const ListTile(
              title: Text(
            'Selecciona tu dispositivo',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )),
          Container(
            width: 180,
            height: 180,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                gradient: LinearGradient(colors: <Color>[
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 33, 25, 80),
                ])),
            child: const Image(
                image: NetworkImage(
                    "https://images.vexels.com/media/users/3/142812/isolated/preview/992801ae3182fa95353e941cfcac9293-diseno-de-escudo-logo-emblema.png")),
          ),
          //habilitar y dasabilitar el Bluetooth
          SwitchListTile(
            activeColor: const Color.fromARGB(255, 9, 255, 18),
            title: const Text(
              'Bluetooth',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            value: _bluetoothState.isEnabled,
            onChanged: (bool value) {
              future() async {
                if (value) {
                  await FlutterBluetoothSerial.instance.requestEnable();
                } else {
                  await FlutterBluetoothSerial.instance.requestDisable();
                }
              }

              future().then((_) {
                setState(() {});
              });
            },
          ),
          //boton para conectar con un dispositbo
          ListTile(
            title: const Text(
              'Estado Bluetooth',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _bluetoothState.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: FloatingActionButton(
              // ignore: sort_child_properties_last
              child: const Icon(Icons.settings),
              elevation: 50.0,
              backgroundColor: const Color.fromARGB(255, 0, 82, 136),
              onPressed: () {
                FlutterBluetoothSerial.instance.openSettings();
              },
            ),
          ),
          const Divider(),
          RaisedButton(
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Initial()));
              },
              child: const Text(
                "Home",
                style: TextStyle(fontSize: 20),
              ))

          // ListTile(
          //   title: const Text('Local adapter address'),
          //   subtitle: Text(_address),
          // ),
          // ListTile(
          //   title: const Text('Local adapter name'),
          //   subtitle: Text(_name),
          //   onLongPress: null,
          // ),
        ]));
  }
}
