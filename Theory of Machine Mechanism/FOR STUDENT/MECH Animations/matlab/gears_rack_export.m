function varargout = gears_rack_export(varargin)
% GEARS_RACK_EXPORT M-file for gears_rack_export.fig
%      GEARS_RACK_EXPORT, by itself, creates a new GEARS_RACK_EXPORT or raises the existing
%      singleton*.
%
%      H = GEARS_RACK_EXPORT returns the handle to a new GEARS_RACK_EXPORT or the handle to
%      the existing singleton*.
%
%      GEARS_RACK_EXPORT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GEARS_RACK_EXPORT.M with the given input arguments.
%
%      GEARS_RACK_EXPORT('Property','Value',...) creates a new GEARS_RACK_EXPORT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gears_rack_export_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gears_rack_export_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gears_rack_export

% Last Modified by GUIDE v2.5 17-Sep-2002 17:20:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gears_rack_export_OpeningFcn, ...
                   'gui_OutputFcn',  @gears_rack_export_OutputFcn, ...
                   'gui_LayoutFcn',  @gears_rack_export_LayoutFcn, ...
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


% --- Executes just before gears_rack_export is made visible.
function gears_rack_export_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gears_rack_export (see VARARGIN)

% Choose default command line output for gears_rack_export
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gears_rack_export wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gears_rack_export_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function edit_teeth_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_teeth_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit_teeth_number_Callback(hObject, eventdata, handles)
% hObject    handle to edit_teeth_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_teeth_number as text
%        str2double(get(hObject,'String')) returns contents of edit_teeth_number as a double


% --- Executes during object creation, after setting all properties.
function edit_pressure_angle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pressure_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit_pressure_angle_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pressure_angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pressure_angle as text
%        str2double(get(hObject,'String')) returns contents of edit_pressure_angle as a double


% --- Executes during object creation, after setting all properties.
function edit_diametral_pitch_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_diametral_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit_diametral_pitch_Callback(hObject, eventdata, handles)
% hObject    handle to edit_diametral_pitch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_diametral_pitch as text
%        str2double(get(hObject,'String')) returns contents of edit_diametral_pitch as a double


% --- Executes on button press in pushbutton_plot.
function pushbutton_plot_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
A = str2double(get(handles.edit_teeth_number,'String'));
B = str2double(get(handles.edit_diametral_pitch,'String'));
C = str2double(get(handles.edit_pressure_angle,'String'));

% gears_rack_export.m
%This program plots an involute gear. 
% ----------------------------------------------------------------------------
% Written by Shih-Liang (Sid) Wang	10/13/99
% ----------------------------------------------------------------------------
%The parameters of gear
A = str2double(get(handles.edit_teeth_number,'String'));
B = str2double(get(handles.edit_diametral_pitch,'String'));
C = str2double(get(handles.edit_pressure_angle,'String'));

%This subrountine is used to design involute rack 
%
%On entry: n  - number of teeth
%	        pd - diametral pitch
%
%On exit:  x,y coordinates
%
%function [xp,yp]=gp(n,pd,dfe)
% ----------------------------------------------------------------------------
%The parameters of gear
n=A;               %The number of teeth
pd=B;              %The diametral pitch
dfe=C;            %The pressure angle in degrees
fr=0.02;	          %The radius of fillet
p=3.1415/pd;       %The width of a whole tooth
% ----------------------------------------------------------------------------
%To declare variables
xp=zeros(4,1);
yp=zeros(4,1);
mm=zeros(2,8);
bb=zeros(2,3);
h=[];
g=[];
M=[];
% ----------------------------------------------------------------------------
%To calculate the base data of rack
fe=dfe*pi/180;      %pressure angle in radians
do=1/pd;            %tooth top high
dr=-1.25/pd;        %tooth root high
% ----------------------------------------------------------------------------
%To calculate the involute rack profile
xp(1)=0;
yp(1)=do;
xp(2)=p/4-do*tan(fe);
yp(2)=do;
xp(3)=p/4-dr*tan(fe);
yp(3)=dr;
xp(4)=p/2;
yp(4)=dr;
g=[g,xp,yp];
g=g';
% ----------------------------------------------------------------------------
%To reflecte about y axis
ff=[-1 0;0 1]*g;        %reflection 
for i=1:4;              %reverse the order of the points, easy for plotting
   f(1,i)=ff(1,5-i);
   f(2,i)=ff(2,5-i);
