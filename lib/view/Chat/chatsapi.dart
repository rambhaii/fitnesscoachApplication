import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/network.dart';

class chatsapi {
  final Map<String, dynamic> body;
  chatsapi(this.body);

  Future createchatRoom() async {
   
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(APIURL.createchatRoom, body);
    var data = await service.postdatawithoutbody();
    return data;
  }

  Future getallChat(String chatRoomId) async {
    print("" + chatRoomId);
    ServiceWithHeader service =
        ServiceWithHeader(APIURL.getchatdata + chatRoomId);

    var data = await service.data();
    print(data);

    return data;
  }
}
