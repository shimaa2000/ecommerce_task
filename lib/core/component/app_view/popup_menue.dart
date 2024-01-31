import 'package:flutter/material.dart';

import '../../managers/color_manager.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    Key? key,
    required this.items,
    required this.onSelected,
    this.isVert=false,
  }) : super(key: key);
  final List<PopupMenuItem> items;
  final Function(dynamic) onSelected;
  final bool isVert;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: onSelected,
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      itemBuilder: (context) => items,
      child: Icon(
       isVert?Icons.more_vert: Icons.more_horiz,
        color: ColorManager.darkColor.withOpacity(.8),
      ),
    );
  }
}
