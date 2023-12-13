import 'dart:async';

import 'package:electricity_meter_app/constants/app_resources.dart';
import 'package:electricity_meter_app/core/blocs/auth/auth_bloc.dart';
import 'package:electricity_meter_app/general/utils/navigate_util.dart';
import 'package:electricity_meter_app/general/utils/utils.dart';
import 'package:electricity_meter_app/general/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AuthBloc authBloc;
  late StreamSubscription authStream;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    authBloc = context.read<AuthBloc>()..add(AppStarted());

    /// For [animation]
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    authStream = authBloc.stream.listen((state) {
      Future.delayed(const Duration(seconds: 2)).then((_) {
        NavigateUtil().navigateToView(context, state.status.firstView);
      });
    });
  }

  @override
  void dispose() {
    authStream.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: RotationTransition(
        turns: _animation,
        child: Center(
          child: Image.asset(
            AppImages.img_mascot_ball,
            height: context.dynamicHeight(0.2),
            width: context.dynamicWidth(0.9),
          ),
        ),
      ),
    );
  }
}
