import 'dart:io';
import 'dart:async';

void main(List<String> args) {
  definingAnAction(args[0], args[1]);
}

void definingAnAction(String action, String name) async {
  switch (action) {
    case 'create':
      await createCustomFile(name);
      print('FILE: $name is created !!!');
      break;
    case 'delete':
      break;
    case 'update':
      break;
    default:
      print('There is no "$action" command');
  }
}

Future<void> createCustomFile(String name) async {
  Directory current = Directory.current;
  var pathToView =
      Uri.parse('${current.path}/lib/screens/${name}_page/${name}_page.dart');
  var pathToViewModel = Uri.parse(
      '${current.path}/lib/screens/${name}_page/${name}_page_view_model.dart');
  File fileView = await File.fromUri(pathToView).create(recursive: true);
  File fileViewModel =
      await File.fromUri(pathToViewModel).create(recursive: true);
  fileView.writeAsString(getViewStruct(name));
  fileViewModel.writeAsString(getViewModelStruct(name));
}

String getViewStruct(String name) {
  return '''
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '${name}_page_view_model.dart';

class ${setUpperforFirstIndex(name)}Screen extends StatelessWidget {
  const ${setUpperforFirstIndex(name)}Screen({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ${setUpperforFirstIndex(name)}PageViewModel(),
        child: const _${setUpperforFirstIndex(name)}BodyWidget(),
      );
}

class _${setUpperforFirstIndex(name)}BodyWidget extends StatelessWidget {
  const _${setUpperforFirstIndex(name)}BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
''';
}

String getViewModelStruct(String name) {
  return '''
import 'package:flutter/material.dart';

class ${setUpperforFirstIndex(name)}PageViewModel extends ChangeNotifier {
  
}
''';
}

String setUpperforFirstIndex(String name) {
  var startName = name.substring(0, 1).toUpperCase();
  var endName = name.substring(1);
  return startName + endName;
}
