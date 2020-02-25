
%% Uvod do prostredi MATLAB

% toto je komentar, protoze zacina znakem procento "%"

%{
  komentar v bloku je ohraniceny procentem a slozenou zavorkou
  a muze byt pres
  vice radku
%}

%% Prace s promennymi
x=1 % priradi hodnotu 1 do promenne x
1 % pokud k hodnote nespecifikujete promennou, MATLAB ulozi hodnotu do promenne ans ... "last ANSwer" (zkratku znate i treba z kalkulacek)
x % vypise hodnotu ulozenou v promenne x
x; % pouziti stredniku zamezuje vypisovani vystupu - vrele doporucuji pouzivat ... brzy pochopite proc

save % ulozi workspace (vsechny promenne) do matlab.mat do aktualniho adresare
save('nazev_souboru','x') % ulozi promennou x do souboru nazev_souboru.mat
clear x % smaze promennou x
clear % smaze vsechny promenne
load % nacte zalohu matlab.mat z aktualniho adresare
load('nazev_souboru') % nacte zalohu z nazev_souboru.mat

%% Psani deniku
diary nazev_deniku; % ukladani prikazove radky do souboru, soubor je ulozen v aktualnim adresari
diary off; % vypnete ukladani prikazove radky
diary nazev_deniku; % k psani deniku se muzete vratit a pokracovat

% Pro delsi kody, ke kterym se chcete vracet je vhodnejsi zalozit si novy
% skript, pripadne vybudovat funkci (viz. posledni cast dnesniho cviceni).

%% Skalarni aritmetika
% Vypocitejte v matlabu nasledujici operace:
% tri krat 4
% pet + sest
% trinact deleno dvema
% osm na treti
% (((pet minus deset plus 3 na treti) krat ctyri) deleno peti) na druhou
% zbytek z peti deleno dvemi (funkce mod)

%% Vektory
% Vektory lze definovat rucne vypsanim hodnot do hranatych zavorek [1 2 3]
% nebo automaticky vygenerovat ... pohodlny zpusob a vrele ho doporucuji.
% Definovat vektory muzete po sloupcich [1, 2, 3] nebo po radcich [1; 2; 3]
% Vektory muzete definovat automaticky pomoci dvojtecky od:do s krokem 1
% nebo s definovanym krokem od:krok:do. Pripadne existuji i treba funkce linspace. 
% Pro generovani nulovych vektoru je funkce zeros, pro jednotkove vektory funkce 
% ones, pro not-a-number nan - viz. napoveda.
% Vektory muzete transponovat pomoci transpose(vektor) nebo apostrofem vektor'.
% Pri praci s vektory jsou vzdy definovany napred radky a potom sloupce. 
% Na pozice vektoru se lze divat s definici radku a prvku vector(radek,sloupec)
% nebo bez definice vector(poradi_prvku).
% Prvky vektoru lze mazat prirazenim prazdne hodnoty v hranatych zavorkach
% [] vector(poradi_prvku)=[].
% Vektory lze skladat za sebe slozeny_vektor=[prvni_vektor druhy_vektor]
% ... pozor na rozmery vektoru (radky vs. sloupce)!
% Operace po prvcich jsou uvozeny teckou, e.g. nasobeni po prvcich .*
% Celkova suma vektoru se urci pomoci sum

% Vytvorte nasledujici vektor:
% radkovy vektor x obsahuje hodnoty tri pet jedna sedm
% sloupcovy vektor x obsahuje hodnoty tri pet jedna sedm

% Vytvorte co nejjednodusseji nasledujici vektory bez rucniho vypisovani hodnot:
% vektor x obsahuje hodnoty od jedne do sta a urcete soucet vsech jeho prvku
% radkovy!!! vektor x obsahuje hodnoty od sedmnactcelychtri do minustri s krokem minusnulacelajedna       
% vektor x obsahuje hodnoty 0  3  6  9  12  15
% vektor x obsahuje hodnoty -4  -2  0  2  4  6  8
% radkovy vektor x obsahuje jednosto nul
% sloupcovy vektor x obsahuje tisic  jednicek
% vektor x obsahuje hodnoty 10  100  1000 10000  100000 1000000 10000000
% vektor x obsahuje na pozici 1 az 24 hodnoty od 1 do 24, na pozici 25 je nula, na pozici 26 az padesat jsou hodnoty od 26 do 50.
% vektor x obsahuje na pozici 1 az 200 hodnoty od 1 do 200, na pozici 201 az 400 jsou hodnoty od 199 do nuly.
% vektor x obsahuje na pozici 2 az 99 same jednicky, na pozici jedna a sto jsou nuly.

