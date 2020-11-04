import 'package:flutter/material.dart';
import 'package:ombre_widget_package/helper/utils.dart';

enum LinearStrokeCap { butt, round, roundAll }

// ignore: must_be_immutable
class LinearPercentIndicator extends StatefulWidget {

  final String iconName;
  final String percentageStr;
  ///Percent value between 0.0 and 1.0
  final double percent;

  ///Color of the background of the Line , default = transparent
  final Color fillColor;

  ///First color applied to the complete line
  final Color backgroundColor;

  Color get progressColor => _progressColor;

  Color _progressColor;

  ///true if you want the Line to have animation
  final bool animation;

  ///duration of the animation in milliseconds, It only applies if animation attribute is true
  final int animationDuration;

  ///widget inside the Line
  final Widget center;

  ///The kind of finish to place on the end of lines drawn, values supported: butt, round, roundAll
  final LinearStrokeCap linearStrokeCap;

  ///alignment of the Row (leading-widget-center-trailing)
  final MainAxisAlignment alignment;

  /// set true if you want to animate the linear from the last percent value you set
  final bool animateFromLastPercent;

  /// If present, this will make the progress bar colored by this gradient.
  ///
  /// This will override [progressColor]. It is an error to provide both.
  final LinearGradient linearGradient;

  /// set false if you don't want to preserve the state of the widget
  final bool addAutomaticKeepAlive;

  /// set true if you want to animate the linear from the right to left (RTL)
  final bool isRTL;

  /// Creates a mask filter that takes the progress shape being drawn and blurs it.
  final MaskFilter maskFilter;

  /// Set true if you want to display only part of [linearGradient] based on percent value
  /// (ie. create 'VU effect'). If no [linearGradient] is specified this option is ignored.
  final bool clipLinearGradient;

  /// set a linear curve animation type
  final Curve curve;

  /// set true when you want to restart the animation, it restarts only when reaches 1.0 as a value
  /// defaults to false
  final bool restartAnimation;
  String platform;

  LinearPercentIndicator(
      {Key key,
        this.platform = 'mobile',
        this.iconName,
        this.percentageStr,
        this.fillColor = Colors.transparent,
        this.percent = 0.0,
        this.backgroundColor = Colors.transparent,
        this.linearGradient,
        Color progressColor,
        this.animation = false,
        this.animationDuration = 500,
        this.animateFromLastPercent = false,
        this.isRTL = false,
        this.center,
        this.addAutomaticKeepAlive = true,
        this.linearStrokeCap,
        this.alignment = MainAxisAlignment.start,
        this.maskFilter,
        this.clipLinearGradient = false,
        this.curve = Curves.linear,
        this.restartAnimation = false})
      : super(key: key) {
    if (linearGradient != null && progressColor != null) {
      throw ArgumentError('Cannot provide both linearGradient and progressColor');
    }
    _progressColor = progressColor ?? Colors.red;

    assert(curve != null);

    if (percent < 0.0 || percent > 1.0) {
      throw new Exception("Percent value must be a double between 0.0 and 1.0");
    }
  }

  @override
  _LinearPercentIndicatorState createState() => _LinearPercentIndicatorState();
}

