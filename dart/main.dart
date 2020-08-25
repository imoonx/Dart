import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'model/model.dart';
import 'model/edges.dart';

Future<void> main() async {
  //API 地址
  var url = "https://api.github.com/graphql";

  var data = ''' 
  query { 
  repository(owner:"octocat", name:"Hello-World") {
    issues(last:100) {
      edges {
        node {
          title
          author{
            login
          }
        }
      }
    }
  }
}
''';

  //转化为JSON格式
  var queryJson = {"query": data};
  String jsonString = json.jsonEncode(queryJson);
  // print(jsonString);

  http
      .post(url,
          headers: {
            // 'Accept': 'application/json',
            // 'Content-Type': 'application/json',
            'Authorization': 'token 4a2cada416a8b5be2f8ef6fbf906fec113984d01'
          },
          body: jsonString)
      .then((response) {
    print(response.body);

    var dataObject = GithubData.fromJson(response.body);
    List<Edges> datas = dataObject.data.repository.issues.edges;

    print(datas.length);

    // Set<Edges> set = new Set<Edges>.from(datas);

    //标题
    List<String> titles = [];
    //提交者相关内容
    List<String> authors = [];

    datas.forEach((element) {
      titles.add(element.node.title);
      var author = element.node.author;
      if (author != null) {
        authors.add(author.login);
      }
    });

    //1. 获取不重复的title
    Set<String> titlesSet = Set<String>.from(titles);
    // Set<String> titlesSet = titles.toSet();
    print(titlesSet.length);

    //2. 获取不重复的提交者信息
    // Set<String> authorsSet = Set<String>.from(authors);
    Set<String> authorsSet = authors.toSet();
    print(authorsSet.length);

    //3. 或者提交次数最多的提交者信息
    Map<String, int> map = Map<String, int>();
    authors.forEach((author) {
      if (null != author) {
        if (map.containsKey(author)) {
          //包含
          map.update(author, (value) => (value + 1));
        } else {
          //不包含
          map[author] = 1;
        }
      }
    });

    var reduce = map.values.reduce(max);
    //打印出现最多的次数
    print(reduce);
    map.forEach((key, value) {
      if (value == reduce) {
        //打印最多的提交者
        print(key);
      }
    });
  });
}
