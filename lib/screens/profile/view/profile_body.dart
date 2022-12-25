import 'package:flutter/material.dart';
import 'package:motivation/screens/profile/view/profile_posts.dart';

import 'profile_info.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        ProfileInfo(),
        ProfilePost(),
      ],
    );
  }
}
