import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course UI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto', // Hoặc phông chữ mặc định
      ),
      home: const CourseDetailScreen(),
    );
  }
}

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Phần Banner Hình ảnh (Dùng Stack để đè chữ lên ảnh)
              _buildBanner(),

              const SizedBox(height: 20),

              // 2. Tiêu đề khóa học
              const Text(
                "Flutter cơ bản",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 8),

              // 3. Giảng viên
              RichText(
                text: TextSpan(
                  text: 'Giảng viên: ',
                  style: TextStyle(color: Colors.grey[600], fontSize: 16),
                  children: const [
                    TextSpan(
                      text: 'Nguyễn Văn A',
                      style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // 4. Giá và Tag
              Row(
                children: [
                  const Text(
                    "499.000đ",
                    style: TextStyle(
                      color: Color(0xFFEF5350), // Màu đỏ cam giống ảnh
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  _buildTag("Giảm 20%"),
                  const SizedBox(width: 8),
                  _buildTag("Online"),
                ],
              ),

              const SizedBox(height: 16),

              // 5. Mô tả
              Text(
                "Học Flutter từ cơ bản đến xây dựng ứng dụng hoàn chỉnh.",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 24),

              // 6. Danh sách bài học (Lesson)
              const Text(
                "Lesson",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // List các bài học
              _buildLessonItem("1. Giới thiệu Flutter"),
              _buildLessonItem("2. Widget cơ bản"),
              _buildLessonItem("3. Layout"),
              _buildLessonItem("4. Navigation"),

              const SizedBox(height: 30),

              // 7. Nút Đăng ký học
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện click
                    print("Đã bấm đăng ký");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEF5350), // Màu đỏ cam
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Đăng ký học",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget con: Banner hình ảnh giả lập
  Widget _buildBanner() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF1F2937), // Màu nền tối giả lập ảnh
          image: const DecorationImage(
            // Bạn thay link ảnh thật vào đây
              image: NetworkImage("https://images.unsplash.com/photo-1531482615713-2afd69097998?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
              fit: BoxFit.cover,
              opacity: 0.6 // Làm mờ ảnh để chữ nổi lên
          )
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFEF5350),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.star, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Text("Khóa học Hot", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              "Lập trình\nFlutter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget con: Tag màu xám (Giảm giá, Online...)
  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w500),
      ),
    );
  }

  // Widget con: Dòng bài học
  Widget _buildLessonItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(Icons.play_circle_fill, color: Colors.grey, size: 20),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}