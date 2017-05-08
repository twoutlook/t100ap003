#該程式未解開Section, 採用最新樣板產出!
{<section id="astt606.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0011(2015-01-21 17:20:48), PR版次:0011(2016-11-22 10:51:42)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000075
#+ Filename...: astt606
#+ Description: 經銷商代墊費用報銷維護作業
#+ Creator....: 03247(2014-11-28 14:01:37)
#+ Modifier...: 06189 -SD/PR- 02749
 
{</section>}
 
{<section id="astt606.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#Memos
#160816-00068#16    2016/08/19  By 08209    調整transaction
#160818-00017#40    2016-08-24  By 08734    删除修改未重新判断状态码
#160905-00007#3     2016/09/05  By zhujing  调整系统中无ENT的SQL条件增加ent
#160824-00007#199   2016/11/22  by lori     修正舊值備份寫法
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目 name="global.import"
#160318-00025#49 2016/04/26 By 07673   將重複內容的錯誤訊息置換為公用錯誤訊息
#end add-point 
 
SCHEMA ds 
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#單頭 type 宣告
PRIVATE type type_g_stdk_m        RECORD
       stdksite LIKE stdk_t.stdksite, 
   stdksite_desc LIKE type_t.chr80, 
   stdkdocdt LIKE stdk_t.stdkdocdt, 
   stdkdocno LIKE stdk_t.stdkdocno, 
   stdkunit LIKE stdk_t.stdkunit, 
   stdk001 LIKE stdk_t.stdk001, 
   stdk002 LIKE stdk_t.stdk002, 
   stdk003 LIKE stdk_t.stdk003, 
   stdk003_desc LIKE type_t.chr80, 
   stdk004 LIKE stdk_t.stdk004, 
   stdk004_desc LIKE type_t.chr80, 
   stdk005 LIKE stdk_t.stdk005, 
   stdk005_desc LIKE type_t.chr80, 
   stdkstus LIKE stdk_t.stdkstus, 
   stdk006 LIKE stdk_t.stdk006, 
   stdk007 LIKE stdk_t.stdk007, 
   stdl008_sum LIKE type_t.chr500, 
   stdk008 LIKE stdk_t.stdk008, 
   stdk008_desc LIKE type_t.chr80, 
   stdk009 LIKE stdk_t.stdk009, 
   stdk009_desc LIKE type_t.chr80, 
   stdk012 LIKE stdk_t.stdk012, 
   stdk010 LIKE stdk_t.stdk010, 
   stdk011 LIKE stdk_t.stdk011, 
   stdk013 LIKE stdk_t.stdk013, 
   ooff013 LIKE type_t.chr500, 
   stdkownid LIKE stdk_t.stdkownid, 
   stdkownid_desc LIKE type_t.chr80, 
   stdkowndp LIKE stdk_t.stdkowndp, 
   stdkowndp_desc LIKE type_t.chr80, 
   stdkcrtid LIKE stdk_t.stdkcrtid, 
   stdkcrtid_desc LIKE type_t.chr80, 
   stdkcrtdp LIKE stdk_t.stdkcrtdp, 
   stdkcrtdp_desc LIKE type_t.chr80, 
   stdkcrtdt LIKE stdk_t.stdkcrtdt, 
   stdkmodid LIKE stdk_t.stdkmodid, 
   stdkmodid_desc LIKE type_t.chr80, 
   stdkmoddt LIKE stdk_t.stdkmoddt, 
   stdkcnfid LIKE stdk_t.stdkcnfid, 
   stdkcnfid_desc LIKE type_t.chr80, 
   stdkcnfdt LIKE stdk_t.stdkcnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stdl_d        RECORD
       stdlseq LIKE stdl_t.stdlseq, 
   stdl001 LIKE stdl_t.stdl001, 
   stdl002 LIKE stdl_t.stdl002, 
   stdl003 LIKE stdl_t.stdl003, 
   stdl003_desc LIKE type_t.chr500, 
   stdl004 LIKE stdl_t.stdl004, 
   stdl004_desc LIKE type_t.chr500, 
   stdl005 LIKE stdl_t.stdl005, 
   stdl006 LIKE stdl_t.stdl006, 
   stdl007 LIKE stdl_t.stdl007, 
   stdl008 LIKE stdl_t.stdl008, 
   stdl009 LIKE stdl_t.stdl009, 
   stdl010 LIKE stdl_t.stdl010, 
   stdl011 LIKE stdl_t.stdl011, 
   stdl012 LIKE stdl_t.stdl012, 
   stdl013 LIKE stdl_t.stdl013, 
   stdl014 LIKE stdl_t.stdl014, 
   stdl015 LIKE stdl_t.stdl015, 
   stdl016 LIKE stdl_t.stdl016, 
   stdl017 LIKE stdl_t.stdl017, 
   stdl018 LIKE stdl_t.stdl018, 
   stdl019 LIKE stdl_t.stdl019, 
   stdl020 LIKE stdl_t.stdl020, 
   stdl021 LIKE stdl_t.stdl021, 
   stdl022 LIKE stdl_t.stdl022, 
   stdl023 LIKE stdl_t.stdl023, 
   stdlsite LIKE stdl_t.stdlsite, 
   stdlunit LIKE stdl_t.stdlunit
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stdkdocno LIKE stdk_t.stdkdocno,
      b_stdkdocdt LIKE stdk_t.stdkdocdt,
      b_stdksite LIKE stdk_t.stdksite,
   b_stdksite_desc LIKE type_t.chr80,
      b_stdk001 LIKE stdk_t.stdk001,
      b_stdk002 LIKE stdk_t.stdk002,
      b_stdk003 LIKE stdk_t.stdk003,
   b_stdk003_desc LIKE type_t.chr80,
      b_stdk004 LIKE stdk_t.stdk004,
   b_stdk004_desc LIKE type_t.chr80,
      b_stdk005 LIKE stdk_t.stdk005,
   b_stdk005_desc LIKE type_t.chr80,
      b_stdk006 LIKE stdk_t.stdk006,
      b_stdk007 LIKE stdk_t.stdk007
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_wc2_i36001          STRING
DEFINE g_site_flag   LIKE type_t.num5
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stdk_m          type_g_stdk_m
DEFINE g_stdk_m_t        type_g_stdk_m
DEFINE g_stdk_m_o        type_g_stdk_m
DEFINE g_stdk_m_mask_o   type_g_stdk_m #轉換遮罩前資料
DEFINE g_stdk_m_mask_n   type_g_stdk_m #轉換遮罩後資料
 
   DEFINE g_stdkdocno_t LIKE stdk_t.stdkdocno
 
 
DEFINE g_stdl_d          DYNAMIC ARRAY OF type_g_stdl_d
DEFINE g_stdl_d_t        type_g_stdl_d
DEFINE g_stdl_d_o        type_g_stdl_d
DEFINE g_stdl_d_mask_o   DYNAMIC ARRAY OF type_g_stdl_d #轉換遮罩前資料
DEFINE g_stdl_d_mask_n   DYNAMIC ARRAY OF type_g_stdl_d #轉換遮罩後資料
 
 
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
 
{<section id="astt606.main" >}
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
   LET g_forupd_sql = " SELECT stdksite,'',stdkdocdt,stdkdocno,stdkunit,stdk001,stdk002,stdk003,'',stdk004, 
       '',stdk005,'',stdkstus,stdk006,stdk007,'',stdk008,'',stdk009,'',stdk012,stdk010,stdk011,stdk013, 
       '',stdkownid,'',stdkowndp,'',stdkcrtid,'',stdkcrtdp,'',stdkcrtdt,stdkmodid,'',stdkmoddt,stdkcnfid, 
       '',stdkcnfdt", 
                      " FROM stdk_t",
                      " WHERE stdkent= ? AND stdkdocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt606_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stdksite,t0.stdkdocdt,t0.stdkdocno,t0.stdkunit,t0.stdk001,t0.stdk002, 
       t0.stdk003,t0.stdk004,t0.stdk005,t0.stdkstus,t0.stdk006,t0.stdk007,t0.stdk008,t0.stdk009,t0.stdk012, 
       t0.stdk010,t0.stdk011,t0.stdk013,t0.stdkownid,t0.stdkowndp,t0.stdkcrtid,t0.stdkcrtdp,t0.stdkcrtdt, 
       t0.stdkmodid,t0.stdkmoddt,t0.stdkcnfid,t0.stdkcnfdt,t1.ooefl003 ,t2.pmaal004 ,t3.ooag011 ,t4.ooefl003 , 
       t5.ooail003 ,t6.ooag011 ,t7.ooefl003 ,t8.ooag011 ,t9.ooefl003 ,t10.ooag011 ,t11.ooag011",
               " FROM stdk_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stdksite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stdk003 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t3 ON t3.ooagent="||g_enterprise||" AND t3.ooag001=t0.stdk004  ",
               " LEFT JOIN ooefl_t t4 ON t4.ooeflent="||g_enterprise||" AND t4.ooefl001=t0.stdk005 AND t4.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooail_t t5 ON t5.ooailent="||g_enterprise||" AND t5.ooail001=t0.stdk008 AND t5.ooail002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.stdkownid  ",
               " LEFT JOIN ooefl_t t7 ON t7.ooeflent="||g_enterprise||" AND t7.ooefl001=t0.stdkowndp AND t7.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t8 ON t8.ooagent="||g_enterprise||" AND t8.ooag001=t0.stdkcrtid  ",
               " LEFT JOIN ooefl_t t9 ON t9.ooeflent="||g_enterprise||" AND t9.ooefl001=t0.stdkcrtdp AND t9.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.stdkmodid  ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.stdkcnfid  ",
 
               " WHERE t0.stdkent = " ||g_enterprise|| " AND t0.stdkdocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt606_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt606 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt606_init()   
 
      #進入選單 Menu (="N")
      CALL astt606_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt606
      
   END IF 
   
   CLOSE astt606_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success      #150308-00001#5  By benson 150309
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt606.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt606_init()
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
      CALL cl_set_combo_scc_part('stdkstus','13','N,Y,A,D,R,W,X')
 
      CALL cl_set_combo_scc('stdk001','6091') 
   CALL cl_set_combo_scc('stdl005','6006') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('stdl005','6006','1,2')
   CALL cl_set_combo_scc('b_stdk001','6091') 
   CALL s_aooi500_create_temp() RETURNING l_success    #150308-00001#5  By benson 150309
   #end add-point
   
   #初始化搜尋條件
   CALL astt606_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt606.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt606_ui_dialog()
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
            CALL astt606_insert()
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
         INITIALIZE g_stdk_m.* TO NULL
         CALL g_stdl_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt606_init()
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
               
               CALL astt606_fetch('') # reload data
               LET l_ac = 1
               CALL astt606_ui_detailshow() #Setting the current row 
         
               CALL astt606_idx_chk()
               #NEXT FIELD stdlseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stdl_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt606_idx_chk()
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
               CALL astt606_idx_chk()
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
            CALL astt606_browser_fill("")
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
               CALL astt606_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt606_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt606_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt606_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt606_set_act_visible()   
            CALL astt606_set_act_no_visible()
            IF NOT (g_stdk_m.stdkdocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stdkent = " ||g_enterprise|| " AND",
                                  " stdkdocno = '", g_stdk_m.stdkdocno, "' "
 
               #填到對應位置
               CALL astt606_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "stdk_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stdl_t" 
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
               CALL astt606_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "stdk_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stdl_t" 
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
                  CALL astt606_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt606_fetch("F")
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
               CALL astt606_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt606_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt606_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt606_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt606_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt606_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt606_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt606_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt606_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt606_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt606_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stdl_d)
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
               NEXT FIELD stdlseq
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
               CALL astt606_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt606_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt606_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt606_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt606_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt606_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt606_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt606_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt606_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt606_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt606_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stdk_m.stdkdocdt)
 
 
 
         
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
 
{<section id="astt606.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt606_browser_fill(ps_page_action)
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
   CALL s_aooi500_sql_where(g_prog,'stdksite') RETURNING l_where
   LET g_wc = g_wc," AND ",l_where
   LET l_wc  = g_wc.trim() 
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT stdkdocno ",
                      " FROM stdk_t ",
                      " ",
                      " LEFT JOIN stdl_t ON stdlent = stdkent AND stdkdocno = stdldocno ", "  ",
                      #add-point:browser_fill段sql(stdl_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE stdkent = " ||g_enterprise|| " AND stdlent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stdk_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stdkdocno ",
                      " FROM stdk_t ", 
                      "  ",
                      "  ",
                      " WHERE stdkent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stdk_t")
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
      INITIALIZE g_stdk_m.* TO NULL
      CALL g_stdl_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stdkdocno,t0.stdkdocdt,t0.stdksite,t0.stdk001,t0.stdk002,t0.stdk003,t0.stdk004,t0.stdk005,t0.stdk006,t0.stdk007 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stdkstus,t0.stdkdocno,t0.stdkdocdt,t0.stdksite,t0.stdk001,t0.stdk002, 
          t0.stdk003,t0.stdk004,t0.stdk005,t0.stdk006,t0.stdk007,t1.ooefl003 ,t2.pmaal004 ,t3.ooag011 , 
          t4.ooefl003 ",
                  " FROM stdk_t t0",
                  "  ",
                  "  LEFT JOIN stdl_t ON stdlent = stdkent AND stdkdocno = stdldocno ", "  ", 
                  #add-point:browser_fill段sql(stdl_t1) name="browser_fill.join.stdl_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stdksite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stdk003 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t3 ON t3.ooagent="||g_enterprise||" AND t3.ooag001=t0.stdk004  ",
               " LEFT JOIN ooefl_t t4 ON t4.ooeflent="||g_enterprise||" AND t4.ooefl001=t0.stdk005 AND t4.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.stdkent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stdk_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stdkstus,t0.stdkdocno,t0.stdkdocdt,t0.stdksite,t0.stdk001,t0.stdk002, 
          t0.stdk003,t0.stdk004,t0.stdk005,t0.stdk006,t0.stdk007,t1.ooefl003 ,t2.pmaal004 ,t3.ooag011 , 
          t4.ooefl003 ",
                  " FROM stdk_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stdksite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stdk003 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t3 ON t3.ooagent="||g_enterprise||" AND t3.ooag001=t0.stdk004  ",
               " LEFT JOIN ooefl_t t4 ON t4.ooeflent="||g_enterprise||" AND t4.ooefl001=t0.stdk005 AND t4.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.stdkent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stdk_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY stdkdocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   IF g_cnt <= 0 THEN 
      LET g_cnt = 1
   END IF 
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stdk_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stdkdocno,g_browser[g_cnt].b_stdkdocdt, 
          g_browser[g_cnt].b_stdksite,g_browser[g_cnt].b_stdk001,g_browser[g_cnt].b_stdk002,g_browser[g_cnt].b_stdk003, 
          g_browser[g_cnt].b_stdk004,g_browser[g_cnt].b_stdk005,g_browser[g_cnt].b_stdk006,g_browser[g_cnt].b_stdk007, 
          g_browser[g_cnt].b_stdksite_desc,g_browser[g_cnt].b_stdk003_desc,g_browser[g_cnt].b_stdk004_desc, 
          g_browser[g_cnt].b_stdk005_desc
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
         CALL astt606_browser_mask()
      
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
   
   IF cl_null(g_browser[g_cnt].b_stdkdocno) THEN
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
 
{<section id="astt606.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt606_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stdk_m.stdkdocno = g_browser[g_current_idx].b_stdkdocno   
 
   EXECUTE astt606_master_referesh USING g_stdk_m.stdkdocno INTO g_stdk_m.stdksite,g_stdk_m.stdkdocdt, 
       g_stdk_m.stdkdocno,g_stdk_m.stdkunit,g_stdk_m.stdk001,g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk004, 
       g_stdk_m.stdk005,g_stdk_m.stdkstus,g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdk_m.stdk008,g_stdk_m.stdk009, 
       g_stdk_m.stdk012,g_stdk_m.stdk010,g_stdk_m.stdk011,g_stdk_m.stdk013,g_stdk_m.stdkownid,g_stdk_m.stdkowndp, 
       g_stdk_m.stdkcrtid,g_stdk_m.stdkcrtdp,g_stdk_m.stdkcrtdt,g_stdk_m.stdkmodid,g_stdk_m.stdkmoddt, 
       g_stdk_m.stdkcnfid,g_stdk_m.stdkcnfdt,g_stdk_m.stdksite_desc,g_stdk_m.stdk003_desc,g_stdk_m.stdk004_desc, 
       g_stdk_m.stdk005_desc,g_stdk_m.stdk008_desc,g_stdk_m.stdkownid_desc,g_stdk_m.stdkowndp_desc,g_stdk_m.stdkcrtid_desc, 
       g_stdk_m.stdkcrtdp_desc,g_stdk_m.stdkmodid_desc,g_stdk_m.stdkcnfid_desc
   
   CALL astt606_stdk_t_mask()
   CALL astt606_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt606.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt606_ui_detailshow()
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
 
{<section id="astt606.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt606_ui_browser_refresh()
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
      IF g_browser[l_i].b_stdkdocno = g_stdk_m.stdkdocno 
 
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
 
{<section id="astt606.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt606_construct()
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
   INITIALIZE g_stdk_m.* TO NULL
   CALL g_stdl_d.clear()        
 
   
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
      CONSTRUCT BY NAME g_wc ON stdksite,stdkdocdt,stdkdocno,stdkunit,stdk001,stdk002,stdk003,stdk004, 
          stdk005,stdkstus,stdk006,stdk007,stdk008,stdk009,stdk009_desc,stdk012,stdk010,stdk011,stdk013, 
          ooff013,stdkownid,stdkowndp,stdkcrtid,stdkcrtdp,stdkcrtdt,stdkmodid,stdkmoddt,stdkcnfid,stdkcnfdt 
 
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stdkcrtdt>>----
         AFTER FIELD stdkcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stdkmoddt>>----
         AFTER FIELD stdkmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stdkcnfdt>>----
         AFTER FIELD stdkcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stdkpstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.stdksite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdksite
            #add-point:ON ACTION controlp INFIELD stdksite name="construct.c.stdksite"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
#            CALL q_ooef001()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stdksite',g_site,'c')   #150308-00001#5  By benson add 'c'
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stdksite  #顯示到畫面上
            NEXT FIELD stdksite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdksite
            #add-point:BEFORE FIELD stdksite name="construct.b.stdksite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdksite
            
            #add-point:AFTER FIELD stdksite name="construct.a.stdksite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkdocdt
            #add-point:BEFORE FIELD stdkdocdt name="construct.b.stdkdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdkdocdt
            
            #add-point:AFTER FIELD stdkdocdt name="construct.a.stdkdocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdkdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdkdocdt
            #add-point:ON ACTION controlp INFIELD stdkdocdt name="construct.c.stdkdocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdkdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdkdocno
            #add-point:ON ACTION controlp INFIELD stdkdocno name="construct.c.stdkdocno"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stdkdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdkdocno  #顯示到畫面上
            NEXT FIELD stdkdocno                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkdocno
            #add-point:BEFORE FIELD stdkdocno name="construct.b.stdkdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdkdocno
            
            #add-point:AFTER FIELD stdkdocno name="construct.a.stdkdocno"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdkunit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdkunit
            #add-point:ON ACTION controlp INFIELD stdkunit name="construct.c.stdkunit"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooef001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdkunit  #顯示到畫面上
            NEXT FIELD stdkunit                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkunit
            #add-point:BEFORE FIELD stdkunit name="construct.b.stdkunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdkunit
            
            #add-point:AFTER FIELD stdkunit name="construct.a.stdkunit"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk001
            #add-point:BEFORE FIELD stdk001 name="construct.b.stdk001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk001
            
            #add-point:AFTER FIELD stdk001 name="construct.a.stdk001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdk001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk001
            #add-point:ON ACTION controlp INFIELD stdk001 name="construct.c.stdk001"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdk002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk002
            #add-point:ON ACTION controlp INFIELD stdk002 name="construct.c.stdk002"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stce001_2()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdk002  #顯示到畫面上
            NEXT FIELD stdk002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk002
            #add-point:BEFORE FIELD stdk002 name="construct.b.stdk002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk002
            
            #add-point:AFTER FIELD stdk002 name="construct.a.stdk002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdk003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk003
            #add-point:ON ACTION controlp INFIELD stdk003 name="construct.c.stdk003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_21()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdk003  #顯示到畫面上
            NEXT FIELD stdk003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk003
            #add-point:BEFORE FIELD stdk003 name="construct.b.stdk003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk003
            
            #add-point:AFTER FIELD stdk003 name="construct.a.stdk003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdk004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk004
            #add-point:ON ACTION controlp INFIELD stdk004 name="construct.c.stdk004"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdk004  #顯示到畫面上
            NEXT FIELD stdk004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk004
            #add-point:BEFORE FIELD stdk004 name="construct.b.stdk004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk004
            
            #add-point:AFTER FIELD stdk004 name="construct.a.stdk004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdk005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk005
            #add-point:ON ACTION controlp INFIELD stdk005 name="construct.c.stdk005"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooea001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdk005  #顯示到畫面上
            NEXT FIELD stdk005                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk005
            #add-point:BEFORE FIELD stdk005 name="construct.b.stdk005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk005
            
            #add-point:AFTER FIELD stdk005 name="construct.a.stdk005"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkstus
            #add-point:BEFORE FIELD stdkstus name="construct.b.stdkstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdkstus
            
            #add-point:AFTER FIELD stdkstus name="construct.a.stdkstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdkstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdkstus
            #add-point:ON ACTION controlp INFIELD stdkstus name="construct.c.stdkstus"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk006
            #add-point:BEFORE FIELD stdk006 name="construct.b.stdk006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk006
            
            #add-point:AFTER FIELD stdk006 name="construct.a.stdk006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdk006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk006
            #add-point:ON ACTION controlp INFIELD stdk006 name="construct.c.stdk006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk007
            #add-point:BEFORE FIELD stdk007 name="construct.b.stdk007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk007
            
            #add-point:AFTER FIELD stdk007 name="construct.a.stdk007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdk007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk007
            #add-point:ON ACTION controlp INFIELD stdk007 name="construct.c.stdk007"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdk008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk008
            #add-point:ON ACTION controlp INFIELD stdk008 name="construct.c.stdk008"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            CALL q_ooaj002_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdk008  #顯示到畫面上
            NEXT FIELD stdk008                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk008
            #add-point:BEFORE FIELD stdk008 name="construct.b.stdk008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk008
            
            #add-point:AFTER FIELD stdk008 name="construct.a.stdk008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdk009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk009
            #add-point:ON ACTION controlp INFIELD stdk009 name="construct.c.stdk009"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_site
            CALL q_oodb002_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdk009  #顯示到畫面上
            NEXT FIELD stdk009                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk009
            #add-point:BEFORE FIELD stdk009 name="construct.b.stdk009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk009
            
            #add-point:AFTER FIELD stdk009 name="construct.a.stdk009"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk009_desc
            #add-point:BEFORE FIELD stdk009_desc name="construct.b.stdk009_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk009_desc
            
            #add-point:AFTER FIELD stdk009_desc name="construct.a.stdk009_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdk009_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk009_desc
            #add-point:ON ACTION controlp INFIELD stdk009_desc name="construct.c.stdk009_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk012
            #add-point:BEFORE FIELD stdk012 name="construct.b.stdk012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk012
            
            #add-point:AFTER FIELD stdk012 name="construct.a.stdk012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdk012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk012
            #add-point:ON ACTION controlp INFIELD stdk012 name="construct.c.stdk012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk010
            #add-point:BEFORE FIELD stdk010 name="construct.b.stdk010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk010
            
            #add-point:AFTER FIELD stdk010 name="construct.a.stdk010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdk010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk010
            #add-point:ON ACTION controlp INFIELD stdk010 name="construct.c.stdk010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk011
            #add-point:BEFORE FIELD stdk011 name="construct.b.stdk011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk011
            
            #add-point:AFTER FIELD stdk011 name="construct.a.stdk011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdk011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk011
            #add-point:ON ACTION controlp INFIELD stdk011 name="construct.c.stdk011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk013
            #add-point:BEFORE FIELD stdk013 name="construct.b.stdk013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk013
            
            #add-point:AFTER FIELD stdk013 name="construct.a.stdk013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdk013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk013
            #add-point:ON ACTION controlp INFIELD stdk013 name="construct.c.stdk013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooff013
            #add-point:BEFORE FIELD ooff013 name="construct.b.ooff013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ooff013
            
            #add-point:AFTER FIELD ooff013 name="construct.a.ooff013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.ooff013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooff013
            #add-point:ON ACTION controlp INFIELD ooff013 name="construct.c.ooff013"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdkownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdkownid
            #add-point:ON ACTION controlp INFIELD stdkownid name="construct.c.stdkownid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdkownid  #顯示到畫面上
            NEXT FIELD stdkownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkownid
            #add-point:BEFORE FIELD stdkownid name="construct.b.stdkownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdkownid
            
            #add-point:AFTER FIELD stdkownid name="construct.a.stdkownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdkowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdkowndp
            #add-point:ON ACTION controlp INFIELD stdkowndp name="construct.c.stdkowndp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdkowndp  #顯示到畫面上
            NEXT FIELD stdkowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkowndp
            #add-point:BEFORE FIELD stdkowndp name="construct.b.stdkowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdkowndp
            
            #add-point:AFTER FIELD stdkowndp name="construct.a.stdkowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdkcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdkcrtid
            #add-point:ON ACTION controlp INFIELD stdkcrtid name="construct.c.stdkcrtid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdkcrtid  #顯示到畫面上
            NEXT FIELD stdkcrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkcrtid
            #add-point:BEFORE FIELD stdkcrtid name="construct.b.stdkcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdkcrtid
            
            #add-point:AFTER FIELD stdkcrtid name="construct.a.stdkcrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stdkcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdkcrtdp
            #add-point:ON ACTION controlp INFIELD stdkcrtdp name="construct.c.stdkcrtdp"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdkcrtdp  #顯示到畫面上
            NEXT FIELD stdkcrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkcrtdp
            #add-point:BEFORE FIELD stdkcrtdp name="construct.b.stdkcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdkcrtdp
            
            #add-point:AFTER FIELD stdkcrtdp name="construct.a.stdkcrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkcrtdt
            #add-point:BEFORE FIELD stdkcrtdt name="construct.b.stdkcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdkmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdkmodid
            #add-point:ON ACTION controlp INFIELD stdkmodid name="construct.c.stdkmodid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdkmodid  #顯示到畫面上
            NEXT FIELD stdkmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkmodid
            #add-point:BEFORE FIELD stdkmodid name="construct.b.stdkmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdkmodid
            
            #add-point:AFTER FIELD stdkmodid name="construct.a.stdkmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkmoddt
            #add-point:BEFORE FIELD stdkmoddt name="construct.b.stdkmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stdkcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdkcnfid
            #add-point:ON ACTION controlp INFIELD stdkcnfid name="construct.c.stdkcnfid"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdkcnfid  #顯示到畫面上
            NEXT FIELD stdkcnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkcnfid
            #add-point:BEFORE FIELD stdkcnfid name="construct.b.stdkcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdkcnfid
            
            #add-point:AFTER FIELD stdkcnfid name="construct.a.stdkcnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkcnfdt
            #add-point:BEFORE FIELD stdkcnfdt name="construct.b.stdkcnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stdlseq,stdl001,stdl002,stdl003,stdl004,stdl005,stdl006,stdl007,stdl008, 
          stdl009,stdl010,stdl011,stdl012,stdl013,stdl014,stdl015,stdl016,stdl017,stdl018,stdl019,stdl020, 
          stdl021,stdl022,stdl023,stdlsite,stdlunit
           FROM s_detail1[1].stdlseq,s_detail1[1].stdl001,s_detail1[1].stdl002,s_detail1[1].stdl003, 
               s_detail1[1].stdl004,s_detail1[1].stdl005,s_detail1[1].stdl006,s_detail1[1].stdl007,s_detail1[1].stdl008, 
               s_detail1[1].stdl009,s_detail1[1].stdl010,s_detail1[1].stdl011,s_detail1[1].stdl012,s_detail1[1].stdl013, 
               s_detail1[1].stdl014,s_detail1[1].stdl015,s_detail1[1].stdl016,s_detail1[1].stdl017,s_detail1[1].stdl018, 
               s_detail1[1].stdl019,s_detail1[1].stdl020,s_detail1[1].stdl021,s_detail1[1].stdl022,s_detail1[1].stdl023, 
               s_detail1[1].stdlsite,s_detail1[1].stdlunit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdlseq
            #add-point:BEFORE FIELD stdlseq name="construct.b.page1.stdlseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdlseq
            
            #add-point:AFTER FIELD stdlseq name="construct.a.page1.stdlseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdlseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdlseq
            #add-point:ON ACTION controlp INFIELD stdlseq name="construct.c.page1.stdlseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl001
            #add-point:BEFORE FIELD stdl001 name="construct.b.page1.stdl001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl001
            
            #add-point:AFTER FIELD stdl001 name="construct.a.page1.stdl001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl001
            #add-point:ON ACTION controlp INFIELD stdl001 name="construct.c.page1.stdl001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl002
            #add-point:BEFORE FIELD stdl002 name="construct.b.page1.stdl002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl002
            
            #add-point:AFTER FIELD stdl002 name="construct.a.page1.stdl002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl002
            #add-point:ON ACTION controlp INFIELD stdl002 name="construct.c.page1.stdl002"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stdl003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl003
            #add-point:ON ACTION controlp INFIELD stdl003 name="construct.c.page1.stdl003"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_18()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdl003  #顯示到畫面上
            NEXT FIELD stdl003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl003
            #add-point:BEFORE FIELD stdl003 name="construct.b.page1.stdl003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl003
            
            #add-point:AFTER FIELD stdl003 name="construct.a.page1.stdl003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl004
            #add-point:ON ACTION controlp INFIELD stdl004 name="construct.c.page1.stdl004"
            #此段落由子樣板a08產生
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stdl004  #顯示到畫面上
            NEXT FIELD stdl004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl004
            #add-point:BEFORE FIELD stdl004 name="construct.b.page1.stdl004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl004
            
            #add-point:AFTER FIELD stdl004 name="construct.a.page1.stdl004"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl005
            #add-point:BEFORE FIELD stdl005 name="construct.b.page1.stdl005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl005
            
            #add-point:AFTER FIELD stdl005 name="construct.a.page1.stdl005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl005
            #add-point:ON ACTION controlp INFIELD stdl005 name="construct.c.page1.stdl005"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl006
            #add-point:BEFORE FIELD stdl006 name="construct.b.page1.stdl006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl006
            
            #add-point:AFTER FIELD stdl006 name="construct.a.page1.stdl006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl006
            #add-point:ON ACTION controlp INFIELD stdl006 name="construct.c.page1.stdl006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl007
            #add-point:BEFORE FIELD stdl007 name="construct.b.page1.stdl007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl007
            
            #add-point:AFTER FIELD stdl007 name="construct.a.page1.stdl007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl007
            #add-point:ON ACTION controlp INFIELD stdl007 name="construct.c.page1.stdl007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl008
            #add-point:BEFORE FIELD stdl008 name="construct.b.page1.stdl008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl008
            
            #add-point:AFTER FIELD stdl008 name="construct.a.page1.stdl008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl008
            #add-point:ON ACTION controlp INFIELD stdl008 name="construct.c.page1.stdl008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl009
            #add-point:BEFORE FIELD stdl009 name="construct.b.page1.stdl009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl009
            
            #add-point:AFTER FIELD stdl009 name="construct.a.page1.stdl009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl009
            #add-point:ON ACTION controlp INFIELD stdl009 name="construct.c.page1.stdl009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl010
            #add-point:BEFORE FIELD stdl010 name="construct.b.page1.stdl010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl010
            
            #add-point:AFTER FIELD stdl010 name="construct.a.page1.stdl010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl010
            #add-point:ON ACTION controlp INFIELD stdl010 name="construct.c.page1.stdl010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl011
            #add-point:BEFORE FIELD stdl011 name="construct.b.page1.stdl011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl011
            
            #add-point:AFTER FIELD stdl011 name="construct.a.page1.stdl011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl011
            #add-point:ON ACTION controlp INFIELD stdl011 name="construct.c.page1.stdl011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl012
            #add-point:BEFORE FIELD stdl012 name="construct.b.page1.stdl012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl012
            
            #add-point:AFTER FIELD stdl012 name="construct.a.page1.stdl012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl012
            #add-point:ON ACTION controlp INFIELD stdl012 name="construct.c.page1.stdl012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl013
            #add-point:BEFORE FIELD stdl013 name="construct.b.page1.stdl013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl013
            
            #add-point:AFTER FIELD stdl013 name="construct.a.page1.stdl013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl013
            #add-point:ON ACTION controlp INFIELD stdl013 name="construct.c.page1.stdl013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl014
            #add-point:BEFORE FIELD stdl014 name="construct.b.page1.stdl014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl014
            
            #add-point:AFTER FIELD stdl014 name="construct.a.page1.stdl014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl014
            #add-point:ON ACTION controlp INFIELD stdl014 name="construct.c.page1.stdl014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl015
            #add-point:BEFORE FIELD stdl015 name="construct.b.page1.stdl015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl015
            
            #add-point:AFTER FIELD stdl015 name="construct.a.page1.stdl015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl015
            #add-point:ON ACTION controlp INFIELD stdl015 name="construct.c.page1.stdl015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl016
            #add-point:BEFORE FIELD stdl016 name="construct.b.page1.stdl016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl016
            
            #add-point:AFTER FIELD stdl016 name="construct.a.page1.stdl016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl016
            #add-point:ON ACTION controlp INFIELD stdl016 name="construct.c.page1.stdl016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl017
            #add-point:BEFORE FIELD stdl017 name="construct.b.page1.stdl017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl017
            
            #add-point:AFTER FIELD stdl017 name="construct.a.page1.stdl017"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl017
            #add-point:ON ACTION controlp INFIELD stdl017 name="construct.c.page1.stdl017"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl018
            #add-point:BEFORE FIELD stdl018 name="construct.b.page1.stdl018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl018
            
            #add-point:AFTER FIELD stdl018 name="construct.a.page1.stdl018"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl018
            #add-point:ON ACTION controlp INFIELD stdl018 name="construct.c.page1.stdl018"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl019
            #add-point:BEFORE FIELD stdl019 name="construct.b.page1.stdl019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl019
            
            #add-point:AFTER FIELD stdl019 name="construct.a.page1.stdl019"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl019
            #add-point:ON ACTION controlp INFIELD stdl019 name="construct.c.page1.stdl019"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl020
            #add-point:BEFORE FIELD stdl020 name="construct.b.page1.stdl020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl020
            
            #add-point:AFTER FIELD stdl020 name="construct.a.page1.stdl020"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl020
            #add-point:ON ACTION controlp INFIELD stdl020 name="construct.c.page1.stdl020"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl021
            #add-point:BEFORE FIELD stdl021 name="construct.b.page1.stdl021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl021
            
            #add-point:AFTER FIELD stdl021 name="construct.a.page1.stdl021"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl021
            #add-point:ON ACTION controlp INFIELD stdl021 name="construct.c.page1.stdl021"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl022
            #add-point:BEFORE FIELD stdl022 name="construct.b.page1.stdl022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl022
            
            #add-point:AFTER FIELD stdl022 name="construct.a.page1.stdl022"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl022
            #add-point:ON ACTION controlp INFIELD stdl022 name="construct.c.page1.stdl022"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl023
            #add-point:BEFORE FIELD stdl023 name="construct.b.page1.stdl023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl023
            
            #add-point:AFTER FIELD stdl023 name="construct.a.page1.stdl023"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdl023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl023
            #add-point:ON ACTION controlp INFIELD stdl023 name="construct.c.page1.stdl023"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdlsite
            #add-point:BEFORE FIELD stdlsite name="construct.b.page1.stdlsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdlsite
            
            #add-point:AFTER FIELD stdlsite name="construct.a.page1.stdlsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdlsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdlsite
            #add-point:ON ACTION controlp INFIELD stdlsite name="construct.c.page1.stdlsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdlunit
            #add-point:BEFORE FIELD stdlunit name="construct.b.page1.stdlunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdlunit
            
            #add-point:AFTER FIELD stdlunit name="construct.a.page1.stdlunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stdlunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdlunit
            #add-point:ON ACTION controlp INFIELD stdlunit name="construct.c.page1.stdlunit"
            
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
                  WHEN la_wc[li_idx].tableid = "stdk_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stdl_t" 
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
 
{<section id="astt606.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt606_filter()
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
      CONSTRUCT g_wc_filter ON stdkdocno,stdkdocdt,stdksite,stdk001,stdk002,stdk003,stdk004,stdk005, 
          stdk006,stdk007
                          FROM s_browse[1].b_stdkdocno,s_browse[1].b_stdkdocdt,s_browse[1].b_stdksite, 
                              s_browse[1].b_stdk001,s_browse[1].b_stdk002,s_browse[1].b_stdk003,s_browse[1].b_stdk004, 
                              s_browse[1].b_stdk005,s_browse[1].b_stdk006,s_browse[1].b_stdk007
 
         BEFORE CONSTRUCT
               DISPLAY astt606_filter_parser('stdkdocno') TO s_browse[1].b_stdkdocno
            DISPLAY astt606_filter_parser('stdkdocdt') TO s_browse[1].b_stdkdocdt
            DISPLAY astt606_filter_parser('stdksite') TO s_browse[1].b_stdksite
            DISPLAY astt606_filter_parser('stdk001') TO s_browse[1].b_stdk001
            DISPLAY astt606_filter_parser('stdk002') TO s_browse[1].b_stdk002
            DISPLAY astt606_filter_parser('stdk003') TO s_browse[1].b_stdk003
            DISPLAY astt606_filter_parser('stdk004') TO s_browse[1].b_stdk004
            DISPLAY astt606_filter_parser('stdk005') TO s_browse[1].b_stdk005
            DISPLAY astt606_filter_parser('stdk006') TO s_browse[1].b_stdk006
            DISPLAY astt606_filter_parser('stdk007') TO s_browse[1].b_stdk007
      
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
 
      CALL astt606_filter_show('stdkdocno')
   CALL astt606_filter_show('stdkdocdt')
   CALL astt606_filter_show('stdksite')
   CALL astt606_filter_show('stdk001')
   CALL astt606_filter_show('stdk002')
   CALL astt606_filter_show('stdk003')
   CALL astt606_filter_show('stdk004')
   CALL astt606_filter_show('stdk005')
   CALL astt606_filter_show('stdk006')
   CALL astt606_filter_show('stdk007')
 
END FUNCTION
 
{</section>}
 
{<section id="astt606.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt606_filter_parser(ps_field)
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
 
{<section id="astt606.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt606_filter_show(ps_field)
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
   LET ls_condition = astt606_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt606.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt606_query()
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
   CALL g_stdl_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt606_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt606_browser_fill("")
      CALL astt606_fetch("")
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
      CALL astt606_filter_show('stdkdocno')
   CALL astt606_filter_show('stdkdocdt')
   CALL astt606_filter_show('stdksite')
   CALL astt606_filter_show('stdk001')
   CALL astt606_filter_show('stdk002')
   CALL astt606_filter_show('stdk003')
   CALL astt606_filter_show('stdk004')
   CALL astt606_filter_show('stdk005')
   CALL astt606_filter_show('stdk006')
   CALL astt606_filter_show('stdk007')
   CALL astt606_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt606_fetch("F") 
      #顯示單身筆數
      CALL astt606_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt606.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt606_fetch(p_flag)
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
   
   LET g_stdk_m.stdkdocno = g_browser[g_current_idx].b_stdkdocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt606_master_referesh USING g_stdk_m.stdkdocno INTO g_stdk_m.stdksite,g_stdk_m.stdkdocdt, 
       g_stdk_m.stdkdocno,g_stdk_m.stdkunit,g_stdk_m.stdk001,g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk004, 
       g_stdk_m.stdk005,g_stdk_m.stdkstus,g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdk_m.stdk008,g_stdk_m.stdk009, 
       g_stdk_m.stdk012,g_stdk_m.stdk010,g_stdk_m.stdk011,g_stdk_m.stdk013,g_stdk_m.stdkownid,g_stdk_m.stdkowndp, 
       g_stdk_m.stdkcrtid,g_stdk_m.stdkcrtdp,g_stdk_m.stdkcrtdt,g_stdk_m.stdkmodid,g_stdk_m.stdkmoddt, 
       g_stdk_m.stdkcnfid,g_stdk_m.stdkcnfdt,g_stdk_m.stdksite_desc,g_stdk_m.stdk003_desc,g_stdk_m.stdk004_desc, 
       g_stdk_m.stdk005_desc,g_stdk_m.stdk008_desc,g_stdk_m.stdkownid_desc,g_stdk_m.stdkowndp_desc,g_stdk_m.stdkcrtid_desc, 
       g_stdk_m.stdkcrtdp_desc,g_stdk_m.stdkmodid_desc,g_stdk_m.stdkcnfid_desc
   
   #遮罩相關處理
   LET g_stdk_m_mask_o.* =  g_stdk_m.*
   CALL astt606_stdk_t_mask()
   LET g_stdk_m_mask_n.* =  g_stdk_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt606_set_act_visible()   
   CALL astt606_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   CALL cl_set_act_visible("modify,delete,insert,modify_detail", TRUE)
   IF g_stdk_m.stdkstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stdk_m_t.* = g_stdk_m.*
   LET g_stdk_m_o.* = g_stdk_m.*
   
   LET g_data_owner = g_stdk_m.stdkownid      
   LET g_data_dept  = g_stdk_m.stdkowndp
   
   #重新顯示   
   CALL astt606_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt606.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt606_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_insert      LIKE type_t.num5
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stdl_d.clear()   
 
 
   INITIALIZE g_stdk_m.* TO NULL             #DEFAULT 設定
   
   LET g_stdkdocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stdk_m.stdkownid = g_user
      LET g_stdk_m.stdkowndp = g_dept
      LET g_stdk_m.stdkcrtid = g_user
      LET g_stdk_m.stdkcrtdp = g_dept 
      LET g_stdk_m.stdkcrtdt = cl_get_current()
      LET g_stdk_m.stdkmodid = g_user
      LET g_stdk_m.stdkmoddt = cl_get_current()
      LET g_stdk_m.stdkstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
      
  
      #add-point:單頭預設值 name="insert.default"
      LET g_stdk_m.stdkdocdt = g_today
#      LET g_stdk_m.stdksite = g_site
      LET g_site_flag = FALSE
      CALL s_aooi500_default(g_prog,'stdksite',g_stdk_m.stdksite)
         RETURNING l_insert,g_stdk_m.stdksite
      IF NOT l_insert THEN
         RETURN
      END IF
      LET g_stdk_m.stdkunit = g_site
      LET g_stdk_m.stdk004 = g_user
      SELECT ooag003 INTO g_stdk_m.stdk005
        FROM ooag_t 
       WHERE ooagent = g_enterprise
         AND ooag001 = g_user 
      LET g_stdk_m.stdk006 = g_today
      LET g_stdk_m.stdk007 = g_today
      LET g_stdk_m_t.*  = g_stdk_m.* 
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stdk_m_t.* = g_stdk_m.*
      LET g_stdk_m_o.* = g_stdk_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stdk_m.stdkstus 
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
 
 
 
    
      CALL astt606_input("a")
      
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
         INITIALIZE g_stdk_m.* TO NULL
         INITIALIZE g_stdl_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt606_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stdl_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt606_set_act_visible()   
   CALL astt606_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stdkdocno_t = g_stdk_m.stdkdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stdkent = " ||g_enterprise|| " AND",
                      " stdkdocno = '", g_stdk_m.stdkdocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt606_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt606_cl
   
   CALL astt606_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt606_master_referesh USING g_stdk_m.stdkdocno INTO g_stdk_m.stdksite,g_stdk_m.stdkdocdt, 
       g_stdk_m.stdkdocno,g_stdk_m.stdkunit,g_stdk_m.stdk001,g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk004, 
       g_stdk_m.stdk005,g_stdk_m.stdkstus,g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdk_m.stdk008,g_stdk_m.stdk009, 
       g_stdk_m.stdk012,g_stdk_m.stdk010,g_stdk_m.stdk011,g_stdk_m.stdk013,g_stdk_m.stdkownid,g_stdk_m.stdkowndp, 
       g_stdk_m.stdkcrtid,g_stdk_m.stdkcrtdp,g_stdk_m.stdkcrtdt,g_stdk_m.stdkmodid,g_stdk_m.stdkmoddt, 
       g_stdk_m.stdkcnfid,g_stdk_m.stdkcnfdt,g_stdk_m.stdksite_desc,g_stdk_m.stdk003_desc,g_stdk_m.stdk004_desc, 
       g_stdk_m.stdk005_desc,g_stdk_m.stdk008_desc,g_stdk_m.stdkownid_desc,g_stdk_m.stdkowndp_desc,g_stdk_m.stdkcrtid_desc, 
       g_stdk_m.stdkcrtdp_desc,g_stdk_m.stdkmodid_desc,g_stdk_m.stdkcnfid_desc
   
   
   #遮罩相關處理
   LET g_stdk_m_mask_o.* =  g_stdk_m.*
   CALL astt606_stdk_t_mask()
   LET g_stdk_m_mask_n.* =  g_stdk_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stdk_m.stdksite,g_stdk_m.stdksite_desc,g_stdk_m.stdkdocdt,g_stdk_m.stdkdocno,g_stdk_m.stdkunit, 
       g_stdk_m.stdk001,g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk003_desc,g_stdk_m.stdk004,g_stdk_m.stdk004_desc, 
       g_stdk_m.stdk005,g_stdk_m.stdk005_desc,g_stdk_m.stdkstus,g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdk_m.stdl008_sum, 
       g_stdk_m.stdk008,g_stdk_m.stdk008_desc,g_stdk_m.stdk009,g_stdk_m.stdk009_desc,g_stdk_m.stdk012, 
       g_stdk_m.stdk010,g_stdk_m.stdk011,g_stdk_m.stdk013,g_stdk_m.ooff013,g_stdk_m.stdkownid,g_stdk_m.stdkownid_desc, 
       g_stdk_m.stdkowndp,g_stdk_m.stdkowndp_desc,g_stdk_m.stdkcrtid,g_stdk_m.stdkcrtid_desc,g_stdk_m.stdkcrtdp, 
       g_stdk_m.stdkcrtdp_desc,g_stdk_m.stdkcrtdt,g_stdk_m.stdkmodid,g_stdk_m.stdkmodid_desc,g_stdk_m.stdkmoddt, 
       g_stdk_m.stdkcnfid,g_stdk_m.stdkcnfid_desc,g_stdk_m.stdkcnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stdk_m.stdkownid      
   LET g_data_dept  = g_stdk_m.stdkowndp
   
   #功能已完成,通報訊息中心
   CALL astt606_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt606.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt606_modify()
   #add-point:modify段define(客製用) name="modify.define_customerization"
   
   #end add-point    
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   DEFINE l_wc2_table1          STRING
 
 
   #add-point:modify段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="modify.define"
   DEFINE l_stdl011   LIKE stdl_t.stdl011
   DEFINE l_stdl013   LIKE stdl_t.stdl013
   DEFINE l_stdl014   LIKE stdl_t.stdl014
   DEFINE l_stdl015   LIKE stdl_t.stdl015
   DEFINE l_stdl016   LIKE stdl_t.stdl016
   DEFINE l_stdl018   LIKE stdl_t.stdl018
   DEFINE l_stdl019   LIKE stdl_t.stdl019
   DEFINE l_stdl020   LIKE stdl_t.stdl020
   DEFINE l_stdl021   LIKE stdl_t.stdl021
   DEFINE l_stdl022   LIKE stdl_t.stdl022
   DEFINE l_success   LIKE type_t.num5
   DEFINE l_period    LIKE type_t.num5
   DEFINE l_period2   LIKE type_t.num5      
   #end add-point    
   
   #add-point:Function前置處理  name="modify.pre_function"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stdk_m_t.* = g_stdk_m.*
   LET g_stdk_m_o.* = g_stdk_m.*
   
   IF g_stdk_m.stdkdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stdkdocno_t = g_stdk_m.stdkdocno
 
   CALL s_transaction_begin()
   
   OPEN astt606_cl USING g_enterprise,g_stdk_m.stdkdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt606_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt606_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt606_master_referesh USING g_stdk_m.stdkdocno INTO g_stdk_m.stdksite,g_stdk_m.stdkdocdt, 
       g_stdk_m.stdkdocno,g_stdk_m.stdkunit,g_stdk_m.stdk001,g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk004, 
       g_stdk_m.stdk005,g_stdk_m.stdkstus,g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdk_m.stdk008,g_stdk_m.stdk009, 
       g_stdk_m.stdk012,g_stdk_m.stdk010,g_stdk_m.stdk011,g_stdk_m.stdk013,g_stdk_m.stdkownid,g_stdk_m.stdkowndp, 
       g_stdk_m.stdkcrtid,g_stdk_m.stdkcrtdp,g_stdk_m.stdkcrtdt,g_stdk_m.stdkmodid,g_stdk_m.stdkmoddt, 
       g_stdk_m.stdkcnfid,g_stdk_m.stdkcnfdt,g_stdk_m.stdksite_desc,g_stdk_m.stdk003_desc,g_stdk_m.stdk004_desc, 
       g_stdk_m.stdk005_desc,g_stdk_m.stdk008_desc,g_stdk_m.stdkownid_desc,g_stdk_m.stdkowndp_desc,g_stdk_m.stdkcrtid_desc, 
       g_stdk_m.stdkcrtdp_desc,g_stdk_m.stdkmodid_desc,g_stdk_m.stdkcnfid_desc
   
   #檢查是否允許此動作
   IF NOT astt606_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stdk_m_mask_o.* =  g_stdk_m.*
   CALL astt606_stdk_t_mask()
   LET g_stdk_m_mask_n.* =  g_stdk_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL astt606_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_stdkdocno_t = g_stdk_m.stdkdocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stdk_m.stdkmodid = g_user 
LET g_stdk_m.stdkmoddt = cl_get_current()
LET g_stdk_m.stdkmodid_desc = cl_get_username(g_stdk_m.stdkmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_stdk_m.stdkstus MATCHES "[DR]" THEN
         LET g_stdk_m.stdkstus = "N"
      END IF
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt606_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         LET g_stdk_m.* = g_stdk_m_t.*
         CALL astt606_show()
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code   = 9001 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         EXIT WHILE
      END IF 
      SELECT stce005,stce006,stce007,stce024
        INTO l_stdl013,l_stdl014,l_stdl015,l_stdl016
        FROM stce_t
       WHERE stceent = g_enterprise
         AND stce001 = g_stdk_m.stdk002
      #抓取銷售組織、銷售範圍、銷售渠道、產品組、辦事處資料
      CALL s_astt620_get_salesdata(g_stdk_m.stdk002,'','','')
           RETURNING l_success,l_stdl018,l_stdl019,l_stdl020,
                     l_stdl021,l_stdl022
      CALL s_asti206_get_period(g_stdk_m.stdk006,g_stdk_m.stdk007,l_stdl016,g_prog) 
           RETURNING l_success,l_stdl011,l_period,l_period2
      UPDATE stdl_t SET stdlunit = g_stdk_m.stdksite,
                        stdlsite = g_stdk_m.stdksite,
                        stdl002  = g_stdk_m.stdk003,
                        stdl006  = g_stdk_m.stdk008,
                        stdl007  = g_stdk_m.stdk009,
                        stdl009  = g_stdk_m.stdk006,
                        stdl010  = g_stdk_m.stdk007,
                        stdl011  = l_stdl011,
                        stdl012  = g_stdk_m.stdk002,
                        stdl013  = l_stdl013,
                        stdl014  = l_stdl014,
                        stdl015  = l_stdl015,
                        stdl016  = l_stdl016,
                        stdl018  = l_stdl018,
                        stdl019  = l_stdl019,
                        stdl020  = l_stdl020,
                        stdl021  = l_stdl021,
                        stdl022  = l_stdl022
        WHERE stdlent = g_enterprise
          AND stdldocno = g_stdk_m.stdkdocno   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stdk_m.stdkdocno 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = FALSE 
         CALL cl_err()
         CLOSE astt606_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stdk_t SET (stdkmodid,stdkmoddt) = (g_stdk_m.stdkmodid,g_stdk_m.stdkmoddt)
          WHERE stdkent = g_enterprise AND stdkdocno = g_stdkdocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stdk_m.* = g_stdk_m_t.*
            CALL astt606_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stdk_m.stdkdocno != g_stdk_m_t.stdkdocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stdl_t SET stdldocno = g_stdk_m.stdkdocno
 
          WHERE stdlent = g_enterprise AND stdldocno = g_stdk_m_t.stdkdocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stdl_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stdl_t:",SQLERRMESSAGE 
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
   CALL astt606_set_act_visible()   
   CALL astt606_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stdkent = " ||g_enterprise|| " AND",
                      " stdkdocno = '", g_stdk_m.stdkdocno, "' "
 
   #填到對應位置
   CALL astt606_browser_fill("")
 
   CLOSE astt606_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt606_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt606.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt606_input(p_cmd)
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
   DEFINE l_ooef019              LIKE ooef_t.ooef019
   DEFINE l_success              LIKE type_t.num5
   DEFINE l_oodb005              LIKE oodb_t.oodb005
   DEFINE l_period               LIKE type_t.num5
   DEFINE l_period2              LIKE type_t.num5
   DEFINE l_site                 LIKE stau_t.stausite
   DEFINE l_stae006              LIKE stae_t.stae006
   DEFINE l_dbbc001              LIKE dbbc_t.dbbc001
   DEFINE l_dbbc004              LIKE dbbc_t.dbbc004
   DEFINE l_dbbc005              LIKE dbbc_t.dbbc005
   DEFINE  l_errno               LIKE type_t.chr10
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
   DISPLAY BY NAME g_stdk_m.stdksite,g_stdk_m.stdksite_desc,g_stdk_m.stdkdocdt,g_stdk_m.stdkdocno,g_stdk_m.stdkunit, 
       g_stdk_m.stdk001,g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk003_desc,g_stdk_m.stdk004,g_stdk_m.stdk004_desc, 
       g_stdk_m.stdk005,g_stdk_m.stdk005_desc,g_stdk_m.stdkstus,g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdk_m.stdl008_sum, 
       g_stdk_m.stdk008,g_stdk_m.stdk008_desc,g_stdk_m.stdk009,g_stdk_m.stdk009_desc,g_stdk_m.stdk012, 
       g_stdk_m.stdk010,g_stdk_m.stdk011,g_stdk_m.stdk013,g_stdk_m.ooff013,g_stdk_m.stdkownid,g_stdk_m.stdkownid_desc, 
       g_stdk_m.stdkowndp,g_stdk_m.stdkowndp_desc,g_stdk_m.stdkcrtid,g_stdk_m.stdkcrtid_desc,g_stdk_m.stdkcrtdp, 
       g_stdk_m.stdkcrtdp_desc,g_stdk_m.stdkcrtdt,g_stdk_m.stdkmodid,g_stdk_m.stdkmodid_desc,g_stdk_m.stdkmoddt, 
       g_stdk_m.stdkcnfid,g_stdk_m.stdkcnfid_desc,g_stdk_m.stdkcnfdt
   
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
   LET g_forupd_sql = "SELECT stdlseq,stdl001,stdl002,stdl003,stdl004,stdl005,stdl006,stdl007,stdl008, 
       stdl009,stdl010,stdl011,stdl012,stdl013,stdl014,stdl015,stdl016,stdl017,stdl018,stdl019,stdl020, 
       stdl021,stdl022,stdl023,stdlsite,stdlunit FROM stdl_t WHERE stdlent=? AND stdldocno=? AND stdlseq=?  
       FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt606_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt606_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt606_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stdk_m.stdksite,g_stdk_m.stdkdocdt,g_stdk_m.stdkdocno,g_stdk_m.stdkunit,g_stdk_m.stdk001, 
       g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk004,g_stdk_m.stdk005,g_stdk_m.stdkstus,g_stdk_m.stdk006, 
       g_stdk_m.stdk007,g_stdk_m.stdk008,g_stdk_m.stdk009,g_stdk_m.stdk012,g_stdk_m.stdk010,g_stdk_m.stdk011, 
       g_stdk_m.stdk013,g_stdk_m.ooff013
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   DISPLAY BY NAME g_stdk_m.stdkownid,g_stdk_m.stdkowndp,g_stdk_m.stdkcrtid,g_stdk_m.stdkcrtdp,g_stdk_m.stdkcrtdt,
                   g_stdk_m.stdkmodid,g_stdk_m.stdkmoddt,g_stdk_m.stdkstus,g_stdk_m.stdksite
                          
   SELECT ooef019 INTO l_ooef019
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_stdk_m.stdksite
      
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdksite
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdk_m.stdksite_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdksite_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdkownid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stdk_m.stdkownid_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdkownid_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdkowndp
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdk_m.stdkowndp_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdkowndp_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdkcrtid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stdk_m.stdkcrtid_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdkcrtid_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdkcrtdp
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdk_m.stdkcrtdp_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdkcrtdp_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdkmodid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stdk_m.stdkmodid_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdkmodid_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdkcnfid
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stdk_m.stdkcnfid_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdkcnfid_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdk003
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdk_m.stdk003_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdk003_desc
            
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdk004
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stdk_m.stdk004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdk004_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdk005
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdk_m.stdk005_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdk005_desc
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdk008
   CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdk_m.stdk008_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdk008_desc

   LET g_ref_fields[1] = g_stdk_m.stdk009
   CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdk_m.stdk009_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdk009_desc
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt606.input.head" >}
      #單頭段
      INPUT BY NAME g_stdk_m.stdksite,g_stdk_m.stdkdocdt,g_stdk_m.stdkdocno,g_stdk_m.stdkunit,g_stdk_m.stdk001, 
          g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk004,g_stdk_m.stdk005,g_stdk_m.stdkstus,g_stdk_m.stdk006, 
          g_stdk_m.stdk007,g_stdk_m.stdk008,g_stdk_m.stdk009,g_stdk_m.stdk012,g_stdk_m.stdk010,g_stdk_m.stdk011, 
          g_stdk_m.stdk013,g_stdk_m.ooff013 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt606_cl USING g_enterprise,g_stdk_m.stdkdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt606_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt606_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt606_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            LET l_n = 0          
            SELECT COUNT(*) INTO l_n
              FROM stdl_t 
             WHERE stdlent = g_enterprise
               AND stdldocno = g_stdk_m.stdkdocno 
            IF l_n > 0 THEN 
               CALL cl_set_comp_entry("stdk002,stdk003",FALSE)
            ELSE
               CALL cl_set_comp_entry("stdk002,stdk003",TRUE)
            END IF 
            #end add-point
            CALL astt606_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdksite
            
            #add-point:AFTER FIELD stdksite name="input.a.stdksite"
            IF NOT cl_null(g_stdk_m.stdksite) THEN
               CALL s_aooi500_chk(g_prog,'stdksite',g_stdk_m.stdksite,g_stdk_m.stdksite) RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_stdk_m.stdksite
                  LET g_errparam.code   = l_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()

                  LET g_stdk_m.stdksite = g_stdk_m_t.stdksite
                  CALL s_desc_get_department_desc(g_stdk_m.stdksite) RETURNING g_stdk_m.stdksite_desc
                  DISPLAY BY NAME g_stdk_m.stdksite,g_stdk_m.stdksite_desc
                  NEXT FIELD CURRENT
               END IF

               LET g_site_flag = TRUE
               CALL astt606_set_entry(p_cmd)
               CALL astt606_set_no_entry(p_cmd)
            END IF
            
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdk_m.stdksite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdk_m.stdksite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdk_m.stdksite_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdksite
            #add-point:BEFORE FIELD stdksite name="input.b.stdksite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdksite
            #add-point:ON CHANGE stdksite name="input.g.stdksite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkdocdt
            #add-point:BEFORE FIELD stdkdocdt name="input.b.stdkdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdkdocdt
            
            #add-point:AFTER FIELD stdkdocdt name="input.a.stdkdocdt"
            IF NOT cl_null(g_stdk_m.stdkdocdt) AND NOT cl_null(g_stdk_m.stdk002) THEN 
               SELECT stce024 INTO l_site
                 FROM stce_t
                WHERE stceent = g_enterprise
                  AND stce001 = g_stdk_m.stdk002
               #检查关帐日期
               CALL s_asti206_check(l_site,g_stdk_m.stdkdocdt,'astt606') RETURNING l_success,g_errno
               IF NOT l_success THEN 
                  LET g_stdk_m.stdkdocdt = g_stdk_m_t.stdkdocdt
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD stdkdocdt
               END IF 
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdkdocdt
            #add-point:ON CHANGE stdkdocdt name="input.g.stdkdocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkdocno
            #add-point:BEFORE FIELD stdkdocno name="input.b.stdkdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdkdocno
            
            #add-point:AFTER FIELD stdkdocno name="input.a.stdkdocno"
            #此段落由子樣板a05產生
            #確認資料無重複
            IF  NOT cl_null(g_stdk_m.stdkdocno) THEN 
                LET l_ooef004 = ""
                SELECT ooef004 INTO l_ooef004
                  FROM ooef_t
                 WHERE ooef001 = g_stdk_m.stdksite
                   AND ooefent = g_enterprise
               CALL s_aooi200_chk_slip(g_stdk_m.stdksite,l_ooef004,g_stdk_m.stdkdocno,g_prog) RETURNING l_success
               IF NOT l_success THEN
                  LET g_stdk_m.stdkdocno = g_stdkdocno_t
                  NEXT FIELD CURRENT
               END IF
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stdk_m.stdkdocno != g_stdkdocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stdk_t WHERE "||"stdkent = '" ||g_enterprise|| "' AND "||"stdkdocno = '"||g_stdk_m.stdkdocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdkdocno
            #add-point:ON CHANGE stdkdocno name="input.g.stdkdocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkunit
            #add-point:BEFORE FIELD stdkunit name="input.b.stdkunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdkunit
            
            #add-point:AFTER FIELD stdkunit name="input.a.stdkunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdkunit
            #add-point:ON CHANGE stdkunit name="input.g.stdkunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk001
            #add-point:BEFORE FIELD stdk001 name="input.b.stdk001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk001
            
            #add-point:AFTER FIELD stdk001 name="input.a.stdk001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdk001
            #add-point:ON CHANGE stdk001 name="input.g.stdk001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk002
            #add-point:BEFORE FIELD stdk002 name="input.b.stdk002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk002
            
            #add-point:AFTER FIELD stdk002 name="input.a.stdk002"
            IF NOT cl_null(g_stdk_m.stdk002) THEN
               IF g_stdk_m.stdk002 <> g_stdk_m_o.stdk002 OR cl_null(g_stdk_m_o.stdk002) THEN   #160824-00007#199 161122 by lori add   
                  CALL astt606_stdk002_chk() 
                  IF NOT cl_null(g_errno) THEN 
                     LET g_stdk_m.stdk002 = g_stdk_m_o.stdk002   #160824-00007#199 161122 by lori mod:g_stdk_m_t.stdk002->g_stdk_m_o.stdk002
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     DISPLAY BY NAME g_stdk_m.stdk002
                     NEXT FIELD stdk002
                  END IF 
                  IF NOT cl_null(g_stdk_m.stdkdocdt) THEN 
                     SELECT stce024 INTO l_site
                       FROM stce_t
                      WHERE stceent = g_enterprise
                        AND stce001 = g_stdk_m.stdk002
                     #检查关帐日期
                     CALL s_asti206_check(l_site,g_stdk_m.stdkdocdt,'astt606') RETURNING l_success,g_errno
                     IF NOT l_success THEN 
                        LET g_stdk_m.stdk002 = g_stdk_m_o.stdk002   #160824-00007#199 161122 by lori mod:g_stdk_m_t.stdk002->g_stdk_m_o.stdk002
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = g_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        DISPLAY BY NAME g_stdk_m.stdk002
                        NEXT FIELD stdk002
                     END IF
                  END IF
                  #160824-00007#199 161122 by lori mark---(S)                  
                  #IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stdk_m.stdk002 != g_stdk_m_t.stdk002 )) THEN    
                  #   CALL astt606_stdk002_display()
                  #END IF   
                  #160824-00007#199 161122 by lori mark---(E)
                  IF NOT cl_null(g_stdk_m.stdk003) THEN 
                     CALL astt606_stdk003_chk()
                     IF NOT cl_null(g_errno) THEN 
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = g_errno
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        
                        #160824-00007#199 161122 by lori mark---(S)
                        #LET g_stdk_m.stdk002 = g_stdk_m_t.stdk002
                        #LET g_stdk_m.stdk003 = g_stdk_m_t.stdk003
                        #LET g_stdk_m.stdk006 = g_stdk_m_t.stdk006
                        #LET g_stdk_m.stdk007 = g_stdk_m_t.stdk007
                        #LET g_stdk_m.stdk008 = g_stdk_m_t.stdk008
                        #LET g_stdk_m.stdk009 = g_stdk_m_t.stdk009
                        #INITIALIZE g_ref_fields TO NULL
                        #LET g_ref_fields[1] = g_stdk_m.stdk003
                        #CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
                        #LET g_stdk_m.stdk003_desc = '', g_rtn_fields[1] , ''
                        #DISPLAY BY NAME g_stdk_m.stdk003_desc
                        #DISPLAY BY NAME g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk006,g_stdk_m.stdk007,
                        #                g_stdk_m.stdk008,g_stdk_m.stdk009
                        #160824-00007#199 161122 by lori mark---(S)                
                        
                        LET g_stdk_m.stdk002 = g_stdk_m_o.stdk002   #160824-00007#199 161122 by lori add
                        NEXT FIELD stdk002
                     END IF
                  END IF 
                  
                  CALL astt606_stdk002_display()   #160824-00007#199 161122 by lori add   
               END IF                              #160824-00007#199 161122 by lori add   
            END IF 
            
            LET g_stdk_m_o.stdk002 = g_stdk_m.stdk002   #160824-00007#199 161122 by lori add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdk002
            #add-point:ON CHANGE stdk002 name="input.g.stdk002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk003
            
            #add-point:AFTER FIELD stdk003 name="input.a.stdk003"
            IF NOT cl_null(g_stdk_m.stdk003) THEN
               IF g_stdk_m.stdk003 <> g_stdk_m_o.stdk003 OR cl_null(g_stdk_m_o.stdk003) THEN   #160824-00007#199 161122 by lori add
                  LET g_errshow = '1'
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stdk_m.stdk003
                  LET g_errshow = TRUE   #160318-00025#49
                  LET g_chkparam.err_str[1] = "apm-00638:sub-01302|adbm200|",cl_get_progname("adbm200",g_lang,"2"),"|:EXEPROGadbm200"    #160318-00025#49
                  IF NOT cl_chk_exist("v_pmaa001_17") THEN
                     LET g_stdk_m.stdk003 = g_stdk_m_o.stdk003   #160824-00007#199 161122 by lori mod:g_stdk_m_t.stdk003->g_stdk_m_o.stdk003
                     NEXT FIELD stdk003
                  END IF 
                  CALL astt606_stdk003_chk()
                  IF NOT cl_null(g_errno) THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_stdk_m.stdk003 = g_stdk_m_o.stdk003   #160824-00007#199 161122 by lori mod:g_stdk_m_t.stdk003->g_stdk_m_o.stdk003
                     NEXT FIELD stdk003
                  END IF 
           #ELSE   #160824-00007#199 161122 by lori mark
              #CALL astt606_stdk003_null_chk()
              #IF NOT cl_null(g_errno) THEN 
              #   INITIALIZE g_errparam TO NULL
              #   LET g_errparam.code = g_errno
              #   LET g_errparam.extend = ''
              #   LET g_errparam.popup = TRUE
              #   CALL cl_err()
              #   NEXT FIELD stdk003
              #END IF   
               END IF   #160824-00007#199 161122 by lori add
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdk_m.stdk003
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdk_m.stdk003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdk_m.stdk003_desc

            LET g_stdk_m_o.stdk003 = g_stdk_m.stdk003   #160824-00007#199 161122 by lori add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk003
            #add-point:BEFORE FIELD stdk003 name="input.b.stdk003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdk003
            #add-point:ON CHANGE stdk003 name="input.g.stdk003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk004
            
            #add-point:AFTER FIELD stdk004 name="input.a.stdk004"
            IF NOT cl_null(g_stdk_m.stdk004) THEN 
               CALL astt606_stdk004_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_stdk_m.stdk004 = g_stdk_m_t.stdk004
                  NEXT FIELD stdk004
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdk_m.stdk004
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stdk_m.stdk004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdk_m.stdk004_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk004
            #add-point:BEFORE FIELD stdk004 name="input.b.stdk004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdk004
            #add-point:ON CHANGE stdk004 name="input.g.stdk004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk005
            
            #add-point:AFTER FIELD stdk005 name="input.a.stdk005"
            IF NOT cl_null(g_stdk_m.stdk005) THEN 
               CALL astt606_stdk005_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_stdk_m.stdk005 = g_stdk_m_t.stdk005
                  NEXT FIELD stdk005
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdk_m.stdk005
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdk_m.stdk005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdk_m.stdk005_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk005
            #add-point:BEFORE FIELD stdk005 name="input.b.stdk005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdk005
            #add-point:ON CHANGE stdk005 name="input.g.stdk005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdkstus
            #add-point:BEFORE FIELD stdkstus name="input.b.stdkstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdkstus
            
            #add-point:AFTER FIELD stdkstus name="input.a.stdkstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdkstus
            #add-point:ON CHANGE stdkstus name="input.g.stdkstus"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk006
            #add-point:BEFORE FIELD stdk006 name="input.b.stdk006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk006
            
            #add-point:AFTER FIELD stdk006 name="input.a.stdk006"
            IF NOT cl_null(g_stdk_m.stdk006) THEN 
               IF g_stdk_m.stdk006 <> g_stdk_m_o.stdk006 OR cl_null(g_stdk_m_o.stdk006) THEN   #160824-00007#1991 161122 by lori add
                  CALL astt606_stdk006_stdk007_chk()
                  IF NOT cl_null(g_errno) THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_stdk_m.stdk006 = g_stdk_m_o.stdk006   #160824-00007#1991 161122 by lori mod:g_stdk_m_t.stdk006->g_stdk_m_o.stdk006
                     NEXT FIELD stdk006
                  END IF 
               END IF   #160824-00007#1991 161122 by lori add
            END IF 
            
            LET g_stdk_m_o.stdk006 = g_stdk_m.stdk006   #160824-00007#1991 161122 by lori add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdk006
            #add-point:ON CHANGE stdk006 name="input.g.stdk006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk007
            #add-point:BEFORE FIELD stdk007 name="input.b.stdk007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk007
            
            #add-point:AFTER FIELD stdk007 name="input.a.stdk007"
            IF NOT cl_null(g_stdk_m.stdk007) THEN 
               IF g_stdk_m.stdk007 <> g_stdk_m_o.stdk007 OR cl_null(g_stdk_m_o.stdk007) THEN    #160824-00007#1991 161122 by lori add
                  CALL astt606_stdk006_stdk007_chk()
                  IF NOT cl_null(g_errno) THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_stdk_m.stdk007 = g_stdk_m_o.stdk007   #160824-00007#1991 161122 by lori mod:g_stdk_m_o.stdk007->g_stdk_m_t.stdk007
                     NEXT FIELD stdk007
                  END IF
               END IF   #160824-00007#1991 161122 by lori add                  
            END IF 
            
            LET g_stdk_m_o.stdk007 = g_stdk_m.stdk007   #160824-00007#1991 161122 by lori add
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdk007
            #add-point:ON CHANGE stdk007 name="input.g.stdk007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk008
            
            #add-point:AFTER FIELD stdk008 name="input.a.stdk008"
            IF NOT cl_null(g_stdk_m.stdk008) THEN 
               IF g_stdk_m.stdk008 <> g_stdk_m_o.stdk008 OR cl_null(g_stdk_m_o.stdk008) THEN   #160824-00007#1991 161122 by lori add
                  CALL astt606_stdk008_chk()
                  IF NOT cl_null(g_errno) THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_stdk_m.stdk008 = g_stdk_m_t.stdk008   #160824-00007#1991 161122 by lori mod:g_stdk_m_t.stdk008->g_stdk_m_o.stdk008
                     NEXT FIELD stdk008
                  END IF
               END IF   #160824-00007#1991 161122 by lori add                  
            END IF 
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdk_m.stdk008
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdk_m.stdk008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdk_m.stdk008_desc

            LET g_stdk_m_o.stdk008 = g_stdk_m.stdk008  #160824-00007#1991 161122 by lori add
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk008
            #add-point:BEFORE FIELD stdk008 name="input.b.stdk008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdk008
            #add-point:ON CHANGE stdk008 name="input.g.stdk008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk009
            
            #add-point:AFTER FIELD stdk009 name="input.a.stdk009"
            IF NOT cl_null(g_stdk_m.stdk009) THEN 
               IF g_stdk_m.stdk009 <> g_stdk_m_o.stdk009 OR cl_null(g_stdk_m_o.stdk009) THEN   #160824-00007#1991 161122 by lori add
                  CALL astt606_stdk009_chk()
                  IF NOT cl_null(g_errno) THEN 
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_stdk_m.stdk009 = g_stdk_m_o.stdk009   #160824-00007#1991 161122 by lori mod:g_stdk_m_t.stdk009->g_stdk_m_o.stdk009
                     NEXT FIELD stdk009
                  END IF 
               END IF   #160824-00007#1991 161122 by lori add   
            END IF 
            LET g_ref_fields[1] = g_stdk_m.stdk009
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdk_m.stdk009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdk_m.stdk009_desc
            
            LET g_stdk_m_o.stdk009 = g_stdk_m.stdk009   #160824-00007#1991 161122 by lori add 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk009
            #add-point:BEFORE FIELD stdk009 name="input.b.stdk009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdk009
            #add-point:ON CHANGE stdk009 name="input.g.stdk009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk012
            #add-point:BEFORE FIELD stdk012 name="input.b.stdk012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk012
            
            #add-point:AFTER FIELD stdk012 name="input.a.stdk012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdk012
            #add-point:ON CHANGE stdk012 name="input.g.stdk012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk010
            #add-point:BEFORE FIELD stdk010 name="input.b.stdk010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk010
            
            #add-point:AFTER FIELD stdk010 name="input.a.stdk010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdk010
            #add-point:ON CHANGE stdk010 name="input.g.stdk010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk011
            #add-point:BEFORE FIELD stdk011 name="input.b.stdk011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk011
            
            #add-point:AFTER FIELD stdk011 name="input.a.stdk011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdk011
            #add-point:ON CHANGE stdk011 name="input.g.stdk011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdk013
            #add-point:BEFORE FIELD stdk013 name="input.b.stdk013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdk013
            
            #add-point:AFTER FIELD stdk013 name="input.a.stdk013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdk013
            #add-point:ON CHANGE stdk013 name="input.g.stdk013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD ooff013
            #add-point:BEFORE FIELD ooff013 name="input.b.ooff013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD ooff013
            
            #add-point:AFTER FIELD ooff013 name="input.a.ooff013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE ooff013
            #add-point:ON CHANGE ooff013 name="input.g.ooff013"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stdksite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdksite
            #add-point:ON ACTION controlp INFIELD stdksite name="input.c.stdksite"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdk_m.stdksite            #給予default值

            #給予arg

            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stdksite',g_stdk_m.stdksite,'i')   #150308-00001#5  By benson add 'i'
            CALL q_ooef001_24()                                #呼叫開窗

            LET g_stdk_m.stdksite = g_qryparam.return1              #將開窗取得的值回傳到變數
            DISPLAY g_stdk_m.stdksite TO stdksite             #顯示到畫面上
            CALL s_desc_get_department_desc(g_stdk_m.stdksite)
               RETURNING g_stdk_m.stdksite_desc
            DISPLAY BY NAME g_stdk_m.stdksite_desc

            NEXT FIELD stdksite
            #END add-point
 
 
         #Ctrlp:input.c.stdkdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdkdocdt
            #add-point:ON ACTION controlp INFIELD stdkdocdt name="input.c.stdkdocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdkdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdkdocno
            #add-point:ON ACTION controlp INFIELD stdkdocno name="input.c.stdkdocno"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdk_m.stdkdocno             #給予default值
            LET l_ooef004 = ""
            SELECT ooef004 INTO l_ooef004
              FROM ooef_t
             WHERE ooef001 = g_stdk_m.stdksite
               AND ooefent = g_enterprise
            #給予arg
            LET g_qryparam.arg1 = l_ooef004 #
            #LET g_qryparam.arg2 = "astt606" #   #160705-00042#5 160711 by sakura mark
            LET g_qryparam.arg2 = g_prog         #160705-00042#5 160711 by sakura add
            
            CALL q_ooba002_1()                                #呼叫開窗

            LET g_stdk_m.stdkdocno = g_qryparam.return1              

            DISPLAY g_stdk_m.stdkdocno TO stdkdocno              #

            NEXT FIELD stdkdocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdkunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdkunit
            #add-point:ON ACTION controlp INFIELD stdkunit name="input.c.stdkunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdk001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk001
            #add-point:ON ACTION controlp INFIELD stdk001 name="input.c.stdk001"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdk002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk002
            #add-point:ON ACTION controlp INFIELD stdk002 name="input.c.stdk002"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdk_m.stdk002             #給予default值
            LET g_qryparam.default2 = "" #g_stdk_m.stce007 #結算類型
            LET g_qryparam.default3 = "" #g_stdk_m.stce008 #对象类型
            LET g_qryparam.default4 = "" #g_stdk_m.stce009 #经销商編號
            LET g_qryparam.default5 = "" #g_stdk_m.stce001 #合約編號
            LET g_qryparam.default6 = "" #g_stdk_m.stce005 #經營方式
            LET g_qryparam.default7 = "" #g_stdk_m.stce006 #結算方式
            #給予arg
            LET g_qryparam.arg1 = "" #

            LET g_qryparam.where = " stce008 = '1' "
            CALL q_stce001_2()                                #呼叫開窗

            LET g_stdk_m.stdk002 = g_qryparam.return1              
            #LET g_stdk_m.stce007 = g_qryparam.return2 
            #LET g_stdk_m.stce008 = g_qryparam.return3 
            #LET g_stdk_m.stce009 = g_qryparam.return4 
            #LET g_stdk_m.stce001 = g_qryparam.return5 
            #LET g_stdk_m.stce005 = g_qryparam.return6 
            #LET g_stdk_m.stce006 = g_qryparam.return7 
            DISPLAY g_stdk_m.stdk002 TO stdk002              #
            #DISPLAY g_stdk_m.stce007 TO stce007 #結算類型
            #DISPLAY g_stdk_m.stce008 TO stce008 #对象类型
            #DISPLAY g_stdk_m.stce009 TO stce009 #经销商編號
            #DISPLAY g_stdk_m.stce001 TO stce001 #合約編號
            #DISPLAY g_stdk_m.stce005 TO stce005 #經營方式
            #DISPLAY g_stdk_m.stce006 TO stce006 #結算方式
            NEXT FIELD stdk002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdk003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk003
            #add-point:ON ACTION controlp INFIELD stdk003 name="input.c.stdk003"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdk_m.stdk003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_pmaa001_21()                                #呼叫開窗

            LET g_stdk_m.stdk003 = g_qryparam.return1              

            DISPLAY g_stdk_m.stdk003 TO stdk003              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdk_m.stdk003
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdk_m.stdk003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdk_m.stdk003_desc
            NEXT FIELD stdk003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdk004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk004
            #add-point:ON ACTION controlp INFIELD stdk004 name="input.c.stdk004"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdk_m.stdk004             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooag001()                                #呼叫開窗

            LET g_stdk_m.stdk004 = g_qryparam.return1              

            DISPLAY g_stdk_m.stdk004 TO stdk004              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdk_m.stdk004
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stdk_m.stdk004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdk_m.stdk004_desc
            NEXT FIELD stdk004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdk005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk005
            #add-point:ON ACTION controlp INFIELD stdk005 name="input.c.stdk005"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdk_m.stdk005             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            
            CALL q_ooea001_1()                                #呼叫開窗

            LET g_stdk_m.stdk005 = g_qryparam.return1              

            DISPLAY g_stdk_m.stdk005 TO stdk005              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdk_m.stdk005
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdk_m.stdk005_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdk_m.stdk005_desc

            NEXT FIELD stdk005                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdkstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdkstus
            #add-point:ON ACTION controlp INFIELD stdkstus name="input.c.stdkstus"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdk006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk006
            #add-point:ON ACTION controlp INFIELD stdk006 name="input.c.stdk006"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdk007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk007
            #add-point:ON ACTION controlp INFIELD stdk007 name="input.c.stdk007"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdk008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk008
            #add-point:ON ACTION controlp INFIELD stdk008 name="input.c.stdk008"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdk_m.stdk008             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_stdk_m.stdksite

            
            CALL q_ooaj002_1()                                #呼叫開窗

            LET g_stdk_m.stdk008 = g_qryparam.return1              

            DISPLAY g_stdk_m.stdk008 TO stdk008              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdk_m.stdk008
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdk_m.stdk008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdk_m.stdk008_desc
            NEXT FIELD stdk008                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdk009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk009
            #add-point:ON ACTION controlp INFIELD stdk009 name="input.c.stdk009"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdk_m.stdk009             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_stdk_m.stdksite

            
            CALL q_oodb002_1()                                #呼叫開窗

            LET g_stdk_m.stdk009 = g_qryparam.return1              

            DISPLAY g_stdk_m.stdk009 TO stdk009              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdk_m.stdk009
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdk_m.stdk009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdk_m.stdk009_desc
            NEXT FIELD stdk009                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stdk012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk012
            #add-point:ON ACTION controlp INFIELD stdk012 name="input.c.stdk012"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdk010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk010
            #add-point:ON ACTION controlp INFIELD stdk010 name="input.c.stdk010"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdk011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk011
            #add-point:ON ACTION controlp INFIELD stdk011 name="input.c.stdk011"
            
            #END add-point
 
 
         #Ctrlp:input.c.stdk013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdk013
            #add-point:ON ACTION controlp INFIELD stdk013 name="input.c.stdk013"
            
            #END add-point
 
 
         #Ctrlp:input.c.ooff013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD ooff013
            #add-point:ON ACTION controlp INFIELD ooff013 name="input.c.ooff013"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stdk_m.stdkdocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_stdk_m.stdksite,g_stdk_m.stdkdocno,g_stdk_m.stdkdocdt,g_prog) RETURNING l_success,g_stdk_m.stdkdocno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_stdk_m.stdkdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD stdkdocno
               END IF
               #end add-point
               
               INSERT INTO stdk_t (stdkent,stdksite,stdkdocdt,stdkdocno,stdkunit,stdk001,stdk002,stdk003, 
                   stdk004,stdk005,stdkstus,stdk006,stdk007,stdk008,stdk009,stdk012,stdk010,stdk011, 
                   stdk013,stdkownid,stdkowndp,stdkcrtid,stdkcrtdp,stdkcrtdt,stdkmodid,stdkmoddt,stdkcnfid, 
                   stdkcnfdt)
               VALUES (g_enterprise,g_stdk_m.stdksite,g_stdk_m.stdkdocdt,g_stdk_m.stdkdocno,g_stdk_m.stdkunit, 
                   g_stdk_m.stdk001,g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk004,g_stdk_m.stdk005, 
                   g_stdk_m.stdkstus,g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdk_m.stdk008,g_stdk_m.stdk009, 
                   g_stdk_m.stdk012,g_stdk_m.stdk010,g_stdk_m.stdk011,g_stdk_m.stdk013,g_stdk_m.stdkownid, 
                   g_stdk_m.stdkowndp,g_stdk_m.stdkcrtid,g_stdk_m.stdkcrtdp,g_stdk_m.stdkcrtdt,g_stdk_m.stdkmodid, 
                   g_stdk_m.stdkmoddt,g_stdk_m.stdkcnfid,g_stdk_m.stdkcnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stdk_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               IF NOT cl_null(g_stdk_m.stdkdocno) THEN
                  IF NOT cl_null(g_stdk_m.ooff013) THEN
                     LET l_success = ''
                     CALL s_aooi360_gen('2',g_stdk_m.stdkdocno,'','','','','','','','','','4',g_stdk_m.ooff013) RETURNING l_success
                     IF NOT l_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = SQLCA.sqlcode
                        LET g_errparam.extend = "ooff_t"
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        CONTINUE DIALOG
                     END IF
                  ELSE
                     CALL s_aooi360_del('2',g_stdk_m.stdkdocno,'','','','','','','','','','4') RETURNING l_success
                     IF NOT l_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = SQLCA.sqlcode
                        LET g_errparam.extend = "ooff_t"
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        CONTINUE DIALOG
                     END IF
                  END IF
               END IF 
               #end add-point
               
               
               
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astt606_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt606_b_fill()
                  CALL astt606_b_fill2('0')
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
               CALL astt606_stdk_t_mask_restore('restore_mask_o')
               
               UPDATE stdk_t SET (stdksite,stdkdocdt,stdkdocno,stdkunit,stdk001,stdk002,stdk003,stdk004, 
                   stdk005,stdkstus,stdk006,stdk007,stdk008,stdk009,stdk012,stdk010,stdk011,stdk013, 
                   stdkownid,stdkowndp,stdkcrtid,stdkcrtdp,stdkcrtdt,stdkmodid,stdkmoddt,stdkcnfid,stdkcnfdt) = (g_stdk_m.stdksite, 
                   g_stdk_m.stdkdocdt,g_stdk_m.stdkdocno,g_stdk_m.stdkunit,g_stdk_m.stdk001,g_stdk_m.stdk002, 
                   g_stdk_m.stdk003,g_stdk_m.stdk004,g_stdk_m.stdk005,g_stdk_m.stdkstus,g_stdk_m.stdk006, 
                   g_stdk_m.stdk007,g_stdk_m.stdk008,g_stdk_m.stdk009,g_stdk_m.stdk012,g_stdk_m.stdk010, 
                   g_stdk_m.stdk011,g_stdk_m.stdk013,g_stdk_m.stdkownid,g_stdk_m.stdkowndp,g_stdk_m.stdkcrtid, 
                   g_stdk_m.stdkcrtdp,g_stdk_m.stdkcrtdt,g_stdk_m.stdkmodid,g_stdk_m.stdkmoddt,g_stdk_m.stdkcnfid, 
                   g_stdk_m.stdkcnfdt)
                WHERE stdkent = g_enterprise AND stdkdocno = g_stdkdocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stdk_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               IF NOT cl_null(g_stdk_m.stdkdocno) THEN
                  IF NOT cl_null(g_stdk_m.ooff013) THEN
                     LET l_success = ''
                     CALL s_aooi360_gen('2',g_stdk_m.stdkdocno,'','','','','','','','','','4',g_stdk_m.ooff013) RETURNING l_success
                     IF NOT l_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = SQLCA.sqlcode
                        LET g_errparam.extend = "ooff_t"
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        CONTINUE DIALOG
                     END IF
                  ELSE
                     CALL s_aooi360_del('2',g_stdk_m.stdkdocno,'','','','','','','','','','4') RETURNING l_success
                     IF NOT l_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = SQLCA.sqlcode
                        LET g_errparam.extend = "ooff_t"
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        CONTINUE DIALOG
                     END IF
                  END IF
               END IF 
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt606_stdk_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stdk_m_t)
               LET g_log2 = util.JSON.stringify(g_stdk_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stdkdocno_t = g_stdk_m.stdkdocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt606.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stdl_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stdl_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt606_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stdl_d.getLength()
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
            OPEN astt606_cl USING g_enterprise,g_stdk_m.stdkdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt606_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt606_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stdl_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stdl_d[l_ac].stdlseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stdl_d_t.* = g_stdl_d[l_ac].*  #BACKUP
               LET g_stdl_d_o.* = g_stdl_d[l_ac].*  #BACKUP
               CALL astt606_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt606_set_no_entry_b(l_cmd)
               IF NOT astt606_lock_b("stdl_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt606_bcl INTO g_stdl_d[l_ac].stdlseq,g_stdl_d[l_ac].stdl001,g_stdl_d[l_ac].stdl002, 
                      g_stdl_d[l_ac].stdl003,g_stdl_d[l_ac].stdl004,g_stdl_d[l_ac].stdl005,g_stdl_d[l_ac].stdl006, 
                      g_stdl_d[l_ac].stdl007,g_stdl_d[l_ac].stdl008,g_stdl_d[l_ac].stdl009,g_stdl_d[l_ac].stdl010, 
                      g_stdl_d[l_ac].stdl011,g_stdl_d[l_ac].stdl012,g_stdl_d[l_ac].stdl013,g_stdl_d[l_ac].stdl014, 
                      g_stdl_d[l_ac].stdl015,g_stdl_d[l_ac].stdl016,g_stdl_d[l_ac].stdl017,g_stdl_d[l_ac].stdl018, 
                      g_stdl_d[l_ac].stdl019,g_stdl_d[l_ac].stdl020,g_stdl_d[l_ac].stdl021,g_stdl_d[l_ac].stdl022, 
                      g_stdl_d[l_ac].stdl023,g_stdl_d[l_ac].stdlsite,g_stdl_d[l_ac].stdlunit
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stdl_d_t.stdlseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stdl_d_mask_o[l_ac].* =  g_stdl_d[l_ac].*
                  CALL astt606_stdl_t_mask()
                  LET g_stdl_d_mask_n[l_ac].* =  g_stdl_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt606_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
            CALL cl_set_comp_entry('stdl005',TRUE)
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
            INITIALIZE g_stdl_d[l_ac].* TO NULL 
            INITIALIZE g_stdl_d_t.* TO NULL 
            INITIALIZE g_stdl_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stdl_d[l_ac].stdl008 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            SELECT MAX(stdlseq) + 1 INTO g_stdl_d[l_ac].stdlseq
              FROM stdl_t
             WHERE stdlent = g_enterprise
               AND stdldocno = g_stdk_m.stdkdocno
            IF cl_null(g_stdl_d[l_ac].stdlseq) THEN 
               LET g_stdl_d[l_ac].stdlseq = 1
            END IF 

            LET g_stdl_d[l_ac].stdlunit = g_stdk_m.stdksite
            LET g_stdl_d[l_ac].stdlsite = g_stdk_m.stdksite
            
            LET g_stdl_d[l_ac].stdl002  = g_stdk_m.stdk003
            LET g_stdl_d[l_ac].stdl006  = g_stdk_m.stdk008
            LET g_stdl_d[l_ac].stdl007  = g_stdk_m.stdk009
            LET g_stdl_d[l_ac].stdl009  = g_stdk_m.stdk006
            LET g_stdl_d[l_ac].stdl010  = g_stdk_m.stdk007
            LET g_stdl_d[l_ac].stdl012  = g_stdk_m.stdk002
            #抓取结算中心
            SELECT stce005,stce006,stce007,stce024
              INTO g_stdl_d[l_ac].stdl013,g_stdl_d[l_ac].stdl014,g_stdl_d[l_ac].stdl015,
                   g_stdl_d[l_ac].stdl016
              FROM stce_t
             WHERE stceent = g_enterprise
               AND stce001 = g_stdk_m.stdk002
#            #销售组织，渠道
#            SELECT stce005,stce006,stce007,stce024,stce025,stce012
#              INTO g_stdl_d[l_ac].stdl013,g_stdl_d[l_ac].stdl014,g_stdl_d[l_ac].stdl015,
#                   g_stdl_d[l_ac].stdl016,g_stdl_d[l_ac].stdl019,g_stdl_d[l_ac].stdl020
#              FROM stce_t
#             WHERE stceent = g_enterprise
#               AND stce001 = g_stdk_m.stdk002
#            #根据销售组织，渠道抓取销售范围
#            SELECT dbbc001,dbbc004,dbbc005
#              INTO l_dbbc001,l_dbbc004,l_dbbc005
#              FROM dbbc_t
#             WHERE dbbc002 = g_stdl_d[l_ac].stdl019
#               AND dbbc003 = g_stdl_d[l_ac].stdl020
#            IF SQLCA.sqlcode THEN
#               #產品組
#               LET g_stdl_d[l_ac].stdl021	 =  ''  #抓取销售范围资料表，若销售组织+销售渠道对应唯一的销售范围，则给值产品组，否则空白
#               #銷售範圍
#               LET g_stdl_d[l_ac].stdl018	 =  ''  #同上
#               #辦事處
#               LET g_stdl_d[l_ac].stdl022	 =  ''  #同上
#            ELSE
#               #產品組
#               LET g_stdl_d[l_ac].stdl021	 =  l_dbbc004  #抓取销售范围资料表，若销售组织+销售渠道对应唯一的销售范围，则给值产品组，否则空白
#               #銷售範圍
#               LET g_stdl_d[l_ac].stdl018	 =  l_dbbc001  #同上
#               #辦事處
#               LET g_stdl_d[l_ac].stdl022	 =  l_dbbc005  #同上
#            END IF 
            #抓取銷售組織、銷售範圍、銷售渠道、產品組、辦事處資料
            CALL s_astt620_get_salesdata(g_stdk_m.stdk002,'','','')
                 RETURNING l_success,g_stdl_d[l_ac].stdl018,g_stdl_d[l_ac].stdl019,g_stdl_d[l_ac].stdl020,
                           g_stdl_d[l_ac].stdl021,g_stdl_d[l_ac].stdl022
                                                                       
            LET g_stdl_d[l_ac].stdl017  = ''
            CALL s_asti206_get_period(g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdl_d[l_ac].stdl016,g_prog) 
                 RETURNING l_success,g_stdl_d[l_ac].stdl011,l_period,l_period2
            #end add-point
            LET g_stdl_d_t.* = g_stdl_d[l_ac].*     #新輸入資料
            LET g_stdl_d_o.* = g_stdl_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt606_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt606_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stdl_d[li_reproduce_target].* = g_stdl_d[li_reproduce].*
 
               LET g_stdl_d[li_reproduce_target].stdlseq = NULL
 
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
            IF cl_null(g_stdl_d[l_ac].stdl003) THEN
               LET g_stdl_d[l_ac].stdl003 = ' '
               LET g_stdl_d[l_ac].stdl001  = '1'
            ELSE
               LET g_stdl_d[l_ac].stdl001  = '2'
            END IF 
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM stdl_t 
             WHERE stdlent = g_enterprise AND stdldocno = g_stdk_m.stdkdocno
 
               AND stdlseq = g_stdl_d[l_ac].stdlseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stdk_m.stdkdocno
               LET gs_keys[2] = g_stdl_d[g_detail_idx].stdlseq
               CALL astt606_insert_b('stdl_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stdl_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stdl_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt606_b_fill()
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
               LET gs_keys[01] = g_stdk_m.stdkdocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stdl_d_t.stdlseq
 
            
               #刪除同層單身
               IF NOT astt606_delete_b('stdl_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt606_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt606_key_delete_b(gs_keys,'stdl_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt606_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt606_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stdl_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stdl_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdlseq
            #add-point:BEFORE FIELD stdlseq name="input.b.page1.stdlseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdlseq
            
            #add-point:AFTER FIELD stdlseq name="input.a.page1.stdlseq"
            #此段落由子樣板a05產生
            #確認資料無重複
            IF  g_stdk_m.stdkdocno IS NOT NULL AND g_stdl_d[g_detail_idx].stdlseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stdk_m.stdkdocno != g_stdkdocno_t OR g_stdl_d[g_detail_idx].stdlseq != g_stdl_d_t.stdlseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stdl_t WHERE "||"stdlent = '" ||g_enterprise|| "' AND "||"stdldocno = '"||g_stdk_m.stdkdocno ||"' AND "|| "stdlseq = '"||g_stdl_d[g_detail_idx].stdlseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdlseq
            #add-point:ON CHANGE stdlseq name="input.g.page1.stdlseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl001
            #add-point:BEFORE FIELD stdl001 name="input.b.page1.stdl001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl001
            
            #add-point:AFTER FIELD stdl001 name="input.a.page1.stdl001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl001
            #add-point:ON CHANGE stdl001 name="input.g.page1.stdl001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl002
            #add-point:BEFORE FIELD stdl002 name="input.b.page1.stdl002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl002
            
            #add-point:AFTER FIELD stdl002 name="input.a.page1.stdl002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl002
            #add-point:ON CHANGE stdl002 name="input.g.page1.stdl002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl003
            
            #add-point:AFTER FIELD stdl003 name="input.a.page1.stdl003"
            IF NOT cl_null(g_stdl_d[l_ac].stdl003) THEN 
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = '1'
               LET g_chkparam.arg1 = g_stdl_d[l_ac].stdl003
               LET g_errshow = TRUE   #160318-00025#49
               LET g_chkparam.err_str[1] = "adb-00285:sub-01302|adbm201|",cl_get_progname("adbm201",g_lang,"2"),"|:EXEPROGadbm201"    #160318-00025#49
               IF NOT cl_chk_exist("v_pmaa001_21") THEN
                  LET g_stdl_d[l_ac].stdl003 = g_stdl_d_t.stdl003
                  NEXT FIELD stdl003
               END IF 
               CALL astt606_stdl003_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_stdl_d[l_ac].stdl003 = g_stdl_d_t.stdl003
                  NEXT FIELD stdl003
               END IF 
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdl_d[l_ac].stdl003
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdl_d[l_ac].stdl003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdl_d[l_ac].stdl003_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl003
            #add-point:BEFORE FIELD stdl003 name="input.b.page1.stdl003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl003
            #add-point:ON CHANGE stdl003 name="input.g.page1.stdl003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl004
            
            #add-point:AFTER FIELD stdl004 name="input.a.page1.stdl004"
            IF NOT cl_null(g_stdl_d[l_ac].stdl004) THEN 
               CALL astt606_stdl004_chk()
               IF NOT cl_null(g_errno) THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_stdl_d[l_ac].stdl004 = g_stdl_d_t.stdl004
                  NEXT FIELD stdl004
               END IF 
            END IF
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdl_d[l_ac].stdl004
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdl_d[l_ac].stdl004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdl_d[l_ac].stdl004_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl004
            #add-point:BEFORE FIELD stdl004 name="input.b.page1.stdl004"
 
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl004
            #add-point:ON CHANGE stdl004 name="input.g.page1.stdl004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl005
            #add-point:BEFORE FIELD stdl005 name="input.b.page1.stdl005"
            IF NOT cl_null(g_stdl_d[l_ac].stdl004) THEN 
               SELECT stae006
                 INTO l_stae006
                 FROM stae_t
                WHERE stae001 = g_stdl_d[l_ac].stdl004 
                  AND staeent = g_enterprise
               IF l_stae006 = '3' THEN  
                  IF l_cmd = 'a' OR (l_cmd ='u' AND g_stdl_d[l_ac].stdl004 != g_stdl_d_t.stdl004) THEN 
                     CALL cl_set_comp_entry('stdl005',TRUE)
                  END IF 
                  CALL cl_set_comp_entry('stdl005',TRUE)
               ELSE
                  IF l_cmd = 'a' OR (l_cmd ='u' AND g_stdl_d[l_ac].stdl004 != g_stdl_d_t.stdl004) THEN 
                     LET g_stdl_d[l_ac].stdl005 = l_stae006
                     CALL cl_set_comp_entry('stdl005',FALSE)
                  END IF 
                  CALL cl_set_comp_entry('stdl005',FALSE)
               END IF 
            ELSE
               CALL cl_set_comp_entry('stdl005',TRUE)
            END IF 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl005
            
            #add-point:AFTER FIELD stdl005 name="input.a.page1.stdl005"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl005
            #add-point:ON CHANGE stdl005 name="input.g.page1.stdl005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl006
            #add-point:BEFORE FIELD stdl006 name="input.b.page1.stdl006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl006
            
            #add-point:AFTER FIELD stdl006 name="input.a.page1.stdl006"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl006
            #add-point:ON CHANGE stdl006 name="input.g.page1.stdl006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl007
            #add-point:BEFORE FIELD stdl007 name="input.b.page1.stdl007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl007
            
            #add-point:AFTER FIELD stdl007 name="input.a.page1.stdl007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl007
            #add-point:ON CHANGE stdl007 name="input.g.page1.stdl007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl008
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stdl_d[l_ac].stdl008,"0","1","","","azz-00079",1) THEN
               NEXT FIELD stdl008
            END IF 
 
 
 
            #add-point:AFTER FIELD stdl008 name="input.a.page1.stdl008"
            IF NOT cl_null(g_stdl_d[l_ac].stdl008) THEN 
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl008
            #add-point:BEFORE FIELD stdl008 name="input.b.page1.stdl008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl008
            #add-point:ON CHANGE stdl008 name="input.g.page1.stdl008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl009
            #add-point:BEFORE FIELD stdl009 name="input.b.page1.stdl009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl009
            
            #add-point:AFTER FIELD stdl009 name="input.a.page1.stdl009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl009
            #add-point:ON CHANGE stdl009 name="input.g.page1.stdl009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl010
            #add-point:BEFORE FIELD stdl010 name="input.b.page1.stdl010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl010
            
            #add-point:AFTER FIELD stdl010 name="input.a.page1.stdl010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl010
            #add-point:ON CHANGE stdl010 name="input.g.page1.stdl010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl011
            #add-point:BEFORE FIELD stdl011 name="input.b.page1.stdl011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl011
            
            #add-point:AFTER FIELD stdl011 name="input.a.page1.stdl011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl011
            #add-point:ON CHANGE stdl011 name="input.g.page1.stdl011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl012
            #add-point:BEFORE FIELD stdl012 name="input.b.page1.stdl012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl012
            
            #add-point:AFTER FIELD stdl012 name="input.a.page1.stdl012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl012
            #add-point:ON CHANGE stdl012 name="input.g.page1.stdl012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl013
            #add-point:BEFORE FIELD stdl013 name="input.b.page1.stdl013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl013
            
            #add-point:AFTER FIELD stdl013 name="input.a.page1.stdl013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl013
            #add-point:ON CHANGE stdl013 name="input.g.page1.stdl013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl014
            #add-point:BEFORE FIELD stdl014 name="input.b.page1.stdl014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl014
            
            #add-point:AFTER FIELD stdl014 name="input.a.page1.stdl014"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl014
            #add-point:ON CHANGE stdl014 name="input.g.page1.stdl014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl015
            #add-point:BEFORE FIELD stdl015 name="input.b.page1.stdl015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl015
            
            #add-point:AFTER FIELD stdl015 name="input.a.page1.stdl015"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl015
            #add-point:ON CHANGE stdl015 name="input.g.page1.stdl015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl016
            #add-point:BEFORE FIELD stdl016 name="input.b.page1.stdl016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl016
            
            #add-point:AFTER FIELD stdl016 name="input.a.page1.stdl016"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl016
            #add-point:ON CHANGE stdl016 name="input.g.page1.stdl016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl017
            #add-point:BEFORE FIELD stdl017 name="input.b.page1.stdl017"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl017
            
            #add-point:AFTER FIELD stdl017 name="input.a.page1.stdl017"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl017
            #add-point:ON CHANGE stdl017 name="input.g.page1.stdl017"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl018
            #add-point:BEFORE FIELD stdl018 name="input.b.page1.stdl018"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl018
            
            #add-point:AFTER FIELD stdl018 name="input.a.page1.stdl018"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl018
            #add-point:ON CHANGE stdl018 name="input.g.page1.stdl018"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl019
            #add-point:BEFORE FIELD stdl019 name="input.b.page1.stdl019"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl019
            
            #add-point:AFTER FIELD stdl019 name="input.a.page1.stdl019"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl019
            #add-point:ON CHANGE stdl019 name="input.g.page1.stdl019"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl020
            #add-point:BEFORE FIELD stdl020 name="input.b.page1.stdl020"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl020
            
            #add-point:AFTER FIELD stdl020 name="input.a.page1.stdl020"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl020
            #add-point:ON CHANGE stdl020 name="input.g.page1.stdl020"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl021
            #add-point:BEFORE FIELD stdl021 name="input.b.page1.stdl021"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl021
            
            #add-point:AFTER FIELD stdl021 name="input.a.page1.stdl021"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl021
            #add-point:ON CHANGE stdl021 name="input.g.page1.stdl021"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl022
            #add-point:BEFORE FIELD stdl022 name="input.b.page1.stdl022"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl022
            
            #add-point:AFTER FIELD stdl022 name="input.a.page1.stdl022"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl022
            #add-point:ON CHANGE stdl022 name="input.g.page1.stdl022"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdl023
            #add-point:BEFORE FIELD stdl023 name="input.b.page1.stdl023"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdl023
            
            #add-point:AFTER FIELD stdl023 name="input.a.page1.stdl023"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdl023
            #add-point:ON CHANGE stdl023 name="input.g.page1.stdl023"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdlsite
            #add-point:BEFORE FIELD stdlsite name="input.b.page1.stdlsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdlsite
            
            #add-point:AFTER FIELD stdlsite name="input.a.page1.stdlsite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdlsite
            #add-point:ON CHANGE stdlsite name="input.g.page1.stdlsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stdlunit
            #add-point:BEFORE FIELD stdlunit name="input.b.page1.stdlunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stdlunit
            
            #add-point:AFTER FIELD stdlunit name="input.a.page1.stdlunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stdlunit
            #add-point:ON CHANGE stdlunit name="input.g.page1.stdlunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stdlseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdlseq
            #add-point:ON ACTION controlp INFIELD stdlseq name="input.c.page1.stdlseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl001
            #add-point:ON ACTION controlp INFIELD stdl001 name="input.c.page1.stdl001"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl002
            #add-point:ON ACTION controlp INFIELD stdl002 name="input.c.page1.stdl002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl003
            #add-point:ON ACTION controlp INFIELD stdl003 name="input.c.page1.stdl003"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdl_d[l_ac].stdl003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #

            LET g_qryparam.where = " pmaa006 = '",g_stdk_m.stdk003,"'"
            CALL q_pmaa001_18()                                #呼叫開窗

            LET g_stdl_d[l_ac].stdl003 = g_qryparam.return1              

            DISPLAY g_stdl_d[l_ac].stdl003 TO stdl003              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdl_d[l_ac].stdl003
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdl_d[l_ac].stdl003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdl_d[l_ac].stdl003_desc

            NEXT FIELD stdl003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl004
            #add-point:ON ACTION controlp INFIELD stdl004 name="input.c.page1.stdl004"
            #此段落由子樣板a07產生            
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stdl_d[l_ac].stdl004             #給予default值
            LET g_qryparam.default2 = "" #g_stdl_d[l_ac].stael003 #說明
            LET g_qryparam.default3 = "" #g_stdl_d[l_ac].stae001 #費用編號
            #給予arg
            LET g_qryparam.arg1 = "" #
            LET g_qryparam.where = " stae002 = '2' "
            
            CALL q_stae001()                                #呼叫開窗

            LET g_stdl_d[l_ac].stdl004 = g_qryparam.return1              
            #LET g_stdl_d[l_ac].stael003 = g_qryparam.return2 
            #LET g_stdl_d[l_ac].stae001 = g_qryparam.return3 
            DISPLAY g_stdl_d[l_ac].stdl004 TO stdl004              #
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdl_d[l_ac].stdl004
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdl_d[l_ac].stdl004_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdl_d[l_ac].stdl004_desc
            #DISPLAY g_stdl_d[l_ac].stael003 TO stael003 #說明
            #DISPLAY g_stdl_d[l_ac].stae001 TO stae001 #費用編號
            NEXT FIELD stdl004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl005
            #add-point:ON ACTION controlp INFIELD stdl005 name="input.c.page1.stdl005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl006
            #add-point:ON ACTION controlp INFIELD stdl006 name="input.c.page1.stdl006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl007
            #add-point:ON ACTION controlp INFIELD stdl007 name="input.c.page1.stdl007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl008
            #add-point:ON ACTION controlp INFIELD stdl008 name="input.c.page1.stdl008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl009
            #add-point:ON ACTION controlp INFIELD stdl009 name="input.c.page1.stdl009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl010
            #add-point:ON ACTION controlp INFIELD stdl010 name="input.c.page1.stdl010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl011
            #add-point:ON ACTION controlp INFIELD stdl011 name="input.c.page1.stdl011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl012
            #add-point:ON ACTION controlp INFIELD stdl012 name="input.c.page1.stdl012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl013
            #add-point:ON ACTION controlp INFIELD stdl013 name="input.c.page1.stdl013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl014
            #add-point:ON ACTION controlp INFIELD stdl014 name="input.c.page1.stdl014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl015
            #add-point:ON ACTION controlp INFIELD stdl015 name="input.c.page1.stdl015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl016
            #add-point:ON ACTION controlp INFIELD stdl016 name="input.c.page1.stdl016"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl017
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl017
            #add-point:ON ACTION controlp INFIELD stdl017 name="input.c.page1.stdl017"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl018
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl018
            #add-point:ON ACTION controlp INFIELD stdl018 name="input.c.page1.stdl018"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl019
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl019
            #add-point:ON ACTION controlp INFIELD stdl019 name="input.c.page1.stdl019"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl020
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl020
            #add-point:ON ACTION controlp INFIELD stdl020 name="input.c.page1.stdl020"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl021
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl021
            #add-point:ON ACTION controlp INFIELD stdl021 name="input.c.page1.stdl021"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl022
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl022
            #add-point:ON ACTION controlp INFIELD stdl022 name="input.c.page1.stdl022"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdl023
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdl023
            #add-point:ON ACTION controlp INFIELD stdl023 name="input.c.page1.stdl023"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdlsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdlsite
            #add-point:ON ACTION controlp INFIELD stdlsite name="input.c.page1.stdlsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stdlunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stdlunit
            #add-point:ON ACTION controlp INFIELD stdlunit name="input.c.page1.stdlunit"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stdl_d[l_ac].* = g_stdl_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt606_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stdl_d[l_ac].stdlseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stdl_d[l_ac].* = g_stdl_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               IF cl_null(g_stdl_d[l_ac].stdl003) THEN
                  LET g_stdl_d[l_ac].stdl003 = ' '
                  LET g_stdl_d[l_ac].stdl001  = '1'
               ELSE
                  LET g_stdl_d[l_ac].stdl001  = '2'
               END IF
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt606_stdl_t_mask_restore('restore_mask_o')
      
               UPDATE stdl_t SET (stdldocno,stdlseq,stdl001,stdl002,stdl003,stdl004,stdl005,stdl006, 
                   stdl007,stdl008,stdl009,stdl010,stdl011,stdl012,stdl013,stdl014,stdl015,stdl016,stdl017, 
                   stdl018,stdl019,stdl020,stdl021,stdl022,stdl023,stdlsite,stdlunit) = (g_stdk_m.stdkdocno, 
                   g_stdl_d[l_ac].stdlseq,g_stdl_d[l_ac].stdl001,g_stdl_d[l_ac].stdl002,g_stdl_d[l_ac].stdl003, 
                   g_stdl_d[l_ac].stdl004,g_stdl_d[l_ac].stdl005,g_stdl_d[l_ac].stdl006,g_stdl_d[l_ac].stdl007, 
                   g_stdl_d[l_ac].stdl008,g_stdl_d[l_ac].stdl009,g_stdl_d[l_ac].stdl010,g_stdl_d[l_ac].stdl011, 
                   g_stdl_d[l_ac].stdl012,g_stdl_d[l_ac].stdl013,g_stdl_d[l_ac].stdl014,g_stdl_d[l_ac].stdl015, 
                   g_stdl_d[l_ac].stdl016,g_stdl_d[l_ac].stdl017,g_stdl_d[l_ac].stdl018,g_stdl_d[l_ac].stdl019, 
                   g_stdl_d[l_ac].stdl020,g_stdl_d[l_ac].stdl021,g_stdl_d[l_ac].stdl022,g_stdl_d[l_ac].stdl023, 
                   g_stdl_d[l_ac].stdlsite,g_stdl_d[l_ac].stdlunit)
                WHERE stdlent = g_enterprise AND stdldocno = g_stdk_m.stdkdocno 
 
                  AND stdlseq = g_stdl_d_t.stdlseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stdl_d[l_ac].* = g_stdl_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stdl_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stdl_d[l_ac].* = g_stdl_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stdl_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stdk_m.stdkdocno
               LET gs_keys_bak[1] = g_stdkdocno_t
               LET gs_keys[2] = g_stdl_d[g_detail_idx].stdlseq
               LET gs_keys_bak[2] = g_stdl_d_t.stdlseq
               CALL astt606_update_b('stdl_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt606_stdl_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stdl_d[g_detail_idx].stdlseq = g_stdl_d_t.stdlseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stdk_m.stdkdocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stdl_d_t.stdlseq
 
                  CALL astt606_key_update_b(gs_keys,'stdl_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stdk_m),util.JSON.stringify(g_stdl_d_t)
               LET g_log2 = util.JSON.stringify(g_stdk_m),util.JSON.stringify(g_stdl_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astt606_unlock_b("stdl_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            SELECT SUM(stdl008) INTO g_stdk_m.stdl008_sum
              FROM stdl_t
             WHERE stdlent = g_enterprise
               AND stdldocno = g_stdk_m.stdkdocno
            
            DISPLAY BY NAME g_stdk_m.stdl008_sum
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            
            #end add-point 
    
         ON ACTION controlo    
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_stdl_d[li_reproduce_target].* = g_stdl_d[li_reproduce].*
 
               LET g_stdl_d[li_reproduce_target].stdlseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stdl_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stdl_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="astt606.input.other" >}
      
      #add-point:自定義input name="input.more_input"
 
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
        CALL DIALOG.setCurrentRow("s_detail1",g_detail_idx) 
        IF p_cmd = 'a' THEN
            NEXT FIELD stdksite
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stdlseq
 
               #add-point:input段modify_detail 

               #end add-point  
            END CASE
         END IF
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD stdkdocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stdlseq
 
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
 
{<section id="astt606.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt606_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   DEFINE l_ooef019         LIKE ooef_t.ooef019
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt606_b_fill() #單身填充
      CALL astt606_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt606_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   SELECT ooef019 INTO l_ooef019
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_stdk_m.stdksite
      
   SELECT SUM(stdl008) INTO g_stdk_m.stdl008_sum
     FROM stdl_t
    WHERE stdlent = g_enterprise
      AND stdldocno = g_stdk_m.stdkdocno
      
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdk009
   CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdk_m.stdk009_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdk009_desc
   
   SELECT ooff013 INTO g_stdk_m.ooff013 FROM ooff_t
    WHERE ooffent = g_enterprise 
      AND ooff001 = '2'
      AND ooff002 = g_stdk_m.stdkdocno 
      AND ooff012 = '4'
   #end add-point
   
   #遮罩相關處理
   LET g_stdk_m_mask_o.* =  g_stdk_m.*
   CALL astt606_stdk_t_mask()
   LET g_stdk_m_mask_n.* =  g_stdk_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stdk_m.stdksite,g_stdk_m.stdksite_desc,g_stdk_m.stdkdocdt,g_stdk_m.stdkdocno,g_stdk_m.stdkunit, 
       g_stdk_m.stdk001,g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk003_desc,g_stdk_m.stdk004,g_stdk_m.stdk004_desc, 
       g_stdk_m.stdk005,g_stdk_m.stdk005_desc,g_stdk_m.stdkstus,g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdk_m.stdl008_sum, 
       g_stdk_m.stdk008,g_stdk_m.stdk008_desc,g_stdk_m.stdk009,g_stdk_m.stdk009_desc,g_stdk_m.stdk012, 
       g_stdk_m.stdk010,g_stdk_m.stdk011,g_stdk_m.stdk013,g_stdk_m.ooff013,g_stdk_m.stdkownid,g_stdk_m.stdkownid_desc, 
       g_stdk_m.stdkowndp,g_stdk_m.stdkowndp_desc,g_stdk_m.stdkcrtid,g_stdk_m.stdkcrtid_desc,g_stdk_m.stdkcrtdp, 
       g_stdk_m.stdkcrtdp_desc,g_stdk_m.stdkcrtdt,g_stdk_m.stdkmodid,g_stdk_m.stdkmodid_desc,g_stdk_m.stdkmoddt, 
       g_stdk_m.stdkcnfid,g_stdk_m.stdkcnfid_desc,g_stdk_m.stdkcnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stdk_m.stdkstus 
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
   FOR l_ac = 1 TO g_stdl_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt606_detail_show()
 
   #add-point:show段之後 name="show.after"
 
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt606.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt606_detail_show()
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
 
{<section id="astt606.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt606_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stdk_t.stdkdocno 
   DEFINE l_oldno     LIKE stdk_t.stdkdocno 
 
   DEFINE l_master    RECORD LIKE stdk_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stdl_t.* #此變數樣板目前無使用
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE l_stdl011   LIKE stdl_t.stdl011
   DEFINE l_stdl013   LIKE stdl_t.stdl013
   DEFINE l_stdl014   LIKE stdl_t.stdl014
   DEFINE l_stdl015   LIKE stdl_t.stdl015
   DEFINE l_stdl016   LIKE stdl_t.stdl016
   DEFINE l_stdl018   LIKE stdl_t.stdl018
   DEFINE l_stdl019   LIKE stdl_t.stdl019
   DEFINE l_stdl020   LIKE stdl_t.stdl020
   DEFINE l_stdl021   LIKE stdl_t.stdl021
   DEFINE l_stdl022   LIKE stdl_t.stdl022
   DEFINE l_success   LIKE type_t.num5
   DEFINE l_period               LIKE type_t.num5
   DEFINE l_period2              LIKE type_t.num5   
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
   
   IF g_stdk_m.stdkdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stdkdocno_t = g_stdk_m.stdkdocno
 
    
   LET g_stdk_m.stdkdocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stdk_m.stdkownid = g_user
      LET g_stdk_m.stdkowndp = g_dept
      LET g_stdk_m.stdkcrtid = g_user
      LET g_stdk_m.stdkcrtdp = g_dept 
      LET g_stdk_m.stdkcrtdt = cl_get_current()
      LET g_stdk_m.stdkmodid = g_user
      LET g_stdk_m.stdkmoddt = cl_get_current()
      LET g_stdk_m.stdkstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   LET g_stdk_m.stdkdocdt = g_today
#   LET g_stdk_m.stdksite = g_site
   LET g_site_flag = FALSE
   CALL s_aooi500_default(g_prog,'stdksite',g_stdk_m.stdksite)
      RETURNING l_insert,g_stdk_m.stdksite
   IF NOT l_insert THEN
      RETURN
   END IF
   LET g_stdk_m.stdkunit = g_site
   LET g_stdk_m.stdk004 = g_user
   SELECT ooag003 INTO g_stdk_m.stdk005
     FROM ooag_t 
    WHERE ooagent = g_enterprise
      AND ooag001 = g_user 
   LET g_stdk_m.stdk006 = g_today
   LET g_stdk_m.stdk007 = g_today
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stdk_m.stdkstus 
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
   
   
   CALL astt606_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stdk_m.* TO NULL
      INITIALIZE g_stdl_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt606_show()
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
   CALL astt606_set_act_visible()   
   CALL astt606_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stdkdocno_t = g_stdk_m.stdkdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stdkent = " ||g_enterprise|| " AND",
                      " stdkdocno = '", g_stdk_m.stdkdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt606_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   SELECT stce005,stce006,stce007,stce024,
     INTO l_stdl013,l_stdl014,l_stdl015,l_stdl016
     FROM stce_t
    WHERE stceent = g_enterprise
      AND stce001 = g_stdk_m.stdk002
   #抓取銷售組織、銷售範圍、銷售渠道、產品組、辦事處資料
   CALL s_astt620_get_salesdata(g_stdk_m.stdk002,'','','')
        RETURNING l_success,l_stdl018,l_stdl019,l_stdl020,
                  l_stdl021,l_stdl022
   CALL s_asti206_get_period(g_stdk_m.stdk006,g_stdk_m.stdk007,l_stdl016,g_prog) 
        RETURNING l_success,l_stdl011,l_period,l_period2
   UPDATE stdl_t SET stdlunit = g_stdk_m.stdksite,
                     stdlsite = g_stdk_m.stdksite,
                     stdl002  = g_stdk_m.stdk003,
                     stdl006  = g_stdk_m.stdk008,
                     stdl007  = g_stdk_m.stdk009,
                     stdl009  = g_stdk_m.stdk006,
                     stdl010  = g_stdk_m.stdk007,
                     stdl011  = l_stdl011,
                     stdl012  = g_stdk_m.stdk002,
                     stdl013  = l_stdl013,
                     stdl014  = l_stdl014,
                     stdl015  = l_stdl015,
                     stdl016  = l_stdl016,
                     stdl018  = l_stdl018,
                     stdl019  = l_stdl019,
                     stdl020  = l_stdl020
     WHERE stdlent = g_enterprise
       AND stdldocno = g_stdk_m.stdkdocno     
                     
   #end add-point
   
   CALL astt606_idx_chk()
   
   LET g_data_owner = g_stdk_m.stdkownid      
   LET g_data_dept  = g_stdk_m.stdkowndp
   
   #功能已完成,通報訊息中心
   CALL astt606_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt606.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt606_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stdl_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt606_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stdl_t
    WHERE stdlent = g_enterprise AND stdldocno = g_stdkdocno_t
 
    INTO TEMP astt606_detail
 
   #將key修正為調整後   
   UPDATE astt606_detail 
      #更新key欄位
      SET stdldocno = g_stdk_m.stdkdocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stdl_t SELECT * FROM astt606_detail
   
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
   DROP TABLE astt606_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stdkdocno_t = g_stdk_m.stdkdocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt606.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt606_delete()
   #add-point:delete段define(客製用) name="delete.define_customerization"
   
   #end add-point     
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="delete.pre_function"
   
   #end add-point
   
   IF g_stdk_m.stdkdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt606_cl USING g_enterprise,g_stdk_m.stdkdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt606_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt606_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt606_master_referesh USING g_stdk_m.stdkdocno INTO g_stdk_m.stdksite,g_stdk_m.stdkdocdt, 
       g_stdk_m.stdkdocno,g_stdk_m.stdkunit,g_stdk_m.stdk001,g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk004, 
       g_stdk_m.stdk005,g_stdk_m.stdkstus,g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdk_m.stdk008,g_stdk_m.stdk009, 
       g_stdk_m.stdk012,g_stdk_m.stdk010,g_stdk_m.stdk011,g_stdk_m.stdk013,g_stdk_m.stdkownid,g_stdk_m.stdkowndp, 
       g_stdk_m.stdkcrtid,g_stdk_m.stdkcrtdp,g_stdk_m.stdkcrtdt,g_stdk_m.stdkmodid,g_stdk_m.stdkmoddt, 
       g_stdk_m.stdkcnfid,g_stdk_m.stdkcnfdt,g_stdk_m.stdksite_desc,g_stdk_m.stdk003_desc,g_stdk_m.stdk004_desc, 
       g_stdk_m.stdk005_desc,g_stdk_m.stdk008_desc,g_stdk_m.stdkownid_desc,g_stdk_m.stdkowndp_desc,g_stdk_m.stdkcrtid_desc, 
       g_stdk_m.stdkcrtdp_desc,g_stdk_m.stdkmodid_desc,g_stdk_m.stdkcnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt606_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stdk_m_mask_o.* =  g_stdk_m.*
   CALL astt606_stdk_t_mask()
   LET g_stdk_m_mask_n.* =  g_stdk_m.*
   
   CALL astt606_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt606_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stdkdocno_t = g_stdk_m.stdkdocno
 
 
      DELETE FROM stdk_t
       WHERE stdkent = g_enterprise AND stdkdocno = g_stdk_m.stdkdocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stdk_m.stdkdocno,":",SQLERRMESSAGE  
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
      
      DELETE FROM stdl_t
       WHERE stdlent = g_enterprise AND stdldocno = g_stdk_m.stdkdocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stdl_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stdk_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt606_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stdl_d.clear() 
 
     
      CALL astt606_ui_browser_refresh()  
      #CALL astt606_ui_headershow()  
      #CALL astt606_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt606_browser_fill("")
         CALL astt606_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt606_cl
 
   #功能已完成,通報訊息中心
   CALL astt606_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt606.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt606_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stdl_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt606_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stdlseq,stdl001,stdl002,stdl003,stdl004,stdl005,stdl006,stdl007, 
             stdl008,stdl009,stdl010,stdl011,stdl012,stdl013,stdl014,stdl015,stdl016,stdl017,stdl018, 
             stdl019,stdl020,stdl021,stdl022,stdl023,stdlsite,stdlunit ,t1.pmaal004 ,t2.stael003 FROM stdl_t", 
                
                     " INNER JOIN stdk_t ON stdkent = " ||g_enterprise|| " AND stdkdocno = stdldocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN pmaal_t t1 ON t1.pmaalent="||g_enterprise||" AND t1.pmaal001=stdl003 AND t1.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t2 ON t2.staelent="||g_enterprise||" AND t2.stael001=stdl004 AND t2.stael002='"||g_dlang||"' ",
 
                     " WHERE stdlent=? AND stdldocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stdl_t.stdlseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt606_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt606_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stdk_m.stdkdocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stdk_m.stdkdocno INTO g_stdl_d[l_ac].stdlseq,g_stdl_d[l_ac].stdl001, 
          g_stdl_d[l_ac].stdl002,g_stdl_d[l_ac].stdl003,g_stdl_d[l_ac].stdl004,g_stdl_d[l_ac].stdl005, 
          g_stdl_d[l_ac].stdl006,g_stdl_d[l_ac].stdl007,g_stdl_d[l_ac].stdl008,g_stdl_d[l_ac].stdl009, 
          g_stdl_d[l_ac].stdl010,g_stdl_d[l_ac].stdl011,g_stdl_d[l_ac].stdl012,g_stdl_d[l_ac].stdl013, 
          g_stdl_d[l_ac].stdl014,g_stdl_d[l_ac].stdl015,g_stdl_d[l_ac].stdl016,g_stdl_d[l_ac].stdl017, 
          g_stdl_d[l_ac].stdl018,g_stdl_d[l_ac].stdl019,g_stdl_d[l_ac].stdl020,g_stdl_d[l_ac].stdl021, 
          g_stdl_d[l_ac].stdl022,g_stdl_d[l_ac].stdl023,g_stdl_d[l_ac].stdlsite,g_stdl_d[l_ac].stdlunit, 
          g_stdl_d[l_ac].stdl003_desc,g_stdl_d[l_ac].stdl004_desc   #(ver:78)
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         
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
   
   CALL g_stdl_d.deleteElement(g_stdl_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt606_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stdl_d.getLength()
      LET g_stdl_d_mask_o[l_ac].* =  g_stdl_d[l_ac].*
      CALL astt606_stdl_t_mask()
      LET g_stdl_d_mask_n[l_ac].* =  g_stdl_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt606.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt606_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stdl_t
       WHERE stdlent = g_enterprise AND
         stdldocno = ps_keys_bak[1] AND stdlseq = ps_keys_bak[2]
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
         CALL g_stdl_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt606.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt606_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stdl_t
                  (stdlent,
                   stdldocno,
                   stdlseq
                   ,stdl001,stdl002,stdl003,stdl004,stdl005,stdl006,stdl007,stdl008,stdl009,stdl010,stdl011,stdl012,stdl013,stdl014,stdl015,stdl016,stdl017,stdl018,stdl019,stdl020,stdl021,stdl022,stdl023,stdlsite,stdlunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stdl_d[g_detail_idx].stdl001,g_stdl_d[g_detail_idx].stdl002,g_stdl_d[g_detail_idx].stdl003, 
                       g_stdl_d[g_detail_idx].stdl004,g_stdl_d[g_detail_idx].stdl005,g_stdl_d[g_detail_idx].stdl006, 
                       g_stdl_d[g_detail_idx].stdl007,g_stdl_d[g_detail_idx].stdl008,g_stdl_d[g_detail_idx].stdl009, 
                       g_stdl_d[g_detail_idx].stdl010,g_stdl_d[g_detail_idx].stdl011,g_stdl_d[g_detail_idx].stdl012, 
                       g_stdl_d[g_detail_idx].stdl013,g_stdl_d[g_detail_idx].stdl014,g_stdl_d[g_detail_idx].stdl015, 
                       g_stdl_d[g_detail_idx].stdl016,g_stdl_d[g_detail_idx].stdl017,g_stdl_d[g_detail_idx].stdl018, 
                       g_stdl_d[g_detail_idx].stdl019,g_stdl_d[g_detail_idx].stdl020,g_stdl_d[g_detail_idx].stdl021, 
                       g_stdl_d[g_detail_idx].stdl022,g_stdl_d[g_detail_idx].stdl023,g_stdl_d[g_detail_idx].stdlsite, 
                       g_stdl_d[g_detail_idx].stdlunit)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stdl_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stdl_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt606.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt606_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stdl_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt606_stdl_t_mask_restore('restore_mask_o')
               
      UPDATE stdl_t 
         SET (stdldocno,
              stdlseq
              ,stdl001,stdl002,stdl003,stdl004,stdl005,stdl006,stdl007,stdl008,stdl009,stdl010,stdl011,stdl012,stdl013,stdl014,stdl015,stdl016,stdl017,stdl018,stdl019,stdl020,stdl021,stdl022,stdl023,stdlsite,stdlunit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stdl_d[g_detail_idx].stdl001,g_stdl_d[g_detail_idx].stdl002,g_stdl_d[g_detail_idx].stdl003, 
                  g_stdl_d[g_detail_idx].stdl004,g_stdl_d[g_detail_idx].stdl005,g_stdl_d[g_detail_idx].stdl006, 
                  g_stdl_d[g_detail_idx].stdl007,g_stdl_d[g_detail_idx].stdl008,g_stdl_d[g_detail_idx].stdl009, 
                  g_stdl_d[g_detail_idx].stdl010,g_stdl_d[g_detail_idx].stdl011,g_stdl_d[g_detail_idx].stdl012, 
                  g_stdl_d[g_detail_idx].stdl013,g_stdl_d[g_detail_idx].stdl014,g_stdl_d[g_detail_idx].stdl015, 
                  g_stdl_d[g_detail_idx].stdl016,g_stdl_d[g_detail_idx].stdl017,g_stdl_d[g_detail_idx].stdl018, 
                  g_stdl_d[g_detail_idx].stdl019,g_stdl_d[g_detail_idx].stdl020,g_stdl_d[g_detail_idx].stdl021, 
                  g_stdl_d[g_detail_idx].stdl022,g_stdl_d[g_detail_idx].stdl023,g_stdl_d[g_detail_idx].stdlsite, 
                  g_stdl_d[g_detail_idx].stdlunit) 
         WHERE stdlent = g_enterprise AND stdldocno = ps_keys_bak[1] AND stdlseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stdl_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stdl_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt606_stdl_t_mask_restore('restore_mask_n')
               
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
 
{<section id="astt606.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt606_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt606.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt606_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt606.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt606_lock_b(ps_table,ps_page)
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
   #CALL astt606_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stdl_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt606_bcl USING g_enterprise,
                                       g_stdk_m.stdkdocno,g_stdl_d[g_detail_idx].stdlseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt606_bcl:",SQLERRMESSAGE 
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
 
{<section id="astt606.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt606_unlock_b(ps_table,ps_page)
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
      CLOSE astt606_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt606.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt606_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stdkdocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stdkdocno",TRUE)
      CALL cl_set_comp_entry("stdkdocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("stdksite",TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt606.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt606_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stdkdocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stdkdocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stdkdocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF NOT s_aooi500_comp_entry(g_prog,'stdksite') OR g_site_flag THEN
      CALL cl_set_comp_entry("stdksite",FALSE)
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt606.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt606_set_entry_b(p_cmd)
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
 
{<section id="astt606.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt606_set_no_entry_b(p_cmd)
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
 
{<section id="astt606.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt606_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt606.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt606_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_stdk_m.stdkstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF


   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt606.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt606_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt606.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt606_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt606.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt606_default_search()
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
      LET ls_wc = ls_wc, " stdkdocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "stdk_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stdl_t" 
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
 
{<section id="astt606.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt606_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   IF g_stdk_m.stdkstus = 'X' OR cl_null(g_stdk_m.stdkstus) THEN
      RETURN
   END IF
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stdk_m.stdkdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt606_cl USING g_enterprise,g_stdk_m.stdkdocno
   IF STATUS THEN
      CLOSE astt606_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt606_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt606_master_referesh USING g_stdk_m.stdkdocno INTO g_stdk_m.stdksite,g_stdk_m.stdkdocdt, 
       g_stdk_m.stdkdocno,g_stdk_m.stdkunit,g_stdk_m.stdk001,g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk004, 
       g_stdk_m.stdk005,g_stdk_m.stdkstus,g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdk_m.stdk008,g_stdk_m.stdk009, 
       g_stdk_m.stdk012,g_stdk_m.stdk010,g_stdk_m.stdk011,g_stdk_m.stdk013,g_stdk_m.stdkownid,g_stdk_m.stdkowndp, 
       g_stdk_m.stdkcrtid,g_stdk_m.stdkcrtdp,g_stdk_m.stdkcrtdt,g_stdk_m.stdkmodid,g_stdk_m.stdkmoddt, 
       g_stdk_m.stdkcnfid,g_stdk_m.stdkcnfdt,g_stdk_m.stdksite_desc,g_stdk_m.stdk003_desc,g_stdk_m.stdk004_desc, 
       g_stdk_m.stdk005_desc,g_stdk_m.stdk008_desc,g_stdk_m.stdkownid_desc,g_stdk_m.stdkowndp_desc,g_stdk_m.stdkcrtid_desc, 
       g_stdk_m.stdkcrtdp_desc,g_stdk_m.stdkmodid_desc,g_stdk_m.stdkcnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt606_action_chk() THEN
      CLOSE astt606_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stdk_m.stdksite,g_stdk_m.stdksite_desc,g_stdk_m.stdkdocdt,g_stdk_m.stdkdocno,g_stdk_m.stdkunit, 
       g_stdk_m.stdk001,g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk003_desc,g_stdk_m.stdk004,g_stdk_m.stdk004_desc, 
       g_stdk_m.stdk005,g_stdk_m.stdk005_desc,g_stdk_m.stdkstus,g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdk_m.stdl008_sum, 
       g_stdk_m.stdk008,g_stdk_m.stdk008_desc,g_stdk_m.stdk009,g_stdk_m.stdk009_desc,g_stdk_m.stdk012, 
       g_stdk_m.stdk010,g_stdk_m.stdk011,g_stdk_m.stdk013,g_stdk_m.ooff013,g_stdk_m.stdkownid,g_stdk_m.stdkownid_desc, 
       g_stdk_m.stdkowndp,g_stdk_m.stdkowndp_desc,g_stdk_m.stdkcrtid,g_stdk_m.stdkcrtid_desc,g_stdk_m.stdkcrtdp, 
       g_stdk_m.stdkcrtdp_desc,g_stdk_m.stdkcrtdt,g_stdk_m.stdkmodid,g_stdk_m.stdkmodid_desc,g_stdk_m.stdkmoddt, 
       g_stdk_m.stdkcnfid,g_stdk_m.stdkcnfid_desc,g_stdk_m.stdkcnfdt
 
   CASE g_stdk_m.stdkstus
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
         CASE g_stdk_m.stdkstus
            
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
      CALL cl_set_act_visible("unconfirmed,invalid,confirmed",TRUE)
      CALL cl_set_act_visible("closed",FALSE)

      CASE g_stdk_m.stdkstus
         WHEN "N"  
            CALL cl_set_act_visible("unconfirmed",FALSE)
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            IF cl_bpm_chk() THEN
                CALL cl_set_act_visible("signing",TRUE)
                CALL cl_set_act_visible("confirmed",FALSE)
            END IF
 
         WHEN "R"   #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed",FALSE)

         WHEN "D"   #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed",FALSE) 
          
         WHEN "X"
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)

         WHEN "Y"
            CALL cl_set_act_visible("invalid,confirmed",FALSE)
         
         WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
             CALL cl_set_act_visible("withdraw",TRUE)  
             CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)
         
         WHEN "A"     #只能顯示確認; 其餘應用功能皆隱藏
             CALL cl_set_act_visible("confirmed ",TRUE)  
             CALL cl_set_act_visible("unconfirmed,invalid",FALSE)

      END CASE

      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT astt606_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt606_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt606_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt606_cl
            RETURN
         END IF
 
 
 
	  
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
         IF NOT cl_ask_confirm('aim-00110') THEN
            CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
            RETURN
         END IF 
         CALL s_astt606_unconf_chk(g_stdk_m.stdkdocno,'N') RETURNING l_success,g_errno
         IF l_success THEN 
            CALL s_transaction_begin()
            CALL s_astt606_unconf_upd(g_stdk_m.stdkdocno,'N') RETURNING l_success
            IF NOT l_success THEN
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            CALL s_transaction_end('Y','0')
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = g_errno
            LET g_errparam.extend = g_stdk_m.stdkdocno
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
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
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN
            END IF 
            CALL s_astt606_conf_chk(g_stdk_m.stdkdocno,'Y') RETURNING l_success,g_errno
            IF l_success THEN 
               CALL s_transaction_begin()
               CALL s_astt606_conf_upd(g_stdk_m.stdkdocno,'Y') RETURNING l_success
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  RETURN
               END IF
               CALL s_transaction_end('Y','0')
            ELSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = g_errno
               LET g_errparam.extend = g_stdk_m.stdkdocno
               LET g_errparam.popup = TRUE
               CALL cl_err()
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
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
      ON ACTION invalid
         IF cl_auth_chk_act("invalid") THEN
            LET lc_state = "X"
            #add-point:action控制 name="statechange.invalid"
            IF NOT cl_ask_confirm('aim-00109') THEN
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN
            END IF
            CALL s_transaction_begin()
            CALL s_astt606_unconf_upd(g_stdk_m.stdkdocno,'X') RETURNING l_success
            IF NOT l_success THEN
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            CALL s_transaction_end('Y','0')
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
      g_stdk_m.stdkstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt606_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   
   #end add-point
   
   LET g_stdk_m.stdkmodid = g_user
   LET g_stdk_m.stdkmoddt = cl_get_current()
   LET g_stdk_m.stdkstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stdk_t 
      SET (stdkstus,stdkmodid,stdkmoddt) 
        = (g_stdk_m.stdkstus,g_stdk_m.stdkmodid,g_stdk_m.stdkmoddt)     
    WHERE stdkent = g_enterprise AND stdkdocno = g_stdk_m.stdkdocno
 
    
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
      EXECUTE astt606_master_referesh USING g_stdk_m.stdkdocno INTO g_stdk_m.stdksite,g_stdk_m.stdkdocdt, 
          g_stdk_m.stdkdocno,g_stdk_m.stdkunit,g_stdk_m.stdk001,g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk004, 
          g_stdk_m.stdk005,g_stdk_m.stdkstus,g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdk_m.stdk008,g_stdk_m.stdk009, 
          g_stdk_m.stdk012,g_stdk_m.stdk010,g_stdk_m.stdk011,g_stdk_m.stdk013,g_stdk_m.stdkownid,g_stdk_m.stdkowndp, 
          g_stdk_m.stdkcrtid,g_stdk_m.stdkcrtdp,g_stdk_m.stdkcrtdt,g_stdk_m.stdkmodid,g_stdk_m.stdkmoddt, 
          g_stdk_m.stdkcnfid,g_stdk_m.stdkcnfdt,g_stdk_m.stdksite_desc,g_stdk_m.stdk003_desc,g_stdk_m.stdk004_desc, 
          g_stdk_m.stdk005_desc,g_stdk_m.stdk008_desc,g_stdk_m.stdkownid_desc,g_stdk_m.stdkowndp_desc, 
          g_stdk_m.stdkcrtid_desc,g_stdk_m.stdkcrtdp_desc,g_stdk_m.stdkmodid_desc,g_stdk_m.stdkcnfid_desc 
 
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stdk_m.stdksite,g_stdk_m.stdksite_desc,g_stdk_m.stdkdocdt,g_stdk_m.stdkdocno, 
          g_stdk_m.stdkunit,g_stdk_m.stdk001,g_stdk_m.stdk002,g_stdk_m.stdk003,g_stdk_m.stdk003_desc, 
          g_stdk_m.stdk004,g_stdk_m.stdk004_desc,g_stdk_m.stdk005,g_stdk_m.stdk005_desc,g_stdk_m.stdkstus, 
          g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdk_m.stdl008_sum,g_stdk_m.stdk008,g_stdk_m.stdk008_desc, 
          g_stdk_m.stdk009,g_stdk_m.stdk009_desc,g_stdk_m.stdk012,g_stdk_m.stdk010,g_stdk_m.stdk011, 
          g_stdk_m.stdk013,g_stdk_m.ooff013,g_stdk_m.stdkownid,g_stdk_m.stdkownid_desc,g_stdk_m.stdkowndp, 
          g_stdk_m.stdkowndp_desc,g_stdk_m.stdkcrtid,g_stdk_m.stdkcrtid_desc,g_stdk_m.stdkcrtdp,g_stdk_m.stdkcrtdp_desc, 
          g_stdk_m.stdkcrtdt,g_stdk_m.stdkmodid,g_stdk_m.stdkmodid_desc,g_stdk_m.stdkmoddt,g_stdk_m.stdkcnfid, 
          g_stdk_m.stdkcnfid_desc,g_stdk_m.stdkcnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   CALL cl_set_act_visible("modify,delete,insert,modify_detail", TRUE)
   IF g_stdk_m.stdkstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt606_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt606_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt606.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt606_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stdl_d.getLength() THEN
         LET g_detail_idx = g_stdl_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stdl_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stdl_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt606.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt606_b_fill2(pi_idx)
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
   
   CALL astt606_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt606.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt606_fill_chk(ps_idx)
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
 
{<section id="astt606.status_show" >}
PRIVATE FUNCTION astt606_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt606.mask_functions" >}
&include "erp/ast/astt606_mask.4gl"
 
{</section>}
 
{<section id="astt606.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt606_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   DEFINE l_success  LIKE type_t.num5
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
 
 
   CALL astt606_show()
   CALL astt606_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   CALL s_astt606_conf_chk(g_stdk_m.stdkdocno,'Y') RETURNING l_success,g_errno
   IF NOT l_success THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = g_errno
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN FALSE
   END IF
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stdk_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stdl_d))
 
 
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
   #CALL astt606_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt606_ui_headershow()
   CALL astt606_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt606_draw_out()
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
   CALL astt606_ui_headershow()  
   CALL astt606_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt606.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt606_set_pk_array()
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
   LET g_pk_array[1].values = g_stdk_m.stdkdocno
   LET g_pk_array[1].column = 'stdkdocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt606.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt606.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt606_msgcentre_notify(lc_state)
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
   CALL astt606_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stdk_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt606.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt606_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#40 add-S
   SELECT stdkstus  INTO g_stdk_m.stdkstus
     FROM stdk_t
    WHERE stdkent = g_enterprise
      AND stdkdocno = g_stdk_m.stdkdocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stdk_m.stdkstus
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
        LET g_errparam.extend = g_stdk_m.stdkdocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt606_set_act_visible()
        CALL astt606_set_act_no_visible()
        CALL astt606_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#40 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt606.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 合約編號檢查
# Memo...........:
# Usage..........: CALL astt606_stdk002_chk() 
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2014/08/18 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt606_stdk002_chk()
   DEFINE l_stcestus   LIKE stce_t.stcestus
   DEFINE l_stce008    LIKE stce_t.stce008
   LET g_errno = ''
   SELECT stcestus,stce008
     INTO l_stcestus,l_stce008
     FROM stce_t
    WHERE stceent = g_enterprise
      AND stce001 = g_stdk_m.stdk002
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00051'
      WHEN l_stcestus <> 'Y'   LET g_errno = 'ast-00052'
      WHEN l_stce008 <> '1'    LET g_errno = 'ast-00172'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
END FUNCTION

################################################################################
# Descriptions...: 合约编号帶值
# Memo...........:
# Usage..........: CALL astt606_stdk002_display()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2014/08/18 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt606_stdk002_display()
   DEFINE l_stce009    LIKE stce_t.stce009
   DEFINE l_stce017    LIKE stce_t.stce017
   DEFINE l_stce018    LIKE stce_t.stce018
   DEFINE l_stce021    LIKE stce_t.stce021
   DEFINE l_stce022    LIKE stce_t.stce022
   DEFINE l_ooef019    LIKE ooef_t.ooef019

   SELECT stce009,stce017,stce018,stce021,stce022
     INTO l_stce009,l_stce017,l_stce018,l_stce021,l_stce022
     FROM stce_t
    WHERE stceent = g_enterprise
      AND stce001 = g_stdk_m.stdk002
      
   LET g_stdk_m.stdk003 = l_stce009
   LET g_stdk_m.stdk006 = l_stce017
   LET g_stdk_m.stdk007 = l_stce018
   LET g_stdk_m.stdk008 = l_stce021
   LET g_stdk_m.stdk009 = l_stce022
   DISPLAY BY NAME g_stdk_m.stdk003,g_stdk_m.stdk006,g_stdk_m.stdk007,g_stdk_m.stdk008,g_stdk_m.stdk009
   SELECT ooef019 INTO l_ooef019
     FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_stdk_m.stdksite
      
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdk003
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdk_m.stdk003_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdk003_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdk008
   CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdk_m.stdk008_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdk008_desc

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stdk_m.stdk009
   CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stdk_m.stdk009_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stdk_m.stdk009_desc
   
   #160824-00007#199 161122  by lori add---(S)
   LET g_stdk_m_o.stdk003 = g_stdk_m.stdk003
   LET g_stdk_m_o.stdk006 = g_stdk_m.stdk006
   LET g_stdk_m_o.stdk007 = g_stdk_m.stdk007
   LET g_stdk_m_o.stdk008 = g_stdk_m.stdk008
   LET g_stdk_m_o.stdk009 = g_stdk_m.stdk009
   #160824-00007#199 161122  by lori add---(E)   
END FUNCTION

################################################################################
# Descriptions...: 经销商检查
# Memo...........:
# Usage..........: CALL astt606_stdk003_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/08/18 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt606_stdk003_chk()
   DEFINE l_pmaastus   LIKE pmaa_t.pmaastus
   DEFINE l_ooef019    LIKE ooef_t.ooef019
   DEFINE l_stce001    LIKE stce_t.stce001   
   DEFINE l_stce017    LIKE stce_t.stce017
   DEFINE l_stce018    LIKE stce_t.stce018
   DEFINE l_stce021    LIKE stce_t.stce021
   DEFINE l_stce022    LIKE stce_t.stce022
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_site       LIKE stau_t.stausite
   DEFINE l_n          LIKE type_t.num5
   
   LET g_errno = ''
   #SELECT pmaastus INTO l_pmaastus
   #  FROM pmaa_t
   # WHERE pmaaent = g_enterprise
   #   AND pmaa230 = '1' 
   #   AND pmaa092 = '2' 
   #   AND pmaa002 <> '1'
   #   AND pmaa001 = g_stdk_m.stdk003
   #CASE 
   #   WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00053'
   #   WHEN l_pmaastus <> 'Y'   LET g_errno = 'ast-00054'
   #   OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   #END CASE
   IF cl_null(g_errno) THEN 
      #单身不为空，检查单身网点是否与经销商对应
      LET l_n = 0
      SELECT COUNT(*) INTO l_n
        FROM stdl_t
       WHERE stdlent = g_enterprise
         AND stdldocno = g_stdk_m.stdkdocno
         AND stdl003 NOT IN(SELECT pmaa001 
                              FROM pmaa_t 
                             WHERE pmaaent = g_enterprise 
                               AND pmaa006 = g_stdk_m.stdk003)
         AND stdl003 <> ' '
      IF l_n > 0 THEN 
         LET g_errno = 'ast-00043'
         RETURN   #160824-00007#199 161122 by lori add
      END IF 
   END IF 

   IF cl_null(g_errno) THEN
      IF NOT cl_null(g_stdk_m.stdk002) THEN
         LET l_n = 0
         #检查经销商是否存在合同中      
         SELECT COUNT(*) INTO l_n
           FROM stce_t         
          WHERE stceent = g_enterprise
            AND stce001 = g_stdk_m.stdk002
            AND stce009 = g_stdk_m.stdk003
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00056'
            RETURN   #160824-00007#199 161122 by lori add
         END IF 
      ELSE
         #带出符合条件的合约编号及其他栏位
         SELECT stce001,stce021,stce022,stce017,stce018
           INTO l_stce001,l_stce021,l_stce022,l_stce017,l_stce018
           FROM stce_t
          WHERE stceent = g_enterprise
            AND stce009 = g_stdk_m.stdk003
            AND stce008 = '1'
            AND stcestus = 'Y'
         IF SQLCA.SQLcode THEN 
            RETURN   #160824-00007#199 161122 by lori add
         ELSE   
            LET g_stdk_m.stdk002 = l_stce001
            IF NOT cl_null(g_stdk_m.stdk002) THEN 
               IF NOT cl_null(g_stdk_m.stdkdocdt) THEN 
                  SELECT stce024 INTO l_site
                    FROM stce_t
                   WHERE stceent = g_enterprise
                     AND stce001 = g_stdk_m.stdk002
                  #检查关帐日期
                  CALL s_asti206_check(l_site,g_stdk_m.stdkdocdt,'astt606') RETURNING l_success,g_errno
                  IF NOT l_success THEN 
                     RETURN                      
                  END IF
               END IF
            END IF 
            LET g_stdk_m.stdk006 = l_stce017
            LET g_stdk_m.stdk007 = l_stce018
            LET g_stdk_m.stdk008 = l_stce021
            LET g_stdk_m.stdk009 = l_stce022              
            DISPLAY BY NAME g_stdk_m.stdk002,g_stdk_m.stdk006,g_stdk_m.stdk007,
                            g_stdk_m.stdk008,g_stdk_m.stdk009
            SELECT ooef019 INTO l_ooef019
              FROM ooef_t
             WHERE ooefent = g_enterprise
               AND ooef001 = g_stdk_m.stdksite
               
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdk_m.stdk003
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdk_m.stdk003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdk_m.stdk003_desc
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdk_m.stdk008
            CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdk_m.stdk008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdk_m.stdk008_desc
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stdk_m.stdk009
            CALL ap_ref_array2(g_ref_fields,"SELECT oodbl004 FROM oodbl_t WHERE oodblent='"||g_enterprise||"' AND oodbl001 = '"||l_ooef019||"' AND oodbl002=? AND oodbl003='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stdk_m.stdk009_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stdk_m.stdk009_desc
         END IF
      END IF 
   END IF 
   
   #160824-00007#199 161122 by lori add---(S)
   LET g_stdk_m_o.stdk002 = g_stdk_m.stdk002
   LET g_stdk_m_o.stdk006 = g_stdk_m.stdk006
   LET g_stdk_m_o.stdk007 = g_stdk_m.stdk007
   LET g_stdk_m_o.stdk008 = g_stdk_m.stdk008
   LET g_stdk_m_o.stdk009 = g_stdk_m.stdk009
   #160824-00007#199 161122 by lori add---(E)
END FUNCTION

################################################################################
# Descriptions...: 经销商为空检查
# Memo...........:
# Usage..........: CALL astt606_stdk003_null_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/08/18 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt606_stdk003_null_chk()
   DEFINE l_n   LIKE type_t.num5
   
   LET g_errno = ''
   IF NOT cl_null(g_stdk_m.stdk002) THEN
      LET l_n = 0
      #检查经销商是否存在合同中      
      SELECT COUNT(*) INTO l_n
        FROM stce_t         
       WHERE stceent = g_enterprise
         AND stce001 = g_stdk_m.stdk002
         AND stce009 IS NULL
      IF l_n = 0 THEN 
         LET g_errno = 'ast-00089'
      END IF
   END IF
END FUNCTION

################################################################################
# Descriptions...: 谈判人员检查
# Memo...........:
# Usage..........: astt606_stdk004_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/08/18 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt606_stdk004_chk()
DEFINE l_ooag003   LIKE ooag_t.ooag003
DEFINE l_ooagstus  LIKE ooag_t.ooagstus

   LET g_errno = ''
   SELECT ooag003,ooagstus INTO l_ooag003,l_ooagstus
     FROM ooag_t
    WHERE ooagent = g_enterprise
      AND ooag001 = g_stdk_m.stdk004
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'aim-00069'
      WHEN l_ooagstus <> 'Y'   LET g_errno = 'ais-00018'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
   IF cl_null(g_errno) THEN 
      LET g_stdk_m.stdk005 = l_ooag003
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stdk_m.stdk005
      CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stdk_m.stdk005_desc = '', g_rtn_fields[1] , ''
   ELSE
      LET g_stdk_m.stdk005 = ''  
      LET g_stdk_m.stdk005_desc = ''
   END IF
   DISPLAY BY NAME g_stdk_m.stdk005,g_stdk_m.stdk005_desc
END FUNCTION

################################################################################
# Descriptions...: 部门检查
# Memo...........:
# Usage..........: 
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/08/18 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt606_stdk005_chk()
DEFINE l_ooegstus  LIKE ooag_t.ooagstus
DEFINE l_n         LIKE type_t.num5

   LET g_errno = ''
   SELECT ooegstus INTO l_ooegstus
     FROM ooeg_t
    WHERE ooegent = g_enterprise
      AND ooeg001 = g_stdk_m.stdk005
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'art-00352'
      WHEN l_ooegstus <> 'Y'   LET g_errno = 'art-00353'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
   IF cl_null(g_errno) THEN 
      IF NOT cl_null(g_stdk_m.stdk004) THEN
         LET l_n = 0      
         SELECT COUNT(*) INTO l_n
           FROM ooag_t
          WHERE ooagent = g_enterprise
            AND ooag001 = g_stdk_m.stdk004 
            AND ooag003 = g_stdk_m.stdk005
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00058'
         END IF 
      END IF 
   END IF
END FUNCTION

################################################################################
# Descriptions...: 开始结束日期检查
# Memo...........:
# Usage..........: astt606_stdk006_stdk007_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/08/18 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt606_stdk006_stdk007_chk()
   DEFINE l_n   LIKE type_t.num5
   
   LET g_errno = ''
   IF NOT cl_null(g_stdk_m.stdk006) AND NOT cl_null(g_stdk_m.stdk007) THEN 
      IF g_stdk_m.stdk006 > g_stdk_m.stdk007 THEN 
         LET g_errno = 'ast-00063'
         RETURN 
      END IF 
      IF NOT cl_null(g_stdk_m.stdk002) THEN 
         #检查日期范围是否在合约日期范围内
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM stce_t
          WHERE stce001 = g_stdk_m.stdk002
            AND stce017 <= g_stdk_m.stdk006
            AND stce018 >= g_stdk_m.stdk007
            AND stceent = g_enterprise #160905-00007#3
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00096'
            RETURN 
         END IF 
      END IF
   END IF   
   IF NOT cl_null(g_stdk_m.stdk006) AND cl_null(g_stdk_m.stdk007) THEN  
      IF NOT cl_null(g_stdk_m.stdk002) THEN 
         #检查日期范围是否在合约日期范围内
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM stce_t
          WHERE stce001 = g_stdk_m.stdk002
            AND stce017 <= g_stdk_m.stdk006
            AND stce018 >= g_stdk_m.stdk006
            AND stceent = g_enterprise #160905-00007#3
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00096'
            RETURN 
         END IF 
      END IF
   END IF
   IF NOT cl_null(g_stdk_m.stdk007) AND cl_null(g_stdk_m.stdk006) THEN  
      IF NOT cl_null(g_stdk_m.stdk002) THEN 
         #检查日期范围是否在合约日期范围内
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM stce_t
          WHERE stce001 = g_stdk_m.stdk002
            AND stce017 <= g_stdk_m.stdk007
            AND stce018 >= g_stdk_m.stdk007
            AND stceent = g_enterprise #160905-00007#3
         IF l_n = 0 THEN 
            LET g_errno = 'ast-00096'
            RETURN 
         END IF 
      END IF
   END IF   
END FUNCTION

################################################################################
# Descriptions...: 币别检查
# Memo...........:
# Usage..........: 无
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/08/18 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt606_stdk008_chk()
DEFINE l_ooajstus   LIKE ooaj_t.ooajstus

   LET g_errno = ''
   SELECT ooajstus INTO l_ooajstus
     FROM ooaj_t,ooef_t
    WHERE ooajent = ooefent
      AND ooaj001 = ooef014
      AND ooefent = g_enterprise
      AND ooef001 = g_stdk_m.stdksite
      AND ooaj002 = g_stdk_m.stdk008
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'art-00237'
      WHEN l_ooajstus <> 'Y'   LET g_errno = 'art-00238'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
END FUNCTION

################################################################################
# Descriptions...: 检查税种
# Memo...........:
# Usage..........: 无
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/08/18 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt606_stdk009_chk()
DEFINE l_oodbstus   LIKE oodb_t.oodbstus

   LET g_errno = ''
   SELECT oodbstus INTO l_oodbstus
     FROM oodb_t,ooef_t
    WHERE oodbent = g_enterprise
      AND ooef019 = oodb001
      AND ooefent = oodbent
      AND oodb002 = g_stdk_m.stdk009
      AND ooef001 = g_stdk_m.stdksite
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'amm-00419'
      WHEN l_oodbstus <> 'Y'   LET g_errno = 'amm-00420'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
END FUNCTION

################################################################################
# Descriptions...: 网点检查
# Memo...........:
# Usage..........: CALL astt606_stdl003_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/08/18 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt606_stdl003_chk()
   DEFINE l_pmaastus   LIKE pmaa_t.pmaastus
   DEFINE l_n          LIKE type_t.num5
   
   LET g_errno = ''
#   LET l_n = 0
#   SELECT COUNT(*) INTO l_n
#     FROM pmaa_t
#    WHERE pmaa001 = g_stdl_d[l_ac].stdl003
#      AND pmaaent = g_enterprise
#      AND pmaa002 = '2'
#      AND pmaa230 = '2' 
#   IF l_n = 0 THEN 
#      LET g_errno = 'ast-00170'
#      RETURN 
#   END IF 
   
   SELECT pmaastus INTO l_pmaastus 
     FROM pmaa_t 
    WHERE pmaaent = g_enterprise 
      AND pmaa006 = g_stdk_m.stdk003 
      AND pmaa001 = g_stdl_d[l_ac].stdl003
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00043'
      WHEN l_pmaastus <> 'Y'   LET g_errno = 'apr-00273'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
END FUNCTION

################################################################################
# Descriptions...: 费用编号检查
# Memo...........:
# Usage..........: astt606_stdl004_chk()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2014/08/18 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt606_stdl004_chk()
   DEFINE l_staestus LIKE stae_t.staestus
   DEFINE l_stae002  LIKE stae_t.stae002
   DEFINE l_stae006  LIKE stae_t.stae006
   
   LET g_errno = ''
   SELECT staestus,stae002,stae006
     INTO l_staestus,l_stae002,l_stae006
     FROM stae_t
    WHERE stae001 = g_stdl_d[l_ac].stdl004 
      AND staeent = g_enterprise
   CASE 
      WHEN SQLCA.SQLCODE = 100 LET g_errno = 'ast-00001'
      WHEN l_staestus <> 'Y'   LET g_errno = 'ast-00002'
      WHEN l_stae002 <> '2'    LET g_errno = 'ast-00171'
      OTHERWISE                LET g_errno = SQLCA.SQLCODE USING '-------'
   END CASE
   IF cl_null(g_errno) THEN 
      IF l_stae006 = '3' THEN 
         IF cl_null(g_stdl_d_t.stdl004) OR (NOT cl_null(g_stdl_d_t.stdl004) AND g_stdl_d[l_ac].stdl004 != g_stdl_d_t.stdl004) THEN 

         END IF 
         CALL cl_set_comp_entry('stdl005',TRUE)
      ELSE
         IF cl_null(g_stdl_d_t.stdl004) OR (NOT cl_null(g_stdl_d_t.stdl004) AND g_stdl_d[l_ac].stdl004 != g_stdl_d_t.stdl004) THEN 
            LET g_stdl_d[l_ac].stdl005 = l_stae006
         END IF 
         CALL cl_set_comp_entry('stdl005',FALSE)
      END IF 
   END IF 
   
END FUNCTION

 
{</section>}
 
