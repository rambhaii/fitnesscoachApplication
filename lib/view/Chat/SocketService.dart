import 'dart:async';

import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/apphelper.dart';
import 'package:alpersonalcoachingapp/view/Chat/ChatViewModel.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  //static final _socketResponse = StreamController<ChatViewModel>.broadcast();
  static late StreamController<ChatViewModel> _socketResponse;

  static late io.Socket _socket;

  static Stream<ChatViewModel> get getResponse =>
      _socketResponse.stream.asBroadcastStream();

  static void sendMessage(String message, String file) {
    print("djfhgkj" + file);
    if (message.isNotEmpty) {
      _socket.emit('createMessage', {
        "message": message,
        "author": AppHelper.userid,
        "chatRoomId": APIURL.chatroomId,
      });
    } else {
      _socket.emit('createMessage', {
        "file": file,
        "author": AppHelper.userid,
        "chatRoomId": APIURL.chatroomId,
      });
    }
  }

  static void connectAndListen() {
    print("hiiii " + AppHelper.AUTH_TOKEN_VALUE.toString());

    _socketResponse = StreamController<ChatViewModel>.broadcast();
    _socket = io.io(
        APIURL.SOCKETURL,
        io.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect()
            .setQuery({"token": AppHelper.AUTH_TOKEN_VALUE})
            .build());
    _socket.connect();
    print('connectccccc');
    _socket.onConnect((_) {
      print('connect');
    });

    _socket.on('newMessage', (data) {
      _socketResponse.sink.add(ChatViewModel.fromJson(data));
      print(data);
    });
  }

  static void dispose() {
    _socket.dispose();
    _socket.destroy();
    _socket.close();
    _socket.disconnect();
    _socketResponse.close();
  }
}
