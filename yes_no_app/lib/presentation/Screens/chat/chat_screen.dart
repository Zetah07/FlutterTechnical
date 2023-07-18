import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_buuble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_buuble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child:CircleAvatar(
            backgroundImage: NetworkImage('https://scontent.feoh6-1.fna.fbcdn.net/v/t1.6435-9/157307054_3764186127004826_1745499606068367124_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=0hYA0-CGYiQAX_nbZVe&_nc_ht=scontent.feoh6-1.fna&oh=00_AfAqe2OTGLo4cGjq8WmGr0JgDl2eyc6zlKOLgrJO1Aqr7w&oe=64989676'),
          ),
        ),
        title: const Text('Cielo ♥️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10, vertical:10 ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messagesList.length,
                itemBuilder:(context, index) {
                  final message = chatProvider.messagesList[index];
                  
                  return (message.fromWho == FromWho.me)
                  ?  MyMessageBubble(message: message)
                  :  HerMessageBubble(message: message);
                }, )), 

                //Caja De Texto //
            MessageFieldBox(
              onValue: (value) {
                chatProvider.sendMessage(value);
                chatProvider.moveScrollToBotton();
              },
            )
          ],
        ),
      ),
    );
  }
}