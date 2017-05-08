#該程式未解開Section, 採用最新樣板產出!
{<section id="astt304.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0006(2016-04-08 16:26:10), PR版次:0006(2016-11-16 11:27:25)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000027
#+ Filename...: astt304
#+ Description: 供應商往來金額調整單
#+ Creator....: 03247(2016-04-08 16:26:13)
#+ Modifier...: 03247 -SD/PR- 02481
 
{</section>}
 
{<section id="astt304.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#151125-00001#4   2015/11/26   By 06948   增加作廢時詢問「是否作廢」
#160816-00068#16  2016/08/19   By 08209   調整transaction
#160818-00017#38 2016-08-24 By 08734 删除修改未重新判断状态码
#Modify.....:   NO.161024-00025#10    2016-10-26 By 06189    aooi500
#160824-00007#178  2016/11/09   By 06137    修正舊值備份寫法
#161111-00028#3    2016/11/16   by 02481    标准程式定义采用宣告模式,弃用.*写法
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
PRIVATE type type_g_pmds_m        RECORD
       pmdssite LIKE pmds_t.pmdssite, 
   pmdssite_desc LIKE type_t.chr80, 
   pmdsdocdt LIKE pmds_t.pmdsdocdt, 
   pmdsdocno LIKE pmds_t.pmdsdocno, 
   pmds000 LIKE pmds_t.pmds000, 
   pmds007 LIKE pmds_t.pmds007, 
   pmds007_desc LIKE type_t.chr80, 
   pmds202 LIKE pmds_t.pmds202, 
   pmds201 LIKE pmds_t.pmds201, 
   pmds044 LIKE pmds_t.pmds044, 
   pmdsunit LIKE pmds_t.pmdsunit, 
   pmdsunit_desc LIKE type_t.chr80, 
   pmds002 LIKE pmds_t.pmds002, 
   pmds002_desc LIKE type_t.chr80, 
   pmds045 LIKE pmds_t.pmds045, 
   pmdsstus LIKE pmds_t.pmdsstus, 
   pmdsownid LIKE pmds_t.pmdsownid, 
   pmdsownid_desc LIKE type_t.chr80, 
   pmdsowndp LIKE pmds_t.pmdsowndp, 
   pmdsowndp_desc LIKE type_t.chr80, 
   pmdscrtid LIKE pmds_t.pmdscrtid, 
   pmdscrtid_desc LIKE type_t.chr80, 
   pmdscrtdp LIKE pmds_t.pmdscrtdp, 
   pmdscrtdp_desc LIKE type_t.chr80, 
   pmdscrtdt LIKE pmds_t.pmdscrtdt, 
   pmdsmodid LIKE pmds_t.pmdsmodid, 
   pmdsmodid_desc LIKE type_t.chr80, 
   pmdsmoddt LIKE pmds_t.pmdsmoddt, 
   pmdscnfid LIKE pmds_t.pmdscnfid, 
   pmdscnfid_desc LIKE type_t.chr80, 
   pmdscnfdt LIKE pmds_t.pmdscnfdt, 
   pmdspstid LIKE pmds_t.pmdspstid, 
   pmdspstid_desc LIKE type_t.chr80, 
   pmdspstdt LIKE pmds_t.pmdspstdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_pmdt_d        RECORD
       pmdtseq LIKE pmdt_t.pmdtseq, 
   pmdt016 LIKE pmdt_t.pmdt016, 
   pmdt016_desc LIKE type_t.chr500, 
   pmdt006 LIKE pmdt_t.pmdt006, 
   pmdt006_desc LIKE type_t.chr500, 
   pmdt200 LIKE pmdt_t.pmdt200, 
   pmdt046 LIKE pmdt_t.pmdt046, 
   pmdt046_desc LIKE type_t.chr500, 
   pmdt039 LIKE pmdt_t.pmdt039, 
   pmdt047 LIKE pmdt_t.pmdt047, 
   pmdt038 LIKE pmdt_t.pmdt038
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_pmdssite LIKE pmds_t.pmdssite,
      b_pmdsdocno LIKE pmds_t.pmdsdocno,
      b_pmdsdocdt LIKE pmds_t.pmdsdocdt,
      b_pmds002 LIKE pmds_t.pmds002,
   b_pmds002_desc LIKE type_t.chr80,
      b_pmds202 LIKE pmds_t.pmds202,
      b_pmds201 LIKE pmds_t.pmds201,
      b_pmds045 LIKE pmds_t.pmds045
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
 TYPE type_g_pmdt2_d        RECORD
   pmdtseq      LIKE pmdt_t.pmdtseq, 
   pmds007      LIKE pmds_t.pmds007, 
   pmds007_desc LIKE type_t.chr500,
   pmdt211      LIKE pmdt_t.pmdt211, 
   pmdt006      LIKE pmdt_t.pmdt006,
   pmdt006_desc LIKE type_t.chr500, 
   pmdt016      LIKE pmdt_t.pmdt016,
   pmdt016_desc LIKE type_t.chr500, 
   pmdt039      LIKE pmdt_t.pmdt039, 
   pmdt047      LIKE pmdt_t.pmdt047, 
   pmdt039_1    LIKE pmdt_t.pmdt039, 
   pmdt047_1    LIKE pmdt_t.pmdt047
       END RECORD
DEFINE g_pmdt2_d          DYNAMIC ARRAY OF type_g_pmdt2_d
DEFINE g_pmdt2_d_t        type_g_pmdt_d
DEFINE g_site_flag        LIKE type_t.num5
#end add-point
       
#模組變數(Module Variables)
DEFINE g_pmds_m          type_g_pmds_m
DEFINE g_pmds_m_t        type_g_pmds_m
DEFINE g_pmds_m_o        type_g_pmds_m
DEFINE g_pmds_m_mask_o   type_g_pmds_m #轉換遮罩前資料
DEFINE g_pmds_m_mask_n   type_g_pmds_m #轉換遮罩後資料
 
   DEFINE g_pmdsdocno_t LIKE pmds_t.pmdsdocno
 
 
DEFINE g_pmdt_d          DYNAMIC ARRAY OF type_g_pmdt_d
DEFINE g_pmdt_d_t        type_g_pmdt_d
DEFINE g_pmdt_d_o        type_g_pmdt_d
DEFINE g_pmdt_d_mask_o   DYNAMIC ARRAY OF type_g_pmdt_d #轉換遮罩前資料
DEFINE g_pmdt_d_mask_n   DYNAMIC ARRAY OF type_g_pmdt_d #轉換遮罩後資料
 
 
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
 
{<section id="astt304.main" >}
#應用 a26 樣板自動產生(Version:7)
#+ 作業開始(主程式類型)
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   #add-point:main段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="main.define"
   DEFINE l_success LIKE type_t.num5 #add by geza 20161026 #161024-00025#10
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
   LET g_forupd_sql = " SELECT pmdssite,'',pmdsdocdt,pmdsdocno,pmds000,pmds007,'',pmds202,pmds201,pmds044, 
       pmdsunit,'',pmds002,'',pmds045,pmdsstus,pmdsownid,'',pmdsowndp,'',pmdscrtid,'',pmdscrtdp,'',pmdscrtdt, 
       pmdsmodid,'',pmdsmoddt,pmdscnfid,'',pmdscnfdt,pmdspstid,'',pmdspstdt", 
                      " FROM pmds_t",
                      " WHERE pmdsent= ? AND pmdsdocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt304_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.pmdssite,t0.pmdsdocdt,t0.pmdsdocno,t0.pmds000,t0.pmds007,t0.pmds202, 
       t0.pmds201,t0.pmds044,t0.pmdsunit,t0.pmds002,t0.pmds045,t0.pmdsstus,t0.pmdsownid,t0.pmdsowndp, 
       t0.pmdscrtid,t0.pmdscrtdp,t0.pmdscrtdt,t0.pmdsmodid,t0.pmdsmoddt,t0.pmdscnfid,t0.pmdscnfdt,t0.pmdspstid, 
       t0.pmdspstdt,t1.ooefl003 ,t2.pmaal004 ,t3.ooefl003 ,t4.ooag011 ,t5.ooag011 ,t6.ooefl003 ,t7.ooag011 , 
       t8.ooefl003 ,t9.ooag011 ,t10.ooag011 ,t11.ooag011",
               " FROM pmds_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.pmdssite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.pmds007 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN ooefl_t t3 ON t3.ooeflent="||g_enterprise||" AND t3.ooefl001=t0.pmdsunit AND t3.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t4 ON t4.ooagent="||g_enterprise||" AND t4.ooag001=t0.pmds002  ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.pmdsownid  ",
               " LEFT JOIN ooefl_t t6 ON t6.ooeflent="||g_enterprise||" AND t6.ooefl001=t0.pmdsowndp AND t6.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t7 ON t7.ooagent="||g_enterprise||" AND t7.ooag001=t0.pmdscrtid  ",
               " LEFT JOIN ooefl_t t8 ON t8.ooeflent="||g_enterprise||" AND t8.ooefl001=t0.pmdscrtdp AND t8.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.pmdsmodid  ",
               " LEFT JOIN ooag_t t10 ON t10.ooagent="||g_enterprise||" AND t10.ooag001=t0.pmdscnfid  ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.pmdspstid  ",
 
               " WHERE t0.pmdsent = " ||g_enterprise|| " AND t0.pmdsdocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt304_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt304 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt304_init()   
 
      #進入選單 Menu (="N")
      CALL astt304_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt304
      
   END IF 
   
   CLOSE astt304_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success #add by geza 20161026 #161024-00025#10
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt304.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt304_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success LIKE type_t.num5 #add by geza 20161026 #161024-00025#10
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
      CALL cl_set_combo_scc_part('pmdsstus','13','N,Y,S,A,D,R,W,X,Z')
 
      CALL cl_set_combo_scc('pmds000','2060') 
   CALL cl_set_combo_scc('pmds202','6814') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('pmds202','6844','1,2') 
   CALL cl_set_combo_scc_part('b_pmds202','6844','1,2,3,4,5,6') 
   CALL s_aooi500_create_temp() RETURNING l_success #add by geza 20161026 #161024-00025#10   
   #end add-point
   
   #初始化搜尋條件
   CALL astt304_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt304.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt304_ui_dialog()
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
            CALL astt304_insert()
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
         INITIALIZE g_pmds_m.* TO NULL
         CALL g_pmdt_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt304_init()
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
               
               CALL astt304_fetch('') # reload data
               LET l_ac = 1
               CALL astt304_ui_detailshow() #Setting the current row 
         
               CALL astt304_idx_chk()
               #NEXT FIELD pmdtseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_pmdt_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt304_idx_chk()
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
               CALL astt304_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         DISPLAY ARRAY g_pmdt2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
         
            BEFORE ROW
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx = l_ac
               
            BEFORE DISPLAY
               #如果一直都在單身1則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_detail_idx)
               END IF
               LET g_loc = 'm'
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_current_page = 2
         END DISPLAY
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL astt304_browser_fill("")
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
               CALL astt304_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt304_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt304_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt304_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt304_set_act_visible()   
            CALL astt304_set_act_no_visible()
            IF NOT (g_pmds_m.pmdsdocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " pmdsent = " ||g_enterprise|| " AND",
                                  " pmdsdocno = '", g_pmds_m.pmdsdocno, "' "
 
               #填到對應位置
               CALL astt304_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "pmds_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "pmdt_t" 
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
               CALL astt304_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "pmds_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "pmdt_t" 
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
                  CALL astt304_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt304_fetch("F")
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
               CALL astt304_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt304_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt304_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt304_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt304_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt304_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt304_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt304_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt304_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt304_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt304_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_pmdt_d)
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
               NEXT FIELD pmdtseq
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
               CALL astt304_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt304_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt304_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt304_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/ast/astt304_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/ast/astt304_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt304_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt304_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_pmds002
            LET g_action_choice="prog_pmds002"
            IF cl_auth_chk_act("prog_pmds002") THEN
               
               #add-point:ON ACTION prog_pmds002 name="menu.prog_pmds002"
               #應用 a45 樣板自動產生(Version:2)
               CALL cl_user_contact("aooi130", "ooag_t", "ooag002", "ooag001",g_pmds_m.pmds002)
 


               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt304_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt304_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt304_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_pmds_m.pmdsdocdt)
 
 
 
         
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
 
{<section id="astt304.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt304_browser_fill(ps_page_action)
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
   #add by geza 20161026 #161024-00025#10(S)
   CALL s_aooi500_sql_where(g_prog,'pmdssite') RETURNING l_where
   LET l_wc = l_wc," AND ",l_where
   #add by geza 20161026 #161024-00025#10(E)
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
   LET l_wc = l_wc," AND pmds000 = '27' "
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT pmdsdocno ",
                      " FROM pmds_t ",
                      " ",
                      " LEFT JOIN pmdt_t ON pmdtent = pmdsent AND pmdsdocno = pmdtdocno ", "  ",
                      #add-point:browser_fill段sql(pmdt_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE pmdsent = " ||g_enterprise|| " AND pmdtent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("pmds_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT pmdsdocno ",
                      " FROM pmds_t ", 
                      "  ",
                      "  ",
                      " WHERE pmdsent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("pmds_t")
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
      INITIALIZE g_pmds_m.* TO NULL
      CALL g_pmdt_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      CALL g_pmdt2_d.clear()
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.pmdssite,t0.pmdsdocno,t0.pmdsdocdt,t0.pmds002,t0.pmds202,t0.pmds201,t0.pmds045 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.pmdsstus,t0.pmdssite,t0.pmdsdocno,t0.pmdsdocdt,t0.pmds002,t0.pmds202, 
          t0.pmds201,t0.pmds045,t1.ooag011 ",
                  " FROM pmds_t t0",
                  "  ",
                  "  LEFT JOIN pmdt_t ON pmdtent = pmdsent AND pmdsdocno = pmdtdocno ", "  ", 
                  #add-point:browser_fill段sql(pmdt_t1) name="browser_fill.join.pmdt_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.pmds002  ",
 
                  " WHERE t0.pmdsent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("pmds_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.pmdsstus,t0.pmdssite,t0.pmdsdocno,t0.pmdsdocdt,t0.pmds002,t0.pmds202, 
          t0.pmds201,t0.pmds045,t1.ooag011 ",
                  " FROM pmds_t t0",
                  "  ",
                                 " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.pmds002  ",
 
                  " WHERE t0.pmdsent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("pmds_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY pmdsdocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"pmds_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_pmdssite,g_browser[g_cnt].b_pmdsdocno, 
          g_browser[g_cnt].b_pmdsdocdt,g_browser[g_cnt].b_pmds002,g_browser[g_cnt].b_pmds202,g_browser[g_cnt].b_pmds201, 
          g_browser[g_cnt].b_pmds045,g_browser[g_cnt].b_pmds002_desc
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
         CALL astt304_browser_mask()
      
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
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/invalid.png"
         WHEN "Z"
            LET g_browser[g_cnt].b_statepic = "stus/16/unposted.png"
         
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
   
   IF cl_null(g_browser[g_cnt].b_pmdsdocno) THEN
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
 
{<section id="astt304.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt304_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_pmds_m.pmdsdocno = g_browser[g_current_idx].b_pmdsdocno   
 
   EXECUTE astt304_master_referesh USING g_pmds_m.pmdsdocno INTO g_pmds_m.pmdssite,g_pmds_m.pmdsdocdt, 
       g_pmds_m.pmdsdocno,g_pmds_m.pmds000,g_pmds_m.pmds007,g_pmds_m.pmds202,g_pmds_m.pmds201,g_pmds_m.pmds044, 
       g_pmds_m.pmdsunit,g_pmds_m.pmds002,g_pmds_m.pmds045,g_pmds_m.pmdsstus,g_pmds_m.pmdsownid,g_pmds_m.pmdsowndp, 
       g_pmds_m.pmdscrtid,g_pmds_m.pmdscrtdp,g_pmds_m.pmdscrtdt,g_pmds_m.pmdsmodid,g_pmds_m.pmdsmoddt, 
       g_pmds_m.pmdscnfid,g_pmds_m.pmdscnfdt,g_pmds_m.pmdspstid,g_pmds_m.pmdspstdt,g_pmds_m.pmdssite_desc, 
       g_pmds_m.pmds007_desc,g_pmds_m.pmdsunit_desc,g_pmds_m.pmds002_desc,g_pmds_m.pmdsownid_desc,g_pmds_m.pmdsowndp_desc, 
       g_pmds_m.pmdscrtid_desc,g_pmds_m.pmdscrtdp_desc,g_pmds_m.pmdsmodid_desc,g_pmds_m.pmdscnfid_desc, 
       g_pmds_m.pmdspstid_desc
   
   CALL astt304_pmds_t_mask()
   CALL astt304_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt304.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt304_ui_detailshow()
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
 
{<section id="astt304.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt304_ui_browser_refresh()
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
      IF g_browser[l_i].b_pmdsdocno = g_pmds_m.pmdsdocno 
 
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
 
{<section id="astt304.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt304_construct()
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
   INITIALIZE g_pmds_m.* TO NULL
   CALL g_pmdt_d.clear()        
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
   CALL g_pmdt2_d.clear()
   CALL cl_set_combo_scc_part('pmds202','6844','1,2,3,4,5,6') 
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON pmdssite,pmdsdocdt,pmdsdocno,pmds000,pmds007,pmds202,pmds201,pmds044, 
          pmdsunit,pmds002,pmds045,pmdsstus,pmdsownid,pmdsowndp,pmdscrtid,pmdscrtdp,pmdscrtdt,pmdsmodid, 
          pmdsmoddt,pmdscnfid,pmdscnfdt,pmdspstid,pmdspstdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<pmdscrtdt>>----
         AFTER FIELD pmdscrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<pmdsmoddt>>----
         AFTER FIELD pmdsmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<pmdscnfdt>>----
         AFTER FIELD pmdscnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<pmdspstdt>>----
         AFTER FIELD pmdspstdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
 
 
            
         #一般欄位開窗相關處理    
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdssite
            #add-point:BEFORE FIELD pmdssite name="construct.b.pmdssite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdssite
            
            #add-point:AFTER FIELD pmdssite name="construct.a.pmdssite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pmdssite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdssite
            #add-point:ON ACTION controlp INFIELD pmdssite name="construct.c.pmdssite"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'pmdssite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmdssite  #顯示到畫面上
            NEXT FIELD pmdssite    
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdsdocdt
            #add-point:BEFORE FIELD pmdsdocdt name="construct.b.pmdsdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdsdocdt
            
            #add-point:AFTER FIELD pmdsdocdt name="construct.a.pmdsdocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pmdsdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdsdocdt
            #add-point:ON ACTION controlp INFIELD pmdsdocdt name="construct.c.pmdsdocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.pmdsdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdsdocno
            #add-point:ON ACTION controlp INFIELD pmdsdocno name="construct.c.pmdsdocno"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '27'
            CALL q_pmdsdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmdsdocno  #顯示到畫面上
            NEXT FIELD pmdsdocno                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdsdocno
            #add-point:BEFORE FIELD pmdsdocno name="construct.b.pmdsdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdsdocno
            
            #add-point:AFTER FIELD pmdsdocno name="construct.a.pmdsdocno"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmds000
            #add-point:BEFORE FIELD pmds000 name="construct.b.pmds000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmds000
            
            #add-point:AFTER FIELD pmds000 name="construct.a.pmds000"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pmds000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmds000
            #add-point:ON ACTION controlp INFIELD pmds000 name="construct.c.pmds000"
            
            #END add-point
 
 
         #Ctrlp:construct.c.pmds007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmds007
            #add-point:ON ACTION controlp INFIELD pmds007 name="construct.c.pmds007"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmds007  #顯示到畫面上
            NEXT FIELD pmds007                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmds007
            #add-point:BEFORE FIELD pmds007 name="construct.b.pmds007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmds007
            
            #add-point:AFTER FIELD pmds007 name="construct.a.pmds007"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmds202
            #add-point:BEFORE FIELD pmds202 name="construct.b.pmds202"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmds202
            
            #add-point:AFTER FIELD pmds202 name="construct.a.pmds202"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pmds202
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmds202
            #add-point:ON ACTION controlp INFIELD pmds202 name="construct.c.pmds202"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmds201
            #add-point:BEFORE FIELD pmds201 name="construct.b.pmds201"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmds201
            
            #add-point:AFTER FIELD pmds201 name="construct.a.pmds201"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pmds201
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmds201
            #add-point:ON ACTION controlp INFIELD pmds201 name="construct.c.pmds201"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmds044
            #add-point:BEFORE FIELD pmds044 name="construct.b.pmds044"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmds044
            
            #add-point:AFTER FIELD pmds044 name="construct.a.pmds044"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pmds044
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmds044
            #add-point:ON ACTION controlp INFIELD pmds044 name="construct.c.pmds044"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdsunit
            #add-point:BEFORE FIELD pmdsunit name="construct.b.pmdsunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdsunit
            
            #add-point:AFTER FIELD pmdsunit name="construct.a.pmdsunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pmdsunit
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdsunit
            #add-point:ON ACTION controlp INFIELD pmdsunit name="construct.c.pmdsunit"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'pmdsunit',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmdsunit  #顯示到畫面上
            NEXT FIELD pmdsunit   
            #END add-point
 
 
         #Ctrlp:construct.c.pmds002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmds002
            #add-point:ON ACTION controlp INFIELD pmds002 name="construct.c.pmds002"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmds002  #顯示到畫面上
            NEXT FIELD pmds002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmds002
            #add-point:BEFORE FIELD pmds002 name="construct.b.pmds002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmds002
            
            #add-point:AFTER FIELD pmds002 name="construct.a.pmds002"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmds045
            #add-point:BEFORE FIELD pmds045 name="construct.b.pmds045"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmds045
            
            #add-point:AFTER FIELD pmds045 name="construct.a.pmds045"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pmds045
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmds045
            #add-point:ON ACTION controlp INFIELD pmds045 name="construct.c.pmds045"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdsstus
            #add-point:BEFORE FIELD pmdsstus name="construct.b.pmdsstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdsstus
            
            #add-point:AFTER FIELD pmdsstus name="construct.a.pmdsstus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pmdsstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdsstus
            #add-point:ON ACTION controlp INFIELD pmdsstus name="construct.c.pmdsstus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.pmdsownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdsownid
            #add-point:ON ACTION controlp INFIELD pmdsownid name="construct.c.pmdsownid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmdsownid  #顯示到畫面上
            NEXT FIELD pmdsownid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdsownid
            #add-point:BEFORE FIELD pmdsownid name="construct.b.pmdsownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdsownid
            
            #add-point:AFTER FIELD pmdsownid name="construct.a.pmdsownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pmdsowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdsowndp
            #add-point:ON ACTION controlp INFIELD pmdsowndp name="construct.c.pmdsowndp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmdsowndp  #顯示到畫面上
            NEXT FIELD pmdsowndp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdsowndp
            #add-point:BEFORE FIELD pmdsowndp name="construct.b.pmdsowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdsowndp
            
            #add-point:AFTER FIELD pmdsowndp name="construct.a.pmdsowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pmdscrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdscrtid
            #add-point:ON ACTION controlp INFIELD pmdscrtid name="construct.c.pmdscrtid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmdscrtid  #顯示到畫面上
            NEXT FIELD pmdscrtid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdscrtid
            #add-point:BEFORE FIELD pmdscrtid name="construct.b.pmdscrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdscrtid
            
            #add-point:AFTER FIELD pmdscrtid name="construct.a.pmdscrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pmdscrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdscrtdp
            #add-point:ON ACTION controlp INFIELD pmdscrtdp name="construct.c.pmdscrtdp"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmdscrtdp  #顯示到畫面上
            NEXT FIELD pmdscrtdp                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdscrtdp
            #add-point:BEFORE FIELD pmdscrtdp name="construct.b.pmdscrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdscrtdp
            
            #add-point:AFTER FIELD pmdscrtdp name="construct.a.pmdscrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdscrtdt
            #add-point:BEFORE FIELD pmdscrtdt name="construct.b.pmdscrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.pmdsmodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdsmodid
            #add-point:ON ACTION controlp INFIELD pmdsmodid name="construct.c.pmdsmodid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmdsmodid  #顯示到畫面上
            NEXT FIELD pmdsmodid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdsmodid
            #add-point:BEFORE FIELD pmdsmodid name="construct.b.pmdsmodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdsmodid
            
            #add-point:AFTER FIELD pmdsmodid name="construct.a.pmdsmodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdsmoddt
            #add-point:BEFORE FIELD pmdsmoddt name="construct.b.pmdsmoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.pmdscnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdscnfid
            #add-point:ON ACTION controlp INFIELD pmdscnfid name="construct.c.pmdscnfid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmdscnfid  #顯示到畫面上
            NEXT FIELD pmdscnfid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdscnfid
            #add-point:BEFORE FIELD pmdscnfid name="construct.b.pmdscnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdscnfid
            
            #add-point:AFTER FIELD pmdscnfid name="construct.a.pmdscnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdscnfdt
            #add-point:BEFORE FIELD pmdscnfdt name="construct.b.pmdscnfdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.pmdspstid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdspstid
            #add-point:ON ACTION controlp INFIELD pmdspstid name="construct.c.pmdspstid"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmdspstid  #顯示到畫面上
            NEXT FIELD pmdspstid                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdspstid
            #add-point:BEFORE FIELD pmdspstid name="construct.b.pmdspstid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdspstid
            
            #add-point:AFTER FIELD pmdspstid name="construct.a.pmdspstid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdspstdt
            #add-point:BEFORE FIELD pmdspstdt name="construct.b.pmdspstdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON pmdtseq,pmdt016,pmdt006,pmdt200,pmdt046,pmdt039,pmdt047,pmdt038
           FROM s_detail1[1].pmdtseq,s_detail1[1].pmdt016,s_detail1[1].pmdt006,s_detail1[1].pmdt200, 
               s_detail1[1].pmdt046,s_detail1[1].pmdt039,s_detail1[1].pmdt047,s_detail1[1].pmdt038
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdtseq
            #add-point:BEFORE FIELD pmdtseq name="construct.b.page1.pmdtseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdtseq
            
            #add-point:AFTER FIELD pmdtseq name="construct.a.page1.pmdtseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pmdtseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdtseq
            #add-point:ON ACTION controlp INFIELD pmdtseq name="construct.c.page1.pmdtseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.pmdt016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdt016
            #add-point:ON ACTION controlp INFIELD pmdt016 name="construct.c.page1.pmdt016"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001_6()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmdt016  #顯示到畫面上
            NEXT FIELD pmdt016                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdt016
            #add-point:BEFORE FIELD pmdt016 name="construct.b.page1.pmdt016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdt016
            
            #add-point:AFTER FIELD pmdt016 name="construct.a.page1.pmdt016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pmdt006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdt006
            #add-point:ON ACTION controlp INFIELD pmdt006 name="construct.c.page1.pmdt006"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_imaf001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmdt006  #顯示到畫面上
            NEXT FIELD pmdt006                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdt006
            #add-point:BEFORE FIELD pmdt006 name="construct.b.page1.pmdt006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdt006
            
            #add-point:AFTER FIELD pmdt006 name="construct.a.page1.pmdt006"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdt200
            #add-point:BEFORE FIELD pmdt200 name="construct.b.page1.pmdt200"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdt200
            
            #add-point:AFTER FIELD pmdt200 name="construct.a.page1.pmdt200"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pmdt200
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdt200
            #add-point:ON ACTION controlp INFIELD pmdt200 name="construct.c.page1.pmdt200"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_imay003_6()                     #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmdt200  #顯示到畫面上
            NEXT FIELD pmdt200                     #返回原欄位
            #END add-point
 
 
         #Ctrlp:construct.c.page1.pmdt046
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdt046
            #add-point:ON ACTION controlp INFIELD pmdt046 name="construct.c.page1.pmdt046"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oodb002_2()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmdt046  #顯示到畫面上
            NEXT FIELD pmdt046                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdt046
            #add-point:BEFORE FIELD pmdt046 name="construct.b.page1.pmdt046"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdt046
            
            #add-point:AFTER FIELD pmdt046 name="construct.a.page1.pmdt046"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdt039
            #add-point:BEFORE FIELD pmdt039 name="construct.b.page1.pmdt039"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdt039
            
            #add-point:AFTER FIELD pmdt039 name="construct.a.page1.pmdt039"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pmdt039
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdt039
            #add-point:ON ACTION controlp INFIELD pmdt039 name="construct.c.page1.pmdt039"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdt047
            #add-point:BEFORE FIELD pmdt047 name="construct.b.page1.pmdt047"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdt047
            
            #add-point:AFTER FIELD pmdt047 name="construct.a.page1.pmdt047"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pmdt047
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdt047
            #add-point:ON ACTION controlp INFIELD pmdt047 name="construct.c.page1.pmdt047"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdt038
            #add-point:BEFORE FIELD pmdt038 name="construct.b.page1.pmdt038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdt038
            
            #add-point:AFTER FIELD pmdt038 name="construct.a.page1.pmdt038"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.pmdt038
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdt038
            #add-point:ON ACTION controlp INFIELD pmdt038 name="construct.c.page1.pmdt038"
            
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
                  WHEN la_wc[li_idx].tableid = "pmds_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "pmdt_t" 
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
 
{<section id="astt304.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt304_filter()
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
      CONSTRUCT g_wc_filter ON pmdssite,pmdsdocno,pmdsdocdt,pmds002,pmds202,pmds201,pmds045
                          FROM s_browse[1].b_pmdssite,s_browse[1].b_pmdsdocno,s_browse[1].b_pmdsdocdt, 
                              s_browse[1].b_pmds002,s_browse[1].b_pmds202,s_browse[1].b_pmds201,s_browse[1].b_pmds045 
 
 
         BEFORE CONSTRUCT
               DISPLAY astt304_filter_parser('pmdssite') TO s_browse[1].b_pmdssite
            DISPLAY astt304_filter_parser('pmdsdocno') TO s_browse[1].b_pmdsdocno
            DISPLAY astt304_filter_parser('pmdsdocdt') TO s_browse[1].b_pmdsdocdt
            DISPLAY astt304_filter_parser('pmds002') TO s_browse[1].b_pmds002
            DISPLAY astt304_filter_parser('pmds202') TO s_browse[1].b_pmds202
            DISPLAY astt304_filter_parser('pmds201') TO s_browse[1].b_pmds201
            DISPLAY astt304_filter_parser('pmds045') TO s_browse[1].b_pmds045
      
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
 
      CALL astt304_filter_show('pmdssite')
   CALL astt304_filter_show('pmdsdocno')
   CALL astt304_filter_show('pmdsdocdt')
   CALL astt304_filter_show('pmds002')
   CALL astt304_filter_show('pmds202')
   CALL astt304_filter_show('pmds201')
   CALL astt304_filter_show('pmds045')
 
END FUNCTION
 
{</section>}
 
{<section id="astt304.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt304_filter_parser(ps_field)
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
 
{<section id="astt304.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt304_filter_show(ps_field)
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
   LET ls_condition = astt304_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt304.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt304_query()
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
   CALL g_pmdt_d.clear()
 
   
   #add-point:query段other name="query.other"
   CALL g_pmdt2_d.clear()
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt304_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt304_browser_fill("")
      CALL astt304_fetch("")
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
      CALL astt304_filter_show('pmdssite')
   CALL astt304_filter_show('pmdsdocno')
   CALL astt304_filter_show('pmdsdocdt')
   CALL astt304_filter_show('pmds002')
   CALL astt304_filter_show('pmds202')
   CALL astt304_filter_show('pmds201')
   CALL astt304_filter_show('pmds045')
   CALL astt304_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt304_fetch("F") 
      #顯示單身筆數
      CALL astt304_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt304.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt304_fetch(p_flag)
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
   
   LET g_pmds_m.pmdsdocno = g_browser[g_current_idx].b_pmdsdocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt304_master_referesh USING g_pmds_m.pmdsdocno INTO g_pmds_m.pmdssite,g_pmds_m.pmdsdocdt, 
       g_pmds_m.pmdsdocno,g_pmds_m.pmds000,g_pmds_m.pmds007,g_pmds_m.pmds202,g_pmds_m.pmds201,g_pmds_m.pmds044, 
       g_pmds_m.pmdsunit,g_pmds_m.pmds002,g_pmds_m.pmds045,g_pmds_m.pmdsstus,g_pmds_m.pmdsownid,g_pmds_m.pmdsowndp, 
       g_pmds_m.pmdscrtid,g_pmds_m.pmdscrtdp,g_pmds_m.pmdscrtdt,g_pmds_m.pmdsmodid,g_pmds_m.pmdsmoddt, 
       g_pmds_m.pmdscnfid,g_pmds_m.pmdscnfdt,g_pmds_m.pmdspstid,g_pmds_m.pmdspstdt,g_pmds_m.pmdssite_desc, 
       g_pmds_m.pmds007_desc,g_pmds_m.pmdsunit_desc,g_pmds_m.pmds002_desc,g_pmds_m.pmdsownid_desc,g_pmds_m.pmdsowndp_desc, 
       g_pmds_m.pmdscrtid_desc,g_pmds_m.pmdscrtdp_desc,g_pmds_m.pmdsmodid_desc,g_pmds_m.pmdscnfid_desc, 
       g_pmds_m.pmdspstid_desc
   
   #遮罩相關處理
   LET g_pmds_m_mask_o.* =  g_pmds_m.*
   CALL astt304_pmds_t_mask()
   LET g_pmds_m_mask_n.* =  g_pmds_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt304_set_act_visible()   
   CALL astt304_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_pmds_m_t.* = g_pmds_m.*
   LET g_pmds_m_o.* = g_pmds_m.*
   
   LET g_data_owner = g_pmds_m.pmdsownid      
   LET g_data_dept  = g_pmds_m.pmdsowndp
   
   #重新顯示   
   CALL astt304_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt304.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt304_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_success  LIKE type_t.num5
   DEFINE l_doctype  LIKE rtai_t.rtai004
   
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_pmdt_d.clear()   
 
 
   INITIALIZE g_pmds_m.* TO NULL             #DEFAULT 設定
   
   LET g_pmdsdocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   CALL g_pmdt2_d.clear()
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_pmds_m.pmdsownid = g_user
      LET g_pmds_m.pmdsowndp = g_dept
      LET g_pmds_m.pmdscrtid = g_user
      LET g_pmds_m.pmdscrtdp = g_dept 
      LET g_pmds_m.pmdscrtdt = cl_get_current()
      LET g_pmds_m.pmdsmodid = g_user
      LET g_pmds_m.pmdsmoddt = cl_get_current()
      LET g_pmds_m.pmdsstus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_pmds_m.pmds000 = "27"
 
  
      #add-point:單頭預設值 name="insert.default"
      LET g_site_flag = FALSE
      #營運據點
      LET g_pmds_m.pmdssite = g_site
      CALL s_desc_get_department_desc(g_pmds_m.pmdssite)
         RETURNING g_pmds_m.pmdssite_desc
      DISPLAY BY NAME g_pmds_m.pmdssite_desc
      #單據日期
      LET g_pmds_m.pmdsdocdt = g_today
      #單別
      CALL s_arti200_get_def_doc_type(g_pmds_m.pmdssite,g_prog,'1')
         RETURNING l_success,l_doctype
      LET g_pmds_m.pmdsdocno = l_doctype
      #申請人員
      LET g_pmds_m.pmds002 = g_user
      CALL s_desc_get_person_desc(g_pmds_m.pmds002) RETURNING g_pmds_m.pmds002_desc
      DISPLAY BY NAME g_pmds_m.pmds002_desc
      LET g_pmds_m.pmds202 = '1'
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_pmds_m_t.* = g_pmds_m.*
      LET g_pmds_m_o.* = g_pmds_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_pmds_m.pmdsstus 
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         
      END CASE
 
 
 
    
      CALL astt304_input("a")
      
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
         INITIALIZE g_pmds_m.* TO NULL
         INITIALIZE g_pmdt_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt304_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_pmdt_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt304_set_act_visible()   
   CALL astt304_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_pmdsdocno_t = g_pmds_m.pmdsdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " pmdsent = " ||g_enterprise|| " AND",
                      " pmdsdocno = '", g_pmds_m.pmdsdocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt304_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt304_cl
   
   CALL astt304_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt304_master_referesh USING g_pmds_m.pmdsdocno INTO g_pmds_m.pmdssite,g_pmds_m.pmdsdocdt, 
       g_pmds_m.pmdsdocno,g_pmds_m.pmds000,g_pmds_m.pmds007,g_pmds_m.pmds202,g_pmds_m.pmds201,g_pmds_m.pmds044, 
       g_pmds_m.pmdsunit,g_pmds_m.pmds002,g_pmds_m.pmds045,g_pmds_m.pmdsstus,g_pmds_m.pmdsownid,g_pmds_m.pmdsowndp, 
       g_pmds_m.pmdscrtid,g_pmds_m.pmdscrtdp,g_pmds_m.pmdscrtdt,g_pmds_m.pmdsmodid,g_pmds_m.pmdsmoddt, 
       g_pmds_m.pmdscnfid,g_pmds_m.pmdscnfdt,g_pmds_m.pmdspstid,g_pmds_m.pmdspstdt,g_pmds_m.pmdssite_desc, 
       g_pmds_m.pmds007_desc,g_pmds_m.pmdsunit_desc,g_pmds_m.pmds002_desc,g_pmds_m.pmdsownid_desc,g_pmds_m.pmdsowndp_desc, 
       g_pmds_m.pmdscrtid_desc,g_pmds_m.pmdscrtdp_desc,g_pmds_m.pmdsmodid_desc,g_pmds_m.pmdscnfid_desc, 
       g_pmds_m.pmdspstid_desc
   
   
   #遮罩相關處理
   LET g_pmds_m_mask_o.* =  g_pmds_m.*
   CALL astt304_pmds_t_mask()
   LET g_pmds_m_mask_n.* =  g_pmds_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_pmds_m.pmdssite,g_pmds_m.pmdssite_desc,g_pmds_m.pmdsdocdt,g_pmds_m.pmdsdocno,g_pmds_m.pmds000, 
       g_pmds_m.pmds007,g_pmds_m.pmds007_desc,g_pmds_m.pmds202,g_pmds_m.pmds201,g_pmds_m.pmds044,g_pmds_m.pmdsunit, 
       g_pmds_m.pmdsunit_desc,g_pmds_m.pmds002,g_pmds_m.pmds002_desc,g_pmds_m.pmds045,g_pmds_m.pmdsstus, 
       g_pmds_m.pmdsownid,g_pmds_m.pmdsownid_desc,g_pmds_m.pmdsowndp,g_pmds_m.pmdsowndp_desc,g_pmds_m.pmdscrtid, 
       g_pmds_m.pmdscrtid_desc,g_pmds_m.pmdscrtdp,g_pmds_m.pmdscrtdp_desc,g_pmds_m.pmdscrtdt,g_pmds_m.pmdsmodid, 
       g_pmds_m.pmdsmodid_desc,g_pmds_m.pmdsmoddt,g_pmds_m.pmdscnfid,g_pmds_m.pmdscnfid_desc,g_pmds_m.pmdscnfdt, 
       g_pmds_m.pmdspstid,g_pmds_m.pmdspstid_desc,g_pmds_m.pmdspstdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_pmds_m.pmdsownid      
   LET g_data_dept  = g_pmds_m.pmdsowndp
   
   #功能已完成,通報訊息中心
   CALL astt304_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt304.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt304_modify()
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
   LET g_pmds_m_t.* = g_pmds_m.*
   LET g_pmds_m_o.* = g_pmds_m.*
   
   IF g_pmds_m.pmdsdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_pmdsdocno_t = g_pmds_m.pmdsdocno
 
   CALL s_transaction_begin()
   
   OPEN astt304_cl USING g_enterprise,g_pmds_m.pmdsdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt304_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt304_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt304_master_referesh USING g_pmds_m.pmdsdocno INTO g_pmds_m.pmdssite,g_pmds_m.pmdsdocdt, 
       g_pmds_m.pmdsdocno,g_pmds_m.pmds000,g_pmds_m.pmds007,g_pmds_m.pmds202,g_pmds_m.pmds201,g_pmds_m.pmds044, 
       g_pmds_m.pmdsunit,g_pmds_m.pmds002,g_pmds_m.pmds045,g_pmds_m.pmdsstus,g_pmds_m.pmdsownid,g_pmds_m.pmdsowndp, 
       g_pmds_m.pmdscrtid,g_pmds_m.pmdscrtdp,g_pmds_m.pmdscrtdt,g_pmds_m.pmdsmodid,g_pmds_m.pmdsmoddt, 
       g_pmds_m.pmdscnfid,g_pmds_m.pmdscnfdt,g_pmds_m.pmdspstid,g_pmds_m.pmdspstdt,g_pmds_m.pmdssite_desc, 
       g_pmds_m.pmds007_desc,g_pmds_m.pmdsunit_desc,g_pmds_m.pmds002_desc,g_pmds_m.pmdsownid_desc,g_pmds_m.pmdsowndp_desc, 
       g_pmds_m.pmdscrtid_desc,g_pmds_m.pmdscrtdp_desc,g_pmds_m.pmdsmodid_desc,g_pmds_m.pmdscnfid_desc, 
       g_pmds_m.pmdspstid_desc
   
   #檢查是否允許此動作
   IF NOT astt304_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_pmds_m_mask_o.* =  g_pmds_m.*
   CALL astt304_pmds_t_mask()
   LET g_pmds_m_mask_n.* =  g_pmds_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL astt304_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_pmdsdocno_t = g_pmds_m.pmdsdocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_pmds_m.pmdsmodid = g_user 
LET g_pmds_m.pmdsmoddt = cl_get_current()
LET g_pmds_m.pmdsmodid_desc = cl_get_username(g_pmds_m.pmdsmodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt304_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE pmds_t SET (pmdsmodid,pmdsmoddt) = (g_pmds_m.pmdsmodid,g_pmds_m.pmdsmoddt)
          WHERE pmdsent = g_enterprise AND pmdsdocno = g_pmdsdocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_pmds_m.* = g_pmds_m_t.*
            CALL astt304_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_pmds_m.pmdsdocno != g_pmds_m_t.pmdsdocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE pmdt_t SET pmdtdocno = g_pmds_m.pmdsdocno
 
          WHERE pmdtent = g_enterprise AND pmdtdocno = g_pmds_m_t.pmdsdocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "pmdt_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "pmdt_t:",SQLERRMESSAGE 
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
   CALL astt304_set_act_visible()   
   CALL astt304_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " pmdsent = " ||g_enterprise|| " AND",
                      " pmdsdocno = '", g_pmds_m.pmdsdocno, "' "
 
   #填到對應位置
   CALL astt304_browser_fill("")
 
   CLOSE astt304_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt304_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt304.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt304_input(p_cmd)
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
   DEFINE  l_success             LIKE type_t.num5
   DEFINE  l_errno               STRING
   DEFINE  l_ooef004             LIKE ooef_t.ooef004
   DEFINE  l_oodb006             LIKE oodb_t.oodb006
   DEFINE  l_ooag003             LIKE ooag_t.ooag003
   DEFINE  l_pmds031             LIKE pmds_t.pmds031
   DEFINE  l_pmds033             LIKE pmds_t.pmds033
   DEFINE  l_pmds038             LIKE pmds_t.pmds038
   DEFINE  l_pmds037             LIKE pmds_t.pmds037
   DEFINE  l_pmdt024             LIKE pmds_t.pmds024
   DEFINE  l_pmdt036             LIKE pmds_t.pmds036
  #DEFINE  l_pmdt                RECORD LIKE pmdt_t.* #161111-00028#3--mark
  #161111-00028#3--add---begin--------
  DEFINE l_pmdt RECORD  #收貨/入庫單身明細檔
       pmdtent LIKE pmdt_t.pmdtent, #企業編號
       pmdtsite LIKE pmdt_t.pmdtsite, #營運據點
       pmdtdocno LIKE pmdt_t.pmdtdocno, #單據編號
       pmdtseq LIKE pmdt_t.pmdtseq, #項次
       pmdt001 LIKE pmdt_t.pmdt001, #採購單號
       pmdt002 LIKE pmdt_t.pmdt002, #採購項次
       pmdt003 LIKE pmdt_t.pmdt003, #採購項序
       pmdt004 LIKE pmdt_t.pmdt004, #採購分批序
       pmdt005 LIKE pmdt_t.pmdt005, #子件特性
       pmdt006 LIKE pmdt_t.pmdt006, #料件編號
       pmdt007 LIKE pmdt_t.pmdt007, #產品特徵
       pmdt008 LIKE pmdt_t.pmdt008, #包裝容器
       pmdt009 LIKE pmdt_t.pmdt009, #作業編號
       pmdt010 LIKE pmdt_t.pmdt010, #作業序
       pmdt011 LIKE pmdt_t.pmdt011, #沖銷順序
       pmdt016 LIKE pmdt_t.pmdt016, #庫位
       pmdt017 LIKE pmdt_t.pmdt017, #儲位
       pmdt018 LIKE pmdt_t.pmdt018, #批號
       pmdt019 LIKE pmdt_t.pmdt019, #收貨/入庫單位
       pmdt020 LIKE pmdt_t.pmdt020, #收貨/入庫數量
       pmdt021 LIKE pmdt_t.pmdt021, #參考單位
       pmdt022 LIKE pmdt_t.pmdt022, #參考數量
       pmdt023 LIKE pmdt_t.pmdt023, #計價單位
       pmdt024 LIKE pmdt_t.pmdt024, #計價數量
       pmdt025 LIKE pmdt_t.pmdt025, #緊急度
       pmdt026 LIKE pmdt_t.pmdt026, #檢驗否
       pmdt027 LIKE pmdt_t.pmdt027, #收貨單號
       pmdt028 LIKE pmdt_t.pmdt028, #收貨項次
       pmdt036 LIKE pmdt_t.pmdt036, #單價
       pmdt037 LIKE pmdt_t.pmdt037, #稅率
       pmdt038 LIKE pmdt_t.pmdt038, #未稅金額
       pmdt039 LIKE pmdt_t.pmdt039, #含稅金額
       pmdt040 LIKE pmdt_t.pmdt040, #價格核決
       pmdt041 LIKE pmdt_t.pmdt041, #保稅否
       pmdt042 LIKE pmdt_t.pmdt042, #取價來源
       pmdt043 LIKE pmdt_t.pmdt043, #價格參考單號
       pmdt044 LIKE pmdt_t.pmdt044, #取出單價
       pmdt045 LIKE pmdt_t.pmdt045, #價差比
       pmdt046 LIKE pmdt_t.pmdt046, #稅別
       pmdt047 LIKE pmdt_t.pmdt047, #稅額
       pmdt051 LIKE pmdt_t.pmdt051, #理由碼
       pmdt052 LIKE pmdt_t.pmdt052, #狀態碼
       pmdt053 LIKE pmdt_t.pmdt053, #允收數量
       pmdt054 LIKE pmdt_t.pmdt054, #已入庫量
       pmdt055 LIKE pmdt_t.pmdt055, #驗退量
       pmdt056 LIKE pmdt_t.pmdt056, #主帳套已請款數量
       pmdt057 LIKE pmdt_t.pmdt057, #帳套二已請款數量
       pmdt058 LIKE pmdt_t.pmdt058, #帳套三已請款數量
       pmdt059 LIKE pmdt_t.pmdt059, #備註
       pmdt060 LIKE pmdt_t.pmdt060, #供應商批號
       pmdt061 LIKE pmdt_t.pmdt061, #供應商送貨數量
       pmdt062 LIKE pmdt_t.pmdt062, #多庫儲批收貨入庫
       pmdt063 LIKE pmdt_t.pmdt063, #庫存管理特徵
       pmdt064 LIKE pmdt_t.pmdt064, #出貨單號
       pmdt065 LIKE pmdt_t.pmdt065, #出貨單項次
       pmdt066 LIKE pmdt_t.pmdt066, #主帳套暫估數量
       pmdt067 LIKE pmdt_t.pmdt067, #帳套二暫估數量
       pmdt068 LIKE pmdt_t.pmdt068, #帳套三暫估數量
       pmdt069 LIKE pmdt_t.pmdt069, #已開發票數量
       pmdt081 LIKE pmdt_t.pmdt081, #QC單號
       pmdt082 LIKE pmdt_t.pmdt082, #QC判定項次
       pmdt083 LIKE pmdt_t.pmdt083, #判定結果
       pmdt084 LIKE pmdt_t.pmdt084, #須自立AP否
       pmdt085 LIKE pmdt_t.pmdt085, #多角流程編號
       pmdt086 LIKE pmdt_t.pmdt086, #採購多角性質
       pmdt087 LIKE pmdt_t.pmdt087, #採購單開立據點
       pmdt088 LIKE pmdt_t.pmdt088, #存貨備註
       pmdt089 LIKE pmdt_t.pmdt089, #有效日期
       pmdt900 LIKE pmdt_t.pmdt900, #保留欄位str
       pmdt999 LIKE pmdt_t.pmdt999, #保留欄位end
       pmdt200 LIKE pmdt_t.pmdt200, #商品條碼
       pmdt201 LIKE pmdt_t.pmdt201, #收貨包裝單位
       pmdt202 LIKE pmdt_t.pmdt202, #收貨包裝數量
       pmdt203 LIKE pmdt_t.pmdt203, #採購組織
       pmdt204 LIKE pmdt_t.pmdt204, #採購中心
       pmdt205 LIKE pmdt_t.pmdt205, #要貨組織
       pmdt206 LIKE pmdt_t.pmdt206, #預約收貨單號
       pmdt207 LIKE pmdt_t.pmdt207, #預約收貨項次
       pmdt208 LIKE pmdt_t.pmdt208, #採購通路
       pmdt209 LIKE pmdt_t.pmdt209, #通路性質
       pmdt210 LIKE pmdt_t.pmdt210, #經營方式
       pmdt211 LIKE pmdt_t.pmdt211, #結算方式
       pmdt212 LIKE pmdt_t.pmdt212, #合約編號
       pmdt213 LIKE pmdt_t.pmdt213, #協議編號
       pmdtorga LIKE pmdt_t.pmdtorga, #帳務組織
       pmdt070 LIKE pmdt_t.pmdt070, #參考單號
       pmdt071 LIKE pmdt_t.pmdt071, #參考項次
       pmdt214 LIKE pmdt_t.pmdt214, #採購方式
       pmdt215 LIKE pmdt_t.pmdt215, #最終收貨組織
       pmdt048 LIKE pmdt_t.pmdt048, #價格參考項次
       pmdt216 LIKE pmdt_t.pmdt216, #退貨申請單號
       pmdt217 LIKE pmdt_t.pmdt217, #退貨申請項次
       pmdt090 LIKE pmdt_t.pmdt090, #借貨還價數量
       pmdt091 LIKE pmdt_t.pmdt091, #借貨還價參考數量
       pmdt092 LIKE pmdt_t.pmdt092, #還價未稅金額
       pmdt093 LIKE pmdt_t.pmdt093, #還價含稅金額
       pmdt218 LIKE pmdt_t.pmdt218, #採購價
       pmdt219 LIKE pmdt_t.pmdt219, #製造日期
       pmdt072 LIKE pmdt_t.pmdt072, #專案編號
       pmdt073 LIKE pmdt_t.pmdt073, #WBS
       pmdt074 LIKE pmdt_t.pmdt074, #活動編號
       pmdt227 LIKE pmdt_t.pmdt227, #補貨規格說明
       pmdt049 LIKE pmdt_t.pmdt049, #發票編號
       pmdt050 LIKE pmdt_t.pmdt050, #發票號碼
       pmdt075 LIKE pmdt_t.pmdt075, #預算細項
       pmdt220 LIKE pmdt_t.pmdt220, #商品品類
       pmdt221 LIKE pmdt_t.pmdt221  #來源單據商品品類
       END RECORD
  #161111-00028#3--add---end----------
   DEFINE  l_pmdsud001           LIKE pmds_t.pmdsud001
   DEFINE  l_pmdsud002           LIKE pmds_t.pmdsud002
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
   DISPLAY BY NAME g_pmds_m.pmdssite,g_pmds_m.pmdssite_desc,g_pmds_m.pmdsdocdt,g_pmds_m.pmdsdocno,g_pmds_m.pmds000, 
       g_pmds_m.pmds007,g_pmds_m.pmds007_desc,g_pmds_m.pmds202,g_pmds_m.pmds201,g_pmds_m.pmds044,g_pmds_m.pmdsunit, 
       g_pmds_m.pmdsunit_desc,g_pmds_m.pmds002,g_pmds_m.pmds002_desc,g_pmds_m.pmds045,g_pmds_m.pmdsstus, 
       g_pmds_m.pmdsownid,g_pmds_m.pmdsownid_desc,g_pmds_m.pmdsowndp,g_pmds_m.pmdsowndp_desc,g_pmds_m.pmdscrtid, 
       g_pmds_m.pmdscrtid_desc,g_pmds_m.pmdscrtdp,g_pmds_m.pmdscrtdp_desc,g_pmds_m.pmdscrtdt,g_pmds_m.pmdsmodid, 
       g_pmds_m.pmdsmodid_desc,g_pmds_m.pmdsmoddt,g_pmds_m.pmdscnfid,g_pmds_m.pmdscnfid_desc,g_pmds_m.pmdscnfdt, 
       g_pmds_m.pmdspstid,g_pmds_m.pmdspstid_desc,g_pmds_m.pmdspstdt
   
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
   LET g_forupd_sql = "SELECT pmdtseq,pmdt016,pmdt006,pmdt200,pmdt046,pmdt039,pmdt047,pmdt038 FROM pmdt_t  
       WHERE pmdtent=? AND pmdtdocno=? AND pmdtseq=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt304_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt304_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
   
   #end add-point
   CALL astt304_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_pmds_m.pmdssite,g_pmds_m.pmdsdocdt,g_pmds_m.pmdsdocno,g_pmds_m.pmds000,g_pmds_m.pmds007, 
       g_pmds_m.pmds202,g_pmds_m.pmds201,g_pmds_m.pmds002,g_pmds_m.pmds045,g_pmds_m.pmdsstus
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   CALL cl_set_combo_scc_part('pmds202','6844','1,2') 
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt304.input.head" >}
      #單頭段
      INPUT BY NAME g_pmds_m.pmdssite,g_pmds_m.pmdsdocdt,g_pmds_m.pmdsdocno,g_pmds_m.pmds000,g_pmds_m.pmds007, 
          g_pmds_m.pmds202,g_pmds_m.pmds201,g_pmds_m.pmds002,g_pmds_m.pmds045,g_pmds_m.pmdsstus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt304_cl USING g_enterprise,g_pmds_m.pmdsdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt304_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt304_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt304_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL astt304_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdssite
            
            #add-point:AFTER FIELD pmdssite name="input.a.pmdssite"
            IF NOT cl_null(g_pmds_m.pmdssite) THEN 
               CALL s_aooi500_chk(g_prog,'pmdssite',g_pmds_m.pmdssite,g_pmds_m.pmdssite) RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = g_pmds_m.pmdssite
                  LET g_errparam.code   = l_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  LET g_pmds_m.pmdssite = g_pmds_m_t.pmdssite
                  CALL s_desc_get_department_desc(g_pmds_m.pmdssite) RETURNING g_pmds_m.pmdssite_desc
                  DISPLAY BY NAME g_pmds_m.pmdssite,g_pmds_m.pmdssite_desc
                  NEXT FIELD CURRENT
               END IF 
            END IF
            LET g_site_flag = TRUE
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_pmds_m.pmdssite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_pmds_m.pmdssite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_pmds_m.pmdssite_desc

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdssite
            #add-point:BEFORE FIELD pmdssite name="input.b.pmdssite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmdssite
            #add-point:ON CHANGE pmdssite name="input.g.pmdssite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdsdocdt
            #add-point:BEFORE FIELD pmdsdocdt name="input.b.pmdsdocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdsdocdt
            
            #add-point:AFTER FIELD pmdsdocdt name="input.a.pmdsdocdt"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmdsdocdt
            #add-point:ON CHANGE pmdsdocdt name="input.g.pmdsdocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdsdocno
            #add-point:BEFORE FIELD pmdsdocno name="input.b.pmdsdocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdsdocno
            
            #add-point:AFTER FIELD pmdsdocno name="input.a.pmdsdocno"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  NOT cl_null(g_pmds_m.pmdsdocno) THEN 
                LET l_ooef004 = ""
                SELECT ooef004 INTO l_ooef004
                  FROM ooef_t
                 WHERE ooef001 = g_pmds_m.pmdssite
                   AND ooefent = g_enterprise
               CALL s_aooi200_chk_slip(g_pmds_m.pmdssite,l_ooef004,g_pmds_m.pmdsdocno,g_prog) RETURNING l_success
               IF NOT l_success THEN
                  LET g_pmds_m.pmdsdocno = g_pmdsdocno_t
                  NEXT FIELD CURRENT
               END IF
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_pmds_m.pmdsdocno != g_pmdsdocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM pmds_t WHERE "||"pmdsent = '" ||g_enterprise|| "' AND "||"pmdsdocno = '"||g_pmds_m.pmdsdocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmdsdocno
            #add-point:ON CHANGE pmdsdocno name="input.g.pmdsdocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmds000
            #add-point:BEFORE FIELD pmds000 name="input.b.pmds000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmds000
            
            #add-point:AFTER FIELD pmds000 name="input.a.pmds000"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmds000
            #add-point:ON CHANGE pmds000 name="input.g.pmds000"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmds007
            
            #add-point:AFTER FIELD pmds007 name="input.a.pmds007"
            IF NOT cl_null(g_pmds_m.pmds007) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_pmds_m.pmds007

                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_pmaa001_1") THEN
                  #檢查成功時後續處理
                  IF NOT cl_null(g_pmds_m.pmds201) THEN 
                     LET l_n = 0
                     #检查此供应商是否为此来源单的供应商
                     SELECT COUNT(*) INTO l_n
                       FROM pmds_t
                      WHERE pmdsent = g_enterprise
                        AND pmdsdocno = g_pmds_m.pmds201
                        AND pmds007 = g_pmds_m.pmds007
                     IF l_n = 0 THEN 
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'ast-00374'
                        LET g_errparam.extend = g_pmds_m.pmds007
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        NEXT FIELD pmds007
                     END IF 
                  END IF 
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_pmds_m.pmds007
            CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_pmds_m.pmds007_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_pmds_m.pmds007_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmds007
            #add-point:BEFORE FIELD pmds007 name="input.b.pmds007"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmds007
            #add-point:ON CHANGE pmds007 name="input.g.pmds007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmds202
            #add-point:BEFORE FIELD pmds202 name="input.b.pmds202"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmds202
            
            #add-point:AFTER FIELD pmds202 name="input.a.pmds202"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmds202
            #add-point:ON CHANGE pmds202 name="input.g.pmds202"
            LET g_pmds_m.pmds201 = ''
            DISPLAY BY NAME g_pmds_m.pmds201
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmds201
            #add-point:BEFORE FIELD pmds201 name="input.b.pmds201"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmds201
            
            #add-point:AFTER FIELD pmds201 name="input.a.pmds201"
            IF NOT cl_null(g_pmds_m.pmds201) THEN 
               IF g_pmds_m.pmds202 = '1' THEN 
                  INITIALIZE g_chkparam.* TO NULL
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_pmds_m.pmds201
                  #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_pmdsdocno_12") THEN
                     NEXT FIELD CURRENT 
                  END IF 
               END IF 
               IF g_pmds_m.pmds202 = '2' THEN 
                  INITIALIZE g_chkparam.* TO NULL
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_pmds_m.pmds201
                  #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_pmdsdocno") THEN
                     NEXT FIELD CURRENT 
                  END IF 
               END IF 
               SELECT pmdssite,pmds007 INTO g_pmds_m.pmdsunit,g_pmds_m.pmds007
                 FROM pmds_t
                WHERE pmdsent = g_enterprise
                  AND pmdsdocno = g_pmds_m.pmds201
               DISPLAY BY NAME g_pmds_m.pmds007
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_pmds_m.pmds007
               CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_pmds_m.pmds007_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_pmds_m.pmds007_desc
               INITIALIZE g_ref_fields TO NULL
               LET g_ref_fields[1] = g_pmds_m.pmdsunit
               CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
               LET g_pmds_m.pmdsunit_desc = '', g_rtn_fields[1] , ''
               DISPLAY BY NAME g_pmds_m.pmdsunit,g_pmds_m.pmdsunit_desc
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmds201
            #add-point:ON CHANGE pmds201 name="input.g.pmds201"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmds002
            
            #add-point:AFTER FIELD pmds002 name="input.a.pmds002"
            IF NOT cl_null(g_pmds_m.pmds002) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_pmds_m.pmds002

                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_ooag001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_pmds_m.pmds002
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_pmds_m.pmds002_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_pmds_m.pmds002_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmds002
            #add-point:BEFORE FIELD pmds002 name="input.b.pmds002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmds002
            #add-point:ON CHANGE pmds002 name="input.g.pmds002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmds045
            #add-point:BEFORE FIELD pmds045 name="input.b.pmds045"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmds045
            
            #add-point:AFTER FIELD pmds045 name="input.a.pmds045"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmds045
            #add-point:ON CHANGE pmds045 name="input.g.pmds045"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdsstus
            #add-point:BEFORE FIELD pmdsstus name="input.b.pmdsstus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdsstus
            
            #add-point:AFTER FIELD pmdsstus name="input.a.pmdsstus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmdsstus
            #add-point:ON CHANGE pmdsstus name="input.g.pmdsstus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.pmdssite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdssite
            #add-point:ON ACTION controlp INFIELD pmdssite name="input.c.pmdssite"
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_pmds_m.pmdssite             #給予default值
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'pmdssite',g_pmds_m.pmdssite,'i')
            CALL q_ooef001_24()
            LET g_pmds_m.pmdssite = g_qryparam.return1      #將開窗取得的值回傳到變數
            DISPLAY g_pmds_m.pmdssite TO pmdssite           #顯示到畫面上
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_pmds_m.pmdssite
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002 = '"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_pmds_m.pmdssite_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_pmds_m.pmdssite_desc
            NEXT FIELD pmdssite   
            #END add-point
 
 
         #Ctrlp:input.c.pmdsdocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdsdocdt
            #add-point:ON ACTION controlp INFIELD pmdsdocdt name="input.c.pmdsdocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.pmdsdocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdsdocno
            #add-point:ON ACTION controlp INFIELD pmdsdocno name="input.c.pmdsdocno"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
		   	INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_pmds_m.pmdsdocno             #給予default值
            LET l_ooef004 = ""
            SELECT ooef004 INTO l_ooef004
              FROM ooef_t
             WHERE ooef001 = g_pmds_m.pmdssite
               AND ooefent = g_enterprise
            LET g_qryparam.arg1 = l_ooef004 #
            LET g_qryparam.arg2 = g_prog #
            CALL q_ooba002_1()                            #呼叫開窗
            LET g_pmds_m.pmdsdocno = g_qryparam.return1   #將開窗取得的值回傳到變數
            DISPLAY g_pmds_m.pmdsdocno TO pmdsdocno       #顯示到畫面上
            NEXT FIELD pmdsdocno                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.pmds000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmds000
            #add-point:ON ACTION controlp INFIELD pmds000 name="input.c.pmds000"
            
            #END add-point
 
 
         #Ctrlp:input.c.pmds007
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmds007
            #add-point:ON ACTION controlp INFIELD pmds007 name="input.c.pmds007"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_pmds_m.pmds007             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_pmaa001_3()                                #呼叫開窗

            LET g_pmds_m.pmds007 = g_qryparam.return1              

            DISPLAY g_pmds_m.pmds007 TO pmds007              #

            NEXT FIELD pmds007                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.pmds202
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmds202
            #add-point:ON ACTION controlp INFIELD pmds202 name="input.c.pmds202"
            
            #END add-point
 
 
         #Ctrlp:input.c.pmds201
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmds201
            #add-point:ON ACTION controlp INFIELD pmds201 name="input.c.pmds201"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_pmds_m.pmds201             #給予default值
            #給予arg
            CASE g_pmds_m.pmds202
                 WHEN '1' LET g_qryparam.arg1 = "(3,4,6)" #s
                 WHEN '2' LET g_qryparam.arg1 = "7" #s
                 WHEN '3' LET g_qryparam.arg1 = "" #s
                 WHEN '4' LET g_qryparam.arg1 = "" #s
                 WHEN '5' LET g_qryparam.arg1 = "" #s
            END CASE 
            IF NOT cl_null(g_pmds_m.pmds007) THEN 
               LET g_qryparam.WHERE = " pmds007 = '",g_pmds_m.pmds007,"'"
            END IF 
            CALL q_pmdsdocno()                                #呼叫開窗
            LET g_pmds_m.pmds201 = g_qryparam.return1              
            DISPLAY g_pmds_m.pmds201 TO pmds201              #
            NEXT FIELD pmds201                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.pmds002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmds002
            #add-point:ON ACTION controlp INFIELD pmds002 name="input.c.pmds002"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_pmds_m.pmds002             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_ooag001()                                #呼叫開窗

            LET g_pmds_m.pmds002 = g_qryparam.return1              

            DISPLAY g_pmds_m.pmds002 TO pmds002              #

            NEXT FIELD pmds002                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.pmds045
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmds045
            #add-point:ON ACTION controlp INFIELD pmds045 name="input.c.pmds045"
            
            #END add-point
 
 
         #Ctrlp:input.c.pmdsstus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdsstus
            #add-point:ON ACTION controlp INFIELD pmdsstus name="input.c.pmdsstus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_pmds_m.pmdsdocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL s_aooi200_gen_docno(g_pmds_m.pmdssite,g_pmds_m.pmdsdocno,g_pmds_m.pmdsdocdt,g_prog) RETURNING l_success,g_pmds_m.pmdsdocno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_pmds_m.pmdsdocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD pmdsdocno
               END IF
               #end add-point
               
               INSERT INTO pmds_t (pmdsent,pmdssite,pmdsdocdt,pmdsdocno,pmds000,pmds007,pmds202,pmds201, 
                   pmds044,pmdsunit,pmds002,pmds045,pmdsstus,pmdsownid,pmdsowndp,pmdscrtid,pmdscrtdp, 
                   pmdscrtdt,pmdsmodid,pmdsmoddt,pmdscnfid,pmdscnfdt,pmdspstid,pmdspstdt)
               VALUES (g_enterprise,g_pmds_m.pmdssite,g_pmds_m.pmdsdocdt,g_pmds_m.pmdsdocno,g_pmds_m.pmds000, 
                   g_pmds_m.pmds007,g_pmds_m.pmds202,g_pmds_m.pmds201,g_pmds_m.pmds044,g_pmds_m.pmdsunit, 
                   g_pmds_m.pmds002,g_pmds_m.pmds045,g_pmds_m.pmdsstus,g_pmds_m.pmdsownid,g_pmds_m.pmdsowndp, 
                   g_pmds_m.pmdscrtid,g_pmds_m.pmdscrtdp,g_pmds_m.pmdscrtdt,g_pmds_m.pmdsmodid,g_pmds_m.pmdsmoddt, 
                   g_pmds_m.pmdscnfid,g_pmds_m.pmdscnfdt,g_pmds_m.pmdspstid,g_pmds_m.pmdspstdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_pmds_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               #獲取人員對應部門
               SELECT ooag003 INTO l_ooag003
                 FROM ooag_t
                WHERE ooagent = g_enterprise
                  AND ooag001 = g_pmds_m.pmds002
               #獲取幣別
               SELECT pmds031,pmds033,pmds037,pmds038,pmdsud001,pmdsud002
                 INTO l_pmds031,l_pmds033,l_pmds037,l_pmds038,l_pmdsud001,l_pmdsud002
                 FROM pmds_t
                WHERE pmdsent = g_enterprise
                  AND pmdsdocno = g_pmds_m.pmds201
               IF cl_null(l_pmds031) THEN 
                  SELECT pmab037 INTO l_pmds031
                    FROM pmab_t
                   WHERE pmab001 = g_pmds_m.pmds007
                     AND pmabsite = 'ALL'
                     AND pmabent = g_enterprise
               END IF 
               #跟新單頭資料
               UPDATE pmds_t SET pmds003 = l_ooag003,
                                 pmds037 = l_pmds037,
                                 pmds038 = l_pmds038,
                                 pmds031 = l_pmds031,
                                 pmds033 = l_pmds033,
                                 pmdsud001 = l_pmdsud001,
                                 pmdsud002 = l_pmdsud002
                WHERE pmdsent = g_enterprise
                  AND pmdsdocno =  g_pmds_m.pmdsdocno
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "update pmds_t" 
                  LET g_errparam.code   = SQLCA.sqlcode 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  CALL s_transaction_end('N','0')
                  NEXT FIELD CURRENT
               END IF
               #end add-point
               
               
               
               
               #add-point:單頭新增後 name="input.head.a_insert"
               
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astt304_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt304_b_fill()
                  CALL astt304_b_fill2('0')
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
               CALL astt304_pmds_t_mask_restore('restore_mask_o')
               
               UPDATE pmds_t SET (pmdssite,pmdsdocdt,pmdsdocno,pmds000,pmds007,pmds202,pmds201,pmds044, 
                   pmdsunit,pmds002,pmds045,pmdsstus,pmdsownid,pmdsowndp,pmdscrtid,pmdscrtdp,pmdscrtdt, 
                   pmdsmodid,pmdsmoddt,pmdscnfid,pmdscnfdt,pmdspstid,pmdspstdt) = (g_pmds_m.pmdssite, 
                   g_pmds_m.pmdsdocdt,g_pmds_m.pmdsdocno,g_pmds_m.pmds000,g_pmds_m.pmds007,g_pmds_m.pmds202, 
                   g_pmds_m.pmds201,g_pmds_m.pmds044,g_pmds_m.pmdsunit,g_pmds_m.pmds002,g_pmds_m.pmds045, 
                   g_pmds_m.pmdsstus,g_pmds_m.pmdsownid,g_pmds_m.pmdsowndp,g_pmds_m.pmdscrtid,g_pmds_m.pmdscrtdp, 
                   g_pmds_m.pmdscrtdt,g_pmds_m.pmdsmodid,g_pmds_m.pmdsmoddt,g_pmds_m.pmdscnfid,g_pmds_m.pmdscnfdt, 
                   g_pmds_m.pmdspstid,g_pmds_m.pmdspstdt)
                WHERE pmdsent = g_enterprise AND pmdsdocno = g_pmdsdocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "pmds_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               #獲取人員對應部門
               SELECT ooag003 INTO l_ooag003
                 FROM ooag_t
                WHERE ooagent = g_enterprise
                  AND ooag001 = g_pmds_m.pmds002
               #跟新單頭資料
               UPDATE pmds_t SET pmds003 = l_ooag003
                WHERE pmdsent = g_enterprise
                  AND pmdsdocno =  g_pmds_m.pmdsdocno
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "update pmds_t" 
                  LET g_errparam.code   = SQLCA.sqlcode 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  CALL s_transaction_end('N','0')
                  NEXT FIELD CURRENT
               END IF
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt304_pmds_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_pmds_m_t)
               LET g_log2 = util.JSON.stringify(g_pmds_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_pmdsdocno_t = g_pmds_m.pmdsdocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt304.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_pmdt_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            CALL astt304_b2_fill()
            CALL astt304_b_refresh()
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_pmdt_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt304_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_pmdt_d.getLength()
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
            OPEN astt304_cl USING g_enterprise,g_pmds_m.pmdsdocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt304_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt304_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_pmdt_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_pmdt_d[l_ac].pmdtseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_pmdt_d_t.* = g_pmdt_d[l_ac].*  #BACKUP
               LET g_pmdt_d_o.* = g_pmdt_d[l_ac].*  #BACKUP
               CALL astt304_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt304_set_no_entry_b(l_cmd)
               IF NOT astt304_lock_b("pmdt_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt304_bcl INTO g_pmdt_d[l_ac].pmdtseq,g_pmdt_d[l_ac].pmdt016,g_pmdt_d[l_ac].pmdt006, 
                      g_pmdt_d[l_ac].pmdt200,g_pmdt_d[l_ac].pmdt046,g_pmdt_d[l_ac].pmdt039,g_pmdt_d[l_ac].pmdt047, 
                      g_pmdt_d[l_ac].pmdt038
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_pmdt_d_t.pmdtseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_pmdt_d_mask_o[l_ac].* =  g_pmdt_d[l_ac].*
                  CALL astt304_pmdt_t_mask()
                  LET g_pmdt_d_mask_n[l_ac].* =  g_pmdt_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt304_show()
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
            INITIALIZE g_pmdt_d[l_ac].* TO NULL 
            INITIALIZE g_pmdt_d_t.* TO NULL 
            INITIALIZE g_pmdt_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_pmdt_d[l_ac].pmdt038 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_pmdt_d_t.* = g_pmdt_d[l_ac].*     #新輸入資料
            LET g_pmdt_d_o.* = g_pmdt_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt304_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt304_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_pmdt_d[li_reproduce_target].* = g_pmdt_d[li_reproduce].*
 
               LET g_pmdt_d[li_reproduce_target].pmdtseq = NULL
 
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
            SELECT COUNT(1) INTO l_count FROM pmdt_t 
             WHERE pmdtent = g_enterprise AND pmdtdocno = g_pmds_m.pmdsdocno
 
               AND pmdtseq = g_pmdt_d[l_ac].pmdtseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               IF l_cmd = 'a' THEN 
                  INITIALIZE l_pmdt.* TO NULL
                #SELECT * INTO l_pmdt.*  #161111-00028#3--MARK
                #161111-00028#3--add---begin----------
                 SELECT pmdtent,pmdtsite,pmdtdocno,pmdtseq,pmdt001,pmdt002,pmdt003,pmdt004,pmdt005,pmdt006,
                        pmdt007,pmdt008,pmdt009,pmdt010,pmdt011,pmdt016,pmdt017,pmdt018,pmdt019,pmdt020,pmdt021,
                        pmdt022,pmdt023,pmdt024,pmdt025,pmdt026,pmdt027,pmdt028,pmdt036,pmdt037,pmdt038,pmdt039,
                        pmdt040,pmdt041,pmdt042,pmdt043,pmdt044,pmdt045,pmdt046,pmdt047,pmdt051,pmdt052,pmdt053,
                        pmdt054,pmdt055,pmdt056,pmdt057,pmdt058,pmdt059,pmdt060,pmdt061,pmdt062,pmdt063,pmdt064,
                        pmdt065,pmdt066,pmdt067,pmdt068,pmdt069,pmdt081,pmdt082,pmdt083,pmdt084,pmdt085,pmdt086,
                        pmdt087,pmdt088,pmdt089,pmdt900,pmdt999,pmdt200,pmdt201,pmdt202,pmdt203,pmdt204,pmdt205,
                        pmdt206,pmdt207,pmdt208,pmdt209,pmdt210,pmdt211,pmdt212,pmdt213,pmdtorga,pmdt070,pmdt071,
                        pmdt214,pmdt215,pmdt048,pmdt216,pmdt217,pmdt090,pmdt091,pmdt092,pmdt093,pmdt218,pmdt219,
                        pmdt072,pmdt073,pmdt074,pmdt227,pmdt049,pmdt050,pmdt075,pmdt220,pmdt221 INTO l_pmdt.*
                #161111-00028#3--add---end------------
                    FROM pmdt_t
                  WHERE pmdtent = g_enterprise
                    AND pmdtdocno = g_pmds_m.pmds201
                    AND pmdtseq = g_pmdt_d[l_ac].pmdtseq
                  LET l_pmdt.pmdtdocno = g_pmds_m.pmdsdocno
                  LET l_pmdt.pmdtsite = g_pmds_m.pmdssite
                  LET l_pmdt.pmdtseq = g_pmdt_d[l_ac].pmdtseq
                  LET l_pmdt.pmdt006 = g_pmdt_d[l_ac].pmdt006
                  LET l_pmdt.pmdt200 = g_pmdt_d[l_ac].pmdt200
                  LET l_pmdt.pmdt038 = g_pmdt_d[l_ac].pmdt038
                  LET l_pmdt.pmdt039 = g_pmdt_d[l_ac].pmdt039
                  LET l_pmdt.pmdt047 = g_pmdt_d[l_ac].pmdt047
                  LET l_pmdt.pmdt046 = g_pmdt_d[l_ac].pmdt046
                  LET l_pmdt.pmdt036 = l_pmdt.pmdt039/l_pmdt.pmdt024
                  LET l_pmdt.pmdt036 = s_curr_round(g_pmds_m.pmdssite,l_pmds037,l_pmdt.pmdt036,'2')
                  LET l_pmdt.pmdt084 = 'Y'
                  #价格小于零更新数量为负数，单价为正数
                  IF l_pmdt.pmdt036 < 0 THEN 
                     LET l_pmdt.pmdt036 = l_pmdt.pmdt036*(-1)
                     LET l_pmdt.pmdt024 = l_pmdt.pmdt024*(-1)
                     LET l_pmdt.pmdt020 = l_pmdt.pmdt020*(-1)
                  END IF 
                  SELECT DISTINCT pmdt210,pmdt212 INTO l_pmdt.pmdt210,l_pmdt.pmdt212
                    FROM pmdt_t 
                   WHERE pmdtent = g_enterprise
                     AND pmdtdocno = g_pmds_m.pmds201
                     AND pmdt006 = l_pmdt.pmdt006
                  INSERT INTO pmdt_t VALUES(l_pmdt.*)
                  IF SQLCA.SQLcode THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "pmdt_t" 
                     LET g_errparam.code   = SQLCA.sqlcode 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     CALL s_transaction_end('N','0')                    
                     CANCEL INSERT
                  END IF 
               ELSE
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_pmds_m.pmdsdocno
               LET gs_keys[2] = g_pmdt_d[g_detail_idx].pmdtseq
               CALL astt304_insert_b('pmdt_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               END IF 
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_pmdt_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "pmdt_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt304_b_fill()
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
               LET gs_keys[01] = g_pmds_m.pmdsdocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_pmdt_d_t.pmdtseq
 
            
               #刪除同層單身
               IF NOT astt304_delete_b('pmdt_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt304_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt304_key_delete_b(gs_keys,'pmdt_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt304_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt304_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_pmdt_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_pmdt_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdtseq
            #add-point:BEFORE FIELD pmdtseq name="input.b.page1.pmdtseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdtseq
            
            #add-point:AFTER FIELD pmdtseq name="input.a.page1.pmdtseq"
            #應用 a05 樣板自動產生(Version:2)
            #確認資料無重複
            IF  g_pmds_m.pmdsdocno IS NOT NULL AND g_pmdt_d[g_detail_idx].pmdtseq IS NOT NULL THEN 
               #IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_pmds_m.pmdsdocno != g_pmdsdocno_t OR g_pmdt_d[g_detail_idx].pmdtseq != g_pmdt_d_t.pmdtseq)) THEN 
               IF (g_pmds_m.pmdsdocno != g_pmdsdocno_t OR g_pmdt_d[g_detail_idx].pmdtseq != g_pmdt_d_o.pmdtseq) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM pmdt_t WHERE "||"pmdtent = '" ||g_enterprise|| "' AND "||"pmdtdocno = '"||g_pmds_m.pmdsdocno ||"' AND "|| "pmdtseq = '"||g_pmdt_d[g_detail_idx].pmdtseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
                  LET l_n = 0
                  #检查是否存在单头单据中
                  SELECT COUNT(*) INTO l_n
                    FROM pmdt_t
                   WHERE pmdtent = g_enterprise
                     AND pmdtdocno = g_pmds_m.pmds201
                     AND pmdtseq = g_pmdt_d[l_ac].pmdtseq
                  IF l_n = 0 THEN 
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = 'ast-00376'
                    LET g_errparam.extend = g_pmdt_d[l_ac].pmdtseq
                    LET g_errparam.popup = TRUE
                    CALL cl_err()
                    NEXT FIELD pmdtseq
                  END IF 
               END IF
               CALL astt304_pmdt006_get()
            END IF
            LET g_pmdt_d_o.* = g_pmdt_d[l_ac].*   #160824-00007#178 Add By Ken 161109


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmdtseq
            #add-point:ON CHANGE pmdtseq name="input.g.page1.pmdtseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdt016
            
            #add-point:AFTER FIELD pmdt016 name="input.a.page1.pmdt016"
            IF NOT cl_null(g_pmdt_d[l_ac].pmdt016) THEN 
#應用 a17 樣板自動產生(Version:2)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_pmdt_d[l_ac].pmdt016
               LET g_chkparam.arg2 = '參數2'
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_inaa001_1") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            END IF 


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdt016
            #add-point:BEFORE FIELD pmdt016 name="input.b.page1.pmdt016"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmdt016
            #add-point:ON CHANGE pmdt016 name="input.g.page1.pmdt016"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdt006
            
            #add-point:AFTER FIELD pmdt006 name="input.a.page1.pmdt006"
            IF NOT cl_null(g_pmdt_d[l_ac].pmdt006) THEN 
               #检查料件是否存在单头来源单号中
               SELECT COUNT(*) INTO l_n
                 FROM pmdt_t
                WHERE pmdtent = g_enterprise
                  AND pmdtdocno = g_pmds_m.pmds201
                  AND pmdt006 = g_pmdt_d[l_ac].pmdt006
               IF l_n = 0 THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00375'
                  LET g_errparam.extend = g_pmdt_d[l_ac].pmdt006
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD pmdt006
               END IF 
               CALL astt304_pmdt006_get()
               #IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_pmdt_d[l_ac].pmdt006 != g_pmdt_d_t.pmdt006) THEN     #160824-00007#178 Mark By Ken 161109
               IF g_pmdt_d[l_ac].pmdt006 != g_pmdt_d_o.pmdt006 THEN       #160824-00007#178 Add By Ken 161109           
                  IF NOT cl_null(g_pmdt_d[l_ac].pmdtseq) THEN 
                     IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM pmdt_t WHERE "||"pmdtent = '" ||g_enterprise|| "' AND "||"pmdtdocno = '"||g_pmds_m.pmdsdocno ||"' AND "|| "pmdtseq = '"||g_pmdt_d[l_ac].pmdtseq ||"'",'std-00004',0) THEN 
                        NEXT FIELD CURRENT
                     END IF
                  END IF 
               END IF 
            END IF 
            LET g_pmdt_d_o.* = g_pmdt_d[l_ac].*   #160824-00007#178 Add By Ken 161109

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdt006
            #add-point:BEFORE FIELD pmdt006 name="input.b.page1.pmdt006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmdt006
            #add-point:ON CHANGE pmdt006 name="input.g.page1.pmdt006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdt200
            #add-point:BEFORE FIELD pmdt200 name="input.b.page1.pmdt200"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdt200
            
            #add-point:AFTER FIELD pmdt200 name="input.a.page1.pmdt200"
            IF NOT cl_null(g_pmdt_d[l_ac].pmdt200) THEN
               LET l_n = 0
               #检查料件是否存在单头来源单号中
               SELECT COUNT(*) INTO l_n
                 FROM pmdt_t
                WHERE pmdtent = g_enterprise
                  AND pmdtdocno = g_pmds_m.pmds201
                  AND pmdt200 = g_pmdt_d[l_ac].pmdt200
               IF l_n = 0 THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00377'
                  LET g_errparam.extend = g_pmdt_d[l_ac].pmdt200
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD pmdt200
               END IF
               CALL astt304_pmdt006_get()
               #IF l_cmd = 'a' OR ( l_cmd = 'u' AND g_pmdt_d[l_ac].pmdt200 != g_pmdt_d_t.pmdt200) THEN   #160824-00007#178 Mark By Ken 161109
               IF g_pmdt_d[l_ac].pmdt200 != g_pmdt_d_o.pmdt200 THEN   #160824-00007#178 Add By Ken 161109
                  IF NOT cl_null(g_pmdt_d[l_ac].pmdtseq) THEN 
                     IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM pmdt_t WHERE "||"pmdtent = '" ||g_enterprise|| "' AND "||"pmdtdocno = '"||g_pmds_m.pmdsdocno ||"' AND "|| "pmdtseq = '"||g_pmdt_d[l_ac].pmdtseq ||"'",'std-00004',0) THEN 
                        NEXT FIELD CURRENT
                     END IF
                  END IF 
               END IF
            END IF
            LET g_pmdt_d_o.* = g_pmdt_d[l_ac].*   #160824-00007#178 Add By Ken 161109
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmdt200
            #add-point:ON CHANGE pmdt200 name="input.g.page1.pmdt200"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdt039
            #add-point:BEFORE FIELD pmdt039 name="input.b.page1.pmdt039"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdt039
            
            #add-point:AFTER FIELD pmdt039 name="input.a.page1.pmdt039"
            IF NOT cl_null(g_pmdt_d[l_ac].pmdt039) THEN 
               IF g_pmdt_d[l_ac].pmdt039 = 0 THEN 
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00378'
                  LET g_errparam.extend = g_pmdt_d[l_ac].pmdt039
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD pmdt039
               END IF 
               SELECT pmds037 INTO l_pmds037
                 FROM pmds_t
                WHERE pmdsent = g_enterprise
                  AND pmdsdocno = g_pmds_m.pmdsdocno
               #截位
               LET g_pmdt_d[l_ac].pmdt039 = s_curr_round(g_pmds_m.pmdssite,l_pmds037,g_pmdt_d[l_ac].pmdt039,'2')
               IF NOT cl_null(g_pmdt_d[l_ac].pmdt046) THEN
                  #获取税率               
                  SELECT DISTINCT oodb006
                    INTO l_oodb006
                    FROM ooef_t,oodb_t 
                    WHERE oodbent = g_enterprise
                      AND ooef019 = oodb001
                      AND ooefent = oodbent
                      AND oodb002 = g_pmdt_d[l_ac].pmdt046
                      AND ooef001 = g_pmds_m.pmdssite
                      AND oodbstus = 'Y'
                  LET g_pmdt_d[l_ac].pmdt047 = g_pmdt_d[l_ac].pmdt039 - g_pmdt_d[l_ac].pmdt039/(1+l_oodb006/100)
                  LET g_pmdt_d[l_ac].pmdt047 = s_curr_round(g_pmds_m.pmdssite,l_pmds037,g_pmdt_d[l_ac].pmdt047,'2')
                  LET g_pmdt_d[l_ac].pmdt038 = g_pmdt_d[l_ac].pmdt039 - g_pmdt_d[l_ac].pmdt047
               END IF 
            END IF 


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmdt039
            #add-point:ON CHANGE pmdt039 name="input.g.page1.pmdt039"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmdt038
            #add-point:BEFORE FIELD pmdt038 name="input.b.page1.pmdt038"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmdt038
            
            #add-point:AFTER FIELD pmdt038 name="input.a.page1.pmdt038"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE pmdt038
            #add-point:ON CHANGE pmdt038 name="input.g.page1.pmdt038"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.pmdtseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdtseq
            #add-point:ON ACTION controlp INFIELD pmdtseq name="input.c.page1.pmdtseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.pmdt016
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdt016
            #add-point:ON ACTION controlp INFIELD pmdt016 name="input.c.page1.pmdt016"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_pmdt_d[l_ac].pmdt016             #給予default值
            LET g_qryparam.default2 = "" #g_pmdt_d[l_ac].inayl003 #說明
            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_inaa001_6()                                #呼叫開窗

            LET g_pmdt_d[l_ac].pmdt016 = g_qryparam.return1              
            #LET g_pmdt_d[l_ac].inayl003 = g_qryparam.return2 
            DISPLAY g_pmdt_d[l_ac].pmdt016 TO pmdt016              #
            #DISPLAY g_pmdt_d[l_ac].inayl003 TO inayl003 #說明
            NEXT FIELD pmdt016                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.pmdt006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdt006
            #add-point:ON ACTION controlp INFIELD pmdt006 name="input.c.page1.pmdt006"
            #應用 a07 樣板自動產生(Version:2)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_pmdt_d[l_ac].pmdt006             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s


            CALL q_imaf001()                                #呼叫開窗

            LET g_pmdt_d[l_ac].pmdt006 = g_qryparam.return1              

            DISPLAY g_pmdt_d[l_ac].pmdt006 TO pmdt006              #

            NEXT FIELD pmdt006                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.pmdt200
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdt200
            #add-point:ON ACTION controlp INFIELD pmdt200 name="input.c.page1.pmdt200"
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_pmdt_d[l_ac].pmdt200
            
            #給予arg
            LET g_qryparam.where = " EXISTS (SELECT 1 FROM rtdx_t,imaf_t",
                                   "          WHERE rtdxent = ",g_enterprise,
                                   "            AND rtdxsite = '",g_pmds_m.pmdssite,"'",
                                   "            AND rtdx001 = imaa001",
                                   "            AND rtdxstus = 'Y'",
                                   "            AND imafent = rtdxent",
                                   "            AND imafsite = rtdxsite",
                                   "            AND imaf001 = rtdx001",
                                   "            AND imafstus = 'Y'",
                                   "            AND imaf153 = '",g_pmds_m.pmds007,"')"
            CALL q_imay003_6()
            LET g_pmdt_d[l_ac].pmdt200 = g_qryparam.return1
            DISPLAY g_pmdt_d[l_ac].pmdt200 TO pmdt200
            NEXT FIELD pmdt200
            #END add-point
 
 
         #Ctrlp:input.c.page1.pmdt039
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdt039
            #add-point:ON ACTION controlp INFIELD pmdt039 name="input.c.page1.pmdt039"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.pmdt038
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmdt038
            #add-point:ON ACTION controlp INFIELD pmdt038 name="input.c.page1.pmdt038"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_pmdt_d[l_ac].* = g_pmdt_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt304_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_pmdt_d[l_ac].pmdtseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_pmdt_d[l_ac].* = g_pmdt_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt304_pmdt_t_mask_restore('restore_mask_o')
      
               UPDATE pmdt_t SET (pmdtdocno,pmdtseq,pmdt016,pmdt006,pmdt200,pmdt046,pmdt039,pmdt047, 
                   pmdt038) = (g_pmds_m.pmdsdocno,g_pmdt_d[l_ac].pmdtseq,g_pmdt_d[l_ac].pmdt016,g_pmdt_d[l_ac].pmdt006, 
                   g_pmdt_d[l_ac].pmdt200,g_pmdt_d[l_ac].pmdt046,g_pmdt_d[l_ac].pmdt039,g_pmdt_d[l_ac].pmdt047, 
                   g_pmdt_d[l_ac].pmdt038)
                WHERE pmdtent = g_enterprise AND pmdtdocno = g_pmds_m.pmdsdocno 
 
                  AND pmdtseq = g_pmdt_d_t.pmdtseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_pmdt_d[l_ac].* = g_pmdt_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "pmdt_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_pmdt_d[l_ac].* = g_pmdt_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "pmdt_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_pmds_m.pmdsdocno
               LET gs_keys_bak[1] = g_pmdsdocno_t
               LET gs_keys[2] = g_pmdt_d[g_detail_idx].pmdtseq
               LET gs_keys_bak[2] = g_pmdt_d_t.pmdtseq
               CALL astt304_update_b('pmdt_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt304_pmdt_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_pmdt_d[g_detail_idx].pmdtseq = g_pmdt_d_t.pmdtseq 
 
                  ) THEN
                  LET gs_keys[01] = g_pmds_m.pmdsdocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_pmdt_d_t.pmdtseq
 
                  CALL astt304_key_update_b(gs_keys,'pmdt_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_pmds_m),util.JSON.stringify(g_pmdt_d_t)
               LET g_log2 = util.JSON.stringify(g_pmds_m),util.JSON.stringify(g_pmdt_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               SELECT pmdt024 INTO l_pmdt024
                 FROM pmdt_t
                WHERE pmdtent = g_enterprise
                  AND pmdtdocno = g_pmds_m.pmdsdocno
                  AND pmdtseq = g_pmdt_d[l_ac].pmdtseq
               LET l_pmdt036 = g_pmdt_d[l_ac].pmdt039/l_pmdt024
               LET l_pmdt036 = s_curr_round(g_pmds_m.pmdssite,l_pmds037,l_pmdt036,'2')
               UPDATE pmdt_t SET pmdt036 = l_pmdt036
                WHERE pmdtent = g_enterprise
                  AND pmdtdocno = g_pmds_m.pmdsdocno
                  AND pmdtseq = g_pmdt_d[l_ac].pmdtseq      
               IF SQLCA.SQLcode THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "pmdt_t" 
                  LET g_errparam.code   = SQLCA.sqlcode 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  CALL s_transaction_end('N','0')      
               END IF                   
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astt304_unlock_b("pmdt_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            #add-point:單身after_row2 name="input.body.after_row2"
            #汇总单身金额更新单头
            UPDATE pmds_t SET pmds044 = (SELECT SUM(pmdt039) FROM pmdt_t WHERE pmdtent = g_enterprise AND pmdtdocno = g_pmds_m.pmdsdocno),
                              pmds043 = (SELECT SUM(pmdt038) FROM pmdt_t WHERE pmdtent = g_enterprise AND pmdtdocno = g_pmds_m.pmdsdocno),
                              pmds046 = (SELECT SUM(pmdt047) FROM pmdt_t WHERE pmdtent = g_enterprise AND pmdtdocno = g_pmds_m.pmdsdocno)
             WHERE pmdsent = g_enterprise
               AND pmdsdocno = g_pmds_m.pmdsdocno
            IF SQLCA.SQLcode THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "pmds_t" 
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()    
            END IF    
            SELECT pmds044 INTO g_pmds_m.pmds044
              FROM pmds_t
             WHERE pmdsent = g_enterprise
               AND pmdsdocno = g_pmds_m.pmdsdocno
            DISPLAY BY NAME g_pmds_m.pmds044
            CALL astt304_b2_fill()
            CALL astt304_b_refresh()
            #end add-point
              
         AFTER INPUT
            #add-point:input段after input  name="input.body.after_input"
            
            #end add-point 
    
         ON ACTION controlo    
            IF l_insert THEN
               LET li_reproduce = l_ac_t
               LET li_reproduce_target = l_ac
               LET g_pmdt_d[li_reproduce_target].* = g_pmdt_d[li_reproduce].*
 
               LET g_pmdt_d[li_reproduce_target].pmdtseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_pmdt_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_pmdt_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="astt304.input.other" >}
      
      #add-point:自定義input name="input.more_input"
      DISPLAY ARRAY g_pmdt2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
         BEFORE ROW
            LET l_ac = DIALOG.getCurrentRow("s_detail2")
            LET g_detail_idx = l_ac
            
         BEFORE DISPLAY
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' THEN
               CALL FGL_SET_ARR_CURR(g_detail_idx)
            END IF
            LET g_loc = 'm'
            LET l_ac = DIALOG.getCurrentRow("s_detail2")
            LET g_current_page = 2
      END DISPLAY
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
            NEXT FIELD pmdsdocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD pmdtseq
 
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
   #汇总单身金额更新单头
   UPDATE pmds_t SET pmds044 = (SELECT SUM(pmdt039) FROM pmdt_t WHERE pmdtent = g_enterprise AND pmdtdocno = g_pmds_m.pmdsdocno),
                     pmds043 = (SELECT SUM(pmdt038) FROM pmdt_t WHERE pmdtent = g_enterprise AND pmdtdocno = g_pmds_m.pmdsdocno),
                     pmds046 = (SELECT SUM(pmdt047) FROM pmdt_t WHERE pmdtent = g_enterprise AND pmdtdocno = g_pmds_m.pmdsdocno)
    WHERE pmdsent = g_enterprise
      AND pmdsdocno = g_pmds_m.pmdsdocno
   IF SQLCA.SQLcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "pmds_t" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()    
   END IF    
   SELECT pmds044 INTO g_pmds_m.pmds044
     FROM pmds_t
    WHERE pmdsent = g_enterprise
      AND pmdsdocno = g_pmds_m.pmdsdocno
   DISPLAY BY NAME g_pmds_m.pmds044
   CALL cl_set_combo_scc_part('pmds202','6844','1,2,5') 
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="astt304.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt304_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt304_b_fill() #單身填充
      CALL astt304_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt304_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   
   #end add-point
   
   #遮罩相關處理
   LET g_pmds_m_mask_o.* =  g_pmds_m.*
   CALL astt304_pmds_t_mask()
   LET g_pmds_m_mask_n.* =  g_pmds_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_pmds_m.pmdssite,g_pmds_m.pmdssite_desc,g_pmds_m.pmdsdocdt,g_pmds_m.pmdsdocno,g_pmds_m.pmds000, 
       g_pmds_m.pmds007,g_pmds_m.pmds007_desc,g_pmds_m.pmds202,g_pmds_m.pmds201,g_pmds_m.pmds044,g_pmds_m.pmdsunit, 
       g_pmds_m.pmdsunit_desc,g_pmds_m.pmds002,g_pmds_m.pmds002_desc,g_pmds_m.pmds045,g_pmds_m.pmdsstus, 
       g_pmds_m.pmdsownid,g_pmds_m.pmdsownid_desc,g_pmds_m.pmdsowndp,g_pmds_m.pmdsowndp_desc,g_pmds_m.pmdscrtid, 
       g_pmds_m.pmdscrtid_desc,g_pmds_m.pmdscrtdp,g_pmds_m.pmdscrtdp_desc,g_pmds_m.pmdscrtdt,g_pmds_m.pmdsmodid, 
       g_pmds_m.pmdsmodid_desc,g_pmds_m.pmdsmoddt,g_pmds_m.pmdscnfid,g_pmds_m.pmdscnfid_desc,g_pmds_m.pmdscnfdt, 
       g_pmds_m.pmdspstid,g_pmds_m.pmdspstid_desc,g_pmds_m.pmdspstdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_pmds_m.pmdsstus 
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         
      END CASE
 
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_pmdt_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt304_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt304.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt304_detail_show()
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
 
{<section id="astt304.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt304_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE pmds_t.pmdsdocno 
   DEFINE l_oldno     LIKE pmds_t.pmdsdocno 
 
   DEFINE l_master    RECORD LIKE pmds_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE pmdt_t.* #此變數樣板目前無使用
 
 
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
   
   IF g_pmds_m.pmdsdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_pmdsdocno_t = g_pmds_m.pmdsdocno
 
    
   LET g_pmds_m.pmdsdocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_pmds_m.pmdsownid = g_user
      LET g_pmds_m.pmdsowndp = g_dept
      LET g_pmds_m.pmdscrtid = g_user
      LET g_pmds_m.pmdscrtdp = g_dept 
      LET g_pmds_m.pmdscrtdt = cl_get_current()
      LET g_pmds_m.pmdsmodid = g_user
      LET g_pmds_m.pmdsmoddt = cl_get_current()
      LET g_pmds_m.pmdsstus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_pmds_m.pmdsstus 
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         
      END CASE
 
 
 
   
   #清空key欄位的desc
   
   
   CALL astt304_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_pmds_m.* TO NULL
      INITIALIZE g_pmdt_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt304_show()
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
   CALL astt304_set_act_visible()   
   CALL astt304_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_pmdsdocno_t = g_pmds_m.pmdsdocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " pmdsent = " ||g_enterprise|| " AND",
                      " pmdsdocno = '", g_pmds_m.pmdsdocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt304_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt304_idx_chk()
   
   LET g_data_owner = g_pmds_m.pmdsownid      
   LET g_data_dept  = g_pmds_m.pmdsowndp
   
   #功能已完成,通報訊息中心
   CALL astt304_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt304.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt304_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE pmdt_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt304_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM pmdt_t
    WHERE pmdtent = g_enterprise AND pmdtdocno = g_pmdsdocno_t
 
    INTO TEMP astt304_detail
 
   #將key修正為調整後   
   UPDATE astt304_detail 
      #更新key欄位
      SET pmdtdocno = g_pmds_m.pmdsdocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO pmdt_t SELECT * FROM astt304_detail
   
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
   DROP TABLE astt304_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_pmdsdocno_t = g_pmds_m.pmdsdocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt304.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt304_delete()
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
   
   IF g_pmds_m.pmdsdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt304_cl USING g_enterprise,g_pmds_m.pmdsdocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt304_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt304_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt304_master_referesh USING g_pmds_m.pmdsdocno INTO g_pmds_m.pmdssite,g_pmds_m.pmdsdocdt, 
       g_pmds_m.pmdsdocno,g_pmds_m.pmds000,g_pmds_m.pmds007,g_pmds_m.pmds202,g_pmds_m.pmds201,g_pmds_m.pmds044, 
       g_pmds_m.pmdsunit,g_pmds_m.pmds002,g_pmds_m.pmds045,g_pmds_m.pmdsstus,g_pmds_m.pmdsownid,g_pmds_m.pmdsowndp, 
       g_pmds_m.pmdscrtid,g_pmds_m.pmdscrtdp,g_pmds_m.pmdscrtdt,g_pmds_m.pmdsmodid,g_pmds_m.pmdsmoddt, 
       g_pmds_m.pmdscnfid,g_pmds_m.pmdscnfdt,g_pmds_m.pmdspstid,g_pmds_m.pmdspstdt,g_pmds_m.pmdssite_desc, 
       g_pmds_m.pmds007_desc,g_pmds_m.pmdsunit_desc,g_pmds_m.pmds002_desc,g_pmds_m.pmdsownid_desc,g_pmds_m.pmdsowndp_desc, 
       g_pmds_m.pmdscrtid_desc,g_pmds_m.pmdscrtdp_desc,g_pmds_m.pmdsmodid_desc,g_pmds_m.pmdscnfid_desc, 
       g_pmds_m.pmdspstid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt304_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_pmds_m_mask_o.* =  g_pmds_m.*
   CALL astt304_pmds_t_mask()
   LET g_pmds_m_mask_n.* =  g_pmds_m.*
   
   CALL astt304_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt304_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_pmdsdocno_t = g_pmds_m.pmdsdocno
 
 
      DELETE FROM pmds_t
       WHERE pmdsent = g_enterprise AND pmdsdocno = g_pmds_m.pmdsdocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_pmds_m.pmdsdocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_del_docno(g_pmds_m.pmdsdocno,g_pmds_m.pmdsdocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM pmdt_t
       WHERE pmdtent = g_enterprise AND pmdtdocno = g_pmds_m.pmdsdocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "pmdt_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_pmds_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt304_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_pmdt_d.clear() 
 
     
      CALL astt304_ui_browser_refresh()  
      #CALL astt304_ui_headershow()  
      #CALL astt304_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      CALL g_pmdt2_d.clear()
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt304_browser_fill("")
         CALL astt304_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt304_cl
 
   #功能已完成,通報訊息中心
   CALL astt304_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt304.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt304_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_pmdt_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt304_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT pmdtseq,pmdt016,pmdt006,pmdt200,pmdt046,pmdt039,pmdt047,pmdt038 , 
             t1.inaa002 ,t2.imaal003 ,t3.oodbl004 FROM pmdt_t",   
                     " INNER JOIN pmds_t ON pmdsent = " ||g_enterprise|| " AND pmdsdocno = pmdtdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN inaa_t t1 ON t1.inaaent="||g_enterprise||" AND t1.inaasite=pmdtsite AND t1.inaa001=pmdt016  ",
               " LEFT JOIN imaal_t t2 ON t2.imaalent="||g_enterprise||" AND t2.imaal001=pmdt006 AND t2.imaal002='"||g_dlang||"' ",
               " LEFT JOIN oodbl_t t3 ON t3.oodblent="||g_enterprise||" AND t3.oodbl001=' ' AND t3.oodbl002=pmdt046 AND t3.oodbl003='"||g_dlang||"' ",
 
                     " WHERE pmdtent=? AND pmdtdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY pmdt_t.pmdtseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
         
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt304_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt304_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_pmds_m.pmdsdocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_pmds_m.pmdsdocno INTO g_pmdt_d[l_ac].pmdtseq,g_pmdt_d[l_ac].pmdt016, 
          g_pmdt_d[l_ac].pmdt006,g_pmdt_d[l_ac].pmdt200,g_pmdt_d[l_ac].pmdt046,g_pmdt_d[l_ac].pmdt039, 
          g_pmdt_d[l_ac].pmdt047,g_pmdt_d[l_ac].pmdt038,g_pmdt_d[l_ac].pmdt016_desc,g_pmdt_d[l_ac].pmdt006_desc, 
          g_pmdt_d[l_ac].pmdt046_desc   #(ver:78)
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
         LET g_ref_fields[1] = g_pmdt_d[l_ac].pmdt006
         CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
         LET g_pmdt_d[l_ac].pmdt006_desc = g_rtn_fields[1]
         
         CALL s_desc_get_stock_desc('',g_pmdt_d[l_ac].pmdt016)
                     RETURNING  g_pmdt_d[l_ac].pmdt016_desc
         
         CALL s_desc_get_tax_desc1(g_pmds_m.pmdssite,g_pmdt_d[l_ac].pmdt046)
             RETURNING g_pmdt_d[l_ac].pmdt046_desc
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
   CALL astt304_b2_fill()
   #end add-point
   
   CALL g_pmdt_d.deleteElement(g_pmdt_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt304_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_pmdt_d.getLength()
      LET g_pmdt_d_mask_o[l_ac].* =  g_pmdt_d[l_ac].*
      CALL astt304_pmdt_t_mask()
      LET g_pmdt_d_mask_n[l_ac].* =  g_pmdt_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt304.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt304_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM pmdt_t
       WHERE pmdtent = g_enterprise AND
         pmdtdocno = ps_keys_bak[1] AND pmdtseq = ps_keys_bak[2]
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
         CALL g_pmdt_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt304.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt304_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO pmdt_t
                  (pmdtent,
                   pmdtdocno,
                   pmdtseq
                   ,pmdt016,pmdt006,pmdt200,pmdt046,pmdt039,pmdt047,pmdt038) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_pmdt_d[g_detail_idx].pmdt016,g_pmdt_d[g_detail_idx].pmdt006,g_pmdt_d[g_detail_idx].pmdt200, 
                       g_pmdt_d[g_detail_idx].pmdt046,g_pmdt_d[g_detail_idx].pmdt039,g_pmdt_d[g_detail_idx].pmdt047, 
                       g_pmdt_d[g_detail_idx].pmdt038)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "pmdt_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_pmdt_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt304.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt304_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "pmdt_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt304_pmdt_t_mask_restore('restore_mask_o')
               
      UPDATE pmdt_t 
         SET (pmdtdocno,
              pmdtseq
              ,pmdt016,pmdt006,pmdt200,pmdt046,pmdt039,pmdt047,pmdt038) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_pmdt_d[g_detail_idx].pmdt016,g_pmdt_d[g_detail_idx].pmdt006,g_pmdt_d[g_detail_idx].pmdt200, 
                  g_pmdt_d[g_detail_idx].pmdt046,g_pmdt_d[g_detail_idx].pmdt039,g_pmdt_d[g_detail_idx].pmdt047, 
                  g_pmdt_d[g_detail_idx].pmdt038) 
         WHERE pmdtent = g_enterprise AND pmdtdocno = ps_keys_bak[1] AND pmdtseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "pmdt_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "pmdt_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt304_pmdt_t_mask_restore('restore_mask_n')
               
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
 
{<section id="astt304.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt304_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt304.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt304_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt304.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt304_lock_b(ps_table,ps_page)
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
   #CALL astt304_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "pmdt_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt304_bcl USING g_enterprise,
                                       g_pmds_m.pmdsdocno,g_pmdt_d[g_detail_idx].pmdtseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt304_bcl:",SQLERRMESSAGE 
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
 
{<section id="astt304.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt304_unlock_b(ps_table,ps_page)
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
      CLOSE astt304_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt304.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt304_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("pmdsdocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("pmdsdocno",TRUE)
      CALL cl_set_comp_entry("pmdsdocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("pmds201,pmds202,pmds007",TRUE)
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt304.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt304_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("pmdsdocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("pmdsdocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("pmdsdocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   IF p_cmd = 'u' THEN
      CALL cl_set_comp_entry("pmds201,pmds202,pmds007",FALSE)
   END IF 
   IF NOT s_aooi500_comp_entry(g_prog,'pmdssite') OR g_site_flag THEN
      CALL cl_set_comp_entry("pmdssite",FALSE)
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt304.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt304_set_entry_b(p_cmd)
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
 
{<section id="astt304.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt304_set_no_entry_b(p_cmd)
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
 
{<section id="astt304.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt304_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt304.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt304_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:1)
   IF g_pmds_m.pmdsstus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF


   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt304.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt304_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt304.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt304_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt304.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt304_default_search()
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
      LET ls_wc = ls_wc, " pmdsdocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "pmds_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "pmdt_t" 
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
 
{<section id="astt304.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt304_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   IF g_pmds_m.pmdsstus = 'X' THEN 
      RETURN 
   END IF 
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_pmds_m.pmdsdocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt304_cl USING g_enterprise,g_pmds_m.pmdsdocno
   IF STATUS THEN
      CLOSE astt304_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt304_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt304_master_referesh USING g_pmds_m.pmdsdocno INTO g_pmds_m.pmdssite,g_pmds_m.pmdsdocdt, 
       g_pmds_m.pmdsdocno,g_pmds_m.pmds000,g_pmds_m.pmds007,g_pmds_m.pmds202,g_pmds_m.pmds201,g_pmds_m.pmds044, 
       g_pmds_m.pmdsunit,g_pmds_m.pmds002,g_pmds_m.pmds045,g_pmds_m.pmdsstus,g_pmds_m.pmdsownid,g_pmds_m.pmdsowndp, 
       g_pmds_m.pmdscrtid,g_pmds_m.pmdscrtdp,g_pmds_m.pmdscrtdt,g_pmds_m.pmdsmodid,g_pmds_m.pmdsmoddt, 
       g_pmds_m.pmdscnfid,g_pmds_m.pmdscnfdt,g_pmds_m.pmdspstid,g_pmds_m.pmdspstdt,g_pmds_m.pmdssite_desc, 
       g_pmds_m.pmds007_desc,g_pmds_m.pmdsunit_desc,g_pmds_m.pmds002_desc,g_pmds_m.pmdsownid_desc,g_pmds_m.pmdsowndp_desc, 
       g_pmds_m.pmdscrtid_desc,g_pmds_m.pmdscrtdp_desc,g_pmds_m.pmdsmodid_desc,g_pmds_m.pmdscnfid_desc, 
       g_pmds_m.pmdspstid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt304_action_chk() THEN
      CLOSE astt304_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_pmds_m.pmdssite,g_pmds_m.pmdssite_desc,g_pmds_m.pmdsdocdt,g_pmds_m.pmdsdocno,g_pmds_m.pmds000, 
       g_pmds_m.pmds007,g_pmds_m.pmds007_desc,g_pmds_m.pmds202,g_pmds_m.pmds201,g_pmds_m.pmds044,g_pmds_m.pmdsunit, 
       g_pmds_m.pmdsunit_desc,g_pmds_m.pmds002,g_pmds_m.pmds002_desc,g_pmds_m.pmds045,g_pmds_m.pmdsstus, 
       g_pmds_m.pmdsownid,g_pmds_m.pmdsownid_desc,g_pmds_m.pmdsowndp,g_pmds_m.pmdsowndp_desc,g_pmds_m.pmdscrtid, 
       g_pmds_m.pmdscrtid_desc,g_pmds_m.pmdscrtdp,g_pmds_m.pmdscrtdp_desc,g_pmds_m.pmdscrtdt,g_pmds_m.pmdsmodid, 
       g_pmds_m.pmdsmodid_desc,g_pmds_m.pmdsmoddt,g_pmds_m.pmdscnfid,g_pmds_m.pmdscnfid_desc,g_pmds_m.pmdscnfdt, 
       g_pmds_m.pmdspstid,g_pmds_m.pmdspstid_desc,g_pmds_m.pmdspstdt
 
   CASE g_pmds_m.pmdsstus
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
      WHEN "X"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
      WHEN "Z"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
      
   END CASE
 
   #add-point:資料刷新後 name="statechange.after_refresh"
   
   #end add-point
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_pmds_m.pmdsstus
            
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
            WHEN "X"
               HIDE OPTION "invalid"
            WHEN "Z"
               HIDE OPTION "unposted"
         END CASE
     
      #add-point:menu前 name="statechange.before_menu"
      CALL cl_set_act_visible("unconfirmed,invalid,confirmed,posted,approved,withdraw,rejection,signing,unposted",TRUE)
      CALL cl_set_act_visible("reconciliate,unreconciliate",FALSE)
      CASE g_pmds_m.pmdsstus
         WHEN "N"
            #HIDE OPTION "open"
            CALL cl_set_act_visible("unconfirmed,posted,approved,withdraw,rejection,signing,unposted",FALSE)
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            IF cl_bpm_chk() THEN
                CALL cl_set_act_visible("signing",TRUE)
            END IF
       
         WHEN "S"
            #HIDE OPTION "posted"
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed,posted,approved,withdraw,rejection,signing",FALSE)
       
         WHEN "X"
            #HIDE OPTION "invalid"
            CALL cl_set_act_visible("invalid,unconfirmed,confirmed,posted,unposted,approved,withdraw,rejection,signing",FALSE)
       
         WHEN "Y"
            #HIDE OPTION "confirmed"
            CALL cl_set_act_visible("invalid,confirmed,unposted,approved,withdraw,rejection,signing",FALSE)
       
         WHEN "A"
            CALL cl_set_act_visible("invalid,unconfirmed,posted,approved,withdraw,rejection,signing",FALSE)
            
         WHEN "D"
            CALL cl_set_act_visible("linvaid,unconfirmed,confirmed,posted,approved,withdraw,rejection,signing",FALSE)
            
         WHEN "R"
            CALL cl_set_act_visible("unconfirmed,confirmed,posted,approved,withdraw,rejection,signing",FALSE)
            
         WHEN "W"
            CALL cl_set_act_visible("invalid,unconfirmed,confirmed,posted,approved,rejection,signing",FALSE)
      END CASE
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT astt304_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt304_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt304_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt304_cl
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
            IF NOT cl_ask_confirm('aim-00108') THEN
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN
            END IF 
            #更新后直接过账
            LET lc_state = "S"
            IF s_astt304_conf_chk(g_pmds_m.pmdsdocno) THEN 
               CALL s_transaction_begin()
               IF s_astt304_conf_upd(g_pmds_m.pmdsdocno) THEN 
                  IF s_astt304_post_upd(g_pmds_m.pmdsdocno) THEN 
                     CALL s_transaction_end('Y','0')
                  ELSE
                     CALL s_transaction_end('N','0')
                     RETURN
                  END IF 
               ELSE
                  CALL s_transaction_end('N','0')
                  RETURN
               END IF 
            END IF 
            #end add-point
         END IF
         EXIT MENU
      ON ACTION posted
         IF cl_auth_chk_act("posted") THEN
            LET lc_state = "S"
            #add-point:action控制 name="statechange.posted"
            CALL s_transaction_begin()
            IF s_astt304_post_upd(g_pmds_m.pmdsdocno) THEN 
               CALL s_transaction_end('Y','0')
            ELSE
               CALL s_transaction_end('N','0')
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
            
            #end add-point
         END IF
         EXIT MENU
      ON ACTION unposted
         IF cl_auth_chk_act("unposted") THEN
            LET lc_state = "Z"
            #add-point:action控制 name="statechange.unposted"
            LET lc_state = "N"
            IF NOT cl_ask_confirm('sub-00232') THEN
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN
            END IF 
            #取消过账直接更新为未审核
            IF s_astt304_unposted_chk(g_pmds_m.pmdsdocno) THEN
               CALL s_transaction_begin()
               IF s_astt304_unpostd_upd(g_pmds_m.pmdsdocno) THEN 
                  IF s_astt304_unconf_upd(g_pmds_m.pmdsdocno) THEN 
                     CALL s_transaction_end('Y','0')
                  ELSE
                     CALL s_transaction_end('N','0')
                     RETURN
                  END IF 
               ELSE
                  CALL s_transaction_end('N','0')
                  RETURN
               END IF
            #add by geza 20160125(S)
            ELSE
               CALL s_transaction_end('N','0')   #160816-00068#16 by 08209 add
               RETURN
            #add by geza 20160125(E)                  
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
      AND lc_state <> "X"
      AND lc_state <> "Z"
      ) OR 
      g_pmds_m.pmdsstus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt304_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   #151125-00001#4 --- add start ---
   IF lc_state = 'X' THEN
      IF NOT cl_ask_confirm('aim-00109') THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
   END IF
   #151125-00001#4 --- add end   ---
   #end add-point
   
   LET g_pmds_m.pmdsmodid = g_user
   LET g_pmds_m.pmdsmoddt = cl_get_current()
   LET g_pmds_m.pmdsstus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE pmds_t 
      SET (pmdsstus,pmdsmodid,pmdsmoddt) 
        = (g_pmds_m.pmdsstus,g_pmds_m.pmdsmodid,g_pmds_m.pmdsmoddt)     
    WHERE pmdsent = g_enterprise AND pmdsdocno = g_pmds_m.pmdsdocno
 
    
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
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
         WHEN "Z"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unposted.png")
         
      END CASE
    
      #撈取異動後的資料
      EXECUTE astt304_master_referesh USING g_pmds_m.pmdsdocno INTO g_pmds_m.pmdssite,g_pmds_m.pmdsdocdt, 
          g_pmds_m.pmdsdocno,g_pmds_m.pmds000,g_pmds_m.pmds007,g_pmds_m.pmds202,g_pmds_m.pmds201,g_pmds_m.pmds044, 
          g_pmds_m.pmdsunit,g_pmds_m.pmds002,g_pmds_m.pmds045,g_pmds_m.pmdsstus,g_pmds_m.pmdsownid,g_pmds_m.pmdsowndp, 
          g_pmds_m.pmdscrtid,g_pmds_m.pmdscrtdp,g_pmds_m.pmdscrtdt,g_pmds_m.pmdsmodid,g_pmds_m.pmdsmoddt, 
          g_pmds_m.pmdscnfid,g_pmds_m.pmdscnfdt,g_pmds_m.pmdspstid,g_pmds_m.pmdspstdt,g_pmds_m.pmdssite_desc, 
          g_pmds_m.pmds007_desc,g_pmds_m.pmdsunit_desc,g_pmds_m.pmds002_desc,g_pmds_m.pmdsownid_desc, 
          g_pmds_m.pmdsowndp_desc,g_pmds_m.pmdscrtid_desc,g_pmds_m.pmdscrtdp_desc,g_pmds_m.pmdsmodid_desc, 
          g_pmds_m.pmdscnfid_desc,g_pmds_m.pmdspstid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_pmds_m.pmdssite,g_pmds_m.pmdssite_desc,g_pmds_m.pmdsdocdt,g_pmds_m.pmdsdocno, 
          g_pmds_m.pmds000,g_pmds_m.pmds007,g_pmds_m.pmds007_desc,g_pmds_m.pmds202,g_pmds_m.pmds201, 
          g_pmds_m.pmds044,g_pmds_m.pmdsunit,g_pmds_m.pmdsunit_desc,g_pmds_m.pmds002,g_pmds_m.pmds002_desc, 
          g_pmds_m.pmds045,g_pmds_m.pmdsstus,g_pmds_m.pmdsownid,g_pmds_m.pmdsownid_desc,g_pmds_m.pmdsowndp, 
          g_pmds_m.pmdsowndp_desc,g_pmds_m.pmdscrtid,g_pmds_m.pmdscrtid_desc,g_pmds_m.pmdscrtdp,g_pmds_m.pmdscrtdp_desc, 
          g_pmds_m.pmdscrtdt,g_pmds_m.pmdsmodid,g_pmds_m.pmdsmodid_desc,g_pmds_m.pmdsmoddt,g_pmds_m.pmdscnfid, 
          g_pmds_m.pmdscnfid_desc,g_pmds_m.pmdscnfdt,g_pmds_m.pmdspstid,g_pmds_m.pmdspstid_desc,g_pmds_m.pmdspstdt 
 
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt304_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt304_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt304.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt304_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_pmdt_d.getLength() THEN
         LET g_detail_idx = g_pmdt_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_pmdt_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_pmdt_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt304.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt304_b_fill2(pi_idx)
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
   
   CALL astt304_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt304.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt304_fill_chk(ps_idx)
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
 
{<section id="astt304.status_show" >}
PRIVATE FUNCTION astt304_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt304.mask_functions" >}
&include "erp/ast/astt304_mask.4gl"
 
{</section>}
 
{<section id="astt304.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt304_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
 
 
   CALL astt304_show()
   CALL astt304_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_pmds_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_pmdt_d))
 
 
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
   #CALL astt304_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt304_ui_headershow()
   CALL astt304_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt304_draw_out()
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
   CALL astt304_ui_headershow()  
   CALL astt304_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt304.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt304_set_pk_array()
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
   LET g_pk_array[1].values = g_pmds_m.pmdsdocno
   LET g_pk_array[1].column = 'pmdsdocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt304.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt304.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt304_msgcentre_notify(lc_state)
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
   CALL astt304_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_pmds_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt304.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt304_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#38 add-S
   SELECT pmdsstus  INTO g_pmds_m.pmdsstus
     FROM pmds_t
    WHERE pmdsent = g_enterprise
      AND pmdsdocno = g_pmds_m.pmdsdocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_pmds_m.pmdsstus
        WHEN 'Z'
           LET g_errno = 'sub-01351'
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
        LET g_errparam.extend = g_pmds_m.pmdsdocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt304_set_act_visible()
        CALL astt304_set_act_no_visible()
        CALL astt304_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#38 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt304.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL astt304_pmdt006_get()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2015/07/13 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt304_pmdt006_get()

   CASE 
        WHEN INFIELD(pmdtseq)
             SELECT pmdt016,pmdt006,pmdt200,pmdt046
               INTO g_pmdt_d[l_ac].pmdt016,g_pmdt_d[l_ac].pmdt006,g_pmdt_d[l_ac].pmdt200,g_pmdt_d[l_ac].pmdt046
               FROM pmdt_t
              WHERE pmdtent = g_enterprise
                AND pmdtdocno = g_pmds_m.pmds201
                AND pmdtseq = g_pmdt_d[l_ac].pmdtseq
        WHEN INFIELD(pmdt006)
             SELECT a.pmdtseq,a.pmdt016,a.pmdt200,a.pmdt046
               INTO g_pmdt_d[l_ac].pmdtseq,g_pmdt_d[l_ac].pmdt016,g_pmdt_d[l_ac].pmdt200,g_pmdt_d[l_ac].pmdt046
               FROM pmdt_t a
              WHERE a.pmdtent = g_enterprise
                AND a.pmdtdocno = g_pmds_m.pmds201
                AND a.pmdt006 = g_pmdt_d[l_ac].pmdt006
                AND NOT EXISTS(SELECT 1 FROM pmdt_t b WHERE a.pmdtent = b.pmdtent
                                                        AND a.pmdtseq = b.pmdtseq
                                                        AND b.pmdtdocno = g_pmds_m.pmdsdocno)
        WHEN INFIELD(pmdt200)
             SELECT a.pmdtseq,a.pmdt016,a.pmdt006,a.pmdt046
               INTO g_pmdt_d[l_ac].pmdtseq,g_pmdt_d[l_ac].pmdt016,g_pmdt_d[l_ac].pmdt006,g_pmdt_d[l_ac].pmdt046
               FROM pmdt_t a
              WHERE a.pmdtent = g_enterprise
                AND a.pmdtdocno = g_pmds_m.pmds201
                AND a.pmdt200 = g_pmdt_d[l_ac].pmdt200
                AND NOT EXISTS(SELECT 1 FROM pmdt_t b WHERE a.pmdtent = b.pmdtent
                                                        AND a.pmdtseq = b.pmdtseq
                                                        AND b.pmdtdocno = g_pmds_m.pmdsdocno)
   END CASE 
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_pmdt_d[l_ac].pmdt006
   CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_pmdt_d[l_ac].pmdt006_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_pmdt_d[l_ac].pmdt006_desc
   
   CALL s_desc_get_stock_desc('',g_pmdt_d[l_ac].pmdt016)
               RETURNING  g_pmdt_d[l_ac].pmdt016_desc
   
   CALL s_desc_get_tax_desc1(g_pmds_m.pmdssite,g_pmdt_d[l_ac].pmdt046)
            RETURNING g_pmdt_d[l_ac].pmdt046_desc
   
END FUNCTION

################################################################################
# Descriptions...: 显示单身二
# Memo...........:
# Usage..........: CALL astt304_b2_fill()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2015/07/13 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt304_b2_fill()
 
    LET g_sql = " SELECT a.pmdtseq,pmds007,'',a.pmdt211,a.pmdt006,'',a.pmdt016,'',a.pmdt039,a.pmdt047,b.pmdt039,b.pmdt047 ",
                "   FROM pmds_t,pmdt_t a LEFT JOIN pmdt_t b ON a.pmdtent = b.pmdtent AND a.pmdtseq = b.pmdtseq AND b.pmdtdocno ='",g_pmds_m.pmdsdocno,"'",
                "  WHERE a.pmdtent = pmdsent ",
                "    AND a.pmdtdocno = pmdsdocno ",
                "    AND a.pmdtent = ",g_enterprise,
                "    AND a.pmdtdocno = '",g_pmds_m.pmds201,"'",
                "  ORDER BY a.pmdtseq "
    PREPARE b2_fill_pre FROM g_sql
    DECLARE b2_fill_cur CURSOR FOR b2_fill_pre
    LET g_cnt = 1
    CALL g_pmdt2_d.clear()
    FOREACH b2_fill_cur INTO g_pmdt2_d[g_cnt].*
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL 
          LET g_errparam.extend = "FOREACH:b2_fill_cur" 
          LET g_errparam.code   = SQLCA.sqlcode 
          LET g_errparam.popup  = TRUE 
          CALL cl_err()
          EXIT FOREACH
       END IF
       
       INITIALIZE g_ref_fields TO NULL
       LET g_ref_fields[1] = g_pmdt2_d[g_cnt].pmds007
       CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
       LET g_pmdt2_d[g_cnt].pmds007_desc = g_rtn_fields[1] 
            
       INITIALIZE g_ref_fields TO NULL
       LET g_ref_fields[1] = g_pmdt2_d[g_cnt].pmdt006
       CALL ap_ref_array2(g_ref_fields,"SELECT imaal003 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
       LET g_pmdt2_d[g_cnt].pmdt006_desc = g_rtn_fields[1]
       
       CALL s_desc_get_stock_desc('',g_pmdt2_d[g_cnt].pmdt016)
                   RETURNING  g_pmdt2_d[g_cnt].pmdt016_desc
       
       LET g_cnt = g_cnt + 1
    END FOREACH 
    CALL g_pmdt2_d.deleteElement(g_pmdt2_d.getLength())
    
END FUNCTION

################################################################################
# Descriptions...: 刷新单身数据
# Memo...........:
# Usage..........: CALL astt304_b_refresh()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2015/07/13 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astt304_b_refresh()
   
      DISPLAY ARRAY g_pmdt2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
         BEFORE ROW
            LET l_ac = DIALOG.getCurrentRow("s_detail2")
            LET g_detail_idx = l_ac
            
         BEFORE DISPLAY
            EXIT DISPLAY 
      END DISPLAY
END FUNCTION

 
{</section>}
 
