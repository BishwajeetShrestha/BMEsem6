function varargout = cycloids_export(varargin)
% CYCLOIDS_EXPORT M-file for cycloids_export.fig
%      CYCLOIDS_EXPORT, by itself, creates a new CYCLOIDS_EXPORT or raises the existing
%      singleton*.
%
%      H = CYCLOIDS_EXPORT returns the handle to a new CYCLOIDS_EXPORT or the handle to
%      the existing singleton*.
%
%      CYCLOIDS_EXPORT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CYCLOIDS_EXPORT.M with the given input arguments.
%
%      CYCLOIDS_EXPORT('Property','Value',...) creates a new CYCLOIDS_EXPORT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cycloids_export_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cycloids_export_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cycloids_export

% Last Modified by GUIDE v2.5 23-Sep-2002 22:45:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cycloids_export_OpeningFcn, ...
                   'gui_OutputFcn',  @cycloids_export_OutputFcn, ...
                   'gui_LayoutFcn',  @cycloids_export_LayoutFcn, ...
                   'gui_Callback',   []);
if nargin & isstr(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before cycloids_export is made visible.
function cycloids_export_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cycloids_export (see VARARGIN)

% Choose default command line output for cycloids_export
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cycloids_export wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cycloids_export_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function edit_prolate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_prolate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end




% --- Executes during object creation, after setting all properties.


% --- Executes on button press in pushbutton_plot.
function pushbutton_plot_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
r_in= str2double(get(handles.edit_prolate, 'String'));
r_out= str2double(get(handles.edit_curtate, 'String'));


%==================================================================
% cycloids_export.m
% ----------------------------------------------------------------------------
% ----------------------------------------------------------------------------
%This program is used to simulate the elliptic trammel, based on Eq. (3-4) on p. 66,
%in Kinematics and Dynamics of Machines, 2nd ed. by Martin, G.H., McGraw-Hill, 1982. 
% ----------------------------------------------------------------------------
r=1;                         %Radius of Rotating circle
b_in=r+r_in;%Distance from point to the center of rotating circle
b=r;
b_out=r+r_out;
x=[];y=[];x_in=[];y_in=[];x_out=[];y_out=[];
for theta=0:0.05:10;
   phi=0:0.1:6.3;
	c2Ox=r*theta;             %Center of Rotating circle
	c2Oy=r;
   c2x=c2Ox+r*cos(phi);      %Rotating circle
   c2y=c2Oy+r*sin(phi);
   
   xt=r*theta-b*sin(theta);  %Tracing point
   yt=r-b*cos(theta);
   x=[x,xt];					  %cychoid curve
   y=[y,yt];
   
   xt_in=r*theta-b_in*sin(theta);  %Tracing point
   yt_in=r-b_in*cos(theta);
   x_in=[x_in,xt_in];					  %cychoid curve- prolate
   y_in=[y_in,yt_in];

   xt_out=r*theta-b_out*sin(theta);  %Tracing point
   yt_out=r-b_out*cos(theta);
   x_out=[x_out,xt_out];					  %cychoid curve- curtate
   y_out=[y_out,yt_out];

   plot([0,10],[0,0], c2x,c2y, x,y, xt,yt,'o',...  %(Line, Circle, Curve, Point
       x_in,y_in, xt_in,yt_in,'o',...
       x_out,y_out, xt_out,yt_out,'o')
   axis('equal');
   xlim([-.5 11.5])
   ylim([-1 5])
%    axis ([-0.5 11.5 -3 7]);
   drawnow; %Completes pending drawing events and updates the figure window.
end

% --- Executes on button press in pushbutton_quit.
function pushbutton_quit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(gcf);




% --- Executes during object creation, after setting all properties.
function slider_prolate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_prolate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slider_prolate_Callback(hObject, eventdata, handles)
% hObject    handle to slider_prolate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.edit_prolate,'String',...
    num2str(get(handles.slider_prolate,'Value')));


% --- Executes during object creation, after setting all properties.
function edit_curtate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_curtate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function edit_prolate_Callback(hObject, eventdata, handles)
% hObject    handle to edit_prolate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_prolate as text
%        str2double(get(hObject,'String')) returns contents of edit_prolate as a double

val = str2num(get(handles.edit_prolate,'String'));
if isnumeric(val) & length(val)==1 & ...
    val >= get(handles.slider_prolate,'Min') & ...
    val <= get(handles.slider_prolate,'Max')
    set(handles.slider_prolate,'Value',val);
else
% Increment the error count, and display it
    handles.numberOfErrors = handles.numberOfErrors+1;
    set(handles.edit_prolate,'String',...
    [handles.errorString,num2str(handles.numberOfErrors)]);
end    
guidata(gcbo,handles); % store the changes...

function edit_curtate_Callback(hObject, eventdata, handles)
% hObject    handle to edit_curtate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_curtate as text
%        str2double(get(hObject,'String')) returns contents of edit_curtate as a double

val = str2num(get(handles.edit_curtate,'String'));
if isnumeric(val) & length(val)==1 & ...
    val >= get(handles.slider_curtate,'Min') & ...
    val <= get(handles.slider_curtate,'Max')
    set(handles.slider_curtate,'Value',val);
else
% Increment the error count, and display it
    handles.numberOfErrors = handles.numberOfErrors+1;
    set(handles.edit_curtate,'String',...
    [handles.errorString,num2str(handles.numberOfErrors)]);
end    
guidata(gcbo,handles); % store the changes...

% --- Executes during object creation, after setting all properties.
function slider_curtate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_curtate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background, change
%       'usewhitebg' to 0 to use default.  See ISPC and COMPUTER.
usewhitebg = 1;
if usewhitebg
    set(hObject,'BackgroundColor',[.9 .9 .9]);
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on slider movement.
function slider_curtate_Callback(hObject, eventdata, handles)
% hObject    handle to slider_curtate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.edit_curtate,'String',...
    num2str(get(handles.slider_curtate,'Value')));



