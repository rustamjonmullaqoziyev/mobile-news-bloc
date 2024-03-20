import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  const CommonTextButton({
    super.key,
    required this.child,
    required this.callback,
    this.enable = true,
  });

  final Widget child;
  final VoidCallback callback;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enable ? callback : null,
      child: child,
    );
  }
}
