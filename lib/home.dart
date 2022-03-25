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
        itemBuilder: (context, index) {
          return Container(
            color: index % 2 == 0 ? Colors.red : Colors.blue,
            child: Center(
              child: Text('$currentPage'),
            ),
          );
        },
      ),
    );
  }
}
