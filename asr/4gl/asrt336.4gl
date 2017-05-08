#該程式未解開Section, 採用最新樣板產出!
{<section id="asrt336.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0007(2015-06-12 10:37:37), PR版次:0007(2017-02-06 11:48:09)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000134
#+ Filename...: asrt336
#+ Description: 重覆性生產當站報廢維護作業
#+ Creator....: 05426(2015-06-09 08:26:24)
#+ Modifier...: 05426 -SD/PR- 04441
 
{</section>}
 
{<section id="asrt336.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#+ Modifier...:   No.160318-00025#34   2016/04/14 BY pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#+ Modifier...:   No.160818-00017#37   2016/08/26 By lixh     单据类作业修改，删除时需重新检查状态
#+ Modifier...:   No.160824-00007#284  2016/12/23 By sakura   新舊值備份處理
#170117-00038#1   2017/01/18  By Whitney  調整s_asft335_chk_qty()傳入參數
#161228-00028#2   2017/01/12  By 02295   报工类型改成11~15
#170120-00043#1   2017/02/06  By Whitney s_asft335_chk_qty()增加傳入參數報工類別
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目 name="global.import"

#end add-point 
 
SCHEMA ds 
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE type type_g_sfga_m        RECORD
       sfgadocno LIKE sfga_t.sfgadocno, 
   sfgadocdt LIKE sfga_t.sfgadocdt, 
   sfga002 LIKE sfga_t.sfga002, 
   sfga002_desc LIKE type_t.chr80, 
   sfgadocno_desc LIKE type_t.chr80, 
   sfga001 LIKE sfga_t.sfga001, 
   sfga003 LIKE sfga_t.sfga003, 
   sfga003_desc LIKE type_t.chr80, 
   sfgastus LIKE sfga_t.sfgastus, 
   sfgasite LIKE sfga_t.sfgasite, 
   sfga011 LIKE sfga_t.sfga011, 
   sfga011_desc LIKE type_t.chr80, 
   sfga012 LIKE sfga_t.sfga012, 
   imaal003 LIKE type_t.chr500, 
   imaal004 LIKE type_t.chr500, 
   sfga013 LIKE sfga_t.sfga013, 
   sfga014 LIKE sfga_t.sfga014, 
   sfga006 LIKE sfga_t.sfga006, 
   sfga006_desc LIKE type_t.chr80, 
   sfga007 LIKE sfga_t.sfga007, 
   sfga008 LIKE sfga_t.sfga008, 
   sfga009 LIKE sfga_t.sfga009, 
   sfga010 LIKE sfga_t.sfga010, 
   sfgaownid LIKE sfga_t.sfgaownid, 
   sfgaownid_desc LIKE type_t.chr80, 
   sfgaowndp LIKE sfga_t.sfgaowndp, 
   sfgaowndp_desc LIKE type_t.chr80, 
   sfgacrtid LIKE sfga_t.sfgacrtid, 
   sfgacrtid_desc LIKE type_t.chr80, 
   sfgacrtdp LIKE sfga_t.sfgacrtdp, 
   sfgacrtdp_desc LIKE type_t.chr80, 
   sfgacrtdt LIKE sfga_t.sfgacrtdt, 
   sfgamodid LIKE sfga_t.sfgamodid, 
   sfgamodid_desc LIKE type_t.chr80, 
   sfgamoddt LIKE sfga_t.sfgamoddt, 
   sfgacnfid LIKE sfga_t.sfgacnfid, 
   sfgacnfid_desc LIKE type_t.chr80, 
   sfgacnfdt LIKE sfga_t.sfgacnfdt, 
   sfgapstid LIKE sfga_t.sfgapstid, 
   sfgapstid_desc LIKE type_t.chr80, 
   sfgapstdt LIKE sfga_t.sfgapstdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_sfgb_d        RECORD
       sfgbseq LIKE sfgb_t.sfgbseq, 
   sfgb001 LIKE sfgb_t.sfgb001, 
   sfgb001_desc LIKE type_t.chr500, 
   sfgb002 LIKE sfgb_t.sfgb002, 
   sfgb003 LIKE sfgb_t.sfgb003, 
   sfgbsite LIKE sfgb_t.sfgbsite
       END RECORD
PRIVATE TYPE type_g_sfgb2_d RECORD
       sfgcseq LIKE sfgc_t.sfgcseq, 
   sfgc001 LIKE sfgc_t.sfgc001, 
   sfgc001_desc LIKE type_t.chr500, 
   sfgc002 LIKE sfgc_t.sfgc002, 
   sfgc003 LIKE sfgc_t.sfgc003, 
   sfgc004 LIKE sfgc_t.sfgc004, 
   sfgc005 LIKE sfgc_t.sfgc005, 
   sfgc005_desc LIKE type_t.chr500, 
   sfgc006 LIKE sfgc_t.sfgc006, 
   sfgcsite LIKE sfgc_t.sfgcsite
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_sfgadocno LIKE sfga_t.sfgadocno,
   b_sfgadocno_desc LIKE type_t.chr80,
      b_sfgadocdt LIKE sfga_t.sfgadocdt,
      b_sfga002 LIKE sfga_t.sfga002,
   b_sfga002_desc LIKE type_t.chr80,
      b_sfga003 LIKE sfga_t.sfga003,
   b_sfga003_desc LIKE type_t.chr80
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_doc_slip            LIKE sfga_t.sfgadocno
DEFINE g_sfgc_entry          LIKE type_t.chr1              #标识判定单身是否可以进入 Y/N
#end add-point
       
#模組變數(Module Variables)
DEFINE g_sfga_m          type_g_sfga_m
DEFINE g_sfga_m_t        type_g_sfga_m
DEFINE g_sfga_m_o        type_g_sfga_m
DEFINE g_sfga_m_mask_o   type_g_sfga_m #轉換遮罩前資料
DEFINE g_sfga_m_mask_n   type_g_sfga_m #轉換遮罩後資料
 
   DEFINE g_sfgadocno_t LIKE sfga_t.sfgadocno
 
 
DEFINE g_sfgb_d          DYNAMIC ARRAY OF type_g_sfgb_d
DEFINE g_sfgb_d_t        type_g_sfgb_d
DEFINE g_sfgb_d_o        type_g_sfgb_d
DEFINE g_sfgb_d_mask_o   DYNAMIC ARRAY OF type_g_sfgb_d #轉換遮罩前資料
DEFINE g_sfgb_d_mask_n   DYNAMIC ARRAY OF type_g_sfgb_d #轉換遮罩後資料
DEFINE g_sfgb2_d          DYNAMIC ARRAY OF type_g_sfgb2_d
DEFINE g_sfgb2_d_t        type_g_sfgb2_d
DEFINE g_sfgb2_d_o        type_g_sfgb2_d
DEFINE g_sfgb2_d_mask_o   DYNAMIC ARRAY OF type_g_sfgb2_d #轉換遮罩前資料
DEFINE g_sfgb2_d_mask_n   DYNAMIC ARRAY OF type_g_sfgb2_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
 
DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING
DEFINE g_wc2_table2   STRING
 
 
 
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
 
{<section id="asrt336.main" >}
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
   LET g_forupd_sql = " SELECT sfgadocno,sfgadocdt,sfga002,'','',sfga001,sfga003,'',sfgastus,sfgasite, 
       sfga011,'',sfga012,'','',sfga013,sfga014,sfga006,'',sfga007,sfga008,sfga009,sfga010,sfgaownid, 
       '',sfgaowndp,'',sfgacrtid,'',sfgacrtdp,'',sfgacrtdt,sfgamodid,'',sfgamoddt,sfgacnfid,'',sfgacnfdt, 
       sfgapstid,'',sfgapstdt", 
                      " FROM sfga_t",
                      " WHERE sfgaent= ? AND sfgadocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
                        
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt336_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.sfgadocno,t0.sfgadocdt,t0.sfga002,t0.sfga001,t0.sfga003,t0.sfgastus, 
       t0.sfgasite,t0.sfga011,t0.sfga012,t0.sfga013,t0.sfga014,t0.sfga006,t0.sfga007,t0.sfga008,t0.sfga009, 
       t0.sfga010,t0.sfgaownid,t0.sfgaowndp,t0.sfgacrtid,t0.sfgacrtdp,t0.sfgacrtdt,t0.sfgamodid,t0.sfgamoddt, 
       t0.sfgacnfid,t0.sfgacnfdt,t0.sfgapstid,t0.sfgapstdt,t1.ooag011 ,t2.ooefl003 ,t3.srza002 ,t4.oocql004 , 
       t5.ooag011 ,t6.ooefl003 ,t7.ooag011 ,t8.ooefl003 ,t9.ooag011 ,t10.ooag011 ,t11.ooag011",
               " FROM sfga_t t0",
                              " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.sfga002  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.sfga003 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN srza_t t3 ON t3.srzaent="||g_enterprise||" AND t3.srza001=t0.sfga011  ",
               " LEFT JOIN oocql_t t4 ON t4.oocqlent="||g_enterprise||" AND t4.oocql001='221' AND t4.oocql002=t0.sfga006 AND t4.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.sfgaownid  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.sfgaowndp AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t7 ON t7.ooagent="||g_enterprise||" AND t7.ooag001=t0.sfgacrtid  ",
               " LEFT JOIN ooefl_t t8 ON t8.ooeflent="||g_enterprise||" AND t8.ooefl001=t0.sfgacrtdp AND t8.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.sfgamodid  ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.sfgacnfid  ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.sfgapstid  ",
 
               " WHERE t0.sfgaent = " ||g_enterprise|| " AND t0.sfgadocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE asrt336_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
                                                
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_asrt336 WITH FORM cl_ap_formpath("asr",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL asrt336_init()   
 
      #進入選單 Menu (="N")
      CALL asrt336_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
                                                
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_asrt336
      
   END IF 
   
   CLOSE asrt336_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
                        
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="asrt336.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION asrt336_init()
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
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
      CALL cl_set_combo_scc_part('sfgastus','13','N,Y,S,A,D,R,W,Z,X')
 
      CALL cl_set_combo_scc('sfgc002','5417') 
   CALL cl_set_combo_scc('sfgc004','5418') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
   CALL g_idx_group.addAttribute("'2',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   LET g_sfgc_entry = 'N'                  #只有使用维护判定结果按钮才能进单身2  
#判定结果单身的锁定cursor放这里定义是因为设计器有bug，若放在asrt336_input_sfgc()里定义，会变成在asrt336_lock_b()之后定义cursor，编译报asrt336_bcl21还未定义
#但是设计器的FUNCTION list功能不全，没办法把自定义的FUNCTION提到前面去
   LET g_forupd_sql = "SELECT sfgcseq,sfgc001,'',sfgc002,sfgc003,sfgc004,sfgc005,'',sfgc006,sfgcsite  
       FROM sfgc_t WHERE sfgcent=? AND sfgcdocno=? AND sfgcseq=? FOR UPDATE"

   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE asrt336_bcl21 CURSOR FROM g_forupd_sql
   #end add-point
   
   #初始化搜尋條件
   CALL asrt336_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="asrt336.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION asrt336_ui_dialog()
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
            CALL asrt336_insert()
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
         INITIALIZE g_sfga_m.* TO NULL
         CALL g_sfgb_d.clear()
         CALL g_sfgb2_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL asrt336_init()
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
               
               CALL asrt336_fetch('') # reload data
               LET l_ac = 1
               CALL asrt336_ui_detailshow() #Setting the current row 
         
               CALL asrt336_idx_chk()
               #NEXT FIELD sfgbseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_sfgb_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL asrt336_idx_chk()
               #確定當下選擇的筆數
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               LET g_detail_idx_list[1] = l_ac
               CALL g_idx_group.addAttribute("'1',",l_ac)
               
               #add-point:page1, before row動作 name="ui_dialog.page1.before_row"
                                                                                                                        
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
               CALL asrt336_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
                                                                                                                        
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
                                                                                                
            #end add-point
               
         END DISPLAY
        
         #第一階單身段落
         DISPLAY ARRAY g_sfgb2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               #顯示單身筆數
               CALL asrt336_idx_chk()
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
               CALL asrt336_idx_chk()
               #add-point:page2自定義行為 name="ui_dialog.body2.before_display"
                                                                                                                        
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為 name="ui_dialog.body2.action"
                                                                                                
            #end add-point
         
         END DISPLAY
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
                                                                        
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL asrt336_browser_fill("")
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
               CALL asrt336_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL asrt336_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL asrt336_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
                                                                                                
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL asrt336_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL asrt336_set_act_visible()   
            CALL asrt336_set_act_no_visible()
            IF NOT (g_sfga_m.sfgadocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " sfgaent = " ||g_enterprise|| " AND",
                                  " sfgadocno = '", g_sfga_m.sfgadocno, "' "
 
               #填到對應位置
               CALL asrt336_browser_fill("")
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
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "sfga_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sfgb_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sfgc_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
                  OR NOT cl_null(g_wc2_table2)
 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  #組合g_wc2
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
                  IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
 
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
               END IF
               CALL asrt336_browser_fill("F")   #browser_fill()會將notice區塊清空
               CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            END IF
         
         #查詢方案選擇
         ON ACTION qbe_select
            CALL cl_qbe_list("m") RETURNING ls_wc
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
               INITIALIZE g_wc2_table2 TO NULL
 
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "sfga_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sfgb_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "sfgc_t" 
                        LET g_wc2_table2 = la_wc[li_idx].wc
 
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)
                  OR NOT cl_null(g_wc2_table2)
 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
                  IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
                  END IF
 
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL asrt336_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL asrt336_fetch("F")
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
               CALL asrt336_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL asrt336_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt336_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL asrt336_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt336_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL asrt336_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt336_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL asrt336_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt336_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL asrt336_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt336_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_sfgb_d)
                  LET g_export_id[1]   = "s_detail1"
                  LET g_export_node[2] = base.typeInfo.create(g_sfgb2_d)
                  LET g_export_id[2]   = "s_detail2"
 
                  #add-point:ON ACTION exporttoexcel name="menu.exporttoexcel"
                  
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
               NEXT FIELD sfgbseq
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
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = ''
               CALL asrt336_modify()
               #add-point:ON ACTION modify name="menu.modify"
                                                                                                                        
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL asrt336_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
                                                                                                                        
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION maintain_sfgc
            LET g_action_choice="maintain_sfgc"
            IF cl_auth_chk_act("maintain_sfgc") THEN
               
               #add-point:ON ACTION maintain_sfgc name="menu.maintain_sfgc"
               LET g_sfgc_entry = 'Y'
               CALL asrt336_input_sfgc()
               LET g_sfgc_entry = 'N'
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL asrt336_delete()
               #add-point:ON ACTION delete name="menu.delete"
                                                                                                                        
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL asrt336_insert()
               #add-point:ON ACTION insert name="menu.insert"
                                                                                                                        
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               LET l_wc = " sfgadocno = '",g_sfga_m.sfgadocno,"'"
              
               LET g_rep_wc = l_wc                                                                                                                        
               #END add-point
               &include "erp/asr/asrt336_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               LET l_wc = " sfgadocno = '",g_sfga_m.sfgadocno,"'"
              
               LET g_rep_wc = l_wc                                                                                                                        
               #END add-point
               &include "erp/asr/asrt336_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL asrt336_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
                                                                                                                        
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL asrt336_query()
               #add-point:ON ACTION query name="menu.query"
                                                                                                                        
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
               CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
 
 
 
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL asrt336_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL asrt336_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL asrt336_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_sfga_m.sfgadocdt)
 
 
 
         
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
 
{<section id="asrt336.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION asrt336_browser_fill(ps_page_action)
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
      LET g_wc = " sfgasite = '",g_site,"' AND sfga004 IS NULL AND sfga011 IS NOT NULL "
   ELSE
      LET g_wc = g_wc," AND sfgasite = '",g_site,"' AND sfga004 IS NULL AND sfga011 IS NOT NULL "
   END IF 
   LET l_wc  = g_wc.trim() 
   LET l_wc2 = g_wc2.trim()   
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT sfgadocno ",
                      " FROM sfga_t ",
                      " ",
                      " LEFT JOIN sfgb_t ON sfgbent = sfgaent AND sfgadocno = sfgbdocno ", "  ",
                      #add-point:browser_fill段sql(sfgb_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
                      " LEFT JOIN sfgc_t ON sfgcent = sfgaent AND sfgadocno = sfgcdocno", "  ",
                      #add-point:browser_fill段sql(sfgc_t1) name="browser_fill.cnt.join.sfgc_t1"
                      
                      #end add-point
 
 
 
                      " ", 
                      " ", 
                      " ",                      
 
 
 
                      " WHERE sfgaent = " ||g_enterprise|| " AND sfgbent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("sfga_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT sfgadocno ",
                      " FROM sfga_t ", 
                      "  ",
                      "  ",
                      " WHERE sfgaent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("sfga_t")
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
      INITIALIZE g_sfga_m.* TO NULL
      CALL g_sfgb_d.clear()        
      CALL g_sfgb2_d.clear() 
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.sfgadocno,t0.sfgadocdt,t0.sfga002,t0.sfga003 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sfgastus,t0.sfgadocno,t0.sfgadocdt,t0.sfga002,t0.sfga003,t1.ooag011 , 
          t2.ooefl003 ",
                  " FROM sfga_t t0",
                  "  ",
                  "  LEFT JOIN sfgb_t ON sfgbent = sfgaent AND sfgadocno = sfgbdocno ", "  ", 
                  #add-point:browser_fill段sql(sfgb_t1) name="browser_fill.join.sfgb_t1"
                  
                  #end add-point
                  "  LEFT JOIN sfgc_t ON sfgcent = sfgaent AND sfgadocno = sfgcdocno", "  ", 
                  #add-point:browser_fill段sql(sfgc_t1) name="browser_fill.join.sfgc_t1"
                  
                  #end add-point
 
 
 
                  " ", 
                  " ",                      
 
 
 
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.sfga002  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.sfga003 AND t2.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.sfgaent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("sfga_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sfgastus,t0.sfgadocno,t0.sfgadocdt,t0.sfga002,t0.sfga003,t1.ooag011 , 
          t2.ooefl003 ",
                  " FROM sfga_t t0",
                  "  ",
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.sfga002  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.sfga003 AND t2.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.sfgaent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("sfga_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY sfgadocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
                        
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"sfga_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
                        
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_sfgadocno,g_browser[g_cnt].b_sfgadocdt, 
          g_browser[g_cnt].b_sfga002,g_browser[g_cnt].b_sfga003,g_browser[g_cnt].b_sfga002_desc,g_browser[g_cnt].b_sfga003_desc 
 
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
      LET g_browser[g_cnt].b_sfgadocno_desc = s_aooi200_get_slip_desc(g_browser[g_cnt].b_sfgadocno)
      DISPLAY BY NAME g_browser[g_cnt].b_sfgadocno_desc                                                
         #end add-point
      
         #遮罩相關處理
         CALL asrt336_browser_mask()
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
         WHEN "S"
            LET g_browser[g_cnt].b_statepic = "stus/16/posted.png"
         WHEN "A"
            LET g_browser[g_cnt].b_statepic = "stus/16/approved.png"
         WHEN "D"
            LET g_browser[g_cnt].b_statepic = "stus/16/withdraw.png"
         WHEN "R"
            LET g_browser[g_cnt].b_statepic = "stus/16/rejection.png"
         WHEN "W"
            LET g_browser[g_cnt].b_statepic = "stus/16/signing.png"
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
   
   IF cl_null(g_browser[g_cnt].b_sfgadocno) THEN
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
 
{<section id="asrt336.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION asrt336_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
                        
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_sfga_m.sfgadocno = g_browser[g_current_idx].b_sfgadocno   
 
   EXECUTE asrt336_master_referesh USING g_sfga_m.sfgadocno INTO g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt, 
       g_sfga_m.sfga002,g_sfga_m.sfga001,g_sfga_m.sfga003,g_sfga_m.sfgastus,g_sfga_m.sfgasite,g_sfga_m.sfga011, 
       g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,g_sfga_m.sfga007,g_sfga_m.sfga008, 
       g_sfga_m.sfga009,g_sfga_m.sfga010,g_sfga_m.sfgaownid,g_sfga_m.sfgaowndp,g_sfga_m.sfgacrtid,g_sfga_m.sfgacrtdp, 
       g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid,g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid,g_sfga_m.sfgacnfdt, 
       g_sfga_m.sfgapstid,g_sfga_m.sfgapstdt,g_sfga_m.sfga002_desc,g_sfga_m.sfga003_desc,g_sfga_m.sfga011_desc, 
       g_sfga_m.sfga006_desc,g_sfga_m.sfgaownid_desc,g_sfga_m.sfgaowndp_desc,g_sfga_m.sfgacrtid_desc, 
       g_sfga_m.sfgacrtdp_desc,g_sfga_m.sfgamodid_desc,g_sfga_m.sfgacnfid_desc,g_sfga_m.sfgapstid_desc 
 
   
   CALL asrt336_sfga_t_mask()
   CALL asrt336_show()
      
END FUNCTION
 
{</section>}
 
{<section id="asrt336.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION asrt336_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
                        
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
                        
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
      CALL g_curr_diag.setCurrentRow("s_detail2",g_detail_idx)
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
                        
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION asrt336_ui_browser_refresh()
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
      IF g_browser[l_i].b_sfgadocno = g_sfga_m.sfgadocno 
 
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
 
{<section id="asrt336.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION asrt336_construct()
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
   INITIALIZE g_sfga_m.* TO NULL
   CALL g_sfgb_d.clear()        
   CALL g_sfgb2_d.clear() 
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
   INITIALIZE g_wc2_table2 TO NULL
 
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
                        
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON sfgadocno,sfgadocdt,sfga002,sfgadocno_desc,sfga001,sfga003,sfgastus, 
          sfgasite,sfga011,sfga012,sfga013,sfga014,sfga006,sfga007,sfga008,sfga009,sfga010,sfgaownid, 
          sfgaowndp,sfgacrtid,sfgacrtdp,sfgacrtdt,sfgamodid,sfgamoddt,sfgacnfid,sfgacnfdt,sfgapstid, 
          sfgapstdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
                                                                                                
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<sfgacrtdt>>----
         AFTER FIELD sfgacrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<sfgamoddt>>----
         AFTER FIELD sfgamoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sfgacnfdt>>----
         AFTER FIELD sfgacnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sfgapstdt>>----
         AFTER FIELD sfgapstdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.sfgadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgadocno
            #add-point:ON ACTION controlp INFIELD sfgadocno name="construct.c.sfgadocno"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
			   LET g_qryparam.where="  sfga004 IS NULL AND sfga011 IS NOT NULL"
            CALL q_sfgadocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfgadocno  #顯示到畫面上

            NEXT FIELD sfgadocno                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgadocno
            #add-point:BEFORE FIELD sfgadocno name="construct.b.sfgadocno"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgadocno
            
            #add-point:AFTER FIELD sfgadocno name="construct.a.sfgadocno"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgadocdt
            #add-point:BEFORE FIELD sfgadocdt name="construct.b.sfgadocdt"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgadocdt
            
            #add-point:AFTER FIELD sfgadocdt name="construct.a.sfgadocdt"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfgadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgadocdt
            #add-point:ON ACTION controlp INFIELD sfgadocdt name="construct.c.sfgadocdt"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.sfga002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga002
            #add-point:ON ACTION controlp INFIELD sfga002 name="construct.c.sfga002"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfga002  #顯示到畫面上

            NEXT FIELD sfga002                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga002
            #add-point:BEFORE FIELD sfga002 name="construct.b.sfga002"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga002
            
            #add-point:AFTER FIELD sfga002 name="construct.a.sfga002"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgadocno_desc
            #add-point:BEFORE FIELD sfgadocno_desc name="construct.b.sfgadocno_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgadocno_desc
            
            #add-point:AFTER FIELD sfgadocno_desc name="construct.a.sfgadocno_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfgadocno_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgadocno_desc
            #add-point:ON ACTION controlp INFIELD sfgadocno_desc name="construct.c.sfgadocno_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga001
            #add-point:BEFORE FIELD sfga001 name="construct.b.sfga001"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga001
            
            #add-point:AFTER FIELD sfga001 name="construct.a.sfga001"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfga001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga001
            #add-point:ON ACTION controlp INFIELD sfga001 name="construct.c.sfga001"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.sfga003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga003
            #add-point:ON ACTION controlp INFIELD sfga003 name="construct.c.sfga003"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfga003  #顯示到畫面上

            NEXT FIELD sfga003                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga003
            #add-point:BEFORE FIELD sfga003 name="construct.b.sfga003"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga003
            
            #add-point:AFTER FIELD sfga003 name="construct.a.sfga003"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgastus
            #add-point:BEFORE FIELD sfgastus name="construct.b.sfgastus"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgastus
            
            #add-point:AFTER FIELD sfgastus name="construct.a.sfgastus"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfgastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgastus
            #add-point:ON ACTION controlp INFIELD sfgastus name="construct.c.sfgastus"
                                                                                                
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgasite
            #add-point:BEFORE FIELD sfgasite name="construct.b.sfgasite"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgasite
            
            #add-point:AFTER FIELD sfgasite name="construct.a.sfgasite"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfgasite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgasite
            #add-point:ON ACTION controlp INFIELD sfgasite name="construct.c.sfgasite"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.sfga011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga011
            #add-point:ON ACTION controlp INFIELD sfga011 name="construct.c.sfga011"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_srza001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfga011  #顯示到畫面上
            NEXT FIELD sfga011                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga011
            #add-point:BEFORE FIELD sfga011 name="construct.b.sfga011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga011
            
            #add-point:AFTER FIELD sfga011 name="construct.a.sfga011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfga012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga012
            #add-point:ON ACTION controlp INFIELD sfga012 name="construct.c.sfga012"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_bmaa001_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfga012  #顯示到畫面上
            NEXT FIELD sfga012                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga012
            #add-point:BEFORE FIELD sfga012 name="construct.b.sfga012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga012
            
            #add-point:AFTER FIELD sfga012 name="construct.a.sfga012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfga013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga013
            #add-point:ON ACTION controlp INFIELD sfga013 name="construct.c.sfga013"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_bmaa002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfga013  #顯示到畫面上
            NEXT FIELD sfga013                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga013
            #add-point:BEFORE FIELD sfga013 name="construct.b.sfga013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga013
            
            #add-point:AFTER FIELD sfga013 name="construct.a.sfga013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfga014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga014
            #add-point:ON ACTION controlp INFIELD sfga014 name="construct.c.sfga014"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1=g_sfga_m.sfga012
            CALL q_bmaa002_2()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfga014  #顯示到畫面上
            NEXT FIELD sfga014                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga014
            #add-point:BEFORE FIELD sfga014 name="construct.b.sfga014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga014
            
            #add-point:AFTER FIELD sfga014 name="construct.a.sfga014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfga006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga006
            #add-point:ON ACTION controlp INFIELD sfga006 name="construct.c.sfga006"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
   			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
   			LET g_qryparam.reqry = FALSE
            CALL q_sfcb003_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfga006  #顯示到畫面上
   
            NEXT FIELD sfga006                     #返回原欄位



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga006
            #add-point:BEFORE FIELD sfga006 name="construct.b.sfga006"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga006
            
            #add-point:AFTER FIELD sfga006 name="construct.a.sfga006"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfga007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga007
            #add-point:ON ACTION controlp INFIELD sfga007 name="construct.c.sfga007"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_sfcb003_4()                           #呼叫開窗
            DISPLAY g_qryparam.return3 TO sfga007  #顯示到畫面上

            NEXT FIELD sfga007                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga007
            #add-point:BEFORE FIELD sfga007 name="construct.b.sfga007"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga007
            
            #add-point:AFTER FIELD sfga007 name="construct.a.sfga007"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga008
            #add-point:BEFORE FIELD sfga008 name="construct.b.sfga008"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga008
            
            #add-point:AFTER FIELD sfga008 name="construct.a.sfga008"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfga008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga008
            #add-point:ON ACTION controlp INFIELD sfga008 name="construct.c.sfga008"
                                                                                                
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga009
            #add-point:BEFORE FIELD sfga009 name="construct.b.sfga009"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga009
            
            #add-point:AFTER FIELD sfga009 name="construct.a.sfga009"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfga009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga009
            #add-point:ON ACTION controlp INFIELD sfga009 name="construct.c.sfga009"
                                                                                                
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga010
            #add-point:BEFORE FIELD sfga010 name="construct.b.sfga010"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga010
            
            #add-point:AFTER FIELD sfga010 name="construct.a.sfga010"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfga010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga010
            #add-point:ON ACTION controlp INFIELD sfga010 name="construct.c.sfga010"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.sfgaownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgaownid
            #add-point:ON ACTION controlp INFIELD sfgaownid name="construct.c.sfgaownid"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfgaownid  #顯示到畫面上

            NEXT FIELD sfgaownid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgaownid
            #add-point:BEFORE FIELD sfgaownid name="construct.b.sfgaownid"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgaownid
            
            #add-point:AFTER FIELD sfgaownid name="construct.a.sfgaownid"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfgaowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgaowndp
            #add-point:ON ACTION controlp INFIELD sfgaowndp name="construct.c.sfgaowndp"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfgaowndp  #顯示到畫面上

            NEXT FIELD sfgaowndp                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgaowndp
            #add-point:BEFORE FIELD sfgaowndp name="construct.b.sfgaowndp"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgaowndp
            
            #add-point:AFTER FIELD sfgaowndp name="construct.a.sfgaowndp"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfgacrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgacrtid
            #add-point:ON ACTION controlp INFIELD sfgacrtid name="construct.c.sfgacrtid"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfgacrtid  #顯示到畫面上

            NEXT FIELD sfgacrtid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgacrtid
            #add-point:BEFORE FIELD sfgacrtid name="construct.b.sfgacrtid"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgacrtid
            
            #add-point:AFTER FIELD sfgacrtid name="construct.a.sfgacrtid"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.sfgacrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgacrtdp
            #add-point:ON ACTION controlp INFIELD sfgacrtdp name="construct.c.sfgacrtdp"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfgacrtdp  #顯示到畫面上

            NEXT FIELD sfgacrtdp                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgacrtdp
            #add-point:BEFORE FIELD sfgacrtdp name="construct.b.sfgacrtdp"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgacrtdp
            
            #add-point:AFTER FIELD sfgacrtdp name="construct.a.sfgacrtdp"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgacrtdt
            #add-point:BEFORE FIELD sfgacrtdt name="construct.b.sfgacrtdt"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.sfgamodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgamodid
            #add-point:ON ACTION controlp INFIELD sfgamodid name="construct.c.sfgamodid"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfgamodid  #顯示到畫面上

            NEXT FIELD sfgamodid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgamodid
            #add-point:BEFORE FIELD sfgamodid name="construct.b.sfgamodid"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgamodid
            
            #add-point:AFTER FIELD sfgamodid name="construct.a.sfgamodid"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgamoddt
            #add-point:BEFORE FIELD sfgamoddt name="construct.b.sfgamoddt"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.sfgacnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgacnfid
            #add-point:ON ACTION controlp INFIELD sfgacnfid name="construct.c.sfgacnfid"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfgacnfid  #顯示到畫面上

            NEXT FIELD sfgacnfid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgacnfid
            #add-point:BEFORE FIELD sfgacnfid name="construct.b.sfgacnfid"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgacnfid
            
            #add-point:AFTER FIELD sfgacnfid name="construct.a.sfgacnfid"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgacnfdt
            #add-point:BEFORE FIELD sfgacnfdt name="construct.b.sfgacnfdt"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.sfgapstid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgapstid
            #add-point:ON ACTION controlp INFIELD sfgapstid name="construct.c.sfgapstid"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfgapstid  #顯示到畫面上

            NEXT FIELD sfgapstid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgapstid
            #add-point:BEFORE FIELD sfgapstid name="construct.b.sfgapstid"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgapstid
            
            #add-point:AFTER FIELD sfgapstid name="construct.a.sfgapstid"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgapstdt
            #add-point:BEFORE FIELD sfgapstdt name="construct.b.sfgapstdt"
                                                                                                
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON sfgbseq,sfgb001,sfgb002,sfgb003,sfgbsite
           FROM s_detail1[1].sfgbseq,s_detail1[1].sfgb001,s_detail1[1].sfgb002,s_detail1[1].sfgb003, 
               s_detail1[1].sfgbsite
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
                                                                                                
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgbseq
            #add-point:BEFORE FIELD sfgbseq name="construct.b.page1.sfgbseq"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgbseq
            
            #add-point:AFTER FIELD sfgbseq name="construct.a.page1.sfgbseq"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfgbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgbseq
            #add-point:ON ACTION controlp INFIELD sfgbseq name="construct.c.page1.sfgbseq"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.page1.sfgb001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgb001
            #add-point:ON ACTION controlp INFIELD sfgb001 name="construct.c.page1.sfgb001"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1 = "1053" 
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfgb001  #顯示到畫面上

            NEXT FIELD sfgb001                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgb001
            #add-point:BEFORE FIELD sfgb001 name="construct.b.page1.sfgb001"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgb001
            
            #add-point:AFTER FIELD sfgb001 name="construct.a.page1.sfgb001"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgb002
            #add-point:BEFORE FIELD sfgb002 name="construct.b.page1.sfgb002"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgb002
            
            #add-point:AFTER FIELD sfgb002 name="construct.a.page1.sfgb002"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfgb002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgb002
            #add-point:ON ACTION controlp INFIELD sfgb002 name="construct.c.page1.sfgb002"
                                                                                                
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgb003
            #add-point:BEFORE FIELD sfgb003 name="construct.b.page1.sfgb003"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgb003
            
            #add-point:AFTER FIELD sfgb003 name="construct.a.page1.sfgb003"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfgb003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgb003
            #add-point:ON ACTION controlp INFIELD sfgb003 name="construct.c.page1.sfgb003"
                                                                                                
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgbsite
            #add-point:BEFORE FIELD sfgbsite name="construct.b.page1.sfgbsite"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgbsite
            
            #add-point:AFTER FIELD sfgbsite name="construct.a.page1.sfgbsite"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.sfgbsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgbsite
            #add-point:ON ACTION controlp INFIELD sfgbsite name="construct.c.page1.sfgbsite"
                                                                                                
            #END add-point
 
 
   
       
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table2 ON sfgcseq,sfgc001,sfgc002,sfgc003,sfgc004,sfgc005,sfgc006,sfgcsite
           FROM s_detail2[1].sfgcseq,s_detail2[1].sfgc001,s_detail2[1].sfgc002,s_detail2[1].sfgc003, 
               s_detail2[1].sfgc004,s_detail2[1].sfgc005,s_detail2[1].sfgc006,s_detail2[1].sfgcsite
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body2.before_construct"
                                                                                                
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgcseq
            #add-point:BEFORE FIELD sfgcseq name="construct.b.page2.sfgcseq"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgcseq
            
            #add-point:AFTER FIELD sfgcseq name="construct.a.page2.sfgcseq"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfgcseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgcseq
            #add-point:ON ACTION controlp INFIELD sfgcseq name="construct.c.page2.sfgcseq"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.page2.sfgc001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgc001
            #add-point:ON ACTION controlp INFIELD sfgc001 name="construct.c.page2.sfgc001"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1 = "1053" 
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfgc001  #顯示到畫面上

            NEXT FIELD sfgc001                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgc001
            #add-point:BEFORE FIELD sfgc001 name="construct.b.page2.sfgc001"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgc001
            
            #add-point:AFTER FIELD sfgc001 name="construct.a.page2.sfgc001"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgc002
            #add-point:BEFORE FIELD sfgc002 name="construct.b.page2.sfgc002"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgc002
            
            #add-point:AFTER FIELD sfgc002 name="construct.a.page2.sfgc002"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfgc002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgc002
            #add-point:ON ACTION controlp INFIELD sfgc002 name="construct.c.page2.sfgc002"
                                                                                                
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgc003
            #add-point:BEFORE FIELD sfgc003 name="construct.b.page2.sfgc003"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgc003
            
            #add-point:AFTER FIELD sfgc003 name="construct.a.page2.sfgc003"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfgc003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgc003
            #add-point:ON ACTION controlp INFIELD sfgc003 name="construct.c.page2.sfgc003"
                                                                                                
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgc004
            #add-point:BEFORE FIELD sfgc004 name="construct.b.page2.sfgc004"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgc004
            
            #add-point:AFTER FIELD sfgc004 name="construct.a.page2.sfgc004"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfgc004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgc004
            #add-point:ON ACTION controlp INFIELD sfgc004 name="construct.c.page2.sfgc004"
                                                                                                
            #END add-point
 
 
         #Ctrlp:construct.c.page2.sfgc005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgc005
            #add-point:ON ACTION controlp INFIELD sfgc005 name="construct.c.page2.sfgc005"
                                                                                                            #此段落由子樣板a08產生
            #開窗c段

            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgc005
            #add-point:BEFORE FIELD sfgc005 name="construct.b.page2.sfgc005"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgc005
            
            #add-point:AFTER FIELD sfgc005 name="construct.a.page2.sfgc005"
                                                                                                
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgc006
            #add-point:BEFORE FIELD sfgc006 name="construct.b.page2.sfgc006"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgc006
            
            #add-point:AFTER FIELD sfgc006 name="construct.a.page2.sfgc006"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfgc006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgc006
            #add-point:ON ACTION controlp INFIELD sfgc006 name="construct.c.page2.sfgc006"
                                                                                                
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgcsite
            #add-point:BEFORE FIELD sfgcsite name="construct.b.page2.sfgcsite"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgcsite
            
            #add-point:AFTER FIELD sfgcsite name="construct.a.page2.sfgcsite"
                                                                                                
            #END add-point
            
 
 
         #Ctrlp:construct.c.page2.sfgcsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgcsite
            #add-point:ON ACTION controlp INFIELD sfgcsite name="construct.c.page2.sfgcsite"
                                                                                                
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
 
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "sfga_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "sfgb_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "sfgc_t" 
                     LET g_wc2_table2 = la_wc[li_idx].wc
 
 
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
 
 
 
 
   
   #add-point:cs段結束前 name="cs.after_construct"
                        
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="asrt336.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION asrt336_filter()
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
      CONSTRUCT g_wc_filter ON sfgadocno,sfgadocdt,sfga002,sfga003
                          FROM s_browse[1].b_sfgadocno,s_browse[1].b_sfgadocdt,s_browse[1].b_sfga002, 
                              s_browse[1].b_sfga003
 
         BEFORE CONSTRUCT
               DISPLAY asrt336_filter_parser('sfgadocno') TO s_browse[1].b_sfgadocno
            DISPLAY asrt336_filter_parser('sfgadocdt') TO s_browse[1].b_sfgadocdt
            DISPLAY asrt336_filter_parser('sfga002') TO s_browse[1].b_sfga002
            DISPLAY asrt336_filter_parser('sfga003') TO s_browse[1].b_sfga003
      
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
 
      CALL asrt336_filter_show('sfgadocno')
   CALL asrt336_filter_show('sfgadocdt')
   CALL asrt336_filter_show('sfga002')
   CALL asrt336_filter_show('sfga003')
 
END FUNCTION
 
{</section>}
 
{<section id="asrt336.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION asrt336_filter_parser(ps_field)
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
 
{<section id="asrt336.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION asrt336_filter_show(ps_field)
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
   LET ls_condition = asrt336_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="asrt336.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION asrt336_query()
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
   CALL g_sfgb_d.clear()
   CALL g_sfgb2_d.clear()
 
   
   #add-point:query段other name="query.other"
                        
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL asrt336_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL asrt336_browser_fill("")
      CALL asrt336_fetch("")
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
 
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
      CALL asrt336_filter_show('sfgadocno')
   CALL asrt336_filter_show('sfgadocdt')
   CALL asrt336_filter_show('sfga002')
   CALL asrt336_filter_show('sfga003')
   CALL asrt336_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL asrt336_fetch("F") 
      #顯示單身筆數
      CALL asrt336_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="asrt336.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION asrt336_fetch(p_flag)
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
   
   LET g_sfga_m.sfgadocno = g_browser[g_current_idx].b_sfgadocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE asrt336_master_referesh USING g_sfga_m.sfgadocno INTO g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt, 
       g_sfga_m.sfga002,g_sfga_m.sfga001,g_sfga_m.sfga003,g_sfga_m.sfgastus,g_sfga_m.sfgasite,g_sfga_m.sfga011, 
       g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,g_sfga_m.sfga007,g_sfga_m.sfga008, 
       g_sfga_m.sfga009,g_sfga_m.sfga010,g_sfga_m.sfgaownid,g_sfga_m.sfgaowndp,g_sfga_m.sfgacrtid,g_sfga_m.sfgacrtdp, 
       g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid,g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid,g_sfga_m.sfgacnfdt, 
       g_sfga_m.sfgapstid,g_sfga_m.sfgapstdt,g_sfga_m.sfga002_desc,g_sfga_m.sfga003_desc,g_sfga_m.sfga011_desc, 
       g_sfga_m.sfga006_desc,g_sfga_m.sfgaownid_desc,g_sfga_m.sfgaowndp_desc,g_sfga_m.sfgacrtid_desc, 
       g_sfga_m.sfgacrtdp_desc,g_sfga_m.sfgamodid_desc,g_sfga_m.sfgacnfid_desc,g_sfga_m.sfgapstid_desc 
 
   
   #遮罩相關處理
   LET g_sfga_m_mask_o.* =  g_sfga_m.*
   CALL asrt336_sfga_t_mask()
   LET g_sfga_m_mask_n.* =  g_sfga_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt336_set_act_visible()   
   CALL asrt336_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
                        
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
                        
   #end add-point
   
   #保存單頭舊值
   LET g_sfga_m_t.* = g_sfga_m.*
   LET g_sfga_m_o.* = g_sfga_m.*
   
   LET g_data_owner = g_sfga_m.sfgaownid      
   LET g_data_dept  = g_sfga_m.sfgaowndp
   
   #重新顯示   
   CALL asrt336_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt336.insert" >}
#+ 資料新增
PRIVATE FUNCTION asrt336_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE  l_sffb009             LIKE sffb_t.sffb009                        
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_sfgb_d.clear()   
   CALL g_sfgb2_d.clear()  
 
 
   INITIALIZE g_sfga_m.* TO NULL             #DEFAULT 設定
   
   LET g_sfgadocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_sfga_m.sfgaownid = g_user
      LET g_sfga_m.sfgaowndp = g_dept
      LET g_sfga_m.sfgacrtid = g_user
      LET g_sfga_m.sfgacrtdp = g_dept 
      LET g_sfga_m.sfgacrtdt = cl_get_current()
      LET g_sfga_m.sfgamodid = g_user
      LET g_sfga_m.sfgamoddt = cl_get_current()
      LET g_sfga_m.sfgastus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_sfga_m.sfga009 = "0"
 
  
      #add-point:單頭預設值 name="insert.default"
      #CALL s_asrt335_default_sffb('3','','','','','','') RETURNING    #161228-00028#2 mark
      CALL s_asrt335_default_sffb('13','','','','','','') RETURNING    #161228-00028#2 
               g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga007,g_sfga_m.sfga008,l_sffb009
      LET g_sfga_m.sfgadocdt = cl_get_today()
      LET g_sfga_m.sfga001 = cl_get_today()
      LET g_sfga_m.sfga002 = g_user
      LET g_sfga_m.sfga002_desc = s_desc_get_person_desc(g_sfga_m.sfga002)
      DISPLAY BY NAME g_sfga_m.sfga002_desc
      LET g_sfga_m.sfga003 = g_dept
      LET g_sfga_m.sfga003_desc = s_desc_get_department_desc(g_sfga_m.sfga003)
      DISPLAY BY NAME g_sfga_m.sfga002_desc,g_sfga_m.sfga003_desc
      LET g_sfga_m.sfga008 = 0
      LET g_sfga_m.sfgastus = 'N'
      LET g_sfga_m_t.* = g_sfga_m.*  
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_sfga_m_t.* = g_sfga_m.*
      LET g_sfga_m_o.* = g_sfga_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sfga_m.sfgastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
    
      CALL asrt336_input("a")
      
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
         INITIALIZE g_sfga_m.* TO NULL
         INITIALIZE g_sfgb_d TO NULL
         INITIALIZE g_sfgb2_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL asrt336_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_sfgb_d.clear()
      #CALL g_sfgb2_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt336_set_act_visible()   
   CALL asrt336_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sfgadocno_t = g_sfga_m.sfgadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " sfgaent = " ||g_enterprise|| " AND",
                      " sfgadocno = '", g_sfga_m.sfgadocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL asrt336_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE asrt336_cl
   
   CALL asrt336_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE asrt336_master_referesh USING g_sfga_m.sfgadocno INTO g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt, 
       g_sfga_m.sfga002,g_sfga_m.sfga001,g_sfga_m.sfga003,g_sfga_m.sfgastus,g_sfga_m.sfgasite,g_sfga_m.sfga011, 
       g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,g_sfga_m.sfga007,g_sfga_m.sfga008, 
       g_sfga_m.sfga009,g_sfga_m.sfga010,g_sfga_m.sfgaownid,g_sfga_m.sfgaowndp,g_sfga_m.sfgacrtid,g_sfga_m.sfgacrtdp, 
       g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid,g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid,g_sfga_m.sfgacnfdt, 
       g_sfga_m.sfgapstid,g_sfga_m.sfgapstdt,g_sfga_m.sfga002_desc,g_sfga_m.sfga003_desc,g_sfga_m.sfga011_desc, 
       g_sfga_m.sfga006_desc,g_sfga_m.sfgaownid_desc,g_sfga_m.sfgaowndp_desc,g_sfga_m.sfgacrtid_desc, 
       g_sfga_m.sfgacrtdp_desc,g_sfga_m.sfgamodid_desc,g_sfga_m.sfgacnfid_desc,g_sfga_m.sfgapstid_desc 
 
   
   
   #遮罩相關處理
   LET g_sfga_m_mask_o.* =  g_sfga_m.*
   CALL asrt336_sfga_t_mask()
   LET g_sfga_m_mask_n.* =  g_sfga_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt,g_sfga_m.sfga002,g_sfga_m.sfga002_desc,g_sfga_m.sfgadocno_desc, 
       g_sfga_m.sfga001,g_sfga_m.sfga003,g_sfga_m.sfga003_desc,g_sfga_m.sfgastus,g_sfga_m.sfgasite,g_sfga_m.sfga011, 
       g_sfga_m.sfga011_desc,g_sfga_m.sfga012,g_sfga_m.imaal003,g_sfga_m.imaal004,g_sfga_m.sfga013,g_sfga_m.sfga014, 
       g_sfga_m.sfga006,g_sfga_m.sfga006_desc,g_sfga_m.sfga007,g_sfga_m.sfga008,g_sfga_m.sfga009,g_sfga_m.sfga010, 
       g_sfga_m.sfgaownid,g_sfga_m.sfgaownid_desc,g_sfga_m.sfgaowndp,g_sfga_m.sfgaowndp_desc,g_sfga_m.sfgacrtid, 
       g_sfga_m.sfgacrtid_desc,g_sfga_m.sfgacrtdp,g_sfga_m.sfgacrtdp_desc,g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid, 
       g_sfga_m.sfgamodid_desc,g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid,g_sfga_m.sfgacnfid_desc,g_sfga_m.sfgacnfdt, 
       g_sfga_m.sfgapstid,g_sfga_m.sfgapstid_desc,g_sfga_m.sfgapstdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_sfga_m.sfgaownid      
   LET g_data_dept  = g_sfga_m.sfgaowndp
   
   #功能已完成,通報訊息中心
   CALL asrt336_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.modify" >}
#+ 資料修改
PRIVATE FUNCTION asrt336_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point    
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING
   DEFINE l_wc2_table2   STRING
 
 
 
   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   IF g_sfga_m.sfgastus <> 'N' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'apm-00035'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN
   END IF                        
   #end add-point    
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
   #保存單頭舊值
   LET g_sfga_m_t.* = g_sfga_m.*
   LET g_sfga_m_o.* = g_sfga_m.*
   
   IF g_sfga_m.sfgadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_sfgadocno_t = g_sfga_m.sfgadocno
 
   CALL s_transaction_begin()
   
   OPEN asrt336_cl USING g_enterprise,g_sfga_m.sfgadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt336_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE asrt336_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE asrt336_master_referesh USING g_sfga_m.sfgadocno INTO g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt, 
       g_sfga_m.sfga002,g_sfga_m.sfga001,g_sfga_m.sfga003,g_sfga_m.sfgastus,g_sfga_m.sfgasite,g_sfga_m.sfga011, 
       g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,g_sfga_m.sfga007,g_sfga_m.sfga008, 
       g_sfga_m.sfga009,g_sfga_m.sfga010,g_sfga_m.sfgaownid,g_sfga_m.sfgaowndp,g_sfga_m.sfgacrtid,g_sfga_m.sfgacrtdp, 
       g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid,g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid,g_sfga_m.sfgacnfdt, 
       g_sfga_m.sfgapstid,g_sfga_m.sfgapstdt,g_sfga_m.sfga002_desc,g_sfga_m.sfga003_desc,g_sfga_m.sfga011_desc, 
       g_sfga_m.sfga006_desc,g_sfga_m.sfgaownid_desc,g_sfga_m.sfgaowndp_desc,g_sfga_m.sfgacrtid_desc, 
       g_sfga_m.sfgacrtdp_desc,g_sfga_m.sfgamodid_desc,g_sfga_m.sfgacnfid_desc,g_sfga_m.sfgapstid_desc 
 
   
   #檢查是否允許此動作
   IF NOT asrt336_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_sfga_m_mask_o.* =  g_sfga_m.*
   CALL asrt336_sfga_t_mask()
   LET g_sfga_m_mask_n.* =  g_sfga_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
   #LET l_wc2_table2 = g_wc2_table2
   #LET l_wc2_table2 = " 1=1"
 
 
 
   
   CALL asrt336_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
   #LET  g_wc2_table2 = l_wc2_table2 
 
 
 
    
   WHILE TRUE
      LET g_sfgadocno_t = g_sfga_m.sfgadocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_sfga_m.sfgamodid = g_user 
LET g_sfga_m.sfgamoddt = cl_get_current()
LET g_sfga_m.sfgamodid_desc = cl_get_username(g_sfga_m.sfgamodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_sfga_m.sfgastus MATCHES "[DR]" THEN
         LET g_sfga_m.sfgastus = "N"
      END IF                                          
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL asrt336_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
                                                
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE sfga_t SET (sfgamodid,sfgamoddt) = (g_sfga_m.sfgamodid,g_sfga_m.sfgamoddt)
          WHERE sfgaent = g_enterprise AND sfgadocno = g_sfgadocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_sfga_m.* = g_sfga_m_t.*
            CALL asrt336_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_sfga_m.sfgadocno != g_sfga_m_t.sfgadocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
                                                                        
         #end add-point
         
         #更新單身key值
         UPDATE sfgb_t SET sfgbdocno = g_sfga_m.sfgadocno
 
          WHERE sfgbent = g_enterprise AND sfgbdocno = g_sfga_m_t.sfgadocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
                                                                        
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "sfgb_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sfgb_t:",SQLERRMESSAGE 
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
         
         UPDATE sfgc_t
            SET sfgcdocno = g_sfga_m.sfgadocno
 
          WHERE sfgcent = g_enterprise AND
                sfgcdocno = g_sfgadocno_t
 
         #add-point:單身fk修改中 name="modify.body.m_fk_update2"
                                                                        
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "sfgc_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sfgc_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         #add-point:單身fk修改後 name="modify.body.a_fk_update2"
                                                                        
         #end add-point
 
 
         
 
         
         #UPDATE 多語言table key值
         
         
 
         CALL s_transaction_end('Y','0')
      END IF
    
      EXIT WHILE
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt336_set_act_visible()   
   CALL asrt336_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " sfgaent = " ||g_enterprise|| " AND",
                      " sfgadocno = '", g_sfga_m.sfgadocno, "' "
 
   #填到對應位置
   CALL asrt336_browser_fill("")
 
   CLOSE asrt336_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL asrt336_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="asrt336.input" >}
#+ 資料輸入
PRIVATE FUNCTION asrt336_input(p_cmd)
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
   DEFINE  l_ooef004             LIKE ooef_t.ooef004
   DEFINE  l_sfaa061             LIKE sfaa_t.sfaa061 
   DEFINE  l_sffb009             LIKE sffb_t.sffb009
   DEFINE  l_qty                 LIKE sfga_t.sfga008
   DEFINE  l_sfgc003_sum         LIKE sfgc_t.sfgc003
   DEFINE  l_sffb016             LIKE sffb_t.sffb016
   DEFINE  l_sffb005             LIKE sffb_t.sffb005   #暫時定義，待sub函數完成即可清除   
   DEFINE  l_success             LIKE type_t.num5   
   DEFINE l_year                LIKE type_t.num5
   DEFINE l_month               LIKE type_t.num5
   #170117-00038#1-s
   DEFINE ls_js        STRING
   DEFINE lc_param     RECORD
       sffbdocno  LIKE sffb_t.sffbdocno,  #報工單號
       sffbseq    LIKE sffb_t.sffbseq,    #項次
       sffb001    LIKE sffb_t.sffb001,    #報工類別  #170120-00043#1
       sffb005    LIKE sffb_t.sffb005,    #工單單號
       sffb006    LIKE sffb_t.sffb006,    #Run Card
       sffb007    LIKE sffb_t.sffb007,    #作業編號
       sffb008    LIKE sffb_t.sffb008,    #製程式
       sffb017    LIKE sffb_t.sffb017,    #良品數量
       sffb018    LIKE sffb_t.sffb018,    #報廢數量
       sffb019    LIKE sffb_t.sffb019,    #當站下線數量
       sffb020    LIKE sffb_t.sffb020     #回收數量
                   END RECORD
   #170117-00038#1-e
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
   DISPLAY BY NAME g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt,g_sfga_m.sfga002,g_sfga_m.sfga002_desc,g_sfga_m.sfgadocno_desc, 
       g_sfga_m.sfga001,g_sfga_m.sfga003,g_sfga_m.sfga003_desc,g_sfga_m.sfgastus,g_sfga_m.sfgasite,g_sfga_m.sfga011, 
       g_sfga_m.sfga011_desc,g_sfga_m.sfga012,g_sfga_m.imaal003,g_sfga_m.imaal004,g_sfga_m.sfga013,g_sfga_m.sfga014, 
       g_sfga_m.sfga006,g_sfga_m.sfga006_desc,g_sfga_m.sfga007,g_sfga_m.sfga008,g_sfga_m.sfga009,g_sfga_m.sfga010, 
       g_sfga_m.sfgaownid,g_sfga_m.sfgaownid_desc,g_sfga_m.sfgaowndp,g_sfga_m.sfgaowndp_desc,g_sfga_m.sfgacrtid, 
       g_sfga_m.sfgacrtid_desc,g_sfga_m.sfgacrtdp,g_sfga_m.sfgacrtdp_desc,g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid, 
       g_sfga_m.sfgamodid_desc,g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid,g_sfga_m.sfgacnfid_desc,g_sfga_m.sfgacnfdt, 
       g_sfga_m.sfgapstid,g_sfga_m.sfgapstid_desc,g_sfga_m.sfgapstdt
   
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
   LET g_forupd_sql = "SELECT sfgbseq,sfgb001,sfgb002,sfgb003,sfgbsite FROM sfgb_t WHERE sfgbent=? AND  
       sfgbdocno=? AND sfgbseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
                        
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt336_bcl CURSOR FROM g_forupd_sql
   
   #add-point:input段define_sql name="input.define_sql2"
                        
   #end add-point    
   LET g_forupd_sql = "SELECT sfgcseq,sfgc001,sfgc002,sfgc003,sfgc004,sfgc005,sfgc006,sfgcsite FROM  
       sfgc_t WHERE sfgcent=? AND sfgcdocno=? AND sfgcseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql2"
                        
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt336_bcl2 CURSOR FROM g_forupd_sql
 
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
                        
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL asrt336_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
                        
   #end add-point
   CALL asrt336_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt,g_sfga_m.sfga002,g_sfga_m.sfga001,g_sfga_m.sfga003, 
       g_sfga_m.sfgastus,g_sfga_m.sfgasite,g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.imaal003,g_sfga_m.imaal004, 
       g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,g_sfga_m.sfga007,g_sfga_m.sfga008,g_sfga_m.sfga009, 
       g_sfga_m.sfga010
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
                        
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="asrt336.input.head" >}
      #單頭段
      INPUT BY NAME g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt,g_sfga_m.sfga002,g_sfga_m.sfga001,g_sfga_m.sfga003, 
          g_sfga_m.sfgastus,g_sfga_m.sfgasite,g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.imaal003,g_sfga_m.imaal004, 
          g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,g_sfga_m.sfga007,g_sfga_m.sfga008,g_sfga_m.sfga009, 
          g_sfga_m.sfga010 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN asrt336_cl USING g_enterprise,g_sfga_m.sfgadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt336_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt336_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL asrt336_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #栏位預設值
            
            
            LET g_sfga_m.sfgasite = g_site 
            CALL asrt336_set_no_required()
            CALL asrt336_set_required()            
            #end add-point
            CALL asrt336_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgadocno
            
            #add-point:AFTER FIELD sfgadocno name="input.a.sfgadocno"
                                                                                                            #此段落由子樣板a05產生
            IF  NOT cl_null(g_sfga_m.sfgadocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfga_m.sfgadocno != g_sfgadocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sfga_t WHERE "||"sfgaent = '" ||g_enterprise|| "' AND "||"sfgadocno = '"||g_sfga_m.sfgadocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            IF NOT cl_null(g_sfga_m.sfgadocno) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sfga_m_t.sfgadocno IS NULL OR g_sfga_m.sfgadocno <> g_sfga_m_t.sfgadocno)) THEN  
#有单别检查单别，是完整单号检查完整单号，传入完整单号的话，会截取单别做单别合法性检查               
                  IF NOT s_aooi200_chk_docno(g_site,g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt,g_prog) THEN
                     LET g_sfga_m.sfgadocno = g_sfgadocno_t
                     NEXT FIELD CURRENT
                  END IF
                  
               END IF
            END IF 
            LET g_sfga_m.sfgadocno_desc = s_aooi200_get_slip_desc(g_sfga_m.sfgadocno)
            DISPLAY BY NAME g_sfga_m.sfgadocno_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgadocno
            #add-point:BEFORE FIELD sfgadocno name="input.b.sfgadocno"
                                                                                                
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgadocno
            #add-point:ON CHANGE sfgadocno name="input.g.sfgadocno"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgadocdt
            #add-point:BEFORE FIELD sfgadocdt name="input.b.sfgadocdt"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgadocdt
            
            #add-point:AFTER FIELD sfgadocdt name="input.a.sfgadocdt"
            IF  NOT cl_null(g_sfga_m.sfgadocdt) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfga_m_t.sfgadocdt IS NULL OR g_sfga_m.sfgadocdt != g_sfga_m_t.sfgadocdt)) THEN 
                  IF NOT s_date_chk_close(g_sfga_m.sfgadocdt,'1') THEN

                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgadocdt
            #add-point:ON CHANGE sfgadocdt name="input.g.sfgadocdt"
                                                                                                
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga002
            
            #add-point:AFTER FIELD sfga002 name="input.a.sfga002"
            IF NOT cl_null(g_sfga_m.sfga002) THEN 
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sfga_m_t.sfga002 IS NULL OR g_sfga_m.sfga002 <> g_sfga_m_t.sfga002)) THEN
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sfga_m.sfga002
                  LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ooag001") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
   
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sfga_m.sfga002 = g_sfga_m_t.sfga002
                     NEXT FIELD CURRENT
                  END IF
               END IF
            

            END IF 
            LET g_sfga_m.sfga002_desc = s_desc_get_person_desc(g_sfga_m.sfga002)
            DISPLAY BY NAME g_sfga_m.sfga002_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga002
            #add-point:BEFORE FIELD sfga002 name="input.b.sfga002"
                                                                                                
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfga002
            #add-point:ON CHANGE sfga002 name="input.g.sfga002"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga001
            #add-point:BEFORE FIELD sfga001 name="input.b.sfga001"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga001
            
            #add-point:AFTER FIELD sfga001 name="input.a.sfga001"
            IF  NOT cl_null(g_sfga_m.sfga001) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfga_m_t.sfga001 IS NULL OR g_sfga_m.sfga001 != g_sfga_m_t.sfga001)) THEN 
                  IF NOT s_date_chk_close(g_sfga_m.sfga001,'1') THEN

                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF             
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfga001
            #add-point:ON CHANGE sfga001 name="input.g.sfga001"
                                                                                                
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga003
            
            #add-point:AFTER FIELD sfga003 name="input.a.sfga003"
            IF NOT cl_null(g_sfga_m.sfga003) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfga_m_t.sfga003 IS NULL OR g_sfga_m.sfga003 != g_sfga_m_t.sfga003)) THEN 
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sfga_m.sfga003
                  LET g_chkparam.arg2 = g_sfga_m.sfgadocdt
			         LET g_chkparam.err_str[1] = "aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"  #160318-00025#34  add
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_ooeg001_3") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
			      
                  ELSE
                     #檢查失敗時後續處理
                     LET g_sfga_m.sfga003 = g_sfga_m_t.sfga003
                     NEXT FIELD CURRENT
                  END IF
               END IF
            

            END IF 
            LET g_sfga_m.sfga003_desc = s_desc_get_department_desc(g_sfga_m.sfga003)
            DISPLAY BY NAME g_sfga_m.sfga003_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga003
            #add-point:BEFORE FIELD sfga003 name="input.b.sfga003"
                                                                                                
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfga003
            #add-point:ON CHANGE sfga003 name="input.g.sfga003"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgastus
            #add-point:BEFORE FIELD sfgastus name="input.b.sfgastus"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgastus
            
            #add-point:AFTER FIELD sfgastus name="input.a.sfgastus"
                                                                                                
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgastus
            #add-point:ON CHANGE sfgastus name="input.g.sfgastus"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgasite
            #add-point:BEFORE FIELD sfgasite name="input.b.sfgasite"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgasite
            
            #add-point:AFTER FIELD sfgasite name="input.a.sfgasite"
                                                                                                
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgasite
            #add-point:ON CHANGE sfgasite name="input.g.sfgasite"
                                                                                                
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga011
            
            #add-point:AFTER FIELD sfga011 name="input.a.sfga011"
            IF  NOT cl_null(g_sfga_m.sfga011) THEN 
              #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfga_m_t.sfga011 IS NULL OR g_sfga_m.sfga011 != g_sfga_m_t.sfga011)) THEN   #160824-00007#284 by sakura mark
               IF g_sfga_m_o.sfga011 IS NULL OR g_sfga_m.sfga011 != g_sfga_m_o.sfga011 THEN   #160824-00007#284 by sakura add
               #判断生產計畫+生產料號+BOM特性+產品特徵是否存在報工日期同年月的asrt300內
                  #CALL s_asrt335_chk_sffb('3',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,'','') RETURNING l_success #161228-00028#2 mark
                  CALL s_asrt335_chk_sffb('13',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,'','') RETURNING l_success #161228-00028#2 
                  IF NOT l_success THEN
                    #LET g_sfga_m.sfga011=g_sfga_m_t.sfga011   #160824-00007#284 by sakura mark
                     LET g_sfga_m.sfga011=g_sfga_m_o.sfga011   #160824-00007#284 by sakura add
                     NEXT FIELD CURRENT
                  ELSE 
                     #如果生產計劃只有一個料號，帶出該料號+BOM特徵+產品特徵作為默認值
                     LET l_year=YEAR(g_sfga_m.sfgadocdt)
                     LET l_month=MONTH(g_sfga_m.sfgadocdt)
                     SELECT COUNT(*) INTO l_count FROM srab_t 
                        LEFT JOIN sraa_t ON sraaent=srabent AND sraasite=srabsite AND sraa001=srab001 AND sraa002=srab002 AND sraa003=srab003
                        WHERE srabent=g_enterprise AND srabsite=g_site AND srab001=g_sfga_m.sfga011 AND srab002=l_year AND srab003=l_month AND sraastus='Y'
                     
                     IF l_count=1 THEN
                        SELECT srab004,srab005,srab006 INTO g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014 
                           FROM srab_t 
                           LEFT JOIN sraa_t ON sraaent=srabent AND sraasite=srabsite AND sraa001=srab001 AND sraa002=srab002 AND sraa003=srab003
                           WHERE srabsnt=g_enterprise AND srabsite=g_site AND srab001=g_sfga_m.sfga011 AND srab002=l_year AND srab003=l_month AND sraastus='Y'
                     END IF
                     
                  END IF
                  
               END IF
            END IF
            LET g_sfga_m_o.* = g_sfga_m.*   #160824-00007#284 by sakura add
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfga_m.sfga011
            CALL ap_ref_array2(g_ref_fields,"SELECT srza002 FROM srza_t WHERE srzaent='"||g_enterprise||"' AND srza001=? ","") RETURNING g_rtn_fields
            LET g_sfga_m.sfga011_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfga_m.sfga011_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga011
            #add-point:BEFORE FIELD sfga011 name="input.b.sfga011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfga011
            #add-point:ON CHANGE sfga011 name="input.g.sfga011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga012
            #add-point:BEFORE FIELD sfga012 name="input.b.sfga012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga012
            
            #add-point:AFTER FIELD sfga012 name="input.a.sfga012"
            IF  NOT cl_null(g_sfga_m.sfga012) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfga_m_t.sfga012 IS NULL OR g_sfga_m.sfga012 != g_sfga_m_t.sfga012)) THEN 
