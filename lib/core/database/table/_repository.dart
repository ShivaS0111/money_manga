import 'package:floor/floor.dart';

@entity
class Repository {
  String? _type;
  String? _username;
  String? _name;
  String? _owner;
  dynamic _homepage;
  String? _description;
  String? _language;
  int? _watchers;
  int? _followers;
  int? _forks;
  int? _size;
  int? _openIssues;
  double? _score;
  bool? _hasDownloads;
  bool? _hasIssues;
  bool? _hasProjects;
  bool? _hasWiki;
  bool? _fork;
  bool? _private;
  String? _url;
  String? _created;
  String? _createdAt;
  String? _pushedAt;
  String? _pushed;

  String? get type => _type;
  String? get username => _username;
  String? get name => _name;
  String? get owner => _owner;
  dynamic get homepage => _homepage;
  String? get description => _description;
  String? get language => _language;
  int? get watchers => _watchers;
  int? get followers => _followers;
  int? get forks => _forks;
  int? get size => _size;
  int? get openIssues => _openIssues;
  double? get score => _score;
  bool? get hasDownloads => _hasDownloads;
  bool? get hasIssues => _hasIssues;
  bool? get hasProjects => _hasProjects;
  bool? get hasWiki => _hasWiki;
  bool? get fork => _fork;
  bool? get private => _private;
  String? get url => _url;
  String? get created => _created;
  String? get createdAt => _createdAt;
  String? get pushedAt => _pushedAt;
  String? get pushed => _pushed;

  Repository({
      String? type,
      String? username,
      String? name,
      String? owner,
      dynamic homepage, 
      String? description,
      String? language,
      int? watchers,
      int? followers,
      int? forks,
      int? size,
      int? openIssues,
      double? score,
      bool? hasDownloads,
      bool? hasIssues,
      bool? hasProjects,
      bool? hasWiki,
      bool? fork,
      bool? private,
      String? url,
      String? created,
      String? createdAt,
      String? pushedAt,
      String? pushed}){
    _type = type;
    _username = username;
    _name = name;
    _owner = owner;
    _homepage = homepage;
    _description = description;
    _language = language;
    _watchers = watchers;
    _followers = followers;
    _forks = forks;
    _size = size;
    _openIssues = openIssues;
    _score = score!;
    _hasDownloads = hasDownloads;
    _hasIssues = hasIssues;
    _hasProjects = hasProjects;
    _hasWiki = hasWiki;
    _fork = fork;
    _private = private;
    _url = url;
    _created = created;
    _createdAt = createdAt;
    _pushedAt = pushedAt;
    _pushed = pushed;
}

  Repository.fromJson(dynamic json) {
    _type = json["type"];
    _username = json["username"];
    _name = json["name"];
    _owner = json["owner"];
    _homepage = json["homepage"];
    _description = json["description"];
    _language = json["language"];
    _watchers = json["watchers"];
    _followers = json["followers"];
    _forks = json["forks"];
    _size = json["size"];
    _openIssues = json["open_issues"];
    _score = json["score"];
    _hasDownloads = json["has_downloads"];
    _hasIssues = json["has_issues"];
    _hasProjects = json["has_projects"];
    _hasWiki = json["has_wiki"];
    _fork = json["fork"];
    _private = json["private"];
    _url = json["url"];
    _created = json["created"];
    _createdAt = json["created_at"];
    _pushedAt = json["pushed_at"];
    _pushed = json["pushed"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = _type;
    map["username"] = _username;
    map["name"] = _name;
    map["owner"] = _owner;
    map["homepage"] = _homepage;
    map["description"] = _description;
    map["language"] = _language;
    map["watchers"] = _watchers;
    map["followers"] = _followers;
    map["forks"] = _forks;
    map["size"] = _size;
    map["open_issues"] = _openIssues;
    map["score"] = _score;
    map["has_downloads"] = _hasDownloads;
    map["has_issues"] = _hasIssues;
    map["has_projects"] = _hasProjects;
    map["has_wiki"] = _hasWiki;
    map["fork"] = _fork;
    map["private"] = _private;
    map["url"] = _url;
    map["created"] = _created;
    map["created_at"] = _createdAt;
    map["pushed_at"] = _pushedAt;
    map["pushed"] = _pushed;
    return map;
  }

}