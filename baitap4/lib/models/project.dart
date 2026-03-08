class Project {
  final String id;
  final String name;
  final String duration;
  final String customer;
  final String imageUrl;

  Project({
    required this.id,
    required this.name,
    required this.duration,
    required this.customer,
    this.imageUrl = 'https://via.placeholder.com/150',
  });
}