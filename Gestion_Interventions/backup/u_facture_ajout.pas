unit u_facture_ajout;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, MaskEdit;

type

  { Tf_facture_ajout }

  Tf_facture_ajout = class(TForm)
    cbo_pres_code: TComboBox;
    cbo_pres_type: TComboBox;
    lbl_pres_qte: TLabel;
    lbl_pres_code: TLabel;
    lbl_pres_type: TLabel;
    edt_pres_qte: TMaskEdit;
    pnl_detail: TPanel;
    pnl_titre: TPanel;
     procedure cbo_pres_codeCloseUp(Sender: TObject);
     procedure cbo_pres_typeCloseUp(Sender: TObject);
     procedure  Init;
     procedure  add;
     procedure  delete;
     procedure  add_prestation_to_facture (cle : string; cbo : TComboBox);
  private

  public

  end;

var
  f_facture_ajout: Tf_facture_ajout;

implementation

{$R *.lfm}

uses   u_feuille_style, u_facture_list;

procedure Tf_facture_ajout.Init;
begin
   style.panel_selection (pnl_titre);
   style.panel_travail  (pnl_detail);
         style.combo (cbo_pres_code);
         style.combo (cbo_pres_type);
   cbo_pres_code.Clear;
   cbo_pres_type.clear;
end;

procedure Tf_facture_ajout.cbo_pres_codeCloseUp(Sender: TObject);
begin
  add_prestation_to_facture ('num',cbo_pres_code);
end;

procedure Tf_facture_ajout.cbo_pres_typeCloseUp(Sender: TObject);
begin
  add_prestation_to_facture ('type',cbo_pres_type);
end;

procedure Tf_facture_ajout.delete;
begin
   f_facture_list.line_delete;
   f_facture_list.affi_total;
end;

procedure Tf_facture_ajout.add;
var   i : integer;
begin
   init;

   i := cbo_pres_code.Items.Count;
   while (i > 0)
   do begin
         i := i -1;
         if  f_facture_list.sg_liste.Cols[0].IndexOf(cbo_pres_code.items[i]) > -1
         then cbo_pres_code.Items.Delete(i);
   end;
// faire de même pour ‘nature’, colonne 1 dans sg_liste
   i := cbo_pres_type.Items.Count;
   while (i > 0)
   do begin
         i := i -1;
         if  f_facture_list.sg_liste.Cols[0].IndexOf(cbo_pres_type.items[i]) > -1
         then cbo_pres_type.Items.Delete(i);
   show;
end;

end;

procedure Tf_facture_ajout.delete;
begin

end;

procedure Tf_facture_ajout.add_prestation_to_facture (cle : string; cbo : TComboBox);
begin
   if cbo.ItemIndex > -1
   then begin
        // sera complété par la suite
            f_facture_list.affi_total;
   end;
   f_facture_list.pnl_btn_ligne.visible := true;
   close;
end;





end.

