import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

const _kDefaultDuration = Duration(milliseconds: 300);

/// A drag-to-expand sheet container.
class ExpandableSheet extends StatefulWidget {
  /// Height of the [ExpandableSheet] when it is collapsed.
  final double minHeight;

  /// Maximum height to which this [ExpandableSheet] can expand.
  final double? maxHeight;

  final Widget child;

  final Color color;

  const ExpandableSheet({
    super.key,
    this.minHeight = 80,
    this.maxHeight,
    required this.child,
    required this.color,
  });

  @override
  State<ExpandableSheet> createState() => ExpandableSheetState();
}

class ExpandableSheetState extends State<ExpandableSheet>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  double yPos = 0;

  bool contentScrollable = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);
    _controller.duration = _kDefaultDuration;
    _controller.reverseDuration = _kDefaultDuration;
    _controller.addListener(() {
      if (_controller.value >= 0.2 && !contentScrollable) {
        setState(() => contentScrollable = true);
      } else if (_controller.value < 0.2 && contentScrollable) {
        setState(() => contentScrollable = false);
      }
    });
  }

  double _yToPercentage(double totalHeight, double y) {
    return 1 - (y / totalHeight);
  }

  double _percentageToY(double totalHeight, double percentage) {
    return totalHeight * (1 - percentage);
  }

  _animate(double velocity, double maxHeight) {
    final percentage = _yToPercentage(maxHeight, yPos);
    final fromY = percentage;
    double toY;
    if (velocity == 0) {
      // If the drag gesture ended without a fling, expand or collapse depending
      // on how far out the card was dragged.
      toY = percentage > 0.35 ? 1.0 : 0.0;
    } else {
      // Otherwise expand or collapse depending on the velocity vector.
      toY = velocity < 0 ? 1.0 : 0.0;
    }
    final simulation = SpringSimulation(
      const SpringDescription(mass: 1, stiffness: 500, damping: 30),
      fromY,
      toY,
      -velocity / maxHeight,
    );
    _controller.animateWith(simulation);
  }

  _onDragStart(
    DragStartDetails details,
    double collapsedHeight,
    double expandedHeight,
  ) {
    final value = _controller.value;
    if (value >= 0 && value < 0.01) {
      yPos = expandedHeight - collapsedHeight;
    } else {
      yPos = _percentageToY(expandedHeight, _controller.value);
    }
    _controller.stop(canceled: true);
  }

  _onDragUpdate(DragUpdateDetails details, double maxHeight) {
    final newYPos = yPos + details.delta.dy;
    final maxOvershoot = maxHeight * 0.1;
    if (newYPos > -maxOvershoot) {
      yPos = newYPos;
      _controller.value = _yToPercentage(maxHeight, yPos);
    }
  }

  _onDragEnd(DragEndDetails details, double maxHeight) {
    final velocity = details.velocity.pixelsPerSecond.dy;
    _animate(velocity, maxHeight);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight;
        final minHeight = widget.minHeight;
        final maxHeight = widget.maxHeight ?? availableHeight * 0.8;
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final value = _controller.value;
            return Transform.translate(
              offset: Offset(
                0,
                availableHeight - minHeight - maxHeight * value,
              ),
              child: child,
            );
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onVerticalDragStart: (details) =>
                    _onDragStart(details, minHeight, maxHeight),
                onVerticalDragUpdate: (details) =>
                    _onDragUpdate(details, maxHeight),
                onVerticalDragEnd: (details) => _onDragEnd(details, maxHeight),
                dragStartBehavior: DragStartBehavior.start,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Material(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      color: widget.color,
                      elevation: 16,
                      child: widget.child,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
