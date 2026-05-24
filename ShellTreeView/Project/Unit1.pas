unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Shell.ShellCtrls, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ToolWin, Vcl.Menus, Winapi.ShlObj, Vcl.ExtCtrls,
  Vcl.Shell.Utils, Vcl.FileCtrl, System.Win.ComObj, WinApi.ActiveX,
  Winapi.ShellAPI, WinApi.SHFolder, Vcl.Buttons, System.Zip, Vcl.Clipbrd,
  System.IOUtils;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    ToolButton2: TToolButton;
    Edit1: TEdit;
    Panel1: TPanel;
    ShellTreeView1: TShellTreeView;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Edit2: TEdit;
    Panel2: TPanel;
    ShellListView1: TShellListView;
    Close1: TMenuItem;
    View1: TMenuItem;
    Root1: TMenuItem;
    StartMenu1: TMenuItem;
    Programs1: TMenuItem;
    Desktop1: TMenuItem;
    StartUp1: TMenuItem;
    Icon1: TMenuItem;
    List1: TMenuItem;
    Report1: TMenuItem;
    Small1: TMenuItem;
    Refresh1: TMenuItem;
    N1: TMenuItem;
    New1: TMenuItem;
    Folder1: TMenuItem;
    Bitmap1: TMenuItem;
    N2: TMenuItem;
    MicrosoftOfficeWordDocument1: TMenuItem;
    WinRARArchiv1: TMenuItem;
    extDocument1: TMenuItem;
    MicrosoftOfficeExcelDocum1: TMenuItem;
    WinRARZipArchiv1: TMenuItem;
    Shortcut1: TMenuItem;
    ConsoleApplication1: TMenuItem;
    Editor1: TMenuItem;
    N3: TMenuItem;
    Properties1: TMenuItem;
    Grid1: TMenuItem;
    N5: TMenuItem;
    Panel3: TPanel;
    Image1: TImage;
    ShortcutFiles1: TMenuItem;
    Powershell1: TMenuItem;
    RegistryEditor1: TMenuItem;
    Extras1: TMenuItem;
    Timer1: TTimer;
    ShowFolders1: TMenuItem;
    ShowFiles1: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    About1: TMenuItem;
    Control1: TMenuItem;
    askmanager1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Services1: TMenuItem;
    DiskCleaner1: TMenuItem;
    MSInfo1: TMenuItem;
    N10: TMenuItem;
    Resourcemonitor1: TMenuItem;
    DirectX1: TMenuItem;
    DiskManager1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    GroupPolicies1: TMenuItem;
    DeviceManager1: TMenuItem;
    UserGroups1: TMenuItem;
    PerformanceMonitor1: TMenuItem;
    SharedFolders1: TMenuItem;
    Zip1: TMenuItem;
    N13: TMenuItem;
    PopupMenu1: TPopupMenu;
    Paste1: TMenuItem;
    New2: TMenuItem;
    Folder2: TMenuItem;
    ShortcutFolder1: TMenuItem;
    ShortcutFiles2: TMenuItem;
    N14: TMenuItem;
    Bitmap2: TMenuItem;
    MicrosoftOfficeWordDocument2: TMenuItem;
    WinRARArchiv2: TMenuItem;
    extDocument2: TMenuItem;
    MicrosoftOfficeExcelWorksheet1: TMenuItem;
    WinRARZipArchiv2: TMenuItem;
    WinRARZipArchiv1Click1: TMenuItem;
    Refresh2: TMenuItem;
    View2: TMenuItem;
    Icon2: TMenuItem;
    List2: TMenuItem;
    Report2: TMenuItem;
    Small2: TMenuItem;
    N15: TMenuItem;
    Grid2: TMenuItem;
    N16: TMenuItem;
    ShowFolders2: TMenuItem;
    ShowFiles2: TMenuItem;
    ShareFolder1: TMenuItem;
    N17: TMenuItem;
    Options1: TMenuItem;
    Computer1: TMenuItem;
    Network1: TMenuItem;
    RecycleBin1: TMenuItem;
    AppData1: TMenuItem;
    Favorites1: TMenuItem;
    Fonts1: TMenuItem;
    Internet1: TMenuItem;
    Personal1: TMenuItem;
    Printers1: TMenuItem;
    Recent1: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    procedure ToolButton1Click(Sender: TObject);
    procedure ShellTreeView1Click(Sender: TObject);
    procedure ShellListView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton2Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure ShellListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure StartMenu1Click(Sender: TObject);
    procedure Programs1Click(Sender: TObject);
    procedure Desktop1Click(Sender: TObject);
    procedure StartUp1Click(Sender: TObject);
    procedure Icon1Click(Sender: TObject);
    procedure List1Click(Sender: TObject);
    procedure Report1Click(Sender: TObject);
    procedure Small1Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure ShellListView1Click(Sender: TObject);
    procedure Folder1Click(Sender: TObject);
    procedure Bitmap1Click(Sender: TObject);
    procedure MicrosoftOfficeWordDocument1Click(Sender: TObject);
    procedure WinRARArchiv1Click(Sender: TObject);
    procedure extDocument1Click(Sender: TObject);
    procedure MicrosoftOfficeExcelDocum1Click(Sender: TObject);
    procedure WinRARZipArchiv1Click(Sender: TObject);
    procedure Shortcut1Click(Sender: TObject);
    procedure ConsoleApplication1Click(Sender: TObject);
    procedure Editor1Click(Sender: TObject);
    procedure Properties1Click(Sender: TObject);
    procedure Grid1Click(Sender: TObject);
    procedure ShellTreeView1DblClick(Sender: TObject);
    procedure ShortcutFiles1Click(Sender: TObject);
    procedure Powershell1Click(Sender: TObject);
    procedure RegistryEditor1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure ShowFolders1Click(Sender: TObject);
    procedure ShowFiles1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Control1Click(Sender: TObject);
    procedure askmanager1Click(Sender: TObject);
    procedure Services1Click(Sender: TObject);
    procedure DiskCleaner1Click(Sender: TObject);
    procedure MSInfo1Click(Sender: TObject);
    procedure Resourcemonitor1Click(Sender: TObject);
    procedure DirectX1Click(Sender: TObject);
    procedure DiskManager1Click(Sender: TObject);
    procedure GroupPolicies1Click(Sender: TObject);
    procedure DeviceManager1Click(Sender: TObject);
    procedure UserGroups1Click(Sender: TObject);
    procedure PerformanceMonitor1Click(Sender: TObject);
    procedure SharedFolders1Click(Sender: TObject);
    procedure Zip1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure ShowFolders2Click(Sender: TObject);
    procedure ShowFiles2Click(Sender: TObject);
    procedure ShareFolder1Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure Computer1Click(Sender: TObject);
    procedure Network1Click(Sender: TObject);
    procedure RecycleBin1Click(Sender: TObject);
    procedure AppData1Click(Sender: TObject);
    procedure Favorites1Click(Sender: TObject);
    procedure Fonts1Click(Sender: TObject);
    procedure Internet1Click(Sender: TObject);
    procedure Personal1Click(Sender: TObject);
    procedure Printers1Click(Sender: TObject);
    procedure Recent1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