% --- Creates and returns a handle to the GUI figure. 
function h1 = cycloids_export_LayoutFcn(policy)
% policy - create a new figure or use a singleton. 'new' or 'reuse'.

persistent hsingleton;
if strcmpi(policy, 'reuse') & ishandle(hsingleton)
    h1 = hsingleton;
    return;
end

h1 = figure(...
'Units','characters',...
'Color',[0.831372549019608 0.815686274509804 0.784313725490196],...
'Colormap',[0 0 0.5625;0 0 0.625;0 0 0.6875;0 0 0.75;0 0 0.8125;0 0 0.875;0 0 0.9375;0 0 1;0 0.0625 1;0 0.125 1;0 0.1875 1;0 0.25 1;0 0.3125 1;0 0.375 1;0 0.4375 1;0 0.5 1;0 0.5625 1;0 0.625 1;0 0.6875 1;0 0.75 1;0 0.8125 1;0 0.875 1;0 0.9375 1;0 1 1;0.0625 1 1;0.125 1 0.9375;0.1875 1 0.875;0.25 1 0.8125;0.3125 1 0.75;0.375 1 0.6875;0.4375 1 0.625;0.5 1 0.5625;0.5625 1 0.5;0.625 1 0.4375;0.6875 1 0.375;0.75 1 0.3125;0.8125 1 0.25;0.875 1 0.1875;0.9375 1 0.125;1 1 0.0625;1 1 0;1 0.9375 0;1 0.875 0;1 0.8125 0;1 0.75 0;1 0.6875 0;1 0.625 0;1 0.5625 0;1 0.5 0;1 0.4375 0;1 0.375 0;1 0.3125 0;1 0.25 0;1 0.1875 0;1 0.125 0;1 0.0625 0;1 0 0;0.9375 0 0;0.875 0 0;0.8125 0 0;0.75 0 0;0.6875 0 0;0.625 0 0;0.5625 0 0],...
'IntegerHandle','off',...
'InvertHardcopy',get(0,'defaultfigureInvertHardcopy'),...
'MenuBar','none',...
'Name','cycloids',...
'NumberTitle','off',...
'PaperPosition',get(0,'defaultfigurePaperPosition'),...
'Position',[80 10 112 32.3076923076923],...
'Renderer',get(0,'defaultfigureRenderer'),...
'RendererMode','manual',...
'Resize','off',...
'HandleVisibility','callback',...
'Tag','figure1',...
'UserData',zeros(1,0));

