class Repos {
  int? id;
  String? name;
  bool? private;
  Owner? owner;
  String? htmlUrl;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? pushedAt;
  String? visibility;
  String? defaultBranch;
  String? language;

  Repos(
      {this.id,
        this.name,
        this.private,
        this.owner,
        this.htmlUrl,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.pushedAt,
        this.visibility,
        this.language,
        this.defaultBranch});

  Repos.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    private = json['private'] ?? "";
    owner = (json['owner'] != null ? new Owner.fromJson(json['owner']) : null)!;
    htmlUrl = json['html_url'] ?? "";
    description = json['description'] ?? "";
    createdAt = json['created_at'] ?? "";
    updatedAt = json['updated_at'] ?? "";
    pushedAt = json['pushed_at'] ?? "";
    language = json['language'] ?? "";
    visibility = json['visibility'] ?? "";
    defaultBranch = json['default_branch'] ?? "";
  }

}

class Owner {
  int? id;
  String? avatarUrl;
  String? htmlUrl;

  Owner(
      {
        this.id,
        this.avatarUrl,
        this.htmlUrl,});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    avatarUrl = json['avatar_url'] ?? "";
    htmlUrl = json['html_url'] ?? "";
  }

}