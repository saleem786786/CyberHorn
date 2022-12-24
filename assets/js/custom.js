//* YOUR CUSTOMIZED JAVASCRIPT *//
function reloadInstallationIndexPage(){
    setTimeout(function(){
       window.location.reload(1);
    }, 3000);
}
$(document).ready(function(){

  
     $('.domids').change(function() {
        var dselected = $('.domids:checkbox:checked').length;
        if(dselected != 0){
            $("#bulkact").removeAttr("style");
            $("#domainSelectedCounter").empty().html(dselected);
        }else{
            $("#bulkact").hide();
        }
        
    });

    $("#iCheck-selowndomain").addClass("checked").parent().click();

    
    $(document).on("click", ".dropdown-btn-custom", function () {
        $(".list-content-cu").toggle()
    });
    $("#btnCheckAvailability").css("height",$("#inputDomain").outerHeight()+"px");
    $(document).on("click", ".add-extra-attachement", function () {
          var t = $(this).data("nofiletext"),
            e = $(this).data("selectfiletext"),
            i = $(this).data("selectfiletext");
          $("#fileUploadsContainer").append(
            '<div class="file-input form-control"><input type="file" name="attachments[]"><span class="file-input-button btn btn-default">' +
              e +
              '</span><span class="file-input-text text-light">' +
              t +
              '</span><button data-toggle="tooltip" title="' +
              i +
              '" class="btn btn-icon file-input-remove"><i class="fa fa-trash"></i></button></div>'
          ),
            $('[data-toggle="tooltip"]').tooltip();
        }),
        $(document).on("change", ".file-input input[type=file]", function () {
          var t = $(this).val(),
            e = t.substring(t.lastIndexOf("\\") + 1);
          "" == e
            ? $(this)
                .parent()
                .find(".file-input-text")
                .text("No file selected")
                .addClass("text-light")
            : $(this)
                .parent()
                .find(".file-input-text")
                .text(e)
                .removeClass("text-light");
        }),
        $(document).on("click", ".file-input-remove", function () {
          $(this).closest(".file-input").remove();
        });
    $('[data-href]').on('click', function(e){
        if($(e.currentTarget).is('a')){ e.stopPropagation(); document.location.href=$(this).data('href');return}
        if($(e.currentTarget).is('a')){
            document.location.href=$(this).data('href');
            return '';
        }
        e.preventDefault();
        if (!$(e.currentTarget).is('form')){
            document.location.href=$(this).data('href');
        }
    });
    $('body').attr("id", "layout01");
    $('[data-toggle="lu-tooltip"]').on('hover', function (){
        $('.drop-content').css("display", "none");
    })

    if (window.location.href.indexOf("store") > -1) {
        $("#storeslider").css("display", '');
    }
    else
    {
        $("#storeslider").css("display", 'none');
    }

    // if (window.location.href.indexOf("login") > -1 || window.location.href.indexOf("register.php")) {
    //     $(".fa-google").css("background", "url(https://cyberpower.co.il/templates/horn/assets/fonts/svg/google-icon.svg) center center no-repeat");
    //     $(".fa-google").parent().attr("data-toggle","tooltip");
    //     $(".fa-google").parent().attr("data-placement","top");
    //     $(".fa-google").parent().attr("data-original-title", "Continue with Google");
    //     $(".row-centered").css('height', '150px');
    //     $(".fa-google").removeClass();
    //     $("#asd").css("width", '100%');
    //     $("#asd a").removeClass();
    //     $("#asd a").addClass("btn-social");
    //     $("#asd a").addClass("ripple");
    //     $("#asd").css("display", "flex");
    //     $("#asd").css("align-items", "center");
    //     $("#asd").css("justify-content", "center");
    //     $(".btn-social").css("width", "80px");
    //     $(".btn-social").css("height", "48px");
    //     $(".btn-social").css("min-width", "80px");
    //     $(".btn-social").css("max-width", "80px");
    //     $(".btn-social").css("line-height", "48px");
    //     $(".btn-social").css("border", "1px solid #d6d6d6");
    //     $(".btn-social").css("border-radius", "3px");
    //     $(".btn-social").css("color", "white");
    //     $(".btn-social i").css({top: "9px", left: "24px"});
    //     $(".btn-social i").css("font-size", "30px");
    //     $(".fa-facebook").css("color", "#3b5998");
    //     $(".fa-google").css("color", "white");
    //     $(".fa-facebook").parent().attr("data-toggle","tooltip");
    //     $(".fa-facebook").parent().attr("data-placement","top");
    //     $(".fa-facebook").parent().attr("data-original-title", "Continue with Facebook");
    //     $(".fa-github").parent().attr("data-toggle","tooltip");
    //     $(".fa-github").parent().attr("data-placement","top");
    //     $(".fa-github").parent().attr("data-original-title", "Continue with Github");
        
    // }
    // $(".lang-container").children().last().remove();
    //apply changes only if order form template is "don"
    if ($("#don").val() == "true")
    {
        $('.top-content').next().css('display', 'none');
        $('.top-content').next().css('position', 'absolute');
        $('.top-content').next().css('bottom', '0');
        $('.top-content').next().css('left', '0');
        $('.top-content').next().css('width', '100%');
        // $('.top-content').css('padding', '40px 60px 70px 60px');
        $('.specs-content').css('padding', '15px 20px 0 20px');

        $('.wrapper-plan').hover(function(){
            var cZIndex = $(this).css('z-index');
            $(this).css("transform", "scale(1.1)");
            $(this).css("box-shadow", "0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)");
            $(this).css("z-index", cZIndex + 1000);

        }, function(){
            var cZIndex = $(this).css('z-index');
            $(this).css("transform", "scale(1)");
            $(this).css("z-index", cZIndex - 1000);
            $(this).css("box-shadow", "");
        });

    
        $('.top-content').hover(function(){
            $(this).next().css('display', '');
        }, function(){
            $(this).next().css('display', 'none');
        });    
        $('.specs-content').hover(function(){
            $(this).css('display', '');
        }, function(){
            $(this).css('display', 'none');
        });    

    }
$('body:not(.page-configureproductdomain):not(.page-viewcart)').find('input:not(.icheck-input):not(.switch__checkbox):not(.lu-switch__checkbox)').iCheck({
        checkboxClass: 'checkbox-styled',
        radioClass: 'radio-styled',
        increaseArea: '40%'
    });
   
    // if (window.location.href.indexOf("confproduct") > -1){
    //     $("#inputBillingcycle").parent().parent().parent().css('display', 'none');
    // }
    // if (window.location.href.indexOf("cart.php?a=view") > -1){
    //     window.location.href = '/cart.php?a=view';
    // }
});
