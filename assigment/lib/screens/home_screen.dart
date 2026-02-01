import 'package:flutter/material.dart';
import 'traffic_signs_screen.dart';
import 'select_exam_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Biển báo đường bộ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[50],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),

                // Card chính - Thi thử lý thuyết
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'THI THỬ LÝ THUYẾT',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 20),

                        // Hai nút đầu tiên lớn hơn
                        Row(
                          children: [
                            Expanded(
                              child: _buildLargeButton(
                                'Để ngẫu nhiên',
                                Icons.shuffle,
                                Colors.green,
                                onPressed: () {
                                  _showFeatureDialog(context, 'Để ngẫu nhiên');
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildLargeButton(
                                'Thi theo bộ đề',
                                Icons.assignment,
                                Colors.blue,
                                onPressed: () {
                                  // CHUYỂN SANG MÀN HÌNH CHỌN ĐỀ
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SelectExamScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // Các nút còn lại
                        _buildButtonRow([
                          _buildFeatureButton(
                            'Các câu bi sai',
                            Icons.error_outline,
                            Colors.orange,
                            onPressed: () {
                              _showFeatureDialog(context, 'Các câu bi sai');
                            },
                          ),
                          _buildFeatureButton(
                            'Ôn tập câu hỏi',
                            Icons.book,
                            Colors.purple,
                            onPressed: () {
                              _showFeatureDialog(context, 'Ôn tập câu hỏi');
                            },
                          ),
                        ]),

                        _buildButtonRow([
                          _buildFeatureButton(
                            '60 câu điểm liệt',
                            Icons.warning,
                            Colors.red,
                            onPressed: () {
                              _showFeatureDialog(context, '60 câu điểm liệt');
                            },
                          ),
                          _buildFeatureButton(
                            'Top 50 câu sai',
                            Icons.trending_down,
                            Colors.amber,
                            onPressed: () {
                              _showFeatureDialog(context, 'Top 50 câu sai');
                            },
                          ),
                        ]),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                              child: _buildFeatureButton(
                                '120 mô phỏng',
                                Icons.sim_card,
                                Colors.deepPurple,
                                onPressed: () {
                                  _showFeatureDialog(context, '120 mô phỏng');
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildFeatureButton(
                                'Bỏ quảng cáo',
                                Icons.remove_circle_outline,
                                Colors.pink,
                                onPressed: () {
                                  _showFeatureDialog(context, 'Bỏ quảng cáo');
                                },
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        _buildTrafficSignsButton(context),

                        const SizedBox(height: 8),

                        // Nút thêm
                        _buildFeatureButton(
                          '120 THGT',
                          Icons.directions_car,
                          Colors.teal,
                          onPressed: () {
                            _showFeatureDialog(context, '120 THGT');
                          },
                        ),

                        const SizedBox(height: 8),

                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.amber[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.lightbulb,
                                color: Colors.amber,
                                size: 24,
                              ),
                            ),
                            title: const Text(
                              'Mẹo ghi nhớ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: const Text(
                              'Các mẹo học lý thuyết hiệu quả',
                              style: TextStyle(fontSize: 12),
                            ),
                            trailing: const Icon(Icons.chevron_right, size: 20),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            onTap: () {
                              _showTipsDialog(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // NÚT "CÁC BIỂN BÁO" - sẽ chuyển sang trang TrafficSignsScreen
  Widget _buildTrafficSignsButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TrafficSignsScreen(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        elevation: 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.traffic,
            size: 24,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          const Text(
            'Các biển báo',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.arrow_forward,
              size: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeButton(String text, IconData icon, Color color,
      {required VoidCallback onPressed}) {
    return Container(
      height: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<Widget> buttons) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: buttons
            .map(
              (button) => Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              child: button,
            ),
          ),
        )
            .toList(),
      ),
    );
  }

  Widget _buildFeatureButton(String text, IconData icon, Color color,
      {required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
        elevation: 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.white),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void _showTipsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.lightbulb, color: Colors.amber),
              SizedBox(width: 10),
              Text('Mẹo ghi nhớ'),
            ],
          ),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Các mẹo học lý thuyết hiệu quả:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('1. Học theo nhóm biển báo'),
                Text('2. Ghi nhớ bằng hình ảnh'),
                Text('3. Làm bài thi thử thường xuyên'),
                Text('4. Ôn tập các câu hay sai'),
                SizedBox(height: 10),
                Text(
                  'Chức năng này đang được phát triển...',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }

  void _showFeatureDialog(BuildContext context, String featureName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(featureName),
          content: Text('Chức năng "$featureName" đang được phát triển.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }
}