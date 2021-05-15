function varargout = detect_plate(varargin)
% DETECT_PLATE MATLAB code for detect_plate.fig
%      DETECT_PLATE, by itself, creates a new DETECT_PLATE or raises the existing
%      singleton*.
%
%      H = DETECT_PLATE returns the handle to a new DETECT_PLATE or the handle to
%      the existing singleton*.
%
%      DETECT_PLATE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DETECT_PLATE.M with the given input arguments.
%
%      DETECT_PLATE('Property','Value',...) creates a new DETECT_PLATE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before detect_plate_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to detect_plate_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help detect_plate

% Last Modified by GUIDE v2.5 15-May-2021 09:14:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @detect_plate_OpeningFcn, ...
                   'gui_OutputFcn',  @detect_plate_OutputFcn, ...
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


% --- Executes just before detect_plate is made visible.
function detect_plate_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to detect_plate (see VARARGIN)

% Choose default command line output for detect_plate
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes detect_plate wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = detect_plate_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
plate_car = imread('C:\Users\SALOOH\detection\product_11030346b.jpg');
imshow(plate_car)
pause(2)
temp_result = ocr(plate_car)
result= insertObjectAnnotation(plate_car,'rectangle',temp_result.WordBoundingBoxes,temp_result.WordConfidences);
rr = temp_result.Text
class(temp_result);
imshow(result);
set(handles.text2,'String',rr);
set(handles.edit1,'String',rr);

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
