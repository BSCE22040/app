import 'package:flutter/material.dart';

void main() {
  runApp(const SynthFlowApp());
}

class SynthFlowApp extends StatelessWidget {
  const SynthFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AZ FLOW AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width to make layout responsive
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        elevation: 0,
        title: Row(
          children: [
            Icon(
              Icons.auto_awesome,
              color: Colors.indigo[400],
              size: 24,
            ),
            const SizedBox(width: 8),
            const Text(
              'SynthFlow.ai',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: isMobile
            ? [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    // Show drawer or bottom sheet menu
                    Scaffold.of(context).openDrawer();
                  },
                )
              ]
            : [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Pricing',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Docs',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6366F1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Sign In'),
                  ),
                ),
              ],
      ),
      drawer: isMobile
          ? Drawer(
              child: Container(
                color: const Color(0xFF1F2937),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.indigo[800],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.auto_awesome,
                                color: Colors.white,
                                size: 24,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'SynthFlow.ai',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      title: const Text('Pricing', style: TextStyle(color: Colors.white)),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Docs', style: TextStyle(color: Colors.white)),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Sign In', style: TextStyle(color: Colors.white)),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Hero Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Power Your Apps with AI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 32 : 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Build, deploy, and manage AI workflows with a simple, powerful platform.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Get Started Free',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.indigo.withOpacity(0.3)),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.dashboard,
                          size: 80,
                          color: Colors.indigo[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Features Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Key Features',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildFeatureGrid(context, isMobile, isTablet),
                  ],
                ),
              ),

              // CTA Section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF6366F1),
                      const Color(0xFF4F46E5),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Ready to build with AI?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 24 : 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Join thousands of developers building the future with SynthFlow.ai',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16,
                      runSpacing: 16,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF6366F1),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Start Free Trial',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Contact Sales',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Footer
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                color: const Color(0xFF0F172A),
                child: Column(
                  children: [
                    _buildFooterContent(isMobile),
                    const SizedBox(height: 32),
                    const Divider(color: Colors.white24),
                    const SizedBox(height: 24),
                    isMobile
                        ? Column(
                            children: [
                              const Text(
                                '© 2025 SynthFlow.ai. All rights reserved.',
                                style: TextStyle(color: Colors.white70),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.facebook, color: Colors.white70),
                                  const SizedBox(width: 16),
                                  Icon(Icons.blur_circular, color: Colors.white70),
                                  const SizedBox(width: 16),
                                  Icon(Icons.linked_camera, color: Colors.white70),
                                  const SizedBox(width: 16),
                                  Icon(Icons.camera_alt, color: Colors.white70),
                                ],
                              ),
                            ],
                          )
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '© 2025 SynthFlow.ai. All rights reserved.',
                                style: TextStyle(color: Colors.white70),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.facebook, color: Colors.white70),
                                  SizedBox(width: 16),
                                  Icon(Icons.blur_circular, color: Colors.white70),
                                  SizedBox(width: 16),
                                  Icon(Icons.linked_camera, color: Colors.white70),
                                  SizedBox(width: 16),
                                  Icon(Icons.camera_alt, color: Colors.white70),
                                ],
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureGrid(BuildContext context, bool isMobile, bool isTablet) {
    final features = [
      {
        'icon': Icons.auto_awesome,
        'title': 'AI Workflows',
        'description': 'Create complex AI workflows with our visual editor'
      },
      {
        'icon': Icons.integration_instructions,
        'title': 'API Integration',
        'description': 'Connect to your favorite AI models and services'
      },
      {
        'icon': Icons.speed,
        'title': 'High Performance',
        'description': 'Built for scale with enterprise-grade reliability'
      },
      {
        'icon': Icons.developer_mode,
        'title': 'Developer Friendly',
        'description': 'Comprehensive SDKs and documentation'
      },
      {
        'icon': Icons.analytics,
        'title': 'Analytics',
        'description': 'Monitor and optimize your AI workflows'
      },
      {
        'icon': Icons.security,
        'title': 'Security',
        'description': 'Enterprise-grade security and compliance'
      },
    ];

    if (isMobile) {
      // For mobile: display as a column of cards
      return Column(
        children: features.map((feature) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildFeatureCard(
              feature['icon'] as IconData,
              feature['title'] as String,
              feature['description'] as String,
            ),
          );
        }).toList(),
      );
    } else if (isTablet) {
      // For tablet: display as a 2x3 grid
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return _buildFeatureCard(
            feature['icon'] as IconData,
            feature['title'] as String,
            feature['description'] as String,
          );
        },
      );
    } else {
      // For desktop: display as a 3x2 grid
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return _buildFeatureCard(
            feature['icon'] as IconData,
            feature['title'] as String,
            feature['description'] as String,
          );
        },
      );
    }
  }

  Widget _buildFeatureCard(IconData icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.indigo[400],
            size: 32,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterContent(bool isMobile) {
    final footerSections = [
      {
        'title': 'Product',
        'links': ['Features', 'Pricing', 'Documentation', 'API Reference']
      },
      {
        'title': 'Company',
        'links': ['About', 'Blog', 'Careers', 'Contact']
      },
      {
        'title': 'Legal',
        'links': ['Privacy Policy', 'Terms of Service', 'Cookie Policy']
      },
    ];

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company logo and description
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.auto_awesome,
                    color: Colors.indigo[400],
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'SynthFlow.ai',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'The ultimate platform for AI workflows',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 32),
            ],
          ),

          // Footer sections as expansion panels for mobile
          ...footerSections.map((section) {
            return ExpansionTile(
              title: Text(
                section['title'] as String,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              children: (section['links'] as List<String>).map((link) {
                return ListTile(
                  dense: true,
                  title: Text(
                    link,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  onTap: () {},
                );
              }).toList(),
            );
          }).toList(),
        ],
      );
    } else {
      // Desktop layout
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Company logo and description
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.auto_awesome,
                    color: Colors.indigo[400],
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'SynthFlow.ai',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'The ultimate platform for AI workflows',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),

          // Footer link columns
          ...footerSections.map((section) {
            return _buildFooterColumn(
              section['title'] as String,
              section['links'] as List<String>,
            );
          }).toList(),
        ],
      );
    }
  }

  Widget _buildFooterColumn(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              link,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ),
      ],
    );
  }
}