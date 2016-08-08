{ -----------------------------------------------------------------------------
  Unit Name: LibraryHelperU
  Author: Tristan Marlow
  Purpose: Library Helper

  ----------------------------------------------------------------------------
  Copyright (c) 2016 Tristan David Marlow
  Copyright (c) 2016 Little Earth Solutions
  All Rights Reserved

  This product is protected by copyright and distributed under
  licenses restricting copying, distribution and decompilation

  ----------------------------------------------------------------------------

  History: 

  ----------------------------------------------------------------------------- }
unit LibraryHelperU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Generics.Collections, LibraryPathsU;

type
  TDelphiLibrary = (dlAndroid32, dlIOS32, dlIOS64, dlIOSimulator, dlOSX32,
    dlWin32, dlWin64);

type
  TEnviromentVariable = class
  private
    FName: string;
    FValue: string;
    procedure SetName(const Value: string);
    procedure SetValue(const Value: string);
  public
    property Name: string read FName write SetName;
    property Value: string read FValue write SetValue;
  end;

type
  TEnviromentVariableList = TObjectList<TEnviromentVariable>;

type
  TEnvironmentVariables = class
  private
    FEnviromentVariableList: TEnviromentVariableList;
    function GetValue(AName: string): string;
    function GetVariable(AIndex: integer): TEnviromentVariable;
    procedure SetValue(AName: string; const Value: string);
  protected
  public
    function FindVariable(AName: string): TEnviromentVariable;
    constructor Create;
    destructor Destroy;
    function Count: integer;
    function Add(AName: string; AValue: string): integer;
    procedure Clear;
    property Variable[AIndex: integer]: TEnviromentVariable read GetVariable;
    property Value[AName: string]: string read GetValue write SetValue;
  end;

type
  TDelphiInstallation = class
  private
    FRegistryKey: string;
    FRootPath: string;
    FEnvironmentVariables: TEnvironmentVariables;
    FSystemEnvironmentVariables: TEnvironmentVariables;
    FLibraryAndroid32: TStringList;
    FLibraryIOS32: TStringList;
    FLibraryIOS64: TStringList;
    FLibraryIOSSimulator: TStringList;
    FLibraryOSX32: TStringList;
    FLibraryWin32: TStringList;
    FLibraryWin64: TStringList;
    function GetInstalled: boolean;
    function GetProductName: string;
    procedure SaveEnvironmentVariables;
    procedure LoadEnvironmentVariables;
    procedure LoadSystemEnvironmentVariables;
    procedure LoadLibraries;
    procedure SaveLibraries;
    procedure SetLibraryAndroid32(const Value: string);
    procedure SetLibraryIOS32(const Value: string);
    procedure SetLibraryIOS64(const Value: string);
    procedure SetLibraryIOSSimulator(const Value: string);
    procedure SetLibraryOSX32(const Value: string);
    procedure SetLibraryWin32(const Value: string);
    procedure SetLibraryWin64(const Value: string);
    function LoadLibrary(ALibrary: string): string;
    procedure SaveLibrary(ALibrary: string; AValue: string);
    function GetLibraryAndroid32: string;
    function GetLibraryIOS32: string;
    function GetLibraryIOS64: string;
    function GetLibraryIOSSimulator: string;
    function GetLibraryOSX32: string;
    function GetLibraryWin32: string;
    function GetLibraryWin64: string;
    function GetRootPath: string;
    function GetLibraryPathAsString(AStrings: TStrings): string;
    procedure SetLibraryPathFromString(AString: string; AStrings: TStrings);
    function GetLibraryPathDelimited(AStrings: TStrings): string;
    procedure SetLibraryPathFromDelimited(AString: string; AStrings: TStrings);
    function CreateLibraryStringList: TStringList;
    function GetProductVersion: integer;
    procedure ApplyTemplatePaths(ALibraryPaths: TLibraryPaths;
      ALibrary: TStrings);
    function GetAllEnvironemntVariables(const Vars: TStrings): integer;

    procedure ValidateLibraryPaths(ALibrary: TStrings);
    procedure DeduplicateLibraryPaths(ALibrary: TStrings);
    function ExecuteFile(const Operation, FileName, Params, DefaultDir: string;
      ShowCmd: word): integer;
  public
    constructor Create(ARegistryKey: string);
    destructor Destroy; override;
    procedure Load;
    procedure Save;
    procedure Apply(ALibraryPathTemplate: TLibraryPathTemplate); overload;
    procedure Apply(AFileName: TFileName); overload;
    function AddPath(APath: string; ALibrary: TDelphiLibrary): boolean;
    procedure DeduplicateLibrary(ALibrary: TDelphiLibrary);
    function OpenFolder(AFolder: string): boolean;
    function ExpandLibraryPath(APath: string): string;
    property Installed: boolean read GetInstalled;
    property ProductVersion: integer read GetProductVersion;
    property ProductName: string read GetProductName;
    property RootPath: string read GetRootPath;
    property EnvironmentVariables: TEnvironmentVariables
      read FEnvironmentVariables;
    property SystemEnvironmentVariables: TEnvironmentVariables
      read FSystemEnvironmentVariables;
    property LibraryWin32: string read GetLibraryWin32 write SetLibraryWin32;
    property LibraryWin64: string read GetLibraryWin64 write SetLibraryWin64;
    property LibraryOSX32: string read GetLibraryOSX32 write SetLibraryOSX32;
    property LibraryAndroid32: string read GetLibraryAndroid32
      write SetLibraryAndroid32;
    property LibraryIOS32: string read GetLibraryIOS32 write SetLibraryIOS32;
    property LibraryIOS64: string read GetLibraryIOS64 write SetLibraryIOS64;
    property LibraryIOSSimulator: string read GetLibraryIOSSimulator
      write SetLibraryIOSSimulator;
  end;

