// // ignore_for_file: public_member_api_docs, sort_constructors_first, depend_on_referenced_packages
// // ignore_for_file: non_constant_identifier_names

// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:motivation/assets/api/url.dart';
// import 'package:motivation/domain/entity/message.dart';
// import 'package:motivation/domain/provider/token_provider.dart';
// import 'package:motivation/domain/provider/user_provider.dart';
// import 'package:motivation/domain/services/message_services.dart';
// import 'package:web_socket_channel/io.dart';
// import 'package:audioplayers/audioplayers.dart';

// class OpenChatPageViewModel extends ChangeNotifier {
//   final int chatId;
//   final int uid;
//   final int status;
//   final String name;
//   final String image;

//   OpenChatPageViewModel({
//     required this.chatId,
//     required this.uid,
//     required this.status,
//     required this.name,
//     required this.image,
//   }) {
//     getMessageChat();
//   }
//   final _tokenProvider = TokenProvider();

//   TextEditingController messageControler = TextEditingController();

//   IOWebSocketChannel channel = IOWebSocketChannel.connect(
//     Url.wsserver,
//     //headers: {'token-1': _tokenProvider.getToken()}
//   );

//   final _userProvider = UserProvider();

//   final _messageServices = MessageServices();

//   var _chatState = ChatState(messages: []);

//   ChatState get state => _chatState;

//   final _stateController = StreamController<ChatState>.broadcast();

//   Stream<ChatState> get stream => _stateController.stream;

//   Future<void> getMessageChat() async {
//     List<Message> newmessages = await _messageServices.getMessages(chatId);
//     List<Message> beforeList = _chatState.messages;
//     beforeList.addAll(newmessages);
//     _chatState = _chatState.copyWith(messages: beforeList);
//     _stateController.add(_chatState);
//   }

//   bool checkFromMessage(int from_user) {
//     return true;
//     //return _userProvider.getUserFromOpenBox().id == from_user ? true : false;
//   }

//   void sendMessage() async {
//     if (channel.closeCode == null) {
//       if (messageControler.text.isNotEmpty) {
//         final msg =
//             jsonEncode({"to_user_id": uid, "body": messageControler.text});
//         print('StatusCode: ${channel.closeCode}');
//         print('Status protocol: ${channel.protocol}');
//         print('Status innerWebSocket: ${channel.innerWebSocket}');

//         channel.sink.add(msg);
//         messageControler.clear();
//       }
//     } else {
//       print(
//           "Ожидание подключения\nchannel.closeCode = ${channel.closeCode}\n channel.innerWebSocket = ${channel.innerWebSocket}");
//       await Future.delayed(const Duration(seconds: 1));
//       channel.sink.close();
//       await Future.delayed(const Duration(seconds: 1));
//       channel = IOWebSocketChannel.connect(
//           Uri.parse(
//             'ws://5.181.109.239:8080',
//           ),
//           headers: {'token-1': _tokenProvider.getToken()});
//       notifyListeners();
//       sendMessage();
//     }
//   }

//   Future<void> setNewMessage(String data) async {
//     //assets/audio/sentmessage.mp3
//     Message msg = Message.fromMap(jsonDecode(data));
//     if (msg != _chatState.messages[0]) {
//       var sound = AudioPlayer();

//       await sound.play(AssetSource('audio/sentmessage.mp3'));

//       List<Message> newlist = [msg];

//       newlist.addAll(_chatState.messages);

//       _chatState = _chatState.copyWith(messages: newlist);

//       _stateController.add(_chatState);
//     } else {
//       print('Ожидание подключения \n ');
//       await Future.delayed(const Duration(seconds: 1));
//       channel.sink.close();
//       await Future.delayed(const Duration(seconds: 1));
//       channel = IOWebSocketChannel.connect(
//           Uri.parse(
//             'ws://5.181.109.239:8080',
//           ),
//           headers: {'token-1': _tokenProvider.getToken()});
//       return;
//     }
//   }

//   @override
//   void dispose() {
//     channel.sink.close();
//     super.dispose();
//   }
// }

// class ChatState {
//   List<Message> messages;
//   ChatState({
//     required this.messages,
//   });

//   ChatState copyWith({
//     List<Message>? messages,
//   }) {
//     return ChatState(
//       messages: messages ?? this.messages,
//     );
//   }

//   @override
//   String toString() => 'ChatState(messages: $messages)';

//   @override
//   bool operator ==(covariant ChatState other) {
//     if (identical(this, other)) return true;

//     return listEquals(other.messages, messages);
//   }

//   @override
//   int get hashCode => messages.hashCode;
// }
