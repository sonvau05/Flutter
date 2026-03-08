import 'package:flutter/material.dart';
import '../services/project_service.dart';
import '../widgets/project_card.dart';

class ProjectListPage extends StatelessWidget {
  final ProjectService _projectService = ProjectService();

  ProjectListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = _projectService.getProjects();

    return Scaffold(
      appBar: AppBar(
        title: const Text('PROJECT LIST'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return ProjectCard(project: projects[index]);
          },
        ),
      ),
    );
  }
}