setappdata(h1, 'GUIDEOptions', struct(...
'active_h', 1.010021e+002, ...
'taginfo', struct(...
'figure', 2, ...
'text', 26, ...
'axes', 3, ...
'edit', 17, ...
'pushbutton', 7, ...
'frame', 7, ...
'togglebutton', 2, ...
'slider', 3), ...
'override', 0, ...
'release', 13, ...
'resize', 'none', ...
'accessibility', 'callback', ...
'mfile', 1, ...
'callbacks', 1, ...
'singleton', 1, ...
'syscolorfig', 1, ...
'lastSavedFile', 'C:\summer_02\erin\matlab_r13\kinmeatics\norton\cycloids.m'));


h2 = axes(...
'Parent',h1,...
'Units','characters',...
'ALim',get(0,'defaultaxesALim'),...
'ALimMode','manual',...
'CameraPosition',[0.5 0.5 9.16025403784439],...
'CameraPositionMode','manual',...
'CameraTarget',[0.5 0.5 0.5],...
'CameraTargetMode','manual',...
'CameraUpVector',[0 1 0],...
'CameraUpVectorMode','manual',...
'CameraViewAngle',6.60861036031192,...
'CameraViewAngleMode','manual',...
'CLim',get(0,'defaultaxesCLim'),...
'CLimMode','manual',...
'Color',get(0,'defaultaxesColor'),...
'ColorOrder',get(0,'defaultaxesColorOrder'),...
'DataAspectRatio',get(0,'defaultaxesDataAspectRatio'),...
'DataAspectRatioMode','manual',...
'PlotBoxAspectRatio',get(0,'defaultaxesPlotBoxAspectRatio'),...
'PlotBoxAspectRatioMode','manual',...
'Position',[3 4.46153846153846 105.8 18.9230769230769],...
'TickDir',get(0,'defaultaxesTickDir'),...
'TickDirMode','manual',...
'XColor',get(0,'defaultaxesXColor'),...
'XLim',get(0,'defaultaxesXLim'),...
'XLimMode','manual',...
'XTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1],...
'XTickLabel',{ '0  ' '0.1' '0.2' '0.3' '0.4' '0.5' '0.6' '0.7' '0.8' '0.9' '1  ' },...
'XTickLabelMode','manual',...
'XTickMode','manual',...
'YColor',get(0,'defaultaxesYColor'),...
'YLim',get(0,'defaultaxesYLim'),...
'YLimMode','manual',...
'YTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1],...
'YTickLabel',{ '0  ' '0.1' '0.2' '0.3' '0.4' '0.5' '0.6' '0.7' '0.8' '0.9' '1  ' },...
'YTickLabelMode','manual',...
'YTickMode','manual',...
'ZColor',get(0,'defaultaxesZColor'),...
'ZLim',get(0,'defaultaxesZLim'),...
'ZLimMode','manual',...
'ZTick',[0 0.5 1],...
'ZTickLabel','',...
'ZTickLabelMode','manual',...
'ZTickMode','manual',...
'Tag','axes_plot',...
'UserData',zeros(1,0));


h3 = get(h2,'title');

set(h3,...
'Parent',h2,...
'Color',[0 0 0],...
'HorizontalAlignment','center',...
'Position',[0.495934959349594 1.02642276422764 1.00005459937205],...
'VerticalAlignment','bottom',...
'HandleVisibility','off');

h4 = get(h2,'xlabel');

set(h4,...
'Parent',h2,...
'Color',[0 0 0],...
'HorizontalAlignment','center',...
'Position',[0.495934959349594 -0.0955284552845528 1.00005459937205],...
'VerticalAlignment','cap',...
'HandleVisibility','off');

