unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Gauges, System.Generics.Collections;

type
  TfrmMain = class(TForm)
    btnStartStop0: TButton;
    btnStartStop1: TButton;
    btnStartStop2: TButton;
    gauge0: TGauge;
    gauge1: TGauge;
    gauge2: TGauge;
    btnStartStop3: TButton;
    btnStartStop4: TButton;
    gauge3: TGauge;
    gauge4: TGauge;
    procedure FormCreate(Sender: TObject);
    procedure btnStartStop0Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
  public
  end;

var
  frmMain: TfrmMain;
  arrThreads: array of TThread;

implementation

{$R *.dfm}

procedure TfrmMain.btnStartStop0Click(Sender: TObject);
var
  thread: TThread;
begin
  if (Sender as TButton).Caption = 'Stop' then
  begin
    (Sender as TButton).Caption  :=  'Start';
    TGauge(FindComponent('gauge' + (Sender as TButton).Tag.ToString)).Tag := 1;
    arrThreads[(Sender as TButton).Tag].Terminate;
  end
  else
  begin
    thread  :=
      TThread.CreateAnonymousThread(
        procedure
        var
          progress: integer;
        begin
          progress  :=  0;

          while (progress < 100) and (TGauge(FindComponent('gauge' + (Sender as TButton).Tag.ToString)).Tag = 0) do
          begin
            sleep(100);
            inc(progress);
            TThread.Queue(nil,
              procedure
              begin
                TGauge(FindComponent('gauge' + (Sender as TButton).Tag.ToString)).Progress  :=  progress;
              end
            );
          end;
        end
      );
    (Sender as TButton).Caption  :=  'Stop';
    TGauge(FindComponent('gauge' + (Sender as TButton).Tag.ToString)).Tag := 0;
    arrThreads[(Sender as TButton).Tag] :=  thread;
    arrThreads[(Sender as TButton).Tag].FreeOnTerminate  :=  true;
    arrThreads[(Sender as TButton).Tag].Start;
  end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  idx: integer;
begin
  for idx := 0 to Length(arrThreads) - 1 do
    if Assigned(arrThreads[idx]) and (not arrThreads[idx].Finished) then
    begin
      CanClose  :=  false;
      Application.MessageBox('You can''t close the application because has threads in execution', 'Error', MB_OK + MB_ICONERROR);
    end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  SetLength(arrThreads, 5);
end;

end.
