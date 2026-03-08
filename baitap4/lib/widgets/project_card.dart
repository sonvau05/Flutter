import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 80,
                width: 80,
                color: Colors.grey[300],
                child: const Icon(Icons.image, size: 40, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Name: ${project.name}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Duration: ${project.duration}'),
            Text('Customer: ${project.customer}'),
          ],
        ),
      ),
    );
  }
}