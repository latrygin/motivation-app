// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:motivation/assets/api/url.dart';
import 'package:motivation/domain/entity/chat/chat_response.dart';
import 'package:motivation/domain/provider/token_provider.dart';

import '../entity/chat/chat.dart';
import '../middleware/response_middleware.dart';

class ChatServices implements ChatServicesInterface {
  final _middleware = ResponseMiddleware();
  final _tokenProvider = TokenProvider();

  @override
  Future<List<Chat>> deleteChat() async {
    throw UnimplementedError();
  }

  @override
  Future<ChatResponse> getChats() async {
    final token = await _tokenProvider.getHeaderWithToken();
    final response = await http.get(Url.chat, headers: token);
    debugPrint(response.statusCode.toString());
    _middleware.checkResponse(response.statusCode);
    final items = json.decode(response.body) as Map<String, dynamic>;
    return ChatResponse.fromJson(items);
  }
}

abstract class ChatServicesInterface {
  Future<dynamic> getChats();

  Future<dynamic> deleteChat();
}