h5 = get(h2,'ylabel');

set(h5,...
'Parent',h2,...
'Color',[0 0 0],...
'HorizontalAlignment','center',...
'Position',[-0.117886178861789 0.49390243902439 1.00005459937205],...
'Rotation',90,...
'VerticalAlignment','bottom',...
'HandleVisibility','off');

h6 = get(h2,'zlabel');

set(h6,...
'Parent',h2,...
'Color',[0 0 0],...
'HorizontalAlignment','right',...
'Position',[-0.638211382113821 1.46544715447154 1.00005459937205],...
'HandleVisibility','off',...
'Visible','off');

h7 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'ListboxTop',0,...
'Position',[19.8 24.9230769230769 35.8 6.69230769230769],...
'String',{ '' },...
'Style','frame',...
'Tag','frame5');


h8 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'FontWeight','bold',...
'ListboxTop',0,...
'Position',[9.8 0.0769230769230769 90.2 1.38461538461538],...
'String','Software copyright  2004 by The McGraw-Hill Companies, Inc.',...
'Style','text',...
'Tag','text1');


h9 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'Callback','cycloids_export(''pushbutton_plot_Callback'',gcbo,[],guidata(gcbo))',...
'ListboxTop',0,...
'Position',[2.8 28.3076923076923 10.8 2.53846153846154],...
'String','Plot',...
'Tag','pushbutton_plot');


h10 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'Callback','cycloids_export(''pushbutton_quit_Callback'',gcbo,[],guidata(gcbo))',...
'ListboxTop',0,...
'Position',[100.8 28.3076923076923 10.2 2.38461538461538],...
'String','Quit',...
'Tag','pushbutton_quit');


h11 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'BackgroundColor',[1 1 1],...
'Callback','cycloids_export(''edit_prolate_Callback'',gcbo,[],guidata(gcbo))',...
'CData',zeros(1,0),...
'FontSize',7,...
'ListboxTop',0,...
'Position',[33.6 25.7692307692308 7.2 1.38461538461538],...
'String','-.25',...
'Style','edit',...
'CreateFcn','cycloids_export(''edit_prolate_CreateFcn'',gcbo,[],guidata(gcbo))',...
'Tag','edit_prolate',...
'UserData',zeros(1,0));


h12 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'CData',zeros(1,0),...
'ListboxTop',0,...
'Position',[20.4 28.7692307692308 34.4 1.15384615384615],...
'String','Radial Distance inside the Circle',...
'Style','text',...
'Tag','text10',...
'UserData',zeros(1,0));


h13 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'FontSize',10,...
'FontWeight','bold',...
'ListboxTop',0,...
'Position',[25.8 29.7692307692308 23.2 1.53846153846154],...
'String','Cycloid - Prolate',...
'Style','text',...
'Tag','text23');


h14 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'Callback','cycloids_export(''slider_prolate_Callback'',gcbo,[],guidata(gcbo))',...
'ListboxTop',0,...
'Max',0,...
'Min',-0.5,...
'Position',[26.4 27.7692307692308 20 0.846153846153846],...
'String',{ '' },...
'Style','slider',...
'CreateFcn','cycloids_export(''slider_prolate_CreateFcn'',gcbo,[],guidata(gcbo))',...
'Tag','slider_prolate');


h15 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'ListboxTop',0,...
'Position',[60.2 25.1538461538462 36.4 6.46153846153846],...
'String',{ '' },...
'Style','frame',...
'Tag','frame6');


h16 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'BackgroundColor',[1 1 1],...
'Callback','cycloids_export(''edit_curtate_Callback'',gcbo,[],guidata(gcbo))',...
'CData',zeros(1,0),...
'FontSize',7,...
'ListboxTop',0,...
'Position',[74.2 25.9230769230769 6.8 1.23076923076923],...
'String','.25',...
'Style','edit',...
'CreateFcn','cycloids_export(''edit_curtate_CreateFcn'',gcbo,[],guidata(gcbo))',...
'Tag','edit_curtate',...
'UserData',zeros(1,0));


