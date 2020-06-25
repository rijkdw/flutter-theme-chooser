import 'package:themechanger/models/post.dart';

abstract class AbstractPostRepository {

  Future<List<Post>> getPosts();

}

class FakePostRepository extends AbstractPostRepository {
  @override
  Future<List<Post>> getPosts() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      const Post(
        title: 'First post',
        unix: 0,
        username: 'Rijk'
      ),
      const Post(
        title: 'Second post',
        unix: 0,
        username: 'Liza'
      ),
      const Post(
        title: 'Hello World!',
        unix: 0,
        username: 'Steve'
      ),
    ];
  }

}