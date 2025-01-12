import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_drift/db/app_db.dart';
import 'package:flutter_drift/widgets/custom_date_picker_form_field.dart';
import 'package:flutter_drift/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;

class EditFile extends StatefulWidget {
  final int id;
  const EditFile({super.key, required this.id});

  @override
  State<EditFile> createState() => _EditFileState();
}

class _EditFileState extends State<EditFile> {
  late AppDb _db;
  late Bz_fileData _bz_fileData;
  final TextEditingController _fileNameController = TextEditingController();
  final TextEditingController _authorNameController = TextEditingController();
  final TextEditingController _dateCreastedController = TextEditingController();
  final TextEditingController _fillController = TextEditingController();
  DateTime? _dateofCreate;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
    getBz_file();
  }

  @override
  void dispose() {
    _db.close();
    _fileNameController.dispose();
    _authorNameController.dispose();
    _dateCreastedController.dispose();
    _fillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit File'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              EditFile();
            },
            icon: Icon(
              Icons.save,
            ),
          ),
          IconButton(
              onPressed: () {
                deleteFile();
              },
              icon: const Icon(
                Icons.delete,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              CustomTextFormField(
                controller: _fileNameController,
                txtLable: 'File Name',
              ),
              SizedBox(height: 10),
              CustomTextFormField(
                controller: _authorNameController,
                txtLable: 'Author Name',
              ),
              SizedBox(height: 10),
              CustomDatePickerFormField(
                  controller: _dateCreastedController,
                  txtLable: 'Date of Create',
                  callback: () {
                    pickedDate(context);
                  }),
              SizedBox(height: 10),
              TextField(
                controller: _fillController,
                decoration: InputDecoration(
                  labelText: 'Fill',
                  border: OutlineInputBorder(),
                ),
                maxLines: null, // Membuat TextField bisa multiline (textarea)
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction
                    .newline, // Menambahkan action baru untuk baris baru
              ),
            ]),
          )
        ],
      ),
    );
  }

  //OnTap Date
  Future<void> pickedDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _dateofCreate ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
                dialogBackgroundColor: Colors.white,
              ),
              child: child ?? const Text(''),
            ));
    if (newDate == null) {
      return;
    }
    setState(() {
      _dateofCreate = newDate;
      String _CrD = DateFormat('dd/MM/yyyy').format(newDate);
      _dateCreastedController.text = _CrD;
    });
  }

  void EditFile() {
    final entity = Bz_fileCompanion(
      id: drift.Value(widget.id),
      filename: drift.Value(_fileNameController.text),
      author: drift.Value(_authorNameController.text),
      dateofCreate: drift.Value(_dateofCreate!),
      fill: drift.Value(_fillController.text),
    );

    _db.updateFile(entity).then(
          (value) => ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              backgroundColor: Colors.blue,
              content: Text(
                'File Update: $value',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () => ScaffoldMessenger.of(context)
                        .hideCurrentMaterialBanner(),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          ),
        );
  }

  void deleteFile() {
    _db.deleteFile(widget.id).then(
          (value) => ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(
              backgroundColor: Colors.blue,
              content: Text(
                'File delete: $value',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () => ScaffoldMessenger.of(context)
                        .hideCurrentMaterialBanner(),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          ),
        );
  }

  Future<void> getBz_file() async {
    _bz_fileData = await _db.getFile(widget.id);
    _fileNameController.text = _bz_fileData.filename;
    _authorNameController.text = _bz_fileData.author;
    _dateCreastedController.text = _bz_fileData.dateofCreate.toIso8601String();
    _fillController.text = _bz_fileData.fill;
  }
}
