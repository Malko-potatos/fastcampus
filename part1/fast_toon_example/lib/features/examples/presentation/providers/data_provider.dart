// Riverpod을 사용한 프로바이더 설정입니다. 의존성 주입과 상태 관리를 처리합니다.

// final dataProvider = FutureProvider<DataEntity>((ref) async {
//   final fetchDataUseCase = ref.read(fetchDataUseCaseProvider);
//   return await fetchDataUseCase.execute();
// });

// final fetchDataUseCaseProvider = Provider<FetchDataUseCase>((ref) {
//   final repository = ref.read(dataRepositoryProvider);
//   return FetchDataUseCase(repository);
// });

// final dataRepositoryProvider = Provider<IDataRepository>((ref) {
//   final remoteDataSource = ref.read(remoteDataSourceProvider);
//   return DataRepository(remoteDataSource);
// });

// final remoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
//   final networkService = ref.read(networkServiceProvider);
//   return RemoteDataSource(networkService);
// });

// final networkServiceProvider = Provider<NetworkService>((ref) {
//   return NetworkService();
// });
