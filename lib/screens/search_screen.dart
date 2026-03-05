import 'package:flutter/material.dart';
import '../models/cake_model.dart';

class SearchScreen extends StatefulWidget {
  final String searchQuery;

  const SearchScreen({
    super.key,
    required this.searchQuery,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Map<String, dynamic>> _searchResults;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.searchQuery);
    _performSearch(widget.searchQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    final results = <Map<String, dynamic>>[];

    if (query.trim().isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    final lowerQuery = query.toLowerCase().trim();

    // Tìm kiếm trong tất cả các category
    for (var category in categories) {
      for (var cake in category.cakes) {
        if (cake.name.toLowerCase().contains(lowerQuery) ||
            cake.description.toLowerCase().contains(lowerQuery)) {
          results.add({
            'category': category,
            'cake': cake,
          });
        }
      }
    }

    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Tìm kiếm bánh...',
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search, size: 20, color: Colors.grey),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                icon: const Icon(Icons.clear, size: 18, color: Colors.grey),
                onPressed: () {
                  _searchController.clear();
                  _performSearch('');
                },
              )
                  : null,
              contentPadding: const EdgeInsets.symmetric(vertical: 8),
            ),
            onSubmitted: _performSearch,
            textInputAction: TextInputAction.search,
          ),
        ),
      ),
      body: Column(
        children: [
          // Kết quả tìm kiếm
          Expanded(
            child: _searchResults.isEmpty
                ? _buildEmptyState()
                : _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    if (widget.searchQuery.isEmpty && _searchController.text.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 80,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 16),
            Text(
              'Tìm kiếm bánh yêu thích của bạn',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sentiment_dissatisfied,
              size: 80,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 16),
            Text(
              'Không tìm thấy bánh nào',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Hãy thử tìm kiếm với từ khóa khác',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildSearchResults() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final result = _searchResults[index];
        final category = result['category'] as CakeCategory;
        final cake = result['cake'] as Cake;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: category.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  category.icon,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            title: Text(
              cake.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  cake.description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: category.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        category.name,
                        style: TextStyle(
                          fontSize: 11,
                          color: category.color,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      cake.price,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: category.color,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            isThreeLine: true,
            onTap: () {
              // TODO: Xem chi tiết bánh
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Đã chọn: ${cake.name}'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
        );
      },
    );
  }
}