type
  TDelphiInstallationList = TObjectList<TDelphiInstallation>;

type
  TLibraryHelper = class(TObject)
  private
    FDelphiInstallationList: TDelphiInstallationList;
    function GetInstallation(AIndex: integer): TDelphiInstallation;
    function IsProcessRunning(AFileName: string): boolean;
  protected
    procedure GetDelphiInstallations;
    function FindInstallation(AProductName: string): TDelphiInstallation;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Load;
    function InstallationCount: integer;
    function IsDelphiRunning: boolean;
    property Installations[AIndex: integer]: TDelphiInstallation
      read GetInstallation;
    property Installation[AProductName: string]: TDelphiInstallation
      read FindInstallation;

  end;

implementation

uses System.Win.Registry, Winapi.ShellAPI, Vcl.Forms, Winapi.TlHelp32;

constructor TLibraryHelper.Create;
begin
  FDelphiInstallationList := TDelphiInstallationList.Create;
end;

destructor TLibraryHelper.Destroy;
begin
  try
    FreeAndNil(FDelphiInstallationList);
  finally
    inherited;
  end;
end;

function TLibraryHelper.FindInstallation(AProductName: string)
  : TDelphiInstallation;
var
  LIdx: integer;
begin
  Result := nil;
  LIdx := 0;
  while (LIdx < InstallationCount) and (Result = nil) do
  begin
    if SameText(FDelphiInstallationList.Items[LIdx].ProductName, AProductName)
    then
    begin
      Result := FDelphiInstallationList.Items[LIdx];
    end;
    Inc(LIdx);
  end;
end;

procedure TLibraryHelper.GetDelphiInstallations;

const
  BDS_KEY = 'SOFTWARE\Embarcadero\BDS';

var
  LRegistry: TRegistry;
  LKeys: TStringList;
  LKeyIdx: integer;
  LKeyName: string;
begin
  LRegistry := TRegistry.Create;
  LKeys := TStringList.Create;
  try
    LRegistry.RootKey := HKEY_LOCAL_MACHINE;
    if LRegistry.OpenKeyReadOnly(BDS_KEY) then
    begin
      LRegistry.GetKeyNames(LKeys);
      for LKeyIdx := 0 to PreD(LKeys.Count) do
      begin
        LKeyName := IncludeTrailingBackslash(BDS_KEY) + LKeys[LKeyIdx];
        LRegistry.CloseKey;
        if LRegistry.OpenKeyReadOnly(LKeyName) then
        begin
          FDelphiInstallationList.Add(TDelphiInstallation.Create(LKeyName));
          LRegistry.CloseKey;
        end;
      end;
    end;
  finally
    FreeAndNil(LRegistry);
    FreeAndNil(LKeys);
  end;
end;

function TLibraryHelper.GetInstallation(AIndex: integer): TDelphiInstallation;
begin
  Result := FDelphiInstallationList.Items[AIndex];
end;

