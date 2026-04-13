import 'package:flutter/material.dart';
import 'package:my_task/widgets/reusable/custom_button.dart';
import 'package:my_task/widgets/reusable/custom_select_field.dart';
import 'package:my_task/widgets/reusable/custom_textformField.dart';
import 'package:my_task/widgets/reusable/upload_photo_card.dart';

class EditproductScreen extends StatefulWidget {
  const EditproductScreen({super.key});

  @override
  State<EditproductScreen> createState() => _EditproductScreenState();
}

class _EditproductScreenState extends State<EditproductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController dimensionsController = TextEditingController();

  String selectedCategory = '';
  String selectedStock = '';
  String selectedTag = '';
  String selectedStatus = '';

  @override
  void dispose() {
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    brandController.dispose();
    discountController.dispose();
    weightController.dispose();
    dimensionsController.dispose();
    super.dispose();
  }

  void chooseFile() {}

  Widget buildSelectField({
    required String label,
    required String value,
    required String hint,
    required VoidCallback onTap,
  }) {
    return CustomSelectField(
      labelText: label,
      hintText: hint,
      value: value,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Edit Product',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UploadPhotoCard(
                title: 'Upload photo',
                subtitle:
                    'Upload the front side of your document\nSupports: JPG, PNG, PDF',
                onChooseFile: chooseFile,
              ),
              const SizedBox(height: 24),
              CustomTextformfield(
                labelText: 'Product Name',
                hintText: 'Type product name',
                keyboardType: TextInputType.text,
                controller: productNameController,
              ),
              buildSelectField(
                label: 'Select Category',
                value: selectedCategory,
                hint: 'Select Categories',
                onTap: () {
                  setState(() {
                    selectedCategory = 'Electronics';
                  });
                },
              ),
              CustomTextformfield(
                labelText: 'Description',
                hintText: 'Type Description',
                keyboardType: TextInputType.multiline,
                controller: descriptionController,
                maxLines: 4,
              ),
              CustomTextformfield(
                labelText: 'Price',
                hintText: 'Type Price',
                keyboardType: TextInputType.number,
                controller: priceController,
              ),
              CustomTextformfield(
                labelText: 'Brand',
                hintText: 'Type',
                keyboardType: TextInputType.text,
                controller: brandController,
              ),
              CustomTextformfield(
                labelText: 'Discount',
                hintText: 'Type Discount',
                keyboardType: TextInputType.number,
                controller: discountController,
              ),
              buildSelectField(
                label: 'Stoke',
                value: selectedStock,
                hint: 'Select Stoke',
                onTap: () {
                  setState(() {
                    selectedStock = 'In stock';
                  });
                },
              ),
              buildSelectField(
                label: 'Tags',
                value: selectedTag,
                hint: 'Select Tag',
                onTap: () {
                  setState(() {
                    selectedTag = 'New';
                  });
                },
              ),
              buildSelectField(
                label: 'Active',
                value: selectedStatus,
                hint: 'Select Status',
                onTap: () {
                  setState(() {
                    selectedStatus = 'Active';
                  });
                },
              ),
              CustomTextformfield(
                labelText: 'Weight',
                hintText: 'Type weight',
                keyboardType: TextInputType.number,
                controller: weightController,
              ),
              buildSelectField(
                label: 'Colors',
                value: '',
                hint: 'Select color',
                onTap: () {},
              ),
              CustomTextformfield(
                labelText: 'Dimensions',
                hintText: 'Type dimensions',
                keyboardType: TextInputType.text,
                controller: dimensionsController,
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Submit',
                onPressed: () {},
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
