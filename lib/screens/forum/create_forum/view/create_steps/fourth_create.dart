// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../bloc/create_forum_bloc.dart';

class FourthForumPage extends StatelessWidget {
  const FourthForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
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
        ),
        BlocBuilder<CreateForumBloc, CreateForumState>(
          builder: (context, state) {
            if (state.gallaryIsOpen) {
              return const _OpenGallary();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
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
          onTap: () =>
              context.read<CreateForumBloc>().add(const ForumOpenGallary()),
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

class _OpenGallary extends StatelessWidget {
  const _OpenGallary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: Theme.of(context).hintColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            border: Border.all(color: Theme.of(context).hintColor),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Галлерея',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SVG(
                      SVGs(context).close,
                      size: 44,
                      onPressed: () => context
                          .read<CreateForumBloc>()
                          .add(const ForumOpenGallary()),
                    )
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<CreateForumBloc, CreateForumState>(
                  buildWhen: (previous, current) =>
                      previous.photosFromGallary != current.photosFromGallary,
                  builder: (context, state) {
                    if (state.photosFromGallary == null) {
                      return const CircularProgressIndicator();
                    } else {
                      return GridView.builder(
                        controller: scrollController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: state.photosFromGallary!.length,
                        itemBuilder: (context, index) {
                          return _PhotoItem(
                            asset: state.photosFromGallary![index],
                            index: index,
                          );
                          // return Container(
                          //   width: (MediaQuery.of(context).size.width - 72) / 2,
                          //   height: (MediaQuery.of(context).size.width - 72) / 2,
                          //   padding: getPadding(index),
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.circular(8),
                          //     child: Image.network(
                          //       'https://funart.pro/uploads/posts/2021-03/1617070032_58-p-oboi-izobrazhenie-prirodi-59.jpg',
                          //       fit: BoxFit.fitHeight,
                          //     ),
                          //   ),
                          // );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PhotoItem extends StatelessWidget {
  final AssetEntity asset;
  final int index;
  const _PhotoItem({Key? key, required this.asset, required this.index})
      : super(key: key);

  EdgeInsetsGeometry getPadding(int index) {
    return index % 3 == 0
        ? const EdgeInsets.only(
            right: 6,
            bottom: 12,
          )
        : index % 3 == 1
            ? const EdgeInsets.only(
                left: 6,
                right: 6,
                bottom: 12,
              )
            : const EdgeInsets.only(
                left: 6,
                bottom: 12,
              );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: asset.thumbnailData as Future<Uint8List>,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        // If we have no data, display a spinner
        if (bytes == null) {
          return Container(
            width: (MediaQuery.of(context).size.width - 72) / 2,
            height: (MediaQuery.of(context).size.width - 72) / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            padding: getPadding(index),
          );
        } else {
          return Container(
            width: (MediaQuery.of(context).size.width - 72) / 2,
            height: (MediaQuery.of(context).size.width - 72) / 2,
            padding: getPadding(index),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.memory(bytes, fit: BoxFit.cover),
            ),
          );
        }
      },
    );
  }
}
