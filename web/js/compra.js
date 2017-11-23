$(document).ready(function () {
    //Initialize tooltips
    $('.nav-tabs > li a[title]').tooltip();

    //Wizard
    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {

        var $target = $(e.target);

        if ($target.parent().hasClass('disabled')) {
            return false;
        }
    });

    $(".next-step").click(function (e) {
        var $active = $('.wizard .nav-tabs li.active');
        $active.next().removeClass('disabled');
        nextTab($active);
    });

    $(".next-step1").click(function (e) {
        for (i = 1; i <= 5; i++) {
            if (document.getElementById('endereco' + i).checked !== false) {
                var $active = $('.wizard .nav-tabs li.active');
                $active.next().removeClass('disabled');
                nextTab($active);
                var teste = document.getElementById('endereco' + i).value;
                $('#txtendereco').val(teste);
            } else {
 
            }
        }
    });

    $(".next-step2").click(function (e) {
        var titular = document.getElementById('titular').value;
        var numero = document.getElementById('cartao').value;
        var cod = document.getElementById('cod').value;
        var mes = document.getElementById('mesvalidade').value;
        var ano = document.getElementById('anovalidade').value;

        if ((titular !== "") && (numero !== "") && (cod !== "") && (mes !== "") && (ano !== "")) {
            var $active = $('.wizard .nav-tabs li.active');
            $active.next().removeClass('disabled');
            nextTab($active);
        } else {
            document.getElementById('titular').placeholder = "preencha este campo";
            document.getElementById('cartao').placeholder = "preencha este campo";
            document.getElementById('cod').placeholder = "preencha este campo";
            document.getElementById('mesvalidade').placeholder = "preencha este campo";
            document.getElementById('anovalidade').placeholder = "preencha este campo";
        }
    });

    $(".prev-step").click(function (e) {

        var $active = $('.wizard .nav-tabs li.active');
        prevTab($active);

    });
});

jQuery(function ($) {


    $("#cep").mask("99999-999");
});

function nextTab(elem) {
    $(elem).next().find('a[data-toggle="tab"]').click();
}
function prevTab(elem) {
    $(elem).prev().find('a[data-toggle="tab"]').click();
}

$(document).ready(function () {

    var quantity = 1;
    $('#quantity').val(quantity);
    $('#qt').val(quantity);

    $('.quantity-right-plus').click(function (e) {
        e.preventDefault();
        var quantity = parseInt($('#quantity').val());
        var limite = parseInt($('#qtd').val());

        if (quantity < limite) {
            $('#quantity').val(quantity + 1);
            $('#qt').val(quantity + 1);
            var valor = $('#preco').val();
            var un = $('#quantity').val();
            var resultado = valor * un;
            $('#subtotal').val("R$" + resultado);
            $('#sub').val("R$" + resultado);
            var u = $('#env').val();
            $('#total').val("R$" + (resultado + u * 1));
        } else {

        }
    });

    $('.quantity-left-minus').click(function (e) {
        e.preventDefault();
        var quantity = parseInt($('#quantity').val());
        if (quantity >= 2) {
            $('#quantity').val(quantity - 1);
            $('#qt').val(quantity - 1);
            var valor = $('#preco').val();
            var un = $('#quantity').val();
            var resultado = valor * un;
            $('#subtotal').val("R$" + resultado);
            $('#sub').val("R$" + resultado);
            var u = $('#env').val();
            $('#total').val("R$" + (resultado + u * 1));
        } else {

        }
    });

    var valor = $('#preco').val();
    var un = $('#quantity').val();
    var u = $('#env').val();
    var resultado = valor * un;
    $('#subtotal').val("R$" + resultado);
    $('#sub').val("R$" + resultado);
    var u = $('#env').val();
    $('#total').val("R$" + (resultado + u * 1));
});

$(document).ready(function () {
    //Add Inactive Class To All Accordion Headers
    $('.accordion-header').toggleClass('inactive-header');

    //Set The Accordion Content Width
    var contentwidth = $('.accordion-header').width();
    $('.accordion-content').css({});

    //Open The First Accordion Section When Page Loads
    $('.accordion-header').first().toggleClass('active-header').toggleClass('inactive-header');
    $('.accordion-content').first().slideDown().toggleClass('open-content');

    // The Accordion Effect
    $('.accordion-header').click(function () {
        if ($(this).is('.inactive-header')) {
            $('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle().toggleClass('open-content');
            $(this).toggleClass('active-header').toggleClass('inactive-header');
            $(this).next().slideToggle().toggleClass('open-content');
        } else {
            $(this).toggleClass('active-header').toggleClass('inactive-header');
            $(this).next().slideToggle().toggleClass('open-content');
        }
    });
    return false;
});

$(document).ready(function () {
    $(".titular").on("input", function () {
        var textoDigitado = $(this).val();
        var inputCusto = $(this).attr("nome");
        $("#" + inputCusto).val(textoDigitado);
    });
});

$(document).ready(function () {
    $(".cartao").on("input", function () {
        var textoDigitado1 = $(this).val();
        var inputCusto1 = $(this).attr("num");
        $("#" + inputCusto1).val(textoDigitado1);
    });
});
