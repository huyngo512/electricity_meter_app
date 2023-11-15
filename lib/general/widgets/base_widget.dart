import 'package:flutter/material.dart';

import '../../constants/app_resources.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.img_background_login),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: child,
          ),
        ),
      ),
    );
  }
}
