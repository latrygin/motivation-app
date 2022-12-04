// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

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
      'assets/icons/icons_dark_theme/facebook-svgrepo-com.svg');

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
  SvgPicture get unactive_message => Theme.of(context).brightness ==
          Brightness.dark
      ? SvgPicture.asset(
          'assets/icons/unactive_icons_dark_theme/Message - 4.svg')
      : SvgPicture.asset(
          'assets/icons/unactive_icons_light_theme/Message - 4.svg');

  /// <img src="../../../assets/icons/icons_dark_theme/Status.svg" height=100 width=100>
  SvgPicture get statistic => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Status.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Status.svg');

  /// <img src="../../../assets/icons/unactive_icons_dark_theme/Status.svg" height=100 width=100>
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
          'assets/icons/unactive_icons_light_theme/Document.svg');

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
              'assets/icons/unactive_icons_dark_theme/More - Circle.svg')
          : SvgPicture.asset(
              'assets/icons/unactive_icons_light_theme/More - Circle.svg');

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
          'assets/icons/unactive_icons_light_theme/Arrow-Top.svg');

  /// <img src="../../../assets/icons/unactive_icons_dark_theme/Arrow-Bottom.svg" height=100 width=100>
  SvgPicture get chevron_down => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset(
          'assets/icons/unactive_icons_dark_theme/Arrow-Bottom.svg')
      : SvgPicture.asset(
          'assets/icons/unactive_icons_light_theme/Arrow-Bottom.svg');

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

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/google-svgrepo-com.svg" alt="arrow_bottom_2.svg" height=100 width=100> custom icon "Google".
  // static SvgPicture google =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/google-svgrepo-com.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/facebook-svgrepo-com.svg" alt="arrow_bottom_2.svg" height=100 width=100> custom icon "FaceBook".
  // static SvgPicture facebook = SvgPicture.asset(
  //     'assets/icons/icons_dark_theme/facebook-svgrepo-com.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/vk-v2-svgrepo-com.svg" alt="arrow_bottom_2.svg" height=100 width=100> custom icon "VK".
  // static SvgPicture vk =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/vk-v2-svgrepo-com.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Sun.svg" alt="Sun.svg" height=100 width=100> custom icon "Sun.svg".
  // static SvgPicture sun =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Sun.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Moon.svg" alt="Moon.svg" height=100 width=100> custom icon "Moon".
  // static SvgPicture moon =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Moon.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Eye.svg" alt="Eye.svg" height=100 width=100> custom icon "Eye".
  // static SvgPicture eye_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Eye.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Eye.svg" alt="Eye.svg" height=100 width=100> custom icon "Eye".
  // static SvgPicture eye_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Eye.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Eye - Slash.svg" alt="Eye.svg" height=100 width=100> custom icon "Eye".
  // static SvgPicture eye_slash_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Eye - Slash.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Eye - Slash.svg" alt="Eye.svg" height=100 width=100> custom icon "Eye".
  // static SvgPicture eye_slash_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Eye - Slash.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Arrow - Left.svg" alt="Arrow - Left.svg" height=100 width=100> custom icon "Arrow - Left.svg".
  // static SvgPicture chevrone_left_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Arrow - Left.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Arrow - Left.svg" alt="Arrow - Left.svg" height=100 width=100> custom icon "Arrow - Left.svg".
  // static SvgPicture chevrone_left_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Arrow - Left.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Message - 4.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Message - 4.svg".
  // static SvgPicture message_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Message - 4.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Message - 4.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Message - 4.svg".
  // static SvgPicture message_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Message - 4.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_dark_theme/Message - 4.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture unactive_message_light = SvgPicture.asset(
  //     'assets/icons/unactive_icons_dark_theme/Message - 4.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_light_theme/Message - 4.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture unactive_message_dark = SvgPicture.asset(
  //     'assets/icons/unactive_icons_light_theme/Message - 4.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Status.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture statistic_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Status.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Status.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture statistic_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Status.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_dark_theme/Status.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture unactive_statistic_light =
  //     SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Status.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_light_theme/Status.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture unactive_statistic_dark =
  //     SvgPicture.asset('assets/icons/unactive_icons_light_theme/Status.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/User.svg" alt="User.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture user_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/User.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/User.svg" alt="User.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture user_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/User.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_dark_theme/User.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture unactive_user_light =
  //     SvgPicture.asset('assets/icons/unactive_icons_dark_theme/User.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_light_theme/User.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture unactive_user_dark =
  //     SvgPicture.asset('assets/icons/unactive_icons_light_theme/User.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Document.svg" alt="Document.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture document_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Document.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Document.svg" alt="Document.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture document_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Document.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_dark_theme/Document.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture unactive_document_light =
  //     SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Document.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_light_theme/Document.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture unactive_document_dark =
  //     SvgPicture.asset('assets/icons/unactive_icons_light_theme/Document.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Edit.svg" alt="Edit.svg" height=100 width=100> custom icon "Edit.svg".
  // static SvgPicture edit_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Edit.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Edit.svg" alt="Edit.svg" height=100 width=100> custom icon "Edit.svg".
  // static SvgPicture edit_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Edit.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_dark_theme/Edit.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture unactive_edit_light =
  //     SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Edit.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_light_theme/Edit.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture unactive_edit_dark =
  //     SvgPicture.asset('assets/icons/unactive_icons_light_theme/Edit.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/More - Circle.svg" alt="Setting" height=100 width=100> custom icon "Setting".
  // static SvgPicture settings_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/More - Circle.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/More - Circle.svg" alt="Setting" height=100 width=100> custom icon "Setting".
  // static SvgPicture settings_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/More - Circle.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Filter.svg" alt="Filter" height=100 width=100> custom icon "Filter".
  // static SvgPicture filter_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Filter.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Filter.svg" alt="Filter" height=100 width=100> custom icon "Filter".
  // static SvgPicture filter_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Filter.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_dark_theme/More - Circle.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture unactive_more_light = SvgPicture.asset(
  //     'assets/icons/unactive_icons_dark_theme/More - Circle.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_light_theme/More - Circle.svg" alt="Message - 4.svg" height=100 width=100> custom icon "Status.svg".
  // static SvgPicture unactive_more_dark = SvgPicture.asset(
  //     'assets/icons/unactive_icons_light_theme/More - Circle.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Saved.svg" alt="Saved.svg" height=100 width=100> custom icon "Saved.svg".
  // static SvgPicture saved_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Saved.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Saved.svg" alt="Saved.svg" height=100 width=100> custom icon "Saved.svg".
  // static SvgPicture saved_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Saved.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Close.svg" alt="Close" height=100 width=100> custom icon "Close".
  // static SvgPicture close_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Close.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Close.svg" alt="Close" height=100 width=100> custom icon "Close".
  // static SvgPicture close_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Close.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Send.svg" alt="Send" height=100 width=100> custom icon "Send".
  // static SvgPicture send_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Send.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Send.svg" alt="Send" height=100 width=100> custom icon "Send".
  // static SvgPicture send_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Send.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Trash.svg" alt="Trash" height=100 width=100> custom icon "Trash".
  // static SvgPicture trash_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Trash.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Trash.svg" alt="Trash" height=100 width=100> custom icon "Trash".
  // static SvgPicture trash_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Trash.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Volume - Cross.svg" alt="Volume - Cross" height=100 width=100> custom icon "Volume - Cross".
  // static SvgPicture volume_cross_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Volume - Cross.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Volume - Cross.svg" alt="Volume - Cross" height=100 width=100> custom icon "Volume - Cross".
  // static SvgPicture volume_cross_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Volume - Cross.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Volume - High.svg" alt="Volume - High" height=100 width=100> custom icon "Volume - High".
  // static SvgPicture volume_high_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Volume - High.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Volume - High.svg" alt="Volume - High" height=100 width=100> custom icon "Volume - High".
  // static SvgPicture volume_high_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Volume - High.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_dark_theme/Saved.svg" alt="Saved" height=100 width=100> custom icon "Saved.svg".
  // static SvgPicture unactive_bookmark_light =
  //     SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Saved.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_light_theme/Saved.svg" alt="Saved" height=100 width=100> custom icon "Saved.svg".
  // static SvgPicture unactive_bookmark_dark =
  //     SvgPicture.asset('assets/icons/unactive_icons_light_theme/Saved.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_dark_theme/More.svg" alt="More" height=100 width=100> custom icon "More.svg".
  // static SvgPicture more_light =
  //     SvgPicture.asset('assets/icons/unactive_icons_dark_theme/More.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_light_theme/More.svg" alt="More" height=100 width=100> custom icon "More.svg".
  // static SvgPicture more_dark =
  //     SvgPicture.asset('assets/icons/unactive_icons_light_theme/More.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_dark_theme/Filter.svg" alt="Filter" height=100 width=100> custom icon "Filter.svg".
  // static SvgPicture unactive_filter_light =
  //     SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Filter.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_light_theme/Filter.svg" alt="Filter" height=100 width=100> custom icon "Filter.svg".
  // static SvgPicture unactive_filter_dark =
  //     SvgPicture.asset('assets/icons/unactive_icons_light_theme/Filter.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_dark_theme/Edit1.svg" alt="Edit1" height=100 width=100> custom icon "Edit1.svg".
  // static SvgPicture unactive_edit1_light =
  //     SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Edit1.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_light_theme/Edit1.svg" alt="Edit1" height=100 width=100> custom icon "Edit1.svg".
  // static SvgPicture unactive_edit1_dark =
  //     SvgPicture.asset('assets/icons/unactive_icons_light_theme/Edit1.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_dark_theme/Arrow-Top.svg" alt="Arrow-Top" height=100 width=100> custom icon "Arrow-Top.svg".
  // static SvgPicture chevron_up_light =
  //     SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Arrow-Top.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_light_theme/Arrow-Top.svg" alt="Arrow-Top" height=100 width=100> custom icon "Arrow-Top.svg".
  // static SvgPicture chevron_up_dark =
  //     SvgPicture.asset('assets/icons/unactive_icons_light_theme/Arrow-Top.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_dark_theme/Arrow-Bottom.svg" alt="Arrow-Bottom" height=100 width=100> custom icon "Arrow-Bottom.svg".
  // static SvgPicture chevron_down_light = SvgPicture.asset(
  //     'assets/icons/unactive_icons_dark_theme/Arrow-Bottom.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_light_theme/Arrow-Bottom.svg" alt="Arrow-Bottom" height=100 width=100> custom icon "Arrow-Bottom.svg".
  // static SvgPicture chevron_down_dark = SvgPicture.asset(
  //     'assets/icons/unactive_icons_light_theme/Arrow-Bottom.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Export.svg" alt="Export" height=100 width=100> custom icon "Export.svg".
  // static SvgPicture exit_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Export.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Export.svg" alt="Export" height=100 width=100> custom icon "Export.svg".
  // static SvgPicture exit_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Export.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_dark_theme/Eye.svg" alt="Eye.svg" height=100 width=100> custom icon "Eye.svg".
  // static SvgPicture unactive_eye_light =
  //     SvgPicture.asset('assets/icons/unactive_icons_dark_theme/Eye.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/unactive_icons_light_theme/Eye.svg" alt="Eye.svg" height=100 width=100> custom icon "Eye.svg".
  // static SvgPicture unactive_eye_dark =
  //     SvgPicture.asset('assets/icons/unactive_icons_light_theme/Eye.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Loading.svg" alt="Eye.svg" height=100 width=100> custom icon "Eye".
  // static SvgPicture loading_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Loading.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Loading.svg" alt="Eye.svg" height=100 width=100> custom icon "Eye".
  // static SvgPicture loading_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Loading.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Arrow - Left-1.svg" alt="Arrow - Left-1.svg" height=100 width=100> custom icon "Eye".
  // static SvgPicture chevron_left_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Arrow - Left-1.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Arrow - Left-1.svg" alt="Arrow - Left-1.svg" height=100 width=100> custom icon "Eye".
  // static SvgPicture chevron_left_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Arrow - Left-1.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_dark_theme/Menu.svg" alt="Eye.svg" height=100 width=100> custom icon "Eye".
  // static SvgPicture menu_light =
  //     SvgPicture.asset('assets/icons/icons_dark_theme/Menu.svg');

  // /// <img src="/Users/latrygin/Development/motivation/assets/icons/icons_light_theme/Menu.svg" alt="Eye.svg" height=100 width=100> custom icon "Eye".
  // static SvgPicture menu_dark =
  //     SvgPicture.asset('assets/icons/icons_light_theme/Menu.svg');
}