#                  INITIALIZE g_chkparam.* TO NULL
#
#                  #設定g_chkparam.*的參數
#                  LET g_chkparam.arg1 = g_sfga_m.sfga012
   
   
                  #呼叫檢查存在並帶值的library
#                  IF cl_chk_exist("v_imaf001_1") THEN
                     #檢查成功時後續處理

#                  ELSE
                     #檢查失敗時後續處理
#                     LET g_sfga_m.sfga012=g_sfga_m_t.sfga012
#                     NEXT FIELD CURRENT        
#                  END IF

                  #CALL s_asrt335_chk_sffb('3',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,'','') RETURNING l_success #161228-00028#2 mark
                  CALL s_asrt335_chk_sffb('13',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,'','') RETURNING l_success #161228-00028#2 
                  IF NOT l_success THEN
                     LET g_sfga_m.sfga012=g_sfga_m_t.sfga012
                     NEXT FIELD CURRENT
                  END IF
               END IF
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_sfga_m.sfga012
               CALL ap_ref_array2(g_ref_fields,"SELECT imaal003,imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_sfga_m.imaal003 = '', g_rtn_fields[1] , ''
               LET g_sfga_m.imaal004 = '', g_rtn_fields[2] , ''
               DISPLAY BY NAME g_sfga_m.imaal003,g_sfga_m.imaal004
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfga012
            #add-point:ON CHANGE sfga012 name="input.g.sfga012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD imaal003
            #add-point:BEFORE FIELD imaal003 name="input.b.imaal003"
                                                            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD imaal003
            
            #add-point:AFTER FIELD imaal003 name="input.a.imaal003"
                                                            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE imaal003
            #add-point:ON CHANGE imaal003 name="input.g.imaal003"
                                                            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD imaal004
            #add-point:BEFORE FIELD imaal004 name="input.b.imaal004"
                                                            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD imaal004
            
            #add-point:AFTER FIELD imaal004 name="input.a.imaal004"
                                                            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE imaal004
            #add-point:ON CHANGE imaal004 name="input.g.imaal004"
                                                            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga013
            #add-point:BEFORE FIELD sfga013 name="input.b.sfga013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga013
            
            #add-point:AFTER FIELD sfga013 name="input.a.sfga013"
            IF  NOT cl_null(g_sfga_m.sfga013) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfga_m_t.sfga013 IS NULL OR g_sfga_m.sfga013 != g_sfga_m_t.sfga013)) THEN 
               #判断生產計畫+生產料號+BOM特性+產品特徵是否存在報工日期同年月的asrt300內
                  #CALL s_asrt335_chk_sffb('3',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,'','') RETURNING l_success  #161228-00028#2 mark
                  CALL s_asrt335_chk_sffb('13',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,'','') RETURNING l_success  #161228-00028#2 
                  IF NOT l_success THEN
                     LET g_sfga_m.sfga013=g_sfga_m_t.sfga013
                     NEXT FIELD CURRENT
                  END IF
                  
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfga013
            #add-point:ON CHANGE sfga013 name="input.g.sfga013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga014
            #add-point:BEFORE FIELD sfga014 name="input.b.sfga014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga014
            
            #add-point:AFTER FIELD sfga014 name="input.a.sfga014"
            IF  NOT cl_null(g_sfga_m.sfga014) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sfga_m_t.sfga014 IS NULL OR g_sfga_m.sfga014 != g_sfga_m_t.sfga014)) THEN 
               #判断生產計畫+生產料號+BOM特性+產品特徵是否存在報工日期同年月的asrt300內
                  #CALL s_asrt335_chk_sffb('3',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,'','') RETURNING l_success #161228-00028#2
                  CALL s_asrt335_chk_sffb('13',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,'','') RETURNING l_success #161228-00028#2
                  IF NOT l_success THEN
                     LET g_sfga_m.sfga014=g_sfga_m_t.sfga014
                     NEXT FIELD CURRENT
                  END IF
                  
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfga014
            #add-point:ON CHANGE sfga014 name="input.g.sfga014"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga006
            
            #add-point:AFTER FIELD sfga006 name="input.a.sfga006"