{ Here are constants and variables for sharing folders within a network. }
const
  SType_DiskTree = 0;
  Access_Read = 1;
  Access_All = 127;
  Nerr_Success = 0;

type
  TShareInfo2ExW = record        // LoadLibrary('Netapi32.dll');
   shi2_NetName: PWideChar;      // network domain name
   shi2_Type: Longword;          // locate path and write
   shi2_Remark: PWideChar;       // type comment
   shi2_Permissions: Longword;   // Setting User Permissions read or write
   shi2_Max_Uses: Longword;      // No fixed upper limit for maximum API usage
   shi2_Current_Uses: Longword;  // local system user name
   shi2_Path: PWideChar;         // system folder path
   shi2_Passwd: PWideChar;       // system/network password Password
  end;

  TShareInfo2ExA= record         // LoadLibrary('Svrapi.dll');
   shi2_NetName: PAnsiChar;      // network domain name
   shi2_Type: Longword;          // locate path and write
   shi2_Remark: PAnsiChar;       // type comment
   shi2_Permissions: Longword;   // Setting User Permissions read or write
   shi2_Max_Uses: Longword;      // No fixed upper limit for maximum API usage
   shi2_Current_Uses: Longword;  // local system user name
   shi2_Path: PAnsiChar;         // system folder path
   shi2_Passwd: PAnsiChar;       // system/network password Password
end;

type
  TNetShareAddFunc = function (servername: PChar; level: Longword;
                      const buf: Pointer;
                      parm_err: PLongWord): LongWord; stdcall;

implementation

{$R *.dfm}
// Determine whether the drive exists.

{ Use `Char` for a single character.
  Use `PChar` for a multi character.
  Use `PAnsiChar` for a Whole word   best methode
  Use `PWideChar` for a Whole word }

function DriveExists(const DriveLetter: PAnsiChar): Boolean;
var
  OldErrorMode: UINT;
  RootPath: string;
begin
  // Suppress critical Windows errors/pop-ups (e.g., for empty CD drives)
  OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
  try
    RootPath := UpperCase(DriveLetter) + ':\';
    // Check if the drive exists and is a directory.
    Result := DirectoryExists(RootPath);
  finally
    // Restore previous error mode
    SetErrorMode(OldErrorMode);
  end;
end;

// Determine File Size
function Get_File_Size4(const S: string): Int64;
var
  FD: TWin32FindData;
  FH: THandle;
begin
  FH := FindFirstFile(PChar(S), FD);
  if FH = INVALID_HANDLE_VALUE then Result := 0
  else
    try
      Result := FD.nFileSizeHigh;
      Result := Result shl 32;
      Result := Result + FD.nFileSizeLow;
    finally
      //CloseHandle(FH);  // Can cause an exception error.
    end;
end;

{ ShareDirA is a custom function designed to share a directory on a
  Windows network as an ANSI string variant. The suffix "A"
  stands for ANSI, while its counterpart, ShareDirW, handles
  Unicode (WideString). }
function ShareDirA(const ADir, AName, APassword: string; ReadOnly: Boolean): Boolean;
var
  Info: TShareInfo2ExA;
  Err: Longword;
  Lib: THandle;
  // pointer type used to dynamically load and call the Windows API function
  NetShareAddFunc: TNetShareAddFunc;
begin
  Result:=False;
  { Svrapi.dll is an obsolete Windows API library (Server Message Block)
    that has been replaced by Netapi32.dll in modern operating systems.
    It was formerly required for network shares (NetShareAdd, etc.). }
  Lib:= LoadLibrary('Svrapi.dll');

  if Lib <> 0 then
  begin
    try
      // programmatically share a folder in Delphi, you don't need a
      // third-party library. You can directly call the native Windows
      // NetShareAdd API, which is exported by netapi32.dll.
      @NetShareAddFunc:= GetProcAddress(Lib,'NetShareAdd');
      if @NetShareAddFunc <> nil then
      begin
         FillChar(Info, SizeOf(Info), 0);
         Info.shi2_netname := PAnsiChar(AName);
         Info.shi2_type := SType_DiskTree;
         Info.shi2_remark := nil;
         if ReadOnly then
           Info.shi2_permissions := Access_Read
         else
           Info.shi2_permissions := Access_All;
           Info.shi2_max_uses := LongWord(-1);
           Info.shi2_current_uses := 0;
           Info.shi2_path := PAnsiChar(ADir);
           Info.shi2_passwd := PAnsiChar(APassword);
           Result := NetShareAddFunc(nil, 2, @Info, @Err) = NERR_SUCCESS;
      end
      else
        RaiseLastOSError;
    finally
      FreeLibrary(Lib);
    end;
  end;
end;

{ ShareDirW is a custom wrapper function commonly used in older community
  scripts to share local directories over a Windows network. It provides
  a Unicode/WideString-based implementation for Windows NT-family operating
  systems.The function handles network folder creation and relies directly
  on the underlying Windows API NetShareAdd from lmshare.h }
function ShareDirW(const ADir, AName, APassword: WideString; ReadOnly: Boolean): Boolean;
var
  Info: TShareInfo2ExW;
  Err: Longword;
  Lib: THandle;
  NetShareAddFunc: TNetShareAddFunc;
