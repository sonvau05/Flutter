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
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              // 1. Tiêu đề: DANH BẠ ĐIỆN THOẠI
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_in_talk, color: Colors.red),
                  SizedBox(width: 10),
                  Text(
                    "DANH BẠ ĐIỆN THOẠI",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              const Divider(thickness: 1, color: Colors.black54), // Đường kẻ ngang

              // 2. Ô tìm kiếm
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.search, size: 24),
                    SizedBox(width: 8),
                    Text("Tìm kiếm: ", style: TextStyle(fontSize: 16)),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(thickness: 1, color: Colors.black54),

              // 3. Danh sách danh bạ
              Expanded(
                child: ListView(
                  children: [
                    _buildContactItem("1.", "Nguyễn Văn A", "0901 234 567"),
                    _buildContactItem("2.", "Trần Thị B", "0912 345 678"),
                    _buildContactItem("3.", "Lê Văn C", "0987 654 321"),
                    _buildContactItem("4.", "Phạm Thị D", "0933 112 233"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget con để tạo từng dòng liên lạc
  Widget _buildContactItem(String stt, String name, String phone) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(stt, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 10),
              const Icon(Icons.person_outline, size: 28), // Icon người
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.phone_android, size: 18, color: Colors.blueGrey),
                      const SizedBox(width: 8),
                      Text(phone, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(thickness: 1, color: Colors.black54), // Đường kẻ dưới mỗi item
      ],
    );
  }
}