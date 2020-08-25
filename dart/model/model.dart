import 'data.dart';
import 'dart:convert' show json;

class GithubData {
  late Data data;

  GithubData.fromJson(jsonRes) {
    data = Data.fromJson(json.decode(jsonRes)['data']);
  }

  @override
  String toString() {
    return '{"data": $data}';
  }
}
