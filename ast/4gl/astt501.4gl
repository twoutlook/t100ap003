#該程式未解開Section, 採用最新樣板產出!
{<section id="astt501.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0010(2016-09-14 17:20:01), PR版次:0010(2016-11-03 18:41:05)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000202
#+ Filename...: astt501
#+ Description: 專櫃成本調整單維護作業
#+ Creator....: 06814(2015-06-01 14:26:31)
#+ Modifier...: 08172 -SD/PR- 06540
 
{</section>}
 
{<section id="astt501.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#160318-00025#22   2016/04/21   BY 07900   校验代码重复错误讯息的修改
#160816-00068#17   2016/08/23   By 08209   調整transaction
#160818-00017#39   2016-08-30   By 08734   删除修改未重新判断状态码
#160905-00007#16   2016/09/05   By 02599   SQL条件增加ent
#160913-00034#4    2016/09/14   by 08172   q_pmaa001開窗修改
#161024-00025#11   2016/10/28   by 08742   组织开窗调整
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
PRIVATE type type_g_stgh_m        RECORD
       stghsite LIKE stgh_t.stghsite, 
   stghdocdt LIKE stgh_t.stghdocdt, 
   stghdocno LIKE stgh_t.stghdocno, 
   stgh000 LIKE stgh_t.stgh000, 
   stgh001 LIKE stgh_t.stgh001, 
   stgh002 LIKE stgh_t.stgh002, 
   stgh003 LIKE type_t.chr500, 
   stghstus LIKE stgh_t.stghstus, 
   stghownid LIKE stgh_t.stghownid, 
   stghownid_desc LIKE type_t.chr80, 
   stghowndp LIKE stgh_t.stghowndp, 
   stghowndp_desc LIKE type_t.chr80, 
   stghcrtid LIKE stgh_t.stghcrtid, 
   stghcrtid_desc LIKE type_t.chr80, 
   stghcrtdp LIKE stgh_t.stghcrtdp, 
   stghcrtdp_desc LIKE type_t.chr80, 
   stghcrtdt LIKE stgh_t.stghcrtdt, 
   stghmodid LIKE stgh_t.stghmodid, 
   stghmodid_desc LIKE type_t.chr80, 
   stghmoddt LIKE stgh_t.stghmoddt, 
   stghcnfid LIKE stgh_t.stghcnfid, 
   stghcnfid_desc LIKE type_t.chr80, 
   stghcnfdt LIKE stgh_t.stghcnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stgi_d        RECORD
       stgiseq LIKE stgi_t.stgiseq, 
   stgi005 LIKE stgi_t.stgi005, 
   stgi001 LIKE stgi_t.stgi001, 
   stgi001_desc LIKE type_t.chr500, 
   stgi002 LIKE stgi_t.stgi002, 
   stgi002_desc LIKE type_t.chr500, 
   stgi003 LIKE stgi_t.stgi003, 
   stgi003_desc LIKE type_t.chr500, 
   stgi004 LIKE stgi_t.stgi004, 
   stgi004_desc LIKE type_t.chr500, 
   stgi006 LIKE stgi_t.stgi006, 
   stgi006_desc LIKE type_t.chr500, 
   stgi007 LIKE stgi_t.stgi007, 
   stgi008 LIKE stgi_t.stgi008, 
   stgi009 LIKE stgi_t.stgi009, 
   stgi010 LIKE stgi_t.stgi010, 
   stgi011 LIKE stgi_t.stgi011, 
   stgi012 LIKE stgi_t.stgi012, 
   stgi015 LIKE type_t.num20_6, 
   stgi013 LIKE stgi_t.stgi013, 
   stgi014 LIKE stgi_t.stgi014, 
   l_expense LIKE type_t.num20_6
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stghdocno LIKE stgh_t.stghdocno
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE l_stgh000       LIKE stgh_t.stgh000 #add by dengdd 20151202
DEFINE g_ins_site_flag       LIKE type_t.chr1   

#end add-point
       
#模組變數(Module Variables)
DEFINE g_stgh_m          type_g_stgh_m
DEFINE g_stgh_m_t        type_g_stgh_m
DEFINE g_stgh_m_o        type_g_stgh_m
DEFINE g_stgh_m_mask_o   type_g_stgh_m #轉換遮罩前資料
DEFINE g_stgh_m_mask_n   type_g_stgh_m #轉換遮罩後資料
 
   DEFINE g_stghdocno_t LIKE stgh_t.stghdocno
 
 
DEFINE g_stgi_d          DYNAMIC ARRAY OF type_g_stgi_d
DEFINE g_stgi_d_t        type_g_stgi_d
DEFINE g_stgi_d_o        type_g_stgi_d
DEFINE g_stgi_d_mask_o   DYNAMIC ARRAY OF type_g_stgi_d #轉換遮罩前資料
DEFINE g_stgi_d_mask_n   DYNAMIC ARRAY OF type_g_stgi_d #轉換遮罩後資料
 
 
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
 
{<section id="astt501.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE l_success LIKE type_t.num5
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
   LET g_forupd_sql = " SELECT stghsite,stghdocdt,stghdocno,stgh000,stgh001,stgh002,'',stghstus,stghownid, 
       '',stghowndp,'',stghcrtid,'',stghcrtdp,'',stghcrtdt,stghmodid,'',stghmoddt,stghcnfid,'',stghcnfdt", 
        
                      " FROM stgh_t",
                      " WHERE stghent= ? AND stghdocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt501_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stghsite,t0.stghdocdt,t0.stghdocno,t0.stgh000,t0.stgh001,t0.stgh002, 
       t0.stgh003,t0.stghstus,t0.stghownid,t0.stghowndp,t0.stghcrtid,t0.stghcrtdp,t0.stghcrtdt,t0.stghmodid, 
       t0.stghmoddt,t0.stghcnfid,t0.stghcnfdt,t1.ooag011 ,t2.ooefl003 ,t3.ooag011 ,t4.ooefl003 ,t5.ooag011 , 
       t6.ooag011",
               " FROM stgh_t t0",
                              " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.stghownid  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.stghowndp AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t3 ON t3.ooagent="||g_enterprise||" AND t3.ooag001=t0.stghcrtid  ",
               " LEFT JOIN ooefl_t t4 ON t4.ooeflent="||g_enterprise||" AND t4.ooefl001=t0.stghcrtdp AND t4.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.stghmodid  ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.stghcnfid  ",
 
               " WHERE t0.stghent = " ||g_enterprise|| " AND t0.stghdocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt501_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt501 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt501_init()   
 
      #進入選單 Menu (="N")
      CALL astt501_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt501
      
   END IF 
   
   CLOSE astt501_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt501.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt501_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5
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
      CALL cl_set_combo_scc_part('stghstus','13','A,D,R,N,W,Y,X')
 
      CALL cl_set_combo_scc('stgh000','6822') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL s_aooi500_create_temp() RETURNING l_success
   #end add-point
   
   #初始化搜尋條件
   CALL astt501_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt501.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt501_ui_dialog()
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
 
   
   #action default動作
   #應用 a42 樣板自動產生(Version:3)
   #進入程式時預設執行的動作
   CASE g_actdefault
      WHEN "insert"
         LET g_action_choice="insert"
         LET g_actdefault = ""
         IF cl_auth_chk_act("insert") THEN
            CALL astt501_insert()
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
         INITIALIZE g_stgh_m.* TO NULL
         CALL g_stgi_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt501_init()
      END IF
   
            
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
    
         DISPLAY ARRAY g_stgi_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt501_idx_chk()
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
               CALL astt501_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
         
      
         BEFORE DIALOG
            #先填充browser資料
            CALL astt501_browser_fill("")
            CALL cl_notice()
            CALL cl_navigator_setting(g_current_idx, g_detail_cnt)
            LET g_curr_diag = ui.DIALOG.getCurrent()
            LET g_current_sw = FALSE
            #回歸舊筆數位置 (回到當時異動的筆數)
            
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
               CALL astt501_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt501_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt501_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            CALL astt501_set_act_visible()   
            CALL astt501_set_act_no_visible()
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt501_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt501_set_act_visible()   
            CALL astt501_set_act_no_visible()
            IF NOT (g_stgh_m.stghdocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stghent = " ||g_enterprise|| " AND",
                                  " stghdocno = '", g_stgh_m.stghdocno, "' "
 
               #填到對應位置
               CALL astt501_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "stgh_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stgi_t" 
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
               CALL astt501_browser_fill("F")   #browser_fill()會將notice區塊清空
            END IF
         
         #查詢方案選擇
         ON ACTION qbe_select
            CALL cl_qbe_list("m") RETURNING ls_wc
            IF NOT cl_null(ls_wc) THEN
               CALL util.JSON.parse(ls_wc, la_wc)
               INITIALIZE g_wc, g_wc2,g_wc2_table1,g_wc2_extend TO NULL
 
               FOR li_idx = 1 TO la_wc.getLength()
                  CASE
                     WHEN la_wc[li_idx].tableid = "stgh_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stgi_t" 
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
                  CALL astt501_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt501_fetch("F")
                  END IF
               END IF
            END IF
            #重新搜尋會將notice區塊清空,此處不可用EXIT DIALOG, SUBDIALOG重讀會導致部分變數消失
          
         
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt501_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt501_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt501_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt501_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt501_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt501_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt501_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt501_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt501_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt501_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stgi_d)
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
               CALL astt501_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt501_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION upd_detail
            LET g_action_choice="upd_detail"
            IF cl_auth_chk_act("upd_detail") THEN
               
               #add-point:ON ACTION upd_detail name="menu.upd_detail"
               CALL astt501_01(g_stgh_m.stghsite,g_stgh_m.stghdocno,
                               g_stgh_m.stgh000 ,g_stgh_m.stgh001,g_stgh_m.stgh002)
               CALL astt501_b_fill()
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION downloadtemplet
            LET g_action_choice="downloadtemplet"
            IF cl_auth_chk_act("downloadtemplet") THEN
               
               #add-point:ON ACTION downloadtemplet name="menu.downloadtemplet"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt501_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt501_insert()
               #add-point:ON ACTION insert name="menu.insert"
 
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt501_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt501_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt501_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt501_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION uploadtemplet
            LET g_action_choice="uploadtemplet"
            IF cl_auth_chk_act("uploadtemplet") THEN
               
               #add-point:ON ACTION uploadtemplet name="menu.uploadtemplet"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION import
            LET g_action_choice="import"
            IF cl_auth_chk_act("import") THEN
               
               #add-point:ON ACTION import name="menu.import"
               
               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt501_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt501_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt501_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stgh_m.stghdocdt)
 
 
 
         
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
 
{<section id="astt501.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt501_browser_fill(ps_page_action)
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
   CALL s_aooi500_sql_where(g_prog,'stghsite') RETURNING l_where
   IF cl_null(g_wc) THEN
      LET g_wc = l_where
   ELSE
      LET g_wc = g_wc CLIPPED," AND ",l_where
   END IF
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
   
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT stghdocno ",
                      " FROM stgh_t ",
                      " ",
                      " LEFT JOIN stgi_t ON stgient = stghent AND stghdocno = stgidocno ", "  ",
                      #add-point:browser_fill段sql(stgi_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE stghent = " ||g_enterprise|| " AND stgient = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stgh_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stghdocno ",
                      " FROM stgh_t ", 
                      "  ",
                      "  ",
                      " WHERE stghent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stgh_t")
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
      INITIALIZE g_stgh_m.* TO NULL
      CALL g_stgi_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stghdocno Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stghstus,t0.stghdocno ",
                  " FROM stgh_t t0",
                  "  ",
                  "  LEFT JOIN stgi_t ON stgient = stghent AND stghdocno = stgidocno ", "  ", 
                  #add-point:browser_fill段sql(stgi_t1) name="browser_fill.join.stgi_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                  
                  " WHERE t0.stghent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stgh_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stghstus,t0.stghdocno ",
                  " FROM stgh_t t0",
                  "  ",
                  
                  " WHERE t0.stghent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stgh_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY stghdocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stgh_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stghdocno
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
      
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "A"
            LET g_browser[g_cnt].b_statepic = "stus/16/approved.png"
         WHEN "D"
            LET g_browser[g_cnt].b_statepic = "stus/16/withdraw.png"
         WHEN "R"
            LET g_browser[g_cnt].b_statepic = "stus/16/rejection.png"
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "W"
            LET g_browser[g_cnt].b_statepic = "stus/16/signing.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
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
   
   IF cl_null(g_browser[g_cnt].b_stghdocno) THEN
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
 
{<section id="astt501.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt501_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stgh_m.stghdocno = g_browser[g_current_idx].b_stghdocno   
 
   EXECUTE astt501_master_referesh USING g_stgh_m.stghdocno INTO g_stgh_m.stghsite,g_stgh_m.stghdocdt, 
       g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001,g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus, 
       g_stgh_m.stghownid,g_stgh_m.stghowndp,g_stgh_m.stghcrtid,g_stgh_m.stghcrtdp,g_stgh_m.stghcrtdt, 
       g_stgh_m.stghmodid,g_stgh_m.stghmoddt,g_stgh_m.stghcnfid,g_stgh_m.stghcnfdt,g_stgh_m.stghownid_desc, 
       g_stgh_m.stghowndp_desc,g_stgh_m.stghcrtid_desc,g_stgh_m.stghcrtdp_desc,g_stgh_m.stghmodid_desc, 
       g_stgh_m.stghcnfid_desc
   
   CALL astt501_stgh_t_mask()
   CALL astt501_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt501.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt501_ui_detailshow()
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
 
{<section id="astt501.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt501_ui_browser_refresh()
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
      IF g_browser[l_i].b_stghdocno = g_stgh_m.stghdocno 
 
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
 
{<section id="astt501.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt501_construct()
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
   INITIALIZE g_stgh_m.* TO NULL
   CALL g_stgi_d.clear()        
 
   
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
      CONSTRUCT BY NAME g_wc ON stghsite,stghdocdt,stghdocno,stgh000,stgh001,stgh002,stgh003,stghstus, 
          stghownid,stghowndp,stghcrtid,stghcrtdp,stghcrtdt,stghmodid,stghmoddt,stghcnfid,stghcnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stghcrtdt>>----
         AFTER FIELD stghcrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stghmoddt>>----
         AFTER FIELD stghmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stghcnfdt>>----
         AFTER FIELD stghcnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stghpstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.stghsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stghsite
            #add-point:ON ACTION controlp INFIELD stghsite name="construct.c.stghsite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stghsite',g_stgh_m.stghsite,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stghsite  #顯示到畫面上
            NEXT FIELD stghsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghsite
            #add-point:BEFORE FIELD stghsite name="construct.b.stghsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stghsite
            
            #add-point:AFTER FIELD stghsite name="construct.a.stghsite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghdocdt
            #add-point:BEFORE FIELD stghdocdt name="construct.b.stghdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stghdocdt
            
            #add-point:AFTER FIELD stghdocdt name="construct.a.stghdocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stghdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stghdocdt
            #add-point:ON ACTION controlp INFIELD stghdocdt name="construct.c.stghdocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stghdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stghdocno
            #add-point:ON ACTION controlp INFIELD stghdocno name="construct.c.stghdocno"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stghdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stghdocno  #顯示到畫面上
            NEXT FIELD stghdocno                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghdocno
            #add-point:BEFORE FIELD stghdocno name="construct.b.stghdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stghdocno
            
            #add-point:AFTER FIELD stghdocno name="construct.a.stghdocno"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgh000
            #add-point:BEFORE FIELD stgh000 name="construct.b.stgh000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgh000
            
            #add-point:AFTER FIELD stgh000 name="construct.a.stgh000"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stgh000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgh000
            #add-point:ON ACTION controlp INFIELD stgh000 name="construct.c.stgh000"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgh001
            #add-point:BEFORE FIELD stgh001 name="construct.b.stgh001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgh001
            
            #add-point:AFTER FIELD stgh001 name="construct.a.stgh001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stgh001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgh001
            #add-point:ON ACTION controlp INFIELD stgh001 name="construct.c.stgh001"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgh002
            #add-point:BEFORE FIELD stgh002 name="construct.b.stgh002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgh002
            
            #add-point:AFTER FIELD stgh002 name="construct.a.stgh002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stgh002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgh002
            #add-point:ON ACTION controlp INFIELD stgh002 name="construct.c.stgh002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgh003
            #add-point:BEFORE FIELD stgh003 name="construct.b.stgh003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgh003
            
            #add-point:AFTER FIELD stgh003 name="construct.a.stgh003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stgh003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgh003
            #add-point:ON ACTION controlp INFIELD stgh003 name="construct.c.stgh003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghstus
            #add-point:BEFORE FIELD stghstus name="construct.b.stghstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stghstus
            
            #add-point:AFTER FIELD stghstus name="construct.a.stghstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stghstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stghstus
            #add-point:ON ACTION controlp INFIELD stghstus name="construct.c.stghstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stghownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stghownid
            #add-point:ON ACTION controlp INFIELD stghownid name="construct.c.stghownid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stghownid  #顯示到畫面上
            NEXT FIELD stghownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghownid
            #add-point:BEFORE FIELD stghownid name="construct.b.stghownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stghownid
            
            #add-point:AFTER FIELD stghownid name="construct.a.stghownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stghowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stghowndp
            #add-point:ON ACTION controlp INFIELD stghowndp name="construct.c.stghowndp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stghowndp  #顯示到畫面上
            NEXT FIELD stghowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghowndp
            #add-point:BEFORE FIELD stghowndp name="construct.b.stghowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stghowndp
            
            #add-point:AFTER FIELD stghowndp name="construct.a.stghowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stghcrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stghcrtid
            #add-point:ON ACTION controlp INFIELD stghcrtid name="construct.c.stghcrtid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stghcrtid  #顯示到畫面上
            NEXT FIELD stghcrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghcrtid
            #add-point:BEFORE FIELD stghcrtid name="construct.b.stghcrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stghcrtid
            
            #add-point:AFTER FIELD stghcrtid name="construct.a.stghcrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stghcrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stghcrtdp
            #add-point:ON ACTION controlp INFIELD stghcrtdp name="construct.c.stghcrtdp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stghcrtdp  #顯示到畫面上
            NEXT FIELD stghcrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghcrtdp
            #add-point:BEFORE FIELD stghcrtdp name="construct.b.stghcrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stghcrtdp
            
            #add-point:AFTER FIELD stghcrtdp name="construct.a.stghcrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghcrtdt
            #add-point:BEFORE FIELD stghcrtdt name="construct.b.stghcrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stghmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stghmodid
            #add-point:ON ACTION controlp INFIELD stghmodid name="construct.c.stghmodid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stghmodid  #顯示到畫面上
            NEXT FIELD stghmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghmodid
            #add-point:BEFORE FIELD stghmodid name="construct.b.stghmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stghmodid
            
            #add-point:AFTER FIELD stghmodid name="construct.a.stghmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghmoddt
            #add-point:BEFORE FIELD stghmoddt name="construct.b.stghmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stghcnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stghcnfid
            #add-point:ON ACTION controlp INFIELD stghcnfid name="construct.c.stghcnfid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stghcnfid  #顯示到畫面上
            NEXT FIELD stghcnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghcnfid
            #add-point:BEFORE FIELD stghcnfid name="construct.b.stghcnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stghcnfid
            
            #add-point:AFTER FIELD stghcnfid name="construct.a.stghcnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghcnfdt
            #add-point:BEFORE FIELD stghcnfdt name="construct.b.stghcnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stgiseq,stgi005,stgi001,stgi002,stgi003,stgi004,stgi006,stgi007,stgi008, 
          stgi009,stgi010,stgi011,stgi012,stgi015,stgi013,stgi014,l_expense
           FROM s_detail1[1].stgiseq,s_detail1[1].stgi005,s_detail1[1].stgi001,s_detail1[1].stgi002, 
               s_detail1[1].stgi003,s_detail1[1].stgi004,s_detail1[1].stgi006,s_detail1[1].stgi007,s_detail1[1].stgi008, 
               s_detail1[1].stgi009,s_detail1[1].stgi010,s_detail1[1].stgi011,s_detail1[1].stgi012,s_detail1[1].stgi015, 
               s_detail1[1].stgi013,s_detail1[1].stgi014,s_detail1[1].l_expense
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgiseq
            #add-point:BEFORE FIELD stgiseq name="construct.b.page1.stgiseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgiseq
            
            #add-point:AFTER FIELD stgiseq name="construct.a.page1.stgiseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgiseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgiseq
            #add-point:ON ACTION controlp INFIELD stgiseq name="construct.c.page1.stgiseq"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi005
            #add-point:BEFORE FIELD stgi005 name="construct.b.page1.stgi005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi005
            
            #add-point:AFTER FIELD stgi005 name="construct.a.page1.stgi005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgi005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi005
            #add-point:ON ACTION controlp INFIELD stgi005 name="construct.c.page1.stgi005"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stgi001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi001
            #add-point:ON ACTION controlp INFIELD stgi001 name="construct.c.page1.stgi001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_rtdx001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgi001  #顯示到畫面上
            NEXT FIELD stgi001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi001
            #add-point:BEFORE FIELD stgi001 name="construct.b.page1.stgi001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi001
            
            #add-point:AFTER FIELD stgi001 name="construct.a.page1.stgi001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgi002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi002
            #add-point:ON ACTION controlp INFIELD stgi002 name="construct.c.page1.stgi002"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgi002  #顯示到畫面上
            NEXT FIELD stgi002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi002
            #add-point:BEFORE FIELD stgi002 name="construct.b.page1.stgi002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi002
            
            #add-point:AFTER FIELD stgi002 name="construct.a.page1.stgi002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgi003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi003
            #add-point:ON ACTION controlp INFIELD stgi003 name="construct.c.page1.stgi003"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1=g_site
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgi003  #顯示到畫面上
            NEXT FIELD stgi003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi003
            #add-point:BEFORE FIELD stgi003 name="construct.b.page1.stgi003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi003
            
            #add-point:AFTER FIELD stgi003 name="construct.a.page1.stgi003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgi004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi004
            #add-point:ON ACTION controlp INFIELD stgi004 name="construct.c.page1.stgi004"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #160913-00034#4 -s by 08172
            LET g_qryparam.arg1 = "('3')"
            CALL q_pmaa001_1()
#            CALL q_pmaa001()                           #呼叫開窗
            #160913-00034#4 -e by 08172
            DISPLAY g_qryparam.return1 TO stgi004  #顯示到畫面上
            NEXT FIELD stgi004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi004
            #add-point:BEFORE FIELD stgi004 name="construct.b.page1.stgi004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi004
            
            #add-point:AFTER FIELD stgi004 name="construct.a.page1.stgi004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgi006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi006
            #add-point:ON ACTION controlp INFIELD stgi006 name="construct.c.page1.stgi006"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgi006  #顯示到畫面上
            NEXT FIELD stgi006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi006
            #add-point:BEFORE FIELD stgi006 name="construct.b.page1.stgi006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi006
            
            #add-point:AFTER FIELD stgi006 name="construct.a.page1.stgi006"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi007
            #add-point:BEFORE FIELD stgi007 name="construct.b.page1.stgi007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi007
            
            #add-point:AFTER FIELD stgi007 name="construct.a.page1.stgi007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgi007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi007
            #add-point:ON ACTION controlp INFIELD stgi007 name="construct.c.page1.stgi007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi008
            #add-point:BEFORE FIELD stgi008 name="construct.b.page1.stgi008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi008
            
            #add-point:AFTER FIELD stgi008 name="construct.a.page1.stgi008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgi008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi008
            #add-point:ON ACTION controlp INFIELD stgi008 name="construct.c.page1.stgi008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi009
            #add-point:BEFORE FIELD stgi009 name="construct.b.page1.stgi009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi009
            
            #add-point:AFTER FIELD stgi009 name="construct.a.page1.stgi009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgi009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi009
            #add-point:ON ACTION controlp INFIELD stgi009 name="construct.c.page1.stgi009"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi010
            #add-point:BEFORE FIELD stgi010 name="construct.b.page1.stgi010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi010
            
            #add-point:AFTER FIELD stgi010 name="construct.a.page1.stgi010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgi010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi010
            #add-point:ON ACTION controlp INFIELD stgi010 name="construct.c.page1.stgi010"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi011
            #add-point:BEFORE FIELD stgi011 name="construct.b.page1.stgi011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi011
            
            #add-point:AFTER FIELD stgi011 name="construct.a.page1.stgi011"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgi011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi011
            #add-point:ON ACTION controlp INFIELD stgi011 name="construct.c.page1.stgi011"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi012
            #add-point:BEFORE FIELD stgi012 name="construct.b.page1.stgi012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi012
            
            #add-point:AFTER FIELD stgi012 name="construct.a.page1.stgi012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgi012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi012
            #add-point:ON ACTION controlp INFIELD stgi012 name="construct.c.page1.stgi012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi015
            #add-point:BEFORE FIELD stgi015 name="construct.b.page1.stgi015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi015
            
            #add-point:AFTER FIELD stgi015 name="construct.a.page1.stgi015"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgi015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi015
            #add-point:ON ACTION controlp INFIELD stgi015 name="construct.c.page1.stgi015"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi013
            #add-point:BEFORE FIELD stgi013 name="construct.b.page1.stgi013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi013
            
            #add-point:AFTER FIELD stgi013 name="construct.a.page1.stgi013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgi013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi013
            #add-point:ON ACTION controlp INFIELD stgi013 name="construct.c.page1.stgi013"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi014
            #add-point:BEFORE FIELD stgi014 name="construct.b.page1.stgi014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi014
            
            #add-point:AFTER FIELD stgi014 name="construct.a.page1.stgi014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stgi014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi014
            #add-point:ON ACTION controlp INFIELD stgi014 name="construct.c.page1.stgi014"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_expense
            #add-point:BEFORE FIELD l_expense name="construct.b.page1.l_expense"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_expense
            
            #add-point:AFTER FIELD l_expense name="construct.a.page1.l_expense"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.l_expense
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_expense
            #add-point:ON ACTION controlp INFIELD l_expense name="construct.c.page1.l_expense"
            
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
                  WHEN la_wc[li_idx].tableid = "stgh_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stgi_t" 
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
 
{<section id="astt501.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt501_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point   
   DEFINE ls_wc STRING
   #add-point:query段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
   
   #end add-point   
   
   #add-point:Function前置處理  name="query.pre_function"
   
   #end add-point
   
   #切換畫面
   
   LET ls_wc = g_wc
   
   LET INT_FLAG = 0
   CALL cl_navigator_setting( g_current_idx, g_detail_cnt )
   ERROR ""
   
   #清除畫面及相關資料
   CLEAR FORM
   CALL g_browser.clear()       
   CALL g_stgi_d.clear()
 
   
   #add-point:query段other name="query.other"
   CALL astt501_set_comp_visible()
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt501_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt501_browser_fill("")
      CALL astt501_fetch("")
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
   CALL astt501_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt501_fetch("F") 
      #顯示單身筆數
      CALL astt501_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt501.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt501_fetch(p_flag)
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
   LET g_pagestart = g_current_idx
   DISPLAY g_pagestart TO FORMONLY.b_index   #當下筆數
   DISPLAY g_pagestart TO FORMONLY.h_index   #當下筆數
   
   CALL cl_navigator_setting( g_pagestart, g_browser_cnt )
 
   #代表沒有資料
   IF g_current_idx = 0 OR g_browser.getLength() = 0 THEN
      RETURN
   END IF
   
   #避免超出browser資料筆數上限
   IF g_current_idx > g_browser.getLength() THEN
      LET g_browser_idx = g_browser.getLength()
      LET g_current_idx = g_browser.getLength()
   END IF
   
   LET g_stgh_m.stghdocno = g_browser[g_current_idx].b_stghdocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt501_master_referesh USING g_stgh_m.stghdocno INTO g_stgh_m.stghsite,g_stgh_m.stghdocdt, 
       g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001,g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus, 
       g_stgh_m.stghownid,g_stgh_m.stghowndp,g_stgh_m.stghcrtid,g_stgh_m.stghcrtdp,g_stgh_m.stghcrtdt, 
       g_stgh_m.stghmodid,g_stgh_m.stghmoddt,g_stgh_m.stghcnfid,g_stgh_m.stghcnfdt,g_stgh_m.stghownid_desc, 
       g_stgh_m.stghowndp_desc,g_stgh_m.stghcrtid_desc,g_stgh_m.stghcrtdp_desc,g_stgh_m.stghmodid_desc, 
       g_stgh_m.stghcnfid_desc
   
   #遮罩相關處理
   LET g_stgh_m_mask_o.* =  g_stgh_m.*
   CALL astt501_stgh_t_mask()
   LET g_stgh_m_mask_n.* =  g_stgh_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt501_set_act_visible()   
   CALL astt501_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   CALL astt501_set_comp_visible()
   CALL astt501_set_comp_no_visible()
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stgh_m_t.* = g_stgh_m.*
   LET g_stgh_m_o.* = g_stgh_m.*
   
   LET g_data_owner = g_stgh_m.stghownid      
   LET g_data_dept  = g_stgh_m.stghowndp
   
   #重新顯示   
   CALL astt501_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt501.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt501_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_success    LIKE type_t.num5   
   DEFINE l_insert      LIKE type_t.num5  #161024-00025#11   2016/10/28  by 08742   add   
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stgi_d.clear()   
 
 
   INITIALIZE g_stgh_m.* TO NULL             #DEFAULT 設定
   
   LET g_stghdocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stgh_m.stghownid = g_user
      LET g_stgh_m.stghowndp = g_dept
      LET g_stgh_m.stghcrtid = g_user
      LET g_stgh_m.stghcrtdp = g_dept 
      LET g_stgh_m.stghcrtdt = cl_get_current()
      LET g_stgh_m.stghmodid = g_user
      LET g_stgh_m.stghmoddt = cl_get_current()
      LET g_stgh_m.stghstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_stgh_m.stgh000 = "1"
 
  
      #add-point:單頭預設值 name="insert.default"
      LET g_stgh_m.stghsite =g_site
      LET g_stgh_m.stghdocdt=g_today
      LET g_stgh_m.stgh001=g_today-1
      LET g_stgh_m.stgh002=g_today-1
      #DISPLAY BY NAME g_stgh_m.stghsite,g_stgh_m.stghdocdt,g_stgh_m.stgh001,g_stgh_m.stgh002
      CALL s_arti200_get_def_doc_type(g_site,g_prog,'1')
      RETURNING l_success,g_stgh_m.stghdocno
      #161024-00025#11   2016/10/28  by 08742   -S
      LET g_ins_site_flag = '' 
      CALL s_aooi500_default(g_prog,'stghsite',g_stgh_m.stghsite)
         RETURNING l_insert,g_stgh_m.stghsite
      IF l_insert = FALSE THEN
         RETURN
      END IF
      #161024-00025#11   2016/10/28  by 08742   -E
      CALL astt501_set_comp_visible()
      CALL astt501_set_comp_no_visible()
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stgh_m_t.* = g_stgh_m.*
      LET g_stgh_m_o.* = g_stgh_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stgh_m.stghstus 
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
    
      CALL astt501_input("a")
      
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
         INITIALIZE g_stgh_m.* TO NULL
         INITIALIZE g_stgi_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt501_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stgi_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt501_set_act_visible()   
   CALL astt501_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stghdocno_t = g_stgh_m.stghdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stghent = " ||g_enterprise|| " AND",
                      " stghdocno = '", g_stgh_m.stghdocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt501_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt501_cl
   
   CALL astt501_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt501_master_referesh USING g_stgh_m.stghdocno INTO g_stgh_m.stghsite,g_stgh_m.stghdocdt, 
       g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001,g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus, 
       g_stgh_m.stghownid,g_stgh_m.stghowndp,g_stgh_m.stghcrtid,g_stgh_m.stghcrtdp,g_stgh_m.stghcrtdt, 
       g_stgh_m.stghmodid,g_stgh_m.stghmoddt,g_stgh_m.stghcnfid,g_stgh_m.stghcnfdt,g_stgh_m.stghownid_desc, 
       g_stgh_m.stghowndp_desc,g_stgh_m.stghcrtid_desc,g_stgh_m.stghcrtdp_desc,g_stgh_m.stghmodid_desc, 
       g_stgh_m.stghcnfid_desc
   
   
   #遮罩相關處理
   LET g_stgh_m_mask_o.* =  g_stgh_m.*
   CALL astt501_stgh_t_mask()
   LET g_stgh_m_mask_n.* =  g_stgh_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stgh_m.stghsite,g_stgh_m.stghdocdt,g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001, 
       g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus,g_stgh_m.stghownid,g_stgh_m.stghownid_desc, 
       g_stgh_m.stghowndp,g_stgh_m.stghowndp_desc,g_stgh_m.stghcrtid,g_stgh_m.stghcrtid_desc,g_stgh_m.stghcrtdp, 
       g_stgh_m.stghcrtdp_desc,g_stgh_m.stghcrtdt,g_stgh_m.stghmodid,g_stgh_m.stghmodid_desc,g_stgh_m.stghmoddt, 
       g_stgh_m.stghcnfid,g_stgh_m.stghcnfid_desc,g_stgh_m.stghcnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stgh_m.stghownid      
   LET g_data_dept  = g_stgh_m.stghowndp
   
   #功能已完成,通報訊息中心
   CALL astt501_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt501.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt501_modify()
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
   LET g_stgh_m_t.* = g_stgh_m.*
   LET g_stgh_m_o.* = g_stgh_m.*
   
   IF g_stgh_m.stghdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stghdocno_t = g_stgh_m.stghdocno
 
   CALL s_transaction_begin()
   
   OPEN astt501_cl USING g_enterprise,g_stgh_m.stghdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt501_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt501_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt501_master_referesh USING g_stgh_m.stghdocno INTO g_stgh_m.stghsite,g_stgh_m.stghdocdt, 
       g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001,g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus, 
       g_stgh_m.stghownid,g_stgh_m.stghowndp,g_stgh_m.stghcrtid,g_stgh_m.stghcrtdp,g_stgh_m.stghcrtdt, 
       g_stgh_m.stghmodid,g_stgh_m.stghmoddt,g_stgh_m.stghcnfid,g_stgh_m.stghcnfdt,g_stgh_m.stghownid_desc, 
       g_stgh_m.stghowndp_desc,g_stgh_m.stghcrtid_desc,g_stgh_m.stghcrtdp_desc,g_stgh_m.stghmodid_desc, 
       g_stgh_m.stghcnfid_desc
   
   #檢查是否允許此動作
   IF NOT astt501_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stgh_m_mask_o.* =  g_stgh_m.*
   CALL astt501_stgh_t_mask()
   LET g_stgh_m_mask_n.* =  g_stgh_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   CALL astt501_set_comp_visible()
   CALL astt501_set_comp_no_visible()
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL astt501_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_stghdocno_t = g_stgh_m.stghdocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stgh_m.stghmodid = g_user 
LET g_stgh_m.stghmoddt = cl_get_current()
LET g_stgh_m.stghmodid_desc = cl_get_username(g_stgh_m.stghmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt501_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stgh_t SET (stghmodid,stghmoddt) = (g_stgh_m.stghmodid,g_stgh_m.stghmoddt)
          WHERE stghent = g_enterprise AND stghdocno = g_stghdocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stgh_m.* = g_stgh_m_t.*
            CALL astt501_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stgh_m.stghdocno != g_stgh_m_t.stghdocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stgi_t SET stgidocno = g_stgh_m.stghdocno
 
          WHERE stgient = g_enterprise AND stgidocno = g_stgh_m_t.stghdocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stgi_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stgi_t:",SQLERRMESSAGE 
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
   CALL astt501_set_act_visible()   
   CALL astt501_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stghent = " ||g_enterprise|| " AND",
                      " stghdocno = '", g_stgh_m.stghdocno, "' "
 
   #填到對應位置
   CALL astt501_browser_fill("")
 
   CLOSE astt501_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt501_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt501.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt501_input(p_cmd)
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
   DEFINE l_ooef004             LIKE ooef_t.ooef004
   DEFINE l_success             LIKE type_t.num5
   DEFINE l_calcflag            LIKE type_t.chr1   #asti202中 實收金額flag
   DEFINE l_cnt_stga            LIKE type_t.num10
   DEFINE l_cnt_detail          LIKE type_t.num10
   DEFINE l_cnt_stgi013         LIKE type_t.num5
   DEFINE l_cnt_stgi014         LIKE type_t.num5
   DEFINE l_inaa135             LIKE inaa_t.inaa135  #add by dengdd 20151202
   DEFINE l_pmaa002             LIKE pmaa_t.pmaa002  #160913-00034#4 by 08172
   DEFINE  l_errno              LIKE type_t.chr10    #161024-00025#11   2016/10/28  by 08742   add
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
   DISPLAY BY NAME g_stgh_m.stghsite,g_stgh_m.stghdocdt,g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001, 
       g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus,g_stgh_m.stghownid,g_stgh_m.stghownid_desc, 
       g_stgh_m.stghowndp,g_stgh_m.stghowndp_desc,g_stgh_m.stghcrtid,g_stgh_m.stghcrtid_desc,g_stgh_m.stghcrtdp, 
       g_stgh_m.stghcrtdp_desc,g_stgh_m.stghcrtdt,g_stgh_m.stghmodid,g_stgh_m.stghmodid_desc,g_stgh_m.stghmoddt, 
       g_stgh_m.stghcnfid,g_stgh_m.stghcnfid_desc,g_stgh_m.stghcnfdt
   
   #切換畫面
 
   CALL cl_set_head_visible("","YES")  
 
   LET l_insert = FALSE
   LET g_action_choice = ""
 
   #add-point:input段define_sql name="input.define_sql"
   
   #end add-point 
   LET g_forupd_sql = "SELECT stgiseq,stgi005,stgi001,stgi002,stgi003,stgi004,stgi006,stgi007,stgi008, 
       stgi009,stgi010,stgi011,stgi012,stgi015,stgi013,stgi014 FROM stgi_t WHERE stgient=? AND stgidocno=?  
       AND stgiseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt501_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt501_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt501_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stgh_m.stghsite,g_stgh_m.stghdocdt,g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001, 
       g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt501.input.head" >}
      #單頭段
      INPUT BY NAME g_stgh_m.stghsite,g_stgh_m.stghdocdt,g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001, 
          g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt501_cl USING g_enterprise,g_stgh_m.stghdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt501_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt501_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt501_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL astt501_set_no_entry(p_cmd)
    
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghsite
            #add-point:BEFORE FIELD stghsite name="input.b.stghsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stghsite
            
            #add-point:AFTER FIELD stghsite name="input.a.stghsite"
            #161024-00025#11   2016/10/28  by 08742   -S
            LET l_success = NULL
            LET l_errno = NULL
            IF NOT cl_null(g_stgh_m.stghsite) THEN
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stgh_m.stghsite != g_stgh_m_t.stghsite )) THEN
                  CALL s_aooi500_chk(g_prog,'stghsite',g_stgh_m.stghsite,g_site)
                  RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     
                     
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ""
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     NEXT FIELD CURRENT
                  ELSE
                     LET g_ins_site_flag = 'Y'
                  END IF
               END IF
            END IF
            CALL astt501_set_entry(p_cmd)   #單身時記得須改用l_cmd
            CALL astt501_set_no_entry(p_cmd)   #單身時記得須改用l_cmd
            #161024-00025#11   2016/10/28  by 08742   -S
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stghsite
            #add-point:ON CHANGE stghsite name="input.g.stghsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghdocdt
            #add-point:BEFORE FIELD stghdocdt name="input.b.stghdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stghdocdt
            
            #add-point:AFTER FIELD stghdocdt name="input.a.stghdocdt"
 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stghdocdt
            #add-point:ON CHANGE stghdocdt name="input.g.stghdocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghdocno
            #add-point:BEFORE FIELD stghdocno name="input.b.stghdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stghdocno
            
            #add-point:AFTER FIELD stghdocno name="input.a.stghdocno"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  NOT cl_null(g_stgh_m.stghdocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stgh_m.stghdocno != g_stghdocno_t )) THEN 
                  IF NOT s_aooi200_chk_slip(g_site,'',g_stgh_m.stghdocno,g_prog) THEN
                     LET g_stgh_m.stghdocno =  g_stgh_m_t.stghdocno                    
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF

            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stghdocno
            #add-point:ON CHANGE stghdocno name="input.g.stghdocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgh000
            #add-point:BEFORE FIELD stgh000 name="input.b.stgh000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgh000
            
            #add-point:AFTER FIELD stgh000 name="input.a.stgh000"
            CALL astt501_set_comp_visible()
            CALL astt501_set_comp_no_visible()
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgh000
            #add-point:ON CHANGE stgh000 name="input.g.stgh000"
            CALL astt501_set_comp_visible()
            CALL astt501_set_comp_no_visible()
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgh001
            #add-point:BEFORE FIELD stgh001 name="input.b.stgh001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgh001
            
            #add-point:AFTER FIELD stgh001 name="input.a.stgh001"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgh001
            #add-point:ON CHANGE stgh001 name="input.g.stgh001"
            IF g_stgh_m.stgh001>g_stgh_m.stgh002 THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.code   = "acr-00068"
               LET g_errparam.extend = ''               
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               LET g_stgh_m.stgh001=g_stgh_m_o.stgh001
               NEXT FIELD stgh001
            END IF
            LET g_stgh_m_o.stgh001=g_stgh_m.stgh001
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgh002
            #add-point:BEFORE FIELD stgh002 name="input.b.stgh002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgh002
            
            #add-point:AFTER FIELD stgh002 name="input.a.stgh002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgh002
            #add-point:ON CHANGE stgh002 name="input.g.stgh002"
            IF g_stgh_m.stgh002<g_stgh_m.stgh001 THEN
               LET g_stgh_m.stgh002=g_stgh_m_o.stgh002
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.code   = "aap-00336"
               LET g_errparam.extend = ''               
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               NEXT FIELD stgh002
            END IF
            LET g_stgh_m_o.stgh002=g_stgh_m.stgh002
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgh003
            #add-point:BEFORE FIELD stgh003 name="input.b.stgh003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgh003
            
            #add-point:AFTER FIELD stgh003 name="input.a.stgh003"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgh003
            #add-point:ON CHANGE stgh003 name="input.g.stgh003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stghstus
            #add-point:BEFORE FIELD stghstus name="input.b.stghstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stghstus
            
            #add-point:AFTER FIELD stghstus name="input.a.stghstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stghstus
            #add-point:ON CHANGE stghstus name="input.g.stghstus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stghsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stghsite
            #add-point:ON ACTION controlp INFIELD stghsite name="input.c.stghsite"
            #add by dengdd 151202(S)
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
             LET g_qryparam.default1 = g_stgh_m.stghsite
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stghsite',g_stgh_m.stghsite,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            LET g_stgh_m.stghsite = g_qryparam.return1
            DISPLAY g_stgh_m.stghsite TO stghsite  #顯示到畫面上
            NEXT FIELD stghsite                     #返回原欄位
            #add by dengdd 151202(E)
            #END add-point
 
 
         #Ctrlp:input.c.stghdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stghdocdt
            #add-point:ON ACTION controlp INFIELD stghdocdt name="input.c.stghdocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stghdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stghdocno
            #add-point:ON ACTION controlp INFIELD stghdocno name="input.c.stghdocno"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stgh_m.stghdocno             #給予default值

            #給予arg
            LET l_ooef004 = ''            
            SELECT ooef004 INTO l_ooef004 FROM ooef_t WHERE ooef001 = g_site AND ooefent  = g_enterprise            
            LET g_qryparam.arg1 = l_ooef004 #
            LET g_qryparam.arg2 = g_prog #
            
            CALL q_ooba002_1()                                #呼叫開窗

            LET g_stgh_m.stghdocno = g_qryparam.return1              

            DISPLAY g_stgh_m.stghdocno TO stghdocno              #

            NEXT FIELD stghdocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.stgh000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgh000
            #add-point:ON ACTION controlp INFIELD stgh000 name="input.c.stgh000"
            
            #END add-point
 
 
         #Ctrlp:input.c.stgh001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgh001
            #add-point:ON ACTION controlp INFIELD stgh001 name="input.c.stgh001"
            
            #END add-point
 
 
         #Ctrlp:input.c.stgh002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgh002
            #add-point:ON ACTION controlp INFIELD stgh002 name="input.c.stgh002"
            
            #END add-point
 
 
         #Ctrlp:input.c.stgh003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgh003
            #add-point:ON ACTION controlp INFIELD stgh003 name="input.c.stgh003"
            
            #END add-point
 
 
         #Ctrlp:input.c.stghstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stghstus
            #add-point:ON ACTION controlp INFIELD stghstus name="input.c.stghstus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stgh_m.stghdocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               IF NOT s_aooi200_chk_slip(g_stgh_m.stghsite,'',g_stgh_m.stghdocno,g_prog) THEN
                  LET g_stgh_m.stghdocno = ''
                  NEXT FIELD stghdocno
               END IF
               CALL s_aooi200_gen_docno(g_site,g_stgh_m.stghdocno,g_stgh_m.stghdocdt,g_prog) RETURNING l_success,g_stgh_m.stghdocno
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_stgh_m.stghdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CONTINUE DIALOG                  
               END IF
               #end add-point
               
               INSERT INTO stgh_t (stghent,stghsite,stghdocdt,stghdocno,stgh000,stgh001,stgh002,stgh003, 
                   stghstus,stghownid,stghowndp,stghcrtid,stghcrtdp,stghcrtdt,stghmodid,stghmoddt,stghcnfid, 
                   stghcnfdt)
               VALUES (g_enterprise,g_stgh_m.stghsite,g_stgh_m.stghdocdt,g_stgh_m.stghdocno,g_stgh_m.stgh000, 
                   g_stgh_m.stgh001,g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus,g_stgh_m.stghownid, 
                   g_stgh_m.stghowndp,g_stgh_m.stghcrtid,g_stgh_m.stghcrtdp,g_stgh_m.stghcrtdt,g_stgh_m.stghmodid, 
                   g_stgh_m.stghmoddt,g_stgh_m.stghcnfid,g_stgh_m.stghcnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stgh_m:",SQLERRMESSAGE 
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
                  CALL astt501_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt501_b_fill()
                  CALL astt501_b_fill2('0')
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
               CALL astt501_stgh_t_mask_restore('restore_mask_o')
               
               UPDATE stgh_t SET (stghsite,stghdocdt,stghdocno,stgh000,stgh001,stgh002,stgh003,stghstus, 
                   stghownid,stghowndp,stghcrtid,stghcrtdp,stghcrtdt,stghmodid,stghmoddt,stghcnfid,stghcnfdt) = (g_stgh_m.stghsite, 
                   g_stgh_m.stghdocdt,g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001,g_stgh_m.stgh002, 
                   g_stgh_m.stgh003,g_stgh_m.stghstus,g_stgh_m.stghownid,g_stgh_m.stghowndp,g_stgh_m.stghcrtid, 
                   g_stgh_m.stghcrtdp,g_stgh_m.stghcrtdt,g_stgh_m.stghmodid,g_stgh_m.stghmoddt,g_stgh_m.stghcnfid, 
                   g_stgh_m.stghcnfdt)
                WHERE stghent = g_enterprise AND stghdocno = g_stghdocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stgh_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt501_stgh_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stgh_m_t)
               LET g_log2 = util.JSON.stringify(g_stgh_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stghdocno_t = g_stgh_m.stghdocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt501.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stgi_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            IF g_stgh_m.stgh000 = '1' OR g_stgh_m.stgh000 = '2' THEN
                  LET l_cnt_stga = 0
                  #檢查stga_t是否有符合此日期區間的資料
                  CALL astt501_cnt_stga() RETURNING l_cnt_stga
                  CALL astt501_set_act_visible()   
                  CALL astt501_set_act_no_visible()
                  IF l_cnt_stga>0  THEN
                     IF cl_ask_confirm('ast-00338') THEN
                        CALL astt501_01(g_stgh_m.stghsite,g_stgh_m.stghdocno,
                                        g_stgh_m.stgh000 ,g_stgh_m.stgh001,g_stgh_m.stgh002)
                        CALL astt501_b_fill()
                     END IF
                  ELSE
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code   = "ast-00355" 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                  END IF
            END IF
            CALL astt501_set_entry(p_cmd)
            CALL astt501_set_no_entry(p_cmd)
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stgi_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt501_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stgi_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
            #add by dengdd 151201(S)
            IF g_stgh_m.stgh000='7' THEN
               CALL cl_set_comp_entry('stgi008,stgi009',TRUE)
            END IF
            #add by dengdd 151201(E)
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
            OPEN astt501_cl USING g_enterprise,g_stgh_m.stghdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt501_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt501_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stgi_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stgi_d[l_ac].stgiseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stgi_d_t.* = g_stgi_d[l_ac].*  #BACKUP
               LET g_stgi_d_o.* = g_stgi_d[l_ac].*  #BACKUP
               CALL astt501_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt501_set_no_entry_b(l_cmd)
               IF NOT astt501_lock_b("stgi_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt501_bcl INTO g_stgi_d[l_ac].stgiseq,g_stgi_d[l_ac].stgi005,g_stgi_d[l_ac].stgi001, 
                      g_stgi_d[l_ac].stgi002,g_stgi_d[l_ac].stgi003,g_stgi_d[l_ac].stgi004,g_stgi_d[l_ac].stgi006, 
                      g_stgi_d[l_ac].stgi007,g_stgi_d[l_ac].stgi008,g_stgi_d[l_ac].stgi009,g_stgi_d[l_ac].stgi010, 
                      g_stgi_d[l_ac].stgi011,g_stgi_d[l_ac].stgi012,g_stgi_d[l_ac].stgi015,g_stgi_d[l_ac].stgi013, 
                      g_stgi_d[l_ac].stgi014
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stgi_d_t.stgiseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stgi_d_mask_o[l_ac].* =  g_stgi_d[l_ac].*
                  CALL astt501_stgi_t_mask()
                  LET g_stgi_d_mask_n[l_ac].* =  g_stgi_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt501_show()
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
            INITIALIZE g_stgi_d[l_ac].* TO NULL 
            INITIALIZE g_stgi_d_t.* TO NULL 
            INITIALIZE g_stgi_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stgi_d[l_ac].stgi007 = "0"
      LET g_stgi_d[l_ac].stgi008 = "0"
      LET g_stgi_d[l_ac].stgi009 = "0"
      LET g_stgi_d[l_ac].stgi010 = "0"
      LET g_stgi_d[l_ac].stgi011 = "0"
      LET g_stgi_d[l_ac].stgi012 = "0"
      LET g_stgi_d[l_ac].stgi015 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            SELECT COALESCE(MAX(stgiseq),0)+1 INTO g_stgi_d[l_ac].stgiseq
              FROM stgi_t
             WHERE stgient= g_enterprise
               AND stgidocno= g_stgh_m.stghdocno
            #end add-point
            LET g_stgi_d_t.* = g_stgi_d[l_ac].*     #新輸入資料
            LET g_stgi_d_o.* = g_stgi_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt501_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt501_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stgi_d[li_reproduce_target].* = g_stgi_d[li_reproduce].*
 
               LET g_stgi_d[li_reproduce_target].stgiseq = NULL
 
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
            SELECT COUNT(1) INTO l_count FROM stgi_t 
             WHERE stgient = g_enterprise AND stgidocno = g_stgh_m.stghdocno
 
               AND stgiseq = g_stgi_d[l_ac].stgiseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stgh_m.stghdocno
               LET gs_keys[2] = g_stgi_d[g_detail_idx].stgiseq
               CALL astt501_insert_b('stgi_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stgi_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stgi_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt501_b_fill()
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
               LET gs_keys[01] = g_stgh_m.stghdocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stgi_d_t.stgiseq
 
            
               #刪除同層單身
               IF NOT astt501_delete_b('stgi_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt501_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt501_key_delete_b(gs_keys,'stgi_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt501_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt501_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stgi_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stgi_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgiseq
            #add-point:BEFORE FIELD stgiseq name="input.b.page1.stgiseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgiseq
            
            #add-point:AFTER FIELD stgiseq name="input.a.page1.stgiseq"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  g_stgh_m.stghdocno IS NOT NULL AND g_stgi_d[g_detail_idx].stgiseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stgh_m.stghdocno != g_stghdocno_t OR g_stgi_d[g_detail_idx].stgiseq != g_stgi_d_t.stgiseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stgi_t WHERE "||"stgient = '" ||g_enterprise|| "' AND "||"stgidocno = '"||g_stgh_m.stghdocno ||"' AND "|| "stgiseq = '"||g_stgi_d[g_detail_idx].stgiseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgiseq
            #add-point:ON CHANGE stgiseq name="input.g.page1.stgiseq"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi005
            #add-point:BEFORE FIELD stgi005 name="input.b.page1.stgi005"
 
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi005
            
            #add-point:AFTER FIELD stgi005 name="input.a.page1.stgi005"
            #150429-00011#22 20151106 mark by beckxie---S
            #IF NOT (cl_null(g_stgi_d[l_ac].stgi001) OR cl_null(g_stgi_d[l_ac].stgi002) OR cl_null(g_stgi_d[l_ac].stgi005)) THEN
            #   IF g_stgi_d_O.stgi001!=g_stgi_d[l_ac].stgi001 THEN
            #      CALL astt501_stgi002_def()
            #   END IF
            #END IF
            #150429-00011#22 20151106 mark by beckxie---E
            #150429-00011#22 20151106 add by beckxie---S
            IF NOT (cl_null(g_stgi_d[l_ac].stgi001) OR cl_null(g_stgi_d[l_ac].stgi002) OR cl_null(g_stgi_d[l_ac].stgi005)) 
                AND (g_stgh_m.stgh000 = '1' OR g_stgh_m.stgh000 = '2'
                 OR  g_stgh_m.stgh000 = '7') THEN     #add by dengdd 151202
               IF g_stgi_d_o.stgi001!=g_stgi_d[l_ac].stgi001 OR cl_null(g_stgi_d_o.stgi001) OR
                  g_stgi_d_o.stgi002!=g_stgi_d[l_ac].stgi002 OR cl_null(g_stgi_d_o.stgi002) OR
                  g_stgi_d_o.stgi005!=g_stgi_d[l_ac].stgi005 OR cl_null(g_stgi_d_o.stgi005) THEN
                  CALL astt501_stgi002_def()
               END IF
            END IF
            #150429-00011#22 20151106 add by beckxie---E
#            IF g_stgh_m.stgh000='1' OR g_stgh_m.stgh000='2' THEN  #mark by dengdd 151202
            IF g_stgh_m.stgh000='1' OR g_stgh_m.stgh000='2' OR g_stgh_m.stgh000='7' THEN #add by dengdd 151202
               IF NOT (g_stgh_m.stgh002 >=g_stgi_d[l_ac].stgi005 AND g_stgi_d[l_ac].stgi005 >= g_stgh_m.stgh001) THEN
                  LET g_stgi_d[l_ac].stgi005=g_stgi_d_o.stgi005
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.code   = "ast-00304"
                  LET g_errparam.extend = ''               
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD stgi005
               END IF
            ELSE#類型為3,4,5,6時,不能用起始日截止日判斷
               IF g_stgi_d[l_ac].stgi005>g_today THEN
                  LET g_stgi_d[l_ac].stgi005=g_stgi_d_o.stgi005
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.code   = "ast-00320"
                  LET g_errparam.extend = ''               
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD stgi005
               END IF
            END IF
            LET g_stgi_d_o.stgi005=g_stgi_d[l_ac].stgi005
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi005
            #add-point:ON CHANGE stgi005 name="input.g.page1.stgi005"
    #        IF g_stgh_m.stgh000='1' OR g_stgh_m.stgh000='2' THEN
            IF g_stgh_m.stgh000='1' OR g_stgh_m.stgh000='2' OR g_stgh_m.stgh000='7' THEN  #mod by dengdd 151202
               IF NOT (g_stgh_m.stgh002 >=g_stgi_d[l_ac].stgi005 AND g_stgi_d[l_ac].stgi005 >= g_stgh_m.stgh001) THEN
                  LET g_stgi_d[l_ac].stgi005=g_stgi_d_o.stgi005
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.code   = "ast-00304"
                  LET g_errparam.extend = ''               
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD stgi005
               END IF
            ELSE#類型為3,4,5,6時,不能用起始日截止日判斷
               IF g_stgi_d[l_ac].stgi005>g_today THEN
                  LET g_stgi_d[l_ac].stgi005=g_stgi_d_o.stgi005
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.code   = "ast-00320"
                  LET g_errparam.extend = ''               
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  NEXT FIELD stgi005
               END IF
            END IF
            #LET g_stgi_d_o.stgi005=g_stgi_d[l_ac].stgi005
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi001
            
            #add-point:AFTER FIELD stgi001 name="input.a.page1.stgi001"
            
            IF NOT cl_null(g_stgi_d[l_ac].stgi001) THEN
               IF g_stgi_d[l_ac].stgi001 != g_stgi_d_o.stgi001 OR cl_null(g_stgi_d_o.stgi001)   THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stgi_d[l_ac].stgi001
                  LET g_chkparam.arg2 = g_site
                  LET g_chkparam.where = " rtdx003 = '3' OR rtdx003 = '4' OR rtdx003 = '5'"
                  IF NOT cl_chk_exist("v_rtdx001") THEN
                     LET g_stgi_d[l_ac].stgi001 = g_stgi_d_o.stgi001
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            
            CALL astt501_stgi002_ref()   #150429-00011#22 20151105 add by beckxie
            #150429-00011#22 20151106 mark by beckxie---S
            #IF NOT (cl_null(g_stgi_d[l_ac].stgi001) OR cl_null(g_stgi_d[l_ac].stgi002) OR cl_null(g_stgi_d[l_ac].stgi005)) 
            #AND (g_stgh_m.stgh000 = '1' OR g_stgh_m.stgh000 = '2') THEN   #mod by dengdd 15/10/28 ---去掉NOT
            #   CALL astt501_stgi002_def()  
            #END IF
            #150429-00011#22 20151106 mark by beckxie---E
            #150429-00011#22 20151106  add by beckxie---S
            IF NOT (cl_null(g_stgi_d[l_ac].stgi001) OR cl_null(g_stgi_d[l_ac].stgi002) OR cl_null(g_stgi_d[l_ac].stgi005)) 
            AND (g_stgh_m.stgh000 = '1' OR g_stgh_m.stgh000 = '2' 
             OR  g_stgh_m.stgh000 = '7' ) THEN   #mod by dengdd 15/10/28 ---去掉NOT 
                                                 #add by dengdd stgh000='7' 20151202
               IF g_stgi_d_o.stgi001!=g_stgi_d[l_ac].stgi001 OR cl_null(g_stgi_d_o.stgi001) OR
                  g_stgi_d_o.stgi002!=g_stgi_d[l_ac].stgi002 OR cl_null(g_stgi_d_o.stgi002) OR
                  g_stgi_d_o.stgi005!=g_stgi_d[l_ac].stgi005 OR cl_null(g_stgi_d_o.stgi005) THEN
                  CALL astt501_stgi002_def()
               END IF
            END IF
            #150429-00011#22 20151106  add by beckxie---E
            LET g_stgi_d_o.stgi001 = g_stgi_d[l_ac].stgi001
            
            CALL astt501_stgi001_ref()   #150429-00011#22 20151105 add by beckxie
            #150429-00011#22 20151105 mark by beckxie---S
            #INITIALIZE g_ref_fields TO NULL
            #LET g_ref_fields[1] = g_stgi_d[l_ac].stgi001
            #CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            #LET g_stgi_d[l_ac].stgi001_desc = '', g_rtn_fields[1] , ''
            #150429-00011#22 20151105 mark by beckxie---E
#            DISPLAY BY NAME g_stgi_d[l_ac].stgi001_desc

            #取artq400的库区编号--add by dengdd 15/10/28(S)
            SELECT rtdx044 INTO g_stgi_d[l_ac].stgi002 
              FROM rtdx_t
             WHERE rtdxent=g_enterprise
               AND rtdxsite=g_site
               AND rtdx001=g_stgi_d[l_ac].stgi001
            #取artq400的库区编号--add by dengdd 15/10/28(E)
            
            #add by dengdd 20151202(S)--判断库区类型（常规/促销/多级扣率）
            IF g_stgh_m.stgh000='7' THEN
               SELECT inaa135 INTO l_inaa135
                 FROM inaa_t
                WHERE inaaent=g_enterprise
                  AND inaasite=g_site
                  AND inaa001=g_stgi_d[l_ac].stgi002
               
               IF l_inaa135='1' OR l_inaa135='3' THEN #常规/多级扣率取日结类型为1，14的费率
                  LET l_stgh000='1'
               ELSE
                  LET l_stgh000='2'                   #促销取日结类型为7的费率
               END IF
            END IF
            #add by dengdd 20151202(E)
            #add by dengdd 160109(S)
            #从库区基本资料中取出专柜资料
            SELECT inaa120 INTO g_stgi_d[l_ac].stgi003
              FROM inaa_t 
             WHERE inaaent=g_enterprise
               AND inaasite=g_stgh_m.stghsite
               AND inaa001=g_stgi_d[l_ac].stgi002
               
             DISPLAY BY NAME g_stgi_d[l_ac].stgi002,g_stgi_d[l_ac].stgi003
             
            #根据专柜从stey表里取调整日期>=最小执行日期的供应商
            SELECT stey002 INTO g_stgi_d[l_ac].stgi004 
                      FROM (SELECT MIN(stey003) a,stey002 FROM stey_t 
                             WHERE steyent=g_enterprise 
                               AND steysite=g_stgh_m.stghsite 
                               AND stey001=g_stgi_d[l_ac].stgi003
                               GROUP BY stey002)
             WHERE a<= g_stgi_d[l_ac].stgi005 
             
             #如果取不到值，则从专柜基本资料中取供应商
             IF cl_null(g_stgi_d[l_ac].stgi004) THEN
                SELECT mhae006 INTO g_stgi_d[l_ac].stgi004 FROM mhae_t
                 WHERE mhaeent=g_enterprise AND mhaesite=g_stgh_m.stghsite
                   AND mhae001=g_stgi_d[l_ac].stgi003
             END IF
             
             CALL astt501_stgi002_ref()
             CALL astt501_stgi003_ref()
             CALL astt501_stgi004_ref()
             #add by dengdd 160109(E)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi001
            #add-point:BEFORE FIELD stgi001 name="input.b.page1.stgi001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi001
            #add-point:ON CHANGE stgi001 name="input.g.page1.stgi001"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi002
            
            #add-point:AFTER FIELD stgi002 name="input.a.page1.stgi002"
            IF NOT cl_null(g_stgi_d[l_ac].stgi002) THEN
               IF g_stgi_d[l_ac].stgi002 <> g_stgi_d_o.stgi002 OR cl_null(g_stgi_d_o.stgi002) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  #mark by dengdd 160109(S)
#                  LET g_chkparam.arg1 = g_stgi_d[l_ac].stgi002
#                  IF NOT cl_chk_exist("v_stga003") THEN
                  #mark by dengdd 160109(E)
                  #add by dengdd 160109(S)
                  LET g_chkparam.arg1 = g_stgh_m.stghsite
                  LET g_chkparam.arg2 = g_stgi_d[l_ac].stgi002
                  #160318-00025#22  by 07900 --add-str
                  LET g_errshow = TRUE #是否開窗                   
                  LET g_chkparam.err_str[1] ="aim-00065:sub-01302|aini001|",cl_get_progname("aini001",g_lang,"2"),"|:EXEPROGaini001"
                  #160318-00025#22  by 07900 --add-end 
                  IF NOT cl_chk_exist("v_inaa001") THEN
                  #add by dengdd 160109(E)
                     LET g_stgi_d[l_ac].stgi002 = g_stgi_d_o.stgi002
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            #150429-00011#22 20151106  mark by beckxie---S
            #IF NOT (cl_null(g_stgi_d[l_ac].stgi001) OR cl_null(g_stgi_d[l_ac].stgi002) OR cl_null(g_stgi_d[l_ac].stgi005)) THEN
            #   CALL astt501_stgi002_def()   
            #END IF
            #150429-00011#22 20151106  mark by beckxie---E
            #150429-00011#22 20151106  add by beckxie---S
            IF NOT (cl_null(g_stgi_d[l_ac].stgi001) OR cl_null(g_stgi_d[l_ac].stgi002) OR cl_null(g_stgi_d[l_ac].stgi005)) 
                AND (g_stgh_m.stgh000 = '1' OR g_stgh_m.stgh000 = '2' OR  g_stgh_m.stgh000 = '7' ) #add by dengdd stgh000='7' 20150216
            THEN
               IF g_stgi_d_o.stgi001!=g_stgi_d[l_ac].stgi001 OR cl_null(g_stgi_d_o.stgi001) OR
                  g_stgi_d_o.stgi002!=g_stgi_d[l_ac].stgi002 OR cl_null(g_stgi_d_o.stgi002) OR
                  g_stgi_d_o.stgi005!=g_stgi_d[l_ac].stgi005 OR cl_null(g_stgi_d_o.stgi005) THEN
                  CALL astt501_stgi002_def()
               END IF
            END IF
            #150429-00011#22 20151106  add by beckxie---E
            LET g_stgi_d_o.stgi002 = g_stgi_d[l_ac].stgi002
            
            CALL astt501_stgi002_ref()   #150429-00011#22 20151105 add by beckxie
            #150429-00011#22 20151105 mark by beckxie---S
            #INITIALIZE g_ref_fields TO NULL
            #LET g_ref_fields[1] = g_stgi_d[l_ac].stgi002
            #CALL ap_ref_array2(g_ref_fields,"SELECT inayl003 FROM inayl_t WHERE inaylent='"||g_enterprise||"' AND inayl001=? AND inayl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            #LET g_stgi_d[l_ac].stgi002_desc = '', g_rtn_fields[1] , ''
            #150429-00011#22 20151105 mark by beckxie---E
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi002
            #add-point:BEFORE FIELD stgi002 name="input.b.page1.stgi002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi002
            #add-point:ON CHANGE stgi002 name="input.g.page1.stgi002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi003
            
            #add-point:AFTER FIELD stgi003 name="input.a.page1.stgi003"
            IF NOT cl_null(g_stgi_d[l_ac].stgi003) THEN
               IF g_stgi_d[l_ac].stgi003 <> g_stgi_d_o.stgi003 OR cl_null(g_stgi_d_o.stgi003) THEN
                  INITIALIZE g_chkparam.* TO NULL
                   #mark by dengdd 151202(S)
#                  LET g_chkparam.arg1 = g_stgi_d[l_ac].stgi003
#                  IF NOT cl_chk_exist("v_stga004") THEN
#                     LET g_stgi_d[l_ac].stgi003 = g_stgi_d_o.stgi003
#                     NEXT FIELD CURRENT
#                  END IF
                   #mark by dengdd 151202(E)
                   #add by dengdd 151202(S)
                   #mark by dengdd 160109
#                   LET g_chkparam.arg1 = g_stgi_d[l_ac].stgi003
#                   LET g_chkparam.arg2 = g_stgh_m.stghsite
#                   IF NOT cl_chk_exist("v_stga004_1") THEN 
                   #mark by dengdd 160109
                   #add by dengdd 160109(S)
                   LET g_chkparam.arg1 = g_stgh_m.stghsite
                   LET g_chkparam.arg2 = g_stgi_d[l_ac].stgi003
                   IF NOT cl_chk_exist("v_mhae001_1") THEN  
                     LET g_stgi_d[l_ac].stgi003 = g_stgi_d_o.stgi003
                     NEXT FIELD CURRENT
                   END IF
                    #add by dengdd 160109(S)
                   #add by dengdd 151202(E)
               END IF
            END IF
            CALL astt501_stgi003_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi003
            #add-point:BEFORE FIELD stgi003 name="input.b.page1.stgi003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi003
            #add-point:ON CHANGE stgi003 name="input.g.page1.stgi003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi004
            
            #add-point:AFTER FIELD stgi004 name="input.a.page1.stgi004"
            IF NOT cl_null(g_stgi_d[l_ac].stgi004) THEN
               #160913-00034#4 -s by 08172
#               INITIALIZE g_chkparam.* TO NULL
#               LET g_chkparam.arg1 = g_stgi_d[l_ac].stgi004
#               IF NOT cl_chk_exist("v_pmaa001_26") THEN
#                  LET g_stgi_d[l_ac].stgi004 = g_stgi_d_t.stgi004
#                  DISPLAY BY NAME g_stgi_d[l_ac].stgi004
#                  NEXT FIELD CURRENT
#               END IF                    
               #160913-00034#4 -e by 08172
               IF g_stgi_d[l_ac].stgi004 <> g_stgi_d_o.stgi004 OR cl_null(g_stgi_d_o.stgi004) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  #mark by dengdd 151202(S)
#                  LET g_chkparam.arg1 = g_stgi_d[l_ac].stgi004
#                  IF NOT cl_chk_exist("v_stga005") THEN
#                     LET g_stgi_d[l_ac].stgi004 = g_stgi_d_o.stgi004
#                     NEXT FIELD CURRENT
#                  END IF
                  #mark by dengdd 151202(E)
                  #add by dengdd 151202(S)
                  LET g_chkparam.arg1 = g_stgi_d[l_ac].stgi004
                  LET g_chkparam.arg2 = g_stgh_m.stghsite
                  IF NOT cl_chk_exist("v_stga005_1") THEN
                     LET g_stgi_d[l_ac].stgi004 = g_stgi_d_o.stgi004
                     NEXT FIELD CURRENT
                  END IF
                  #add by dengdd 151202(E)
               END IF
            END IF
            CALL astt501_stgi004_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi004
            #add-point:BEFORE FIELD stgi004 name="input.b.page1.stgi004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi004
            #add-point:ON CHANGE stgi004 name="input.g.page1.stgi004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi006
            
            #add-point:AFTER FIELD stgi006 name="input.a.page1.stgi006"
            IF NOT cl_null(g_stgi_d[l_ac].stgi006) THEN
               IF g_stgi_d[l_ac].stgi006 != g_stgi_d_o.stgi006 OR cl_null(g_stgi_d_o.stgi006)   THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stgi_d[l_ac].stgi006
                  IF NOT cl_chk_exist("v_stae001") THEN
                     LET g_stgi_d[l_ac].stgi006 = g_stgi_d_o.stgi006
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_stgi_d_o.stgi006 = g_stgi_d[l_ac].stgi006
            CALL astt501_stgi006_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi006
            #add-point:BEFORE FIELD stgi006 name="input.b.page1.stgi006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi006
            #add-point:ON CHANGE stgi006 name="input.g.page1.stgi006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi007
            #add-point:BEFORE FIELD stgi007 name="input.b.page1.stgi007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi007
            
            #add-point:AFTER FIELD stgi007 name="input.a.page1.stgi007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi007
            #add-point:ON CHANGE stgi007 name="input.g.page1.stgi007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi008
            #add-point:BEFORE FIELD stgi008 name="input.b.page1.stgi008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi008
            
            #add-point:AFTER FIELD stgi008 name="input.a.page1.stgi008"
            #add by dengdd 151202(S)
            IF NOT cl_null(g_stgi_d[l_ac].stgi008) THEN
               LET g_stgi_d[l_ac].stgi009=g_stgi_d[l_ac].stgi008
               LET g_stgi_d[l_ac].stgi010=g_stgi_d[l_ac].stgi009*(1-(g_stgi_d[l_ac].stgi012/100))
               LET g_stgi_d[l_ac].stgi014=g_stgi_d[l_ac].stgi010
               DISPLAY BY NAME g_stgi_d[l_ac].stgi009,g_stgi_d[l_ac].stgi010,g_stgi_d[l_ac].stgi014
            END IF
            #add by dengdd 151202(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi008
            #add-point:ON CHANGE stgi008 name="input.g.page1.stgi008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi009
            #add-point:BEFORE FIELD stgi009 name="input.b.page1.stgi009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi009
            
            #add-point:AFTER FIELD stgi009 name="input.a.page1.stgi009"
            #add by dengdd 151202(S)
            IF NOT cl_null(g_stgi_d[l_ac].stgi009) THEN
               LET g_stgi_d[l_ac].stgi010=g_stgi_d[l_ac].stgi009*(1-(g_stgi_d[l_ac].stgi012/100))
               LET g_stgi_d[l_ac].stgi014=g_stgi_d[l_ac].stgi010
               DISPLAY BY NAME g_stgi_d[l_ac].stgi010,g_stgi_d[l_ac].stgi014
            END IF
            #add by dengdd 151202(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi009
            #add-point:ON CHANGE stgi009 name="input.g.page1.stgi009"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi010
            #add-point:BEFORE FIELD stgi010 name="input.b.page1.stgi010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi010
            
            #add-point:AFTER FIELD stgi010 name="input.a.page1.stgi010"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi010
            #add-point:ON CHANGE stgi010 name="input.g.page1.stgi010"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi011
            #add-point:BEFORE FIELD stgi011 name="input.b.page1.stgi011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi011
            
            #add-point:AFTER FIELD stgi011 name="input.a.page1.stgi011"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi011
            #add-point:ON CHANGE stgi011 name="input.g.page1.stgi011"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi012
            #add-point:BEFORE FIELD stgi012 name="input.b.page1.stgi012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi012
            
            #add-point:AFTER FIELD stgi012 name="input.a.page1.stgi012"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi012
            #add-point:ON CHANGE stgi012 name="input.g.page1.stgi012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi015
            #add-point:BEFORE FIELD stgi015 name="input.b.page1.stgi015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi015
            
            #add-point:AFTER FIELD stgi015 name="input.a.page1.stgi015"
            #add by dengdd 151202(S)
            IF NOT cl_null(g_stgi_d[l_ac].stgi015) AND g_stgh_m.stgh000 <> '7' THEN
               LET g_stgi_d[l_ac].stgi013=g_stgi_d[l_ac].stgi015-g_stgi_d[l_ac].stgi012
               DISPLAY BY NAME g_stgi_d[l_ac].stgi013,g_stgi_d[l_ac].stgi015
            END IF
            
            IF NOT cl_null(g_stgi_d[l_ac].stgi013) THEN   
               IF g_stgi_d[l_ac].stgi013 != g_stgi_d_o.stgi013 OR cl_null(g_stgi_d_o.stgi013)   THEN   
                  IF g_stgh_m.stgh000='1' OR g_stgh_m.stgh000='2' OR g_stgh_m.stgh000='7' THEN  #add g_stgh_m.stgh000='7' by dengdd 160106
                     #计算实际执行费率
#lanjj modify on 2016-11-03 start 当类型为串码销售 调整费率和实际执行费率一样
                     IF g_stgh_m.stgh000 != '7' THEN
                        LET g_stgi_d[l_ac].stgi013 = g_stgi_d[l_ac].stgi015 - g_stgi_d[l_ac].stgi012
                     ELSE 
                        LET g_stgi_d[l_ac].stgi013 = g_stgi_d[l_ac].stgi015
                     END IF 
#lanjj modify on 2016-11-03 end
                     CALL astt501_stgi014_def() RETURNING l_calcflag
                     #條件為應收金額,取應收金額*調整費率=調整金額
                     IF l_calcflag='Y' THEN
      #                  LET g_stgi_d[l_ac].stgi014= g_stgi_d[l_ac].stgi008 * (g_stgi_d[l_ac].stgi013/100)
                         IF g_stgh_m.stgh000 != '7' THEN
                            LET g_stgi_d[l_ac].stgi014= (-1)*(g_stgi_d[l_ac].stgi008 * (g_stgi_d[l_ac].stgi013/100)) #mod by dengdd 151203
                         ELSE
                            LET g_stgi_d[l_ac].stgi014 = g_stgi_d[l_ac].stgi008 * (1 - (g_stgi_d[l_ac].stgi013/100))
                         END IF 
                     END IF
                     #條件為實收金額,取實收金額*調整費率=調整金額
                     IF l_calcflag='N' THEN
      #                  LET g_stgi_d[l_ac].stgi014= g_stgi_d[l_ac].stgi009 * (g_stgi_d[l_ac].stgi013/100)
                         IF g_stgh_m.stgh000 != '7' THEN
                            LET g_stgi_d[l_ac].stgi014= (-1)*(g_stgi_d[l_ac].stgi009 * (g_stgi_d[l_ac].stgi013/100)) #mod by dengdd 151203
                         ELSE
                            LET g_stgi_d[l_ac].stgi014 = g_stgi_d[l_ac].stgi009 * (1 - (g_stgi_d[l_ac].stgi013/100))
                         END IF 
                     END IF
                     #计算实际执行费率
#                     LET g_stgi_d[l_ac].stgi015=g_stgi_d[l_ac].stgi012-g_stgi_d[l_ac].stgi013 #mark by dengdd 151202
#lanjj modify on 2016-11-03 start 当类型为串码销售 调整费率和实际执行费率一样
                     IF g_stgh_m.stgh000 != '7' THEN
                        LET g_stgi_d[l_ac].stgi015=g_stgi_d[l_ac].stgi012+g_stgi_d[l_ac].stgi013  #add  by dengdd 151202
                     ELSE 
                        LET g_stgi_d[l_ac].stgi013 = g_stgi_d[l_ac].stgi015
                     END IF 
#lanjj modify on 2016-11-03 end
                     DISPLAY BY NAME g_stgi_d[l_ac].stgi013,g_stgi_d[l_ac].stgi015
                  END IF
                  #add by dengdd 20151203(S)
                  IF g_stgh_m.stgh000='7' THEN
                      LET g_stgi_d[l_ac].l_expense=g_stgi_d[l_ac].stgi009-g_stgi_d[l_ac].stgi014
                  ELSE
                      LET g_stgi_d[l_ac].l_expense=(-1)*g_stgi_d[l_ac].stgi014
                  END IF
                  #add by dengdd 20151203(E)
               END IF 
            END IF 
            LET g_stgi_d_o.stgi013 = g_stgi_d[l_ac].stgi013
            #add by dengdd 151202(E)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi015
            #add-point:ON CHANGE stgi015 name="input.g.page1.stgi015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi013
            #add-point:BEFORE FIELD stgi013 name="input.b.page1.stgi013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi013
            
            #add-point:AFTER FIELD stgi013 name="input.a.page1.stgi013"
#            IF g_stgi_d[l_ac].stgi013=0 THEN    #mark by dengdd 20151202
#            IF g_stgi_d[l_ac].stgi013=0  AND g_stgh_m.stgh000 != '7' THEN #mod  by dengdd 20151202
#               INITIALIZE g_errparam TO NULL 
#               LET g_errparam.code   = "ast-00312"
#               LET g_errparam.extend = ''               
#               LET g_errparam.popup  = TRUE 
#               CALL cl_err()
#               NEXT FIELD stgi013
#            END IF                                         #lanjj mark on 2016-07-03 可录入0 刘鑫 
            #add by dengdd 160106(S)
            IF NOT cl_null(g_stgi_d[l_ac].stgi013) AND g_stgh_m.stgh000 <> '7' THEN
               LET g_stgi_d[l_ac].stgi012=g_stgi_d[l_ac].stgi015-g_stgi_d[l_ac].stgi013
               DISPLAY BY NAME g_stgi_d[l_ac].stgi012,g_stgi_d[l_ac].stgi015
            END IF
            #add by dengdd 160106(E)
            #150429-00011#22 20151105 mark by beckxie---S
            #IF NOT cl_null(g_stgi_d[l_ac].stgi013) THEN 
            #      IF g_stgh_m.stgh000='1' OR g_stgh_m.stgh000='2' THEN
            #         CALL astt501_stgi014_def() RETURNING l_calcflag
            #         #條件為應收金額,取應收金額*調整費率=調整金額
            #         IF l_calcflag='Y' THEN
            #            LET g_stgi_d[l_ac].stgi014= g_stgi_d[l_ac].stgi008 * (g_stgi_d[l_ac].stgi013/100)
            #         END IF
            #         #條件為實收金額,取實收金額*調整費率=調整金額
            #         IF l_calcflag='N' THEN
            #            LET g_stgi_d[l_ac].stgi014= g_stgi_d[l_ac].stgi009 * (g_stgi_d[l_ac].stgi013/100)
            #         END IF
            #         #计算实际执行费率
            #         LET g_stgi_d[l_ac].stgi015=g_stgi_d[l_ac].stgi012-g_stgi_d[l_ac].stgi013
            #         DISPLAY BY NAME g_stgi_d[l_ac].stgi013,g_stgi_d[l_ac].stgi015
            #   END IF 
            #END IF 
            #150429-00011#22 20151105 mark by beckxie---E
            #150429-00011#22 20151105  add by beckxie---S
            IF NOT cl_null(g_stgi_d[l_ac].stgi013) THEN   
               IF g_stgi_d[l_ac].stgi013 != g_stgi_d_o.stgi013 OR cl_null(g_stgi_d_o.stgi013)   THEN   
                  IF g_stgh_m.stgh000='1' OR g_stgh_m.stgh000='2' OR g_stgh_m.stgh000='7' THEN  #add g_stgh_m.stgh000='7' by dengdd 160106
                     #计算实际执行费率
#lanjj modify on 2016-11-03 start 当类型为串码销售 调整费率和实际执行费率一样
                     IF g_stgh_m.stgh000 != '7' THEN
                        LET g_stgi_d[l_ac].stgi013 = g_stgi_d[l_ac].stgi015 - g_stgi_d[l_ac].stgi012
                     ELSE 
                        LET g_stgi_d[l_ac].stgi013 = g_stgi_d[l_ac].stgi015
                     END IF 
#lanjj modify on 2016-11-03 end
                     CALL astt501_stgi014_def() RETURNING l_calcflag
                     #條件為應收金額,取應收金額*調整費率=調整金額
                     IF l_calcflag='Y' THEN
#                        LET g_stgi_d[l_ac].stgi014= g_stgi_d[l_ac].stgi008 * (g_stgi_d[l_ac].stgi013/100)
                         IF g_stgh_m.stgh000 != '7' THEN
                            LET g_stgi_d[l_ac].stgi014= (-1)*(g_stgi_d[l_ac].stgi008 * (g_stgi_d[l_ac].stgi013/100)) #mod by dengdd 151203
                         ELSE
                            LET g_stgi_d[l_ac].stgi014 = g_stgi_d[l_ac].stgi008 * (1 - (g_stgi_d[l_ac].stgi013/100))
                         END IF 
                     END IF
                     #條件為實收金額,取實收金額*調整費率=調整金額
                     IF l_calcflag='N' THEN
#                        LET g_stgi_d[l_ac].stgi014= g_stgi_d[l_ac].stgi009 * (g_stgi_d[l_ac].stgi013/100)
                         IF g_stgh_m.stgh000 != '7' THEN
                            LET g_stgi_d[l_ac].stgi014= (-1)*(g_stgi_d[l_ac].stgi009 * (g_stgi_d[l_ac].stgi013/100)) #mod by dengdd 151203
                         ELSE
                            LET g_stgi_d[l_ac].stgi014 = g_stgi_d[l_ac].stgi008 * (1 - (g_stgi_d[l_ac].stgi013/100))
                         END IF 
                     END IF

                     DISPLAY BY NAME g_stgi_d[l_ac].stgi013,g_stgi_d[l_ac].stgi015
                  END IF
                  #add by dengdd 20151203(S)
                  IF g_stgh_m.stgh000='7' THEN
                      LET g_stgi_d[l_ac].l_expense=g_stgi_d[l_ac].stgi009-g_stgi_d[l_ac].stgi014
                  ELSE
                      LET g_stgi_d[l_ac].l_expense=(-1)*g_stgi_d[l_ac].stgi014
                  END IF
                  #add by dengdd 20151203(E)
               END IF 
            END IF 
            LET g_stgi_d_o.stgi013 = g_stgi_d[l_ac].stgi013   
            #150429-00011#22 20151105  add by beckxie---E
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi013
            #add-point:ON CHANGE stgi013 name="input.g.page1.stgi013"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgi014
            #add-point:BEFORE FIELD stgi014 name="input.b.page1.stgi014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgi014
            
            #add-point:AFTER FIELD stgi014 name="input.a.page1.stgi014"
            IF NOT cl_null(g_stgi_d[l_ac].stgi014) THEN 
            END IF 
#            IF g_stgi_d[l_ac].stgi014=0 THEN
#               INITIALIZE g_errparam TO NULL 
#               LET g_errparam.code   = "ast-00500"
#               LET g_errparam.extend = ''               
#               LET g_errparam.popup  = TRUE 
#               CALL cl_err()
#               NEXT FIELD stgi014
#            END IF                           #lanjj mark on 2016-07-03 

            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgi014
            #add-point:ON CHANGE stgi014 name="input.g.page1.stgi014"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_expense
            #add-point:BEFORE FIELD l_expense name="input.b.page1.l_expense"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_expense
            
            #add-point:AFTER FIELD l_expense name="input.a.page1.l_expense"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_expense
            #add-point:ON CHANGE l_expense name="input.g.page1.l_expense"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stgiseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgiseq
            #add-point:ON ACTION controlp INFIELD stgiseq name="input.c.page1.stgiseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi005
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi005
            #add-point:ON ACTION controlp INFIELD stgi005 name="input.c.page1.stgi005"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi001
            #add-point:ON ACTION controlp INFIELD stgi001 name="input.c.page1.stgi001"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stgi_d[l_ac].stgi001             #給予default值
 #           LET g_qryparam.arg1= g_site             #mark by dengdd 151202
            LET g_qryparam.arg1= g_stgh_m.stghsite   #add by dengdd 151202
            LET g_qryparam.where = " rtdx003 IN ('3','4','5')"
            
            CALL q_rtdx001_1()                                #呼叫開窗

            LET g_stgi_d[l_ac].stgi001 = g_qryparam.return1
            
            DISPLAY g_stgi_d[l_ac].stgi001 TO stgi001            
            CALL astt501_stgi001_ref()   #150429-00011#22 20151105 add by beckxie
            NEXT FIELD stgi001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi002
            #add-point:ON ACTION controlp INFIELD stgi002 name="input.c.page1.stgi002"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stgi_d[l_ac].stgi002             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_stga003()                                #呼叫開窗

            LET g_stgi_d[l_ac].stgi002 = g_qryparam.return1              

            DISPLAY g_stgi_d[l_ac].stgi002 TO stgi002              #
            CALL astt501_stgi002_ref()   #150429-00011#22 20151105 add by beckxie
            NEXT FIELD stgi002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi003
            #add-point:ON ACTION controlp INFIELD stgi003 name="input.c.page1.stgi003"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stgi_d[l_ac].stgi003             #給予default值
            LET g_qryparam.default2 = "" #g_stgi_d[l_ac].mhael023 #简称
            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_stga004()                                #呼叫開窗

            LET g_stgi_d[l_ac].stgi003 = g_qryparam.return1              
            #LET g_stgi_d[l_ac].mhael023 = g_qryparam.return2 
            DISPLAY g_stgi_d[l_ac].stgi003 TO stgi003              #
            #DISPLAY g_stgi_d[l_ac].mhael023 TO mhael023 #简称
            CALL astt501_stgi003_ref()   #150429-00011#22 20151105 add by beckxie
            NEXT FIELD stgi003                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi004
            #add-point:ON ACTION controlp INFIELD stgi004 name="input.c.page1.stgi004"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stgi_d[l_ac].stgi004             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_stga005()                                #呼叫開窗

            LET g_stgi_d[l_ac].stgi004 = g_qryparam.return1              

            DISPLAY g_stgi_d[l_ac].stgi004 TO stgi004              #

            NEXT FIELD stgi004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi006
            #add-point:ON ACTION controlp INFIELD stgi006 name="input.c.page1.stgi006"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stgi_d[l_ac].stgi006             #給予default值
            LET g_qryparam.default2 = "" #g_stgi_d[l_ac].stae001 #費用編號
            LET g_qryparam.default3 = "" #g_stgi_d[l_ac].stael003 #說明
            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_stae001()                                #呼叫開窗

            LET g_stgi_d[l_ac].stgi006 = g_qryparam.return1              
            #LET g_stgi_d[l_ac].stae001 = g_qryparam.return2 
            #LET g_stgi_d[l_ac].stael003 = g_qryparam.return3 
            DISPLAY g_stgi_d[l_ac].stgi006 TO stgi006              #
            #DISPLAY g_stgi_d[l_ac].stae001 TO stae001 #費用編號
            #DISPLAY g_stgi_d[l_ac].stael003 TO stael003 #說明
            CALL astt501_stgi006_ref()   #150429-00011#22 20151105 add by beckxie
            NEXT FIELD stgi006                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi007
            #add-point:ON ACTION controlp INFIELD stgi007 name="input.c.page1.stgi007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi008
            #add-point:ON ACTION controlp INFIELD stgi008 name="input.c.page1.stgi008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi009
            #add-point:ON ACTION controlp INFIELD stgi009 name="input.c.page1.stgi009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi010
            #add-point:ON ACTION controlp INFIELD stgi010 name="input.c.page1.stgi010"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi011
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi011
            #add-point:ON ACTION controlp INFIELD stgi011 name="input.c.page1.stgi011"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi012
            #add-point:ON ACTION controlp INFIELD stgi012 name="input.c.page1.stgi012"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi015
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi015
            #add-point:ON ACTION controlp INFIELD stgi015 name="input.c.page1.stgi015"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi013
            #add-point:ON ACTION controlp INFIELD stgi013 name="input.c.page1.stgi013"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stgi014
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgi014
            #add-point:ON ACTION controlp INFIELD stgi014 name="input.c.page1.stgi014"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_expense
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_expense
            #add-point:ON ACTION controlp INFIELD l_expense name="input.c.page1.l_expense"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stgi_d[l_ac].* = g_stgi_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt501_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stgi_d[l_ac].stgiseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stgi_d[l_ac].* = g_stgi_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt501_stgi_t_mask_restore('restore_mask_o')
      
               UPDATE stgi_t SET (stgidocno,stgiseq,stgi005,stgi001,stgi002,stgi003,stgi004,stgi006, 
                   stgi007,stgi008,stgi009,stgi010,stgi011,stgi012,stgi015,stgi013,stgi014) = (g_stgh_m.stghdocno, 
                   g_stgi_d[l_ac].stgiseq,g_stgi_d[l_ac].stgi005,g_stgi_d[l_ac].stgi001,g_stgi_d[l_ac].stgi002, 
                   g_stgi_d[l_ac].stgi003,g_stgi_d[l_ac].stgi004,g_stgi_d[l_ac].stgi006,g_stgi_d[l_ac].stgi007, 
                   g_stgi_d[l_ac].stgi008,g_stgi_d[l_ac].stgi009,g_stgi_d[l_ac].stgi010,g_stgi_d[l_ac].stgi011, 
                   g_stgi_d[l_ac].stgi012,g_stgi_d[l_ac].stgi015,g_stgi_d[l_ac].stgi013,g_stgi_d[l_ac].stgi014) 
 
                WHERE stgient = g_enterprise AND stgidocno = g_stgh_m.stghdocno 
 
                  AND stgiseq = g_stgi_d_t.stgiseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stgi_d[l_ac].* = g_stgi_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stgi_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stgi_d[l_ac].* = g_stgi_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stgi_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stgh_m.stghdocno
               LET gs_keys_bak[1] = g_stghdocno_t
               LET gs_keys[2] = g_stgi_d[g_detail_idx].stgiseq
               LET gs_keys_bak[2] = g_stgi_d_t.stgiseq
               CALL astt501_update_b('stgi_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt501_stgi_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stgi_d[g_detail_idx].stgiseq = g_stgi_d_t.stgiseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stgh_m.stghdocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stgi_d_t.stgiseq
 
                  CALL astt501_key_update_b(gs_keys,'stgi_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stgh_m),util.JSON.stringify(g_stgi_d_t)
               LET g_log2 = util.JSON.stringify(g_stgh_m),util.JSON.stringify(g_stgi_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astt501_unlock_b("stgi_t","'1'")
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
               LET g_stgi_d[li_reproduce_target].* = g_stgi_d[li_reproduce].*
 
               LET g_stgi_d[li_reproduce_target].stgiseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stgi_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stgi_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="astt501.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
         
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD stghdocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stgiseq
 
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
         #當類型為'1'or'2'時，可能有子程式帶至單身的資料，校驗必填欄位 by beckxie
#         IF g_stgh_m.stgh000='1' OR g_stgh_m.stgh000='2' THEN
#            #調整費率為0的筆數
#            LET l_cnt_stgi013=0
#            SELECT COUNT(*) INTO l_cnt_stgi013
#              FROM stgi_t
#             WHERE stgient   = g_enterprise
#               AND stgidocno = g_stgh_m.stghdocno
#               AND stgi013=0
#            #調整金額為NULL的筆數   
#            LET l_cnt_stgi014=0
#            SELECT COUNT(*) INTO l_cnt_stgi014
#              FROM stgi_t
#             WHERE stgient   = g_enterprise
#               AND stgidocno = g_stgh_m.stghdocno
#               AND stgi014 IS NULL
#            IF l_cnt_stgi013 > 0 OR l_cnt_stgi014 > 0 THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = 'ast-00351'
#               LET g_errparam.extend = ""
#               LET g_errparam.popup = TRUE
#               CALL cl_err()
#               NEXT FIELD CURRENT
#            END IF
#         END IF
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
 
{<section id="astt501.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt501_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt501_b_fill() #單身填充
      CALL astt501_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt501_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   
   #end add-point
   
   #遮罩相關處理
   LET g_stgh_m_mask_o.* =  g_stgh_m.*
   CALL astt501_stgh_t_mask()
   LET g_stgh_m_mask_n.* =  g_stgh_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stgh_m.stghsite,g_stgh_m.stghdocdt,g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001, 
       g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus,g_stgh_m.stghownid,g_stgh_m.stghownid_desc, 
       g_stgh_m.stghowndp,g_stgh_m.stghowndp_desc,g_stgh_m.stghcrtid,g_stgh_m.stghcrtid_desc,g_stgh_m.stghcrtdp, 
       g_stgh_m.stghcrtdp_desc,g_stgh_m.stghcrtdt,g_stgh_m.stghmodid,g_stgh_m.stghmodid_desc,g_stgh_m.stghmoddt, 
       g_stgh_m.stghcnfid,g_stgh_m.stghcnfid_desc,g_stgh_m.stghcnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stgh_m.stghstus 
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_stgi_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt501_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt501.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt501_detail_show()
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
 
{<section id="astt501.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt501_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stgh_t.stghdocno 
   DEFINE l_oldno     LIKE stgh_t.stghdocno 
 
   DEFINE l_master    RECORD LIKE stgh_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stgi_t.* #此變數樣板目前無使用
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE l_success    LIKE type_t.num5  
   DEFINE l_insert      LIKE type_t.num5  #161024-00025#11   2016/10/28  by 08742   add   
   #end add-point   
   
   #add-point:Function前置處理  name="reproduce.pre_function"
   
   #end add-point
   
   #切換畫面
   
   LET g_master_insert = FALSE
   
   IF g_stgh_m.stghdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stghdocno_t = g_stgh_m.stghdocno
 
    
   LET g_stgh_m.stghdocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stgh_m.stghownid = g_user
      LET g_stgh_m.stghowndp = g_dept
      LET g_stgh_m.stghcrtid = g_user
      LET g_stgh_m.stghcrtdp = g_dept 
      LET g_stgh_m.stghcrtdt = cl_get_current()
      LET g_stgh_m.stghmodid = g_user
      LET g_stgh_m.stghmoddt = cl_get_current()
      LET g_stgh_m.stghstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   CALL s_arti200_get_def_doc_type(g_site,g_prog,'1') RETURNING l_success,g_stgh_m.stghdocno
   #161024-00025#11   2016/10/28  by 08742   -S
   LET g_ins_site_flag = '' 
   CALL s_aooi500_default(g_prog,'stghsite',g_stgh_m.stghsite)
      RETURNING l_insert,g_stgh_m.stghsite
   IF l_insert = FALSE THEN
      RETURN
   END IF
   #161024-00025#11   2016/10/28  by 08742   -E
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stgh_m.stghstus 
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   CALL astt501_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stgh_m.* TO NULL
      INITIALIZE g_stgi_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt501_show()
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
   CALL astt501_set_act_visible()   
   CALL astt501_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stghdocno_t = g_stgh_m.stghdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stghent = " ||g_enterprise|| " AND",
                      " stghdocno = '", g_stgh_m.stghdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt501_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt501_idx_chk()
   
   LET g_data_owner = g_stgh_m.stghownid      
   LET g_data_dept  = g_stgh_m.stghowndp
   
   #功能已完成,通報訊息中心
   CALL astt501_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt501.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt501_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stgi_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt501_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stgi_t
    WHERE stgient = g_enterprise AND stgidocno = g_stghdocno_t
 
    INTO TEMP astt501_detail
 
   #將key修正為調整後   
   UPDATE astt501_detail 
      #更新key欄位
      SET stgidocno = g_stgh_m.stghdocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stgi_t SELECT * FROM astt501_detail
   
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
   DROP TABLE astt501_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stghdocno_t = g_stgh_m.stghdocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt501.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt501_delete()
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
   
   IF g_stgh_m.stghdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt501_cl USING g_enterprise,g_stgh_m.stghdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt501_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt501_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt501_master_referesh USING g_stgh_m.stghdocno INTO g_stgh_m.stghsite,g_stgh_m.stghdocdt, 
       g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001,g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus, 
       g_stgh_m.stghownid,g_stgh_m.stghowndp,g_stgh_m.stghcrtid,g_stgh_m.stghcrtdp,g_stgh_m.stghcrtdt, 
       g_stgh_m.stghmodid,g_stgh_m.stghmoddt,g_stgh_m.stghcnfid,g_stgh_m.stghcnfdt,g_stgh_m.stghownid_desc, 
       g_stgh_m.stghowndp_desc,g_stgh_m.stghcrtid_desc,g_stgh_m.stghcrtdp_desc,g_stgh_m.stghmodid_desc, 
       g_stgh_m.stghcnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt501_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stgh_m_mask_o.* =  g_stgh_m.*
   CALL astt501_stgh_t_mask()
   LET g_stgh_m_mask_n.* =  g_stgh_m.*
   
   CALL astt501_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   IF NOT s_aooi200_del_docno(g_stgh_m.stghdocno,g_stgh_m.stghdocdt) THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt501_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stghdocno_t = g_stgh_m.stghdocno
 
 
      DELETE FROM stgh_t
       WHERE stghent = g_enterprise AND stghdocno = g_stgh_m.stghdocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stgh_m.stghdocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
#      IF NOT s_aooi200_del_docno(g_stgh_m.stghdocno,g_stgh_m.stghdocdt) THEN
#         CALL s_transaction_end('N','0')
#         RETURN
#      END IF
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM stgi_t
       WHERE stgient = g_enterprise AND stgidocno = g_stgh_m.stghdocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stgi_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stgh_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt501_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stgi_d.clear() 
 
     
      CALL astt501_ui_browser_refresh()  
      #CALL astt501_ui_headershow()  
      #CALL astt501_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt501_browser_fill("")
         CALL astt501_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt501_cl
 
   #功能已完成,通報訊息中心
   CALL astt501_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt501.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt501_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stgi_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt501_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stgiseq,stgi005,stgi001,stgi002,stgi003,stgi004,stgi006,stgi007, 
             stgi008,stgi009,stgi010,stgi011,stgi012,stgi015,stgi013,stgi014 ,t1.imaal003 ,t2.inayl003 , 
             t3.mhael023 ,t4.pmaal003 ,t5.stael003 FROM stgi_t",   
                     " INNER JOIN stgh_t ON stghent = " ||g_enterprise|| " AND stghdocno = stgidocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN imaal_t t1 ON t1.imaalent="||g_enterprise||" AND t1.imaal001=stgi001 AND t1.imaal002='"||g_dlang||"' ",
               " LEFT JOIN inayl_t t2 ON t2.inaylent="||g_enterprise||" AND t2.inayl001=stgi002 AND t2.inayl002='"||g_dlang||"' ",
               " LEFT JOIN mhael_t t3 ON t3.mhaelent="||g_enterprise||" AND t3.mhael001=stgi003 AND t3.mhael022='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t4 ON t4.pmaalent="||g_enterprise||" AND t4.pmaal001=stgi004 AND t4.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t5 ON t5.staelent="||g_enterprise||" AND t5.stael001=stgi006 AND t5.stael002='"||g_dlang||"' ",
 
                     " WHERE stgient=? AND stgidocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stgi_t.stgiseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt501_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt501_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stgh_m.stghdocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stgh_m.stghdocno INTO g_stgi_d[l_ac].stgiseq,g_stgi_d[l_ac].stgi005, 
          g_stgi_d[l_ac].stgi001,g_stgi_d[l_ac].stgi002,g_stgi_d[l_ac].stgi003,g_stgi_d[l_ac].stgi004, 
          g_stgi_d[l_ac].stgi006,g_stgi_d[l_ac].stgi007,g_stgi_d[l_ac].stgi008,g_stgi_d[l_ac].stgi009, 
          g_stgi_d[l_ac].stgi010,g_stgi_d[l_ac].stgi011,g_stgi_d[l_ac].stgi012,g_stgi_d[l_ac].stgi015, 
          g_stgi_d[l_ac].stgi013,g_stgi_d[l_ac].stgi014,g_stgi_d[l_ac].stgi001_desc,g_stgi_d[l_ac].stgi002_desc, 
          g_stgi_d[l_ac].stgi003_desc,g_stgi_d[l_ac].stgi004_desc,g_stgi_d[l_ac].stgi006_desc   #(ver:78) 
 
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
         #add by dengdd 151202(S)
         IF g_stgh_m.stgh000<>'7' THEN
            LET g_stgi_d[l_ac].l_expense=(-1)*g_stgi_d[l_ac].stgi014
         ELSE
            LET g_stgi_d[l_ac].l_expense=g_stgi_d[l_ac].stgi009-g_stgi_d[l_ac].stgi014
         END IF
         #add by dengdd 151202(E)
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
   
   CALL g_stgi_d.deleteElement(g_stgi_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt501_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stgi_d.getLength()
      LET g_stgi_d_mask_o[l_ac].* =  g_stgi_d[l_ac].*
      CALL astt501_stgi_t_mask()
      LET g_stgi_d_mask_n[l_ac].* =  g_stgi_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt501.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt501_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stgi_t
       WHERE stgient = g_enterprise AND
         stgidocno = ps_keys_bak[1] AND stgiseq = ps_keys_bak[2]
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
         CALL g_stgi_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt501.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt501_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stgi_t
                  (stgient,
                   stgidocno,
                   stgiseq
                   ,stgi005,stgi001,stgi002,stgi003,stgi004,stgi006,stgi007,stgi008,stgi009,stgi010,stgi011,stgi012,stgi015,stgi013,stgi014) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stgi_d[g_detail_idx].stgi005,g_stgi_d[g_detail_idx].stgi001,g_stgi_d[g_detail_idx].stgi002, 
                       g_stgi_d[g_detail_idx].stgi003,g_stgi_d[g_detail_idx].stgi004,g_stgi_d[g_detail_idx].stgi006, 
                       g_stgi_d[g_detail_idx].stgi007,g_stgi_d[g_detail_idx].stgi008,g_stgi_d[g_detail_idx].stgi009, 
                       g_stgi_d[g_detail_idx].stgi010,g_stgi_d[g_detail_idx].stgi011,g_stgi_d[g_detail_idx].stgi012, 
                       g_stgi_d[g_detail_idx].stgi015,g_stgi_d[g_detail_idx].stgi013,g_stgi_d[g_detail_idx].stgi014) 
 
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stgi_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stgi_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt501.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt501_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stgi_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt501_stgi_t_mask_restore('restore_mask_o')
               
      UPDATE stgi_t 
         SET (stgidocno,
              stgiseq
              ,stgi005,stgi001,stgi002,stgi003,stgi004,stgi006,stgi007,stgi008,stgi009,stgi010,stgi011,stgi012,stgi015,stgi013,stgi014) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stgi_d[g_detail_idx].stgi005,g_stgi_d[g_detail_idx].stgi001,g_stgi_d[g_detail_idx].stgi002, 
                  g_stgi_d[g_detail_idx].stgi003,g_stgi_d[g_detail_idx].stgi004,g_stgi_d[g_detail_idx].stgi006, 
                  g_stgi_d[g_detail_idx].stgi007,g_stgi_d[g_detail_idx].stgi008,g_stgi_d[g_detail_idx].stgi009, 
                  g_stgi_d[g_detail_idx].stgi010,g_stgi_d[g_detail_idx].stgi011,g_stgi_d[g_detail_idx].stgi012, 
                  g_stgi_d[g_detail_idx].stgi015,g_stgi_d[g_detail_idx].stgi013,g_stgi_d[g_detail_idx].stgi014)  
 
         WHERE stgient = g_enterprise AND stgidocno = ps_keys_bak[1] AND stgiseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stgi_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stgi_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt501_stgi_t_mask_restore('restore_mask_n')
               
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
 
{<section id="astt501.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt501_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt501.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt501_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt501.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt501_lock_b(ps_table,ps_page)
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
   #CALL astt501_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stgi_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt501_bcl USING g_enterprise,
                                       g_stgh_m.stghdocno,g_stgi_d[g_detail_idx].stgiseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt501_bcl:",SQLERRMESSAGE 
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
 
{<section id="astt501.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt501_unlock_b(ps_table,ps_page)
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
      CLOSE astt501_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt501.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt501_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stghdocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stghdocno",TRUE)
      CALL cl_set_comp_entry("stghdocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      CALL cl_set_comp_entry("stgh000",TRUE)
      CALL cl_set_comp_entry("stghsite",TRUE)  #161024-00025#11   2016/10/28  by 08742   add
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
#   IF p_cmd = 'u' THEN
#      IF g_stgh_m.stgh000='1' OR g_stgh_m.stgh000='2' THEN
#         CALL cl_set_comp_entry("stgi003,stgi004",TRUE)  
#      END IF
#   END IF
   CALL cl_set_comp_entry("stgi003,stgi004",TRUE)  
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt501.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt501_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   DEFINE l_count LIKE type_t.num5
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stghdocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stghdocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stghdocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF p_cmd = 'u' THEN
      CALL cl_set_comp_entry("stgh000",FALSE)
   END IF
   IF g_stgh_m.stgh000='1' OR g_stgh_m.stgh000='2' THEN
         CALL cl_set_comp_entry("stgi003,stgi004",FALSE)  
   END IF
   #161024-00025#11   2016/10/28  by 08742   -S
   IF (NOT s_aooi500_comp_entry(g_prog,'stghsite') OR g_ins_site_flag = 'Y') THEN
      CALL cl_set_comp_entry("stghsite",FALSE)
   END IF
   #161024-00025#11   2016/10/28  by 08742   -E
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt501.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt501_set_entry_b(p_cmd)
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
 
{<section id="astt501.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt501_set_no_entry_b(p_cmd)
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
 
{<section id="astt501.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt501_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   CALL cl_set_act_visible("upd_detail", TRUE)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt501.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt501_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
 
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_stgh_m.stghstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   IF astt501_cnt_stga()=0 OR g_stgh_m.stghstus !='N' THEN  #無資料筆數時,act(整批調整)不可使用
      CALL cl_set_act_visible("upd_detail", FALSE)
   END IF
   
   #add by dengdd 151202(S)---串码销售调整不允许批量调整
   IF g_stgh_m.stgh000='7' THEN
      CALL cl_set_act_visible("upd_detail", FALSE)
   END IF
   #add by dengdd 151202(E)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt501.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt501_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt501.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt501_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt501.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt501_default_search()
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
      LET ls_wc = ls_wc, " stghdocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "stgh_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stgi_t" 
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
 
{<section id="astt501.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt501_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_errno        LIKE type_t.chr100
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   IF g_stgh_m.stghstus='X' THEN
      RETURN
   END IF 
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stgh_m.stghdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt501_cl USING g_enterprise,g_stgh_m.stghdocno
   IF STATUS THEN
      CLOSE astt501_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt501_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt501_master_referesh USING g_stgh_m.stghdocno INTO g_stgh_m.stghsite,g_stgh_m.stghdocdt, 
       g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001,g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus, 
       g_stgh_m.stghownid,g_stgh_m.stghowndp,g_stgh_m.stghcrtid,g_stgh_m.stghcrtdp,g_stgh_m.stghcrtdt, 
       g_stgh_m.stghmodid,g_stgh_m.stghmoddt,g_stgh_m.stghcnfid,g_stgh_m.stghcnfdt,g_stgh_m.stghownid_desc, 
       g_stgh_m.stghowndp_desc,g_stgh_m.stghcrtid_desc,g_stgh_m.stghcrtdp_desc,g_stgh_m.stghmodid_desc, 
       g_stgh_m.stghcnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt501_action_chk() THEN
      CLOSE astt501_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stgh_m.stghsite,g_stgh_m.stghdocdt,g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001, 
       g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus,g_stgh_m.stghownid,g_stgh_m.stghownid_desc, 
       g_stgh_m.stghowndp,g_stgh_m.stghowndp_desc,g_stgh_m.stghcrtid,g_stgh_m.stghcrtid_desc,g_stgh_m.stghcrtdp, 
       g_stgh_m.stghcrtdp_desc,g_stgh_m.stghcrtdt,g_stgh_m.stghmodid,g_stgh_m.stghmodid_desc,g_stgh_m.stghmoddt, 
       g_stgh_m.stghcnfid,g_stgh_m.stghcnfid_desc,g_stgh_m.stghcnfdt
 
   CASE g_stgh_m.stghstus
      WHEN "A"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
      WHEN "D"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
      WHEN "R"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "W"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_stgh_m.stghstus
            
            WHEN "A"
               HIDE OPTION "approved"
            WHEN "D"
               HIDE OPTION "withdraw"
            WHEN "R"
               HIDE OPTION "rejection"
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "W"
               HIDE OPTION "signing"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "X"
               HIDE OPTION "invalid"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
      CALL cl_set_act_visible("unconfirmed,invalid,confirmed",TRUE)
      CALL cl_set_act_visible("signing,withdraw",FALSE)
      CASE g_stgh_m.stghstus
         WHEN "N"
            #HIDE OPTION "open"
            CALL cl_set_act_visible("unconfirmed",FALSE)
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
            #HIDE OPTION "invalid"
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed",FALSE)
       
         WHEN "Y"
            #HIDE OPTION "confirmed"
            CALL cl_set_act_visible("invalid,confirmed",FALSE)
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
            IF NOT astt501_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt501_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt501_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt501_cl
            RETURN
         END IF
 
 
 
	  
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
      ON ACTION unconfirmed
         IF cl_auth_chk_act("unconfirmed") THEN
            LET lc_state = "N"
            #add-point:action控制 name="statechange.unconfirmed"
            
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
      ON ACTION confirmed
         IF cl_auth_chk_act("confirmed") THEN
            LET lc_state = "Y"
            #add-point:action控制 name="statechange.confirmed"
            
            #end add-point
         END IF
         EXIT MENU
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
   IF (lc_state <> "A" 
      AND lc_state <> "D"
      AND lc_state <> "R"
      AND lc_state <> "N"
      AND lc_state <> "W"
      AND lc_state <> "Y"
      AND lc_state <> "X"
      ) OR 
      g_stgh_m.stghstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt501_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   CALL cl_err_collect_init()
   LET l_success = TRUE
   LET g_stgh_m.stghcnfdt=cl_get_current()
   LET g_stgh_m.stghmoddt=cl_get_current()
   
   CASE 
      WHEN lc_state = 'Y'
         CALL s_astt501_conf_chk(g_stgh_m.stghdocno) RETURNING l_success
         IF l_success THEN
            IF cl_ask_confirm('lib-014') THEN
               CALL s_transaction_begin()
               CALL s_astt501_conf_upd(g_stgh_m.stghdocno) RETURNING l_success
               IF NOT l_success THEN
                  CALL cl_err_collect_show()
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL cl_err_collect_show()
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL cl_err_collect_show()
               CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
               RETURN            
            END IF
         ELSE
            CALL cl_err_collect_show()
            CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
            RETURN            
         END IF         
      WHEN lc_state = 'X'  
         CALL s_astt501_invalid_chk(g_stgh_m.stghdocno) RETURNING l_success
         IF l_success THEN
            IF cl_ask_confirm('lib-016') THEN
               CALL s_transaction_begin()
               CALL s_astt501_invalid_upd(g_stgh_m.stghdocno) RETURNING l_success
               IF NOT l_success THEN
                  CALL cl_err_collect_show()
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL cl_err_collect_show()
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL cl_err_collect_show()
               CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
               RETURN
            END IF
         ELSE
            CALL cl_err_collect_show()
            CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
            RETURN    
         END IF
      WHEN lc_state = 'N' 
         CALL s_astt501_unconf_chk(g_stgh_m.stghdocno) RETURNING l_success
         IF l_success THEN
            IF cl_ask_confirm('lib-015') THEN
               CALL s_transaction_begin()
               CALL s_astt501_unconf_upd(g_stgh_m.stghdocno) RETURNING l_success
               IF NOT l_success THEN
                  CALL cl_err_collect_show()
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL cl_err_collect_show()
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               CALL cl_err_collect_show()
               CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
               RETURN
            END IF
         ELSE
            CALL cl_err_collect_show()
            CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
            RETURN    
         END IF
      OTHERWISE
         CALL cl_err_collect_show()
         CALL s_transaction_end('N','0')   #160816-00068#17 by 08209 add
         RETURN
   END CASE
   #end add-point
   
   LET g_stgh_m.stghmodid = g_user
   LET g_stgh_m.stghmoddt = cl_get_current()
   LET g_stgh_m.stghstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stgh_t 
      SET (stghstus,stghmodid,stghmoddt) 
        = (g_stgh_m.stghstus,g_stgh_m.stghmodid,g_stgh_m.stghmoddt)     
    WHERE stghent = g_enterprise AND stghdocno = g_stgh_m.stghdocno
 
    
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
   ELSE
      CASE lc_state
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/rejection.png")
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/signing.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE astt501_master_referesh USING g_stgh_m.stghdocno INTO g_stgh_m.stghsite,g_stgh_m.stghdocdt, 
          g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001,g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus, 
          g_stgh_m.stghownid,g_stgh_m.stghowndp,g_stgh_m.stghcrtid,g_stgh_m.stghcrtdp,g_stgh_m.stghcrtdt, 
          g_stgh_m.stghmodid,g_stgh_m.stghmoddt,g_stgh_m.stghcnfid,g_stgh_m.stghcnfdt,g_stgh_m.stghownid_desc, 
          g_stgh_m.stghowndp_desc,g_stgh_m.stghcrtid_desc,g_stgh_m.stghcrtdp_desc,g_stgh_m.stghmodid_desc, 
          g_stgh_m.stghcnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stgh_m.stghsite,g_stgh_m.stghdocdt,g_stgh_m.stghdocno,g_stgh_m.stgh000,g_stgh_m.stgh001, 
          g_stgh_m.stgh002,g_stgh_m.stgh003,g_stgh_m.stghstus,g_stgh_m.stghownid,g_stgh_m.stghownid_desc, 
          g_stgh_m.stghowndp,g_stgh_m.stghowndp_desc,g_stgh_m.stghcrtid,g_stgh_m.stghcrtid_desc,g_stgh_m.stghcrtdp, 
          g_stgh_m.stghcrtdp_desc,g_stgh_m.stghcrtdt,g_stgh_m.stghmodid,g_stgh_m.stghmodid_desc,g_stgh_m.stghmoddt, 
          g_stgh_m.stghcnfid,g_stgh_m.stghcnfid_desc,g_stgh_m.stghcnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt501_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt501_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt501.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt501_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stgi_d.getLength() THEN
         LET g_detail_idx = g_stgi_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stgi_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stgi_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt501.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt501_b_fill2(pi_idx)
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
   
   CALL astt501_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt501.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt501_fill_chk(ps_idx)
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
 
{<section id="astt501.status_show" >}
PRIVATE FUNCTION astt501_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt501.mask_functions" >}
&include "erp/ast/astt501_mask.4gl"
 
{</section>}
 
{<section id="astt501.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt501_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
 
 
   CALL astt501_show()
   CALL astt501_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stgh_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stgi_d))
 
 
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
   #CALL astt501_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt501_ui_headershow()
   CALL astt501_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt501_draw_out()
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
   CALL astt501_ui_headershow()  
   CALL astt501_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt501.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt501_set_pk_array()
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
   LET g_pk_array[1].values = g_stgh_m.stghdocno
   LET g_pk_array[1].column = 'stghdocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt501.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt501.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt501_msgcentre_notify(lc_state)
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
   CALL astt501_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stgh_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt501.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt501_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#39 add-S
   SELECT stghstus  INTO g_stgh_m.stghstus
     FROM stgh_t
    WHERE stghent = g_enterprise
      AND stghdocno = g_stgh_m.stghdocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stgh_m.stghstus
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
        LET g_errparam.extend = g_stgh_m.stghdocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt501_set_act_visible()
        CALL astt501_set_act_no_visible()
        CALL astt501_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#39 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt501.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 帶出專櫃編號、供應商編號、供應商名稱
# Memo...........: 
# Usage..........: CALL astt501_stgi002_def()
#                  
# Date & Author..: 20150601 By beckxie
# Modify.........:
################################################################################
PRIVATE FUNCTION astt501_stgi002_def()
   DEFINE l_sql  STRING
#mark by dengdd 20151202(S)
#   IF g_stgh_m.stgh000 = '1' OR g_stgh_m.stgh000 = '2' THEN
#      LET l_sql="SELECT stga004,stga005,stga006,stga007,stga008,stga009,stga012,stga010    "
#   
#   ELSE
#      LET l_sql="SELECT stga004,stga005                                                    "
#   END IF
#mark by dengdd 20151202(E)   
   #add by dengdd 20151202(S)
   IF g_stgh_m.stgh000 = '1' OR g_stgh_m.stgh000 = '2' THEN
      LET l_sql="SELECT stga004,stga005,stga006,stga007,stga008,stga009,stga012,stga010    "
   END IF
   IF g_stgh_m.stgh000 ='3' OR g_stgh_m.stgh000='4' OR g_stgh_m.stgh000='5' OR g_stgh_m.stgh000='6' THEN
      LET l_sql="SELECT stga004,stga005 "
   END IF
   IF g_stgh_m.stgh000='7' THEN
      LET l_sql="SELECT stga004,stga005,stga006,stga007,stga010 "
   END IF
   #add by dengdd 20151202(E)
   LET l_sql=l_sql CLIPPED,"  FROM stga_t                                                  ",
                           " WHERE stgaent ='"||g_enterprise||"'                           ",
#                           "   AND stgasite='"||g_site||"'                                 ", #mark by dengdd 151202
                           "   AND stgasite='"||g_stgh_m.stghsite||"'                      ",  #add by dengdd 151202
                           "   AND stga001 ='"||g_stgi_d[l_ac].stgi005||"'                 ",
                           "   AND stga002 ='"||g_stgi_d[l_ac].stgi001||"'                 ",
                           "   AND stga003 ='"||g_stgi_d[l_ac].stgi002||"'                 "
   #調整類型 成本類別條件          
   IF g_stgh_m.stgh000 = '1' THEN
      LET l_sql=l_sql CLIPPED," AND stga013 IN('1','14')"
   END IF
   IF g_stgh_m.stgh000 = '2' THEN
      LET l_sql=l_sql CLIPPED," AND stga013 = '7'"
   END IF
   #add by dengdd 151202(S)
   IF g_stgh_m.stgh000 = '7' AND l_stgh000='1' THEN
      LET l_sql=l_sql CLIPPED," AND stga013 IN('1','14')"
   ELSE
      IF l_stgh000='2' THEN
          LET l_sql=l_sql CLIPPED," AND stga013 = '7'" 
      END IF
   END IF
   #add by dengdd 151202(E)
   PREPARE l_sql_stga FROM l_sql
   DECLARE l_sql_stga_cr SCROLL CURSOR FOR l_sql_stga
   OPEN l_sql_stga_cr
 
#mark by dengdd 20151202(S) 
#   IF g_stgh_m.stgh000 = '1' OR g_stgh_m.stgh000 = '2' THEN
#      FETCH l_sql_stga_cr INTO g_stgi_d[l_ac].stgi003,g_stgi_d[l_ac].stgi004,
#                               g_stgi_d[l_ac].stgi006,g_stgi_d[l_ac].stgi007,
#                               g_stgi_d[l_ac].stgi008,g_stgi_d[l_ac].stgi009,
#                               g_stgi_d[l_ac].stgi010,g_stgi_d[l_ac].stgi012
#   ELSE
#      FETCH l_sql_stga_cr INTO g_stgi_d[l_ac].stgi003,g_stgi_d[l_ac].stgi004
#   END IF  
#mark by dengdd 20151202(E)
    #add by dengdd 20151202(S)
    IF g_stgh_m.stgh000 = '1' OR g_stgh_m.stgh000 = '2' THEN
      FETCH l_sql_stga_cr INTO g_stgi_d[l_ac].stgi003,g_stgi_d[l_ac].stgi004,
                               g_stgi_d[l_ac].stgi006,g_stgi_d[l_ac].stgi007,
                               g_stgi_d[l_ac].stgi008,g_stgi_d[l_ac].stgi009,
                               g_stgi_d[l_ac].stgi010,g_stgi_d[l_ac].stgi012
    END IF
    
    IF g_stgh_m.stgh000 ='3' OR g_stgh_m.stgh000='4' OR g_stgh_m.stgh000='5' OR g_stgh_m.stgh000='6' THEN
      FETCH l_sql_stga_cr INTO g_stgi_d[l_ac].stgi003,g_stgi_d[l_ac].stgi004
    END IF 
    
    IF g_stgh_m.stgh000='7' THEN    
      FETCH l_sql_stga_cr INTO g_stgi_d[l_ac].stgi003,g_stgi_d[l_ac].stgi004,
                               g_stgi_d[l_ac].stgi006,g_stgi_d[l_ac].stgi007,
                               g_stgi_d[l_ac].stgi012
                               
      LET g_stgi_d[l_ac].stgi015=g_stgi_d[l_ac].stgi012
      LET g_stgi_d[l_ac].stgi013=g_stgi_d[l_ac].stgi012
    END IF
    #add by dengdd 20151202(E)
                               
   CALL astt501_stgi003_ref()
   CALL astt501_stgi004_ref()
#   IF g_stgh_m.stgh000 = '1' OR g_stgh_m.stgh000 = '2' #mark by dengdd 20151202
   IF g_stgh_m.stgh000 = '1' OR g_stgh_m.stgh000 = '2' OR g_stgh_m.stgh000='7'THEN #add by dengdd 20151202
      CALL astt501_stgi006_ref()
   END IF
   #150429-00011#22 20151106 add by beckxie---S
   LET g_stgi_d_o.stgi001=g_stgi_d[l_ac].stgi001
   LET g_stgi_d_o.stgi002=g_stgi_d[l_ac].stgi002
   LET g_stgi_d_o.stgi005=g_stgi_d[l_ac].stgi005
   #150429-00011#22 20151106 add by beckxie---E
END FUNCTION

PRIVATE FUNCTION astt501_stgi003_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stgi_d[l_ac].stgi003
   CALL ap_ref_array2(g_ref_fields,"SELECT mhael023 FROM mhael_t WHERE mhaelent='"||g_enterprise||"' AND mhael001=? AND mhael022='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stgi_d[l_ac].stgi003_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stgi_d[l_ac].stgi003_desc
END FUNCTION

PRIVATE FUNCTION astt501_stgi004_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stgi_d[l_ac].stgi004
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal003 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stgi_d[l_ac].stgi004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stgi_d[l_ac].stgi004_desc
END FUNCTION

PRIVATE FUNCTION astt501_stgi006_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stgi_d[l_ac].stgi006
   CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stgi_d[l_ac].stgi006_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stgi_d[l_ac].stgi006_desc
END FUNCTION

################################################################################
# Descriptions...: 由合同帶出計算條件為(應收金額或實收金額)
# Memo...........:
# Usage..........: CALL astt501_stgi014_def()
#                  RETURNING 回传参数
# Date & Author..: 20150604 by beckxie
# Modify.........: 20150729 by beckxie(asti202變更取應收實收規則)
################################################################################
PRIVATE FUNCTION astt501_stgi014_def()
   DEFINE l_calcflag  LIKE type_t.chr1   #asti202中 應收實收flag(Y為實收,N為應收)
   
   LET l_calcflag=''
   SELECT COALESCE(stab010,'N') INTO l_calcflag
     FROM stab_t
       LEFT JOIN(SELECT stfc016              #取stfc016計算基準
                   FROM stfa_t, stfc_t
                  WHERE stfaent = stfcent
                    AND stfaent = g_enterprise #160905-00007#16 add
                    AND stfa001 = stfc001
                    AND stfa005 = g_stgi_d[l_ac].stgi003
                    AND stfc002 = g_stgi_d[l_ac].stgi002)
       ON stabent=g_enterprise AND stab001 = stfc016
   WHERE stabent = g_enterprise AND stab001 = stfc016 
     AND EXISTS (SELECT 1 FROM stat_t WHERE stabent = statent AND stab001 = stat003 and stat001 = '4'
                 AND statent = g_enterprise #160905-00007#16 add
                ) 
     AND stab008 = 'Y' AND stab009='Y'
   
   RETURN l_calcflag
   
END FUNCTION

PRIVATE FUNCTION astt501_set_comp_visible()
   CALL cl_set_comp_visible("stgh001,stgh002,stgi001,stgi001_desc,stgi002,stgi002_desc", TRUE)
   CALL cl_set_comp_visible("stgi007,stgi008,stgi009,stgi010,stgi011,stgi012,stgi013", TRUE)
END FUNCTION

PRIVATE FUNCTION astt501_set_comp_no_visible()
#   IF NOT(g_stgh_m.stgh000='1' OR g_stgh_m.stgh000='2') THEN   #mark by dengdd 151201
   IF NOT(g_stgh_m.stgh000='1' OR g_stgh_m.stgh000='2' OR g_stgh_m.stgh000='7') THEN  #mod by dengdd 151201
      CALL cl_set_comp_visible("stgh001,stgh002,stgi001,stgi001_desc,stgi002,stgi002_desc", FALSE)
      CALL cl_set_comp_visible("stgi007,stgi008,stgi009,stgi010,stgi011,stgi012,stgi013", FALSE)
   END IF
END FUNCTION

PRIVATE FUNCTION astt501_cnt_stga()
   DEFINE l_cnt_stga LIKE type_t.num5
   LET l_cnt_stga = 0
   IF g_stgh_m.stgh000 = '1' THEN
      SELECT COUNT(*) INTO l_cnt_stga 
        FROM stga_t
       WHERE stgaent  = g_enterprise                        
         AND stgasite = g_stgh_m.stghsite                                   
         AND stga001 BETWEEN g_stgh_m.stgh001 AND g_stgh_m.stgh002
         AND stga013 IN ('1','14')
   ELSE
      SELECT COUNT(*) INTO l_cnt_stga 
        FROM stga_t      
       WHERE stgaent  = g_enterprise                        
         AND stgasite = g_stgh_m.stghsite                                   
         AND stga001 BETWEEN g_stgh_m.stgh001 AND g_stgh_m.stgh002
         AND stga013 IN ('7')
   END IF
   RETURN l_cnt_stga
END FUNCTION

PRIVATE FUNCTION astt501_stgi001_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stgi_d[l_ac].stgi001
   CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stgi_d[l_ac].stgi001_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stgi_d[l_ac].stgi001_desc
END FUNCTION

PRIVATE FUNCTION astt501_stgi002_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stgi_d[l_ac].stgi002
   CALL ap_ref_array2(g_ref_fields,"SELECT inayl003 FROM inayl_t WHERE inaylent='"||g_enterprise||"' AND inayl001=? AND inayl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stgi_d[l_ac].stgi002_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stgi_d[l_ac].stgi002_desc
END FUNCTION

 
{</section>}
 
