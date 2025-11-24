unit Explorer;

interface

uses
  Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, ImgList,
  ExtCtrls, StdCtrls, Shellapi, ToolWin, Menus, Registry ;

procedure InitExplo ;
procedure AddArbo(Node : TTreeNode) ;
procedure SSRep(Target : TTreeNode) ;
procedure ListeFiles(Node: TTreeNode);
function  GetFileTypeString(Extension : String): String ;
function  Path(Target : TTreeNode): String ;

implementation

uses Unit1;

procedure InitExplo ;
var
 Read, Name, FilePath :  array[0..254] of char;
 i, j : Integer ;
 Buffer, Buf1 : String ;
 Position : TTreeNode ;
 Truc2,Truc3 : Cardinal ;
 N : Word ;
 H : HIcon ;
 Icone : TIcon ;
begin
   GetTempPath(sizeof(Name), Name);
   i := 0 ;
   Buffer := '' ;

   while Name[i+1] <> #0 do begin
     Buffer := Buffer + Name[i] ;
     inc(i) ;
   end ;

   strpcopy(FilePath, Buffer);
   N := 0 ;
   H := ExtractAssociatedIcon(Application.Handle, FilePath, N) ;
   Icone := TIcon.Create ;
   Icone.Handle := H ;
   Form1.ImageList1.AddIcon(Icone) ;
   Form1.ImageList2.AddIcon(Icone) ;
   Icone.Free ;

   FilePath := '' ;
   Buffer := '' ;
   Name := '' ;
  with Form1.TreeView1.Items do begin
   Clear ;
   AddFirst(GetFirstNode, 'Computer') ;
   Item[0].ImageIndex := 0 ;
  end ;

   GetLogicalDriveStrings(254, Read) ;
   i := 0 ;
  while Read[i] <> #0 do begin
   while Read[i] <> #0 do begin
    If Read[i] <> '\' then Buffer := Buffer + Read[i] ;
    inc(i) ;
   end ;

    Buf1 := Buffer+'\' ;
    Name  := '' ;
    GetVolumeInformation(@Buf1[1] ,Name , 254, nil, Truc2, Truc3, nil, 254) ;
    n := GetDriveType(@Buf1[1]) ;

    If (Name = '') and (n = DRIVE_CDROM)     then Name := 'CD/DVD Reader' ;
    If (Name = '') and (n = DRIVE_REMOVABLE) then Name := 'Removable disk' ;
    If (Name = '') and (n = DRIVE_REMOTE)    then Name := 'Network drive' ;

    strpcopy(FilePath, Buf1);
    N := 0 ;
    H := ExtractAssociatedIcon(Application.Handle, FilePath, N) ;

    Icone := TIcon.Create ;
    Icone.Handle := H ;

    J := Form1.ImageList1.AddIcon(Icone) ;
         Form1.ImageList2.AddIcon(Icone) ;
    Icone.Free ;

    Position := Form1.TreeView1.Items.AddChild(Form1.TreeView1.Items.GetFirstNode,
                Name + ' (' + Buffer + ')' ) ;
    Position.ImageIndex := J ;
    Position.SelectedIndex := J ;

    with Form1.ListView1.Items.Add do begin
      Caption := Name + ' (' + Buffer + ')' ;
      ImageIndex := J ;
    end ;

    Buffer := '' ;
    inc(i) ;
  end ;

    If DiskFree(i) <> -1 then begin
    end ;

    SSrep(Form1.TreeView1.Items.Item[0]) ;
    Form1.TreeView1.Selected := Form1.TreeView1.Items.GetFirstNode ;
    Form1.TreeView1.Selected.Expanded := True ;
end;

procedure AddArbo(Node : TTreeNode) ;
var
  Chem : String ;
  Pos : TTreeNode ;
  fichier : TSearchRec ;
begin

 If (Node.Parent <> nil) and (not Node.HasChildren) then begin
  chem := Path(Node) ;
  Chem := Chem + '\*.*' ;

         if FindFirst(Chem, faDirectory	, Fichier) = 0 then begin ;
             if ((Fichier.Attr and faDirectory) = faDirectory) and (Fichier.Name <> '..') and (Fichier.Name <> '.') then begin
                  Pos := form1.TreeView1.Items.AddChild(Node, Fichier.Name) ;
                  Pos.ImageIndex := 1 ;
                  Pos.SelectedIndex := 1 ;
             end ;

            while FindNext(Fichier) = 0 do begin ;
             if ((Fichier.Attr and faDirectory) = faDirectory) and (Fichier.Name <> '..') and (Fichier.Name <> '.') then begin
                  Pos := form1.TreeView1.Items.AddChild(Node, Fichier.Name) ;
                  Pos.ImageIndex := 1 ;
                  Pos.SelectedIndex := 1 ;
             end ;
            end ;
           FindClose(Fichier) ;
           FindNext(Fichier) ;
         end ;
 end ;
end ;

function Path(Target : TTreeNode): String ;
begin
   Result := '' ;
 If Target.Parent <> nil then
  while (Target.Parent.Text <> 'Computer') do begin
   Result := '\' + Target.Text + Result ;
   Target := Target.Parent ;
  end ;

 Result := Copy(Target.Text, length(Target.Text)-2, 2) + Result ;
