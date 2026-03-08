import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  const ProjectDetailsPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.name),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Icon(Icons.image, size: 100, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.build),
              title: const Text('Project Name'),
              subtitle: Text(project.name),
            ),
            ListTile(
              leading: const Icon(Icons.timer),
              title: const Text('Duration'),
              subtitle: Text(project.duration),
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Customer'),
              subtitle: Text(project.customer),
            ),
          ],
        ),
      ),
    );
  }
}