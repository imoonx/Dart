import 'author.dart';
import 'dart:convert' show json;

class Node {
  late String title;
  late Author author;

  Node.fromJson(jsonRes) {
    title = jsonRes['title'];
    author = (null == jsonRes['author']
        ? null
        : Author.fromJson(jsonRes['author'])) as Author;
  }

  @override
  String toString() {
    return '{"title": ${title != null ? '${json.encode(title)}' : 'null'}, "author": $author}';
  }
}
