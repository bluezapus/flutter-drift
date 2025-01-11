import 'package:flutter/material.dart';
import 'package:flutter_drift/widgets/custom_date_picker_form_field.dart';
import 'package:flutter_drift/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';

class AddFile extends StatefulWidget {
  const AddFile({super.key});

  @override
  State<AddFile> createState() => _AddFileState();
}

class _AddFileState extends State<AddFile> {
  final TextEditingController _fileNameController = TextEditingController();
  final TextEditingController _authorNameController = TextEditingController();
  final TextEditingController _dateCreastedController = TextEditingController();
  final TextEditingController _fillController = TextEditingController();
  DateTime? _dateofCreate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add File'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              //TODO
            },
            icon: Icon(
              Icons.save,
            ),
          ),
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
}
