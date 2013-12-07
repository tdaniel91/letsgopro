/* Este código vai popular as dropdowns referentes à data de nascimento.*/
var monthtext=['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'];

function populatedropdown(dayfield, monthfield, yearfield){
    var today=new Date();
    var dayfield=document.getElementById(dayfield);
    var monthfield=document.getElementById(monthfield);
    var yearfield=document.getElementById(yearfield);
    for (var i=0; i<31; i++)
        dayfield.options[i]=new Option(i+1, i+1);
    dayfield.options[today.getDate()]=new Option(today.getDate(), today.getDate(), true, true); //select today's day
    for (var m=0; m<12; m++)
        monthfield.options[m]=new Option(monthtext[m], monthtext[m]);
    monthfield.options[today.getMonth()]=new Option(monthtext[today.getMonth()], monthtext[today.getMonth()], true, true); //select today's month
    var thisyear = 1970;
    var yearDif = today.getFullYear()-thisyear;
    for (var y=0; y<=yearDif; y++){
        yearfield.options[y]=new Option(thisyear, thisyear) ;
        thisyear+=1;
    }
    yearfield.options[yearDif]=new Option(today.getFullYear(), today.getFullYear(), true, true); //select today's year
}

/*JQ*/

//aparece flag na direita
$(function() {
    $(window).scroll(function() {
        var topHeight = $('#footer').height();
        var scroll = $(window).scrollTop();

        if (scroll >= topHeight) {
            $(".flag").addClass("show");
        }
        if (scroll < topHeight) {
            $(".flag").removeClass("show");
        }

    });
});


//---------------------- Reg/Login Menu -----------------------

$(document).ready(function() {
    $('a.register-window, a.login-window').click(function() {

        //Getting the variable's value from a link
        var registerBox = $(this).attr('href');

        //Fade in the Popup
        $(registerBox).fadeIn(300);

        //Set the center alignment padding + border see css style
        var popMargTop = ($(registerBox).height() + 24) / 2;
        var popMargLeft = ($(registerBox).width() + 24) / 2;

        $(registerBox).css({
            'margin-top' : -popMargTop,
            'margin-left' : -popMargLeft
        });

        // Add the mask to body
        $('#mask').fadeIn(300);

        return false;
    });

    $('#close-reg,#close-login, #mask').click(function() {
        $('#mask , .popup').fadeOut(300);
        return false;
    });

});
//---------------------- Reg/Login Menu -----------------------

// --------------------- Nav Menu -----------------------------
//Adicionar a classe hasChild se houve submenu, senão os links do menu principal nao funcionam!
$(document).ready(function(){
    $("#nav > li.hasChild > a").on("click", function(e){
        if($(this).parent().has("ul")) {
            e.preventDefault();
        }

        if(!$(this).hasClass("open")) {
            // hide any open menus and remove all other classes
            $("#nav li ul").slideUp(350);
            $("#nav li a").removeClass("open");


            // open our new menu and add the open class
            $(this).next("ul").slideDown(350);
            $(this).addClass("open");

        } else if($(this).hasClass("open")) {
            $(this).removeClass("open");
            $(this).next("ul").slideUp(350);
        }

    });
});



// --------------------- Nav Menu -----------------------------

// -------- Variaveis para simulação de comportamento do site

var $userName = "simplicio";
var $imgAlt = $userName;
var $imgSrc = "userImages/"+$userName+".jpg";
var $nome = "Simplicio Silva"; //obter esta variavel apartir do nome completo
var $frase = "Acreditar é essencial, mas ter atitude é o que faz a diferença.";

var $nomeCompleto = "Simplicio SObral da Silva";
var $dataNascimento = "1980-01-01";
var $localidade = "Caparica";
var $email = "simpl@gmail.com";
var $telefone = "212222333";

var $univ = "Universidade Nova de Lisboa - Faculdade de Ciências e Tecnologia";
var $curso = "Licenciatura em Engenaria Informatica";
var $competencias = ["Web","DB","Programing"];
var $nrCompetencias = $competencias.length;

var $empresas = [[2000, "Xerox", "Developer"],
    [2005, "Apple", "Developer"],
    [2007, "Google", "Developer"]];
var $nrEmpresas = $empresas.length;
var $empresa = $empresas[$empresas.length-1][1];
var $cargo = $empresas[$empresas.length-1][0] + " - " + $empresas[$empresas.length-1][2];

var $hobbies = ["BTT", "Yoga"];
var $nrHobbies = $hobbies.length;

var $privacidade = 0;

