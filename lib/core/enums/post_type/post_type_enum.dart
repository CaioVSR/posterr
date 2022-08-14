enum PostTypeEnum {
  post('post'),
  quote('quote'),
  repost('repost');

  final String value;

  const PostTypeEnum(this.value);

  factory PostTypeEnum.fromString(String value) => PostTypeEnum.values.firstWhere((e) => e.value == value);
}
