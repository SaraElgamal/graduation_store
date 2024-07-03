abstract class ProductStates{}
class InitialStateProduct extends ProductStates{}

class PostAddLoadingProduct extends ProductStates{}
class PostAddSuccessProduct extends ProductStates{}
class PostAddErrorProduct extends ProductStates{}


class GetAllProductsLoadingProduct extends ProductStates{}
class GetAllProductsSuccessProduct extends ProductStates{}
class GetAllProductsErrorProduct extends ProductStates{}


class DeleteProductsLoadingProduct extends ProductStates{}
class DeleteProductsSuccessProduct extends ProductStates{}
class DeleteProductsErrorProduct extends ProductStates{}


class DeleteDetailsLoadingProduct extends ProductStates{}
class DeleteDetailsSuccessProduct extends ProductStates{}
class DeleteDetailsErrorProduct extends ProductStates{}


class DeleteFavLoadingProduct extends ProductStates{}
class DeleteFavSuccessProduct extends ProductStates{}
class DeleteFavErrorProduct extends ProductStates{}

class DeleteAllFavLoadingProduct extends ProductStates{}
class DeleteAllFavSuccessProduct extends ProductStates{}
class DeleteAllFavErrorProduct extends ProductStates{}



class PostLoadingFavState extends ProductStates{}
class PostSuccessFavState extends ProductStates{}
class PostErrorFavState extends ProductStates{}

class GetLoadingFavState extends ProductStates{}
class GetSuccessFavState extends ProductStates{}
class GetErrorFavState extends ProductStates{}

