// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: SplashScreen()));
// }

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 40), // Adjust the duration as needed
//     )..repeat();

//     _controller.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height * 0.45,
//         child: AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             return Transform.translate(
//               offset: Offset(
//                   _controller.value * MediaQuery.of(context).size.width, 0),
//               child: Image.asset(
//                 'assets/img/splashbg.png', // Replace with your background image path
//                 width: MediaQuery.of(context).size.width,
//                 fit: BoxFit.cover,
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: SplashScreen()));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 40), // Adjust the duration as needed
    )..repeat();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.23,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // Calculate the offset value for left-to-right animation
            double offsetX =
                (_controller.value - 5.0) * MediaQuery.of(context).size.width;

            return Transform.translate(
              offset: Offset(offsetX, 0),
              child: Image.network(
                'https://img.freepik.com/free-vector/gradient-quill-pen-design-template_23-2149837194.jpg?w=2000', // Replace with your background image path
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            );
          },
        ),
      ),
    );
  }
}
