import 'package:flutter/material.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:motivation/widgets/change_theme_button.dart';

class HeaderStatistic extends StatelessWidget {
  const HeaderStatistic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: 92,
          decoration: BoxDecoration(
            color: Theme.of(context).hintColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 54,
                        width: 54,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: SVG(
                          SVGs(context).unactive_user,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                        height: 54,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Латрыгин Арсений',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              'latrygin@yandex.ru',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const ChangingThemeButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
