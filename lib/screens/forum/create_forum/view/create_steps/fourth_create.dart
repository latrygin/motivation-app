// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class FourthForumPage extends StatelessWidget {
  const FourthForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 64.0,
        left: 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Добавление фото',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Добавьте фото, если это необходимо',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 40,
          ),
          const SizedBox(height: 120, child: _InputPhoto()),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 8.0),
              child: Text(
                '0/5',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InputPhoto extends StatelessWidget {
  const _InputPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {},
          // onTap: () =>
          //     context.read<CreateForumBloc>().add(const ForumOpenGallary()),
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).hintColor,
                width: 2,
              ),
            ),
            child: Icon(
              Icons.photo_camera,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 12,
        );
      },
    );
  }
}
