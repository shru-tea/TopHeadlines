import 'package:news_reader/models/category_names.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = List<CategoryModel>();
  CategoryModel categoryModel = CategoryModel();

  //1st category->Business
  categoryModel.categoryName = "Business";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1444653614773-995cb1ef9efa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1510&q=80";
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  //2nd category->Entertainement
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1499364615650-ec38552f4f34?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=666&q=80";
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  //3rd category->Health
  categoryModel.categoryName = "Health";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1542736667-069246bdbc6d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80";
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  //4rd category->General
  categoryModel.categoryName = "General";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1494059980473-813e73ee784b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=749&q=80";
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  //5th category->Science
  categoryModel.categoryName = "Science";
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1567427018141-0584cfcbf1b8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  //6th category -> Technology
  categoryModel.categoryName = 'Technology';
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1518770660439-4636190af475?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  categories.add(categoryModel);

  categoryModel = CategoryModel();
  //7th technology-> Sports
  categoryModel.categoryName = 'Sports';
  categoryModel.imageURL =
      "https://images.unsplash.com/photo-1471295253337-3ceaaedca402?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=748&q=80";
  categories.add(categoryModel);

  return categories;
}