function TLibraryHelper.InstallationCount: integer;
begin
  Result := FDelphiInstallationList.Count;
end;

function TLibraryHelper.IsProcessRunning(AFileName: string): boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile))
      = UpperCase(AFileName)) or (UpperCase(FProcessEntry32.szExeFile)
      = UpperCase(AFileName))) then
    begin
      Result := True;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function TLibraryHelper.IsDelphiRunning: boolean;
begin
  Result := IsProcessRunning('bds.exe');
end;

procedure TLibraryHelper.Load;
begin
  GetDelphiInstallations;
end;

{ TDelphiVersion }

procedure TDelphiInstallation.Apply(ALibraryPathTemplate: TLibraryPathTemplate);
begin
  ApplyTemplatePaths(ALibraryPathTemplate.Common, FLibraryAndroid32);
  ApplyTemplatePaths(ALibraryPathTemplate.CommonFMX, FLibraryAndroid32);
  ApplyTemplatePaths(ALibraryPathTemplate.Android32, FLibraryAndroid32);

  ApplyTemplatePaths(ALibraryPathTemplate.Common, FLibraryIOS32);
  ApplyTemplatePaths(ALibraryPathTemplate.CommonFMX, FLibraryIOS32);
  ApplyTemplatePaths(ALibraryPathTemplate.IOS32, FLibraryIOS32);

  ApplyTemplatePaths(ALibraryPathTemplate.Common, FLibraryIOS64);
  ApplyTemplatePaths(ALibraryPathTemplate.CommonFMX, FLibraryIOS64);
  ApplyTemplatePaths(ALibraryPathTemplate.IOS64, FLibraryIOS64);

  ApplyTemplatePaths(ALibraryPathTemplate.Common, FLibraryIOSSimulator);
  ApplyTemplatePaths(ALibraryPathTemplate.CommonFMX, FLibraryIOSSimulator);
  ApplyTemplatePaths(ALibraryPathTemplate.IOS32, FLibraryIOSSimulator);

  ApplyTemplatePaths(ALibraryPathTemplate.Common, FLibraryOSX32);
  ApplyTemplatePaths(ALibraryPathTemplate.CommonFMX, FLibraryOSX32);
  ApplyTemplatePaths(ALibraryPathTemplate.OSX32, FLibraryOSX32);

  ApplyTemplatePaths(ALibraryPathTemplate.Common, FLibraryWin32);
  ApplyTemplatePaths(ALibraryPathTemplate.CommonFMX, FLibraryWin32);
  ApplyTemplatePaths(ALibraryPathTemplate.CommonVCL, FLibraryWin32);
  ApplyTemplatePaths(ALibraryPathTemplate.Win32, FLibraryWin32);

  ApplyTemplatePaths(ALibraryPathTemplate.Common, FLibraryWin64);
  ApplyTemplatePaths(ALibraryPathTemplate.CommonFMX, FLibraryWin64);
  ApplyTemplatePaths(ALibraryPathTemplate.CommonVCL, FLibraryWin64);
  ApplyTemplatePaths(ALibraryPathTemplate.Win64, FLibraryWin64);

end;

function TDelphiInstallation.AddPath(APath: string;
  ALibrary: TDelphiLibrary): boolean;
var
  LPath: string;
begin
  Result := False;
  LPath := APath;
  LPath := ExpandLibraryPath(LPath);
  if (Trim(LPath) <> '') and (DirectoryExists(LPath)) then
  begin
    case ALibrary of
      dlAndroid32:
        FLibraryAndroid32.Add(ExcludeTrailingPathDelimiter(APath));
      dlIOS32:
        FLibraryIOS32.Add(ExcludeTrailingPathDelimiter(APath));
      dlIOS64:
        FLibraryIOS64.Add(ExcludeTrailingPathDelimiter(APath));
      dlIOSimulator:
        FLibraryIOSSimulator.Add(ExcludeTrailingPathDelimiter(APath));
      dlOSX32:
        FLibraryOSX32.Add(ExcludeTrailingPathDelimiter(APath));
      dlWin32:
        FLibraryWin32.Add(ExcludeTrailingPathDelimiter(APath));
      dlWin64:
        FLibraryWin64.Add(ExcludeTrailingPathDelimiter(APath));
    end;
    Result := True;
  end;
end;

procedure TDelphiInstallation.Apply(AFileName: TFileName);
var
  LLibraryPathTemplate: TLibraryPathTemplate;
