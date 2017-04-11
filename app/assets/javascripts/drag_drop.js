$(document).ready(function(){

  $('.product_wrap').draggable( {
      containment: '#content',
      stack: '#shop div',
      cursor: 'move',
      cursorAt: {top: 50, left: 50},
      helper: function () {
        // debugger;
        // return $(this).clone(); //.find('div').css({zoom: '0.5'})
        // return $('<div>DRAG ME</div>').html( $(this).find('img').clone()  ).css({width: '100px', height: '100px', border: '1px solid red'})

        return $('<div>DRAG ME</div>').html( "DROP ME inside a list" ).css({width: '80px', height: '80px', padding:"20px 5px",  borderRadius: '30px', backgroundColor: 'rgb(133, 27, 19)', color: 'white'})
      },

      //   return $('<div>DRAG ME</div>').html( $(this).find('.product_name').html() ).css({width: '80px', height: '80px', border: '1px solid red', borderRadius: '20px', backgroundColor: 'rgb(215, 109, 109)'})
      // },
      //
      //"clone",
      start: function (e, ui) {
        // debugger;
        //
        //
        // ui.helper.animate({
        //   width: '150px',
        //   height: '150px'
        // // width:'-=50',
        // // height:'-=100'
        // });
        // $(ui.helper).children().animate({
        //   // width:'50%',
        //   height:'50%'
        // });





    //
    // $(ui.helper).find('img').animate({
    //   width:'50%',
    //   height:'50%'
    // });



    },
    scroll: false
      // revert: true,
      // stop: resetProduct
    } );

})