var $colegas = ["userDefault","userDefault"];
var $contactos = ["userDefault","userDefault","userDefault","userDefault","userDefault","userDefault","userDefault","userDefault","userDefault","userDefault"];

// --------------------- Profile -----------------------------
function userProfile(){
    if($privacidade==1){ //nivel de privacidade medio
        $("#pessoal").addClass("hidden");
        $("#hobbies").addClass("hidden");
    }
    if($privacidade==2){ //nivel de privacidade alto
        $("#pessoal").addClass("hidden");
        $("#cv").addClass("hidden");
        $("#profissional").addClass("hidden");
        $("#hobbies").addClass("hidden");
        $("#contactos").addClass("hidden");
    }

    $("#topUser > .imgUser").attr({
        alt: $imgAlt,
        src: $imgSrc
    });
    $("#topUser > #articleTitle").html($nome);
    $("#topUser > #userFrase").html($frase);
    $("#topUser > .userCargo > b").html($cargo);

    if($privacidade == 0){
        $("#pessoal > #userNomeCompleto").html($nomeCompleto);
        $("#pessoal > #userDataNascimento").html($dataNascimento);
        $("#pessoal > #userLocalidade").html($localidade);
        $("#pessoal > #userEmail").html($email);
        $("#pessoal > #userTelefone").html($telefone);
    }

    if($privacidade != 2){

        $("#cv > #userUniversidade").html($univ);
        $("#cv > #userCurso").html($curso);
        $.each($competencias, function(i){
            $('ul#userCompetencias').append($('<li>').text($competencias[i]));
        });
    }



    if($privacidade != 2){
        $("#profissional > #userEmpresa").html($("<a/>", {
            href:"profileEmpresa.html?emp="+$empresa}).html($empresa));
        $("#profissional > #userCargo").html($cargo);
        $.each($empresas, function(i){
            $('ul#userEmpresas').append($('<li>').text($empresas[i][0] + " - " + $empresas[i][1]+ " - " + $empresas[i][2]));
        });
    }

    if($privacidade == 0){
        $.each($hobbies, function(i){
            $('ul#userHobbies').append($('<li>').text($hobbies[i]));
        });
    }

    if($privacidade != 2){
        $.each($colegas, function(i){
            $('div#userColegas').append(
                $('<div class="divContacto">').append(
                    $("<a/>", {
                        href:"profile.html?user="+$colegas[i]
                    }).html(
                    $("<img/>", {
                        class: "imgOtherUser",
                        alt: $colegas[i],
                        src: "userImages/"+ $colegas[i] +".jpg"
                    }),
                    $("<p/>",  {class: "nameOtherUser"}).text($colegas[i])
                )));
            return i<=8;
        });

        if($colegas.length>8){
            $('div#userColegas').append(
                $("<p/>",  {class: "verMais"}).text("Ver mais»"))
            //TODO criar link para a pagina de pesquisa em q já esteja seleccionada a empresa em questao e ser amigo do user
        }


        $.each($contactos, function(i){
            $('div#userContactos').append(
                $('<div class="divContacto">').append(
                    $("<a/>", {
                        href:"profile.html?user="+$contactos[i]
                    }).html(
                    $("<img/>", {
                        class: "imgOtherUser",
                        alt: $contactos[i],
                        src: "userImages/"+ $contactos[i] +".jpg"
                    }),
                    $("<p/>",  {class: "nameOtherUser"}).text($contactos[i])
                ))
            );
            return i<7;
        });


        if($contactos.length>8){
            $('div#userContactos').append(
                $("<p/>",  {class: "verMais"}).text("Ver mais»"))
            //TODO criar link para a pagina de pesquisa para mostrar os amigos do user em questao
        }
    }



};
// --------------------- Profile -----------------------------
// --------------------- Profile Edit-----------------------------
function userProfileEdit(){
    $("#textUserName").val($nome);
    $("#textUserFrase").val($frase);
    $("#textUserImg").val($imgSrc);

    $("#textUserNameCompleto").val($nomeCompleto)
    $("#textUserDataNascimento").val($dataNascimento);
    $("#textUserLocalidade").val($localidade);
    $("#textUserEmail").val($email);
    $("#textUserTelefone").val($telefone);

    $("#textUserUniv").val($univ);
    $("#textUserCurso").val($curso);

    for(var i = 0; i < $competencias.length; i++ ) {
        addCompetencia(i,$competencias[i]) ;
    };
    $("#addCompetencia").click(function(){
        addCompetencia($nrCompetencias,"");
        $nrCompetencias++;
    });

    for(var i = 0; i < $empresas.length; i++ ) {
        addCargo(i,$empresas[i]) ;
    };
    $("#addCargo").click(function(){
        addCargo($nrEmpresas,["","",""]);
        $nrEmpresas++;
    });

    for(var i = 0; i < $hobbies.length; i++ ) {
        addHobbie(i,$hobbies[i]) ;
    };
    $("#addHobbie").click(function(){
        addHobbie($nrHobbies,"");
        $nrHobbies++;
    });
};