begin
  LLibraryPathTemplate := TLibraryPathTemplate.Create;
  try
    LLibraryPathTemplate.Load(AFileName);
    Apply(LLibraryPathTemplate);
  finally
    FreeAndNil(LLibraryPathTemplate);
  end;
end;

procedure TDelphiInstallation.ApplyTemplatePaths(ALibraryPaths: TLibraryPaths;
  ALibrary: TStrings);
var
  LPaths: TStringList;
  LPathIdx: integer;
begin
  LPaths := TStringList.Create;
  try
    ALibraryPaths.AsStringList(LPaths, True);
    for LPathIdx := 0 to PreD(LPaths.Count) do
    begin
      ALibrary.Add(LPaths[LPathIdx]);
    end;
  finally
    FreeAndNil(LPaths);
  end;
end;

constructor TDelphiInstallation.Create(ARegistryKey: string);
begin
  FRegistryKey := ARegistryKey;
  FEnvironmentVariables := TEnvironmentVariables.Create;
  FSystemEnvironmentVariables := TEnvironmentVariables.Create;
  FLibraryAndroid32 := CreateLibraryStringList;
  FLibraryIOS32 := CreateLibraryStringList;
  FLibraryIOS64 := CreateLibraryStringList;
  FLibraryIOSSimulator := CreateLibraryStringList;
  FLibraryOSX32 := CreateLibraryStringList;
  FLibraryWin32 := CreateLibraryStringList;
  FLibraryWin64 := CreateLibraryStringList;
end;

function TDelphiInstallation.CreateLibraryStringList: TStringList;
begin
  Result := TStringList.Create;
  Result.Duplicates := dupIgnore;
  Result.Sorted := True;
end;

procedure TDelphiInstallation.DeduplicateLibrary(ALibrary: TDelphiLibrary);
begin
  case ALibrary of
    dlAndroid32:
      DeduplicateLibraryPaths(FLibraryAndroid32);
    dlIOS32:
      DeduplicateLibraryPaths(FLibraryIOS32);
    dlIOS64:
      DeduplicateLibraryPaths(FLibraryIOS64);
    dlIOSimulator:
      DeduplicateLibraryPaths(FLibraryIOSSimulator);
    dlOSX32:
      DeduplicateLibraryPaths(FLibraryOSX32);
    dlWin32:
      DeduplicateLibraryPaths(FLibraryWin32);
    dlWin64:
      DeduplicateLibraryPaths(FLibraryWin64);
  end;
end;

procedure TDelphiInstallation.DeduplicateLibraryPaths(ALibrary: TStrings);
var
  LLibrary: TStringList;
  LPath: string;
  LLibraryIdx: integer;
  LValid: boolean;
  LFindIdx: integer;
begin
  LLibrary := TStringList.Create;
  LLibrary.Duplicates := dupIgnore;
  LLibrary.Sorted := True;
  try
    LLibraryIdx := 0;
    while LLibraryIdx < ALibrary.Count do
    begin
      LValid := True;
      try
        LPath := ALibrary[LLibraryIdx];
        LPath := ExpandLibraryPath(LPath);
        if (LLibrary.Find(LPath, LFindIdx)) or
          (LLibrary.Find(IncludeTrailingPathDelimiter(LPath), LFindIdx)) then
        begin
          LValid := False;
        end
        else
        begin
          LLibrary.Add(LPath);
        end;
      finally
        if LValid then
        begin
          Inc(LLibraryIdx);
        end
        else
        begin
          ALibrary.Delete(LLibraryIdx);
        end;
      end;
    end;
  finally
    FreeAndNil(LLibrary);
  end;
end;

destructor TDelphiInstallation.Destroy;
begin
  try
    FreeAndNil(FEnvironmentVariables);
    FreeAndNil(FSystemEnvironmentVariables);
    FreeAndNil(FLibraryAndroid32);
    FreeAndNil(FLibraryIOS32);
    FreeAndNil(FLibraryIOS64);
    FreeAndNil(FLibraryIOSSimulator);
    FreeAndNil(FLibraryOSX32);
    FreeAndNil(FLibraryWin32);
    FreeAndNil(FLibraryWin64);
  finally
    inherited;
  end;
end;

function TDelphiInstallation.ExpandLibraryPath(APath: string): string;
var
  LVariableIdx: integer;
