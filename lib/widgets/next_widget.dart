import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class NextCard extends StatelessWidget {
  const NextCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Styles.ctaMoreColor,
      ),
      child: Icon(Icons.chevron_right_rounded, color: Styles.ctaIconColor, size: 30,),
    );
  }
}

class OpenSheet extends StatelessWidget {
  const OpenSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Styles.ctaMoreColor,
      ),
      child: Icon(Icons.north_east, color: Styles.ctaIconColor, size: 30,),
    );
  }
}


class BackWidget extends StatelessWidget {
  final double? size;
  final Color? iconColor;
  const BackWidget({Key? key, this.size = 40, required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size!+10,
      width: size!+10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
      ),
      child: Icon(Icons.chevron_left_rounded, color: iconColor, size: size,),
    );
  }
}

