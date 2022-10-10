import 'package:flutter/material.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:motivation/screens/statistic_page/statistic_page_view_model.dart';
import 'package:motivation/widgets/change_theme_button.dart';
import 'package:provider/provider.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => StatisticPageViewModel(),
        child: const _StatisticBodyWidget(),
      );
}

class _StatisticBodyWidget extends StatelessWidget {
  const _StatisticBodyWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final model = context.watch<StatisticPageViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _HeaderForStatisticWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const _SearchWidget(),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: _CardItemWidget(
                                color: Theme.of(context).hoverColor,
                                colorsTitle: Theme.of(context).hintColor,
                                title: 'Ваше сообщение ждут',
                                icon: SVG(
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? SVGs.unactive_document_dark
                                      : SVGs.unactive_document_light,
                                  size: 36,
                                ))),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: _CardItemWidget(
                                color: Theme.of(context).hintColor,
                                title: 'Ваше сообщение ждут',
                                colorsTitle: Theme.of(context).hoverColor,
                                icon: SVG(
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? SVGs.unactive_document_light
                                      : SVGs.unactive_document_dark,
                                  size: 36,
                                )))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: _CardItemWidget(
                                color: Theme.of(context).hintColor,
                                title: 'Ваше сообщение ждут',
                                colorsTitle: Theme.of(context).hoverColor,
                                icon: SVG(
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? SVGs.unactive_document_light
                                      : SVGs.unactive_document_dark,
                                  size: 36,
                                ))),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: _CardItemWidget(
                                color: Theme.of(context).primaryColor,
                                colorsTitle: Theme.of(context).hintColor,
                                title: 'Ваше сообщение ждут',
                                icon: SVG(
                                  SVGs.unactive_document_light,
                                  size: 36,
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HeaderForStatisticWidget extends StatelessWidget {
  const _HeaderForStatisticWidget({Key? key}) : super(key: key);

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
                            borderRadius: BorderRadius.circular(16)),
                        child: SVG(
                          Theme.of(context).brightness == Brightness.dark
                              ? SVGs.unactive_user_light
                              : SVGs.unactive_user_dark,
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
                              'Latrygin Arseniy',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              'alatrygin@yandex.ru',
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

class _SearchWidget extends StatelessWidget {
  const _SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).hintColor,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SizedBox(
            width: 8,
          ),
          Text('Поиск по приложению'),
          Icon(
            Icons.search,
            size: 18,
          )
        ],
      ),
    );
  }
}

class _CardItemWidget extends StatelessWidget {
  final Color colorsTitle;
  final Color color;
  final Widget icon;
  final String title;
  const _CardItemWidget(
      {Key? key,
      required this.color,
      required this.icon,
      required this.title,
      required this.colorsTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: icon,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(height: 1, color: colorsTitle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
