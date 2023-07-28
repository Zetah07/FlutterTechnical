import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Magna do proident do eiusmod est occaecat.',
      'assets/images/1.png'),
  SlideInfo('Entrega la comida', 'Et labore cupidatat aliquip labore.',
      'assets/images/2.png'),
  SlideInfo(
      'Busca la comida',
      'Ipsum amet esse velit reprehenderit occaecat aliqua officia',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController _pageViewController = PageController();
  bool _isLastPage = false;

  @override

  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      if (_pageViewController.page == slides.length - 1) {
        setState(() {
          _isLastPage = true;
        });
      } else {
        setState(() {
          _isLastPage = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl,
                    ))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 40,
            child: TextButton(
              child: const Text('Skip'),
              onPressed: () => context.pop(),
            ),
          ),

          _isLastPage ? Positioned(
            bottom: 20,
            right: 20,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                child: const Text('Comenzar'),
                onPressed: () => context.pop(),
                ),
            ),
            ) : const SizedBox(),

        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(height: 10),
          Text(title, style: titleStyle),
          const SizedBox(height: 10),
          Text(caption, style: captionStyle),
        ],
      )),
    );
  }
}
