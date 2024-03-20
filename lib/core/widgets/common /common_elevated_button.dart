import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton(
      {super.key,
      required this.child,
      required this.callback,
      required this.onLoading});

  final Widget child;
  final VoidCallback callback;
  final bool onLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:!onLoading? callback:null,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25), // <-- Radius
        ),
        backgroundColor: const Color(0xFFDB3022),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(child: child),
        const SizedBox(width: 8),
        if (onLoading)
          const SizedBox(
            height: 16,
            width: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
          )
      ]),
    );
  }
}
