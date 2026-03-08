import '../models/project.dart';

class ProjectService {
  List<Project> getProjects() {
    return [
      Project(
        id: '1',
        name: 'ABC house',
        duration: '12M',
        customer: 'ABC Co',
      ),
      Project(
        id: '2',
        name: 'XYZ house',
        duration: '9M',
        customer: 'XYZ Co',
      ),
      Project(
        id: '3',
        name: 'Beach villa',
        duration: '20M',
        customer: 'Beach',
      ),
      Project(
        id: '4',
        name: 'T&T house',
        duration: '8M',
        customer: 'T&T',
      ),
    ];
  }
}