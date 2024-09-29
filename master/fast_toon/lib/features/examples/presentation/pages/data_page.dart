// 프레젠테이션 계층의 페이지 클래스입니다. 데이터를 화면에 표시합니다.

// class DataPage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     final dataAsyncValue = watch(dataProvider);

//     return Scaffold(
//       appBar: AppBar(title: Text('Data Page')),
//       body: dataAsyncValue.when(
//         loading: () => CircularProgressIndicator(),
//         error: (err, stack) => Text('Error: $err'),
//         data: (data) => Text('Data: ${data.value}'),
//       ),
//     );
//   }
// }
