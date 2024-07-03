abstract class ShoppingStates{}
class InitialShoppingState extends ShoppingStates{}



class PostLoadingCardState extends ShoppingStates{}
class PostSuccessCardState extends ShoppingStates{}
class PostErrorCardState extends ShoppingStates{}

class PostLoadingPaymentState extends ShoppingStates{}
class PostSuccessPaymentState extends ShoppingStates{}
class PostErrorPaymentState extends ShoppingStates{}



class GetLoadingCardState extends ShoppingStates{}
class GetSuccessCardState extends ShoppingStates{}
class GetErrorCardState extends ShoppingStates{}


class DeleteLoadingCardState extends ShoppingStates{}
class DeleteSuccessCardState extends ShoppingStates{}
class DeleteErrorCardState extends ShoppingStates{}


class DeleteAllLoadingCardState extends ShoppingStates{}
class DeleteAllSuccessCardState extends ShoppingStates{}
class DeleteAllErrorCardState extends ShoppingStates{}



class SuccessProcessing extends ShoppingStates{}
