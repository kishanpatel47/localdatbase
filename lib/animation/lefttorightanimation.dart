import 'package:flutter/material.dart';

class RightToLeftImageAnimation extends StatefulWidget {
  @override
  _RightToLeftImageAnimationState createState() =>
      _RightToLeftImageAnimationState();
}

class _RightToLeftImageAnimationState extends State<RightToLeftImageAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );

    // Add a delay before starting the animation
    Future.delayed(Duration(seconds: 2), () {
      _controller.forward(); // Start the animation
    });

    _animation = Tween<double>(
      begin: 0,
      end: -MediaQuery.of(context).size.width,
    ).animate(_controller);

    // Detect when the animation completes and reverse the animation
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_animation.value, 0),
              child: Image.network(
                'https://img.freepik.com/free-vector/gradient-quill-pen-design-template_23-2149837194.jpg?w=2000',
                width: double.infinity,
                height: 100,
              ),
            );
          },
        ),
      ),
    );
  }
}
