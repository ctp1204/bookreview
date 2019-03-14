$(document).on('turbolinks:load', function($) {
    "use strict";
    var mainApp = {

        main_fun: function () {
            /*====================================
            METIS MENU
            ======================================*/
            $('#main-menu').metisMenu();

            /*====================================
              LOAD APPROPRIATE MENU BAR
           ======================================*/
            $(window).bind("load resize", function () {
                if ($(this).width() < 768) {
                    $('div.sidebar-collapse').addClass('collapse')
                } else {
                    $('div.sidebar-collapse').removeClass('collapse')
                }
            });

        },

        initialization: function () {
            mainApp.main_fun();

        }

    }
    // Initializing ///

    $(document).ready(function () {
        mainApp.main_fun();
    });

}(jQuery));


$(document).on('turbolinks:load', function() {
            // checked chuyen muc
            $(".check").change(function(){
                var id = $(this).val();
                if(this.checked==true){
                    $.get("ajax_check.php",{idCat:id,id:1});
                }else{
                    $.get("ajax_check.php",{idCat:id,id:0});
                }
            });



            // checked slide
            $('.check').change(function(){
                var id = $(this).val();
                if(this.checked==true){
                     $.get("ajax_check.php",{slide_id:id, id:1});
                 }else{
                     $.get("ajax_check.php",{slide_id:id, id:0});
                 }
            })

        });

        // phan trang ajax//////
        $(document).on('turbolinks:load', function() {
            var page = 1;
            var count = Number($('#count').html());
            $('#next').click(function(){
              if(page<count){
                page= page + 1;
                $.get("ajax.php",{trang: page},function(data){
                $('.story_table').html(data);
                $('#page').html(page);
                });
              }
            });
            $('#pre').click(function(){
                if(page>1){
                    page = page - 1;
                    $.get('ajax.php',{trang: page},function(data){
                        $('.story_table').html(data);
                        $('#page').html(page);
                    })
                }
            })
            $('#nameStory').change(function(){
                var n =$('#nameStory').val();
                if(n==""){
                    $('#ok').attr('disabled','disabled');
                }else{
                    $('#ok').removeAttr('disabled');
                }
            })

        });
       // phan trang ajax/////

       document.addEventListener('DOMContentLoaded',function(){
           var x = document.querySelector('.khoi1');
           var y = document.querySelector('.khoi2');
           var z = document.querySelector('#ten');
           x.onclick = function(){
            this.classList.toggle('khoi11');
            y.classList.toggle('khoi22');
            z.classList.toggle('ten1');
           }
       },false)