class _LinearPercentIndicatorState extends State<LinearPercentIndicator>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController _animationController;
  Animation _animation;
  double _percent = 0.0;

  @override
  void dispose() {
    if (_animationController != null) {
      _animationController.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    if (widget.animation) {
      _animationController =
      new AnimationController(vsync: this, duration: Duration(milliseconds: widget.animationDuration));
      _animation = Tween(begin: 0.0, end: widget.percent).animate(
        CurvedAnimation(parent: _animationController, curve: widget.curve),
      )..addListener(() {
        setState(() {
          _percent = _animation.value;
        });
        if (widget.restartAnimation && _percent == 1.0) {
          _animationController.repeat(min: 0, max: 1.0);
        }
      });
      _animationController.forward();
    } else {
      _updateProgress();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(LinearPercentIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percent != widget.percent) {
      if (_animationController != null) {
        _animationController.duration = Duration(milliseconds: widget.animationDuration);
        _animation = Tween(begin: widget.animateFromLastPercent ? oldWidget.percent : 0.0, end: widget.percent).animate(
          CurvedAnimation(parent: _animationController, curve: widget.curve),
        );
        _animationController.forward(from: 0.0);
      } else {
        _updateProgress();
      }
    }
  }

  _updateProgress() {
    setState(() {
      _percent = widget.percent;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var containerWidget = Container(
      width: double.infinity,
      height: setHeight(8),
      padding: EdgeInsets.only(
        left: setWidth(4),
        right: setWidth(4),
      ),
      child: CustomPaint(
        painter: LinearPainter(
          isRTL: widget.isRTL,
          progress: _percent,
          center: widget.center,
          progressColor: widget.progressColor,
          linearGradient: widget.linearGradient,
          backgroundColor: widget.backgroundColor,
          linearStrokeCap: widget.linearStrokeCap,
          lineWidth: setHeight(8),
          maskFilter: widget.maskFilter,
          clipLinearGradient: widget.clipLinearGradient,
        ),
        child: (widget.center != null) ? Center(child: widget.center) : Container(),
      ),
    );

    return Row(
      children: <Widget>[
        widget.platform == 'web' ? Container() : Container(
          height: setHeight(35),
          width: setWidth(30),
          child: Center(
            child: Image.asset(
              'assets/images/${widget.iconName}.png',
              height: setHeight(19),
              width: setWidth(14),
              fit: BoxFit.scaleDown,
              color: Color(hexStringToHexInt(widget.platform == 'web' ? '#040303' : '#FDFFFC')),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
        ),
        widget.platform == 'web' ? Container() : SizedBox(width: setWidth(16),),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: setHeight(2), color: Color(hexStringToHexInt('#2F2323')).withOpacity(0.3)),
              borderRadius: BorderRadius.circular(setHeight(35)),
            ),
            child: containerWidget,
          ),
        ),
        SizedBox(width: setWidth(23),),
        Container(
          child: Text(
            widget.percentageStr,
            style: getCustomFont(Color(hexStringToHexInt(widget.platform == 'web' ? '#040303' : '#FFFCF2')), 8, 'Poppins-Regular'),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => widget.addAutomaticKeepAlive;
}

class LinearPainter extends CustomPainter {
  final Paint _paintBackground = new Paint();
  final Paint _paintLine = new Paint();
  final lineWidth;
  final progress;
  final center;
  final isRTL;
  final Color progressColor;
  final Color backgroundColor;
  final LinearStrokeCap linearStrokeCap;
  final LinearGradient linearGradient;
  final MaskFilter maskFilter;
  final bool clipLinearGradient;

  LinearPainter({
    this.lineWidth,
    this.progress,
    this.center,
    this.isRTL,
    this.progressColor,
    this.backgroundColor,
    this.linearStrokeCap = LinearStrokeCap.butt,
    this.linearGradient,
    this.maskFilter,
    this.clipLinearGradient,
  }) {
    _paintBackground.color = backgroundColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = lineWidth;

    _paintLine.color = progress.toString() == "0.0" ? progressColor.withOpacity(0.0) : progressColor;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = lineWidth;

    if (linearStrokeCap == LinearStrokeCap.round) {
      _paintLine.strokeCap = StrokeCap.round;
    } else if (linearStrokeCap == LinearStrokeCap.butt) {
      _paintLine.strokeCap = StrokeCap.butt;
    } else {
      _paintLine.strokeCap = StrokeCap.round;
      _paintBackground.strokeCap = StrokeCap.round;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final start = Offset(0.0, size.height / 2);
    final end = Offset(size.width, size.height / 2);
    canvas.drawLine(start, end, _paintBackground);

    if (maskFilter != null) {
      _paintLine.maskFilter = maskFilter;
    }

    if (isRTL) {
      final xProgress = size.width - size.width * progress;
      if (linearGradient != null) {
        _paintLine.shader = _createGradientShaderRightToLeft(size, xProgress);
      }
      canvas.drawLine(end, Offset(xProgress, size.height / 2), _paintLine);
    } else {
      final xProgress = size.width * progress;
      if (linearGradient != null) {
        _paintLine.shader = _createGradientShaderLeftToRight(size, xProgress);
      }
      canvas.drawLine(start, Offset(xProgress, size.height / 2), _paintLine);
    }
  }

  Shader _createGradientShaderRightToLeft(Size size, double xProgress) {
    Offset shaderEndPoint = clipLinearGradient ? Offset.zero : Offset(xProgress, size.height);
    return linearGradient.createShader(
      Rect.fromPoints(
        Offset(size.width, size.height),
        shaderEndPoint,
      ),
    );
  }

  Shader _createGradientShaderLeftToRight(Size size, double xProgress) {
    Offset shaderEndPoint = clipLinearGradient ? Offset(size.width, size.height) : Offset(xProgress, size.height);
    return linearGradient.createShader(
      Rect.fromPoints(
        Offset.zero,
        shaderEndPoint,
      ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}