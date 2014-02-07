unit jw_filecopy;

interface

uses
  System.Classes;

type
  TJW_filecopy = class(TThread)
  private
    { Private declarations }
    FSrcFileName, FDestFileName: string;
    FSrcFileSize, FCopiedFileSize: Cardinal;
    FIsUserCancel: Boolean;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure SetFileName(srcFileName, destFileName: string);

    function GetTerminated: Boolean;
  protected
    procedure Do_FileCopy;
    procedure Execute; override;
  published
    property SrcFileSize: Cardinal read FSrcFileSize;
    property CopiedFileSize: Cardinal read FCopiedFileSize;
    property IsUserCancel: Boolean read FIsUserCancel write FIsUserCancel;
  end;

implementation

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TJW_filecopy.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end;

    or

    Synchronize(
      procedure
      begin
        Form1.Caption := 'Updated in thread via an anonymous method'
      end
      )
    );

  where an anonymous method is passed.

  Similarly, the developer can call the Queue method with similar parameters as
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.

}

{ jw_filecopy }

constructor TJW_filecopy.Create;
begin
  inherited Create(True);

  FSrcFileName := '';
  FDestFileName := '';
  FSrcFileSize := 0;
  FCopiedFileSize := 0;
  FIsUserCancel := False;
end;

destructor TJW_filecopy.Destroy;
begin
  inherited;

  Self.Terminate;
end;

procedure TJW_filecopy.Do_FileCopy;
begin

end;

procedure TJW_filecopy.Execute;
begin
  { Place thread code here }
  inherited;

  if not Terminated then Do_FileCopy;  
end;

function TJW_filecopy.GetTerminated: Boolean;
begin
  Result := Terminated;
end;

procedure TJW_filecopy.SetFileName(srcFileName, destFileName: string);
begin

end;

end.
