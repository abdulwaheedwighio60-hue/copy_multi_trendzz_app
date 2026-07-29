import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatefulWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,

    // Loading
    this.isLoading = false,
    this.useInternalLoading = true,
    this.loadingWidget,
    this.loaderSize = 22,
    this.loaderStrokeWidth = 2.4,
    this.loaderColor,

    // Button child
    this.child,
    this.icon,
    this.iconSpacing = 8,
    this.textStyle,
    this.contentAlignment = MainAxisAlignment.center,

    // Size
    this.width,
    this.height = 50,
    this.expand = false,
    this.padding,
    this.minimumSize,
    this.maximumSize,
    this.fixedSize,

    // Style
    this.backgroundColor,
    this.foregroundColor,
    this.disabledBackgroundColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.disabledElevation,
    this.borderRadius = 12,
    this.shape,
    this.side,
    this.alignment,
    this.visualDensity,
    this.tapTargetSize,
    this.animationDuration,
    this.enableFeedback,
    this.splashFactory,
    this.style,

    // ElevatedButton properties
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.statesController,

    // Condition
    this.enabled = true,
  });

  final String text;
  final Future<void> Function()? onPressed;

  final bool isLoading;
  final bool useInternalLoading;
  final Widget? loadingWidget;
  final double loaderSize;
  final double loaderStrokeWidth;
  final Color? loaderColor;

  final Widget? child;
  final Widget? icon;
  final double iconSpacing;
  final TextStyle? textStyle;
  final MainAxisAlignment contentAlignment;

  final double? width;
  final double? height;
  final bool expand;
  final EdgeInsetsGeometry? padding;
  final Size? minimumSize;
  final Size? maximumSize;
  final Size? fixedSize;

  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final double? disabledElevation;
  final double borderRadius;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final AlignmentGeometry? alignment;
  final VisualDensity? visualDensity;
  final MaterialTapTargetSize? tapTargetSize;
  final Duration? animationDuration;
  final bool? enableFeedback;
  final InteractiveInkFeatureFactory? splashFactory;
  final ButtonStyle? style;

  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final MaterialStatesController? statesController;

  final bool enabled;

  @override
  State<ElevatedButtonWidget> createState() => _ElevatedButtonWidgetState();
}

class _ElevatedButtonWidgetState extends State<ElevatedButtonWidget> {
  bool _internalLoading = false;

  bool get _isLoading => widget.isLoading || _internalLoading;

  Future<void> _handlePress() async {
    if (_isLoading || !widget.enabled || widget.onPressed == null) return;

    if (widget.useInternalLoading) {
      setState(() => _internalLoading = true);
    }

    try {
      await widget.onPressed?.call();
    } finally {
      if (mounted && widget.useInternalLoading) {
        setState(() => _internalLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isButtonEnabled =
        widget.enabled && !_isLoading && widget.onPressed != null;

    final ButtonStyle defaultStyle = ElevatedButton.styleFrom(
      backgroundColor: widget.backgroundColor,
      foregroundColor: widget.foregroundColor,
      disabledBackgroundColor: widget.disabledBackgroundColor,
      shadowColor: widget.shadowColor,
      surfaceTintColor: widget.surfaceTintColor,
      elevation: widget.elevation,

      padding: widget.padding,
      minimumSize: widget.minimumSize,
      maximumSize: widget.maximumSize,
      fixedSize: widget.fixedSize,
      alignment: widget.alignment,
      visualDensity: widget.visualDensity,
      tapTargetSize: widget.tapTargetSize,
      animationDuration: widget.animationDuration,
      enableFeedback: widget.enableFeedback,
      splashFactory: widget.splashFactory,
      shape: widget.shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            side: widget.side ?? BorderSide.none,
          ),
      textStyle: widget.textStyle,
    );

    final Widget button = ElevatedButton(
      onPressed: isButtonEnabled ? _handlePress : null,
      onLongPress: _isLoading ? null : widget.onLongPress,
      onHover: widget.onHover,
      onFocusChange: widget.onFocusChange,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior,
      statesController: widget.statesController,
      style: defaultStyle.merge(widget.style),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 180),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        child: _isLoading
            ? _buildLoader()
            : _buildButtonContent(),
      ),
    );

    return SizedBox(
      width: widget.expand ? double.infinity : widget.width,
      height: widget.height,
      child: button,
    );
  }

  Widget _buildLoader() {
    if (widget.loadingWidget != null) {
      return KeyedSubtree(
        key: const ValueKey('custom-loader'),
        child: widget.loadingWidget!,
      );
    }

    return SizedBox(
      key: const ValueKey('loader'),
      width: widget.loaderSize,
      height: widget.loaderSize,
      child: CircularProgressIndicator(
        strokeWidth: widget.loaderStrokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(
          widget.loaderColor ??
              widget.foregroundColor ??
              Colors.white,
        ),
      ),
    );
  }

  Widget _buildButtonContent() {
    if (widget.child != null) {
      return KeyedSubtree(
        key: const ValueKey('custom-child'),
        child: widget.child!,
      );
    }

    return Row(
      key: const ValueKey('button-content'),
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: widget.contentAlignment,
      children: [
        if (widget.icon != null) ...[
          widget.icon!,
          SizedBox(width: widget.iconSpacing),
        ],
        Flexible(
          child: Text(
            widget.text,
            overflow: TextOverflow.ellipsis,
            style: widget.textStyle,
          ),
        ),
      ],
    );
  }
}