#当工单栏位是新增或者修改后，如果对应的run card是唯一的，则预设到run card栏位
#预设工单对应的其他资料
            IF NOT cl_null(g_sfga_m.sfga006) THEN 
               IF p_cmd = 'a' OR (p_cmd ='u' AND (g_sfga_m_t.sfga006 IS NULL OR g_sfga_m.sfga006 != g_sfga_m_t.sfga006)) THEN 
                  #CALL s_asrt335_chk_sffb('3',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,'') RETURNING l_success  #161228-00028#2
                  CALL s_asrt335_chk_sffb('13',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,'') RETURNING l_success  #161228-00028#2
                  IF NOT l_success THEN
                     LET g_sfga_m.sfga006 = g_sfga_m_t.sfga006
                     #檢查失敗時後續處理
                     NEXT FIELD CURRENT
                  END IF
                           
#                  CALL s_asft335_default_sffb056('3','','',g_sfga_m.sfga006,g_sfga_m.sfga007)
#                  RETURNING g_sfga_m.sfga012,l_sffb005,g_sfga_m.sfga006,g_sfga_m.sfga007,l_sffb009                
#display工单对应料件的品名规格                                   
#                  CALL s_desc_get_item_desc(g_sfga_m.sfga012)
#                  RETURNING g_sfga_m.imaal003,g_sfga_m.imaal004 
#                  DISPLAY BY NAME g_sfga_m.sfga012,g_sfga_m.imaal003,g_sfga_m.imaal004,g_sfga_m.sfga006,g_sfga_m.sfga007
               END IF
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfga_m.sfga006
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfga_m.sfga006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfga_m.sfga006_desc   
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga006
            #add-point:BEFORE FIELD sfga006 name="input.b.sfga006"
                                                                                                
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfga006
            #add-point:ON CHANGE sfga006 name="input.g.sfga006"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga007
            #add-point:BEFORE FIELD sfga007 name="input.b.sfga007"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga007
            
            #add-point:AFTER FIELD sfga007 name="input.a.sfga007"
