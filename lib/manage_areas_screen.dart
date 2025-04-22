import 'package:flutter/material.dart';

class ManageAreasScreen extends StatefulWidget {
  const ManageAreasScreen({super.key});

  @override
  State<ManageAreasScreen> createState() => _ManageAreasScreenState();
}

class _ManageAreasScreenState extends State<ManageAreasScreen> {
  final TextEditingController _areaController = TextEditingController();
  String? _selectedDriver;

  // Dummy driver list for now
  List<String> drivers = ['Raj', 'Syed', 'Sahil'];

  // Dummy areas list (in real app, fetch from Supabase)
  List<Map<String, String>> areas = [];

  void _addArea() {
    if (_areaController.text.isEmpty || _selectedDriver == null) return;

    setState(() {
      areas.add({
        'area': _areaController.text,
        'driver': _selectedDriver!,
      });
      _areaController.clear();
      _selectedDriver = null;
    });
  }

  void _deleteArea(int index) {
    setState(() {
      areas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF110734),
      appBar: AppBar(
        title: const Text("Manage Areas"),
        backgroundColor: Colors.brown.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Area input
            TextField(
              controller: _areaController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Area Name',
                labelStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 12),

            // Driver dropdown
            DropdownButtonFormField<String>(
              value: _selectedDriver,
              decoration: InputDecoration(
                labelText: 'Assign Driver',
                labelStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              dropdownColor: Colors.grey[900],
              style: const TextStyle(color: Colors.white),
              iconEnabledColor: Colors.white,
              items: drivers.map((driver) {
                return DropdownMenuItem(
                  value: driver,
                  child: Text(driver, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (value) => setState(() => _selectedDriver = value),
            ),
            const SizedBox(height: 16),

            // Add Area Button
            ElevatedButton.icon(
              onPressed: _addArea,
              icon: const Icon(Icons.add_location_alt),
              label: const Text("Add Area"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            const SizedBox(height: 24),

            // Area List
            Expanded(
              child: areas.isEmpty
                  ? const Center(
                      child: Text("No areas added yet", style: TextStyle(color: Colors.white54)),
                    )
                  : ListView.builder(
                      itemCount: areas.length,
                      itemBuilder: (context, index) {
                        final area = areas[index];
                        return Card(
                          color: Colors.grey.shade300,
                          child: ListTile(
                            title: Text(area['area']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text("Driver: ${area['driver']}"),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteArea(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