function addCompetencia($i,$com){
    $("#editFormacao").append('<br><label for="textUserCompetencia class=">Competencia </label><input type="text" id="textUserCompetencia'+$i+'" class="textUserCompetencia" value='+$com+'>');
    // $("#labelEditCV").append('<label for="textUserCompetencia class=">Competencia </label>');
    // $("#textEditCV").append('<input type="text" id="textUserCompetencia" class="textUserCompetencia" value='+$com+'>');
};
function addCargo($i,$emp){
    $("#editProfissional").append('<br/><label for="textUserEmpresa">Empresa </label><input type="text" id="textUserEmpresa'+$i+'" class="textUserEmpresa" value='+$emp[1]+'>');
    $("#editProfissional").append('<label for="textUserCargo"> Cargo </label><input type="text" id="textUserCargo'+$i+'" class="textUserCargo"value='+$emp[2]+'>');
    $("#editProfissional").append('<label for="textUserCargoAno"> Ano </label><input type="text" id="textUserCargoAno'+$i+'" class="textUserCargoAno"value='+$emp[0]+'>');
};
function addHobbie($i,$hob){
    $("#editHobbies").append('<label for="textUserHobbie">Hobbie </label><input type="text" id="textUserHobbie'+$i+'" class="textUserHobbie" value='+$hob+'><br>');
};

function guardaDados(){
    $nome = $("#textUserName").val();
    $frase = $("#textUserFrase").val();
    $imgSrc = $("#textUserImg").val();
    $nomeCompleto = $("#textUserNameCompleto").val();
    $dataNascimento = $("#textUserDataNascimento").val();
    $localidade = $("#textUserLocalidade").val();
    $email = $("#textUserEmail").val();
    $telefone = $("#textUserTelefone").val();
    $univ = $("#textUserUniv").val();
    $curso = $("#textUserCurso").val();

    for(var i = 0; i < $nrCompetencias; i++ ) {
        $competencias[i] = $("#textUserCompetencia"+i).val();
    }
    for(var i = 0; i < $nrEmpresas; i++ ) {
        $empresas[i] = [$("#textUserCargoAno"+i).val(),$("#textUserEmpresa"+i).val(),$("#textUserCargo"+i).val()];
    }
    for(var i = 0; i < $nrHobbies; i++ ) {
        $hobbies[i] = $("#textUserHobbie"+i).val();
    }

    $privacidade = $("#privacidade").val();
}


// --------------------- Profile Edit-----------------------------







var $empName = "Google";
var $empImgAlt = $empName;
var $empImgSrc = "userImages/"+$empName+".gif";
var $empSlogan = "Don't be evil";

var $empHistoria = "Google was founded by Larry Page and Sergey Brin while they were Ph.D. students at Stanford University. Together they own about 16 percent of its shares. They incorporated Google as a privately held company on September 4, 1998. An initial public offering followed on August 19, 2004. Its mission statement from the outset was to organize the worlds information and make it universally accessible and useful, and its unofficial slogan was 'Don't be evil'.In 2006 Google moved to headquarters in Mountain View, California, nicknamed the Googleplex.";
var $empSigla = "GOOGLE";
var $empDataFundacao = "1995-01-01";
var $empEndereco = "www.google.com";
var $empContactos = ["213215813", "mail@gmail.com"];
var $nrContactos = $contactos.length;

var $empDescricao = "Google Inc. is an American multinational corporation specializing in Internet-related services and products. These include search, cloud computing, software, and online advertising technologies. Most of its profits are derived from AdWords.";
var $empAreas = ["Web","DB","Programing"];
var $nrEmpAreas = $empAreas.length;
var $empProjectos = ["Mail","Cloud","Drive"];
var $nrEmpProjectos = $empProjectos.length;

var $empFuncionarios = ["simplicio","userDefault"];
var $empParceiros = ["empDefault","empDefault"];