begin
  Result := APath;
  for LVariableIdx := 0 to PreD(FSystemEnvironmentVariables.Count) do
  begin
    Result := ExcludeTrailingPathDelimiter(StringReplace(Result,
      Format('$(%s)', [FSystemEnvironmentVariables.Variable[LVariableIdx].Name]
      ), FSystemEnvironmentVariables.Variable[LVariableIdx].Value,
      [rfReplaceAll, rfIgnoreCase]));
  end;
end;

procedure TDelphiInstallation.Load;
begin
  LoadSystemEnvironmentVariables;
  LoadEnvironmentVariables;
  LoadLibraries;
end;

procedure TDelphiInstallation.LoadEnvironmentVariables;

var
  LRegistry: TRegistry;
  LLibraryKey: string;
  LValues: TStringList;
  LIdx: integer;
begin
  FEnvironmentVariables.Clear;
  LRegistry := TRegistry.Create;
  LValues := TStringList.Create;
  try
    LRegistry.RootKey := HKEY_CURRENT_USER;
    LLibraryKey := IncludeTrailingBackslash(FRegistryKey);
    LLibraryKey := IncludeTrailingBackslash
      (LLibraryKey + 'Environment Variables');
    if LRegistry.OpenKeyReadOnly(LLibraryKey) then
    begin
      LRegistry.GetValueNames(LValues);
      for LIdx := 0 to PreD(LValues.Count) do
      begin
        FEnvironmentVariables.Add(LValues[LIdx],
          LRegistry.ReadString(LValues[LIdx]));
      end;
    end;
  finally
    FreeAndNil(LRegistry);
    FreeAndNil(LValues);
  end;
end;

procedure TDelphiInstallation.LoadLibraries;
begin
  SetLibraryPathFromDelimited(LoadLibrary('Android32'), FLibraryAndroid32);
  SetLibraryPathFromDelimited(LoadLibrary('iOSDevice32'), FLibraryIOS32);
  SetLibraryPathFromDelimited(LoadLibrary('iOSDevice64'), FLibraryIOS64);
  SetLibraryPathFromDelimited(LoadLibrary('iOSSimulator'),
    FLibraryIOSSimulator);
  SetLibraryPathFromDelimited(LoadLibrary('OSX32'), FLibraryOSX32);
  SetLibraryPathFromDelimited(LoadLibrary('Win32'), FLibraryWin32);
  SetLibraryPathFromDelimited(LoadLibrary('Win64'), FLibraryWin64);
end;

function TDelphiInstallation.GetInstalled: boolean;

var
  LRegistry: TRegistry;
  LApp: string;
begin
  Result := False;
  LRegistry := TRegistry.Create;
  try
    LRegistry.RootKey := HKEY_CURRENT_USER;
    if LRegistry.OpenKeyReadOnly(FRegistryKey) then
    begin
      LApp := LRegistry.ReadString('App');
      Result := FileExists(LApp);
    end;
  finally
    FreeAndNil(LRegistry);
  end;
end;

function TDelphiInstallation.LoadLibrary(ALibrary: string): string;

var
  LRegistry: TRegistry;
  LLibraryKey: string;
begin
  Result := '';
  LRegistry := TRegistry.Create;
  try
    LRegistry.RootKey := HKEY_CURRENT_USER;
    LLibraryKey := IncludeTrailingBackslash(FRegistryKey);
    LLibraryKey := IncludeTrailingBackslash(LLibraryKey + 'Library');
    LLibraryKey := IncludeTrailingBackslash(LLibraryKey + ALibrary);
    if LRegistry.OpenKeyReadOnly(LLibraryKey) then
    begin
      Result := LRegistry.ReadString('Search Path');
    end;
  finally
    FreeAndNil(LRegistry);
  end;
end;

function TDelphiInstallation.GetAllEnvironemntVariables
  (const Vars: TStrings): integer;
var
  PEnvVars: PChar;
  // pointer to start of environment block
  PEnvEntry: PChar; // pointer to an env string in block
begin
  // Clear the list
  if Assigned(Vars) then
    Vars.Clear;
  // Get reference to environment block for this process
  PEnvVars := GetEnvironmentStrings;
  if PEnvVars <> nil then
  begin
    // We have a block: extract strings from it
    // Env strings are #0 separated and list ends with #0#0
    PEnvEntry := PEnvVars;
    try
      while PEnvEntry^ <> #0 do
      begin
        if Assigned(Vars) then
          Vars.Add(PEnvEntry);
        Inc(PEnvEntry, StrLen(PEnvEntry) + 1);
      end;
      // Calculate length of block
      Result := (PEnvEntry - PEnvVars) + 1;
    finally
      // Dispose of the memory block
      FreeEnvironmentStrings(PEnvVars);
    end;
  end
  else
    // No block => zero length
    Result := 0;
