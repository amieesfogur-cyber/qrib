import 'package:flutter/material.dart';

void main() {
  runApp(const QribApp());
}

class QribApp extends StatelessWidget {
  const QribApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRIB | قريب',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF7F8FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF1744),
          brightness: Brightness.light,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final pages = const [
    HomeFeed(),
    DiscoverPage(),
    PublishPage(),
    MessagesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(child: pages[currentIndex]),
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() => currentIndex = index);
          },
          indicatorColor: const Color(0xFFFFE1E7),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            NavigationDestination(
              icon: Icon(Icons.explore_outlined),
              selectedIcon: Icon(Icons.explore),
              label: 'اكتشف',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_circle_outline, size: 30),
              selectedIcon: Icon(Icons.add_circle, size: 30),
              label: 'نشر',
            ),
            NavigationDestination(
              icon: Icon(Icons.chat_bubble_outline),
              selectedIcon: Icon(Icons.chat_bubble),
              label: 'الرسائل',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: 'الملف',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Color(0xFFFF1744)),
                const SizedBox(width: 4),
                const Text(
                  'الدار البيضاء',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFF1744), Color(0xFFFF4D6D)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.local_fire_department,
                    color: Colors.white, size: 30),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qrib Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'شوف شنو واقع قريب منك دابا',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios,
                    color: Colors.white, size: 18),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 105,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              children: const [
                _Story(title: 'نشر جديد', icon: Icons.add),
                _Story(title: 'Qrib Now', icon: Icons.local_fire_department),
                _Story(title: 'قريب منك', icon: Icons.location_on),
                _Story(title: 'أكل ومطاعم', icon: Icons.restaurant),
                _Story(title: 'فعاليات', icon: Icons.event),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              'منشورات قريبة منك',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: PostCard(
            user: 'Youssef B.',
            location: 'الدار البيضاء • 1.2 كم',
            text: 'أجواء رائعة اليوم في عين الذئاب 😍 شكون قريب هنا؟',
            icon: Icons.waves,
          ),
        ),
        const SliverToBoxAdapter(
          child: PostCard(
            user: 'Sara M.',
            location: 'الحي المحمدي • 2.1 كم',
            text: 'لقيت واحد المكان زوين للقهوة ☕ واش كاين شي حد قريب؟',
            icon: Icons.coffee,
          ),
        ),
      ],
    );
  }
}

class _Story extends StatelessWidget {
  final String title;
  final IconData icon;

  const _Story({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 78,
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFFFE1E7),
              border: Border.all(
                color: const Color(0xFFFF1744),
                width: 2,
              ),
            ),
            child: Icon(icon, color: const Color(0xFFFF1744), size: 28),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final String user;
  final String location;
  final String text;
  final IconData icon;

  const PostCard({
    super.key,
    required this.user,
    required this.location,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFFFFE1E7),
                  child: Icon(Icons.person, color: Color(0xFFFF1744)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(location,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
                const Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: Text(text, style: const TextStyle(fontSize: 15)),
            ),
            const SizedBox(height: 12),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFFE9ECF5),
              ),
              child: Center(
                child: Icon(icon, size: 65, color: const Color(0xFFFF1744)),
              ),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.favorite_border, color: Color(0xFFFF1744)),
                SizedBox(width: 5),
                Text('0'),
                SizedBox(width: 22),
                Icon(Icons.chat_bubble_outline),
                SizedBox(width: 5),
                Text('0'),
                Spacer(),
                Icon(Icons.share_outlined),
                SizedBox(width: 18),
                Icon(Icons.bookmark_border),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('اكتشف 🔎', style: TextStyle(fontSize: 28)),
    );
  }
}

class PublishPage extends StatelessWidget {
  const PublishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('نشر ➕', style: TextStyle(fontSize: 28)),
    );
  }
}

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('الرسائل 💬', style: TextStyle(fontSize: 28)),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('الملف الشخصي 👤', style: TextStyle(fontSize: 28)),
    );
  }
}
