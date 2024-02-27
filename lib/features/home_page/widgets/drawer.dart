import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/const/const.dart';

class InkWellWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  const InkWellWidget({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon,color: fillRectangular,),
            const SizedBox(width: 16.0),
            Text(text),
          const  Spacer(),
          const  Icon(Icons.arrow_forward_ios_outlined,color: fillRectangular,),
          ],
        ),
      ),
    );
  }
}