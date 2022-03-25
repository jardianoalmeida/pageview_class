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
          if (currentPage.floor() == page) {
            final value = currentPage - page;
            print(value);
          }
          return Container(
            color: page % 2 == 0 ? Colors.red : Colors.blue,
            child: Center(
              child: Text('$currentPage'),
            ),
          );
        },
      ),
    );
  }
}
