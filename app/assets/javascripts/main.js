
var products = [];

$(document).ready(function() {

  var getProducts = function(){

    $.ajax({
      url: "./products",
      method: "GET",
      data: {
        format: "json",
      },
      success: function(data){
        products = data;
      },
      error: function(e) {
        console.log(e.responseText);
      }
    });
  };

  getProducts();

  var displayListItems = function(listItems, $shoppingList) {

    _.each(listItems, function(listItem) {
      $listItem = $("<div>").addClass("list_item");

      var product = _.findWhere(products, {id: listItem.product_id});

      var $productInfo = $("<div>").addClass("cart_product_info");
      var $productName = $("<div>").addClass("cart_product_name")
                               .html(product.name);
      var $productPrice = $("<div>").addClass("cart_product_price")
                                .html("$" + product.price);
      $productInfo.append($productName).append($productPrice);

      var $productImg = $("<div>").addClass("cart_product_img")
                               .css("background-image", 'url("' + product.img_src + '")');
      $listItem.append($productImg).append($productInfo);

      $shoppingList.append($listItem);
    });
  };

  var getListItems = function($shoppingList, shoppingListID){
    $.ajax({
      url: "./list_items/" + shoppingListID,
      // method: "GET",
      data: {
        format: "json",
      },
      success: function(data){
        displayListItems(data, $shoppingList);
      },
      error: function(e) {
        console.log(e.responseText);
      }
    });
  };

  var displayShoppingLists = function(shoppingLists) {
    _.each(shoppingLists, function(shoppingList) {
      $shoppingList = $("<div>").addClass("shopping_list");
      $shoppingListName = $("<div>").addClass("shopping_listName")
                                    .html(shoppingList.name);
      $shoppingList.append($shoppingListName);

      getListItems($shoppingList, shoppingList.id);

      $("#shopping_cart").append($shoppingList);

    });
  };

  var getShoppingLists = function(){
    $.ajax({
      url: "./shopping_lists",
      method: "GET",
      data: {
        format: "json",
      },
      success: displayShoppingLists,
      error: function(e) {
        console.log(e);
      }
    });
  };

  // setInterval(function() {
    getShoppingLists();
  // }, 2000);

}); // document.ready
