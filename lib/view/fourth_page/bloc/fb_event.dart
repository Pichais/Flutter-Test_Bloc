abstract class FbEventBloc{}

class LoadDataBloc extends FbEventBloc{}

class ClickLike extends FbEventBloc{
  int id;
  ClickLike({required this.id});
}

