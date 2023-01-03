import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아라동 맨'),
        //   , style: TextStyle(color: Colors.black),),
        // backgroundColor: Colors.white,
        actions: [],
      ),
    );
  }
}