end;

procedure TDelphiInstallation.LoadSystemEnvironmentVariables;
var
  LVars: TStringList;
  LVarIdx: integer;
begin
  LVars := TStringList.Create;
  try
    FSystemEnvironmentVariables.Clear;
    GetAllEnvironemntVariables(LVars);
    for LVarIdx := 0 to PreD(LVars.Count) do
    begin
      FSystemEnvironmentVariables.Add(LVars.Names[LVarIdx],
        LVars.ValueFromIndex[LVarIdx]);
    end;
  finally
    FreeAndNil(LVars);
  end;
end;

function TDelphiInstallation.OpenFolder(AFolder: string): boolean;
var
  LFolder: string;
begin
  LFolder := AFolder;
  LFolder := ExpandLibraryPath(LFolder);
  Result := ExecuteFile('open', PChar('explorer.exe'), PChar(LFolder), '',
    SW_SHOWNORMAL) > 32;
end;

function TDelphiInstallation.ExecuteFile(const Operation, FileName, Params,
  DefaultDir: string; ShowCmd: word): integer;
var
  zFileName, zParams, zDir: array [0 .. 255] of char;
begin
  Result := ShellExecute(Application.Handle, PChar(Operation),
    StrPCopy(zFileName, FileName), StrPCopy(zParams, Params),
    StrPCopy(zDir, DefaultDir), ShowCmd);
end;

function TDelphiInstallation.GetLibraryAndroid32: string;
begin
  Result := GetLibraryPathAsString(FLibraryAndroid32);
end;

function TDelphiInstallation.GetLibraryIOS32: string;
begin
  Result := GetLibraryPathAsString(FLibraryIOS32);
end;

function TDelphiInstallation.GetLibraryIOS64: string;
begin
  Result := GetLibraryPathAsString(FLibraryIOS64);
end;

function TDelphiInstallation.GetLibraryIOSSimulator: string;
begin
  Result := GetLibraryPathAsString(FLibraryIOSSimulator);
end;

function TDelphiInstallation.GetLibraryOSX32: string;
begin
  Result := GetLibraryPathAsString(FLibraryOSX32);
end;

function TDelphiInstallation.GetLibraryPathAsString(AStrings: TStrings): string;
begin
  Result := AStrings.Text;
end;

function TDelphiInstallation.GetLibraryWin32: string;
begin
  Result := GetLibraryPathAsString(FLibraryWin32);
end;

function TDelphiInstallation.GetLibraryWin64: string;
begin
  Result := GetLibraryPathAsString(FLibraryWin64);
end;

function TDelphiInstallation.GetProductName: string;
var
  LProductVersion: integer;
begin
  LProductVersion := GetProductVersion;
  case LProductVersion of
    24:
      Result := 'Delphi 10.1 Berlin';
  else
    Result := Format('Unknown Version %d', [LProductVersion]);
  end;
end;

function TDelphiInstallation.GetProductVersion: integer;
var
  LRegistry: TRegistry;
begin
  Result := -1;
  LRegistry := TRegistry.Create;
  try
    LRegistry.RootKey := HKEY_CURRENT_USER;
    if LRegistry.OpenKeyReadOnly(FRegistryKey) then
    begin
      Result := StrToIntDef(LRegistry.ReadString('ProductVersion'), -1);
    end;
  finally
    FreeAndNil(LRegistry);
  end;
end;

function TDelphiInstallation.GetRootPath: string;

var
  LRegistry: TRegistry;
begin
  Result := '';
  LRegistry := TRegistry.Create;
  try
    LRegistry.RootKey := HKEY_CURRENT_USER;
    if LRegistry.OpenKeyReadOnly(FRegistryKey) then
    begin
      Result := LRegistry.ReadString('RootDir');
    end;
  finally
    FreeAndNil(LRegistry);
  end;
end;

procedure TDelphiInstallation.Save;
begin
  SaveEnvironmentVariables;
  SaveLibraries;
end;

procedure TDelphiInstallation.SaveEnvironmentVariables;

