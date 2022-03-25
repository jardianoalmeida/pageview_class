import 'dart:ui';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = PageController(
    //   viewportFraction: 0.50,
    initialPage: 1,
  );

  double currentPage = 0.0;
  @override
  void initState() {
    controller.addListener(() {
      currentPage = controller.page!;
      setState(() {});
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
      body: PageView.builder(
        controller: controller,
        itemCount: 10,
        itemBuilder: (context, page) {
          double value = 1.0;
          if (page == currentPage.floor()) {
            value = currentPage - page;
            value = 1 - value;
          } else if (page == currentPage.floor()) {
            value = page - currentPage;
            value = 1 - value;
          }

          final rotateAnimation = lerpDouble(-0.4, 0, value);
          return Transform(
            transform: Matrix4.identity()..rotateZ(rotateAnimation!),
            child: Container(
              color: page % 2 == 0 ? Colors.red : Colors.blue,
              child: Center(
                child: Text('$currentPage'),
              ),
            ),
          );
        },
      ),
    );
  }
}
