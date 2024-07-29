import 'package:fast_toon/features/webtoon/presentation/pages/WebtoonByDayScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedDayProvider = StateProvider<String>((ref) {
  return '월요일';
});

class WebtoonScreen extends ConsumerWidget {
  const WebtoonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDay = ref.watch(selectedDayProvider);

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // 메뉴 버튼 동작 정의
            },
          ),
          title: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedDay,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
              dropdownColor: Colors.white,
              onChanged: (String? newValue) {
                ref.read(selectedDayProvider.notifier).state = newValue!;
                DefaultTabController.of(context)?.animateTo(
                  ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일']
                      .indexOf(newValue),
                );
              },
              items: <String>['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child:
                      Text(value, style: const TextStyle(color: Colors.black)),
                );
              }).toList(),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {
                // 검색 버튼 동작 정의
              },
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: '월요일'),
              Tab(text: '화요일'),
              Tab(text: '수요일'),
              Tab(text: '목요일'),
              Tab(text: '금요일'),
              Tab(text: '토요일'),
              Tab(text: '일요일'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WebtoonByDayScreen(day: '월요일'),
            WebtoonByDayScreen(day: '화요일'),
            WebtoonByDayScreen(day: '수요일'),
            WebtoonByDayScreen(day: '목요일'),
            WebtoonByDayScreen(day: '금요일'),
            WebtoonByDayScreen(day: '토요일'),
            WebtoonByDayScreen(day: '일요일'),
          ],
        ),
      ),
    );
  }
}
