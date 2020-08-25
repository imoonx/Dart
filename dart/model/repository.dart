import 'issues.dart';

class Repository {

  late Issues issues;
  
  Repository.fromJson(jsonRes) {
    issues =Issues.fromJson(jsonRes['issues']);
  }

  @override
  String toString() {
    return '{"issues": $issues}';
  }
}