var
  LRegistry: TRegistry;
  LLibraryKey: string;
  LValues: TStringList;
  LIdx: integer;
begin
  LRegistry := TRegistry.Create;
  LValues := TStringList.Create;
  try
    LRegistry.RootKey := HKEY_CURRENT_USER;
    LLibraryKey := IncludeTrailingBackslash(FRegistryKey);
    LLibraryKey := IncludeTrailingBackslash
      (LLibraryKey + 'Environment Variables');
    LRegistry.DeleteKey(LLibraryKey);
    if LRegistry.OpenKey(LLibraryKey, True) then
    begin
      for LIdx := 0 to PreD(FEnvironmentVariables.Count) do
      begin
        LRegistry.WriteString(FEnvironmentVariables.Variable[LIdx].Name,
          FEnvironmentVariables.Variable[LIdx].Value);
      end;
      LRegistry.CloseKey;
    end;
  finally
    FreeAndNil(LRegistry);
    FreeAndNil(LValues);
  end;
end;

procedure TDelphiInstallation.SaveLibraries;
begin
  SaveLibrary('Android32', GetLibraryPathDelimited(FLibraryAndroid32));
  SaveLibrary('iOSDevice32', GetLibraryPathDelimited(FLibraryIOS32));
  SaveLibrary('iOSDevice64', GetLibraryPathDelimited(FLibraryIOS64));
  SaveLibrary('iOSSimulator', GetLibraryPathDelimited(FLibraryIOSSimulator));
  SaveLibrary('OSX32', GetLibraryPathDelimited(FLibraryOSX32));
  SaveLibrary('Win32', GetLibraryPathDelimited(FLibraryWin32));
  SaveLibrary('Win64', GetLibraryPathDelimited(FLibraryWin64));
end;

procedure TDelphiInstallation.SaveLibrary(ALibrary, AValue: string);

var
  LRegistry: TRegistry;
  LLibraryKey: string;
begin
  LRegistry := TRegistry.Create;
  try
    LRegistry.RootKey := HKEY_CURRENT_USER;
    LLibraryKey := IncludeTrailingBackslash(FRegistryKey);
    LLibraryKey := IncludeTrailingBackslash(LLibraryKey + 'Library');
    LLibraryKey := IncludeTrailingBackslash(LLibraryKey + ALibrary);
    if LRegistry.OpenKey(LLibraryKey, False) then
    begin
      LRegistry.WriteString('Search Path', AValue);
    end;
  finally
    FreeAndNil(LRegistry);
  end;
end;

procedure TDelphiInstallation.SetLibraryAndroid32(const Value: string);
begin
  SetLibraryPathFromString(Value, FLibraryAndroid32);
end;

procedure TDelphiInstallation.SetLibraryIOS32(const Value: string);
begin
  SetLibraryPathFromString(Value, FLibraryIOS32);
end;

procedure TDelphiInstallation.SetLibraryIOS64(const Value: string);
begin
  SetLibraryPathFromString(Value, FLibraryIOS64);
end;

procedure TDelphiInstallation.SetLibraryIOSSimulator(const Value: string);
begin
  SetLibraryPathFromString(Value, FLibraryIOSSimulator);
end;

procedure TDelphiInstallation.SetLibraryOSX32(const Value: string);
begin
  SetLibraryPathFromString(Value, FLibraryOSX32);
end;

procedure TDelphiInstallation.SetLibraryPathFromString(AString: string;
  AStrings: TStrings);
begin
  AStrings.Text := AString;
  ValidateLibraryPaths(AStrings);
  DeduplicateLibraryPaths(AStrings);
end;

procedure TDelphiInstallation.SetLibraryWin32(const Value: string);
begin
  SetLibraryPathFromString(Value, FLibraryWin32);
end;

procedure TDelphiInstallation.SetLibraryWin64(const Value: string);
begin
  SetLibraryPathFromString(Value, FLibraryWin64);
end;

procedure TDelphiInstallation.ValidateLibraryPaths(ALibrary: TStrings);
var
  LLibraryPaths: TStringList;
  LPath: string;
  LLibraryIdx: integer;
  LValid: boolean;