begin
  Result:=False;
  { Netapi32.dll provides access to Windows Network Management APIs,
    which handle user accounts, network shares, and local system
    configurations. }
  Lib:= LoadLibrary('Netapi32.dll');

  if Lib <> 0 then
  begin
    try
      @NetShareAddFunc:= GetProcAddress(Lib,'NetShareAdd');
      if @NetShareAddFunc <> nil then
      begin
       FillChar(Info, SizeOf(Info), 0);
       Info.shi2_netname := PWideChar(AName);
       Info.shi2_type := SType_DiskTree;
       Info.shi2_remark := nil;
       if ReadOnly then
         Info.shi2_permissions := Access_Read
       else
         Info.shi2_permissions := Access_All;
       Info.shi2_max_uses := LongWord(-1);
       Info.shi2_current_uses := 0;
       Info.shi2_path := PWideChar(ADir);
       Info.shi2_passwd := PWideChar(APassword);
       Result := NetShareAddFunc(nil, 2, @Info, @Err) = Nerr_Success;
      end
      else
        RaiseLastOSError;
    finally
      FreeLibrary(Lib);
    end;
  end;
end;

{ ShareDir is typically a custom helper function used by developers to
  programmatically share a local directory over a Windows network.
  It relies on Windows API functions like NetShareAdd to grant network
  access, bypassing the need to configure shares manually through
  the Windows GUI. }
function ShareDir(const ADir, AName, APassword: WideString; ReadOnly: Boolean): Boolean;
begin
if Win32Platform = VER_PLATFORM_WIN32_WINDOWS then
  Result := ShareDirA(ADir, AName, APassword, ReadOnly)
else
  Result := ShareDirW(ADir, AName, APassword, ReadOnly);
end;

{ The standard TShellListView component in Delphi does not natively
  feature built-in copy-and-paste functionality for Windows Explorer
  actions. The component serves primarily as a pure display of the
  file system. }

{ To replicate the file copying, cutting, and pasting functionality
  found in Windows Explorer, you must interact with the native Windows
  Shell interfaces (IShellFolder and IContextMenu). The Solution:
  Tapping into the Windows Shell Context Menu. Through the IContextMenu
  interface, you can directly instruct Windows to execute system-wide
  commands—such as 'copy', 'cut', or 'paste'—on the current directory.
  This allows Windows to automatically handle clipboard interactions,
  progress dialogs, and any potential file conflicts. Here is a proven
  method for implementing these commands within your TShellListView: }

{ Procedure EXAMPLE:
  uses
    ActiveX, ShlObj, ShellAPI;

procedure ExecuteShellCommand(const ShellListView: TShellListView; const Command: string);
var
  ParentFolder: IShellFolder;
  ContextMenu: IContextMenu;
  InvokeInfo: TCMInvokeCommandInfo;
  Pidl: PItemIDList;
  Cidls: PItemIDList;
  ItemCount: Integer;
begin
  // Den übergeordneten Shell-Ordner des aktuellen Verzeichnisses holen
  ParentFolder := ShellListView.Folder.ShellFolder;
  if ParentFolder = nil then Exit;
  ItemCount := ShellListView.SelCount;
  if (Command = 'paste') or (ItemCount = 0) then
  begin
    // Für "Einfügen" oder wenn nichts ausgewählt ist, nutzen wir den Ordner selbst
    if Succeeded(ParentFolder.GetUIObjectOf(ShellListView.Handle, 0, Pidl, IID_IContextMenu, nil, Pointer(ContextMenu))) then
    begin
      ZeroMemory(@InvokeInfo, SizeOf(InvokeInfo));
      InvokeInfo.cbSize := SizeOf(TCMInvokeCommandInfo);
      InvokeInfo.hwnd := ShellListView.Handle;
      InvokeInfo.lpVerb := PAnsiChar(AnsiString(Command));
      ContextMenu.InvokeCommand(InvokeInfo);
    end;
  end;
end;
}

// Create copy-paste function for TShellListView component
procedure PasteFilesToShellListView(AShellListView: TShellListView);
var
  hDropHandle: THandle;
  FileCount: Integer;
  I: Integer;
  BufferSize: Integer;
  FilePath: array[0..MAX_PATH] of Char;
  SourceFiles: string;
  DestFolder: string;
  FileOp: TSHFileOpStruct;
begin
  // Check whether there are any files in the clipboard at all.
  if not Clipboard.HasFormat(CF_HDROP) then
    Exit;
  SourceFiles := '';
  Clipboard.Open;
  try
    hDropHandle := Clipboard.GetAsHandle(CF_HDROP);
    if hDropHandle <> 0 then
    begin
      // Determine the number of copied files
      FileCount := DragQueryFile(hDropHandle, $FFFFFFFF, nil, 0);
      // Read file paths and separate with #0 (Requirement for SHFileOperation)
      for I := 0 to FileCount - 1 do
      begin
        DragQueryFile(hDropHandle, I, FilePath, MAX_PATH);
        SourceFiles := SourceFiles + string(FilePath) + #0;
      end;
    end;
  finally
    Clipboard.Close;
  end;
  if SourceFiles = '' then
    Exit;
  // Double null-byte termination at the end of the list is mandatory!
  SourceFiles := SourceFiles + #0;
  // Determine the current target directory of the ShellListView.
  DestFolder := AShellListView.RootFolder.PathName;
  if DestFolder = '' then
    Exit;
  DestFolder := IncludeTrailingPathDelimiter(DestFolder) + #0;
  // Configure and Execute Windows File Operation (Copy)
  FillChar(FileOp, SizeOf(FileOp), 0);
  FileOp.wFunc  := FO_COPY;
  FileOp.pFrom  := PChar(SourceFiles);
  FileOp.pTo    := PChar(DestFolder);
  FileOp.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMMKDIR; // Enables "Undo" in Windows
  if SHFileOperation(FileOp) = 0 then
  begin
    // Important: Refresh ShellListView so that the new files become visible.
    AShellListView.Refresh;
  end;
end;

// Determines the folder name in the file system.
function ExtractDirName(Path:string):string;
var
  i:integer;
