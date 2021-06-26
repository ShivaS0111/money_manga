
import 'package:money_manga/core/database/table/_repository.dart';

import 'api_responce.dart';

class GitSearchResponse {
  List<Repository>? data;

  GitSearchResponse.fromJson(Map<String, dynamic> map)  {
    data = [];
    var parsed = map['repositories'] as List<dynamic>;
    for (var item in parsed) {
      var val = Repository.fromJson(item);
      data!.add(val);
    }
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['repositories'] = data;
    return json;
  }
}
