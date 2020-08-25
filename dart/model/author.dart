import 'dart:convert' show json;

class Author {

  late String login;
  
  Author.fromJson(jsonRes) {
    login = jsonRes['login'];
  }

  @override
  String toString() {
    return '{"login": ${login != null?'${json.encode(login)}':'null'}}';
  }
}