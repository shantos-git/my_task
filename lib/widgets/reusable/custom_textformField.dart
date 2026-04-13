import 'package:flutter/material.dart';

class CustomTextformfield extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool readOnly;
  final int maxLines;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final Color? fillColor;
  final double borderRadius;

  const CustomTextformfield({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.maxLines = 1,
    this.controller,
    this.onChanged,
    this.onTap,
    this.fillColor,
    this.borderRadius = 20,
  });

  @override
  State<CustomTextformfield> createState() => _CustomTextformfieldState();
}

class _CustomTextformfieldState extends State<CustomTextformfield> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboardType,
            obscureText: _obscureText,
            readOnly: widget.readOnly,
            maxLines: widget.maxLines,
            onTap: widget.onTap,
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.fillColor ?? const Color(0xFFF5F7FF),
              hintText: widget.hintText,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon, color: Colors.grey.shade600)
                  : null,
              suffixIcon: widget.suffixIcon != null
                  ? Icon(widget.suffixIcon, color: Colors.grey.shade700)
                  : (widget.obscureText
                      ? IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                          onPressed: _toggleVisibility,
                        )
                      : null),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
