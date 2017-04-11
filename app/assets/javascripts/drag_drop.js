$(document).ready(function(){

  $('.product_wrap').draggable( {
      containment: '#content',
      stack: '#shop div',
      cursor: 'move',
      helper: "clone",
      scroll: false
      // revert: true,
      // stop: resetProduct
    } );

})
