import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskmanagement/ui/utils/assets_utils.dart';

class ScreenBackground extends StatelessWidget {
  final Widget child;

  const ScreenBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SvgPicture.asset(
            assetsUtils.backgroundSvg,
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: child,
        ))
      ],
    );
  }
}
