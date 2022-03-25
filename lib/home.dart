import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController(
    viewportFraction: 0.80,
  );

  @override
  void initState() {
    controller.addListener(() {
      print(controller.page);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance da loja'),
        centerTitle: true,
      ),
      body: PageView(
        controller: controller,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.blue),
        ],
      ),
    );
  }
}
