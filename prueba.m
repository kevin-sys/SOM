%inputVectorNames es un arreglo con los nombre de los animales
inputVectorNames = dlmread('names.dat');
%inputVectors es una matriz de 101 x 17 columnas con las caracteristicas de
cada animal
inputVectors = dlmread('zoo.dat');
%Descarto el atributo de tipo
NroClase = inputVectors(:,17);
inputVectors(:,17) = [];
inputVectorSize = size(inputVectors);
%Rango de los valores de entrada
inputVectorRange = [1,1,1,1,1,1,1,1,1,1,1,1,8,1,1,1];
[CantPatrones, entradas] = size(inputVectors);
%Escalar los datos de entradas
for i=1:CantPatrones,
inputVectors(i,13) = inputVectors(i,13)/8;
end
[CantPatrones, entradas] = size(inputVectors);
%escalar las entradas entre 0 y 1
menor = min(inputVectors,[],1);
mayor = max(inputVectors,[],1);
for c = 1:entradas,
inputVectors(:,c) = (inputVectors(:,c)-menor(c)*ones(CantPatrones,1))/(mayor(c)-menor(c))
end
% Disposicion de las neuronas de la capa oculta
fil_ocultas = 8;
col_ocultas = 6;
pos=gridtop( col_ocultas, fil_ocultas);
pasos=linkdist(pos);
ocultas = fil_ocultas * col_ocultas;
W = 0.5 * ones(ocultas, entradas);
ITE_MAX = 150;
ite = 0;
alfa = 0.25;
cambio = 1;
cambio=1;
vecinas = 3;
intervalo = 20;
ite0 = 0
while ( ite <= ITE_MAX ) & ~(( ite0>intervalo ) & ( cambio<0.000000001 )),
W_vie = W;
ite = ite + 1;
for i=1:CantPatrones,
% Buscando la neurona ganadora
DMax = -sqrt( sum((inputVectors(i,:) - W(1,:)).^2));
mayor = 1;
for j=2:ocultas,
Dist = -sqrt( sum((inputVectors(i,:) - W(j,:)).^2) );
if Dist > DMax
126
DMax = Dist;
mayor = j;
end
end
%Actualizar la neurona mas proxima
for entra = 1:entradas,
W(mayor, entra) = W(mayor, entra) +alfa * (inputVectors(i, entra) - W(mayor, entra));
end
%Actualizar la neurona ganadora y su vecindad
for ventana = 1:ocultas,
if pasos(mayor, ventana)<=vecinas,
for entra = 1:entradas,
W(ventana, entra) = W(ventana, entra) +alfa * (inputVectors(i,entra) - W(ventana, entra));
end
end
end
end
if (vecinas>=1) & (mod(ite,intervalo)==0), vecinas = vecinas-1; end
if (vecinas==0),
ite0 = ite0 + 1;
end;
cambio = sum(sqrt(sum((W-W_vie).^2,2)));
end
% termino el entrenamiento
% calcular para cada clase la lista de patrones que contiene
clases = [];
clases = zeros(ocultas,max(NroClase));
nombre = cell(ocultas,ocultas,50);
for i = 1:CantPatrones,
%Calcular la neurona ganadora
DMax = -sqrt( sum((inputVectors(i,:) - W(1,:)).^2));
mayor = 1;
for j=2:ocultas,
Dist = -sqrt( sum((inputVectors(i,:) - W(j,:)).^2) );
if Dist > DMax
DMax = Dist;
mayor = j;
end
end
ClaseOriginal = NroClase(i);
clases(mayor, ClaseOriginal) = clases(mayor, ClaseOriginal) + 1;
nombre(mayor, ClaseOriginal, clases(mayor, ClaseOriginal)) ={[char(inputVectorNames(i,:))]};
end
mapa = cell(fil_ocultas, col_ocultas);
for nro = 1:ocultas,
fila = fil_ocultas - floor( (nro-1)/col_ocultas );
col = mod( (nro-1), col_ocultas ) + 1;
texto = '';
for cl =1:max(NroClase),
if clases(nro, cl)>0,
if texto ~= '',
texto = strcat(texto, ' ; ');
end
texto = strcat(texto , 'c', int2str(cl), '-->',int2str(clases(nro,cl)));
end;
end;
mapa(fila,col) = {[texto]};
end;