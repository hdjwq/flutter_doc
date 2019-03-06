class ItemLK{
    ItemLK(
      this.label,
      this.key
    ):assert(label!=null),assert(key!=null);
    final String label;
    final String key;
}

class ListDataModel<T>{
    ListDataModel({
        this.data,
        this.err
    });
    List<T> data;
    final bool err;
} //list数据模型