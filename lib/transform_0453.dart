import 'dart:math';

import 'package:flutter/material.dart';

class TransformPageView extends StatefulWidget {
  const TransformPageView({Key? key}) : super(key: key);

  @override
  State<TransformPageView> createState() => _TransformPageViewState();
}

class _TransformPageViewState extends State<TransformPageView> {
  final _control = PageController(viewportFraction: 0.6);

  double _currentPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _control.page!;
    });
  }

  @override
  void initState() {
    super.initState();
    _control.addListener(_listener);
  }

  @override
  void dispose() {
    _control.removeListener(_listener);
    _control.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    List<String> images = [
      "https://th.bing.com/th/id/R.6b588a5633720931512f7b4b1f78306e?rik=O2PapJN0fk%2b3Ag&pid=ImgRaw&r=0",
      "https://cdn-images.farfetch-contents.com/17/32/09/01/17320901_35812668_480.jpg",
      "https://i.pinimg.com/736x/eb/d2/36/ebd2369a56eedbbe1bb44f04f241433c.jpg",
      "https://th.bing.com/th/id/OIP.TwrsFSYtCUTqDLvHBVy34QHaHa?w=1200&h=1200&rs=1&pid=ImgDetMain",
      "https://images.yepbrand.ru/202010/s-436633/amiri-hoodies-for-men-436633.jpg"
    ];
    return Center(
      child: SizedBox(
        height: 450.0,
        child: PageView.builder(
          controller: _control,
          itemCount: images.length,
          itemBuilder: (_, i) {
            if (i == _currentPage) {
              return Transform.scale(
                scale: 1.3,
                child: _pageImages(images[i]),
              );
            } else if (i < _currentPage) {
              return Transform.scale(
                scale: max(1.3 - (_currentPage - i), 0.8),
                child: _pageImages(images[i]),
              );
            } else {
              return Transform.scale(
                scale: max(1.3 - (i - _currentPage), 0.8),
                child: _pageImages(images[i]),
              );
            }
          },
        ),
      ),
    );
  }

  _pageImages(String images) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 18.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
          image: DecorationImage(
              image: NetworkImage(images), fit: BoxFit.fitHeight),
        ),
      ),
    );
  }
}
