unit FormMain;

interface

uses
  jw_filecopy,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvCombobox, JvDriveCtrls, JvListBox, Vcl.ExtCtrls, Vcl.FileCtrl;

const
  APP_NAME = '���Ϻ����';

type
  T_FormMain = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    Panel2: TPanel;
    JvDirectoryListBox1: TJvDirectoryListBox;
    JvDriveCombo1: TJvDriveCombo;
    Button1: TButton;
    a: TLabel;
    JvDirectoryListBox2: TJvDirectoryListBox;
    JvDriveCombo2: TJvDriveCombo;
    Label1: TLabel;
    JvFileListBox1: TJvFileListBox;
    CheckBox1: TCheckBox;
    btnCopy: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
  private
    { Private declarations }
//    FFileCopyThread: TJW_filecopy;

    procedure CopyFilesThread;
      procedure CopyOneFileThread(fn_src: string; dn_dest: string);

    procedure CopyFiles;
      procedure CopyOneFile(fn_src: string; dn_dest: string);

    procedure addlog(msg: string);
  public
    { Public declarations }
  end;

var
  _FormMain: T_FormMain;

implementation

{$R *.dfm}

procedure T_FormMain.addlog(msg: string);
begin
  memo1.Lines.Add(msg);
end;

procedure T_FormMain.btnCopyClick(Sender: TObject);
begin
  CopyFilesThread();
end;

procedure T_FormMain.Button1Click(Sender: TObject);
begin
  CopyFiles();
end;

procedure T_FormMain.CopyFiles;
var
  I: Integer;
  dn_src, dn_dest: string;
  fn_src: string;
label
  goto_copyfiles_end;
begin
  dn_src := JvDirectoryListBox1.Directory;
  dn_dest := JvDirectoryListBox2.Directory;

  if dn_src = dn_dest then begin
    Application.MessageBox('�����Ϸ��� ���� ��ġ�� ����.'+#13#10+'������ ���� ��ġ �ٲ����~', APP_NAME, MB_OK + MB_ICONWARNING);
    goto goto_copyfiles_end;
  end;

  if not CheckBox1.Checked then begin // ������ ���ϸ� ����
    if JvFileListBox1.SelCount = 0 then begin // �����Ѱ� ����
      Application.MessageBox('�����Ϸ��� ������ ������ ���ƿ�~', APP_NAME, MB_OK + MB_ICONWARNING);
      goto goto_copyfiles_end;
    end;
  end;

  if JvFileListBox1.Count = 0 then begin // ������ ������ �ϳ��� ����
    addlog('������ ������ ����');
    goto goto_copyfiles_end;
  end;

  addlog('=== ���� ���� ���� ===');

  for I := 0 to JvFileListBox1.Items.Count - 1 do begin
    fn_src := dn_src + '\' + JvFileListBox1.Items.Strings[i];

    if not CheckBox1.Checked then begin // ������ ���ϸ� ����
      if JvFileListBox1.Selected[i] then begin // ���� �߳�?
        CopyOneFile(fn_src, dn_dest);
      end
      else begin
        // skip : ���������ϸ� �����ϴ� �ɼ� + ���� ����.
      end;
    end
    else begin // ��� ����
      CopyOneFile(fn_src, dn_dest);
    end;
  end;

  addlog('=== ���� ���� �� ===');

goto_copyfiles_end:
  // do nothing
end;

procedure T_FormMain.CopyFilesThread;
var
  I: Integer;
  dn_src, dn_dest: string;
  fn_src: string;
label
  goto_copyfiles_end;
begin
  dn_src := JvDirectoryListBox1.Directory;
  dn_dest := JvDirectoryListBox2.Directory;

  if dn_src = dn_dest then begin
    Application.MessageBox('�����Ϸ��� ���� ��ġ�� ����.'+#13#10+'������ ���� ��ġ �ٲ����~', APP_NAME, MB_OK + MB_ICONWARNING);
    goto goto_copyfiles_end;
  end;

  if not CheckBox1.Checked then begin // ������ ���ϸ� ����
    if JvFileListBox1.SelCount = 0 then begin // �����Ѱ� ����
      Application.MessageBox('�����Ϸ��� ������ ������ ���ƿ�~', APP_NAME, MB_OK + MB_ICONWARNING);
      goto goto_copyfiles_end;
    end;
  end;

  if JvFileListBox1.Count = 0 then begin // ������ ������ �ϳ��� ����
    addlog('������ ������ ����');
    goto goto_copyfiles_end;
  end;

  addlog('=== ���� ���� ���� ===');

  //for I := 0 to JvFileListBox1.Items.Count - 1 do begin
  for I := 0 to 0 do begin
    fn_src := dn_src + '\' + JvFileListBox1.Items.Strings[i];

    if not CheckBox1.Checked then begin // ������ ���ϸ� ����
      if JvFileListBox1.Selected[i] then begin // ���� �߳�?
        CopyOneFileThread(fn_src, dn_dest);
      end
      else begin
        // skip : ���������ϸ� �����ϴ� �ɼ� + ���� ����.
      end;
    end
    else begin // ��� ����
      CopyOneFileThread(fn_src, dn_dest);
    end;
  end;

  addlog('=== ���� ���� �� ===');

goto_copyfiles_end:
  // do nothing
end;

procedure T_FormMain.CopyOneFile(fn_src, dn_dest: string);
var
  fn_dest: string;
  done: Boolean;
begin
  if FileExists(fn_src) then begin
    fn_dest := dn_dest + '\' + ExtractFileName(fn_src);
    fn_dest := StringReplace(fn_dest, '\\', '\', [rfReplaceAll]);
    done := CopyFile(PWideChar(fn_src), PWideChar(fn_dest), False);
    if done then begin
      addlog(fn_dest+'...���� �Ϸ�');
    end
    else begin
      addlog(fn_dest+'...���� ����('+IntToStr(GetLastError)+')');
    end;
  end
  else begin
    addlog('������ ����:'+fn_src);
  end;
end;

procedure T_FormMain.CopyOneFileThread(fn_src, dn_dest: string);
var
  cft: TJW_filecopy;
begin
  cft := TJW_filecopy.Create;
  cft.SetFileName(fn_src, dn_dest);
  cft.Resume;
end;

procedure T_FormMain.FormShow(Sender: TObject);
begin
  //JvDriveCombo2.ItemIndex
end;

end.