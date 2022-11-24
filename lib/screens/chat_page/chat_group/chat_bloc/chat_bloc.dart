import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motivation/domain/entity/chat.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    //on<ChatEvent>(_getChats);
  }

  // _getChats(ChatEvent event, Emitter<ChatState> emit) {
  //   emit(state.setLoading(true));
  // }
}
