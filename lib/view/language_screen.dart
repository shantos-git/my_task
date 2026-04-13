import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:my_task/view/setUp_profile_screen.dart';
import 'package:my_task/view/signIn_screen.dart';
import 'package:my_task/widgets/helper/languageModel.dart';
import 'package:my_task/widgets/reusable/custom_button.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final orderedIndices = List<int>.generate(languages.length, (i) => i);
    if (selectedIndex >= 0 && selectedIndex < orderedIndices.length) {
      orderedIndices.remove(selectedIndex);
      orderedIndices.insert(0, selectedIndex);
    }

    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is Your Mother Language',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose one language from the list below. You can scroll through the options.',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: orderedIndices.length,
                itemBuilder: (context, index) {
                  final displayIndex = orderedIndices[index];
                  final isSelected = displayIndex == selectedIndex;

                  return InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      setState(() {
                        selectedIndex = displayIndex;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(18),
                        boxShadow: isSelected
                            ? [
                                const BoxShadow(
                                  color: Color.fromARGB(41, 47, 108, 229),
                                  blurRadius: 16,
                                  offset: Offset(0, 8),
                                ),
                              ]
                            : null,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: CountryFlag.fromCountryCode(
                                languages[displayIndex].code,
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              languages[displayIndex].name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF2F6CE5)
                                  : const Color(0xFFEFEFEF),
                              borderRadius:
                                  BorderRadius.circular(isSelected ? 24 : 16),
                            ),
                            child: Row(
                              children: [
                                if (isSelected)
                                  const Icon(Icons.check,
                                      color: Colors.white, size: 16),
                                if (isSelected) const SizedBox(width: 6),
                                Text(
                                  isSelected ? 'Selected' : 'Select',
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey.shade700,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Continue',
              onPressed: () {
                if (selectedIndex < 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please select a language first.')),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SetUpProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
