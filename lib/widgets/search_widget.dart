import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final String title;
  final TextEditingController? controller;
  const SearchWidget({
    Key? key,
    this.controller,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          focusColor: Theme.of(context).hintColor,
          fillColor: Theme.of(context).hintColor,
          hoverColor: Theme.of(context).hintColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.only(right: 50),
          hintText: title,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).hoverColor,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 18,
            color: Theme.of(context).hoverColor,
          ),
        ),
      ),
    );
  }
}
