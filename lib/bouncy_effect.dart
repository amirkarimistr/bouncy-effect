library bouncy_effect;

import 'package:flutter/material.dart';

class BouncyEffect extends StatefulWidget {
  const BouncyEffect({
    Key? key,
    double width = 200.0,
    double height = 50.0,
    BoxDecoration? boxDecoration,
    Duration duration = const Duration(milliseconds: 300),
    double bound = 0.2,
    VoidCallback? onTap,
    bool reverse = false,
    bool repeat = false,
    Widget? child,
  })  : width = width,
        this.height = height,
        this.boxDecoration = boxDecoration,
        duration = duration,
        this.bound = bound,
        this.onTap = onTap,
        this.child = child,
        this.reverse = reverse,
        this.repeat = repeat,
        super(key: key);

  final double width;

  final double height;

  final BoxDecoration? boxDecoration;

  final Duration duration;

  final double bound;

  final VoidCallback? onTap;

  final Widget? child;

  final bool reverse;

  final bool repeat;

  @override
  _BouncyEffectState createState() => _BouncyEffectState();
}

class _BouncyEffectState extends State<BouncyEffect>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin  {
  double _scale = 1.0;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      upperBound: widget.bound,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          if(widget.repeat){
            _controller.forward();
          }
        }
      })
      ..addListener(() {
        setState(() {
          _scale =
          widget.reverse ? 1 + _controller.value : 1 - _controller.value;
        });
      });

    if(widget.repeat){
      _controller.repeat(reverse: true);
      _controller.forward();
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    super.build(context);


    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
      },
      onTapUp: (_) {
        _controller.reverse();
      },
      onTapCancel: () {
        _controller.reverse();
      },
      onTap: () {
        _controller.forward();
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Transform.scale(
        scale: _scale,
        child: SizedBox(
            width: widget.width, height: widget.height, child: widget.child),
      ),
    );
  }
}
