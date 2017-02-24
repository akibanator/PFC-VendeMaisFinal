data      = new Date()
hora      = data.getHours()
dia       = data.getDate()
diasemana = data.getDay()
mes       = data.getMonth()
ano       = data.getYear()


//sauda??o Bom Dia, Boa Tarde Boa Noite de acordo com a hora
if (hora < 12)
    document.write('Bom Dia - ');
else if(hora >=12 && hora < 18)
    document.write('Boa Tarde - ');
else if(hora >= 18 && hora < 24)
    document.write('Boa Noite - ');

//defini??o dos meses 

nomemes=new Array(13);

nomemes[1]=" de Janeiro de";
nomemes[2]=" de Fevereiro de";
nomemes[3]=" de Mar?o de";
nomemes[4]=" de Abril de";
nomemes[5]=" de Maio de";
nomemes[6]=" de Junho de";
nomemes[7]=" de Julho de";
nomemes[8]=" de Agosto de";
nomemes[9]=" de Setembro de";
nomemes[10]=" de Outubro de";
nomemes[11]=" de Novembro de";
nomemes[12]=" de Dezembro de";

texto = nomemes[mes];

//defini??o do ano
if (ano < 2000)
ano = ano + 1900;

//visualizando a data completa
document.write( dia  +  texto + " "  + ano)
 