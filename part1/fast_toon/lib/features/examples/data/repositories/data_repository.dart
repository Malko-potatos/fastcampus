// 리포지토리 클래스입니다. 데이터 소스에서 데이터를 가져와 엔티티로 변환하여 도메인 계층에 제공합니다.
// class DataRepository implements IDataRepository {
//   final RemoteDataSource remoteDataSource;

//   DataRepository(this.remoteDataSource);

//   @override
//   Future<DataEntity> getData() async {
//     final data = await remoteDataSource.fetchData();
//     return DataEntity(data);
//   }
// }