class GallaryImgModel {
  String? status;
  List<GallaryImages>? data;

  GallaryImgModel({this.status, this.data});

  GallaryImgModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <GallaryImages>[];
      json['data'].forEach((v) {
        data!.add(GallaryImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GallaryImages {
  String? clientImage1;
  String? clientImage2;
  String? clientImage3;
  String? createdAt;

  GallaryImages(
      {this.clientImage1,
      this.clientImage2,
      this.clientImage3,
      this.createdAt});

  GallaryImages.fromJson(Map<String, dynamic> json) {
    clientImage1 = json['clientImage1'];
    clientImage2 = json['clientImage2'];
    clientImage3 = json['clientImage3'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clientImage1'] = clientImage1;
    data['clientImage2'] = clientImage2;
    data['clientImage3'] = clientImage3;
    data['createdAt'] = createdAt;
    return data;
  }
}
