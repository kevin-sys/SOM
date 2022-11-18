function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 07-Nov-2022 15:28:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Btn1.
function Btn1_Callback(hObject, eventdata, handles)
% hObject    handle to Btn1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
c=str2double(get(handles.cf,'String'));
CoeficienteVecindad=c;
clc,clear
P=[0.3 0.6 0.9; 0.9 0.8 0.2; 0.8 0.9 0.9];
N=[0.3 0.3 0.4 0.4; 0.7 0.3 0.2 0.8; 0.5 0.1 0.4 1];

% Pregunta=input('¿Desea ver la grafica inicial de la matriz de pesos? [SI 1/0 NO]');
% if Pregunta==1
%plotpc(P,N);
TamanoMatrizNeurona= size(N,2);
TamanoMatrizPesos= size(P,2);
op=1;
while op<=1
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





function cf_Callback(hObject, eventdata, handles)
% hObject    handle to cf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cf as text
%        str2double(get(hObject,'String')) returns contents of cf as a double


% --- Executes during object creation, after setting all properties.
function cf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
