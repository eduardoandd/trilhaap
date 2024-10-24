// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trilhaap/shared/app_images.dart';

class ImageAssetsPage extends StatefulWidget {
  const ImageAssetsPage({Key? key}) : super(key: key);

  @override
  State<ImageAssetsPage> createState() => _ImageAssetsPage();
}

class _ImageAssetsPage extends State<ImageAssetsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Image.asset(
            AppImages.user1
          )
      ],
    );
  }
}