begin
  LLibraryPaths := CreateLibraryStringList;
  try
    LLibraryIdx := 0;
    while LLibraryIdx < ALibrary.Count do
    begin
      LValid := True;
      try
        LPath := ALibrary[LLibraryIdx];
        LPath := ExpandLibraryPath(LPath);
        LValid := (Trim(LPath) <> '') and (DirectoryExists(LPath));
      finally
        if LValid then
        begin
          LLibraryPaths.Add(ExcludeTrailingPathDelimiter
            (ALibrary[LLibraryIdx]));
          Inc(LLibraryIdx);
        end
        else
        begin
          ALibrary.Delete(LLibraryIdx);
        end;
      end;
    end;
    ALibrary.Text := LLibraryPaths.Text;
  finally
    FreeAndNil(LLibraryPaths);
  end;
end;

function TDelphiInstallation.GetLibraryPathDelimited
  (AStrings: TStrings): string;
var
  LIdx: integer;
begin
  Result := '';
  for LIdx := 0 to PreD(AStrings.Count) do
  begin
    if (Trim(AStrings[LIdx]) <> '') then
    begin
      Result := Result + ';';
    end;
    Result := Result + ExcludeTrailingPathDelimiter(AStrings[LIdx]);
  end;
end;

procedure TDelphiInstallation.SetLibraryPathFromDelimited(AString: string;
  AStrings: TStrings);
var
  LPath: string;
  LPaths: TStringList;
  LIdx: integer;
begin
  AStrings.Clear;
  LPaths := CreateLibraryStringList;
  try
    LPath := AString;
    LPath := StringReplace(LPath, ';', #13#10, [rfReplaceAll]);
    LPaths.Text := LPath;
    for LIdx := 0 to PreD(LPaths.Count) do
    begin
      AStrings.Add(ExcludeTrailingPathDelimiter(LPaths[LIdx]));
    end;
    ValidateLibraryPaths(AStrings);
    DeduplicateLibraryPaths(AStrings);
  finally
    FreeAndNil(LPaths);
  end;

end;

{ TEnviromentVariable }

procedure TEnviromentVariable.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TEnviromentVariable.SetValue(const Value: string);
begin
  FValue := Value;
end;

{ TEnvironmentVariables }

function TEnvironmentVariables.Add(AName: string; AValue: string): integer;

var
  LEnviromentVariable: TEnviromentVariable;
begin
  Result := -1;
  LEnviromentVariable := FindVariable(AName);
  if Assigned(LEnviromentVariable) then
  begin
    Result := FEnviromentVariableList.IndexOf(LEnviromentVariable);
  end
  else
  begin
    LEnviromentVariable := TEnviromentVariable.Create;
    LEnviromentVariable.Name := AName;
    Result := FEnviromentVariableList.Add(LEnviromentVariable);
  end;
  LEnviromentVariable.Value := AValue;
end;

procedure TEnvironmentVariables.Clear;
begin
  FEnviromentVariableList.Clear;
end;

function TEnvironmentVariables.Count: integer;
begin
  Result := FEnviromentVariableList.Count;
end;

constructor TEnvironmentVariables.Create;
begin
  FEnviromentVariableList := TEnviromentVariableList.Create;
end;

destructor TEnvironmentVariables.Destroy;
begin
  try
    FreeAndNil(FEnviromentVariableList);
  finally
    inherited;
  end;
end;

function TEnvironmentVariables.FindVariable(AName: string): TEnviromentVariable;

var
  LIdx: integer;
begin
  Result := nil;
  LIdx := 0;
  while (LIdx < Count) and (Result = nil) do
  begin
    if SameText(FEnviromentVariableList.Items[LIdx].Name, AName) then
    begin
      Result := FEnviromentVariableList.Items[LIdx];
    end;
    Inc(LIdx);
  end;
end;

function TEnvironmentVariables.GetValue(AName: string): string;

var
  LEnviromentVariable: TEnviromentVariable;
begin
  Result := '';
  LEnviromentVariable := FindVariable(AName);
  if Assigned(LEnviromentVariable) then
  begin
    Result := LEnviromentVariable.Value;
  end;
end;

function TEnvironmentVariables.GetVariable(AIndex: integer)
  : TEnviromentVariable;
begin
  Result := FEnviromentVariableList.Items[AIndex];
end;

procedure TEnvironmentVariables.SetValue(AName: string; const Value: string);

var
  LEnviromentVariable: TEnviromentVariable;
begin
  LEnviromentVariable := FindVariable(AName);
  if Assigned(LEnviromentVariable) then
    LEnviromentVariable.Value := Value;
end;

end.
