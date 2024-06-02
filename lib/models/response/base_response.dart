class BaseResponse {
  BaseResponse({this.code, this.data, this.msg, this.error});

  BaseResponse.fromJson(dynamic json) {
    msg = json['message'];
    code = json['status_code'];
    data = json['data'];
    error = json['error'];
  }

  dynamic data;
  String? msg;
  String? error;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = code;
    map['message'] = msg;
    map['data'] = data;
    map['error'] = error;
    return map;
  }

  bool haveError() => (error != null && error != '') || code != 200;
}