end
h=[h,f,g]              %the whole tooth profile
% ----------------------------------------------------------------------------
%Translation
for i=1:n;
	for j=1:8;
	   mm(1,j)=(i-1)*p+h(1,j);
	   mm(2,j)=h(2,j);
	end
M=[M,mm];
end
% ----------------------------------------------------------------------------
%To calculate the bottom and side profile of rack
bb(1,1)=M(1,8*n);
bb(2,1)=M(2,8*n)-1;
bb(1,2)=bb(1,1)-n*p;
bb(2,2)=bb(2,1);
bb(1,3)=bb(1,2);
bb(2,3)=bb(2,2)+1;
M=[M,bb];
% ----------------------------------------------------------------------------
plot (M(1,:),M(2,:))	  %plot the whole gear - the first row (x) and second row(y)
axis('equal')

% --- Executes on button press in pushbutton_quit.
function pushbutton_quit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(gcf);



% --- Creates and returns a handle to the GUI figure. 
function h1 = gears_rack_export_LayoutFcn(policy)
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
'Name','gears_rack',...
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
'active_h', 1.020033e+002, ...
'taginfo', struct(...
'figure', 2, ...
'text', 5, ...
'axes', 2, ...
'edit', 4, ...
'pushbutton', 3), ...
'override', 0, ...
'release', 13, ...
'resize', 'none', ...
'accessibility', 'callback', ...
'mfile', 1, ...
'callbacks', 1, ...
'singleton', 1, ...
'syscolorfig', 1, ...
'lastSavedFile', '\\Med-laptop\summer_02\erin\matlab_r13\kinmeatics\norton\gears_rack.m'));


h2 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'FontWeight','bold',...
'ListboxTop',0,...
'Position',[9.8 0.0769230769230769 90.2 1.38461538461538],...
'String','Software copyright  2004 by The McGraw-Hill Companies, Inc.',...
'Style','text',...
'Tag','text1');


h3 = axes(...
'Parent',h1,...
'Units','characters',...
'CameraPosition',[0.5 0.5 9.16025403784439],...
'CameraPositionMode',get(0,'defaultaxesCameraPositionMode'),...
'Color',get(0,'defaultaxesColor'),...
'ColorOrder',get(0,'defaultaxesColorOrder'),...
'Position',[9.8 3.76923076923077 92.8 23.2307692307692],...
'XColor',get(0,'defaultaxesXColor'),...
'YColor',get(0,'defaultaxesYColor'),...
'ZColor',get(0,'defaultaxesZColor'),...
'Tag','axes1');


h4 = get(h3,'title');

set(h4,...
'Parent',h3,...
'Color',[0 0 0],...
'HorizontalAlignment','center',...
'Position',[0.498922413793103 1.02152317880795 1.00005459937205],...
'VerticalAlignment','bottom',...
'HandleVisibility','off');

h5 = get(h3,'xlabel');

set(h5,...
'Parent',h3,...
'Color',[0 0 0],...
'HorizontalAlignment','center',...
'Position',[0.498922413793103 -0.0778145695364239 1.00005459937205],...
'VerticalAlignment','cap',...
'HandleVisibility','off');

h6 = get(h3,'ylabel');

set(h6,...
'Parent',h3,...
'Color',[0 0 0],...
'HorizontalAlignment','center',...
'Position',[-0.0614224137931035 0.495033112582781 1.00005459937205],...
'Rotation',90,...
'VerticalAlignment','bottom',...
'HandleVisibility','off');

h7 = get(h3,'zlabel');

