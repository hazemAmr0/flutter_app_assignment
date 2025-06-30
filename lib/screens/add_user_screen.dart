import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../widgets/add_user/index.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Text controllers
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _websiteController = TextEditingController();
  final _streetController = TextEditingController();
  final _suiteController = TextEditingController();
  final _cityController = TextEditingController();
  final _zipcodeController = TextEditingController();
  final _companyNameController = TextEditingController();
  final _companyCatchPhraseController = TextEditingController();
  final _companyBsController = TextEditingController();

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  void _disposeControllers() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _websiteController.dispose();
    _streetController.dispose();
    _suiteController.dispose();
    _cityController.dispose();
    _zipcodeController.dispose();
    _companyNameController.dispose();
    _companyCatchPhraseController.dispose();
    _companyBsController.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final userProvider = context.read<UserProvider>();
      
      final newUser = UserCreationService.createUser(
        existingUsers: userProvider.users,
        name: _nameController.text,
        username: _usernameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        website: _websiteController.text,
        street: _streetController.text,
        suite: _suiteController.text,
        city: _cityController.text,
        zipcode: _zipcodeController.text,
        companyName: _companyNameController.text,
        companyCatchPhrase: _companyCatchPhraseController.text,
        companyBs: _companyBsController.text,
      );

      userProvider.addUser(newUser);

      if (mounted) {
        _showSuccessMessage();
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        _showErrorMessage('Failed to add user. Please try again.');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('User added successfully!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppBar(screenWidth),
      body: _buildBody(screenWidth),
    );
  }

  AppBar _buildAppBar(double screenWidth) {
    return AppBar(
      title: Text(
        'Add New User',
        style: TextStyle(
          fontSize: screenWidth > 1200 ? 24 : screenWidth > 600 ? 22 : 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.5,
      iconTheme: const IconThemeData(color: Colors.black87),
    );
  }

  Widget _buildBody(double screenWidth) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(screenWidth > 600 ? 24 : 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BasicInformationSection(
                    nameController: _nameController,
                    emailController: _emailController,
                    phoneController: _phoneController,
                  ),
                  AdditionalInformationSection(
                    usernameController: _usernameController,
                    websiteController: _websiteController,
                  ),
                  AddressInformationSection(
                    streetController: _streetController,
                    suiteController: _suiteController,
                    cityController: _cityController,
                    zipcodeController: _zipcodeController,
                  ),
                  CompanyInformationSection(
                    companyNameController: _companyNameController,
                    companyCatchPhraseController: _companyCatchPhraseController,
                    companyBsController: _companyBsController,
                  ),
                ],
              ),
            ),
          ),
          ActionButtons(
            onCancel: () => Navigator.pop(context),
            onSubmit: _submitForm,
            isLoading: _isLoading,
          ),
        ],
      ),
    );
  }
}
