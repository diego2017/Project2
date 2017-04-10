
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
      var $listItemQuantityInput = $("<input>").attr("value", listItem.quantity)
                                               .attr("id", listItem.id);
      $productInfo.append($productName).append($productPrice).append($listItemQuantityInput);

      var $productImg = $("<div>").addClass("cart_product_img")
                               .css("background-image", 'url(' + product.img_src + ')')
                               .css('background-size', 'contain')
                               .css('background-repeat', 'no-repeat')
                               .css('background-position', 'center center');

      $listItem.append($productImg).append($productInfo).attr("id", listItem.id);

      $shoppingList.append($listItem);
    });
  };

  var getListItems = function($shoppingList, shoppingListID){
    $.ajax({
      url: "./list_items/" + shoppingListID,
      method: "GET",
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

      $("#shopping_lists").append($shoppingList);

    });

    $shoppingCartUpdate = $("<button>").html("Save").attr("id", "updateShoppingCart");
    $("#shopping_lists").append($shoppingCartUpdate);

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

  $(document).on("click", "#updateShoppingCart", function() {
    var listItems = $(".list_item");
    _.each(listItems, function(listItem) {

      var newQuantity = $(listItem).find("input").val();
      var listItemID = $(listItem).attr("id");

      debugger

      $.ajax({
        url: "./list_items/" + listItemID,
        method: "PATCH",
        data: {
          format: "json",
        },
        success: displayShoppingLists,
        error: function(e) {
          console.log(e);
        }
      });

      debugger
    });
  });

  // setInterval(function() {
    getShoppingLists();
  // }, 2000);

}); // document.ready
