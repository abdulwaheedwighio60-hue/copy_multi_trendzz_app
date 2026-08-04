import 'package:flutter/material.dart';

class TableActionButton extends StatefulWidget {

  final IconData icon;
  final Color color;
  final String tooltip;
  final VoidCallback onTap;

  const TableActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.tooltip,
    required this.onTap,
  });

  @override
  State<TableActionButton> createState() =>
      _TableActionButtonState();
}

class _TableActionButtonState
    extends State<TableActionButton> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width >= 1100;

    final double iconSize = isDesktop ? 18 : 16;

    final double buttonSize = isDesktop ? 38 : 34;

    return MouseRegion(

      cursor: SystemMouseCursors.click,

      onEnter: (_) {
        setState(() {
          isHover = true;
        });
      },

      onExit: (_) {
        setState(() {
          isHover = false;
        });
      },

      child: Tooltip(

        message: widget.tooltip,

        child: InkWell(

          borderRadius: BorderRadius.circular(10),

          onTap: widget.onTap,

          child: AnimatedContainer(

            duration: const Duration(milliseconds: 180),

            width: buttonSize,

            height: buttonSize,

            decoration: BoxDecoration(

              color: isHover
                  ? widget.color.withOpacity(.18)
                  : widget.color.withOpacity(.10),

              borderRadius: BorderRadius.circular(10),

            ),

            child: Icon(

              widget.icon,

              size: iconSize,

              color: widget.color,

            ),

          ),

        ),

      ),

    );
  }
}