import 'package:flutter/material.dart';
import 'package:fluxa/ui.dart';

class ResizablePanel extends StatefulWidget {
  const ResizablePanel({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<ResizablePanel> createState() => _ResizablePanelState();
}

class _ResizablePanelState extends State<ResizablePanel> {
  double minWidth = 200.0;
  double maxWidth = 400.0;
  double width = 200.0;
  double borderWidth = 1.0;
  double draggableAreaWidth = 4.0;
  bool isHovering = false;

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      final newWidth = width + details.delta.dx;
      if (newWidth >= minWidth && newWidth <= maxWidth) {
        width = newWidth;
      }
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    setState(() {
      isHovering = false;
    });
  }

  void _onDoubleTap() {
    setState(() {
      if (width == maxWidth) {
        width = minWidth;
      } else {
        width = maxWidth;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: double.infinity,
      child: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                  width: maxWidth, // Max width for horizontal scrolling
                  child: widget.child,
              ),
            ),
          ),

          // Right edge for horizontal resizing with hover effect
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: MouseRegion(
              cursor: isHovering
                  ? SystemMouseCursors.resizeColumn
                  : SystemMouseCursors.basic,
              onEnter: (_) {
                setState(() {
                  isHovering = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isHovering = false;
                });
              },
              child: GestureDetector(
                onHorizontalDragUpdate: _onHorizontalDragUpdate,
                onHorizontalDragEnd: _onHorizontalDragEnd,
                onDoubleTap: _onDoubleTap,
                // Draggable area (not all visible to the user)
                child: Container(
                  width: draggableAreaWidth,
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.centerRight,
                    // Visible draggable area
                    child: Container(
                      width: borderWidth,
                      color: isHovering ? AppColors.primary : AppColors.border,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
