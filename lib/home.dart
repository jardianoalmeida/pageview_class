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
        title: const Text('kkkkkk'),
        centerTitle: true,
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: 10,
        itemBuilder: (context, page) {
          double value = 1.0;
          bool isCurrent = false;
          if (page == currentPage.floor()) {
            value = currentPage - page;
            value = 1 - value;
            isCurrent = true;
          } else if (page == currentPage.floor()) {
            value = page - currentPage;
            value = 1 - value;
            isCurrent = false;
          }

          final rotateAnimation =
              lerpDouble(isCurrent ? -0.87 : 0.87, 0, value);
          final sizeAnimation = lerpDouble(0.50, 1, value);
          final opacityAnimation = Interval(0.5, 1).transformInternal(value);

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..scale(sizeAnimation),
            child: Container(
              color: page % 2 == 0 ? Colors.red : Colors.blue,
              child: Center(
                child: Opacity(
                  opacity: opacityAnimation,
                  child: Text('$currentPage'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
