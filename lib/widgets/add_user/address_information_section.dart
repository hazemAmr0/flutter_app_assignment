import 'package:flutter/material.dart';
import 'custom_text_form_field.dart';
import 'form_section.dart';
import 'form_validators.dart';

class AddressInformationSection extends StatelessWidget {
  final TextEditingController streetController;
  final TextEditingController suiteController;
  final TextEditingController cityController;
  final TextEditingController zipcodeController;

  const AddressInformationSection({
    Key? key,
    required this.streetController,
    required this.suiteController,
    required this.cityController,
    required this.zipcodeController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Address Information',
      children: [
        CustomTextFormField(
          controller: streetController,
          label: 'Street',
          hintText: 'Enter street address',
          validator: FormValidators.validateOptional,
        ),
        CustomTextFormField(
          controller: suiteController,
          label: 'Suite/Apartment',
          hintText: 'Enter suite or apartment',
          validator: FormValidators.validateOptional,
        ),
        CustomTextFormField(
          controller: cityController,
          label: 'City',
          hintText: 'Enter city',
          validator: FormValidators.validateOptional,
        ),
        CustomTextFormField(
          controller: zipcodeController,
          label: 'Zipcode',
          hintText: 'Enter zipcode',
          validator: FormValidators.validateOptional,
          isLastField: true,
        ),
      ],
    );
  }
}
