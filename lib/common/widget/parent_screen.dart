import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ParentScreen extends StatelessWidget {
  const ParentScreen({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/sample.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          // SizedBox(
          //   child: SvgPicture.asset(
          //     "assets/background.svg",
          //     width: double.infinity,
          //     height: double.infinity,
          //     fit: BoxFit.fill,
          //     // colorFilter: ColorFilter.mode(
          //     //   Theme.of(context).primaryColor,
          //     //   BlendMode.srcIn,
          //     // ),
          //   ),
          // ),
          // Positioned(
          //     top: 0,
          //     left: 0,
          //     right: 0,
          //     bottom: 0,
          //     child: Container(
          //       decoration: const BoxDecoration(
          //         gradient: LinearGradient(
          //           begin: Alignment.topLeft,
          //           end: Alignment.bottomRight,
          //           // colors: [
          //           //   Color.fromRGBO(145, 61, 136, 0.80),
          //           //   Color.fromRGBO(90, 43, 102, 0.35),
          //           // ],
          //           // stops: [0.5603, 0.8674],
          //           colors: [
          //             Color(0xFF5A2B66), // #5A2B66 in hexadecimal
          //             Color.fromRGBO(76, 49, 83, 0.54), // rgba(76, 49, 83, 0.54)
          //             Color.fromRGBO(168, 63, 194, 0.17), // rgba(168, 63, 194, 0.17)
          //           ],
          //           stops: [
          //             0.0043,
          //             0.5402,
          //             0.9963
          //           ], // Stops correspond to the percentages in the CSS gradient
          //           // transform:
          //           //     GradientRotation(169 * 3.14159265359 / 180), // Convert degrees to radians
          //         ),
          //       ),
          //     )),
          Positioned.fill(child: child),

          // child,
        ],
      ),
    );
  }
}
