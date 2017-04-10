$(document).ready(function() {

  var currentDisplayedProducts = [];

  $(document).on("click", ".category", function(e){
    var term = $(this).html();
    getProducts(term);
  });

  var getProducts = function(searchTerm){
    $.ajax({
      url: "./products/" + searchTerm,
      method: "GET",
      data: {
        format: "json",
      },
      success: displayProducts
    });
  };

  var displayProducts = function(data) {
    currentDisplayedProducts = data;

    _.each(currentDisplayedProducts, function(product) {
      $product_wrap = $("<div>").addClass("product_wrap");
      $("#products_display").append($product_wrap);

      $product_min_info = $("<div>").addClass("product_min_info");

      $product_name = $("<div>").addClass("product_name");
      $product_name.html(product.name);

      $product_price = $("<div>").addClass("product_price")
                                 .attr("style", "float: right;");
      $product_price.html("$" + product.price);

      $product_min_info.append($product_name)
                       .append($product_price);

      $product_image = $("<img>").addClass("product_image").attr("src", product.img_src);

      $product_wrap.append($product_image)
                   .append($product_min_info);
    }); // _.each

  } // displayProducts

}); // document.ready
