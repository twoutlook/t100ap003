#該程式未解開Section, 採用最新樣板產出!
{<section id="astt811.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0008(2016-09-14 17:23:05), PR版次:0008(2016-10-26 16:24:55)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000033
#+ Filename...: astt811
#+ Description: 意向協議維護作業
#+ Creator....: 02159(2016-03-22 16:38:51)
#+ Modifier...: 08172 -SD/PR- 02481
 
{</section>}
 
{<section id="astt811.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#160512-00003#8  2016/05/18   by 08172   审核时单身可以无值，根据商户带来源单号，scc修改，铺位单身修改及费用单修改
#160816-00068#1  2016/08/17   By earl    調整transaction
#160818-00017#41 2016-08-23 By 08734 删除修改未重新判断状态码
#160913-00034#4  2016/09/14 by 08172 q_pmaa001開窗修改
#161024-00025#12 2016/10/26  By 02481  aooi500规范调整
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
PRIVATE type type_g_stia_m        RECORD
       stiasite LIKE stia_t.stiasite, 
   stiasite_desc LIKE type_t.chr80, 
   stiadocdt LIKE stia_t.stiadocdt, 
   stiadocno LIKE stia_t.stiadocno, 
   stia001 LIKE stia_t.stia001, 
   stia002 LIKE stia_t.stia002, 
   stia003 LIKE stia_t.stia003, 
   stia003_desc LIKE type_t.chr80, 
   stia004 LIKE stia_t.stia004, 
   stia005 LIKE stia_t.stia005, 
   stia005_desc LIKE type_t.chr80, 
   stia006 LIKE stia_t.stia006, 
   stia006_desc LIKE type_t.chr80, 
   stia007 LIKE stia_t.stia007, 
   stia008 LIKE stia_t.stia008, 
   stia008_desc LIKE type_t.chr80, 
   stia009 LIKE stia_t.stia009, 
   stia009_desc LIKE type_t.chr80, 
   stia010 LIKE stia_t.stia010, 
   stia010_desc LIKE type_t.chr80, 
   stia011 LIKE stia_t.stia011, 
   stia011_desc LIKE type_t.chr80, 
   stia012 LIKE stia_t.stia012, 
   stia013 LIKE stia_t.stia013, 
   stia014 LIKE stia_t.stia014, 
   stia014_desc LIKE type_t.chr80, 
   stia015 LIKE stia_t.stia015, 
   stia015_desc LIKE type_t.chr80, 
   stia016 LIKE stia_t.stia016, 
   stiaunit LIKE stia_t.stiaunit, 
   stiastus LIKE stia_t.stiastus, 
   stiaownid LIKE stia_t.stiaownid, 
   stiaownid_desc LIKE type_t.chr80, 
   stiaowndp LIKE stia_t.stiaowndp, 
   stiaowndp_desc LIKE type_t.chr80, 
   stiacrtid LIKE stia_t.stiacrtid, 
   stiacrtid_desc LIKE type_t.chr80, 
   stiacrtdp LIKE stia_t.stiacrtdp, 
   stiacrtdp_desc LIKE type_t.chr80, 
   stiacrtdt LIKE stia_t.stiacrtdt, 
   stiamodid LIKE stia_t.stiamodid, 
   stiamodid_desc LIKE type_t.chr80, 
   stiamoddt LIKE stia_t.stiamoddt, 
   stiacnfid LIKE stia_t.stiacnfid, 
   stiacnfid_desc LIKE type_t.chr80, 
   stiacnfdt LIKE stia_t.stiacnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stib_d        RECORD
       stibseq LIKE stib_t.stibseq, 
   stib001 LIKE stib_t.stib001, 
   stib001_desc LIKE type_t.chr500, 
   stib002 LIKE stib_t.stib002, 
   stib009 LIKE stib_t.stib009, 
   stib003 LIKE stib_t.stib003, 
   stib003_desc LIKE type_t.chr500, 
   stib004 LIKE stib_t.stib004, 
   stib004_desc LIKE type_t.chr500, 
   stib005 LIKE stib_t.stib005, 
   stib005_desc LIKE type_t.chr500, 
   stib006 LIKE stib_t.stib006, 
   stib007 LIKE stib_t.stib007, 
   stib008 LIKE stib_t.stib008, 
   stibsite LIKE stib_t.stibsite, 
   stibunit LIKE stib_t.stibunit
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_stiasite LIKE stia_t.stiasite,
   b_stiasite_desc LIKE type_t.chr80,
      b_stiadocdt LIKE stia_t.stiadocdt,
      b_stiadocno LIKE stia_t.stiadocno,
      b_stia001 LIKE stia_t.stia001,
      b_stia002 LIKE stia_t.stia002,
      b_stia003 LIKE stia_t.stia003,
   b_stia003_desc LIKE type_t.chr80,
      b_stia004 LIKE stia_t.stia004,
      b_stia005 LIKE stia_t.stia005,
   b_stia005_desc LIKE type_t.chr80,
      b_stia006 LIKE stia_t.stia006,
   b_stia006_desc LIKE type_t.chr80,
      b_stia007 LIKE stia_t.stia007,
      b_stia008 LIKE stia_t.stia008,
   b_stia008_desc LIKE type_t.chr80,
      b_stia009 LIKE stia_t.stia009,
   b_stia009_desc LIKE type_t.chr80,
      b_stia010 LIKE stia_t.stia010,
   b_stia010_desc LIKE type_t.chr80,
      b_stia011 LIKE stia_t.stia011,
   b_stia011_desc LIKE type_t.chr80,
      b_stia012 LIKE stia_t.stia012,
      b_stia013 LIKE stia_t.stia013,
      b_stia014 LIKE stia_t.stia014,
   b_stia014_desc LIKE type_t.chr80,
      b_stia015 LIKE stia_t.stia015,
   b_stia015_desc LIKE type_t.chr80,
      b_stia016 LIKE stia_t.stia016
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
DEFINE g_site_flag      LIKE type_t.num5
#end add-point
       
#模組變數(Module Variables)
DEFINE g_stia_m          type_g_stia_m
DEFINE g_stia_m_t        type_g_stia_m
DEFINE g_stia_m_o        type_g_stia_m
DEFINE g_stia_m_mask_o   type_g_stia_m #轉換遮罩前資料
DEFINE g_stia_m_mask_n   type_g_stia_m #轉換遮罩後資料
 
   DEFINE g_stiadocno_t LIKE stia_t.stiadocno
 
 
DEFINE g_stib_d          DYNAMIC ARRAY OF type_g_stib_d
DEFINE g_stib_d_t        type_g_stib_d
DEFINE g_stib_d_o        type_g_stib_d
DEFINE g_stib_d_mask_o   DYNAMIC ARRAY OF type_g_stib_d #轉換遮罩前資料
DEFINE g_stib_d_mask_n   DYNAMIC ARRAY OF type_g_stib_d #轉換遮罩後資料
 
 
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
 
{<section id="astt811.main" >}
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
   LET g_forupd_sql = " SELECT stiasite,'',stiadocdt,stiadocno,stia001,stia002,stia003,'',stia004,stia005, 
       '',stia006,'',stia007,stia008,'',stia009,'',stia010,'',stia011,'',stia012,stia013,stia014,'', 
       stia015,'',stia016,stiaunit,stiastus,stiaownid,'',stiaowndp,'',stiacrtid,'',stiacrtdp,'',stiacrtdt, 
       stiamodid,'',stiamoddt,stiacnfid,'',stiacnfdt", 
                      " FROM stia_t",
                      " WHERE stiaent= ? AND stiadocno=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt811_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.stiasite,t0.stiadocdt,t0.stiadocno,t0.stia001,t0.stia002,t0.stia003, 
       t0.stia004,t0.stia005,t0.stia006,t0.stia007,t0.stia008,t0.stia009,t0.stia010,t0.stia011,t0.stia012, 
       t0.stia013,t0.stia014,t0.stia015,t0.stia016,t0.stiaunit,t0.stiastus,t0.stiaownid,t0.stiaowndp, 
       t0.stiacrtid,t0.stiacrtdp,t0.stiacrtdt,t0.stiamodid,t0.stiamoddt,t0.stiacnfid,t0.stiacnfdt,t1.ooefl003 , 
       t2.pmaal004 ,t3.oocql004 ,t4.mhbel003 ,t5.mhaal003 ,t6.mhabl004 ,t7.rtaxl003 ,t8.stael003 ,t9.ooag011 , 
       t10.ooefl003 ,t11.ooag011 ,t12.ooefl003 ,t13.ooag011 ,t14.ooefl003 ,t15.ooag011 ,t16.ooag011", 
 
               " FROM stia_t t0",
                              " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stiasite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stia003 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t3 ON t3.oocqlent="||g_enterprise||" AND t3.oocql001='2002' AND t3.oocql002=t0.stia005 AND t3.oocql003='"||g_dlang||"' ",
               " LEFT JOIN mhbel_t t4 ON t4.mhbelent="||g_enterprise||" AND t4.mhbel001=t0.stia006 AND t4.mhbel002='"||g_dlang||"' ",
               " LEFT JOIN mhaal_t t5 ON t5.mhaalent="||g_enterprise||" AND t5.mhaal001=t0.stia008 AND t5.mhaal002='"||g_dlang||"' ",
               " LEFT JOIN mhabl_t t6 ON t6.mhablent="||g_enterprise||" AND t6.mhabl001=t0.stia008 AND t6.mhabl002=t0.stia009 AND t6.mhabl003='"||g_dlang||"' ",
               " LEFT JOIN rtaxl_t t7 ON t7.rtaxlent="||g_enterprise||" AND t7.rtaxl001=t0.stia010 AND t7.rtaxl002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t8 ON t8.staelent="||g_enterprise||" AND t8.stael001=t0.stia011 AND t8.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.stia014  ",
               " LEFT JOIN ooefl_t t10 ON t10.ooeflent="||g_enterprise||" AND t10.ooefl001=t0.stia015 AND t10.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t11 ON t11.ooagent="||g_enterprise||" AND t11.ooag001=t0.stiaownid  ",
               " LEFT JOIN ooefl_t t12 ON t12.ooeflent="||g_enterprise||" AND t12.ooefl001=t0.stiaowndp AND t12.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t13 ON t13.ooagent="||g_enterprise||" AND t13.ooag001=t0.stiacrtid  ",
               " LEFT JOIN ooefl_t t14 ON t14.ooeflent="||g_enterprise||" AND t14.ooefl001=t0.stiacrtdp AND t14.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t15 ON t15.ooagent="||g_enterprise||" AND t15.ooag001=t0.stiamodid  ",
               " LEFT JOIN ooag_t t16 ON t16.ooagent="||g_enterprise||" AND t16.ooag001=t0.stiacnfid  ",
 
               " WHERE t0.stiaent = " ||g_enterprise|| " AND t0.stiadocno = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE astt811_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt811 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt811_init()   
 
      #進入選單 Menu (="N")
      CALL astt811_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt811
      
   END IF 
   
   CLOSE astt811_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="astt811.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt811_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point    
   #add-point:init段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="init.define"
   DEFINE l_success     LIKE type_t.num5
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
      CALL cl_set_combo_scc_part('stiastus','13','N,Y,A,D,R,W,X')
 
      CALL cl_set_combo_scc('stia001','6907') 
   CALL cl_set_combo_scc('stib009','6020') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
#   CALL cl_set_combo_scc('b_stia001','6907')
   CALL cl_set_combo_scc_part('stia001','6907','2,3')        #160512-00003#8   by 08172
   CALL cl_set_combo_scc_part('b_stia001','6907','2,3')
   LET g_errshow = 1
   CALL s_aooi500_create_temp() RETURNING l_success
   #160421-00013#5 160428 by sakura add(S)
   CALL s_asti800_set_comp_format("stib006",g_site,'2')
   CALL s_asti800_set_comp_format("stib007",g_site,'2')
   CALL s_asti800_set_comp_format("stib008",g_site,'2')
   #160421-00013#5 160428 by sakura add(E)   
   LET g_stia_m.stia001 = '2'  #160512-00003#8   by 08172
   #end add-point
   
   #初始化搜尋條件
   CALL astt811_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt811.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt811_ui_dialog()
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
   DEFINE l_cnt           LIKE type_t.num5
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_stbadocno     LIKE stba_t.stbadocno
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
            CALL astt811_insert()
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
         INITIALIZE g_stia_m.* TO NULL
         CALL g_stib_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astt811_init()
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
               
               CALL astt811_fetch('') # reload data
               LET l_ac = 1
               CALL astt811_ui_detailshow() #Setting the current row 
         
               CALL astt811_idx_chk()
               #NEXT FIELD stibseq
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_stib_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL astt811_idx_chk()
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
               CALL astt811_idx_chk()
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
            CALL astt811_browser_fill("")
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
               CALL astt811_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt811_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt811_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL astt811_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL astt811_set_act_visible()   
            CALL astt811_set_act_no_visible()
            IF NOT (g_stia_m.stiadocno IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " stiaent = " ||g_enterprise|| " AND",
                                  " stiadocno = '", g_stia_m.stiadocno, "' "
 
               #填到對應位置
               CALL astt811_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "stia_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stib_t" 
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
               CALL astt811_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "stia_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "stib_t" 
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
                  CALL astt811_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL astt811_fetch("F")
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
               CALL astt811_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL astt811_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt811_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL astt811_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt811_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL astt811_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt811_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL astt811_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt811_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL astt811_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt811_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_stib_d)
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
               NEXT FIELD stibseq
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
               CALL astt811_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL astt811_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL astt811_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL astt811_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL astt811_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL astt811_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION gen_expense
            LET g_action_choice="gen_expense"
            IF cl_auth_chk_act("gen_expense") THEN
               
               #add-point:ON ACTION gen_expense name="menu.gen_expense"
               IF cl_null(g_stia_m.stiadocno) THEN
                  #尚未選擇欲執行的單據
				      INITIALIZE g_errparam TO NULL
                  LET g_errparam.code   = "amm-00129"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF

               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt
                 FROM stia_t
                WHERE stiaent = g_enterprise
                  AND stiadocno = g_stia_m.stiadocno
                  AND stiastus = 'Y'
               IF l_cnt = 0 THEN
               #意向協議狀態未確認，不可產生費用單！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code   = "ast-00625"
                  LET g_errparam.popup  = TRUE
                  LET g_errparam.replace[1] = g_stia_m.stiadocno
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF               
               
               LET l_cnt = 0
               SELECT COUNT(*) INTO l_cnt
                 FROM stba_t
                WHERE stbaent = g_enterprise
                  AND stba007 = g_stia_m.stiadocno
                  AND stbastus <> 'X'
               IF l_cnt > 0 THEN
			      #已有費用單存在，不可重複產生！
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code   = "ain-00628"
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
                  CONTINUE DIALOG
               END IF               
               CALL s_transaction_begin()
               CALL cl_err_collect_init() 
               
			      #是否產生費用單？
			      IF cl_ask_confirm('ain-00620') THEN
                  LET l_success = TRUE
                  LET l_stbadocno = ''
                  CALL s_expense_astt811(g_stia_m.stiadocno) RETURNING l_success,l_stbadocno
                  IF l_success THEN
                     CALL astt811_stia013_upd(l_stbadocno)
                     CALL s_transaction_end('Y','0')
                     CALL astt811_b_fill()                     
                  ELSE
                     CALL s_transaction_end('N','0')
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00556'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = FALSE
                     CALL cl_err()   
                  END IF
               END IF
               CALL cl_err_collect_show()
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_stia002
            LET g_action_choice="prog_stia002"
            IF cl_auth_chk_act("prog_stia002") THEN
               
               #add-point:ON ACTION prog_stia002 name="menu.prog_stia002"
               #應用 a41 樣板自動產生(Version:3)
               #使用JSON格式組合參數與作業編號(串查)
               INITIALIZE la_param.* TO NULL
               CASE g_stia_m.stia001 
                 WHEN '1'   #1.預登記
                   LET la_param.prog     = 'amht401'
                 WHEN '2'   #2.潛在商戶
                   LET la_param.prog     = 'amht402'
                 OTHERWISE
                   EXIT DIALOG
               END CASE
               LET la_param.param[1] = g_stia_m.stia002

               LET ls_js = util.JSON.stringify(la_param)
               CALL cl_cmdrun_wait(ls_js)
 



               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_stia013
            LET g_action_choice="prog_stia013"
            IF cl_auth_chk_act("prog_stia013") THEN
               
               #add-point:ON ACTION prog_stia013 name="menu.prog_stia013"
               #應用 a41 樣板自動產生(Version:3)
               #使用JSON格式組合參數與作業編號(串查)
               INITIALIZE la_param.* TO NULL
               LET la_param.prog     = 'astt810'
               LET la_param.param[1] = g_stia_m.stia013

               LET ls_js = util.JSON.stringify(la_param)
               CALL cl_cmdrun_wait(ls_js)
 



               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION prog_stia014
            LET g_action_choice="prog_stia014"
            IF cl_auth_chk_act("prog_stia014") THEN
               
               #add-point:ON ACTION prog_stia014 name="menu.prog_stia014"
               #應用 a45 樣板自動產生(Version:3)
               CALL cl_user_contact("aooi130", "ooag_t", "ooag002", "ooag001",g_stia_m.stia014)
 



               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL astt811_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL astt811_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL astt811_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow(g_stia_m.stiadocdt)
 
 
 
         
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
 
{<section id="astt811.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt811_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
   DEFINE l_where           STRING  #161024-00025#12--add
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
   #161024-00025#12----add----begin------------ 
   LET l_where = ''
   CALL s_aooi500_sql_where(g_prog,'stiasite') RETURNING l_where   
   LET l_wc = l_wc," AND ",l_where
   #161024-00025#12----add----end------------ 
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT stiadocno ",
                      " FROM stia_t ",
                      " ",
                      " LEFT JOIN stib_t ON stibent = stiaent AND stiadocno = stibdocno ", "  ",
                      #add-point:browser_fill段sql(stib_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE stiaent = " ||g_enterprise|| " AND stibent = " ||g_enterprise|| " AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("stia_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT stiadocno ",
                      " FROM stia_t ", 
                      "  ",
                      "  ",
                      " WHERE stiaent = " ||g_enterprise|| " AND ",l_wc CLIPPED, cl_sql_add_filter("stia_t")
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
      INITIALIZE g_stia_m.* TO NULL
      CALL g_stib_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.stiasite,t0.stiadocdt,t0.stiadocno,t0.stia001,t0.stia002,t0.stia003,t0.stia004,t0.stia005,t0.stia006,t0.stia007,t0.stia008,t0.stia009,t0.stia010,t0.stia011,t0.stia012,t0.stia013,t0.stia014,t0.stia015,t0.stia016 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stiastus,t0.stiasite,t0.stiadocdt,t0.stiadocno,t0.stia001,t0.stia002, 
          t0.stia003,t0.stia004,t0.stia005,t0.stia006,t0.stia007,t0.stia008,t0.stia009,t0.stia010,t0.stia011, 
          t0.stia012,t0.stia013,t0.stia014,t0.stia015,t0.stia016,t1.ooefl003 ,t2.pmaal003 ,t3.oocql004 , 
          t4.mhbel003 ,t5.mhaal003 ,t6.mhabl004 ,t7.rtaxl003 ,t8.stael003 ,t9.ooag011 ,t10.ooefl003 ", 
 
                  " FROM stia_t t0",
                  "  ",
                  "  LEFT JOIN stib_t ON stibent = stiaent AND stiadocno = stibdocno ", "  ", 
                  #add-point:browser_fill段sql(stib_t1) name="browser_fill.join.stib_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stiasite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stia003 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t3 ON t3.oocqlent="||g_enterprise||" AND t3.oocql001='2002' AND t3.oocql002=t0.stia005 AND t3.oocql003='"||g_dlang||"' ",
               " LEFT JOIN mhbel_t t4 ON t4.mhbelent="||g_enterprise||" AND t4.mhbel001=t0.stia006 AND t4.mhbel002='"||g_dlang||"' ",
               " LEFT JOIN mhaal_t t5 ON t5.mhaalent="||g_enterprise||" AND t5.mhaal001=t0.stia008 AND t5.mhaal002='"||g_dlang||"' ",
               " LEFT JOIN mhabl_t t6 ON t6.mhablent="||g_enterprise||" AND t6.mhabl001=t0.stia008 AND t6.mhabl002=t0.stia009 AND t6.mhabl003='"||g_dlang||"' ",
               " LEFT JOIN rtaxl_t t7 ON t7.rtaxlent="||g_enterprise||" AND t7.rtaxl001=t0.stia010 AND t7.rtaxl002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t8 ON t8.staelent="||g_enterprise||" AND t8.stael001=t0.stia011 AND t8.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.stia014  ",
               " LEFT JOIN ooefl_t t10 ON t10.ooeflent="||g_enterprise||" AND t10.ooefl001=t0.stia015 AND t10.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.stiaent = " ||g_enterprise|| " AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("stia_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.stiastus,t0.stiasite,t0.stiadocdt,t0.stiadocno,t0.stia001,t0.stia002, 
          t0.stia003,t0.stia004,t0.stia005,t0.stia006,t0.stia007,t0.stia008,t0.stia009,t0.stia010,t0.stia011, 
          t0.stia012,t0.stia013,t0.stia014,t0.stia015,t0.stia016,t1.ooefl003 ,t2.pmaal003 ,t3.oocql004 , 
          t4.mhbel003 ,t5.mhaal003 ,t6.mhabl004 ,t7.rtaxl003 ,t8.stael003 ,t9.ooag011 ,t10.ooefl003 ", 
 
                  " FROM stia_t t0",
                  "  ",
                                 " LEFT JOIN ooefl_t t1 ON t1.ooeflent="||g_enterprise||" AND t1.ooefl001=t0.stiasite AND t1.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN pmaal_t t2 ON t2.pmaalent="||g_enterprise||" AND t2.pmaal001=t0.stia003 AND t2.pmaal002='"||g_dlang||"' ",
               " LEFT JOIN oocql_t t3 ON t3.oocqlent="||g_enterprise||" AND t3.oocql001='2002' AND t3.oocql002=t0.stia005 AND t3.oocql003='"||g_dlang||"' ",
               " LEFT JOIN mhbel_t t4 ON t4.mhbelent="||g_enterprise||" AND t4.mhbel001=t0.stia006 AND t4.mhbel002='"||g_dlang||"' ",
               " LEFT JOIN mhaal_t t5 ON t5.mhaalent="||g_enterprise||" AND t5.mhaal001=t0.stia008 AND t5.mhaal002='"||g_dlang||"' ",
               " LEFT JOIN mhabl_t t6 ON t6.mhablent="||g_enterprise||" AND t6.mhabl001=t0.stia008 AND t6.mhabl002=t0.stia009 AND t6.mhabl003='"||g_dlang||"' ",
               " LEFT JOIN rtaxl_t t7 ON t7.rtaxlent="||g_enterprise||" AND t7.rtaxl001=t0.stia010 AND t7.rtaxl002='"||g_dlang||"' ",
               " LEFT JOIN stael_t t8 ON t8.staelent="||g_enterprise||" AND t8.stael001=t0.stia011 AND t8.stael002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t9 ON t9.ooagent="||g_enterprise||" AND t9.ooag001=t0.stia014  ",
               " LEFT JOIN ooefl_t t10 ON t10.ooeflent="||g_enterprise||" AND t10.ooefl001=t0.stia015 AND t10.ooefl002='"||g_dlang||"' ",
 
                  " WHERE t0.stiaent = " ||g_enterprise|| " AND ",l_wc, cl_sql_add_filter("stia_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
   
   #end add-point
   LET g_sql = g_sql, " ORDER BY stiadocno ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
   
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"stia_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
      
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stiasite,g_browser[g_cnt].b_stiadocdt, 
          g_browser[g_cnt].b_stiadocno,g_browser[g_cnt].b_stia001,g_browser[g_cnt].b_stia002,g_browser[g_cnt].b_stia003, 
          g_browser[g_cnt].b_stia004,g_browser[g_cnt].b_stia005,g_browser[g_cnt].b_stia006,g_browser[g_cnt].b_stia007, 
          g_browser[g_cnt].b_stia008,g_browser[g_cnt].b_stia009,g_browser[g_cnt].b_stia010,g_browser[g_cnt].b_stia011, 
          g_browser[g_cnt].b_stia012,g_browser[g_cnt].b_stia013,g_browser[g_cnt].b_stia014,g_browser[g_cnt].b_stia015, 
          g_browser[g_cnt].b_stia016,g_browser[g_cnt].b_stiasite_desc,g_browser[g_cnt].b_stia003_desc, 
          g_browser[g_cnt].b_stia005_desc,g_browser[g_cnt].b_stia006_desc,g_browser[g_cnt].b_stia008_desc, 
          g_browser[g_cnt].b_stia009_desc,g_browser[g_cnt].b_stia010_desc,g_browser[g_cnt].b_stia011_desc, 
          g_browser[g_cnt].b_stia014_desc,g_browser[g_cnt].b_stia015_desc
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
         IF g_browser[g_cnt].b_stia001 = '1' THEN
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_browser[g_cnt].b_stia003
            CALL ap_ref_array2(g_ref_fields,"SELECT mhbgl003 FROM mhbgl_t WHERE mhbglent='"||g_enterprise||"' AND mhbgl001=? AND mhbgl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_browser[g_cnt].b_stia003_desc = '', g_rtn_fields[1] , ''
         ELSE
           CALL s_desc_get_trading_partner_abbr_desc(g_browser[g_cnt].b_stia003) RETURNING g_browser[g_cnt].b_stia003_desc
         END IF
         #end add-point
      
         #遮罩相關處理
         CALL astt811_browser_mask()
      
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
   
   IF cl_null(g_browser[g_cnt].b_stiadocno) THEN
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
 
{<section id="astt811.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt811_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_stia_m.stiadocno = g_browser[g_current_idx].b_stiadocno   
 
   EXECUTE astt811_master_referesh USING g_stia_m.stiadocno INTO g_stia_m.stiasite,g_stia_m.stiadocdt, 
       g_stia_m.stiadocno,g_stia_m.stia001,g_stia_m.stia002,g_stia_m.stia003,g_stia_m.stia004,g_stia_m.stia005, 
       g_stia_m.stia006,g_stia_m.stia007,g_stia_m.stia008,g_stia_m.stia009,g_stia_m.stia010,g_stia_m.stia011, 
       g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014,g_stia_m.stia015,g_stia_m.stia016,g_stia_m.stiaunit, 
       g_stia_m.stiastus,g_stia_m.stiaownid,g_stia_m.stiaowndp,g_stia_m.stiacrtid,g_stia_m.stiacrtdp, 
       g_stia_m.stiacrtdt,g_stia_m.stiamodid,g_stia_m.stiamoddt,g_stia_m.stiacnfid,g_stia_m.stiacnfdt, 
       g_stia_m.stiasite_desc,g_stia_m.stia003_desc,g_stia_m.stia005_desc,g_stia_m.stia006_desc,g_stia_m.stia008_desc, 
       g_stia_m.stia009_desc,g_stia_m.stia010_desc,g_stia_m.stia011_desc,g_stia_m.stia014_desc,g_stia_m.stia015_desc, 
       g_stia_m.stiaownid_desc,g_stia_m.stiaowndp_desc,g_stia_m.stiacrtid_desc,g_stia_m.stiacrtdp_desc, 
       g_stia_m.stiamodid_desc,g_stia_m.stiacnfid_desc
   
   CALL astt811_stia_t_mask()
   CALL astt811_show()
      
END FUNCTION
 
{</section>}
 
{<section id="astt811.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt811_ui_detailshow()
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
 
{<section id="astt811.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt811_ui_browser_refresh()
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
      IF g_browser[l_i].b_stiadocno = g_stia_m.stiadocno 
 
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
 
{<section id="astt811.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt811_construct()
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
   INITIALIZE g_stia_m.* TO NULL
   CALL g_stib_d.clear()        
 
   
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
      CONSTRUCT BY NAME g_wc ON stiasite,stiadocdt,stiadocno,stia001,stia002,stia003,stia004,stia005, 
          stia006,stia007,stia008,stia009,stia010,stia011,stia012,stia013,stia014,stia015,stia016,stiaunit, 
          stiastus,stiaownid,stiaowndp,stiacrtid,stiacrtdp,stiacrtdt,stiamodid,stiamoddt,stiacnfid,stiacnfdt 
 
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<stiacrtdt>>----
         AFTER FIELD stiacrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<stiamoddt>>----
         AFTER FIELD stiamoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stiacnfdt>>----
         AFTER FIELD stiacnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stiapstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.stiasite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiasite
            #add-point:ON ACTION controlp INFIELD stiasite name="construct.c.stiasite"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stiasite',g_site,'ｃ')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stiasite  #顯示到畫面上
            NEXT FIELD stiasite                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiasite
            #add-point:BEFORE FIELD stiasite name="construct.b.stiasite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiasite
            
            #add-point:AFTER FIELD stiasite name="construct.a.stiasite"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiadocdt
            #add-point:BEFORE FIELD stiadocdt name="construct.b.stiadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiadocdt
            
            #add-point:AFTER FIELD stiadocdt name="construct.a.stiadocdt"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stiadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiadocdt
            #add-point:ON ACTION controlp INFIELD stiadocdt name="construct.c.stiadocdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stiadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiadocno
            #add-point:ON ACTION controlp INFIELD stiadocno name="construct.c.stiadocno"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stiadocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stiadocno  #顯示到畫面上
            NEXT FIELD stiadocno                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiadocno
            #add-point:BEFORE FIELD stiadocno name="construct.b.stiadocno"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiadocno
            
            #add-point:AFTER FIELD stiadocno name="construct.a.stiadocno"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia001
            #add-point:BEFORE FIELD stia001 name="construct.b.stia001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia001
            
            #add-point:AFTER FIELD stia001 name="construct.a.stia001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stia001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia001
            #add-point:ON ACTION controlp INFIELD stia001 name="construct.c.stia001"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stia002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia002
            #add-point:ON ACTION controlp INFIELD stia002 name="construct.c.stia002"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "('amht401','amht402')"
            CALL q_mhbgdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stia002  #顯示到畫面上
            NEXT FIELD stia002                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia002
            #add-point:BEFORE FIELD stia002 name="construct.b.stia002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia002
            
            #add-point:AFTER FIELD stia002 name="construct.a.stia002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stia003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia003
            #add-point:ON ACTION controlp INFIELD stia003 name="construct.c.stia003"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #160913-00034#4 -s by 08172
            LET g_qryparam.arg1 = "('3')"
            CALL q_pmaa001_1()
#            CALL q_pmaa001()                           #呼叫開窗
            #160913-00034#4 -e by 08172
            DISPLAY g_qryparam.return1 TO stia003  #顯示到畫面上
            NEXT FIELD stia003                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia003
            #add-point:BEFORE FIELD stia003 name="construct.b.stia003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia003
            
            #add-point:AFTER FIELD stia003 name="construct.a.stia003"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia004
            #add-point:BEFORE FIELD stia004 name="construct.b.stia004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia004
            
            #add-point:AFTER FIELD stia004 name="construct.a.stia004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stia004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia004
            #add-point:ON ACTION controlp INFIELD stia004 name="construct.c.stia004"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stia005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia005
            #add-point:ON ACTION controlp INFIELD stia005 name="construct.c.stia005"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_oocq002_2002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stia005  #顯示到畫面上
            NEXT FIELD stia005                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia005
            #add-point:BEFORE FIELD stia005 name="construct.b.stia005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia005
            
            #add-point:AFTER FIELD stia005 name="construct.a.stia005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stia006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia006
            #add-point:ON ACTION controlp INFIELD stia006 name="construct.c.stia006"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhbc001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stia006  #顯示到畫面上
            NEXT FIELD stia006                     #返回原欄位
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia006
            #add-point:BEFORE FIELD stia006 name="construct.b.stia006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia006
            
            #add-point:AFTER FIELD stia006 name="construct.a.stia006"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia007
            #add-point:BEFORE FIELD stia007 name="construct.b.stia007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia007
            
            #add-point:AFTER FIELD stia007 name="construct.a.stia007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stia007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia007
            #add-point:ON ACTION controlp INFIELD stia007 name="construct.c.stia007"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stia008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia008
            #add-point:ON ACTION controlp INFIELD stia008 name="construct.c.stia008"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stia008  #顯示到畫面上
            NEXT FIELD stia008                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia008
            #add-point:BEFORE FIELD stia008 name="construct.b.stia008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia008
            
            #add-point:AFTER FIELD stia008 name="construct.a.stia008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stia009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia009
            #add-point:ON ACTION controlp INFIELD stia009 name="construct.c.stia009"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhab002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stia009  #顯示到畫面上
            NEXT FIELD stia009                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia009
            #add-point:BEFORE FIELD stia009 name="construct.b.stia009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia009
            
            #add-point:AFTER FIELD stia009 name="construct.a.stia009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stia010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia010
            #add-point:ON ACTION controlp INFIELD stia010 name="construct.c.stia010"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_rtax001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stia010  #顯示到畫面上
            NEXT FIELD stia010                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia010
            #add-point:BEFORE FIELD stia010 name="construct.b.stia010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia010
            
            #add-point:AFTER FIELD stia010 name="construct.a.stia010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stia011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia011
            #add-point:ON ACTION controlp INFIELD stia011 name="construct.c.stia011"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stia011  #顯示到畫面上
            NEXT FIELD stia011                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia011
            #add-point:BEFORE FIELD stia011 name="construct.b.stia011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia011
            
            #add-point:AFTER FIELD stia011 name="construct.a.stia011"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia012
            #add-point:BEFORE FIELD stia012 name="construct.b.stia012"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia012
            
            #add-point:AFTER FIELD stia012 name="construct.a.stia012"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stia012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia012
            #add-point:ON ACTION controlp INFIELD stia012 name="construct.c.stia012"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia013
            #add-point:BEFORE FIELD stia013 name="construct.b.stia013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia013
            
            #add-point:AFTER FIELD stia013 name="construct.a.stia013"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stia013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia013
            #add-point:ON ACTION controlp INFIELD stia013 name="construct.c.stia013"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stia014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia014
            #add-point:ON ACTION controlp INFIELD stia014 name="construct.c.stia014"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stia014  #顯示到畫面上
            NEXT FIELD stia014                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia014
            #add-point:BEFORE FIELD stia014 name="construct.b.stia014"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia014
            
            #add-point:AFTER FIELD stia014 name="construct.a.stia014"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stia015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia015
            #add-point:ON ACTION controlp INFIELD stia015 name="construct.c.stia015"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stia015  #顯示到畫面上
            NEXT FIELD stia015                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia015
            #add-point:BEFORE FIELD stia015 name="construct.b.stia015"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia015
            
            #add-point:AFTER FIELD stia015 name="construct.a.stia015"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia016
            #add-point:BEFORE FIELD stia016 name="construct.b.stia016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia016
            
            #add-point:AFTER FIELD stia016 name="construct.a.stia016"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stia016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia016
            #add-point:ON ACTION controlp INFIELD stia016 name="construct.c.stia016"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiaunit
            #add-point:BEFORE FIELD stiaunit name="construct.b.stiaunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiaunit
            
            #add-point:AFTER FIELD stiaunit name="construct.a.stiaunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stiaunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiaunit
            #add-point:ON ACTION controlp INFIELD stiaunit name="construct.c.stiaunit"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiastus
            #add-point:BEFORE FIELD stiastus name="construct.b.stiastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiastus
            
            #add-point:AFTER FIELD stiastus name="construct.a.stiastus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stiastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiastus
            #add-point:ON ACTION controlp INFIELD stiastus name="construct.c.stiastus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stiaownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiaownid
            #add-point:ON ACTION controlp INFIELD stiaownid name="construct.c.stiaownid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stiaownid  #顯示到畫面上
            NEXT FIELD stiaownid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiaownid
            #add-point:BEFORE FIELD stiaownid name="construct.b.stiaownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiaownid
            
            #add-point:AFTER FIELD stiaownid name="construct.a.stiaownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stiaowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiaowndp
            #add-point:ON ACTION controlp INFIELD stiaowndp name="construct.c.stiaowndp"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stiaowndp  #顯示到畫面上
            NEXT FIELD stiaowndp                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiaowndp
            #add-point:BEFORE FIELD stiaowndp name="construct.b.stiaowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiaowndp
            
            #add-point:AFTER FIELD stiaowndp name="construct.a.stiaowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stiacrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiacrtid
            #add-point:ON ACTION controlp INFIELD stiacrtid name="construct.c.stiacrtid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stiacrtid  #顯示到畫面上
            NEXT FIELD stiacrtid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiacrtid
            #add-point:BEFORE FIELD stiacrtid name="construct.b.stiacrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiacrtid
            
            #add-point:AFTER FIELD stiacrtid name="construct.a.stiacrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stiacrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiacrtdp
            #add-point:ON ACTION controlp INFIELD stiacrtdp name="construct.c.stiacrtdp"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stiacrtdp  #顯示到畫面上
            NEXT FIELD stiacrtdp                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiacrtdp
            #add-point:BEFORE FIELD stiacrtdp name="construct.b.stiacrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiacrtdp
            
            #add-point:AFTER FIELD stiacrtdp name="construct.a.stiacrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiacrtdt
            #add-point:BEFORE FIELD stiacrtdt name="construct.b.stiacrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stiamodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiamodid
            #add-point:ON ACTION controlp INFIELD stiamodid name="construct.c.stiamodid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stiamodid  #顯示到畫面上
            NEXT FIELD stiamodid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiamodid
            #add-point:BEFORE FIELD stiamodid name="construct.b.stiamodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiamodid
            
            #add-point:AFTER FIELD stiamodid name="construct.a.stiamodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiamoddt
            #add-point:BEFORE FIELD stiamoddt name="construct.b.stiamoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stiacnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiacnfid
            #add-point:ON ACTION controlp INFIELD stiacnfid name="construct.c.stiacnfid"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stiacnfid  #顯示到畫面上
            NEXT FIELD stiacnfid                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiacnfid
            #add-point:BEFORE FIELD stiacnfid name="construct.b.stiacnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiacnfid
            
            #add-point:AFTER FIELD stiacnfid name="construct.a.stiacnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiacnfdt
            #add-point:BEFORE FIELD stiacnfdt name="construct.b.stiacnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stibseq,stib001,stib002,stib009,stib003,stib004,stib005,stib006,stib007, 
          stib008,stibsite,stibunit
           FROM s_detail1[1].stibseq,s_detail1[1].stib001,s_detail1[1].stib002,s_detail1[1].stib009, 
               s_detail1[1].stib003,s_detail1[1].stib004,s_detail1[1].stib005,s_detail1[1].stib006,s_detail1[1].stib007, 
               s_detail1[1].stib008,s_detail1[1].stibsite,s_detail1[1].stibunit
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stibseq
            #add-point:BEFORE FIELD stibseq name="construct.b.page1.stibseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stibseq
            
            #add-point:AFTER FIELD stibseq name="construct.a.page1.stibseq"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stibseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stibseq
            #add-point:ON ACTION controlp INFIELD stibseq name="construct.c.page1.stibseq"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stib001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib001
            #add-point:ON ACTION controlp INFIELD stib001 name="construct.c.page1.stib001"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhad001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stib001  #顯示到畫面上
            NEXT FIELD stib001                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib001
            #add-point:BEFORE FIELD stib001 name="construct.b.page1.stib001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib001
            
            #add-point:AFTER FIELD stib001 name="construct.a.page1.stib001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib002
            #add-point:BEFORE FIELD stib002 name="construct.b.page1.stib002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib002
            
            #add-point:AFTER FIELD stib002 name="construct.a.page1.stib002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stib002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib002
            #add-point:ON ACTION controlp INFIELD stib002 name="construct.c.page1.stib002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib009
            #add-point:BEFORE FIELD stib009 name="construct.b.page1.stib009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib009
            
            #add-point:AFTER FIELD stib009 name="construct.a.page1.stib009"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stib009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib009
            #add-point:ON ACTION controlp INFIELD stib009 name="construct.c.page1.stib009"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.stib003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib003
            #add-point:ON ACTION controlp INFIELD stib003 name="construct.c.page1.stib003"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stib003  #顯示到畫面上
            NEXT FIELD stib003                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib003
            #add-point:BEFORE FIELD stib003 name="construct.b.page1.stib003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib003
            
            #add-point:AFTER FIELD stib003 name="construct.a.page1.stib003"
            CALL astt811_stia008_ref(g_stia_m.stia008) RETURNING g_stia_m.stia008_desc
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stib004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib004
            #add-point:ON ACTION controlp INFIELD stib004 name="construct.c.page1.stib004"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhab002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stib004  #顯示到畫面上
            NEXT FIELD stib004                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib004
            #add-point:BEFORE FIELD stib004 name="construct.b.page1.stib004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib004
            
            #add-point:AFTER FIELD stib004 name="construct.a.page1.stib004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stib005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib005
            #add-point:ON ACTION controlp INFIELD stib005 name="construct.c.page1.stib005"
            #應用 a08 樣板自動產生(Version:3)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhac003()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stib005  #顯示到畫面上
            NEXT FIELD stib005                     #返回原欄位
    



            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib005
            #add-point:BEFORE FIELD stib005 name="construct.b.page1.stib005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib005
            
            #add-point:AFTER FIELD stib005 name="construct.a.page1.stib005"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib006
            #add-point:BEFORE FIELD stib006 name="construct.b.page1.stib006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib006
            
            #add-point:AFTER FIELD stib006 name="construct.a.page1.stib006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stib006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib006
            #add-point:ON ACTION controlp INFIELD stib006 name="construct.c.page1.stib006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib007
            #add-point:BEFORE FIELD stib007 name="construct.b.page1.stib007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib007
            
            #add-point:AFTER FIELD stib007 name="construct.a.page1.stib007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stib007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib007
            #add-point:ON ACTION controlp INFIELD stib007 name="construct.c.page1.stib007"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib008
            #add-point:BEFORE FIELD stib008 name="construct.b.page1.stib008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib008
            
            #add-point:AFTER FIELD stib008 name="construct.a.page1.stib008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stib008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib008
            #add-point:ON ACTION controlp INFIELD stib008 name="construct.c.page1.stib008"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stibsite
            #add-point:BEFORE FIELD stibsite name="construct.b.page1.stibsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stibsite
            
            #add-point:AFTER FIELD stibsite name="construct.a.page1.stibsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stibsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stibsite
            #add-point:ON ACTION controlp INFIELD stibsite name="construct.c.page1.stibsite"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stibunit
            #add-point:BEFORE FIELD stibunit name="construct.b.page1.stibunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stibunit
            
            #add-point:AFTER FIELD stibunit name="construct.a.page1.stibunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.stibunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stibunit
            #add-point:ON ACTION controlp INFIELD stibunit name="construct.c.page1.stibunit"
            
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
                  WHEN la_wc[li_idx].tableid = "stia_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "stib_t" 
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
 
{<section id="astt811.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION astt811_filter()
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
      CONSTRUCT g_wc_filter ON stiasite,stiadocdt,stiadocno,stia001,stia002,stia003,stia004,stia005, 
          stia006,stia007,stia008,stia009,stia010,stia011,stia012,stia013,stia014,stia015,stia016
                          FROM s_browse[1].b_stiasite,s_browse[1].b_stiadocdt,s_browse[1].b_stiadocno, 
                              s_browse[1].b_stia001,s_browse[1].b_stia002,s_browse[1].b_stia003,s_browse[1].b_stia004, 
                              s_browse[1].b_stia005,s_browse[1].b_stia006,s_browse[1].b_stia007,s_browse[1].b_stia008, 
                              s_browse[1].b_stia009,s_browse[1].b_stia010,s_browse[1].b_stia011,s_browse[1].b_stia012, 
                              s_browse[1].b_stia013,s_browse[1].b_stia014,s_browse[1].b_stia015,s_browse[1].b_stia016 
 
 
         BEFORE CONSTRUCT
               DISPLAY astt811_filter_parser('stiasite') TO s_browse[1].b_stiasite
            DISPLAY astt811_filter_parser('stiadocdt') TO s_browse[1].b_stiadocdt
            DISPLAY astt811_filter_parser('stiadocno') TO s_browse[1].b_stiadocno
            DISPLAY astt811_filter_parser('stia001') TO s_browse[1].b_stia001
            DISPLAY astt811_filter_parser('stia002') TO s_browse[1].b_stia002
            DISPLAY astt811_filter_parser('stia003') TO s_browse[1].b_stia003
            DISPLAY astt811_filter_parser('stia004') TO s_browse[1].b_stia004
            DISPLAY astt811_filter_parser('stia005') TO s_browse[1].b_stia005
            DISPLAY astt811_filter_parser('stia006') TO s_browse[1].b_stia006
            DISPLAY astt811_filter_parser('stia007') TO s_browse[1].b_stia007
            DISPLAY astt811_filter_parser('stia008') TO s_browse[1].b_stia008
            DISPLAY astt811_filter_parser('stia009') TO s_browse[1].b_stia009
            DISPLAY astt811_filter_parser('stia010') TO s_browse[1].b_stia010
            DISPLAY astt811_filter_parser('stia011') TO s_browse[1].b_stia011
            DISPLAY astt811_filter_parser('stia012') TO s_browse[1].b_stia012
            DISPLAY astt811_filter_parser('stia013') TO s_browse[1].b_stia013
            DISPLAY astt811_filter_parser('stia014') TO s_browse[1].b_stia014
            DISPLAY astt811_filter_parser('stia015') TO s_browse[1].b_stia015
            DISPLAY astt811_filter_parser('stia016') TO s_browse[1].b_stia016
      
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
 
      CALL astt811_filter_show('stiasite')
   CALL astt811_filter_show('stiadocdt')
   CALL astt811_filter_show('stiadocno')
   CALL astt811_filter_show('stia001')
   CALL astt811_filter_show('stia002')
   CALL astt811_filter_show('stia003')
   CALL astt811_filter_show('stia004')
   CALL astt811_filter_show('stia005')
   CALL astt811_filter_show('stia006')
   CALL astt811_filter_show('stia007')
   CALL astt811_filter_show('stia008')
   CALL astt811_filter_show('stia009')
   CALL astt811_filter_show('stia010')
   CALL astt811_filter_show('stia011')
   CALL astt811_filter_show('stia012')
   CALL astt811_filter_show('stia013')
   CALL astt811_filter_show('stia014')
   CALL astt811_filter_show('stia015')
   CALL astt811_filter_show('stia016')
 
END FUNCTION
 
{</section>}
 
{<section id="astt811.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt811_filter_parser(ps_field)
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
 
{<section id="astt811.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt811_filter_show(ps_field)
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
   LET ls_condition = astt811_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astt811.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt811_query()
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
   CALL g_stib_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL astt811_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL astt811_browser_fill("")
      CALL astt811_fetch("")
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
      CALL astt811_filter_show('stiasite')
   CALL astt811_filter_show('stiadocdt')
   CALL astt811_filter_show('stiadocno')
   CALL astt811_filter_show('stia001')
   CALL astt811_filter_show('stia002')
   CALL astt811_filter_show('stia003')
   CALL astt811_filter_show('stia004')
   CALL astt811_filter_show('stia005')
   CALL astt811_filter_show('stia006')
   CALL astt811_filter_show('stia007')
   CALL astt811_filter_show('stia008')
   CALL astt811_filter_show('stia009')
   CALL astt811_filter_show('stia010')
   CALL astt811_filter_show('stia011')
   CALL astt811_filter_show('stia012')
   CALL astt811_filter_show('stia013')
   CALL astt811_filter_show('stia014')
   CALL astt811_filter_show('stia015')
   CALL astt811_filter_show('stia016')
   CALL astt811_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL astt811_fetch("F") 
      #顯示單身筆數
      CALL astt811_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt811.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt811_fetch(p_flag)
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
   
   LET g_stia_m.stiadocno = g_browser[g_current_idx].b_stiadocno
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE astt811_master_referesh USING g_stia_m.stiadocno INTO g_stia_m.stiasite,g_stia_m.stiadocdt, 
       g_stia_m.stiadocno,g_stia_m.stia001,g_stia_m.stia002,g_stia_m.stia003,g_stia_m.stia004,g_stia_m.stia005, 
       g_stia_m.stia006,g_stia_m.stia007,g_stia_m.stia008,g_stia_m.stia009,g_stia_m.stia010,g_stia_m.stia011, 
       g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014,g_stia_m.stia015,g_stia_m.stia016,g_stia_m.stiaunit, 
       g_stia_m.stiastus,g_stia_m.stiaownid,g_stia_m.stiaowndp,g_stia_m.stiacrtid,g_stia_m.stiacrtdp, 
       g_stia_m.stiacrtdt,g_stia_m.stiamodid,g_stia_m.stiamoddt,g_stia_m.stiacnfid,g_stia_m.stiacnfdt, 
       g_stia_m.stiasite_desc,g_stia_m.stia003_desc,g_stia_m.stia005_desc,g_stia_m.stia006_desc,g_stia_m.stia008_desc, 
       g_stia_m.stia009_desc,g_stia_m.stia010_desc,g_stia_m.stia011_desc,g_stia_m.stia014_desc,g_stia_m.stia015_desc, 
       g_stia_m.stiaownid_desc,g_stia_m.stiaowndp_desc,g_stia_m.stiacrtid_desc,g_stia_m.stiacrtdp_desc, 
       g_stia_m.stiamodid_desc,g_stia_m.stiacnfid_desc
   
   #遮罩相關處理
   LET g_stia_m_mask_o.* =  g_stia_m.*
   CALL astt811_stia_t_mask()
   LET g_stia_m_mask_n.* =  g_stia_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt811_set_act_visible()   
   CALL astt811_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
   
   #end add-point
   
   #保存單頭舊值
   LET g_stia_m_t.* = g_stia_m.*
   LET g_stia_m_o.* = g_stia_m.*
   
   LET g_data_owner = g_stia_m.stiaownid      
   LET g_data_dept  = g_stia_m.stiaowndp
   
   #重新顯示   
   CALL astt811_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="astt811.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt811_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
   DEFINE l_success  LIKE type_t.num5
   DEFINE l_doctype  LIKE rtai_t.rtai004
   DEFINE l_insert   LIKE type_t.num5
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stib_d.clear()   
 
 
   INITIALIZE g_stia_m.* TO NULL             #DEFAULT 設定
   
   LET g_stiadocno_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stia_m.stiaownid = g_user
      LET g_stia_m.stiaowndp = g_dept
      LET g_stia_m.stiacrtid = g_user
      LET g_stia_m.stiacrtdp = g_dept 
      LET g_stia_m.stiacrtdt = cl_get_current()
      LET g_stia_m.stiamodid = g_user
      LET g_stia_m.stiamoddt = cl_get_current()
      LET g_stia_m.stiastus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_stia_m.stia001 = "2"
 
  
      #add-point:單頭預設值 name="insert.default"
      #營運組織
      CALL s_aooi500_default(g_prog,'stiasite',g_stia_m.stiasite)
         RETURNING l_insert,g_stia_m.stiasite
      IF NOT l_insert THEN
         RETURN
      END IF
      CALL s_desc_get_department_desc(g_stia_m.stiasite) RETURNING g_stia_m.stiasite_desc
      DISPLAY BY NAME g_stia_m.stiasite_desc
      
      #單據日期
      LET g_stia_m.stiadocdt = g_today
      
      #單別
      CALL s_arti200_get_def_doc_type(g_stia_m.stiasite,g_prog,'1')
         RETURNING l_success,l_doctype
      LET g_stia_m.stiadocno = l_doctype
      DISPLAY BY NAME g_stia_m.stiadocno
      
      #業務人員
      LET g_stia_m.stia014 = g_user
      CALL s_desc_get_person_desc(g_stia_m.stia014) RETURNING g_stia_m.stia014_desc
      DISPLAY BY NAME g_stia_m.stia014_desc
      
      #部門
      LET g_stia_m.stia015 = g_dept
      CALL s_desc_get_department_desc(g_stia_m.stia015) RETURNING g_stia_m.stia015_desc
      DISPLAY BY NAME g_stia_m.stia015_desc
      
      LET g_site_flag = FALSE
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_stia_m_t.* = g_stia_m.*
      LET g_stia_m_o.* = g_stia_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stia_m.stiastus 
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
 
 
 
    
      CALL astt811_input("a")
      
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
         INITIALIZE g_stia_m.* TO NULL
         INITIALIZE g_stib_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL astt811_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_stib_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL astt811_set_act_visible()   
   CALL astt811_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stiadocno_t = g_stia_m.stiadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stiaent = " ||g_enterprise|| " AND",
                      " stiadocno = '", g_stia_m.stiadocno, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt811_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE astt811_cl
   
   CALL astt811_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE astt811_master_referesh USING g_stia_m.stiadocno INTO g_stia_m.stiasite,g_stia_m.stiadocdt, 
       g_stia_m.stiadocno,g_stia_m.stia001,g_stia_m.stia002,g_stia_m.stia003,g_stia_m.stia004,g_stia_m.stia005, 
       g_stia_m.stia006,g_stia_m.stia007,g_stia_m.stia008,g_stia_m.stia009,g_stia_m.stia010,g_stia_m.stia011, 
       g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014,g_stia_m.stia015,g_stia_m.stia016,g_stia_m.stiaunit, 
       g_stia_m.stiastus,g_stia_m.stiaownid,g_stia_m.stiaowndp,g_stia_m.stiacrtid,g_stia_m.stiacrtdp, 
       g_stia_m.stiacrtdt,g_stia_m.stiamodid,g_stia_m.stiamoddt,g_stia_m.stiacnfid,g_stia_m.stiacnfdt, 
       g_stia_m.stiasite_desc,g_stia_m.stia003_desc,g_stia_m.stia005_desc,g_stia_m.stia006_desc,g_stia_m.stia008_desc, 
       g_stia_m.stia009_desc,g_stia_m.stia010_desc,g_stia_m.stia011_desc,g_stia_m.stia014_desc,g_stia_m.stia015_desc, 
       g_stia_m.stiaownid_desc,g_stia_m.stiaowndp_desc,g_stia_m.stiacrtid_desc,g_stia_m.stiacrtdp_desc, 
       g_stia_m.stiamodid_desc,g_stia_m.stiacnfid_desc
   
   
   #遮罩相關處理
   LET g_stia_m_mask_o.* =  g_stia_m.*
   CALL astt811_stia_t_mask()
   LET g_stia_m_mask_n.* =  g_stia_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stia_m.stiasite,g_stia_m.stiasite_desc,g_stia_m.stiadocdt,g_stia_m.stiadocno,g_stia_m.stia001, 
       g_stia_m.stia002,g_stia_m.stia003,g_stia_m.stia003_desc,g_stia_m.stia004,g_stia_m.stia005,g_stia_m.stia005_desc, 
       g_stia_m.stia006,g_stia_m.stia006_desc,g_stia_m.stia007,g_stia_m.stia008,g_stia_m.stia008_desc, 
       g_stia_m.stia009,g_stia_m.stia009_desc,g_stia_m.stia010,g_stia_m.stia010_desc,g_stia_m.stia011, 
       g_stia_m.stia011_desc,g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014,g_stia_m.stia014_desc, 
       g_stia_m.stia015,g_stia_m.stia015_desc,g_stia_m.stia016,g_stia_m.stiaunit,g_stia_m.stiastus,g_stia_m.stiaownid, 
       g_stia_m.stiaownid_desc,g_stia_m.stiaowndp,g_stia_m.stiaowndp_desc,g_stia_m.stiacrtid,g_stia_m.stiacrtid_desc, 
       g_stia_m.stiacrtdp,g_stia_m.stiacrtdp_desc,g_stia_m.stiacrtdt,g_stia_m.stiamodid,g_stia_m.stiamodid_desc, 
       g_stia_m.stiamoddt,g_stia_m.stiacnfid,g_stia_m.stiacnfid_desc,g_stia_m.stiacnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_stia_m.stiaownid      
   LET g_data_dept  = g_stia_m.stiaowndp
   
   #功能已完成,通報訊息中心
   CALL astt811_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="astt811.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt811_modify()
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
   LET g_stia_m_t.* = g_stia_m.*
   LET g_stia_m_o.* = g_stia_m.*
   
   IF g_stia_m.stiadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_stiadocno_t = g_stia_m.stiadocno
 
   CALL s_transaction_begin()
   
   OPEN astt811_cl USING g_enterprise,g_stia_m.stiadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt811_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt811_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt811_master_referesh USING g_stia_m.stiadocno INTO g_stia_m.stiasite,g_stia_m.stiadocdt, 
       g_stia_m.stiadocno,g_stia_m.stia001,g_stia_m.stia002,g_stia_m.stia003,g_stia_m.stia004,g_stia_m.stia005, 
       g_stia_m.stia006,g_stia_m.stia007,g_stia_m.stia008,g_stia_m.stia009,g_stia_m.stia010,g_stia_m.stia011, 
       g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014,g_stia_m.stia015,g_stia_m.stia016,g_stia_m.stiaunit, 
       g_stia_m.stiastus,g_stia_m.stiaownid,g_stia_m.stiaowndp,g_stia_m.stiacrtid,g_stia_m.stiacrtdp, 
       g_stia_m.stiacrtdt,g_stia_m.stiamodid,g_stia_m.stiamoddt,g_stia_m.stiacnfid,g_stia_m.stiacnfdt, 
       g_stia_m.stiasite_desc,g_stia_m.stia003_desc,g_stia_m.stia005_desc,g_stia_m.stia006_desc,g_stia_m.stia008_desc, 
       g_stia_m.stia009_desc,g_stia_m.stia010_desc,g_stia_m.stia011_desc,g_stia_m.stia014_desc,g_stia_m.stia015_desc, 
       g_stia_m.stiaownid_desc,g_stia_m.stiaowndp_desc,g_stia_m.stiacrtid_desc,g_stia_m.stiacrtdp_desc, 
       g_stia_m.stiamodid_desc,g_stia_m.stiacnfid_desc
   
   #檢查是否允許此動作
   IF NOT astt811_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stia_m_mask_o.* =  g_stia_m.*
   CALL astt811_stia_t_mask()
   LET g_stia_m_mask_n.* =  g_stia_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL astt811_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_stiadocno_t = g_stia_m.stiadocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stia_m.stiamodid = g_user 
LET g_stia_m.stiamoddt = cl_get_current()
LET g_stia_m.stiamodid_desc = cl_get_username(g_stia_m.stiamodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      IF g_stia_m.stiastus MATCHES "[DR]" THEN 
         LET g_stia_m.stiastus = "N"
      END IF
      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL astt811_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE stia_t SET (stiamodid,stiamoddt) = (g_stia_m.stiamodid,g_stia_m.stiamoddt)
          WHERE stiaent = g_enterprise AND stiadocno = g_stiadocno_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_stia_m.* = g_stia_m_t.*
            CALL astt811_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_stia_m.stiadocno != g_stia_m_t.stiadocno
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE stib_t SET stibdocno = g_stia_m.stiadocno
 
          WHERE stibent = g_enterprise AND stibdocno = g_stia_m_t.stiadocno
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "stib_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stib_t:",SQLERRMESSAGE 
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
   CALL astt811_set_act_visible()   
   CALL astt811_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " stiaent = " ||g_enterprise|| " AND",
                      " stiadocno = '", g_stia_m.stiadocno, "' "
 
   #填到對應位置
   CALL astt811_browser_fill("")
 
   CLOSE astt811_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt811_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="astt811.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt811_input(p_cmd)
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
   DEFINE  l_success             LIKE type_t.num5
   DEFINE  l_errno               LIKE type_t.chr10
   DEFINE  l_sql                 STRING
   DEFINE  l_where               STRING
   DEFINE  l_mhbf002             LIKE mhbf_t.mhbf002
   DEFINE  l_mhbgdocno             LIKE mhbg_t.mhbgdocno
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
   DISPLAY BY NAME g_stia_m.stiasite,g_stia_m.stiasite_desc,g_stia_m.stiadocdt,g_stia_m.stiadocno,g_stia_m.stia001, 
       g_stia_m.stia002,g_stia_m.stia003,g_stia_m.stia003_desc,g_stia_m.stia004,g_stia_m.stia005,g_stia_m.stia005_desc, 
       g_stia_m.stia006,g_stia_m.stia006_desc,g_stia_m.stia007,g_stia_m.stia008,g_stia_m.stia008_desc, 
       g_stia_m.stia009,g_stia_m.stia009_desc,g_stia_m.stia010,g_stia_m.stia010_desc,g_stia_m.stia011, 
       g_stia_m.stia011_desc,g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014,g_stia_m.stia014_desc, 
       g_stia_m.stia015,g_stia_m.stia015_desc,g_stia_m.stia016,g_stia_m.stiaunit,g_stia_m.stiastus,g_stia_m.stiaownid, 
       g_stia_m.stiaownid_desc,g_stia_m.stiaowndp,g_stia_m.stiaowndp_desc,g_stia_m.stiacrtid,g_stia_m.stiacrtid_desc, 
       g_stia_m.stiacrtdp,g_stia_m.stiacrtdp_desc,g_stia_m.stiacrtdt,g_stia_m.stiamodid,g_stia_m.stiamodid_desc, 
       g_stia_m.stiamoddt,g_stia_m.stiacnfid,g_stia_m.stiacnfid_desc,g_stia_m.stiacnfdt
   
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
   LET g_forupd_sql = "SELECT stibseq,stib001,stib002,stib009,stib003,stib004,stib005,stib006,stib007, 
       stib008,stibsite,stibunit FROM stib_t WHERE stibent=? AND stibdocno=? AND stibseq=? FOR UPDATE" 
 
   #add-point:input段define_sql name="input.after_define_sql"
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE astt811_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt811_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
 
   #end add-point
   CALL astt811_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stia_m.stiasite,g_stia_m.stiadocdt,g_stia_m.stiadocno,g_stia_m.stia001,g_stia_m.stia002, 
       g_stia_m.stia003,g_stia_m.stia004,g_stia_m.stia005,g_stia_m.stia006,g_stia_m.stia007,g_stia_m.stia008, 
       g_stia_m.stia009,g_stia_m.stia010,g_stia_m.stia011,g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014, 
       g_stia_m.stia015,g_stia_m.stia016,g_stia_m.stiaunit,g_stia_m.stiastus
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="astt811.input.head" >}
      #單頭段
      INPUT BY NAME g_stia_m.stiasite,g_stia_m.stiadocdt,g_stia_m.stiadocno,g_stia_m.stia001,g_stia_m.stia002, 
          g_stia_m.stia003,g_stia_m.stia004,g_stia_m.stia005,g_stia_m.stia006,g_stia_m.stia007,g_stia_m.stia008, 
          g_stia_m.stia009,g_stia_m.stia010,g_stia_m.stia011,g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014, 
          g_stia_m.stia015,g_stia_m.stia016,g_stia_m.stiaunit,g_stia_m.stiastus 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN astt811_cl USING g_enterprise,g_stia_m.stiadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt811_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt811_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL astt811_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
 
            #end add-point
            CALL astt811_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiasite
            
            #add-point:AFTER FIELD stiasite name="input.a.stiasite"
            LET g_stia_m.stiasite_desc = ' '
            DISPLAY BY NAME g_stia_m.stiasite_desc
            IF cl_null(g_stia_m.stiasite) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ""
               LET g_errparam.code   = 'sub-00507'
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               LET g_stia_m.stiasite = g_stia_m_t.stiasite
               CALL s_desc_get_department_desc(g_stia_m.stiasite)
                  RETURNING g_stia_m.stiasite_desc
               DISPLAY BY NAME g_stia_m.stiasite_desc
               NEXT FIELD CURRENT
            ELSE
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stia_m.stiasite != g_stia_m_t.stiasite OR g_stia_m_t.stiasite IS NULL )) THEN
                  CALL s_aooi500_chk(g_prog,'stiasite',g_stia_m.stiasite,g_stia_m.stiasite)
                     RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = ''
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     LET g_stia_m.stiasite = g_stia_m_t.stiasite
                     CALL s_desc_get_department_desc(g_stia_m.stiasite)
                        RETURNING g_stia_m.stiasite_desc
                     DISPLAY BY NAME g_stia_m.stiasite_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_site_flag = TRUE
            CALL s_desc_get_department_desc(g_stia_m.stiasite)
               RETURNING g_stia_m.stiasite_desc
            DISPLAY BY NAME g_stia_m.stiasite_desc
            CALL astt811_set_entry(p_cmd)
            CALL astt811_set_no_entry(p_cmd)
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiasite
            #add-point:BEFORE FIELD stiasite name="input.b.stiasite"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stiasite
            #add-point:ON CHANGE stiasite name="input.g.stiasite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiadocdt
            #add-point:BEFORE FIELD stiadocdt name="input.b.stiadocdt"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiadocdt
            
            #add-point:AFTER FIELD stiadocdt name="input.a.stiadocdt"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stiadocdt
            #add-point:ON CHANGE stiadocdt name="input.g.stiadocdt"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiadocno
            #add-point:BEFORE FIELD stiadocno name="input.b.stiadocno"
            LET l_ooef004 = ''
            SELECT ooef004 INTO l_ooef004
              FROM ooef_t
             WHERE ooefent = g_enterprise
               AND ooef001 = g_stia_m.stiasite
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiadocno
            
            #add-point:AFTER FIELD stiadocno name="input.a.stiadocno"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  NOT cl_null(g_stia_m.stiadocno) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stia_m.stiadocno != g_stiadocno_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stia_t WHERE "||"stiaent = '" ||g_enterprise|| "' AND "||"stiadocno = '"||g_stia_m.stiadocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
                  
                  IF NOT s_aooi200_chk_slip(g_stia_m.stiasite,'',g_stia_m.stiadocno,g_prog) THEN
                     #LET g_stia_m.stiadocno = g_stiadocno_t
                     LET g_stia_m.stiadocno = g_stia_m_o.stiadocno
                     NEXT FIELD CURRENT   
                  END IF
               END IF
            END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stiadocno
            #add-point:ON CHANGE stiadocno name="input.g.stiadocno"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia001
            #add-point:BEFORE FIELD stia001 name="input.b.stia001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia001
            
            #add-point:AFTER FIELD stia001 name="input.a.stia001"
            CALL astt811_set_entry(p_cmd)
            CALL astt811_set_no_entry(p_cmd)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia001
            #add-point:ON CHANGE stia001 name="input.g.stia001"
            #來源類型改變時，清空來源單號、商戶編號、商戶連絡電話
            IF g_stia_m.stia001 != g_stia_m_o.stia001 OR cl_null(g_stia_m_o.stia001) THEN
               LET g_stia_m.stia002 = ''
               LET g_stia_m.stia003 = ''
               LET g_stia_m.stia003_desc = ''
               LET g_stia_m.stia004 = ''
            END IF
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia002
            
            #add-point:AFTER FIELD stia002 name="input.a.stia002"
            #IF NOT cl_null(g_stia_m.stia002) THEN
            #   IF g_stia_m.stia002 != g_stia_m_o.stia002 OR cl_null(g_stia_m_o.stia002) THEN
            #      CALL astt811_get_stia003()
            #      CALL astt811_get_oofc012(g_stia_m.stia003) RETURNING g_stia_m.stia004
            #   END IF
            #END IF
            IF NOT cl_null(g_stia_m.stia002) THEN
               IF g_stia_m.stia002 != g_stia_m_o.stia002 OR cl_null(g_stia_m_o.stia002) THEN
                  #分段校驗來源單號
				      CASE g_stia_m.stia001
				        WHEN '1'   #1.預登記
                       INITIALIZE g_chkparam.* TO NULL
                       LET g_chkparam.arg1 = 'amht401'
					        LET g_chkparam.arg2 = g_stia_m.stia002
					        LET g_chkparam.err_str[1] = "ast-00628|",cl_get_progname("amht401",g_lang,"2"),"|:EXEPROGamht401"
					        LET g_chkparam.err_str[2] = "ast-00629|",cl_get_progname("amht401",g_lang,"2"),"|:EXEPROGamht401"
                       IF NOT cl_chk_exist("v_stia002") THEN
                         LET g_stia_m.stia002 = g_stia_m_o.stia002
                         CALL astt811_get_stia003()
                         CALL astt811_get_oofc012(g_stia_m.stia003) RETURNING g_stia_m.stia004                         
                         NEXT FIELD CURRENT                        
                       END IF						 
					     WHEN '2'   #2.潛在商戶
                      INITIALIZE g_chkparam.* TO NULL
                      LET g_chkparam.arg1 = 'amht402'
					       LET g_chkparam.arg2 = g_stia_m.stia002
                      LET g_chkparam.err_str[1] = "ast-00628|",cl_get_progname("amht402",g_lang,"2"),"|:EXEPROGamht402"
                      LET g_chkparam.err_str[2] = "ast-00629|",cl_get_progname("amht402",g_lang,"2"),"|:EXEPROGamht402"
                      IF NOT cl_chk_exist("v_stia002") THEN
                        LET g_stia_m.stia002 = g_stia_m_o.stia002
                        CALL astt811_get_stia003()
                        CALL astt811_get_oofc012(g_stia_m.stia003) RETURNING g_stia_m.stia004                        
                        NEXT FIELD CURRENT                        
                      END IF				
				      END CASE				      
               END IF
            END IF
             CALL astt811_get_stia003()
             CALL astt811_get_oofc012(g_stia_m.stia003) RETURNING g_stia_m.stia004            
            LET g_stia_m_o.stia002 = g_stia_m.stia002            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia002
            #add-point:BEFORE FIELD stia002 name="input.b.stia002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia002
            #add-point:ON CHANGE stia002 name="input.g.stia002"
            LET g_stia_m.stia003 = ''
            LET g_stia_m.stia003_desc = ''
            LET g_stia_m.stia004 = ''
            LET g_stia_m_o.stia003 = g_stia_m.stia003
            LET g_stia_m_o.stia004 = g_stia_m.stia004            
            DISPLAY BY NAME g_stia_m.stia003,g_stia_m.stia003_desc,g_stia_m.stia004
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia003
            
            #add-point:AFTER FIELD stia003 name="input.a.stia003"
            LET g_stia_m.stia003_desc = ' '
            DISPLAY BY NAME g_stia_m.stia003_desc
            IF NOT cl_null(g_stia_m.stia003) THEN
               IF g_stia_m.stia003 != g_stia_m_o.stia003 OR cl_null(g_stia_m_o.stia003) THEN
                  #分段校驗商戶編號
                  #為1.預登記且來源單號不為空值
                  IF g_stia_m.stia001 = '1' AND NOT cl_null(g_stia_m.stia002) THEN
                     CALL astt811_stia003_ref()
                  ELSE
                     #160604-00019#1 Add By Ken 160606(S)
                     #商户类型为2时根据商户带出来源单号同时进行来源单号的检查和带值
                     IF g_stia_m.stia001 = '2' THEN
                        INITIALIZE g_chkparam.* TO NULL
                        LET g_chkparam.arg1 = g_stia_m.stia003
                        LET g_chkparam.arg2 = 'amht402'
                        IF NOT cl_chk_exist("v_mhbg001") THEN
                           LET g_stia_m.stia003 = g_stia_m_o.stia003
                           CALL astt811_stia003_ref1()
                           DISPLAY BY NAME g_stia_m.stia003_desc
                           NEXT FIELD CURRENT
                        END IF   
                        #商户类型为2时根据商户带出来源单号同时进行来源单号的检查和带值
                        LET l_mhbgdocno = ''
                        SELECT mhbgdocno INTO l_mhbgdocno
                          FROM mhbg_t
                         WHERE mhbgent = g_enterprise
                           AND mhbg000 = 'amht402'
                           AND mhbg001 = g_stia_m.stia003
                     
                        LET g_stia_m.stia002 = l_mhbgdocno
                        CALL astt811_get_stia003()
                        CALL astt811_get_oofc012(g_stia_m.stia003) RETURNING g_stia_m.stia004
                      
                        IF NOT cl_null(g_stia_m.stia002) THEN 
                           INITIALIZE g_chkparam.* TO NULL
                           LET g_chkparam.arg1 = 'amht402'
					            LET g_chkparam.arg2 = g_stia_m.stia002
                           LET g_chkparam.err_str[1] = "ast-00628|",cl_get_progname("amht402",g_lang,"2"),"|:EXEPROGamht402"
                           LET g_chkparam.err_str[2] = "ast-00629|",cl_get_progname("amht402",g_lang,"2"),"|:EXEPROGamht402"
                           IF NOT cl_chk_exist("v_stia002") THEN
                             LET g_stia_m.stia002 = g_stia_m_o.stia002
                             CALL astt811_get_stia003()
                             CALL astt811_get_oofc012(g_stia_m.stia003) RETURNING g_stia_m.stia004                        
                             NEXT FIELD CURRENT 
                           ELSE
                              CALL astt811_get_stia003()
                              CALL astt811_get_oofc012(g_stia_m.stia003) RETURNING g_stia_m.stia004            
                              LET g_stia_m_o.stia002 = g_stia_m.stia002 
                           END IF                           
                        END IF                        
                     END IF
                     #
                     IF g_stia_m.stia001 = '3' THEN
                        INITIALIZE g_chkparam.* TO NULL
                        LET g_chkparam.arg1 = g_stia_m.stia003
                        IF NOT cl_chk_exist("v_pmaa001_26") THEN
                           LET g_stia_m.stia003 = g_stia_m_o.stia003
                           CALL s_desc_get_trading_partner_abbr_desc(g_stia_m.stia003) RETURNING g_stia_m.stia003_desc
                           DISPLAY BY NAME g_stia_m.stia003_desc
                           NEXT FIELD CURRENT
                        END IF                      
                     END IF
                     #160604-00019#1 Add By Ken 160606(E)
                  #160604-00019#1 Mark By Ken 160606(S)
                  ##為2.潛在商戶3.正式商戶時，必須存在需存在於[T.交易對象主檔]中，狀態為有效且交易類型=3.交易對象
                  ##或無填寫來源單號
                  #  INITIALIZE g_chkparam.* TO NULL
                  #  LET g_chkparam.arg1 = g_stia_m.stia003
                  #  IF NOT cl_chk_exist("v_pmaa001_26") THEN
                  #     LET g_stia_m.stia003 = g_stia_m_o.stia003
                  #     CALL s_desc_get_trading_partner_abbr_desc(g_stia_m.stia003) RETURNING g_stia_m.stia003_desc
                  #     DISPLAY BY NAME g_stia_m.stia003_desc
                  #     NEXT FIELD CURRENT
                  #  END IF                  
                  #END IF
                  ##商户类型为2时根据商户带出来源单号同时进行来源单号的检查和带值         160512-00003#8
                  #IF g_stia_m.stia001 = '2' THEN
                  #   LET l_mhbgdocno = ''
                  #   SELECT mhbgdocno INTO l_mhbgdocno
                  #     FROM mhbg_t
                  #    WHERE mhbgent = g_enterprise
                  #      AND mhbg000 = 'amht402'
                  #      AND mhbg001 = g_stia_m.stia003
                  #
                  #   LET g_stia_m.stia002 = l_mhbgdocno
                  #   CALL astt811_get_stia003()
                  #   CALL astt811_get_oofc012(g_stia_m.stia003) RETURNING g_stia_m.stia004
                  # 
                  #   IF NOT cl_null(g_stia_m.stia002) THEN 
                  #      INITIALIZE g_chkparam.* TO NULL
                  #      LET g_chkparam.arg1 = 'amht402'
					   #      LET g_chkparam.arg2 = g_stia_m.stia002
                  #      LET g_chkparam.err_str[1] = "ast-00628|",cl_get_progname("amht402",g_lang,"2"),"|:EXEPROGamht402"
                  #      LET g_chkparam.err_str[2] = "ast-00629|",cl_get_progname("amht402",g_lang,"2"),"|:EXEPROGamht402"
                  #      IF NOT cl_chk_exist("v_stia002") THEN
                  #        LET g_stia_m.stia002 = g_stia_m_o.stia002
                  #        CALL astt811_get_stia003()
                  #        CALL astt811_get_oofc012(g_stia_m.stia003) RETURNING g_stia_m.stia004                        
                  #        NEXT FIELD CURRENT 
                  #      ELSE
                  #         CALL astt811_get_stia003()
                  #         CALL astt811_get_oofc012(g_stia_m.stia003) RETURNING g_stia_m.stia004            
                  #         LET g_stia_m_o.stia002 = g_stia_m.stia002 
                  #      END IF                           
                  #   END IF	
                  #160604-00019#1 Mark By Ken 160606(E)                  
                  END IF                   
               END IF
            END IF
            CALL astt811_get_oofc012(g_stia_m.stia003) RETURNING g_stia_m.stia004
            DISPLAY BY NAME g_stia_m.stia004 
            IF g_stia_m.stia001 = '1' THEN
               CALL astt811_stia003_ref()
            ELSE
              #160604-00019#1 Add By Ken 160606(S) 
              IF g_stia_m.stia001 = '2' THEN
                 CALL astt811_stia003_ref1()
              ELSE
              #160604-00019#1 Add By Ken 160606(E) 
                 CALL s_desc_get_trading_partner_abbr_desc(g_stia_m.stia003) RETURNING g_stia_m.stia003_desc
              END IF              
              DISPLAY BY NAME g_stia_m.stia003_desc            
            END IF
            LET g_stia_m_o.stia003 = g_stia_m.stia003
            LET g_stia_m_o.stia004 = g_stia_m.stia004            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia003
            #add-point:BEFORE FIELD stia003 name="input.b.stia003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia003
            #add-point:ON CHANGE stia003 name="input.g.stia003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia004
            #add-point:BEFORE FIELD stia004 name="input.b.stia004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia004
            
            #add-point:AFTER FIELD stia004 name="input.a.stia004"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia004
            #add-point:ON CHANGE stia004 name="input.g.stia004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia005
            
            #add-point:AFTER FIELD stia005 name="input.a.stia005"
            LET g_stia_m.stia005_desc = ''
            DISPLAY BY NAME g_stia_m.stia005_desc
            IF NOT cl_null(g_stia_m.stia005) THEN
               IF g_stia_m.stia005 != g_stia_m_o.stia005 OR cl_null(g_stia_m_o.stia005) THEN
                  IF NOT s_azzi650_chk_exist('2002',g_stia_m.stia005) THEN
                     LET g_stia_m.stia005 = g_stia_m_o.stia005
                     CALL s_desc_get_acc_desc('2002',g_stia_m.stia005) RETURNING g_stia_m.stia005_desc
                     DISPLAY BY NAME g_stia_m.stia005_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_stia_m_o.stia005 = g_stia_m.stia005
            CALL s_desc_get_acc_desc('2002',g_stia_m.stia005) RETURNING g_stia_m.stia005_desc
            DISPLAY BY NAME g_stia_m.stia005_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia005
            #add-point:BEFORE FIELD stia005 name="input.b.stia005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia005
            #add-point:ON CHANGE stia005 name="input.g.stia005"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia006
            
            #add-point:AFTER FIELD stia006 name="input.a.stia006"
            LET g_stia_m.stia006_desc = ' ' 
            DISPLAY BY NAME g_stia_m.stia006_desc
            IF NOT cl_null(g_stia_m.stia006) THEN
               IF g_stia_m.stia006 != g_stia_m_o.stia006 OR cl_null(g_stia_m_t.stia006) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stia_m.stia006
                  LET g_chkparam.err_str[1] = "amh-00630|",g_stia_m.stia006
                  IF NOT cl_chk_exist("v_mhbe001") THEN
                     LET g_stia_m.stia006 = g_stia_m_o.stia006
                     CALL astt811_stia006_ref()
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL astt811_stia006_ref()
            CALL astt811_stia006_default()
            #樓棟
            CALL astt811_stia008_ref(g_stia_m.stia008) RETURNING g_stia_m.stia008_desc
            DISPLAY BY NAME g_stia_m.stia008_desc
            #樓層
            CALL astt811_stia009_ref(g_stia_m.stia008,g_stia_m.stia009) RETURNING g_stia_m.stia009_desc
            DISPLAY BY NAME g_stia_m.stia009_desc
            #品類
            CALL s_desc_get_rtaxl003_desc(g_stia_m.stia010) RETURNING g_stia_m.stia010_desc
            DISPLAY BY NAME g_stia_m.stia010_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia006
            #add-point:BEFORE FIELD stia006 name="input.b.stia006"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia006
            #add-point:ON CHANGE stia006 name="input.g.stia006"
            LET g_stia_m.stia006_desc = ' ' 
            LET g_stia_m.stia007 = ' '
            LET g_stia_m.stia008 = ' '
            LET g_stia_m.stia009 = ' '
            LET g_stia_m.stia010 = ' '
            LET g_stia_m.stia008_desc = ' '
            LET g_stia_m.stia009_desc = ' '
            LET g_stia_m.stia010_desc = ' '
            DISPLAY BY NAME g_stia_m.stia006_desc,g_stia_m.stia007,g_stia_m.stia008,
                            g_stia_m.stia009,g_stia_m.stia010,g_stia_m.stia008_desc,
                            g_stia_m.stia009_desc,g_stia_m.stia010_desc
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia007
            #add-point:BEFORE FIELD stia007 name="input.b.stia007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia007
            
            #add-point:AFTER FIELD stia007 name="input.a.stia007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia007
            #add-point:ON CHANGE stia007 name="input.g.stia007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia008
            
            #add-point:AFTER FIELD stia008 name="input.a.stia008"
            IF NOT cl_null(g_stia_m.stia008) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
 
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stia_m.stia008
               LET g_chkparam.arg2 = '參數2'
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_mhaa001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
 


            END IF 
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stia_m.stia008
            CALL ap_ref_array2(g_ref_fields,"SELECT mhaal003 FROM mhaal_t WHERE mhaalent='"||g_enterprise||"' AND mhaal001=? AND mhaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stia_m.stia008_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stia_m.stia008_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia008
            #add-point:BEFORE FIELD stia008 name="input.b.stia008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia008
            #add-point:ON CHANGE stia008 name="input.g.stia008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia009
            
            #add-point:AFTER FIELD stia009 name="input.a.stia009"
            IF NOT cl_null(g_stia_m.stia009) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
 
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stia_m.stia009
               LET g_chkparam.arg2 = '參數2'
                  
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_mhab002") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
 


            END IF
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia009
            #add-point:BEFORE FIELD stia009 name="input.b.stia009"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia009
            #add-point:ON CHANGE stia009 name="input.g.stia009"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia010
            
            #add-point:AFTER FIELD stia010 name="input.a.stia010"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stia_m.stia010
            CALL ap_ref_array2(g_ref_fields,"SELECT rtaxl003 FROM rtaxl_t WHERE rtaxlent='"||g_enterprise||"' AND rtaxl001=? AND rtaxl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stia_m.stia010_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stia_m.stia010_desc


            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia010
            #add-point:BEFORE FIELD stia010 name="input.b.stia010"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia010
            #add-point:ON CHANGE stia010 name="input.g.stia010"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia011
            
            #add-point:AFTER FIELD stia011 name="input.a.stia011"
            LET g_stia_m.stia011_desc = ' '
            DISPLAY BY NAME g_stia_m.stia011_desc
            IF NOT cl_null(g_stia_m.stia011) THEN
               IF g_stia_m.stia011 != g_stia_m_o.stia011 OR cl_null(g_stia_m_o.stia011) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stia_m.stia011
                  IF NOT cl_chk_exist("v_stae001") THEN
                     LET g_stia_m.stia011 = g_stia_m_o.stia011
                     CALL astt811_stia011_ref()
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL astt811_stia011_ref()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia011
            #add-point:BEFORE FIELD stia011 name="input.b.stia011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia011
            #add-point:ON CHANGE stia011 name="input.g.stia011"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia012
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stia_m.stia012,"0","0","","","azz-00079",1) THEN
               NEXT FIELD stia012
            END IF 
 
 
 
            #add-point:AFTER FIELD stia012 name="input.a.stia012"
 
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia012
            #add-point:BEFORE FIELD stia012 name="input.b.stia012"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia012
            #add-point:ON CHANGE stia012 name="input.g.stia012"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia013
            #add-point:BEFORE FIELD stia013 name="input.b.stia013"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia013
            
            #add-point:AFTER FIELD stia013 name="input.a.stia013"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia013
            #add-point:ON CHANGE stia013 name="input.g.stia013"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia014
            
            #add-point:AFTER FIELD stia014 name="input.a.stia014"
            LET g_stia_m.stia014_desc = ''
            DISPLAY BY NAME g_stia_m.stia014_desc
            IF NOT cl_null(g_stia_m.stia014) THEN
               IF g_stia_m.stia014 != g_stia_m_o.stia014 OR cl_null(g_stia_m_o.stia014) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stia_m.stia014
                  IF cl_chk_exist("v_ooag001") THEN
                     CALL astt811_stia014_def(g_stia_m.stia014) RETURNING g_stia_m.stia015
                     CALL s_desc_get_person_desc(g_stia_m.stia015) RETURNING g_stia_m.stia015_desc
                     DISPLAY BY NAME g_stia_m.stia015_desc   
                  ELSE
                     LET g_stia_m.stia014 = g_stia_m_o.stia014
                     CALL s_desc_get_person_desc(g_stia_m.stia014) RETURNING g_stia_m.stia014_desc
                     DISPLAY BY NAME g_stia_m.stia014_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL s_desc_get_person_desc(g_stia_m.stia014) RETURNING g_stia_m.stia014_desc
            DISPLAY BY NAME g_stia_m.stia014_desc
            LET g_stia_m_o.stia014 = g_stia_m.stia014
            LET g_stia_m_o.stia015 = g_stia_m.stia015
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia014
            #add-point:BEFORE FIELD stia014 name="input.b.stia014"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia014
            #add-point:ON CHANGE stia014 name="input.g.stia014"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia015
            
            #add-point:AFTER FIELD stia015 name="input.a.stia015"
            LET g_stia_m.stia015_desc = ''
            DISPLAY BY NAME g_stia_m.stia015_desc
            IF NOT cl_null(g_stia_m.stia015) THEN
               IF g_stia_m.stia015 != g_stia_m_o.stia015 OR cl_null(g_stia_m_o.stia015) THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stia_m.stia015
                  LET g_chkparam.arg2 = g_stia_m.stiadocdt
                  IF NOT cl_chk_exist("v_ooeg001") THEN
                     LET g_stia_m.stia015 = g_stia_m_t.stia015
                     CALL s_desc_get_department_desc(g_stia_m.stia015) RETURNING g_stia_m.stia015_desc
                     DISPLAY BY NAME g_stia_m.stia015_desc 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL s_desc_get_department_desc(g_stia_m.stia015) RETURNING g_stia_m.stia015_desc
            DISPLAY BY NAME g_stia_m.stia015_desc
            LET g_stia_m_o.stia015 = g_stia_m.stia015
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia015
            #add-point:BEFORE FIELD stia015 name="input.b.stia015"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia015
            #add-point:ON CHANGE stia015 name="input.g.stia015"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stia016
            #add-point:BEFORE FIELD stia016 name="input.b.stia016"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stia016
            
            #add-point:AFTER FIELD stia016 name="input.a.stia016"
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stia_m.stia016
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stia_m.stia015_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stia_m.stia015_desc


            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stia016
            #add-point:ON CHANGE stia016 name="input.g.stia016"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiaunit
            #add-point:BEFORE FIELD stiaunit name="input.b.stiaunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiaunit
            
            #add-point:AFTER FIELD stiaunit name="input.a.stiaunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stiaunit
            #add-point:ON CHANGE stiaunit name="input.g.stiaunit"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stiastus
            #add-point:BEFORE FIELD stiastus name="input.b.stiastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stiastus
            
            #add-point:AFTER FIELD stiastus name="input.a.stiastus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stiastus
            #add-point:ON CHANGE stiastus name="input.g.stiastus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.stiasite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiasite
            #add-point:ON ACTION controlp INFIELD stiasite name="input.c.stiasite"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stia_m.stiasite
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stiasite',g_site,'i')
            CALL q_ooef001_24()
            LET g_stia_m.stiasite = g_qryparam.return1  
            DISPLAY g_stia_m.stiasite TO stiasite
            CALL s_desc_get_department_desc(g_stia_m.stiasite)
               RETURNING g_stia_m.stiasite_desc
            DISPLAY BY NAME g_stia_m.stiasite_desc
            NEXT FIELD stiasite
            #END add-point
 
 
         #Ctrlp:input.c.stiadocdt
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiadocdt
            #add-point:ON ACTION controlp INFIELD stiadocdt name="input.c.stiadocdt"
            
            #END add-point
 
 
         #Ctrlp:input.c.stiadocno
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiadocno
            #add-point:ON ACTION controlp INFIELD stiadocno name="input.c.stiadocno"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stia_m.stiadocno
            
            LET g_qryparam.arg1 = l_ooef004
            LET g_qryparam.arg2 = g_prog
            CALL q_ooba002_1()
            LET g_stia_m.stiadocno = g_qryparam.return1 
            DISPLAY g_stia_m.stiadocno TO stiadocno
            NEXT FIELD stiadocno
            #END add-point
 
 
         #Ctrlp:input.c.stia001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia001
            #add-point:ON ACTION controlp INFIELD stia001 name="input.c.stia001"
            
            #END add-point
 
 
         #Ctrlp:input.c.stia002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia002
            #add-point:ON ACTION controlp INFIELD stia002 name="input.c.stia002"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stia_m.stia002             #給予default值
            CASE g_stia_m.stia001
              WHEN '1'  # 1.預登記
                LET g_qryparam.arg1 = "('amht401')"
              WHEN '2'  #2.潛在商戶
                LET g_qryparam.arg1 = "('amht402')"
            END CASE           
            CALL q_mhbgdocno()
            LET g_stia_m.stia002 = g_qryparam.return1
            DISPLAY g_stia_m.stia002 TO stia002              #
            NEXT FIELD stia002                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stia003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia003
            #add-point:ON ACTION controlp INFIELD stia003 name="input.c.stia003"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stia_m.stia003             #給予default值
            #給予arg
            #160604-00019#1 Add By Ken 160605(S)
            IF g_stia_m.stia001 = '2' THEN
               LET g_qryparam.arg1 = "amht402"
               LET g_qryparam.where = " mhbgstus = 'Y' "               
               CALL q_mhbg001()
            END IF
            #160604-00019#1 Add By Ken 160605(E)
            IF g_stia_m.stia001 = '3' THEN
               LET g_qryparam.arg1 = "('3')"
               CALL q_pmaa001_1()                                #呼叫開窗
            END IF
            LET g_stia_m.stia003 = g_qryparam.return1              
            DISPLAY g_stia_m.stia003 TO stia003              #
            CALL s_desc_get_trading_partner_abbr_desc(g_stia_m.stia003)
               RETURNING g_stia_m.stia003_desc
            DISPLAY BY NAME g_stia_m.stia003_desc            
            NEXT FIELD stia003                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stia004
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia004
            #add-point:ON ACTION controlp INFIELD stia004 name="input.c.stia004"
            
            #END add-point
 
 
         #Ctrlp:input.c.stia005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia005
            #add-point:ON ACTION controlp INFIELD stia005 name="input.c.stia005"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stia_m.stia005             #給予default值
            LET g_qryparam.default2 = "" #g_stia_m.oocq002 #應用分類碼
            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_oocq002_2002()                                #呼叫開窗
 
            LET g_stia_m.stia005 = g_qryparam.return1              
            #LET g_stia_m.oocq002 = g_qryparam.return2 
            DISPLAY g_stia_m.stia005 TO stia005              #
            CALL s_desc_get_acc_desc('2002',g_stia_m.stia005) RETURNING g_stia_m.stia005_desc
            DISPLAY BY NAME g_stia_m.stia005_desc             
            #DISPLAY g_stia_m.oocq002 TO oocq002 #應用分類碼
            NEXT FIELD stia005                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stia006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia006
            #add-point:ON ACTION controlp INFIELD stia006 name="input.c.stia006"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stia_m.stia006             #給予default值
            #給予arg
            LET g_qryparam.arg1 = "" #s
            LET g_qryparam.where = " mhbestus = 'Y' "
            CALL q_mhbc001_1()                                #呼叫開窗
            LET g_stia_m.stia006 = g_qryparam.return1              
            DISPLAY g_stia_m.stia006 TO stia006              #
            NEXT FIELD stia006                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.stia007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia007
            #add-point:ON ACTION controlp INFIELD stia007 name="input.c.stia007"
            
            #END add-point
 
 
         #Ctrlp:input.c.stia008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia008
            #add-point:ON ACTION controlp INFIELD stia008 name="input.c.stia008"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stia_m.stia008             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_mhaa001()                                #呼叫開窗
 
            LET g_stia_m.stia008 = g_qryparam.return1              

            DISPLAY g_stia_m.stia008 TO stia008              #

            NEXT FIELD stia008                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stia009
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia009
            #add-point:ON ACTION controlp INFIELD stia009 name="input.c.stia009"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stia_m.stia009             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_mhab002()                                #呼叫開窗
 
            LET g_stia_m.stia009 = g_qryparam.return1              

            DISPLAY g_stia_m.stia009 TO stia009              #

            NEXT FIELD stia009                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stia010
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia010
            #add-point:ON ACTION controlp INFIELD stia010 name="input.c.stia010"
            
            #END add-point
 
 
         #Ctrlp:input.c.stia011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia011
            #add-point:ON ACTION controlp INFIELD stia011 name="input.c.stia011"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stia_m.stia011             #給予default值
            LET g_qryparam.default2 = "" #g_stia_m.stael003 #說明
            LET g_qryparam.default3 = "" #g_stia_m.stael004 #助記碼
            #給予arg
            CALL q_stae001()                                #呼叫開窗
            LET g_stia_m.stia011 = g_qryparam.return1              
            #LET g_stia_m.stael003 = g_qryparam.return2 
            #LET g_stia_m.stael004 = g_qryparam.return3 
            DISPLAY g_stia_m.stia011 TO stia011              #
            CALL astt811_stia003_ref()
            #DISPLAY g_stia_m.stael003 TO stael003 #說明
            #DISPLAY g_stia_m.stael004 TO stael004 #助記碼
            NEXT FIELD stia011                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stia012
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia012
            #add-point:ON ACTION controlp INFIELD stia012 name="input.c.stia012"
            
            #END add-point
 
 
         #Ctrlp:input.c.stia013
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia013
            #add-point:ON ACTION controlp INFIELD stia013 name="input.c.stia013"
            
            #END add-point
 
 
         #Ctrlp:input.c.stia014
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia014
            #add-point:ON ACTION controlp INFIELD stia014 name="input.c.stia014"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stia_m.stia014             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_ooag001()                                #呼叫開窗
 
            LET g_stia_m.stia014 = g_qryparam.return1              

            DISPLAY g_stia_m.stia014 TO stia014              #

            NEXT FIELD stia014                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stia015
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia015
            #add-point:ON ACTION controlp INFIELD stia015 name="input.c.stia015"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stia_m.stia015             #給予default值
            LET g_qryparam.default2 = "" #g_stia_m.ooeg001 #部門編號
            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_ooeg001()                                #呼叫開窗
 
            LET g_stia_m.stia015 = g_qryparam.return1              
            #LET g_stia_m.ooeg001 = g_qryparam.return2 
            DISPLAY g_stia_m.stia015 TO stia015              #
            #DISPLAY g_stia_m.ooeg001 TO ooeg001 #部門編號
            NEXT FIELD stia015                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.stia016
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stia016
            #add-point:ON ACTION controlp INFIELD stia016 name="input.c.stia016"
            
            #END add-point
 
 
         #Ctrlp:input.c.stiaunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiaunit
            #add-point:ON ACTION controlp INFIELD stiaunit name="input.c.stiaunit"
            
            #END add-point
 
 
         #Ctrlp:input.c.stiastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stiastus
            #add-point:ON ACTION controlp INFIELD stiastus name="input.c.stiastus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_stia_m.stiadocno
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
 
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               LET g_stia_m.stiaunit = g_stia_m.stiasite
               CALL s_aooi200_gen_docno(g_stia_m.stiasite,g_stia_m.stiadocno,g_stia_m.stiadocdt,g_prog)
                  RETURNING l_success,g_stia_m.stiadocno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_stia_m.stiadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD stiadocno           
               END IF
               #end add-point
               
               INSERT INTO stia_t (stiaent,stiasite,stiadocdt,stiadocno,stia001,stia002,stia003,stia004, 
                   stia005,stia006,stia007,stia008,stia009,stia010,stia011,stia012,stia013,stia014,stia015, 
                   stia016,stiaunit,stiastus,stiaownid,stiaowndp,stiacrtid,stiacrtdp,stiacrtdt,stiamodid, 
                   stiamoddt,stiacnfid,stiacnfdt)
               VALUES (g_enterprise,g_stia_m.stiasite,g_stia_m.stiadocdt,g_stia_m.stiadocno,g_stia_m.stia001, 
                   g_stia_m.stia002,g_stia_m.stia003,g_stia_m.stia004,g_stia_m.stia005,g_stia_m.stia006, 
                   g_stia_m.stia007,g_stia_m.stia008,g_stia_m.stia009,g_stia_m.stia010,g_stia_m.stia011, 
                   g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014,g_stia_m.stia015,g_stia_m.stia016, 
                   g_stia_m.stiaunit,g_stia_m.stiastus,g_stia_m.stiaownid,g_stia_m.stiaowndp,g_stia_m.stiacrtid, 
                   g_stia_m.stiacrtdp,g_stia_m.stiacrtdt,g_stia_m.stiamodid,g_stia_m.stiamoddt,g_stia_m.stiacnfid, 
                   g_stia_m.stiacnfdt) 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_stia_m:",SQLERRMESSAGE 
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
                  CALL astt811_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL astt811_b_fill()
                  CALL astt811_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               IF NOT cl_null(g_stia_m.stia006) THEN
                  IF NOT astt811_stibcnt_chk() THEN
                     CALL s_transaction_begin()
                     IF NOT astt811_stib_default() THEN
                        CALL s_transaction_end('N','0')
                     ELSE
                        CALL s_transaction_end('Y','0')
                     END IF
                     CALL astt811_b_fill()
                     LET p_cmd = 'u'
                     LET g_master_insert = TRUE
                     NEXT FIELD stiasite
                  END IF
               END IF
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
               
               #end add-point
               
               #將遮罩欄位還原
               CALL astt811_stia_t_mask_restore('restore_mask_o')
               
               UPDATE stia_t SET (stiasite,stiadocdt,stiadocno,stia001,stia002,stia003,stia004,stia005, 
                   stia006,stia007,stia008,stia009,stia010,stia011,stia012,stia013,stia014,stia015,stia016, 
                   stiaunit,stiastus,stiaownid,stiaowndp,stiacrtid,stiacrtdp,stiacrtdt,stiamodid,stiamoddt, 
                   stiacnfid,stiacnfdt) = (g_stia_m.stiasite,g_stia_m.stiadocdt,g_stia_m.stiadocno,g_stia_m.stia001, 
                   g_stia_m.stia002,g_stia_m.stia003,g_stia_m.stia004,g_stia_m.stia005,g_stia_m.stia006, 
                   g_stia_m.stia007,g_stia_m.stia008,g_stia_m.stia009,g_stia_m.stia010,g_stia_m.stia011, 
                   g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014,g_stia_m.stia015,g_stia_m.stia016, 
                   g_stia_m.stiaunit,g_stia_m.stiastus,g_stia_m.stiaownid,g_stia_m.stiaowndp,g_stia_m.stiacrtid, 
                   g_stia_m.stiacrtdp,g_stia_m.stiacrtdt,g_stia_m.stiamodid,g_stia_m.stiamoddt,g_stia_m.stiacnfid, 
                   g_stia_m.stiacnfdt)
                WHERE stiaent = g_enterprise AND stiadocno = g_stiadocno_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "stia_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL astt811_stia_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_stia_m_t)
               LET g_log2 = util.JSON.stringify(g_stia_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               #160512-00003#8
               IF NOT cl_null(g_stia_m.stia006) THEN
                  IF g_stia_m.stia006 != g_stia_m_t.stia006 OR cl_null(g_stia_m_t.stia006) THEN
                     DELETE FROM stib_t WHERE stibent = g_enterprise AND stibdocno = g_stia_m.stiadocno
                     CALL g_stib_d.clear()
                     IF NOT astt811_stibcnt_chk() THEN
                     CALL s_transaction_begin()
                     IF NOT astt811_stib_default() THEN
                        CALL s_transaction_end('N','0')
                     ELSE
                        CALL s_transaction_end('Y','0')
                     END IF
                     CALL astt811_b_fill()
                     EXIT DIALOG
                  END IF
                  END IF
               END IF
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_stiadocno_t = g_stia_m.stiadocno
 
            
      END INPUT
   
 
{</section>}
 
{<section id="astt811.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stib_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stib_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt811_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_stib_d.getLength()
            #add-point:資料輸入前 name="input.d.before_input"
 
            #end add-point
         
         BEFORE ROW
            #add-point:modify段before row2 name="input.body.before_row2"
            #單頭有輸入鋪位編號控制單身不可新增
            #IF NOT cl_null(g_stia_m.stia006) AND g_rec_b >= l_ac AND g_stib_d[g_detail_idx].stibseq IS NOT NULL THEN
            IF NOT cl_null(g_stia_m.stia006) THEN
               #當鋪位編號不為空時，不可以對單身進行新增動作！
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "ast-00557"
               LET g_errparam.extend = ""
               LET g_errparam.popup = TRUE
               CALL cl_err()               
               NEXT FIELD stiasite
            END IF          
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
            OPEN astt811_cl USING g_enterprise,g_stia_m.stiadocno
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN astt811_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE astt811_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_stib_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stib_d[l_ac].stibseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stib_d_t.* = g_stib_d[l_ac].*  #BACKUP
               LET g_stib_d_o.* = g_stib_d[l_ac].*  #BACKUP
               CALL astt811_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL astt811_set_no_entry_b(l_cmd)
               IF NOT astt811_lock_b("stib_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt811_bcl INTO g_stib_d[l_ac].stibseq,g_stib_d[l_ac].stib001,g_stib_d[l_ac].stib002, 
                      g_stib_d[l_ac].stib009,g_stib_d[l_ac].stib003,g_stib_d[l_ac].stib004,g_stib_d[l_ac].stib005, 
                      g_stib_d[l_ac].stib006,g_stib_d[l_ac].stib007,g_stib_d[l_ac].stib008,g_stib_d[l_ac].stibsite, 
                      g_stib_d[l_ac].stibunit
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_stib_d_t.stibseq,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_stib_d_mask_o[l_ac].* =  g_stib_d[l_ac].*
                  CALL astt811_stib_t_mask()
                  LET g_stib_d_mask_n[l_ac].* =  g_stib_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL astt811_show()
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
            INITIALIZE g_stib_d[l_ac].* TO NULL 
            INITIALIZE g_stib_d_t.* TO NULL 
            INITIALIZE g_stib_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_stib_d[l_ac].stibseq = "0"
      LET g_stib_d[l_ac].stib002 = "0"
      LET g_stib_d[l_ac].stib009 = "0"
      LET g_stib_d[l_ac].stib006 = "0"
      LET g_stib_d[l_ac].stib007 = "0"
      LET g_stib_d[l_ac].stib008 = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            #單頭有輸入鋪位編號控制單身不可新增
            IF NOT cl_null(g_stia_m.stia006) THEN
               #當鋪位編號不為空時，不可以對單身進行新增動作！
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "ast-00557"
               LET g_errparam.extend = ""
               LET g_errparam.popup = TRUE
               CALL cl_err()               
               NEXT FIELD stiasite
            END IF            
            #項次加1
            SELECT MAX(stibseq)+1 INTO g_stib_d[l_ac].stibseq
              FROM stib_t
             WHERE stibent = g_enterprise
               AND stibdocno = g_stia_m.stiadocno
            IF cl_null(g_stib_d[l_ac].stibseq) OR g_stib_d[l_ac].stibseq = 0 THEN
               LET g_stib_d[l_ac].stibseq = 1
            END IF
            #end add-point
            LET g_stib_d_t.* = g_stib_d[l_ac].*     #新輸入資料
            LET g_stib_d_o.* = g_stib_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt811_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL astt811_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stib_d[li_reproduce_target].* = g_stib_d[li_reproduce].*
 
               LET g_stib_d[li_reproduce_target].stibseq = NULL
 
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
            SELECT COUNT(1) INTO l_count FROM stib_t 
             WHERE stibent = g_enterprise AND stibdocno = g_stia_m.stiadocno
 
               AND stibseq = g_stib_d[l_ac].stibseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
               
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stia_m.stiadocno
               LET gs_keys[2] = g_stib_d[g_detail_idx].stibseq
               CALL astt811_insert_b('stib_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_stib_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "stib_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt811_b_fill()
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
               LET gs_keys[01] = g_stia_m.stiadocno
 
               LET gs_keys[gs_keys.getLength()+1] = g_stib_d_t.stibseq
 
            
               #刪除同層單身
               IF NOT astt811_delete_b('stib_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt811_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT astt811_key_delete_b(gs_keys,'stib_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE astt811_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE astt811_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
               
               #end add-point
               LET l_count = g_stib_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
               
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_stib_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stibseq
            #add-point:BEFORE FIELD stibseq name="input.b.page1.stibseq"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stibseq
            
            #add-point:AFTER FIELD stibseq name="input.a.page1.stibseq"
            #應用 a05 樣板自動產生(Version:3)
            #確認資料無重複
            IF  g_stia_m.stiadocno IS NOT NULL AND g_stib_d[g_detail_idx].stibseq IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stia_m.stiadocno != g_stiadocno_t OR g_stib_d[g_detail_idx].stibseq != g_stib_d_t.stibseq)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stib_t WHERE "||"stibent = '" ||g_enterprise|| "' AND "||"stibdocno = '"||g_stia_m.stiadocno ||"' AND "|| "stibseq = '"||g_stib_d[g_detail_idx].stibseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stibseq
            #add-point:ON CHANGE stibseq name="input.g.page1.stibseq"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib001
            
            #add-point:AFTER FIELD stib001 name="input.a.page1.stib001"
            ##確認資料無重複
            IF g_stib_d[l_ac].stib001 IS NOT NULL THEN 
               IF g_stib_d[l_ac].stib001 != g_stib_d_o.stib001 OR cl_null(g_stib_d_o.stib001) THEN
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stib_t WHERE "||"stibent = '" ||g_enterprise|| "' AND "||"stibdocno = '"||g_stia_m.stiadocno ||"' AND "|| "stib001 = '"||g_stib_d[l_ac].stib001 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            IF NOT cl_null(g_stib_d[l_ac].stib001) THEN
               IF g_stib_d[l_ac].stib001 != g_stib_d_o.stib001 OR cl_null(g_stib_d_o.stib001) THEN
                  IF NOT astt811_stib001_chk() THEN
                     LET g_stib_d[l_ac].stib001 = g_stib_d_o.stib001
                     CALL astt811_stib001_ref(g_stib_d[l_ac].stib003,g_stib_d[l_ac].stib004,g_stib_d[l_ac].stib005,g_stib_d[l_ac].stib001) RETURNING g_stib_d[l_ac].stib001_desc
                     NEXT FIELD CURRENT
                  END IF
                  CALL astt811_stib001_default()
               END IF
            END IF
            CALL astt811_stib001_ref(g_stib_d[l_ac].stib003,g_stib_d[l_ac].stib004,g_stib_d[l_ac].stib005,g_stib_d[l_ac].stib001) RETURNING g_stib_d[l_ac].stib001_desc
            CALL astt811_stia008_ref(g_stib_d[l_ac].stib003) RETURNING g_stib_d[l_ac].stib003_desc
            CALL astt811_stia009_ref(g_stib_d[l_ac].stib003,g_stib_d[l_ac].stib004) RETURNING g_stib_d[l_ac].stib004_desc
            CALL astt811_stib005_ref(g_stib_d[l_ac].stib003,g_stib_d[l_ac].stib004,g_stib_d[l_ac].stib005) RETURNING g_stib_d[l_ac].stib005_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib001
            #add-point:BEFORE FIELD stib001 name="input.b.page1.stib001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stib001
            #add-point:ON CHANGE stib001 name="input.g.page1.stib001"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib002
            #add-point:BEFORE FIELD stib002 name="input.b.page1.stib002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib002
            
            #add-point:AFTER FIELD stib002 name="input.a.page1.stib002"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stib002
            #add-point:ON CHANGE stib002 name="input.g.page1.stib002"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib009
            #add-point:BEFORE FIELD stib009 name="input.b.page1.stib009"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib009
            
            #add-point:AFTER FIELD stib009 name="input.a.page1.stib009"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stib009
            #add-point:ON CHANGE stib009 name="input.g.page1.stib009"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib003
            
            #add-point:AFTER FIELD stib003 name="input.a.page1.stib003"
            IF NOT cl_null(g_stib_d[l_ac].stib003) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
                #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stib_d[l_ac].stib003
               LET g_chkparam.arg2 = '參數2'               
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_mhaa001") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            END IF
            CALL astt811_stia008_ref(g_stib_d[l_ac].stib003) RETURNING g_stib_d[l_ac].stib003_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib003
            #add-point:BEFORE FIELD stib003 name="input.b.page1.stib003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stib003
            #add-point:ON CHANGE stib003 name="input.g.page1.stib003"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib004
            
            #add-point:AFTER FIELD stib004 name="input.a.page1.stib004"
            IF NOT cl_null(g_stib_d[l_ac].stib004) THEN 
#應用 a17 樣板自動產生(Version:3)
               #欄位存在檢查
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stib_d[l_ac].stib004
               LET g_chkparam.arg2 = '參數2'
               #呼叫檢查存在並帶值的library
               IF cl_chk_exist("v_mhab002") THEN
                  #檢查成功時後續處理
               ELSE
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF
            END IF 
            CALL astt811_stia009_ref(g_stib_d[l_ac].stib003,g_stib_d[l_ac].stib004) RETURNING g_stib_d[l_ac].stib004_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib004
            #add-point:BEFORE FIELD stib004 name="input.b.page1.stib004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stib004
            #add-point:ON CHANGE stib004 name="input.g.page1.stib004"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib005
            
            #add-point:AFTER FIELD stib005 name="input.a.page1.stib005"
            CALL astt811_stib005_ref(g_stib_d[l_ac].stib003,g_stib_d[l_ac].stib004,g_stib_d[l_ac].stib005) RETURNING g_stib_d[l_ac].stib005_desc
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib005
            #add-point:BEFORE FIELD stib005 name="input.b.page1.stib005"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stib005
            #add-point:ON CHANGE stib005 name="input.g.page1.stib005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib006
            #add-point:BEFORE FIELD stib006 name="input.b.page1.stib006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib006
            
            #add-point:AFTER FIELD stib006 name="input.a.page1.stib006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stib006
            #add-point:ON CHANGE stib006 name="input.g.page1.stib006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib007
            #add-point:BEFORE FIELD stib007 name="input.b.page1.stib007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib007
            
            #add-point:AFTER FIELD stib007 name="input.a.page1.stib007"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stib007
            #add-point:ON CHANGE stib007 name="input.g.page1.stib007"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stib008
            #add-point:BEFORE FIELD stib008 name="input.b.page1.stib008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stib008
            
            #add-point:AFTER FIELD stib008 name="input.a.page1.stib008"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stib008
            #add-point:ON CHANGE stib008 name="input.g.page1.stib008"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stibsite
            #add-point:BEFORE FIELD stibsite name="input.b.page1.stibsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stibsite
            
            #add-point:AFTER FIELD stibsite name="input.a.page1.stibsite"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stibsite
            #add-point:ON CHANGE stibsite name="input.g.page1.stibsite"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stibunit
            #add-point:BEFORE FIELD stibunit name="input.b.page1.stibunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stibunit
            
            #add-point:AFTER FIELD stibunit name="input.a.page1.stibunit"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stibunit
            #add-point:ON CHANGE stibunit name="input.g.page1.stibunit"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.stibseq
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stibseq
            #add-point:ON ACTION controlp INFIELD stibseq name="input.c.page1.stibseq"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stib001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib001
            #add-point:ON ACTION controlp INFIELD stib001 name="input.c.page1.stib001"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stib_d[l_ac].stib001             #給予default值
            CALL q_mhad001()                                #呼叫開窗
            LET g_stib_d[l_ac].stib001 = g_qryparam.return1              
            DISPLAY g_stib_d[l_ac].stib001 TO stib001              #
            NEXT FIELD stib001                          #返回原欄位
            #END add-point
 
 
         #Ctrlp:input.c.page1.stib002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib002
            #add-point:ON ACTION controlp INFIELD stib002 name="input.c.page1.stib002"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stib009
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib009
            #add-point:ON ACTION controlp INFIELD stib009 name="input.c.page1.stib009"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stib003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib003
            #add-point:ON ACTION controlp INFIELD stib003 name="input.c.page1.stib003"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stib_d[l_ac].stib003             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_mhaa001()                                #呼叫開窗
 
            LET g_stib_d[l_ac].stib003 = g_qryparam.return1              

            DISPLAY g_stib_d[l_ac].stib003 TO stib003              #

            NEXT FIELD stib003                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.stib004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib004
            #add-point:ON ACTION controlp INFIELD stib004 name="input.c.page1.stib004"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stib_d[l_ac].stib004             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_mhab002()                                #呼叫開窗
 
            LET g_stib_d[l_ac].stib004 = g_qryparam.return1              

            DISPLAY g_stib_d[l_ac].stib004 TO stib004              #

            NEXT FIELD stib004                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.stib005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib005
            #add-point:ON ACTION controlp INFIELD stib005 name="input.c.page1.stib005"
            #應用 a07 樣板自動產生(Version:3)   
            #開窗i段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
 
            LET g_qryparam.default1 = g_stib_d[l_ac].stib005             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "" #s

 
            CALL q_mhac003()                                #呼叫開窗
 
            LET g_stib_d[l_ac].stib005 = g_qryparam.return1              

            DISPLAY g_stib_d[l_ac].stib005 TO stib005              #

            NEXT FIELD stib005                          #返回原欄位



            #END add-point
 
 
         #Ctrlp:input.c.page1.stib006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib006
            #add-point:ON ACTION controlp INFIELD stib006 name="input.c.page1.stib006"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stib007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib007
            #add-point:ON ACTION controlp INFIELD stib007 name="input.c.page1.stib007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stib008
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stib008
            #add-point:ON ACTION controlp INFIELD stib008 name="input.c.page1.stib008"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stibsite
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stibsite
            #add-point:ON ACTION controlp INFIELD stibsite name="input.c.page1.stibsite"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.stibunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stibunit
            #add-point:ON ACTION controlp INFIELD stibunit name="input.c.page1.stibunit"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_stib_d[l_ac].* = g_stib_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE astt811_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_stib_d[l_ac].stibseq 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_stib_d[l_ac].* = g_stib_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL astt811_stib_t_mask_restore('restore_mask_o')
      
               UPDATE stib_t SET (stibdocno,stibseq,stib001,stib002,stib009,stib003,stib004,stib005, 
                   stib006,stib007,stib008,stibsite,stibunit) = (g_stia_m.stiadocno,g_stib_d[l_ac].stibseq, 
                   g_stib_d[l_ac].stib001,g_stib_d[l_ac].stib002,g_stib_d[l_ac].stib009,g_stib_d[l_ac].stib003, 
                   g_stib_d[l_ac].stib004,g_stib_d[l_ac].stib005,g_stib_d[l_ac].stib006,g_stib_d[l_ac].stib007, 
                   g_stib_d[l_ac].stib008,g_stib_d[l_ac].stibsite,g_stib_d[l_ac].stibunit)
                WHERE stibent = g_enterprise AND stibdocno = g_stia_m.stiadocno 
 
                  AND stibseq = g_stib_d_t.stibseq #項次   
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_stib_d[l_ac].* = g_stib_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stib_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_stib_d[l_ac].* = g_stib_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "stib_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stia_m.stiadocno
               LET gs_keys_bak[1] = g_stiadocno_t
               LET gs_keys[2] = g_stib_d[g_detail_idx].stibseq
               LET gs_keys_bak[2] = g_stib_d_t.stibseq
               CALL astt811_update_b('stib_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL astt811_stib_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_stib_d[g_detail_idx].stibseq = g_stib_d_t.stibseq 
 
                  ) THEN
                  LET gs_keys[01] = g_stia_m.stiadocno
 
                  LET gs_keys[gs_keys.getLength()+1] = g_stib_d_t.stibseq
 
                  CALL astt811_key_update_b(gs_keys,'stib_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_stia_m),util.JSON.stringify(g_stib_d_t)
               LET g_log2 = util.JSON.stringify(g_stia_m),util.JSON.stringify(g_stib_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
            
            #end add-point
            CALL astt811_unlock_b("stib_t","'1'")
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
               LET g_stib_d[li_reproduce_target].* = g_stib_d[li_reproduce].*
 
               LET g_stib_d[li_reproduce_target].stibseq = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_stib_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_stib_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="astt811.input.other" >}
      
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
            NEXT FIELD stiasite
            #end add-point  
            NEXT FIELD stiadocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stibseq
 
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
 
{<section id="astt811.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt811_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
   
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL astt811_b_fill() #單身填充
      CALL astt811_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL astt811_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   
   #end add-point
   
   #遮罩相關處理
   LET g_stia_m_mask_o.* =  g_stia_m.*
   CALL astt811_stia_t_mask()
   LET g_stia_m_mask_n.* =  g_stia_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stia_m.stiasite,g_stia_m.stiasite_desc,g_stia_m.stiadocdt,g_stia_m.stiadocno,g_stia_m.stia001, 
       g_stia_m.stia002,g_stia_m.stia003,g_stia_m.stia003_desc,g_stia_m.stia004,g_stia_m.stia005,g_stia_m.stia005_desc, 
       g_stia_m.stia006,g_stia_m.stia006_desc,g_stia_m.stia007,g_stia_m.stia008,g_stia_m.stia008_desc, 
       g_stia_m.stia009,g_stia_m.stia009_desc,g_stia_m.stia010,g_stia_m.stia010_desc,g_stia_m.stia011, 
       g_stia_m.stia011_desc,g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014,g_stia_m.stia014_desc, 
       g_stia_m.stia015,g_stia_m.stia015_desc,g_stia_m.stia016,g_stia_m.stiaunit,g_stia_m.stiastus,g_stia_m.stiaownid, 
       g_stia_m.stiaownid_desc,g_stia_m.stiaowndp,g_stia_m.stiaowndp_desc,g_stia_m.stiacrtid,g_stia_m.stiacrtid_desc, 
       g_stia_m.stiacrtdp,g_stia_m.stiacrtdp_desc,g_stia_m.stiacrtdt,g_stia_m.stiamodid,g_stia_m.stiamodid_desc, 
       g_stia_m.stiamoddt,g_stia_m.stiacnfid,g_stia_m.stiacnfid_desc,g_stia_m.stiacnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stia_m.stiastus 
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
   FOR l_ac = 1 TO g_stib_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
      
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt811_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt811.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION astt811_detail_show()
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
 
{<section id="astt811.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt811_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE stia_t.stiadocno 
   DEFINE l_oldno     LIKE stia_t.stiadocno 
 
   DEFINE l_master    RECORD LIKE stia_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE stib_t.* #此變數樣板目前無使用
 
 
   DEFINE l_cnt       LIKE type_t.num10
   #add-point:reproduce段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="reproduce.define"
   DEFINE l_success  LIKE type_t.num5
   DEFINE l_doctype  LIKE rtai_t.rtai004
   DEFINE l_insert   LIKE type_t.num5
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
   
   IF g_stia_m.stiadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_stiadocno_t = g_stia_m.stiadocno
 
    
   LET g_stia_m.stiadocno = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_stia_m.stiaownid = g_user
      LET g_stia_m.stiaowndp = g_dept
      LET g_stia_m.stiacrtid = g_user
      LET g_stia_m.stiacrtdp = g_dept 
      LET g_stia_m.stiacrtdt = cl_get_current()
      LET g_stia_m.stiamodid = g_user
      LET g_stia_m.stiamoddt = cl_get_current()
      LET g_stia_m.stiastus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
   #營運組織
   CALL s_aooi500_default(g_prog,'stiasite',g_stia_m.stiasite)
      RETURNING l_insert,g_stia_m.stiasite
   IF NOT l_insert THEN
      RETURN
   END IF
   CALL s_desc_get_department_desc(g_stia_m.stiasite) RETURNING g_stia_m.stiasite_desc
   DISPLAY BY NAME g_stia_m.stiasite_desc
   
   #單據日期
   LET g_stia_m.stiadocdt = g_today
   
   #單別
   CALL s_arti200_get_def_doc_type(g_stia_m.stiasite,g_prog,'1')
      RETURNING l_success,l_doctype
   LET g_stia_m.stiadocno = l_doctype
   DISPLAY BY NAME g_stia_m.stiadocno
   
   #業務人員
   LET g_stia_m.stia014 = g_user
   CALL s_desc_get_person_desc(g_stia_m.stia014) RETURNING g_stia_m.stia014_desc
   DISPLAY BY NAME g_stia_m.stia014_desc
   
   #部門
   LET g_stia_m.stia015 = g_dept
   CALL s_desc_get_department_desc(g_stia_m.stia015) RETURNING g_stia_m.stia015_desc
   DISPLAY BY NAME g_stia_m.stia015_desc
   
   #清除費用單號/確認人員/確認日期
   LET g_stia_m.stia013 = NULL
   LET g_stia_m.stiacnfid = NULL
   LET g_stia_m.stiacnfdt = NULL
   
   LET g_site_flag = FALSE
   LET g_stia_m_t.* = g_stia_m.*
   LET g_stia_m_o.* = g_stia_m.*
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_stia_m.stiastus 
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
   
   
   CALL astt811_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_stia_m.* TO NULL
      INITIALIZE g_stib_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL astt811_show()
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
   CALL astt811_set_act_visible()   
   CALL astt811_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_stiadocno_t = g_stia_m.stiadocno
 
   
   #組合新增資料的條件
   LET g_add_browse = " stiaent = " ||g_enterprise|| " AND",
                      " stiadocno = '", g_stia_m.stiadocno, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL astt811_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL astt811_idx_chk()
   
   LET g_data_owner = g_stia_m.stiaownid      
   LET g_data_dept  = g_stia_m.stiaowndp
   
   #功能已完成,通報訊息中心
   CALL astt811_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="astt811.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt811_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stib_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
   
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt811_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM stib_t
    WHERE stibent = g_enterprise AND stibdocno = g_stiadocno_t
 
    INTO TEMP astt811_detail
 
   #將key修正為調整後   
   UPDATE astt811_detail 
      #更新key欄位
      SET stibdocno = g_stia_m.stiadocno
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO stib_t SELECT * FROM astt811_detail
   
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
   DROP TABLE astt811_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stiadocno_t = g_stia_m.stiadocno
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt811.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt811_delete()
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
   
   IF g_stia_m.stiadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN astt811_cl USING g_enterprise,g_stia_m.stiadocno
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt811_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE astt811_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE astt811_master_referesh USING g_stia_m.stiadocno INTO g_stia_m.stiasite,g_stia_m.stiadocdt, 
       g_stia_m.stiadocno,g_stia_m.stia001,g_stia_m.stia002,g_stia_m.stia003,g_stia_m.stia004,g_stia_m.stia005, 
       g_stia_m.stia006,g_stia_m.stia007,g_stia_m.stia008,g_stia_m.stia009,g_stia_m.stia010,g_stia_m.stia011, 
       g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014,g_stia_m.stia015,g_stia_m.stia016,g_stia_m.stiaunit, 
       g_stia_m.stiastus,g_stia_m.stiaownid,g_stia_m.stiaowndp,g_stia_m.stiacrtid,g_stia_m.stiacrtdp, 
       g_stia_m.stiacrtdt,g_stia_m.stiamodid,g_stia_m.stiamoddt,g_stia_m.stiacnfid,g_stia_m.stiacnfdt, 
       g_stia_m.stiasite_desc,g_stia_m.stia003_desc,g_stia_m.stia005_desc,g_stia_m.stia006_desc,g_stia_m.stia008_desc, 
       g_stia_m.stia009_desc,g_stia_m.stia010_desc,g_stia_m.stia011_desc,g_stia_m.stia014_desc,g_stia_m.stia015_desc, 
       g_stia_m.stiaownid_desc,g_stia_m.stiaowndp_desc,g_stia_m.stiacrtid_desc,g_stia_m.stiacrtdp_desc, 
       g_stia_m.stiamodid_desc,g_stia_m.stiacnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT astt811_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_stia_m_mask_o.* =  g_stia_m.*
   CALL astt811_stia_t_mask()
   LET g_stia_m_mask_n.* =  g_stia_m.*
   
   CALL astt811_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL astt811_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_stiadocno_t = g_stia_m.stiadocno
 
 
      DELETE FROM stia_t
       WHERE stiaent = g_enterprise AND stiadocno = g_stia_m.stiadocno
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_stia_m.stiadocno,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      IF NOT s_aooi200_del_docno(g_stia_m.stiadocno,g_stia_m.stiadocdt) THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
      
      #end add-point
      
      DELETE FROM stib_t
       WHERE stibent = g_enterprise AND stibdocno = g_stia_m.stiadocno
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
      
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stib_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
      
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_stia_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE astt811_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_stib_d.clear() 
 
     
      CALL astt811_ui_browser_refresh()  
      #CALL astt811_ui_headershow()  
      #CALL astt811_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL astt811_browser_fill("")
         CALL astt811_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt811_cl
 
   #功能已完成,通報訊息中心
   CALL astt811_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="astt811.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt811_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_stib_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   
   #end add-point
   
   #判斷是否填充
   IF astt811_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT stibseq,stib001,stib002,stib009,stib003,stib004,stib005,stib006, 
             stib007,stib008,stibsite,stibunit ,t1.mhadl006 ,t2.mhaal003 ,t3.mhabl004 ,t4.mhacl005 FROM stib_t", 
                
                     " INNER JOIN stia_t ON stiaent = " ||g_enterprise|| " AND stiadocno = stibdocno ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN mhadl_t t1 ON t1.mhadlent="||g_enterprise||" AND t1.mhadl001=stib003 AND t1.mhadl002=stib004 AND t1.mhadl003=stib005 AND t1.mhadl004=stib001 AND t1.mhadl005='"||g_dlang||"' ",
               " LEFT JOIN mhaal_t t2 ON t2.mhaalent="||g_enterprise||" AND t2.mhaal001=stib003 AND t2.mhaal002='"||g_dlang||"' ",
               " LEFT JOIN mhabl_t t3 ON t3.mhablent="||g_enterprise||" AND t3.mhabl001=stib003 AND t3.mhabl002=stib004 AND t3.mhabl003='"||g_dlang||"' ",
               " LEFT JOIN mhacl_t t4 ON t4.mhaclent="||g_enterprise||" AND t4.mhacl001=stib003 AND t4.mhacl002=stib004 AND t4.mhacl003=stib005 AND t4.mhacl004='"||g_dlang||"' ",
 
                     " WHERE stibent=? AND stibdocno=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
         
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY stib_t.stibseq"
         
         #add-point:單身填充控制 name="b_fill.sql"
        
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astt811_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR astt811_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise,g_stia_m.stiadocno   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise,g_stia_m.stiadocno INTO g_stib_d[l_ac].stibseq,g_stib_d[l_ac].stib001, 
          g_stib_d[l_ac].stib002,g_stib_d[l_ac].stib009,g_stib_d[l_ac].stib003,g_stib_d[l_ac].stib004, 
          g_stib_d[l_ac].stib005,g_stib_d[l_ac].stib006,g_stib_d[l_ac].stib007,g_stib_d[l_ac].stib008, 
          g_stib_d[l_ac].stibsite,g_stib_d[l_ac].stibunit,g_stib_d[l_ac].stib001_desc,g_stib_d[l_ac].stib003_desc, 
          g_stib_d[l_ac].stib004_desc,g_stib_d[l_ac].stib005_desc   #(ver:78)
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
   
   CALL g_stib_d.deleteElement(g_stib_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt811_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_stib_d.getLength()
      LET g_stib_d_mask_o[l_ac].* =  g_stib_d[l_ac].*
      CALL astt811_stib_t_mask()
      LET g_stib_d_mask_n[l_ac].* =  g_stib_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="astt811.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt811_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stib_t
       WHERE stibent = g_enterprise AND
         stibdocno = ps_keys_bak[1] AND stibseq = ps_keys_bak[2]
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
         CALL g_stib_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt811.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt811_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stib_t
                  (stibent,
                   stibdocno,
                   stibseq
                   ,stib001,stib002,stib009,stib003,stib004,stib005,stib006,stib007,stib008,stibsite,stibunit) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stib_d[g_detail_idx].stib001,g_stib_d[g_detail_idx].stib002,g_stib_d[g_detail_idx].stib009, 
                       g_stib_d[g_detail_idx].stib003,g_stib_d[g_detail_idx].stib004,g_stib_d[g_detail_idx].stib005, 
                       g_stib_d[g_detail_idx].stib006,g_stib_d[g_detail_idx].stib007,g_stib_d[g_detail_idx].stib008, 
                       g_stib_d[g_detail_idx].stibsite,g_stib_d[g_detail_idx].stibunit)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "stib_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_stib_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astt811.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt811_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stib_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL astt811_stib_t_mask_restore('restore_mask_o')
               
      UPDATE stib_t 
         SET (stibdocno,
              stibseq
              ,stib001,stib002,stib009,stib003,stib004,stib005,stib006,stib007,stib008,stibsite,stibunit) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stib_d[g_detail_idx].stib001,g_stib_d[g_detail_idx].stib002,g_stib_d[g_detail_idx].stib009, 
                  g_stib_d[g_detail_idx].stib003,g_stib_d[g_detail_idx].stib004,g_stib_d[g_detail_idx].stib005, 
                  g_stib_d[g_detail_idx].stib006,g_stib_d[g_detail_idx].stib007,g_stib_d[g_detail_idx].stib008, 
                  g_stib_d[g_detail_idx].stibsite,g_stib_d[g_detail_idx].stibunit) 
         WHERE stibent = g_enterprise AND stibdocno = ps_keys_bak[1] AND stibseq = ps_keys_bak[2]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stib_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "stib_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL astt811_stib_t_mask_restore('restore_mask_n')
               
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
 
{<section id="astt811.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION astt811_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="astt811.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION astt811_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="astt811.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt811_lock_b(ps_table,ps_page)
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
   #CALL astt811_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stib_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN astt811_bcl USING g_enterprise,
                                       g_stia_m.stiadocno,g_stib_d[g_detail_idx].stibseq     
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "astt811_bcl:",SQLERRMESSAGE 
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
 
{<section id="astt811.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt811_unlock_b(ps_table,ps_page)
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
      CLOSE astt811_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt811.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt811_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("stiadocno",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stiadocno",TRUE)
      CALL cl_set_comp_entry("stiadocdt",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
   CALL cl_set_comp_entry("stia002,stiasite",TRUE)
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt811.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt811_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("stiadocno",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("stiadocno",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("stiadocdt",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   #營運組織
   IF NOT s_aooi500_comp_entry(g_prog,'stiasite') OR g_site_flag THEN
      CALL cl_set_comp_entry("stiasite",FALSE)
   END IF
   #來源單號控卡
   IF g_stia_m.stia001 = '3' THEN
      CALL cl_set_comp_entry("stia002",FALSE)
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt811.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt811_set_entry_b(p_cmd)
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
 
{<section id="astt811.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt811_set_no_entry_b(p_cmd)
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
   IF NOT cl_null(g_stia_m.stia006) THEN
      CALL cl_set_comp_entry("stib001",FALSE)
   END IF
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="astt811.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION astt811_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   CALL cl_set_act_visible("modify,delete,modify_detail,reproduce", TRUE)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt811.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION astt811_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   #應用 a63 樣板自動產生(Version:2)
   IF g_stia_m.stiastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail,reproduce", FALSE)
   END IF



   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt811.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION astt811_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt811.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION astt811_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="astt811.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt811_default_search()
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
      LET ls_wc = ls_wc, " stiadocno = '", g_argv[01], "' AND "
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
               WHEN la_wc[li_idx].tableid = "stia_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "stib_t" 
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
 
{<section id="astt811.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION astt811_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
   DEFINE l_success       LIKE type_t.num5
   DEFINE l_stbadocno     LIKE stba_t.stbadocno
   DEFINE l_cnt           LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   IF g_stia_m.stiastus = 'X' THEN #作廢狀態
      RETURN
   END IF
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stia_m.stiadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN astt811_cl USING g_enterprise,g_stia_m.stiadocno
   IF STATUS THEN
      CLOSE astt811_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN astt811_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE astt811_master_referesh USING g_stia_m.stiadocno INTO g_stia_m.stiasite,g_stia_m.stiadocdt, 
       g_stia_m.stiadocno,g_stia_m.stia001,g_stia_m.stia002,g_stia_m.stia003,g_stia_m.stia004,g_stia_m.stia005, 
       g_stia_m.stia006,g_stia_m.stia007,g_stia_m.stia008,g_stia_m.stia009,g_stia_m.stia010,g_stia_m.stia011, 
       g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014,g_stia_m.stia015,g_stia_m.stia016,g_stia_m.stiaunit, 
       g_stia_m.stiastus,g_stia_m.stiaownid,g_stia_m.stiaowndp,g_stia_m.stiacrtid,g_stia_m.stiacrtdp, 
       g_stia_m.stiacrtdt,g_stia_m.stiamodid,g_stia_m.stiamoddt,g_stia_m.stiacnfid,g_stia_m.stiacnfdt, 
       g_stia_m.stiasite_desc,g_stia_m.stia003_desc,g_stia_m.stia005_desc,g_stia_m.stia006_desc,g_stia_m.stia008_desc, 
       g_stia_m.stia009_desc,g_stia_m.stia010_desc,g_stia_m.stia011_desc,g_stia_m.stia014_desc,g_stia_m.stia015_desc, 
       g_stia_m.stiaownid_desc,g_stia_m.stiaowndp_desc,g_stia_m.stiacrtid_desc,g_stia_m.stiacrtdp_desc, 
       g_stia_m.stiamodid_desc,g_stia_m.stiacnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT astt811_action_chk() THEN
      CLOSE astt811_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_stia_m.stiasite,g_stia_m.stiasite_desc,g_stia_m.stiadocdt,g_stia_m.stiadocno,g_stia_m.stia001, 
       g_stia_m.stia002,g_stia_m.stia003,g_stia_m.stia003_desc,g_stia_m.stia004,g_stia_m.stia005,g_stia_m.stia005_desc, 
       g_stia_m.stia006,g_stia_m.stia006_desc,g_stia_m.stia007,g_stia_m.stia008,g_stia_m.stia008_desc, 
       g_stia_m.stia009,g_stia_m.stia009_desc,g_stia_m.stia010,g_stia_m.stia010_desc,g_stia_m.stia011, 
       g_stia_m.stia011_desc,g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014,g_stia_m.stia014_desc, 
       g_stia_m.stia015,g_stia_m.stia015_desc,g_stia_m.stia016,g_stia_m.stiaunit,g_stia_m.stiastus,g_stia_m.stiaownid, 
       g_stia_m.stiaownid_desc,g_stia_m.stiaowndp,g_stia_m.stiaowndp_desc,g_stia_m.stiacrtid,g_stia_m.stiacrtid_desc, 
       g_stia_m.stiacrtdp,g_stia_m.stiacrtdp_desc,g_stia_m.stiacrtdt,g_stia_m.stiamodid,g_stia_m.stiamodid_desc, 
       g_stia_m.stiamoddt,g_stia_m.stiacnfid,g_stia_m.stiacnfid_desc,g_stia_m.stiacnfdt
 
   CASE g_stia_m.stiastus
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
         CASE g_stia_m.stiastus
            
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
      CALL cl_set_act_visible("confirmed",TRUE)     #確認
      CALL cl_set_act_visible("unconfirmed",TRUE)   #取消確認
      CALL cl_set_act_visible("invalid",TRUE)       #作廢
      CALL cl_set_act_visible("signing,withdraw",FALSE)
      
      CASE g_stia_m.stiastus
         WHEN "N"
            CALL cl_set_act_visible("unconfirmed",FALSE)   #取消確認
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
            CALL cl_set_act_visible("confirmed",FALSE)     #確認
            CALL cl_set_act_visible("unconfirmed",FALSE)   #取消確認
            CALL cl_set_act_visible("invalid",FALSE)       #作廢
            
         WHEN "Y"
            CALL cl_set_act_visible("confirmed",FALSE)     #確認
            CALL cl_set_act_visible("invalid",FALSE)       #作廢
            
         WHEN "S"
            CALL cl_set_act_visible("confirmed",FALSE)     #確認
            CALL cl_set_act_visible("unconfirmed",FALSE)   #取消確認
            CALL cl_set_act_visible("invalid",FALSE)       #作廢
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
            IF NOT astt811_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt811_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt811_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE astt811_cl
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
      g_stia_m.stiastus = lc_state OR cl_null(lc_state) THEN
      CLOSE astt811_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"
   CALL s_transaction_begin()
   CALL cl_err_collect_init()
   IF lc_state = 'Y' THEN   
      IF NOT s_astt811_conf_chk(g_stia_m.stiadocno) THEN
         CALL s_transaction_end('N','0')   #160816-00068#1 add
         CALL cl_err_collect_show()
         RETURN
      ELSE          
         IF NOT cl_ask_confirm('aim-00108') THEN
            CALL s_transaction_end('N','0')   #160816-00068#1 add
            CALL cl_err_collect_show()
            RETURN
         ELSE
            IF NOT s_astt811_conf_upd(g_stia_m.stiadocno) THEN
               CALL s_transaction_end('N','0')
               CALL cl_err_collect_show()
               RETURN
            ELSE
               CALL s_transaction_end('Y','0')
               #產生費用單
               CALL s_transaction_begin()
               LET l_success = TRUE
               LET l_stbadocno = ''
               CALL s_expense_astt811(g_stia_m.stiadocno) RETURNING l_success,l_stbadocno
               IF l_success THEN
                  CALL astt811_stia013_upd(l_stbadocno)
                  CALL s_transaction_end('Y','0')
               ELSE
                  CALL s_transaction_end('N','0')
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00556'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
                  CALL cl_err_collect_show()
                  RETURN                  
               END IF               
               CALL cl_err_collect_show()
            END IF
         END IF
      END IF
   END IF
   
   IF lc_state = 'N' THEN
      #費用單已確認，不可取消確認！
      SELECT COUNT(stbadocno) INTO l_cnt
       FROM stba_t 
      WHERE stbaent = g_enterprise 
        AND stbadocno = g_stia_m.stia013
        AND stbastus = 'Y'
      IF l_cnt > 0 THEN
         CALL s_transaction_end('N','0')       
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00642'
         LET g_errparam.extend = ''
         LET g_errparam.popup = FALSE
         LET g_errparam.replace[1] = g_stia_m.stia013
         CALL cl_err()
         CALL cl_err_collect_show()
         RETURN
      END IF      
      
      IF NOT s_astt811_unconf_chk(g_stia_m.stiadocno) THEN
         CALL s_transaction_end('N','0')   #160816-00068#1 add
         CALL cl_err_collect_show()
         RETURN
      ELSE
         IF NOT cl_ask_confirm('aim-00110') THEN
            CALL s_transaction_end('N','0')   #160816-00068#1 add
            CALL cl_err_collect_show()
            RETURN
         ELSE
            IF NOT s_astt811_unconf_upd(g_stia_m.stiadocno) THEN
               CALL s_transaction_end('N','0')
               CALL cl_err_collect_show()
               RETURN
            ELSE                
               IF NOT cl_null(g_stia_m.stia013) THEN
                  #取消確認時，同時刪除費用單號且更新單頭費用單為空
                  IF NOT s_expense_unconf(g_stia_m.stia013) THEN
                     CALL s_transaction_end('N','0')
                     CALL cl_err_collect_show()
                     RETURN                     
                  ELSE
                    UPDATE stia_t SET stia013 = ''
                    WHERE stiaent = g_enterprise
                      AND stiadocno = g_stia_m.stiadocno
                    CALL s_transaction_end('Y','0')
                  END IF
               ELSE
                 CALL s_transaction_end('Y','0')
               END IF
               CALL cl_err_collect_show()
            END IF
         END IF
      END IF
   END IF
   
   IF lc_state = 'X' THEN
      IF NOT s_astt811_void_chk(g_stia_m.stiadocno) THEN
         CALL s_transaction_end('N','0')   #160816-00068#1 add
         CALL cl_err_collect_show()
         RETURN
      ELSE
         IF NOT cl_ask_confirm('aim-00109') THEN
            CALL s_transaction_end('N','0')   #160816-00068#1 add
            CALL cl_err_collect_show()
            RETURN
         ELSE
            IF NOT s_astt811_void_upd(g_stia_m.stiadocno)  THEN
               CALL s_transaction_end('N','0')
               CALL cl_err_collect_show()
               RETURN
            ELSE
               CALL s_transaction_end('Y','0')
               CALL cl_err_collect_show()
            END IF
         END IF
      END IF
   END IF
   #end add-point
   
   LET g_stia_m.stiamodid = g_user
   LET g_stia_m.stiamoddt = cl_get_current()
   LET g_stia_m.stiastus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE stia_t 
      SET (stiastus,stiamodid,stiamoddt) 
        = (g_stia_m.stiastus,g_stia_m.stiamodid,g_stia_m.stiamoddt)     
    WHERE stiaent = g_enterprise AND stiadocno = g_stia_m.stiadocno
 
    
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
      EXECUTE astt811_master_referesh USING g_stia_m.stiadocno INTO g_stia_m.stiasite,g_stia_m.stiadocdt, 
          g_stia_m.stiadocno,g_stia_m.stia001,g_stia_m.stia002,g_stia_m.stia003,g_stia_m.stia004,g_stia_m.stia005, 
          g_stia_m.stia006,g_stia_m.stia007,g_stia_m.stia008,g_stia_m.stia009,g_stia_m.stia010,g_stia_m.stia011, 
          g_stia_m.stia012,g_stia_m.stia013,g_stia_m.stia014,g_stia_m.stia015,g_stia_m.stia016,g_stia_m.stiaunit, 
          g_stia_m.stiastus,g_stia_m.stiaownid,g_stia_m.stiaowndp,g_stia_m.stiacrtid,g_stia_m.stiacrtdp, 
          g_stia_m.stiacrtdt,g_stia_m.stiamodid,g_stia_m.stiamoddt,g_stia_m.stiacnfid,g_stia_m.stiacnfdt, 
          g_stia_m.stiasite_desc,g_stia_m.stia003_desc,g_stia_m.stia005_desc,g_stia_m.stia006_desc,g_stia_m.stia008_desc, 
          g_stia_m.stia009_desc,g_stia_m.stia010_desc,g_stia_m.stia011_desc,g_stia_m.stia014_desc,g_stia_m.stia015_desc, 
          g_stia_m.stiaownid_desc,g_stia_m.stiaowndp_desc,g_stia_m.stiacrtid_desc,g_stia_m.stiacrtdp_desc, 
          g_stia_m.stiamodid_desc,g_stia_m.stiacnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_stia_m.stiasite,g_stia_m.stiasite_desc,g_stia_m.stiadocdt,g_stia_m.stiadocno, 
          g_stia_m.stia001,g_stia_m.stia002,g_stia_m.stia003,g_stia_m.stia003_desc,g_stia_m.stia004, 
          g_stia_m.stia005,g_stia_m.stia005_desc,g_stia_m.stia006,g_stia_m.stia006_desc,g_stia_m.stia007, 
          g_stia_m.stia008,g_stia_m.stia008_desc,g_stia_m.stia009,g_stia_m.stia009_desc,g_stia_m.stia010, 
          g_stia_m.stia010_desc,g_stia_m.stia011,g_stia_m.stia011_desc,g_stia_m.stia012,g_stia_m.stia013, 
          g_stia_m.stia014,g_stia_m.stia014_desc,g_stia_m.stia015,g_stia_m.stia015_desc,g_stia_m.stia016, 
          g_stia_m.stiaunit,g_stia_m.stiastus,g_stia_m.stiaownid,g_stia_m.stiaownid_desc,g_stia_m.stiaowndp, 
          g_stia_m.stiaowndp_desc,g_stia_m.stiacrtid,g_stia_m.stiacrtid_desc,g_stia_m.stiacrtdp,g_stia_m.stiacrtdp_desc, 
          g_stia_m.stiacrtdt,g_stia_m.stiamodid,g_stia_m.stiamodid_desc,g_stia_m.stiamoddt,g_stia_m.stiacnfid, 
          g_stia_m.stiacnfid_desc,g_stia_m.stiacnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
   IF g_stia_m.stiastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   ELSE
      CALL cl_set_act_visible("modify,delete,modify_detail", TRUE)   
   END IF
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE astt811_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL astt811_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt811.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION astt811_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
   
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stib_d.getLength() THEN
         LET g_detail_idx = g_stib_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stib_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stib_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt811.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt811_b_fill2(pi_idx)
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
   
   CALL astt811_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="astt811.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt811_fill_chk(ps_idx)
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
 
{<section id="astt811.status_show" >}
PRIVATE FUNCTION astt811_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astt811.mask_functions" >}
&include "erp/ast/astt811_mask.4gl"
 
{</section>}
 
{<section id="astt811.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION astt811_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
 
 
   CALL astt811_show()
   CALL astt811_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stia_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stib_d))
 
 
   # cl_bpm_cli() 裡有包含以前的aws_condition()=>送簽資料檢核和更新單據狀況碼為'W'
   # cl_bpm_cli() 傳入參數:無  ;  回傳值: 0 開單失敗; 1 開單成功
 
   #add-point: 提交前的ADP name="send.before_cli"
   #確認前檢核段
   IF NOT s_astt811_conf_chk(g_stia_m.stiadocno) THEN
      CLOSE astt811_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   #end add-point
 
   #開單失敗
   IF NOT cl_bpm_cli() THEN 
      RETURN FALSE
   END IF
 
   #add-point: 提交後的ADP name="send.after_send"
   
   #end add-point
 
   #此段落不需要刪除資料,但是否需要refresh圖片樣式???
   #CALL astt811_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt811_ui_headershow()
   CALL astt811_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION astt811_draw_out()
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
   CALL astt811_ui_headershow()  
   CALL astt811_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="astt811.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION astt811_set_pk_array()
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
   LET g_pk_array[1].values = g_stia_m.stiadocno
   LET g_pk_array[1].column = 'stiadocno'
 
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt811.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="astt811.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION astt811_msgcentre_notify(lc_state)
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
   CALL astt811_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_stia_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="astt811.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION astt811_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   #160818-00017#41 add-S
   SELECT stiastus  INTO g_stia_m.stiastus
     FROM stia_t
    WHERE stiaent = g_enterprise
      AND stiadocno = g_stia_m.stiadocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stia_m.stiastus
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
        LET g_errparam.extend = g_stia_m.stiadocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL astt811_set_act_visible()
        CALL astt811_set_act_no_visible()
        CALL astt811_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#41 add-E
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="astt811.other_function" readonly="Y" >}

################################################################################
# Descriptions...: 取得商戶編號的聯絡電話
# Memo...........:
# Usage..........: CALL astt811_get_oofc012(p_stia003)
#                  RETURNING r_oofc012
# Input parameter: p_stia003      商戶編號
# Return code....: r_oofc012      聯絡電話
# Date & Author..: 2016/03/22 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_get_oofc012(p_stia003)
DEFINE p_stia003        LIKE stia_t.stia003
DEFINE l_cnt            LIKE type_t.num5
DEFINE l_pmaa027        LIKE pmaa_t.pmaa027
DEFINE r_oofc012        LIKE oofc_t.oofc012

   LET l_cnt = 0
   LET l_pmaa027 = ''
   LET r_oofc012 = ''
   
   IF g_stia_m.stia001 = '1' THEN
      SELECT mhbg037 INTO l_pmaa027
        FROM mhbg_t
       WHERE mhbgent = g_enterprise
         AND mhbg001 = p_stia003
         AND mhbgdocno = g_stia_m.stia002
   ELSE
     #先取交易對象的聯絡對象識別碼
     SELECT pmaa027 INTO l_pmaa027
       FROM pmaa_t
      WHERE pmaaent = g_enterprise
        AND pmaa001 = p_stia003   
   END IF
   
      
      
   #用聯絡對象識別碼(pmaa027)去oofc取對應資料
   #先判斷在oofc_t有無資料
   SELECT COUNT(*) INTO l_cnt
     FROM oofc_t
    WHERE oofcent = g_enterprise
      AND oofc002 = l_pmaa027
      
   IF l_cnt > 0 THEN #在oofc有資料
      #判斷主要聯絡方式是否為電話類型(1,2)
      SELECT oofc012 INTO r_oofc012
        FROM oofc_t
       WHERE oofcent = g_enterprise
         AND oofc008 IN ('1','2')
         AND oofc010 = 'Y'
         AND oofc002 = l_pmaa027
         
      IF cl_null(r_oofc012) THEN
         SELECT oofc012 INTO r_oofc012
           FROM oofc_t
          WHERE oofcent = g_enterprise
            AND oofc001 IN ('1','2')
            AND oofc002 = l_pmaa027      
      END IF      
   ELSE              #在oofc無資料 直接回傳空白
      LET r_oofc012 = ''
      RETURN r_oofc012      
   END IF
   
   RETURN r_oofc012
END FUNCTION

################################################################################
# Descriptions...: 取得鋪位名稱
# Memo...........:
# Usage..........: CALL astt811_stia006_ref()
# Input parameter: 
# Return code....: 
# Date & Author..: 20160322 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stia006_ref()
  INITIALIZE g_ref_fields TO NULL
  LET g_ref_fields[1] = g_stia_m.stia006
  CALL ap_ref_array2(g_ref_fields,"SELECT mhbel003 FROM mhbel_t WHERE mhbelent='"||g_enterprise||"' AND mhbel001=? AND mhbel002='"||g_dlang||"'","") RETURNING g_rtn_fields
  LET g_stia_m.stia006_desc = '', g_rtn_fields[1] , ''
  DISPLAY BY NAME g_stia_m.stia006_desc
END FUNCTION

################################################################################
# Descriptions...: 由鋪位編號帶出其他欄位
# Memo...........: 鋪位版本，樓棟，樓層，經營品類
# Usage..........: CALL astt811_stia006_default()
# Input parameter: 
# Return code....: 
# Date & Author..: 2016/03/22 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stia006_default()
   SELECT mhbe002,mhbe003,mhbe004,mhbe009
     INTO g_stia_m.stia007,g_stia_m.stia008,
          g_stia_m.stia009,g_stia_m.stia010
     FROM mhbe_t
    WHERE mhbeent = g_enterprise
      AND mhbe001 = g_stia_m.stia006
      
   
   DISPLAY BY NAME g_stia_m.stia007
   DISPLAY BY NAME g_stia_m.stia008
   DISPLAY BY NAME g_stia_m.stia009
   DISPLAY BY NAME g_stia_m.stia010
END FUNCTION

################################################################################
# Descriptions...: 取部門
# Memo...........:
# Usage..........: CALL astt811_stia014_def(p_ooag001)
#                  RETURNING  r_ooag003
# Input parameter: p_ooag001      員工編號
# Return code....: r_ooag003      部門編號
# Date & Author..: 2016/03/22 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stia014_def(p_ooag001)
DEFINE p_ooag001        LIKE ooag_t.ooag001
DEFINE r_ooag003        LIKE ooag_t.ooag003

   WHENEVER ERROR CONTINUE

   LET r_ooag003 = ''
   SELECT ooag003 INTO r_ooag003
     FROM ooag_t
    WHERE ooagent = g_enterprise
      AND ooag001 = p_ooag001

   RETURN r_ooag003
END FUNCTION

################################################################################
# Descriptions...: 取來源單號對應之商戶編號
# Memo...........:
# Usage..........: CALL astt811_get_stia003()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2016/03/23 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_get_stia003()
DEFINE l_mhbg001 LIKE mhbg_t.mhbg001
   
   LET l_mhbg001 = ''
   SELECT mhbg001 INTO l_mhbg001
     FROM mhbg_t
    WHERE mhbgent = g_enterprise
      AND mhbgdocno = g_stia_m.stia002
      
   IF NOT cl_null(l_mhbg001) THEN
      LET g_stia_m.stia003 = l_mhbg001
      CALL s_desc_get_trading_partner_abbr_desc(g_stia_m.stia003) RETURNING g_stia_m.stia003_desc
      DISPLAY BY NAME g_stia_m.stia003
      DISPLAY BY NAME g_stia_m.stia003_desc 
   END IF

END FUNCTION

################################################################################
# Descriptions...: 取來源類行為1.預登記之商戶說明
# Memo...........:
# Usage..........: CALL astt811_stia003_ref()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2016/03/23 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stia003_ref()
  INITIALIZE g_ref_fields TO NULL
  LET g_ref_fields[1] = g_stia_m.stia003
  CALL ap_ref_array2(g_ref_fields,"SELECT mhbgl003 FROM mhbgl_t WHERE mhbglent='"||g_enterprise||"' AND mhbgl001=? AND mhbgl002='"||g_dlang||"'","") RETURNING g_rtn_fields
  LET g_stia_m.stia003_desc = '', g_rtn_fields[1] , ''
  DISPLAY BY NAME g_stia_m.stia003_desc
END FUNCTION

################################################################################
# Descriptions...: 取費用編號說明
# Memo...........:
# Usage..........: CALL astt811_stia011_ref()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2016/03/23 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stia011_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stia_m.stia011
   CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stia_m.stia011_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stia_m.stia011_desc
END FUNCTION

################################################################################
# Descriptions...: 從單頭的鋪位編號到鋪位主檔取得場地資料
# Memo...........:
# Usage..........: CALL astt811_stib_default()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success      TURE/FALSE
# Date & Author..: 2016/03/23 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stib_default()
DEFINE r_success        LIKE type_t.num5
DEFINE l_sql            STRING
DEFINE l_stibsite       LIKE stib_t.stibsite
DEFINE l_stibdocno      LIKE stib_t.stibdocno

   LET r_success = TRUE
   LET l_stibsite  = g_stia_m.stiasite
   LET l_stibdocno = g_stia_m.stiadocno

   LET l_sql = " INSERT INTO stib_t(stibent,stibsite,stibunit,stibdocno,stibseq,stib001, ",
               "                    stib002,stib009,stib003,stib004,stib005,stib006,stib007,stib008) ",
               " SELECT ",g_enterprise,",'",l_stibsite,"','",l_stibsite,"',","'",l_stibdocno,"',","ROW_NUMBER() OVER (ORDER BY 1),mhbf002, ",
   			   "        mhbf003,mhad008,mhbf004,mhbf005,mhbf006,mhbf007,mhbf008,mhbf009 ",
               "   FROM mhbf_t ",
               "   LEFT JOIN mhad_t ON mhbfent = mhadent ",
               "                   AND mhbf004 = mhad001 ",
               "                   AND mhbf005 = mhad002 ",
               "                   AND mhbf006 = mhad003 ",
               "                   AND mhbf002 = mhad004 ",
               "  WHERE mhbfent = ? ",
               "    AND mhbf001 = ? "
            PREPARE ins_stib_pre FROM l_sql
            EXECUTE ins_stib_pre USING g_enterprise,g_stia_m.stia006
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'Ins stib_t'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success = FALSE
            END IF
            
    RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 取樓棟說明
# Memo...........:
# Usage..........: CALL astt811_stia008_ref(p_stia008)
#                  RETURNING r_stia008_desc
# Input parameter: p_stia008        樓棟編號
# Return code....: r_stia008_desc   樓棟說明
# Date & Author..: 2016/03/23 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stia008_ref(p_stia008)
DEFINE p_stia008 LIKE stia_t.stia008
DEFINE r_stia008_desc LIKE type_t.chr80
    
    LET r_stia008_desc = ''
    SELECT mhaal003 INTO r_stia008_desc
      FROM mhaal_t 
     WHERE mhaalent = g_enterprise
       AND mhaal001 = p_stia008 
       AND mhaal002 = g_dlang
    
    RETURN r_stia008_desc
END FUNCTION

################################################################################
# Descriptions...: 取樓層說明
# Memo...........:
# Usage..........: CALL astt811_stia009_ref(p_stia008,p_stia009)
#                  RETURNING r_stia009_desc
# Input parameter: p_stia008       樓棟編號
#                : p_stia009       樓層編號
# Return code....: r_stia009_desc  樓層說明
# Date & Author..: 2016/03/23 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stia009_ref(p_stia008,p_stia009)
DEFINE p_stia008      LIKE stia_t.stia008   
DEFINE p_stia009      LIKE stia_t.stia009
DEFINE r_stia009_desc LIKE type_t.chr80

   LET r_stia009_desc = ''
   SELECT mhabl004 INTO r_stia009_desc
     FROM mhabl_t 
    WHERE mhablent = g_enterprise
      AND mhabl001 = p_stia008 
      AND mhabl002 = p_stia009
      AND mhabl003 = g_dlang
   
   RETURN r_stia009_desc
END FUNCTION

################################################################################
# Descriptions...: 取區域說明
# Memo...........:
# Usage..........: CALL astt811_stib005_ref(p_stib003,p_stib004,p_stib005)
#                  RETURNING r_stib005_desc
# Input parameter: p_stib003   樓棟編號
#                : p_stib004   樓層編號
#                : p_stib005   區域編號
# Return code....: r_stib005_desc  區域說明
# Date & Author..: 2016/03/23 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stib005_ref(p_stib003,p_stib004,p_stib005)
DEFINE p_stib003       LIKE stib_t.stib003
DEFINE p_stib004       LIKE stib_t.stib004
DEFINE p_stib005       LIKE stib_t.stib005
DEFINE r_stib005_desc  LIKE type_t.chr80
   
   LET r_stib005_desc = ''
   SELECT mhacl005 INTO r_stib005_desc
     FROM mhacl_t 
    WHERE mhaclent = g_enterprise
      AND mhacl001 = p_stib003 
      AND mhacl002 = p_stib004
      AND mhacl003 = p_stib005
      AND mhacl004 = g_dlang
      
   RETURN r_stib005_desc
END FUNCTION

################################################################################
# Descriptions...: 取場地說明
# Memo...........:
# Usage..........: CALL astt811_stib001_ref(p_stib003,p_stib004,p_stib005,p_stib001)
#                  RETURNING r_stib001_desc
# Input parameter: p_stib003      樓棟編號
#                : p_stib004      樓層編號
#                : p_stib005      區域編號
#                : p_stib001      場地編號
# Return code....: r_stib001_desc 場地說明
# Date & Author..: 2016/03/23 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stib001_ref(p_stib003,p_stib004,p_stib005,p_stib001)
DEFINE p_stib003       LIKE stib_t.stib003
DEFINE p_stib004       LIKE stib_t.stib004
DEFINE p_stib005       LIKE stib_t.stib005
DEFINE p_stib001       LIKE stib_t.stib001
DEFINE r_stib001_desc  LIKE type_t.chr80
   
   LET r_stib001_desc = ''
   SELECT mhadl006 INTO r_stib001_desc
     FROM mhadl_t 
    WHERE mhadlent = g_enterprise
      AND mhadl001 = p_stib003 
      AND mhadl002 = p_stib004
      AND mhadl003 = p_stib005
      AND mhadl004 = p_stib001  
      AND mhadl005 = g_dlang
      
   RETURN r_stib001_desc 
END FUNCTION

################################################################################
# Descriptions...: 檢查單身是否有資料
# Memo...........: 有資料回傳TRUE,無回傳FALSE
# Usage..........: CALL astt811_stibcnt_chk()
#                  RETURNING r_success
# Input parameter: 
# Return code....: r_success      TURE/FALSE
# Date & Author..: 2016/03/24 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stibcnt_chk()
DEFINE l_cnt            LIKE type_t.num5
DEFINE r_success        LIKE type_t.num5

   LET l_cnt = 0
   LET r_success = TRUE
      
   SELECT COUNT(*) INTO l_cnt
     FROM stib_t
    WHERE stibent = g_enterprise
      AND stibdocno = g_stia_m.stiadocno
   IF l_cnt = 0 THEN
      LET r_success = FALSE
   END IF    
      
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 帶出場地相關值
# Memo...........:
# Usage..........: CALL astt811_stib001_default()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2016/03/24 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stib001_default()

   LET g_stib_d[l_ac].stib002 = ''
   LET g_stib_d[l_ac].stib009 = ''
   LET g_stib_d[l_ac].stib003 = ''
   LET g_stib_d[l_ac].stib004 = ''
   LET g_stib_d[l_ac].stib005 = ''
   LET g_stib_d[l_ac].stib006 = ''
   LET g_stib_d[l_ac].stib007 = ''
   LET g_stib_d[l_ac].stib008 = ''
   
   SELECT mhad009,mhad008,mhad001,mhad002,mhad003,mhad005,mhad006,mhad007
     INTO g_stib_d[l_ac].stib002,g_stib_d[l_ac].stib009,g_stib_d[l_ac].stib003,
          g_stib_d[l_ac].stib004,g_stib_d[l_ac].stib005,g_stib_d[l_ac].stib006,
          g_stib_d[l_ac].stib007,g_stib_d[l_ac].stib008
     FROM mhad_t
    WHERE mhadent = g_enterprise
      AND mhad004 = g_stib_d[l_ac].stib001
   
END FUNCTION

################################################################################
# Descriptions...: 場地檢查
# Memo...........:
# Usage..........: CALL astt811_stib001_chk()
#                     RETURNING r_success
# Input parameter: 無
# Return code....: r_success      True/False
# Date & Author..: 2016/03/07 By pomelo
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stib001_chk()
DEFINE r_success         LIKE type_t.num5
DEFINE l_mhadsite        LIKE mhad_t.mhadsite
DEFINE l_cnt             LIKE type_t.num10
DEFINE l_where           STRING
DEFINE l_sql             STRING

   LET r_success = TRUE
   LET l_cnt = NULL
   
   SELECT COUNT(1) INTO l_cnt 
     FROM mhad_t
    WHERE mhadent = g_enterprise
      AND mhad004 = g_stib_d[l_ac].stib001
   
   IF l_cnt = 0 THEN
      #場地代號不存在對應樓棟樓層區域的[場地基本資料]中！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "amh-00069"
      LET g_errparam.extend = ""
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 更新費用單號回單頭
# Memo...........:
# Usage..........: CALL astt811_stia013_upd(p_stbadocno)
# Input parameter: p_stbadocno    費用單號
# Return code....: 
# Date & Author..: 2016/03/25 By sakura
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stia013_upd(p_stbadocno)
DEFINE p_stbadocno      LIKE stba_t.stbadocno

   UPDATE stia_t SET stia013 = p_stbadocno
    WHERE stiaent = g_enterprise
      AND stiadocno = g_stia_m.stiadocno
   
   IF SQLCA.SQLcode THEN
      #費用單號更新失敗！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'ast-00576'
      LET g_errparam.popup = FALSE
      CALL cl_err()    
   ELSE
      #執行成功，已產生費用單%1！
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00577'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      LET g_errparam.replace[1] = p_stbadocno
      CALL cl_err()   
   END IF
END FUNCTION

################################################################################
# Descriptions...: 取潛在客戶的說明
# Memo...........:
# Usage..........: CALL astt811_stia003_ref1()
# Input parameter: 
# Return code....: 
# Date & Author..: 2016-06-06 By Ken
# Modify.........:
################################################################################
PRIVATE FUNCTION astt811_stia003_ref1()
   SELECT mhbgl003 INTO g_stia_m.stia003_desc
     FROM mhbgl_t
    WHERE mbhglent = g_enterprise
      AND mhbgl001 = g_stia_m.stia003
      AND mhbgl002 = g_dlang
END FUNCTION

 
{</section>}
 
