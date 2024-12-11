import 'package:flutter/material.dart';
import 'package:portfolio/responsive/desktop_body.dart';
import 'package:portfolio/responsive/mobile_body.dart';
import 'package:portfolio/responsive/responsive_layout.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBody(),
        desktopBody: DesktopBody()
      ),
    );
  }
}