end ;

procedure SSRep(Target : TTreeNode) ;
begin
    Target := Target.getFirstChild ;
   while Target <> nil do
   begin
    AddArbo(Target) ;
    Target := Target.GetNextChild(Target) ;
   end ;
end ;

procedure ListeFiles(Node: TTreeNode);
var
  Fich :  array[0..254] of char;
  Chem : String ;
  Pos : TTreeNode ;
  fichier : TSearchRec ;
  j : Integer ;
  p : TWin32FindData;
  Heures : SYSTEMTIME ;
  Liste : TStrings ;

    function GetIcone(IFile : String): Integer ;
    var
      H : HIcon ;
      PosListe : Integer ;
      N : Word ;
      Icone : TIcon ;
      Extension : String ;
    begin
      Extension := UpperCase(ExtractFileExt(IFile)) ;
        PosListe := Liste.IndexOf(Extension) ;
      If (PosListe = -1) or (Extension = '.EXE') or (Extension = '.BMP') or
         (Extension = '.ICO') or (Extension = '.JPG') or (Extension = '.LNK') then begin
        Liste.Add(Extension) ;
          N := 0 ;
          H := ExtractAssociatedIcon(0, Fich, N) ;
              Icone := TIcon.Create ;
              Icone.Handle := H ;
                   J := Form1.ImageList3.AddIcon(Icone) ;
                        Form1.ImageList4.AddIcon(Icone) ;
              Icone.Free ;
         Result := J ;
      end else
      Result := form1.ImageList1.Count+PosListe ;
    end;
begin
  form1.ListView1.Visible := False ;
  form1.ListView1.Items.Clear ;
  form1.ListView1.Visible := True ;

  Pos := Node.getFirstChild ;
    while Pos <> nil do begin
     with form1.ListView1.Items.Add do begin
      Caption := Pos.Text ;
      ImageIndex := Pos.ImageIndex ;
      SubItems.Add('') ;
      SubItems.Add(GetFileTypeString('Directory')) ;

     strpcopy(fich, Path(Node)+'\'+Caption);

     If (FindFirstFile(fich, p) <> INVALID_HANDLE_VALUE) then begin
         FileTimeToSystemTime(p.ftLastWriteTime, Heures) ;
         with Heures do SubItems.Add(Format('%.2d/%.2d/%.4d %.2d:%.2d',
                                                    // use (wHour+2) for Country Hours
                                [wDay, wMonth, wYear, (wHour)
                                mod 24, wMinute])) ;
     end ;
     end ;
     Pos := Pos.GetNextChild(Pos) ;
    end ;

    Liste := TStringList.Create ;
    Form1.ImageList3.Clear ;
    Form1.ImageList4.Clear ;
    Form1.ImageList3.Assign(form1.ImageList2) ;
    Form1.ImageList4.Assign(form1.ImageList1) ;

 If (Node.Parent <> nil) then begin
  chem := Path(Node) ;
  Chem := Chem + '\*.*' ;

         if FindFirst(Chem, faAnyFile, Fichier) = 0 then begin ;

            while FindNext(Fichier) = 0 do begin ;
             if ((Fichier.Attr and faDirectory) <> faDirectory) then
                with form1.ListView1.Items.Add do begin
                      Caption := Fichier.Name ;

                     strpcopy(fich, copy(chem, 0, length(chem)-3)+Fichier.Name);
                     ImageIndex := GetIcone(String(Fich)) ;

                  FindFirstFile(fich, p);
                  FileTimeToSystemTime(p.ftLastWriteTime, Heures) ;
                  SubItems.Text := FormatFloat('#,###" Kb"', (Trunc(p.nFileSizeLow/1024)+1));
                  SubItems.Add(GetFileTypeString(ExtractFileExt(Fichier.Name))) ;
                  with Heures do
                  SubItems.Add(Format('%.2d/%.2d/%.4d %.2d:%.2d',
                              [wDay, wMonth, wYear, (wHour+2) mod 24, wMinute])) ;

                end ;
            end ;
           FindClose(Fichier) ;
           FindNext(Fichier) ;
         end ;
 end;
   Liste.Free ;
   Screen.Cursor := crDefault;
end;

function GetFileTypeString(Extension : String): String ;
var
 Registry : TRegistry ;
begin
  Result := 'File '+UpperCase(copy(Extension, 2, MAX_PATH)) ;
  Registry := TRegistry.Create(KEY_READ);
  try
    Registry.RootKey := HKEY_CLASSES_ROOT;
    if Registry.KeyExists(Extension) then begin
        Registry.OpenKey(Extension, False);
        if UpperCase(Extension) <> 'DIRECTORY' then
            Extension := Registry.ReadString('') ;
        Registry.CloseKey ;
       If Extension <> '' then begin
          If Registry.KeyExists(Extension) then
           Registry.OpenKey(Extension, False) ;
           Result := Registry.ReadString('') ;
       end ;
    end ;
  finally
    Registry.Free;
  end;
end ;

end.