h17 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'CData',zeros(1,0),...
'ListboxTop',0,...
'Position',[60.8 28.7692307692308 34.4 1.15384615384615],...
'String','Radial Distance outside the Circle',...
'Style','text',...
'Tag','text24',...
'UserData',zeros(1,0));


h18 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'FontSize',10,...
'FontWeight','bold',...
'ListboxTop',0,...
'Position',[66.2 29.7692307692308 23.2 1.53846153846154],...
'String','Cycloid - Curtate',...
'Style','text',...
'Tag','text25');


h19 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'BackgroundColor',[0.9 0.9 0.9],...
'Callback','cycloids_export(''slider_curtate_Callback'',gcbo,[],guidata(gcbo))',...
'ListboxTop',0,...
'Max',0.5,...
'Position',[66.8 27.7692307692308 20 0.846153846153846],...
'String',{ '' },...
'Style','slider',...
'CreateFcn','cycloids_export(''slider_curtate_CreateFcn'',gcbo,[],guidata(gcbo))',...
'Tag','slider_curtate');



hsingleton = h1;


% --- Handles default GUIDE GUI creation and callback dispatch
function varargout = gui_mainfcn(gui_State, varargin)


%   GUI_MAINFCN provides these command line APIs for dealing with GUIs
%
%      CYCLOIDS_EXPORT, by itself, creates a new CYCLOIDS_EXPORT or raises the existing
%      singleton*.
%
%      H = CYCLOIDS_EXPORT returns the handle to a new CYCLOIDS_EXPORT or the handle to
%      the existing singleton*.
%
%      CYCLOIDS_EXPORT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CYCLOIDS_EXPORT.M with the given input arguments.
%
%      CYCLOIDS_EXPORT('Property','Value',...) creates a new CYCLOIDS_EXPORT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".

%   Copyright 1984-2002 The MathWorks, Inc.
%   $Revision: 1.4 $ $Date: 2002/05/31 21:44:31 $

gui_StateFields =  {'gui_Name'
                    'gui_Singleton'
                    'gui_OpeningFcn'
                    'gui_OutputFcn'
                    'gui_LayoutFcn'
                    'gui_Callback'};
gui_Mfile = '';
for i=1:length(gui_StateFields)
    if ~isfield(gui_State, gui_StateFields{i})
        error('Could not find field %s in the gui_State struct in GUI M-file %s', gui_StateFields{i}, gui_Mfile);        
    elseif isequal(gui_StateFields{i}, 'gui_Name')
        gui_Mfile = [getfield(gui_State, gui_StateFields{i}), '.m'];
    end
end

numargin = length(varargin);

if numargin == 0
    % CYCLOIDS_EXPORT
    % create the GUI
    gui_Create = 1;
elseif numargin > 3 & ischar(varargin{1}) & ishandle(varargin{2})
    % CYCLOIDS_EXPORT('CALLBACK',hObject,eventData,handles,...)
    gui_Create = 0;
else
    % CYCLOIDS_EXPORT(...)
    % create the GUI and hand varargin to the openingfcn
    gui_Create = 1;
end

if gui_Create == 0
    varargin{1} = gui_State.gui_Callback;
    if nargout
        [varargout{1:nargout}] = feval(varargin{:});
    else
        feval(varargin{:});
    end
