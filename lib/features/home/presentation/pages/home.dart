import 'package:finner/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../styles/theme_utils.dart';

class HomeViewPage extends HookWidget {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPage = useState(0);
    return Scaffold(
      backgroundColor: $styles.colors.offWhite,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Container(
        height: $styles.insets.big,
        color: $styles.colors.greyBackground,
        padding: EdgeInsets.only(bottom: $styles.insets.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
            (index) {
              return GestureDetector(
                onTap: () {
                  pageController.animateToPage(
                    index,
                    curve: Curves.easeInOutCirc,
                    duration: $styles.times.fast,
                  );
                  currentPage.value = index;
                },
                child: Icon(
                  Icons.home,
                  size: $styles.insets.lg,
                  color: currentPage.value == index
                      ? $styles.colors.accent1
                      : $styles.colors.greyMedium,
                ),
              );
            },
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        children: [
          const HomePage(),
          ...List.generate(3, (index) => Center(child: Text(index.toString()))),
        ],
      ),
    );
  }
}
