import 'package:flutter/material.dart';

import '../widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  Future<void> _selectStartDate() async {
    final now = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? now,
      firstDate: DateTime(1950),
      lastDate: now,
    );

    if (picked != null) {
      setState(() {
        _startDate = picked;

        if (_endDate != null && _endDate!.isBefore(picked)) {
          _endDate = null;
        }
      });

      _formKey.currentState?.validate();
    }
  }

  Future<void> _selectEndDate() async {
    final now = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? _startDate ?? now,
      firstDate: _startDate ?? DateTime(1950),
      lastDate: now,
    );

    if (picked != null) {
      setState(() {
        _endDate = picked;
      });

      _formKey.currentState?.validate();
    }
  }

  void _saveExperience() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Pengalaman berhasil ditambahkan!'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Perusahaan: ${_companyController.text.trim()}'),
                Text('Posisi: ${_positionController.text.trim()}'),
                Text('Deskripsi: ${_descriptionController.text.trim()}'),
                Text('Tanggal Mulai: ${_formatDate(_startDate!)}'),
                Text('Tanggal Selesai: ${_formatDate(_endDate!)}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(dialogContext);

                _formKey.currentState!.reset();

                _companyController.clear();
                _positionController.clear();
                _descriptionController.clear();

                setState(() {
                  _startDate = null;
                  _endDate = null;
                });
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _companyController.dispose();
    _positionController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Experience Form',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _companyController,
                      maxLength: 100,
                      decoration: InputDecoration(
                        labelText: 'Nama Perusahaan / Organisasi',
                        hintText: 'Contoh: PT Teknologi Indonesia',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Nama perusahaan tidak boleh kosong!';
                        }

                        if (value.trim().length > 100) {
                          return 'Nama perusahaan maksimal 100 karakter!';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _positionController,
                      maxLength: 80,
                      decoration: InputDecoration(
                        labelText: 'Posisi / Jabatan',
                        hintText: 'Contoh: Mobile Developer',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Posisi tidak boleh kosong!';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 5,
                      maxLength: 500,
                      decoration: InputDecoration(
                        labelText: 'Deskripsi Pengalaman',
                        hintText:
                            'Ceritakan pengalaman dan tanggung jawabmu...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Deskripsi tidak boleh kosong!';
                        }

                        if (value.trim().length < 10) {
                          return 'Deskripsi minimal 10 karakter!';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    FormField<DateTime>(
                      validator: (value) {
                        if (_startDate == null) {
                          return 'Tanggal mulai wajib dipilih!';
                        }

                        return null;
                      },
                      builder: (field) {
                        return InkWell(
                          onTap: () async {
                            await _selectStartDate();
                            field.didChange(_startDate);
                          },
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Tanggal Mulai',
                              errorText: field.errorText,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              suffixIcon: const Icon(Icons.calendar_month),
                            ),
                            child: Text(
                              _startDate == null
                                  ? 'Pilih tanggal mulai'
                                  : _formatDate(_startDate!),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    FormField<DateTime>(
                      validator: (value) {
                        if (_endDate == null) {
                          return 'Tanggal selesai wajib dipilih!';
                        }

                        if (_startDate != null &&
                            _endDate!.isBefore(_startDate!)) {
                          return 'Tanggal selesai tidak boleh sebelum tanggal mulai!';
                        }

                        return null;
                      },
                      builder: (field) {
                        return InkWell(
                          onTap: () async {
                            await _selectEndDate();
                            field.didChange(_endDate);
                          },
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Tanggal Selesai',
                              errorText: field.errorText,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              suffixIcon: const Icon(Icons.calendar_month),
                            ),
                            child: Text(
                              _endDate == null
                                  ? 'Pilih tanggal selesai'
                                  : _formatDate(_endDate!),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: _saveExperience,
                      child: const Text(
                        'Simpan Pengalaman',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
