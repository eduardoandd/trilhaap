import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityPlus extends StatefulWidget {
  const ConnectivityPlus({Key? key}) : super(key: key);

  @override
  State<ConnectivityPlus> createState() => _ConnectivityPlusState();
}

class _ConnectivityPlusState extends State<ConnectivityPlus> {
  late StreamSubscription subscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print(result);
    });
  }

  @override
  dispose(){
    super.dispose();
    subscription.cancel();
    
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Connectivy"),
      ),
      body: Column(
        children: [
          Container(),
          TextButton(
              onPressed: () async {
                var connectivityResult =
                    await (Connectivity().checkConnectivity());
                print(connectivityResult);
                if (connectivityResult == ConnectivityResult.mobile) {
                  // I am connected to a mobile network.
                } else if (connectivityResult == ConnectivityResult.wifi) {
                  // I am connected to a wifi network.
                }
              },
              child: Text("Verificar conexão"))
        ],
      ),
    ));
  }
}
