import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyAnimateContainer(),
              MyAnimatedText()
            ],
          )
        ),
      ),
    );
  }
}

class MyAnimateContainer extends StatefulWidget {
  const MyAnimateContainer({super.key});

  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimateContainer> {
  bool _isExpanded = true;

  void toggleIsExpanded () {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleIsExpanded,
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        width: _isExpanded ? 300 : 200,
        height: _isExpanded ? 300 : 200,
        color: _isExpanded ? Colors.red[400] : Colors.orange[400],
      ),
    );
  }
}


class MyAnimatedText extends StatefulWidget {
  const MyAnimatedText({super.key});

  @override
  _myAnimatedTextState createState() => _myAnimatedTextState();
}

class _myAnimatedTextState extends State<MyAnimatedText> {
  bool _isVisible = true;

  void changeVisibility () {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AnimatedOpacity(opacity: _isVisible ? 1 : 0 , duration: const Duration(seconds: 1), child:const Text('some dummy text'),),
        ElevatedButton(onPressed: changeVisibility, child: const Text('Toggle Text'))
      ],
    );
  }
}