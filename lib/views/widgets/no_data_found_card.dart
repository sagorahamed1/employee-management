import 'package:flutter/cupertino.dart';

import '../../global/custom_assets/assets.gen.dart';

class NoDataFoundCard extends StatelessWidget {
  const NoDataFoundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Assets.images.nodataImage.image(),
    );
  }
}
