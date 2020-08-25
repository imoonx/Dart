import 'repository.dart';

class Data {
  late Repository repository;

  Data.fromJson(jsonRes) {
    repository = Repository.fromJson(jsonRes['repository']);
  }

  @override
  String toString() {
    return '{"repository": $repository}';
  }
}
