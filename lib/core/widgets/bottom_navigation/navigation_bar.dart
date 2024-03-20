import 'package:flutter/cupertino.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key, required this.image});

  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: image,
    );
  }
}
