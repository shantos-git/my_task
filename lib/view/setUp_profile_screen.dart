import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_task/view/home_screen.dart';
import 'package:my_task/widgets/reusable/custom_button.dart';
import 'package:my_task/widgets/reusable/custom_textformField.dart';

class SetUpProfileScreen extends StatefulWidget {
  const SetUpProfileScreen({super.key});

  @override
  State<SetUpProfileScreen> createState() => _SetUpProfileScreenState();
}

class _SetUpProfileScreenState extends State<SetUpProfileScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  late AnimationController _rotationController;

  void _onClick() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            icon: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/Group.png',
                height: 180,
                width: 180,
              ),
            ),
            title: const Text(
              'Congratulations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text(
              'Your account is ready to use. You will be\nredirected to the home page in a few\nseconds',
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: RotationTransition(
                  turns: _rotationController,
                  child: Image.asset(
                    'assets/images/loading_2.png',
                    width: 40,
                    height: 40,
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          );
        });
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null && mounted) {
        setState(() {
          _selectedImage = image;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to pick image')),
        );
      }
    }
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: const Color(0xFF2565FF),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      setState(() {
        _dobController.text = '${date.day}/${date.month}/${date.year}';
      });
    }
  }

  void _selectGender() {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Gender',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...['Male', 'Female', 'Other'].map(
                (label) => ListTile(
                  title: Text(label),
                  onTap: () {
                    setState(() {
                      _genderController.text = label;
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _aboutController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FF),
      appBar: AppBar(
        title: const Text(
          'Set Up Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        toolbarHeight: kToolbarHeight + 22,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 20),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.of(context).maybePop();
            },
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _selectedImage != null
                        ? FileImage(File(_selectedImage!.path))
                        : null,
                    backgroundColor: _selectedImage == null
                        ? const Color.fromARGB(255, 215, 212, 212)
                        : null,
                    child: _selectedImage == null
                        ? const Icon(
                            Icons.person,
                            size: 100,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Upload profile picture',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2B2B2B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            CustomTextformfield(
              labelText: 'About',
              hintText: 'Tell us about yourself',
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              controller: _aboutController,
              fillColor: const Color(0xFFF3F7FF),
            ),
            CustomTextformfield(
              labelText: 'Date of Birth',
              hintText: 'Date of birth',
              keyboardType: TextInputType.datetime,
              controller: _dobController,
              readOnly: true,
              onTap: _selectDate,
              suffixIcon: Icons.calendar_today_outlined,
            ),
            CustomTextformfield(
              labelText: 'Gender',
              hintText: 'Gender',
              keyboardType: TextInputType.text,
              controller: _genderController,
              readOnly: true,
              onTap: _selectGender,
              suffixIcon: Icons.keyboard_arrow_down_outlined,
            ),
            const SizedBox(height: 28),
            CustomButton(
              text: 'Next',
              onPressed: () {
                _onClick();
              },
            ),
          ],
        ),
      ),
    );
  }
}
