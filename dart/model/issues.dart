import 'edges.dart';

class Issues {
  late List<Edges> edges;

  Issues.fromJson(jsonRes) {
    edges = [];
    for (var edgesItem in jsonRes['edges']) {
      edges.add(Edges.fromJson(edgesItem));
    }
  }

  @override
  String toString() {
    return '{"edges": $edges}';
  }
}
