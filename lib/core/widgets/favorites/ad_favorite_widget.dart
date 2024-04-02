import 'package:flutter/material.dart';

import '../../gen/assets/assets.gen.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({
    super.key,
    required this.isSelected,
    required this.invoke,
    this.isChangeAvailable = true,
  });

  final bool isSelected;
  final VoidCallback invoke;
  final bool isChangeAvailable;

  @override
  State<StatefulWidget> createState() => _AdFavoriteWidget();
}

class _AdFavoriteWidget extends State<FavoriteWidget> {
  bool _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.invoke();
        if (widget.isChangeAvailable) {
          setState(() {
            _isSelected = !_isSelected;
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: _isSelected
            ? Assets.images.icFavoriteActive
                .svg(width: 24, height: 24, color: Colors.red)
            : Assets.images.icFavorite
                .svg(width: 24, height: 24, color: Colors.red),
      ),
    );
  }
}