#当工单栏位是新增或者修改后，如果对应的run card是唯一的，则预设到run card栏位
#预设工单对应的其他资料
            IF NOT cl_null(g_sfga_m.sfga007) THEN 
               IF p_cmd = 'a' OR (p_cmd ='u' AND (g_sfga_m_t.sfga007 IS NULL OR g_sfga_m.sfga007 != g_sfga_m_t.sfga007)) THEN 
                  #CALL s_asrt335_chk_sffb('3',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,g_sfga_m.sfga007) RETURNING l_success  #161228-00028#2 mark
                  CALL s_asrt335_chk_sffb('13',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,g_sfga_m.sfga007) RETURNING l_success  #161228-00028#2 
                  IF NOT l_success THEN
                     LET g_sfga_m.sfga007 = g_sfga_m_t.sfga007
                     #檢查失敗時後續處理
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF                                     
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfga007
            #add-point:ON CHANGE sfga007 name="input.g.sfga007"
                                                                                                
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga008
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfga_m.sfga008,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD sfga008
            END IF 
 
 
 
            #add-point:AFTER FIELD sfga008 name="input.a.sfga008"
                                                                                                
            IF NOT cl_null(g_sfga_m.sfga008) THEN 
              #IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_sfga_m_t.sfga008 IS NULL OR g_sfga_m.sfga008 <> g_sfga_m_t.sfga008)) THEN   #160824-00007#284 by sakura mark
               IF g_sfga_m_o.sfga008 IS NULL OR g_sfga_m.sfga008 <> g_sfga_m_o.sfga008 THEN   #160824-00007#284 by sakura add
                  #CALL s_asrt335_set_qty('','','3',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga007,g_sfga_m.sfga008)   #161228-00028#2 mark
                  CALL s_asrt335_set_qty('','','13',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga007,g_sfga_m.sfga008)   #161228-00028#2
                   RETURNING l_qty,l_sffb016
                  IF NOT s_asrt335_chk_qty(g_sfga_m.sfgadocno,'',g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga007,g_sfga_m.sfga008,0,0,l_qty) THEN 
                    #LET g_sfga_m.sfga008 = g_sfga_m_t.sfga008   #160824-00007#284 by sakura mark
                     LET g_sfga_m.sfga008 = g_sfga_m_o.sfga008   #160824-00007#284 by sakura add
                     NEXT FIELD CURRENT
                  END IF
                  CALL s_aooi200_get_slip(g_sfga_m.sfgadocno) RETURNING l_success,g_doc_slip
                  IF cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0060') = 'N' THEN    #不使用判定流程
                     LET g_sfga_m.sfga009 = g_sfga_m.sfga008
                  END IF
               END IF
            END IF
            LET g_sfga_m_o.* = g_sfga_m.*   #160824-00007#284 by sakura add        
            CALL asrt336_set_no_entry(p_cmd)

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga008
            #add-point:BEFORE FIELD sfga008 name="input.b.sfga008"
            CALL asrt336_set_entry(p_cmd)                        
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfga008
            #add-point:ON CHANGE sfga008 name="input.g.sfga008"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga009
            #add-point:BEFORE FIELD sfga009 name="input.b.sfga009"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga009
            
            #add-point:AFTER FIELD sfga009 name="input.a.sfga009"
            #170117-00038#1-s
            #IF NOT s_asft335_chk_qty('','',g_sfga_m.sfga006,g_sfga_m.sfga007,0,g_sfga_m.sfga009,0,0,g_sfga_m.sfga008) THEN
            LET lc_param.sffbdocno = ''                #報工單號
            LET lc_param.sffbseq   = ''                #項次
            LET lc_param.sffb001   = ''                #報工類別  #170120-00043#1
            LET lc_param.sffb005   = ''                #工單單號
            LET lc_param.sffb006   = ''                #Run Card
            LET lc_param.sffb007   = g_sfga_m.sfga006  #作業編號
            LET lc_param.sffb008   = g_sfga_m.sfga007  #製程式
            LET lc_param.sffb017   = 0                 #良品數量
            LET lc_param.sffb018   = g_sfga_m.sfga009  #報廢數量
            LET lc_param.sffb019   = 0                 #當站下線數量
            LET lc_param.sffb020   = 0                 #回收數量
            LET ls_js = util.JSON.stringify(lc_param)
            IF NOT s_asft335_chk_qty(ls_js) THEN
            #170117-00038#1-e
               LET g_sfga_m.sfga009 = g_sfga_m_t.sfga009
               NEXT FIELD CURRENT
            END IF            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfga009
            #add-point:ON CHANGE sfga009 name="input.g.sfga009"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfga010
            #add-point:BEFORE FIELD sfga010 name="input.b.sfga010"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfga010
            
            #add-point:AFTER FIELD sfga010 name="input.a.sfga010"
                                                                                                
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfga010
            #add-point:ON CHANGE sfga010 name="input.g.sfga010"
                                                                                                
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.sfgadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgadocno
            #add-point:ON ACTION controlp INFIELD sfgadocno name="input.c.sfgadocno"
                                                                                                #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfga_m.sfgadocno             #給予default值

            #給予arg
            SELECT ooef004 INTO l_ooef004 
              FROM ooef_t
             WHERE ooefent = g_enterprise
               AND ooef001 = g_site
               
            LET g_qryparam.arg1 = l_ooef004          #
            LET g_qryparam.arg2 = g_prog      #
            CALL q_ooba002_1()                                      #呼叫開窗

            LET g_sfga_m.sfgadocno = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfga_m.sfgadocno TO sfgadocno              #顯示到畫面上
            LET g_sfga_m.sfgadocno_desc = s_aooi200_get_slip_desc(g_sfga_m.sfgadocno)
            DISPLAY BY NAME g_sfga_m.sfgadocno_desc
            NEXT FIELD sfgadocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfgadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgadocdt
            #add-point:ON ACTION controlp INFIELD sfgadocdt name="input.c.sfgadocdt"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.sfga002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga002
            #add-point:ON ACTION controlp INFIELD sfga002 name="input.c.sfga002"
                                                                                                #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfga_m.sfga002             #給予default值

            #給予arg

            CALL q_ooag001_4()                                #呼叫開窗

            LET g_sfga_m.sfga002 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfga_m.sfga002 TO sfga002              #顯示到畫面上
            LET g_sfga_m.sfga002_desc = s_desc_get_person_desc(g_sfga_m.sfga002)
            DISPLAY BY NAME g_sfga_m.sfga002_desc
            NEXT FIELD sfga002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfga001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga001
            #add-point:ON ACTION controlp INFIELD sfga001 name="input.c.sfga001"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.sfga003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga003
            #add-point:ON ACTION controlp INFIELD sfga003 name="input.c.sfga003"
                                                                                                #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfga_m.sfga003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_sfga_m.sfgadocdt

            CALL q_ooeg001()                                #呼叫開窗

            LET g_sfga_m.sfga003 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfga_m.sfga003 TO sfga003              #顯示到畫面上
            LET g_sfga_m.sfga003_desc = s_desc_get_department_desc(g_sfga_m.sfga003)
            DISPLAY BY NAME g_sfga_m.sfga003_desc
            NEXT FIELD sfga003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfgastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgastus
            #add-point:ON ACTION controlp INFIELD sfgastus name="input.c.sfgastus"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.sfgasite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgasite
            #add-point:ON ACTION controlp INFIELD sfgasite name="input.c.sfgasite"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.sfga011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga011
            #add-point:ON ACTION controlp INFIELD sfga011 name="input.c.sfga011"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfga_m.sfga011             #給予default值

            #給予arg
            IF NOT cl_null(g_sfga_m.sfgadocdt) THEN
               LET l_year = YEAR(g_sfga_m.sfgadocdt)
               LET l_month = MONTH(g_sfga_m.sfgadocdt)
               LET g_qryparam.where = " sraa002 ='",l_year,"' AND sraa003 = '",l_month,"'"
            END IF


            CALL q_sraa001()                                #呼叫開窗

            LET g_sfga_m.sfga011 = g_qryparam.return1              

            DISPLAY g_sfga_m.sfga011 TO sfga011              #

            NEXT FIELD sfga011                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfga012
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga012
            #add-point:ON ACTION controlp INFIELD sfga012 name="input.c.sfga012"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfga_m.sfga012             #給予default值
            IF NOT cl_null(g_sfga_m.sfgadocdt) THEN
               LET l_year = YEAR(g_sfga_m.sfgadocdt)
               LET l_month = MONTH(g_sfga_m.sfgadocdt)
               LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
            END IF
            IF NOT cl_null(g_sfga_m.sfga011) THEN
               LET g_qryparam.where = " srab001 = '",g_sfga_m.sfga011,"'"
            END IF
            IF NOT cl_null(g_sfga_m.sfgadocdt) AND NOT cl_null(g_sfga_m.sfga011) THEN
               LET g_qryparam.where = " srab001 = '",g_sfga_m.sfga011,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
            END IF
            CALL q_srab004()                                #呼叫開窗

            LET g_sfga_m.sfga012 = g_qryparam.return1              
            LET g_sfga_m.sfga013 = g_qryparam.return2
            LET g_sfga_m.sfga014 = g_qryparam.return3
            #LET g_sfga_m.bmaa002 = g_qryparam.return4 
            DISPLAY g_sfga_m.sfga012 TO sfga012              #
            #DISPLAY g_sfga_m.imaal004 TO imaal004 #規格
            #DISPLAY g_sfga_m.bmaa001 TO bmaa001 #主件料號
            #DISPLAY g_sfga_m.bmaa002 TO bmaa002 #特性
            NEXT FIELD sfga012                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.imaal003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD imaal003
            #add-point:ON ACTION controlp INFIELD imaal003 name="input.c.imaal003"
                                                            
            #END add-point
 
 
         #Ctrlp:input.c.imaal004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD imaal004
            #add-point:ON ACTION controlp INFIELD imaal004 name="input.c.imaal004"
                                                            
            #END add-point
 
 
         #Ctrlp:input.c.sfga013
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga013
            #add-point:ON ACTION controlp INFIELD sfga013 name="input.c.sfga013"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfga_m.sfga013             #給予default值

            #給予arg
            IF NOT cl_null(g_sfga_m.sfgadocdt) THEN
               LET l_year = YEAR(g_sfga_m.sfgadocdt)
               LET l_month = MONTH(g_sfga_m.sfgadocdt)
               LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
               IF NOT cl_null(g_sfga_m.sfga012) THEN
                  LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfga_m.sfga012,"'"
               END IF
            END IF
            IF NOT cl_null(g_sfga_m.sfga011) THEN
               LET g_qryparam.where = " srab001 = '",g_sfga_m.sfga011,"'"
               IF NOT cl_null(g_sfga_m.sfga012) THEN
                  LET g_qryparam.where = " srab001 = '",g_sfga_m.sfga011,"'  AND srab004 = '",g_sfga_m.sfga012,"'"
               END IF
            END IF
            IF NOT cl_null(g_sfga_m.sfgadocdt) AND NOT cl_null(g_sfga_m.sfga011) THEN
               LET g_qryparam.where = " srab001 = '",g_sfga_m.sfga011,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
               IF NOT cl_null(g_sfga_m.sfga012) THEN
                  LET g_qryparam.where = " srab001 = '",g_sfga_m.sfga011,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004='",g_sfga_m.sfga012,"'"
               END IF
            END IF
            CALL q_srab004()                                #呼叫開窗
            IF cl_null(g_sfga_m.sfga012) THEN
               LET g_sfga_m.sfga012 = g_qryparam.return1
            END IF
            LET g_sfga_m.sfga013 = g_qryparam.return2
            LET g_sfga_m.sfga014 = g_qryparam.return3

            DISPLAY g_sfga_m.sfga013 TO sfga013              #顯示到畫面上

            LET g_qryparam.where = ""
            NEXT FIELD sfga013                         #返回原欄位           

                        #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfga014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga014
            #add-point:ON ACTION controlp INFIELD sfga014 name="input.c.sfga014"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfga_m.sfga014             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_sfga_m.sfga012 #s
            IF NOT cl_null(g_sfga_m.sfgadocdt) THEN
               LET l_year = YEAR(g_sfga_m.sfgadocdt)
               LET l_month = MONTH(g_sfga_m.sfgadocdt)
               LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
               IF NOT cl_null(g_sfga_m.sfga012) THEN
                  LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfga_m.sfga012,"'"  
               END IF
               IF g_sfga_m.sfga013 IS NOT NULL THEN
                  LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab005 = '",g_sfga_m.sfga013,"'"  
               END IF
               IF NOT cl_null(g_sfga_m.sfga012) AND g_sfga_m.sfga013 IS NOT NULL THEN
                  LET g_qryparam.where = " srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfga_m.sfga012,"' AND srab005 = '",g_sfga_m.sfga013,"'"  
               END IF
            END IF
            IF NOT cl_null(g_sfga_m.sfga011) THEN
               LET g_qryparam.where = " srab001 = '",g_sfga_m.sfga011,"'"
               IF NOT cl_null(g_sfga_m.sfga012) THEN
                  LET g_qryparam.where = " srab001 = '",g_sfga_m.sfga011,"' AND srab004 = '",g_sfga_m.sfga012,"'"  
               END IF
               IF g_sfga_m.sfga013 IS NOT NULL THEN
                  LET g_qryparam.where = " srab001 = '",g_sfga_m.sfga011,"' AND srab005 = '",g_sfga_m.sfga013,"'"  
               END IF
               IF NOT cl_null(g_sfga_m.sfga012) AND g_sfga_m.sfga013 IS NOT NULL THEN
                  LET g_qryparam.where = " srab001 = '",g_sfga_m.sfga011,"' AND srab004 = '",g_sfga_m.sfga012,"' AND srab005 = '",g_sfga_m.sfga013,"'"  
               END IF
            END IF
            IF NOT cl_null(g_sfga_m.sfgadocdt) AND NOT cl_null(g_sfga_m.sfga011) THEN
               LET g_qryparam.where = " srab001 = '",g_sfga_m.sfga011,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"'"
               IF NOT cl_null(g_sfga_m.sfga012) THEN
                  LET g_qryparam.where = " srab001 = '",g_sfga_m.sfga011,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfga_m.sfga012,"'"  
               END IF
               IF g_sfga_m.sfga013 IS NOT NULL THEN
                  LET g_qryparam.where = " srab001 = '",g_sfga_m.sfga011,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab005 = '",g_sfga_m.sfga013,"'"  
               END IF
               IF NOT cl_null(g_sfga_m.sfga012) AND g_sfga_m.sfga013 IS NOT NULL THEN
                  LET g_qryparam.where = " srab001 = '",g_sfga_m.sfga011,"' AND srab002 ='",l_year,"' AND srab003 = '",l_month,"' AND srab004 = '",g_sfga_m.sfga012,"' AND srab005 = '",g_sfga_m.sfga013,"'"  
               END IF
            END IF
            CALL q_srab004()                                #呼叫開窗
            IF cl_null(g_sfga_m.sfga012) THEN
               LET g_sfga_m.sfga012 = g_qryparam.return1
            END IF
            IF cl_null(g_sfga_m.sfga013) THEN
               LET g_sfga_m.sfga013 = g_qryparam.return2
            END IF
            LET g_sfga_m.sfga014 = g_qryparam.return3
            DISPLAY g_sfga_m.sfga014 TO sfga014              #
            LET g_qryparam.where = ""
            NEXT FIELD sfga014                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sfga006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga006
            #add-point:ON ACTION controlp INFIELD sfga006 name="input.c.sfga006"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfga_m.sfga006             #給予default值
            LET g_qryparam.default2 = g_sfga_m.sfga007             #製程序

            #給予arg
            LET g_qryparam.arg1 = g_site
#            LET g_qryparam.arg2 = g_sfga_m.sfga004
#            LET g_qryparam.arg3 = g_sfga_m.sfga005

            CALL q_sfcb003_4()                                #呼叫開窗

            LET g_sfga_m.sfga006 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sfga_m.sfga007 = g_qryparam.return3 #製程序

            DISPLAY g_sfga_m.sfga006 TO sfga006              #顯示到畫面上
            DISPLAY g_sfga_m.sfga007 TO sfga007 #製程序
#            DISPLAY g_sfga_m.sfga004 TO sfga004              #顯示到畫面上
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfga_m.sfga006
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfga_m.sfga006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfga_m.sfga006_desc   
            NEXT FIELD CURRENT                                #返回原欄位

            #END add-point
 
 
         #Ctrlp:input.c.sfga007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga007
            #add-point:ON ACTION controlp INFIELD sfga007 name="input.c.sfga007"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfga_m.sfga006             #給予default值
            LET g_qryparam.default2 = g_sfga_m.sfga007             #製程序

            #給予arg
            LET g_qryparam.arg1 = g_site
