

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/constant/end_points/end_point.dart';
import 'package:lottie/lottie.dart';
import '../core/constant/components/components.dart';
import '../core/constant/const/const.dart';
import 'auth/login/presentation/login.dart';
import 'home_page/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
   navigateFinish(context,
   const HomePage() );

    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Set the duration of the animation
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Create a tween for the translation
    _animation = Tween<double>(
      begin: MediaQuery.of(context).size.height,
      end: MediaQuery.of(context).size.height * 0.016,
    ).animate(_animationController);

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.2),
        body: Column(

          children: [
            SizedBox(height: 150.h,),
            Center(

              child: Image.asset('assets/images/final-aanimi-logo.gif',
                height: 200.h,
                width: 230.h,
              ),
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset( 0.0,_animation.value),
                  child: Center(
                    child: Lottie.asset('assets/animation/Buy Online.json'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}