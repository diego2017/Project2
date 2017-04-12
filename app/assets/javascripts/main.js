var products = [];

$(document).ready(function() {

  // css stuffs
  var displayHeight = window.innerHeight - 75;
  $("#shopping_lists").css("height", (displayHeight - 45) + "px");
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
    return emptyItem;
  }; // createEmptyListItem (gray bar in )

  // when product was dragged-and-dropped on shoppingList
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

  var displayData = function(shoppingLists) {

    var $shoppingLists = $("#shopping_lists");
    // display shoppingLists
    _.each(shoppingLists, function(shoppingList) {
      var $shoppingList = $("<div>").addClass("shopping_list")
                                    .attr("content_id", shoppingList.id);
      $shoppingLists.append($shoppingList);

      $shoppingListName = $("<h3>").addClass("shopping_list_name")
                                    .html(shoppingList.name);
      $shoppingList.append($shoppingListName);

      // display listItems in each shoppingList
      _.each(shoppingList.list_items, function(listItem) {

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
                                 .css("background-image", 'url(' + product.img_src + ')');

        $listItem.append($productImg).append($productInfo).attr("content_id", listItem.id);
        $shoppingList.append($listItem);

      }); // each

      // drop-box for drag-and-drop at the end of each shoppingList
      $shoppingList.append( createEmptyListItem(shoppingList) );
    }); // each

    // "Save" button for updating listItems quantities
    $shoppingCartUpdate = $("<button>").html("Save")
              .addClass("ui button primary").attr("id", "updateShoppingCart");
    $shoppingLists.append($shoppingCartUpdate);
  };

  var getShoppingLists = function(){
    $("#shopping_lists").empty();
    $.ajax({
      url: "/shopping_lists",
      method: "GET",
      data: {
        format: "json",
      },
      success: displayData,
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
      var newQuantity = parseInt($(listItem).find("input").val());
      var listItemID = parseInt($(listItem).attr("content_id"));
      newQuantities[listItemID] = newQuantity;
    });

    $.ajax({
      url: "/list_items/buld_update",
      method: "PATCH",
      data: {newQuantities: newQuantities},
      success: getShoppingLists,
      error: function(e) {
        console.log(e);
      }
    });

  });

  getShoppingLists();

}); // document.ready
