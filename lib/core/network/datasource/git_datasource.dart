
import 'package:money_manga/core/network/response/git_search_response.dart';

import '../_result.dart';
import 'base_datasource.dart';

class GitDataSource extends BaseDataSource {
  Future<Result<GitSearchResponse?>> search(String searchTerm) async =>
      await getResult(retroClient.gitSearch(searchTerm));

  /*Future<Result<GitSearchResponse>> search1(String searchTerm) async =>
      await request(
          type: NetworkRequestType.POST,
          url: Api.gitSearch,
          data: {'language': searchTerm});*/
}