#            LET g_qryparam.arg2 = g_sfga_m.sfga004
#            LET g_qryparam.arg3 = g_sfga_m.sfga005

            CALL q_sfcb003_4()                                       #呼叫開窗

            LET g_sfga_m.sfga006 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_sfga_m.sfga007 = g_qryparam.return3              #製程序

            DISPLAY g_sfga_m.sfga006 TO sfga006                    #顯示到畫面上
            DISPLAY g_sfga_m.sfga007 TO sfga007                    #製程序

            NEXT FIELD sfga007                                     #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.sfga008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga008
            #add-point:ON ACTION controlp INFIELD sfga008 name="input.c.sfga008"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.sfga009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga009
            #add-point:ON ACTION controlp INFIELD sfga009 name="input.c.sfga009"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.sfga010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfga010
            #add-point:ON ACTION controlp INFIELD sfga010 name="input.c.sfga010"
                                                                                                
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_sfga_m.sfgadocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_site,g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt,g_prog) RETURNING l_success,g_sfga_m.sfgadocno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_sfga_m.sfgadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CALL s_transaction_end('N','0')
                  NEXT FIELD CURRENT
               END IF  
               IF g_sfga_m.sfga006 IS NULL THEN LET g_sfga_m.sfga006 = ' ' END IF
               IF g_sfga_m.sfga007 IS NULL THEN LET g_sfga_m.sfga007 = ' ' END IF               
               #end add-point
               
               INSERT INTO sfga_t (sfgaent,sfgadocno,sfgadocdt,sfga002,sfga001,sfga003,sfgastus,sfgasite, 
                   sfga011,sfga012,sfga013,sfga014,sfga006,sfga007,sfga008,sfga009,sfga010,sfgaownid, 
                   sfgaowndp,sfgacrtid,sfgacrtdp,sfgacrtdt,sfgamodid,sfgamoddt,sfgacnfid,sfgacnfdt,sfgapstid, 
                   sfgapstdt)
               VALUES (g_enterprise,g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt,g_sfga_m.sfga002,g_sfga_m.sfga001, 
                   g_sfga_m.sfga003,g_sfga_m.sfgastus,g_sfga_m.sfgasite,g_sfga_m.sfga011,g_sfga_m.sfga012, 
                   g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,g_sfga_m.sfga007,g_sfga_m.sfga008, 
                   g_sfga_m.sfga009,g_sfga_m.sfga010,g_sfga_m.sfgaownid,g_sfga_m.sfgaowndp,g_sfga_m.sfgacrtid, 
                   g_sfga_m.sfgacrtdp,g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid,g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid, 
                   g_sfga_m.sfgacnfdt,g_sfga_m.sfgapstid,g_sfga_m.sfgapstdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_sfga_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
                                                                                                                        
               #end add-point
               
               
               
               
               #add-point:單頭新增後 name="input.head.a_insert"
                                                                                                                        
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL asrt336_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL asrt336_b_fill()
                  CALL asrt336_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               IF g_sfga_m.sfga006 IS NULL THEN LET g_sfga_m.sfga006 = ' ' END IF
               IF g_sfga_m.sfga007 IS NULL THEN LET g_sfga_m.sfga007 = ' ' END IF                                                                                                                        
               #end add-point
               
               #將遮罩欄位還原
               CALL asrt336_sfga_t_mask_restore('restore_mask_o')
               
               UPDATE sfga_t SET (sfgadocno,sfgadocdt,sfga002,sfga001,sfga003,sfgastus,sfgasite,sfga011, 
                   sfga012,sfga013,sfga014,sfga006,sfga007,sfga008,sfga009,sfga010,sfgaownid,sfgaowndp, 
                   sfgacrtid,sfgacrtdp,sfgacrtdt,sfgamodid,sfgamoddt,sfgacnfid,sfgacnfdt,sfgapstid,sfgapstdt) = (g_sfga_m.sfgadocno, 
                   g_sfga_m.sfgadocdt,g_sfga_m.sfga002,g_sfga_m.sfga001,g_sfga_m.sfga003,g_sfga_m.sfgastus, 
                   g_sfga_m.sfgasite,g_sfga_m.sfga011,g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014, 
                   g_sfga_m.sfga006,g_sfga_m.sfga007,g_sfga_m.sfga008,g_sfga_m.sfga009,g_sfga_m.sfga010, 
                   g_sfga_m.sfgaownid,g_sfga_m.sfgaowndp,g_sfga_m.sfgacrtid,g_sfga_m.sfgacrtdp,g_sfga_m.sfgacrtdt, 
                   g_sfga_m.sfgamodid,g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid,g_sfga_m.sfgacnfdt,g_sfga_m.sfgapstid, 
                   g_sfga_m.sfgapstdt)
                WHERE sfgaent = g_enterprise AND sfgadocno = g_sfgadocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "sfga_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
                                                                                                                        
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL asrt336_sfga_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_sfga_m_t)
               LET g_log2 = util.JSON.stringify(g_sfga_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
                                                                                                                        
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_sfgadocno_t = g_sfga_m.sfgadocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="asrt336.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_sfgb_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sfgb_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL asrt336_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_sfgb_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
                                                                                                
            #end add-point
         
         BEFORE ROW
            #add-point:modify段before row2 name="input.body.before_row2"
                     
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
            OPEN asrt336_cl USING g_enterprise,g_sfga_m.sfgadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt336_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt336_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_sfgb_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_sfgb_d[l_ac].sfgbseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_sfgb_d_t.* = g_sfgb_d[l_ac].*  #BACKUP
               LET g_sfgb_d_o.* = g_sfgb_d[l_ac].*  #BACKUP
               CALL asrt336_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
                                                                                                                        
               #end add-point  
               CALL asrt336_set_no_entry_b(l_cmd)
               IF NOT asrt336_lock_b("sfgb_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH asrt336_bcl INTO g_sfgb_d[l_ac].sfgbseq,g_sfgb_d[l_ac].sfgb001,g_sfgb_d[l_ac].sfgb002, 
                      g_sfgb_d[l_ac].sfgb003,g_sfgb_d[l_ac].sfgbsite
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_sfgb_d_t.sfgbseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_sfgb_d_mask_o[l_ac].* =  g_sfgb_d[l_ac].*
                  CALL asrt336_sfgb_t_mask()
                  LET g_sfgb_d_mask_n[l_ac].* =  g_sfgb_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL asrt336_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
              
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
            INITIALIZE g_sfgb_d[l_ac].* TO NULL 
            INITIALIZE g_sfgb_d_t.* TO NULL 
            INITIALIZE g_sfgb_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
            
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            IF cl_null(g_sfgb_d[l_ac].sfgbseq) THEN
               SELECT MAX(sfgbseq)+1 INTO g_sfgb_d[l_ac].sfgbseq
                    FROM sfgb_t
                   WHERE sfgbent   = g_enterprise 
                     AND sfgbdocno = g_sfga_m.sfgadocno 
               IF g_sfgb_d[l_ac].sfgbseq IS NULL THEN
                  LET g_sfgb_d[l_ac].sfgbseq = 1
               END IF      
            END IF 
            #end add-point
            LET g_sfgb_d_t.* = g_sfgb_d[l_ac].*     #新輸入資料
            LET g_sfgb_d_o.* = g_sfgb_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL asrt336_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
                                                                                                
            #end add-point
            CALL asrt336_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sfgb_d[li_reproduce_target].* = g_sfgb_d[li_reproduce].*
 
               LET g_sfgb_d[li_reproduce_target].sfgbseq = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
            LET g_sfgb_d[l_ac].sfgbsite = g_site                                                                                  
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
            SELECT COUNT(1) INTO l_count FROM sfgb_t 
             WHERE sfgbent = g_enterprise AND sfgbdocno = g_sfga_m.sfgadocno
 
               AND sfgbseq = g_sfgb_d[l_ac].sfgbseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
                                                                                                                        
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfga_m.sfgadocno
               LET gs_keys[2] = g_sfgb_d[g_detail_idx].sfgbseq
               CALL asrt336_insert_b('sfgb_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
                                                                                                                        
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_sfgb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "sfgb_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL asrt336_b_fill()
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
               LET gs_keys[01] = g_sfga_m.sfgadocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_sfgb_d_t.sfgbseq
 
            
               #刪除同層單身
               IF NOT asrt336_delete_b('sfgb_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt336_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT asrt336_key_delete_b(gs_keys,'sfgb_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt336_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
                                                                                                                        
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE asrt336_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
                                                                                                                                                
               #end add-point
               LET l_count = g_sfgb_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
                                                                                                
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_sfgb_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgbseq
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfgb_d[l_ac].sfgbseq,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD sfgbseq
            END IF 
 
 
 
            #add-point:AFTER FIELD sfgbseq name="input.a.page1.sfgbseq"
                                                                                                            #此段落由子樣板a05產生
            IF  g_sfga_m.sfgadocno IS NOT NULL AND g_sfgb_d[g_detail_idx].sfgbseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_sfga_m.sfgadocno != g_sfgadocno_t OR g_sfgb_d[g_detail_idx].sfgbseq != g_sfgb_d_t.sfgbseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sfgb_t WHERE "||"sfgbent = '" ||g_enterprise|| "' AND "||"sfgbdocno = '"||g_sfga_m.sfgadocno ||"' AND "|| "sfgbseq = '"||g_sfgb_d[g_detail_idx].sfgbseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgbseq
            #add-point:BEFORE FIELD sfgbseq name="input.b.page1.sfgbseq"
            IF g_sfgb_d[l_ac].sfgbseq IS NULL OR g_sfgb_d[l_ac].sfgbseq = 0 THEN
               SELECT MAX(sfgbseq)+1 INTO g_sfgb_d[l_ac].sfgbseq
                 FROM sfgb_t
                WHERE sfgbent   = g_enterprise 
                  AND sfgbdocno = g_sfga_m.sfgadocno 

            END IF
            IF g_sfgb_d[l_ac].sfgbseq IS NULL THEN
               LET g_sfgb_d[l_ac].sfgbseq = 1
            END IF                                                 
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgbseq
            #add-point:ON CHANGE sfgbseq name="input.g.page1.sfgbseq"
                                                                                                
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgb001
            
            #add-point:AFTER FIELD sfgb001 name="input.a.page1.sfgb001"
                                                                                                
            IF NOT cl_null(g_sfgb_d[l_ac].sfgb001) THEN 
               IF l_cmd = 'a' OR (l_cmd = 'u' AND g_sfgb_d[l_ac].sfgb001 <> g_sfgb_d_t.sfgb001) THEN
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sfgb_d[l_ac].sfgb001
			         LET g_chkparam.err_str[1] = "aqc-00032:sub-01302|aqci030|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
                  LET g_chkparam.err_str[2] = "aqc-00031:sub-01303|aqci030|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_oocq002_1053") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
			      
                  ELSE
                     #檢查失敗時後續處理
                     NEXT FIELD CURRENT
                  END IF
            

               END IF 
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfgb_d[l_ac].sfgb001
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='1053' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfgb_d[l_ac].sfgb001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfgb_d[l_ac].sfgb001_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgb001
            #add-point:BEFORE FIELD sfgb001 name="input.b.page1.sfgb001"
                                                                                                
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgb001
            #add-point:ON CHANGE sfgb001 name="input.g.page1.sfgb001"
                                                                                                
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgb002
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfgb_d[l_ac].sfgb002,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD sfgb002
            END IF 
 
 
 
            #add-point:AFTER FIELD sfgb002 name="input.a.page1.sfgb002"
                                                                                                
            IF NOT cl_null(g_sfgb_d[l_ac].sfgb002) THEN 
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgb002
            #add-point:BEFORE FIELD sfgb002 name="input.b.page1.sfgb002"
                                                                                                
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgb002
            #add-point:ON CHANGE sfgb002 name="input.g.page1.sfgb002"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgb003
            #add-point:BEFORE FIELD sfgb003 name="input.b.page1.sfgb003"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgb003
            
            #add-point:AFTER FIELD sfgb003 name="input.a.page1.sfgb003"
                                                                                                
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgb003
            #add-point:ON CHANGE sfgb003 name="input.g.page1.sfgb003"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgbsite
            #add-point:BEFORE FIELD sfgbsite name="input.b.page1.sfgbsite"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgbsite
            
            #add-point:AFTER FIELD sfgbsite name="input.a.page1.sfgbsite"
                                                                                                
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgbsite
            #add-point:ON CHANGE sfgbsite name="input.g.page1.sfgbsite"
                                                                                                
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.sfgbseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgbseq
            #add-point:ON ACTION controlp INFIELD sfgbseq name="input.c.page1.sfgbseq"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfgb001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgb001
            #add-point:ON ACTION controlp INFIELD sfgb001 name="input.c.page1.sfgb001"
                                                                                                #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfgb_d[l_ac].sfgb001             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "1053" 

            CALL q_oocq002()                                #呼叫開窗

            LET g_sfgb_d[l_ac].sfgb001 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfgb_d[l_ac].sfgb001 TO sfgb001              #顯示到畫面上

            NEXT FIELD sfgb001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.sfgb002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgb002
            #add-point:ON ACTION controlp INFIELD sfgb002 name="input.c.page1.sfgb002"
                                                #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfgb_d[l_ac].sfgb002             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "1053" #

            CALL q_oocq002()                                #呼叫開窗

            LET g_sfgb_d[l_ac].sfgb002 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfgb_d[l_ac].sfgb002 TO sfgb002              #顯示到畫面上

            NEXT FIELD sfgb002                          #返回原欄位

                                                            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfgb003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgb003
            #add-point:ON ACTION controlp INFIELD sfgb003 name="input.c.page1.sfgb003"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.page1.sfgbsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgbsite
            #add-point:ON ACTION controlp INFIELD sfgbsite name="input.c.page1.sfgbsite"
                                                                                                
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_sfgb_d[l_ac].* = g_sfgb_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE asrt336_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_sfgb_d[l_ac].sfgbseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_sfgb_d[l_ac].* = g_sfgb_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
                                                                                                                        
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL asrt336_sfgb_t_mask_restore('restore_mask_o')
      
               UPDATE sfgb_t SET (sfgbdocno,sfgbseq,sfgb001,sfgb002,sfgb003,sfgbsite) = (g_sfga_m.sfgadocno, 
                   g_sfgb_d[l_ac].sfgbseq,g_sfgb_d[l_ac].sfgb001,g_sfgb_d[l_ac].sfgb002,g_sfgb_d[l_ac].sfgb003, 
                   g_sfgb_d[l_ac].sfgbsite)
                WHERE sfgbent = g_enterprise AND sfgbdocno = g_sfga_m.sfgadocno 
 
                  AND sfgbseq = g_sfgb_d_t.sfgbseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
                                                                                                                        
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_sfgb_d[l_ac].* = g_sfgb_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfgb_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_sfgb_d[l_ac].* = g_sfgb_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfgb_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfga_m.sfgadocno
               LET gs_keys_bak[1] = g_sfgadocno_t
               LET gs_keys[2] = g_sfgb_d[g_detail_idx].sfgbseq
               LET gs_keys_bak[2] = g_sfgb_d_t.sfgbseq
               CALL asrt336_update_b('sfgb_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL asrt336_sfgb_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_sfgb_d[g_detail_idx].sfgbseq = g_sfgb_d_t.sfgbseq 
 
                  ) THEN
                  LET gs_keys[01] = g_sfga_m.sfgadocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_sfgb_d_t.sfgbseq
 
                  CALL asrt336_key_update_b(gs_keys,'sfgb_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_sfga_m),util.JSON.stringify(g_sfgb_d_t)
               LET g_log2 = util.JSON.stringify(g_sfga_m),util.JSON.stringify(g_sfgb_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
                                                                                                                        
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
                                                                                                
            #end add-point
            CALL asrt336_unlock_b("sfgb_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
                                                                                                
            #end add-point 
    
         ON ACTION controlo    
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_sfgb_d[li_reproduce_target].* = g_sfgb_d[li_reproduce].*
 
               LET g_sfgb_d[li_reproduce_target].sfgbseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_sfgb_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_sfgb_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
      INPUT ARRAY g_sfgb2_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body2.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sfgb2_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL asrt336_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'd' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'2',"))
            END IF
            LET g_loc = 'd'
            LET g_rec_b = g_sfgb2_d.getLength()
            #add-point:資料輸入前 name="input.body2.before_input"
#参数不使用判定流程不能进入
            CALL s_aooi200_get_slip(g_sfga_m.sfgadocno) RETURNING l_success,g_doc_slip
            IF cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0060') = 'N' OR g_sfga_m.sfgastus <> 'Y' THEN 
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00259'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

               EXIT DIALOG
            END IF          
            #end add-point
            
         BEFORE INSERT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_sfgb2_d[l_ac].* TO NULL 
            INITIALIZE g_sfgb2_d_t.* TO NULL 
            INITIALIZE g_sfgb2_d_o.* TO NULL 
            #公用欄位給值(單身2)
            
            #自定義預設值(單身2)
                  LET g_sfgb2_d[l_ac].sfgc004 = "1"
 
            #add-point:modify段before備份 name="input.body2.insert.before_bak"
            
            #end add-point
            LET g_sfgb2_d_t.* = g_sfgb2_d[l_ac].*     #新輸入資料
            LET g_sfgb2_d_o.* = g_sfgb2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL asrt336_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body2.insert.after_set_entry_b"
            LET g_sfgb2_d[l_ac].sfgc004 = '1'                                                                                     
            #end add-point
            CALL asrt336_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sfgb2_d[li_reproduce_target].* = g_sfgb2_d[li_reproduce].*
 
               LET g_sfgb2_d[li_reproduce_target].sfgcseq = NULL
            END IF
            
 
            #add-point:modify段before insert name="input.body2.before_insert"
            LET g_sfgb2_d[l_ac].sfgc002 = '1'
            LET g_sfgb2_d[l_ac].sfgcsite = g_site
            CALL asrt336_set_no_required_b()
            CALL asrt336_set_required_b()
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
            OPEN asrt336_cl USING g_enterprise,g_sfga_m.sfgadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt336_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt336_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_sfgb2_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_sfgb2_d[l_ac].sfgcseq IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_sfgb2_d_t.* = g_sfgb2_d[l_ac].*  #BACKUP
               LET g_sfgb2_d_o.* = g_sfgb2_d[l_ac].*  #BACKUP
               CALL asrt336_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body2.after_set_entry_b"
                                                                                                                        
               #end add-point  
               CALL asrt336_set_no_entry_b(l_cmd)
               IF NOT asrt336_lock_b("sfgc_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH asrt336_bcl2 INTO g_sfgb2_d[l_ac].sfgcseq,g_sfgb2_d[l_ac].sfgc001,g_sfgb2_d[l_ac].sfgc002, 
                      g_sfgb2_d[l_ac].sfgc003,g_sfgb2_d[l_ac].sfgc004,g_sfgb2_d[l_ac].sfgc005,g_sfgb2_d[l_ac].sfgc006, 
                      g_sfgb2_d[l_ac].sfgcsite
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = SQLERRMESSAGE  
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_sfgb2_d_mask_o[l_ac].* =  g_sfgb2_d[l_ac].*
                  CALL asrt336_sfgc_t_mask()
                  LET g_sfgb2_d_mask_n[l_ac].* =  g_sfgb2_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL asrt336_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body2.before_row"
            CALL asrt336_set_no_required_b()
            CALL asrt336_set_required_b()                                                                                                
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
               LET gs_keys[01] = g_sfga_m.sfgadocno
               LET gs_keys[gs_keys.getLength()+1] = g_sfgb2_d_t.sfgcseq
            
               #刪除同層單身
               IF NOT asrt336_delete_b('sfgc_t',gs_keys,"'2'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt336_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT asrt336_key_delete_b(gs_keys,'sfgc_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt336_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身2刪除中 name="input.body2.m_delete"
                                                                                                                        
               #end add-point    
               
               CALL s_transaction_end('Y','0')
               CLOSE asrt336_bcl
 
               LET g_rec_b = g_rec_b-1
               #add-point:單身2刪除後 name="input.body2.a_delete"
                                                                                                                                                
               #end add-point
               LET l_count = g_sfgb_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body2.after_delete"
                                                                                                
               #end add-point
            END IF 
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_sfgb2_d.getLength() + 1) THEN
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
            SELECT COUNT(1) INTO l_count FROM sfgc_t 
             WHERE sfgcent = g_enterprise AND sfgcdocno = g_sfga_m.sfgadocno
               AND sfgcseq = g_sfgb2_d[l_ac].sfgcseq
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前 name="input.body2.b_insert"
                                                                                                                        
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfga_m.sfgadocno
               LET gs_keys[2] = g_sfgb2_d[g_detail_idx].sfgcseq
               CALL asrt336_insert_b('sfgc_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2 name="input.body2.a_insert"
                                                                                                                        
               #end add-point
            ELSE    
               INITIALIZE g_sfgb_d[l_ac].* TO NULL
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
               LET g_errparam.extend = "sfgc_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL asrt336_b_fill()
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
               LET g_sfgb2_d[l_ac].* = g_sfgb2_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE asrt336_bcl2
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
               LET g_sfgb2_d[l_ac].* = g_sfgb2_d_t.*
            ELSE
               #add-point:單身page2修改前 name="input.body2.b_update"
                                                                                                                        
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               #將遮罩欄位還原
               CALL asrt336_sfgc_t_mask_restore('restore_mask_o')
                              
               UPDATE sfgc_t SET (sfgcdocno,sfgcseq,sfgc001,sfgc002,sfgc003,sfgc004,sfgc005,sfgc006, 
                   sfgcsite) = (g_sfga_m.sfgadocno,g_sfgb2_d[l_ac].sfgcseq,g_sfgb2_d[l_ac].sfgc001,g_sfgb2_d[l_ac].sfgc002, 
                   g_sfgb2_d[l_ac].sfgc003,g_sfgb2_d[l_ac].sfgc004,g_sfgb2_d[l_ac].sfgc005,g_sfgb2_d[l_ac].sfgc006, 
                   g_sfgb2_d[l_ac].sfgcsite) #自訂欄位頁簽
                WHERE sfgcent = g_enterprise AND sfgcdocno = g_sfga_m.sfgadocno
                  AND sfgcseq = g_sfgb2_d_t.sfgcseq #項次 
                  
               #add-point:單身page2修改中 name="input.body2.m_update"
                                                                                                                        
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_sfgb2_d[l_ac].* = g_sfgb2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfgc_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_sfgb2_d[l_ac].* = g_sfgb2_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "sfgc_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfga_m.sfgadocno
               LET gs_keys_bak[1] = g_sfgadocno_t
               LET gs_keys[2] = g_sfgb2_d[g_detail_idx].sfgcseq
               LET gs_keys_bak[2] = g_sfgb2_d_t.sfgcseq
               CALL asrt336_update_b('sfgc_t',gs_keys,gs_keys_bak,"'2'")
               END CASE
               
               #將遮罩欄位進行遮蔽
               CALL asrt336_sfgc_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT (g_sfgb2_d[g_detail_idx].sfgcseq = g_sfgb2_d_t.sfgcseq 
                  ) THEN
                  LET gs_keys[01] = g_sfga_m.sfgadocno
                  LET gs_keys[gs_keys.getLength()+1] = g_sfgb2_d_t.sfgcseq
                  CALL asrt336_key_update_b(gs_keys,'sfgc_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_sfga_m),util.JSON.stringify(g_sfgb2_d_t)
               LET g_log2 = util.JSON.stringify(g_sfga_m),util.JSON.stringify(g_sfgb2_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身page2修改後 name="input.body2.a_update"
                                                                                                                        
               #end add-point
            END IF
         
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgcseq
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfgb2_d[l_ac].sfgcseq,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD sfgcseq
            END IF 
 
 
 
            #add-point:AFTER FIELD sfgcseq name="input.a.page2.sfgcseq"
                                                                                                
            IF NOT cl_null(g_sfgb2_d[l_ac].sfgcseq) THEN 
            END IF 

            #此段落由子樣板a05產生
            IF  g_sfga_m.sfgadocno IS NOT NULL AND g_sfgb2_d[g_detail_idx].sfgcseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_sfga_m.sfgadocno != g_sfgadocno_t OR g_sfgb2_d[g_detail_idx].sfgcseq != g_sfgb2_d_t.sfgcseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sfgc_t WHERE "||"sfgcent = '" ||g_enterprise|| "' AND "||"sfgcdocno = '"||g_sfga_m.sfgadocno ||"' AND "|| "sfgcseq = '"||g_sfgb2_d[g_detail_idx].sfgcseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgcseq
            #add-point:BEFORE FIELD sfgcseq name="input.b.page2.sfgcseq"
                                                IF g_sfgb2_d[l_ac].sfgcseq IS NULL OR g_sfgb2_d[l_ac].sfgcseq = 0 THEN
               SELECT MAX(sfgcseq)+1 INTO g_sfgb2_d[l_ac].sfgcseq
                 FROM sfgc_t
                WHERE sfgcent   = g_enterprise 
                  AND sfgcdocno = g_sfga_m.sfgadocno 

            END IF
            IF g_sfgb2_d[l_ac].sfgcseq IS NULL THEN
               LET g_sfgb2_d[l_ac].sfgcseq = 1
            END IF                                                            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgcseq
            #add-point:ON CHANGE sfgcseq name="input.g.page2.sfgcseq"
                                                                                                
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgc001
            
            #add-point:AFTER FIELD sfgc001 name="input.a.page2.sfgc001"
                                                                                                
            IF NOT cl_null(g_sfgb2_d[l_ac].sfgc001) THEN 
               IF l_cmd = 'a' OR (l_cmd = 'u' AND g_sfgb2_d[l_ac].sfgc001 <> g_sfgb2_d_t.sfgc001) THEN
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sfgb2_d[l_ac].sfgc001
			         LET g_chkparam.err_str[1] = "aqc-00032:sub-01302|aqci030|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
                  LET g_chkparam.err_str[2] = "aqc-00031:sub-01303|aqci030|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_oocq002_1053") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
			      
                  ELSE
                     #檢查失敗時後續處理
                     NEXT FIELD CURRENT
                  END IF
               END IF
            

            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfgb2_d[l_ac].sfgc001
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='1053' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfgb2_d[l_ac].sfgc001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfgb2_d[l_ac].sfgc001_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgc001
            #add-point:BEFORE FIELD sfgc001 name="input.b.page2.sfgc001"
                                                                                                
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgc001
            #add-point:ON CHANGE sfgc001 name="input.g.page2.sfgc001"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgc002
            #add-point:BEFORE FIELD sfgc002 name="input.b.page2.sfgc002"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgc002
            
            #add-point:AFTER FIELD sfgc002 name="input.a.page2.sfgc002"
            IF NOT cl_null(g_sfgb2_d[l_ac].sfgc002) THEN 
              #IF l_cmd = 'a' OR (l_cmd = 'u' AND g_sfgb2_d[l_ac].sfgc002 <> g_sfgb2_d_t.sfgc002) THEN  #160824-00007#284 by sakura mark
               IF g_sfgb2_d[l_ac].sfgc002 <> g_sfgb2_d_o.sfgc002 OR cl_null(g_sfgb2_d_o.sfgc002) THEN   #160824-00007#284 by sakura add
                  IF NOT asrt336_set_sfga009() THEN
                    #LET g_sfgb2_d[l_ac].sfgc002 = g_sfgb2_d_t.sfgc002   #160824-00007#284 by sakura mark
                     LET g_sfgb2_d[l_ac].sfgc002 = g_sfgb2_d_o.sfgc002   #160824-00007#284 by sakura add
                     NEXT FIELD CURRENT
                  END IF
               END IF 
            END IF
            LET g_sfgb2_d_o.* = g_sfgb2_d[l_ac].*   #160824-00007#284 by sakura add        
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgc002
            #add-point:ON CHANGE sfgc002 name="input.g.page2.sfgc002"
                                                                                                
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgc003
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sfgb2_d[l_ac].sfgc003,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD sfgc003
            END IF 
 
 
 
            #add-point:AFTER FIELD sfgc003 name="input.a.page2.sfgc003"
                                                                                                
            IF NOT cl_null(g_sfgb2_d[l_ac].sfgc003) THEN 
              #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_sfgb2_d_t.sfgc003 IS NULL OR g_sfgb2_d[l_ac].sfgc003 <> g_sfgb2_d_t.sfgc003)) THEN   #160824-00007#284 by sakura mark
               IF g_sfgb2_d_o.sfgc003 IS NULL OR g_sfgb2_d[l_ac].sfgc003 <> g_sfgb2_d_o.sfgc003 THEN   #160824-00007#284 by sakura add
                  IF NOT asrt336_set_sfga009() THEN
                    #LET g_sfgb2_d[l_ac].sfgc003 = g_sfgb2_d_t.sfgc003   #160824-00007#284 by sakura mark
                     LET g_sfgb2_d[l_ac].sfgc003 = g_sfgb2_d_o.sfgc003   #160824-00007#284 by sakura add
                     NEXT FIELD CURRENT
                  END IF
               END IF 
            END IF
            LET g_sfgb2_d_o.* = g_sfgb2_d[l_ac].*   #160824-00007#284 by sakura add         

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgc003
            #add-point:BEFORE FIELD sfgc003 name="input.b.page2.sfgc003"
                                                                                                
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgc003
            #add-point:ON CHANGE sfgc003 name="input.g.page2.sfgc003"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgc004
            #add-point:BEFORE FIELD sfgc004 name="input.b.page2.sfgc004"
            CALL asrt336_set_entry_b(l_cmd)  
            CALL asrt336_set_no_required()            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgc004
            
            #add-point:AFTER FIELD sfgc004 name="input.a.page2.sfgc004"
            CALL asrt336_set_no_entry_b(l_cmd)  
            CALL asrt336_set_required()         
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgc004
            #add-point:ON CHANGE sfgc004 name="input.g.page2.sfgc004"
                                                                                                
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgc005
            
            #add-point:AFTER FIELD sfgc005 name="input.a.page2.sfgc005"
                                                                                                
            IF NOT cl_null(g_sfgb2_d[l_ac].sfgc005) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_sfgb2_d_t.sfgc005 IS NULL OR g_sfgb2_d[l_ac].sfgc005 <> g_sfgb2_d_t.sfgc005)) THEN  
                  IF g_sfgb2_d[l_ac].sfgc004 = '1' THEN               
#此段落由子樣板a19產生
                     #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                     INITIALIZE g_chkparam.* TO NULL
                     
                     #設定g_chkparam.*的參數
                     LET g_chkparam.arg1 = g_sfgb2_d[l_ac].sfgc005
                     LET g_chkparam.arg2 = cl_get_today()
			         
                        
                     #呼叫檢查存在並帶值的library
                     IF cl_chk_exist("v_ooeg001_2") THEN
                        #檢查成功時後續處理
                        #LET  = g_chkparam.return1
                        #DISPLAY BY NAME 
			         
                     ELSE
                        #檢查失敗時後續處理
                        NEXT FIELD CURRENT
                     END IF
                  END IF
                  IF g_sfgb2_d[l_ac].sfgc004 = '2' THEN               
#此段落由子樣板a19產生
                     #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                     INITIALIZE g_chkparam.* TO NULL
                     
                     #設定g_chkparam.*的參數
                     LET g_chkparam.arg1 = g_sfgb2_d[l_ac].sfgc005
			         
                        
                     #呼叫檢查存在並帶值的library
                     IF cl_chk_exist("v_pmaa001_1") THEN
                        #檢查成功時後續處理
                        #LET  = g_chkparam.return1
                        #DISPLAY BY NAME 
			         
                     ELSE
                        #檢查失敗時後續處理
                        NEXT FIELD CURRENT
                     END IF
                  END IF
               END IF
            

            END IF 
            IF g_sfgb2_d[l_ac].sfgc004 = '1' THEN 
               CALL s_desc_get_department_desc(g_sfgb2_d[l_ac].sfgc005) RETURNING g_sfgb2_d[l_ac].sfgc005_desc            
            END IF
            IF g_sfgb2_d[l_ac].sfgc004 = '2' THEN 
               CALL s_desc_get_trading_partner_full_desc(g_sfgb2_d[l_ac].sfgc005) RETURNING g_sfgb2_d[l_ac].sfgc005_desc
            END IF            
            IF g_sfgb2_d[l_ac].sfgc004 = '3' THEN 
               LET g_sfgb2_d[l_ac].sfgc005_desc = NULL
            END IF
            DISPLAY BY NAME g_sfgb2_d[l_ac].sfgc005_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgc005
            #add-point:BEFORE FIELD sfgc005 name="input.b.page2.sfgc005"
                                                                                                
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgc005
            #add-point:ON CHANGE sfgc005 name="input.g.page2.sfgc005"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgc006
            #add-point:BEFORE FIELD sfgc006 name="input.b.page2.sfgc006"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgc006
            
            #add-point:AFTER FIELD sfgc006 name="input.a.page2.sfgc006"
                                                                                                
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgc006
            #add-point:ON CHANGE sfgc006 name="input.g.page2.sfgc006"
                                                                                                
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sfgcsite
            #add-point:BEFORE FIELD sfgcsite name="input.b.page2.sfgcsite"
                                                                                                
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sfgcsite
            
            #add-point:AFTER FIELD sfgcsite name="input.a.page2.sfgcsite"
                                                                                                
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sfgcsite
            #add-point:ON CHANGE sfgcsite name="input.g.page2.sfgcsite"
                                                                                                
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page2.sfgcseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgcseq
            #add-point:ON ACTION controlp INFIELD sfgcseq name="input.c.page2.sfgcseq"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.page2.sfgc001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgc001
            #add-point:ON ACTION controlp INFIELD sfgc001 name="input.c.page2.sfgc001"
                                                                                                #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfgb2_d[l_ac].sfgc001             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "1053" 

            CALL q_oocq002()                                #呼叫開窗

            LET g_sfgb2_d[l_ac].sfgc001 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfgb2_d[l_ac].sfgc001 TO sfgc001              #顯示到畫面上

            NEXT FIELD sfgc001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page2.sfgc002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgc002
            #add-point:ON ACTION controlp INFIELD sfgc002 name="input.c.page2.sfgc002"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.page2.sfgc003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgc003
            #add-point:ON ACTION controlp INFIELD sfgc003 name="input.c.page2.sfgc003"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.page2.sfgc004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgc004
            #add-point:ON ACTION controlp INFIELD sfgc004 name="input.c.page2.sfgc004"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.page2.sfgc005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgc005
            #add-point:ON ACTION controlp INFIELD sfgc005 name="input.c.page2.sfgc005"
                                                                                                #此段落由子樣板a07產生            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfgb2_d[l_ac].sfgc005             #給予default值

            #給予arg
            IF g_sfgb2_d[l_ac].sfgc004 ='1' THEN
               LET g_qryparam.arg1 = g_sfga_m.sfgadocdt
               CALL q_ooeg001()                                              #呼叫開窗
               LET g_sfgb2_d[l_ac].sfgc005 = g_qryparam.return1              #將開窗取得的值回傳到變數
               DISPLAY g_sfgb2_d[l_ac].sfgc005 TO sfgc005                    #顯示到畫面上
            END IF
            IF g_sfgb2_d[l_ac].sfgc004 ='2' THEN
               LET g_qryparam.arg1 = " ('1','3')"                            #交易對象類型
               CALL q_pmaa001_1()                                            #呼叫開窗
               LET g_sfgb2_d[l_ac].sfgc005 = g_qryparam.return1              #將開窗取得的值回傳到變數
               DISPLAY g_sfgb2_d[l_ac].sfgc005 TO sfgc005                    #顯示到畫面上
            END IF

            NEXT FIELD sfgc005                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page2.sfgc006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgc006
            #add-point:ON ACTION controlp INFIELD sfgc006 name="input.c.page2.sfgc006"
                                                                                                
            #END add-point
 
 
         #Ctrlp:input.c.page2.sfgcsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sfgcsite
            #add-point:ON ACTION controlp INFIELD sfgcsite name="input.c.page2.sfgcsite"
                                                                                                
            #END add-point
 
 
 
 
         AFTER ROW
            #add-point:單身page2 after_row name="input.body2.after_row"
                                                                                                
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_sfgb2_d[l_ac].* = g_sfgb2_d_t.*
               END IF
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE asrt336_bcl2
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL asrt336_unlock_b("sfgc_t","'2'")
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
               LET g_sfgb2_d[li_reproduce_target].* = g_sfgb2_d[li_reproduce].*
 
               LET g_sfgb2_d[li_reproduce_target].sfgcseq = NULL
            ELSE
               CALL FGL_SET_ARR_CURR(g_sfgb2_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_sfgb2_d.getLength()+1
            END IF
            
      END INPUT
 
      
 
 
 
 
{</section>}
 
{<section id="asrt336.input.other" >}
      
      #add-point:自定義input name="input.more_input"
                                                
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
                                                                        
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
         CALL DIALOG.setCurrentRow("s_detail2",g_idx_group.getValue("'2',"))
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD sfgadocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD sfgbseq
               WHEN "s_detail2"
                  NEXT FIELD sfgcseq
 
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
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
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
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
         CALL g_curr_diag.setCurrentRow("s_detail2",1)
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
                        
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="asrt336.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION asrt336_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   DEFINE l_sffb009   LIKE sffb_t.sffb009
   DEFINE l_sfga005   LIKE sfga_t.sfga005  
   DEFINE l_sfga006   LIKE sfga_t.sfga006
   DEFINE l_sfga007   LIKE sfga_t.sfga007   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
                        
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL asrt336_b_fill() #單身填充
      CALL asrt336_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL asrt336_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"

#            CALL s_asft335_default_sffb056('3','','',g_sfga_m.sfga006,g_sfga_m.sfga007)
#            RETURNING g_sfga_m.sfga012,l_sfga005,l_sfga006,l_sfga007,l_sffb009                  
#display工单对应料件的品名规格                                   
#           CALL s_desc_get_item_desc(g_sfga_m.sfga012)
#            RETURNING g_sfga_m.imaal003,g_sfga_m.imaal004 
#            DISPLAY BY NAME g_sfga_m.sfga012,g_sfga_m.imaal003,g_sfga_m.imaal004
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfga_m.sfga012
            CALL ap_ref_array2(g_ref_fields,"SELECT imaal003,imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfga_m.imaal003 = '', g_rtn_fields[1] , ''
            LET g_sfga_m.imaal004 = '', g_rtn_fields[2] , ''
            DISPLAY BY NAME g_sfga_m.imaal003,g_sfga_m.imaal004            
            LET g_sfga_m.sfgadocno_desc = s_aooi200_get_slip_desc(g_sfga_m.sfgadocno)
            DISPLAY BY NAME g_sfga_m.sfgadocno_desc
   #end add-point
   
   #遮罩相關處理
   LET g_sfga_m_mask_o.* =  g_sfga_m.*
   CALL asrt336_sfga_t_mask()
   LET g_sfga_m_mask_n.* =  g_sfga_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt,g_sfga_m.sfga002,g_sfga_m.sfga002_desc,g_sfga_m.sfgadocno_desc, 
       g_sfga_m.sfga001,g_sfga_m.sfga003,g_sfga_m.sfga003_desc,g_sfga_m.sfgastus,g_sfga_m.sfgasite,g_sfga_m.sfga011, 
       g_sfga_m.sfga011_desc,g_sfga_m.sfga012,g_sfga_m.imaal003,g_sfga_m.imaal004,g_sfga_m.sfga013,g_sfga_m.sfga014, 
       g_sfga_m.sfga006,g_sfga_m.sfga006_desc,g_sfga_m.sfga007,g_sfga_m.sfga008,g_sfga_m.sfga009,g_sfga_m.sfga010, 
       g_sfga_m.sfgaownid,g_sfga_m.sfgaownid_desc,g_sfga_m.sfgaowndp,g_sfga_m.sfgaowndp_desc,g_sfga_m.sfgacrtid, 
       g_sfga_m.sfgacrtid_desc,g_sfga_m.sfgacrtdp,g_sfga_m.sfgacrtdp_desc,g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid, 
       g_sfga_m.sfgamodid_desc,g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid,g_sfga_m.sfgacnfid_desc,g_sfga_m.sfgacnfdt, 
       g_sfga_m.sfgapstid,g_sfga_m.sfgapstid_desc,g_sfga_m.sfgapstdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sfga_m.sfgastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_sfgb_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
 
      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_sfgb2_d.getLength()
      #add-point:show段單身reference name="show.body2.reference"

            IF g_sfgb2_d[l_ac].sfgc004 = '1' THEN 
               CALL s_desc_get_department_desc(g_sfgb2_d[l_ac].sfgc005) RETURNING g_sfgb2_d[l_ac].sfgc005_desc            
            END IF
            IF g_sfgb2_d[l_ac].sfgc004 = '2' THEN 
               CALL s_desc_get_trading_partner_full_desc(g_sfgb2_d[l_ac].sfgc005) RETURNING g_sfgb2_d[l_ac].sfgc005_desc
            END IF            
            IF g_sfgb2_d[l_ac].sfgc004 = '3' THEN 
               LET g_sfgb2_d[l_ac].sfgc005_desc = NULL
            END IF
            DISPLAY BY NAME g_sfgb2_d[l_ac].sfgc005_desc

      #end add-point
   END FOR
 
   
    
   
   #add-point:show段other name="show.other"
                        
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL asrt336_detail_show()
 
   #add-point:show段之後 name="show.after"
                        
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION asrt336_detail_show()
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
 
{<section id="asrt336.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION asrt336_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE sfga_t.sfgadocno 
   DEFINE l_oldno     LIKE sfga_t.sfgadocno 
 
   DEFINE l_master    RECORD LIKE sfga_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE sfgb_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE sfgc_t.* #此變數樣板目前無使用
 
 
 
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
   
   IF g_sfga_m.sfgadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_sfgadocno_t = g_sfga_m.sfgadocno
 
    
   LET g_sfga_m.sfgadocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_sfga_m.sfgaownid = g_user
      LET g_sfga_m.sfgaowndp = g_dept
      LET g_sfga_m.sfgacrtid = g_user
      LET g_sfga_m.sfgacrtdp = g_dept 
      LET g_sfga_m.sfgacrtdt = cl_get_current()
      LET g_sfga_m.sfgamodid = g_user
      LET g_sfga_m.sfgamoddt = cl_get_current()
      LET g_sfga_m.sfgastus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   LET g_sfga_m.sfgacnfid = NULL 
   LET g_sfga_m.sfgacnfdt = NULL 
   LET g_sfga_m.sfgapstid = NULL 
   LET g_sfga_m.sfgapstdt = NULL                         
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sfga_m.sfgastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
      LET g_sfga_m.sfgadocno_desc = ''
   DISPLAY BY NAME g_sfga_m.sfgadocno_desc
 
   
   CALL asrt336_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_sfga_m.* TO NULL
      INITIALIZE g_sfgb_d TO NULL
      INITIALIZE g_sfgb2_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL asrt336_show()
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
   CALL asrt336_set_act_visible()   
   CALL asrt336_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sfgadocno_t = g_sfga_m.sfgadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " sfgaent = " ||g_enterprise|| " AND",
                      " sfgadocno = '", g_sfga_m.sfgadocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL asrt336_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
                        
   #end add-point
   
   CALL asrt336_idx_chk()
   
   LET g_data_owner = g_sfga_m.sfgaownid      
   LET g_data_dept  = g_sfga_m.sfgaowndp
   
   #功能已完成,通報訊息中心
   CALL asrt336_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="asrt336.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION asrt336_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE sfgb_t.* #此變數樣板目前無使用
   DEFINE l_detail2    RECORD LIKE sfgc_t.* #此變數樣板目前無使用
 
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
                        
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE asrt336_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
                        
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM sfgb_t
    WHERE sfgbent = g_enterprise AND sfgbdocno = g_sfgadocno_t
 
    INTO TEMP asrt336_detail
 
   #將key修正為調整後   
   UPDATE asrt336_detail 
      #更新key欄位
      SET sfgbdocno = g_sfga_m.sfgadocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO sfgb_t SELECT * FROM asrt336_detail
   
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
   DROP TABLE asrt336_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
                        
   #end add-point
 
   #add-point:單身複製前 name="detail_reproduce.body.table2.b_insert"
                        
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM sfgc_t 
    WHERE sfgcent = g_enterprise AND sfgcdocno = g_sfgadocno_t
 
    INTO TEMP asrt336_detail
 
   #將key修正為調整後   
   UPDATE asrt336_detail SET sfgcdocno = g_sfga_m.sfgadocno
 
  
   #add-point:單身修改前 name="detail_reproduce.body.table2.b_update"
   
   #end add-point    
 
   #將資料塞回原table   
   INSERT INTO sfgc_t SELECT * FROM asrt336_detail
   
   #add-point:單身複製中 name="detail_reproduce.body.table2.m_insert"
                        
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE asrt336_detail
   
   #add-point:單身複製後 name="detail_reproduce.body.table2.a_insert"
                        
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_sfgadocno_t = g_sfga_m.sfgadocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.delete" >}
#+ 資料刪除
PRIVATE FUNCTION asrt336_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point     
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   IF g_sfga_m.sfgastus <> 'N' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'apm-00034'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN
   END IF                        
   #end add-point     
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   IF g_sfga_m.sfgadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN asrt336_cl USING g_enterprise,g_sfga_m.sfgadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt336_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE asrt336_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE asrt336_master_referesh USING g_sfga_m.sfgadocno INTO g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt, 
       g_sfga_m.sfga002,g_sfga_m.sfga001,g_sfga_m.sfga003,g_sfga_m.sfgastus,g_sfga_m.sfgasite,g_sfga_m.sfga011, 
       g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,g_sfga_m.sfga007,g_sfga_m.sfga008, 
       g_sfga_m.sfga009,g_sfga_m.sfga010,g_sfga_m.sfgaownid,g_sfga_m.sfgaowndp,g_sfga_m.sfgacrtid,g_sfga_m.sfgacrtdp, 
       g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid,g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid,g_sfga_m.sfgacnfdt, 
       g_sfga_m.sfgapstid,g_sfga_m.sfgapstdt,g_sfga_m.sfga002_desc,g_sfga_m.sfga003_desc,g_sfga_m.sfga011_desc, 
       g_sfga_m.sfga006_desc,g_sfga_m.sfgaownid_desc,g_sfga_m.sfgaowndp_desc,g_sfga_m.sfgacrtid_desc, 
       g_sfga_m.sfgacrtdp_desc,g_sfga_m.sfgamodid_desc,g_sfga_m.sfgacnfid_desc,g_sfga_m.sfgapstid_desc 
 
   
   
   #檢查是否允許此動作
   IF NOT asrt336_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_sfga_m_mask_o.* =  g_sfga_m.*
   CALL asrt336_sfga_t_mask()
   LET g_sfga_m_mask_n.* =  g_sfga_m.*
   
   CALL asrt336_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
                                                
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL asrt336_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_sfgadocno_t = g_sfga_m.sfgadocno
 
 
      DELETE FROM sfga_t
       WHERE sfgaent = g_enterprise AND sfgadocno = g_sfga_m.sfgadocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
                                                
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_sfga_m.sfgadocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_del_docno(g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt) THEN CALL s_transaction_end('N','0') RETURN END IF                                          
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
                                                
      #end add-point
      
      DELETE FROM sfgb_t
       WHERE sfgbent = g_enterprise AND sfgbdocno = g_sfga_m.sfgadocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
                                                
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfgb_t:",SQLERRMESSAGE 
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
      DELETE FROM sfgc_t
       WHERE sfgcent = g_enterprise AND
             sfgcdocno = g_sfga_m.sfgadocno
      #add-point:單身刪除中 name="delete.body.m_delete2"
                                                
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfgc_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF      
 
      #add-point:單身刪除後 name="delete.body.a_delete2"
                                                
      #end add-point
 
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_sfga_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE asrt336_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_sfgb_d.clear() 
      CALL g_sfgb2_d.clear()       
 
     
      CALL asrt336_ui_browser_refresh()  
      #CALL asrt336_ui_headershow()  
      #CALL asrt336_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL asrt336_browser_fill("")
         CALL asrt336_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE asrt336_cl
 
   #功能已完成,通報訊息中心
   CALL asrt336_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="asrt336.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION asrt336_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
                        
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_sfgb_d.clear()
   CALL g_sfgb2_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
                        
   #end add-point
   
   #判斷是否填充
   IF asrt336_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT sfgbseq,sfgb001,sfgb002,sfgb003,sfgbsite ,t1.oocql004 FROM sfgb_t", 
                
                     " INNER JOIN sfga_t ON sfgaent = " ||g_enterprise|| " AND sfgadocno = sfgbdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN oocql_t t1 ON t1.oocqlent="||g_enterprise||" AND t1.oocql001='1053' AND t1.oocql002=sfgb001 AND t1.oocql003='"||g_dlang||"' ",
 
                     " WHERE sfgbent=? AND sfgbdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
                                                
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY sfgb_t.sfgbseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
                                                
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE asrt336_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR asrt336_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_sfga_m.sfgadocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_sfga_m.sfgadocno INTO g_sfgb_d[l_ac].sfgbseq,g_sfgb_d[l_ac].sfgb001, 
          g_sfgb_d[l_ac].sfgb002,g_sfgb_d[l_ac].sfgb003,g_sfgb_d[l_ac].sfgbsite,g_sfgb_d[l_ac].sfgb001_desc  
            #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = g_sfgb_d[l_ac].sfgb001
         CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='1053' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
         LET g_sfgb_d[l_ac].sfgb001_desc = '', g_rtn_fields[1] , ''
         DISPLAY BY NAME g_sfgb_d[l_ac].sfgb001_desc                                                                        
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
   IF asrt336_fill_chk(2) THEN
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
         #add-point:b_fill段long_sql_if name="b_fill.body2.long_sql_if"
         
         #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT sfgcseq,sfgc001,sfgc002,sfgc003,sfgc004,sfgc005,sfgc006,sfgcsite , 
             t2.oocql004 ,t3.ooefl003 FROM sfgc_t",   
                     " INNER JOIN  sfga_t ON sfgaent = " ||g_enterprise|| " AND sfgadocno = sfgcdocno ",
 
                     "",
                     
                                    " LEFT JOIN oocql_t t2 ON t2.oocqlent="||g_enterprise||" AND t2.oocql001='1053' AND t2.oocql002=sfgc001 AND t2.oocql003='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t3 ON t3.ooeflent="||g_enterprise||" AND t3.ooefl001=sfgc005 AND t3.ooefl002='"||g_dlang||"' ",
 
                     " WHERE sfgcent=? AND sfgcdocno=?"   
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段fill_sql name="b_fill.body2.fill_sql"
                                                
         #end add-point
         IF NOT cl_null(g_wc2_table2) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY sfgc_t.sfgcseq"
         
         #add-point:單身填充控制 name="b_fill.sql2"
                                                
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE asrt336_pb2 FROM g_sql
         DECLARE b_fill_cs2 CURSOR FOR asrt336_pb2
      END IF
    
      LET l_ac = 1
      
   #  OPEN b_fill_cs2 USING g_enterprise,g_sfga_m.sfgadocno   #(ver:78)
                                               
      FOREACH b_fill_cs2 USING g_enterprise,g_sfga_m.sfgadocno INTO g_sfgb2_d[l_ac].sfgcseq,g_sfgb2_d[l_ac].sfgc001, 
          g_sfgb2_d[l_ac].sfgc002,g_sfgb2_d[l_ac].sfgc003,g_sfgb2_d[l_ac].sfgc004,g_sfgb2_d[l_ac].sfgc005, 
          g_sfgb2_d[l_ac].sfgc006,g_sfgb2_d[l_ac].sfgcsite,g_sfgb2_d[l_ac].sfgc001_desc,g_sfgb2_d[l_ac].sfgc005_desc  
            #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill2.fill"
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = g_sfgb2_d[l_ac].sfgc001
         CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='1053' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
         LET g_sfgb2_d[l_ac].sfgc001_desc = '', g_rtn_fields[1] , ''
         DISPLAY BY NAME g_sfgb2_d[l_ac].sfgc001_desc

         IF g_sfgb2_d[l_ac].sfgc004 = '1' THEN 
            CALL s_desc_get_department_desc(g_sfgb2_d[l_ac].sfgc005) RETURNING g_sfgb2_d[l_ac].sfgc005_desc            
         END IF
         IF g_sfgb2_d[l_ac].sfgc004 = '2' THEN 
            CALL s_desc_get_trading_partner_full_desc(g_sfgb2_d[l_ac].sfgc005) RETURNING g_sfgb2_d[l_ac].sfgc005_desc
         END IF            
         IF g_sfgb2_d[l_ac].sfgc004 = '3' THEN 
            LET g_sfgb2_d[l_ac].sfgc005_desc = NULL
         END IF
         DISPLAY BY NAME g_sfgb2_d[l_ac].sfgc005_desc                                                                        
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
   
   CALL g_sfgb_d.deleteElement(g_sfgb_d.getLength())
   CALL g_sfgb2_d.deleteElement(g_sfgb2_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE asrt336_pb
   FREE asrt336_pb2
 
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_sfgb_d.getLength()
      LET g_sfgb_d_mask_o[l_ac].* =  g_sfgb_d[l_ac].*
      CALL asrt336_sfgb_t_mask()
      LET g_sfgb_d_mask_n[l_ac].* =  g_sfgb_d[l_ac].*
   END FOR
   
   LET g_sfgb2_d_mask_o.* =  g_sfgb2_d.*
   FOR l_ac = 1 TO g_sfgb2_d.getLength()
      LET g_sfgb2_d_mask_o[l_ac].* =  g_sfgb2_d[l_ac].*
      CALL asrt336_sfgc_t_mask()
      LET g_sfgb2_d_mask_n[l_ac].* =  g_sfgb2_d[l_ac].*
   END FOR
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="asrt336.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION asrt336_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM sfgb_t
       WHERE sfgbent = g_enterprise AND
         sfgbdocno = ps_keys_bak[1] AND sfgbseq = ps_keys_bak[2]
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
         CALL g_sfgb_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete2"
                                                
      #end add-point    
      DELETE FROM sfgc_t
       WHERE sfgcent = g_enterprise AND
             sfgcdocno = ps_keys_bak[1] AND sfgcseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中 name="delete_b.m_delete2"
                                                
      #end add-point    
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfgc_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_sfgb2_d.deleteElement(li_idx) 
      END IF 
 
      #add-point:delete_b段刪除後 name="delete_b.a_delete2"
                                                
      #end add-point    
   END IF
 
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
                        
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION asrt336_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO sfgb_t
                  (sfgbent,
                   sfgbdocno,
                   sfgbseq
                   ,sfgb001,sfgb002,sfgb003,sfgbsite) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_sfgb_d[g_detail_idx].sfgb001,g_sfgb_d[g_detail_idx].sfgb002,g_sfgb_d[g_detail_idx].sfgb003, 
                       g_sfgb_d[g_detail_idx].sfgbsite)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
                                                
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfgb_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_sfgb_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
                                                
      #end add-point 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert2"
                                                
      #end add-point 
      INSERT INTO sfgc_t
                  (sfgcent,
                   sfgcdocno,
                   sfgcseq
                   ,sfgc001,sfgc002,sfgc003,sfgc004,sfgc005,sfgc006,sfgcsite) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_sfgb2_d[g_detail_idx].sfgc001,g_sfgb2_d[g_detail_idx].sfgc002,g_sfgb2_d[g_detail_idx].sfgc003, 
                       g_sfgb2_d[g_detail_idx].sfgc004,g_sfgb2_d[g_detail_idx].sfgc005,g_sfgb2_d[g_detail_idx].sfgc006, 
                       g_sfgb2_d[g_detail_idx].sfgcsite)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert2"
                                                
      #end add-point
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sfgc_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'2'" THEN 
         CALL g_sfgb2_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert2"
                                                
      #end add-point
   END IF
 
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
                        
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION asrt336_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "sfgb_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
                                                
      #end add-point 
      
      #將遮罩欄位還原
      CALL asrt336_sfgb_t_mask_restore('restore_mask_o')
               
      UPDATE sfgb_t 
         SET (sfgbdocno,
              sfgbseq
              ,sfgb001,sfgb002,sfgb003,sfgbsite) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_sfgb_d[g_detail_idx].sfgb001,g_sfgb_d[g_detail_idx].sfgb002,g_sfgb_d[g_detail_idx].sfgb003, 
                  g_sfgb_d[g_detail_idx].sfgbsite) 
         WHERE sfgbent = g_enterprise AND sfgbdocno = ps_keys_bak[1] AND sfgbseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
                                                
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sfgb_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sfgb_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL asrt336_sfgb_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
                                                
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "sfgc_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update2"
                                                
      #end add-point  
      
      #將遮罩欄位還原
      CALL asrt336_sfgc_t_mask_restore('restore_mask_o')
               
      UPDATE sfgc_t 
         SET (sfgcdocno,
              sfgcseq
              ,sfgc001,sfgc002,sfgc003,sfgc004,sfgc005,sfgc006,sfgcsite) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_sfgb2_d[g_detail_idx].sfgc001,g_sfgb2_d[g_detail_idx].sfgc002,g_sfgb2_d[g_detail_idx].sfgc003, 
                  g_sfgb2_d[g_detail_idx].sfgc004,g_sfgb2_d[g_detail_idx].sfgc005,g_sfgb2_d[g_detail_idx].sfgc006, 
                  g_sfgb2_d[g_detail_idx].sfgcsite) 
         WHERE sfgcent = g_enterprise AND sfgcdocno = ps_keys_bak[1] AND sfgcseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update2"
                                                
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sfgc_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "sfgc_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
          
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL asrt336_sfgc_t_mask_restore('restore_mask_n')
 
      #add-point:update_b段修改後 name="update_b.after_update2"
                                                
      #end add-point  
   END IF
 
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
 
 
   
 
   
   #add-point:update_b段other name="update_b.other"
                        
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION asrt336_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="asrt336.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION asrt336_key_delete_b(ps_keys_bak,ps_table)
   #add-point:delete_b段define(客製用) name="key_delete_b.define_customerization"
   
   #end add-point
   DEFINE ps_keys_bak       DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_table          STRING
   DEFINE l_field_keys      DYNAMIC ARRAY OF STRING
   DEFINE l_var_keys_bak    DYNAMIC ARRAY OF STRING
   DEFINE l_new_key         DYNAMIC ARRAY OF STRING
   DEFINE l_old_key         DYNAMIC ARRAY OF STRING
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="key_delete_b.define"
   
   #end add-point
   
   #add-point:Function前置處理  name="key_delete_b.pre_function"
   
   #end add-point
   
 
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION asrt336_lock_b(ps_table,ps_page)
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
   #CALL asrt336_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "sfgb_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN asrt336_bcl USING g_enterprise,
                                       g_sfga_m.sfgadocno,g_sfgb_d[g_detail_idx].sfgbseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "asrt336_bcl:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
                                    
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "sfgc_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN asrt336_bcl2 USING g_enterprise,
                                             g_sfga_m.sfgadocno,g_sfgb2_d[g_detail_idx].sfgcseq
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "asrt336_bcl2:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = TRUE 
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
 
 
   
 
   
   #add-point:lock_b段other name="lock_b.other"
   #action进入维护判定结果
   LET ls_group = "maintain_sfgc"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN asrt336_bcl21 USING g_enterprise,
                                             g_sfga_m.sfgadocno,g_sfgb2_d[g_detail_idx].sfgcseq
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "asrt336_bcl21"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF                        
   #end add-point  
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="asrt336.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION asrt336_unlock_b(ps_table,ps_page)
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
      CLOSE asrt336_bcl
   END IF
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE asrt336_bcl2
   END IF
 
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   LET ls_group = "'3',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE asrt336_bcl21
   END IF                        
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="asrt336.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION asrt336_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
                        
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("sfgadocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("sfgadocno",TRUE)
      CALL cl_set_comp_entry("sfgadocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
                                                
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("sfga006,sfga007,sfga009",TRUE)      
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt336.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION asrt336_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   DEFINE l_sfaa061     LIKE sfaa_t.sfaa061   
   DEFINE l_success     LIKE type_t.num5   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("sfgadocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
                                                
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("sfgadocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("sfgadocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
#   SELECT sfaa061 INTO l_sfaa061 FROM sfaa_t
#    WHERE sfaaent   = g_enterprise
#      AND sfaasite  = g_site
#      AND sfaadocno = g_sfga_m.sfga004
      
   
#   IF l_sfaa061 = 'N' THEN
#      LET g_sfga_m.sfga006 = ' '
#      LET g_sfga_m.sfga007 = ' '
#      LET g_sfga_m.sfga006_desc = NULL
#      DISPLAY BY NAME g_sfga_m.sfga006_desc
#      CALL cl_set_comp_entry("sfga006,sfga007",FALSE)              
#   END IF
  
   IF g_sfga_m.sfgadocno IS NOT NULL THEN
      CALL s_aooi200_get_slip(g_sfga_m.sfgadocno) RETURNING l_success,g_doc_slip
      IF cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0060') = 'Y' THEN    #使用判定流程
         LET g_sfga_m.sfga009 = 0
         CALL cl_set_comp_entry("sfga009",FALSE)
      END IF 
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt336.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION asrt336_set_entry_b(p_cmd)
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
   CALL cl_set_comp_entry("sfgcseq,sfgc001,sfgc002,sfgc003,sfgc004,sfgc005,sfgc006",TRUE)   
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="asrt336.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION asrt336_set_no_entry_b(p_cmd)
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
   IF g_sfgb2_d[l_ac].sfgc004 ='3' THEN
      LET g_sfgb2_d[l_ac].sfgc005 = NULL
      CALL cl_set_comp_entry("sfgc005",FALSE) 
   END IF   
   IF g_sfgc_entry = 'N' THEN
      CALL cl_set_comp_entry("sfgcseq,sfgc001,sfgc002,sfgc003,sfgc004,sfgc005,sfgc006",FALSE)
   END IF    
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="asrt336.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION asrt336_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION asrt336_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_sfga_m.sfgastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF


   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION asrt336_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION asrt336_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION asrt336_default_search()
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
      LET ls_wc = ls_wc, " sfgadocno = '", g_argv[01], "' AND "
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
 
 
         FOR li_idx = 1 TO la_wc.getLength()
            CASE
               WHEN la_wc[li_idx].tableid = "sfga_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "sfgb_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "sfgc_t" 
                  LET g_wc2_table2 = la_wc[li_idx].wc
 
 
               WHEN la_wc[li_idx].tableid = "EXTENDWC"
                  LET g_wc2_extend = la_wc[li_idx].wc
            END CASE
         END FOR
         IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
            OR NOT cl_null(g_wc2_table2)
 
 
            OR NOT cl_null(g_wc2_extend)
            THEN
            #組合g_wc2
            IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
               LET g_wc2 = g_wc2_table1
            END IF
            IF g_wc2_table2 <> " 1=1" AND NOT cl_null(g_wc2_table2) THEN
               LET g_wc2 = g_wc2 ," AND ", g_wc2_table2
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
 
{<section id="asrt336.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION asrt336_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success LIKE type_t.num5                     
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
#产生的报工单审核需要tmp表
   IF NOT s_asrt335_cre_tmp_table() THEN
      RETURN      
   END IF                        
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_sfga_m.sfgadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN asrt336_cl USING g_enterprise,g_sfga_m.sfgadocno
   IF STATUS THEN
      CLOSE asrt336_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt336_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE asrt336_master_referesh USING g_sfga_m.sfgadocno INTO g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt, 
       g_sfga_m.sfga002,g_sfga_m.sfga001,g_sfga_m.sfga003,g_sfga_m.sfgastus,g_sfga_m.sfgasite,g_sfga_m.sfga011, 
       g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,g_sfga_m.sfga007,g_sfga_m.sfga008, 
       g_sfga_m.sfga009,g_sfga_m.sfga010,g_sfga_m.sfgaownid,g_sfga_m.sfgaowndp,g_sfga_m.sfgacrtid,g_sfga_m.sfgacrtdp, 
       g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid,g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid,g_sfga_m.sfgacnfdt, 
       g_sfga_m.sfgapstid,g_sfga_m.sfgapstdt,g_sfga_m.sfga002_desc,g_sfga_m.sfga003_desc,g_sfga_m.sfga011_desc, 
       g_sfga_m.sfga006_desc,g_sfga_m.sfgaownid_desc,g_sfga_m.sfgaowndp_desc,g_sfga_m.sfgacrtid_desc, 
       g_sfga_m.sfgacrtdp_desc,g_sfga_m.sfgamodid_desc,g_sfga_m.sfgacnfid_desc,g_sfga_m.sfgapstid_desc 
 
   
 
   #檢查是否允許此動作
   IF NOT asrt336_action_chk() THEN
      CLOSE asrt336_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt,g_sfga_m.sfga002,g_sfga_m.sfga002_desc,g_sfga_m.sfgadocno_desc, 
       g_sfga_m.sfga001,g_sfga_m.sfga003,g_sfga_m.sfga003_desc,g_sfga_m.sfgastus,g_sfga_m.sfgasite,g_sfga_m.sfga011, 
       g_sfga_m.sfga011_desc,g_sfga_m.sfga012,g_sfga_m.imaal003,g_sfga_m.imaal004,g_sfga_m.sfga013,g_sfga_m.sfga014, 
       g_sfga_m.sfga006,g_sfga_m.sfga006_desc,g_sfga_m.sfga007,g_sfga_m.sfga008,g_sfga_m.sfga009,g_sfga_m.sfga010, 
       g_sfga_m.sfgaownid,g_sfga_m.sfgaownid_desc,g_sfga_m.sfgaowndp,g_sfga_m.sfgaowndp_desc,g_sfga_m.sfgacrtid, 
       g_sfga_m.sfgacrtid_desc,g_sfga_m.sfgacrtdp,g_sfga_m.sfgacrtdp_desc,g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid, 
       g_sfga_m.sfgamodid_desc,g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid,g_sfga_m.sfgacnfid_desc,g_sfga_m.sfgacnfdt, 
       g_sfga_m.sfgapstid,g_sfga_m.sfgapstid_desc,g_sfga_m.sfgapstdt
 
   CASE g_sfga_m.sfgastus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
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
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_sfga_m.sfgastus
            
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "S"
               HIDE OPTION "posted"
            WHEN "A"
               HIDE OPTION "approved"
            WHEN "D"
               HIDE OPTION "withdraw"
            WHEN "R"
               HIDE OPTION "rejection"
            WHEN "W"
               HIDE OPTION "signing"
            WHEN "Z"
               HIDE OPTION "unposted"
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
#一些不能切换的状态给隐藏掉，比如post时只能切confimed，不可切unconfirmed和invalid 
         IF g_sfga_m.sfgastus = 'X' THEN
            CLOSE asrt336_cl
            CALL s_transaction_end('N','0')
            RETURN
         END IF
         
         HIDE OPTION "signing"
         HIDE OPTION "withdraw"
         HIDE OPTION "closed"
         HIDE OPTION "hold"
         
         CASE g_sfga_m.sfgastus
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
            WHEN "R"
            #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
               HIDE OPTION "confirmed"
               HIDE OPTION "unconfirmed"
               HIDE OPTION "hold" 
            WHEN "D"
            #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
               HIDE OPTION "confirmed"
               HIDE OPTION "unconfirmed"
               HIDE OPTION "hold" 
            WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
                SHOW OPTION "withdraw"  
                HIDE OPTION "unconfirmed"
                HIDE OPTION "invalid"
                HIDE OPTION "confirmed"
                HIDE OPTION "hold"
            
            WHEN "A"     #只能顯示確認; 其餘應用功能皆隱藏
                SHOW OPTION "confirmed" 
                HIDE OPTION "unconfirmed"
                HIDE OPTION "invalid"
                HIDE OPTION "hold"        
         END CASE 
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT asrt336_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE asrt336_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT asrt336_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE asrt336_cl
            RETURN
         END IF
 
 
 
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            IF NOT cl_ask_confirm('aim-00110') THEN
               CLOSE asrt336_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            IF g_sfga_m.sfgastus = 'Y' THEN   #判断从审核到未审核的，这才是取消审核，从无效到有效（未审核）的，不该走取消审核逻辑
               CALL s_transaction_begin()
               IF NOT s_asrt336_unconf(g_sfga_m.sfgadocno) THEN
                  LET lc_state = "Y"
                  CALL s_transaction_end('N',0)
               ELSE
                  CALL s_transaction_end('Y',0)
                  CALL asrt336_refresh_stus()
               END IF             
            END IF
            CLOSE asrt336_cl
            #end add-point
         END IF
         EXIT MENU
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
#仅当状态为 N.未审核/S.已过帐时,才可以切换为Y.已审核
            IF NOT cl_ask_confirm('aim-00108') THEN
               CLOSE asrt336_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            IF g_sfga_m.sfgastus NOT MATCHES '[N]' THEN
               CLOSE asrt336_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF         
            IF g_sfga_m.sfgastus = 'N' THEN
               CALL s_transaction_begin()         
               IF NOT s_asrt336_conf_chk(g_sfga_m.sfgadocno) THEN
                  LET lc_state = "N"
                  CALL s_transaction_end('N',0)
               ELSE
                  IF NOT s_asrt336_conf_upd(g_sfga_m.sfgadocno) THEN  
                     LET lc_state = "N"
                     CALL s_transaction_end('N',0)
                  ELSE
                     CALL s_transaction_end('Y',0) 
                     CALL asrt336_refresh_stus()                                  
                  END IF                
                 
               END IF               
            END IF  
            CLOSE asrt336_cl            
            #end add-point
         END IF
         EXIT MENU
      ON ACTION posted
         IF cl_auth_chk_act("posted") THEN
            LET lc_state = "S"
            #add-point:action控制 name="statechange.posted"
         IF g_sfga_m.sfgastus NOT MATCHES '[Y]' THEN
            CLOSE asrt336_cl
            CALL s_transaction_end('N','0')
            RETURN
         END IF 
#过帐日期录入
         CALL s_asrt336_post_input(g_sfga_m.sfgadocno)
              RETURNING l_success,g_sfga_m.sfga001
         IF NOT l_success THEN
            LET lc_state = "Y"
            CLOSE asrt336_cl
            CALL s_transaction_end('N','0')
            RETURN
         END IF          

         CALL s_asrt336_post(g_sfga_m.sfgadocno,g_sfga_m.sfga001)
              RETURNING l_success
         IF NOT l_success THEN
            LET lc_state = "Y"
            CALL s_transaction_end('N',0)
         ELSE
            LET g_sfga_m.sfgastus = 'S'
            CALL s_transaction_end('Y',0)         
         END IF 
         CLOSE asrt336_cl
         CALL s_asft335_drop_tmp_table() 
         CALL asrt336_refresh_stus()         
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
      ON ACTION unposted
         IF cl_auth_chk_act("unposted") THEN
            LET lc_state = "Z"
            #add-point:action控制 name="statechange.unposted"
         LET lc_state = "Y"
         IF g_sfga_m.sfgastus = 'S' THEN        
            IF NOT s_asrt336_unpost(g_sfga_m.sfgadocno) THEN
               LET lc_state = "S"
               CALL s_transaction_end('N',0)
            ELSE
               LET g_sfga_m.sfgastus = 'Y'
               CALL s_transaction_end('Y',0)         
            END IF  
            CLOSE asrt336_cl
            CALL s_asft335_drop_tmp_table()  
            CALL asrt336_refresh_stus()            
         END IF 
            #end add-point
         END IF
         EXIT MENU
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
            IF NOT cl_ask_confirm('aim-00109') THEN
               CLOSE asrt336_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            IF g_sfga_m.sfgastus NOT MATCHES '[N]' THEN
               CLOSE asrt336_cl
               CALL s_transaction_end('N','0')
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
      AND lc_state <> "S"
      AND lc_state <> "A"
      AND lc_state <> "D"
      AND lc_state <> "R"
      AND lc_state <> "W"
      AND lc_state <> "Z"
      AND lc_state <> "X"
      ) OR 
      g_sfga_m.sfgastus = lc_state OR cl_null(lc_state) THEN
      CLOSE asrt336_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
                        
   #end add-point
   
   LET g_sfga_m.sfgamodid = g_user
   LET g_sfga_m.sfgamoddt = cl_get_current()
   LET g_sfga_m.sfgastus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE sfga_t 
      SET (sfgastus,sfgamodid,sfgamoddt) 
        = (g_sfga_m.sfgastus,g_sfga_m.sfgamodid,g_sfga_m.sfgamoddt)     
    WHERE sfgaent = g_enterprise AND sfgadocno = g_sfga_m.sfgadocno
 
    
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE asrt336_master_referesh USING g_sfga_m.sfgadocno INTO g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt, 
          g_sfga_m.sfga002,g_sfga_m.sfga001,g_sfga_m.sfga003,g_sfga_m.sfgastus,g_sfga_m.sfgasite,g_sfga_m.sfga011, 
          g_sfga_m.sfga012,g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,g_sfga_m.sfga007,g_sfga_m.sfga008, 
          g_sfga_m.sfga009,g_sfga_m.sfga010,g_sfga_m.sfgaownid,g_sfga_m.sfgaowndp,g_sfga_m.sfgacrtid, 
          g_sfga_m.sfgacrtdp,g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid,g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid, 
          g_sfga_m.sfgacnfdt,g_sfga_m.sfgapstid,g_sfga_m.sfgapstdt,g_sfga_m.sfga002_desc,g_sfga_m.sfga003_desc, 
          g_sfga_m.sfga011_desc,g_sfga_m.sfga006_desc,g_sfga_m.sfgaownid_desc,g_sfga_m.sfgaowndp_desc, 
          g_sfga_m.sfgacrtid_desc,g_sfga_m.sfgacrtdp_desc,g_sfga_m.sfgamodid_desc,g_sfga_m.sfgacnfid_desc, 
          g_sfga_m.sfgapstid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_sfga_m.sfgadocno,g_sfga_m.sfgadocdt,g_sfga_m.sfga002,g_sfga_m.sfga002_desc,g_sfga_m.sfgadocno_desc, 
          g_sfga_m.sfga001,g_sfga_m.sfga003,g_sfga_m.sfga003_desc,g_sfga_m.sfgastus,g_sfga_m.sfgasite, 
          g_sfga_m.sfga011,g_sfga_m.sfga011_desc,g_sfga_m.sfga012,g_sfga_m.imaal003,g_sfga_m.imaal004, 
          g_sfga_m.sfga013,g_sfga_m.sfga014,g_sfga_m.sfga006,g_sfga_m.sfga006_desc,g_sfga_m.sfga007, 
          g_sfga_m.sfga008,g_sfga_m.sfga009,g_sfga_m.sfga010,g_sfga_m.sfgaownid,g_sfga_m.sfgaownid_desc, 
          g_sfga_m.sfgaowndp,g_sfga_m.sfgaowndp_desc,g_sfga_m.sfgacrtid,g_sfga_m.sfgacrtid_desc,g_sfga_m.sfgacrtdp, 
          g_sfga_m.sfgacrtdp_desc,g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid,g_sfga_m.sfgamodid_desc,g_sfga_m.sfgamoddt, 
          g_sfga_m.sfgacnfid,g_sfga_m.sfgacnfid_desc,g_sfga_m.sfgacnfdt,g_sfga_m.sfgapstid,g_sfga_m.sfgapstid_desc, 
          g_sfga_m.sfgapstdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
                        
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
                        
   #end add-point  
 
   CLOSE asrt336_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL asrt336_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt336.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION asrt336_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
                        
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_sfgb_d.getLength() THEN
         LET g_detail_idx = g_sfgb_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sfgb_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sfgb_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_sfgb2_d.getLength() THEN
         LET g_detail_idx = g_sfgb2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sfgb2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_sfgb2_d.getLength() TO FORMONLY.cnt
   END IF
 
   
   #add-point:idx_chk段other name="idx_chk.other"
                        
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION asrt336_b_fill2(pi_idx)
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
   
   CALL asrt336_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION asrt336_fill_chk(ps_idx)
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
      (cl_null(g_wc2_table2) OR g_wc2_table2.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"
                                                
      #end add-point
      RETURN TRUE
   END IF
   
   #add-point:fill_chk段after_chk name="fill_chk.after_chk"
   
   #end add-point
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="asrt336.status_show" >}
PRIVATE FUNCTION asrt336_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="asrt336.mask_functions" >}
&include "erp/asr/asrt336_mask.4gl"
 
{</section>}
 
{<section id="asrt336.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION asrt336_send()
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
 
 
   CALL asrt336_show()
   CALL asrt336_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   CALL s_asrt336_conf_chk(g_sfga_m.sfgadocno) RETURNING l_success
   IF NOT l_success THEN
      CLOSE asrt336_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   CALL s_asrt336_conf_upd(g_sfga_m.sfgadocno) RETURNING l_success
   IF NOT l_success THEN
      CLOSE asrt336_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_sfga_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_sfgb_d))
   CALL cl_bpm_set_detail_data("s_detail2", util.JSONArray.fromFGL(g_sfgb2_d))
 
 
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
   #CALL asrt336_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL asrt336_ui_headershow()
   CALL asrt336_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION asrt336_draw_out()
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
   CALL asrt336_ui_headershow()  
   CALL asrt336_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="asrt336.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION asrt336_set_pk_array()
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
   LET g_pk_array[1].values = g_sfga_m.sfgadocno
   LET g_pk_array[1].column = 'sfgadocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt336.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="asrt336.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION asrt336_msgcentre_notify(lc_state)
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
   CALL asrt336_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_sfga_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt336.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION asrt336_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#37-s
   SELECT sfgastus INTO g_sfga_m.sfgastus FROM sfga_t
    WHERE sfgaent = g_enterprise
      AND sfgasite = g_site
      AND sfgadocno = g_sfga_m.sfgadocno
      
   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_sfga_m.sfgastus
        WHEN 'W'
           LET g_errno = 'sub-01347'
        WHEN 'X'
           LET g_errno = 'sub-00229'
        WHEN 'Y'
           LET g_errno = 'sub-00178'
        WHEN 'S'
           LET g_errno = 'sub-00230'
        WHEN 'Z'
           LET g_errno = 'sub-01351'

     END CASE

     IF NOT cl_null(g_errno) THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code = g_errno
        LET g_errparam.extend = g_sfga_m.sfgadocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL asrt336_set_act_visible()
        CALL asrt336_set_act_no_visible()
        CALL asrt336_show()
        RETURN FALSE
     END IF
   END IF      
   #160818-00017#37-e
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt336.other_function" readonly="Y" >}

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
PRIVATE FUNCTION asrt336_set_required()
#   DEFINE l_sfaa061     LIKE sfaa_t.sfaa061
   
#   SELECT sfaa061 INTO l_sfaa061 FROM sfaa_t
#    WHERE sfaaent   = g_enterprise
#      AND sfaasite  = g_site
#      AND sfaadocno = g_sfga_m.sfga004
      
   
#   IF l_sfaa061 = 'Y' THEN
#      CALL cl_set_comp_required("sfga006,sfga007",TRUE)              
#   END IF
END FUNCTION
################################################################################
# Descriptions...: 在改变判定方式和数量时，更新单头报废数量
# Memo...........:
# Usage..........: CALL asrt336_set_sfga009(p_sfgc002_t,p_sfgc002,p_sfgc003)
#                  RETURNING r_success
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: r_success      回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 2014/03/07 By wujie
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt336_set_sfga009()
DEFINE l_sfgc003_sum     LIKE sfgc_t.sfgc003
DEFINE l_sfgc003_sum1    LIKE sfgc_t.sfgc003     #报废数量
DEFINE l_sfgc003_sum2    LIKE sfgc_t.sfgc003     #重工数量
DEFINE i                 LIKE type_t.num5
DEFINE r_success         LIKE type_t.num5

   LET l_sfgc003_sum  = 0
   LET l_sfgc003_sum1 = 0
   LET l_sfgc003_sum2 = 0
   LET r_success = TRUE
   FOR i = 1 TO g_sfgb2_d.getlength()
       IF g_sfgb2_d[i].sfgc002 = '1' THEN
          LET l_sfgc003_sum1 = l_sfgc003_sum1 + g_sfgb2_d[i].sfgc003
       END IF
       IF g_sfgb2_d[i].sfgc002 = '2' THEN
          LET l_sfgc003_sum2 = l_sfgc003_sum2 + g_sfgb2_d[i].sfgc003
       END IF
   END FOR
   LET l_sfgc003_sum = l_sfgc003_sum1 + l_sfgc003_sum2
   IF l_sfgc003_sum > g_sfga_m.sfga008 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00290'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   UPDATE sfga_t set sfga009 = l_sfgc003_sum1
    WHERE sfgaent   = g_enterprise
      AND sfgadocno = g_sfga_m.sfgadocno
      
   IF SQLCA.sqlcode OR SQLCA.sqlerrd[3] = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00148'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success = FALSE
      RETURN r_success
   END IF
   LET g_sfga_m.sfga009 = l_sfgc003_sum1
   DISPLAY BY NAME g_sfga_m.sfga009
   RETURN r_success
                   
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
PRIVATE FUNCTION asrt336_set_no_required()
   CALL cl_set_comp_required("sfga006,sfga007",FALSE)
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
PRIVATE FUNCTION asrt336_input_sfgc()
   DEFINE  p_cmd                 LIKE type_t.chr1
   DEFINE  l_cmd_t               LIKE type_t.chr1
   DEFINE  l_cmd                 LIKE type_t.chr1
   DEFINE  l_n                   LIKE type_t.num5                #檢查重複用  
   DEFINE  l_cnt                 LIKE type_t.num5                #檢查重複用  
   DEFINE  l_lock_sw             LIKE type_t.chr1                #單身鎖住否  
   DEFINE  l_allow_insert        LIKE type_t.num5                #可新增否 
   DEFINE  l_allow_delete        LIKE type_t.num5                #可刪除否  
   DEFINE  l_count               LIKE type_t.num5
   DEFINE  l_i                   LIKE type_t.num5
   DEFINE  l_insert              BOOLEAN
   DEFINE  ls_return             STRING
   DEFINE  l_var_keys            DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys          DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                DYNAMIC ARRAY OF STRING
   DEFINE  l_fields              DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak        DYNAMIC ARRAY OF STRING
   DEFINE  lb_reproduce          BOOLEAN
   DEFINE  li_reproduce          LIKE type_t.num5
   DEFINE  li_reproduce_target   LIKE type_t.num5
   DEFINE  l_ooef004             LIKE ooef_t.ooef004
   DEFINE  l_sfaa061             LIKE sfaa_t.sfaa061 
   DEFINE  l_sffb009             LIKE sffb_t.sffb009
   DEFINE  l_qty                 LIKE sfga_t.sfga008
   DEFINE  l_sfgc003_sum         LIKE sfgc_t.sfgc003
   DEFINE  l_sffb016             LIKE sffb_t.sffb016 
   DEFINE  l_success             LIKE type_t.num5  



#参数不使用判定流程不能进入
   CALL s_aooi200_get_slip(g_sfga_m.sfgadocno) RETURNING l_success,g_doc_slip
   IF cl_get_doc_para(g_enterprise,g_site,g_doc_slip,'D-MFG-0060') = 'N' OR g_sfga_m.sfgastus <> 'Y' THEN 
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00259'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN
   END IF 

#定义cursor放在asrt336_init()里了，因为asrt336_lock_b()要用到这个cursor，但是现在设计器没办法把本函数提到asrt336_lock_b()之前去
#   LET g_forupd_sql = "SELECT sfgcseq,sfgc001,'',sfgc002,sfgc003,sfgc004,sfgc005,'',sfgc006,sfgcsite  
#       FROM sfgc_t WHERE sfgcent=? AND sfgcdocno=? AND sfgcseq=? FOR UPDATE"
#
#   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
#   DECLARE asrt336_bcl21 CURSOR FROM g_forupd_sql 
 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL asrt336_set_entry(p_cmd)
   #add-point:set_entry後
                        
   #end add-point
   CALL asrt336_set_no_entry(p_cmd)

   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM) 
      INPUT ARRAY g_sfgb2_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 

                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sfgb2_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL asrt336_b_fill()
            LET g_rec_b = g_sfgb2_d.getLength()
            #add-point:資料輸入前          
            #end add-point
            
         BEFORE INSERT
            
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_sfgb2_d[l_ac].* TO NULL 
                  LET g_sfgb2_d[l_ac].sfgc004 = "1"
 
 
            LET g_sfgb2_d_t.* = g_sfgb2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL asrt336_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b
            LET g_sfgb2_d[l_ac].sfgc004 = '1'                                                                                     
            #end add-point
            CALL asrt336_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sfgb2_d[li_reproduce_target].* = g_sfgb2_d[li_reproduce].*
 
               LET g_sfgb2_d[li_reproduce_target].sfgcseq = NULL
            END IF
            #公用欄位給值(單身2)
            
            
            #add-point:modify段before insert
            LET g_sfgb2_d[l_ac].sfgc002 = '1'
            LET g_sfgb2_d[l_ac].sfgcsite = g_site
            CALL asrt336_set_no_required_b()
            CALL asrt336_set_required_b()
            #end add-point  
            
         BEFORE ROW     
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
              
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN asrt336_cl USING g_enterprise,g_sfga_m.sfgadocno
            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN asrt336_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               CLOSE asrt336_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            
            LET g_rec_b = g_sfgb2_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_sfgb2_d[l_ac].sfgcseq IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_sfgb2_d_t.* = g_sfgb2_d[l_ac].*  #BACKUP
               CALL asrt336_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b
                                                                                                                        
               #end add-point  
               CALL asrt336_set_no_entry_b(l_cmd)
               IF NOT asrt336_lock_b("maintain_sfgc","'3'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH asrt336_bcl21 INTO g_sfgb2_d[l_ac].sfgcseq,g_sfgb2_d[l_ac].sfgc001,g_sfgb2_d[l_ac].sfgc001_desc, 
                      g_sfgb2_d[l_ac].sfgc002,g_sfgb2_d[l_ac].sfgc003,g_sfgb2_d[l_ac].sfgc004,g_sfgb2_d[l_ac].sfgc005, 
                      g_sfgb2_d[l_ac].sfgc005_desc,g_sfgb2_d[l_ac].sfgc006,g_sfgb2_d[l_ac].sfgcsite
                   IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET l_lock_sw = "Y"
                  END IF
                  
                  LET g_bfill = "N"
                  CALL asrt336_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row
            CALL asrt336_set_no_required_b()
            CALL asrt336_set_required_b()                                                                                                
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
            #其他table進行lock
            
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' AND g_sfgb2_d.getLength() < l_ac THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
               CALL g_sfgb2_d.deleteElement(l_ac)
               NEXT FIELD sfgcseq
            END IF
         
            IF g_sfgb2_d[l_ac].sfgcseq IS NOT NULL
            THEN
               IF NOT cl_ask_del_detail() THEN
                  CANCEL DELETE
               END IF
               IF l_lock_sw = "Y" THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code =  -263
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CANCEL DELETE
               END IF
               
               #add-point:單身2刪除前
                                                                                                                        
               #end add-point    
               
               DELETE FROM sfgc_t
                WHERE sfgcent = g_enterprise AND sfgcdocno = g_sfga_m.sfgadocno AND
                      sfgcseq = g_sfgb2_d_t.sfgcseq
                  
               #add-point:單身2刪除中
                                                                                                                        
               #end add-point    
                  
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "sfgb_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')
                  CANCEL DELETE   
               ELSE
                  LET g_rec_b = g_rec_b-1
                  
                  #add-point:單身2刪除後
                                                                                                                                                
                  #end add-point
                  CALL s_transaction_end('Y','0')
               END IF 
               CLOSE asrt336_bcl
               LET l_count = g_sfgb_d.getLength()
            END IF 
            
                           INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfga_m.sfgadocno
               LET gs_keys[2] = g_sfgb2_d[g_detail_idx].sfgcseq
 
            
         AFTER DELETE 
            #add-point:單身AFTER DELETE 
                                                                                               
            #end add-point
 
         AFTER INSERT    
            LET l_insert = FALSE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               CANCEL INSERT
            END IF
               
            #add-point:單身2新增前
                                                                                                
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(*) INTO l_count FROM sfgc_t 
             WHERE sfgcent = g_enterprise AND sfgcdocno = g_sfga_m.sfgadocno
               AND sfgcseq = g_sfgb2_d[l_ac].sfgcseq
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前
                                                                                                                        
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfga_m.sfgadocno
               LET gs_keys[2] = g_sfgb2_d[g_detail_idx].sfgcseq
               CALL asrt336_insert_b('sfgc_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2
                                                                                                                        
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00006"
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               CALL cl_err()

               INITIALIZE g_sfgb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "sfgc_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
               CALL s_transaction_end('N','0')                    
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL asrt336_b_fill()
               #資料多語言用-增/改
               
               #add-point:單身新增後
                                                                                                                        
               #end add-point
               CALL s_transaction_end('Y','0')
               ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               LET g_sfgb2_d[l_ac].* = g_sfgb2_d_t.*
               CLOSE asrt336_bcl21
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
            
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET g_sfgb2_d[l_ac].* = g_sfgb2_d_t.*
            ELSE
               #add-point:單身page2修改前
                                                                                                                        
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               UPDATE sfgc_t SET (sfgcdocno,sfgcseq,sfgc001,sfgc002,sfgc003,sfgc004,sfgc005,sfgc006, 
                   sfgcsite) = (g_sfga_m.sfgadocno,g_sfgb2_d[l_ac].sfgcseq,g_sfgb2_d[l_ac].sfgc001,g_sfgb2_d[l_ac].sfgc002, 
                   g_sfgb2_d[l_ac].sfgc003,g_sfgb2_d[l_ac].sfgc004,g_sfgb2_d[l_ac].sfgc005,g_sfgb2_d[l_ac].sfgc006, 
                   g_sfgb2_d[l_ac].sfgcsite) #自訂欄位頁簽
                WHERE sfgcent = g_enterprise AND sfgcdocno = g_sfga_m.sfgadocno
                  AND sfgcseq = g_sfgb2_d_t.sfgcseq #項次 
                  
               #add-point:單身page2修改中
                                                                                                                        
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.extend = "sfgc_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CALL s_transaction_end('N','0')
                     LET g_sfgb2_d[l_ac].* = g_sfgb2_d_t.*
                  WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "sfgc_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
                     CALL s_transaction_end('N','0')
                     LET g_sfgb2_d[l_ac].* = g_sfgb2_d_t.*
                  OTHERWISE
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfga_m.sfgadocno
               LET gs_keys_bak[1] = g_sfgadocno_t
               LET gs_keys[2] = g_sfgb2_d[g_detail_idx].sfgcseq
               LET gs_keys_bak[2] = g_sfgb2_d_t.sfgcseq
               CALL asrt336_update_b('sfgc_t',gs_keys,gs_keys_bak,"'2'")
                     #資料多語言用-增/改
                     
               END CASE
               #add-point:單身page2修改後
                                                                                                                        
               #end add-point
            END IF
         
         #---------------------<  Detail: page2  >---------------------
         #----<<sfgcseq>>----
         #此段落由子樣板a02產生
         AFTER FIELD sfgcseq
            #此段落由子樣板a15產生
            IF NOT cl_ap_chk_Range(g_sfgb2_d[l_ac].sfgcseq,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD sfgcseq
            END IF
 
 
            #add-point:AFTER FIELD sfgcseq
                                                                                                
            IF NOT cl_null(g_sfgb2_d[l_ac].sfgcseq) THEN 
            END IF 

            #此段落由子樣板a05產生
            IF  g_sfga_m.sfgadocno IS NOT NULL AND g_sfgb2_d[g_detail_idx].sfgcseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_sfga_m.sfgadocno != g_sfgadocno_t OR g_sfgb2_d[g_detail_idx].sfgcseq != g_sfgb2_d_t.sfgcseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sfgc_t WHERE "||"sfgcent = '" ||g_enterprise|| "' AND "||"sfgcdocno = '"||g_sfga_m.sfgadocno ||"' AND "|| "sfgcseq = '"||g_sfgb2_d[g_detail_idx].sfgcseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sfgcseq
            #add-point:BEFORE FIELD sfgcseq
                                                IF g_sfgb2_d[l_ac].sfgcseq IS NULL OR g_sfgb2_d[l_ac].sfgcseq = 0 THEN
               SELECT MAX(sfgcseq)+1 INTO g_sfgb2_d[l_ac].sfgcseq
                 FROM sfgc_t
                WHERE sfgcent   = g_enterprise 
                  AND sfgcdocno = g_sfga_m.sfgadocno 

            END IF
            IF g_sfgb2_d[l_ac].sfgcseq IS NULL THEN
               LET g_sfgb2_d[l_ac].sfgcseq = 1
            END IF                                                            
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sfgcseq
            #add-point:ON CHANGE sfgcseq
                                                                                                
            #END add-point
 
         #----<<sfgc001>>----
         #此段落由子樣板a02產生
         AFTER FIELD sfgc001
            
            #add-point:AFTER FIELD sfgc001
                                                                                                
            IF NOT cl_null(g_sfgb2_d[l_ac].sfgc001) THEN 
               IF l_cmd = 'a' OR (l_cmd = 'u' AND g_sfgb2_d[l_ac].sfgc001 <> g_sfgb2_d_t.sfgc001) THEN
#此段落由子樣板a19產生
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_errshow = TRUE #是否開窗 #160318-00025#34  add
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_sfgb2_d[l_ac].sfgc001
			         LET g_chkparam.err_str[1] = "aqc-00032:sub-01302|aqci030|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
                  LET g_chkparam.err_str[2] = "aqc-00031:sub-01303|aqci030|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"  #160318-00025#34  add
                     
                  #呼叫檢查存在並帶值的library
                  IF cl_chk_exist("v_oocq002_1053") THEN
                     #檢查成功時後續處理
                     #LET  = g_chkparam.return1
                     #DISPLAY BY NAME 
			      
                  ELSE
                     #檢查失敗時後續處理
                     NEXT FIELD CURRENT
                  END IF
               END IF
            

            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_sfgb2_d[l_ac].sfgc001
            CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001='1053' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_sfgb2_d[l_ac].sfgc001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_sfgb2_d[l_ac].sfgc001_desc

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sfgc001
            #add-point:BEFORE FIELD sfgc001
                                                                                                
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sfgc001
            #add-point:ON CHANGE sfgc001
                                                                                                
            #END add-point
 
         #----<<sfgc001_desc>>----
         #----<<sfgc002>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfgc002
            #add-point:BEFORE FIELD sfgc002
                                                                                                
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfgc002
            
            #add-point:AFTER FIELD sfgc002
            IF NOT cl_null(g_sfgb2_d[l_ac].sfgc002) THEN 
              #IF l_cmd = 'a' OR (l_cmd = 'u' AND g_sfgb2_d[l_ac].sfgc002 <> g_sfgb2_d_t.sfgc002) THEN  #160824-00007#284 by sakura mark
               IF g_sfgb2_d[l_ac].sfgc002 <> g_sfgb2_d_o.sfgc002 OR cl_null(g_sfgb2_d_o.sfgc002) THEN   #160824-00007#284 by sakura add
                  IF NOT asrt336_set_sfga009() THEN
                    #LET g_sfgb2_d[l_ac].sfgc002 = g_sfgb2_d_t.sfgc002   #160824-00007#284 by sakura mark
                     LET g_sfgb2_d[l_ac].sfgc002 = g_sfgb2_d_o.sfgc002   #160824-00007#284 by sakura add
                     NEXT FIELD CURRENT
                  END IF
               END IF 
            END IF
            LET g_sfgb2_d_o.* = g_sfgb2_d[l_ac].*   #160824-00007#284 by sakura add          
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE sfgc002
            #add-point:ON CHANGE sfgc002
                                                                                                
            #END add-point
 
         #----<<sfgc003>>----
         #此段落由子樣板a02產生
         AFTER FIELD sfgc003
            #此段落由子樣板a15產生
            IF NOT cl_ap_chk_Range(g_sfgb2_d[l_ac].sfgc003,"0.000","0","","","azz-00079",1) THEN
               NEXT FIELD sfgc003
            END IF
 
 
            #add-point:AFTER FIELD sfgc003
                                                                                                
            IF NOT cl_null(g_sfgb2_d[l_ac].sfgc003) THEN 
              #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_sfgb2_d_t.sfgc003 IS NULL OR g_sfgb2_d[l_ac].sfgc003 <> g_sfgb2_d_t.sfgc003)) THEN   #160824-00007#284 by sakura mark
               IF g_sfgb2_d_o.sfgc003 IS NULL OR g_sfgb2_d[l_ac].sfgc003 <> g_sfgb2_d_o.sfgc003 THEN   #160824-00007#284 by sakura add
#同步单头报废数量为单身之和 
#同时判断单身合计数不可大于单头申请数量
                  IF NOT asrt336_set_sfga009() THEN
                    #LET g_sfgb2_d[l_ac].sfgc003 = g_sfgb2_d_t.sfgc003   #160824-00007#284 by sakura mark
                     LET g_sfgb2_d[l_ac].sfgc003 = g_sfgb2_d_o.sfgc003   #160824-00007#284 by sakura add
                     NEXT FIELD CURRENT
                  END IF
               END IF 
            END IF 
            LET g_sfgb2_d_o.* = g_sfgb2_d[l_ac].*   #160824-00007#284 by sakura add
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sfgc003
            #add-point:BEFORE FIELD sfgc003
                                                                                                
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sfgc003
            #add-point:ON CHANGE sfgc003
                                                                                                
            #END add-point
 
         #----<<sfgc004>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfgc004
            #add-point:BEFORE FIELD sfgc004
            CALL asrt336_set_entry_b(l_cmd)  
            CALL asrt336_set_no_required()            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfgc004
            
            #add-point:AFTER FIELD sfgc004
            CALL asrt336_set_no_entry_b(l_cmd)  
            CALL asrt336_set_required()         
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE sfgc004
            #add-point:ON CHANGE sfgc004
                                                                                                
            #END add-point
 
         #----<<sfgc005>>----
         #此段落由子樣板a02產生
         AFTER FIELD sfgc005
            
            #add-point:AFTER FIELD sfgc005
                                                                                                
            IF NOT cl_null(g_sfgb2_d[l_ac].sfgc005) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_sfgb2_d_t.sfgc005 IS NULL OR g_sfgb2_d[l_ac].sfgc005 <> g_sfgb2_d_t.sfgc005)) THEN  
                  IF g_sfgb2_d[l_ac].sfgc004 = '1' THEN               
#此段落由子樣板a19產生
                     #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                     INITIALIZE g_chkparam.* TO NULL
                     
                     #設定g_chkparam.*的參數
                     LET g_chkparam.arg1 = g_sfgb2_d[l_ac].sfgc005
                     LET g_chkparam.arg2 = cl_get_today()
			         
                        
                     #呼叫檢查存在並帶值的library
                     IF cl_chk_exist("v_ooeg001_2") THEN
                        #檢查成功時後續處理
                        #LET  = g_chkparam.return1
                        #DISPLAY BY NAME 
			         
                     ELSE
                        #檢查失敗時後續處理
                        NEXT FIELD CURRENT
                     END IF
                  END IF
                  IF g_sfgb2_d[l_ac].sfgc004 = '2' THEN               
#此段落由子樣板a19產生
                     #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                     INITIALIZE g_chkparam.* TO NULL
                     
                     #設定g_chkparam.*的參數
                     LET g_chkparam.arg1 = g_sfgb2_d[l_ac].sfgc005
			         
                        
                     #呼叫檢查存在並帶值的library
                     IF cl_chk_exist("v_pmaa001_1") THEN
                        #檢查成功時後續處理
                        #LET  = g_chkparam.return1
                        #DISPLAY BY NAME 
			         
                     ELSE
                        #檢查失敗時後續處理
                        NEXT FIELD CURRENT
                     END IF
                  END IF
               END IF
            

            END IF 
            IF g_sfgb2_d[l_ac].sfgc004 = '1' THEN 
               CALL s_desc_get_department_desc(g_sfgb2_d[l_ac].sfgc005) RETURNING g_sfgb2_d[l_ac].sfgc005_desc            
            END IF
            IF g_sfgb2_d[l_ac].sfgc004 = '2' THEN 
               CALL s_desc_get_trading_partner_full_desc(g_sfgb2_d[l_ac].sfgc005) RETURNING g_sfgb2_d[l_ac].sfgc005_desc
            END IF            
            IF g_sfgb2_d[l_ac].sfgc004 = '3' THEN 
               LET g_sfgb2_d[l_ac].sfgc005_desc = NULL
            END IF
            DISPLAY BY NAME g_sfgb2_d[l_ac].sfgc005_desc
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sfgc005
            #add-point:BEFORE FIELD sfgc005
                                                                                                
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sfgc005
            #add-point:ON CHANGE sfgc005
                                                                                                
            #END add-point
 
         #----<<sfgc005_desc>>----
         #----<<sfgc006>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfgc006
            #add-point:BEFORE FIELD sfgc006
                                                                                                
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfgc006
            
            #add-point:AFTER FIELD sfgc006
                                                                                                
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE sfgc006
            #add-point:ON CHANGE sfgc006
                                                                                                
            #END add-point
 
         #----<<sfgcsite>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfgcsite
            #add-point:BEFORE FIELD sfgcsite
                                                                                                
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfgcsite
            
            #add-point:AFTER FIELD sfgcsite
                                                                                                
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE sfgcsite
            #add-point:ON CHANGE sfgcsite
                                                                                                
            #END add-point
 
 
         #---------------------<  Detail: page2  >---------------------
         #----<<sfgcseq>>----
         #Ctrlp:input.c.page2.sfgcseq
         ON ACTION controlp INFIELD sfgcseq
            #add-point:ON ACTION controlp INFIELD sfgcseq
                                                                                                
            #END add-point
 
         #----<<sfgc001>>----
         #Ctrlp:input.c.page2.sfgc001
         ON ACTION controlp INFIELD sfgc001
            #add-point:ON ACTION controlp INFIELD sfgc001
                                                                                                #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfgb2_d[l_ac].sfgc001             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "1053" 

            CALL q_oocq002()                                #呼叫開窗

            LET g_sfgb2_d[l_ac].sfgc001 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfgb2_d[l_ac].sfgc001 TO sfgc001              #顯示到畫面上

            NEXT FIELD sfgc001                          #返回原欄位


            #END add-point
 
         #----<<sfgc001_desc>>----
         #----<<sfgc002>>----
         #Ctrlp:input.c.page2.sfgc002
         ON ACTION controlp INFIELD sfgc002
            #add-point:ON ACTION controlp INFIELD sfgc002
                                                                                                
            #END add-point
 
         #----<<sfgc003>>----
         #Ctrlp:input.c.page2.sfgc003
         ON ACTION controlp INFIELD sfgc003
            #add-point:ON ACTION controlp INFIELD sfgc003
                                                                                                
            #END add-point
 
         #----<<sfgc004>>----
         #Ctrlp:input.c.page2.sfgc004
         ON ACTION controlp INFIELD sfgc004
            #add-point:ON ACTION controlp INFIELD sfgc004
                                                                                                
            #END add-point
 
         #----<<sfgc005>>----
         #Ctrlp:input.c.page2.sfgc005
         ON ACTION controlp INFIELD sfgc005
            #add-point:ON ACTION controlp INFIELD sfgc005
                                                                                                #此段落由子樣板a07產生            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfgb2_d[l_ac].sfgc005             #給予default值

            #給予arg
            IF g_sfgb2_d[l_ac].sfgc004 ='1' THEN
               LET g_qryparam.arg1 = g_sfga_m.sfgadocdt
               CALL q_ooeg001()                                              #呼叫開窗
               LET g_sfgb2_d[l_ac].sfgc005 = g_qryparam.return1              #將開窗取得的值回傳到變數
               DISPLAY g_sfgb2_d[l_ac].sfgc005 TO sfgc005                    #顯示到畫面上
            END IF
            IF g_sfgb2_d[l_ac].sfgc004 ='2' THEN
               LET g_qryparam.arg1 = " ('1','3')"                            #交易對象類型
               CALL q_pmaa001_1()                                            #呼叫開窗
               LET g_sfgb2_d[l_ac].sfgc005 = g_qryparam.return1              #將開窗取得的值回傳到變數
               DISPLAY g_sfgb2_d[l_ac].sfgc005 TO sfgc005                    #顯示到畫面上
            END IF

            NEXT FIELD sfgc005                          #返回原欄位


            #END add-point
 
         #----<<sfgc005_desc>>----
         #----<<sfgc006>>----
         #Ctrlp:input.c.page2.sfgc006
         ON ACTION controlp INFIELD sfgc006
            #add-point:ON ACTION controlp INFIELD sfgc006
                                                                                                
            #END add-point
 
         #----<<sfgcsite>>----
         #Ctrlp:input.c.page2.sfgcsite
         ON ACTION controlp INFIELD sfgcsite
            #add-point:ON ACTION controlp INFIELD sfgcsite
                                                                                                
            #END add-point
 
 
 
         AFTER ROW
            #add-point:單身page2 after_row
                                                                                                
            #end add-point
            LET l_ac = ARR_CURR()
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_sfgb2_d[l_ac].* = g_sfgb2_d_t.*
               END IF
               CLOSE asrt336_bcl21
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL asrt336_unlock_b("maintain_sfgc","'3'")
            CALL s_transaction_end('Y','0')
 
         AFTER INPUT
            #add-point:input段after input 
                                                                                                
            #end add-point   
    
         ON ACTION controlo
            CALL FGL_SET_ARR_CURR(g_sfgb2_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac
            LET li_reproduce_target = g_sfgb2_d.getLength()+1
 
      END INPUT
 
      
 

      #add-point:自定義input
                                                
      #end add-point
      
      BEFORE DIALOG 
         #add-point:input段before dialog
                                                                        
         #end add-point    
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            NEXT FIELD sfgadocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD sfgbseq
               WHEN "s_detail2"
                  NEXT FIELD sfgcseq
 
            END CASE
         END IF
    
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
         #add-point:input段accept 

         #end add-point    
         ACCEPT DIALOG
        
      ON ACTION cancel      #在dialog button (放棄)
         LET INT_FLAG = TRUE 
         LET g_detail_idx  = 1
         LET g_detail_idx2 = 1
         EXIT DIALOG
 
      ON ACTION close       #在dialog 右上角 (X)
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION exit        #toolbar 離開
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
         
   END DIALOG
   
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
PRIVATE FUNCTION asrt336_set_no_required_b()
   CALL cl_set_comp_required("sfgc005",FALSE)
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
PRIVATE FUNCTION asrt336_set_required_b()
   IF g_sfgb2_d[l_ac].sfgc004 <> '3' THEN
      CALL cl_set_comp_required("sfgc005",TRUE) 
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
PRIVATE FUNCTION asrt336_refresh_stus()
       SELECT DISTINCT sfgastus,sfgaownid,sfgaowndp,sfgacrtid,sfgacrtdp,
                       sfgacrtdt,sfgamodid,sfgamoddt,sfgacnfid,sfgacnfdt,sfgapstid,sfgapstdt
         INTO g_sfga_m.sfgastus,g_sfga_m.sfgaownid,g_sfga_m.sfgaowndp,g_sfga_m.sfgacrtid,g_sfga_m.sfgacrtdp,
              g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid,g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid,g_sfga_m.sfgacnfdt,g_sfga_m.sfgapstid,g_sfga_m.sfgapstdt
         
         FROM sfga_t
        WHERE sfgaent   = g_enterprise
          AND sfgadocno = g_sfga_m.sfgadocno
       
       LET g_sfga_m.sfgaownid_desc = s_desc_get_person_desc(g_sfga_m.sfgaownid)
       LET g_sfga_m.sfgacrtid_desc = s_desc_get_person_desc(g_sfga_m.sfgacrtid)
       LET g_sfga_m.sfgamodid_desc = s_desc_get_person_desc(g_sfga_m.sfgamodid)
       LET g_sfga_m.sfgacnfid_desc = s_desc_get_person_desc(g_sfga_m.sfgacnfid)
       LET g_sfga_m.sfgapstid_desc = s_desc_get_person_desc(g_sfga_m.sfgapstid)
       
       LET g_sfga_m.sfgaowndp_desc = s_desc_get_department_desc(g_sfga_m.sfgaowndp)
       LET g_sfga_m.sfgacrtdp_desc = s_desc_get_department_desc(g_sfga_m.sfgacrtdp)
 
       CASE g_sfga_m.sfgastus
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
       g_sfga_m.sfgastus,g_sfga_m.sfgaownid,
       g_sfga_m.sfgaownid_desc,g_sfga_m.sfgaowndp,g_sfga_m.sfgaowndp_desc,g_sfga_m.sfgacrtid,g_sfga_m.sfgacrtid_desc, 
       g_sfga_m.sfgacrtdp,g_sfga_m.sfgacrtdp_desc,g_sfga_m.sfgacrtdt,g_sfga_m.sfgamodid,g_sfga_m.sfgamodid_desc, 
       g_sfga_m.sfgamoddt,g_sfga_m.sfgacnfid,g_sfga_m.sfgacnfid_desc,g_sfga_m.sfgacnfdt,g_sfga_m.sfgapstid,g_sfga_m.sfgapstid_desc,g_sfga_m.sfgapstdt
END FUNCTION

 
{</section>}
 