else
    if gui_State.gui_Singleton
        gui_SingletonOpt = 'reuse';
    else
        gui_SingletonOpt = 'new';
    end
    
    % Open fig file with stored settings.  Note: This executes all component
    % specific CreateFunctions with an empty HANDLES structure.
    
    % Do feval on layout code in m-file if it exists
    if ~isempty(gui_State.gui_LayoutFcn)
        gui_hFigure = feval(gui_State.gui_LayoutFcn, gui_SingletonOpt);
    else
        gui_hFigure = local_openfig(gui_State.gui_Name, gui_SingletonOpt);            
        % If the figure has InGUIInitialization it was not completely created
        % on the last pass.  Delete this handle and try again.
        if isappdata(gui_hFigure, 'InGUIInitialization')
            delete(gui_hFigure);
            gui_hFigure = local_openfig(gui_State.gui_Name, gui_SingletonOpt);            
        end
    end
    
    % Set flag to indicate starting GUI initialization
    setappdata(gui_hFigure,'InGUIInitialization',1);

    % Fetch GUIDE Application options
    gui_Options = getappdata(gui_hFigure,'GUIDEOptions');
    
    if ~isappdata(gui_hFigure,'GUIOnScreen')
        % Adjust background color
        if gui_Options.syscolorfig 
            set(gui_hFigure,'Color', get(0,'DefaultUicontrolBackgroundColor'));
        end

        % Generate HANDLES structure and store with GUIDATA
        guidata(gui_hFigure, guihandles(gui_hFigure));
    end
    
    % If user specified 'Visible','off' in p/v pairs, don't make the figure
    % visible.
    gui_MakeVisible = 1;
    for ind=1:2:length(varargin)
        if length(varargin) == ind
            break;
        end
        len1 = min(length('visible'),length(varargin{ind}));
        len2 = min(length('off'),length(varargin{ind+1}));
        if ischar(varargin{ind}) & ischar(varargin{ind+1}) & ...
                strncmpi(varargin{ind},'visible',len1) & len2 > 1
            if strncmpi(varargin{ind+1},'off',len2)
                gui_MakeVisible = 0;
            elseif strncmpi(varargin{ind+1},'on',len2)
                gui_MakeVisible = 1;
            end
        end
    end
    
    % Check for figure param value pairs
    for index=1:2:length(varargin)
        if length(varargin) == index
            break;
        end
        try, set(gui_hFigure, varargin{index}, varargin{index+1}), catch, break, end
    end

    % If handle visibility is set to 'callback', turn it on until finished
    % with OpeningFcn
    gui_HandleVisibility = get(gui_hFigure,'HandleVisibility');
    if strcmp(gui_HandleVisibility, 'callback')
        set(gui_hFigure,'HandleVisibility', 'on');
    end
    
    feval(gui_State.gui_OpeningFcn, gui_hFigure, [], guidata(gui_hFigure), varargin{:});
    
    if ishandle(gui_hFigure)
        % Update handle visibility
        set(gui_hFigure,'HandleVisibility', gui_HandleVisibility);
        
        % Make figure visible
        if gui_MakeVisible
            set(gui_hFigure, 'Visible', 'on')
            if gui_Options.singleton 
                setappdata(gui_hFigure,'GUIOnScreen', 1);
            end
        end

        % Done with GUI initialization
        rmappdata(gui_hFigure,'InGUIInitialization');
    end
    
    % If handle visibility is set to 'callback', turn it on until finished with
    % OutputFcn
    if ishandle(gui_hFigure)
        gui_HandleVisibility = get(gui_hFigure,'HandleVisibility');
        if strcmp(gui_HandleVisibility, 'callback')
            set(gui_hFigure,'HandleVisibility', 'on');
        end
        gui_Handles = guidata(gui_hFigure);
    else
        gui_Handles = [];
    end
    
    if nargout
        [varargout{1:nargout}] = feval(gui_State.gui_OutputFcn, gui_hFigure, [], gui_Handles);
    else
        feval(gui_State.gui_OutputFcn, gui_hFigure, [], gui_Handles);
    end
    
    if ishandle(gui_hFigure)
        set(gui_hFigure,'HandleVisibility', gui_HandleVisibility);
    end
end    

function gui_hFigure = local_openfig(name, singleton)
if nargin('openfig') == 3 
    gui_hFigure = openfig(name, singleton, 'auto');
else
    % OPENFIG did not accept 3rd input argument until R13,
    % toggle default figure visible to prevent the figure
    % from showing up too soon.
    gui_OldDefaultVisible = get(0,'defaultFigureVisible');
    set(0,'defaultFigureVisible','off');
    gui_hFigure = openfig(name, singleton);
    set(0,'defaultFigureVisible',gui_OldDefaultVisible);
end

