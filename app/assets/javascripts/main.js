

var products = [];

$(document).ready(function() {

  // css stuffs
  var displayHeight = window.innerHeight - 75;
  $("#shopping_cart").css("height", displayHeight + "px");
  $("#shop").css("height", displayHeight + "px");


  // -----------------------------------

  var getProducts = function(){

    $.ajax({
      url: "/products",
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
    }); // ajax

  }; // getProducts

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

    }); // each

  }; // displayListItems


  var getListItems = function($shoppingList, shoppingListID){

    $.ajax({
      url: "/list_items/" + shoppingListID,
      method: "GET",
      data: {
        format: "json",
      },
      success: function(data){
        displayListItems(data, $shoppingList);
      },
      error: function(e) {
        console.log(e.responseText);
      },
    }); // ajax
  }; // getListItems

  var createNewListItem = function(productID, shoppingListID) {
    $.ajax({
      url: "/list_items/new",
      method: "POST",
      data: {
        product_id: productID,
        shopping_list_id: shoppingListID
      },
      success: function() {
        $("#shopping_lists").empty();
        getShoppingLists();
      },
      error: function(e) {
        console.log(e);
      }
    }); // ajax

  }; // createNewListItem (called by drag-drop product from shop)


  var createEmptyListItem = function ( shoppingList ){
    var emptyItem =  $('<div>' + ' Add item here ! ' + '</div>')
      .addClass('empty')
      .attr( 'listId', shoppingList.id )
      .droppable( {

        accept: '#shop div',

        hoverClass: 'hovered',

        over: function () {
          console.log('hovering over!');
        },

        drop: function (event, ui) {
          var productID = ui.draggable.attr('prod_id')
          var shoppingListID = $(this).attr('listid')
          console.log ('You moved product: ' + productID + ', to list: ' + shoppingListID)
          // function creating AJAX Post request to create new ListItem according to ShoppingList.id
          createNewListItem(productID, shoppingListID);
        }

      }); // .dropable

    $shoppingList.append(emptyItem);
  }; // createEmptyListItem (gray bar in )


  var displayShoppingLists = function(shoppingLists) {
    _.each(shoppingLists, function(shoppingList) {
      $shoppingList = $("<div>").addClass("shopping_list");
      $shoppingListName = $("<h3>").addClass("shopping_list_name")
                                    .html(shoppingList.name);
      $shoppingList.append($shoppingListName);

      getListItems($shoppingList, shoppingList.id);

      //

      $("#shopping_lists").append($shoppingList);

      createEmptyListItem ( shoppingList );

    });

    $shoppingCartUpdate = $("<button>").html("Save").attr("id", "updateShoppingCart");
    $("#shopping_lists").append($shoppingCartUpdate);

  };

  var getShoppingLists = function(){

    $.ajax({
      url: "/shopping_lists",
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

  // Update quantities
  $(document).on("click", "#updateShoppingCart", function() {
    var listItems = $(".list_item");
    var newQuantities = {};
    _.each(listItems, function(listItem) {
      var newQuantity = $(listItem).find("input").val();
      var listItemID = $(listItem).attr("id");

      $.ajax({
        url: "/list_items/" + listItemID,
        method: "PATCH",
        data: newQuantity,
        success: displayShoppingLists,
        error: function(e) {
          console.log(e);
        }
      });

      // newQuantities[listItemID] = parseInt(newQuantity);
    });
    // console.log('token', $('meta[name="csrf-token"]').attr('content') );
    var data = {newQuantities}
    $.ajax({
      url: "/list_items/buld_update",
      method: "PATCH",
      data: data,  //newQuantity,
      success: displayShoppingLists,
      error: function(e) {
        console.log(e);
      }
    });

  });

  // setInterval(function() {
    getShoppingLists();
  // }, 2000);

}); // document.ready
