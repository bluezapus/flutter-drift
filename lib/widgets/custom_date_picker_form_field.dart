import 'package:flutter/material.dart';

class CustomDatePickerFormField extends StatelessWidget {
  final TextEditingController _controller;
  final String _txtLable;
  final VoidCallback _callback;

  const CustomDatePickerFormField({
    super.key,
    required TextEditingController controller,
    required String txtLable,
    required VoidCallback callback,
  })  : _controller = controller,
        _txtLable = txtLable,
        _callback = callback;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), label: Text(_txtLable)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '{$_txtLable} name cannot be empty';
        }
        return null;
      },
      onTap: _callback,
      readOnly: true,
    );
  }
}