% Vytvorte vektor_1 obsahujici hodnoty jedna dva a tri a vektor_2 obsahujici 
% hodnoty dva, tri a ctyri. Provedte nasledujici operace:
% vynasobte vektor_1 konstantou 2 
% prictete konstantu 1 k vektor_1
% odectete konstantu 2 od vektor_2
% vynasobte vektor_1 konstantou 3
% vynasobte po prvcich vektor_1 a vektor_2
% umocnete po prvcich vektor_2

%% Matice
% Vsechno co znate o vektorech plati i na matice. Matici lze ziskat 
% i maticovym nasobenim vektoru. Matice i vektory lze
% generovat treba automatickym skladanim pomoci repmat:
% vysledny_vektor=repmat(replikovana_matice,kolikrat_opakovat_v_radcich,kolikrat_opakovat_ve_sloupcich).
% Matice lze delit zprava / nebo zleva \

% Vytvorte nasledujici matici:
A = [ 1 2 3 
      4 5 6 
      7 8 9 ]
  
  
disp("Vypis matice:")
disp(A)

% Vypiste hodnotu prvku nachazejiciho se uprostred matice A 
disp("Uprostred matice: ")
disp(A(2,2))

% Zmente hodnotu prvku nachazejiciho se uprostred matice A na hodnotu 0
A(2,2) = 0
disp("Vypis zmenene matice:")
disp(A)

% Vypiste vsechny hodnoty ve druhem radku matice A
disp("Vektor ve druhem radku: ")
disp(A(2,:))

% Vypiste vsechny hodnoty ve tretim sloupci matice A
disp("Hodnoty ve tretim sloupci")
disp(A(:,3))

% Vytvorte radkovy vektor x obsahujici hodnoty tri pet jedna a
% radkovy vektor y obsahujici hodnoty dva osm ctyri. Provedte:
% maticove pronasobte x a y-transponovane
x = [3 5 1]
y = [2 8 4]

% vytvorte matici A spojenim x y x po radcich
A = [x; y; x]
disp(A)

% vytvorte matici A spojenim x y x po sloupcich
A = [x, y, x]
disp(A)


% Navrhnete nasledujici matici:
% E = [2 3 4 
%      4 3 2 
%      4 4 1 
%      1 2 1]
% vytvorte matici F obsahujici vsechny hodnoty E vyjma tretiho radku
% vytvorte matici G obsahujici vsechny hodnoty E vyjma druheho radku
% prictete matici F k matici G
% pronasobte matici F a matici G

% Mejme nasledujici soustavu rovnic:
%     |3  -3   4|   |U1|   |30| 
%     |1   6   5| . |U2| = | 7| 
%     |1  -2   3|   |U3|   |17|
% Urcete U1, U2, U3 pomoci maticoveho deleni.

%% Tabulky
% Tabulky umoznuji uchovavat promenne ruznych formatu (sloupce) pro
% prislusna pozorovani (radky). Tabulku lze vytvorit pomoci skladani:
A={'Petr';'Pavel';'Marie'};
B=[1;2;3];
C=[2;3;1];
D=[3;1;2];
T = table(A,B,C,D,...
    'VariableNames',{'Jmeno','Matematika','Dejepis','Krasopis'});

% nekdy byva prakticke jednotliva pozorovani lze "pojmenovat":
T = table(B,C,D,'RowNames',A,...
    'VariableNames',{'Matematika','Dejepis','Krasopis'});

% tabulku lze prevest na matici - je nutne volit sloupce se stejnym datovym
% typem
x=table2array(T(:,2:end)); % nebo
x=T{:,2:end}

% tabulky lze vytvorit i z matice:
T_1=table([B C D]); % pozor! cela matice je v ramci promenne
T_2=array2table([B C D]); % array2table vytvori tabulku po sloupcich matice

% tabulky lze skladat
T=[table(A) T_2];

% k parametrum tabulky lze pristupovat a menit je:
T.Properties.VariableNames={'Jmeno','Matematika','Dejepis','Krasopis'};

% lze samozrejme pristupovat i k datum a menit je:
disp(T.Dejepis); % sloupec dejepis
disp(T([1 2],3)); % radek 1 a 2 ze 3. sloupce
T.Dejepis=[1;5;4]; % priradi hodnoty 1, 5 a 4 jako znamky z dejepisu

% Z tabulky T vymazte Dejepis a za Krasopis pridejte AED. Znamky AED
% vypoctete automaticky, aby prumer vsech znamek kazdeho zaka byl 2.

%% Logika
x=false; z = ~x;% logicka negace
x=false; y=true; z = x & y;% logicky soucin
x=false; y=true; z = and(x,y);% logicky soucin v blede modrem
x=false; y=true; z = x | y;% logicky soucet
x=false; y=true; z = or(x,y);% logicky soucet v blede modrem
x=false; y=true; z = xor(x,y);% logicky exkluzivni soucet
x=[false true false false]; z = any(x);% je-li alespon jeden prvek logicka 1 ,potom vraci 1

