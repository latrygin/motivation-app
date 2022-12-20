import 'package:flutter/material.dart';
import 'package:motivation/assets/icons/svg.dart';
import 'package:motivation/assets/icons/svgs.dart';
import 'package:motivation/domain/entity/chat/chat.dart';

class ChatItemWidget extends StatelessWidget {
  final Chat chat;
  const ChatItemWidget({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      // color: model.isSelectedItem(chat.id)
      //     ? Theme.of(context).hintColor
      //     : Theme.of(context).scaffoldBackgroundColor,
      child: InkWell(
        splashColor: Theme.of(context).hintColor,
        // onLongPress: () => model.selectChatItem(chat.id),
        // onTap: () => model.isModeSelected
        //     ? model.selectChatItem(chat.id)
        //     : model.openChatToIndex(context, chat),
        child: Container(
          height: 80,
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Stack(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).hintColor,
                        // color: model.isSelectedItem(chat.id)
                        //     ? Theme.of(context).scaffoldBackgroundColor
                        //     : Theme.of(context).hintColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: SVG(
                        SVGs(context).unactive_user,
                      ),
                    ),
                    if (true)
                      //if (model.isSelectedItem(chat.id))
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.done,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      )
                    else
                      const SizedBox()
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      chat.chat_friend.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontSize: 16),
                    ),
                    Text(
                      chat.message.body,
                      maxLines: 2,
                      //textDirection: TextDirection.ltr,
                      overflow: TextOverflow.ellipsis,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade500,
                              ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              SizedBox(
                height: 54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '123',
                      //model.differenceDateTime(chat.created_at),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 18,
                      color: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
