import 'package:flutter/material.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:provider/provider.dart';

import 'profile_page_view_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ProfilePageViewModel(context: context),
        child: const _ProfileBodyWidget(),
      );
}

class _ProfileBodyWidget extends StatelessWidget {
  const _ProfileBodyWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final model = context.watch<ProfilePageViewModel>();
    return Column(
      children: const [_HeaderForStatisticWidget(), _SettingsColumnWidget()],
    );
  }
}

class _HeaderForStatisticWidget extends StatelessWidget {
  const _HeaderForStatisticWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProfilePageViewModel>();
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
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).hintColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SVG(
                    SVGs(context).exit,
                    size: 32,
                    onPressed: model.logOutUserAndExitProfile,
                  ),
                  Container(
                    height: 80,
                    width: 80,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SVG(
                      SVGs(context).unactive_user,
                    ),
                  ),
                  SVG(
                    SVGs(context).settings,
                    size: 32,
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Latrygin Arseniy',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsColumnWidget extends StatelessWidget {
  const _SettingsColumnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          ListTile(
            title: const Text('Настройка темы'),
            trailing: Switch(
              value: true,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (value) {},
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text('Настройка темы'),
          ),
          const Divider(),
          const ListTile(
            title: Text('Настройка темы'),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
