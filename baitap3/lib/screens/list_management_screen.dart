import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../data/dummy_data.dart';
import '../widgets/search_bar.dart';
import '../widgets/data_table.dart';
import '../widgets/create_form.dart';
import '../widgets/update_form.dart';
import '../widgets/delete_dialog.dart';

class ListManagementScreen extends StatefulWidget {
  const ListManagementScreen({Key? key}) : super(key: key);

  @override
  State<ListManagementScreen> createState() => _ListManagementScreenState();
}

class _ListManagementScreenState extends State<ListManagementScreen> {
  late List<Item> _items;
  List<Item> _filteredItems = [];
  final TextEditingController _searchController = TextEditingController();

  Item? _editingItem;
  Item? _deletingItem;
  bool _showCreateForm = false;
  String _sortBy = 'Name';
  String _order = 'ASC';

  @override
  void initState() {
    super.initState();
    _items = List.from(dummyItems);
    _filteredItems = List.from(_items);
    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredItems = List.from(_items);
      } else {
        _filteredItems = _items.where((item) =>
        item.name.toLowerCase().contains(query) ||
            item.email.toLowerCase().contains(query) ||
            item.id.contains(query)
        ).toList();
      }
    });
    _sortItems();
  }

  void _sortItems() {
    setState(() {
      switch (_sortBy) {
        case 'ID':
          _filteredItems.sort((a, b) => a.id.compareTo(b.id));
          break;
        case 'Name':
          _filteredItems.sort((a, b) => a.name.compareTo(b.name));
          break;
        case 'Age':
          _filteredItems.sort((a, b) => a.age.compareTo(b.age));
          break;
        case 'Email':
          _filteredItems.sort((a, b) => a.email.compareTo(b.email));
          break;
      }

      if (_order == 'DESC') {
        _filteredItems = _filteredItems.reversed.toList();
      }
    });
  }

  void _handleCreate(Item newItem) {
    setState(() {
      _items.add(newItem);
      _filterItems();
      _showCreateForm = false;
    });
  }

  void _handleUpdate(Item updatedItem) {
    setState(() {
      final index = _items.indexWhere((item) => item.id == updatedItem.id);
      if (index != -1) {
        _items[index] = updatedItem;
        _filterItems();
      }
      _editingItem = null;
    });
  }

  void _handleDelete(Item item) {
    setState(() {
      _items.removeWhere((i) => i.id == item.id);
      _filterItems();
      _deletingItem = null;
    });
  }

  void _showEditForm(Item item) {
    setState(() {
      _editingItem = item;
      _showCreateForm = false;
    });
  }

  void _showDeleteDialog(Item item) {
    setState(() {
      _deletingItem = item;
      _showCreateForm = false;
      _editingItem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'List Management System',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade700, Colors.blue.shade100],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                CustomSearchBar(
                  controller: _searchController,
                  onChanged: (_) => _filterItems(),
                  currentSortBy: _sortBy,
                  onSortChanged: (value) {
                    setState(() {
                      _sortBy = value;
                      _sortItems();
                    });
                  },
                  currentOrder: _order,
                  onOrderChanged: (value) {
                    setState(() {
                      _order = value;
                      _sortItems();
                    });
                  },
                ),
                const SizedBox(height: 20),
                // Add button và stats row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.people, size: 18, color: Colors.blue.shade700),
                          const SizedBox(width: 6),
                          Text(
                            'Total: ${_filteredItems.length} items',
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _showCreateForm = !_showCreateForm;
                          _editingItem = null;
                          _deletingItem = null;
                        });
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Add New Item'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Create form (hiện khi nhấn Add)
                if (_showCreateForm)
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: CreateForm(
                      onCreate: _handleCreate,
                      onCancel: () => setState(() => _showCreateForm = false),
                    ),
                  ),
                // Update form (hiện khi nhấn Edit)
                if (_editingItem != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: UpdateForm(
                      item: _editingItem!,
                      onUpdate: _handleUpdate,
                      onCancel: () => setState(() => _editingItem = null),
                    ),
                  ),
                // Delete dialog (hiện khi nhấn Delete)
                if (_deletingItem != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: DeleteDialog(
                      item: _deletingItem!,
                      onConfirm: _handleDelete,
                      onCancel: () => setState(() => _deletingItem = null),
                    ),
                  ),
                // Data table
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width - 72,
                        ),
                        child: DataTableView(
                          items: _filteredItems,
                          onEdit: _showEditForm,
                          onDelete: _showDeleteDialog,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}