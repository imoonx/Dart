import 'node.dart';

class Edges {
  late Node node;

  Edges.fromJson(jsonRes) {
    node = Node.fromJson(jsonRes['node']);
  }

  @override
  String toString() {
    return '{"node": $node}';
  }
}
