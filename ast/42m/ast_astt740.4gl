#該程式未解開Section, 採用最新樣板產出!
{<section id="astt740.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0010(2016-09-14 17:21:19), PR版次:0010(2016-11-16 16:01:28)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000081
#+ Filename...: astt740
#+ Description: 內部結算單維護作業
#+ Creator....: 03247(2014-11-21 11:03:04)
#+ Modifier...: 08172 -SD/PR- 02481
 
{</section>}
 
{<section id="astt740.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#+ Modifier...:   No.160318-00025#35   2016/04/15 BY pengxin  將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#+ Modifier...:   No.160816-00068#1    2016/08/17 By earl     調整transaction
#160818-00017#40 2016-08-23 By 08734 删除修改未重新判断状态码
#160913-00034#4  2016/09/14 by 08172 q_pmaa001開窗修改
#161024-00025#4   2016/10/24 by 08172   组织调整
#161111-00028#3   2016/11/16 by 02481   标准程式定义采用宣告模式,弃用.*写法
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
PRIVATE type type_g_stdg_m        RECORD
       stdgsite LIKE stdg_t.stdgsite, 
   stdgsite_desc LIKE type_t.chr80, 
   stdgdocdt LIKE stdg_t.stdgdocdt, 
   stdgdocno LIKE stdg_t.stdgdocno, 
   stdg001 LIKE stdg_t.stdg001, 
   stdg001_desc LIKE type_t.chr80, 
   stdg002 LIKE stdg_t.stdg002, 
   stdg002_desc LIKE type_t.chr80, 
   stdg006 LIKE stdg_t.stdg006, 
   stdg006_desc LIKE type_t.chr80, 
   stdg003 LIKE stdg_t.stdg003, 
   stdg004 LIKE stdg_t.stdg004, 
   stdg005 LIKE stdg_t.stdg005, 
   stdg007 LIKE stdg_t.stdg007, 
   stdg007_desc LIKE type_t.chr80, 
   stdgunit LIKE stdg_t.stdgunit, 
   stdgstus LIKE stdg_t.stdgstus, 
   stdgownid LIKE stdg_t.stdgownid, 
   stdgownid_desc LIKE type_t.chr80, 
   stdgowndp LIKE stdg_t.stdgowndp, 
   stdgowndp_desc LIKE type_t.chr80, 
   stdgcrtid LIKE stdg_t.stdgcrtid, 
   stdgcrtid_desc LIKE type_t.chr80, 
   stdgcrtdp LIKE stdg_t.stdgcrtdp, 
   stdgcrtdp_desc LIKE type_t.chr80, 
   stdgcrtdt LIKE stdg_t.stdgcrtdt, 
   stdgmodid LIKE stdg_t.stdgmodid, 
   stdgmodid_desc LIKE type_t.chr80, 
   stdgmoddt LIKE stdg_t.stdgmoddt, 
   stdgcnfid LIKE stdg_t.stdgcnfid, 
   stdgcnfid_desc LIKE type_t.chr80, 
   stdgcnfdt LIKE stdg_t.stdgcnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stdh_d        RECORD
       stdhseq LIKE stdh_t.stdhseq, 
   stdhsite LIKE stdh_t.stdhsite, 
   stdhsite_desc LIKE type_t.chr500, 
   stdh001 LIKE stdh_t.stdh001, 
   stdh002 LIKE stdh_t.stdh002, 
   stdh005 LIKE stdh_t.stdh005, 
   stdh003 LIKE stdh_t.stdh003, 
   stdh004 LIKE stdh_t.stdh004, 
   stdh031 LIKE stdh_t.stdh031, 
   stdh032 LIKE stdh_t.stdh032, 
   stdh006 LIKE stdh_t.stdh006, 
   stdh006_desc LIKE type_t.chr500, 
   stdh006_desc_desc LIKE type_t.chr500, 
   stdh007 LIKE stdh_t.stdh007, 
   stdh007_desc LIKE type_t.chr500, 
   stdh008 LIKE stdh_t.stdh008, 
   stdh008_desc LIKE type_t.chr500, 
   stdh009 LIKE stdh_t.stdh009, 
   stdh009_desc LIKE type_t.chr500, 
   stdh010 LIKE stdh_t.stdh010, 
   stdh011 LIKE stdh_t.stdh011, 
   stdh012 LIKE stdh_t.stdh012, 
   stdh013 LIKE stdh_t.stdh013, 
   stdh014 LIKE stdh_t.stdh014, 
   stdh015 LIKE stdh_t.stdh015, 
   stdh016 LIKE stdh_t.stdh016, 
   stdh016_desc LIKE type_t.chr500, 
   stdh017 LIKE stdh_t.stdh017, 
   stdh017_desc LIKE type_t.chr500, 
   stdh018 LIKE stdh_t.stdh018, 
   stdh018_desc LIKE type_t.chr500, 
   stdh019 LIKE stdh_t.stdh019, 
   stdh020 LIKE stdh_t.stdh020, 
   stdh020_desc LIKE type_t.chr500, 
   stdh021 LIKE stdh_t.stdh021, 
   stdh021_desc LIKE type_t.chr500, 
   stdh022 LIKE stdh_t.stdh022, 
   stdh024 LIKE stdh_t.stdh024, 
   stdh023 LIKE stdh_t.stdh023, 
   stdh025 LIKE stdh_t.stdh025, 
   stdh025_desc LIKE type_t.chr500, 
   stdh026 LIKE stdh_t.stdh026, 
   stdh026_desc LIKE type_t.chr500, 
   stdh027 LIKE stdh_t.stdh027, 
   stdh028 LIKE stdh_t.stdh028, 
   stdh029 LIKE stdh_t.stdh029, 
   stdh030 LIKE stdh_t.stdh030, 
   stdhunit LIKE stdh_t.stdhunit
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stdgsite LIKE stdg_t.stdgsite,
   b_stdgsite_desc LIKE type_t.chr80,
      b_stdgdocdt LIKE stdg_t.stdgdocdt,
      b_stdgdocno LIKE stdg_t.stdgdocno,
      b_stdg001 LIKE stdg_t.stdg001,
   b_stdg001_desc LIKE type_t.chr80,
      b_stdg002 LIKE stdg_t.stdg002,
   b_stdg002_desc LIKE type_t.chr80,
      b_stdg003 LIKE stdg_t.stdg003,
      b_stdg004 LIKE stdg_t.stdg004,
      b_stdg005 LIKE stdg_t.stdg005,
      b_stdg006 LIKE stdg_t.stdg006,
   b_stdg006_desc LIKE type_t.chr80,
      b_stdg007 LIKE stdg_t.stdg007,
   b_stdg007_desc LIKE type_t.chr80
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_site_flag           LIKE type_t.num5
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stdg_m          type_g_stdg_m
DEFINE g_stdg_m_t        type_g_stdg_m
DEFINE g_stdg_m_o        type_g_stdg_m
DEFINE g_stdg_m_mask_o   type_g_stdg_m #轉換遮罩前資料
DEFINE g_stdg_m_mask_n   type_g_stdg_m #轉換遮罩後資料
 
   DEFINE g_stdgdocno_t LIKE stdg_t.stdgdocno
 
 
DEFINE g_stdh_d          DYNAMIC ARRAY OF type_g_stdh_d
DEFINE g_stdh_d_t        type_g_stdh_d
DEFINE g_stdh_d_o        type_g_stdh_d
DEFINE g_stdh_d_mask_o   DYNAMIC ARRAY OF type_g_stdh_d #轉換遮罩前資料
DEFINE g_stdh_d_mask_n   DYNAMIC ARRAY OF type_g_stdh_d #轉換遮罩後資料
 
 
DEFINE g_browser         DYNAMIC ARRAY OF type_browser
DEFINE g_browser_f       DYNAMIC ARRAY OF type_browser
 
 
DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING
 
 
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
 
{<section id="astt740.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE l_success LIKE type_t.num5      #150308-00001#5  By benson 150309
   #end add-point   
   
   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
       
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("ast","")
 
   #add-point:作業初始化 name="main.init"
   
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define name="main.define_sql"
   
   #end add-point
   LET g_forupd_sql = " SELECT stdgsite,'',stdgdocdt,stdgdocno,stdg001,'',stdg002,'',stdg006,'',stdg003, 
       stdg004,stdg005,stdg007,'',stdgunit,stdgstus,stdgownid,'',stdgowndp,'',stdgcrtid,'',stdgcrtdp, 
       '',stdgcrtdt,stdgmodid,'',stdgmoddt,stdgcnfid,'',stdgcnfdt", 
                      " FROM stdg_t",
                      " WHERE stdgent= ? AND stdgdocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt740_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stdgsite,t0.stdgdocdt,t0.stdgdocno,t0.stdg001,t0.stdg002,t0.stdg006, 
       t0.stdg003,t0.stdg004,t0.stdg005,t0.stdg007,t0.stdgunit,t0.stdgstus,t0.stdgownid,t0.stdgowndp, 
       t0.stdgcrtid,t0.stdgcrtdp,t0.stdgcrtdt,t0.stdgmodid,t0.stdgmoddt,t0.stdgcnfid,t0.stdgcnfdt,t1.ooefl003 , 
       t2.ooefl003 ,t3.ooefl003 ,t4.ooag011 ,t5.ooefl003 ,t6.ooag011 ,t7.ooefl003 ,t8.ooag011 ,t9.ooefl003 , 
       t10.ooag011 ,t11.ooag011",
               " FROM stdg_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stdgsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stdg001 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t3 ON t3.ooeflent="||g_enterprise||" AND t3.ooefl001=t0.stdg002 AND t3.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.stdg006  ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=t0.stdg007 AND t5.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.stdgownid  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.stdgowndp AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.stdgcrtid  ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.stdgcrtdp AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.stdgmodid  ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.stdgcnfid  ",
 
               " WHERE t0.stdgent = " ||g_enterprise|| " AND t0.stdgdocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt740_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt740 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt740_init()   
 
      #進入選單 Menu (="N")
      CALL astt740_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt740
      
   END IF 
   
   CLOSE astt740_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success      #150308-00001#5  By benson 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt740.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt740_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5      #150308-00001#5  By benson 150309
   #end add-point   
   
   #add-point:Function前置處理  name="init.pre_function"
   
   #end add-point
   
   LET g_bfill       = "Y"
   LET g_detail_idx  = 1 #第一層單身指標
   LET g_detail_idx2 = 1 #第二層單身指標
   
   #各個page指標
   LET g_detail_idx_list[1] = 1 
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
      CALL cl_set_combo_scc_part('stdgstus','13','N,Y,A,D,R,W,X')
 
      CALL cl_set_combo_scc('stdh001','6082') 
   CALL cl_set_combo_scc('stdh002','6083') 
   CALL cl_set_combo_scc('stdh027','6079') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL s_aooi500_create_temp() RETURNING l_success    #150308-00001#5  By benson 150309
   #end add-point
   
   #初始化搜尋條件
   CALL astt740_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt740.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt740_ui_dialog()
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
            CALL astt740_insert()
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
         INITIALIZE g_stdg_m.* TO NULL
         CALL g_stdh_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt740_init()
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
               
               CALL astt740_fetch('') # reload data
               LET l_ac = 1
               CALL astt740_ui_detailshow() #Setting the current row 
         
               CALL astt740_idx_chk()
               #NEXT FIELD stdhseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stdh_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt740_idx_chk()
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
               CALL astt740_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL astt740_browser_fill("")
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
               CALL astt740_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt740_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt740_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt740_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt740_set_act_visible()   
            CALL astt740_set_act_no_visible()
            IF NOT (g_stdg_m.stdgdocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stdgent = " ||g_enterprise|| " AND",
                                  " stdgdocno = '", g_stdg_m.stdgdocno, "' "
 
               #填到對應位置
               CALL astt740_browser_fill("")
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
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "stdg_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stdh_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  #組合g_wc2
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
 
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
               END IF
               CALL astt740_browser_fill("F")   #browser_fill()會將notice區塊清空
               CALL cl_notice()   #重新顯示,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
            END IF
         
         #查詢方案選擇
         ON ACTION qbe_select
            CALL cl_qbe_list("m") RETURNING ls_wc
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "stdg_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stdh_t" 
                        LET g_wc2_table1 = la_wc[li_idx].wc
 
                     WHEN la_wc[li_idx].tableid = "EXTENDWC"
                        LET g_wc2_extend = la_wc[li_idx].wc
                  END CASE
               END FOR
               IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1)
 
                  OR NOT cl_null(g_wc2_extend)
                  THEN
                  IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
                     LET g_wc2 = g_wc2_table1
                  END IF
 
                  IF g_wc2_extend <> " 1=1" AND NOT cl_null(g_wc2_extend) THEN
                     LET g_wc2 = g_wc2 ," AND ", g_wc2_extend
                  END IF
                  IF g_wc2.subString(1,5) = " AND " THEN
                     LET g_wc2 = g_wc2.subString(6,g_wc2.getLength())
                  END IF
                  #取得條件後需要重查、跳到結果第一筆資料的功能程式段
                  CALL astt740_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt740_fetch("F")
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
               CALL astt740_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt740_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt740_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt740_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt740_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt740_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt740_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt740_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt740_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt740_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt740_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stdh_d)
                  LET g_export_id[1]   = "s_detail1"
 
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
               NEXT FIELD stdhseq
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
               CALL astt740_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt740_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt740_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt740_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt740_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt740_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt740_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt740_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt740_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt740_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt740_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stdg_m.stdgdocdt)
 
 
 
         
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
 
{<section id="astt740.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt740_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_where           STRING
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
   CALL s_aooi500_sql_where(g_prog,'stdgsite') RETURNING l_where
   LET g_wc = g_wc," AND ",l_where
   LET l_wc = g_wc.trim()
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT stdgdocno ",
                      " FROM stdg_t ",
                      " ",
                      " LEFT JOIN stdh_t ON stdhent = stdgent AND stdgdocno = stdhdocno ", "  ",
                      #add-point:browser_fill段sql(stdh_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE stdgent = " ||g_enterprise|| " AND stdhent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stdg_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stdgdocno ",
                      " FROM stdg_t ", 
                      "  ",
                      "  ",
                      " WHERE stdgent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stdg_t")
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
      INITIALIZE g_stdg_m.* TO NULL
      CALL g_stdh_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stdgsite,t0.stdgdocdt,t0.stdgdocno,t0.stdg001,t0.stdg002,t0.stdg003,t0.stdg004,t0.stdg005,t0.stdg006,t0.stdg007 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stdgstus,t0.stdgsite,t0.stdgdocdt,t0.stdgdocno,t0.stdg001,t0.stdg002, 
          t0.stdg003,t0.stdg004,t0.stdg005,t0.stdg006,t0.stdg007,t1.ooefl003 ,t2.ooefl003 ,t3.ooefl003 , 
          t4.ooag011 ,t5.ooefl003 ",
                  " FROM stdg_t t0",
                  "  ",
                  "  LEFT JOIN stdh_t ON stdhent = stdgent AND stdgdocno = stdhdocno ", "  ", 
                  #add-point:browser_fill段sql(stdh_t1) name="browser_fill.join.stdh_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stdgsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stdg001 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t3 ON t3.ooeflent="||g_enterprise||" AND t3.ooefl001=t0.stdg002 AND t3.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.stdg006  ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=t0.stdg007 AND t5.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.stdgent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stdg_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stdgstus,t0.stdgsite,t0.stdgdocdt,t0.stdgdocno,t0.stdg001,t0.stdg002, 
          t0.stdg003,t0.stdg004,t0.stdg005,t0.stdg006,t0.stdg007,t1.ooefl003 ,t2.ooefl003 ,t3.ooefl003 , 
          t4.ooag011 ,t5.ooefl003 ",
                  " FROM stdg_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stdgsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stdg001 AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t3 ON t3.ooeflent="||g_enterprise||" AND t3.ooefl001=t0.stdg002 AND t3.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.stdg006  ",
               " LEFT JOIN ooefl_t t5 ON t5.ooeflent="||g_enterprise||" AND t5.ooefl001=t0.stdg007 AND t5.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.stdgent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stdg_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY stdgdocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stdg_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stdgsite,g_browser[g_cnt].b_stdgdocdt, 
          g_browser[g_cnt].b_stdgdocno,g_browser[g_cnt].b_stdg001,g_browser[g_cnt].b_stdg002,g_browser[g_cnt].b_stdg003, 
          g_browser[g_cnt].b_stdg004,g_browser[g_cnt].b_stdg005,g_browser[g_cnt].b_stdg006,g_browser[g_cnt].b_stdg007, 
          g_browser[g_cnt].b_stdgsite_desc,g_browser[g_cnt].b_stdg001_desc,g_browser[g_cnt].b_stdg002_desc, 
          g_browser[g_cnt].b_stdg006_desc,g_browser[g_cnt].b_stdg007_desc
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
         
         #end add-point
      
         #遮罩相關處理
         CALL astt740_browser_mask()
      
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
   
   IF cl_null(g_browser[g_cnt].b_stdgdocno) THEN
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
 
{<section id="astt740.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt740_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stdg_m.stdgdocno = g_browser[g_current_idx].b_stdgdocno   
 
   EXECUTE astt740_master_referesh USING g_stdg_m.stdgdocno INTO g_stdg_m.stdgsite,g_stdg_m.stdgdocdt, 
       g_stdg_m.stdgdocno,g_stdg_m.stdg001,g_stdg_m.stdg002,g_stdg_m.stdg006,g_stdg_m.stdg003,g_stdg_m.stdg004, 
       g_stdg_m.stdg005,g_stdg_m.stdg007,g_stdg_m.stdgunit,g_stdg_m.stdgstus,g_stdg_m.stdgownid,g_stdg_m.stdgowndp, 
       g_stdg_m.stdgcrtid,g_stdg_m.stdgcrtdp,g_stdg_m.stdgcrtdt,g_stdg_m.stdgmodid,g_stdg_m.stdgmoddt, 
       g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfdt,g_stdg_m.stdgsite_desc,g_stdg_m.stdg001_desc,g_stdg_m.stdg002_desc, 
       g_stdg_m.stdg006_desc,g_stdg_m.stdg007_desc,g_stdg_m.stdgownid_desc,g_stdg_m.stdgowndp_desc,g_stdg_m.stdgcrtid_desc, 
       g_stdg_m.stdgcrtdp_desc,g_stdg_m.stdgmodid_desc,g_stdg_m.stdgcnfid_desc
   
   CALL astt740_stdg_t_mask()
   CALL astt740_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt740.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt740_ui_detailshow()
   #add-point:ui_detailshow段define(客製用) name="ui_detailshow.define_customerization"
   
   #end add-point    
   #add-point:ui_detailshow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_detailshow.define"
   
   #end add-point    
 
   #add-point:Function前置處理 name="ui_detailshow.before"
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
 
   END IF
   
   #add-point:ui_detailshow段after name="ui_detailshow.after"
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astt740.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt740_ui_browser_refresh()
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
      IF g_browser[l_i].b_stdgdocno = g_stdg_m.stdgdocno 
 
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
 
{<section id="astt740.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt740_construct()
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
   INITIALIZE g_stdg_m.* TO NULL
   CALL g_stdh_d.clear()        
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON stdgsite,stdgdocdt,stdgdocno,stdg001,stdg002,stdg006,stdg003,stdg004, 
          stdg005,stdg007,stdgunit,stdgstus,stdgownid,stdgowndp,stdgcrtid,stdgcrtdp,stdgcrtdt,stdgmodid, 
          stdgmoddt,stdgcnfid,stdgcnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stdgcrtdt>>----
         AFTER FIELD stdgcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stdgmoddt>>----
         AFTER FIELD stdgmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stdgcnfdt>>----
         AFTER FIELD stdgcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stdgpstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.stdgsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgsite
            #add-point:ON ACTION controlp INFIELD stdgsite name="construct.c.stdgsite"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            LET g_qryparam.where = " ooef212 = 'Y'"
#            CALL q_ooef001()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stdgsite',g_site,'c')   #150308-00001#5  By benson add 'c'
            
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stdgsite  #顯示到畫面上
            NEXT FIELD stdgsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgsite
            #add-point:BEFORE FIELD stdgsite name="construct.b.stdgsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgsite
            
            #add-point:AFTER FIELD stdgsite name="construct.a.stdgsite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgdocdt
            #add-point:BEFORE FIELD stdgdocdt name="construct.b.stdgdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgdocdt
            
            #add-point:AFTER FIELD stdgdocdt name="construct.a.stdgdocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdgdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgdocdt
            #add-point:ON ACTION controlp INFIELD stdgdocdt name="construct.c.stdgdocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdgdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgdocno
            #add-point:ON ACTION controlp INFIELD stdgdocno name="construct.c.stdgdocno"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stdgdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdgdocno  #顯示到畫面上
            NEXT FIELD stdgdocno                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgdocno
            #add-point:BEFORE FIELD stdgdocno name="construct.b.stdgdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgdocno
            
            #add-point:AFTER FIELD stdgdocno name="construct.a.stdgdocno"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdg001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdg001
            #add-point:ON ACTION controlp INFIELD stdg001 name="construct.c.stdg001"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                           #呼叫開窗
            #161024-00025#4 -e by 08172
            DISPLAY g_qryparam.return1 TO stdg001  #顯示到畫面上
            NEXT FIELD stdg001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdg001
            #add-point:BEFORE FIELD stdg001 name="construct.b.stdg001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdg001
            
            #add-point:AFTER FIELD stdg001 name="construct.a.stdg001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdg002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdg002
            #add-point:ON ACTION controlp INFIELD stdg002 name="construct.c.stdg002"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                           #呼叫開窗
            #161024-00025#4 -e by 08172
            DISPLAY g_qryparam.return1 TO stdg002  #顯示到畫面上
            NEXT FIELD stdg002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdg002
            #add-point:BEFORE FIELD stdg002 name="construct.b.stdg002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdg002
            
            #add-point:AFTER FIELD stdg002 name="construct.a.stdg002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdg006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdg006
            #add-point:ON ACTION controlp INFIELD stdg006 name="construct.c.stdg006"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001_6()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdg006  #顯示到畫面上
            NEXT FIELD stdg006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdg006
            #add-point:BEFORE FIELD stdg006 name="construct.b.stdg006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdg006
            
            #add-point:AFTER FIELD stdg006 name="construct.a.stdg006"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdg003
            #add-point:BEFORE FIELD stdg003 name="construct.b.stdg003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdg003
            
            #add-point:AFTER FIELD stdg003 name="construct.a.stdg003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdg003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdg003
            #add-point:ON ACTION controlp INFIELD stdg003 name="construct.c.stdg003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdg004
            #add-point:BEFORE FIELD stdg004 name="construct.b.stdg004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdg004
            
            #add-point:AFTER FIELD stdg004 name="construct.a.stdg004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdg004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdg004
            #add-point:ON ACTION controlp INFIELD stdg004 name="construct.c.stdg004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdg005
            #add-point:BEFORE FIELD stdg005 name="construct.b.stdg005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdg005
            
            #add-point:AFTER FIELD stdg005 name="construct.a.stdg005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdg005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdg005
            #add-point:ON ACTION controlp INFIELD stdg005 name="construct.c.stdg005"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdg007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdg007
            #add-point:ON ACTION controlp INFIELD stdg007 name="construct.c.stdg007"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdg007  #顯示到畫面上
            NEXT FIELD stdg007                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdg007
            #add-point:BEFORE FIELD stdg007 name="construct.b.stdg007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdg007
            
            #add-point:AFTER FIELD stdg007 name="construct.a.stdg007"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgunit
            #add-point:BEFORE FIELD stdgunit name="construct.b.stdgunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgunit
            
            #add-point:AFTER FIELD stdgunit name="construct.a.stdgunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdgunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgunit
            #add-point:ON ACTION controlp INFIELD stdgunit name="construct.c.stdgunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgstus
            #add-point:BEFORE FIELD stdgstus name="construct.b.stdgstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgstus
            
            #add-point:AFTER FIELD stdgstus name="construct.a.stdgstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdgstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgstus
            #add-point:ON ACTION controlp INFIELD stdgstus name="construct.c.stdgstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdgownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgownid
            #add-point:ON ACTION controlp INFIELD stdgownid name="construct.c.stdgownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdgownid  #顯示到畫面上
            NEXT FIELD stdgownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgownid
            #add-point:BEFORE FIELD stdgownid name="construct.b.stdgownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgownid
            
            #add-point:AFTER FIELD stdgownid name="construct.a.stdgownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdgowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgowndp
            #add-point:ON ACTION controlp INFIELD stdgowndp name="construct.c.stdgowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdgowndp  #顯示到畫面上
            NEXT FIELD stdgowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgowndp
            #add-point:BEFORE FIELD stdgowndp name="construct.b.stdgowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgowndp
            
            #add-point:AFTER FIELD stdgowndp name="construct.a.stdgowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdgcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgcrtid
            #add-point:ON ACTION controlp INFIELD stdgcrtid name="construct.c.stdgcrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdgcrtid  #顯示到畫面上
            NEXT FIELD stdgcrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgcrtid
            #add-point:BEFORE FIELD stdgcrtid name="construct.b.stdgcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgcrtid
            
            #add-point:AFTER FIELD stdgcrtid name="construct.a.stdgcrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdgcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgcrtdp
            #add-point:ON ACTION controlp INFIELD stdgcrtdp name="construct.c.stdgcrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdgcrtdp  #顯示到畫面上
            NEXT FIELD stdgcrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgcrtdp
            #add-point:BEFORE FIELD stdgcrtdp name="construct.b.stdgcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgcrtdp
            
            #add-point:AFTER FIELD stdgcrtdp name="construct.a.stdgcrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgcrtdt
            #add-point:BEFORE FIELD stdgcrtdt name="construct.b.stdgcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdgmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgmodid
            #add-point:ON ACTION controlp INFIELD stdgmodid name="construct.c.stdgmodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdgmodid  #顯示到畫面上
            NEXT FIELD stdgmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgmodid
            #add-point:BEFORE FIELD stdgmodid name="construct.b.stdgmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgmodid
            
            #add-point:AFTER FIELD stdgmodid name="construct.a.stdgmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgmoddt
            #add-point:BEFORE FIELD stdgmoddt name="construct.b.stdgmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdgcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgcnfid
            #add-point:ON ACTION controlp INFIELD stdgcnfid name="construct.c.stdgcnfid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdgcnfid  #顯示到畫面上
            NEXT FIELD stdgcnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgcnfid
            #add-point:BEFORE FIELD stdgcnfid name="construct.b.stdgcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgcnfid
            
            #add-point:AFTER FIELD stdgcnfid name="construct.a.stdgcnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgcnfdt
            #add-point:BEFORE FIELD stdgcnfdt name="construct.b.stdgcnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stdhseq,stdhsite,stdh001,stdh002,stdh005,stdh003,stdh004,stdh031,stdh032, 
          stdh006,stdh007,stdh008,stdh009,stdh009_desc,stdh010,stdh011,stdh012,stdh013,stdh014,stdh015, 
          stdh016,stdh017,stdh018,stdh019,stdh020,stdh021,stdh022,stdh024,stdh023,stdh025,stdh026,stdh027, 
          stdh028,stdh029,stdh030,stdhunit
           FROM s_detail1[1].stdhseq,s_detail1[1].stdhsite,s_detail1[1].stdh001,s_detail1[1].stdh002, 
               s_detail1[1].stdh005,s_detail1[1].stdh003,s_detail1[1].stdh004,s_detail1[1].stdh031,s_detail1[1].stdh032, 
               s_detail1[1].stdh006,s_detail1[1].stdh007,s_detail1[1].stdh008,s_detail1[1].stdh009,s_detail1[1].stdh009_desc, 
               s_detail1[1].stdh010,s_detail1[1].stdh011,s_detail1[1].stdh012,s_detail1[1].stdh013,s_detail1[1].stdh014, 
               s_detail1[1].stdh015,s_detail1[1].stdh016,s_detail1[1].stdh017,s_detail1[1].stdh018,s_detail1[1].stdh019, 
               s_detail1[1].stdh020,s_detail1[1].stdh021,s_detail1[1].stdh022,s_detail1[1].stdh024,s_detail1[1].stdh023, 
               s_detail1[1].stdh025,s_detail1[1].stdh026,s_detail1[1].stdh027,s_detail1[1].stdh028,s_detail1[1].stdh029, 
               s_detail1[1].stdh030,s_detail1[1].stdhunit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdhseq
            #add-point:BEFORE FIELD stdhseq name="construct.b.page1.stdhseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdhseq
            
            #add-point:AFTER FIELD stdhseq name="construct.a.page1.stdhseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdhseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdhseq
            #add-point:ON ACTION controlp INFIELD stdhseq name="construct.c.page1.stdhseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdhsite
            #add-point:BEFORE FIELD stdhsite name="construct.b.page1.stdhsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdhsite
            
            #add-point:AFTER FIELD stdhsite name="construct.a.page1.stdhsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdhsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdhsite
            #add-point:ON ACTION controlp INFIELD stdhsite name="construct.c.page1.stdhsite"
            #161024-00025#4 -s by 08172
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE                         #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stdhsite',g_site,'c') 
            CALL q_ooef001_24() 
            DISPLAY g_qryparam.return1 TO stdhsite  #顯示到畫面上
            NEXT FIELD stdhsite
            #161024-00025#4 -e by 08172
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh001
            #add-point:BEFORE FIELD stdh001 name="construct.b.page1.stdh001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh001
            
            #add-point:AFTER FIELD stdh001 name="construct.a.page1.stdh001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh001
            #add-point:ON ACTION controlp INFIELD stdh001 name="construct.c.page1.stdh001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh002
            #add-point:BEFORE FIELD stdh002 name="construct.b.page1.stdh002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh002
            
            #add-point:AFTER FIELD stdh002 name="construct.a.page1.stdh002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh002
            #add-point:ON ACTION controlp INFIELD stdh002 name="construct.c.page1.stdh002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh005
            #add-point:BEFORE FIELD stdh005 name="construct.b.page1.stdh005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh005
            
            #add-point:AFTER FIELD stdh005 name="construct.a.page1.stdh005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh005
            #add-point:ON ACTION controlp INFIELD stdh005 name="construct.c.page1.stdh005"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stdh003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh003
            #add-point:ON ACTION controlp INFIELD stdh003 name="construct.c.page1.stdh003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stdh003()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdh003  #顯示到畫面上
            NEXT FIELD stdh003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh003
            #add-point:BEFORE FIELD stdh003 name="construct.b.page1.stdh003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh003
            
            #add-point:AFTER FIELD stdh003 name="construct.a.page1.stdh003"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh004
            #add-point:BEFORE FIELD stdh004 name="construct.b.page1.stdh004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh004
            
            #add-point:AFTER FIELD stdh004 name="construct.a.page1.stdh004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh004
            #add-point:ON ACTION controlp INFIELD stdh004 name="construct.c.page1.stdh004"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh031
            #add-point:BEFORE FIELD stdh031 name="construct.b.page1.stdh031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh031
            
            #add-point:AFTER FIELD stdh031 name="construct.a.page1.stdh031"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh031
            #add-point:ON ACTION controlp INFIELD stdh031 name="construct.c.page1.stdh031"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh032
            #add-point:BEFORE FIELD stdh032 name="construct.b.page1.stdh032"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh032
            
            #add-point:AFTER FIELD stdh032 name="construct.a.page1.stdh032"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh032
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh032
            #add-point:ON ACTION controlp INFIELD stdh032 name="construct.c.page1.stdh032"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stdh006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh006
            #add-point:ON ACTION controlp INFIELD stdh006 name="construct.c.page1.stdh006"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_imaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdh006  #顯示到畫面上
            NEXT FIELD stdh006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh006
            #add-point:BEFORE FIELD stdh006 name="construct.b.page1.stdh006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh006
            
            #add-point:AFTER FIELD stdh006 name="construct.a.page1.stdh006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh007
            #add-point:ON ACTION controlp INFIELD stdh007 name="construct.c.page1.stdh007"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdh007  #顯示到畫面上
            NEXT FIELD stdh007                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh007
            #add-point:BEFORE FIELD stdh007 name="construct.b.page1.stdh007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh007
            
            #add-point:AFTER FIELD stdh007 name="construct.a.page1.stdh007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh008
            #add-point:ON ACTION controlp INFIELD stdh008 name="construct.c.page1.stdh008"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooai001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdh008  #顯示到畫面上
            NEXT FIELD stdh008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh008
            #add-point:BEFORE FIELD stdh008 name="construct.b.page1.stdh008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh008
            
            #add-point:AFTER FIELD stdh008 name="construct.a.page1.stdh008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh009
            #add-point:ON ACTION controlp INFIELD stdh009 name="construct.c.page1.stdh009"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdh009  #顯示到畫面上
            NEXT FIELD stdh009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh009
            #add-point:BEFORE FIELD stdh009 name="construct.b.page1.stdh009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh009
            
            #add-point:AFTER FIELD stdh009 name="construct.a.page1.stdh009"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh009_desc
            #add-point:BEFORE FIELD stdh009_desc name="construct.b.page1.stdh009_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh009_desc
            
            #add-point:AFTER FIELD stdh009_desc name="construct.a.page1.stdh009_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh009_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh009_desc
            #add-point:ON ACTION controlp INFIELD stdh009_desc name="construct.c.page1.stdh009_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh010
            #add-point:BEFORE FIELD stdh010 name="construct.b.page1.stdh010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh010
            
            #add-point:AFTER FIELD stdh010 name="construct.a.page1.stdh010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh010
            #add-point:ON ACTION controlp INFIELD stdh010 name="construct.c.page1.stdh010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh011
            #add-point:BEFORE FIELD stdh011 name="construct.b.page1.stdh011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh011
            
            #add-point:AFTER FIELD stdh011 name="construct.a.page1.stdh011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh011
            #add-point:ON ACTION controlp INFIELD stdh011 name="construct.c.page1.stdh011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh012
            #add-point:BEFORE FIELD stdh012 name="construct.b.page1.stdh012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh012
            
            #add-point:AFTER FIELD stdh012 name="construct.a.page1.stdh012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh012
            #add-point:ON ACTION controlp INFIELD stdh012 name="construct.c.page1.stdh012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh013
            #add-point:BEFORE FIELD stdh013 name="construct.b.page1.stdh013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh013
            
            #add-point:AFTER FIELD stdh013 name="construct.a.page1.stdh013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh013
            #add-point:ON ACTION controlp INFIELD stdh013 name="construct.c.page1.stdh013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh014
            #add-point:BEFORE FIELD stdh014 name="construct.b.page1.stdh014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh014
            
            #add-point:AFTER FIELD stdh014 name="construct.a.page1.stdh014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh014
            #add-point:ON ACTION controlp INFIELD stdh014 name="construct.c.page1.stdh014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh015
            #add-point:BEFORE FIELD stdh015 name="construct.b.page1.stdh015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh015
            
            #add-point:AFTER FIELD stdh015 name="construct.a.page1.stdh015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh015
            #add-point:ON ACTION controlp INFIELD stdh015 name="construct.c.page1.stdh015"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stdh016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh016
            #add-point:ON ACTION controlp INFIELD stdh016 name="construct.c.page1.stdh016"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stdh016') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stdh016',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24()
            ELSE
               CALL q_ooef001() 
            END IF
            DISPLAY g_qryparam.return1 TO stdh016  #顯示到畫面上
            NEXT FIELD stdh016                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh016
            #add-point:BEFORE FIELD stdh016 name="construct.b.page1.stdh016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh016
            
            #add-point:AFTER FIELD stdh016 name="construct.a.page1.stdh016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh017
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh017
            #add-point:ON ACTION controlp INFIELD stdh017 name="construct.c.page1.stdh017"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                           #呼叫開窗
            #161024-00025#4 -e by 08172
            DISPLAY g_qryparam.return1 TO stdh017  #顯示到畫面上
            NEXT FIELD stdh017                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh017
            #add-point:BEFORE FIELD stdh017 name="construct.b.page1.stdh017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh017
            
            #add-point:AFTER FIELD stdh017 name="construct.a.page1.stdh017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh018
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh018
            #add-point:ON ACTION controlp INFIELD stdh018 name="construct.c.page1.stdh018"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001_8()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdh018  #顯示到畫面上
            NEXT FIELD stdh018                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh018
            #add-point:BEFORE FIELD stdh018 name="construct.b.page1.stdh018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh018
            
            #add-point:AFTER FIELD stdh018 name="construct.a.page1.stdh018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh019
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh019
            #add-point:ON ACTION controlp INFIELD stdh019 name="construct.c.page1.stdh019"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #160913-00034#4 -s by 08172
            LET g_qryparam.arg1 = "('3')"
            CALL q_pmaa001_1()
#            CALL q_pmaa001()                           #呼叫開窗
            #160913-00034#4 -e by 08172
            DISPLAY g_qryparam.return1 TO stdh019  #顯示到畫面上
            NEXT FIELD stdh019                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh019
            #add-point:BEFORE FIELD stdh019 name="construct.b.page1.stdh019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh019
            
            #add-point:AFTER FIELD stdh019 name="construct.a.page1.stdh019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh020
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh020
            #add-point:ON ACTION controlp INFIELD stdh020 name="construct.c.page1.stdh020"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stdh020') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stdh020',g_site,'c')   #150308-00001#5  By benson add 'c'
               CALL q_ooef001_24()
            ELSE
               CALL q_ooef001()
            END IF
            DISPLAY g_qryparam.return1 TO stdh020  #顯示到畫面上
            NEXT FIELD stdh020                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh020
            #add-point:BEFORE FIELD stdh020 name="construct.b.page1.stdh020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh020
            
            #add-point:AFTER FIELD stdh020 name="construct.a.page1.stdh020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh021
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh021
            #add-point:ON ACTION controlp INFIELD stdh021 name="construct.c.page1.stdh021"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                           #呼叫開窗
            #161024-00025#4 -e by 08172
            DISPLAY g_qryparam.return1 TO stdh021  #顯示到畫面上
            NEXT FIELD stdh021                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh021
            #add-point:BEFORE FIELD stdh021 name="construct.b.page1.stdh021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh021
            
            #add-point:AFTER FIELD stdh021 name="construct.a.page1.stdh021"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh022
            #add-point:BEFORE FIELD stdh022 name="construct.b.page1.stdh022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh022
            
            #add-point:AFTER FIELD stdh022 name="construct.a.page1.stdh022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh022
            #add-point:ON ACTION controlp INFIELD stdh022 name="construct.c.page1.stdh022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh024
            #add-point:BEFORE FIELD stdh024 name="construct.b.page1.stdh024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh024
            
            #add-point:AFTER FIELD stdh024 name="construct.a.page1.stdh024"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh024
            #add-point:ON ACTION controlp INFIELD stdh024 name="construct.c.page1.stdh024"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh023
            #add-point:BEFORE FIELD stdh023 name="construct.b.page1.stdh023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh023
            
            #add-point:AFTER FIELD stdh023 name="construct.a.page1.stdh023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh023
            #add-point:ON ACTION controlp INFIELD stdh023 name="construct.c.page1.stdh023"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stdh025
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh025
            #add-point:ON ACTION controlp INFIELD stdh025 name="construct.c.page1.stdh025"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stdh025') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stdh025',g_site,'c')   #150308-00001#5  By benson add 'c'           
               CALL q_ooef001_24()
            ELSE
               CALL q_ooef001()
            END IF
            DISPLAY g_qryparam.return1 TO stdh025  #顯示到畫面上
            NEXT FIELD stdh025                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh025
            #add-point:BEFORE FIELD stdh025 name="construct.b.page1.stdh025"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh025
            
            #add-point:AFTER FIELD stdh025 name="construct.a.page1.stdh025"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh026
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh026
            #add-point:ON ACTION controlp INFIELD stdh026 name="construct.c.page1.stdh026"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                           #呼叫開窗
            #161024-00025#4 -e by 08172
            DISPLAY g_qryparam.return1 TO stdh026  #顯示到畫面上
            NEXT FIELD stdh026                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh026
            #add-point:BEFORE FIELD stdh026 name="construct.b.page1.stdh026"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh026
            
            #add-point:AFTER FIELD stdh026 name="construct.a.page1.stdh026"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh027
            #add-point:BEFORE FIELD stdh027 name="construct.b.page1.stdh027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh027
            
            #add-point:AFTER FIELD stdh027 name="construct.a.page1.stdh027"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh027
            #add-point:ON ACTION controlp INFIELD stdh027 name="construct.c.page1.stdh027"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh028
            #add-point:BEFORE FIELD stdh028 name="construct.b.page1.stdh028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh028
            
            #add-point:AFTER FIELD stdh028 name="construct.a.page1.stdh028"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh028
            #add-point:ON ACTION controlp INFIELD stdh028 name="construct.c.page1.stdh028"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh029
            #add-point:BEFORE FIELD stdh029 name="construct.b.page1.stdh029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh029
            
            #add-point:AFTER FIELD stdh029 name="construct.a.page1.stdh029"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh029
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh029
            #add-point:ON ACTION controlp INFIELD stdh029 name="construct.c.page1.stdh029"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh030
            #add-point:BEFORE FIELD stdh030 name="construct.b.page1.stdh030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh030
            
            #add-point:AFTER FIELD stdh030 name="construct.a.page1.stdh030"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdh030
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh030
            #add-point:ON ACTION controlp INFIELD stdh030 name="construct.c.page1.stdh030"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdhunit
            #add-point:BEFORE FIELD stdhunit name="construct.b.page1.stdhunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdhunit
            
            #add-point:AFTER FIELD stdhunit name="construct.a.page1.stdhunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdhunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdhunit
            #add-point:ON ACTION controlp INFIELD stdhunit name="construct.c.page1.stdhunit"
            
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
 
            FOR li_idx = 1 TO la_wc.getLength()
               CASE
                  WHEN la_wc[li_idx].tableid = "stdg_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stdh_t" 
                     LET g_wc2_table1 = la_wc[li_idx].wc
 
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
 
 
 
   
   #add-point:cs段結束前 name="cs.after_construct"
   
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt740.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt740_filter()
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
      CONSTRUCT g_wc_filter ON stdgsite,stdgdocdt,stdgdocno,stdg001,stdg002,stdg003,stdg004,stdg005, 
          stdg006,stdg007
                          FROM s_browse[1].b_stdgsite,s_browse[1].b_stdgdocdt,s_browse[1].b_stdgdocno, 
                              s_browse[1].b_stdg001,s_browse[1].b_stdg002,s_browse[1].b_stdg003,s_browse[1].b_stdg004, 
                              s_browse[1].b_stdg005,s_browse[1].b_stdg006,s_browse[1].b_stdg007
 
         BEFORE CONSTRUCT
               DISPLAY astt740_filter_parser('stdgsite') TO s_browse[1].b_stdgsite
            DISPLAY astt740_filter_parser('stdgdocdt') TO s_browse[1].b_stdgdocdt
            DISPLAY astt740_filter_parser('stdgdocno') TO s_browse[1].b_stdgdocno
            DISPLAY astt740_filter_parser('stdg001') TO s_browse[1].b_stdg001
            DISPLAY astt740_filter_parser('stdg002') TO s_browse[1].b_stdg002
            DISPLAY astt740_filter_parser('stdg003') TO s_browse[1].b_stdg003
            DISPLAY astt740_filter_parser('stdg004') TO s_browse[1].b_stdg004
            DISPLAY astt740_filter_parser('stdg005') TO s_browse[1].b_stdg005
            DISPLAY astt740_filter_parser('stdg006') TO s_browse[1].b_stdg006
            DISPLAY astt740_filter_parser('stdg007') TO s_browse[1].b_stdg007
      
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
 
      CALL astt740_filter_show('stdgsite')
   CALL astt740_filter_show('stdgdocdt')
   CALL astt740_filter_show('stdgdocno')
   CALL astt740_filter_show('stdg001')
   CALL astt740_filter_show('stdg002')
   CALL astt740_filter_show('stdg003')
   CALL astt740_filter_show('stdg004')
   CALL astt740_filter_show('stdg005')
   CALL astt740_filter_show('stdg006')
   CALL astt740_filter_show('stdg007')
 
END FUNCTION
 
{</section>}
 
{<section id="astt740.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt740_filter_parser(ps_field)
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
 
{<section id="astt740.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt740_filter_show(ps_field)
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
   LET ls_condition = astt740_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt740.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt740_query()
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
   CALL g_stdh_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt740_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt740_browser_fill("")
      CALL astt740_fetch("")
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
 
   LET g_error_show  = 1
   LET g_wc_filter   = ""
   LET l_ac = 1
   CALL FGL_SET_ARR_CURR(1)
      CALL astt740_filter_show('stdgsite')
   CALL astt740_filter_show('stdgdocdt')
   CALL astt740_filter_show('stdgdocno')
   CALL astt740_filter_show('stdg001')
   CALL astt740_filter_show('stdg002')
   CALL astt740_filter_show('stdg003')
   CALL astt740_filter_show('stdg004')
   CALL astt740_filter_show('stdg005')
   CALL astt740_filter_show('stdg006')
   CALL astt740_filter_show('stdg007')
   CALL astt740_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt740_fetch("F") 
      #顯示單身筆數
      CALL astt740_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt740.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt740_fetch(p_flag)
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
   
   LET g_stdg_m.stdgdocno = g_browser[g_current_idx].b_stdgdocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt740_master_referesh USING g_stdg_m.stdgdocno INTO g_stdg_m.stdgsite,g_stdg_m.stdgdocdt, 
       g_stdg_m.stdgdocno,g_stdg_m.stdg001,g_stdg_m.stdg002,g_stdg_m.stdg006,g_stdg_m.stdg003,g_stdg_m.stdg004, 
       g_stdg_m.stdg005,g_stdg_m.stdg007,g_stdg_m.stdgunit,g_stdg_m.stdgstus,g_stdg_m.stdgownid,g_stdg_m.stdgowndp, 
       g_stdg_m.stdgcrtid,g_stdg_m.stdgcrtdp,g_stdg_m.stdgcrtdt,g_stdg_m.stdgmodid,g_stdg_m.stdgmoddt, 
       g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfdt,g_stdg_m.stdgsite_desc,g_stdg_m.stdg001_desc,g_stdg_m.stdg002_desc, 
       g_stdg_m.stdg006_desc,g_stdg_m.stdg007_desc,g_stdg_m.stdgownid_desc,g_stdg_m.stdgowndp_desc,g_stdg_m.stdgcrtid_desc, 
       g_stdg_m.stdgcrtdp_desc,g_stdg_m.stdgmodid_desc,g_stdg_m.stdgcnfid_desc
   
   #遮罩相關處理
   LET g_stdg_m_mask_o.* =  g_stdg_m.*
   CALL astt740_stdg_t_mask()
   LET g_stdg_m_mask_n.* =  g_stdg_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt740_set_act_visible()   
   CALL astt740_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   #mark 151111 ---s---
   #IF g_stdg_m.stdgstus = 'N' THEN
   #   CALL cl_set_act_visible("modify,delete,modify_detail",TRUE)
   #ELSE
   #   CALL cl_set_act_visible("modify,delete,modify_detail",FALSE)
   #END IF
   #mark 151111 ---e---
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stdg_m_t.* = g_stdg_m.*
   LET g_stdg_m_o.* = g_stdg_m.*
   
   LET g_data_owner = g_stdg_m.stdgownid      
   LET g_data_dept  = g_stdg_m.stdgowndp
   
   #重新顯示   
   CALL astt740_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt740.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt740_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_n      LIKE type_t.num5
   DEFINE l_insert LIKE type_t.num5
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_doctype     LIKE rtai_t.rtai004
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stdh_d.clear()   
 
 
   INITIALIZE g_stdg_m.* TO NULL             #DEFAULT 設定
   
   LET g_stdgdocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stdg_m.stdgownid = g_user
      LET g_stdg_m.stdgowndp = g_dept
      LET g_stdg_m.stdgcrtid = g_user
      LET g_stdg_m.stdgcrtdp = g_dept 
      LET g_stdg_m.stdgcrtdt = cl_get_current()
      LET g_stdg_m.stdgmodid = g_user
      LET g_stdg_m.stdgmoddt = cl_get_current()
      LET g_stdg_m.stdgstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
      
  
      #add-point:單頭預設值 name="insert.default"
      #結算中心
#      SELECT COUNT(*) INTO l_n
#        FROM ooef_t
#       WHERE ooefent = g_enterprise
#         AND ooef001 = g_site
#         AND ooef212 = 'Y'
#         AND ooefstus = 'Y'
#      IF l_n > 0 THEN
#         LET g_stdg_m.stdgsite = g_site
#         INITIALIZE g_ref_fields TO NULL
#         LET g_ref_fields[1] = g_stdg_m.stdgsite
#         CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
#         LET g_stdg_m.stdgsite_desc = '', g_rtn_fields[1] , ''
#         DISPLAY BY NAME g_stdg_m.stdgsite_desc
#      END IF
      LET g_site_flag = FALSE
      CALL s_aooi500_default(g_prog,'stdgsite',g_stdg_m.stdgsite)
         RETURNING l_insert,g_stdg_m.stdgsite
      IF NOT l_insert THEN
         RETURN
      END IF
      #aooi500没有设置，判断site是否为结算组织
      LET l_n = 0
      SELECT COUNT(*) INTO l_n
        FROM ooez_t
       WHERE ooezent = g_enterprise
         AND ooez001 = g_prog
         AND ooez002 = '1'
      IF l_n < 1 THEN
         LET g_stdg_m.stdgsite = ''
         SELECT COUNT(*) INTO l_n
           FROM ooef_t
          WHERE ooefent = g_enterprise
            AND ooef001 = g_site
            AND ooef212 = 'Y'
            AND ooefstus = 'Y'
         IF l_n > 0 THEN
            LET g_stdg_m.stdgsite = g_site
         ELSE
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "" 
            LET g_errparam.replace[1] = g_site
            LET g_errparam.code   = 'ast-00212' 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            RETURN
         END IF
      END IF
      LET g_stdg_m.stdgunit = g_stdg_m.stdgsite
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stdg_m.stdgsite
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stdg_m.stdgsite_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stdg_m.stdgsite_desc
      
      LET g_stdg_m.stdgdocdt = g_today
      #dongsz--add--str---
      #預設單據的單別
      LET r_success = ''
      LET r_doctype = ''
      CALL s_arti200_get_def_doc_type(g_stdg_m.stdgsite,g_prog,'1')
           RETURNING r_success,r_doctype
      LET g_stdg_m.stdgdocno = r_doctype
      #dongsz--add--end---
      LET g_stdg_m.stdg006 = g_user
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stdg_m.stdg006
      CALL ap_ref_array2(g_ref_fields,"SELECT oofa011 FROM oofa_t WHERE oofaent='"||g_enterprise||"' AND oofa002='2' AND oofa003=?","") RETURNING g_rtn_fields
      LET g_stdg_m.stdg006_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_stdg_m.stdg006_desc
      
      #結算會計期
      IF NOT cl_null(g_stdg_m.stdgsite) THEN
         SELECT stau004 INTO g_stdg_m.stdg003
           FROM stau_t
          WHERE stauent = g_enterprise
            AND stausite = g_stdg_m.stdgsite
            AND stau001 = g_prog
      END IF
         
      LET g_stdg_m_t.* = g_stdg_m.*
      LET g_stdg_m_o.* = g_stdg_m.*
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stdg_m_t.* = g_stdg_m.*
      LET g_stdg_m_o.* = g_stdg_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stdg_m.stdgstus 
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
    
      CALL astt740_input("a")
      
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
         INITIALIZE g_stdg_m.* TO NULL
         INITIALIZE g_stdh_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt740_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stdh_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt740_set_act_visible()   
   CALL astt740_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stdgdocno_t = g_stdg_m.stdgdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stdgent = " ||g_enterprise|| " AND",
                      " stdgdocno = '", g_stdg_m.stdgdocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt740_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt740_cl
   
   CALL astt740_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt740_master_referesh USING g_stdg_m.stdgdocno INTO g_stdg_m.stdgsite,g_stdg_m.stdgdocdt, 
       g_stdg_m.stdgdocno,g_stdg_m.stdg001,g_stdg_m.stdg002,g_stdg_m.stdg006,g_stdg_m.stdg003,g_stdg_m.stdg004, 
       g_stdg_m.stdg005,g_stdg_m.stdg007,g_stdg_m.stdgunit,g_stdg_m.stdgstus,g_stdg_m.stdgownid,g_stdg_m.stdgowndp, 
       g_stdg_m.stdgcrtid,g_stdg_m.stdgcrtdp,g_stdg_m.stdgcrtdt,g_stdg_m.stdgmodid,g_stdg_m.stdgmoddt, 
       g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfdt,g_stdg_m.stdgsite_desc,g_stdg_m.stdg001_desc,g_stdg_m.stdg002_desc, 
       g_stdg_m.stdg006_desc,g_stdg_m.stdg007_desc,g_stdg_m.stdgownid_desc,g_stdg_m.stdgowndp_desc,g_stdg_m.stdgcrtid_desc, 
       g_stdg_m.stdgcrtdp_desc,g_stdg_m.stdgmodid_desc,g_stdg_m.stdgcnfid_desc
   
   
   #遮罩相關處理
   LET g_stdg_m_mask_o.* =  g_stdg_m.*
   CALL astt740_stdg_t_mask()
   LET g_stdg_m_mask_n.* =  g_stdg_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stdg_m.stdgsite,g_stdg_m.stdgsite_desc,g_stdg_m.stdgdocdt,g_stdg_m.stdgdocno,g_stdg_m.stdg001, 
       g_stdg_m.stdg001_desc,g_stdg_m.stdg002,g_stdg_m.stdg002_desc,g_stdg_m.stdg006,g_stdg_m.stdg006_desc, 
       g_stdg_m.stdg003,g_stdg_m.stdg004,g_stdg_m.stdg005,g_stdg_m.stdg007,g_stdg_m.stdg007_desc,g_stdg_m.stdgunit, 
       g_stdg_m.stdgstus,g_stdg_m.stdgownid,g_stdg_m.stdgownid_desc,g_stdg_m.stdgowndp,g_stdg_m.stdgowndp_desc, 
       g_stdg_m.stdgcrtid,g_stdg_m.stdgcrtid_desc,g_stdg_m.stdgcrtdp,g_stdg_m.stdgcrtdp_desc,g_stdg_m.stdgcrtdt, 
       g_stdg_m.stdgmodid,g_stdg_m.stdgmodid_desc,g_stdg_m.stdgmoddt,g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfid_desc, 
       g_stdg_m.stdgcnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stdg_m.stdgownid      
   LET g_data_dept  = g_stdg_m.stdgowndp
   
   #功能已完成,通報訊息中心
   CALL astt740_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt740.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt740_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point    
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING
 
 
   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stdg_m_t.* = g_stdg_m.*
   LET g_stdg_m_o.* = g_stdg_m.*
   
   IF g_stdg_m.stdgdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stdgdocno_t = g_stdg_m.stdgdocno
 
   CALL s_transaction_begin()
   
   OPEN astt740_cl USING g_enterprise,g_stdg_m.stdgdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt740_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt740_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt740_master_referesh USING g_stdg_m.stdgdocno INTO g_stdg_m.stdgsite,g_stdg_m.stdgdocdt, 
       g_stdg_m.stdgdocno,g_stdg_m.stdg001,g_stdg_m.stdg002,g_stdg_m.stdg006,g_stdg_m.stdg003,g_stdg_m.stdg004, 
       g_stdg_m.stdg005,g_stdg_m.stdg007,g_stdg_m.stdgunit,g_stdg_m.stdgstus,g_stdg_m.stdgownid,g_stdg_m.stdgowndp, 
       g_stdg_m.stdgcrtid,g_stdg_m.stdgcrtdp,g_stdg_m.stdgcrtdt,g_stdg_m.stdgmodid,g_stdg_m.stdgmoddt, 
       g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfdt,g_stdg_m.stdgsite_desc,g_stdg_m.stdg001_desc,g_stdg_m.stdg002_desc, 
       g_stdg_m.stdg006_desc,g_stdg_m.stdg007_desc,g_stdg_m.stdgownid_desc,g_stdg_m.stdgowndp_desc,g_stdg_m.stdgcrtid_desc, 
       g_stdg_m.stdgcrtdp_desc,g_stdg_m.stdgmodid_desc,g_stdg_m.stdgcnfid_desc
   
   #檢查是否允許此動作
   IF NOT astt740_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stdg_m_mask_o.* =  g_stdg_m.*
   CALL astt740_stdg_t_mask()
   LET g_stdg_m_mask_n.* =  g_stdg_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL astt740_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_stdgdocno_t = g_stdg_m.stdgdocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stdg_m.stdgmodid = g_user 
LET g_stdg_m.stdgmoddt = cl_get_current()
LET g_stdg_m.stdgmodid_desc = cl_get_username(g_stdg_m.stdgmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_stdg_m.stdgstus MATCHES "[DR]" THEN
         LET g_stdg_m.stdgstus = "N"
      END IF
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt740_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stdg_t SET (stdgmodid,stdgmoddt) = (g_stdg_m.stdgmodid,g_stdg_m.stdgmoddt)
          WHERE stdgent = g_enterprise AND stdgdocno = g_stdgdocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stdg_m.* = g_stdg_m_t.*
            CALL astt740_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stdg_m.stdgdocno != g_stdg_m_t.stdgdocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stdh_t SET stdhdocno = g_stdg_m.stdgdocno
 
          WHERE stdhent = g_enterprise AND stdhdocno = g_stdg_m_t.stdgdocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stdh_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stdh_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CONTINUE WHILE
         END CASE
         
         #add-point:單身fk修改後 name="modify.body.a_fk_update"
         
         #end add-point
         
 
         
 
         
         #UPDATE 多語言table key值
         
 
         CALL s_transaction_end('Y','0')
      END IF
    
      EXIT WHILE
   END WHILE
 
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt740_set_act_visible()   
   CALL astt740_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stdgent = " ||g_enterprise|| " AND",
                      " stdgdocno = '", g_stdg_m.stdgdocno, "' "
 
   #填到對應位置
   CALL astt740_browser_fill("")
 
   CLOSE astt740_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt740_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt740.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt740_input(p_cmd)
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
   DEFINE l_ooef004              LIKE ooef_t.ooef004
   DEFINE l_success              LIKE type_t.num5
   DEFINE l_stdg003              STRING
   DEFINE l_len                  LIKE type_t.num5
   DEFINE l_str                  LIKE type_t.chr1
   DEFINE l_year                 LIKE type_t.num5
   DEFINE l_month                LIKE type_t.num5
   DEFINE l_glav001              LIKE glav_t.glav001
   DEFINE l_glav002              LIKE glav_t.glav002
   DEFINE l_glav003              LIKE glav_t.glav003
   DEFINE l_flag                 LIKE type_t.chr1
   DEFINE l_errno                LIKE type_t.chr100
   DEFINE l_glav005              LIKE glav_t.glav005
   DEFINE l_sdate_s              LIKE glav_t.glav004
   DEFINE l_sdate_e              LIKE glav_t.glav004
   DEFINE l_glav006              LIKE glav_t.glav006
   DEFINE l_pdate_s              LIKE glav_t.glav004
   DEFINE l_pdate_e              LIKE glav_t.glav004
   DEFINE l_glav007              LIKE glav_t.glav007
   DEFINE l_wdate_s              LIKE glav_t.glav004
   DEFINE l_wdate_e              LIKE glav_t.glav004
   DEFINE l_stdg001              LIKE stdg_t.stdg001
   DEFINE l_ooef017              LIKE ooef_t.ooef017
   DEFINE l_glaa003              LIKE glaa_t.glaa003
   DEFINE l_pmaa002             LIKE pmaa_t.pmaa002  #160913-00034#4 by 08172
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
   DISPLAY BY NAME g_stdg_m.stdgsite,g_stdg_m.stdgsite_desc,g_stdg_m.stdgdocdt,g_stdg_m.stdgdocno,g_stdg_m.stdg001, 
       g_stdg_m.stdg001_desc,g_stdg_m.stdg002,g_stdg_m.stdg002_desc,g_stdg_m.stdg006,g_stdg_m.stdg006_desc, 
       g_stdg_m.stdg003,g_stdg_m.stdg004,g_stdg_m.stdg005,g_stdg_m.stdg007,g_stdg_m.stdg007_desc,g_stdg_m.stdgunit, 
       g_stdg_m.stdgstus,g_stdg_m.stdgownid,g_stdg_m.stdgownid_desc,g_stdg_m.stdgowndp,g_stdg_m.stdgowndp_desc, 
       g_stdg_m.stdgcrtid,g_stdg_m.stdgcrtid_desc,g_stdg_m.stdgcrtdp,g_stdg_m.stdgcrtdp_desc,g_stdg_m.stdgcrtdt, 
       g_stdg_m.stdgmodid,g_stdg_m.stdgmodid_desc,g_stdg_m.stdgmoddt,g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfid_desc, 
       g_stdg_m.stdgcnfdt
   
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
   LET g_forupd_sql = "SELECT stdhseq,stdhsite,stdh001,stdh002,stdh005,stdh003,stdh004,stdh031,stdh032, 
       stdh006,stdh007,stdh008,stdh009,stdh010,stdh011,stdh012,stdh013,stdh014,stdh015,stdh016,stdh017, 
       stdh018,stdh019,stdh020,stdh021,stdh022,stdh024,stdh023,stdh025,stdh026,stdh027,stdh028,stdh029, 
       stdh030,stdhunit FROM stdh_t WHERE stdhent=? AND stdhdocno=? AND stdhseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt740_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt740_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt740_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stdg_m.stdgsite,g_stdg_m.stdgdocdt,g_stdg_m.stdgdocno,g_stdg_m.stdg001,g_stdg_m.stdg002, 
       g_stdg_m.stdg006,g_stdg_m.stdg003,g_stdg_m.stdg004,g_stdg_m.stdg005,g_stdg_m.stdg007,g_stdg_m.stdgunit, 
       g_stdg_m.stdgstus
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt740.input.head" >}
      #單頭段
      INPUT BY NAME g_stdg_m.stdgsite,g_stdg_m.stdgdocdt,g_stdg_m.stdgdocno,g_stdg_m.stdg001,g_stdg_m.stdg002, 
          g_stdg_m.stdg006,g_stdg_m.stdg003,g_stdg_m.stdg004,g_stdg_m.stdg005,g_stdg_m.stdg007,g_stdg_m.stdgunit, 
          g_stdg_m.stdgstus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt740_cl USING g_enterprise,g_stdg_m.stdgdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt740_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt740_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt740_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL astt740_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgsite
            
            #add-point:AFTER FIELD stdgsite name="input.a.stdgsite"
            IF NOT cl_null(g_stdg_m.stdgsite) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
#               INITIALIZE g_chkparam.* TO NULL
#               
#               #設定g_chkparam.*的參數
#               LET g_chkparam.arg1 = g_stdg_m.stdgsite
#               
#               #呼叫檢查存在並帶值的library
#               IF cl_chk_exist("v_ooef001_31") THEN
#                  #檢查成功時後續處理
#                  #LET  = g_chkparam.return1
#                  #DISPLAY BY NAME 
#
#               ELSE
#                  #檢查失敗時後續處理
#                  LET g_stdg_m.stdgsite = g_stdg_m_t.stdgsite
#                  LET g_stdg_m.stdgsite_desc = ""
#                  DISPLAY BY NAME g_stdg_m.stdgsite,g_stdg_m.stdgsite_desc
#                  NEXT FIELD CURRENT
#               END IF
               CALL s_aooi500_chk(g_prog,'stdgsite',g_stdg_m.stdgsite,g_stdg_m.stdgsite)
                  RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_stdg_m.stdgsite
                  LET g_errparam.code   = l_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()

                  LET g_stdg_m.stdgsite = g_stdg_m_t.stdgsite
                  LET g_stdg_m.stdgsite_desc = ""
                  DISPLAY BY NAME g_stdg_m.stdgsite,g_stdg_m.stdgsite_desc
                  NEXT FIELD stdgsite
               END IF
               
               IF NOT cl_null(g_stdg_m.stdg001) AND NOT cl_null(g_stdg_m.stdg002) THEN
                  IF NOT astt740_chk_stdg001() THEN
                     LET g_stdg_m.stdgsite = g_stdg_m_t.stdgsite
                     DISPLAY BY NAME g_stdg_m.stdgsite
                     NEXT FIELD stdgsite
                  END IF
               END IF
               
               LET g_site_flag = TRUE
               CALL astt740_set_entry(p_cmd)
               CALL astt740_set_no_entry(p_cmd)
        
            END IF
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdg_m.stdgsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdg_m.stdgsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdg_m.stdgsite_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgsite
            #add-point:BEFORE FIELD stdgsite name="input.b.stdgsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdgsite
            #add-point:ON CHANGE stdgsite name="input.g.stdgsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgdocdt
            #add-point:BEFORE FIELD stdgdocdt name="input.b.stdgdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgdocdt
            
            #add-point:AFTER FIELD stdgdocdt name="input.a.stdgdocdt"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdgdocdt
            #add-point:ON CHANGE stdgdocdt name="input.g.stdgdocdt"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgdocno
            
            #add-point:AFTER FIELD stdgdocno name="input.a.stdgdocno"
            #此段落由子樣板a05產生
            #確認資料無重複
            IF  NOT cl_null(g_stdg_m.stdgdocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stdg_m.stdgdocno != g_stdgdocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stdg_t WHERE "||"stdgent = '" ||g_enterprise|| "' AND "||"stdgdocno = '"||g_stdg_m.stdgdocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF

            IF NOT cl_null(g_stdg_m.stdgdocno) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               CALL s_aooi100_sel_ooef004(g_stdg_m.stdgsite)
                    RETURNING l_success,l_ooef004
               LET g_chkparam.arg1 = l_ooef004
               LET g_chkparam.arg2 = g_stdg_m.stdgdocno
               
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooba002") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 

               ELSE
                  #檢查失敗時後續處理
                  LET g_stdg_m.stdgdocno = g_stdg_m_t.stdgdocno
                  DISPLAY BY NAME g_stdg_m.stdgdocno
                  NEXT FIELD CURRENT
               END IF
            END IF

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgdocno
            #add-point:BEFORE FIELD stdgdocno name="input.b.stdgdocno"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdgdocno
            #add-point:ON CHANGE stdgdocno name="input.g.stdgdocno"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdg001
            
            #add-point:AFTER FIELD stdg001 name="input.a.stdg001"
            IF NOT cl_null(g_stdg_m.stdg001) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stdg_m.stdg001
               
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooef001_1") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 

               ELSE
                  #檢查失敗時後續處理
                  LET g_stdg_m.stdg001 = g_stdg_m_t.stdg001
                  LET g_stdg_m.stdg001_desc = ""
                  DISPLAY BY NAME g_stdg_m.stdg001,g_stdg_m.stdg001_desc
                  NEXT FIELD CURRENT
               END IF
               
               IF NOT cl_null(g_stdg_m.stdg002) THEN
                  IF NOT astt740_chk_stdg001() THEN
                     LET g_stdg_m.stdg001 = g_stdg_m_t.stdg001
                     LET g_stdg_m.stdg001_desc = ""
                     DISPLAY BY NAME g_stdg_m.stdg001,g_stdg_m.stdg001_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
               IF NOT cl_null(g_stdg_m.stdg002) AND NOT cl_null(g_stdg_m.stdg003) THEN
                  IF NOT astt740_chk_stdg003() THEN
                     LET g_stdg_m.stdg001 = g_stdg_m_t.stdg001
                     LET g_stdg_m.stdg001_desc = ""
                     DISPLAY BY NAME g_stdg_m.stdg001,g_stdg_m.stdg001_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdg_m.stdg001
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdg_m.stdg001_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdg_m.stdg001_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdg001
            #add-point:BEFORE FIELD stdg001 name="input.b.stdg001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdg001
            #add-point:ON CHANGE stdg001 name="input.g.stdg001"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdg002
            
            #add-point:AFTER FIELD stdg002 name="input.a.stdg002"
            IF NOT cl_null(g_stdg_m.stdg002) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stdg_m.stdg002
               
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooef001_1") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 

               ELSE
                  #檢查失敗時後續處理
                  LET g_stdg_m.stdg002 = g_stdg_m_t.stdg002
                  LET g_stdg_m.stdg002_desc = ""
                  DISPLAY BY NAME g_stdg_m.stdg002,g_stdg_m.stdg002_desc
                  NEXT FIELD CURRENT
               END IF
               
               IF NOT cl_null(g_stdg_m.stdg001) THEN
                  IF NOT astt740_chk_stdg001() THEN
                     LET g_stdg_m.stdg002 = g_stdg_m_t.stdg002
                     LET g_stdg_m.stdg002_desc = ""
                     DISPLAY BY NAME g_stdg_m.stdg002,g_stdg_m.stdg002_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
               IF NOT cl_null(g_stdg_m.stdg001) AND NOT cl_null(g_stdg_m.stdg003) THEN
                  IF NOT astt740_chk_stdg003() THEN
                     LET g_stdg_m.stdg002 = g_stdg_m_t.stdg002
                     LET g_stdg_m.stdg002_desc = ""
                     DISPLAY BY NAME g_stdg_m.stdg002,g_stdg_m.stdg002_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdg_m.stdg002
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdg_m.stdg002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdg_m.stdg002_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdg002
            #add-point:BEFORE FIELD stdg002 name="input.b.stdg002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdg002
            #add-point:ON CHANGE stdg002 name="input.g.stdg002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdg006
            
            #add-point:AFTER FIELD stdg006 name="input.a.stdg006"
            IF NOT cl_null(g_stdg_m.stdg006) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stdg_m.stdg006
               #160318-00025#35  2016/05/15  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "aim-00070:sub-01302|aooi130|",cl_get_progname("aooi130",g_lang,"2"),"|:EXEPROGaooi130"
               #160318-00025#35  2016/05/15  by pengxin  add(E)
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooag001") THEN
                  #檢查成功時後續處理
                  #LET  = g_chkparam.return1
                  #DISPLAY BY NAME 

               ELSE
                  #檢查失敗時後續處理
                  LET g_stdg_m.stdg006 = g_stdg_m_t.stdg006
                  LET g_stdg_m.stdg006_desc = ""
                  DISPLAY BY NAME g_stdg_m.stdg006,g_stdg_m.stdg006_desc
                  NEXT FIELD CURRENT
               END IF
            END IF
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdg_m.stdg006
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stdg_m.stdg006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdg_m.stdg006_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdg_m.stdg006
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag003 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stdg_m.stdg007 = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdg_m.stdg007

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdg006
            #add-point:BEFORE FIELD stdg006 name="input.b.stdg006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdg006
            #add-point:ON CHANGE stdg006 name="input.g.stdg006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdg003
            #add-point:BEFORE FIELD stdg003 name="input.b.stdg003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdg003
            
            #add-point:AFTER FIELD stdg003 name="input.a.stdg003"
            IF NOT cl_null(g_stdg_m.stdg003) THEN
               LET l_stdg003 = g_stdg_m.stdg003
               LET l_len = l_stdg003.getLength()
               IF l_len <> 6 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00098'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_stdg_m.stdg003 = g_stdg_m_t.stdg003
                  DISPLAY BY NAME g_stdg_m.stdg003
                  NEXT FIELD stdg003
               END IF
               FOR l_n=1 TO l_len
                  LET l_str = l_stdg003.subString(l_n,l_n)
                  IF l_str NOT MATCHES '[0123456789]' THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00098'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_stdg_m.stdg003 = g_stdg_m_t.stdg003
                     DISPLAY BY NAME g_stdg_m.stdg003
                     NEXT FIELD stdg003
                     EXIT FOR
                  END IF
               END FOR
               LET l_month = l_stdg003.subString(5,6) USING '<<'
               IF cl_null(l_month) OR l_month < 1 OR l_month > 12 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00098'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_stdg_m.stdg003 = g_stdg_m_t.stdg003
                  DISPLAY BY NAME g_stdg_m.stdg003
                  NEXT FIELD stdg003
               END IF
               
               IF NOT cl_null(g_stdg_m.stdg001) AND NOT cl_null(g_stdg_m.stdg002) THEN
                  IF NOT astt740_chk_stdg003() THEN
                     LET g_stdg_m.stdg003 = g_stdg_m_t.stdg003
                     DISPLAY BY NAME g_stdg_m.stdg003
                     NEXT FIELD CURRENT
                  END IF
               END IF
               
               #帶出起訖日期
               LET l_year = l_stdg003.subString(1,4)
               LET l_month = l_stdg003.subString(5,6) USING '<<'
               #LET l_glav001 = 'KA01'
               #抓取法人對應會計週期參照表
               LET l_ooef017 = NULL
               LET l_glaa003 = NULL
               SELECT ooef017 INTO l_ooef017
                 FROM ooef_t
                WHERE ooefent = g_enterprise
                  AND ooef001 = g_stdg_m.stdgsite
               SELECT glaa003 INTO l_glaa003
                 FROM glaa_t
                WHERE glaaent = g_enterprise
                  AND glaacomp = l_ooef017
                  AND glaa014 = 'Y'
               IF cl_null(l_glaa003) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "ast-00183"
                  LET g_errparam.popup = TRUE
                  LET g_errparam.replace[1] = g_stdg_m.stdgsite
                  CALL cl_err()
                  LET g_stdg_m.stdg003 = g_stdg_m_t.stdg003
                  DISPLAY BY NAME g_stdg_m.stdg003
                  NEXT FIELD CURRENT
               END IF
               #取得會計週期資料
               CALL s_get_accdate(l_glaa003,'',l_year,l_month)
                  RETURNING l_flag,l_errno,l_glav002,l_glav005,l_sdate_s,l_sdate_e,
                            l_glav006,l_pdate_s,l_pdate_e,l_glav007,l_wdate_s,l_wdate_e
               IF l_flag = 'Y' THEN
                  LET g_stdg_m.stdg004 = l_pdate_s
                  LET g_stdg_m.stdg005 = l_pdate_e
                  DISPLAY BY NAME g_stdg_m.stdg004,g_stdg_m.stdg005
               ELSE
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_stdg_m.stdgsite
                  LET g_errparam.code = l_errno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_stdg_m.stdg003 = g_stdg_m_t.stdg003
                  DISPLAY BY NAME g_stdg_m.stdg003
                  NEXT FIELD CURRENT
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdg003
            #add-point:ON CHANGE stdg003 name="input.g.stdg003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdg004
            #add-point:BEFORE FIELD stdg004 name="input.b.stdg004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdg004
            
            #add-point:AFTER FIELD stdg004 name="input.a.stdg004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdg004
            #add-point:ON CHANGE stdg004 name="input.g.stdg004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdg005
            #add-point:BEFORE FIELD stdg005 name="input.b.stdg005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdg005
            
            #add-point:AFTER FIELD stdg005 name="input.a.stdg005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdg005
            #add-point:ON CHANGE stdg005 name="input.g.stdg005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdg007
            
            #add-point:AFTER FIELD stdg007 name="input.a.stdg007"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdg_m.stdg007
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdg_m.stdg007_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdg_m.stdg007_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdg007
            #add-point:BEFORE FIELD stdg007 name="input.b.stdg007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdg007
            #add-point:ON CHANGE stdg007 name="input.g.stdg007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgunit
            #add-point:BEFORE FIELD stdgunit name="input.b.stdgunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgunit
            
            #add-point:AFTER FIELD stdgunit name="input.a.stdgunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdgunit
            #add-point:ON CHANGE stdgunit name="input.g.stdgunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdgstus
            #add-point:BEFORE FIELD stdgstus name="input.b.stdgstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdgstus
            
            #add-point:AFTER FIELD stdgstus name="input.a.stdgstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdgstus
            #add-point:ON CHANGE stdgstus name="input.g.stdgstus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stdgsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgsite
            #add-point:ON ACTION controlp INFIELD stdgsite name="input.c.stdgsite"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdg_m.stdgsite             #給予default值
            LET g_qryparam.default2 = g_stdg_m.stdgsite_desc #說明(簡稱)
            #給予arg
#            LET g_qryparam.where = " ooef212 = 'Y'"
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stdgsite',g_stdg_m.stdgsite,'i')   #150308-00001#5  By benson add 'i'
            
            CALL q_ooef001_24()
#            CALL q_ooef001()                                #呼叫開窗

            LET g_stdg_m.stdgsite = g_qryparam.return1              
#            LET g_stdg_m.stdgsite_desc = g_qryparam.return2 
            DISPLAY g_stdg_m.stdgsite TO stdgsite              #
            CALL s_desc_get_department_desc(g_stdg_m.stdgsite) RETURNING g_stdg_m.stdgsite_desc
            DISPLAY g_stdg_m.stdgsite_desc TO stdgsite_desc  #說明(簡稱)
            NEXT FIELD stdgsite                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdgdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgdocdt
            #add-point:ON ACTION controlp INFIELD stdgdocdt name="input.c.stdgdocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdgdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgdocno
            #add-point:ON ACTION controlp INFIELD stdgdocno name="input.c.stdgdocno"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdg_m.stdgdocno             #給予default值

            #給予arg
            #給予arg
            CALL s_aooi100_sel_ooef004(g_stdg_m.stdgsite)
               RETURNING l_success,l_ooef004
            LET g_qryparam.arg1 = l_ooef004 #
            LET g_qryparam.arg2 = g_prog #
            
            CALL q_ooba002_1()                                #呼叫開窗

            LET g_stdg_m.stdgdocno = g_qryparam.return1              

            DISPLAY g_stdg_m.stdgdocno TO stdgdocno              #

            NEXT FIELD stdgdocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdg001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdg001
            #add-point:ON ACTION controlp INFIELD stdg001 name="input.c.stdg001"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdg_m.stdg001             #給予default值
            LET g_qryparam.default2 = g_stdg_m.stdg001_desc #說明(簡稱)
            #給予arg
            LET g_qryparam.arg1 = "" #

            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                                #呼叫開窗
            #161024-00025#4 -e by 08172
            LET g_stdg_m.stdg001 = g_qryparam.return1              
            LET g_stdg_m.stdg001_desc = g_qryparam.return2 
            DISPLAY g_stdg_m.stdg001 TO stdg001              #
            DISPLAY g_stdg_m.stdg001_desc TO stdg001_desc #說明(簡稱)
            NEXT FIELD stdg001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdg002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdg002
            #add-point:ON ACTION controlp INFIELD stdg002 name="input.c.stdg002"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdg_m.stdg002             #給予default值
            LET g_qryparam.default2 = g_stdg_m.stdg002_desc #說明(簡稱)
            #給予arg
            LET g_qryparam.arg1 = "" #

            #161024-00025#4 -s by 08172
            LET g_qryparam.where = " ooef003='Y'"
            CALL q_ooef001_24()
#            CALL q_ooef001_2()                                #呼叫開窗
            #161024-00025#4 -e by 08172
            LET g_stdg_m.stdg002 = g_qryparam.return1              
            LET g_stdg_m.stdg002_desc = g_qryparam.return2 
            DISPLAY g_stdg_m.stdg002 TO stdg002              #
            DISPLAY g_stdg_m.stdg002_desc TO stdg002_desc #說明(簡稱)
            NEXT FIELD stdg002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdg006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdg006
            #add-point:ON ACTION controlp INFIELD stdg006 name="input.c.stdg006"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdg_m.stdg006             #給予default值
            LET g_qryparam.default2 = g_stdg_m.stdg006_desc #歸屬部門
            LET g_qryparam.default3 = "" #g_stdg_m.oofa011 #全名
            LET g_qryparam.default4 = "" #g_stdg_m.ooefl003 #說明(簡稱)
            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooag001_6()                                #呼叫開窗

            LET g_stdg_m.stdg006 = g_qryparam.return1              
            LET g_stdg_m.stdg006_desc = g_qryparam.return2 
            #LET g_stdg_m.oofa011 = g_qryparam.return3 
            #LET g_stdg_m.ooefl003 = g_qryparam.return4 
            DISPLAY g_stdg_m.stdg006 TO stdg006              #
            DISPLAY g_stdg_m.stdg006_desc TO stdg006_desc #歸屬部門
            #DISPLAY g_stdg_m.oofa011 TO oofa011 #全名
            #DISPLAY g_stdg_m.ooefl003 TO ooefl003 #說明(簡稱)
            NEXT FIELD stdg006                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdg003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdg003
            #add-point:ON ACTION controlp INFIELD stdg003 name="input.c.stdg003"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdg004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdg004
            #add-point:ON ACTION controlp INFIELD stdg004 name="input.c.stdg004"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdg005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdg005
            #add-point:ON ACTION controlp INFIELD stdg005 name="input.c.stdg005"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdg007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdg007
            #add-point:ON ACTION controlp INFIELD stdg007 name="input.c.stdg007"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdg_m.stdg007             #給予default值
            LET g_qryparam.default2 = "" #g_stdg_m.ooeg001 #部門編號
            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooeg001()                                #呼叫開窗

            LET g_stdg_m.stdg007 = g_qryparam.return1              
            #LET g_stdg_m.ooeg001 = g_qryparam.return2 
            DISPLAY g_stdg_m.stdg007 TO stdg007              #
            #DISPLAY g_stdg_m.ooeg001 TO ooeg001 #部門編號
            NEXT FIELD stdg007                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdgunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgunit
            #add-point:ON ACTION controlp INFIELD stdgunit name="input.c.stdgunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdgstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdgstus
            #add-point:ON ACTION controlp INFIELD stdgstus name="input.c.stdgstus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stdg_m.stdgdocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_stdg_m.stdgsite,g_stdg_m.stdgdocno,g_stdg_m.stdgdocdt,g_prog)
                  RETURNING l_flag,g_stdg_m.stdgdocno
               IF NOT l_flag THEN
                  NEXT FIELD stdgdocno
               END IF
               #end add-point
               
               INSERT INTO stdg_t (stdgent,stdgsite,stdgdocdt,stdgdocno,stdg001,stdg002,stdg006,stdg003, 
                   stdg004,stdg005,stdg007,stdgunit,stdgstus,stdgownid,stdgowndp,stdgcrtid,stdgcrtdp, 
                   stdgcrtdt,stdgmodid,stdgmoddt,stdgcnfid,stdgcnfdt)
               VALUES (g_enterprise,g_stdg_m.stdgsite,g_stdg_m.stdgdocdt,g_stdg_m.stdgdocno,g_stdg_m.stdg001, 
                   g_stdg_m.stdg002,g_stdg_m.stdg006,g_stdg_m.stdg003,g_stdg_m.stdg004,g_stdg_m.stdg005, 
                   g_stdg_m.stdg007,g_stdg_m.stdgunit,g_stdg_m.stdgstus,g_stdg_m.stdgownid,g_stdg_m.stdgowndp, 
                   g_stdg_m.stdgcrtid,g_stdg_m.stdgcrtdp,g_stdg_m.stdgcrtdt,g_stdg_m.stdgmodid,g_stdg_m.stdgmoddt, 
                   g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stdg_m:",SQLERRMESSAGE 
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
                  CALL astt740_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt740_b_fill()
                  CALL astt740_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               CALL s_transaction_begin()
               CALL s_ins_stdh(g_stdg_m.stdgdocno,g_stdg_m.stdgsite,g_stdg_m.stdg001,g_stdg_m.stdg002,g_stdg_m.stdg003,g_stdg_m.stdg004,g_stdg_m.stdg005) 
                  RETURNING l_flag
               IF NOT l_flag THEN
                  CALL s_transaction_end('N','0') 
                  CONTINUE DIALOG
               END IF
               CALL s_transaction_end('Y','0') 
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astt740_b_fill()
               END IF
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL astt740_stdg_t_mask_restore('restore_mask_o')
               
               UPDATE stdg_t SET (stdgsite,stdgdocdt,stdgdocno,stdg001,stdg002,stdg006,stdg003,stdg004, 
                   stdg005,stdg007,stdgunit,stdgstus,stdgownid,stdgowndp,stdgcrtid,stdgcrtdp,stdgcrtdt, 
                   stdgmodid,stdgmoddt,stdgcnfid,stdgcnfdt) = (g_stdg_m.stdgsite,g_stdg_m.stdgdocdt, 
                   g_stdg_m.stdgdocno,g_stdg_m.stdg001,g_stdg_m.stdg002,g_stdg_m.stdg006,g_stdg_m.stdg003, 
                   g_stdg_m.stdg004,g_stdg_m.stdg005,g_stdg_m.stdg007,g_stdg_m.stdgunit,g_stdg_m.stdgstus, 
                   g_stdg_m.stdgownid,g_stdg_m.stdgowndp,g_stdg_m.stdgcrtid,g_stdg_m.stdgcrtdp,g_stdg_m.stdgcrtdt, 
                   g_stdg_m.stdgmodid,g_stdg_m.stdgmoddt,g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfdt)
                WHERE stdgent = g_enterprise AND stdgdocno = g_stdgdocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stdg_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               #修改单头不重新产生单身
               #mark by geza 20151225(S) 
#               CALL s_ins_stdh(g_stdg_m.stdgdocno,g_stdg_m.stdgsite,g_stdg_m.stdg001,g_stdg_m.stdg002,g_stdg_m.stdg003,g_stdg_m.stdg004,g_stdg_m.stdg005) 
#                  RETURNING l_flag
#               IF NOT l_flag THEN
#                  CALL s_transaction_end('N','0') 
#                  CONTINUE DIALOG
#               END IF
               #mark by geza 20151225(E) 
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt740_stdg_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stdg_m_t)
               LET g_log2 = util.JSON.stringify(g_stdg_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stdgdocno_t = g_stdg_m.stdgdocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt740.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stdh_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = FALSE, 
                  DELETE ROW = FALSE,
                  APPEND ROW = FALSE)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stdh_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt740_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stdh_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            EXIT DIALOG
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
            OPEN astt740_cl USING g_enterprise,g_stdg_m.stdgdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt740_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt740_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stdh_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stdh_d[l_ac].stdhseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stdh_d_t.* = g_stdh_d[l_ac].*  #BACKUP
               LET g_stdh_d_o.* = g_stdh_d[l_ac].*  #BACKUP
               CALL astt740_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt740_set_no_entry_b(l_cmd)
               IF NOT astt740_lock_b("stdh_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt740_bcl INTO g_stdh_d[l_ac].stdhseq,g_stdh_d[l_ac].stdhsite,g_stdh_d[l_ac].stdh001, 
                      g_stdh_d[l_ac].stdh002,g_stdh_d[l_ac].stdh005,g_stdh_d[l_ac].stdh003,g_stdh_d[l_ac].stdh004, 
                      g_stdh_d[l_ac].stdh031,g_stdh_d[l_ac].stdh032,g_stdh_d[l_ac].stdh006,g_stdh_d[l_ac].stdh007, 
                      g_stdh_d[l_ac].stdh008,g_stdh_d[l_ac].stdh009,g_stdh_d[l_ac].stdh010,g_stdh_d[l_ac].stdh011, 
                      g_stdh_d[l_ac].stdh012,g_stdh_d[l_ac].stdh013,g_stdh_d[l_ac].stdh014,g_stdh_d[l_ac].stdh015, 
                      g_stdh_d[l_ac].stdh016,g_stdh_d[l_ac].stdh017,g_stdh_d[l_ac].stdh018,g_stdh_d[l_ac].stdh019, 
                      g_stdh_d[l_ac].stdh020,g_stdh_d[l_ac].stdh021,g_stdh_d[l_ac].stdh022,g_stdh_d[l_ac].stdh024, 
                      g_stdh_d[l_ac].stdh023,g_stdh_d[l_ac].stdh025,g_stdh_d[l_ac].stdh026,g_stdh_d[l_ac].stdh027, 
                      g_stdh_d[l_ac].stdh028,g_stdh_d[l_ac].stdh029,g_stdh_d[l_ac].stdh030,g_stdh_d[l_ac].stdhunit 
 
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stdh_d_t.stdhseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stdh_d_mask_o[l_ac].* =  g_stdh_d[l_ac].*
                  CALL astt740_stdh_t_mask()
                  LET g_stdh_d_mask_n[l_ac].* =  g_stdh_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt740_show()
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
            INITIALIZE g_stdh_d[l_ac].* TO NULL 
            INITIALIZE g_stdh_d_t.* TO NULL 
            INITIALIZE g_stdh_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stdh_d[l_ac].stdh031 = "0"
      LET g_stdh_d[l_ac].stdh032 = "0"
      LET g_stdh_d[l_ac].stdh011 = "0"
      LET g_stdh_d[l_ac].stdh012 = "0"
      LET g_stdh_d[l_ac].stdh013 = "0"
      LET g_stdh_d[l_ac].stdh014 = "0"
      LET g_stdh_d[l_ac].stdh015 = "0"
      LET g_stdh_d[l_ac].stdh028 = "0"
      LET g_stdh_d[l_ac].stdh029 = "0"
      LET g_stdh_d[l_ac].stdh030 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_stdh_d_t.* = g_stdh_d[l_ac].*     #新輸入資料
            LET g_stdh_d_o.* = g_stdh_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt740_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt740_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stdh_d[li_reproduce_target].* = g_stdh_d[li_reproduce].*
 
               LET g_stdh_d[li_reproduce_target].stdhseq = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
            
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
            SELECT COUNT(1) INTO l_count FROM stdh_t 
             WHERE stdhent = g_enterprise AND stdhdocno = g_stdg_m.stdgdocno
 
               AND stdhseq = g_stdh_d[l_ac].stdhseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stdg_m.stdgdocno
               LET gs_keys[2] = g_stdh_d[g_detail_idx].stdhseq
               CALL astt740_insert_b('stdh_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stdh_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stdh_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt740_b_fill()
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
               LET gs_keys[01] = g_stdg_m.stdgdocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stdh_d_t.stdhseq
 
            
               #刪除同層單身
               IF NOT astt740_delete_b('stdh_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt740_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt740_key_delete_b(gs_keys,'stdh_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt740_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt740_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stdh_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stdh_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdhseq
            #add-point:BEFORE FIELD stdhseq name="input.b.page1.stdhseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdhseq
            
            #add-point:AFTER FIELD stdhseq name="input.a.page1.stdhseq"
            #此段落由子樣板a05產生
            #確認資料無重複
            IF  g_stdg_m.stdgdocno IS NOT NULL AND g_stdh_d[g_detail_idx].stdhseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stdg_m.stdgdocno != g_stdgdocno_t OR g_stdh_d[g_detail_idx].stdhseq != g_stdh_d_t.stdhseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stdh_t WHERE "||"stdhent = '" ||g_enterprise|| "' AND "||"stdhdocno = '"||g_stdg_m.stdgdocno ||"' AND "|| "stdhseq = '"||g_stdh_d[g_detail_idx].stdhseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdhseq
            #add-point:ON CHANGE stdhseq name="input.g.page1.stdhseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdhsite
            
            #add-point:AFTER FIELD stdhsite name="input.a.page1.stdhsite"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdh_d[l_ac].stdhsite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdh_d[l_ac].stdhsite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdh_d[l_ac].stdhsite_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdhsite
            #add-point:BEFORE FIELD stdhsite name="input.b.page1.stdhsite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdhsite
            #add-point:ON CHANGE stdhsite name="input.g.page1.stdhsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh001
            #add-point:BEFORE FIELD stdh001 name="input.b.page1.stdh001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh001
            
            #add-point:AFTER FIELD stdh001 name="input.a.page1.stdh001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh001
            #add-point:ON CHANGE stdh001 name="input.g.page1.stdh001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh002
            #add-point:BEFORE FIELD stdh002 name="input.b.page1.stdh002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh002
            
            #add-point:AFTER FIELD stdh002 name="input.a.page1.stdh002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh002
            #add-point:ON CHANGE stdh002 name="input.g.page1.stdh002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh005
            #add-point:BEFORE FIELD stdh005 name="input.b.page1.stdh005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh005
            
            #add-point:AFTER FIELD stdh005 name="input.a.page1.stdh005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh005
            #add-point:ON CHANGE stdh005 name="input.g.page1.stdh005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh003
            #add-point:BEFORE FIELD stdh003 name="input.b.page1.stdh003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh003
            
            #add-point:AFTER FIELD stdh003 name="input.a.page1.stdh003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh003
            #add-point:ON CHANGE stdh003 name="input.g.page1.stdh003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh004
            #add-point:BEFORE FIELD stdh004 name="input.b.page1.stdh004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh004
            
            #add-point:AFTER FIELD stdh004 name="input.a.page1.stdh004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh004
            #add-point:ON CHANGE stdh004 name="input.g.page1.stdh004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh031
            #add-point:BEFORE FIELD stdh031 name="input.b.page1.stdh031"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh031
            
            #add-point:AFTER FIELD stdh031 name="input.a.page1.stdh031"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh031
            #add-point:ON CHANGE stdh031 name="input.g.page1.stdh031"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh032
            #add-point:BEFORE FIELD stdh032 name="input.b.page1.stdh032"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh032
            
            #add-point:AFTER FIELD stdh032 name="input.a.page1.stdh032"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh032
            #add-point:ON CHANGE stdh032 name="input.g.page1.stdh032"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh006
            
            #add-point:AFTER FIELD stdh006 name="input.a.page1.stdh006"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdh_d[l_ac].stdh006
            CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdh_d[l_ac].stdh006_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdh_d[l_ac].stdh006_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh006
            #add-point:BEFORE FIELD stdh006 name="input.b.page1.stdh006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh006
            #add-point:ON CHANGE stdh006 name="input.g.page1.stdh006"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh007
            
            #add-point:AFTER FIELD stdh007 name="input.a.page1.stdh007"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdh_d[l_ac].stdh007
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdh_d[l_ac].stdh007_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdh_d[l_ac].stdh007_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh007
            #add-point:BEFORE FIELD stdh007 name="input.b.page1.stdh007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh007
            #add-point:ON CHANGE stdh007 name="input.g.page1.stdh007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh008
            
            #add-point:AFTER FIELD stdh008 name="input.a.page1.stdh008"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdh_d[l_ac].stdh008
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdh_d[l_ac].stdh008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdh_d[l_ac].stdh008_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh008
            #add-point:BEFORE FIELD stdh008 name="input.b.page1.stdh008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh008
            #add-point:ON CHANGE stdh008 name="input.g.page1.stdh008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh009
            
            #add-point:AFTER FIELD stdh009 name="input.a.page1.stdh009"


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh009
            #add-point:BEFORE FIELD stdh009 name="input.b.page1.stdh009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh009
            #add-point:ON CHANGE stdh009 name="input.g.page1.stdh009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh009_desc
            #add-point:BEFORE FIELD stdh009_desc name="input.b.page1.stdh009_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh009_desc
            
            #add-point:AFTER FIELD stdh009_desc name="input.a.page1.stdh009_desc"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh009_desc
            #add-point:ON CHANGE stdh009_desc name="input.g.page1.stdh009_desc"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh010
            #add-point:BEFORE FIELD stdh010 name="input.b.page1.stdh010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh010
            
            #add-point:AFTER FIELD stdh010 name="input.a.page1.stdh010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh010
            #add-point:ON CHANGE stdh010 name="input.g.page1.stdh010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh011
            #add-point:BEFORE FIELD stdh011 name="input.b.page1.stdh011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh011
            
            #add-point:AFTER FIELD stdh011 name="input.a.page1.stdh011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh011
            #add-point:ON CHANGE stdh011 name="input.g.page1.stdh011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh012
            #add-point:BEFORE FIELD stdh012 name="input.b.page1.stdh012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh012
            
            #add-point:AFTER FIELD stdh012 name="input.a.page1.stdh012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh012
            #add-point:ON CHANGE stdh012 name="input.g.page1.stdh012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh013
            #add-point:BEFORE FIELD stdh013 name="input.b.page1.stdh013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh013
            
            #add-point:AFTER FIELD stdh013 name="input.a.page1.stdh013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh013
            #add-point:ON CHANGE stdh013 name="input.g.page1.stdh013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh014
            #add-point:BEFORE FIELD stdh014 name="input.b.page1.stdh014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh014
            
            #add-point:AFTER FIELD stdh014 name="input.a.page1.stdh014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh014
            #add-point:ON CHANGE stdh014 name="input.g.page1.stdh014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh015
            #add-point:BEFORE FIELD stdh015 name="input.b.page1.stdh015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh015
            
            #add-point:AFTER FIELD stdh015 name="input.a.page1.stdh015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh015
            #add-point:ON CHANGE stdh015 name="input.g.page1.stdh015"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh016
            
            #add-point:AFTER FIELD stdh016 name="input.a.page1.stdh016"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdh_d[l_ac].stdh016
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdh_d[l_ac].stdh016_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdh_d[l_ac].stdh016_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh016
            #add-point:BEFORE FIELD stdh016 name="input.b.page1.stdh016"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh016
            #add-point:ON CHANGE stdh016 name="input.g.page1.stdh016"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh017
            
            #add-point:AFTER FIELD stdh017 name="input.a.page1.stdh017"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdh_d[l_ac].stdh017
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdh_d[l_ac].stdh017_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdh_d[l_ac].stdh017_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh017
            #add-point:BEFORE FIELD stdh017 name="input.b.page1.stdh017"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh017
            #add-point:ON CHANGE stdh017 name="input.g.page1.stdh017"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh018
            
            #add-point:AFTER FIELD stdh018 name="input.a.page1.stdh018"
#            INITIALIZE g_ref_fields TO NULL
#            LET g_ref_fields[1] = g_stdh_d[l_ac].stdhsite
#            LET g_ref_fields[2] = g_stdh_d[l_ac].stdh018
#            CALL ap_ref_array2(g_ref_fields,"SELECT inaa002 FROM inaa_t WHERE inaaent='"||g_enterprise||"' AND inaasite=? AND inaa001=? ","") RETURNING g_rtn_fields
#            LET g_stdh_d[l_ac].stdh018_desc = '', g_rtn_fields[1] , ''
#            DISPLAY BY NAME g_stdh_d[l_ac].stdh018_desc
            CALL s_desc_get_stock_desc(g_stdh_d[l_ac].stdhsite,g_stdh_d[l_ac].stdh018) RETURNING g_stdh_d[l_ac].stdh018_desc
            DISPLAY BY NAME g_stdh_d[l_ac].stdh018_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh018
            #add-point:BEFORE FIELD stdh018 name="input.b.page1.stdh018"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh018
            #add-point:ON CHANGE stdh018 name="input.g.page1.stdh018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh019
            #add-point:BEFORE FIELD stdh019 name="input.b.page1.stdh019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh019
            
            #add-point:AFTER FIELD stdh019 name="input.a.page1.stdh019"
            #160913-00034#4 -s by 08172
            IF NOT cl_null(g_stdh_d[l_ac].stdh019) THEN
               SELECT pmaa002 INTO l_pmaa002
                 FROM pmaa_t
                WHERE pmaaent = g_enterprise
                  AND pmaa001 = g_stdh_d[l_ac].stdh019
                  AND pmaastus = 'Y'
               IF l_pmaa002 = '1' OR l_pmaa002 = '2' THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = "apm-01100"
                  LET g_errparam.extend = g_stdh_d[l_ac].stdh019
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
            #160913-00034#4 -e by 08172
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh019
            #add-point:ON CHANGE stdh019 name="input.g.page1.stdh019"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh020
            
            #add-point:AFTER FIELD stdh020 name="input.a.page1.stdh020"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdh_d[l_ac].stdh020
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdh_d[l_ac].stdh020_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdh_d[l_ac].stdh020_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh020
            #add-point:BEFORE FIELD stdh020 name="input.b.page1.stdh020"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh020
            #add-point:ON CHANGE stdh020 name="input.g.page1.stdh020"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh021
            
            #add-point:AFTER FIELD stdh021 name="input.a.page1.stdh021"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdh_d[l_ac].stdh021
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdh_d[l_ac].stdh021_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdh_d[l_ac].stdh021_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh021
            #add-point:BEFORE FIELD stdh021 name="input.b.page1.stdh021"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh021
            #add-point:ON CHANGE stdh021 name="input.g.page1.stdh021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh022
            #add-point:BEFORE FIELD stdh022 name="input.b.page1.stdh022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh022
            
            #add-point:AFTER FIELD stdh022 name="input.a.page1.stdh022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh022
            #add-point:ON CHANGE stdh022 name="input.g.page1.stdh022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh024
            #add-point:BEFORE FIELD stdh024 name="input.b.page1.stdh024"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh024
            
            #add-point:AFTER FIELD stdh024 name="input.a.page1.stdh024"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh024
            #add-point:ON CHANGE stdh024 name="input.g.page1.stdh024"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh023
            #add-point:BEFORE FIELD stdh023 name="input.b.page1.stdh023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh023
            
            #add-point:AFTER FIELD stdh023 name="input.a.page1.stdh023"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh023
            #add-point:ON CHANGE stdh023 name="input.g.page1.stdh023"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh025
            
            #add-point:AFTER FIELD stdh025 name="input.a.page1.stdh025"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdh_d[l_ac].stdh025
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdh_d[l_ac].stdh025_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdh_d[l_ac].stdh025_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh025
            #add-point:BEFORE FIELD stdh025 name="input.b.page1.stdh025"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh025
            #add-point:ON CHANGE stdh025 name="input.g.page1.stdh025"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh026
            
            #add-point:AFTER FIELD stdh026 name="input.a.page1.stdh026"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdh_d[l_ac].stdh026
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdh_d[l_ac].stdh026_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdh_d[l_ac].stdh026_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh026
            #add-point:BEFORE FIELD stdh026 name="input.b.page1.stdh026"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh026
            #add-point:ON CHANGE stdh026 name="input.g.page1.stdh026"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh027
            #add-point:BEFORE FIELD stdh027 name="input.b.page1.stdh027"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh027
            
            #add-point:AFTER FIELD stdh027 name="input.a.page1.stdh027"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh027
            #add-point:ON CHANGE stdh027 name="input.g.page1.stdh027"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh028
            #add-point:BEFORE FIELD stdh028 name="input.b.page1.stdh028"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh028
            
            #add-point:AFTER FIELD stdh028 name="input.a.page1.stdh028"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh028
            #add-point:ON CHANGE stdh028 name="input.g.page1.stdh028"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh029
            #add-point:BEFORE FIELD stdh029 name="input.b.page1.stdh029"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh029
            
            #add-point:AFTER FIELD stdh029 name="input.a.page1.stdh029"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh029
            #add-point:ON CHANGE stdh029 name="input.g.page1.stdh029"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdh030
            #add-point:BEFORE FIELD stdh030 name="input.b.page1.stdh030"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdh030
            
            #add-point:AFTER FIELD stdh030 name="input.a.page1.stdh030"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdh030
            #add-point:ON CHANGE stdh030 name="input.g.page1.stdh030"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdhunit
            #add-point:BEFORE FIELD stdhunit name="input.b.page1.stdhunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdhunit
            
            #add-point:AFTER FIELD stdhunit name="input.a.page1.stdhunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdhunit
            #add-point:ON CHANGE stdhunit name="input.g.page1.stdhunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stdhseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdhseq
            #add-point:ON ACTION controlp INFIELD stdhseq name="input.c.page1.stdhseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdhsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdhsite
            #add-point:ON ACTION controlp INFIELD stdhsite name="input.c.page1.stdhsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh001
            #add-point:ON ACTION controlp INFIELD stdh001 name="input.c.page1.stdh001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh002
            #add-point:ON ACTION controlp INFIELD stdh002 name="input.c.page1.stdh002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh005
            #add-point:ON ACTION controlp INFIELD stdh005 name="input.c.page1.stdh005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh003
            #add-point:ON ACTION controlp INFIELD stdh003 name="input.c.page1.stdh003"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh004
            #add-point:ON ACTION controlp INFIELD stdh004 name="input.c.page1.stdh004"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh031
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh031
            #add-point:ON ACTION controlp INFIELD stdh031 name="input.c.page1.stdh031"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh032
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh032
            #add-point:ON ACTION controlp INFIELD stdh032 name="input.c.page1.stdh032"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh006
            #add-point:ON ACTION controlp INFIELD stdh006 name="input.c.page1.stdh006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh007
            #add-point:ON ACTION controlp INFIELD stdh007 name="input.c.page1.stdh007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh008
            #add-point:ON ACTION controlp INFIELD stdh008 name="input.c.page1.stdh008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh009
            #add-point:ON ACTION controlp INFIELD stdh009 name="input.c.page1.stdh009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh009_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh009_desc
            #add-point:ON ACTION controlp INFIELD stdh009_desc name="input.c.page1.stdh009_desc"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh010
            #add-point:ON ACTION controlp INFIELD stdh010 name="input.c.page1.stdh010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh011
            #add-point:ON ACTION controlp INFIELD stdh011 name="input.c.page1.stdh011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh012
            #add-point:ON ACTION controlp INFIELD stdh012 name="input.c.page1.stdh012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh013
            #add-point:ON ACTION controlp INFIELD stdh013 name="input.c.page1.stdh013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh014
            #add-point:ON ACTION controlp INFIELD stdh014 name="input.c.page1.stdh014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh015
            #add-point:ON ACTION controlp INFIELD stdh015 name="input.c.page1.stdh015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh016
            #add-point:ON ACTION controlp INFIELD stdh016 name="input.c.page1.stdh016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh017
            #add-point:ON ACTION controlp INFIELD stdh017 name="input.c.page1.stdh017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh018
            #add-point:ON ACTION controlp INFIELD stdh018 name="input.c.page1.stdh018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh019
            #add-point:ON ACTION controlp INFIELD stdh019 name="input.c.page1.stdh019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh020
            #add-point:ON ACTION controlp INFIELD stdh020 name="input.c.page1.stdh020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh021
            #add-point:ON ACTION controlp INFIELD stdh021 name="input.c.page1.stdh021"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh022
            #add-point:ON ACTION controlp INFIELD stdh022 name="input.c.page1.stdh022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh024
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh024
            #add-point:ON ACTION controlp INFIELD stdh024 name="input.c.page1.stdh024"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh023
            #add-point:ON ACTION controlp INFIELD stdh023 name="input.c.page1.stdh023"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh025
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh025
            #add-point:ON ACTION controlp INFIELD stdh025 name="input.c.page1.stdh025"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh026
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh026
            #add-point:ON ACTION controlp INFIELD stdh026 name="input.c.page1.stdh026"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh027
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh027
            #add-point:ON ACTION controlp INFIELD stdh027 name="input.c.page1.stdh027"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh028
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh028
            #add-point:ON ACTION controlp INFIELD stdh028 name="input.c.page1.stdh028"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh029
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh029
            #add-point:ON ACTION controlp INFIELD stdh029 name="input.c.page1.stdh029"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdh030
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdh030
            #add-point:ON ACTION controlp INFIELD stdh030 name="input.c.page1.stdh030"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdhunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdhunit
            #add-point:ON ACTION controlp INFIELD stdhunit name="input.c.page1.stdhunit"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stdh_d[l_ac].* = g_stdh_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt740_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stdh_d[l_ac].stdhseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stdh_d[l_ac].* = g_stdh_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt740_stdh_t_mask_restore('restore_mask_o')
      
               UPDATE stdh_t SET (stdhdocno,stdhseq,stdhsite,stdh001,stdh002,stdh005,stdh003,stdh004, 
                   stdh031,stdh032,stdh006,stdh007,stdh008,stdh009,stdh010,stdh011,stdh012,stdh013,stdh014, 
                   stdh015,stdh016,stdh017,stdh018,stdh019,stdh020,stdh021,stdh022,stdh024,stdh023,stdh025, 
                   stdh026,stdh027,stdh028,stdh029,stdh030,stdhunit) = (g_stdg_m.stdgdocno,g_stdh_d[l_ac].stdhseq, 
                   g_stdh_d[l_ac].stdhsite,g_stdh_d[l_ac].stdh001,g_stdh_d[l_ac].stdh002,g_stdh_d[l_ac].stdh005, 
                   g_stdh_d[l_ac].stdh003,g_stdh_d[l_ac].stdh004,g_stdh_d[l_ac].stdh031,g_stdh_d[l_ac].stdh032, 
                   g_stdh_d[l_ac].stdh006,g_stdh_d[l_ac].stdh007,g_stdh_d[l_ac].stdh008,g_stdh_d[l_ac].stdh009, 
                   g_stdh_d[l_ac].stdh010,g_stdh_d[l_ac].stdh011,g_stdh_d[l_ac].stdh012,g_stdh_d[l_ac].stdh013, 
                   g_stdh_d[l_ac].stdh014,g_stdh_d[l_ac].stdh015,g_stdh_d[l_ac].stdh016,g_stdh_d[l_ac].stdh017, 
                   g_stdh_d[l_ac].stdh018,g_stdh_d[l_ac].stdh019,g_stdh_d[l_ac].stdh020,g_stdh_d[l_ac].stdh021, 
                   g_stdh_d[l_ac].stdh022,g_stdh_d[l_ac].stdh024,g_stdh_d[l_ac].stdh023,g_stdh_d[l_ac].stdh025, 
                   g_stdh_d[l_ac].stdh026,g_stdh_d[l_ac].stdh027,g_stdh_d[l_ac].stdh028,g_stdh_d[l_ac].stdh029, 
                   g_stdh_d[l_ac].stdh030,g_stdh_d[l_ac].stdhunit)
                WHERE stdhent = g_enterprise AND stdhdocno = g_stdg_m.stdgdocno 
 
                  AND stdhseq = g_stdh_d_t.stdhseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stdh_d[l_ac].* = g_stdh_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stdh_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stdh_d[l_ac].* = g_stdh_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stdh_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stdg_m.stdgdocno
               LET gs_keys_bak[1] = g_stdgdocno_t
               LET gs_keys[2] = g_stdh_d[g_detail_idx].stdhseq
               LET gs_keys_bak[2] = g_stdh_d_t.stdhseq
               CALL astt740_update_b('stdh_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt740_stdh_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stdh_d[g_detail_idx].stdhseq = g_stdh_d_t.stdhseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stdg_m.stdgdocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stdh_d_t.stdhseq
 
                  CALL astt740_key_update_b(gs_keys,'stdh_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stdg_m),util.JSON.stringify(g_stdh_d_t)
               LET g_log2 = util.JSON.stringify(g_stdg_m),util.JSON.stringify(g_stdh_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astt740_unlock_b("stdh_t","'1'")
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
               LET g_stdh_d[li_reproduce_target].* = g_stdh_d[li_reproduce].*
 
               LET g_stdh_d[li_reproduce_target].stdhseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stdh_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stdh_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="astt740.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         IF p_cmd = 'a' THEN
            NEXT FIELD stdgsite
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stdhseq
 
            END CASE
         END IF
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD stdgdocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stdhseq
 
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
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
 
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
 
         CALL g_curr_diag.setCurrentRow("s_detail1",1)    
 
         EXIT DIALOG
 
      #交談指令共用ACTION
      &include "common_action.4gl" 
         CONTINUE DIALOG 
   END DIALOG
    
   #add-point:input段after input  name="input.after_input"
   
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="astt740.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt740_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt740_b_fill() #單身填充
      CALL astt740_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt740_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   
   #end add-point
   
   #遮罩相關處理
   LET g_stdg_m_mask_o.* =  g_stdg_m.*
   CALL astt740_stdg_t_mask()
   LET g_stdg_m_mask_n.* =  g_stdg_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stdg_m.stdgsite,g_stdg_m.stdgsite_desc,g_stdg_m.stdgdocdt,g_stdg_m.stdgdocno,g_stdg_m.stdg001, 
       g_stdg_m.stdg001_desc,g_stdg_m.stdg002,g_stdg_m.stdg002_desc,g_stdg_m.stdg006,g_stdg_m.stdg006_desc, 
       g_stdg_m.stdg003,g_stdg_m.stdg004,g_stdg_m.stdg005,g_stdg_m.stdg007,g_stdg_m.stdg007_desc,g_stdg_m.stdgunit, 
       g_stdg_m.stdgstus,g_stdg_m.stdgownid,g_stdg_m.stdgownid_desc,g_stdg_m.stdgowndp,g_stdg_m.stdgowndp_desc, 
       g_stdg_m.stdgcrtid,g_stdg_m.stdgcrtid_desc,g_stdg_m.stdgcrtdp,g_stdg_m.stdgcrtdp_desc,g_stdg_m.stdgcrtdt, 
       g_stdg_m.stdgmodid,g_stdg_m.stdgmodid_desc,g_stdg_m.stdgmoddt,g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfid_desc, 
       g_stdg_m.stdgcnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stdg_m.stdgstus 
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_stdh_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt740_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt740.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt740_detail_show()
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
 
{<section id="astt740.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt740_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stdg_t.stdgdocno 
   DEFINE l_oldno     LIKE stdg_t.stdgdocno 
 
   DEFINE l_master    RECORD LIKE stdg_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stdh_t.* #此變數樣板目前無使用
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE l_n         LIKE type_t.num5
   DEFINE r_success   LIKE type_t.num5
   DEFINE r_doctype   LIKE rtai_t.rtai004
   DEFINE l_insert    LIKE type_t.num5
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
   
   IF g_stdg_m.stdgdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stdgdocno_t = g_stdg_m.stdgdocno
 
    
   LET g_stdg_m.stdgdocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stdg_m.stdgownid = g_user
      LET g_stdg_m.stdgowndp = g_dept
      LET g_stdg_m.stdgcrtid = g_user
      LET g_stdg_m.stdgcrtdp = g_dept 
      LET g_stdg_m.stdgcrtdt = cl_get_current()
      LET g_stdg_m.stdgmodid = g_user
      LET g_stdg_m.stdgmoddt = cl_get_current()
      LET g_stdg_m.stdgstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   CALL g_stdh_d.clear()
#   #結算中心
#   SELECT COUNT(*) INTO l_n
#     FROM ooef_t
#    WHERE ooefent = g_enterprise
#      AND ooef001 = g_site
#      AND ooef212 = 'Y'
#      AND ooefstus = 'Y'
#   IF l_n > 0 THEN
#      LET g_stdg_m.stdgsite = g_site
#      INITIALIZE g_ref_fields TO NULL
#      LET g_ref_fields[1] = g_stdg_m.stdgsite
#      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
#      LET g_stdg_m.stdgsite_desc = '', g_rtn_fields[1] , ''
#      DISPLAY BY NAME g_stdg_m.stdgsite_desc
#   END IF
   LET g_stdg_m.stdgsite = ""
   LET g_site_flag = FALSE
   CALL s_aooi500_default(g_prog,'stdgsite',g_stdg_m.stdgsite)
      RETURNING l_insert,g_stdg_m.stdgsite
   IF NOT l_insert THEN
      RETURN
   END IF
   LET g_stdg_m.stdgunit = g_stdg_m.stdgsite
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdg_m.stdgsite
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdg_m.stdgsite_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdg_m.stdgsite_desc
   
   LET g_stdg_m.stdgdocdt = g_today
   #dongsz--add--str---
   #預設單據的單別
   LET r_success = ''
   LET r_doctype = ''
   CALL s_arti200_get_def_doc_type(g_stdg_m.stdgsite,g_prog,'1')
        RETURNING r_success,r_doctype
   LET g_stdg_m.stdgdocno = r_doctype
   #dongsz--add--end---
   LET g_stdg_m.stdg006 = g_user
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdg_m.stdg006
   CALL ap_ref_array2(g_ref_fields,"SELECT oofa011 FROM oofa_t WHERE oofaent='"||g_enterprise||"' AND oofa002='2' AND oofa003=?","") RETURNING g_rtn_fields
   LET g_stdg_m.stdg006_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdg_m.stdg006_desc
   
   #結算會計期
   LET g_stdg_m.stdg003 = ""
   LET g_stdg_m.stdg004 = ""
   LET g_stdg_m.stdg005 = ""
   IF NOT cl_null(g_stdg_m.stdgsite) THEN
      SELECT stau004 INTO g_stdg_m.stdg003
        FROM stau_t
       WHERE stauent = g_enterprise
         AND stausite = g_stdg_m.stdgsite
         AND stau001 = g_prog
   END IF

   LET g_stdg_m_t.* = g_stdg_m.*
   LET g_stdg_m_o.* = g_stdg_m.*
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stdg_m.stdgstus 
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   CALL astt740_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stdg_m.* TO NULL
      INITIALIZE g_stdh_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt740_show()
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
   CALL astt740_set_act_visible()   
   CALL astt740_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stdgdocno_t = g_stdg_m.stdgdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stdgent = " ||g_enterprise|| " AND",
                      " stdgdocno = '", g_stdg_m.stdgdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt740_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt740_idx_chk()
   
   LET g_data_owner = g_stdg_m.stdgownid      
   LET g_data_dept  = g_stdg_m.stdgowndp
   
   #功能已完成,通報訊息中心
   CALL astt740_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt740.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt740_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stdh_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt740_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stdh_t
    WHERE stdhent = g_enterprise AND stdhdocno = g_stdgdocno_t
 
    INTO TEMP astt740_detail
 
   #將key修正為調整後   
   UPDATE astt740_detail 
      #更新key欄位
      SET stdhdocno = g_stdg_m.stdgdocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stdh_t SELECT * FROM astt740_detail
   
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
   DROP TABLE astt740_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stdgdocno_t = g_stdg_m.stdgdocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt740.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt740_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point     
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   #DEFINE l_stdh          RECORD LIKE stdh_t.*  #add by geza 20151221 #161111-00028#3--mark
   #161111-00028#3--add---begin--------
   DEFINE l_stdh RECORD  #內部結算單明細資料表
       stdhent LIKE stdh_t.stdhent, #企業編號
       stdhunit LIKE stdh_t.stdhunit, #應用組織
       stdhsite LIKE stdh_t.stdhsite, #營運據點
       stdhdocno LIKE stdh_t.stdhdocno, #單據編號
       stdhseq LIKE stdh_t.stdhseq, #單據項次
       stdh001 LIKE stdh_t.stdh001, #業務類型
       stdh002 LIKE stdh_t.stdh002, #內部交易類型
       stdh003 LIKE stdh_t.stdh003, #來源單據
       stdh004 LIKE stdh_t.stdh004, #來源項次
       stdh005 LIKE stdh_t.stdh005, #來源日期
       stdh006 LIKE stdh_t.stdh006, #產品編號
       stdh007 LIKE stdh_t.stdh007, #費用編號
       stdh008 LIKE stdh_t.stdh008, #幣別
       stdh009 LIKE stdh_t.stdh009, #稅別
       stdh010 LIKE stdh_t.stdh010, #方向
       stdh011 LIKE stdh_t.stdh011, #未稅金額
       stdh012 LIKE stdh_t.stdh012, #含稅金額
       stdh013 LIKE stdh_t.stdh013, #未結算金額
       stdh014 LIKE stdh_t.stdh014, #已結算金額
       stdh015 LIKE stdh_t.stdh015, #本次結算金額
       stdh016 LIKE stdh_t.stdh016, #存貨組織
       stdh017 LIKE stdh_t.stdh017, #存貨法人
       stdh018 LIKE stdh_t.stdh018, #倉庫編碼
       stdh019 LIKE stdh_t.stdh019, #交易對象
       stdh020 LIKE stdh_t.stdh020, #交易對象組織
       stdh021 LIKE stdh_t.stdh021, #交易對象法人
       stdh022 LIKE stdh_t.stdh022, #結算會計期
       stdh023 LIKE stdh_t.stdh023, #財務會計年度
       stdh024 LIKE stdh_t.stdh024, #財務會計期別
       stdh025 LIKE stdh_t.stdh025, #帳務組織
       stdh026 LIKE stdh_t.stdh026, #帳務法人
       stdh027 LIKE stdh_t.stdh027, #帳務類型
       stdh028 LIKE stdh_t.stdh028, #主帳套已立帳金額
       stdh029 LIKE stdh_t.stdh029, #帳套二已立帳金額
       stdh030 LIKE stdh_t.stdh030, #帳套三已立帳金額
       stdh031 LIKE stdh_t.stdh031, #來源項序
       stdh032 LIKE stdh_t.stdh032  #出入庫碼
       END RECORD
   #161111-00028#3--add---end----------
   #end add-point     
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   IF g_stdg_m.stdgdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt740_cl USING g_enterprise,g_stdg_m.stdgdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt740_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt740_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt740_master_referesh USING g_stdg_m.stdgdocno INTO g_stdg_m.stdgsite,g_stdg_m.stdgdocdt, 
       g_stdg_m.stdgdocno,g_stdg_m.stdg001,g_stdg_m.stdg002,g_stdg_m.stdg006,g_stdg_m.stdg003,g_stdg_m.stdg004, 
       g_stdg_m.stdg005,g_stdg_m.stdg007,g_stdg_m.stdgunit,g_stdg_m.stdgstus,g_stdg_m.stdgownid,g_stdg_m.stdgowndp, 
       g_stdg_m.stdgcrtid,g_stdg_m.stdgcrtdp,g_stdg_m.stdgcrtdt,g_stdg_m.stdgmodid,g_stdg_m.stdgmoddt, 
       g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfdt,g_stdg_m.stdgsite_desc,g_stdg_m.stdg001_desc,g_stdg_m.stdg002_desc, 
       g_stdg_m.stdg006_desc,g_stdg_m.stdg007_desc,g_stdg_m.stdgownid_desc,g_stdg_m.stdgowndp_desc,g_stdg_m.stdgcrtid_desc, 
       g_stdg_m.stdgcrtdp_desc,g_stdg_m.stdgmodid_desc,g_stdg_m.stdgcnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt740_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stdg_m_mask_o.* =  g_stdg_m.*
   CALL astt740_stdg_t_mask()
   LET g_stdg_m_mask_n.* =  g_stdg_m.*
   
   CALL astt740_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      #add by geza 20151221(S)
      DECLARE s_ins_stdh_stdh_cs CURSOR FOR 
             #SELECT stdh_t.*  #161111-00028#3--mark
             #161111-00028#3--add---begin--------
              SELECT stdhent,stdhunit,stdhsite,stdhdocno,stdhseq,stdh001,stdh002,stdh003,
                     stdh004,stdh005,stdh006,stdh007,stdh008,stdh009,stdh010,stdh011,stdh012,
                     stdh013,stdh014,stdh015,stdh016,stdh017,stdh018,stdh019,stdh020,stdh021,
                     stdh022,stdh023,stdh024,stdh025,stdh026,stdh027,stdh028,stdh029,stdh030,stdh031,stdh032
             #161111-00028#3--add---end----------
                FROM stdh_t 
               WHERE stdhent=g_enterprise 
                 AND stdhdocno=g_stdg_m.stdgdocno 
      
      INITIALIZE l_stdh.* TO NULL
      
      FOREACH s_ins_stdh_stdh_cs INTO l_stdh.*
      
         #回写底稿
         UPDATE stdf_t SET stdfstus=CASE WHEN stdf019=stdf029 THEN '1' ELSE '3' END
          WHERE stdfent=g_enterprise
            AND stdf006=l_stdh.stdh003
            AND stdf007=l_stdh.stdh004
            AND stdf037=l_stdh.stdh031
            AND stdf038=l_stdh.stdh032
            AND stdfsite=l_stdh.stdhsite   
         IF SQLCA.SQLcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = g_stdg_m.stdgdocno 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = FALSE 
            CALL cl_err()
            CALL s_transaction_end('N','0')
            RETURN
         END IF    
         #add by geza 20151125(E)
      END FOREACH
      #add by geza 20151221(E)
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt740_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stdgdocno_t = g_stdg_m.stdgdocno
 
 
      DELETE FROM stdg_t
       WHERE stdgent = g_enterprise AND stdgdocno = g_stdg_m.stdgdocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stdg_m.stdgdocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM stdh_t
       WHERE stdhent = g_enterprise AND stdhdocno = g_stdg_m.stdgdocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stdh_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stdg_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt740_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stdh_d.clear() 
 
     
      CALL astt740_ui_browser_refresh()  
      #CALL astt740_ui_headershow()  
      #CALL astt740_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt740_browser_fill("")
         CALL astt740_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt740_cl
 
   #功能已完成,通報訊息中心
   CALL astt740_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt740.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt740_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   DEFINE l_ooef019  LIKE ooef_t.ooef019
   DEFINE ls_sql     STRING
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stdh_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt740_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stdhseq,stdhsite,stdh001,stdh002,stdh005,stdh003,stdh004,stdh031, 
             stdh032,stdh006,stdh007,stdh008,stdh009,stdh010,stdh011,stdh012,stdh013,stdh014,stdh015, 
             stdh016,stdh017,stdh018,stdh019,stdh020,stdh021,stdh022,stdh024,stdh023,stdh025,stdh026, 
             stdh027,stdh028,stdh029,stdh030,stdhunit ,t1.ooefl003 ,t2.imaal003 ,t3.imaal004 ,t4.stael003 , 
             t5.ooail003 ,t6.ooefl003 ,t7.ooefl003 ,t8.inaa002 ,t9.ooefl003 ,t10.ooefl003 ,t11.ooefl003 , 
             t12.ooefl003 FROM stdh_t",   
                     " INNER JOIN stdg_t ON stdgent = " ||g_enterprise|| " AND stdgdocno = stdhdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=stdhsite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN imaal_t t2 ON t2.imaalent="||g_enterprise||" AND t2.imaal001=stdh006 AND t2.imaal002='"||g_dlang||"' ",
               " LEFT JOIN imaal_t t3 ON t3.imaalent="||g_enterprise||" AND t3.imaal001=stdh006 AND t3.imaal002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t4 ON t4.staelent="||g_enterprise||" AND t4.stael001=stdh007 AND t4.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t5 ON t5.ooailent="||g_enterprise||" AND t5.ooail001=stdh008 AND t5.ooail002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=stdh016 AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=stdh017 AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN inaa_t t8 ON t8.inaaent="||g_enterprise||" AND t8.inaasite=stdhsite AND t8.inaa001=stdh018  ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=stdh020 AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t10 ON t10.ooeflent="||g_enterprise||" AND t10.ooefl001=stdh021 AND t10.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t11 ON t11.ooeflent="||g_enterprise||" AND t11.ooefl001=stdh025 AND t11.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t12 ON t12.ooeflent="||g_enterprise||" AND t12.ooefl001=stdh026 AND t12.ooefl002='"||g_dlang||"' ",
 
                     " WHERE stdhent=? AND stdhdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stdh_t.stdhseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
      LET g_sql = g_sql,",stdh_t.stdh003,stdh_t.stdh004"
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt740_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt740_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stdg_m.stdgdocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stdg_m.stdgdocno INTO g_stdh_d[l_ac].stdhseq,g_stdh_d[l_ac].stdhsite, 
          g_stdh_d[l_ac].stdh001,g_stdh_d[l_ac].stdh002,g_stdh_d[l_ac].stdh005,g_stdh_d[l_ac].stdh003, 
          g_stdh_d[l_ac].stdh004,g_stdh_d[l_ac].stdh031,g_stdh_d[l_ac].stdh032,g_stdh_d[l_ac].stdh006, 
          g_stdh_d[l_ac].stdh007,g_stdh_d[l_ac].stdh008,g_stdh_d[l_ac].stdh009,g_stdh_d[l_ac].stdh010, 
          g_stdh_d[l_ac].stdh011,g_stdh_d[l_ac].stdh012,g_stdh_d[l_ac].stdh013,g_stdh_d[l_ac].stdh014, 
          g_stdh_d[l_ac].stdh015,g_stdh_d[l_ac].stdh016,g_stdh_d[l_ac].stdh017,g_stdh_d[l_ac].stdh018, 
          g_stdh_d[l_ac].stdh019,g_stdh_d[l_ac].stdh020,g_stdh_d[l_ac].stdh021,g_stdh_d[l_ac].stdh022, 
          g_stdh_d[l_ac].stdh024,g_stdh_d[l_ac].stdh023,g_stdh_d[l_ac].stdh025,g_stdh_d[l_ac].stdh026, 
          g_stdh_d[l_ac].stdh027,g_stdh_d[l_ac].stdh028,g_stdh_d[l_ac].stdh029,g_stdh_d[l_ac].stdh030, 
          g_stdh_d[l_ac].stdhunit,g_stdh_d[l_ac].stdhsite_desc,g_stdh_d[l_ac].stdh006_desc,g_stdh_d[l_ac].stdh006_desc_desc, 
          g_stdh_d[l_ac].stdh007_desc,g_stdh_d[l_ac].stdh008_desc,g_stdh_d[l_ac].stdh016_desc,g_stdh_d[l_ac].stdh017_desc, 
          g_stdh_d[l_ac].stdh018_desc,g_stdh_d[l_ac].stdh020_desc,g_stdh_d[l_ac].stdh021_desc,g_stdh_d[l_ac].stdh025_desc, 
          g_stdh_d[l_ac].stdh026_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         SELECT ooef019 INTO l_ooef019 FROM ooef_t
          WHERE ooefent = g_enterprise
            AND ooef001 = g_stdh_d[l_ac].stdhsite
         INITIALIZE g_ref_fields TO NULL
         LET g_ref_fields[1] = l_ooef019
         LET g_ref_fields[2] = g_stdh_d[l_ac].stdh009
         LET ls_sql = "SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001=? AND oodbl002=? AND oodbl003='"||g_dlang||"'"
         LET ls_sql = cl_sql_add_mask(ls_sql)              #遮蔽特定資料
         CALL ap_ref_array2(g_ref_fields,ls_sql,"") RETURNING g_rtn_fields
         LET g_stdh_d[l_ac].stdh009_desc = '', g_rtn_fields[1] , ''
         DISPLAY BY NAME g_stdh_d[l_ac].stdh009_desc
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
    
 
   
   #add-point:browser_fill段其他table處理 name="browser_fill.other_fill"
   
   #end add-point
   
   CALL g_stdh_d.deleteElement(g_stdh_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt740_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stdh_d.getLength()
      LET g_stdh_d_mask_o[l_ac].* =  g_stdh_d[l_ac].*
      CALL astt740_stdh_t_mask()
      LET g_stdh_d_mask_n[l_ac].* =  g_stdh_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt740.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt740_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stdh_t
       WHERE stdhent = g_enterprise AND
         stdhdocno = ps_keys_bak[1] AND stdhseq = ps_keys_bak[2]
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
         CALL g_stdh_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt740.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt740_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stdh_t
                  (stdhent,
                   stdhdocno,
                   stdhseq
                   ,stdhsite,stdh001,stdh002,stdh005,stdh003,stdh004,stdh031,stdh032,stdh006,stdh007,stdh008,stdh009,stdh010,stdh011,stdh012,stdh013,stdh014,stdh015,stdh016,stdh017,stdh018,stdh019,stdh020,stdh021,stdh022,stdh024,stdh023,stdh025,stdh026,stdh027,stdh028,stdh029,stdh030,stdhunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stdh_d[g_detail_idx].stdhsite,g_stdh_d[g_detail_idx].stdh001,g_stdh_d[g_detail_idx].stdh002, 
                       g_stdh_d[g_detail_idx].stdh005,g_stdh_d[g_detail_idx].stdh003,g_stdh_d[g_detail_idx].stdh004, 
                       g_stdh_d[g_detail_idx].stdh031,g_stdh_d[g_detail_idx].stdh032,g_stdh_d[g_detail_idx].stdh006, 
                       g_stdh_d[g_detail_idx].stdh007,g_stdh_d[g_detail_idx].stdh008,g_stdh_d[g_detail_idx].stdh009, 
                       g_stdh_d[g_detail_idx].stdh010,g_stdh_d[g_detail_idx].stdh011,g_stdh_d[g_detail_idx].stdh012, 
                       g_stdh_d[g_detail_idx].stdh013,g_stdh_d[g_detail_idx].stdh014,g_stdh_d[g_detail_idx].stdh015, 
                       g_stdh_d[g_detail_idx].stdh016,g_stdh_d[g_detail_idx].stdh017,g_stdh_d[g_detail_idx].stdh018, 
                       g_stdh_d[g_detail_idx].stdh019,g_stdh_d[g_detail_idx].stdh020,g_stdh_d[g_detail_idx].stdh021, 
                       g_stdh_d[g_detail_idx].stdh022,g_stdh_d[g_detail_idx].stdh024,g_stdh_d[g_detail_idx].stdh023, 
                       g_stdh_d[g_detail_idx].stdh025,g_stdh_d[g_detail_idx].stdh026,g_stdh_d[g_detail_idx].stdh027, 
                       g_stdh_d[g_detail_idx].stdh028,g_stdh_d[g_detail_idx].stdh029,g_stdh_d[g_detail_idx].stdh030, 
                       g_stdh_d[g_detail_idx].stdhunit)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stdh_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stdh_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt740.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt740_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stdh_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt740_stdh_t_mask_restore('restore_mask_o')
               
      UPDATE stdh_t 
         SET (stdhdocno,
              stdhseq
              ,stdhsite,stdh001,stdh002,stdh005,stdh003,stdh004,stdh031,stdh032,stdh006,stdh007,stdh008,stdh009,stdh010,stdh011,stdh012,stdh013,stdh014,stdh015,stdh016,stdh017,stdh018,stdh019,stdh020,stdh021,stdh022,stdh024,stdh023,stdh025,stdh026,stdh027,stdh028,stdh029,stdh030,stdhunit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stdh_d[g_detail_idx].stdhsite,g_stdh_d[g_detail_idx].stdh001,g_stdh_d[g_detail_idx].stdh002, 
                  g_stdh_d[g_detail_idx].stdh005,g_stdh_d[g_detail_idx].stdh003,g_stdh_d[g_detail_idx].stdh004, 
                  g_stdh_d[g_detail_idx].stdh031,g_stdh_d[g_detail_idx].stdh032,g_stdh_d[g_detail_idx].stdh006, 
                  g_stdh_d[g_detail_idx].stdh007,g_stdh_d[g_detail_idx].stdh008,g_stdh_d[g_detail_idx].stdh009, 
                  g_stdh_d[g_detail_idx].stdh010,g_stdh_d[g_detail_idx].stdh011,g_stdh_d[g_detail_idx].stdh012, 
                  g_stdh_d[g_detail_idx].stdh013,g_stdh_d[g_detail_idx].stdh014,g_stdh_d[g_detail_idx].stdh015, 
                  g_stdh_d[g_detail_idx].stdh016,g_stdh_d[g_detail_idx].stdh017,g_stdh_d[g_detail_idx].stdh018, 
                  g_stdh_d[g_detail_idx].stdh019,g_stdh_d[g_detail_idx].stdh020,g_stdh_d[g_detail_idx].stdh021, 
                  g_stdh_d[g_detail_idx].stdh022,g_stdh_d[g_detail_idx].stdh024,g_stdh_d[g_detail_idx].stdh023, 
                  g_stdh_d[g_detail_idx].stdh025,g_stdh_d[g_detail_idx].stdh026,g_stdh_d[g_detail_idx].stdh027, 
                  g_stdh_d[g_detail_idx].stdh028,g_stdh_d[g_detail_idx].stdh029,g_stdh_d[g_detail_idx].stdh030, 
                  g_stdh_d[g_detail_idx].stdhunit) 
         WHERE stdhent = g_enterprise AND stdhdocno = ps_keys_bak[1] AND stdhseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stdh_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stdh_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt740_stdh_t_mask_restore('restore_mask_n')
               
      #add-point:update_b段修改後 name="update_b.after_update"
      
      #end add-point  
   END IF
   
   #子表處理
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      
   END IF
   
   
 
   
 
   
   #add-point:update_b段other name="update_b.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt740.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt740_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt740.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt740_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt740.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt740_lock_b(ps_table,ps_page)
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
   #CALL astt740_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stdh_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt740_bcl USING g_enterprise,
                                       g_stdg_m.stdgdocno,g_stdh_d[g_detail_idx].stdhseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt740_bcl:",SQLERRMESSAGE 
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
 
{<section id="astt740.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt740_unlock_b(ps_table,ps_page)
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
      CLOSE astt740_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt740.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt740_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stdgdocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stdgdocno",TRUE)
      CALL cl_set_comp_entry("stdgdocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("stdgsite",TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt740.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt740_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stdgdocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stdgdocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stdgdocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF NOT s_aooi500_comp_entry(g_prog,'stdgsite') OR g_site_flag THEN
      CALL cl_set_comp_entry("stdgsite",FALSE)
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt740.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt740_set_entry_b(p_cmd)
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
   
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="astt740.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt740_set_no_entry_b(p_cmd)
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
   
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="astt740.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt740_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   CALL cl_set_act_visible("modify,delete,modify_detail", TRUE)    #20150615--add by xujing
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt740.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt740_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_stdg_m.stdgstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF


   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt740.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt740_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt740.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt740_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt740.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt740_default_search()
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
      LET ls_wc = ls_wc, " stdgdocno = '", g_argv[01], "' AND "
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
 
         FOR li_idx = 1 TO la_wc.getLength()
            CASE
               WHEN la_wc[li_idx].tableid = "stdg_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stdh_t" 
                  LET g_wc2_table1 = la_wc[li_idx].wc
 
               WHEN la_wc[li_idx].tableid = "EXTENDWC"
                  LET g_wc2_extend = la_wc[li_idx].wc
            END CASE
         END FOR
         IF NOT cl_null(g_wc) OR NOT cl_null(g_wc2_table1) 
 
            OR NOT cl_null(g_wc2_extend)
            THEN
            #組合g_wc2
            IF g_wc2_table1 <> " 1=1" AND NOT cl_null(g_wc2_table1) THEN
               LET g_wc2 = g_wc2_table1
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
 
{<section id="astt740.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt740_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success   LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stdg_m.stdgdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt740_cl USING g_enterprise,g_stdg_m.stdgdocno
   IF STATUS THEN
      CLOSE astt740_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt740_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt740_master_referesh USING g_stdg_m.stdgdocno INTO g_stdg_m.stdgsite,g_stdg_m.stdgdocdt, 
       g_stdg_m.stdgdocno,g_stdg_m.stdg001,g_stdg_m.stdg002,g_stdg_m.stdg006,g_stdg_m.stdg003,g_stdg_m.stdg004, 
       g_stdg_m.stdg005,g_stdg_m.stdg007,g_stdg_m.stdgunit,g_stdg_m.stdgstus,g_stdg_m.stdgownid,g_stdg_m.stdgowndp, 
       g_stdg_m.stdgcrtid,g_stdg_m.stdgcrtdp,g_stdg_m.stdgcrtdt,g_stdg_m.stdgmodid,g_stdg_m.stdgmoddt, 
       g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfdt,g_stdg_m.stdgsite_desc,g_stdg_m.stdg001_desc,g_stdg_m.stdg002_desc, 
       g_stdg_m.stdg006_desc,g_stdg_m.stdg007_desc,g_stdg_m.stdgownid_desc,g_stdg_m.stdgowndp_desc,g_stdg_m.stdgcrtid_desc, 
       g_stdg_m.stdgcrtdp_desc,g_stdg_m.stdgmodid_desc,g_stdg_m.stdgcnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt740_action_chk() THEN
      CLOSE astt740_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stdg_m.stdgsite,g_stdg_m.stdgsite_desc,g_stdg_m.stdgdocdt,g_stdg_m.stdgdocno,g_stdg_m.stdg001, 
       g_stdg_m.stdg001_desc,g_stdg_m.stdg002,g_stdg_m.stdg002_desc,g_stdg_m.stdg006,g_stdg_m.stdg006_desc, 
       g_stdg_m.stdg003,g_stdg_m.stdg004,g_stdg_m.stdg005,g_stdg_m.stdg007,g_stdg_m.stdg007_desc,g_stdg_m.stdgunit, 
       g_stdg_m.stdgstus,g_stdg_m.stdgownid,g_stdg_m.stdgownid_desc,g_stdg_m.stdgowndp,g_stdg_m.stdgowndp_desc, 
       g_stdg_m.stdgcrtid,g_stdg_m.stdgcrtid_desc,g_stdg_m.stdgcrtdp,g_stdg_m.stdgcrtdp_desc,g_stdg_m.stdgcrtdt, 
       g_stdg_m.stdgmodid,g_stdg_m.stdgmodid_desc,g_stdg_m.stdgmoddt,g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfid_desc, 
       g_stdg_m.stdgcnfdt
 
   CASE g_stdg_m.stdgstus
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
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_stdg_m.stdgstus
            
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
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
      CALL cl_set_act_visible("signing,withdraw",FALSE)
      CASE g_stdg_m.stdgstus
         WHEN "N"
            CALL cl_set_act_visible("unconfirmed,hold",FALSE)
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            IF cl_bpm_chk() THEN
               CALL cl_set_act_visible("signing",TRUE)
               CALL cl_set_act_visible("confirmed",FALSE)
            END IF
         WHEN "R"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE)
         WHEN "D"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE)
         WHEN "X"
            HIDE OPTION "confirmed"
            HIDE OPTION "unconfirmed"
            CALL s_transaction_end('N','0')  #160816-00068#1 add
            RETURN
         WHEN "Y"
            HIDE OPTION "invalid"            
         WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
            CALL cl_set_act_visible("withdraw",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed,hold",FALSE)
         WHEN "A"    #只能顯示確認; 其餘應用功能皆隱藏
            CALL cl_set_act_visible("confirmed",TRUE)
            CALL cl_set_act_visible("unconfirmed,invalid,hold",FALSE)            
      END CASE 
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT astt740_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt740_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt740_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt740_cl
            RETURN
         END IF
 
 
 
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            
            #end add-point
         END IF
         EXIT MENU
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
            
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
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
            
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
      AND lc_state <> "X"
      ) OR 
      g_stdg_m.stdgstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt740_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   LET l_success = TRUE
   CASE
      WHEN lc_state = 'Y'
         CALL s_astt740_conf_chk(g_stdg_m.stdgdocno,g_stdg_m.stdgstus) RETURNING l_success
         IF l_success THEN
            IF cl_ask_confirm('aim-00108') THEN
               CALL s_transaction_begin()
               CALL s_astt740_conf_upd(g_stdg_m.stdgdocno) RETURNING l_success,g_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_stdg_m.stdgdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')  #160816-00068#1 add
               RETURN
            END IF
         ELSE
            CALL s_transaction_end('N','0')  #160816-00068#1 add
            RETURN
         END IF
      WHEN lc_state = 'X'
         CALL s_astt740_void_chk(g_stdg_m.stdgdocno,g_stdg_m.stdgstus) RETURNING l_success
         IF l_success THEN
            IF cl_ask_confirm('aim-00109') THEN
               CALL s_transaction_begin()
               CALL s_astt740_void_upd(g_stdg_m.stdgdocno) RETURNING l_success,g_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_stdg_m.stdgdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')  #160816-00068#1 add
               RETURN
            END IF
         ELSE
            CALL s_transaction_end('N','0')  #160816-00068#1 add
            RETURN
         END IF
      WHEN lc_state = 'N'
         CALL s_astt740_unconf_chk(g_stdg_m.stdgdocno,g_stdg_m.stdgstus) RETURNING l_success
         IF l_success THEN
            IF cl_ask_confirm('aim-00110') THEN
               CALL s_transaction_begin()
               CALL s_astt740_unconf_upd(g_stdg_m.stdgdocno) RETURNING l_success,g_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_stdg_m.stdgdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL s_transaction_end('N','0')  #160816-00068#1 add
               RETURN
            END IF
         ELSE
            CALL s_transaction_end('N','0')  #160816-00068#1 add
            RETURN
         END IF
      OTHERWISE
         CALL s_transaction_end('N','0')  #160816-00068#1 add
         RETURN
   END CASE                 {#ADP版次:1#}  
   #end add-point
   
   LET g_stdg_m.stdgmodid = g_user
   LET g_stdg_m.stdgmoddt = cl_get_current()
   LET g_stdg_m.stdgstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stdg_t 
      SET (stdgstus,stdgmodid,stdgmoddt) 
        = (g_stdg_m.stdgstus,g_stdg_m.stdgmodid,g_stdg_m.stdgmoddt)     
    WHERE stdgent = g_enterprise AND stdgdocno = g_stdg_m.stdgdocno
 
    
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE astt740_master_referesh USING g_stdg_m.stdgdocno INTO g_stdg_m.stdgsite,g_stdg_m.stdgdocdt, 
          g_stdg_m.stdgdocno,g_stdg_m.stdg001,g_stdg_m.stdg002,g_stdg_m.stdg006,g_stdg_m.stdg003,g_stdg_m.stdg004, 
          g_stdg_m.stdg005,g_stdg_m.stdg007,g_stdg_m.stdgunit,g_stdg_m.stdgstus,g_stdg_m.stdgownid,g_stdg_m.stdgowndp, 
          g_stdg_m.stdgcrtid,g_stdg_m.stdgcrtdp,g_stdg_m.stdgcrtdt,g_stdg_m.stdgmodid,g_stdg_m.stdgmoddt, 
          g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfdt,g_stdg_m.stdgsite_desc,g_stdg_m.stdg001_desc,g_stdg_m.stdg002_desc, 
          g_stdg_m.stdg006_desc,g_stdg_m.stdg007_desc,g_stdg_m.stdgownid_desc,g_stdg_m.stdgowndp_desc, 
          g_stdg_m.stdgcrtid_desc,g_stdg_m.stdgcrtdp_desc,g_stdg_m.stdgmodid_desc,g_stdg_m.stdgcnfid_desc 
 
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stdg_m.stdgsite,g_stdg_m.stdgsite_desc,g_stdg_m.stdgdocdt,g_stdg_m.stdgdocno, 
          g_stdg_m.stdg001,g_stdg_m.stdg001_desc,g_stdg_m.stdg002,g_stdg_m.stdg002_desc,g_stdg_m.stdg006, 
          g_stdg_m.stdg006_desc,g_stdg_m.stdg003,g_stdg_m.stdg004,g_stdg_m.stdg005,g_stdg_m.stdg007, 
          g_stdg_m.stdg007_desc,g_stdg_m.stdgunit,g_stdg_m.stdgstus,g_stdg_m.stdgownid,g_stdg_m.stdgownid_desc, 
          g_stdg_m.stdgowndp,g_stdg_m.stdgowndp_desc,g_stdg_m.stdgcrtid,g_stdg_m.stdgcrtid_desc,g_stdg_m.stdgcrtdp, 
          g_stdg_m.stdgcrtdp_desc,g_stdg_m.stdgcrtdt,g_stdg_m.stdgmodid,g_stdg_m.stdgmodid_desc,g_stdg_m.stdgmoddt, 
          g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfid_desc,g_stdg_m.stdgcnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
 
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   SELECT stdgmodid,stdgmoddt,stdgcnfid,stdgcnfdt
     INTO g_stdg_m.stdgmodid,g_stdg_m.stdgmoddt,
          g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfdt
     FROM stdg_t
    WHERE stdgent = g_enterprise AND stdgdocno = g_stdg_m.stdgdocno
   DISPLAY BY NAME g_stdg_m.stdgmodid,g_stdg_m.stdgmoddt,
                   g_stdg_m.stdgcnfid,g_stdg_m.stdgcnfdt
   #end add-point  
 
   CLOSE astt740_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt740_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt740.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt740_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stdh_d.getLength() THEN
         LET g_detail_idx = g_stdh_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stdh_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stdh_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt740.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt740_b_fill2(pi_idx)
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
   
   CALL astt740_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt740.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt740_fill_chk(ps_idx)
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
   IF (cl_null(g_wc2_table1) OR g_wc2_table1.trim() = '1=1') THEN
      #add-point:fill_chk段other_chk name="fill_chk.other_chk"
      
      #end add-point
      RETURN TRUE
   END IF
   
   #add-point:fill_chk段after_chk name="fill_chk.after_chk"
   
   #end add-point
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="astt740.status_show" >}
PRIVATE FUNCTION astt740_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt740.mask_functions" >}
&include "erp/ast/astt740_mask.4gl"
 
{</section>}
 
{<section id="astt740.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt740_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   DEFINE l_success   LIKE type_t.num5
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
 
 
   CALL astt740_show()
   CALL astt740_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   CALL s_astt740_conf_chk(g_stdg_m.stdgdocno,g_stdg_m.stdgstus) RETURNING l_success
   IF NOT l_success THEN
      CLOSE astt740_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stdg_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stdh_d))
 
 
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
   #CALL astt740_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt740_ui_headershow()
   CALL astt740_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt740_draw_out()
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
   CALL astt740_ui_headershow()  
   CALL astt740_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt740.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt740_set_pk_array()
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
   LET g_pk_array[1].values = g_stdg_m.stdgdocno
   LET g_pk_array[1].column = 'stdgdocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt740.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt740.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt740_msgcentre_notify(lc_state)
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
   CALL astt740_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stdg_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt740.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt740_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#40 add-S
   SELECT stdgstus  INTO g_stdg_m.stdgstus
     FROM stdg_t
    WHERE stdgent = g_enterprise
      AND stdgdocno = g_stdg_m.stdgdocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stdg_m.stdgstus
        WHEN 'W'
           LET g_errno = 'sub-00180'
        WHEN 'X'
           LET g_errno = 'sub-00229'
        WHEN 'Y'
           LET g_errno = 'sub-00178'
        WHEN 'S'
           LET g_errno = 'sub-00230'
     END CASE

     IF NOT cl_null(g_errno) THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code = g_errno
        LET g_errparam.extend = g_stdg_m.stdgdocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt740_set_act_visible()
        CALL astt740_set_act_no_visible()
        CALL astt740_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#40 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt740.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 檢查結算對象是否存在于結算對象配置作業中
# Memo...........:
# Usage..........: CALL astt740_chk_stdg001()
# Date & Author..: 2014/08/05 By dongsz
# Modify.........:
################################################################################
PRIVATE FUNCTION astt740_chk_stdg001()
DEFINE l_n      LIKE type_t.num5

   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM stdd_t
    WHERE stddent = g_enterprise
      AND stdd001 = g_stdg_m.stdgsite
      AND ((stdd004 = g_stdg_m.stdg001 AND stdd005 = g_stdg_m.stdg002)
            OR (stdd004 = g_stdg_m.stdg002 AND stdd005 = g_stdg_m.stdg001))
   IF l_n < 1 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = 'ast-00152'
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN FALSE
   END IF
   
   RETURN TRUE
   
END FUNCTION

################################################################################
# Descriptions...: 檢查同一結算會計期是否有未審核單據
# Memo...........:
# Usage..........: CALL astt740_chk_stdg003()
# Date & Author..: 2014/08/05 By dongsz
# Modify.........:
################################################################################
PRIVATE FUNCTION astt740_chk_stdg003()
DEFINE l_n           LIKE type_t.num5
DEFINE l_stdgdocno   LIKE stdg_t.stdgdocno

   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM stdg_t
    WHERE stdgent = g_enterprise
      AND stdg003 = g_stdg_m.stdg003
      AND ((stdg001 = g_stdg_m.stdg001 AND stdg002 = g_stdg_m.stdg002) OR 
           (stdg001 = g_stdg_m.stdg002 AND stdg002 = g_stdg_m.stdg001))
      AND stdgdocno <> g_stdg_m.stdgdocno
      AND stdgstus = 'N'
   IF l_n > 0 THEN
      SELECT stdgdocno INTO l_stdgdocno
        FROM stdg_t
       WHERE stdgent = g_enterprise
         AND stdg003 = g_stdg_m.stdg003
         AND ((stdg001 = g_stdg_m.stdg001 AND stdg002 = g_stdg_m.stdg002) OR 
              (stdg001 = g_stdg_m.stdg002 AND stdg002 = g_stdg_m.stdg001))
         AND stdgstus = 'N'
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = NULL
      LET g_errparam.code = 'ast-00153'
      LET g_errparam.popup = TRUE
      LET g_errparam.replace[1] = g_stdg_m.stdg003
      LET g_errparam.replace[2] = l_stdgdocno
      
      CALL cl_err()
      RETURN FALSE
   END IF
   
   RETURN TRUE

END FUNCTION

 
{</section>}
 