begin
  // Check if last Char is \
  if Pos('\', Path[Length(Path)]) = 1 then
    Path:=Copy(Path,1,Length(Path) - 1);
  // Extract Directory Name
  for i:=Length(Path) downto 0 do
    if Pos('\', Path[i]) = 1 then
    begin
      Result:=Copy(Path,i+1,Length(Path)-i);
      Exit;
    end;
end;

// Change or adjust the size of an icon
function ResizeHIcon(OriginalIcon: HICON; NewWidth, NewHeight: Integer): HICON;
var
  IconInfo: TIconInfo;
begin
  Result := 0;
  if GetIconInfo(OriginalIcon, IconInfo) then
  try
    // Copy and scale the mask bitmap
    IconInfo.hbmMask := CopyImage(IconInfo.hbmMask,
                                  IMAGE_BITMAP,
                                  NewWidth,
                                  NewHeight,
                                  LR_COPYFROMRESOURCE);
    // Copy and scale the color bitmap
    IconInfo.hbmColor := CopyImage(IconInfo.hbmColor,
                                   IMAGE_BITMAP,
                                   NewWidth,
                                   NewHeight,
                                   LR_COPYFROMRESOURCE);
    // Create the new resized HICON from the updated info
    Result := CreateIconIndirect(IconInfo);
  finally
    // Clean up temporary bitmaps created by GetIconInfo
    if IconInfo.hbmMask <> 0 then DeleteObject(IconInfo.hbmMask);
    if IconInfo.hbmColor <> 0 then DeleteObject(IconInfo.hbmColor);
  end;
end;

{ The Windows API function SHGetFileInfo is used in Delphi to retrieve
  system information about a file or folder. This includes the
  associated icon, the system display name, and the file type
  description (e.g., "Text Document"). The function is located in the
  Winapi.ShellAPI unit (or ShellApi in older Delphi versions). }
function FileIconHandle (fileName : string) : hIcon;
var
  fileInfo : shFileInfo;
begin
  FillChar (fileInfo, SizeOf (fileInfo), 0);
  if shGetFileInfo (PChar (fileName), 0, fileInfo, 0, shgfi_Icon) <> 0 then
    result := fileInfo.hIcon
  else
    result := 0;
end;

// Execution of the Windows properties menu
procedure PropertiesDialog(const aFilename: string);
var
  sei: ShellExecuteInfo;
begin
  try
    // Procedure to fill a specific memory area with an identical byte value
    FillChar(sei, SizeOf(sei), 0);
    sei.cbSize := SizeOf(sei);
    sei.lpFile := PChar(aFilename);
    sei.lpVerb := 'properties';
    { uses the constant SEE_MASK_INVOKEIDLIST to display the native
      Windows Properties dialog for a file or folder using the
      Windows API function ShellExecuteEx. }
    sei.fMask  := SEE_MASK_INVOKEIDLIST;
    { Unlike the simpler ShellExecute, ShellExecuteEx enables additional
      control functions via this handle—such as waiting for the launched
      process to terminate. }
    ShellExecuteEx(@sei);
  except
    on E: Exception do
        ShowMessage(E.Message);
  end;
end;

{ To create a Windows shortcut (.lnk file), the COM interface of the
  Windows Shell (IShellLink and IPersistFile) is used. }
procedure CreateLink(const PathObj, PathLink, Desc, Param: string);
var
  IObject: IUnknown;
  SLink: IShellLink;
  PFile: IPersistFile;
begin
  // Initialize the ShellLink COM object.
  IObject:=CreateComObject(CLSID_ShellLink);
  SLink:=IObject as IShellLink;
  PFile:=IObject as IPersistFile;
  with SLink do
  begin
    // Set Target Path and Properties
    SetArguments(PChar(Param));
    SetDescription(PChar(Desc));
    SetPath(PChar(PathObj));
  end;
  PFile.Save(PWChar(WideString(PathLink)), FALSE); // create link
end;

// Creating a Folder Link
procedure SelectFolder;
var
  FileOpenDlg: TFileOpenDialog;
  SelectedPath: string;
begin
  FileOpenDlg := TFileOpenDialog.Create(nil);
  try
    // Customize Dialog Title
    FileOpenDlg.Title := 'Select a folder.';
    // This is where behavior is controlled.
    // For folder selection: Add fdoPickFolders.
    // For file selection: Remove fdoPickFolders.
    FileOpenDlg.Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
    // Display and Evaluate Dialog
    if FileOpenDlg.Execute then
    begin
      SelectedPath := ExtractDirName(FileOpenDlg.FileName);
      // The further processing of the path takes place here.
      CreateLink(FileOpenDlg.FileName , Form1.ShellTreeView1.Path + '\' +
                  SelectedPath + '.lnk','','');
    end;
  finally
    Form1.ShellListView1.Refresh;
    FileOpenDlg.Free;
  end;
end;
// Creating a File Link
procedure SelectFiles;
var
  FileOpenDlg: TFileOpenDialog;
  SelectedPath: string;
begin
  FileOpenDlg := TFileOpenDialog.Create(nil);
  try
    // Customize Dialog Title
    FileOpenDlg.Title := 'Select a file.';
    // This is where behavior is controlled.
    // For folder selection: Add fdoPickFolders.
    // For file selection: Remove fdoPickFolders.
    FileOpenDlg.Options := [fdoPathMustExist, fdoForceFileSystem];
    // Display and Evaluate Dialog
    if FileOpenDlg.Execute then
    begin
      SelectedPath := FileOpenDlg.FileName;
      // The further processing of the path takes place here.
      CreateLink(SelectedPath , Form1.Edit1.Text + '\' +
                  ExtractFileName(SelectedPath) + '.lnk','','');
    end;
  finally
    Form1.ShellListView1.Refresh;
    FileOpenDlg.Free;
  end;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  ShellAboutA(Handle,'Explorer',
                     'Explorer v1.0 - RAD Studio 11 Version 28'+#13+
                     'Copyright © hackbard - github.com Release 2026',
                     Application.Icon.Handle);
end;

procedure TForm1.AppData1Click(Sender: TObject);
begin
  ShellTreeView1.Root := 'rfAppData';
end;

procedure TForm1.askmanager1Click(Sender: TObject);
begin
  // execute the windows taskmanager
  ShellExecute( 0, 'open', 'taskmgr.exe', '', nil, SW_SHOW);
end;

// create new bitmap file
procedure TForm1.Bitmap1Click(Sender: TObject);
begin
  ShellListView1.Selected := nil;
  ShellListView1.OnClick(sender);
  {$I-}  // Turn off automatic error checking
    try
      // Create and release a new bitmap file
      FileClose(FileCreate(Edit1.Text + '\' + 'New Bitmap.bmp'));
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  {$I+}  // Immediately re-enable automatic error checking.
  ShellListView1.Refresh;

  { Force a complete update if necessary.}
  //ShellTreeView1.Refresh(ShellTreeView1.Items[0]);
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
  // Simply release both ListViews in case an active access exists.
  ShellListView1.Free;
  ShellTreeView1.Free;
  Application.Terminate;
end;

procedure TForm1.Computer1Click(Sender: TObject);
begin
  ShellTreeView1.Root := 'rfMyComputer'
end;

procedure TForm1.ConsoleApplication1Click(Sender: TObject);
begin
  // execute the windows console command
  ShellExecute( 0, 'open', 'cmd.exe', '', nil, SW_SHOW);
end;

procedure TForm1.Control1Click(Sender: TObject);
begin
  // execute the windows main system control
  ShellExecute( 0, 'open', 'control.exe', '', nil, SW_SHOW);
end;

procedure TForm1.Desktop1Click(Sender: TObject);
begin
  ShellTreeView1.Root := 'rfCommonDesktopDirectory';
end;

procedure TForm1.DeviceManager1Click(Sender: TObject);
begin
  // execute the windows device manager
  ShellExecute( 0, 'open', 'devmgmt.msc', '', nil, SW_SHOW);
end;

procedure TForm1.DirectX1Click(Sender: TObject);
begin
  // execute the windows DirectX Diagnostic Tool
  ShellExecute( 0, 'open', 'dxdiag.exe', '', nil, SW_SHOW);
end;

procedure TForm1.DiskCleaner1Click(Sender: TObject);
begin
  // execute the disk windows cleaner function
  ShellExecute( 0, 'open', 'cleanmgr.exe', '', nil, SW_SHOW);
end;

procedure TForm1.DiskManager1Click(Sender: TObject);
begin
  // execute the windows disk manager tool
  ShellExecute( 0, 'open', 'diskmgmt.msc', '', nil, SW_SHOW);
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  // Confirming a path in the edit bar passes it to the root and opens it.
  try
    if Key = #13 then // #13 is the symbol for Enter/Return.
    begin
      // Force the tree view to only allow browsing inside this folder
      ShellTreeView1.Root := Edit1.Text;
      Key := #0; // Ignore
    end;
  except
    // type your own error message
  end;
end;

// Rapid searching within a TShellListView component for an item by name in the list.
procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
var
  FoundItem: TListItem;
begin
  // Remove all markings
  ShellListView1.ItemIndex := -1;
  try
    // Searches for a caption starting with or matching myFile'
    FoundItem := ShellListView1.FindCaption(
      0,            // StartIndex
      Edit2.Text,   // String Value to search for
      False,        // Inclusive (start at StartIndex)
      True,         // Wrap (continue from top if not found)
      false         // Partial (True searches for substrings, False for exact matches)
      //False       // True for Search Files, False for Search Items
    );
    if Assigned(FoundItem) then
    begin
      // Scroll to and select the found item
      FoundItem.Selected := True;
      // Focus on the found item.
      ShellListView1.ItemFocused := FoundItem;
    end;
    except
  end;
end;

procedure TForm1.Editor1Click(Sender: TObject);
begin
  // open a new textdocument file like "Notepad"
  ShellExecute( 0, 'open', 'notepad.exe', '', nil, SW_SHOW);
end;

procedure TForm1.extDocument1Click(Sender: TObject);
begin
  ShellListView1.Selected := nil;
  ShellListView1.OnClick(sender);
  {$I-}  // Turn off automatic error checking
    try
      // Create and release a new textdocument file
      FileClose(FileCreate(Edit1.Text + '\' + 'New Text Document.txt'));
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  {$I+}  // Immediately re-enable automatic error checking.
  ShellListView1.Refresh;

  { Force a complete update if necessary.}
  //ShellTreeView1.Refresh(ShellTreeView1.Items[0]);
end;

procedure TForm1.Favorites1Click(Sender: TObject);
begin
  ShellTreeView1.Root := 'rfFavorites';
end;

procedure TForm1.Folder1Click(Sender: TObject);
begin
  ShellListView1.Selected := nil;
  ShellListView1.OnClick(sender);
  {$I-} // Turn off automatic error checking
    try
      // Create and release a new folder
      MkDir(Edit1.Text + '\' + 'New Folder');
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  {$I+}  // Immediately re-enable automatic error checking.
  ShellListView1.Refresh;

  { Force a complete update if necessary.}
  //ShellTreeView1.Refresh(ShellTreeView1.Items[0]);
end;

procedure TForm1.Fonts1Click(Sender: TObject);
begin
  ShellTreeView1.Root := 'rfFonts';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Reduces the flickering of icons and images.
  // not important
  Panel2.DoubleBuffered := true;
  Panel1.DoubleBuffered := true;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Edit1.Text:= ShellTreeView1.Path + '\';  // main root of TShellTreeView
  StatusBar1.Panels[0].Text := IntToStr(ShellListView1.Items.Count) + ' Elements';
  ImageList1.GetBitmap(12, Image1.Picture.Bitmap);
end;

procedure TForm1.Grid1Click(Sender: TObject);
begin
  ShellListView1.GridLines := Grid1.Checked;
end;

procedure TForm1.GroupPolicies1Click(Sender: TObject);
begin
  // execute the windows Group Polices tool
  ShellExecute( 0, 'open', 'gpedit.msc', '', nil, SW_SHOW);
end;

procedure TForm1.Icon1Click(Sender: TObject);
begin
  ShellListView1.ViewStyle := vsIcon;
end;

procedure TForm1.Internet1Click(Sender: TObject);
begin
  ShellTreeView1.Root := 'rfInternet';
end;

procedure TForm1.List1Click(Sender: TObject);
begin
  ShellListView1.ViewStyle := vsList;
end;

procedure TForm1.MicrosoftOfficeExcelDocum1Click(Sender: TObject);
begin
  ShellListView1.Selected := nil;
  ShellListView1.OnClick(sender);
  {$I-} // Turn off automatic error checking
    try
      // Create and release the file
      FileClose(FileCreate(Edit1.Text + '\' + 'Microsoft Office Excel-Worksheet (new).xlsx'));
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  {$I+}  // Immediately re-enable automatic error checking.
  ShellListView1.Refresh;

  { Force a complete update if necessary.}
  //ShellTreeView1.Refresh(ShellTreeView1.Items[0]);
end;

procedure TForm1.MicrosoftOfficeWordDocument1Click(Sender: TObject);
begin
  ShellListView1.Selected := nil;
  ShellListView1.OnClick(sender);
  {$I-}  // Turn off automatic error checking
    try
      // Create and release a new Word-Document file
      FileClose(FileCreate(Edit1.Text + '\' + 'Microsoft Office Word-Document (new).docx'));
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  {$I+}  // Immediately re-enable automatic error checking.
  ShellListView1.Refresh;

  { Force a complete update if necessary.}
  //ShellTreeView1.Refresh(ShellTreeView1.Items[0]);
end;

procedure TForm1.MSInfo1Click(Sender: TObject);
begin
  // execute the windows system info tool
  ShellExecute( 0, 'open', 'msinfo32.exe', '', nil, SW_SHOW);
end;

procedure TForm1.Network1Click(Sender: TObject);
begin
  ShellTreeView1.Root := 'rfNetwork';
end;

procedure TForm1.Options1Click(Sender: TObject);
begin
  // execute the windows folder options menu
  ShellExecute(Handle, 'open', PChar('rundll32.exe'),
                  PChar('shell32.dll,Options_RunDLL 0'), nil, SW_SHOWNORMAL);
end;

procedure TForm1.Paste1Click(Sender: TObject);
begin
  { This is the section of the TShellListView component responsible for
    copy-and-paste execution, as described above. }
  PasteFilesToShellListView(ShellListView1);
end;

procedure TForm1.PerformanceMonitor1Click(Sender: TObject);
begin
  // execute the windows perfomence-monitor toll
  ShellExecute( 0, 'open', 'perfmon', '', nil, SW_SHOW);
end;

procedure TForm1.Personal1Click(Sender: TObject);
begin
  ShellTreeView1.Root := 'rfPersonal';
end;

procedure TForm1.Powershell1Click(Sender: TObject);
begin
  // execute the windows powershell command
  ShellExecute( 0, 'open', 'powershell.exe', '', nil, SW_SHOW);
end;

procedure TForm1.Printers1Click(Sender: TObject);
begin
  ShellTreeView1.Root := 'rfPrinters';
end;

procedure TForm1.Programs1Click(Sender: TObject);
begin
  ShellTreeView1.Root := 'rfCommonPrograms';
end;

procedure TForm1.Properties1Click(Sender: TObject);
begin
  // Execute the windows properties dialog
  PropertiesDialog(Edit1.Text);
end;

procedure TForm1.Recent1Click(Sender: TObject);
begin
  ShellTreeView1.Root := 'rfRecent';
end;

procedure TForm1.RecycleBin1Click(Sender: TObject);
begin
  ShellTreeView1.Root := 'rfRecycleBin';
end;

procedure TForm1.Refresh1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  ShellListView1.Refresh; // update TShellListView
  Screen.Cursor := crDefault;
end;

procedure TForm1.RegistryEditor1Click(Sender: TObject);
begin
  // execute the windows registry program
  ShellExecute( 0, 'open', 'regedit.exe', '', nil, SW_SHOW);
end;

procedure TForm1.Report1Click(Sender: TObject);
begin
  ShellListView1.ViewStyle := vsReport;
end;

procedure TForm1.Resourcemonitor1Click(Sender: TObject);
begin
  // execute the windows Resourcemonitor tool
  ShellExecute( 0, 'open', 'resmon.exe', '', nil, SW_SHOW);
end;

procedure TForm1.Services1Click(Sender: TObject);
begin
  // execute the windows service tool
  ShellExecute( 0, 'open', 'services.msc', '', nil, SW_SHOW);
end;

procedure TForm1.SharedFolders1Click(Sender: TObject);
begin
  // execute the windows share-folders tool
  ShellExecute( 0, 'open', 'fsmgmt.msc', '', nil, SW_SHOW);
end;

{ Regarding shared folders, there are two main scenarios, depending on
  the specific use case: authenticating to and accessing a
  password-protected network folder (UNC path), or programmatically
  creating a new folder share on the PC. }
procedure TForm1.ShareFolder1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    if ShareDir(Edit1.Text,                   // destination folder
                ExtractDirName(Edit1.Text),  // share name in network
                '',                         // password Not necessary for this function.
                true) then
    begin
      Beep;
      Screen.Cursor := crDefault;
      Showmessage('Folder is being shared on the network.');
    end;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;

  Screen.Cursor := crDefault;
end;

procedure TForm1.ShellListView1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  // Check if the path exists and is accessible.
  if DirectoryExists(ExtractFileDir(Edit1.Text)) or FileExists(Edit1.Text) or
     DriveExists(PansiChar(Edit1.Text)) then
  begin
    New1.Enabled := true;
    New2.Enabled := true;
    Zip1.Enabled := true;
    Properties1.Enabled := true;
    Options1.Enabled := true;
    ShareFolder1.Enabled := true;
  end else begin
    New1.Enabled := false;
    New1.Enabled := false;
    Zip1.Enabled := false;
    Properties1.Enabled := false;
    Options1.Enabled := false;
    ShareFolder1.Enabled := false;
  end;

  // Count the elements in the TShellListView component.
  StatusBar1.Panels[0].Text := IntToStr(ShellListView1.Items.Count) + ' Elements';
end;

procedure TForm1.ShellListView1Click(Sender: TObject);
var
  i, list, MultiSelect, size : Integer;
  s, filename : String;
begin
  Screen.Cursor := crHourGlass;
  // Here, the files are counted when multiple files are clicked.
  s := '';
  For i := 0 to ShellListView1.Items.Count -1 do
  begin
    if ShellListView1.Items[i].Selected then
    begin
      s := s + ShellListView1.Folders[i].PathName;
    end;
  end;

  // Determine the number of selected elements
  MultiSelect := ShellListView1.SelCount;
  Edit1.Text := s;   // type clicked file or folder
  if s = '' then Edit1.Text :=  ShellTreeView1.Path; // return to folder root


  for list := 0 to ShellListView1.Items.Count -1 do
  begin
    {$R-}
    {$I-}
    if ShellListView1.Items[list].Selected and (not ShellListView1.Folders[list].IsFolder) then
    begin
      size := size + Get_File_Size4(ShellListView1.Folders[list].PathName) div 1000;
    end;
    {$R+}
    {$I+}
  end;

  if size = 0 then
  begin
    StatusBar1.Panels[0].Text := IntToStr(ShellListView1.Items.Count) + ' Elements | ' +
                                 IntToStr(MultiSelect) + ' Element selected ';
  end else begin
    StatusBar1.Panels[0].Text := IntToStr(ShellListView1.Items.Count) + ' Elements | ' +
                                 IntToStr(MultiSelect) + ' Element selected '
                                 + '(' + IntToStr(size) + ' KB) |';
  end;
  Screen.Cursor := crDefault;
end;

procedure TForm1.ShellListView1DblClick(Sender: TObject);
var
  i, MultiSelect : Integer;
  s, SelectedPath : String;
begin
  Screen.Cursor := crHourGlass;
  // Here, the files are counted when a double-click has been performed
  s := '';
  For i := 0 to ShellListView1.Items.Count -1 do
  begin
    if ShellListView1.Items[i].Selected then
    begin
      s := s + ShellListView1.Folders[i].PathName;
      Edit1.Text := s;
    end;
  end;

  // Determine the number of selected elements
  MultiSelect := ShellListView1.SelCount;
  // count elements in TShellListView
  StatusBar1.Panels[0].Text := IntToStr(ShellListView1.Items.Count) + ' Elements | ' +
                               IntToStr(MultiSelect) + ' Element selected |';
  FileIconHandle(Edit1.Text); // get the system folder icon handle
  Form1.Image1.Picture.Icon.Handle := ResizeHIcon(FileIconHandle (Form1.Edit1.Text), 19, 19);
  Screen.Cursor := crDefault;
end;

procedure TForm1.ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  // Check if the path exists and is accessible.
  if DirectoryExists(ExtractFileDir(Edit1.Text)) or FileExists(Edit1.Text) or
     DriveExists(PansiChar(Edit1.Text)) then
  begin
    New1.Enabled := true;
    New2.Enabled := true;
    Zip1.Enabled := true;
    Properties1.Enabled := true;
    Options1.Enabled := true;
    ShareFolder1.Enabled := true;
  end else begin
    New1.Enabled := false;
    New1.Enabled := false;
    Zip1.Enabled := false;
    Properties1.Enabled := false;
    Options1.Enabled := false;
    ShareFolder1.Enabled := false;
  end;

  // count elements in TShellListView
  StatusBar1.Panels[0].Text := IntToStr(ShellListView1.Items.Count) + ' Elements';
end;

procedure TForm1.ShellTreeView1Click(Sender: TObject);
var
  i, MultiSelect : Integer;
  s : String;
begin
  Screen.Cursor := crHourGlass;
  s := '';
  For i := 0 to ShellListView1.Items.Count -1 do
  begin
    if ShellListView1.Items[i].Selected then
    begin
      // get path name from TShellTreeView
      s := s + ShellListView1.Folders[i].PathName;
    end;
  end;

  // Determine the number of selected elements
  MultiSelect := ShellListView1.SelCount;
  Edit1.Text:= ShellTreeView1.Path;  // type root in edit box
  FileIconHandle(Edit1.Text); // get the system folder icon handle
  Form1.Image1.Picture.Icon.Handle := ResizeHIcon(FileIconHandle (Form1.Edit1.Text), 19, 19);
  StatusBar1.Panels[0].Text := IntToStr(ShellListView1.Items.Count) + ' Elements | ' +
                               IntToStr(MultiSelect) + ' Element selected |';
  Screen.Cursor := crDefault;
end;

procedure TForm1.ShellTreeView1DblClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  // obtaining a file icon handle (FileIconHandle) is typically done using
  // the Windows API function SHGetFileInfo from the ShellAPI unit.
  FileIconHandle(Edit1.Text);
  // Change the size of the icon.
  Form1.Image1.Picture.Icon.Handle := ResizeHIcon(FileIconHandle(Form1.Edit1.Text), 19, 19);
  Screen.Cursor := crDefault;
end;

procedure TForm1.Shortcut1Click(Sender: TObject);
begin
  // Deselect all items
  ShellListView1.Selected := nil;
  ShellListView1.OnClick(sender);
  // execute lionk create for folders
  SelectFolder;
end;

procedure TForm1.ShortcutFiles1Click(Sender: TObject);
begin
  // Deselect all items
  ShellListView1.Selected := nil;
  ShellListView1.OnClick(sender);
  // execute lionk create for files
  SelectFiles;
end;

{ Here, only files and archives are displayed in the TShellListView component. }
procedure TForm1.ShowFiles1Click(Sender: TObject);
begin
  if ShowFiles1.Checked = true then
  begin
    ShowFiles2.Checked := true;
    // ObjectTypes property in a Delphi TShellListView component determines
    // which file system items are displayed in the list. By default,
    // it usually lists only files.

    // otFolders,     : shows folders
    // otNonFolders,  : show files
    // otHidden       : shows hidden folders
    ShellListView1.ObjectTypes := [otNonFolders,otHidden];
      if ShowFolders1.Checked = true then
        begin
          ShellListView1.ObjectTypes := [otFolders,otNonFolders,otHidden];
        end;
  end else begin
    ShowFiles2.Checked := false;
    ShellListView1.ObjectTypes := [otFolders,otHidden];
  end;
end;

procedure TForm1.ShowFiles2Click(Sender: TObject);
begin
  ShowFiles1.Checked := not ShowFiles1.Checked;
  ShowFiles1Click(self);
end;

{ Here, only folders and archives are displayed in the TShellListView component. }
procedure TForm1.ShowFolders1Click(Sender: TObject);
begin
  if ShowFolders1.Checked = true then
  begin
    ShowFolders2.Checked := true;
    // ObjectTypes property in a Delphi TShellListView component determines
    // which file system items are displayed in the list. By default,
    // it usually lists only files.

    // otFolders,     : shows folders
    // otNonFolders,  : show files
    // otHidden       : shows hidden folders
    ShellListView1.ObjectTypes := [otFolders,otHidden];
      if ShowFiles1.Checked = true then
      begin
        ShellListView1.ObjectTypes := [otFolders,otNonFolders,otHidden];
      end;
  end else begin
    ShowFolders2.Checked := false;
    ShellListView1.ObjectTypes := [otNonFolders,otHidden];
  end;
end;

procedure TForm1.ShowFolders2Click(Sender: TObject);
begin
  ShowFolders1.Checked := not ShowFolders1.Checked;
  ShowFolders1Click(self);
end;

procedure TForm1.Small1Click(Sender: TObject);
begin
  ShellListView1.ViewStyle := vsSmallIcon;
end;

procedure TForm1.StartMenu1Click(Sender: TObject);
begin
  ShellTreeView1.Root := 'rfCommonStartMenu';
end;

procedure TForm1.StartUp1Click(Sender: TObject);
begin
  ShellTreeView1.Root := 'rfCommonStartup';
end;

// create image pgraphics in the StatusBar
procedure TForm1.StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
  const Rect: TRect);
begin
   // We might have multiple options, so let's use a case-select.
  case Panel.Index of
    // Index 1 = first Panel
    0: begin
      // image draw
      ImageList1.Draw(StatusBar.Canvas, Rect.Left, Rect.Top, 1);
      // type text
      StatusBar.Canvas.TextOut((Rect.Left+5) + ImageList1.Width  , Rect.Top, Panel.Text);
    end;

    1: begin
      // image zeichnen
      ImageList1.Draw(StatusBar.Canvas, Rect.Left, Rect.Top, 4);
      // text dazuschreiben
      StatusBar.Canvas.TextOut((Rect.Left+5) + ImageList1.Width  , Rect.Top, Panel.Text);
    end;

  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := DateTimeToStr(Now);
end;

{ Retrieves the icon handle when navigating back in the file path. }
procedure TForm1.ToolButton1Click(Sender: TObject);
var
  SelectedPath: string;
begin
  Screen.Cursor := crHourGlass;

  // Check if the path exists and is accessible.
  if DirectoryExists(ExtractFileDir(Edit1.Text)) or FileExists(Edit1.Text) or
     DriveExists(PansiChar(Edit1.Text)) then
  begin
    New1.Enabled := true;
    New2.Enabled := true;
    Zip1.Enabled := true;
    Properties1.Enabled := true;
    Options1.Enabled := true;
    ShareFolder1.Enabled := true;
  end else begin
    New1.Enabled := false;
    New1.Enabled := false;
    Zip1.Enabled := false;
    Properties1.Enabled := false;
    Options1.Enabled := false;
    ShareFolder1.Enabled := false;
  end;

  // Go back to the parent folder.
  ShellListView1.Back;
  // hand over the path
  Edit1.Text := ShellTreeView1.Path;
  // Extract a shell32 icon from the DLL.
  FileIconHandle(Edit1.Text);
  // Adjust the icon size.
  Image1.Picture.Icon.Handle := ResizeHIcon(FileIconHandle (Form1.Edit1.Text), 20, 20);

  { The "MyComputer" path does not possess an icon handle—because it is not
    an icon itself—therefore, one is provided here with the aid of the ImageList. }
  // Check whether any node is selected at all.
  if ShellTreeView1.Selected <> nil then
  begin
    // Retrieve the path of the selected shell folder.
    SelectedPath := ShellTreeView1.Path;

    // Optional: Check if the path is a physical folder.
    if DirectoryExists(SelectedPath) then
    begin
      // Perform your desired action here.
    end else begin
      ImageList1.GetBitmap(12, Image1.Picture.Bitmap);
    end;
  end;

  Screen.Cursor := crDefault;
end;

{ Changing the roots and passing the TShellTreeView component }
procedure TForm1.ToolButton2Click(Sender: TObject);
begin
  if ShellTreeView1.Root = 'rfMyComputer' then begin
    ShellTreeView1.Root := 'rfDesktop';
  end else begin
    ShellTreeView1.Root := 'rfMyComputer';
  end;
end;

procedure TForm1.UserGroups1Click(Sender: TObject);
begin
  // execute then windows User Group tool
  ShellExecute( 0, 'open', 'lusrmgr.msc', '', nil, SW_SHOW);
end;

procedure TForm1.WinRARArchiv1Click(Sender: TObject);
begin
  ShellListView1.Selected := nil;
  ShellListView1.OnClick(sender);
  {$I-}  // Turn off automatic error checking
    try
      // Create and release a WinRAR-Archiv file
      FileClose(FileCreate(Edit1.Text + '\' + 'WinRAR-Archiv (new).rar'));
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  {$I+}  // Immediately re-enable automatic error checking.
  ShellListView1.Refresh;

  { Force a complete update if necessary.}
  //ShellTreeView1.Refresh(ShellTreeView1.Items[0]);
end;

procedure TForm1.WinRARZipArchiv1Click(Sender: TObject);
begin
  ShellListView1.Selected := nil;
  ShellListView1.OnClick(sender);
  {$I-}  // Turn off automatic error checking
    try
      // Create and release a WinRAR-Zip-Archiv file
      FileClose(FileCreate(Edit1.Text + '\' + 'WinRAR-Zip-Archiv (new).zip'));
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
  {$I+}  // Immediately re-enable automatic error checking.
  ShellListView1.Refresh;

  { Force a complete update if necessary.}
  //ShellTreeView1.Refresh(ShellTreeView1.Items[0]);
end;

{ Creating a ZIP file using the TZipFile component }
procedure TForm1.Zip1Click(Sender: TObject);
var
  zip : TZipFile;
  i, MultiSelect : Integer;
  s : String;
begin
  Screen.Cursor := crHourGlass;
  s := '';
  For i := 0 to ShellListView1.Items.Count -1 do
  begin
    if ShellListView1.Items[i].Selected then
    begin
      // Determine the name of a folder.
      s := s + ShellListView1.Folders[i].PathName;
    end;
  end;

  // Ensure we are processing a valid, selected item
  if ShellListView1.Selected <> nil then
  begin
    // Check if the selected item is a folder
    if ShellListView1.Folders[ShellListView1.Selected.Index].IsFolder then
    begin
      // It's a folder!
      // Add your custom logic here (e.g., display the folder name)
      try
        Zip := TZipFile.Create;
        // Create entire folders as zip files
        TZipFile.ZipDirectoryContents(Edit1.Text + '.zip', Edit1.Text);
      finally
        Zip.Free;
        // It isn't really necessary, but it displays the archive in the list.
        ShellListView1.Refresh;
      end
    end
    else
    begin
      // It's a file!
      // Add your custom logic here (e.g., display the file name)
      try
        Zip := TZipFile.Create;
        // Write a ZIP file with pathnames.
        Zip.Open(ExtractFileDir(Edit1.Text) + '\' +
                  ExtractFileName(Edit1.Text) + '.zip', zmWrite);
        // Creating the zip file
        Zip.Add(Edit1.Text);
      finally
        Zip.Free;
        // It isn't really necessary, but it displays the archive in the list.
        ShellListView1.Refresh;
      end
    end;
  end;
  Screen.Cursor := crDefault;
end;

end.
