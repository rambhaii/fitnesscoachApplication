
import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/network.dart';

class UpdateSetApi {
  final Map<String, dynamic> body;
  UpdateSetApi(this.body);

  Future updateSetValue(String id) async {
    ServiceWithHeaderWithbody service =
        ServiceWithHeaderWithbody(APIURL.updateSetValue + id, body);
    var data = await service.putdatawithoutbody();
    return data;
  }
}
