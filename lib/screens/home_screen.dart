import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/connectivity_provider.dart';
import '../providers/user_provider.dart';
import '../widgets/home/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    _setupProviders();
  }

  void _initializeAnimation() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  void _setupProviders() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider = context.read<UserProvider>();
      final connectivityProvider = context.read<ConnectivityProvider>();
      
      // Initial fetch
      userProvider.fetchUsers().then((_) {
        if (mounted) _animationController.forward();
      });

      // Listen for connectivity changes to refetch data when internet is restored
      connectivityProvider.addListener(() {
        if (connectivityProvider.isConnected && 
            userProvider.users.isEmpty && 
            !userProvider.isLoading) {
          userProvider.fetchUsers().then((_) {
            if (mounted) _animationController.forward();
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _disposeResources();
    super.dispose();
  }

  void _disposeResources() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _animationController.dispose();
  }

  void _onSearchChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: HomeAppBar(searchFocusNode: _searchFocusNode),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            UserSearchBar(
              controller: _searchController,
              focusNode: _searchFocusNode,
              onChanged: _onSearchChanged,
            ),
            const SectionTitle(title: 'Users'),
            Expanded(
              child: UsersGrid(
                animationController: _animationController,
                searchFocusNode: _searchFocusNode,
                hasSearchQuery: _searchController.text.isNotEmpty,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