set(h7,...
'Parent',h3,...
'Color',[0 0 0],...
'HorizontalAlignment','right',...
'Position',[-0.106681034482759 1.22350993377483 1.00005459937205],...
'HandleVisibility','off',...
'Visible','off');

h8 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'BackgroundColor',[1 1 1],...
'Callback','gears_rack_export(''edit_teeth_number_Callback'',gcbo,[],guidata(gcbo))',...
'ListboxTop',0,...
'Position',[18.4 28.3076923076923 16.2 1.61538461538462],...
'String','18',...
'Style','edit',...
'CreateFcn','gears_rack_export(''edit_teeth_number_CreateFcn'',gcbo,[],guidata(gcbo))',...
'Tag','edit_teeth_number');


h9 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'ListboxTop',0,...
'Position',[18.6 30.2307692307692 16.6 1.15384615384615],...
'String','Number of Teeth',...
'Style','text',...
'Tag','text2');


h10 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'BackgroundColor',[1 1 1],...
'Callback','gears_rack_export(''edit_pressure_angle_Callback'',gcbo,[],guidata(gcbo))',...
'ListboxTop',0,...
'Position',[69.8 28.3076923076923 16.2 1.61538461538462],...
'String','25',...
'Style','edit',...
'CreateFcn','gears_rack_export(''edit_pressure_angle_CreateFcn'',gcbo,[],guidata(gcbo))',...
'Tag','edit_pressure_angle');


h11 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'ListboxTop',0,...
'Position',[70 30.2307692307692 16.6 1.15384615384615],...
'String','Pressure Angle',...
'Style','text',...
'Tag','text3');


h12 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'BackgroundColor',[1 1 1],...
'Callback','gears_rack_export(''edit_diametral_pitch_Callback'',gcbo,[],guidata(gcbo))',...
'ListboxTop',0,...
'Position',[43.8 28.3076923076923 16.2 1.61538461538462],...
'String','8',...
'Style','edit',...
'CreateFcn','gears_rack_export(''edit_diametral_pitch_CreateFcn'',gcbo,[],guidata(gcbo))',...
'Tag','edit_diametral_pitch');


h13 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'ListboxTop',0,...
'Position',[44 30.2307692307692 16.6 1.15384615384615],...
'String','Diametral Pitch',...
'Style','text',...
'Tag','text4');


h14 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'Callback','gears_rack_export(''pushbutton_plot_Callback'',gcbo,[],guidata(gcbo))',...
'ListboxTop',0,...
'Position',[3 28.3076923076923 13.2 2.38461538461538],...
'String','Plot',...
'Tag','pushbutton_plot');


h15 = uicontrol(...
'Parent',h1,...
'Units','characters',...
'Callback','gears_rack_export(''pushbutton_quit_Callback'',gcbo,[],guidata(gcbo))',...
'ListboxTop',0,...
'Position',[93.8 28.3076923076923 13.2 2.38461538461538],...
'String','Quit',...
'Tag','pushbutton_quit');



hsingleton = h1;


% --- Handles default GUIDE GUI creation and callback dispatch
function varargout = gui_mainfcn(gui_State, varargin)


%   GUI_MAINFCN provides these command line APIs for dealing with GUIs
%
%      GEARS_RACK_EXPORT, by itself, creates a new GEARS_RACK_EXPORT or raises the existing
%      singleton*.
%
%      H = GEARS_RACK_EXPORT returns the handle to a new GEARS_RACK_EXPORT or the handle to
%      the existing singleton*.
%
%      GEARS_RACK_EXPORT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GEARS_RACK_EXPORT.M with the given input arguments.
%
%      GEARS_RACK_EXPORT('Property','Value',...) creates a new GEARS_RACK_EXPORT or raises the
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
    % GEARS_RACK_EXPORT
    % create the GUI
    gui_Create = 1;
elseif numargin > 3 & ischar(varargin{1}) & ishandle(varargin{2})
    % GEARS_RACK_EXPORT('CALLBACK',hObject,eventData,handles,...)
    gui_Create = 0;
else
    % GEARS_RACK_EXPORT(...)
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

