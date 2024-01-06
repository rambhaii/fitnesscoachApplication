import 'package:alpersonalcoachingapp/api/api.dart';
import 'package:alpersonalcoachingapp/api/network.dart';

class LikeApi {
  Future meapi() async {
    ServiceWithHeader service = ServiceWithHeader(APIURL.ME);
    var data = await service.datame();
    return data;
  }

  // Future fevalbum(String id) async {
  //   var url = APIURL.FEVBYUSER + '/$id';
  //   ServiceWithHeader service = ServiceWithHeader(url);
  //   var data = await service.data();
  //   return data;
  // }

  // Future like(String id) async {
  //   var url = APIURL.LIKE + '/$id';
  //   ServiceWithHeader service = ServiceWithHeader(url);
  //   var data = await service.data();
  //   return data;
  // }

  // Future dislike(String id) async {
  //   print(id);
  //   var url = APIURL.DeleteLike + '/$id';
  //   ServiceWithDelete service = ServiceWithDelete(url);
  //   var data = await service.data();
  //   return data;
  // }

  // Future disfav(String id) async {
  //   var url = APIURL.DeleteFav + '/$id';
  //   ServiceWithDelete service = ServiceWithDelete(url);
  //   var data = await service.data();
  //   return data;
  // }

  // Future deleterefrigeratoringradients(String id) async {
  //   var url = APIURL.myrefrigeratoringradients + '$id';
  //   ServiceWithDelete service = ServiceWithDelete(url);
  //   var data = await service.data();
  //   return data;
  // }

  Future deleterefoodplan(String id) async {
    var url = APIURL.Deletecalenderfood + id;
    ServiceWithDelete service = ServiceWithDelete(url);
    var data = await service.data();
    return data;
  }

  Future fcmlogout() async {
    var url = APIURL.registerfcmtoken;
    ServiceWithoutbody service = ServiceWithoutbody(url);
    var data = await service.putdatawithoutbodywithheader();
    return data;
  }

  // Future notificationread(String notificationid) async {
  //   var url = APIURL.notificationread + "/$notificationid";
  //   ServiceWithoutbody service = ServiceWithoutbody(url);
  //   var data = await service.patchdatawithoutbodywithheader();
  //   return data;
  // }

  //  Future deletenotification(String id) async {
  //   var url = APIURL.myrefrigeratoringradients + '$id';
  //   ServiceWithDelete service = ServiceWithDelete(url);
  //   var data = await service.data();
  //   return data;
  // }

// Future dislike(String id) async {
//     var url = APIURL.DeleteLike + '/$id';
//     Service service = Service(url);
//     var data = await service.data();
//     return data;
//   }

  // Future dislike() async {
  //   Service service = new Service(APIURL.DeleteLike+ '/$id');
  //   var data = await service.formdata();
  //   return data;
  // }
}
