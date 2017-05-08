#該程式未解開Section, 採用最新樣板產出!
{<section id="asrt339.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0003(2015-07-20 10:26:21), PR版次:0003(2017-01-20 17:48:38)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000000
#+ Filename...: asrt339
#+ Description: 重複性生產下階料報廢作業
#+ Creator....: 05947(2015-07-14 15:43:00)
#+ Modifier...: 05947 -SD/PR- 02295
 
{</section>}
 
{<section id="asrt339.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#160318-00025#34  2016/04/25  By pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160824-00007#285 2016/12/28  by sakura   新舊值備份處理
#170120-00046#1   2017/01/20 By 02295 增加ENT
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目 name="global.import"
IMPORT FGL sub_s_lot
#end add-point 
 
SCHEMA ds 
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE type type_g_sfja_m        RECORD
       sfjadocno LIKE sfja_t.sfjadocno, 
   sfjadocno_desc LIKE type_t.chr80, 
   sfjadocdt LIKE sfja_t.sfjadocdt, 
   sfja003 LIKE sfja_t.sfja003, 
   sfja001 LIKE sfja_t.sfja001, 
   sfja001_desc LIKE type_t.chr80, 
   sfja002 LIKE sfja_t.sfja002, 
   sfja002_desc LIKE type_t.chr80, 
   sfja004 LIKE sfja_t.sfja004, 
   sfja005 LIKE sfja_t.sfja005, 
   ooff013 LIKE type_t.chr500, 
   sfjastus LIKE sfja_t.sfjastus, 
   sfjaownid LIKE sfja_t.sfjaownid, 
   sfjaownid_desc LIKE type_t.chr80, 
   sfjaowndp LIKE sfja_t.sfjaowndp, 
   sfjaowndp_desc LIKE type_t.chr80, 
   sfjacrtid LIKE sfja_t.sfjacrtid, 
   sfjacrtid_desc LIKE type_t.chr80, 
   sfjacrtdp LIKE sfja_t.sfjacrtdp, 
   sfjacrtdp_desc LIKE type_t.chr80, 
   sfjacrtdt LIKE sfja_t.sfjacrtdt, 
   sfjamodid LIKE sfja_t.sfjamodid, 
   sfjamodid_desc LIKE type_t.chr80, 
   sfjamoddt LIKE sfja_t.sfjamoddt, 
   sfjacnfid LIKE sfja_t.sfjacnfid, 
   sfjacnfid_desc LIKE type_t.chr80, 
   sfjacnfdt LIKE sfja_t.sfjacnfdt, 
   sfjapstid LIKE sfja_t.sfjapstid, 
   sfjapstid_desc LIKE type_t.chr80, 
   sfjapstdt LIKE sfja_t.sfjapstdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_sfjb_d        RECORD
       sfjbseq LIKE sfjb_t.sfjbseq, 
   sfjb019 LIKE type_t.chr10, 
   sfjb016 LIKE type_t.chr500, 
   sfjb016_desc LIKE type_t.chr500, 
   sfjb016_desc_1 LIKE type_t.chr500, 
   sfjb017 LIKE type_t.chr30, 
   sfjb018 LIKE type_t.chr30, 
   sfjb003 LIKE sfjb_t.sfjb003, 
   sfjb003_desc LIKE type_t.chr500, 
   sfjb003_desc_1 LIKE type_t.chr500, 
   sfjb004 LIKE sfjb_t.sfjb004, 
   sfjb005 LIKE sfjb_t.sfjb005, 
   sfjb005_desc LIKE type_t.chr500, 
   sfba013 LIKE type_t.num20_6, 
   sfba016 LIKE type_t.num20_6, 
   sfba025 LIKE type_t.num20_6, 
   sfba017 LIKE type_t.num20_6, 
   sfjb006 LIKE sfjb_t.sfjb006, 
   sfjb007 LIKE sfjb_t.sfjb007, 
   sfjb007_desc LIKE type_t.chr500, 
   sfjb008 LIKE sfjb_t.sfjb008, 
   sfjb009 LIKE sfjb_t.sfjb009, 
   sfjb009_desc LIKE type_t.chr500, 
   sfjb010 LIKE sfjb_t.sfjb010, 
   sfjb011 LIKE sfjb_t.sfjb011, 
   sfjb011_desc LIKE type_t.chr500, 
   sfjb012 LIKE sfjb_t.sfjb012, 
   sfjb012_desc LIKE type_t.chr500, 
   sfjb013 LIKE sfjb_t.sfjb013, 
   sfjb014 LIKE sfjb_t.sfjb014, 
   ooff013 LIKE ooff_t.ooff013
       END RECORD
PRIVATE TYPE type_g_sfjb2_d RECORD
       sfjcseq LIKE sfjc_t.sfjcseq, 
   sfjcseq1 LIKE sfjc_t.sfjcseq1, 
   srab001 LIKE srab_t.srab001, 
   srab004 LIKE srab_t.srab004, 
   srab005 LIKE srab_t.srab005, 
   srab006 LIKE srab_t.srab006, 
   sfjc003 LIKE sfjc_t.sfjc003, 
   sfjc003_desc LIKE type_t.chr500, 
   sfjc003_desc_1 LIKE type_t.chr500, 
   sfjc004 LIKE sfjc_t.sfjc004, 
   sfjc010 LIKE sfjc_t.sfjc010, 
   sfjc005 LIKE sfjc_t.sfjc005, 
   sfjc005_desc LIKE type_t.chr500, 
   sfjc006 LIKE sfjc_t.sfjc006, 
   sfjc007 LIKE sfjc_t.sfjc007, 
   sfjc007_desc LIKE type_t.chr500, 
   sfjc008 LIKE sfjc_t.sfjc008, 
   sfjc009 LIKE sfjc_t.sfjc009, 
   sfjc009_desc LIKE type_t.chr500, 
   sfjc011 LIKE sfjc_t.sfjc011, 
   sfjc011_desc LIKE type_t.chr500, 
   sfjc012 LIKE sfjc_t.sfjc012, 
   sfjc012_desc LIKE type_t.chr500, 
   sfjc013 LIKE sfjc_t.sfjc013, 
   sfjc014 LIKE sfjc_t.sfjc014
       END RECORD
PRIVATE TYPE type_g_sfjb4_d RECORD
       inao000 LIKE inao_t.inao000, 
   inao013 LIKE inao_t.inao013, 
   inaoseq LIKE inao_t.inaoseq, 
   inaoseq1 LIKE inao_t.inaoseq1, 
   inaoseq2 LIKE inao_t.inaoseq2, 
   inao001 LIKE inao_t.inao001, 
   inao001_desc LIKE type_t.chr500, 
   inao001_desc_1 LIKE type_t.chr500, 
   inao008 LIKE inao_t.inao008, 
   inao009 LIKE inao_t.inao009, 
   inao010 LIKE inao_t.inao010, 
   inao012 LIKE inao_t.inao012
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_sfjadocno LIKE sfja_t.sfjadocno,
   b_sfjadocno_desc LIKE type_t.chr80,
      b_sfjadocdt LIKE sfja_t.sfjadocdt,
      b_sfja003 LIKE sfja_t.sfja003,
      b_sfja001 LIKE sfja_t.sfja001,
   b_sfja001_desc LIKE type_t.chr80,
      b_sfja002 LIKE sfja_t.sfja002,
   b_sfja002_desc LIKE type_t.chr80,
      b_sfja004 LIKE sfja_t.sfja004,
      b_sfja005 LIKE sfja_t.sfja005
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_ooff013             LIKE ooff_t.ooff013
DEFINE g_sfjbseq             LIKE sfjb_t.sfjbseq
DEFINE g_qty_t               LIKE inag_t.inag008
 TYPE type_g_inao_d        RECORD   #汇出excel用,注意，比s_lot里的定义少了inaoseq1
    inaodocno         LIKE inao_t.inaodocno, 
    inaoseq           LIKE inao_t.inaoseq, 
    inaoseq2          LIKE inao_t.inaoseq2, 
    inao001           LIKE inao_t.inao001, 
    inao001_desc      LIKE type_t.chr500,
    inao001_desc_desc LIKE type_t.chr500,
    inao008           LIKE inao_t.inao008, 
    inao009           LIKE inao_t.inao009, 
    inao012           LIKE inao_t.inao012, 
    inao010           LIKE inao_t.inao010,
    inao011           LIKE inao_t.inao011
       END RECORD
 
DEFINE g_inao_d       DYNAMIC ARRAY OF type_g_inao_d
DEFINE g_sfjb001      LIKE sfjb_t.sfjb001
DEFINE g_sfjb002      LIKE sfjb_t.sfjb002
DEFINE g_sfjb015      LIKE sfjb_t.sfjb015
#end add-point
       
#模組變數(Module Variables)
DEFINE g_sfja_m          type_g_sfja_m
DEFINE g_sfja_m_t        type_g_sfja_m
DEFINE g_sfja_m_o        type_g_sfja_m
DEFINE g_sfja_m_mask_o   type_g_sfja_m #轉換遮罩前資料
DEFINE g_sfja_m_mask_n   type_g_sfja_m #轉換遮罩後資料
 
   DEFINE g_sfjadocno_t LIKE sfja_t.sfjadocno
 
 
DEFINE g_sfjb_d          DYNAMIC ARRAY OF type_g_sfjb_d
DEFINE g_sfjb_d_t        type_g_sfjb_d
DEFINE g_sfjb_d_o        type_g_sfjb_d
DEFINE g_sfjb_d_mask_o   DYNAMIC ARRAY OF type_g_sfjb_d #轉換遮罩前資料
DEFINE g_sfjb_d_mask_n   DYNAMIC ARRAY OF type_g_sfjb_d #轉換遮罩後資料
DEFINE g_sfjb2_d          DYNAMIC ARRAY OF type_g_sfjb2_d
DEFINE g_sfjb2_d_t        type_g_sfjb2_d
DEFINE g_sfjb2_d_o        type_g_sfjb2_d
DEFINE g_sfjb2_d_mask_o   DYNAMIC ARRAY OF type_g_sfjb2_d #轉換遮罩前資料
DEFINE g_sfjb2_d_mask_n   DYNAMIC ARRAY OF type_g_sfjb2_d #轉換遮罩後資料
DEFINE g_sfjb4_d          DYNAMIC ARRAY OF type_g_sfjb4_d
DEFINE g_sfjb4_d_t        type_g_sfjb4_d
DEFINE g_sfjb4_d_o        type_g_sfjb4_d
DEFINE g_sfjb4_d_mask_o   DYNAMIC ARRAY OF type_g_sfjb4_d #轉換遮罩前資料
DEFINE g_sfjb4_d_mask_n   DYNAMIC ARRAY OF type_g_sfjb4_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
 
DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING
DEFINE g_wc2_table2   STRING
 
DEFINE g_wc2_table3   STRING
 
 
 
DEFINE g_wc2_extend          STRING
DEFINE g_wc_filter           STRING
DEFINE g_wc_filter_t         STRING
 
DEFINE g_sql                 STRING
DEFINE g_forupd_sql          STRING
DEFINE g_cnt                 LIKE type_t.num10
DEFINE g_current_idx         LIKE type_t.num10     
DEFINE g_jump                LIKE type_t.num10        
DEFINE g_no_ask              LIKE type_t.num5        
DEFINE g_rec_b               LIKE type_t.num10           
DEFINE l_ac                  LIKE type_t.num10    
DEFINE g_curr_diag           ui.Dialog                         #Current Dialog
                                                               
DEFINE g_pagestart           LIKE type_t.num10                 
DEFINE gwin_curr             ui.Window                         #Current Window
DEFINE gfrm_curr             ui.Form                           #Current Form
DEFINE g_page_action         STRING                            #page action
DEFINE g_header_hidden       LIKE type_t.num5                  #隱藏單頭
DEFINE g_worksheet_hidden    LIKE type_t.num5                  #隱藏工作Panel
DEFINE g_page                STRING                            #第幾頁
DEFINE g_state               STRING       
DEFINE g_header_cnt          LIKE type_t.num10
DEFINE g_detail_cnt          LIKE type_t.num10                  #單身總筆數
DEFINE g_detail_idx          LIKE type_t.num10                  #單身目前所在筆數
DEFINE g_detail_idx_tmp      LIKE type_t.num10                  #單身目前所在筆數
DEFINE g_detail_idx2         LIKE type_t.num10                  #單身2目前所在筆數
DEFINE g_detail_idx_list     DYNAMIC ARRAY OF LIKE type_t.num10 #單身2目前所在筆數
DEFINE g_browser_cnt         LIKE type_t.num10                  #Browser總筆數
DEFINE g_browser_idx         LIKE type_t.num10                  #Browser目前所在筆數
DEFINE g_temp_idx            LIKE type_t.num10                  #Browser目前所在筆數(暫存用)
DEFINE g_order               STRING                             #查詢排序欄位
                                                        
DEFINE g_current_row         LIKE type_t.num10                  #Browser所在筆數
DEFINE g_current_sw          BOOLEAN                            #Browser所在筆數用開關
DEFINE g_current_page        LIKE type_t.num10                  #目前所在頁數
DEFINE g_insert              LIKE type_t.chr5                   #是否導到其他page
 
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys               DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak           DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_bfill               LIKE type_t.chr5              #是否刷新單身
DEFINE g_error_show          LIKE type_t.num5              #是否顯示筆數提示訊息
DEFINE g_master_insert       BOOLEAN                       #確認單頭資料是否寫入
 
DEFINE g_wc_frozen           STRING                        #凍結欄位使用
DEFINE g_chk                 BOOLEAN                       #助記碼判斷用
DEFINE g_aw                  STRING                        #確定當下點擊的單身
DEFINE g_default             BOOLEAN                       #是否有外部參數查詢
DEFINE g_log1                STRING                        #log用
DEFINE g_log2                STRING                        #log用
DEFINE g_loc                 LIKE type_t.chr5              #判斷游標所在位置
DEFINE g_add_browse          STRING                        #新增填充用WC
DEFINE g_update              BOOLEAN                       #確定單頭/身是否異動過
DEFINE g_idx_group           om.SaxAttributes              #頁籤群組
DEFINE g_master_commit       LIKE type_t.chr1              #確認單頭是否修改過
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明(global.argv) name="global.argv"
 
#end add-point
 
{</section>}
 
{<section id="asrt339.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   
   #end add-point   
   
   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
       
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("asr","")
 
   #add-point:作業初始化 name="main.init"
   
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " SELECT sfjadocno,'',sfjadocdt,sfja003,sfja001,'',sfja002,'',sfja004,sfja005, 
       '',sfjastus,sfjaownid,'',sfjaowndp,'',sfjacrtid,'',sfjacrtdp,'',sfjacrtdt,sfjamodid,'',sfjamoddt, 
       sfjacnfid,'',sfjacnfdt,sfjapstid,'',sfjapstdt", 
                      " FROM sfja_t",
                      " WHERE sfjaent= ? AND sfjadocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt339_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.sfjadocno,t0.sfjadocdt,t0.sfja003,t0.sfja001,t0.sfja002,t0.sfja004, 
       t0.sfja005,t0.sfjastus,t0.sfjaownid,t0.sfjaowndp,t0.sfjacrtid,t0.sfjacrtdp,t0.sfjacrtdt,t0.sfjamodid, 
       t0.sfjamoddt,t0.sfjacnfid,t0.sfjacnfdt,t0.sfjapstid,t0.sfjapstdt,t3.ooag011 ,t4.ooefl003 ,t5.ooag011 , 
       t6.ooefl003 ,t7.ooag011 ,t8.ooag011 ,t9.ooag011",
               " FROM sfja_t t0",
                              " LEFT JOIN ooag_t t3 ON t3.ooagent="||g_enterprise||" AND t3.ooag001=t0.sfjaownid  ",
               " LEFT JOIN ooefl_t t4 ON t4.ooeflent="||g_enterprise||" AND t4.ooefl001=t0.sfjaowndp AND t4.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.sfjacrtid  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.sfjacrtdp AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t7 ON t7.ooagent="||g_enterprise||" AND t7.ooag001=t0.sfjamodid  ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.sfjacnfid  ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.sfjapstid  ",
 
               " WHERE t0.sfjaent = " ||g_enterprise|| " AND t0.sfjadocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE asrt339_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_asrt339 WITH FORM cl_ap_formpath("asr",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL asrt339_init()   
 
      #進入選單 Menu (="N")
      CALL asrt339_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_asrt339
      
   END IF 
   
   CLOSE asrt339_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="asrt339.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION asrt339_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   LET g_bfill       = "Y"
   LET g_detail_idx  = 1 #第一層單身指標
   LET g_detail_idx2 = 1 #第二層單身指標
   
   #各個page指標
   LET g_detail_idx_list[1] = 1 
   LET g_detail_idx_list[2] = 1
   LET g_detail_idx_list[3] = 1
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
      CALL cl_set_combo_scc_part('sfjastus','13','N,Y,A,D,R,W,S,Z,X')
 
      CALL cl_set_combo_scc('sfjb010','5444') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
   CALL g_idx_group.addAttribute("'2',","1")
   CALL g_idx_group.addAttribute("'3',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  = 'N' THEN  
      CALL cl_set_comp_visible("sfjb007,sfjb007_desc,sfjb008,sfjc007,sfjc007_desc,sfjc008",FALSE)
   END IF
   CALL cl_set_combo_scc('sfjc010','5444') 
   CALL cl_ui_replace_sub_window(cl_ap_formpath("sub", "s_lot_s01"), "grid_s_lot", "Table", "s_detail1_s_lot_s01")
   #end add-point
   
   #初始化搜尋條件
   CALL asrt339_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="asrt339.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION asrt339_ui_dialog()
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_idx     LIKE type_t.num10
   DEFINE ls_wc      STRING
   DEFINE lb_first   BOOLEAN
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   DEFINE la_param   RECORD
          prog       STRING,
          actionid   STRING,
          background LIKE type_t.chr1,
          param      DYNAMIC ARRAY OF STRING
          END RECORD
   DEFINE ls_js      STRING
   DEFINE la_output  DYNAMIC ARRAY OF STRING   #報表元件鬆耦合使用
   DEFINE  l_cmd_token           base.StringTokenizer   #報表作業cmdrun使用 
   DEFINE  l_cmd_next            STRING                 #報表作業cmdrun使用
   DEFINE  l_cmd_cnt             LIKE type_t.num5       #報表作業cmdrun使用
   DEFINE  l_cmd_prog_arg        STRING                 #報表作業cmdrun使用
   DEFINE  l_cmd_arg             STRING                 #報表作業cmdrun使用
   #add-point:ui_dialog段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_dialog.define"
   DEFINE l_success LIKE type_t.num5
   DEFINE l_inao012 LIKE inao_t.inao012
   DEFINE l_wc      STRING
   #end add-point
   
   #add-point:Function前置處理  name="ui_dialog.pre_function"
   
   #end add-point
   
   CALL cl_set_act_visible("accept,cancel", FALSE)
 
   #因應查詢方案進行處理
   IF g_default THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   ELSE
      CALL gfrm_curr.setElementHidden("mainlayout",1)
      CALL gfrm_curr.setElementHidden("worksheet",0)
      LET g_main_hidden = 1
   END IF
   
   #action default動作
   #應用 a42 樣板自動產生(Version:3)
   #進入程式時預設執行的動作
   CASE g_actdefault
      WHEN "insert"
         LET g_action_choice="insert"
         LET g_actdefault = ""
         IF cl_auth_chk_act("insert") THEN
            CALL asrt339_insert()
            #add-point:ON ACTION insert name="menu.default.insert"
            
            #END add-point
         END IF
 
      #add-point:action default自訂 name="ui_dialog.action_default"
      
      #end add-point
      OTHERWISE
   END CASE
 
 
 
   
   LET lb_first = TRUE
   
   #add-point:ui_dialog段before dialog  name="ui_dialog.before_dialog"
   
   #end add-point
   
   WHILE TRUE 
   
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_browser.clear()       
         INITIALIZE g_sfja_m.* TO NULL
         CALL g_sfjb_d.clear()
         CALL g_sfjb2_d.clear()
         CALL g_sfjb4_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL asrt339_init()
      END IF
   
      CALL lib_cl_dlg.cl_dlg_before_display()
            
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
         #左側瀏覽頁簽
         DISPLAY ARRAY g_browser TO s_browse.* ATTRIBUTES(COUNT=g_header_cnt)
            BEFORE ROW
               #回歸舊筆數位置 (回到當時異動的筆數)
               LET g_current_idx = DIALOG.getCurrentRow("s_browse")
               IF g_current_row > 1 AND g_current_idx = 1 AND g_current_sw = FALSE THEN
                  CALL DIALOG.setCurrentRow("s_browse",g_current_row)
                  LET g_current_idx = g_current_row
               END IF
               LET g_current_row = g_current_idx #目前指標
               LET g_current_sw = TRUE
         
               IF g_current_idx > g_browser.getLength() THEN
                  LET g_current_idx = g_browser.getLength()
               END IF 
               
               CALL asrt339_fetch('') # reload data
               LET l_ac = 1
               CALL asrt339_ui_detailshow() #Setting the current row 
         
               CALL asrt339_idx_chk()
               #NEXT FIELD sfjbseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_sfjb_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL asrt339_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1',",l_ac)
               
               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"
               #备份项次，为显示s_lot的批序号单身使用
               LET g_sfjbseq = g_sfjb_d[g_detail_idx].sfjbseq 
               #SELECT sfjb001,sfjb002,sfjb015 INTO g_sfjb001,g_sfjb002,g_sfjb015 FROM sfjb_t WHERE sfjbdocno=g_sfja_m.sfjadocno AND sfjbseq=g_sfjbseq #170120-00046#1 mark
               SELECT sfjb001,sfjb002,sfjb015 INTO g_sfjb001,g_sfjb002,g_sfjb015 FROM sfjb_t WHERE sfjbent = g_enterprise AND sfjbdocno=g_sfja_m.sfjadocno AND sfjbseq=g_sfjbseq #170120-00046#1 
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_current_page = 1
               #顯示單身筆數
               CALL asrt339_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION s_lot_ins1
            LET g_action_choice="s_lot_ins1"
            IF cl_auth_chk_act("s_lot_ins1") THEN
               
               #add-point:ON ACTION s_lot_ins1 name="menu.detail_show.page1.s_lot_ins1"
               IF NOT cl_null(g_sfjb_d[g_detail_idx].sfjbseq) THEN
                  IF g_sfja_m.sfjastus <> 'N' THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'asf-00351'
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                     EXIT DIALOG
                  END IF

#                  LET l_success = ''
#                  CALL s_lot_ins_create_tmp()
#                  CALL s_aooi390_cre_tmp_table() RETURNING l_success   #add--2015/03/19 By shiun
#                  CALL s_transaction_begin()                  
#                  CALL s_lot_ins(g_site,g_sfja_m.sfjadocno,g_sfjb_d[g_detail_idx].sfjbseq,'0',g_sfjb_d[g_detail_idx].sfjb003,g_sfjb_d[g_detail_idx].sfjb004,g_sfjb_d[g_detail_idx].sfjb005,g_sfjb_d[g_detail_idx].sfjb006,'1',g_sfja_m.sfja001,'0',g_site,g_sfjb_d[g_detail_idx].sfjb011,g_sfjb_d[g_detail_idx].sfjb012,g_sfjb_d[g_detail_idx].sfjb013)
#                       RETURNING l_success,l_inao012
#                  IF l_success THEN
#                     CALL s_transaction_end('Y','0')
#                  ELSE
#                     CALL s_transaction_end('N','0')
#                  END IF
#                  CALL s_lot_ins_drop_tmp()
#                  CALL s_aooi390_drop_tmp_table()   #add--2015/03/19 By shiun
               END IF
               #END add-point
               
            END IF
 
 
 
 
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
         #第一階單身段落
         DISPLAY ARRAY g_sfjb2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL asrt339_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[2] = l_ac
               CALL g_idx_group.addAttribute("'2',",l_ac)
               
               #add-point:page2, before row動作 name="ui_dialog.body2.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_current_page = 2
               #顯示單身筆數
               CALL asrt339_idx_chk()
               #add-point:page2自定義行為 name="ui_dialog.body2.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION s_lot_sel
            LET g_action_choice="s_lot_sel"
            IF cl_auth_chk_act("s_lot_sel") THEN
               
               #add-point:ON ACTION s_lot_sel name="menu.detail_show.page2.s_lot_sel"
               IF NOT cl_null(g_sfjb2_d[g_detail_idx].sfjcseq) THEN
                  IF g_sfja_m.sfjastus NOT MATCHES '[YyNn]' THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'asf-00351'
                     LET g_errparam.extend = ""
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                  
                     EXIT DIALOG
                  END IF
                  LET l_success = ''
                  CALL s_lot_sel_create_tmp()
                  CALL s_transaction_begin()
                  CALL s_lot_sel('2',
                                 '2',
                                 g_site,
                                 g_sfja_m.sfjadocno,
                                 g_sfjb2_d[g_detail_idx].sfjcseq,  #项次
                                 g_sfjb2_d[g_detail_idx].sfjcseq1, #项序
                                 g_sfjb2_d[g_detail_idx].sfjc003,  #料件编号
                                 g_sfjb2_d[g_detail_idx].sfjc004,  #产品特征
                                 g_sfjb2_d[g_detail_idx].sfjc014,  #库存管理特征
                                 g_sfjb2_d[g_detail_idx].sfjc011,  #库位
                                 g_sfjb2_d[g_detail_idx].sfjc012,  #储位
                                 g_sfjb2_d[g_detail_idx].sfjc013,  #批号
                                 g_sfjb2_d[g_detail_idx].sfjc005,  #单位
                                 g_sfjb2_d[g_detail_idx].sfjc006,  #报废数量
                                 '1',
                                 'asrt339',
                                 g_site,
                                 '','','',0)
                       RETURNING l_success
                  IF l_success THEN
                     CALL s_transaction_end('Y','0')
                  ELSE
                     CALL s_transaction_end('N','0')
                  END IF
                  CALL s_lot_sel_drop_tmp()
               END IF
               #END add-point
               
            END IF
 
 
 
 
         
            #add-point:page2自定義行為 name="ui_dialog.body2.action"
            
            #end add-point
         
         END DISPLAY
         #第一階單身段落
         DISPLAY ARRAY g_sfjb4_d TO s_detail4.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL asrt339_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[3] = l_ac
               CALL g_idx_group.addAttribute("'3',",l_ac)
               
               #add-point:page3, before row動作 name="ui_dialog.body4.before_row"
               
               #end add-point
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'3',"))
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
               LET g_current_page = 3
               #顯示單身筆數
               CALL asrt339_idx_chk()
               #add-point:page3自定義行為 name="ui_dialog.body4.before_display"
               
               #end add-point
      
            #自訂ACTION(detail_show,page_3)
            
         
            #add-point:page3自定義行為 name="ui_dialog.body4.action"
            
            #end add-point
         
         END DISPLAY
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         SUBDIALOG sub_s_lot.s_lot_display
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL asrt339_browser_fill("")
            CALL cl_notice()
            CALL cl_navigator_setting(g_current_idx, g_detail_cnt)
            LET g_curr_diag = ui.DIALOG.getCurrent()
            LET g_current_sw = FALSE
            #回歸舊筆數位置 (回到當時異動的筆數)
            LET g_current_idx = DIALOG.getCurrentRow("s_browse")
            IF g_current_row > 1 AND g_current_idx = 1 AND g_current_sw = FALSE THEN
               CALL DIALOG.setCurrentRow("s_browse",g_current_row)
               LET g_current_idx = g_current_row
            END IF
            
            #確保g_current_idx位於正常區間內
            #小於,等於0則指到第1筆
            IF g_current_idx <= 0 THEN
               LET g_current_idx = 1
            END IF
            #超過最大筆數則指到最後1筆
            IF g_current_idx > g_browser.getLength() THEN
               LEt g_current_idx = g_browser.getLength()
            END IF 
            
            LET g_current_sw = TRUE
            LET g_current_row = g_current_idx #目前指標
            
            #有資料才進行fetch
            IF g_current_idx <> 0 THEN
               CALL asrt339_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL asrt339_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL asrt339_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
         ON ACTION s_lot
            IF g_sfjbseq IS NOT NULL THEN
               CALL s_lot_b_fill('2',g_site,'1',g_sfja_m.sfjadocno,'','0','1')
            END IF   
            LET lb_first = FALSE    #毫无意义的变量，只会让操作变得怪怪的！ 
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL asrt339_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL asrt339_set_act_visible()   
            CALL asrt339_set_act_no_visible()
            IF NOT (g_sfja_m.sfjadocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " sfjaent = " ||g_enterprise|| " AND",
                                  " sfjadocno = '", g_sfja_m.sfjadocno, "' "
 
               #填到對應位置
               CALL asrt339_browser_fill("")
            END IF
         #應用 a32 樣板自動產生(Version:3)
         #簽核狀況
         ON ACTION bpm_status
            #查詢簽核狀況, 統一建立HyperLink
            CALL cl_bpm_status()
            #add-point:ON ACTION bpm_status name="menu.bpm_status"
            
            #END add-point
 
 
 
          
         #查詢方案選擇 
         ON ACTION queryplansel
            CALL cl_dlg_qryplan_select() RETURNING ls_wc
            #不是空條件才寫入g_wc跟重新找資料
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
               INITIALIZE g_wc2_table2 TO NULL
 
               INITIALIZE g_wc2_table3 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "sfja_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sfjb_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sfjc_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "inao_t" 
                        LET g_wc2_table3 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
                  OR NOT cl_null(g_wc2_table2)
 
                  OR NOT cl_null(g_wc2_table3)
 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  #組合g_wc2
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
                  IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
                  END IF
 
                  IF g_wc2_table3 <> " 1=1" AND NOT cl_null(g_wc2_table3) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table3
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
 
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
               END IF
               CALL asrt339_browser_fill("F")   #browser_fill()會將notice區塊清空
               CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            END IF
         
         #查詢方案選擇
         ON ACTION qbe_select
            CALL cl_qbe_list("m") RETURNING ls_wc
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
               INITIALIZE g_wc2_table2 TO NULL
 
               INITIALIZE g_wc2_table3 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "sfja_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sfjb_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sfjc_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "inao_t" 
                        LET g_wc2_table3 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)
                  OR NOT cl_null(g_wc2_table2)
 
                  OR NOT cl_null(g_wc2_table3)
 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
                  IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
                  END IF
 
                  IF g_wc2_table3 <> " 1=1" AND NOT cl_null(g_wc2_table3) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table3
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL asrt339_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL asrt339_fetch("F")
                  END IF
               END IF
            END IF
            #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            CALL cl_notice()
          
         #應用 a49 樣板自動產生(Version:4)
            #過濾瀏覽頁資料
            ON ACTION filter
               LET g_action_choice = "fetch"
               #add-point:filter action name="ui_dialog.action.filter"
               
               #end add-point
               CALL asrt339_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL asrt339_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt339_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL asrt339_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt339_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL asrt339_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt339_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL asrt339_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt339_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL asrt339_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt339_idx_chk()
          
         #excel匯出功能          
         ON ACTION exporttoexcel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               #browser
               CALL g_export_node.clear()
               IF g_main_hidden = 1 THEN
                  LET g_export_node[1] = base.typeInfo.create(g_browser)
                  LET g_export_id[1]   = "s_browse"
                  CALL cl_export_to_excel()
               #非browser
               ELSE
                  LET g_export_node[1] = base.typeInfo.create(g_sfjb_d)
                  LET g_export_id[1]   = "s_detail1"
                  LET g_export_node[2] = base.typeInfo.create(g_sfjb2_d)
                  LET g_export_id[2]   = "s_detail2"
                  LET g_export_node[3] = base.typeInfo.create(g_sfjb4_d)
                  LET g_export_id[3]   = "s_detail4"
 
                  #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                  CALL asrt339_inao_b_fill()
                  LET g_export_node[4] = base.typeInfo.create(g_inao_d)
                  LET g_export_id[4]   = "s_detail1_s_lot_s01"
                  #END add-point
                  CALL cl_export_to_excel_getpage()
                  CALL cl_export_to_excel()
               END IF
            END IF
        
         ON ACTION close
            LET INT_FLAG = FALSE
            LET g_action_choice = "exit"
            EXIT DIALOG
          
         ON ACTION exit
            LET g_action_choice = "exit"
            EXIT DIALOG
    
         #主頁摺疊
         ON ACTION mainhidden       
            IF g_main_hidden THEN
               CALL gfrm_curr.setElementHidden("mainlayout",0)
               CALL gfrm_curr.setElementHidden("worksheet",1)
               LET g_main_hidden = 0
            ELSE
               CALL gfrm_curr.setElementHidden("mainlayout",1)
               CALL gfrm_curr.setElementHidden("worksheet",0)
               LET g_main_hidden = 1
               CALL cl_notice()
            END IF
            
         #瀏覽頁折疊
         ON ACTION worksheethidden   
            IF g_main_hidden THEN
               CALL gfrm_curr.setElementHidden("mainlayout",0)
               CALL gfrm_curr.setElementHidden("worksheet",1)
               LET g_main_hidden = 0
            ELSE
               CALL gfrm_curr.setElementHidden("mainlayout",1)
               CALL gfrm_curr.setElementHidden("worksheet",0)
               LET g_main_hidden = 1
            END IF
            IF lb_first THEN
               LET lb_first = FALSE
               NEXT FIELD sfjbseq
            END IF
       
         #單頭摺疊，可利用hot key "Alt-s"開啟/關閉單頭
         ON ACTION controls     
            IF g_header_hidden THEN
               CALL gfrm_curr.setElementHidden("vb_master",0)
               CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
               LET g_header_hidden = 0     #visible
            ELSE
               CALL gfrm_curr.setElementHidden("vb_master",1)
               CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
               LET g_header_hidden = 1     #hidden     
            END IF
    
         
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION gen_inba_sfda
            LET g_action_choice="gen_inba_sfda"
            IF cl_auth_chk_act("gen_inba_sfda") THEN
               
               #add-point:ON ACTION gen_inba_sfda name="menu.gen_inba_sfda"
               CALL asrt339_01(g_sfja_m.sfjadocno)
               CALL asrt339_refresh_sfja0045()
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL asrt339_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               LET l_wc = " sfjadocno = '",g_sfja_m.sfjadocno,"'"
              
               LET g_rep_wc = l_wc
               #END add-point
               &include "erp/asr/asrt339_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL asrt339_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL asrt339_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL asrt339_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail2",1)
               CALL g_curr_diag.setCurrentRow("s_detail4",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL asrt339_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL asrt339_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION mn_stock_in
            LET g_action_choice="mn_stock_in"
            IF cl_auth_chk_act("mn_stock_in") THEN
               
               #add-point:ON ACTION mn_stock_in name="menu.mn_stock_in"
               IF s_chr_chk_str(g_sfja_m.sfjadocno,cl_get_para(g_enterprise,'','E-COM-0005'),'') THEN
                  CALL asrt339_02(g_sfja_m.sfjadocno)
                  CALL asrt339_b_fill()
               END IF
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_aint302
            LET g_action_choice="prog_aint302"
            IF cl_auth_chk_act("prog_aint302") THEN
               
               #add-point:ON ACTION prog_aint302 name="menu.prog_aint302"
               #+ 此段落由子樣板a41產生
               #使用JSON格式組合參數與作業編號(串查)
               INITIALIZE la_param.* TO NULL
               LET la_param.prog     = 'aint302'
               LET la_param.param[1] = g_sfja_m.sfja004

               LET ls_js = util.JSON.stringify(la_param)
               CALL cl_cmdrun_wait(ls_js)
              
               CALL asrt339_refresh_sfja0045()

               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_asft323
            LET g_action_choice="prog_asft323"
            IF cl_auth_chk_act("prog_asft323") THEN
               
               #add-point:ON ACTION prog_asft323 name="menu.prog_asft323"
               #+ 此段落由子樣板a41產生
               #使用JSON格式組合參數與作業編號(串查)
               INITIALIZE la_param.* TO NULL
               LET la_param.prog     = 'asft323'
               LET la_param.param[1] = g_sfja_m.sfja005

               LET ls_js = util.JSON.stringify(la_param)
               CALL cl_cmdrun_wait(ls_js)
            
               CALL asrt339_refresh_sfja0045()

               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL asrt339_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL asrt339_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL asrt339_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_sfja_m.sfjadocdt)
 
 
 
         
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
    
         #交談指令共用ACTION
         &include "common_action.4gl" 
            CONTINUE DIALOG
      END DIALOG
 
      #(ver:79) ---add start---
      #add-point:ui_dialog段 after dialog name="ui_dialog.exit_dialog"
      
      #end add-point
      #(ver:79) --- add end ---
    
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         EXIT WHILE
      END IF
    
   END WHILE    
      
   CALL cl_set_act_visible("accept,cancel", TRUE)
    
END FUNCTION
 
{</section>}
 
{<section id="asrt339.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION asrt339_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   
   #end add-point    
   
   #add-point:Function前置處理 name="browser_fill.before_browser_fill"
   
   #end add-point
   
   IF cl_null(g_wc) THEN
      LET g_wc = " 1=1"
   END IF
   IF cl_null(g_wc2) THEN
      LET g_wc2 = " 1=1"
   END IF
   LET l_wc  = g_wc.trim() 
   LET l_wc2 = g_wc2.trim()
 
   #add-point:browser_fill,foreach前 name="browser_fill.before_foreach"
   IF cl_null(g_wc) THEN
      LET g_wc = " sfjasite = '",g_site,"' "
   ELSE
      LET g_wc = g_wc," AND sfjasite = '",g_site,"' "
   END IF 
   LET l_wc  = g_wc.trim() 
   LET l_wc2 = g_wc2.trim()
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT sfjadocno ",
                      " FROM sfja_t ",
                      " ",
                      " LEFT JOIN sfjb_t ON sfjbent = sfjaent AND sfjadocno = sfjbdocno ", "  ",
                      #add-point:browser_fill段sql(sfjb_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
                      " LEFT JOIN sfjc_t ON sfjcent = sfjaent AND sfjadocno = sfjcdocno", "  ",
                      #add-point:browser_fill段sql(sfjc_t1) name="browser_fill.cnt.join.sfjc_t1"
                      
                      #end add-point
 
                      " LEFT JOIN inao_t ON inaoent = sfjaent AND sfjadocno = inaodocno", "  ",
                      #add-point:browser_fill段sql(inao_t1) name="browser_fill.cnt.join.inao_t1"
                      
                      #end add-point
 
 
 
                      " ", 
                      " ", 
                      " ",                      
 
                      " ",                      
 
 
 
                      " WHERE sfjaent = " ||g_enterprise|| " AND sfjbent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("sfja_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT sfjadocno ",
                      " FROM sfja_t ", 
                      "  ",
                      "  ",
                      " WHERE sfjaent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("sfja_t")
   END IF
   
   #add-point:browser_fill,cnt wc name="browser_fill.cnt_sqlwc"
   
   #end add-point
   
   LET g_sql = " SELECT COUNT(1) FROM (",l_sub_sql,")"
   
   #add-point:browser_fill,count前 name="browser_fill.before_count"
 
   #end add-point
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE header_cnt_pre FROM g_sql
      EXECUTE header_cnt_pre INTO g_browser_cnt   #總筆數
      FREE header_cnt_pre
   END IF
    
   IF g_browser_cnt > g_max_browse THEN
      IF g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_browser_cnt
         LET g_errparam.code = 9035 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
      END IF
      LET g_browser_cnt = g_max_browse
   END IF
   
   DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
   DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
 
   #根據行為確定資料填充位置及WC
   IF cl_null(g_add_browse) THEN
      #清除畫面
      CLEAR FORM                
      INITIALIZE g_sfja_m.* TO NULL
      CALL g_sfjb_d.clear()        
      CALL g_sfjb2_d.clear() 
      CALL g_sfjb4_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.sfjadocno,t0.sfjadocdt,t0.sfja003,t0.sfja001,t0.sfja002,t0.sfja004,t0.sfja005 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sfjastus,t0.sfjadocno,t0.sfjadocdt,t0.sfja003,t0.sfja001,t0.sfja002, 
          t0.sfja004,t0.sfja005,t1.ooag011 ,t2.ooefl003 ",
                  " FROM sfja_t t0",
                  "  ",
                  "  LEFT JOIN sfjb_t ON sfjbent = sfjaent AND sfjadocno = sfjbdocno ", "  ", 
                  #add-point:browser_fill段sql(sfjb_t1) name="browser_fill.join.sfjb_t1"
                  
                  #end add-point
                  "  LEFT JOIN sfjc_t ON sfjcent = sfjaent AND sfjadocno = sfjcdocno", "  ", 
                  #add-point:browser_fill段sql(sfjc_t1) name="browser_fill.join.sfjc_t1"
                  
                  #end add-point
 
                  "  LEFT JOIN inao_t ON inaoent = sfjaent AND sfjadocno = inaodocno", "  ", 
                  #add-point:browser_fill段sql(inao_t1) name="browser_fill.join.inao_t1"
                  
                  #end add-point
 
 
 
                  " ", 
                  " ",                      
 
                  " ",                      
 
 
 
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.sfja001  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.sfja002 AND t2.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.sfjaent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("sfja_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sfjastus,t0.sfjadocno,t0.sfjadocdt,t0.sfja003,t0.sfja001,t0.sfja002, 
          t0.sfja004,t0.sfja005,t1.ooag011 ,t2.ooefl003 ",
                  " FROM sfja_t t0",
                  "  ",
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.sfja001  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.sfja002 AND t2.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.sfjaent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("sfja_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY sfjadocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"sfja_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_sfjadocno,g_browser[g_cnt].b_sfjadocdt, 
          g_browser[g_cnt].b_sfja003,g_browser[g_cnt].b_sfja001,g_browser[g_cnt].b_sfja002,g_browser[g_cnt].b_sfja004, 
          g_browser[g_cnt].b_sfja005,g_browser[g_cnt].b_sfja001_desc,g_browser[g_cnt].b_sfja002_desc 
 
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
      LET g_browser[g_cnt].b_sfjadocno_desc = s_aooi200_get_slip_desc(g_browser[g_cnt].b_sfjadocno)
      DISPLAY BY NAME g_browser[g_cnt].b_sfjadocno_desc
      
      LET g_browser[g_cnt].b_sfja001_desc = s_desc_get_person_desc(g_browser[g_cnt].b_sfja001)
      DISPLAY BY NAME g_browser[g_cnt].b_sfja001_desc
      
      LET g_browser[g_cnt].b_sfja002_desc = s_desc_get_department_desc(g_browser[g_cnt].b_sfja002)
      DISPLAY BY NAME g_browser[g_cnt].b_sfja002_desc
         #end add-point
      
         #遮罩相關處理
         CALL asrt339_browser_mask()
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
         WHEN "A"
            LET g_browser[g_cnt].b_statepic = "stus/16/approved.png"
         WHEN "D"
            LET g_browser[g_cnt].b_statepic = "stus/16/withdraw.png"
         WHEN "R"
            LET g_browser[g_cnt].b_statepic = "stus/16/rejection.png"
         WHEN "W"
            LET g_browser[g_cnt].b_statepic = "stus/16/signing.png"
         WHEN "S"
            LET g_browser[g_cnt].b_statepic = "stus/16/posted.png"
         WHEN "Z"
            LET g_browser[g_cnt].b_statepic = "stus/16/unposted.png"
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/invalid.png"
         
      END CASE
 
 
 
         LET g_cnt = g_cnt + 1
         IF g_cnt > g_max_browse THEN
            EXIT FOREACH
         END IF
         
      END FOREACH
      FREE browse_pre
   END IF
   
   #清空g_add_browse, 並指定指標位置
   IF NOT cl_null(g_add_browse) THEN
      LET g_add_browse = ""
      CALL g_curr_diag.setCurrentRow("s_browse",g_current_idx)
   END IF
   
   IF cl_null(g_browser[g_cnt].b_sfjadocno) THEN
      CALL g_browser.deleteElement(g_cnt)
   END IF
   
   LET g_header_cnt  = g_browser.getLength()
   LET g_browser_cnt = g_browser.getLength()
   
   #筆數顯示
   IF g_browser_cnt > 0 THEN
      DISPLAY g_browser_idx TO FORMONLY.b_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.b_count #總筆數
      DISPLAY g_browser_idx TO FORMONLY.h_index #當下筆數
      DISPLAY g_browser_cnt TO FORMONLY.h_count #總筆數
      DISPLAY g_detail_idx  TO FORMONLY.idx     #單身當下筆數
      DISPLAY g_detail_cnt  TO FORMONLY.cnt     #單身總筆數
   ELSE
      DISPLAY '' TO FORMONLY.b_index #當下筆數
      DISPLAY '' TO FORMONLY.b_count #總筆數
      DISPLAY '' TO FORMONLY.h_index #當下筆數
      DISPLAY '' TO FORMONLY.h_count #總筆數
      DISPLAY '' TO FORMONLY.idx     #單身當下筆數
      DISPLAY '' TO FORMONLY.cnt     #單身總筆數
   END IF
 
   LET g_rec_b = g_cnt - 1
   LET g_detail_cnt = g_rec_b
   LET g_cnt = 0
 
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
                  
   
   #add-point:browser_fill段結束前 name="browser_fill.after"
   
   #end add-point   
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION asrt339_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_sfja_m.sfjadocno = g_browser[g_current_idx].b_sfjadocno   
 
   EXECUTE asrt339_master_referesh USING g_sfja_m.sfjadocno INTO g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt, 
       g_sfja_m.sfja003,g_sfja_m.sfja001,g_sfja_m.sfja002,g_sfja_m.sfja004,g_sfja_m.sfja005,g_sfja_m.sfjastus, 
       g_sfja_m.sfjaownid,g_sfja_m.sfjaowndp,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdt, 
       g_sfja_m.sfjamodid,g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid, 
       g_sfja_m.sfjapstdt,g_sfja_m.sfjaownid_desc,g_sfja_m.sfjaowndp_desc,g_sfja_m.sfjacrtid_desc,g_sfja_m.sfjacrtdp_desc, 
       g_sfja_m.sfjamodid_desc,g_sfja_m.sfjacnfid_desc,g_sfja_m.sfjapstid_desc
   
   CALL asrt339_sfja_t_mask()
   CALL asrt339_show()
      
END FUNCTION
 
{</section>}
 
{<section id="asrt339.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION asrt339_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
   
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
      CALL g_curr_diag.setCurrentRow("s_detail2",g_detail_idx)
      CALL g_curr_diag.setCurrentRow("s_detail4",g_detail_idx)
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION asrt339_ui_browser_refresh()
   #add-point:ui_browser_refresh段define(客製用) name="ui_browser_refresh.define_customerization"
   
   #end add-point    
   DEFINE l_i  LIKE type_t.num10
   #add-point:ui_browser_refresh段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_browser_refresh.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="ui_browser_refresh.pre_function"
   
   #end add-point
   
   LET g_browser_cnt = g_browser.getLength()
   LET g_header_cnt  = g_browser.getLength()
   FOR l_i =1 TO g_browser.getLength()
      IF g_browser[l_i].b_sfjadocno = g_sfja_m.sfjadocno 
 
         THEN
         CALL g_browser.deleteElement(l_i)
         EXIT FOR
      END IF
   END FOR
   LET g_browser_cnt = g_browser_cnt - 1
   LET g_header_cnt = g_header_cnt - 1
    
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce,mainhidden", FALSE)
      CALL cl_navigator_setting(0,0)
      CLEAR FORM
   ELSE
      CALL cl_set_act_visible("mainhidden", TRUE)
   END IF
   
   #add-point:ui_browser_refresh段after name="ui_browser_refresh.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION asrt339_construct()
   #add-point:cs段define(客製用) name="cs.define_customerization"
   
   #end add-point    
   DEFINE ls_return   STRING
   DEFINE ls_result   STRING 
   DEFINE ls_wc       STRING 
   DEFINE la_wc       DYNAMIC ARRAY OF RECORD
          tableid     STRING,
          wc          STRING
          END RECORD
   DEFINE li_idx      LIKE type_t.num10
   #add-point:cs段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="cs.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
    
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_sfja_m.* TO NULL
   CALL g_sfjb_d.clear()        
   CALL g_sfjb2_d.clear() 
   CALL g_sfjb4_d.clear() 
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
   INITIALIZE g_wc2_table2 TO NULL
 
   INITIALIZE g_wc2_table3 TO NULL
 
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON sfjadocno,sfjadocno_desc,sfjadocdt,sfja003,sfja001,sfja002,sfja004,sfja005, 
          sfjastus,sfjaownid,sfjaowndp,sfjacrtid,sfjacrtdp,sfjacrtdt,sfjamodid,sfjamoddt,sfjacnfid,sfjacnfdt, 
          sfjapstid,sfjapstdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<sfjacrtdt>>----
         AFTER FIELD sfjacrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<sfjamoddt>>----
         AFTER FIELD sfjamoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sfjacnfdt>>----
         AFTER FIELD sfjacnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sfjapstdt>>----
         AFTER FIELD sfjapstdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
 
 
            
         #一般欄位開窗相關處理    
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjadocno
            #add-point:BEFORE FIELD sfjadocno name="construct.b.sfjadocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjadocno
            
            #add-point:AFTER FIELD sfjadocno name="construct.a.sfjadocno"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfjadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjadocno
            #add-point:ON ACTION controlp INFIELD sfjadocno name="construct.c.sfjadocno"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_sfjadocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfjadocno  #顯示到畫面上

            NEXT FIELD sfjadocno                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjadocno_desc
            #add-point:BEFORE FIELD sfjadocno_desc name="construct.b.sfjadocno_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjadocno_desc
            
            #add-point:AFTER FIELD sfjadocno_desc name="construct.a.sfjadocno_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfjadocno_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjadocno_desc
            #add-point:ON ACTION controlp INFIELD sfjadocno_desc name="construct.c.sfjadocno_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjadocdt
            #add-point:BEFORE FIELD sfjadocdt name="construct.b.sfjadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjadocdt
            
            #add-point:AFTER FIELD sfjadocdt name="construct.a.sfjadocdt"
            IF NOT cl_null(g_sfja_m.sfjadocdt) AND NOT cl_null(g_sfja_m.sfja003) THEN
               IF g_sfja_m.sfjadocdt<=g_sfja_m.sfja003 THEN
                  INITIALIZE g_errparam TO NULL
		            LET g_errparam.code = 'asr-00067'
		            LET g_errparam.extend = ''
		            LET g_errparam.popup = TRUE
		            CALL cl_err()
		            NEXT FIELD sfjadocdt
		         END IF  
            END IF
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfjadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjadocdt
            #add-point:ON ACTION controlp INFIELD sfjadocdt name="construct.c.sfjadocdt"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfja003
            #add-point:BEFORE FIELD sfja003 name="construct.b.sfja003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfja003
            
            #add-point:AFTER FIELD sfja003 name="construct.a.sfja003"
            IF NOT cl_null(g_sfja_m.sfjadocdt) AND NOT cl_null(g_sfja_m.sfja003) THEN
               IF g_sfja_m.sfjadocdt<=g_sfja_m.sfja003 THEN
                  INITIALIZE g_errparam TO NULL
		            LET g_errparam.code = 'asr-00067'
		            LET g_errparam.extend = ''
		            LET g_errparam.popup = TRUE
		            CALL cl_err()
		            NEXT FIELD sfja003
		         END IF  
            END IF
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfja003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfja003
            #add-point:ON ACTION controlp INFIELD sfja003 name="construct.c.sfja003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfja001
            #add-point:BEFORE FIELD sfja001 name="construct.b.sfja001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfja001
            
            #add-point:AFTER FIELD sfja001 name="construct.a.sfja001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfja001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfja001
            #add-point:ON ACTION controlp INFIELD sfja001 name="construct.c.sfja001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfja002
            #add-point:BEFORE FIELD sfja002 name="construct.b.sfja002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfja002
            
            #add-point:AFTER FIELD sfja002 name="construct.a.sfja002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfja002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfja002
            #add-point:ON ACTION controlp INFIELD sfja002 name="construct.c.sfja002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfja004
            #add-point:BEFORE FIELD sfja004 name="construct.b.sfja004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfja004
            
            #add-point:AFTER FIELD sfja004 name="construct.a.sfja004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfja004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfja004
            #add-point:ON ACTION controlp INFIELD sfja004 name="construct.c.sfja004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfja005
            #add-point:BEFORE FIELD sfja005 name="construct.b.sfja005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfja005
            
            #add-point:AFTER FIELD sfja005 name="construct.a.sfja005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfja005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfja005
            #add-point:ON ACTION controlp INFIELD sfja005 name="construct.c.sfja005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjastus
            #add-point:BEFORE FIELD sfjastus name="construct.b.sfjastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjastus
            
            #add-point:AFTER FIELD sfjastus name="construct.a.sfjastus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfjastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjastus
            #add-point:ON ACTION controlp INFIELD sfjastus name="construct.c.sfjastus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sfjaownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjaownid
            #add-point:ON ACTION controlp INFIELD sfjaownid name="construct.c.sfjaownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfjaownid  #顯示到畫面上
            NEXT FIELD sfjaownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjaownid
            #add-point:BEFORE FIELD sfjaownid name="construct.b.sfjaownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjaownid
            
            #add-point:AFTER FIELD sfjaownid name="construct.a.sfjaownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfjaowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjaowndp
            #add-point:ON ACTION controlp INFIELD sfjaowndp name="construct.c.sfjaowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfjaowndp  #顯示到畫面上
            NEXT FIELD sfjaowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjaowndp
            #add-point:BEFORE FIELD sfjaowndp name="construct.b.sfjaowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjaowndp
            
            #add-point:AFTER FIELD sfjaowndp name="construct.a.sfjaowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfjacrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjacrtid
            #add-point:ON ACTION controlp INFIELD sfjacrtid name="construct.c.sfjacrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfjacrtid  #顯示到畫面上
            NEXT FIELD sfjacrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjacrtid
            #add-point:BEFORE FIELD sfjacrtid name="construct.b.sfjacrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjacrtid
            
            #add-point:AFTER FIELD sfjacrtid name="construct.a.sfjacrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfjacrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjacrtdp
            #add-point:ON ACTION controlp INFIELD sfjacrtdp name="construct.c.sfjacrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfjacrtdp  #顯示到畫面上
            NEXT FIELD sfjacrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjacrtdp
            #add-point:BEFORE FIELD sfjacrtdp name="construct.b.sfjacrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjacrtdp
            
            #add-point:AFTER FIELD sfjacrtdp name="construct.a.sfjacrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjacrtdt
            #add-point:BEFORE FIELD sfjacrtdt name="construct.b.sfjacrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sfjamodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjamodid
            #add-point:ON ACTION controlp INFIELD sfjamodid name="construct.c.sfjamodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfjamodid  #顯示到畫面上
            NEXT FIELD sfjamodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjamodid
            #add-point:BEFORE FIELD sfjamodid name="construct.b.sfjamodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjamodid
            
            #add-point:AFTER FIELD sfjamodid name="construct.a.sfjamodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjamoddt
            #add-point:BEFORE FIELD sfjamoddt name="construct.b.sfjamoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sfjacnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjacnfid
            #add-point:ON ACTION controlp INFIELD sfjacnfid name="construct.c.sfjacnfid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfjacnfid  #顯示到畫面上
            NEXT FIELD sfjacnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjacnfid
            #add-point:BEFORE FIELD sfjacnfid name="construct.b.sfjacnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjacnfid
            
            #add-point:AFTER FIELD sfjacnfid name="construct.a.sfjacnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjacnfdt
            #add-point:BEFORE FIELD sfjacnfdt name="construct.b.sfjacnfdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sfjapstid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjapstid
            #add-point:ON ACTION controlp INFIELD sfjapstid name="construct.c.sfjapstid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfjapstid  #顯示到畫面上
            NEXT FIELD sfjapstid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjapstid
            #add-point:BEFORE FIELD sfjapstid name="construct.b.sfjapstid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjapstid
            
            #add-point:AFTER FIELD sfjapstid name="construct.a.sfjapstid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjapstdt
            #add-point:BEFORE FIELD sfjapstdt name="construct.b.sfjapstdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON sfjbseq,sfjb019,sfjb016,sfjb017,sfjb018,sfjb003,sfjb004,sfjb005,sfba013, 
          sfba016,sfba025,sfba017,sfjb006,sfjb007,sfjb008,sfjb009,sfjb010,sfjb011,sfjb012,sfjb013,sfjb014 
 
           FROM s_detail1[1].sfjbseq,s_detail1[1].sfjb019,s_detail1[1].sfjb016,s_detail1[1].sfjb017, 
               s_detail1[1].sfjb018,s_detail1[1].sfjb003,s_detail1[1].sfjb004,s_detail1[1].sfjb005,s_detail1[1].sfba013, 
               s_detail1[1].sfba016,s_detail1[1].sfba025,s_detail1[1].sfba017,s_detail1[1].sfjb006,s_detail1[1].sfjb007, 
               s_detail1[1].sfjb008,s_detail1[1].sfjb009,s_detail1[1].sfjb010,s_detail1[1].sfjb011,s_detail1[1].sfjb012, 
               s_detail1[1].sfjb013,s_detail1[1].sfjb014
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjbseq
            #add-point:BEFORE FIELD sfjbseq name="construct.b.page1.sfjbseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjbseq
            
            #add-point:AFTER FIELD sfjbseq name="construct.a.page1.sfjbseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjbseq
            #add-point:ON ACTION controlp INFIELD sfjbseq name="construct.c.page1.sfjbseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.sfjb019
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb019
            #add-point:ON ACTION controlp INFIELD sfjb019 name="construct.c.page1.sfjb019"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
#            INITIALIZE g_qryparam.* TO NULL
#            LET g_qryparam.state = 'c' 
#            LET g_qryparam.reqry = FALSE
#            CALL q_srac004_2()                           #呼叫開窗
#            DISPLAY g_qryparam.return1,g_qryparam.return2,g_qryparam.return3,g_qryparam.return4,g_qryparam.return5,g_qryparam.return6 TO sfjb019,sfjb016,sfjb016_desc,sfjb016_desc_1,sfjb017,sfjb018   #顯示到畫面上
#            NEXT FIELD sfjb019                     #返回原欄位
#     
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb019
            #add-point:BEFORE FIELD sfjb019 name="construct.b.page1.sfjb019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb019
            
            #add-point:AFTER FIELD sfjb019 name="construct.a.page1.sfjb019"
 
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb016
            #add-point:ON ACTION controlp INFIELD sfjb016 name="construct.c.page1.sfjb016"
#            INITIALIZE g_qryparam.* TO NULL
#            LET g_qryparam.state = 'c' 
#            LET g_qryparam.reqry = FALSE
#            CALL q_srac004_2()                           #呼叫開窗
#            DISPLAY g_qryparam.return1,g_qryparam.return2,g_qryparam.return3,g_qryparam.return4,g_qryparam.return5,g_qryparam.return6 TO sfjb019,sfjb016,sfjb016_desc,sfjb016_desc_1,sfjb017,sfjb018   #顯示到畫面上
#            NEXT FIELD sfjb016     
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb016
            #add-point:BEFORE FIELD sfjb016 name="construct.b.page1.sfjb016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb016
            
            #add-point:AFTER FIELD sfjb016 name="construct.a.page1.sfjb016"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb017
            #add-point:BEFORE FIELD sfjb017 name="construct.b.page1.sfjb017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb017
            
            #add-point:AFTER FIELD sfjb017 name="construct.a.page1.sfjb017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb017
            #add-point:ON ACTION controlp INFIELD sfjb017 name="construct.c.page1.sfjb017"
 
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb018
            #add-point:BEFORE FIELD sfjb018 name="construct.b.page1.sfjb018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb018
            
            #add-point:AFTER FIELD sfjb018 name="construct.a.page1.sfjb018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb018
            #add-point:ON ACTION controlp INFIELD sfjb018 name="construct.c.page1.sfjb018"
 
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb003
            #add-point:BEFORE FIELD sfjb003 name="construct.b.page1.sfjb003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb003
            
            #add-point:AFTER FIELD sfjb003 name="construct.a.page1.sfjb003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb003
            #add-point:ON ACTION controlp INFIELD sfjb003 name="construct.c.page1.sfjb003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb004
            #add-point:BEFORE FIELD sfjb004 name="construct.b.page1.sfjb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb004
            
            #add-point:AFTER FIELD sfjb004 name="construct.a.page1.sfjb004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb004
            #add-point:ON ACTION controlp INFIELD sfjb004 name="construct.c.page1.sfjb004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb005
            #add-point:BEFORE FIELD sfjb005 name="construct.b.page1.sfjb005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb005
            
            #add-point:AFTER FIELD sfjb005 name="construct.a.page1.sfjb005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb005
            #add-point:ON ACTION controlp INFIELD sfjb005 name="construct.c.page1.sfjb005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfba013
            #add-point:BEFORE FIELD sfba013 name="construct.b.page1.sfba013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfba013
            
            #add-point:AFTER FIELD sfba013 name="construct.a.page1.sfba013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfba013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfba013
            #add-point:ON ACTION controlp INFIELD sfba013 name="construct.c.page1.sfba013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfba016
            #add-point:BEFORE FIELD sfba016 name="construct.b.page1.sfba016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfba016
            
            #add-point:AFTER FIELD sfba016 name="construct.a.page1.sfba016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfba016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfba016
            #add-point:ON ACTION controlp INFIELD sfba016 name="construct.c.page1.sfba016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfba025
            #add-point:BEFORE FIELD sfba025 name="construct.b.page1.sfba025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfba025
            
            #add-point:AFTER FIELD sfba025 name="construct.a.page1.sfba025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfba025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfba025
            #add-point:ON ACTION controlp INFIELD sfba025 name="construct.c.page1.sfba025"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfba017
            #add-point:BEFORE FIELD sfba017 name="construct.b.page1.sfba017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfba017
            
            #add-point:AFTER FIELD sfba017 name="construct.a.page1.sfba017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfba017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfba017
            #add-point:ON ACTION controlp INFIELD sfba017 name="construct.c.page1.sfba017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb006
            #add-point:BEFORE FIELD sfjb006 name="construct.b.page1.sfjb006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb006
            
            #add-point:AFTER FIELD sfjb006 name="construct.a.page1.sfjb006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb006
            #add-point:ON ACTION controlp INFIELD sfjb006 name="construct.c.page1.sfjb006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb007
            #add-point:BEFORE FIELD sfjb007 name="construct.b.page1.sfjb007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb007
            
            #add-point:AFTER FIELD sfjb007 name="construct.a.page1.sfjb007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb007
            #add-point:ON ACTION controlp INFIELD sfjb007 name="construct.c.page1.sfjb007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb008
            #add-point:BEFORE FIELD sfjb008 name="construct.b.page1.sfjb008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb008
            
            #add-point:AFTER FIELD sfjb008 name="construct.a.page1.sfjb008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb008
            #add-point:ON ACTION controlp INFIELD sfjb008 name="construct.c.page1.sfjb008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb009
            #add-point:BEFORE FIELD sfjb009 name="construct.b.page1.sfjb009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb009
            
            #add-point:AFTER FIELD sfjb009 name="construct.a.page1.sfjb009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb009
            #add-point:ON ACTION controlp INFIELD sfjb009 name="construct.c.page1.sfjb009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb010
            #add-point:BEFORE FIELD sfjb010 name="construct.b.page1.sfjb010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb010
            
            #add-point:AFTER FIELD sfjb010 name="construct.a.page1.sfjb010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb010
            #add-point:ON ACTION controlp INFIELD sfjb010 name="construct.c.page1.sfjb010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb011
            #add-point:BEFORE FIELD sfjb011 name="construct.b.page1.sfjb011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb011
            
            #add-point:AFTER FIELD sfjb011 name="construct.a.page1.sfjb011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb011
            #add-point:ON ACTION controlp INFIELD sfjb011 name="construct.c.page1.sfjb011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb012
            #add-point:BEFORE FIELD sfjb012 name="construct.b.page1.sfjb012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb012
            
            #add-point:AFTER FIELD sfjb012 name="construct.a.page1.sfjb012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb012
            #add-point:ON ACTION controlp INFIELD sfjb012 name="construct.c.page1.sfjb012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb013
            #add-point:BEFORE FIELD sfjb013 name="construct.b.page1.sfjb013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb013
            
            #add-point:AFTER FIELD sfjb013 name="construct.a.page1.sfjb013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb013
            #add-point:ON ACTION controlp INFIELD sfjb013 name="construct.c.page1.sfjb013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb014
            #add-point:BEFORE FIELD sfjb014 name="construct.b.page1.sfjb014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb014
            
            #add-point:AFTER FIELD sfjb014 name="construct.a.page1.sfjb014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfjb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb014
            #add-point:ON ACTION controlp INFIELD sfjb014 name="construct.c.page1.sfjb014"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table2 ON sfjcseq,sfjcseq1,srab001_1,srab004_1,srab005_1,srab006_1,sfjc003,sfjc004, 
          sfjc010,sfjc005,sfjc006,sfjc007,sfjc008,sfjc009,sfjc011,sfjc012,sfjc013,sfjc014
           FROM s_detail2[1].sfjcseq,s_detail2[1].sfjcseq1,s_detail2[1].srab001_1,s_detail2[1].srab004_1, 
               s_detail2[1].srab005_1,s_detail2[1].srab006_1,s_detail2[1].sfjc003,s_detail2[1].sfjc004, 
               s_detail2[1].sfjc010,s_detail2[1].sfjc005,s_detail2[1].sfjc006,s_detail2[1].sfjc007,s_detail2[1].sfjc008, 
               s_detail2[1].sfjc009,s_detail2[1].sfjc011,s_detail2[1].sfjc012,s_detail2[1].sfjc013,s_detail2[1].sfjc014 
 
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body2.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjcseq
            #add-point:BEFORE FIELD sfjcseq name="construct.b.page2.sfjcseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjcseq
            
            #add-point:AFTER FIELD sfjcseq name="construct.a.page2.sfjcseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfjcseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjcseq
            #add-point:ON ACTION controlp INFIELD sfjcseq name="construct.c.page2.sfjcseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjcseq1
            #add-point:BEFORE FIELD sfjcseq1 name="construct.b.page2.sfjcseq1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjcseq1
            
            #add-point:AFTER FIELD sfjcseq1 name="construct.a.page2.sfjcseq1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfjcseq1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjcseq1
            #add-point:ON ACTION controlp INFIELD sfjcseq1 name="construct.c.page2.sfjcseq1"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab001_1
            #add-point:BEFORE FIELD srab001_1 name="construct.b.page2.srab001_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab001_1
            
            #add-point:AFTER FIELD srab001_1 name="construct.a.page2.srab001_1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.srab001_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab001_1
            #add-point:ON ACTION controlp INFIELD srab001_1 name="construct.c.page2.srab001_1"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab004_1
            #add-point:BEFORE FIELD srab004_1 name="construct.b.page2.srab004_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab004_1
            
            #add-point:AFTER FIELD srab004_1 name="construct.a.page2.srab004_1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.srab004_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab004_1
            #add-point:ON ACTION controlp INFIELD srab004_1 name="construct.c.page2.srab004_1"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page2.srab005_1
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab005_1
            #add-point:ON ACTION controlp INFIELD srab005_1 name="construct.c.page2.srab005_1"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_bmaa002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO srab005_1  #顯示到畫面上
            NEXT FIELD srab005_1                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab005_1
            #add-point:BEFORE FIELD srab005_1 name="construct.b.page2.srab005_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab005_1
            
            #add-point:AFTER FIELD srab005_1 name="construct.a.page2.srab005_1"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab006_1
            #add-point:BEFORE FIELD srab006_1 name="construct.b.page2.srab006_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab006_1
            
            #add-point:AFTER FIELD srab006_1 name="construct.a.page2.srab006_1"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.srab006_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab006_1
            #add-point:ON ACTION controlp INFIELD srab006_1 name="construct.c.page2.srab006_1"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjc003
            #add-point:BEFORE FIELD sfjc003 name="construct.b.page2.sfjc003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjc003
            
            #add-point:AFTER FIELD sfjc003 name="construct.a.page2.sfjc003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfjc003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjc003
            #add-point:ON ACTION controlp INFIELD sfjc003 name="construct.c.page2.sfjc003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjc004
            #add-point:BEFORE FIELD sfjc004 name="construct.b.page2.sfjc004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjc004
            
            #add-point:AFTER FIELD sfjc004 name="construct.a.page2.sfjc004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfjc004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjc004
            #add-point:ON ACTION controlp INFIELD sfjc004 name="construct.c.page2.sfjc004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjc010
            #add-point:BEFORE FIELD sfjc010 name="construct.b.page2.sfjc010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjc010
            
            #add-point:AFTER FIELD sfjc010 name="construct.a.page2.sfjc010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfjc010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjc010
            #add-point:ON ACTION controlp INFIELD sfjc010 name="construct.c.page2.sfjc010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjc005
            #add-point:BEFORE FIELD sfjc005 name="construct.b.page2.sfjc005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjc005
            
            #add-point:AFTER FIELD sfjc005 name="construct.a.page2.sfjc005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfjc005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjc005
            #add-point:ON ACTION controlp INFIELD sfjc005 name="construct.c.page2.sfjc005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjc006
            #add-point:BEFORE FIELD sfjc006 name="construct.b.page2.sfjc006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjc006
            
            #add-point:AFTER FIELD sfjc006 name="construct.a.page2.sfjc006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfjc006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjc006
            #add-point:ON ACTION controlp INFIELD sfjc006 name="construct.c.page2.sfjc006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjc007
            #add-point:BEFORE FIELD sfjc007 name="construct.b.page2.sfjc007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjc007
            
            #add-point:AFTER FIELD sfjc007 name="construct.a.page2.sfjc007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfjc007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjc007
            #add-point:ON ACTION controlp INFIELD sfjc007 name="construct.c.page2.sfjc007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjc008
            #add-point:BEFORE FIELD sfjc008 name="construct.b.page2.sfjc008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjc008
            
            #add-point:AFTER FIELD sfjc008 name="construct.a.page2.sfjc008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfjc008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjc008
            #add-point:ON ACTION controlp INFIELD sfjc008 name="construct.c.page2.sfjc008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjc009
            #add-point:BEFORE FIELD sfjc009 name="construct.b.page2.sfjc009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjc009
            
            #add-point:AFTER FIELD sfjc009 name="construct.a.page2.sfjc009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfjc009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjc009
            #add-point:ON ACTION controlp INFIELD sfjc009 name="construct.c.page2.sfjc009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjc011
            #add-point:BEFORE FIELD sfjc011 name="construct.b.page2.sfjc011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjc011
            
            #add-point:AFTER FIELD sfjc011 name="construct.a.page2.sfjc011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfjc011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjc011
            #add-point:ON ACTION controlp INFIELD sfjc011 name="construct.c.page2.sfjc011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjc012
            #add-point:BEFORE FIELD sfjc012 name="construct.b.page2.sfjc012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjc012
            
            #add-point:AFTER FIELD sfjc012 name="construct.a.page2.sfjc012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfjc012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjc012
            #add-point:ON ACTION controlp INFIELD sfjc012 name="construct.c.page2.sfjc012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjc013
            #add-point:BEFORE FIELD sfjc013 name="construct.b.page2.sfjc013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjc013
            
            #add-point:AFTER FIELD sfjc013 name="construct.a.page2.sfjc013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfjc013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjc013
            #add-point:ON ACTION controlp INFIELD sfjc013 name="construct.c.page2.sfjc013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjc014
            #add-point:BEFORE FIELD sfjc014 name="construct.b.page2.sfjc014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjc014
            
            #add-point:AFTER FIELD sfjc014 name="construct.a.page2.sfjc014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfjc014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjc014
            #add-point:ON ACTION controlp INFIELD sfjc014 name="construct.c.page2.sfjc014"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
 
      CONSTRUCT g_wc2_table3 ON inao001,inao008,inao009,inao010,inao012
           FROM s_detail4[1].inao001,s_detail4[1].inao008,s_detail4[1].inao009,s_detail4[1].inao010, 
               s_detail4[1].inao012
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body3.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 3)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inao001
            #add-point:BEFORE FIELD inao001 name="construct.b.page4.inao001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inao001
            
            #add-point:AFTER FIELD inao001 name="construct.a.page4.inao001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.inao001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inao001
            #add-point:ON ACTION controlp INFIELD inao001 name="construct.c.page4.inao001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inao008
            #add-point:BEFORE FIELD inao008 name="construct.b.page4.inao008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inao008
            
            #add-point:AFTER FIELD inao008 name="construct.a.page4.inao008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.inao008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inao008
            #add-point:ON ACTION controlp INFIELD inao008 name="construct.c.page4.inao008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inao009
            #add-point:BEFORE FIELD inao009 name="construct.b.page4.inao009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inao009
            
            #add-point:AFTER FIELD inao009 name="construct.a.page4.inao009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.inao009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inao009
            #add-point:ON ACTION controlp INFIELD inao009 name="construct.c.page4.inao009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inao010
            #add-point:BEFORE FIELD inao010 name="construct.b.page4.inao010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inao010
            
            #add-point:AFTER FIELD inao010 name="construct.a.page4.inao010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.inao010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inao010
            #add-point:ON ACTION controlp INFIELD inao010 name="construct.c.page4.inao010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD inao012
            #add-point:BEFORE FIELD inao012 name="construct.b.page4.inao012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD inao012
            
            #add-point:AFTER FIELD inao012 name="construct.a.page4.inao012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page4.inao012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD inao012
            #add-point:ON ACTION controlp INFIELD inao012 name="construct.c.page4.inao012"
            
            #END add-point
 
 
   
       
      END CONSTRUCT
 
 
      
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令) name="cs.add_cs"
      
      #end add-point
 
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog name="cs.b_dialog"
         
         #end add-point  
 
      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
         IF NOT cl_null(ls_wc) THEN
            CALL util.JSON.parse(ls_wc, la_wc)
            INITIALIZE g_wc, g_wc2, g_wc2_table1, g_wc2_extend TO NULL
            INITIALIZE g_wc2_table2 TO NULL
 
            INITIALIZE g_wc2_table3 TO NULL
 
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "sfja_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "sfjb_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "sfjc_t" 
                     LET g_wc2_table2 = la_wc[li_idx].wc
 
                  WHEN la_wc[li_idx].tableid = "inao_t" 
                     LET g_wc2_table3 = la_wc[li_idx].wc
 
 
               END CASE
            END FOR
         END IF
    
      #條件儲存為方案
      ON ACTION qbe_save
         CALL cl_qbe_save()
 
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG
   END DIALOG
   
   #組合g_wc2
   LET g_wc2 = g_wc2_table1
   IF g_wc2_table2 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
   END IF
 
   IF g_wc2_table3 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table3
   END IF
 
 
 
 
   
   #add-point:cs段結束前 name="cs.after_construct"
   
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION asrt339_filter()
   #add-point:filter段define name="filter.define_customerization"
   
   #end add-point   
   #add-point:filter段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="filter.pre_function"
   
   #end add-point
   
   #切換畫面
   IF NOT g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",1)
      CALL gfrm_curr.setElementHidden("worksheet",0)
      LET g_main_hidden = 1
   END IF   
 
   LET INT_FLAG = 0
 
   LET g_qryparam.state = 'c'
 
   LET g_wc_filter_t = g_wc_filter.trim()
   LET g_wc_t = g_wc
 
   LET g_wc = cl_replace_str(g_wc, g_wc_filter_t, '')
 
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單頭
      CONSTRUCT g_wc_filter ON sfjadocno,sfjadocdt,sfja003,sfja001,sfja002,sfja004,sfja005
                          FROM s_browse[1].b_sfjadocno,s_browse[1].b_sfjadocdt,s_browse[1].b_sfja003, 
                              s_browse[1].b_sfja001,s_browse[1].b_sfja002,s_browse[1].b_sfja004,s_browse[1].b_sfja005 
 
 
         BEFORE CONSTRUCT
               DISPLAY asrt339_filter_parser('sfjadocno') TO s_browse[1].b_sfjadocno
            DISPLAY asrt339_filter_parser('sfjadocdt') TO s_browse[1].b_sfjadocdt
            DISPLAY asrt339_filter_parser('sfja003') TO s_browse[1].b_sfja003
            DISPLAY asrt339_filter_parser('sfja001') TO s_browse[1].b_sfja001
            DISPLAY asrt339_filter_parser('sfja002') TO s_browse[1].b_sfja002
            DISPLAY asrt339_filter_parser('sfja004') TO s_browse[1].b_sfja004
            DISPLAY asrt339_filter_parser('sfja005') TO s_browse[1].b_sfja005
      
         #add-point:filter段cs_ctrl name="filter.cs_ctrl"
         
         #end add-point
      
      END CONSTRUCT
 
      #add-point:filter段add_cs name="filter.add_cs"
      
      #end add-point
 
      BEFORE DIALOG
         #add-point:filter段b_dialog name="filter.b_dialog"
         
         #end add-point  
      
      ON ACTION accept
         ACCEPT DIALOG
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT DIALOG 
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG
   
   END DIALOG
 
   IF NOT INT_FLAG THEN
      LET g_wc_filter = "   AND   ", g_wc_filter, "   "
      LET g_wc = g_wc , g_wc_filter
   ELSE
      LET g_wc_filter = g_wc_filter_t
      LET g_wc = g_wc_t
   END IF
 
      CALL asrt339_filter_show('sfjadocno')
   CALL asrt339_filter_show('sfjadocdt')
   CALL asrt339_filter_show('sfja003')
   CALL asrt339_filter_show('sfja001')
   CALL asrt339_filter_show('sfja002')
   CALL asrt339_filter_show('sfja004')
   CALL asrt339_filter_show('sfja005')
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION asrt339_filter_parser(ps_field)
   #add-point:filter段define name="filter_parser.define_customerization"
   
   #end add-point    
   DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num10
   DEFINE li_tmp2    LIKE type_t.num10
   DEFINE ls_var     STRING
   #add-point:filter段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="filter_parser.define"
   
   #end add-point    
   
   #一般條件解析
   LET ls_tmp = ps_field, "='"
   LET li_tmp = g_wc_filter.getIndexOf(ls_tmp,1)
   IF li_tmp > 0 THEN
      LET li_tmp = ls_tmp.getLength() + li_tmp
      LET li_tmp2 = g_wc_filter.getIndexOf("'",li_tmp + 1) - 1
      LET ls_var = g_wc_filter.subString(li_tmp,li_tmp2)
   END IF
 
   #模糊條件解析
   LET ls_tmp = ps_field, " like '"
   LET li_tmp = g_wc_filter.getIndexOf(ls_tmp,1)
   IF li_tmp > 0 THEN
      LET li_tmp = ls_tmp.getLength() + li_tmp
      LET li_tmp2 = g_wc_filter.getIndexOf("'",li_tmp + 1) - 1
      LET ls_var = g_wc_filter.subString(li_tmp,li_tmp2)
      LET ls_var = cl_replace_str(ls_var,'%','*')
   END IF
 
   RETURN ls_var
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION asrt339_filter_show(ps_field)
   DEFINE ps_field         STRING
   DEFINE lnode_item       om.DomNode
   DEFINE ls_title         STRING
   DEFINE ls_name          STRING
   DEFINE ls_condition     STRING
 
   LET ls_name = "formonly.b_", ps_field
   LET lnode_item = gfrm_curr.findNode("TableColumn", ls_name)
   LET ls_title = lnode_item.getAttribute("text")
   IF ls_title.getIndexOf('※',1) > 0 THEN
      LEt ls_title = ls_title.subString(1,ls_title.getIndexOf('※',1)-1)
   END IF
 
   #顯示資料組合
   LET ls_condition = asrt339_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION asrt339_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point   
   DEFINE ls_wc STRING
   #add-point:query段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF   
   
   LET ls_wc = g_wc
   
   LET INT_FLAG = 0
   CALL cl_navigator_setting( g_current_idx, g_detail_cnt )
   ERROR ""
   
   #清除畫面及相關資料
   CLEAR FORM
   CALL g_browser.clear()       
   CALL g_sfjb_d.clear()
   CALL g_sfjb2_d.clear()
   CALL g_sfjb4_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL asrt339_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL asrt339_browser_fill("")
      CALL asrt339_fetch("")
      RETURN
   END IF
   
   #儲存WC資訊
   CALL cl_dlg_save_user_latestqry("("||g_wc||") AND ("||g_wc2||")")
   
   #搜尋後資料初始化 
   LET g_detail_cnt  = 0
   LET g_current_idx = 1
   LET g_current_row = 0
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_detail_idx_list[1] = 1
   LET g_detail_idx_list[2] = 1
   LET g_detail_idx_list[3] = 1
 
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
      CALL asrt339_filter_show('sfjadocno')
   CALL asrt339_filter_show('sfjadocdt')
   CALL asrt339_filter_show('sfja003')
   CALL asrt339_filter_show('sfja001')
   CALL asrt339_filter_show('sfja002')
   CALL asrt339_filter_show('sfja004')
   CALL asrt339_filter_show('sfja005')
   CALL asrt339_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL asrt339_fetch("F") 
      #顯示單身筆數
      CALL asrt339_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION asrt339_fetch(p_flag)
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point    
   DEFINE p_flag     LIKE type_t.chr1
   DEFINE ls_msg     STRING
   #add-point:fetch段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fetch.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="fetch.pre_function"
   
   #end add-point
   
   IF g_browser_cnt = 0 THEN
      RETURN
   END IF
 
   #清空第二階單身
 
   
   CALL cl_ap_performance_next_start()
   CASE p_flag
      WHEN 'F' 
         LET g_current_idx = 1
      WHEN 'L'  
         LET g_current_idx = g_browser.getLength()              
      WHEN 'P'
         IF g_current_idx > 1 THEN               
            LET g_current_idx = g_current_idx - 1
         END IF 
      WHEN 'N'
         IF g_current_idx < g_header_cnt THEN
            LET g_current_idx =  g_current_idx + 1
         END IF        
      WHEN '/'
         IF (NOT g_no_ask) THEN    
            CALL cl_set_act_visible("accept,cancel", TRUE)    
            CALL cl_getmsg('fetch',g_lang) RETURNING ls_msg
            LET INT_FLAG = 0
 
            PROMPT ls_msg CLIPPED,':' FOR g_jump
               #交談指令共用ACTION
               &include "common_action.4gl" 
            END PROMPT
 
            CALL cl_set_act_visible("accept,cancel", FALSE)    
            IF INT_FLAG THEN
                LET INT_FLAG = 0
                EXIT CASE  
            END IF           
         END IF
         
         IF g_jump > 0 AND g_jump <= g_browser.getLength() THEN
             LET g_current_idx = g_jump
         END IF
         LET g_no_ask = FALSE  
   END CASE 
 
   CALL g_curr_diag.setCurrentRow("s_browse", g_current_idx) #設定browse 索引
   
   LET g_current_row = g_current_idx
   LET g_detail_cnt = g_header_cnt                  
   
   #單身總筆數顯示
   IF g_detail_cnt > 0 THEN
      #若單身有資料時, idx至少為1
      IF g_detail_idx <= 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx  
   ELSE
      LET g_detail_idx = 0
      DISPLAY '' TO FORMONLY.idx    
   END IF
   
   #瀏覽頁筆數顯示
   LET g_browser_idx = g_pagestart+g_current_idx-1
   DISPLAY g_browser_idx TO FORMONLY.b_index   #當下筆數
   DISPLAY g_browser_idx TO FORMONLY.h_index   #當下筆數
   
   CALL cl_navigator_setting( g_current_idx, g_browser_cnt )
 
   #代表沒有資料
   IF g_current_idx = 0 OR g_browser.getLength() = 0 THEN
      RETURN
   END IF
   
   #避免超出browser資料筆數上限
   IF g_current_idx > g_browser.getLength() THEN
      LET g_browser_idx = g_browser.getLength()
      LET g_current_idx = g_browser.getLength()
   END IF
   
   LET g_sfja_m.sfjadocno = g_browser[g_current_idx].b_sfjadocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE asrt339_master_referesh USING g_sfja_m.sfjadocno INTO g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt, 
       g_sfja_m.sfja003,g_sfja_m.sfja001,g_sfja_m.sfja002,g_sfja_m.sfja004,g_sfja_m.sfja005,g_sfja_m.sfjastus, 
       g_sfja_m.sfjaownid,g_sfja_m.sfjaowndp,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdt, 
       g_sfja_m.sfjamodid,g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid, 
       g_sfja_m.sfjapstdt,g_sfja_m.sfjaownid_desc,g_sfja_m.sfjaowndp_desc,g_sfja_m.sfjacrtid_desc,g_sfja_m.sfjacrtdp_desc, 
       g_sfja_m.sfjamodid_desc,g_sfja_m.sfjacnfid_desc,g_sfja_m.sfjapstid_desc
   
   #遮罩相關處理
   LET g_sfja_m_mask_o.* =  g_sfja_m.*
   CALL asrt339_sfja_t_mask()
   LET g_sfja_m_mask_n.* =  g_sfja_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt339_set_act_visible()   
   CALL asrt339_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_sfja_m_t.* = g_sfja_m.*
   LET g_sfja_m_o.* = g_sfja_m.*
   
   LET g_data_owner = g_sfja_m.sfjaownid      
   LET g_data_dept  = g_sfja_m.sfjaowndp
   
   #重新顯示   
   CALL asrt339_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.insert" >}
#+ 資料新增
PRIVATE FUNCTION asrt339_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_sfjb_d.clear()   
   CALL g_sfjb2_d.clear()  
   CALL g_sfjb4_d.clear()  
 
 
   INITIALIZE g_sfja_m.* TO NULL             #DEFAULT 設定
   
   LET g_sfjadocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_sfja_m.sfjaownid = g_user
      LET g_sfja_m.sfjaowndp = g_dept
      LET g_sfja_m.sfjacrtid = g_user
      LET g_sfja_m.sfjacrtdp = g_dept 
      LET g_sfja_m.sfjacrtdt = cl_get_current()
      LET g_sfja_m.sfjamodid = g_user
      LET g_sfja_m.sfjamoddt = cl_get_current()
      LET g_sfja_m.sfjastus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
      
  
      #add-point:單頭預設值 name="insert.default"
      CALL s_lot_clear_detail()
      CALL asrt339_default_docno()
      LET g_sfja_m.sfjadocno_desc = s_aooi200_get_slip_desc(g_sfja_m.sfjadocno)
      DISPLAY BY NAME g_sfja_m.sfjadocno_desc      
      LET g_sfja_m.sfjadocdt = cl_get_today()
      LET g_sfja_m.sfja003 = cl_get_today()
      LET g_sfja_m.sfja001 = g_user
      LET g_sfja_m.sfja001_desc = s_desc_get_person_desc(g_sfja_m.sfja001)
      DISPLAY BY NAME g_sfja_m.sfja001_desc
      LET g_sfja_m.sfja002 = g_dept
      LET g_sfja_m.sfja002_desc = s_desc_get_department_desc(g_sfja_m.sfja002)
      DISPLAY BY NAME g_sfja_m.sfja001_desc,g_sfja_m.sfja002_desc
      LET g_sfja_m.sfjastus = 'N'
      CALL s_lot_clear_detail()
      LET g_sfja_m.sfjapstid = ""
      LET g_sfja_m.sfjapstdt = ""  
      LET g_sfja_m_t.* = g_sfja_m.*
      LET g_sfjbseq = NULL  
      LEt g_ooff013 = NULL
      DISPLAY g_ooff013 TO FORMONLY.ooff013     
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_sfja_m_t.* = g_sfja_m.*
      LET g_sfja_m_o.* = g_sfja_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sfja_m.sfjastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
    
      CALL asrt339_input("a")
      
      #add-point:單頭輸入後 name="insert.after_insert"
      
      #end add-point
      
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
      END IF
      
      IF NOT g_master_insert THEN
         DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
         DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
         INITIALIZE g_sfja_m.* TO NULL
         INITIALIZE g_sfjb_d TO NULL
         INITIALIZE g_sfjb2_d TO NULL
         INITIALIZE g_sfjb4_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL asrt339_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_sfjb_d.clear()
      #CALL g_sfjb2_d.clear()
      #CALL g_sfjb4_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt339_set_act_visible()   
   CALL asrt339_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sfjadocno_t = g_sfja_m.sfjadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " sfjaent = " ||g_enterprise|| " AND",
                      " sfjadocno = '", g_sfja_m.sfjadocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL asrt339_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE asrt339_cl
   
   CALL asrt339_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE asrt339_master_referesh USING g_sfja_m.sfjadocno INTO g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt, 
       g_sfja_m.sfja003,g_sfja_m.sfja001,g_sfja_m.sfja002,g_sfja_m.sfja004,g_sfja_m.sfja005,g_sfja_m.sfjastus, 
       g_sfja_m.sfjaownid,g_sfja_m.sfjaowndp,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdt, 
       g_sfja_m.sfjamodid,g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid, 
       g_sfja_m.sfjapstdt,g_sfja_m.sfjaownid_desc,g_sfja_m.sfjaowndp_desc,g_sfja_m.sfjacrtid_desc,g_sfja_m.sfjacrtdp_desc, 
       g_sfja_m.sfjamodid_desc,g_sfja_m.sfjacnfid_desc,g_sfja_m.sfjapstid_desc
   
   
   #遮罩相關處理
   LET g_sfja_m_mask_o.* =  g_sfja_m.*
   CALL asrt339_sfja_t_mask()
   LET g_sfja_m_mask_n.* =  g_sfja_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_sfja_m.sfjadocno,g_sfja_m.sfjadocno_desc,g_sfja_m.sfjadocdt,g_sfja_m.sfja003,g_sfja_m.sfja001, 
       g_sfja_m.sfja001_desc,g_sfja_m.sfja002,g_sfja_m.sfja002_desc,g_sfja_m.sfja004,g_sfja_m.sfja005, 
       g_sfja_m.ooff013,g_sfja_m.sfjastus,g_sfja_m.sfjaownid,g_sfja_m.sfjaownid_desc,g_sfja_m.sfjaowndp, 
       g_sfja_m.sfjaowndp_desc,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtid_desc,g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdp_desc, 
       g_sfja_m.sfjacrtdt,g_sfja_m.sfjamodid,g_sfja_m.sfjamodid_desc,g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid, 
       g_sfja_m.sfjacnfid_desc,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid,g_sfja_m.sfjapstid_desc,g_sfja_m.sfjapstdt 
 
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_sfja_m.sfjaownid      
   LET g_data_dept  = g_sfja_m.sfjaowndp
   
   #功能已完成,通報訊息中心
   CALL asrt339_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.modify" >}
#+ 資料修改
PRIVATE FUNCTION asrt339_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point    
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING
   DEFINE l_wc2_table2   STRING
 
   DEFINE l_wc2_table3   STRING
 
 
 
   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   IF g_sfja_m.sfjastus NOT MATCHES '[NDR]' THEN #MOD BY zhujing 2015-6-16
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "apm-00035" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF 
   #end add-point    
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
   #保存單頭舊值
   LET g_sfja_m_t.* = g_sfja_m.*
   LET g_sfja_m_o.* = g_sfja_m.*
   
   IF g_sfja_m.sfjadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_sfjadocno_t = g_sfja_m.sfjadocno
 
   CALL s_transaction_begin()
   
   OPEN asrt339_cl USING g_enterprise,g_sfja_m.sfjadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt339_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE asrt339_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE asrt339_master_referesh USING g_sfja_m.sfjadocno INTO g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt, 
       g_sfja_m.sfja003,g_sfja_m.sfja001,g_sfja_m.sfja002,g_sfja_m.sfja004,g_sfja_m.sfja005,g_sfja_m.sfjastus, 
       g_sfja_m.sfjaownid,g_sfja_m.sfjaowndp,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdt, 
       g_sfja_m.sfjamodid,g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid, 
       g_sfja_m.sfjapstdt,g_sfja_m.sfjaownid_desc,g_sfja_m.sfjaowndp_desc,g_sfja_m.sfjacrtid_desc,g_sfja_m.sfjacrtdp_desc, 
       g_sfja_m.sfjamodid_desc,g_sfja_m.sfjacnfid_desc,g_sfja_m.sfjapstid_desc
   
   #檢查是否允許此動作
   IF NOT asrt339_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_sfja_m_mask_o.* =  g_sfja_m.*
   CALL asrt339_sfja_t_mask()
   LET g_sfja_m_mask_n.* =  g_sfja_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
   #LET l_wc2_table2 = g_wc2_table2
   #LET l_wc2_table2 = " 1=1"
 
   #LET l_wc2_table3 = g_wc2_table3
   #LET l_wc2_table3 = " 1=1"
 
 
 
   
   CALL asrt339_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
   #LET  g_wc2_table2 = l_wc2_table2 
 
   #LET  g_wc2_table3 = l_wc2_table3 
 
 
 
    
   WHILE TRUE
      LET g_sfjadocno_t = g_sfja_m.sfjadocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_sfja_m.sfjamodid = g_user 
LET g_sfja_m.sfjamoddt = cl_get_current()
LET g_sfja_m.sfjamodid_desc = cl_get_username(g_sfja_m.sfjamodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_sfja_m.sfjastus MATCHES "[DR]" THEN
         LET g_sfja_m.sfjastus = "N"
      END IF
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL asrt339_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE sfja_t SET (sfjamodid,sfjamoddt) = (g_sfja_m.sfjamodid,g_sfja_m.sfjamoddt)
          WHERE sfjaent = g_enterprise AND sfjadocno = g_sfjadocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_sfja_m.* = g_sfja_m_t.*
            CALL asrt339_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_sfja_m.sfjadocno != g_sfja_m_t.sfjadocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE sfjb_t SET sfjbdocno = g_sfja_m.sfjadocno
 
          WHERE sfjbent = g_enterprise AND sfjbdocno = g_sfja_m_t.sfjadocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "sfjb_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sfjb_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         
         #add-point:單身fk修改後 name="modify.body.a_fk_update"
         
         #end add-point
         
         #更新單身key值
         #add-point:單身fk修改前 name="modify.body.b_fk_update2"
         
         #end add-point
         
         UPDATE sfjc_t
            SET sfjcdocno = g_sfja_m.sfjadocno
 
          WHERE sfjcent = g_enterprise AND
                sfjcdocno = g_sfjadocno_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update2"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "sfjc_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sfjc_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         #add-point:單身fk修改後 name="modify.body.a_fk_update2"
         
         #end add-point
 
         #更新單身key值
         #add-point:單身fk修改前 name="modify.body.b_fk_update3"
         
         #end add-point
         
         UPDATE inao_t
            SET inaodocno = g_sfja_m.sfjadocno
 
          WHERE inaoent = g_enterprise AND
                inaodocno = g_sfjadocno_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update3"
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "inao_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "inao_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         #add-point:單身fk修改後 name="modify.body.a_fk_update3"
         
         #end add-point
 
 
         
 
         
         #UPDATE 多語言table key值
         
         
         
 
         CALL s_transaction_end('Y','0')
      END IF
    
      EXIT WHILE
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt339_set_act_visible()   
   CALL asrt339_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " sfjaent = " ||g_enterprise|| " AND",
                      " sfjadocno = '", g_sfja_m.sfjadocno, "' "
 
   #填到對應位置
   CALL asrt339_browser_fill("")
 
   CLOSE asrt339_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL asrt339_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="asrt339.input" >}
#+ 資料輸入
PRIVATE FUNCTION asrt339_input(p_cmd)
   #add-point:input段define(客製用) name="input.define_customerization"
   
   #end add-point  
   DEFINE  p_cmd                 LIKE type_t.chr1
   DEFINE  l_cmd_t               LIKE type_t.chr1
   DEFINE  l_cmd                 LIKE type_t.chr1
   DEFINE  l_n                   LIKE type_t.num10                #檢查重複用  
   DEFINE  l_cnt                 LIKE type_t.num10                #檢查重複用  
   DEFINE  l_lock_sw             LIKE type_t.chr1                #單身鎖住否  
   DEFINE  l_allow_insert        LIKE type_t.num5                #可新增否 
   DEFINE  l_allow_delete        LIKE type_t.num5                #可刪除否  
   DEFINE  l_count               LIKE type_t.num10
   DEFINE  l_i                   LIKE type_t.num10
   DEFINE  l_ac_t                LIKE type_t.num10
   DEFINE  l_insert              BOOLEAN
   DEFINE  ls_return             STRING
   DEFINE  l_var_keys            DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys          DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                DYNAMIC ARRAY OF STRING
   DEFINE  l_fields              DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak        DYNAMIC ARRAY OF STRING
   DEFINE  lb_reproduce          BOOLEAN
   DEFINE  li_reproduce          LIKE type_t.num10
   DEFINE  li_reproduce_target   LIKE type_t.num10
   DEFINE  ls_keys               DYNAMIC ARRAY OF VARCHAR(500)
   #add-point:input段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="input.define"
   DEFINE l_rate                 LIKE inaj_t.inaj014
   DEFINE l_success              LIKE type_t.num5
   DEFINE l_ooef004              LIKE ooef_t.ooef004
   DEFINE l_inaa007              LIKE inaa_t.inaa007
   DEFINE l_inao012              LIKE inao_t.inao012
   #end add-point  
   
   #add-point:Function前置處理  name="input.pre_function"
   
   #end add-point
   
   #先做狀態判定
   IF p_cmd = 'r' THEN
      LET l_cmd_t = 'r'
      LET p_cmd   = 'a'
   ELSE
      LET l_cmd_t = p_cmd
   END IF   
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_sfja_m.sfjadocno,g_sfja_m.sfjadocno_desc,g_sfja_m.sfjadocdt,g_sfja_m.sfja003,g_sfja_m.sfja001, 
       g_sfja_m.sfja001_desc,g_sfja_m.sfja002,g_sfja_m.sfja002_desc,g_sfja_m.sfja004,g_sfja_m.sfja005, 
       g_sfja_m.ooff013,g_sfja_m.sfjastus,g_sfja_m.sfjaownid,g_sfja_m.sfjaownid_desc,g_sfja_m.sfjaowndp, 
       g_sfja_m.sfjaowndp_desc,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtid_desc,g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdp_desc, 
       g_sfja_m.sfjacrtdt,g_sfja_m.sfjamodid,g_sfja_m.sfjamodid_desc,g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid, 
       g_sfja_m.sfjacnfid_desc,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid,g_sfja_m.sfjapstid_desc,g_sfja_m.sfjapstdt 
 
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
 
   CALL cl_set_head_visible("","YES")  
 
   LET l_insert = FALSE
   LET g_action_choice = ""
 
   #add-point:input段define_sql name="input.define_sql"
   
   #end add-point 
   LET g_forupd_sql = "SELECT sfjbseq,sfjb019,sfjb016,sfjb017,sfjb018,sfjb003,sfjb004,sfjb005,sfjb006, 
       sfjb007,sfjb008,sfjb009,sfjb010,sfjb011,sfjb012,sfjb013,sfjb014 FROM sfjb_t WHERE sfjbent=? AND  
       sfjbdocno=? AND sfjbseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt339_bcl CURSOR FROM g_forupd_sql
   
   #add-point:input段define_sql name="input.define_sql2"
   
   #end add-point    
   LET g_forupd_sql = "SELECT sfjcseq,sfjcseq1,sfjc003,sfjc004,sfjc010,sfjc005,sfjc006,sfjc007,sfjc008, 
       sfjc009,sfjc011,sfjc012,sfjc013,sfjc014 FROM sfjc_t WHERE sfjcent=? AND sfjcdocno=? AND sfjcseq=?  
       AND sfjcseq1=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql2"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt339_bcl2 CURSOR FROM g_forupd_sql
 
   #add-point:input段define_sql name="input.define_sql3"
   
   #end add-point    
   LET g_forupd_sql = "SELECT inao000,inao013,inaoseq,inaoseq1,inaoseq2,inao001,inao008,inao009,inao010, 
       inao012 FROM inao_t WHERE inaoent=? AND inaodocno=? AND inaoseq=? AND inaoseq1=? AND inaoseq2=?  
       AND inao000=? AND inao013=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql3"
   LET g_forupd_sql = "SELECT inaoseq,inaoseq1,inaoseq2,inao001,inao008,inao009,inao010,inao012 FROM  
       inao_t WHERE inaoent=? AND inaodocno=? AND inaoseq=? AND inaoseq1=? AND inaoseq2=? FOR UPDATE"
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt339_bcl3 CURSOR FROM g_forupd_sql
 
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL asrt339_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL asrt339_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt,g_sfja_m.sfja003,g_sfja_m.sfja001,g_sfja_m.sfja002, 
       g_sfja_m.sfja004,g_sfja_m.sfja005,g_sfja_m.sfjastus
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
    
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="asrt339.input.head" >}
      #單頭段
      INPUT BY NAME g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt,g_sfja_m.sfja003,g_sfja_m.sfja001,g_sfja_m.sfja002, 
          g_sfja_m.sfja004,g_sfja_m.sfja005,g_sfja_m.sfjastus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN asrt339_cl USING g_enterprise,g_sfja_m.sfjadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt339_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt339_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL asrt339_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL asrt339_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjadocno
            
            #add-point:AFTER FIELD sfjadocno name="input.a.sfjadocno"

            #此段落由子樣板a05產生
            IF  NOT cl_null(g_sfja_m.sfjadocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfja_m.sfjadocno != g_sfjadocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sfja_t WHERE "||"sfjaent = '" ||g_enterprise|| "' AND "||"sfjadocno = '"||g_sfja_m.sfjadocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            IF NOT cl_null(g_sfja_m.sfjadocno) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sfja_m_t.sfjadocno IS NULL OR g_sfja_m.sfjadocno <> g_sfja_m_t.sfjadocno)) THEN  
#有单别检查单别，是完整单号检查完整单号，传入完整单号的话，会截取单别做单别合法性检查               
                  IF NOT s_aooi200_chk_docno(g_site,g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt,g_prog) THEN
                     LET g_sfja_m.sfjadocno = g_sfja_m_t.sfjadocno
                     NEXT FIELD CURRENT
                  END IF
                  
               END IF
            END IF 
            LET g_sfja_m.sfjadocno_desc = s_aooi200_get_slip_desc(g_sfja_m.sfjadocno)
            DISPLAY BY NAME g_sfja_m.sfjadocno_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjadocno
            #add-point:BEFORE FIELD sfjadocno name="input.b.sfjadocno"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjadocno
            #add-point:ON CHANGE sfjadocno name="input.g.sfjadocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjadocdt
            #add-point:BEFORE FIELD sfjadocdt name="input.b.sfjadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjadocdt
            
            #add-point:AFTER FIELD sfjadocdt name="input.a.sfjadocdt"
            IF  NOT cl_null(g_sfja_m.sfjadocdt) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfja_m_t.sfjadocdt IS NULL OR g_sfja_m.sfjadocdt != g_sfja_m_t.sfjadocdt)) THEN 
                  IF NOT s_date_chk_close(g_sfja_m.sfjadocdt,'1') THEN

                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjadocdt
            #add-point:ON CHANGE sfjadocdt name="input.g.sfjadocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfja003
            #add-point:BEFORE FIELD sfja003 name="input.b.sfja003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfja003
            
            #add-point:AFTER FIELD sfja003 name="input.a.sfja003"
            IF  NOT cl_null(g_sfja_m.sfja003) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfja_m_t.sfja003 IS NULL OR g_sfja_m.sfja003 != g_sfja_m_t.sfja003)) THEN 
                  IF NOT s_date_chk_close(g_sfja_m.sfja003,'1') THEN

                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfja003
            #add-point:ON CHANGE sfja003 name="input.g.sfja003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfja001
            
            #add-point:AFTER FIELD sfja001 name="input.a.sfja001"
            IF NOT cl_null(g_sfja_m.sfja001) THEN 
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sfja_m_t.sfja001 IS NULL OR g_sfja_m.sfja001 <> g_sfja_m_t.sfja001)) THEN
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sfja_m.sfja001
   
                  #160318-00025#34  2016/04/25  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"
                  #160318-00025#34  2016/04/25  by pengxin  add(E)   
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ooag001") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
   
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sfja_m.sfja001 = g_sfja_m_t.sfja001
                     NEXT FIELD CURRENT
                  END IF
               END IF
            

            END IF 
            LET g_sfja_m.sfja001_desc = s_desc_get_person_desc(g_sfja_m.sfja001)
            DISPLAY BY NAME g_sfja_m.sfja001_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfja001
            #add-point:BEFORE FIELD sfja001 name="input.b.sfja001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfja001
            #add-point:ON CHANGE sfja001 name="input.g.sfja001"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfja002
            
            #add-point:AFTER FIELD sfja002 name="input.a.sfja002"
            IF NOT cl_null(g_sfja_m.sfja002) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfja_m_t.sfja002 IS NULL OR g_sfja_m.sfja002 != g_sfja_m_t.sfja002)) THEN 
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sfja_m.sfja002
                  LET g_chkparam.arg2 = g_sfja_m.sfjadocdt
			      
                   #160318-00025#34  2016/04/25  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"
                  #160318-00025#34  2016/04/25  by pengxin  add(E)  
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ooeg001_3") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
			      
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sfja_m.sfja002 = g_sfja_m_t.sfja002
                     NEXT FIELD CURRENT
                  END IF
               END IF
            

            END IF 
            LET g_sfja_m.sfja002_desc = s_desc_get_department_desc(g_sfja_m.sfja002)
            DISPLAY BY NAME g_sfja_m.sfja002_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfja002
            #add-point:BEFORE FIELD sfja002 name="input.b.sfja002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfja002
            #add-point:ON CHANGE sfja002 name="input.g.sfja002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfja004
            #add-point:BEFORE FIELD sfja004 name="input.b.sfja004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfja004
            
            #add-point:AFTER FIELD sfja004 name="input.a.sfja004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfja004
            #add-point:ON CHANGE sfja004 name="input.g.sfja004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfja005
            #add-point:BEFORE FIELD sfja005 name="input.b.sfja005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfja005
            
            #add-point:AFTER FIELD sfja005 name="input.a.sfja005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfja005
            #add-point:ON CHANGE sfja005 name="input.g.sfja005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjastus
            #add-point:BEFORE FIELD sfjastus name="input.b.sfjastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjastus
            
            #add-point:AFTER FIELD sfjastus name="input.a.sfjastus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjastus
            #add-point:ON CHANGE sfjastus name="input.g.sfjastus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.sfjadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjadocno
            #add-point:ON ACTION controlp INFIELD sfjadocno name="input.c.sfjadocno"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfja_m.sfjadocno             #給予default值

            #給予arg
            SELECT ooef004 INTO l_ooef004 
              FROM ooef_t
             WHERE ooefent = g_enterprise
               AND ooef001 = g_site
               
            LET g_qryparam.arg1 = l_ooef004          #
            LET g_qryparam.arg2 = g_prog      #

            CALL q_ooba002_1()                                       #呼叫開窗

            LET g_sfja_m.sfjadocno = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfja_m.sfjadocno TO sfjadocno                  #顯示到畫面上

            NEXT FIELD sfjadocno                                     #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.sfjadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjadocdt
            #add-point:ON ACTION controlp INFIELD sfjadocdt name="input.c.sfjadocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.sfja003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfja003
            #add-point:ON ACTION controlp INFIELD sfja003 name="input.c.sfja003"
            
            #END add-point
 
 
         #Ctrlp:input.c.sfja001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfja001
            #add-point:ON ACTION controlp INFIELD sfja001 name="input.c.sfja001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfja_m.sfja001       #給予default值

            #給予arg

            CALL q_ooag001_4()                               #呼叫開窗

            LET g_sfja_m.sfja001 = g_qryparam.return1        #將開窗取得的值回傳到變數

            DISPLAY g_sfja_m.sfja001 TO sfja001              #顯示到畫面上

            NEXT FIELD sfja001                               #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.sfja002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfja002
            #add-point:ON ACTION controlp INFIELD sfja002 name="input.c.sfja002"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfja_m.sfja002       #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_sfja_m.sfjadocdt

            CALL q_ooeg001()                                 #呼叫開窗

            LET g_sfja_m.sfja002 = g_qryparam.return1        #將開窗取得的值回傳到變數

            DISPLAY g_sfja_m.sfja002 TO sfja002              #顯示到畫面上

            NEXT FIELD sfja002                               #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.sfja004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfja004
            #add-point:ON ACTION controlp INFIELD sfja004 name="input.c.sfja004"
            
            #END add-point
 
 
         #Ctrlp:input.c.sfja005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfja005
            #add-point:ON ACTION controlp INFIELD sfja005 name="input.c.sfja005"
            
            #END add-point
 
 
         #Ctrlp:input.c.sfjastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjastus
            #add-point:ON ACTION controlp INFIELD sfjastus name="input.c.sfjastus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_sfja_m.sfjadocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_site,g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt,g_prog) RETURNING l_success,g_sfja_m.sfjadocno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_sfja_m.sfjadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CALL s_transaction_end('N','0')
                  NEXT FIELD sfjadocno
               END IF
               #end add-point
               
               INSERT INTO sfja_t (sfjaent,sfjadocno,sfjadocdt,sfja003,sfja001,sfja002,sfja004,sfja005, 
                   sfjastus,sfjaownid,sfjaowndp,sfjacrtid,sfjacrtdp,sfjacrtdt,sfjamodid,sfjamoddt,sfjacnfid, 
                   sfjacnfdt,sfjapstid,sfjapstdt)
               VALUES (g_enterprise,g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt,g_sfja_m.sfja003,g_sfja_m.sfja001, 
                   g_sfja_m.sfja002,g_sfja_m.sfja004,g_sfja_m.sfja005,g_sfja_m.sfjastus,g_sfja_m.sfjaownid, 
                   g_sfja_m.sfjaowndp,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdt,g_sfja_m.sfjamodid, 
                   g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid,g_sfja_m.sfjapstdt)  
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_sfja_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               INSERT INTO sfja_t (sfjaent,sfjasite,sfjadocno,sfjadocdt,sfja003,sfja001,sfja002,sfja004,sfja005, 
                   sfjastus,sfjaownid,sfjaowndp,sfjacrtid,sfjacrtdp,sfjacrtdt,sfjacnfid,sfjacnfdt,sfjapstid, 
                   sfjapstdt)
               VALUES (g_enterprise,g_site,g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt,g_sfja_m.sfja003,g_sfja_m.sfja001, 
                   g_sfja_m.sfja002,g_sfja_m.sfja004,g_sfja_m.sfja005,g_sfja_m.sfjastus,g_sfja_m.sfjaownid, 
                   g_sfja_m.sfjaowndp,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdt,g_sfja_m.sfjacnfid, 
                   g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid,g_sfja_m.sfjapstdt) 
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_sfja_m" 
                  LET g_errparam.code   = SQLCA.sqlcode 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
 
                  CALL s_transaction_end('N','0')
                  CONTINUE DIALOG
               END IF
               #end add-point
               
               
               
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL asrt339_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL asrt339_b_fill()
                  CALL asrt339_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL asrt339_sfja_t_mask_restore('restore_mask_o')
               
               UPDATE sfja_t SET (sfjadocno,sfjadocdt,sfja003,sfja001,sfja002,sfja004,sfja005,sfjastus, 
                   sfjaownid,sfjaowndp,sfjacrtid,sfjacrtdp,sfjacrtdt,sfjamodid,sfjamoddt,sfjacnfid,sfjacnfdt, 
                   sfjapstid,sfjapstdt) = (g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt,g_sfja_m.sfja003,g_sfja_m.sfja001, 
                   g_sfja_m.sfja002,g_sfja_m.sfja004,g_sfja_m.sfja005,g_sfja_m.sfjastus,g_sfja_m.sfjaownid, 
                   g_sfja_m.sfjaowndp,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdt,g_sfja_m.sfjamodid, 
                   g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid,g_sfja_m.sfjapstdt) 
 
                WHERE sfjaent = g_enterprise AND sfjadocno = g_sfjadocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "sfja_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL asrt339_sfja_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_sfja_m_t)
               LET g_log2 = util.JSON.stringify(g_sfja_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_sfjadocno_t = g_sfja_m.sfjadocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="asrt339.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_sfjb_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION s_lot_ins1
            LET g_action_choice="s_lot_ins1"
            IF cl_auth_chk_act("s_lot_ins1") THEN
               
               #add-point:ON ACTION s_lot_ins1 name="input.detail_input.page1.s_lot_ins1"
#               IF NOT cl_null(g_sfjb_d[g_detail_idx].sfjbseq) AND 
#                  NOT cl_null(g_sfjb_d[g_detail_idx].sfjb003) AND
#                  NOT cl_null(g_sfjb_d[g_detail_idx].sfjb004) AND
#                  NOT cl_null(g_sfjb_d[g_detail_idx].sfjb005) AND
#                  NOT cl_null(g_sfjb_d[g_detail_idx].sfjb006)  THEN
#                  LET l_success = ''
#                  CALL s_lot_ins(g_site,g_sfja_m.sfjadocno,g_sfjb_d[g_detail_idx].sfjbseq,'0',g_sfjb_d[g_detail_idx].sfjb003,g_sfjb_d[g_detail_idx].sfjb004,g_sfjb_d[g_detail_idx].sfjb005,g_sfjb_d[g_detail_idx].sfjb006,'1',g_sfja_m.sfja001,'0',g_site,g_site,g_sfjb_d[g_detail_idx].sfjb011,g_sfjb_d[g_detail_idx].sfjb012,g_sfjb_d[g_detail_idx].sfjb013)
#                       RETURNING l_success,l_inao012
#                  IF NOT l_success THEN                     
#                     CALL s_transaction_end('N','0')
#                     RETURN
#                  END IF
#               END IF
               #END add-point
            END IF
 
 
 
 
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sfjb_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL asrt339_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_sfjb_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            
            #end add-point
         
         BEFORE ROW
            #add-point:modify段before row2 name="input.body.before_row2"
            CALL s_transaction_end('Y','0')  #临时加，先结束事务，这里不应该在事务中的
            CALL s_lot_ins_create_tmp()
            CALL s_aooi390_cre_tmp_table() RETURNING l_success   #add--2015/03/19 By shiun
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_detail_idx_list[1] = l_ac
            LET g_current_page = 1
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN asrt339_cl USING g_enterprise,g_sfja_m.sfjadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt339_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt339_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_sfjb_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_sfjb_d[l_ac].sfjbseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_sfjb_d_t.* = g_sfjb_d[l_ac].*  #BACKUP
               LET g_sfjb_d_o.* = g_sfjb_d[l_ac].*  #BACKUP
               CALL asrt339_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               CALL asrt339_set_no_required_b()
               CALL asrt339_set_required_b()
               #end add-point  
               CALL asrt339_set_no_entry_b(l_cmd)
               IF NOT asrt339_lock_b("sfjb_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH asrt339_bcl INTO g_sfjb_d[l_ac].sfjbseq,g_sfjb_d[l_ac].sfjb019,g_sfjb_d[l_ac].sfjb016, 
                      g_sfjb_d[l_ac].sfjb017,g_sfjb_d[l_ac].sfjb018,g_sfjb_d[l_ac].sfjb003,g_sfjb_d[l_ac].sfjb004, 
                      g_sfjb_d[l_ac].sfjb005,g_sfjb_d[l_ac].sfjb006,g_sfjb_d[l_ac].sfjb007,g_sfjb_d[l_ac].sfjb008, 
                      g_sfjb_d[l_ac].sfjb009,g_sfjb_d[l_ac].sfjb010,g_sfjb_d[l_ac].sfjb011,g_sfjb_d[l_ac].sfjb012, 
                      g_sfjb_d[l_ac].sfjb013,g_sfjb_d[l_ac].sfjb014
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_sfjb_d_t.sfjbseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_sfjb_d_mask_o[l_ac].* =  g_sfjb_d[l_ac].*
                  CALL asrt339_sfjb_t_mask()
                  LET g_sfjb_d_mask_n[l_ac].* =  g_sfjb_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL asrt339_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            #备份项次，为显示s_lot的批序号单身使用
            LET g_sfjbseq = g_sfjb_d[g_detail_idx].sfjbseq 
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
        
         BEFORE INSERT  
            
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_sfjb_d[l_ac].* TO NULL 
            INITIALIZE g_sfjb_d_t.* TO NULL 
            INITIALIZE g_sfjb_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_sfjb_d[l_ac].sfba013 = "0"
      LET g_sfjb_d[l_ac].sfba016 = "0"
      LET g_sfjb_d[l_ac].sfba025 = "0"
      LET g_sfjb_d[l_ac].sfba017 = "0"
      LET g_sfjb_d[l_ac].sfjb010 = "1"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            LET g_sfjb_d[l_ac].sfjb006 = 0
            IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  = 'Y' THEN  
               LET g_sfjb_d[l_ac].sfjb008 = 0
            END IF
            LET g_sfjb_d[l_ac].sfjb010 = 1
            #end add-point
            LET g_sfjb_d_t.* = g_sfjb_d[l_ac].*     #新輸入資料
            LET g_sfjb_d_o.* = g_sfjb_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL asrt339_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL asrt339_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sfjb_d[li_reproduce_target].* = g_sfjb_d[li_reproduce].*
 
               LET g_sfjb_d[li_reproduce_target].sfjbseq = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
            IF g_sfjb_d[l_ac].sfjbseq IS NULL OR g_sfjb_d[l_ac].sfjbseq = 0 THEN
               SELECT MAX(sfjbseq)+1 INTO g_sfjb_d[l_ac].sfjbseq
                 FROM sfjb_t
                WHERE sfjbent   = g_enterprise 
                  AND sfjbdocno = g_sfja_m.sfjadocno 
            END IF
            IF g_sfjb_d[l_ac].sfjbseq IS NULL THEN
               LET g_sfjb_d[l_ac].sfjbseq = 1
            END IF
            #end add-point  
  
         AFTER INSERT
            LET l_insert = FALSE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            #add-point:單身新增 name="input.body.b_a_insert"
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM sfjb_t 
             WHERE sfjbent = g_enterprise AND sfjbdocno = g_sfja_m.sfjadocno
 
               AND sfjbseq = g_sfjb_d[l_ac].sfjbseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               IF (g_sfjb_d[l_ac].sfjb010 = '2' OR g_sfjb_d[l_ac].sfjb010 = '3') AND g_sfjb_d[l_ac].sfjb011 IS NULL THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = ''
                  LET g_errparam.code   = 'asf-00455' 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
               END IF
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfja_m.sfjadocno
               LET gs_keys[2] = g_sfjb_d[g_detail_idx].sfjbseq
               CALL asrt339_insert_b('sfjb_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
#               IF NOT s_asrt339_ins_sfjc(g_sfja_m.sfjadocno,g_sfjb_d[l_ac].sfjbseq,g_sfjb_d[l_ac].*) THEN
#                  CALL s_transaction_end('N','0')
#                  CANCEL INSERT
#               ELSE
#                  CALL asrt339_b_fill()
#               END IF
               
               IF NOT cl_null(g_sfjb_d[l_ac].ooff013) THEN
                  CALL s_aooi360_gen('7',g_sfja_m.sfjadocno,g_sfjb_d[l_ac].sfjbseq,' ',' ',' ',' ',' ',' ',' ',' ','4',g_sfjb_d[l_ac].ooff013)
                     RETURNING l_success
                  IF NOT l_success THEN
                     INITIALIZE g_sfjb_d[l_ac].* TO NULL
                     CALL s_transaction_end('N','0')
                     CANCEL INSERT
                  END IF
               END IF

               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_sfjb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sfjb_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL asrt339_b_fill()
               #資料多語言用-增/改
               
               #add-point:input段-after_insert name="input.body.a_insert2"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身刪除後(=d) name="input.body.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body.b_delete_ask"
               
               #end add-point 
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code = -263 
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
               
               #add-point:單身刪除前 name="input.body.b_delete"
               
               #end add-point 
               
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_sfja_m.sfjadocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_sfjb_d_t.sfjbseq
 
            
               #刪除同層單身
               IF NOT asrt339_delete_b('sfjb_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt339_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT asrt339_key_delete_b(gs_keys,'sfjb_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt339_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE asrt339_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
 
               #end add-point
               LET l_count = g_sfjb_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_sfjb_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjbseq
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfjb_d[l_ac].sfjbseq,"0","0","","","azz-00079",1) THEN
               NEXT FIELD sfjbseq
            END IF 
 
 
 
            #add-point:AFTER FIELD sfjbseq name="input.a.page1.sfjbseq"
            IF NOT cl_null(g_sfjb_d[l_ac].sfjbseq) THEN 
            END IF 


            #此段落由子樣板a05產生
            IF  g_sfja_m.sfjadocno IS NOT NULL AND g_sfjb_d[g_detail_idx].sfjbseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_sfja_m.sfjadocno != g_sfjadocno_t OR g_sfjb_d[g_detail_idx].sfjbseq != g_sfjb_d_t.sfjbseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sfjb_t WHERE "||"sfjbent = '" ||g_enterprise|| "' AND "||"sfjbdocno = '"||g_sfja_m.sfjadocno ||"' AND "|| "sfjbseq = '"||g_sfjb_d[g_detail_idx].sfjbseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjbseq
            #add-point:BEFORE FIELD sfjbseq name="input.b.page1.sfjbseq"
            IF g_sfjb_d[l_ac].sfjbseq IS NULL OR g_sfjb_d[l_ac].sfjbseq = 0 THEN
               SELECT MAX(sfjbseq)+1 INTO g_sfjb_d[l_ac].sfjbseq
                 FROM sfjb_t
                WHERE sfjbent   = g_enterprise 
                  AND sfjbdocno = g_sfja_m.sfjadocno 
                  
            END IF
            IF g_sfjb_d[l_ac].sfjbseq IS NULL THEN
               LET g_sfjb_d[l_ac].sfjbseq = 1
            END IF
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjbseq
            #add-point:ON CHANGE sfjbseq name="input.g.page1.sfjbseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb019
            #add-point:BEFORE FIELD sfjb019 name="input.b.page1.sfjb019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb019
            
            #add-point:AFTER FIELD sfjb019 name="input.a.page1.sfjb019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb019
            #add-point:ON CHANGE sfjb019 name="input.g.page1.sfjb019"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb016
            
            #add-point:AFTER FIELD sfjb016 name="input.a.page1.sfjb016"
            IF NOT cl_null(g_sfjb_d[l_ac].sfjb016) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sfjb_d[l_ac].sfjb019
               LET g_chkparam.arg2 = g_sfjb_d[l_ac].sfjb016
               LET g_chkparam.arg3 = g_sfjb_d[l_ac].sfjb017
               LET g_chkparam.arg4 = g_sfjb_d[l_ac].sfjb018
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_srab001_3") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF


            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb016
            #add-point:BEFORE FIELD sfjb016 name="input.b.page1.sfjb016"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb016
            #add-point:ON CHANGE sfjb016 name="input.g.page1.sfjb016"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb017
            
            #add-point:AFTER FIELD sfjb017 name="input.a.page1.sfjb017"
            IF NOT cl_null(g_sfjb_d[l_ac].sfjb017) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sfjb_d[l_ac].sfjb019
               LET g_chkparam.arg2 = g_sfjb_d[l_ac].sfjb016
               LET g_chkparam.arg3 = g_sfjb_d[l_ac].sfjb017
               LET g_chkparam.arg4 = g_sfjb_d[l_ac].sfjb018
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_srab001_3") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            END IF 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb017
            #add-point:BEFORE FIELD sfjb017 name="input.b.page1.sfjb017"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb017
            #add-point:ON CHANGE sfjb017 name="input.g.page1.sfjb017"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb018
            
            #add-point:AFTER FIELD sfjb018 name="input.a.page1.sfjb018"
            IF NOT cl_null(g_sfjb_d[l_ac].sfjb018) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sfjb_d[l_ac].sfjb019
               LET g_chkparam.arg2 = g_sfjb_d[l_ac].sfjb016
               LET g_chkparam.arg3 = g_sfjb_d[l_ac].sfjb017
               LET g_chkparam.arg4 = g_sfjb_d[l_ac].sfjb018
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_srab001_3") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            END IF 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb018
            #add-point:BEFORE FIELD sfjb018 name="input.b.page1.sfjb018"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb018
            #add-point:ON CHANGE sfjb018 name="input.g.page1.sfjb018"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb003
            
            #add-point:AFTER FIELD sfjb003 name="input.a.page1.sfjb003"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfjb_d[l_ac].sfjb003
            CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? ","") RETURNING g_rtn_fields
            LET g_sfjb_d[l_ac].sfjb003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfjb_d[l_ac].sfjb003_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb003
            #add-point:BEFORE FIELD sfjb003 name="input.b.page1.sfjb003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb003
            #add-point:ON CHANGE sfjb003 name="input.g.page1.sfjb003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb004
            #add-point:BEFORE FIELD sfjb004 name="input.b.page1.sfjb004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb004
            
            #add-point:AFTER FIELD sfjb004 name="input.a.page1.sfjb004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb004
            #add-point:ON CHANGE sfjb004 name="input.g.page1.sfjb004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb005
            
            #add-point:AFTER FIELD sfjb005 name="input.a.page1.sfjb005"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfjb_d[l_ac].sfjb005
            CALL ap_ref_array2(g_ref_fields,"SELECT oocal003 FROM oocal_t WHERE oocalent='"||g_enterprise||"' AND oocal001=? AND oocal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfjb_d[l_ac].sfjb005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfjb_d[l_ac].sfjb005_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb005
            #add-point:BEFORE FIELD sfjb005 name="input.b.page1.sfjb005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb005
            #add-point:ON CHANGE sfjb005 name="input.g.page1.sfjb005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfba013
            #add-point:BEFORE FIELD sfba013 name="input.b.page1.sfba013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfba013
            
            #add-point:AFTER FIELD sfba013 name="input.a.page1.sfba013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfba013
            #add-point:ON CHANGE sfba013 name="input.g.page1.sfba013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfba016
            #add-point:BEFORE FIELD sfba016 name="input.b.page1.sfba016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfba016
            
            #add-point:AFTER FIELD sfba016 name="input.a.page1.sfba016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfba016
            #add-point:ON CHANGE sfba016 name="input.g.page1.sfba016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfba025
            #add-point:BEFORE FIELD sfba025 name="input.b.page1.sfba025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfba025
            
            #add-point:AFTER FIELD sfba025 name="input.a.page1.sfba025"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfba025
            #add-point:ON CHANGE sfba025 name="input.g.page1.sfba025"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfba017
            #add-point:BEFORE FIELD sfba017 name="input.b.page1.sfba017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfba017
            
            #add-point:AFTER FIELD sfba017 name="input.a.page1.sfba017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfba017
            #add-point:ON CHANGE sfba017 name="input.g.page1.sfba017"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb006
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfjb_d[l_ac].sfjb006,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD sfjb006
            END IF 
 
 
 
            #add-point:AFTER FIELD sfjb006 name="input.a.page1.sfjb006"
            IF NOT cl_null(g_sfjb_d[l_ac].sfjb006) THEN 
              #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_sfjb_d_t.sfjb006 IS NULL OR g_sfjb_d[l_ac].sfjb006 != g_sfjb_d_t.sfjb006)) THEN   #160824-00007#285 by sakura mark
               IF g_sfjb_d_o.sfjb006 IS NULL OR g_sfjb_d[l_ac].sfjb006 != g_sfjb_d_o.sfjb006 THEN   #160824-00007#285 by sakura add
                  IF NOT s_asrt339_chk_sfjb006(g_sfja_m.sfjadocno,g_sfjb_d[l_ac].sfjbseq,g_sfjb001,g_sfjb002,g_sfjb_d[l_ac].sfba016 + g_sfjb_d[l_ac].sfba025 - g_sfjb_d[l_ac].sfba017,g_sfjb_d[l_ac].sfjb006) THEN
                    #LET g_sfjb_d[l_ac].sfjb006 = g_sfjb_d_t.sfjb006   #160824-00007#285 by sakura mark
                     LET g_sfjb_d[l_ac].sfjb006 = g_sfjb_d_o.sfjb006   #160824-00007#285 by sakura add
                     NEXT FIELD CURRENT
                  END IF
                  IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  = 'Y' THEN    #预设参考数量
                     CALL s_aooi250_convert_qty(g_sfjb_d[l_ac].sfjb003,g_sfjb_d[l_ac].sfjb005,g_sfjb_d[l_ac].sfjb007,g_sfjb_d[l_ac].sfjb006)
                        RETURNING l_success,g_qty_t
                     IF l_success THEN
                        LET g_sfjb_d[l_ac].sfjb008 = g_qty_t
                     END IF
                  END IF
               END IF
              #LET g_sfjb_d_t.sfjb006 = g_sfjb_d[l_ac].sfjb006   #160824-00007#285 by sakura mark
               LET g_sfjb_d_o.* = g_sfjb_d[l_ac].*               #160824-00007#285 by sakura add
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb006
            #add-point:BEFORE FIELD sfjb006 name="input.b.page1.sfjb006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb006
            #add-point:ON CHANGE sfjb006 name="input.g.page1.sfjb006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb007
            
            #add-point:AFTER FIELD sfjb007 name="input.a.page1.sfjb007"
            IF NOT cl_null(g_sfjb_d[l_ac].sfjb007) THEN 
              #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_sfjb_d_t.sfjb007 IS NULL OR g_sfjb_d[l_ac].sfjb007 != g_sfjb_d_t.sfjb007)) THEN   #160824-00007#285 by sakura mark
               IF g_sfjb_d_o.sfjb007 IS NULL OR g_sfjb_d[l_ac].sfjb007 != g_sfjb_d_o.sfjb007 THEN   #160824-00007#285 by sakura add
                  IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  = 'Y' THEN    #预设参考数量
#                     CALL s_aimi190_get_convert(g_sfjb_d[l_ac].sfjb003,g_sfjb_d[l_ac].sfjb005,g_sfjb_d[l_ac].sfjb007) RETURNING l_success,l_rate
#                     IF l_success THEN
#                        LET g_sfjb_d[l_ac].sfjb008 = g_sfjb_d[l_ac].sfjb006*l_rate
#                     END IF
                     CALL s_aooi250_convert_qty(g_sfjb_d[l_ac].sfjb003,g_sfjb_d[l_ac].sfjb005,g_sfjb_d[l_ac].sfjb007,g_sfjb_d[l_ac].sfjb006)
                        RETURNING l_success,g_qty_t
                     IF l_success THEN
                        LET g_sfjb_d[l_ac].sfjb008 = g_qty_t
                     END IF
                  END IF
               END IF
              #LET g_sfjb_d_t.sfjb007 = g_sfjb_d[l_ac].sfjb007   #160824-00007#285 by sakura mark
               LET g_sfjb_d_o.* = g_sfjb_d[l_ac].*               #160824-00007#285 by sakura add
            END IF 

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfjb_d[l_ac].sfjb007
            CALL ap_ref_array2(g_ref_fields,"SELECT oocal003 FROM oocal_t WHERE oocalent='"||g_enterprise||"' AND oocal001=? AND oocal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfjb_d[l_ac].sfjb007_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfjb_d[l_ac].sfjb007_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb007
            #add-point:BEFORE FIELD sfjb007 name="input.b.page1.sfjb007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb007
            #add-point:ON CHANGE sfjb007 name="input.g.page1.sfjb007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb008
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfjb_d[l_ac].sfjb008,"0","0","","","azz-00079",1) THEN
               NEXT FIELD sfjb008
            END IF 
 
 
 
            #add-point:AFTER FIELD sfjb008 name="input.a.page1.sfjb008"
            IF NOT cl_null(g_sfjb_d[l_ac].sfjb008) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb008
            #add-point:BEFORE FIELD sfjb008 name="input.b.page1.sfjb008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb008
            #add-point:ON CHANGE sfjb008 name="input.g.page1.sfjb008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb009
            
            #add-point:AFTER FIELD sfjb009 name="input.a.page1.sfjb009"
            IF g_sfjb_d[l_ac].sfjb009 IS NOT NULL THEN
               IF l_cmd ='a' OR (l_cmd = 'u' AND (g_sfjb_d_t.sfjb009 IS NULL OR g_sfjb_d[l_ac].sfjb009 <> g_sfjb_d_t.sfjb009)) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = '227'
                  LET g_chkparam.arg2 = g_sfjb_d[l_ac].sfjb009
                  
                  #160318-00025#34  2016/04/25  by pengxin  add(S)
                  LET g_errshow = TRUE #是否開窗 
                  LET g_chkparam.err_str[1] = "aqc-00032:sub-01302|aqci030|",cl_get_progname("aqci030",g_lang,"2"),"|:EXEPROGaqci030"
                  #160318-00025#34  2016/04/25  by pengxin  add(E)
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_oocq002_1") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 
                  
                  ELSE
                  #檢查失敗時後續處理
                     LET g_sfjb_d[l_ac].sfjb009 = g_sfjb_d_t.sfjb009
                     NEXT FIELD sfjb009
                  END IF
               END IF
            END IF

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfjb_d[l_ac].sfjb009
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='227' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfjb_d[l_ac].sfjb009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfjb_d[l_ac].sfjb009_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb009
            #add-point:BEFORE FIELD sfjb009 name="input.b.page1.sfjb009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb009
            #add-point:ON CHANGE sfjb009 name="input.g.page1.sfjb009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb010
            #add-point:BEFORE FIELD sfjb010 name="input.b.page1.sfjb010"
            CALL asrt339_set_entry_b(l_cmd)
            CALL asrt339_set_no_required_b() 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb010
            
            #add-point:AFTER FIELD sfjb010 name="input.a.page1.sfjb010"
            CALL asrt339_set_no_entry_b(l_cmd)
            CALL asrt339_set_required_b() 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb010
            #add-point:ON CHANGE sfjb010 name="input.g.page1.sfjb010"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb011
            
            #add-point:AFTER FIELD sfjb011 name="input.a.page1.sfjb011"
            IF NOT cl_null(g_sfjb_d[l_ac].sfjb011) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_sfjb_d_t.sfjb011 IS NULL OR g_sfjb_d[l_ac].sfjb011 <> g_sfjb_d_t.sfjb011)) THEN
                  IF NOT s_asrt339_warehouse_chk(g_sfja_m.sfjadocno,g_sfjb_d[l_ac].sfjb011,g_sfjb_d[l_ac].sfjb012) THEN
                     LET g_sfjb_d[l_ac].sfjb011 = g_sfjb_d_t.sfjb011
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL s_desc_get_stock_desc(g_site,g_sfjb_d[l_ac].sfjb011)
            RETURNING g_sfjb_d[l_ac].sfjb011_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb011
            #add-point:BEFORE FIELD sfjb011 name="input.b.page1.sfjb011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb011
            #add-point:ON CHANGE sfjb011 name="input.g.page1.sfjb011"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb012
            
            #add-point:AFTER FIELD sfjb012 name="input.a.page1.sfjb012"
            IF g_sfjb_d[l_ac].sfjb012 IS NULL THEN LET g_sfjb_d[l_ac].sfjb012 = ' ' END IF
            IF l_cmd = 'a' OR (l_cmd = 'u' AND g_sfjb_d[l_ac].sfjb012 <> g_sfjb_d_t.sfjb012) THEN
               IF NOT s_asrt339_warehouse_chk(g_sfja_m.sfjadocno,g_sfjb_d[l_ac].sfjb011,g_sfjb_d[l_ac].sfjb012) THEN
                  LET g_sfjb_d[l_ac].sfjb012 = g_sfjb_d_t.sfjb012
                  NEXT FIELD CURRENT
               END IF
            END IF       
            CALL s_desc_get_locator_desc(g_site,g_sfjb_d[l_ac].sfjb011,g_sfjb_d[l_ac].sfjb012)
            RETURNING g_sfjb_d[l_ac].sfjb012_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb012
            #add-point:BEFORE FIELD sfjb012 name="input.b.page1.sfjb012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb012
            #add-point:ON CHANGE sfjb012 name="input.g.page1.sfjb012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb013
            #add-point:BEFORE FIELD sfjb013 name="input.b.page1.sfjb013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb013
            
            #add-point:AFTER FIELD sfjb013 name="input.a.page1.sfjb013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb013
            #add-point:ON CHANGE sfjb013 name="input.g.page1.sfjb013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfjb014
            #add-point:BEFORE FIELD sfjb014 name="input.b.page1.sfjb014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfjb014
            
            #add-point:AFTER FIELD sfjb014 name="input.a.page1.sfjb014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfjb014
            #add-point:ON CHANGE sfjb014 name="input.g.page1.sfjb014"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.sfjbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjbseq
            #add-point:ON ACTION controlp INFIELD sfjbseq name="input.c.page1.sfjbseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb019
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb019
            #add-point:ON ACTION controlp INFIELD sfjb019 name="input.c.page1.sfjb019"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfjb_d[l_ac].sfjb019             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #


            CALL q_srac004_2()                                #呼叫開窗

            LET g_sfjb_d[l_ac].sfjb019 = g_qryparam.return1
            LET g_sfjb_d[l_ac].sfjb016 = g_qryparam.return2
            LET g_sfjb_d[l_ac].sfjb016_desc = g_qryparam.return3
            LET g_sfjb_d[l_ac].sfjb016_desc_1 = g_qryparam.return4
            LET g_sfjb_d[l_ac].sfjb017 = g_qryparam.return5
            LET g_sfjb_d[l_ac].sfjb018 = g_qryparam.return6

#            DISPLAY g_sfjb_d[l_ac].sfjb019 TO sfjb016              #
#            DISPLAY g_qryparam.return1,g_qryparam.return2,g_qryparam.return3,g_qryparam.return4,g_qryparam.return5,g_qryparam.return6 TO sfjb019,sfjb016,sfjb016_desc,sfjb016_desc_1,sfjb017,sfjb018   #顯示到畫面上
            NEXT FIELD sfjb019                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb016
            #add-point:ON ACTION controlp INFIELD sfjb016 name="input.c.page1.sfjb016"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfjb_d[l_ac].sfjb016             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #
 
            CALL q_srac004_2()                                #呼叫開窗
            LET g_sfjb_d[l_ac].sfjb019 = g_qryparam.return1
            LET g_sfjb_d[l_ac].sfjb016 = g_qryparam.return2
            LET g_sfjb_d[l_ac].sfjb016_desc = g_qryparam.return3
            LET g_sfjb_d[l_ac].sfjb016_desc_1 = g_qryparam.return4
            LET g_sfjb_d[l_ac].sfjb017 = g_qryparam.return5
            LET g_sfjb_d[l_ac].sfjb018 = g_qryparam.return6
#            DISPLAY g_qryparam.return1,g_qryparam.return2,g_qryparam.return3,g_qryparam.return4,g_qryparam.return5,g_qryparam.return6 TO sfjb019,sfjb016,sfjb016_desc,sfjb016_desc_1,sfjb017,sfjb018   #顯示到畫面上

            NEXT FIELD sfjb016                          #返回原欄位
 
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb017
            #add-point:ON ACTION controlp INFIELD sfjb017 name="input.c.page1.sfjb017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb018
            #add-point:ON ACTION controlp INFIELD sfjb018 name="input.c.page1.sfjb018"
  
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb003
            #add-point:ON ACTION controlp INFIELD sfjb003 name="input.c.page1.sfjb003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb004
            #add-point:ON ACTION controlp INFIELD sfjb004 name="input.c.page1.sfjb004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb005
            #add-point:ON ACTION controlp INFIELD sfjb005 name="input.c.page1.sfjb005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfba013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfba013
            #add-point:ON ACTION controlp INFIELD sfba013 name="input.c.page1.sfba013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfba016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfba016
            #add-point:ON ACTION controlp INFIELD sfba016 name="input.c.page1.sfba016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfba025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfba025
            #add-point:ON ACTION controlp INFIELD sfba025 name="input.c.page1.sfba025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfba017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfba017
            #add-point:ON ACTION controlp INFIELD sfba017 name="input.c.page1.sfba017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb006
            #add-point:ON ACTION controlp INFIELD sfjb006 name="input.c.page1.sfjb006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb007
            #add-point:ON ACTION controlp INFIELD sfjb007 name="input.c.page1.sfjb007"
#此段落由子樣板a07產生            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfjb_d[l_ac].sfjb007             #給予default值

            #給予arg

            CALL q_ooca001_1()                                #呼叫開窗

            LET g_sfjb_d[l_ac].sfjb007 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfjb_d[l_ac].sfjb007 TO sfjb007              #顯示到畫面上

            NEXT FIELD sfjb007                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb008
            #add-point:ON ACTION controlp INFIELD sfjb008 name="input.c.page1.sfjb008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb009
            #add-point:ON ACTION controlp INFIELD sfjb009 name="input.c.page1.sfjb009"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfjb_d[l_ac].sfjb009             #給予default值

            #給予arg
            LET g_qryparam.arg1 = '227'
            CALL q_oocq002()

            LET g_sfjb_d[l_ac].sfjb009 = g_qryparam.return1              #將開窗取得的值回傳到變數

            NEXT FIELD sfjb009                                           #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb010
            #add-point:ON ACTION controlp INFIELD sfjb010 name="input.c.page1.sfjb010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb011
            #add-point:ON ACTION controlp INFIELD sfjb011 name="input.c.page1.sfjb011"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfjb_d[l_ac].sfjb011       #給予default值

            #給予arg

            CALL q_inaa001_2()

            LET g_sfjb_d[l_ac].sfjb011 = g_qryparam.return1        #將開窗取得的值回傳到變數

            DISPLAY g_sfjb_d[l_ac].sfjb011 TO sfjb011              #顯示到畫面上

            NEXT FIELD sfjb011                                     #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb012
            #add-point:ON ACTION controlp INFIELD sfjb012 name="input.c.page1.sfjb012"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfjb_d[l_ac].sfjb012                #給予default值
            
            SELECT inaa007 INTO l_inaa007 FROM inaa_t WHERE inaaent = g_enterprise AND inaasite = g_site AND inaa001 = g_sfjb_d[l_ac].sfjb011
       
            #輸入的庫位在[T:庫位基本資料檔].[C:儲位管理]='1',則輸入的庫位+儲位必須存在[T:儲位基本資料檔]中 
            IF l_inaa007 = '1' THEN
               LET g_qryparam.where = " inab001 = '",g_sfjb_d[l_ac].sfjb011,"' "
               CALL q_inab002()
               LET g_sfjb_d[l_ac].sfjb012 = g_qryparam.return1              #將開窗取得的值回傳到變數
            END IF
            
            #輸入的庫位在[T:庫位基本資料檔].[C:儲位管理]='3'(依供應商編號)
            #則輸入的儲位編號必須存在[T:交易對象主檔]中，且[T:交易對象主檔].[C:交易對象類型]='1' or '3' 
            IF l_inaa007 = '3' THEN
               LET g_qryparam.where = " (pmaa002 = '1' OR pmaa002 ='3') "
               CALL q_pmaa001()
               LET g_sfjb_d[l_ac].sfjb012 = g_qryparam.return1              #將開窗取得的值回傳到變數
            END IF
            
            #輸入的庫位在[T:庫位基本資料檔].[C:儲位管理]='4'(依客戶編號)
            #則輸入的儲位編號必須存在[T:交易對象主檔]中，且[T:交易對象主檔].[C:交易對象類型]='2' or '3'
            IF l_inaa007 = '4' THEN
               LET g_qryparam.where = " (pmaa002 = '2' OR pmaa002 ='3') "
               CALL q_pmaa001()
               LET g_sfjb_d[l_ac].sfjb012 = g_qryparam.return1              #將開窗取得的值回傳到變數
            END IF 
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb013
            #add-point:ON ACTION controlp INFIELD sfjb013 name="input.c.page1.sfjb013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfjb014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfjb014
            #add-point:ON ACTION controlp INFIELD sfjb014 name="input.c.page1.sfjb014"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_sfjb_d[l_ac].* = g_sfjb_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE asrt339_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_sfjb_d[l_ac].sfjbseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_sfjb_d[l_ac].* = g_sfjb_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               IF (g_sfjb_d[l_ac].sfjb010 = '2' OR g_sfjb_d[l_ac].sfjb010 = '3') AND g_sfjb_d[l_ac].sfjb011 IS NULL THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = ''
                  LET g_errparam.code   = 'asf-00455' 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
               END IF
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL asrt339_sfjb_t_mask_restore('restore_mask_o')
      
               UPDATE sfjb_t SET (sfjbdocno,sfjbseq,sfjb019,sfjb016,sfjb017,sfjb018,sfjb003,sfjb004, 
                   sfjb005,sfjb006,sfjb007,sfjb008,sfjb009,sfjb010,sfjb011,sfjb012,sfjb013,sfjb014) = (g_sfja_m.sfjadocno, 
                   g_sfjb_d[l_ac].sfjbseq,g_sfjb_d[l_ac].sfjb019,g_sfjb_d[l_ac].sfjb016,g_sfjb_d[l_ac].sfjb017, 
                   g_sfjb_d[l_ac].sfjb018,g_sfjb_d[l_ac].sfjb003,g_sfjb_d[l_ac].sfjb004,g_sfjb_d[l_ac].sfjb005, 
                   g_sfjb_d[l_ac].sfjb006,g_sfjb_d[l_ac].sfjb007,g_sfjb_d[l_ac].sfjb008,g_sfjb_d[l_ac].sfjb009, 
                   g_sfjb_d[l_ac].sfjb010,g_sfjb_d[l_ac].sfjb011,g_sfjb_d[l_ac].sfjb012,g_sfjb_d[l_ac].sfjb013, 
                   g_sfjb_d[l_ac].sfjb014)
                WHERE sfjbent = g_enterprise AND sfjbdocno = g_sfja_m.sfjadocno 
 
                  AND sfjbseq = g_sfjb_d_t.sfjbseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_sfjb_d[l_ac].* = g_sfjb_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfjb_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_sfjb_d[l_ac].* = g_sfjb_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfjb_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfja_m.sfjadocno
               LET gs_keys_bak[1] = g_sfjadocno_t
               LET gs_keys[2] = g_sfjb_d[g_detail_idx].sfjbseq
               LET gs_keys_bak[2] = g_sfjb_d_t.sfjbseq
               CALL asrt339_update_b('sfjb_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL asrt339_sfjb_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_sfjb_d[g_detail_idx].sfjbseq = g_sfjb_d_t.sfjbseq 
 
                  ) THEN
                  LET gs_keys[01] = g_sfja_m.sfjadocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_sfjb_d_t.sfjbseq
 
                  CALL asrt339_key_update_b(gs_keys,'sfjb_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_sfja_m),util.JSON.stringify(g_sfjb_d_t)
               LET g_log2 = util.JSON.stringify(g_sfja_m),util.JSON.stringify(g_sfjb_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
#               IF NOT s_asrt339_ins_sfjc(g_sfja_m.sfjadocno,g_sfjb_d_t.sfjbseq,g_sfjb_d[l_ac].*) THEN
#                  LET g_sfjb_d[l_ac].* = g_sfjb_d_t.*
#                  CLOSE asrt339_bcl
#                  CALL s_transaction_end('N','0')
#               ELSE
#                  CALL asrt339_b_fill()
#               END IF 
               IF NOT cl_null(g_sfjb_d[l_ac].ooff013)  THEN
                  CALL s_aooi360_gen('7',g_sfja_m.sfjadocno,g_sfjb_d_t.sfjbseq,' ',' ',' ',' ',' ',' ',' ',' ','4',g_sfjb_d[l_ac].ooff013)
                     RETURNING l_success
               ELSE
                  CALL s_aooi360_del('7',g_sfja_m.sfjadocno,g_sfjb_d_t.sfjbseq,' ',' ',' ',' ',' ',' ',' ',' ','4')
                     RETURNING l_success               
               END IF
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
               END IF
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL asrt339_unlock_b("sfjb_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            CALL s_lot_ins_drop_tmp()
            CALL s_aooi390_drop_tmp_table()   #add--2015/03/19 By shiun
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            CALL s_lot_ins_drop_tmp()
            CALL s_aooi390_drop_tmp_table()   #add--2015/03/19 By shiun
            #end add-point 
    
         ON ACTION controlo    
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_sfjb_d[li_reproduce_target].* = g_sfjb_d[li_reproduce].*
 
               LET g_sfjb_d[li_reproduce_target].sfjbseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_sfjb_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_sfjb_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
      INPUT ARRAY g_sfjb2_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body2.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sfjb2_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL asrt339_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_sfjb2_d.getLength()
            #add-point:資料輸入前 name="input.body2.before_input"
            
            #end add-point
            
         BEFORE INSERT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_sfjb2_d[l_ac].* TO NULL 
            INITIALIZE g_sfjb2_d_t.* TO NULL 
            INITIALIZE g_sfjb2_d_o.* TO NULL 
            #公用欄位給值(單身2)
            
            #自定義預設值(單身2)
            
            #add-point:modify段before備份 name="input.body2.insert.before_bak"
            
            #end add-point
            LET g_sfjb2_d_t.* = g_sfjb2_d[l_ac].*     #新輸入資料
            LET g_sfjb2_d_o.* = g_sfjb2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL asrt339_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body2.insert.after_set_entry_b"
            
            #end add-point
            CALL asrt339_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sfjb2_d[li_reproduce_target].* = g_sfjb2_d[li_reproduce].*
 
               LET g_sfjb2_d[li_reproduce_target].sfjcseq = NULL
               LET g_sfjb2_d[li_reproduce_target].sfjcseq1 = NULL
            END IF
            
 
            #add-point:modify段before insert name="input.body2.before_insert"
            
            #end add-point  
 
         BEFORE ROW     
            #add-point:modify段before row2 name="input.body2.before_row2"
            
            #end add-point  
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac_t = l_ac 
            LET g_detail_idx_list[2] = l_ac
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            LET g_current_page = 2
              
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN asrt339_cl USING g_enterprise,g_sfja_m.sfjadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt339_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt339_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_sfjb2_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_sfjb2_d[l_ac].sfjcseq IS NOT NULL
               AND g_sfjb2_d[l_ac].sfjcseq1 IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_sfjb2_d_t.* = g_sfjb2_d[l_ac].*  #BACKUP
               LET g_sfjb2_d_o.* = g_sfjb2_d[l_ac].*  #BACKUP
               CALL asrt339_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body2.after_set_entry_b"
               
               #end add-point  
               CALL asrt339_set_no_entry_b(l_cmd)
               IF NOT asrt339_lock_b("sfjc_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH asrt339_bcl2 INTO g_sfjb2_d[l_ac].sfjcseq,g_sfjb2_d[l_ac].sfjcseq1,g_sfjb2_d[l_ac].sfjc003, 
                      g_sfjb2_d[l_ac].sfjc004,g_sfjb2_d[l_ac].sfjc010,g_sfjb2_d[l_ac].sfjc005,g_sfjb2_d[l_ac].sfjc006, 
                      g_sfjb2_d[l_ac].sfjc007,g_sfjb2_d[l_ac].sfjc008,g_sfjb2_d[l_ac].sfjc009,g_sfjb2_d[l_ac].sfjc011, 
                      g_sfjb2_d[l_ac].sfjc012,g_sfjb2_d[l_ac].sfjc013,g_sfjb2_d[l_ac].sfjc014
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_sfjb2_d_mask_o[l_ac].* =  g_sfjb2_d[l_ac].*
                  CALL asrt339_sfjc_t_mask()
                  LET g_sfjb2_d_mask_n[l_ac].* =  g_sfjb2_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL asrt339_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body2.before_row"
            
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
 
            #其他table進行lock
            
 
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' THEN
               LET l_cmd='d'
               #add-point:單身AFTER DELETE (=d) name="input.body2.after_delete_d"
               
               #end add-point
            ELSE
               #add-point:單身刪除前 name="input.body2.b_delete_ask"
               
               #end add-point 
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "" 
                  LET g_errparam.code = -263 
                  LET g_errparam.popup = TRUE 
                  CALL cl_err()
                  CANCEL DELETE
               END IF
               
               #add-point:單身2刪除前 name="input.body2.b_delete"
               
               #end add-point    
                  
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_sfja_m.sfjadocno
               LET gs_keys[gs_keys.getLength()+1] = g_sfjb2_d_t.sfjcseq
               LET gs_keys[gs_keys.getLength()+1] = g_sfjb2_d_t.sfjcseq1
            
               #刪除同層單身
               IF NOT asrt339_delete_b('sfjc_t',gs_keys,"'2'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt339_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT asrt339_key_delete_b(gs_keys,'sfjc_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt339_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身2刪除中 name="input.body2.m_delete"
               
               #end add-point    
               
               CALL s_transaction_end('Y','0')
               CLOSE asrt339_bcl
 
               LET g_rec_b = g_rec_b-1
               #add-point:單身2刪除後 name="input.body2.a_delete"
               
               #end add-point
               LET l_count = g_sfjb_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body2.after_delete"
               
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_sfjb2_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
         AFTER INSERT    
            LET l_insert = FALSE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CALL cl_err()
               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            #add-point:單身2新增前 name="input.body2.b_a_insert"
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM sfjc_t 
             WHERE sfjcent = g_enterprise AND sfjcdocno = g_sfja_m.sfjadocno
               AND sfjcseq = g_sfjb2_d[l_ac].sfjcseq
               AND sfjcseq1 = g_sfjb2_d[l_ac].sfjcseq1
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body2.b_insert"
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfja_m.sfjadocno
               LET gs_keys[2] = g_sfjb2_d[g_detail_idx].sfjcseq
               LET gs_keys[3] = g_sfjb2_d[g_detail_idx].sfjcseq1
               CALL asrt339_insert_b('sfjc_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2 name="input.body2.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_sfjb_d[l_ac].* TO NULL
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sfjc_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL asrt339_b_fill()
               #資料多語言用-增/改
               
               #add-point:單身新增後 name="input.body2.after_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0')
               #ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_sfjb2_d[l_ac].* = g_sfjb2_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE asrt339_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_sfjb2_d[l_ac].* = g_sfjb2_d_t.*
            ELSE
               #add-point:單身page2修改前 name="input.body2.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               #將遮罩欄位還原
               CALL asrt339_sfjc_t_mask_restore('restore_mask_o')
                              
               UPDATE sfjc_t SET (sfjcdocno,sfjcseq,sfjcseq1,sfjc003,sfjc004,sfjc010,sfjc005,sfjc006, 
                   sfjc007,sfjc008,sfjc009,sfjc011,sfjc012,sfjc013,sfjc014) = (g_sfja_m.sfjadocno,g_sfjb2_d[l_ac].sfjcseq, 
                   g_sfjb2_d[l_ac].sfjcseq1,g_sfjb2_d[l_ac].sfjc003,g_sfjb2_d[l_ac].sfjc004,g_sfjb2_d[l_ac].sfjc010, 
                   g_sfjb2_d[l_ac].sfjc005,g_sfjb2_d[l_ac].sfjc006,g_sfjb2_d[l_ac].sfjc007,g_sfjb2_d[l_ac].sfjc008, 
                   g_sfjb2_d[l_ac].sfjc009,g_sfjb2_d[l_ac].sfjc011,g_sfjb2_d[l_ac].sfjc012,g_sfjb2_d[l_ac].sfjc013, 
                   g_sfjb2_d[l_ac].sfjc014) #自訂欄位頁簽
                WHERE sfjcent = g_enterprise AND sfjcdocno = g_sfja_m.sfjadocno
                  AND sfjcseq = g_sfjb2_d_t.sfjcseq #項次 
                  AND sfjcseq1 = g_sfjb2_d_t.sfjcseq1
                  
               #add-point:單身page2修改中 name="input.body2.m_update"
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_sfjb2_d[l_ac].* = g_sfjb2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfjc_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_sfjb2_d[l_ac].* = g_sfjb2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfjc_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfja_m.sfjadocno
               LET gs_keys_bak[1] = g_sfjadocno_t
               LET gs_keys[2] = g_sfjb2_d[g_detail_idx].sfjcseq
               LET gs_keys_bak[2] = g_sfjb2_d_t.sfjcseq
               LET gs_keys[3] = g_sfjb2_d[g_detail_idx].sfjcseq1
               LET gs_keys_bak[3] = g_sfjb2_d_t.sfjcseq1
               CALL asrt339_update_b('sfjc_t',gs_keys,gs_keys_bak,"'2'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL asrt339_sfjc_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT (g_sfjb2_d[g_detail_idx].sfjcseq = g_sfjb2_d_t.sfjcseq 
                  AND g_sfjb2_d[g_detail_idx].sfjcseq1 = g_sfjb2_d_t.sfjcseq1 
                  ) THEN
                  LET gs_keys[01] = g_sfja_m.sfjadocno
                  LET gs_keys[gs_keys.getLength()+1] = g_sfjb2_d_t.sfjcseq
                  LET gs_keys[gs_keys.getLength()+1] = g_sfjb2_d_t.sfjcseq1
                  CALL asrt339_key_update_b(gs_keys,'sfjc_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_sfja_m),util.JSON.stringify(g_sfjb2_d_t)
               LET g_log2 = util.JSON.stringify(g_sfja_m),util.JSON.stringify(g_sfjb2_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page2修改後 name="input.body2.a_update"
               
               #end add-point
            END IF
         
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab006_1
            #add-point:BEFORE FIELD srab006_1 name="input.b.page2.srab006_1"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab006_1
            
            #add-point:AFTER FIELD srab006_1 name="input.a.page2.srab006_1"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srab006_1
            #add-point:ON CHANGE srab006_1 name="input.g.page2.srab006_1"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page2.srab006_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab006_1
            #add-point:ON ACTION controlp INFIELD srab006_1 name="input.c.page2.srab006_1"
            
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page2 after_row name="input.body2.after_row"
            
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_sfjb2_d[l_ac].* = g_sfjb2_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE asrt339_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL asrt339_unlock_b("sfjc_t","'2'")
            CALL s_transaction_end('Y','0')
            #add-point:單身page2 after_row2 name="input.body2.after_row2"
            
            #end add-point
 
         AFTER INPUT
            #add-point:input段after input  name="input.body2.after_input"
            
            #end add-point   
    
         ON ACTION controlo
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_sfjb2_d[li_reproduce_target].* = g_sfjb2_d[li_reproduce].*
 
               LET g_sfjb2_d[li_reproduce_target].sfjcseq = NULL
               LET g_sfjb2_d[li_reproduce_target].sfjcseq1 = NULL
            ELSE
               CALL FGL_SET_ARR_CURR(g_sfjb2_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_sfjb2_d.getLength()+1
            END IF
            
      END INPUT
 
      
 
      DISPLAY ARRAY g_sfjb4_d TO s_detail4.* ATTRIBUTES(COUNT=g_rec_b)  
    
         BEFORE ROW
            CALL asrt339_idx_chk()
            LET l_ac = DIALOG.getCurrentRow("s_detail4")
            LET g_detail_idx = l_ac
            
            #add-point:page3, before row動作 name="input.body4.before_row"
            
            #end add-point
            
         BEFORE DISPLAY
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'3',"))
            END IF
            LET g_loc = 'm'
            LET l_ac = DIALOG.getCurrentRow("s_detail4")
            CALL asrt339_idx_chk()
            LET g_current_page = 3
      
         #add-point:page3自定義行為 name="input.body4.action"
         
         #end add-point
      
      END DISPLAY
 
 
 
{</section>}
 
{<section id="asrt339.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      INPUT g_ooff013 FROM FORMONLY.ooff013
         ATTRIBUTE(WITHOUT DEFAULTS)

         #自訂ACTION

         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF

            CALL s_transaction_begin()
            IF NOT cl_null(g_ooff013) THEN
               CALL s_aooi360_gen('6',g_sfja_m.sfjadocno,' ',' ',' ',' ',' ',' ',' ',' ',' ','4',g_ooff013)
                  RETURNING l_success
            ELSE
               CALL s_aooi360_del('6',g_sfja_m.sfjadocno,' ',' ',' ',' ',' ',' ',' ',' ',' ','4')
                  RETURNING l_success
            END IF
            IF NOT l_success THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF

           #controlp
      END INPUT
            
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
         CALL DIALOG.setCurrentRow("s_detail2",g_idx_group.getValue("'2',"))
         CALL DIALOG.setCurrentRow("s_detail4",g_idx_group.getValue("'3',"))
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD sfjadocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD sfjbseq
               WHEN "s_detail2"
                  NEXT FIELD sfjcseq
               WHEN "s_detail4"
                  NEXT FIELD inao000
 
               #add-point:input段modify_detail  name="input.modify_detail.other"
               
               #end add-point  
            END CASE
         END IF
      
      AFTER DIALOG
         #add-point:input段after_dialog name="input.after_dialog"
         
         #end add-point    
         
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang)
 
      ON ACTION controlr
         CALL cl_show_req_fields()
 
      ON ACTION controls
         IF g_header_hidden THEN
            CALL gfrm_curr.setElementHidden("vb_master",0)
            CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
            LET g_header_hidden = 0     #visible
         ELSE
            CALL gfrm_curr.setElementHidden("vb_master",1)
            CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
            LET g_header_hidden = 1     #hidden     
         END IF
 
      ON ACTION accept
         #add-point:input段accept  name="input.accept"
         
         #end add-point    
         ACCEPT DIALOG
        
      ON ACTION cancel      #在dialog button (放棄)
         #add-point:input段cancel name="input.cancel"
         
         #end add-point  
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
         LET g_detail_idx_list[2] = 1
         LET g_detail_idx_list[3] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
         CALL g_curr_diag.setCurrentRow("s_detail4",1)
 
         EXIT DIALOG
 
      ON ACTION close       #在dialog 右上角 (X)
         #add-point:input段close name="input.close"
         
         #end add-point  
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION exit        #toolbar 離開
         #add-point:input段exit name="input.exit"
         
         #end add-point
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         #各個page指標
         LET g_detail_idx_list[1] = 1 
         LET g_detail_idx_list[2] = 1
         LET g_detail_idx_list[3] = 1
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
         CALL g_curr_diag.setCurrentRow("s_detail4",1)
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION asrt339_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   DEFINE l_sfjb002 LIKE sfjb_t.sfjb002
   DEFINE l_sfjb003 LIKE sfjb_t.sfjb003
   DEFINE l_sfjb004 LIKE sfjb_t.sfjb004
   DEFINE l_sfjb005 LIKE sfjb_t.sfjb005
   DEFINE l_sfjb007 LIKE sfjb_t.sfjb007
   DEFINE l_sfjb015 LIKE sfjb_t.sfjb015
   DEFINE l_success LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL asrt339_b_fill() #單身填充
      CALL asrt339_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL asrt339_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   LET g_sfja_m.sfjadocno_desc = s_aooi200_get_slip_desc(g_sfja_m.sfjadocno)
   DISPLAY BY NAME g_sfja_m.sfjadocno_desc

   LET g_sfja_m.sfja001_desc = s_desc_get_person_desc(g_sfja_m.sfja001)
   DISPLAY BY NAME g_sfja_m.sfja001_desc

   LET g_sfja_m.sfja002_desc = s_desc_get_department_desc(g_sfja_m.sfja002)
   DISPLAY BY NAME g_sfja_m.sfja002_desc
   #end add-point
   
   #遮罩相關處理
   LET g_sfja_m_mask_o.* =  g_sfja_m.*
   CALL asrt339_sfja_t_mask()
   LET g_sfja_m_mask_n.* =  g_sfja_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_sfja_m.sfjadocno,g_sfja_m.sfjadocno_desc,g_sfja_m.sfjadocdt,g_sfja_m.sfja003,g_sfja_m.sfja001, 
       g_sfja_m.sfja001_desc,g_sfja_m.sfja002,g_sfja_m.sfja002_desc,g_sfja_m.sfja004,g_sfja_m.sfja005, 
       g_sfja_m.ooff013,g_sfja_m.sfjastus,g_sfja_m.sfjaownid,g_sfja_m.sfjaownid_desc,g_sfja_m.sfjaowndp, 
       g_sfja_m.sfjaowndp_desc,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtid_desc,g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdp_desc, 
       g_sfja_m.sfjacrtdt,g_sfja_m.sfjamodid,g_sfja_m.sfjamodid_desc,g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid, 
       g_sfja_m.sfjacnfid_desc,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid,g_sfja_m.sfjapstid_desc,g_sfja_m.sfjapstdt 
 
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sfja_m.sfjastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_sfjb_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
            CALL s_asrt339_default_sfjb001(g_sfjb001,g_sfjb002,g_sfjb015)
            RETURNING l_sfjb002,l_sfjb015,l_sfjb003,l_sfjb004,l_sfjb005,
                      g_sfjb_d[l_ac].sfba013,g_sfjb_d[l_ac].sfba016,g_sfjb_d[l_ac].sfba017,l_sfjb007
            CALL s_desc_get_item_desc(g_sfjb_d[l_ac].sfjb003)
            RETURNING g_sfjb_d[l_ac].sfjb003_desc,g_sfjb_d[l_ac].sfjb003_desc_1
            CALL s_desc_get_unit_desc(g_sfjb_d[l_ac].sfjb005)
            RETURNING g_sfjb_d[l_ac].sfjb005_desc  
            CALL s_desc_get_unit_desc(g_sfjb_d[l_ac].sfjb007)
            RETURNING g_sfjb_d[l_ac].sfjb007_desc

            CALL s_desc_get_stock_desc(g_site,g_sfjb_d[l_ac].sfjb011)
            RETURNING g_sfjb_d[l_ac].sfjb011_desc
                              
            CALL s_desc_get_locator_desc(g_site,g_sfjb_d[l_ac].sfjb011,g_sfjb_d[l_ac].sfjb012)
            RETURNING g_sfjb_d[l_ac].sfjb012_desc
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfjb_d[l_ac].sfjb009
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='227' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfjb_d[l_ac].sfjb009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfjb_d[l_ac].sfjb009_desc

           CALL s_aooi360_sel('7',g_sfja_m.sfjadocno,g_sfjb_d[l_ac].sfjbseq,'','','','','','','','','4')
                RETURNING l_success,g_sfjb_d[l_ac].ooff013
           DISPLAY g_sfjb_d[l_ac].ooff013 TO FORMONLY.ooff013_1
      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_sfjb2_d.getLength()
      #add-point:show段單身reference name="show.body2.reference"
            CALL s_desc_get_item_desc(g_sfjb2_d[l_ac].sfjc003)
            RETURNING g_sfjb2_d[l_ac].sfjc003_desc,g_sfjb2_d[l_ac].sfjc003_desc_1
            CALL s_desc_get_unit_desc(g_sfjb2_d[l_ac].sfjc005)
            RETURNING g_sfjb2_d[l_ac].sfjc005_desc  
            CALL s_desc_get_unit_desc(g_sfjb2_d[l_ac].sfjc007)
            RETURNING g_sfjb2_d[l_ac].sfjc007_desc

            CALL s_desc_get_stock_desc(g_site,g_sfjb2_d[l_ac].sfjc011)
            RETURNING g_sfjb2_d[l_ac].sfjc011_desc
                              
            CALL s_desc_get_locator_desc(g_site,g_sfjb2_d[l_ac].sfjc011,g_sfjb2_d[l_ac].sfjc012)
            RETURNING g_sfjb2_d[l_ac].sfjc012_desc
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfjb2_d[l_ac].sfjc009
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='227' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfjb2_d[l_ac].sfjc009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfjb2_d[l_ac].sfjc009_desc

      #end add-point
   END FOR
   FOR l_ac = 1 TO g_sfjb4_d.getLength()
      #add-point:show段單身reference name="show.body4.reference"
      CALL s_desc_get_item_desc(g_sfjb4_d[l_ac].inao001)
      RETURNING g_sfjb4_d[l_ac].inao001_desc,g_sfjb4_d[l_ac].inao001_desc_1
      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL asrt339_detail_show()
 
   #add-point:show段之後 name="show.after"
   IF g_sfja_m.sfjadocno IS NOT NULL THEN
      CALL s_aooi360_sel('6',g_sfja_m.sfjadocno,'','','','','','','','','','4')
           RETURNING l_success,g_ooff013
      DISPLAY g_ooff013 TO FORMONLY.ooff013
   END IF
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION asrt339_detail_show()
   #add-point:detail_show段define(客製用) name="detail_show.define_customerization"
   
   #end add-point  
   #add-point:detail_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="detail_show.before"
   
   #end add-point
   
   #add-point:detail_show段之後 name="detail_show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION asrt339_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE sfja_t.sfjadocno 
   DEFINE l_oldno     LIKE sfja_t.sfjadocno 
 
   DEFINE l_master    RECORD LIKE sfja_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE sfjb_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE sfjc_t.* #此變數樣板目前無使用
 
   DEFINE l_detail3    RECORD LIKE inao_t.* #此變數樣板目前無使用
 
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="reproduce.pre_function"
   
   #end add-point
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
   
   LET g_master_insert = FALSE
   
   IF g_sfja_m.sfjadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_sfjadocno_t = g_sfja_m.sfjadocno
 
    
   LET g_sfja_m.sfjadocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_sfja_m.sfjaownid = g_user
      LET g_sfja_m.sfjaowndp = g_dept
      LET g_sfja_m.sfjacrtid = g_user
      LET g_sfja_m.sfjacrtdp = g_dept 
      LET g_sfja_m.sfjacrtdt = cl_get_current()
      LET g_sfja_m.sfjamodid = g_user
      LET g_sfja_m.sfjamoddt = cl_get_current()
      LET g_sfja_m.sfjastus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
      CALL s_lot_clear_detail()
      LET g_sfja_m.sfjadocdt = cl_get_today()
      LET g_sfja_m.sfja003 = cl_get_today()
      LET g_sfja_m.sfja001 = g_user
      LET g_sfja_m.sfja001_desc = s_desc_get_person_desc(g_sfja_m.sfja001)
      DISPLAY BY NAME g_sfja_m.sfja001_desc
      LET g_sfja_m.sfja002 = g_dept
      LET g_sfja_m.sfja002_desc = s_desc_get_department_desc(g_sfja_m.sfja002)
      DISPLAY BY NAME g_sfja_m.sfja001_desc,g_sfja_m.sfja002_desc
      LET g_sfja_m.sfjastus = 'N'
      CALL s_lot_clear_detail()
      LET g_sfja_m.sfjapstid = ""
      LET g_sfja_m.sfjapstdt = "" 
      LET g_sfja_m.sfjacnfid = ""
      LET g_sfja_m.sfjacnfdt = "" 
      LET g_sfja_m_t.* = g_sfja_m.*
      LET g_sfjbseq = NULL
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sfja_m.sfjastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
      LET g_sfja_m.sfjadocno_desc = ''
   DISPLAY BY NAME g_sfja_m.sfjadocno_desc
 
   
   CALL asrt339_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_sfja_m.* TO NULL
      INITIALIZE g_sfjb_d TO NULL
      INITIALIZE g_sfjb2_d TO NULL
      INITIALIZE g_sfjb4_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL asrt339_show()
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = '' 
      LET g_errparam.code = 9001 
      LET g_errparam.popup = FALSE 
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt339_set_act_visible()   
   CALL asrt339_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sfjadocno_t = g_sfja_m.sfjadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " sfjaent = " ||g_enterprise|| " AND",
                      " sfjadocno = '", g_sfja_m.sfjadocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL asrt339_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL asrt339_idx_chk()
   
   LET g_data_owner = g_sfja_m.sfjaownid      
   LET g_data_dept  = g_sfja_m.sfjaowndp
   
   #功能已完成,通報訊息中心
   CALL asrt339_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION asrt339_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE sfjb_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE sfjc_t.* #此變數樣板目前無使用
 
   DEFINE l_detail3    RECORD LIKE inao_t.* #此變數樣板目前無使用
 
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE asrt339_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM sfjb_t
    WHERE sfjbent = g_enterprise AND sfjbdocno = g_sfjadocno_t
 
    INTO TEMP asrt339_detail
 
   #將key修正為調整後   
   UPDATE asrt339_detail 
      #更新key欄位
      SET sfjbdocno = g_sfja_m.sfjadocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO sfjb_t SELECT * FROM asrt339_detail
   
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "reproduce:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #add-point:單身複製中1 name="detail_reproduce.body.table1.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE asrt339_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table2.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM sfjc_t 
    WHERE sfjcent = g_enterprise AND sfjcdocno = g_sfjadocno_t
 
    INTO TEMP asrt339_detail
 
   #將key修正為調整後   
   UPDATE asrt339_detail SET sfjcdocno = g_sfja_m.sfjadocno
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table2.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO sfjc_t SELECT * FROM asrt339_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table2.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE asrt339_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table2.a_insert"
   
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table3.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM inao_t 
    WHERE inaoent = g_enterprise AND inaodocno = g_sfjadocno_t
 
    INTO TEMP asrt339_detail
 
   #將key修正為調整後   
   UPDATE asrt339_detail SET inaodocno = g_sfja_m.sfjadocno
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table3.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO inao_t SELECT * FROM asrt339_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table3.m_insert"
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE asrt339_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table3.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_sfjadocno_t = g_sfja_m.sfjadocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.delete" >}
#+ 資料刪除
PRIVATE FUNCTION asrt339_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point     
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   DEFINE  l_success       LIKE type_t.num5
   
   IF g_sfja_m.sfjastus <> 'N' THEN
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "apm-00034" 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()   
      RETURN
   END IF 
   #end add-point     
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   IF g_sfja_m.sfjadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN asrt339_cl USING g_enterprise,g_sfja_m.sfjadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt339_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE asrt339_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE asrt339_master_referesh USING g_sfja_m.sfjadocno INTO g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt, 
       g_sfja_m.sfja003,g_sfja_m.sfja001,g_sfja_m.sfja002,g_sfja_m.sfja004,g_sfja_m.sfja005,g_sfja_m.sfjastus, 
       g_sfja_m.sfjaownid,g_sfja_m.sfjaowndp,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdt, 
       g_sfja_m.sfjamodid,g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid, 
       g_sfja_m.sfjapstdt,g_sfja_m.sfjaownid_desc,g_sfja_m.sfjaowndp_desc,g_sfja_m.sfjacrtid_desc,g_sfja_m.sfjacrtdp_desc, 
       g_sfja_m.sfjamodid_desc,g_sfja_m.sfjacnfid_desc,g_sfja_m.sfjapstid_desc
   
   
   #檢查是否允許此動作
   IF NOT asrt339_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_sfja_m_mask_o.* =  g_sfja_m.*
   CALL asrt339_sfja_t_mask()
   LET g_sfja_m_mask_n.* =  g_sfja_m.*
   
   CALL asrt339_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL asrt339_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_sfjadocno_t = g_sfja_m.sfjadocno
 
 
      DELETE FROM sfja_t
       WHERE sfjaent = g_enterprise AND sfjadocno = g_sfja_m.sfjadocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_sfja_m.sfjadocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_del_docno(g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt) THEN CALL s_transaction_end('N','0') RETURN END IF 
      IF NOT s_aooi360_del('8',g_sfja_m.sfjadocno,' ',' ',' ',' ',' ',' ',' ',' ',' ','4') THEN CALL s_transaction_end('N','0') RETURN END IF       
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM sfjb_t
       WHERE sfjbent = g_enterprise AND sfjbdocno = g_sfja_m.sfjadocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfjb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
 
      #end add-point
      
            
                                                               
      #add-point:單身刪除前 name="delete.body.b_delete2"
      
      #end add-point
      DELETE FROM sfjc_t
       WHERE sfjcent = g_enterprise AND
             sfjcdocno = g_sfja_m.sfjadocno
      #add-point:單身刪除中 name="delete.body.m_delete2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfjc_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete2"
      
      #end add-point
 
      #add-point:單身刪除前 name="delete.body.b_delete3"
      
      #end add-point
      DELETE FROM inao_t
       WHERE inaoent = g_enterprise AND
             inaodocno = g_sfja_m.sfjadocno
      #add-point:單身刪除中 name="delete.body.m_delete3"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "inao_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete3"
      
      #end add-point
 
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_sfja_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE asrt339_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_sfjb_d.clear() 
      CALL g_sfjb2_d.clear()       
      CALL g_sfjb4_d.clear()       
 
     
      CALL asrt339_ui_browser_refresh()  
      #CALL asrt339_ui_headershow()  
      #CALL asrt339_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
      
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL asrt339_browser_fill("")
         CALL asrt339_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE asrt339_cl
 
   #功能已完成,通報訊息中心
   CALL asrt339_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="asrt339.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION asrt339_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_sfjb002 LIKE sfjb_t.sfjb002
   DEFINE l_sfjb003 LIKE sfjb_t.sfjb003
   DEFINE l_sfjb004 LIKE sfjb_t.sfjb004
   DEFINE l_sfjb005 LIKE sfjb_t.sfjb005
   DEFINE l_sfjb007 LIKE sfjb_t.sfjb007
   DEFINE l_sfjb015 LIKE sfjb_t.sfjb015
   DEFINE l_success LIKE type_t.num5
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_sfjb_d.clear()
   CALL g_sfjb2_d.clear()
   CALL g_sfjb4_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF asrt339_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT sfjbseq,sfjb019,sfjb016,sfjb017,sfjb018,sfjb003,sfjb004,sfjb005, 
             sfjb006,sfjb007,sfjb008,sfjb009,sfjb010,sfjb011,sfjb012,sfjb013,sfjb014 ,t1.imaal003 ,t2.imaal003 , 
             t3.oocal003 ,t5.oocql004 FROM sfjb_t",   
                     " INNER JOIN sfja_t ON sfjaent = " ||g_enterprise|| " AND sfjadocno = sfjbdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN imaal_t t1 ON t1.imaalent="||g_enterprise||" AND t1.imaal001=sfjb016 AND t1.imaal002='"||g_dlang||"' ",
               " LEFT JOIN imaal_t t2 ON t2.imaalent="||g_enterprise||" AND t2.imaal001=sfjb003 AND t2.imaal002='"||g_dlang||"' ",
               " LEFT JOIN oocal_t t3 ON t3.oocalent="||g_enterprise||" AND t3.oocal001=sfjb005 AND t3.oocal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t5 ON t5.oocqlent="||g_enterprise||" AND t5.oocql001='227' AND t5.oocql002=sfjb009 AND t5.oocql003='"||g_dlang||"' ",
 
                     " WHERE sfjbent=? AND sfjbdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY sfjb_t.sfjbseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE asrt339_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR asrt339_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_sfja_m.sfjadocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_sfja_m.sfjadocno INTO g_sfjb_d[l_ac].sfjbseq,g_sfjb_d[l_ac].sfjb019, 
          g_sfjb_d[l_ac].sfjb016,g_sfjb_d[l_ac].sfjb017,g_sfjb_d[l_ac].sfjb018,g_sfjb_d[l_ac].sfjb003, 
          g_sfjb_d[l_ac].sfjb004,g_sfjb_d[l_ac].sfjb005,g_sfjb_d[l_ac].sfjb006,g_sfjb_d[l_ac].sfjb007, 
          g_sfjb_d[l_ac].sfjb008,g_sfjb_d[l_ac].sfjb009,g_sfjb_d[l_ac].sfjb010,g_sfjb_d[l_ac].sfjb011, 
          g_sfjb_d[l_ac].sfjb012,g_sfjb_d[l_ac].sfjb013,g_sfjb_d[l_ac].sfjb014,g_sfjb_d[l_ac].sfjb016_desc, 
          g_sfjb_d[l_ac].sfjb003_desc,g_sfjb_d[l_ac].sfjb005_desc,g_sfjb_d[l_ac].sfjb009_desc   #(ver:78) 
 
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
            CALL s_asrt339_default_sfjb001(g_sfjb001,g_sfjb002,g_sfjb015)
            RETURNING l_sfjb002,l_sfjb015,l_sfjb003,l_sfjb004,l_sfjb005,
                      g_sfjb_d[l_ac].sfba013,g_sfjb_d[l_ac].sfba016,g_sfjb_d[l_ac].sfba017,l_sfjb007
            CALL s_desc_get_item_desc(g_sfjb_d[l_ac].sfjb003)
            RETURNING g_sfjb_d[l_ac].sfjb003_desc,g_sfjb_d[l_ac].sfjb003_desc_1
            CALL s_desc_get_unit_desc(g_sfjb_d[l_ac].sfjb005)
            RETURNING g_sfjb_d[l_ac].sfjb005_desc  
            CALL s_desc_get_unit_desc(g_sfjb_d[l_ac].sfjb007)
            RETURNING g_sfjb_d[l_ac].sfjb007_desc

            CALL s_desc_get_stock_desc(g_site,g_sfjb_d[l_ac].sfjb011)
            RETURNING g_sfjb_d[l_ac].sfjb011_desc
                              
            CALL s_desc_get_locator_desc(g_site,g_sfjb_d[l_ac].sfjb011,g_sfjb_d[l_ac].sfjb012)
            RETURNING g_sfjb_d[l_ac].sfjb012_desc
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfjb_d[l_ac].sfjb009
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='227' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfjb_d[l_ac].sfjb009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfjb_d[l_ac].sfjb009_desc

           CALL s_aooi360_sel('7',g_sfja_m.sfjadocno,g_sfjb_d[l_ac].sfjbseq,'','','','','','','','','4')
                RETURNING l_success,g_sfjb_d[l_ac].ooff013
           DISPLAY g_sfjb_d[l_ac].ooff013 TO FORMONLY.ooff013
         #end add-point
      
         IF l_ac > g_max_rec THEN
            IF g_error_show = 1 THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_ac
               LET g_errparam.code = 9035 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
            END IF
            EXIT FOREACH
         END IF
         
         LET l_ac = l_ac + 1
      END FOREACH
      LET g_error_show = 0
   
   END IF
    
   #判斷是否填充
   IF asrt339_fill_chk(2) THEN
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
         #add-point:b_fill段long_sql_if name="b_fill.body2.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT sfjcseq,sfjcseq1,sfjc003,sfjc004,sfjc010,sfjc005,sfjc006,sfjc007, 
             sfjc008,sfjc009,sfjc011,sfjc012,sfjc013,sfjc014 ,t8.imaal003 ,t9.oocal003 ,t11.oocql004 FROM sfjc_t", 
                
                     " INNER JOIN  sfja_t ON sfjaent = " ||g_enterprise|| " AND sfjadocno = sfjcdocno ",
 
                     "",
                     
                                    " LEFT JOIN imaal_t t8 ON t8.imaalent="||g_enterprise||" AND t8.imaal001=sfjc003 AND t8.imaal002='"||g_dlang||"' ",
               " LEFT JOIN oocal_t t9 ON t9.oocalent="||g_enterprise||" AND t9.oocal001=sfjc005 AND t9.oocal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t11 ON t11.oocqlent="||g_enterprise||" AND t11.oocql001='227' AND t11.oocql002=sfjc009 AND t11.oocql003='"||g_dlang||"' ",
 
                     " WHERE sfjcent=? AND sfjcdocno=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body2.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY sfjc_t.sfjcseq,sfjc_t.sfjcseq1"
         
         #add-point:單身填充控制 name="b_fill.sql2"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE asrt339_pb2 FROM g_sql
         DECLARE b_fill_cs2 CURSOR FOR asrt339_pb2
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs2 USING g_enterprise,g_sfja_m.sfjadocno   #(ver:78)
                                               
      FOREACH b_fill_cs2 USING g_enterprise,g_sfja_m.sfjadocno INTO g_sfjb2_d[l_ac].sfjcseq,g_sfjb2_d[l_ac].sfjcseq1, 
          g_sfjb2_d[l_ac].sfjc003,g_sfjb2_d[l_ac].sfjc004,g_sfjb2_d[l_ac].sfjc010,g_sfjb2_d[l_ac].sfjc005, 
          g_sfjb2_d[l_ac].sfjc006,g_sfjb2_d[l_ac].sfjc007,g_sfjb2_d[l_ac].sfjc008,g_sfjb2_d[l_ac].sfjc009, 
          g_sfjb2_d[l_ac].sfjc011,g_sfjb2_d[l_ac].sfjc012,g_sfjb2_d[l_ac].sfjc013,g_sfjb2_d[l_ac].sfjc014, 
          g_sfjb2_d[l_ac].sfjc003_desc,g_sfjb2_d[l_ac].sfjc005_desc,g_sfjb2_d[l_ac].sfjc009_desc   #(ver:78) 
 
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill2.fill"
            CALL s_desc_get_item_desc(g_sfjb2_d[l_ac].sfjc003)
            RETURNING g_sfjb2_d[l_ac].sfjc003_desc,g_sfjb2_d[l_ac].sfjc003_desc_1
            CALL s_desc_get_unit_desc(g_sfjb2_d[l_ac].sfjc005)
            RETURNING g_sfjb2_d[l_ac].sfjc005_desc  
            CALL s_desc_get_unit_desc(g_sfjb2_d[l_ac].sfjc007)
            RETURNING g_sfjb2_d[l_ac].sfjc007_desc

            CALL s_desc_get_stock_desc(g_site,g_sfjb2_d[l_ac].sfjc011)
            RETURNING g_sfjb2_d[l_ac].sfjc011_desc
                              
            CALL s_desc_get_locator_desc(g_site,g_sfjb2_d[l_ac].sfjc011,g_sfjb2_d[l_ac].sfjc012)
            RETURNING g_sfjb2_d[l_ac].sfjc012_desc
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfjb2_d[l_ac].sfjc009
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='227' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfjb2_d[l_ac].sfjc009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfjb2_d[l_ac].sfjc009_desc
         #end add-point
      
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_ac
            LET g_errparam.code = 9035 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
         
      END FOREACH
   END IF
 
   #判斷是否填充
   IF asrt339_fill_chk(3) THEN
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
         #add-point:b_fill段long_sql_if name="b_fill.body3.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT inao000,inao013,inaoseq,inaoseq1,inaoseq2,inao001,inao008,inao009, 
             inao010,inao012 ,t13.imaal003 FROM inao_t",   
                     " INNER JOIN  sfja_t ON sfjaent = " ||g_enterprise|| " AND sfjadocno = inaodocno ",
 
                     "",
                     
                                    " LEFT JOIN imaal_t t13 ON t13.imaalent="||g_enterprise||" AND t13.imaal001=inao001 AND imnaal002='"||g_dlang||"' ",
 
                     " WHERE inaoent=? AND inaodocno=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body3.fill_sql"
      LET g_sql = g_sql," AND inao000 ='2' "
         #end add-point
         IF NOT cl_null(g_wc2_table3) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table3 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY inao_t.inaoseq,inao_t.inaoseq1,inao_t.inaoseq2,inao_t.inao000,inao_t.inao013"
         
         #add-point:單身填充控制 name="b_fill.sql3"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE asrt339_pb3 FROM g_sql
         DECLARE b_fill_cs3 CURSOR FOR asrt339_pb3
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs3 USING g_enterprise,g_sfja_m.sfjadocno   #(ver:78)
                                               
      FOREACH b_fill_cs3 USING g_enterprise,g_sfja_m.sfjadocno INTO g_sfjb4_d[l_ac].inao000,g_sfjb4_d[l_ac].inao013, 
          g_sfjb4_d[l_ac].inaoseq,g_sfjb4_d[l_ac].inaoseq1,g_sfjb4_d[l_ac].inaoseq2,g_sfjb4_d[l_ac].inao001, 
          g_sfjb4_d[l_ac].inao008,g_sfjb4_d[l_ac].inao009,g_sfjb4_d[l_ac].inao010,g_sfjb4_d[l_ac].inao012, 
          g_sfjb4_d[l_ac].inao001_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill3.fill"
            CALL s_desc_get_item_desc(g_sfjb4_d[l_ac].inao001)
            RETURNING g_sfjb4_d[l_ac].inao001_desc,g_sfjb4_d[l_ac].inao001_desc_1
         #end add-point
      
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_ac
            LET g_errparam.code = 9035 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
         
      END FOREACH
   END IF
 
 
   
   #add-point:browser_fill段其他table處理 name="browser_fill.other_fill"
   
   #end add-point
   
   CALL g_sfjb_d.deleteElement(g_sfjb_d.getLength())
   CALL g_sfjb2_d.deleteElement(g_sfjb2_d.getLength())
   CALL g_sfjb4_d.deleteElement(g_sfjb4_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE asrt339_pb
   FREE asrt339_pb2
 
   FREE asrt339_pb3
 
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_sfjb_d.getLength()
      LET g_sfjb_d_mask_o[l_ac].* =  g_sfjb_d[l_ac].*
      CALL asrt339_sfjb_t_mask()
      LET g_sfjb_d_mask_n[l_ac].* =  g_sfjb_d[l_ac].*
   END FOR
   
   LET g_sfjb2_d_mask_o.* =  g_sfjb2_d.*
   FOR l_ac = 1 TO g_sfjb2_d.getLength()
      LET g_sfjb2_d_mask_o[l_ac].* =  g_sfjb2_d[l_ac].*
      CALL asrt339_sfjc_t_mask()
      LET g_sfjb2_d_mask_n[l_ac].* =  g_sfjb2_d[l_ac].*
   END FOR
   LET g_sfjb4_d_mask_o.* =  g_sfjb4_d.*
   FOR l_ac = 1 TO g_sfjb4_d.getLength()
      LET g_sfjb4_d_mask_o[l_ac].* =  g_sfjb4_d[l_ac].*
      CALL asrt339_inao_t_mask()
      LET g_sfjb4_d_mask_n[l_ac].* =  g_sfjb4_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION asrt339_delete_b(ps_table,ps_keys_bak,ps_page)
   #add-point:delete_b段define(客製用) name="delete_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="delete_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE  
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete"
      
      #end add-point    
      DELETE FROM sfjb_t
       WHERE sfjbent = g_enterprise AND
         sfjbdocno = ps_keys_bak[1] AND sfjbseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中 name="delete_b.m_delete"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = ":",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_sfjb_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete2"
      
      #end add-point    
      DELETE FROM sfjc_t
       WHERE sfjcent = g_enterprise AND
             sfjcdocno = ps_keys_bak[1] AND sfjcseq = ps_keys_bak[2] AND sfjcseq1 = ps_keys_bak[3]
      #add-point:delete_b段刪除中 name="delete_b.m_delete2"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfjc_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_sfjb2_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete2"
      
      #end add-point    
   END IF
 
   LET ls_group = "'3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete3"
      
      #end add-point    
      DELETE FROM inao_t
       WHERE inaoent = g_enterprise AND
             inaodocno = ps_keys_bak[1] AND inaoseq = ps_keys_bak[2] AND inaoseq1 = ps_keys_bak[3] AND inaoseq2 = ps_keys_bak[4] AND inao000 = ps_keys_bak[5] AND inao013 = ps_keys_bak[6]
      #add-point:delete_b段刪除中 name="delete_b.m_delete3"
      
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "inao_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'3'" THEN 
         CALL g_sfjb4_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete3"
      
      #end add-point    
   END IF
 
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION asrt339_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE ls_page     STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:insert_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="insert_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE  
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert"
 
      #end add-point 
      INSERT INTO sfjb_t
                  (sfjbent,
                   sfjbdocno,
                   sfjbseq
                   ,sfjb019,sfjb016,sfjb017,sfjb018,sfjb003,sfjb004,sfjb005,sfjb006,sfjb007,sfjb008,sfjb009,sfjb010,sfjb011,sfjb012,sfjb013,sfjb014) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_sfjb_d[g_detail_idx].sfjb019,g_sfjb_d[g_detail_idx].sfjb016,g_sfjb_d[g_detail_idx].sfjb017, 
                       g_sfjb_d[g_detail_idx].sfjb018,g_sfjb_d[g_detail_idx].sfjb003,g_sfjb_d[g_detail_idx].sfjb004, 
                       g_sfjb_d[g_detail_idx].sfjb005,g_sfjb_d[g_detail_idx].sfjb006,g_sfjb_d[g_detail_idx].sfjb007, 
                       g_sfjb_d[g_detail_idx].sfjb008,g_sfjb_d[g_detail_idx].sfjb009,g_sfjb_d[g_detail_idx].sfjb010, 
                       g_sfjb_d[g_detail_idx].sfjb011,g_sfjb_d[g_detail_idx].sfjb012,g_sfjb_d[g_detail_idx].sfjb013, 
                       g_sfjb_d[g_detail_idx].sfjb014)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
       IF g_sfjb_d[g_detail_idx].sfjb004 IS NULL THEN LET g_sfjb_d[g_detail_idx].sfjb004 = ' ' END IF
       INSERT INTO sfjb_t
                  (sfjbent,sfjbsite,sfjbdocno,sfjbseq,sfjb003,sfjb004,sfjb005,sfjb006,sfjb007,sfjb008,sfjb009,sfjb010,sfjb011,sfjb012,sfjb013,sfjb014) 
            VALUES(g_enterprise,g_site,ps_keys[1],ps_keys[2],
                       g_sfjb_d[g_detail_idx].sfjb003,g_sfjb_d[g_detail_idx].sfjb004,g_sfjb_d[g_detail_idx].sfjb005, 
                       g_sfjb_d[g_detail_idx].sfjb006,g_sfjb_d[g_detail_idx].sfjb007,g_sfjb_d[g_detail_idx].sfjb008, 
                       g_sfjb_d[g_detail_idx].sfjb009,g_sfjb_d[g_detail_idx].sfjb010,g_sfjb_d[g_detail_idx].sfjb011, 
                       g_sfjb_d[g_detail_idx].sfjb012,g_sfjb_d[g_detail_idx].sfjb013,g_sfjb_d[g_detail_idx].sfjb014) 
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfjb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_sfjb_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert2"
      
      #end add-point 
      INSERT INTO sfjc_t
                  (sfjcent,
                   sfjcdocno,
                   sfjcseq,sfjcseq1
                   ,sfjc003,sfjc004,sfjc010,sfjc005,sfjc006,sfjc007,sfjc008,sfjc009,sfjc011,sfjc012,sfjc013,sfjc014) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3]
                   ,g_sfjb2_d[g_detail_idx].sfjc003,g_sfjb2_d[g_detail_idx].sfjc004,g_sfjb2_d[g_detail_idx].sfjc010, 
                       g_sfjb2_d[g_detail_idx].sfjc005,g_sfjb2_d[g_detail_idx].sfjc006,g_sfjb2_d[g_detail_idx].sfjc007, 
                       g_sfjb2_d[g_detail_idx].sfjc008,g_sfjb2_d[g_detail_idx].sfjc009,g_sfjb2_d[g_detail_idx].sfjc011, 
                       g_sfjb2_d[g_detail_idx].sfjc012,g_sfjb2_d[g_detail_idx].sfjc013,g_sfjb2_d[g_detail_idx].sfjc014) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert2"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfjc_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_sfjb2_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert2"
      
      #end add-point
   END IF
 
   LET ls_group = "'3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert3"
      
      #end add-point 
      INSERT INTO inao_t
                  (inaoent,
                   inaodocno,
                   inaoseq,inaoseq1,inaoseq2,inao000,inao013
                   ,inao001,inao008,inao009,inao010,inao012) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3],ps_keys[4],ps_keys[5],ps_keys[6]
                   ,g_sfjb4_d[g_detail_idx].inao001,g_sfjb4_d[g_detail_idx].inao008,g_sfjb4_d[g_detail_idx].inao009, 
                       g_sfjb4_d[g_detail_idx].inao010,g_sfjb4_d[g_detail_idx].inao012)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert3"
      
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "inao_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'3'" THEN 
         CALL g_sfjb4_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert3"
      
      #end add-point
   END IF
 
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION asrt339_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
   #add-point:update_b段define(客製用) name="update_b.define_customerization"
   
   #end add-point   
   DEFINE ps_table         STRING
   DEFINE ps_page          STRING
   DEFINE ps_keys          DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_keys_bak      DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group         STRING
   DEFINE li_idx           LIKE type_t.num10 
   DEFINE lb_chk           BOOLEAN
   DEFINE l_new_key        DYNAMIC ARRAY OF STRING
   DEFINE l_old_key        DYNAMIC ARRAY OF STRING
   DEFINE l_field_key      DYNAMIC ARRAY OF STRING
   #add-point:update_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="update_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="update_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE   
   
   #判斷key是否有改變
   LET lb_chk = TRUE
   FOR li_idx = 1 TO ps_keys.getLength()
      IF ps_keys[li_idx] <> ps_keys_bak[li_idx] THEN
         LET lb_chk = FALSE
         EXIT FOR
      END IF
   END FOR
   
   #不需要做處理
   IF lb_chk THEN
      RETURN
   END IF
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "sfjb_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL asrt339_sfjb_t_mask_restore('restore_mask_o')
               
      UPDATE sfjb_t 
         SET (sfjbdocno,
              sfjbseq
              ,sfjb019,sfjb016,sfjb017,sfjb018,sfjb003,sfjb004,sfjb005,sfjb006,sfjb007,sfjb008,sfjb009,sfjb010,sfjb011,sfjb012,sfjb013,sfjb014) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_sfjb_d[g_detail_idx].sfjb019,g_sfjb_d[g_detail_idx].sfjb016,g_sfjb_d[g_detail_idx].sfjb017, 
                  g_sfjb_d[g_detail_idx].sfjb018,g_sfjb_d[g_detail_idx].sfjb003,g_sfjb_d[g_detail_idx].sfjb004, 
                  g_sfjb_d[g_detail_idx].sfjb005,g_sfjb_d[g_detail_idx].sfjb006,g_sfjb_d[g_detail_idx].sfjb007, 
                  g_sfjb_d[g_detail_idx].sfjb008,g_sfjb_d[g_detail_idx].sfjb009,g_sfjb_d[g_detail_idx].sfjb010, 
                  g_sfjb_d[g_detail_idx].sfjb011,g_sfjb_d[g_detail_idx].sfjb012,g_sfjb_d[g_detail_idx].sfjb013, 
                  g_sfjb_d[g_detail_idx].sfjb014) 
         WHERE sfjbent = g_enterprise AND sfjbdocno = ps_keys_bak[1] AND sfjbseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sfjb_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sfjb_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL asrt339_sfjb_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "sfjc_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update2"
      
      #end add-point  
      
      #將遮罩欄位還原
      CALL asrt339_sfjc_t_mask_restore('restore_mask_o')
               
      UPDATE sfjc_t 
         SET (sfjcdocno,
              sfjcseq,sfjcseq1
              ,sfjc003,sfjc004,sfjc010,sfjc005,sfjc006,sfjc007,sfjc008,sfjc009,sfjc011,sfjc012,sfjc013,sfjc014) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3]
              ,g_sfjb2_d[g_detail_idx].sfjc003,g_sfjb2_d[g_detail_idx].sfjc004,g_sfjb2_d[g_detail_idx].sfjc010, 
                  g_sfjb2_d[g_detail_idx].sfjc005,g_sfjb2_d[g_detail_idx].sfjc006,g_sfjb2_d[g_detail_idx].sfjc007, 
                  g_sfjb2_d[g_detail_idx].sfjc008,g_sfjb2_d[g_detail_idx].sfjc009,g_sfjb2_d[g_detail_idx].sfjc011, 
                  g_sfjb2_d[g_detail_idx].sfjc012,g_sfjb2_d[g_detail_idx].sfjc013,g_sfjb2_d[g_detail_idx].sfjc014)  
 
         WHERE sfjcent = g_enterprise AND sfjcdocno = ps_keys_bak[1] AND sfjcseq = ps_keys_bak[2] AND sfjcseq1 = ps_keys_bak[3]
      #add-point:update_b段修改中 name="update_b.m_update2"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sfjc_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sfjc_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL asrt339_sfjc_t_mask_restore('restore_mask_n')
 
      #add-point:update_b段修改後 name="update_b.after_update2"
      
      #end add-point  
   END IF
 
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
 
   LET ls_group = "'3',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "inao_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update3"
      
      #end add-point  
      
      #將遮罩欄位還原
      CALL asrt339_inao_t_mask_restore('restore_mask_o')
               
      UPDATE inao_t 
         SET (inaodocno,
              inaoseq,inaoseq1,inaoseq2,inao000,inao013
              ,inao001,inao008,inao009,inao010,inao012) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3],ps_keys[4],ps_keys[5],ps_keys[6]
              ,g_sfjb4_d[g_detail_idx].inao001,g_sfjb4_d[g_detail_idx].inao008,g_sfjb4_d[g_detail_idx].inao009, 
                  g_sfjb4_d[g_detail_idx].inao010,g_sfjb4_d[g_detail_idx].inao012) 
         WHERE inaoent = g_enterprise AND inaodocno = ps_keys_bak[1] AND inaoseq = ps_keys_bak[2] AND inaoseq1 = ps_keys_bak[3] AND inaoseq2 = ps_keys_bak[4] AND inao000 = ps_keys_bak[5] AND inao013 = ps_keys_bak[6]
      #add-point:update_b段修改中 name="update_b.m_update3"
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "inao_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "inao_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL asrt339_inao_t_mask_restore('restore_mask_n')
 
      #add-point:update_b段修改後 name="update_b.after_update3"
      
      #end add-point  
   END IF
 
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
 
 
   
 
   
   #add-point:update_b段other name="update_b.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION asrt339_key_update_b(ps_keys_bak,ps_table)
   #add-point:update_b段define(客製用) name="key_update_b.define_customerization"
   
   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_key       DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:update_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_update_b.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="key_update_b.pre_function"
   
   #end add-point
   
 
   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION asrt339_key_delete_b(ps_keys_bak,ps_table)
   #add-point:delete_b段define(客製用) name="key_delete_b.define_customerization"
   
   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_delete_b.define"
   DEFINE l_success   LIKE type_t.num5
   
   DELETE FROM sfjc_t WHERE sfjcent = g_enterprise AND sfjcsite = g_site AND sfjcdocno = ps_keys_bak[1] AND sfjcseq = ps_keys_bak[2]
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "del sfjc_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
   
      RETURN FALSE
   END IF
   CALL s_aooi360_del('7',ps_keys_bak[1],ps_keys_bak[2],' ',' ',' ',' ',' ',' ',' ',' ','4')
      RETURNING l_success
   IF NOT l_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "sfjb_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
   
      RETURN FALSE
   END IF
   CALL asrt339_b_fill()
   #end add-point
   
   #add-point:Function前置處理  name="key_delete_b.pre_function"
   
   #end add-point
   
 
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION asrt339_lock_b(ps_table,ps_page)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"
   
   #end add-point   
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:lock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="lock_b.pre_function"
   
   #end add-point
    
   #先刷新資料
   #CALL asrt339_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "sfjb_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN asrt339_bcl USING g_enterprise,
                                       g_sfja_m.sfjadocno,g_sfjb_d[g_detail_idx].sfjbseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "asrt339_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "sfjc_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN asrt339_bcl2 USING g_enterprise,
                                             g_sfja_m.sfjadocno,g_sfjb2_d[g_detail_idx].sfjcseq,g_sfjb2_d[g_detail_idx].sfjcseq1 
 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "asrt339_bcl2:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
 
   #鎖定整組table
   #LET ls_group = "'3',"
   #僅鎖定自身table
   LET ls_group = "inao_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN asrt339_bcl3 USING g_enterprise,
                                             g_sfja_m.sfjadocno,g_sfjb4_d[g_detail_idx].inaoseq,g_sfjb4_d[g_detail_idx].inaoseq1, 
                                                 g_sfjb4_d[g_detail_idx].inaoseq2,g_sfjb4_d[g_detail_idx].inao000, 
                                                 g_sfjb4_d[g_detail_idx].inao013
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "asrt339_bcl3:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
 
 
   
 
   
   #add-point:lock_b段other name="lock_b.other"
   
   #end add-point  
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION asrt339_unlock_b(ps_table,ps_page)
   #add-point:unlock_b段define(客製用) name="unlock_b.define_customerization"
   
   #end add-point  
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:unlock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="unlock_b.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="unlock_b.pre_function"
   
   #end add-point
    
   LET ls_group = "'1',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE asrt339_bcl
   END IF
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE asrt339_bcl2
   END IF
 
   LET ls_group = "'3',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE asrt339_bcl3
   END IF
 
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION asrt339_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("sfjadocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("sfjadocno",TRUE)
      CALL cl_set_comp_entry("sfjadocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION asrt339_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("sfjadocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("sfjadocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("sfjadocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION asrt339_set_entry_b(p_cmd)
   #add-point:set_entry_b段define(客製用) name="set_entry_b.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry_b.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_entry_b.pre_function"
   
   #end add-point
    
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("",TRUE)
      #add-point:set_entry段欄位控制 name="set_entry_b.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry_b段 name="set_entry_b.set_entry_b"
   CALL cl_set_comp_entry("sfjb007,sfjb008,sfjb011,sfjb012,sfjb013,sfjb014",TRUE) 
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="asrt339.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION asrt339_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point    
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="set_no_entry_b.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF 
   
   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  = 'N' THEN
      CALL cl_set_comp_entry("sfjb007,sfjb008",FALSE)   
   END IF
   IF g_sfjb_d[l_ac].sfjb010 MATCHES '[14]' THEN
      CALL cl_set_comp_entry("sfjb011,sfjb012,sfjb013,sfjb014",FALSE)
   END IF
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="asrt339.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION asrt339_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION asrt339_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_sfja_m.sfjastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF


   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION asrt339_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION asrt339_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION asrt339_default_search()
   #add-point:default_search段define(客製用) name="default_search.define_customerization"
   
   #end add-point  
   DEFINE li_idx     LIKE type_t.num10
   DEFINE li_cnt     LIKE type_t.num10
   DEFINE ls_wc      STRING
   DEFINE la_wc      DYNAMIC ARRAY OF RECORD
          tableid    STRING,
          wc         STRING
          END RECORD
   DEFINE ls_where   STRING
   #add-point:default_search段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="default_search.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="default_search.before"
   
   #end add-point  
   
   LET g_pagestart = 1
   
   IF cl_null(g_order) THEN
      LET g_order = "ASC"
   END IF
   
   IF NOT cl_null(g_argv[01]) THEN
      LET ls_wc = ls_wc, " sfjadocno = '", g_argv[01], "' AND "
   END IF
   
 
   
   #add-point:default_search段after sql name="default_search.after_sql"
   
   #end add-point  
   
   IF NOT cl_null(ls_wc) THEN
      LET g_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_default = TRUE
   ELSE
      #若無外部參數則預設為1=2
      LET g_default = FALSE
      
      #預設查詢條件
      CALL cl_qbe_get_default_qryplan() RETURNING ls_where
      IF NOT cl_null(ls_where) THEN
         CALL util.JSON.parse(ls_where, la_wc)
         INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
         INITIALIZE g_wc2_table2 TO NULL
 
         INITIALIZE g_wc2_table3 TO NULL
 
 
         FOR li_idx = 1 TO la_wc.getLength()
            CASE
               WHEN la_wc[li_idx].tableid = "sfja_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "sfjb_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "sfjc_t" 
                  LET g_wc2_table2 = la_wc[li_idx].wc
 
               WHEN la_wc[li_idx].tableid = "inao_t" 
                  LET g_wc2_table3 = la_wc[li_idx].wc
 
 
               WHEN la_wc[li_idx].tableid = "EXTENDWC"
                  LET g_wc2_extend = la_wc[li_idx].wc
            END CASE
         END FOR
         IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
            OR NOT cl_null(g_wc2_table2)
 
            OR NOT cl_null(g_wc2_table3)
 
 
            OR NOT cl_null(g_wc2_extend)
            THEN
            #組合g_wc2
            IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
               LET g_wc2 = g_wc2_table1
            END IF
            IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
            END IF
 
            IF g_wc2_table3 <> " 1=1" AND NOT cl_null(g_wc2_table3) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_table3
            END IF
 
 
            IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
            END IF
         
            IF g_wc2.subString(1,5) = " AND " THEN
               LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
            END IF
         END IF
      END IF
    
      IF cl_null(g_wc) AND cl_null(g_wc2) THEN
         LET g_wc = " 1=2"
      END IF
   END IF
   
   #add-point:default_search段結束前 name="default_search.after"
   
   #end add-point  
 
   IF g_wc.getIndexOf(" 1=2", 1) THEN
      LET g_default = TRUE
   END IF
 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION asrt339_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_sfja_m.sfjadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN asrt339_cl USING g_enterprise,g_sfja_m.sfjadocno
   IF STATUS THEN
      CLOSE asrt339_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt339_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE asrt339_master_referesh USING g_sfja_m.sfjadocno INTO g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt, 
       g_sfja_m.sfja003,g_sfja_m.sfja001,g_sfja_m.sfja002,g_sfja_m.sfja004,g_sfja_m.sfja005,g_sfja_m.sfjastus, 
       g_sfja_m.sfjaownid,g_sfja_m.sfjaowndp,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdt, 
       g_sfja_m.sfjamodid,g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid, 
       g_sfja_m.sfjapstdt,g_sfja_m.sfjaownid_desc,g_sfja_m.sfjaowndp_desc,g_sfja_m.sfjacrtid_desc,g_sfja_m.sfjacrtdp_desc, 
       g_sfja_m.sfjamodid_desc,g_sfja_m.sfjacnfid_desc,g_sfja_m.sfjapstid_desc
   
 
   #檢查是否允許此動作
   IF NOT asrt339_action_chk() THEN
      CLOSE asrt339_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_sfja_m.sfjadocno,g_sfja_m.sfjadocno_desc,g_sfja_m.sfjadocdt,g_sfja_m.sfja003,g_sfja_m.sfja001, 
       g_sfja_m.sfja001_desc,g_sfja_m.sfja002,g_sfja_m.sfja002_desc,g_sfja_m.sfja004,g_sfja_m.sfja005, 
       g_sfja_m.ooff013,g_sfja_m.sfjastus,g_sfja_m.sfjaownid,g_sfja_m.sfjaownid_desc,g_sfja_m.sfjaowndp, 
       g_sfja_m.sfjaowndp_desc,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtid_desc,g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdp_desc, 
       g_sfja_m.sfjacrtdt,g_sfja_m.sfjamodid,g_sfja_m.sfjamodid_desc,g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid, 
       g_sfja_m.sfjacnfid_desc,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid,g_sfja_m.sfjapstid_desc,g_sfja_m.sfjapstdt 
 
 
   CASE g_sfja_m.sfjastus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "A"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
      WHEN "D"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
      WHEN "R"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
      WHEN "W"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
      WHEN "S"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
      WHEN "Z"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_sfja_m.sfjastus
            
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "A"
               HIDE OPTION "approved"
            WHEN "D"
               HIDE OPTION "withdraw"
            WHEN "R"
               HIDE OPTION "rejection"
            WHEN "W"
               HIDE OPTION "signing"
            WHEN "S"
               HIDE OPTION "posted"
            WHEN "Z"
               HIDE OPTION "unposted"
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
#将一些不能切换的状态给隐藏掉，比如post时只能切confimed，不可切unconfirmed和invalid 
         IF g_sfja_m.sfjastus = 'X' THEN
            RETURN
         END IF
         
         HIDE OPTION "signing"
         HIDE OPTION "withdraw"
         HIDE OPTION "closed"
         HIDE OPTION "hold"
         
         CASE g_sfja_m.sfjastus
            WHEN "N"
               HIDE OPTION "unconfirmed"
               HIDE OPTION "posted"
               HIDE OPTION "unposted"
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
               IF cl_bpm_chk() THEN
                  SHOW OPTION "signing"
                  HIDE OPTION "confirmed"
               END IF
            WHEN "X"
               HIDE OPTION "invalid"
               HIDE OPTION "confirmed"
               HIDE OPTION "posted"
               HIDE OPTION "unposted"               
               HIDE OPTION "hold"
            WHEN "Y"
               HIDE OPTION "confirmed"
               HIDE OPTION "invalid"
               HIDE OPTION "hold"
               HIDE OPTION "unposted"
            WHEN "S"
               HIDE OPTION "posted"
               HIDE OPTION "unconfirmed"
               HIDE OPTION "invalid" 
               HIDE OPTION "confirmed"
               #MOD BY zhujing 2015-6-16 应该根据状态码隐藏posted 和unposted以及withdraw
            WHEN "R"
            #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
               HIDE OPTION "confirmed"
               HIDE OPTION "unconfirmed"
               HIDE OPTION "hold" 
               HIDE OPTION "posted"
               HIDE OPTION "unposted" 
               HIDE OPTION "withdraw"   
            WHEN "D"
            #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
               HIDE OPTION "confirmed"
               HIDE OPTION "unconfirmed"
               HIDE OPTION "hold" 
               HIDE OPTION "posted"
               HIDE OPTION "unposted" 
               HIDE OPTION "withdraw"   
            WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
               SHOW OPTION "withdraw"  
               HIDE OPTION "unconfirmed"
               HIDE OPTION "invalid"
               HIDE OPTION "confirmed"
               HIDE OPTION "hold"
               HIDE OPTION "posted"
               HIDE OPTION "unposted" 
               
            WHEN "A"     #只能顯示確認; 其餘應用功能皆隱藏
               SHOW OPTION "confirmed" 
               HIDE OPTION "unconfirmed"
               HIDE OPTION "invalid"
               HIDE OPTION "hold"        
               HIDE OPTION "posted"
               HIDE OPTION "unposted" 
               HIDE OPTION "withdraw"   
         END CASE  
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT asrt339_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE asrt339_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT asrt339_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE asrt339_cl
            RETURN
         END IF
 
 
 
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
         IF NOT cl_ask_confirm('aim-00110') THEN
            RETURN
         END IF
         IF g_sfja_m.sfjastus NOT MATCHES '[XY]' THEN
            RETURN
         END IF         
         IF g_sfja_m.sfjastus = 'Y' THEN
            CALL s_transaction_begin()         
            IF NOT s_asrt339_unconf_chk(g_sfja_m.sfjadocno) THEN
               LET lc_state = "Y"
               CALL s_transaction_end('N',0)
            ELSE
               IF NOT s_asrt339_unconf_upd(g_sfja_m.sfjadocno) THEN
                  LET lc_state = "Y"
                  CALL s_transaction_end('N',0)
               ELSE
                  LET g_sfja_m.sfjastus = 'N'
                  CALL s_transaction_end('Y',0) 
               END IF        
            END IF
            CALL asrt339_refresh_stus()
            RETURN                
         END IF 
            #end add-point
         END IF
         EXIT MENU
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
         IF NOT cl_ask_confirm('aim-00108') THEN
            RETURN
         END IF
         IF g_sfja_m.sfjastus NOT MATCHES '[NA]' THEN #MOD BY zhujing 2015-6-16 核准状态也可确认
            RETURN
         END IF         
         IF g_sfja_m.sfjastus = 'N' THEN
            CALL s_transaction_begin()         
            IF NOT s_asrt339_conf_chk(g_sfja_m.sfjadocno) THEN
               LET lc_state = "N"
               CALL s_transaction_end('N',0)
            ELSE
               IF NOT s_asrt339_conf_upd(g_sfja_m.sfjadocno) THEN
                  LET lc_state = "N"
                  CALL s_transaction_end('N',0)
               ELSE
                  LET g_sfja_m.sfjastus = 'Y'
                  CALL s_transaction_end('Y',0) 
               END IF        
            END IF
            CALL asrt339_refresh_stus()
            RETURN                
         END IF
            #end add-point
         END IF
         EXIT MENU
      ON ACTION approved
         IF cl_auth_chk_act("approved") THEN
            LET lc_state = "A"
            #add-point:action控制 name="statechange.approved"
            
            #end add-point
         END IF
         EXIT MENU
      #ON ACTION withdraw
      #   IF cl_auth_chk_act("withdraw") THEN
      #      LET lc_state = "D"
      #      #add-point:action控制 name="statechange.withdraw"
      #      
      #      #end add-point
      #   END IF
      #   EXIT MENU
      ON ACTION rejection
         IF cl_auth_chk_act("rejection") THEN
            LET lc_state = "R"
            #add-point:action控制 name="statechange.rejection"
            
            #end add-point
         END IF
         EXIT MENU
      #ON ACTION signing
      #   IF cl_auth_chk_act("signing") THEN
      #      LET lc_state = "W"
      #      #add-point:action控制 name="statechange.signing"
      #      
      #      #end add-point
      #   END IF
      #   EXIT MENU
      ON ACTION posted
         IF cl_auth_chk_act("posted") THEN
            LET lc_state = "S"
            #add-point:action控制 name="statechange.posted"
         IF NOT cl_ask_confirm('sub-00360') THEN
            RETURN
         END IF
#过帐日期录入
         CALL s_asrt339_post_input(g_sfja_m.sfjadocno)
              RETURNING l_success,g_sfja_m.sfja003
         IF NOT l_success THEN
            LET lc_state = "Y"
            RETURN
         END IF
         IF g_sfja_m.sfjastus NOT MATCHES '[Y]' THEN
            RETURN
         END IF         
         IF g_sfja_m.sfjastus = 'Y' THEN
            CALL s_transaction_begin()         
            IF NOT s_asrt339_post_chk(g_sfja_m.sfjadocno) THEN
               LET lc_state = "Y"
               CALL s_transaction_end('N',0)
            ELSE
               IF NOT s_asrt339_post_upd(g_sfja_m.sfjadocno,g_sfja_m.sfja003) THEN
                  LET lc_state = "Y"
                  CALL s_transaction_end('N',0)
               ELSE
                  LET g_sfja_m.sfjastus = 'S'
                  CALL s_transaction_end('Y',0) 
               END IF        
            END IF
            CALL asrt339_refresh_stus()
            RETURN                
         END IF         
            #end add-point
         END IF
         EXIT MENU
      ON ACTION unposted
         IF cl_auth_chk_act("unposted") THEN
            LET lc_state = "Z"
            #add-point:action控制 name="statechange.unposted"
         IF NOT cl_ask_confirm('sub-00361') THEN
            RETURN
         END IF
         LET lc_state = "Y"
         IF g_sfja_m.sfjastus NOT MATCHES '[S]' THEN
            RETURN
         END IF         
         IF g_sfja_m.sfjastus = 'S' THEN
            CALL s_transaction_begin()         
            IF NOT s_asrt339_unpost(g_sfja_m.sfjadocno) THEN
               LET lc_state = "S"
               CALL s_transaction_end('N',0)
            ELSE
               LET g_sfja_m.sfjastus = 'Y'
               CALL s_transaction_end('Y',0)         
            END IF
            CALL asrt339_refresh_stus()
            RETURN                
         END IF
            #end add-point
         END IF
         EXIT MENU
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
         IF NOT cl_ask_confirm('aim-00109') THEN
            RETURN
         END IF
         IF g_sfja_m.sfjastus NOT MATCHES '[N]' THEN
            RETURN
         END IF
            #end add-point
         END IF
         EXIT MENU
 
      #add-point:stus控制 name="statechange.more_control"
      
      #end add-point
      
   END MENU
   
   #確認被選取的狀態碼在清單中
   IF (lc_state <> "N" 
      AND lc_state <> "Y"
      AND lc_state <> "A"
      AND lc_state <> "D"
      AND lc_state <> "R"
      AND lc_state <> "W"
      AND lc_state <> "S"
      AND lc_state <> "Z"
      AND lc_state <> "X"
      ) OR 
      g_sfja_m.sfjastus = lc_state OR cl_null(lc_state) THEN
      CLOSE asrt339_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   
   #end add-point
   
   LET g_sfja_m.sfjamodid = g_user
   LET g_sfja_m.sfjamoddt = cl_get_current()
   LET g_sfja_m.sfjastus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE sfja_t 
      SET (sfjastus,sfjamodid,sfjamoddt) 
        = (g_sfja_m.sfjastus,g_sfja_m.sfjamodid,g_sfja_m.sfjamoddt)     
    WHERE sfjaent = g_enterprise AND sfjadocno = g_sfja_m.sfjadocno
 
    
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
   ELSE
      CASE lc_state
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE asrt339_master_referesh USING g_sfja_m.sfjadocno INTO g_sfja_m.sfjadocno,g_sfja_m.sfjadocdt, 
          g_sfja_m.sfja003,g_sfja_m.sfja001,g_sfja_m.sfja002,g_sfja_m.sfja004,g_sfja_m.sfja005,g_sfja_m.sfjastus, 
          g_sfja_m.sfjaownid,g_sfja_m.sfjaowndp,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdt, 
          g_sfja_m.sfjamodid,g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid, 
          g_sfja_m.sfjapstdt,g_sfja_m.sfjaownid_desc,g_sfja_m.sfjaowndp_desc,g_sfja_m.sfjacrtid_desc, 
          g_sfja_m.sfjacrtdp_desc,g_sfja_m.sfjamodid_desc,g_sfja_m.sfjacnfid_desc,g_sfja_m.sfjapstid_desc 
 
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_sfja_m.sfjadocno,g_sfja_m.sfjadocno_desc,g_sfja_m.sfjadocdt,g_sfja_m.sfja003, 
          g_sfja_m.sfja001,g_sfja_m.sfja001_desc,g_sfja_m.sfja002,g_sfja_m.sfja002_desc,g_sfja_m.sfja004, 
          g_sfja_m.sfja005,g_sfja_m.ooff013,g_sfja_m.sfjastus,g_sfja_m.sfjaownid,g_sfja_m.sfjaownid_desc, 
          g_sfja_m.sfjaowndp,g_sfja_m.sfjaowndp_desc,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtid_desc,g_sfja_m.sfjacrtdp, 
          g_sfja_m.sfjacrtdp_desc,g_sfja_m.sfjacrtdt,g_sfja_m.sfjamodid,g_sfja_m.sfjamodid_desc,g_sfja_m.sfjamoddt, 
          g_sfja_m.sfjacnfid,g_sfja_m.sfjacnfid_desc,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid,g_sfja_m.sfjapstid_desc, 
          g_sfja_m.sfjapstdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE asrt339_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL asrt339_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt339.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION asrt339_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_sfjb_d.getLength() THEN
         LET g_detail_idx = g_sfjb_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sfjb_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sfjb_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_sfjb2_d.getLength() THEN
         LET g_detail_idx = g_sfjb2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sfjb2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sfjb2_d.getLength() TO FORMONLY.cnt
   END IF
   IF g_current_page = 3 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail4")
      IF g_detail_idx > g_sfjb4_d.getLength() THEN
         LET g_detail_idx = g_sfjb4_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sfjb4_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sfjb4_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION asrt339_b_fill2(pi_idx)
   #add-point:b_fill2段define(客製用) name="b_fill2.define_customerization"
   
   #end add-point
   DEFINE pi_idx                 LIKE type_t.num10
   DEFINE li_ac                  LIKE type_t.num10
   DEFINE li_detail_idx_tmp      LIKE type_t.num10
   DEFINE ls_chk                 LIKE type_t.chr1
   #add-point:b_fill2段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill2.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="b_fill2.pre_function"
   
   #end add-point
   
   LET li_ac = l_ac 
   
   IF g_detail_idx <= 0 THEN
      RETURN
   END IF
   
   LET li_detail_idx_tmp = g_detail_idx
   
 
      
 
      
   #add-point:單身填充後 name="b_fill2.after_fill"
   
   #end add-point
    
   LET l_ac = li_ac
   
   CALL asrt339_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION asrt339_fill_chk(ps_idx)
   #add-point:fill_chk段define(客製用) name="fill_chk.define_customerization"
   
   #end add-point
   DEFINE ps_idx        LIKE type_t.chr10
   #add-point:fill_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="fill_chk.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="fill_chk.before_chk"
   
   #end add-point
   
   #此funtion功能暫時停用(2015/1/12)
   #無論傳入值為何皆回傳true(代表要填充該單身)
 
   #全部為1=1 or null時回傳true
   IF (cl_null(g_wc2_table1) OR g_wc2_table1.trim() = '1=1')  AND 
      (cl_null(g_wc2_table2) OR g_wc2_table2.trim() = '1=1')  AND 
      (cl_null(g_wc2_table3) OR g_wc2_table3.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"
      
      #end add-point
      RETURN TRUE
   END IF
   
   #add-point:fill_chk段after_chk name="fill_chk.after_chk"
   
   #end add-point
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="asrt339.status_show" >}
PRIVATE FUNCTION asrt339_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="asrt339.mask_functions" >}
&include "erp/asr/asrt339_mask.4gl"
 
{</section>}
 
{<section id="asrt339.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION asrt339_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   DEFINE l_success  LIKE type_t.num5
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
   LET g_wc2_table2 = " 1=1"
   LET g_wc2_table3 = " 1=1"
 
 
   CALL asrt339_show()
   CALL asrt339_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   CALL s_asrt339_conf_chk(g_sfja_m.sfjadocno) RETURNING l_success
   IF NOT l_success THEN
      CLOSE asrt339_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_sfja_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_sfjb_d))
   CALL cl_bpm_set_detail_data("s_detail2", util.JSONArray.fromFGL(g_sfjb2_d))
   CALL cl_bpm_set_detail_data("s_detail4", util.JSONArray.fromFGL(g_sfjb4_d))
 
 
   # cl_bpm_cli() 裡有包含以前的aws_condition()=>送簽資料檢核和更新單據狀況碼為'W'
   # cl_bpm_cli() 傳入參數:無  ;  回傳值: 0 開單失敗; 1 開單成功
 
   #add-point: 提交前的ADP name="send.before_cli"
   
   #end add-point
 
   #開單失敗
   IF NOT cl_bpm_cli() THEN 
      RETURN FALSE
   END IF
 
   #add-point: 提交後的ADP name="send.after_send"
   
   #end add-point
 
   #此段落不需要刪除資料,但是否需要refresh圖片樣式???
   #CALL asrt339_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL asrt339_ui_headershow()
   CALL asrt339_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION asrt339_draw_out()
   #add-point:draw段define name="draw.define_customerization"
   
   #end add-point
   #add-point:draw段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="draw.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="draw.pre_function"
   
   #end add-point
   
   #抽單失敗
   IF NOT cl_bpm_draw_out() THEN 
      RETURN FALSE
   END IF    
          
   #重新指定此筆單據資料狀態圖片=>抽單
   LET g_browser[g_current_idx].b_statepic = "stus/16/draw_out.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL asrt339_ui_headershow()  
   CALL asrt339_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="asrt339.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION asrt339_set_pk_array()
   #add-point:set_pk_array段define name="set_pk_array.define_customerization"
   
   #end add-point
   #add-point:set_pk_array段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_pk_array.define"
   
   #end add-point
   
   #add-point:Function前置處理 name="set_pk_array.before"
   
   #end add-point  
   
   #若l_ac<=0代表沒有資料
   IF l_ac <= 0 THEN
      RETURN
   END IF
   
   CALL g_pk_array.clear()
   LET g_pk_array[1].values = g_sfja_m.sfjadocno
   LET g_pk_array[1].column = 'sfjadocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt339.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="asrt339.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION asrt339_msgcentre_notify(lc_state)
   #add-point:msgcentre_notify段define name="msgcentre_notify.define_customerization"
   
   #end add-point   
   DEFINE lc_state LIKE type_t.chr80
   #add-point:msgcentre_notify段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="msgcentre_notify.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="msgcentre_notify.pre_function"
   
   #end add-point
   
   INITIALIZE g_msgparam TO NULL
 
   #action-id與狀態填寫
   LET g_msgparam.state = lc_state
 
   #PK資料填寫
   CALL asrt339_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_sfja_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt339.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION asrt339_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt339.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt339_set_required_b()
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  = 'Y' THEN
      CALL cl_set_comp_required("sfjb007,sfjb008",TRUE)   
   END IF
   IF l_ac > 0 THEN
      IF g_sfjb_d[l_ac].sfjb010 = '2' OR g_sfjb_d[l_ac].sfjb010 = '3' THEN
         CALL cl_set_comp_required("sfjb011",TRUE)
      END IF
   END IF
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt339_set_no_required_b()
   CALL cl_set_comp_required("sfjb007,sfjb008,sfjb011",FALSE) 
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt339_default_docno()
DEFINE l_ooef004              LIKE ooef_t.ooef004
DEFINE l_cnt                  LIKE type_t.num5

   SELECT ooef004 INTO l_ooef004 
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_site

   SELECT COUNT(ooba002) INTO l_cnt
     FROM ooba_t LEFT OUTER JOIN oobxl_t ON oobaent = oobxlent AND ooba002 = oobxl001 AND oobxl002 = g_lang
     WHERE oobaent = g_enterprise AND ooba002  IN (SELECT oobl001 FROM oobl_t WHERE  ooblent = g_enterprise  AND oobl002 = g_prog ) AND oobastus = 'Y' AND ooba001  = l_ooef004
     ORDER BY ooba002

   IF l_cnt = 1 THEN
      SELECT DISTINCT ooba002 INTO g_sfja_m.sfjadocno
        FROM ooba_t LEFT OUTER JOIN oobxl_t ON oobaent = oobxlent AND ooba002 = oobxl001 AND oobxl002 = g_lang
        WHERE oobaent = g_enterprise AND ooba002  IN (SELECT oobl001 FROM oobl_t WHERE  ooblent = g_enterprise  AND oobl002 = g_prog ) AND oobastus = 'Y' AND ooba001  = l_ooef004
        ORDER BY ooba002
   END IF
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt339_refresh_stus()
       SELECT DISTINCT sfja004,sfja005,sfjastus,sfjaownid,sfjaowndp,sfjacrtid,sfjacrtdp,
                       sfjacrtdt,sfjamodid,sfjamoddt,sfjacnfid,sfjacnfdt,sfjapstid,sfjapstdt
         INTO g_sfja_m.sfja004,g_sfja_m.sfja005,g_sfja_m.sfjastus,g_sfja_m.sfjaownid,g_sfja_m.sfjaowndp,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtdp,
              g_sfja_m.sfjacrtdt,g_sfja_m.sfjamodid,g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid,g_sfja_m.sfjapstdt
         
         FROM sfja_t
        WHERE sfjaent   = g_enterprise
          AND sfjadocno = g_sfja_m.sfjadocno
       
       LET g_sfja_m.sfjaownid_desc = s_desc_get_person_desc(g_sfja_m.sfjaownid)
       LET g_sfja_m.sfjacrtid_desc = s_desc_get_person_desc(g_sfja_m.sfjacrtid)
       LET g_sfja_m.sfjamodid_desc = s_desc_get_person_desc(g_sfja_m.sfjamodid)
       LET g_sfja_m.sfjacnfid_desc = s_desc_get_person_desc(g_sfja_m.sfjacnfid)
       LET g_sfja_m.sfjapstid_desc = s_desc_get_person_desc(g_sfja_m.sfjapstid)
       
       LET g_sfja_m.sfjaowndp_desc = s_desc_get_department_desc(g_sfja_m.sfjaowndp)
       LET g_sfja_m.sfjacrtdp_desc = s_desc_get_department_desc(g_sfja_m.sfjacrtdp)
 
       CASE g_sfja_m.sfjastus
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "S"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/posted.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
          
       END CASE 
       
       DISPLAY BY NAME
       g_sfja_m.sfja004,g_sfja_m.sfja005,
       g_sfja_m.sfjastus,g_sfja_m.sfjaownid,
       g_sfja_m.sfjaownid_desc,g_sfja_m.sfjaowndp,g_sfja_m.sfjaowndp_desc,g_sfja_m.sfjacrtid,g_sfja_m.sfjacrtid_desc, 
       g_sfja_m.sfjacrtdp,g_sfja_m.sfjacrtdp_desc,g_sfja_m.sfjacrtdt,g_sfja_m.sfjamodid,g_sfja_m.sfjamodid_desc, 
       g_sfja_m.sfjamoddt,g_sfja_m.sfjacnfid,g_sfja_m.sfjacnfid_desc,g_sfja_m.sfjacnfdt,g_sfja_m.sfjapstid,g_sfja_m.sfjapstid_desc,g_sfja_m.sfjapstdt
END FUNCTION

################################################################################
# Descriptions...: 刷新sfja004/sfja005
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt339_refresh_sfja0045()

       SELECT DISTINCT sfja004,sfja005
         INTO g_sfja_m.sfja004,g_sfja_m.sfja005
         FROM sfja_t
        WHERE sfjaent   = g_enterprise
          AND sfjadocno = g_sfja_m.sfjadocno
   
    DISPLAY BY NAME g_sfja_m.sfja004,g_sfja_m.sfja005
          
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt339_inao_b_fill()
   DEFINE l_sql     STRING
   DEFINE l_ac1     LIKE type_t.num5
   
   
   LET l_sql = " SELECT inaodocno,inaoseq,inaoseq2, ",
               "        inao001,'','',inao008,inao009,inao012,inao010,inao011 ",
               "   FROM inao_t ",
               "  WHERE inaoent = '",g_enterprise,"' AND inaosite = '",g_site,"' ",
               "    AND inaodocno = '",g_sfja_m.sfjadocno,"' ",
               "    AND inao000 = '1' AND inao013 = '1' "
               
   LET l_sql = l_sql," ORDER BY inaodocno,inaoseq,inaoseq2 "
   PREPARE asrt339_inaosel_pb FROM l_sql
   DECLARE asrt339_inaosel_cs CURSOR FOR asrt339_inaosel_pb 
   
   CALL g_inao_d.clear()
   LET g_cnt = l_ac1
   LET l_ac1 = 1
   FOREACH asrt339_inaosel_cs INTO g_inao_d[l_ac1].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
      #料號說明
      INITIALIZE g_ref_fields TO NULL 
      LET g_ref_fields[1] = g_inao_d[l_ac1].inao001
      CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_inao_d[l_ac1].inao001_desc = '', g_rtn_fields[1] , '' 
      DISPLAY BY NAME g_inao_d[l_ac1].inao001_desc

      INITIALIZE g_ref_fields TO NULL 
      LET g_ref_fields[1] = g_inao_d[l_ac1].inao001
      CALL ap_ref_array2(g_ref_fields,"SELECT imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_inao_d[l_ac1].inao001_desc_desc = '', g_rtn_fields[1] , '' 
      DISPLAY BY NAME g_inao_d[l_ac1].inao001_desc_desc
      
      LET l_ac1 = l_ac1 + 1
      IF l_ac1 > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ""
         LET g_errparam.popup = FALSE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
   END FOREACH
   
   CALL g_inao_d.deleteElement(g_inao_d.getLength())   
   LET g_cnt = 0
   CLOSE asrt339_inaosel_cs
   FREE asrt339_inaosel_pb

END FUNCTION

 
{</section>}
 
