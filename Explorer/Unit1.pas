unit Unit1;

interface

uses
  Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.Shell.ShellCtrls, Shellapi, ImgList, ToolWin, Menus, System.ImageList,
  ClipBrd, ShlObj, ActiveX, ComObj, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage ;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    Panel1: TPanel;
    TreeView1: TTreeView;
    ListView1: TListView;
    Splitter1: TSplitter;
    ImageList2: TImageList;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    ImageList3: TImageList;
    Affichage1: TMenuItem;
    Dtails1: TMenuItem;
    Liste1: TMenuItem;
    cones1: TMenuItem;
    Mosaques1: TMenuItem;
    ImageList4: TImageList;
    PopupMenu1: TPopupMenu;
    Delete1: TMenuItem;
    New1: TMenuItem;
    Folder1: TMenuItem;
    Rename1: TMenuItem;
    N1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    File1: TMenuItem;
    N2: TMenuItem;
    Cut1: TMenuItem;
    Properties1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    extdocument1: TMenuItem;
    CreateShortcut1: TMenuItem;
    Sendto1: TMenuItem;
    Desktop1: TMenuItem;
    New2: TMenuItem;
    Folder2: TMenuItem;
    N6: TMenuItem;
    extdocument2: TMenuItem;
    CreateShortcut2: TMenuItem;
    Sendto2: TMenuItem;
    Desktop2: TMenuItem;
    Delete2: TMenuItem;
    Rename2: TMenuItem;
    Cut2: TMenuItem;
    Copy2: TMenuItem;
    Paste2: TMenuItem;
    Properties2: TMenuItem;
    Close1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Info1: TMenuItem;
    ImageList5: TImageList;
    Panel2: TPanel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Image2: TImage;
    Edit2: TEdit;
    CopyName1: TMenuItem;
    ExcelMap1: TMenuItem;
    WordDocument1: TMenuItem;
    WinRarArchive1: TMenuItem;
    WinRARZIPArchiv1: TMenuItem;
    MicrosoftOfficeExcelMap1: TMenuItem;
    MicrosoftOfficeExcelMap2: TMenuItem;
    WinRarArchive2: TMenuItem;
    WinRARZIPArchiv2: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TreeView1Expanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure SelectStyle(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Folder1Click(Sender: TObject);
    procedure Rename1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure ListView1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Cut1Click(Sender: TObject);
    procedure Properties1Click(Sender: TObject);
    procedure extdocument1Click(Sender: TObject);
    procedure CreateShortcut1Click(Sender: TObject);
    procedure Desktop1Click(Sender: TObject);
    procedure Folder2Click(Sender: TObject);
    procedure extdocument2Click(Sender: TObject);
    procedure CreateShortcut2Click(Sender: TObject);
    procedure Desktop2Click(Sender: TObject);
    procedure Delete2Click(Sender: TObject);
    procedure Rename2Click(Sender: TObject);
    procedure Cut2Click(Sender: TObject);
    procedure Copy2Click(Sender: TObject);
    procedure Paste2Click(Sender: TObject);
    procedure Properties2Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Info1Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit2Enter(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure CopyName1Click(Sender: TObject);
    procedure ExcelMap1Click(Sender: TObject);
    procedure WordDocument1Click(Sender: TObject);
    procedure WinRarArchive1Click(Sender: TObject);
    procedure WinRARZIPArchiv1Click(Sender: TObject);
    procedure MicrosoftOfficeExcelMap1Click(Sender: TObject);
    procedure MicrosoftOfficeExcelMap2Click(Sender: TObject);
    procedure WinRarArchive2Click(Sender: TObject);
    procedure WinRARZIPArchiv2Click(Sender: TObject);
    procedure Edit2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
  { Private-Declaration }
  CutFolder : boolean;
  CutFile : boolean;
  NodePath : string;
  User : string;
  public
  { Public-Declaration }

  end;

type TAddType = (AddTop,AddSort,AddBottom);

var
  Form1: TForm1;

implementation

uses Explorer;

{$R *.dfm}


function GetSpecialFolder (aFolder: Integer): String;
var
   pIdL: PItemIDList;
   Path: array [0..Max_Path] of Char;
   Allocator: IMalloc;
begin
(* In Delphi, you can retrieve information about specific folders
   (e.g., user folders) using the `GetSpecialFolder` function in the
   `ShellAPI` unit. To get the path of a particular folder, you must
   pass an appropriate parameter such as `CSIDL_DESKTOPDIRECTORY`.*)
   SHGetSpecialFolderLocation (0, aFolder, pIdL);
   SHGetPathFromIDList (pIDL, Path);
   if Succeeded (SHGetMalloc (Allocator)) then
      begin
         Allocator.Free (pIdL);
         {$IFDEF VER100}
         Allocator.Release;
         {$ENDIF}
      end;
   Result := Path;
end;

function GetUsername: String;
var
  Buffer: array[0..255] of Char;
  Size: DWord;
begin
(* To retrieve the username in Delphi, you can use the Windows API
   function `GetUserName`, which is included in the Windows Unit.
   This function writes the name to a buffer, which is then decoded in the
   `GetUserName` function. For older Delphi versions up to version 5,
   you must use `RaiseLastWin32Error` instead of `RaiseLastOSError`.*)
  Size := SizeOf(Buffer);
  if not Windows.GetUserName(Buffer, Size) then
    RaiseLastOSError;         //RaiseLastWin32Error; ;
  SetString(Result, Buffer, Size - 1);
end;

procedure CreateLink(const PathObj, PathLink, Desc, Param: string);
var
  IObject: IUnknown;
  SLink: IShellLink;
  PFile: IPersistFile;
begin
  // Create Shortcut where do you  want
  IObject:=CreateComObject(CLSID_ShellLink);
  SLink:=IObject as IShellLink;
  PFile:=IObject as IPersistFile;
  with SLink do
  begin
    SetArguments(PChar(Param));
    SetDescription(PChar(Desc));
    SetPath(PChar(PathObj));
  end;
  PFile.Save(PWChar(WideString(PathLink)), FALSE);
end;


function FindTreeNodePath(TV: TTreeView;
                          Path: String;
                          Delimiter: Char;
                          var ReNode : TTreeNode): Boolean;
var sL        : TStringList;
    z, iCount : Integer;
    aNode     : TTreeNode;
begin
  result := False;
  ReNode := nil;

  if (Path = '') or (TV.Items.Count = 0) then
    exit;     //--- -- - > out
  sL := TStringList.Create;
  try
    // split path
    // Replace all delimiters with #13 (carriage return [CR]).
    for z := 1 to Length(Path) do
      if Path[z] = Delimiter then
        Path[z] := #13;

    // The internal parser of the string list splits the path into tokens.
    sL.Text := Path;

    // through possible double or final delimiters
    // Delete generated empty items in StringList
    for z := sL.Count-1 downto 0 do
      if sL[z] = '' then
        sL.Delete(z);

    // search
    iCount := Pred(sL.Count);
    aNode := TV.Items[0];     // start at the first node
    for z := 0 to iCount do   // Search for all tokens in the StringList in the TreeView
    begin
      // as long as there are still nodes in the plane
      // and node text not equal to searched token
      while Assigned(aNode) and (AnsiCompareStr(aNode.Text,sL[z]) <> 0) do
        aNode := aNode.GetNextSibling;//nächster Knoten
      if Assigned(aNode) then//Knoten gefunden
      begin
        // Setting function return parameters
        ReNode := aNode;
        // Switch to the next TreeView level for the next iteration
        if z < iCount then
          aNode := aNode.GetFirstChild;
      end;
    end;

    if Assigned(aNode) then
      Result := True;    // all tokens found
  finally
    sL.Free;
  end;
end;

Function GetTreeNodePath (aNode: TTreeNode; aDiv: String): String;
Begin
  If Assigned (aNode) Then
    If Assigned (aNode.Parent) Then
    // Determine the node of Windows Explorer
      GetTreeNodePath := GetTreeNodePath (aNode.Parent, aDiv) + aDiv + aNode.Text
    Else
      // hand over the path
      GetTreeNodePath := aNode.Text
  Else
    GetTreeNodePath := '';
end;

procedure PropertiesDialog(const aFilename: string);
var
  sei: ShellExecuteInfo;
begin
(* Displaying file properties in the Windows dialog: You can display the
   standard Windows file properties dialog by using the Windows API call
   with the ShellExecuteInfo structure.*)
  FillChar(sei, SizeOf(sei), 0);
  sei.cbSize := SizeOf(sei);
  sei.lpFile := PChar(aFilename);
  sei.lpVerb := 'properties';
  sei.fMask  := SEE_MASK_INVOKEIDLIST;
  ShellExecuteEx(@sei);
end;

function CopyDir(const fromDir, toDir: string): Boolean;
var
  fos: TSHFileOpStruct;
begin
  // Clear Memory Data
  ZeroMemory(@fos, SizeOf(fos));
  (* TDirectory.Copy from System.IOUtils is the recommended method for
     copying a directory and its contents, as it handles exceptions and
     is part of the modern framework.*)
  with fos do
  begin
    wFunc  := FO_COPY;
    fFlags := FOF_FILESONLY;
    pFrom  := PChar(fromDir + #0);
    pTo    := PChar(toDir)
  end;
  Result := (0 = ShFileOperation(fos));
end;

function MoveDir(const fromDir, toDir: string): Boolean;
var
  fos: TSHFileOpStruct;
begin
  // Clear Memory Data
  ZeroMemory(@fos, SizeOf(fos));
  (* In modern Delphi versions (e.g., since Delphi 2010 with the introduction
     of the System.IOUtils unit), moving or renaming directories is done
     using the TDirectory.Move method in the System.IOUtils unit.*)
  with fos do
  begin
    wFunc  := FO_MOVE;
    fFlags := FOF_FILESONLY;
    pFrom  := PChar(fromDir + #0);
    pTo    := PChar(toDir)
  end;
  Result := (0 = ShFileOperation(fos));
end;

function AddAccessRights(lpszFileName : PChar; lpszAccountName : PChar;
         dwAccessMask : DWORD) : boolean;
const
   HEAP_ZERO_MEMORY = $00000008;
   ACL_REVISION = 2;
   ACL_REVISION2 = 2;
   INHERITED_ACE = $10;

type
   ACE_HEADER = Record
      AceType,
      AceFlags : BYTE;
      AceSize : WORD;
   end;

   PACE_HEADER = ^ACE_HEADER;
   ACCESS_ALLOWED_ACE = Record
      Header : ACE_HEADER;
      Mask : ACCESS_MASK;
      SidStart : DWORD;
   end;

   PACCESS_ALLOWED_ACE = ^ACCESS_ALLOWED_ACE;

   ACL_SIZE_INFORMATION = Record
      AceCount,
      AclBytesInUse,
      AclBytesFree : DWORD;
   end;

   SetSecurityDescriptorControlFnPtr = function (pSecurityDescriptor : PSecurityDescriptor;
                                                 ControlBitsOfInterest : SECURITY_DESCRIPTOR_CONTROL;
                                                 ControlBitsToSet : SECURITY_DESCRIPTOR_CONTROL) : boolean; stdcall;

var
   // SID variables.
   snuType : SID_NAME_USE;
   szDomain : PChar;
   cbDomain : DWORD;
   pUserSID : Pointer;
   cbUserSID : DWORD;

   // File SD variables.
   pFileSD : PSecurityDescriptor;
   cbFileSD : DWORD;

   // New SD variables.
   newSD : TSecurityDescriptor;

   // ACL variables.
   ptrACL : PACL;
   fDaclPresent,
   fDaclDefaulted : BOOL;
   AclInfo : ACL_SIZE_INFORMATION;

   // New ACL variables.
   pNewACL : PACL;
   cbNewACL : DWORD;

   // Temporary ACE.
   pTempAce : Pointer;
   CurrentAceIndex,
   newAceIndex : UINT;

   // Assume function will fail.
   fResult,
   fAPISuccess : boolean;
   secInfo : SECURITY_INFORMATION;

   // New APIs available only in Windows 2000 and above for setting
   // SD control
   _SetSecurityDescriptorControl : SetSecurityDescriptorControlFnPtr;

   controlBitsOfInterest,
   controlBitsToSet,
   oldControlBits : SECURITY_DESCRIPTOR_CONTROL;
   dwRevision : DWORD;
   AceFlags : BYTE;

function myheapalloc(x : integer) : Pointer;
begin
   Result := HeapAlloc(GetProcessHeap(), HEAP_ZERO_MEMORY, x);
end;

function myheapfree(x : Pointer) : boolean;
begin
   Result := HeapFree(GetProcessHeap(), 0, x);
end;

function SetFileSecurityRecursive(lpFileName: PChar; SecurityInformation: SECURITY_INFORMATION;
                                 pSecurityDescriptor: PSecurityDescriptor): BOOL;
var
  sr : TSearchRec;
begin
  Result := SetFileSecurity(lpFileName, SecurityInformation, pSecurityDescriptor);

  if Not Result then
      Exit;

  if (FileGetAttr(lpFileName) AND faDirectory) = faDirectory then
    begin
     // Recursion begins
     if FindFirst(IncludeTrailingPathDelimiter(lpFileName) + '*', $EFFF, sr) = 0 then
       begin
        Repeat
         // msp 07.10.2004
         // if ((sr.Attr and faDirectory) = faDirectory) AND (sr.Name <> '.') AND (sr.Name <> '..') then
         if (sr.Name <> '.') AND (sr.Name <> '..') then
            SetFileSecurityRecursive(PChar(IncludeTrailingPathDelimiter(lpFileName) + sr.Name),
                                     SecurityInformation, pSecurityDescriptor);
        until FindNext(sr) <> 0;
        FindClose(sr);
       end;
    end;
end;

begin
   // Init
   szDomain := nil;
   cbDomain := 0;
   pUserSID := nil;
   cbUserSID := 0;

   // File SD variables.
   pFileSD := nil;
   cbFileSD := 0;

   // ACL variables.
   ptrACL := nil;

   // New ACL variables.
   pNewACL := nil;
   cbNewACL := 0;

   // Temporary ACE.
   pTempAce := nil;
   CurrentAceIndex := 0;

   newAceIndex := 0;

   // Assume function will fail.
   fResult := FALSE;

   secInfo := DACL_SECURITY_INFORMATION;

   // New APIs available only in Windows 2000 and above for setting
   // SD control
   _SetSecurityDescriptorControl := nil;

   // Delphi-Result
   Result := FALSE;

   try
      //
      // STEP 1: Get SID of the account name specified.
      //
      fAPISuccess := LookupAccountName(nil, lpszAccountName,
            pUserSID, cbUserSID, szDomain, cbDomain, snuType);

      // API should have failed with insufficient buffer.
      if (Not fAPISuccess) AND (GetLastError() <> ERROR_INSUFFICIENT_BUFFER) then
         raise Exception.Create('LookupAccountName Error=' + IntToStr(GetLastError()));

      pUserSID := myheapalloc(cbUserSID);
      if pUserSID = nil then
         raise Exception.Create('myheapalloc Error=' + IntToStr(GetLastError()));

      szDomain := PChar(myheapalloc(cbDomain * sizeof(PChar)));
      if szDomain = nil then
         raise Exception.Create('myheapalloc Error=' + IntToStr(GetLastError()));

      fAPISuccess := LookupAccountName(nil, lpszAccountName,
            pUserSID, cbUserSID, szDomain, cbDomain, snuType);
      if Not fAPISuccess then
         raise Exception.Create('LookupAccountName Error=' + IntToStr(GetLastError()));

      //
      // STEP 2: Get security descriptor (SD) of the file specified.
      //
      fAPISuccess := GetFileSecurity(lpszFileName,
            secInfo, pFileSD, 0, cbFileSD);

      // API should have failed with insufficient buffer.
      if (Not fAPISuccess) AND (GetLastError() <> ERROR_INSUFFICIENT_BUFFER) then
         raise Exception.Create('GetFileSecurity Error=' + IntToStr(GetLastError()));

      pFileSD := myheapalloc(cbFileSD);
      if pFileSD = nil then
         raise Exception.Create('myheapalloc Error=' + IntToStr(GetLastError()));

      fAPISuccess := GetFileSecurity(lpszFileName,
            secInfo, pFileSD, cbFileSD, cbFileSD);
      if Not fAPISuccess then
         raise Exception.Create('GetFileSecurity Error=' + IntToStr(GetLastError()));

      //
      // STEP 3: Initialize new SD.
      //
      if Not InitializeSecurityDescriptor(@newSD,
            SECURITY_DESCRIPTOR_REVISION) then
         raise Exception.Create('InitializeSecurityDescriptor Error=' + IntToStr(GetLastError()));

      //
      // STEP 4: Get DACL from the old SD.
      //
      if Not GetSecurityDescriptorDacl(pFileSD, fDaclPresent, ptrACL,
            fDaclDefaulted) then
         raise Exception.Create('GetSecurityDescriptorDacl Error=' + IntToStr(GetLastError()));

      //
      // STEP 5: Get size information for DACL.
      //
      AclInfo.AceCount := 0; // Assume NULL DACL.
      AclInfo.AclBytesFree := 0;
      AclInfo.AclBytesInUse := sizeof(ACL);

      if ptrACL = nil then
         fDaclPresent := FALSE;

      // If not NULL DACL, gather size information from DACL.
      if Not fDaclPresent then
         if Not GetAclInformation(ptrACL^, @AclInfo,
               sizeof(ACL_SIZE_INFORMATION), AclSizeInformation) then
            raise Exception.Create('GetAclInformation ' + IntToStr(GetLastError()));

      //
      // STEP 6: Compute size needed for the new ACL.
      //
      cbNewACL := AclInfo.AclBytesInUse + sizeof(ACCESS_ALLOWED_ACE)
                + GetLengthSid(pUserSID) - sizeof(DWORD);

      //
      // STEP 7: Allocate memory for new ACL.
      //
      pNewACL := PACL(myheapalloc(cbNewACL));
      if pNewACL = nil then
         raise Exception.Create('myheapalloc ' + IntToStr(GetLastError()));

      //
      // STEP 8: Initialize the new ACL.
      //
      if Not InitializeAcl(pNewACL^, cbNewACL, ACL_REVISION2) then
         raise Exception.Create('InitializeAcl ' + IntToStr(GetLastError()));

      //
      // STEP 9 If DACL is present, copy all the ACEs from the old DACL
      // to the new DACL.
      //
      // The following code assumes that the old DACL is
      // already in Windows 2000 preferred order. To conform
      // to the new Windows 2000 preferred order, first we will
      // copy all non-inherited ACEs from the old DACL to the
      // new DACL, irrespective of the ACE type.
      //

      newAceIndex := 0;

      if (fDaclPresent) AND (AclInfo.AceCount > 0) then
        begin
         for CurrentAceIndex := 0 to AclInfo.AceCount - 1 do
           begin
            //
            // STEP 10: Get an ACE.
            //
            if Not GetAce(ptrACL^, CurrentAceIndex, pTempAce) then
               raise Exception.Create('GetAce ' + IntToStr(GetLastError()));

            //
            // STEP 11: Check if it is a non-inherited ACE.
            // If it is an inherited ACE, break from the loop so
            // that the new access allowed non-inherited ACE can
            // be added in the correct position, immediately after
            // all non-inherited ACEs.
            //
            if PACCESS_ALLOWED_ACE(pTempAce)^.Header.AceFlags AND INHERITED_ACE > 0 then
               break;

            //
            // STEP 12: Skip adding the ACE, if the SID matches
            // with the account specified, as we are going to
            // add an access allowed ACE with a different access
            // mask.
            //
            if EqualSid(pUserSID, @(PACCESS_ALLOWED_ACE(pTempAce)^.SidStart)) then
               continue;

            //
            // STEP 13: Add the ACE to the new ACL.
            //
            if Not AddAce(pNewACL^, ACL_REVISION, MAXDWORD, pTempAce,
                  PACE_HEADER(pTempAce)^.AceSize) then
               raise Exception.Create('AddAce ' + IntToStr(GetLastError()));

            Inc(newAceIndex);
           end;
        end;

      //
      // STEP 14: Add the access-allowed ACE to the new DACL.
      // The new ACE added here will be in the correct position,
      // immediately after all existing non-inherited ACEs.
      //
      AceFlags := $1   (* OBJECT_INHERIT_ACE *)
               OR $2   (* CONTAINER_INHERIT_ACE *)
               OR $10  (* INHERITED_ACE*);

      if Not AddAccessAllowedAceEx(pNewACL^, ACL_REVISION2, AceFlags, dwAccessMask,
               pUserSID) then
         raise Exception.Create('AddAccessAllowedAce ' + IntToStr(GetLastError()));
      //
      // STEP 15: To conform to the new Windows 2000 preferred order,
      // we will now copy the rest of inherited ACEs from the
      // old DACL to the new DACL.
      //
      if (fDaclPresent) AND (AclInfo.AceCount > 0) then
        begin
         while CurrentAceIndex < AclInfo.AceCount do
           begin
            //
            // STEP 16: Get an ACE.
            //
            if Not GetAce(ptrACL^, CurrentAceIndex, pTempAce) then
               raise Exception.Create('GetAce ' + IntToStr(GetLastError()));

            //
            // STEP 17: Add the ACE to the new ACL.
            //
            if Not AddAce(pNewACL^, ACL_REVISION, MAXDWORD, pTempAce,
                  PACE_HEADER(pTempAce)^.AceSize) then
               raise Exception.Create('AddAce ' + IntToStr(GetLastError()));
           end;

           Inc(CurrentAceIndex);
        end;

      //
      // STEP 18: Set the new DACL to the new SD.
      //
      if Not SetSecurityDescriptorDacl(@newSD, TRUE, pNewACL, FALSE) then
         raise Exception.Create('SetSecurityDescriptorDacl ' + IntToStr(GetLastError()));

      //
      // STEP 19: Copy the old security descriptor control flags
      // regarding DACL automatic inheritance for Windows 2000 or
      // later where SetSecurityDescriptorControl() API is available
      // in advapi32.dll.
      //
      _SetSecurityDescriptorControl := SetSecurityDescriptorControlFnPtr(
                                          GetProcAddress(GetModuleHandle('advapi32.dll'),
                                                         'SetSecurityDescriptorControl'));
      if @_SetSecurityDescriptorControl <> nil then
        begin
         controlBitsOfInterest := 0;
         controlBitsToSet := 0;
         oldControlBits := 0;
         dwRevision := 0;

         if Not GetSecurityDescriptorControl(pFileSD, oldControlBits,
                  dwRevision) then
            raise Exception.Create('GetSecurityDescriptorControl ' + IntToStr(GetLastError()));

         if (oldControlBits AND SE_DACL_AUTO_INHERITED) <> 0 then
           begin
            controlBitsOfInterest := SE_DACL_AUTO_INHERIT_REQ OR SE_DACL_AUTO_INHERITED;
            controlBitsToSet := controlBitsOfInterest;
           end
         else if (oldControlBits AND SE_DACL_PROTECTED) <> 0 then
           begin
            controlBitsOfInterest := SE_DACL_PROTECTED;
            controlBitsToSet := controlBitsOfInterest;
           end;

         if controlBitsOfInterest <> 0 then
            if Not _SetSecurityDescriptorControl(@newSD, controlBitsOfInterest, controlBitsToSet) then
               raise Exception.Create('SetSecurityDescriptorControl ' + IntToStr(GetLastError()));
        end;

      //
      // STEP 20: Set the new SD to the File.
      //
      // msp 07.09.2004: Set to all objects including subdirectories
      // if Not SetFileSecurity(lpszFileName, secInfo, @newSD) then
      if Not SetFileSecurityRecursive(lpszFileName, secInfo, @newSD) then
         raise Exception.Create('SetFileSecurity ' + IntToStr(GetLastError()));

   except
      on E: Exception do
       begin
         MessageDlg(E.Message, mtError, [mbAbort], -1);
         // WriteLog(ltError, Format('AddAccessRights: Beim Ändern der Rechte auf dem Verzeichnis ''%s'' für ''%s'' ist ein Fehler aufgetreten. %s', [lpszFileName, lpszAccountName, E.Message]), []);
         Exit;
       end;
   end;

   //
   // STEP 21: Free allocated memory
   //
   if pUserSID <> nil then
      myheapfree(pUserSID);

   if szDomain <> nil then
      myheapfree(szDomain);

   if pFileSD <> nil then
      myheapfree(pFileSD);

   if pNewACL <> nil then
      myheapfree(pNewACL);

   fResult := TRUE;
end;

procedure FileCopy(von,nach:string);
var
  src, dest : tFilestream;
begin
(* The easiest ways to copy a file are using the Windows API CopyFile
   function (for Windows-only applications) or the cross-platform
   System.IOUtils.TFile.Copy method.*)
  src := tFilestream.create(von,fmShareDenyNone or fmOpenRead);
  try
    dest := tFilestream.create(nach,fmCreate);
    try
      dest.copyfrom(src,src.size);
    finally
      dest.free;
    end;
  finally
    src.free;
  end;
end;

function RenameFileEx(const AOldName, ANewName: string;
   ARenameCheck: boolean = false): boolean;
var
  sh: TSHFileOpStruct;
begin
(* To rename a file in Delphi, use the System.SysUtils.RenameFile function.
   This function attempts to change the name of the file specified by the
   old file name to the new file name.*)
  sh.Wnd := Application.Handle;
  sh.wFunc := fo_Move;

  // String must be terminated with #0 to set the end of the list
  sh.pFrom := PChar(AOldName + #0);
  sh.pTo := PChar(ANewName + #0);
  sh.fFlags := fof_Silent or fof_MultiDestFiles;
  if ARenameCheck then
    sh.fFlags := sh.fFlags or fof_RenameOnCollision;
  Result := ShFileOperation(sh) = 0;
end;

function DeleteFile(const AFile: string): boolean;
var
 sh: SHFileOpStruct;
begin
  // clear Memory Data
  ZeroMemory(@sh, sizeof(sh));
 (* Using SysUtils.DeleteFile
    The DeleteFile function is a straightforward way to delete a file.
    It returns True if the file was successfully deleted and False otherwise
    (e.g., if the file did not exist or was read-only).*)
 with sh do
   begin
   Wnd := Application.Handle;
   wFunc := fo_Delete;
   pFrom := PChar(AFile +#0);
   fFlags := fof_Silent or fof_NoConfirmation;
   end;
 result := SHFileOperation(sh) = 0;
end;

procedure TForm1.Close1Click(Sender: TObject);
begin
  Close();
end;

procedure TForm1.Copy1Click(Sender: TObject);
begin
  CutFolder := false;
  CutFile := false;
  Edit1.SelectAll;
  Edit1.CopyToClipboard;
end;

procedure TForm1.Copy2Click(Sender: TObject);
begin
  Copy1.Click;
end;

procedure TForm1.CopyName1Click(Sender: TObject);
var
  Item: TListItem;
begin
  // Check if any item is selected
  if ListView1.Selected <> nil then
  begin
    Item := ListView1.Selected;
    // Assign the item's Caption to the Clipboard AsText property
    Clipboard.AsText := Item.Caption;
  end;
end;

procedure TForm1.CreateShortcut1Click(Sender: TObject);
begin
  CreateLink(Edit1.Text,
            ExtractFilePath(Application.ExeName) +
            ExtractFileName(Edit1.Text) + '.lnk','','');
end;

procedure TForm1.CreateShortcut2Click(Sender: TObject);
begin
  CreateShortcut1.Click;
end;

procedure TForm1.Cut1Click(Sender: TObject);
var
  ReNode : TTreeNode;
  Path : String;
begin
  Edit1.SelectAll;
  Edit1.CopyToClipboard;
  Path := NodePath;
  
  if DirectoryExists(Clipboard.AsText) then
  begin
    CutFolder := true;
    CutFile := false;
  end;

  if FileExists(Clipboard.AsText) then
  begin
    CutFolder := false;
    CutFile := true;
  end;

  InitExplo;
  ListView1.Update;

  if FindTreeNodePath(TreeView1, Path, '\',ReNode) then
    ReNode.Selected := True;
  Application.ProcessMessages;

end;

procedure TForm1.Cut2Click(Sender: TObject);
begin
  Cut1.Click;
end;

procedure TForm1.Delete1Click(Sender: TObject);
var
  ReNode : TTreeNode;
  Path : String;
begin
  CutFolder := false;
  CutFile := false;

  Path := NodePath;
  Beep;
    if MessageBox(Handle,'Would you like to delete them? ','Confirme',MB_YESNO) = IDYES then
    BEGIN
      try
        DeleteFile(Edit1.Text);
        ListView1.Selected.Delete;
      except
        on E: Exception do
          ShowMessage('Access denied : ' + E.Message);
      end;

    END;

    InitExplo;
    ListView1.Update;

    if FindTreeNodePath(TreeView1, Path, '\',ReNode) then
    ReNode.Selected := True;
    Application.ProcessMessages;
end;

procedure TForm1.Delete2Click(Sender: TObject);
begin
  Delete1.Click;
end;

procedure TForm1.Desktop1Click(Sender: TObject);
begin
  CreateLink(Edit1.Text,
            'C:\Users\' + User + '\Desktop\' +
            ExtractFileName(Edit1.Text) + '.lnk','','');
end;

procedure TForm1.Desktop2Click(Sender: TObject);
begin
  Desktop1.Click;
end;

procedure TForm1.Edit2Enter(Sender: TObject);
var
  gefunden : Bool;
  i : integer;
begin
  gefunden := false;
for i := 0 to ListView1.Items.Count - 1 do
  if ListView1.Items[i].Caption = Edit2.Text then
    begin
      gefunden := true;
      ListView1.ItemFocused := ListView1.Items[i];
      ListView1.Selected := ListView1.Items[i];
      ListView1.Selected.MakeVisible(True);
      Application.ProcessMessages;
      break;
    end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
var
  gefunden : Bool;
  i : integer;
begin
  gefunden := false;
for i := 0 to ListView1.Items.Count - 1 do
  if ListView1.Items[i].Caption = Edit2.Text then
    begin
      gefunden := true;
      ListView1.ItemFocused := ListView1.Items[i];
      ListView1.Selected := ListView1.Items[i];
      ListView1.Selected.MakeVisible(True);
      Application.ProcessMessages;
      break;
    end;
end;

procedure TForm1.Edit2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Edit2.SelectAll;
end;

procedure TForm1.ExcelMap1Click(Sender: TObject);
var
  f : TEXTfile;
  ReNode : TTreeNode;
  Path : String;
begin
  Path := NodePath;

  try
    AssignFile(f, Edit1.Text + 'New Map1.xlsx');
    rewrite(f);
    closefile(f);
  except
    on E: Exception do
      ShowMessage('Cant Create File to this Path : ' + E.Message);
  end;

  InitExplo;
  ListView1.Update;

  if FindTreeNodePath(TreeView1, Path, '\',ReNode) then
    ReNode.Selected := True;
  Application.ProcessMessages;
end;

procedure TForm1.extdocument1Click(Sender: TObject);
var
  f : TEXTfile;
  ReNode : TTreeNode;
  Path : String;
begin
  Path := NodePath;

  try
    AssignFile(f, Edit1.Text + 'New Textdocument.txt');
    rewrite(f);
    closefile(f);
  except
    on E: Exception do
      ShowMessage('Cant Create File to this Path : ' + E.Message);
  end;

  InitExplo;
  ListView1.Update;

  if FindTreeNodePath(TreeView1, Path, '\',ReNode) then
    ReNode.Selected := True;
  Application.ProcessMessages;
end;

procedure TForm1.extdocument2Click(Sender: TObject);
begin
  extdocument1.Click;
end;

procedure TForm1.Folder1Click(Sender: TObject);
var
  str : string;
  Item: TListItem;
  Column: TListColumn;
  ReNode : TTreeNode;
  Path : String;
begin
  str := InputBox('New Folder','Type Name :','New Folder');
  Path := NodePath;
  {$I-}
  MkDir(Edit1.Text + str);
  {$I+}
  try
    if IOResult <> 0 then
      begin
        MessageDlg('Cannot Create Directory', mtWarning, [mbOK], 0);
        Item := ListView1.Items.Add;
        Item.Caption := str;
      end;
  except
    on E: Exception do
        ShowMessage('Access denied : ' + E.Message);
    // MessageDlg('Directory Created', mtInformation, [mbOK], 0);
  end;

  InitExplo;
  ListView1.Update;

  if FindTreeNodePath(TreeView1, Path, '\',ReNode) then
    ReNode.Selected := True;
  Application.ProcessMessages;
end;

procedure TForm1.Folder2Click(Sender: TObject);
begin
  Folder1.Click;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  InitExplo ;
  Edit1.Text := 'Computer';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Panel1.DoubleBuffered := true;
  User := GetUsername;

  (* IMPORTANT  !!!
     The next command is only necessary if the user account's
     access rights are restricted and must be handled with care.

     It is able to assign rights to the user, but also to revoke them.
     Furthermore, the command can remove users from the security menu
     and lock file paths as well as entire hard drives. Therefore,
     you should familiarize yourself with the function before using it.*)

  //  <Order>         <Path>       <User>      <Rights>
  //  AddAccessRights('D:\temp',     '*',      $00000002);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  ListView1.Arrange(arDefault);
end;

procedure TForm1.Info1Click(Sender: TObject);
begin
  ShellAboutA(Handle,'Explorer','Explorer Example '+#13+
                     'Copyright 2025 by hackbard | github.com Release',
              Application.Icon.Handle);
end;

procedure TForm1.TreeView1Expanding(Sender: TObject; Node: TTreeNode;
                                    var AllowExpansion: Boolean);
begin
  SSRep(Node) ;
end;

procedure TForm1.WinRarArchive1Click(Sender: TObject);
var
  f : TEXTfile;
  ReNode : TTreeNode;
  Path : String;
begin
  Path := NodePath;

  try
    AssignFile(f, Edit1.Text + 'WinRar.rar');
    rewrite(f);
    closefile(f);
  except
    on E: Exception do
      ShowMessage('Cant Create File to this Path : ' + E.Message);
  end;

  InitExplo;
  ListView1.Update;

  if FindTreeNodePath(TreeView1, Path, '\',ReNode) then
    ReNode.Selected := True;
  Application.ProcessMessages;
end;

procedure TForm1.WinRarArchive2Click(Sender: TObject);
begin
  WinRarArchive1.Click;
end;

procedure TForm1.WinRARZIPArchiv1Click(Sender: TObject);
var
  f : TEXTfile;
  ReNode : TTreeNode;
  Path : String;
begin
  Path := NodePath;

  try
    AssignFile(f, Edit1.Text + 'WinRar-ZIP-Archive.zip');
    rewrite(f);
    closefile(f);
  except
    on E: Exception do
      ShowMessage('Cant Create File to this Path : ' + E.Message);
  end;

  InitExplo;
  ListView1.Update;

  if FindTreeNodePath(TreeView1, Path, '\',ReNode) then
    ReNode.Selected := True;
  Application.ProcessMessages;
end;

procedure TForm1.WinRARZIPArchiv2Click(Sender: TObject);
begin
  WinRARZIPArchiv1.Click;
end;

procedure TForm1.WordDocument1Click(Sender: TObject);
var
  f : TEXTfile;
  ReNode : TTreeNode;
  Path : String;
begin
  Path := NodePath;

  try
    AssignFile(f, Edit1.Text + 'Word Document.docx');
    rewrite(f);
    closefile(f);
  except
    on E: Exception do
      ShowMessage('Cant Create File to this Path : ' + E.Message);
  end;

  InitExplo;
  ListView1.Update;

  if FindTreeNodePath(TreeView1, Path, '\',ReNode) then
    ReNode.Selected := True;
  Application.ProcessMessages;
end;

procedure TForm1.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  Screen.Cursor := crHourGlass;
  ListeFiles(Node);
  Edit1.Text := Path(TreeView1.Selected) + '\';
  NodePath := GetTreeNodePath (Node, '\');

  if Treeview1.TopItem.Selected  then
  begin
    Edit1.Text := 'Computer';
  end;

  // Make sure that a node is actually selected (Selected is not nil)
  if Assigned(TreeView1.Selected) then
  begin
    // Read and display the text of the selected node
    StatusBar1.Panels.Items[0].Text := ' ' + TreeView1.Selected.Text;
  end
  else
  begin
    // If no node is selected (e.g., when clearing the TreeView), clear the field.
    StatusBar1.Panels.Items[0].Text := '';
  end;

  StatusBar1.Panels.Items[1].Text := '  ' + IntToStr(ListView1.Items.Count) + ' Element(s)' ;
end;

procedure TForm1.SelectStyle(Sender: TObject);
const
  ViewStyle : Array[0..3] of TViewStyle = (vsSmallIcon,vsIcon, vsList, vsReport) ;
begin
  ListView1.ViewStyle := ViewStyle[(Sender as TMenuItem).MenuIndex] ;
  (Sender as TMenuItem).Checked := True ;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  CurrentNode: TTreeNode;
  ParentNode: TTreeNode;
  back : TTreeNode;
begin
  if TreeView1.Selected <> nil then
  begin
    CurrentNode := TreeView1.Selected;
    ParentNode := CurrentNode.Parent;

    if ParentNode <> nil then
    begin
      // Select the parent node
      TreeView1.Selected := ParentNode;
    end;
  end;

  // expand superscript node
  back := Treeview1.Selected;
    if Assigned(back) then back.expand(false);
end;

procedure TForm1.StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
  const Rect: TRect);
begin
   // We may have several, so we'll use a case select.
  case Panel.Index of
    // Index 0 = first Panel
    0: begin
      // draw image
      ImageList5.Draw(StatusBar.Canvas, Rect.Left, Rect.Top-1, 0);
      // text dazuschreiben
      StatusBar.Canvas.TextOut(Rect.Left + ImageList5.Width  , Rect.Top-1, Panel.Text);
    end;

    1: begin
      // draw image
      ImageList5.Draw(StatusBar.Canvas, Rect.Left, Rect.Top-1, 1);
      // type text
      StatusBar.Canvas.TextOut(Rect.Left + ImageList5.Width  , Rect.Top-1, Panel.Text);
    end;

  end;
end;

procedure TForm1.ListView1Click(Sender: TObject);
begin
  if Edit1.Text = 'Computer' then
    begin
      New1.Enabled := false;
      New2.Enabled := false;
      Paste1.Enabled := false;
      Paste2.Enabled := false;
      Delete1.Enabled := false;
      Delete2.Enabled := false;
      Rename1.Enabled := false;
      Rename2.Enabled := false;
      Cut1.Enabled := false;
      Cut2.Enabled := false;
    end else begin
      New1.Enabled := true;
      New2.Enabled := true;
      Paste1.Enabled := true;
      Paste2.Enabled := true;
      Delete1.Enabled := true;
      Delete2.Enabled := true;
      Rename1.Enabled := true;
      Rename2.Enabled := true;
      Cut1.Enabled := true;
      Cut2.Enabled := true;
    end;

  if ListView1.Selected = nil then
  begin
    Delete1.Enabled := false;
    Rename1.Enabled := false;
    Cut1.Enabled := false;
    Copy1.Enabled := false;
    Properties1.Enabled := false;
    Sendto1.Enabled := false;
    CreateShortcut1.Enabled := false;
    Delete2.Enabled := false;
    Rename2.Enabled := false;
    Cut2.Enabled := false;
    Copy2.Enabled := false;
    Properties2.Enabled := false;
    Sendto2.Enabled := false;
    CreateShortcut2.Enabled := false;
    Exit;
  end else begin
    Delete1.Enabled := true;
    Rename1.Enabled := true;
    Cut1.Enabled := true;
    Copy1.Enabled := true;
    Properties1.Enabled := true;
    Sendto1.Enabled := true;
    CreateShortcut1.Enabled := true;

    Delete2.Enabled := true;
    Rename2.Enabled := true;
    Cut2.Enabled := true;
    Copy2.Enabled := true;
    Properties2.Enabled := true;
    Sendto2.Enabled := true;
    CreateShortcut2.Enabled := true;
  end;

  try
    if (ListView1.Selected.SubItems.Strings[0] = '') or
       (ListView1.Selected.SubItems.Strings[1] = '') or
       (ListView1.Selected.SubItems.Strings[2] = '') then
    begin
       StatusBar1.Panels[0].Text := ' ' + ListView1.Selected.Caption + ' | Element Selected';
       Exit;
    end;

    StatusBar1.Panels[0].Text := ' ' + ListView1.Selected.SubItems.Strings[0] + ' | ' +
                                       ListView1.Selected.SubItems.Strings[1] + ' | ' +
                                       ListView1.Selected.SubItems.Strings[2];
    Edit1.Clear;
    Edit1.Text := Path(TreeView1.Selected) + '\' + ListView1.Selected.Caption;
  except
    on Exception do Exit;
  end;
end;

procedure TForm1.ListView1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  if Edit1.Text = 'Computer' then
    begin
      New1.Enabled := false;
      New2.Enabled := false;
      Paste1.Enabled := false;
      Paste2.Enabled := false;
      Delete1.Enabled := false;
      Delete2.Enabled := false;
      Rename1.Enabled := false;
      Rename2.Enabled := false;
      Cut1.Enabled := false;
      Cut2.Enabled := false;
    end else begin
      New1.Enabled := true;
      New2.Enabled := true;
      Paste1.Enabled := true;
      Paste2.Enabled := true;
      Delete1.Enabled := true;
      Delete2.Enabled := true;
      Rename1.Enabled := true;
      Rename2.Enabled := true;
      Cut1.Enabled := true;
      Cut2.Enabled := true;
    end;

  if ListView1.Selected = nil then
  begin
    Delete1.Enabled := false;
    Rename1.Enabled := false;
    Cut1.Enabled := false;
    Copy1.Enabled := false;
    Properties1.Enabled := false;
    Sendto1.Enabled := false;
    CreateShortcut1.Enabled := false;
    Delete2.Enabled := false;
    Rename2.Enabled := false;
    Cut2.Enabled := false;
    Copy2.Enabled := false;
    Properties2.Enabled := false;
    Sendto2.Enabled := false;
    CreateShortcut2.Enabled := false;
    Exit;
  end else begin
    Delete1.Enabled := true;
    Rename1.Enabled := true;
    Cut1.Enabled := true;
    Copy1.Enabled := true;
    Properties1.Enabled := true;
    Sendto1.Enabled := true;
    CreateShortcut1.Enabled := true;

    Delete2.Enabled := true;
    Rename2.Enabled := true;
    Cut2.Enabled := true;
    Copy2.Enabled := true;
    Properties2.Enabled := true;
    Sendto2.Enabled := true;
    CreateShortcut2.Enabled := true;
  end;

  try
    if (ListView1.Selected.SubItems.Strings[0] = '') or
       (ListView1.Selected.SubItems.Strings[1] = '') or
       (ListView1.Selected.SubItems.Strings[2] = '') then
    begin
       StatusBar1.Panels[0].Text := ' ' + ListView1.Selected.Caption + ' | Element Selected';
       Exit;
    end;

    StatusBar1.Panels[0].Text := ' ' + ListView1.Selected.SubItems.Strings[0] + ' | ' +
                                       ListView1.Selected.SubItems.Strings[1] + ' | ' +
                                       ListView1.Selected.SubItems.Strings[2];
    Edit1.Clear;
    Edit1.Text := Path(TreeView1.Selected) + '\' + ListView1.Selected.Caption;
  except
    on Exception do Exit;
  end;
end;

procedure TForm1.ListView1DblClick(Sender: TObject);
var
 Filepath : String ;
begin
  if ListView1.Selected = nil then exit ;
    Filepath := Path(TreeView1.Selected) + '\' + ListView1.Selected.Caption ;
    ShellExecute(handle, 'open', @Filepath[1], nil, nil, SW_NORMAL);
end;

procedure TForm1.MicrosoftOfficeExcelMap1Click(Sender: TObject);
begin
  ExcelMap1.Click;
end;

procedure TForm1.MicrosoftOfficeExcelMap2Click(Sender: TObject);
begin
  WordDocument1.Click;
end;

procedure TForm1.Paste1Click(Sender: TObject);
var
  ClipPath, move : string;
  ReNode : TTreeNode;
  Path : String;
begin
  ClipPath := Clipboard.AsText;
  Path := NodePath;
  
  if CutFolder = true then
  begin
    if DirectoryExists(Clipboard.AsText) then
    begin
      try
        MoveDir(Clipboard.AsText, Edit1.Text);
      except
        on E: Exception do
          ShowMessage('Folder not found : ' + E.Message);
      end;
      InitExplo;
      ListView1.Update;

      if FindTreeNodePath(TreeView1, Path, '\',ReNode) then
        ReNode.Selected := True;
      Application.ProcessMessages;
    end;
  end;

  if CutFile = true then
  begin
    if FileExists(Clipboard.AsText) then
    begin
    move := ExtractFileName(Clipboard.AsText);
      try
        MoveFile(PChar(Clipboard.AsText), PChar(Edit1.Text + PChar(move)) );
      except
        on E: Exception do
          ShowMessage('File not found : ' + E.Message);
      end;
      InitExplo;
      ListView1.Update;

      if FindTreeNodePath(TreeView1, Path, '\',ReNode) then
        ReNode.Selected := True;
      Application.ProcessMessages;
    end;
  end;

  if FileExists(Clipboard.AsText) then
  begin
    try
      FileCopy(Clipboard.AsText,  Edit1.Text +  ExtractFileName(ClipPath));
    except
      on E: Exception do
        ShowMessage('File not found : ' + E.Message);
    end;
  end;

  if DirectoryExists(Clipboard.AsText) then
  begin
    try
      CopyDir(Clipboard.AsText, Edit1.Text);
    except
      on E: Exception do
        ShowMessage('Folder not found : ' + E.Message);
    end;
  end;

  InitExplo;
  ListView1.Update;

  if FindTreeNodePath(TreeView1, Path, '\',ReNode) then
    ReNode.Selected := True;
  Application.ProcessMessages;
end;

procedure TForm1.Paste2Click(Sender: TObject);
begin
  Paste1.Click;
end;

procedure TForm1.Properties1Click(Sender: TObject);
begin
  if not FileExists(Edit1.Text) then
  begin
   ShowMessage('File not found');
   Exit;
  end;

  PropertiesDialog(Edit1.Text);
end;

procedure TForm1.Properties2Click(Sender: TObject);
begin
  Properties1.Click;
end;

procedure TForm1.Rename1Click(Sender: TObject);
var
  str : string;
  ReNode : TTreeNode;
  Path : String;
begin
  CutFolder := false;
  CutFile := false;
  Path := NodePath;
  try
    InputQuery('New Name', 'Enter new Name:', str);
    RenameFileEx(Edit1.Text, ExtractFileDir(Edit1.Text) + '\' +   str, true);

    ListView1.Selected.Caption := str;
  except
    on E: Exception do
      ShowMessage('Access denied : ' + E.Message);
  end;

  InitExplo;
  ListView1.Update;

  if FindTreeNodePath(TreeView1, Path, '\',ReNode) then
    ReNode.Selected := True;
  Application.ProcessMessages;
end;

procedure TForm1.Rename2Click(Sender: TObject);
begin
  Rename1.Click;
end;

end.
