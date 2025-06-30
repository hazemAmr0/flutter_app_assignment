import 'package:flutter/material.dart';
import 'custom_text_form_field.dart';
import 'form_section.dart';
import 'form_validators.dart';

class AdditionalInformationSection extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController websiteController;

  const AdditionalInformationSection({
    Key? key,
    required this.usernameController,
    required this.websiteController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Additional Information',
      children: [
        CustomTextFormField(
          controller: usernameController,
          label: 'Username',
          hintText: 'Enter username',
          validator: FormValidators.validateUsername,
        ),
        CustomTextFormField(
          controller: websiteController,
          label: 'Website',
          hintText: 'Enter website URL',
          keyboardType: TextInputType.url,
          validator: FormValidators.validateOptional,
          isLastField: true,
        ),
      ],
    );
  }
}
