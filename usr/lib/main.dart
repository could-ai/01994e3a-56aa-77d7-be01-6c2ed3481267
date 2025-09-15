import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cyber Attacks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white70),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      home: const CyberAttackScreen(),
    );
  }
}

class CyberAttackScreen extends StatelessWidget {
  const CyberAttackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Major Types of Cyber Attacks'),
        backgroundColor: const Color(0xFF1E1E1E),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAttackCategory(
              context,
              title: 'Executable-Based Cyber Attacks',
              description:
                  'These attacks involve malicious software (malware) that must be executed on a target system to cause damage. It relies on a user action or a system process to launch the malicious code.',
              attacks: executableAttacks,
              color: Colors.red.shade900,
            ),
            const SizedBox(height: 24),
            _buildAttackCategory(
              context,
              title: 'Network-Based Cyber Attacks',
              description:
                  "These attacks exploit vulnerabilities in a computer network's infrastructure or communication protocols. They operate by manipulating network traffic to disrupt services, intercept data, or gain unauthorized access.",
              attacks: networkAttacks,
              color: Colors.blue.shade900,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttackCategory(
    BuildContext context, {
    required String title,
    required String description,
    required List<Attack> attacks,
    required Color color,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 15),
            ),
          ),
          const Divider(height: 1),
          ...attacks.map((attack) => _buildAttackTile(context, attack)),
        ],
      ),
    );
  }

  Widget _buildAttackTile(BuildContext context, Attack attack) {
    return ListTile(
      leading: Icon(attack.icon, color: Colors.white70),
      title: Text(attack.name),
      subtitle: Text(
        attack.description,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
      ),
    );
  }
}

class Attack {
  final String name;
  final String description;
  final IconData icon;

  Attack({required this.name, required this.description, required this.icon});
}

final List<Attack> executableAttacks = [
  Attack(
    name: 'Trojan',
    description:
        'A program that looks safe but secretly does harmful things, like stealing data.',
    icon: Icons.security_rounded,
  ),
  Attack(
    name: 'Virus',
    description:
        'Harmful code that attaches to a program and spreads by infecting other programs.',
    icon: Icons.bug_report_rounded,
  ),
  Attack(
    name: 'Worm',
    description:
        'A self-replicating program that spreads automatically through networks.',
    icon: Icons.sync_alt_rounded,
  ),
  Attack(
    name: 'Spam',
    description:
        'Unwanted junk email that can carry harmful attachments like viruses or spyware.',
    icon: Icons.mail_outline_rounded,
  ),
];

final List<Attack> networkAttacks = [
  Attack(
    name: 'DoS/DDoS',
    description:
        'Overloads a network or website with traffic to make it unusable.',
    icon: Icons.network_check_rounded,
  ),
  Attack(
    name: 'Man-in-the-Middle (MitM)',
    description:
        'Secretly listens to or changes communication between two parties.',
    icon: Icons.hearing_rounded,
  ),
  Attack(
    name: 'Packet Sniffing',
    description:
        'Captures data traveling over a network to see private information.',
    icon: Icons.search_rounded,
  ),
  Attack(
    name: 'IP Spoofing',
    description:
        'Hides the attacker’s real identity by changing their IP address.',
    icon: Icons.location_off_rounded,
  ),
  Attack(
    name: 'DNS Spoofing',
    description:
        'Tricks users into visiting fake websites to steal personal information.',
    icon: Icons.public_off_rounded,
  ),
];
