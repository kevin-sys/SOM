clc,clear
P=[0.3 0.6 0.9; 0.9 0.8 0.2; 0.8 0.9 0.9];
N=[0.3 0.3 0.4 0.4; 0.7 0.3 0.2 0.8; 0.5 0.1 0.4 1];

% Pregunta=input('¿Desea ver la grafica inicial de la matriz de pesos? [SI 1/0 NO]');
% if Pregunta==1
%plotpc(P,N);

TamanoMatrizNeurona= size(N,2);
TamanoMatrizPesos= size(P,2);

op=1;
CoeficienteVecindad=input('Ingrese el coeficiente de vecindad: ');
while op<=1000
    for k=1:TamanoMatrizPesos
        for j=1:TamanoMatrizNeurona
            DistanciaEuclidiana(j,k)=[sqrt((P(k,1)-N(1,j))^2+(P(k,2)-N(2,j))^2+(P(k,3)-N(3,j))^2)]

            aux=1;
            Columna=DistanciaEuclidiana(:,aux);
            MenorDistancia(:) = min(Columna);

            DT=MenorDistancia+CoeficienteVecindad;
            aux=aux+1;

        end
    end
    % disp('VALORES DE LAS DISTANCIAS DE LAS NEURONAS VECINAS Y VENCEDORA');
    % for j=1:TamanoMatrizNeurona
    %
    % end
    % end
    for k=1:TamanoMatrizPesos
        for j=1:TamanoMatrizNeurona
            if DT >Columna(j)
                % disp(Columna(j));
                N(k,j)=[N(k,j)+1*MenorDistancia];
            end
        end
    end
    op=op+1
end

