// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGg {
  BuildContext context;
  SVGg(
    this.context,
  );

  SvgPicture get menu => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Menu.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Menu.svg');

  SvgPicture get document => Theme.of(context).brightness == Brightness.dark
      ? SvgPicture.asset('assets/icons/icons_dark_theme/Document.svg')
      : SvgPicture.asset('assets/icons/icons_light_theme/Document.svg');
}
