import 'user.dart';
import 'info.dart';

class APIResponse {
  List<User> users;
  Info info;

  APIResponse({this.users, this.info});

  APIResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      users = new List<User>();
      json['results'].forEach((v) {
        users.add(new User.fromJson(v));
      });
    }
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['results'] = this.users.map((v) => v.toJson()).toList();
    }
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    return data;
  }
}