var products = [];

$(document).ready(function() {
  // css stuffs
  var displayHeight = window.innerHeight - 75;
  $("#shopping_lists").css("height", (displayHeight - 45) + "px");
  $("#shop").css("height", displayHeight + "px");
  // -----------------------------------
  // Display watermark when off-focus
  var watermark = 'Add Shopping List';
  $('#new_shopping_list_input').blur(function(){
        if ($(this).val().length == 0){
            $(this).val(watermark);
        }
    });
  $('#new_shopping_list_input').focus(function(){
      if ($(this).val() == watermark){
          $(this).val('');
      }
  });

  // eventListener for creating new ShoppingList
  $(document).on("click", "#new_shopping_list_submit", function(){
    var newShoppingListName = $("#new_shopping_list_input").val();

    $.ajax({
      url: "/user/new_shopping_list",
      method: "POST",
      data: {newShoppingListName: newShoppingListName},
      success: function(data){
        getShoppingLists(data);
      },
      error: function(e) {
        console.log(e.responseText);
      }
    });
  }); // create new shopping list

  // Dropbox for creating new ListItem for ShoppingList
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
  }; // createEmptyListItem

  // Action when product was dropped on shoppingList (called from createEmptyListItem)
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

    $("#shopping_lists").empty();

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
                                     .html(listItem.product.name);
        var $productPrice = $("<div>").addClass("cart_product_price")
                                  .html("$" + listItem.product.price);
        var $listItemQuantityInput = $("<input>").attr("value", listItem.quantity)
                                                 .attr("id", listItem.id);
        $productInfo.append($productName).append($productPrice).append($listItemQuantityInput);

        var $productImg = $("<div>").addClass("cart_product_img")
                                 .css("background-image", 'url(/assets/' + product.full_url + ')');
                                //  .css("background-image", 'url(' + listItem.product.img_src + ')');

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

  var getShoppingLists = function(shoppingLists){
    if(shoppingLists == undefined) {
      $.ajax({
        url: "/shopping_lists",
        method: "GET",
        data: {
          format: "json",
        },
        success: function(data) {
          // Display shop only if not logged in
          if( data == undefined ) {
            $("#shopping_lists").hide();
            $("#cart_menu").hide();
            $("#shop").removeClass("col-md-8").addClass("col-md-12");
          } else {
            $("#shop").removeClass("col-md-12").addClass("col-md-8");
            displayData(data);
          }
        },
        error: function(e) {
          console.log(e);
        }
      });
    };
    displayData(shoppingLists);
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
