class Member {
  final String id;
  final String name;
  final String role;
  final String avatarUrl;

  Member({
    required this.id,
    required this.name,
    required this.role,
    this.avatarUrl = 'https://via.placeholder.com/100',
  });
}