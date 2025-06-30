import 'package:flutter/material.dart';
import 'custom_text_form_field.dart';
import 'form_section.dart';
import 'form_validators.dart';

class BasicInformationSection extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const BasicInformationSection({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Basic Information',
      children: [
        CustomTextFormField(
          controller: nameController,
          label: 'Full Name',
          hintText: 'Enter full name',
          validator: FormValidators.validateName,
        ),
        CustomTextFormField(
          controller: emailController,
          label: 'Email Address',
          hintText: 'Enter email address',
          keyboardType: TextInputType.emailAddress,
          validator: FormValidators.validateEmail,
        ),
        CustomTextFormField(
          controller: phoneController,
          label: 'Phone Number',
          hintText: 'Enter phone number',
          keyboardType: TextInputType.phone,
          validator: FormValidators.validatePhone,
          isLastField: true,
        ),
      ],
    );
  }
}
