import 'package:flutter/material.dart'; // Thêm dòng này

class TrafficSign {
  final String id;
  final String name;
  final String imagePath;
  final String description;
  final String category;

  TrafficSign({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.description,
    required this.category,
  });
}

class TrafficSignCategory {
  final String id;
  final String name;
  final String icon;
  final Color color;

  TrafficSignCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}

// Dữ liệu mẫu
List<TrafficSignCategory> categories = [
  TrafficSignCategory(
    id: '1',
    name: 'Biển báo cấm',
    icon: '🚫',
    color: Colors.red,
  ),
  TrafficSignCategory(
    id: '2',
    name: 'Biển báo nguy hiểm',
    icon: '⚠️',
    color: Colors.orange,
  ),
  TrafficSignCategory(
    id: '3',
    name: 'Biển hiệu lệnh',
    icon: '📜',
    color: Colors.blue,
  ),
  TrafficSignCategory(
    id: '4',
    name: 'Biển chỉ dẫn',
    icon: '📍',
    color: Colors.green,
  ),
  TrafficSignCategory(
    id: '5',
    name: 'Biển báo phụ',
    icon: 'ℹ️',
    color: Colors.grey,
  ),
];

List<TrafficSign> trafficSigns = [
  TrafficSign(
    id: 'P.101',
    name: 'Đường cấm',
    imagePath: 'assets/signs/P101.png',
    description: 'Cấm tất cả các loại xe cơ giới và thô sơ đi lại',
    category: '1',
  ),
  TrafficSign(
    id: 'P.102',
    name: 'Cấm đi ngược chiều',
    imagePath: 'assets/signs/P102.png',
    description: 'Cấm các loại xe đi vào đường theo chiều đặt biển',
    category: '1',
  ),
  TrafficSign(
    id: 'P.103a',
    name: 'Cấm ô tô',
    imagePath: 'assets/signs/P103a.png',
    description: 'Cấm các loại ô tô đi qua',
    category: '1',
  ),
  TrafficSign(
    id: 'P.103b',
    name: 'Cấm ô tô rẽ phải',
    imagePath: 'assets/signs/P103b.png',
    description: 'Cấm các loại ô tô rẽ phải',
    category: '1',
  ),
  TrafficSign(
    id: 'P.103c',
    name: 'Cấm ô tô rẽ trái',
    imagePath: 'assets/signs/P103c.png',
    description: 'Cấm các loại ô tô rẽ trái',
    category: '1',
  ),
  TrafficSign(
    id: 'P.104',
    name: 'Cấm mô tô',
    imagePath: 'assets/signs/P104.png',
    description: 'Cấm các loại xe mô tô',
    category: '1',
  ),
];