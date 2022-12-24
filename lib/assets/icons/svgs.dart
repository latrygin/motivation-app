// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGs {
  BuildContext context;
  SVGs(
    this.context,
  );

  /// <img src="../../../assets/icons/icons_dark_theme/Menu.svg" height=100 width=100>
  SvgPicture get menu => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Menu.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Menu.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Document.svg" height=100 width=100>
  SvgPicture get document => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Document.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Document.svg');

  /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/google-svgrepo-com.svg" alt="arrow_bottom_2.svg" height=100 width=100> custom icon "Google".
  static SvgPicture google =
      SvgPicture.asset('assets/icons/icons_dark_theme/google-svgrepo-com.svg');

  /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/facebook-svgrepo-com.svg" alt="arrow_bottom_2.svg" height=100 width=100> custom icon "FaceBook".
  static SvgPicture facebook = SvgPicture.asset(
    'assets/icons/icons_dark_theme/facebook-svgrepo-com.svg',
  );

  /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/vk-v2-svgrepo-com.svg" alt="arrow_bottom_2.svg" height=100 width=100> custom icon "VK".
  static SvgPicture vk =
      SvgPicture.asset('assets/icons/icons_dark_theme/vk-v2-svgrepo-com.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Sun.svg" height=100 width=100>
  SvgPicture get theme => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Sun.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Moon.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Eye.svg" height=100 width=100>
  SvgPicture get eye => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Eye.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Eye.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Eye - Slash.svg" height=100 width=100>
  SvgPicture get eye_slash => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Eye - Slash.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Eye - Slash.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Arrow - Left.svg" height=100 width=100>
  SvgPicture get chevrone_left =>
      Theme.of(context).brightness == Brightness.dark
          ? SvgPicture.asset('assets/icons/icons_dark_theme/Arrow - Left.svg')
          : SvgPicture.asset('assets/icons/icons_light_theme/Arrow - Left.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Message - 4.svg" height=100 width=100>
  SvgPicture get message => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Message - 4.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Message - 4.svg');

  /// <img src="../../../assets/icons/unactive_icons_light_theme/Message - 4.svg" height=100 width=100>
  SvgPicture get unactive_message =>
      Theme.of(context).brightness == Brightness.dark
          ? SvgPicture.asset(
              'assets/icons/unactive_icons_dark_theme/Message - 4.svg',
            )
          : SvgPicture.asset(
              'assets/icons/unactive_icons_light_theme/Message - 4.svg',
            );

  /// <img src="../../../assets/icons/icons_dark_theme/Status.svg" height=100 width=100>
  SvgPicture get statistic => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Status.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Status.svg');

  /// <img src="../../../assets/icons/unactive_icons_dark_theme/Status.svg" alt="123" height=100 width=100>
  SvgPicture get unactive_statistic => Theme.of(context).brightness ==
          Brightness.dark
      ? SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Status.svg')
      : SvgPicture.asset('assets/icons/unactive_icons_light_theme/Status.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/User.svg" height=100 width=100>
  SvgPicture get user => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/User.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/User.svg');

  /// <img src="../../../assets/icons/unactive_icons_dark_theme/User.svg" height=100 width=100>
  SvgPicture get unactive_user => Theme.of(context).brightness ==
          Brightness.dark
      ? SvgPicture.asset('assets/icons/unactive_icons_dark_theme/User.svg')
      : SvgPicture.asset('assets/icons/unactive_icons_light_theme/User.svg');

  /// <img src="../../../assets/icons/unactive_icons_dark_theme/Document.svg" height=100 width=100>
  SvgPicture get unactive_document => Theme.of(context).brightness ==
          Brightness.dark
      ? SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Document.svg')
      : SvgPicture.asset(
          'assets/icons/unactive_icons_light_theme/Document.svg',
        );

  /// <img src="../../../assets/icons/icons_dark_theme/Edit.svg" height=100 width=100>
  SvgPicture get edit => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Edit.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Edit.svg');

  /// <img src="../../../assets/icons/unactive_icons_dark_theme/Edit.svg" height=100 width=100>
  SvgPicture get unactive_edit => Theme.of(context).brightness ==
          Brightness.dark
      ? SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Edit.svg')
      : SvgPicture.asset('assets/icons/unactive_icons_light_theme/Edit.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/More - Circle.svg" height=100 width=100>
  SvgPicture get settings => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/More - Circle.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/More - Circle.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Filter.svg" height=100 width=100>
  SvgPicture get filter => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Filter.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Filter.svg');

  /// <img src="../../../assets/icons/unactive_icons_dark_theme/More - Circle.svg" height=100 width=100>
  SvgPicture get unactive_more =>
      Theme.of(context).brightness == Brightness.dark
          ? SvgPicture.asset(
              'assets/icons/unactive_icons_dark_theme/More - Circle.svg',
            )
          : SvgPicture.asset(
              'assets/icons/unactive_icons_light_theme/More - Circle.svg',
            );

  /// <img src="../../../assets/icons/icons_dark_theme/Saved.svg" height=100 width=100>
  SvgPicture get saved => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Saved.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Saved.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Close.svg" height=100 width=100>
  SvgPicture get close => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Close.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Close.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Send.svg" height=100 width=100>
  SvgPicture get send => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Send.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Send.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Trash.svg" height=100 width=100>
  SvgPicture get trash => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Trash.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Trash.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Volume - Cross.svg" height=100 width=100>
  SvgPicture get volume_cross => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Volume - Cross.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Volume - Cross.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Volume - High.svg" height=100 width=100>
  SvgPicture get volume_high => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Volume - High.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Volume - High.svg');

  /// <img src="../../../assets/icons/unactive_icons_dark_theme/Saved.svg" height=100 width=100>
  SvgPicture get unactive_bookmark => Theme.of(context).brightness ==
          Brightness.dark
      ? SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Saved.svg')
      : SvgPicture.asset('assets/icons/unactive_icons_light_theme/Saved.svg');

  /// <img src="../../../assets/icons/unactive_icons_dark_theme/More.svg" height=100 width=100>
  SvgPicture get more => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/unactive_icons_dark_theme/More.svg')
      : SvgPicture.asset('assets/icons/unactive_icons_light_theme/More.svg');

  /// <img src="../../../assets/icons/unactive_icons_dark_theme/Filter.svg" height=100 width=100>
  SvgPicture get unactive_filter => Theme.of(context).brightness ==
          Brightness.dark
      ? SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Filter.svg')
      : SvgPicture.asset('assets/icons/unactive_icons_light_theme/Filter.svg');

  /// <img src="../../../assets/icons/unactive_icons_dark_theme/Edit1.svg" height=100 width=100>
  SvgPicture get unactive_edit1 => Theme.of(context).brightness ==
          Brightness.dark
      ? SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Edit1.svg')
      : SvgPicture.asset('assets/icons/unactive_icons_light_theme/Edit1.svg');

  /// <img src="../../../assets/icons/unactive_icons_dark_theme/Arrow-Top.svg" height=100 width=100>
  SvgPicture get chevron_up => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Arrow-Top.svg')
      : SvgPicture.asset(
          'assets/icons/unactive_icons_light_theme/Arrow-Top.svg',
        );

  /// <img src="../../../assets/icons/unactive_icons_dark_theme/Arrow-Bottom.svg" height=100 width=100>
  SvgPicture get chevron_down => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset(
          'assets/icons/unactive_icons_dark_theme/Arrow-Bottom.svg',
        )
      : SvgPicture.asset(
          'assets/icons/unactive_icons_light_theme/Arrow-Bottom.svg',
        );

  /// <img src="../../../assets/icons/icons_dark_theme/Export.svg" height=100 width=100>
  SvgPicture get exit => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Export.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Export.svg');

  /// <img src="../../../assets/icons/unactive_icons_dark_theme/Eye.svg" height=100 width=100>
  SvgPicture get unactive_eye => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Eye.svg')
      : SvgPicture.asset('assets/icons/unactive_icons_light_theme/Eye.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Loading.svg" height=100 width=100>
  SvgPicture get loading => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Loading.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Loading.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Arrow - Left-1.svg" height=100 width=100>
  SvgPicture get chevron_left => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Arrow - Left-1.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Arrow - Left-1.svg');

  /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/twitter-svgrepo-com.svg" alt="arrow_bottom_2.svg" height=100 width=100> custom icon "Twitter".
  SvgPicture get twitter =>
      SvgPicture.asset('assets/icons/icons_dark_theme/twitter-svgrepo-com.svg');
}