x=1, i<0; % vrati logickou hodnotu true 1, false 0 pro i je mensi nez nula
x=1, i>=0; % vrati logickou hodnotu true 1, false 0 pro i je mensi nez nula
x=1, i<=0; % vrati logickou hodnotu true 1, false 0 pro i je mensi nez nula
(1:10)==5; % vrati logickou hodnotu 1 pro prvky rovne 5
(1:10)~=5; % vrati logickou hodnotu 1 pro prvky nerovnajici se 5
find((1:10)==5); % vypise polohu prvku rovneho 5
[radky sloupce]=find((1:10)==5); % vypise souradnice prvku rovneho 5

% podminky je v praxi citelnejsi strukturovat s odsazenim!

% napise 'AED je supr' vzdy:
if 1 % klidne lze napsat "if true"
    disp('AED je supr')
end 

% napise 'AED je supr' s logickym vyrazem:
test=1;
if test~=0 % klidne lze napsat "if true"
    disp('AED je supr')
end 

% nikdy nenapise "AED je nuda", ale 'AED je supr':
podminka=false;
if podminka
    disp('AED je nuda'); 
else
    disp('AED je supr');
end 

% slozita podminka by mela byt resena s pomoci short-circuit (pro lepsi vykonnost)
if false && true
    disp('AED je nuda'); 
else
    disp('AED je supr');
end 

% Vygenerujte sachovnici R o rozmerech 1000 krat 1000, kde logicka 0 bude
% reprezentovat tmava pole a logicka 1 bude reprezentovat svetla pole
% Nesmi byt pouzit for ani while cyklus!!!
% Napiste podminku, jestlize je v prvni matici na prvni pozici 1, potom
% vsechny prvky matice logicky invertujte. V opacnem pripade napiste "Trefil jsem to dobre"

%% For cyklus
% cykly je v praxi citelnejsi strukturovat s odsazenim!

% for cyklus iterativne naplni i hodnotami od 1 do 10, pole jsou vypsana:
for i=1:10
    disp(i)
end

% for cyklus dokaze prochazet i hodnoty v predem definovanem vektoru:
k=1:10; 
for i=k
    disp(i)
end

% Zkuste vygenerovat sachovnici S s pomoci for cyklu.

%% While
% cykly je v praxi citelnejsi strukturovat s odsazenim!

% dokud plati podminka v zavorkach while(podminka), potom cyklus provede
% vsechno co si zamanete, treba:
i=0; 
while(i<11)
    i=i+1;
    disp(i);
end;

% Zkuste vygenerovat sachovnici T s pomoci while cyklu.

%% Optimalizace
% Cyklu je lepsi se vyhybat! Pouzijte stopky a overte si vypocetni narocnost 
% generovani sachovnice R, S, T - tedy bez cyklu, for cyklus a while
% cyklus:
tic; % zapne stopky
% kod generovani sachovnice

cnt_row = 5
cnt_column = 10

matice = zeros(cnt_row, cnt_column)

for i=1:cnt_row
    for j=1:cnt_column
        if mod(j+i, 2)
            matice(i,j) = 1
        end
    end
end

disp(matice)

toc; % vypne stopky a vypise celkovou dobu

% blizsi info o chodu kodu Vam nabidne funkce profile - v pripade zajmu se zeptejte cviciciho

%% Funkce
% nelze je napsat primo do skriptu, vyzaduji svuj vlastni soubor s
% hlavickou:
%
% function nazev_funkce
%     disp('moje prvni funkce')
% end

prvniFunkce(4, 8)

% funkce byvaji obvykle s argumenty vstupnimi a vystupnimi:
%
% function vystup=nazev_funkce(vstup)
%     disp('moje prvni funkce vypise:')
%     disp(vstup)
% end

% Uz jste si overili, ktery zpusob generovani sachovnice je nejrychlejsi.
% Zkuste tedy tento zpusob prepsat do funkce
% chessboard=generate_chessboard(N), kde chessboard je vysledna sachovnice
% NxN, kde N je rozmer (pocet policek) ctvercove sachovnice.

%% ZAVEREM
% Pro absolvovani AED jsou tyto zaklady nezbytne! V prubehu AED se
% seznamite i s dalsimi funkcemi Matlabu. Pokud Vam bude cokoliv nejasne,
% obratte se prosim na sveho cviciciho.

%% Bonusove ulohy pro zdatne studenty - pouze pro procviceni prace s 
% matlabem.
% Hratky s Fibonacciho posloupnosti
% Fibonacciho posloupnost vypada nasledovne: 0, 1, 1, 2, 3, 5, ... pricemz 
% kazde nasledujici cislo je souctem dvou predchozich. Napiste funkci se 
% vstupnim argumentem N, ktera vrati N-tou hodnotu Fibonacciho 
% posloupnosti. Nepouzivejte matlabovskou funkci fibonacci(N)!