// --------------------- Profile Empresa----------------------
function empProfile(){

    $("#topUser > .imgEmp").attr({
        alt: $empImgAlt,
        src: $empImgSrc
    });



    $("#topUser > #empTitle").html($empName);
    $("#topUser > #empSlogan").html($frase);///////////////////////////////


    $("#pessoal > #empHistoria").html($empHistoria);
    $("#pessoal > #empName").html($empName);
    $("#pessoal > #empSigla").html($empSigla);
    $("#pessoal > #empDataFundacao").html($empDataFundacao);
    $("#pessoal > #empEndereco").html($empEndereco);
    $.each($empContactos, function(i){
        $('ul#empContactos').append($('<li>').text($empContactos[i]));
    });


    $("#profissional > #empDescricao").html($empDescricao);
    $.each($empAreas, function(i){
        $('ul#empAreas').append($('<li>').text($empAreas[i]));
    });
    $.each($empProjectos, function(i){
        $('ul#empProjectos').append($('<li>').text($empProjectos[i]));
    });


    $.each($empFuncionarios, function(i){
        $('div#empFuncionarios').append(
            $('<div class="divContacto">').append(
                $("<a/>", {
                    href:"profile.html?user="+$empFuncionarios[i]
                }).html(
                $("<img/>", {
                    class: "imgOtherUser",
                    alt: $empFuncionarios[i],
                    src: "userImages/"+ $empFuncionarios[i] +".jpg"
                }),
                $("<p/>",  {class: "nameOtherUser"}).text($empFuncionarios[i])
            )));
        return i<=8;
    });

    if($empFuncionarios.length>8){
        $('div#empFuncionarios').append(
            $("<p/>",  {class: "verMais"}).text("Ver mais»"))
        //TODO criar link para a pagina de pesquisa em q já esteja seleccionada a empresa em questao e ser amigo do user
    }


    $.each($empParceiros, function(i){
        $('div#empParceiros').append(
            $('<div class="divContacto">').append(
                $("<a/>", {
                    href:"profileEmpresa.html?emp="+$empParceiros[i]
                }).html(
                $("<img/>", {
                    class: "imgOtherUser",
                    alt: $empParceiros[i],
                    src: "userImages/"+ $empParceiros[i] +".jpg"
                }),
                $("<p/>",  {class: "nameOtherUser"}).text($empParceiros[i])
            )));
        return i<=8;
    });

    if($empParceiros.length>8){
        $('div#empParceiros').append(
            $("<p/>",  {class: "verMais"}).text("Ver mais»"))
        //TODO criar link para a pagina de pesquisa em q já esteja seleccionada a empresa em questao e ser amigo do user
    }



};
// --------------------- Profile Empresa----------------------
// --------------------- Profile Empresa Edit-----------------------------
function userProfileEdit(){
    $("#textEmpSlogan").val($empSlogan);
    $("#textEmpImg").val($empImgSrc);

    $("#textEmpHistoria").val($empHistoria)
    $("#textEmpNome").val($empName);
    $("#textEmpSigla").val($empSigla);
    $("#textEmpFundacao").val($empDataFundacao);
    $("#textEmpEndereco").val($empEndereco);

    $("#textEmpDescricao").val($empDescricao);







    for(var i = 0; i < $empContactos.length; i++ ) {
        addContactos(i,$empContactos[i]) ;
    };
    $("#addContacto").click(function(){
        addContactos($nrContactos,"");
        $nrContactos++;
    });

    for(var i = 0; i < $empAreas.length; i++ ) {
        addEmpAreas(i,$empAreas[i]) ;
    };
    $("#addAreas").click(function(){
        addAreas($nrEmpAreas,"");
        $nrEmpAreas++;
    });

    for(var i = 0; i < $empProjectos.length; i++ ) {
        addEmpProjectos(i,$empProjectos[i]) ;
    };
    $("#addProjectos").click(function(){
        addProjectos($nrEmpProjectos,"");
        $nrEmpProjectos++;
    });

};

function addContactos($i,$con){
    $("#editContactos").append('<br><label for="textEmpContacto ">Contacto </label><input type="text" id="textEmpContacto'+$i+'" class="textEmpContacto" value='+$con+'>');

};
function addEmpAreas($i,$are){
    $("#editAreas").append('<br><label for="textEmpArea ">Area </label><input type="text" id="textEmpArea'+$i+'" class="textEmpArea" value='+$are+'>');

};
function addEmpProjectos($i,$pro){
    $("#editProjectos").append('<br><label for="textEmpProjecto ">Projecto </label><input type="text" id="textEmpProjecto '+$i+'" class="textEmpProjecto" value='+$pro+'>');

};


// --------------------- Profile Empresa Edit-----------------------------










$(document).ready(userProfile);
$(document).ready(userProfileEdit);
$(document).ready(empProfile);




