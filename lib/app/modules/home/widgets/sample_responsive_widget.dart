import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class SampleResponsiveWidget extends StatelessWidget {
  const SampleResponsiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return LayoutBuilderWidget();
    // return MediaQueryWidget();
    return GetXFirstWay();
    // return GetXSecondWay();
    // return GetXThirdWay();
  }
}

class LayoutBuilderWidget extends StatelessWidget {
  const LayoutBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 400) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text('below 400'),
          );
        }
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text('above 400'),
        );
      },
    );
  }
}

class MediaQueryWidget extends StatelessWidget {
  const MediaQueryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
      alignment: Alignment.center,
      // child: Text(MediaQuery.of(context).size.width.toString()),
      child: const AutoSizeText(
        'The text to display asdasd asdasd asdasdas asda sdsadThe text to display asdasd asdasdThe text to display asdasd asdasd asdasdas asda sdsad The text to display asdasd asdasd asdasdas asda sdsadasdasdas asda sdsad asd as dsasdasdas sadasdas ',
        style: TextStyle(fontSize: 20),
        maxLines: 2,
        minFontSize: 15,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class GetXFirstWay extends GetResponsiveView<HomeController> {
  GetXFirstWay({super.key});

  @override
  Widget? builder() {
    if (screen.isPhone) {
      return const Icon(
        Icons.phone,
        color: Colors.red,
      );
    }

    if (screen.isDesktop) {
      return const Icon(
        Icons.desktop_windows,
        color: Colors.red,
      );
    }
    if (screen.isTablet) {
      return const Icon(
        Icons.tablet,
        color: Colors.red,
      );
    }
    if (screen.isWatch) {
      return const Icon(
        Icons.watch,
        color: Colors.red,
      );
    }

    return const Icon(
      Icons.phone,
    );
  }
}

class GetXSecondWay extends GetResponsiveView<HomeController> {
  // GetXSecondWay({super.key});
  GetXSecondWay({super.key}) : super(alwaysUseBuilder: false);

  @override
  Widget? phone() {
    return const Icon(
      Icons.phone,
      color: Colors.yellow,
    );
  }

  @override
  Widget? desktop() {
    return const Icon(
      Icons.desktop_mac,
      color: Colors.yellow,
    );
  }

  @override
  Widget? tablet() {
    return const Icon(
      Icons.tablet,
      color: Colors.yellow,
    );
  }

  @override
  Widget? watch() {
    return const Icon(
      Icons.watch,
      color: Colors.yellow,
    );
  }
}

class GetXThirdWay extends GetResponsiveView<HomeController> {
  GetXThirdWay({super.key})
      : super(
          settings: const ResponsiveScreenSettings(
            desktopChangePoint: 800,
            tabletChangePoint: 700,
            watchChangePoint: 600,
          ),
        );

  @override
  Widget? builder() {
    return Text(screen.screenType.name);
  }
}
