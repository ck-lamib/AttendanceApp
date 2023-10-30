import 'package:flutter/material.dart';

class IntroductionTile extends StatelessWidget {
  const IntroductionTile({
    super.key,
    required this.image,
    required this.introductionScreenTitle,
    required this.introductionScreenDesc,
  });

  final Widget image;
  final String introductionScreenTitle;
  final String introductionScreenDesc;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //indicator
        image,
        SizedBox(
          height: height * 0.05,
        ),
        SizedBox(
          width: width * 0.75,
          child: Text(
            introductionScreenTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        SizedBox(
          width: width * 0.75,
          child: Text(
            textAlign: TextAlign.center,
            introductionScreenDesc,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Spacer()
      ],
    );
  }
}
