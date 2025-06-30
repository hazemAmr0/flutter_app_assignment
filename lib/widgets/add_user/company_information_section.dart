import 'package:flutter/material.dart';
import 'custom_text_form_field.dart';
import 'form_section.dart';
import 'form_validators.dart';

class CompanyInformationSection extends StatelessWidget {
  final TextEditingController companyNameController;
  final TextEditingController companyCatchPhraseController;
  final TextEditingController companyBsController;

  const CompanyInformationSection({
    Key? key,
    required this.companyNameController,
    required this.companyCatchPhraseController,
    required this.companyBsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Company Information',
      children: [
        CustomTextFormField(
          controller: companyNameController,
          label: 'Company Name',
          hintText: 'Enter company name',
          validator: FormValidators.validateOptional,
        ),
        CustomTextFormField(
          controller: companyCatchPhraseController,
          label: 'Company Slogan',
          hintText: 'Enter company slogan',
          validator: FormValidators.validateOptional,
        ),
        CustomTextFormField(
          controller: companyBsController,
          label: 'Business Description',
          hintText: 'Enter business description',
          validator: FormValidators.validateOptional,
          isLastField: true,
        ),
      ],
    );
  }
}
