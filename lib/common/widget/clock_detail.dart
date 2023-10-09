import 'dart:async';

import 'package:flutter/material.dart';

class ClockDetails extends StatefulWidget {
  const ClockDetails({
    super.key,
    required this.is24hr,
    this.showSecond = true,
  });
  final bool? is24hr;
  final bool showSecond;

  @override
  State<ClockDetails> createState() => _ClockDetailsState();
}

class _ClockDetailsState extends State<ClockDetails> {
  late DateTime _dateTime;
  late ClockDetailModel _clockModel;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    _clockModel = ClockDetailModel();
    _clockModel.is24HourFormat = (widget.is24hr) ?? true;

    //initial value
    _dateTime = DateTime.now();
    _clockModel.hour = _dateTime.hour;
    _clockModel.minute = _dateTime.minute;
    _clockModel.second = _dateTime.second;
    _clockModel.dayOfWeek = _dateTime.weekday.getDay();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      //value every one second
      _dateTime = DateTime.now();
      _clockModel.hour = _dateTime.hour;
      _clockModel.minute = _dateTime.minute;
      _clockModel.second = _dateTime.second;
      _clockModel.dayOfWeek = _dateTime.weekday.getDay();

      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 50, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // _amPm,
                      _hour(),
                      Container(
                        alignment: AlignmentDirectional.center,
                        margin: const EdgeInsets.all(1.0),
                        padding: const EdgeInsets.all(2.0),
                        child: const ColonWidget(),
                      ),
                      _minute,
                    ],
                  ),
                ),
                widget.showSecond
                    ? Positioned(
                        bottom: 0,
                        right: 0,
                        child: _second,
                      )
                    : const SizedBox.shrink(),
                Positioned(
                  top: 0,
                  right: 0,
                  child: _amPm,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: _dayOfWeek,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _hour() => Container(
        padding: const EdgeInsets.only(bottom: 10),
        alignment: AlignmentDirectional.center,
        child: AnimatedText(
          text:
              _clockModel.is24HourTimeFormat ? hh_24(_clockModel.hour) : hh_12(_clockModel.hour)[0],
          textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontFamily: "Technology",
                fontSize: 70,
                letterSpacing: 5,
              ),
        ),
      );

  Widget get _minute => Container(
        padding: const EdgeInsets.only(bottom: 10),
        alignment: AlignmentDirectional.center,
        child: AnimatedText(
          text: mTOmm(_clockModel.minute),
          textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontFamily: "Technology",
                fontSize: 70,
                letterSpacing: 5,
              ),
        ),
      );

  Widget get _second => Container(
        padding: const EdgeInsets.only(bottom: 10),
        // margin: EdgeInsets.only(left: 20),
        alignment: AlignmentDirectional.center,
        // decoration: widget.secondDigitDecoration,
        child: AnimatedText(
          text: sTOss(_clockModel.second),
          // animationStyle: widget.digitAnimationStyle,
          textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontFamily: "Technology",
                fontSize: 30,
                letterSpacing: 2,
              ),
        ),
      );
  Widget get _dayOfWeek => Container(
        padding: const EdgeInsets.only(bottom: 10),
        margin: const EdgeInsets.only(right: 10),
        alignment: AlignmentDirectional.center,
        // decoration: widget.secondDigitDecoration,
        child: AnimatedText(
          text: _clockModel.dayOfWeek,
          // animationStyle: widget.digitAnimationStyle,
          textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontFamily: "Technology",
                fontSize: 28,
                letterSpacing: 2,
              ),
        ),
      );

  Widget get _amPm => _clockModel.is24HourTimeFormat
      ? const SizedBox()
      : Container(
          alignment: AlignmentDirectional.center,
          child: AnimatedText(
            text: "${hh_12(_clockModel.hour)[1]}",
            textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontFamily: "Technology",
                  fontSize: 25,
                  letterSpacing: 2,
                ),
          ),
        );
}

class ClockDetailModel {
  late int hour;
  late int minute;
  late int second;
  late bool is24HourFormat;
  late String dayOfWeek;

  get is24HourTimeFormat => is24HourFormat;
}

hh_24(int hour) {
  return hour.toString().padLeft(2, '0');
}

hh_12(int hour) {
  var times = [];
  late String sHour;
  String h12State = "AM";
  int newHour = hour;

  if (newHour >= 12) {
    h12State = "PM";
    if (newHour > 12) {
      newHour = newHour - 12;
    }
  }
  sHour = newHour.toString().padLeft(2, '0');

  times.add(sHour == "00" ? "12" : sHour);
  times.add(h12State);

  return times;
}

mTOmm(int minute) {
  return minute.toString().toString().padLeft(2, '0');
}

sTOss(int second) {
  return second.toString().toString().padLeft(2, '0');
}

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key, required this.text, this.textStyle, this.animationStyle});
  final String text;
  final TextStyle? textStyle;
  final Curve? animationStyle;

  @override
  State<AnimatedText> createState() => AnimatedTextState();
}

class AnimatedTextState extends State<AnimatedText> with SingleTickerProviderStateMixin {
  String topText = "";
  String bottomText = "";

  late AnimationController _animatedTexttAnimationController;
  late Animation<double> _spinAnimation;

  @override
  void initState() {
    super.initState();
    bottomText = widget.text;
    _animatedTexttAnimationController =
        AnimationController(duration: const Duration(milliseconds: 500), vsync: this)
          ..addListener(() => setState(() {}))
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                bottomText = topText;
                topText = "";
                _animatedTexttAnimationController.value = 0.0;
              });
            }
          });

    _spinAnimation = CurvedAnimation(
        parent: _animatedTexttAnimationController, curve: widget.animationStyle ?? Curves.ease);
  }

  @override
  void dispose() {
    _animatedTexttAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AnimatedText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.text != oldWidget.text) {
      //Need to spin new value
      topText = widget.text;
      _animatedTexttAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipper: RectClipper(),
      child: Stack(
        children: <Widget>[
          FractionalTranslation(
            translation: Offset(0.0, 1 - _spinAnimation.value),
            child: Text(
              topText,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: widget.textStyle,
            ),
          ),
          FractionalTranslation(
            translation: Offset(0.0, _spinAnimation.value),
            child: Text(bottomText,
                maxLines: 1, overflow: TextOverflow.ellipsis, style: widget.textStyle),
          ),
        ],
      ),
    );
  }
}

class RectClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0.0, 0.0, size.width, size.height + 1);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

//for colon
class ColonWidget extends StatefulWidget {
  const ColonWidget({super.key});

  @override
  State<ColonWidget> createState() => _ColonWidgetState();
}

class _ColonWidgetState extends State<ColonWidget> {
  late Timer timer;
  bool visible = true;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        visible = !visible;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.only(bottom: 10),
      child: AnimatedOpacity(
        opacity: visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Text(
          ":",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontFamily: "Technology",
                fontSize: 50,
              ),
        ),
      ),
    );
  }
}

extension WeekDayParsing on int {
  String getDay() {
    switch (this) {
      case 7:
        return "SUN";
      case 1:
        return "MON";
      case 2:
        return "TUE";
      case 3:
        return "WED";
      case 4:
        return "THU";
      case 5:
        return "FRI";
      case 6:
        return "SAT";
      default:
        return "";
    }
  }
}
