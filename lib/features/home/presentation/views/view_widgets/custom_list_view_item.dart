
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*.3,
      child: AspectRatio(
        aspectRatio: 2.7/4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.yellow,
            image:const DecorationImage(
              fit: BoxFit.fill,
              image:AssetImage( AssetsBookData.test)),
          ),
        ),
      ),
    );
  }
}