disp(mujFibonacci(8))

% Vypoctete Fibonacciho posloupnost pro N+1 a N, kde N bude velmi velke
% cislo. Tyto dve cisla vydelte a ziskate priblizne hodnotu tzv. zlateho 
% rezu. Cim vyssi cislo zvolite, tim se vice priblizite k hodnote zlateho
% rezu. Overte si.

% 
% N = 1000
% 
% N1 = mujFibonacci(N)
% N2 = mujFibonacci(N-1)
% 
% disp(N1/N2)
 
% Zkuste napsat funkci, ktera rozlozi zadane cislo na soucet hodnot
% Fibonacciho posloupnosti. 

%%
% Pascalova matice
% napiste funkci, ktera pro argument N vrati hodnoty Pascalovi matice o
% rozmerech NxN. Pascalovu matici P iniciujte jako matici jednicek, pricemz
% hodnota P(i,j) bude souctem hodnoty predchoziho sloupce a predchoziho
% radku, tedy P(i,j)=P(i,j-1)+P(i-1,j). Nepouzivejte matlabovskou funkci
% pascal(N)!

fprintf("Pascal value: %d\n",pascal(3))




%%
% Mandelbrotova mnozina
% Napiste matici x s rozmerem NxN, ktera bude pro kazdy svuj radek 
% obsahovat vektor od minus dvou do jedne. Napiste matici y s rozmerem
% NxN, ktera bude pro kazdy svuj sloupec obsahovat vektor od -2 do 1.5. 
% Pozn. pbe matice lze vygenerovat najednou pomoci prikazu meshgrid (viz.
% napoveda). Pro zacatek zvolte hodnotu N na 100 (vetsi rozmer ma hezci 
% vysledek, ale delsi vypocet)
disp("Mandelbrot")

N = 1000;

[x,y] = meshgrid(linspace(-2, 1, N), linspace(-2, 1.5, N));


% Urcete z0 jako soucet x plus 1i*y.
z0 = x + 1i * y;


% Iniciujte promennou mandelbrot jako matici jednicek o rozmeru NxN
% Iniciujte matici z=z0

z = zeros(size(z0));
k = zeros(size(z0));


% Iterujte rovnici z = z.*z + z0. V kazde iteraci prictete k matici
% mandelbrot hodnotu jedna pouze pro ty pozice, kde je absolutni hodnota 
% matice z mensi nebo rovna 2.
% 
% Provedte cca 100 az 500 iteraci (vice iteraci hezci vysledek, ale delsi 
% vypocet).
% 

cnt_iter = 50

for i = 1:cnt_iter
    z = z.*z + z0;
    k(abs(z) > 2 & k == 0) = cnt_iter - i;
    fprintf("Iter cnt: %d\n", i)
end




% Promennou mandelbrot zlogaritmujte a vykreslete prikazem imagesc.
figure(1)


imagesc(log(k))

%%

disp("Mandelbrot")

N = 1000;

[x,y] = meshgrid(linspace(-2, 1, N), linspace(-2, 1.5, N));

z0 = x + 1i * y;

z = zeros(size(z0));
k = zeros(size(z0));

cnt_iter = 100

for i = 1:cnt_iter
    z = z.*z + z0;
    k(abs(z) > 2 & k == 0) = cnt_iter - i;
    fprintf("Iter cnt: %d\n", i)
end

figure(1)
imagesc(log(k))



%%
x = 0;
y = 1;
syms v u

axis off
hold on

for n = 1:8

    a = fibonacci(n);

    % Define squares and arcs
    switch mod(n,4)
        case 0
            y = y - fibonacci(n-2);
            x = x - a;
            eqnArc = (u-(x+a))^2 + (v-y)^2 == a^2;
        case 1
            y = y - a;
            eqnArc = (u-(x+a))^2 + (v-(y+a))^2 == a^2;
        case 2
            x = x + fibonacci(n-1);
            eqnArc = (u-x)^2 + (v-(y+a))^2 == a^2;
        case 3
            x = x - fibonacci(n-2);
            y = y + fibonacci(n-1);
            eqnArc = (u-x)^2 + (v-y)^2 == a^2;
    end

    % Draw square
    pos = [x y a a];
    rectangle('Position', pos)

    % Add Fibonacci number
    xText = (x+x+a)/2;
    yText = (y+y+a)/2;
    text(xText, yText, num2str(a))

    % Draw arc
    interval = [x x+a y y+a];
    fimplicit(eqnArc, interval, 'b')

end

