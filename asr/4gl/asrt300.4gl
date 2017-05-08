#該程式未解開Section, 採用最新樣板產出!
{<section id="asrt300.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0016(2015-08-18 16:02:59), PR版次:0016(2016-12-23 14:51:50)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000624
#+ Filename...: asrt300
#+ Description: 重覆性生產計畫維護作業
#+ Creator....: 02482(2013-12-12 14:11:56)
#+ Modifier...: 02295 -SD/PR- 02159
 
{</section>}
 
{<section id="asrt300.global" >}
#應用 t01 樣板自動產生(Version:79)
#add-point:填寫註解說明 name="global.memo" 
#151224-00025#4   2015/12/28  By yihsuan    手動輸入特徵碼同步新增inam_t[料件產品特徵明細檔]
#160318-00005#44  2016/03/24  By pengxin    修正azzi920重复定义之错误讯息
#160314-00009#14  2016/03/29  By xujing     产品特征自动开窗增加参数判断
#160318-00025#4   2016/04/12  By 07675      將重複內容的錯誤訊息置換為公用錯誤訊息(r.v）
#160816-00068#3   2016/08/17  By earl       調整transaction
#160818-00017#37  2016/08/26  By lixh       单据类作业修改，删除时需重新检查状态
#160905-00007#15  2016/09/05  by 08172      调整系统中无ENT的SQL条件增加ent
#161124-00048#10  2016/12/13  By xujing     整批调整系统RECORD LIKE xxxx_t.* 星号写法
#160824-00007#284 2016/12/23  by sakura     新舊值備份處理
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
PRIVATE type type_g_sraa_m        RECORD
       sraa001 LIKE sraa_t.sraa001, 
   sraa001_desc LIKE type_t.chr80, 
   sraa002 LIKE sraa_t.sraa002, 
   sraa003 LIKE sraa_t.sraa003, 
   sraa000 LIKE sraa_t.sraa000, 
   sraastus LIKE sraa_t.sraastus, 
   sraacrtid LIKE sraa_t.sraacrtid, 
   sraacrtid_desc LIKE type_t.chr80, 
   sraacrtdp LIKE sraa_t.sraacrtdp, 
   sraacrtdp_desc LIKE type_t.chr80, 
   sraacrtdt LIKE sraa_t.sraacrtdt, 
   sraaownid LIKE sraa_t.sraaownid, 
   sraaownid_desc LIKE type_t.chr80, 
   sraaowndp LIKE sraa_t.sraaowndp, 
   sraaowndp_desc LIKE type_t.chr80, 
   sraamodid LIKE sraa_t.sraamodid, 
   sraamodid_desc LIKE type_t.chr80, 
   sraamoddt LIKE sraa_t.sraamoddt, 
   sraacnfid LIKE sraa_t.sraacnfid, 
   sraacnfid_desc LIKE type_t.chr80, 
   sraacnfdt LIKE sraa_t.sraacnfdt
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_srab_d        RECORD
       srab004 LIKE srab_t.srab004, 
   srab004_desc LIKE type_t.chr500, 
   srab004_desc_1 LIKE type_t.chr500, 
   srab005 LIKE srab_t.srab005, 
   srab006 LIKE srab_t.srab006, 
   srab007 LIKE srab_t.srab007, 
   srab008 LIKE srab_t.srab008, 
   srab008_desc LIKE type_t.chr500, 
   srab011 LIKE srab_t.srab011, 
   srab012 LIKE srab_t.srab012, 
   srab009 LIKE srab_t.srab009, 
   l_srab010_1_1 LIKE type_t.num20_6, 
   l_srab010_1_2 LIKE type_t.num20_6, 
   l_srab010_1_3 LIKE type_t.num20_6, 
   l_srab010_1_4 LIKE type_t.num20_6, 
   l_srab010_1_5 LIKE type_t.num20_6, 
   l_srab010_1_6 LIKE type_t.num20_6, 
   l_srab010_1_7 LIKE type_t.num20_6, 
   l_srab010_1_8 LIKE type_t.num20_6, 
   l_srab010_1_9 LIKE type_t.num20_6, 
   l_srab010_1_10 LIKE type_t.num20_6, 
   l_srab010_1_11 LIKE type_t.num20_6, 
   l_srab010_1_12 LIKE type_t.num20_6, 
   l_srab010_1_13 LIKE type_t.num20_6, 
   l_srab010_1_14 LIKE type_t.num20_6, 
   l_srab010_1_15 LIKE type_t.num20_6, 
   l_srab010_1_16 LIKE type_t.num20_6, 
   l_srab010_1_17 LIKE type_t.num20_6, 
   l_srab010_1_18 LIKE type_t.num20_6, 
   l_srab010_1_19 LIKE type_t.num20_6, 
   l_srab010_1_20 LIKE type_t.num20_6, 
   l_srab010_1_21 LIKE type_t.num20_6, 
   l_srab010_1_22 LIKE type_t.num20_6, 
   l_srab010_1_23 LIKE type_t.num20_6, 
   l_srab010_1_24 LIKE type_t.num20_6, 
   l_srab010_1_25 LIKE type_t.num20_6, 
   l_srab010_1_26 LIKE type_t.num20_6, 
   l_srab010_1_27 LIKE type_t.num20_6, 
   l_srab010_1_28 LIKE type_t.num20_6, 
   l_srab010_1_29 LIKE type_t.num20_6, 
   l_srab010_1_30 LIKE type_t.num20_6, 
   l_srab010_1_31 LIKE type_t.num20_6, 
   sum LIKE type_t.num20_6
       END RECORD
 
 
PRIVATE TYPE type_browser RECORD
         b_statepic     LIKE type_t.chr50,
            b_sraa001 LIKE sraa_t.sraa001,
   b_sraa001_desc LIKE type_t.chr80,
      b_sraa002 LIKE sraa_t.sraa002,
      b_sraa003 LIKE sraa_t.sraa003,
      b_sraa000 LIKE sraa_t.sraa000
       END RECORD
       
#add-point:自定義模組變數(Module Variable) (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="global.variable"
 TYPE type_g_srab_d2       RECORD
       srab004_1 LIKE srab_t.srab004, 
       srab004_1_desc  LIKE type_t.chr80, 
       srab004_1_desc1 LIKE type_t.chr80,
       chr1            LIKE type_t.chr80,
       srab010_1       LIKE type_t.num20_6, 
       srab010_2       LIKE type_t.num20_6, 
       srab010_3       LIKE type_t.num20_6, 
       srab010_4       LIKE type_t.num20_6, 
       srab010_5       LIKE type_t.num20_6, 
       srab010_6       LIKE type_t.num20_6, 
       srab010_7       LIKE type_t.num20_6, 
       srab010_8       LIKE type_t.num20_6, 
       srab010_9       LIKE type_t.num20_6, 
       srab010_10      LIKE type_t.num20_6, 
       srab010_11      LIKE type_t.num20_6, 
       srab010_12      LIKE type_t.num20_6, 
       srab010_13      LIKE type_t.num20_6, 
       srab010_14      LIKE type_t.num20_6, 
       srab010_15      LIKE type_t.num20_6, 
       srab010_16      LIKE type_t.num20_6, 
       srab010_17      LIKE type_t.num20_6, 
       srab010_18      LIKE type_t.num20_6, 
       srab010_19      LIKE type_t.num20_6, 
       srab010_20      LIKE type_t.num20_6, 
       srab010_21      LIKE type_t.num20_6, 
       srab010_22      LIKE type_t.num20_6, 
       srab010_23      LIKE type_t.num20_6, 
       srab010_24      LIKE type_t.num20_6, 
       srab010_25      LIKE type_t.num20_6, 
       srab010_26      LIKE type_t.num20_6, 
       srab010_27      LIKE type_t.num20_6, 
       srab010_28      LIKE type_t.num20_6, 
       srab010_29      LIKE type_t.num20_6, 
       srab010_30      LIKE type_t.num20_6, 
       srab010_31      LIKE type_t.num20_6
       END RECORD
       
 TYPE type_g_srab_d3       RECORD
       srac007 LIKE srac_t.srac007,
       srac008 LIKE srac_t.srac008,
       srac008_desc LIKE type_t.chr80,
       srac009 LIKE srac_t.srac009, 
       srac010 LIKE srac_t.srac010, 
       srac030 LIKE srac_t.srac030, 
       srac031 LIKE srac_t.srac031, 
       srac032 LIKE srac_t.srac032, 
       srac033 LIKE srac_t.srac033, 
       srac034 LIKE srac_t.srac034, 
       srac035 LIKE srac_t.srac035, 
       srac038 LIKE srac_t.srac038, 
       srac039 LIKE srac_t.srac039,
       srac040 LIKE srac_t.srac040, 
       srac041 LIKE srac_t.srac041, 
       srac042 LIKE srac_t.srac042, 
       srac043 LIKE srac_t.srac043,
       srac044 LIKE srac_t.srac044, 
       srac045 LIKE srac_t.srac045
       END RECORD
DEFINE g_srab_d2          DYNAMIC ARRAY OF type_g_srab_d2
DEFINE g_srab_d2_t        type_g_srab_d2

DEFINE g_srab_d3          DYNAMIC ARRAY OF type_g_srab_d3
DEFINE g_srab_d3_t        type_g_srab_d3

DEFINE g_rec_b1           LIKE type_t.num5           
DEFINE l_ac1              LIKE type_t.num5
DEFINE g_rec_b2           LIKE type_t.num5           
DEFINE l_ac2              LIKE type_t.num5
DEFINE l_success          LIKE type_t.num5
#end add-point
       
#模組變數(Module Variables)
DEFINE g_sraa_m          type_g_sraa_m
DEFINE g_sraa_m_t        type_g_sraa_m
DEFINE g_sraa_m_o        type_g_sraa_m
DEFINE g_sraa_m_mask_o   type_g_sraa_m #轉換遮罩前資料
DEFINE g_sraa_m_mask_n   type_g_sraa_m #轉換遮罩後資料
 
   DEFINE g_sraa001_t LIKE sraa_t.sraa001
DEFINE g_sraa002_t LIKE sraa_t.sraa002
DEFINE g_sraa003_t LIKE sraa_t.sraa003
DEFINE g_sraa000_t LIKE sraa_t.sraa000
 
 
DEFINE g_srab_d          DYNAMIC ARRAY OF type_g_srab_d
DEFINE g_srab_d_t        type_g_srab_d
DEFINE g_srab_d_o        type_g_srab_d
DEFINE g_srab_d_mask_o   DYNAMIC ARRAY OF type_g_srab_d #轉換遮罩前資料
DEFINE g_srab_d_mask_n   DYNAMIC ARRAY OF type_g_srab_d #轉換遮罩後資料
 
 
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
 
{<section id="asrt300.main" >}
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
   LET g_forupd_sql = " SELECT sraa001,'',sraa002,sraa003,sraa000,sraastus,sraacrtid,'',sraacrtdp,'', 
       sraacrtdt,sraaownid,'',sraaowndp,'',sraamodid,'',sraamoddt,sraacnfid,'',sraacnfdt", 
                      " FROM sraa_t",
                      " WHERE sraaent= ? AND sraasite= ? AND sraa000=? AND sraa001=? AND sraa002=? AND  
                          sraa003=? FOR UPDATE"
   #add-point:SQL_define name="main.after_define_sql"
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt300_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   LET g_sql = " SELECT DISTINCT t0.sraa001,t0.sraa002,t0.sraa003,t0.sraa000,t0.sraastus,t0.sraacrtid, 
       t0.sraacrtdp,t0.sraacrtdt,t0.sraaownid,t0.sraaowndp,t0.sraamodid,t0.sraamoddt,t0.sraacnfid,t0.sraacnfdt, 
       t1.ooag011 ,t2.ooefl003 ,t3.ooag011 ,t4.ooefl003 ,t5.ooag011 ,t6.ooag011",
               " FROM sraa_t t0",
                              " LEFT JOIN ooag_t t1 ON t1.ooagent="||g_enterprise||" AND t1.ooag001=t0.sraacrtid  ",
               " LEFT JOIN ooefl_t t2 ON t2.ooeflent="||g_enterprise||" AND t2.ooefl001=t0.sraacrtdp AND t2.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t3 ON t3.ooagent="||g_enterprise||" AND t3.ooag001=t0.sraaownid  ",
               " LEFT JOIN ooefl_t t4 ON t4.ooeflent="||g_enterprise||" AND t4.ooefl001=t0.sraaowndp AND t4.ooefl002='"||g_dlang||"' ",
               " LEFT JOIN ooag_t t5 ON t5.ooagent="||g_enterprise||" AND t5.ooag001=t0.sraamodid  ",
               " LEFT JOIN ooag_t t6 ON t6.ooagent="||g_enterprise||" AND t6.ooag001=t0.sraacnfid  ",
 
               " WHERE t0.sraaent = " ||g_enterprise|| " AND t0.sraasite = ? AND t0.sraa000 = ? AND t0.sraa001 = ? AND t0.sraa002 = ? AND t0.sraa003 = ?"
   LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
   #add-point:SQL_define name="main.after_refresh_sql"
   
   #end add-point
   PREPARE asrt300_master_referesh FROM g_sql
 
    
 
   
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_asrt300 WITH FORM cl_ap_formpath("asr",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL asrt300_init()   
 
      #進入選單 Menu (="N")
      CALL asrt300_ui_dialog() 
      
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_asrt300
      
   END IF 
   
   CLOSE asrt300_cl
   
   
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
 
 
 
{</section>}
 
{<section id="asrt300.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION asrt300_init()
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
 
   LET g_error_show  = 1
   LET l_ac = 1 #單身指標
      CALL cl_set_combo_scc_part('sraastus','13','N,Y,C,A,D,R,W,X')
 
   
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
   
   #page群組
   LET g_idx_group = om.SaxAttributes.create()
   CALL g_idx_group.addAttribute("'1',","1")
 
 
   #add-point:畫面資料初始化 name="init.init"
      CALL cl_set_combo_scc('srac010','1202')
   #end add-point
   
   #初始化搜尋條件
   CALL asrt300_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="asrt300.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION asrt300_ui_dialog()
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
            CALL asrt300_insert()
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
         INITIALIZE g_sraa_m.* TO NULL
         CALL g_srab_d.clear()
 
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL asrt300_init()
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
               
               CALL asrt300_fetch('') # reload data
               LET l_ac = 1
               CALL asrt300_ui_detailshow() #Setting the current row 
         
               CALL asrt300_idx_chk()
               #NEXT FIELD srab004
         
               ON ACTION qbefield_user   #欄位隱藏設定 
                  LET g_action_choice="qbefield_user"
                  CALL cl_ui_qbefield_user()
         END DISPLAY
    
         DISPLAY ARRAY g_srab_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               #顯示單身筆數
               CALL asrt300_idx_chk()
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
               CALL asrt300_idx_chk()
               #add-point:page1自定義行為 name="ui_dialog.page1.before_display"
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
               
            #add-point:page1自定義行為 name="ui_dialog.page1.action"
            
            #end add-point
               
         END DISPLAY
        
 
         
 
         
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
                  DISPLAY ARRAY g_srab_d2 TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b1) #page1  
    
            BEFORE ROW
               CALL asrt300_idx_chk()
               LET l_ac1 = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx = l_ac1
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac1 = DIALOG.getCurrentRow("s_detail2")
               CALL asrt300_idx_chk()
               LET g_current_page = 2
                        
         END DISPLAY
         
         DISPLAY ARRAY g_srab_d3 TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b2) #page1  
    
            BEFORE ROW
               CALL asrt300_idx_chk()
               LET l_ac2 = DIALOG.getCurrentRow("s_detail3")
               LET g_detail_idx = l_ac2
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac2 = DIALOG.getCurrentRow("s_detail3")
               CALL asrt300_idx_chk()
               LET g_current_page = 3
                        
         END DISPLAY
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            #先填充browser資料
            CALL asrt300_browser_fill("")
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
               CALL asrt300_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL asrt300_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL asrt300_idx_chk()
            CALL cl_ap_performance_cal()
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #add-point:ui_dialog段more_action name="ui_dialog.more_action"
         
         #end add-point
 
         #狀態碼切換
         ON ACTION statechange
            LET g_action_choice = "statechange"
            CALL asrt300_statechange()
            #根據資料狀態切換action狀態
            CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
            CALL asrt300_set_act_visible()   
            CALL asrt300_set_act_no_visible()
            IF NOT (g_sraa_m.sraa000 IS NULL
              OR g_sraa_m.sraa001 IS NULL
              OR g_sraa_m.sraa002 IS NULL
              OR g_sraa_m.sraa003 IS NULL
 
              ) THEN
               #組合條件
               LET g_add_browse = " sraaent = " ||g_enterprise|| " AND sraasite = '" ||g_site|| "' AND",
                                  " sraa000 = '", g_sraa_m.sraa000, "' "
                                  ," AND sraa001 = '", g_sraa_m.sraa001, "' "
                                  ," AND sraa002 = '", g_sraa_m.sraa002, "' "
                                  ," AND sraa003 = '", g_sraa_m.sraa003, "' "
 
               #填到對應位置
               CALL asrt300_browser_fill("")
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
                     WHEN la_wc[li_idx].tableid = "sraa_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "srab_t" 
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
               CALL asrt300_browser_fill("F")   #browser_fill()會將notice區塊清空
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
                     WHEN la_wc[li_idx].tableid = "sraa_t" 
                        LET g_wc = la_wc[li_idx].wc
                     WHEN la_wc[li_idx].tableid = "srab_t" 
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
                  CALL asrt300_browser_fill("F")
                  IF g_browser_cnt = 0 THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "" 
                     LET g_errparam.code = "-100" 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     CLEAR FORM
                  ELSE
                     CALL asrt300_fetch("F")
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
               CALL asrt300_filter()
               EXIT DIALOG
 
 
 
         
         ON ACTION first
            LET g_action_choice = "fetch"
            CALL asrt300_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt300_idx_chk()
            
         ON ACTION previous
            LET g_action_choice = "fetch"
            CALL asrt300_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt300_idx_chk()
            
         ON ACTION jump
            LET g_action_choice = "fetch"
            CALL asrt300_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt300_idx_chk()
            
         ON ACTION next
            LET g_action_choice = "fetch"
            CALL asrt300_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt300_idx_chk()
            
         ON ACTION last
            LET g_action_choice = "fetch"
            CALL asrt300_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL asrt300_idx_chk()
          
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
                  LET g_export_node[1] = base.typeInfo.create(g_srab_d)
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
               NEXT FIELD srab004
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
               CALL asrt300_modify()
               #add-point:ON ACTION modify name="menu.modify"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               LET g_aw = g_curr_diag.getCurrentItem()
               CALL asrt300_modify()
               #add-point:ON ACTION modify_detail name="menu.modify_detail"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION delete
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN
               CALL asrt300_delete()
               #add-point:ON ACTION delete name="menu.delete"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL asrt300_insert()
               #add-point:ON ACTION insert name="menu.insert"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION output
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN
               
               #add-point:ON ACTION output name="menu.output"
               
               #END add-point
               &include "erp/asr/asrt300_rep.4gl"
               #add-point:ON ACTION output.after name="menu.after_output"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION quickprint
            LET g_action_choice="quickprint"
            IF cl_auth_chk_act("quickprint") THEN
               
               #add-point:ON ACTION quickprint name="menu.quickprint"
               
               #END add-point
               &include "erp/asr/asrt300_rep.4gl"
               #add-point:ON ACTION quickprint.after name="menu.after_quickprint"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION reproduce
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN
               CALL asrt300_reproduce()
               #add-point:ON ACTION reproduce name="menu.reproduce"
               
               #END add-point
               
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION query
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN
               CALL asrt300_query()
               #add-point:ON ACTION query name="menu.query"
               
               #END add-point
               #應用 a59 樣板自動產生(Version:3)  
               CALL g_curr_diag.setCurrentRow("s_detail1",1)
 
 
 
 
            END IF
 
 
 
 
         #應用 a43 樣板自動產生(Version:4)
         ON ACTION process
            LET g_action_choice="process"
            IF cl_auth_chk_act("process") THEN
               
               #add-point:ON ACTION process name="menu.process"
                               IF l_ac = 0 OR cl_null(l_ac) THEN
                   LET l_ac = 1
                END IF
                IF NOT cl_null(g_sraa_m.sraa000) AND NOT cl_null(g_sraa_m.sraa001) AND NOT cl_null(g_sraa_m.sraa002) AND NOT cl_null(g_sraa_m.sraa003) AND  NOT cl_null(g_srab_d[l_ac].srab004) THEN
                   CALL asrt300_02(g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003,g_srab_d[l_ac].srab004,g_srab_d[l_ac].srab005,g_srab_d[l_ac].srab006,g_srab_d[l_ac].srab007,g_srab_d[l_ac].srab008)
                END IF
                LET g_action_choice= ""
               #END add-point
               
            END IF
 
 
 
 
         
         #應用 a46 樣板自動產生(Version:3)
         #新增相關文件
         ON ACTION related_document
            CALL asrt300_set_pk_array()
            IF cl_auth_chk_act("related_document") THEN
               #add-point:ON ACTION related_document name="ui_dialog.dialog.related_document"
               
               #END add-point
               CALL cl_doc()
            END IF
            
         ON ACTION agendum
            CALL asrt300_set_pk_array()
            #add-point:ON ACTION agendum name="ui_dialog.dialog.agendum"
            
            #END add-point
            CALL cl_user_overview()
            CALL cl_user_overview_set_follow_pic()
         
         ON ACTION followup
            CALL asrt300_set_pk_array()
            #add-point:ON ACTION followup name="ui_dialog.dialog.followup"
            
            #END add-point
            CALL cl_user_overview_follow('')
 
 
 
         
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
 
{<section id="asrt300.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION asrt300_browser_fill(ps_page_action)
   #add-point:browser_fill段define(客製用) name="browser_fill.define_customerization"
   
   #end add-point  
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   #add-point:browser_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="browser_fill.define"
#   CALL g_srab_d2.clear()
#   CALL g_srab_d3.clear()
   CALL g_browser.clear()
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
   
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT DISTINCT sraa000,sraa001,sraa002,sraa003 ",
                      " FROM sraa_t ",
                      " ",
                      " LEFT JOIN srab_t ON srabent = sraaent AND srabsite = sraasite AND sraa000 = srab000 AND sraa001 = srab001 AND sraa002 = srab002 AND sraa003 = srab003 ", "  ",
                      #add-point:browser_fill段sql(srab_t1) name="browser_fill.cnt.join.}"
                      
                      #end add-point
 
 
                      " ", 
                      " ", 
 
 
                      " WHERE sraaent = " ||g_enterprise|| " AND sraasite = '" ||g_site|| "' AND srabent = " ||g_enterprise|| " AND srabsite = '" ||g_site|| "' AND ",l_wc, " AND ", l_wc2, cl_sql_add_filter("sraa_t")
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT DISTINCT sraa000,sraa001,sraa002,sraa003 ",
                      " FROM sraa_t ", 
                      "  ",
                      "  ",
                      " WHERE sraaent = " ||g_enterprise|| " AND sraasite = '" ||g_site|| "' AND ",l_wc CLIPPED, cl_sql_add_filter("sraa_t")
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
      INITIALIZE g_sraa_m.* TO NULL
      CALL g_srab_d.clear()        
 
      #add-point:browser_fill g_add_browse段額外處理 name="browser_fill.add_browse.other"
      
      #end add-point   
      CALL g_browser.clear()
      LET g_cnt = 1
   ELSE
      LET l_wc  = g_add_browse
      LET l_wc2 = " 1=1" 
      LET g_cnt = g_current_idx
   END IF
 
   #依照t0.sraa001,t0.sraa002,t0.sraa003,t0.sraa000 Browser欄位定義(取代原本bs_sql功能)
   #考量到單身可能下條件, 所以此處需join單身所有table
   #DISTINCT是為了避免在join時出現重複的資料(如果不加DISTINCT則須在程式中過濾)
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sraastus,t0.sraa001,t0.sraa002,t0.sraa003,t0.sraa000 ",
                  " FROM sraa_t t0",
                  "  ",
                  "  LEFT JOIN srab_t ON srabent = sraaent AND srabsite = sraasite AND sraa000 = srab000 AND sraa001 = srab001 AND sraa002 = srab002 AND sraa003 = srab003 ", "  ", 
                  #add-point:browser_fill段sql(srab_t1) name="browser_fill.join.srab_t1"
                  
                  #end add-point
 
 
                  " ", 
 
 
                  
                  " WHERE t0.sraaent = " ||g_enterprise|| " AND t0.sraasite = '" ||g_site|| "' AND ",l_wc," AND ",l_wc2, cl_sql_add_filter("sraa_t")
   ELSE
      #單身無輸入搜尋條件   
      LET g_sql = " SELECT DISTINCT t0.sraastus,t0.sraa001,t0.sraa002,t0.sraa003,t0.sraa000 ",
                  " FROM sraa_t t0",
                  "  ",
                  
                  " WHERE t0.sraaent = " ||g_enterprise|| " AND t0.sraasite = '" ||g_site|| "' AND ",l_wc, cl_sql_add_filter("sraa_t")
   END IF
   #add-point:browser_fill,sql wc name="browser_fill.fill_sqlwc"
 
   #end add-point
   LET g_sql = g_sql, " ORDER BY sraa000,sraa001,sraa002,sraa003 ",g_order
 
   #add-point:browser_fill,before_prepare name="browser_fill.before_prepare"
 
   #end add-point
        
   #LET g_sql = cl_sql_add_tabid(g_sql,"sraa_t") #WC重組
   LET g_sql = cl_sql_add_mask(g_sql) #遮蔽特定資料
   
   IF g_sql.getIndexOf(" 1=2",1) THEN
      DISPLAY "INFO: 1=2 jumped!"
   ELSE
      PREPARE browse_pre FROM g_sql
      DECLARE browse_cur CURSOR FOR browse_pre
      
      #add-point:browser_fill段open cursor name="browser_fill.open"
   
      #end add-point
      
      FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_sraa001,g_browser[g_cnt].b_sraa002, 
          g_browser[g_cnt].b_sraa003,g_browser[g_cnt].b_sraa000
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "Foreach:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
      
         #add-point:browser_fill段reference name="browser_fill.reference"
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_browser[g_cnt].b_sraa001
      CALL ap_ref_array2(g_ref_fields,"SELECT srza002 FROM srza_t WHERE srzaent='"||g_enterprise||"' AND srzasite = '"||g_site||"' AND srza001=? ","") RETURNING g_rtn_fields
      LET g_browser[g_cnt].b_sraa001_desc = '', g_rtn_fields[1] , ''
      DISPLAY BY NAME g_browser[g_cnt].b_sraa001_desc
         #end add-point
      
         #遮罩相關處理
         CALL asrt300_browser_mask()
      
               #應用 a24 樣板自動產生(Version:3)
      #browser顯示圖片
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/unconfirmed.png"
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/confirmed.png"
         WHEN "C"
            LET g_browser[g_cnt].b_statepic = "stus/16/closed.png"
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
   
   IF cl_null(g_browser[g_cnt].b_sraa000) THEN
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
 
{<section id="asrt300.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION asrt300_ui_headershow()
   #add-point:ui_headershow段define(客製用) name="ui_headershow.define_customerization"
   
   #end add-point  
   #add-point:ui_headershow段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="ui_headershow.define"
   
   #end add-point      
   
   #add-point:Function前置處理  name="ui_headershow.pre_function"
   
   #end add-point
   
   LET g_sraa_m.sraa000 = g_browser[g_current_idx].b_sraa000   
   LET g_sraa_m.sraa001 = g_browser[g_current_idx].b_sraa001   
   LET g_sraa_m.sraa002 = g_browser[g_current_idx].b_sraa002   
   LET g_sraa_m.sraa003 = g_browser[g_current_idx].b_sraa003   
 
   EXECUTE asrt300_master_referesh USING g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003 INTO g_sraa_m.sraa001, 
       g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000,g_sraa_m.sraastus,g_sraa_m.sraacrtid,g_sraa_m.sraacrtdp, 
       g_sraa_m.sraacrtdt,g_sraa_m.sraaownid,g_sraa_m.sraaowndp,g_sraa_m.sraamodid,g_sraa_m.sraamoddt, 
       g_sraa_m.sraacnfid,g_sraa_m.sraacnfdt,g_sraa_m.sraacrtid_desc,g_sraa_m.sraacrtdp_desc,g_sraa_m.sraaownid_desc, 
       g_sraa_m.sraaowndp_desc,g_sraa_m.sraamodid_desc,g_sraa_m.sraacnfid_desc
   
   CALL asrt300_sraa_t_mask()
   CALL asrt300_show()
      
END FUNCTION
 
{</section>}
 
{<section id="asrt300.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION asrt300_ui_detailshow()
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
      IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail2",g_detail_idx)      
      CALL g_curr_diag.setCurrentRow("s_detail3",g_detail_idx)
   END IF
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="asrt300.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION asrt300_ui_browser_refresh()
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
      IF g_browser[l_i].b_sraa000 = g_sraa_m.sraa000 
         AND g_browser[l_i].b_sraa001 = g_sraa_m.sraa001 
         AND g_browser[l_i].b_sraa002 = g_sraa_m.sraa002 
         AND g_browser[l_i].b_sraa003 = g_sraa_m.sraa003 
 
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
 
{<section id="asrt300.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION asrt300_construct()
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
      DEFINE l_srza012   LIKE srza_t.srza012
   #end add-point    
   
   #add-point:Function前置處理  name="cs.pre_function"
   
   #end add-point
    
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_sraa_m.* TO NULL
   CALL g_srab_d.clear()        
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前 name="cs.before_construct"
      CALL g_srab_d2.clear()
   CALL g_srab_d3.clear()
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON sraa001,sraa001_desc,sraa002,sraa003,sraa000,sraastus,sraacrtid,sraacrtdp, 
          sraacrtdt,sraaownid,sraaowndp,sraamodid,sraamoddt,sraacnfid,sraacnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.head.before_construct"
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #應用 a11 樣板自動產生(Version:3)
         #共用欄位查詢處理  
         ##----<<sraacrtdt>>----
         AFTER FIELD sraacrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
 
         #----<<sraamoddt>>----
         AFTER FIELD sraamoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sraacnfdt>>----
         AFTER FIELD sraacnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<sraapstdt>>----
 
 
 
            
         #一般欄位開窗相關處理    
                  #Ctrlp:construct.c.sraa001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraa001
            #add-point:ON ACTION controlp INFIELD sraa001 name="construct.c.sraa001"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE  
            CALL q_srza001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sraa001  #顯示到畫面上

            NEXT FIELD sraa001                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraa001
            #add-point:BEFORE FIELD sraa001 name="construct.b.sraa001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraa001
            
            #add-point:AFTER FIELD sraa001 name="construct.a.sraa001"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraa001_desc
            #add-point:BEFORE FIELD sraa001_desc name="construct.b.sraa001_desc"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraa001_desc
            
            #add-point:AFTER FIELD sraa001_desc name="construct.a.sraa001_desc"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sraa001_desc
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraa001_desc
            #add-point:ON ACTION controlp INFIELD sraa001_desc name="construct.c.sraa001_desc"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraa002
            #add-point:BEFORE FIELD sraa002 name="construct.b.sraa002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraa002
            
            #add-point:AFTER FIELD sraa002 name="construct.a.sraa002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sraa002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraa002
            #add-point:ON ACTION controlp INFIELD sraa002 name="construct.c.sraa002"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraa003
            #add-point:BEFORE FIELD sraa003 name="construct.b.sraa003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraa003
            
            #add-point:AFTER FIELD sraa003 name="construct.a.sraa003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sraa003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraa003
            #add-point:ON ACTION controlp INFIELD sraa003 name="construct.c.sraa003"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraa000
            #add-point:BEFORE FIELD sraa000 name="construct.b.sraa000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraa000
            
            #add-point:AFTER FIELD sraa000 name="construct.a.sraa000"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sraa000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraa000
            #add-point:ON ACTION controlp INFIELD sraa000 name="construct.c.sraa000"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraastus
            #add-point:BEFORE FIELD sraastus name="construct.b.sraastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraastus
            
            #add-point:AFTER FIELD sraastus name="construct.a.sraastus"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sraastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraastus
            #add-point:ON ACTION controlp INFIELD sraastus name="construct.c.sraastus"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sraacrtid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraacrtid
            #add-point:ON ACTION controlp INFIELD sraacrtid name="construct.c.sraacrtid"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sraacrtid  #顯示到畫面上

            NEXT FIELD sraacrtid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraacrtid
            #add-point:BEFORE FIELD sraacrtid name="construct.b.sraacrtid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraacrtid
            
            #add-point:AFTER FIELD sraacrtid name="construct.a.sraacrtid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sraacrtdp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraacrtdp
            #add-point:ON ACTION controlp INFIELD sraacrtdp name="construct.c.sraacrtdp"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sraacrtdp  #顯示到畫面上

            NEXT FIELD sraacrtdp                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraacrtdp
            #add-point:BEFORE FIELD sraacrtdp name="construct.b.sraacrtdp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraacrtdp
            
            #add-point:AFTER FIELD sraacrtdp name="construct.a.sraacrtdp"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraacrtdt
            #add-point:BEFORE FIELD sraacrtdt name="construct.b.sraacrtdt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sraaownid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraaownid
            #add-point:ON ACTION controlp INFIELD sraaownid name="construct.c.sraaownid"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sraaownid  #顯示到畫面上

            NEXT FIELD sraaownid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraaownid
            #add-point:BEFORE FIELD sraaownid name="construct.b.sraaownid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraaownid
            
            #add-point:AFTER FIELD sraaownid name="construct.a.sraaownid"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sraaowndp
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraaowndp
            #add-point:ON ACTION controlp INFIELD sraaowndp name="construct.c.sraaowndp"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sraaowndp  #顯示到畫面上

            NEXT FIELD sraaowndp                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraaowndp
            #add-point:BEFORE FIELD sraaowndp name="construct.b.sraaowndp"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraaowndp
            
            #add-point:AFTER FIELD sraaowndp name="construct.a.sraaowndp"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.sraamodid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraamodid
            #add-point:ON ACTION controlp INFIELD sraamodid name="construct.c.sraamodid"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sraamodid  #顯示到畫面上

            NEXT FIELD sraamodid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraamodid
            #add-point:BEFORE FIELD sraamodid name="construct.b.sraamodid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraamodid
            
            #add-point:AFTER FIELD sraamodid name="construct.a.sraamodid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraamoddt
            #add-point:BEFORE FIELD sraamoddt name="construct.b.sraamoddt"
            
            #END add-point
 
 
         #Ctrlp:construct.c.sraacnfid
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraacnfid
            #add-point:ON ACTION controlp INFIELD sraacnfid name="construct.c.sraacnfid"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sraacnfid  #顯示到畫面上

            NEXT FIELD sraacnfid                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraacnfid
            #add-point:BEFORE FIELD sraacnfid name="construct.b.sraacnfid"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraacnfid
            
            #add-point:AFTER FIELD sraacnfid name="construct.a.sraacnfid"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraacnfdt
            #add-point:BEFORE FIELD sraacnfdt name="construct.b.sraacnfdt"
            
            #END add-point
 
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON srab004,srab005,srab006,srab007,srab008,srab011
           FROM s_detail1[1].srab004,s_detail1[1].srab005,s_detail1[1].srab006,s_detail1[1].srab007, 
               s_detail1[1].srab008,s_detail1[1].srab011
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct name="cs.body.before_construct"
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
                #Ctrlp:construct.c.page1.srab004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab004
            #add-point:ON ACTION controlp INFIELD srab004 name="construct.c.page1.srab004"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_bmaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO srab004  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO bmaa002 #特性 

            NEXT FIELD srab004                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab004
            #add-point:BEFORE FIELD srab004 name="construct.b.page1.srab004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab004
            
            #add-point:AFTER FIELD srab004 name="construct.a.page1.srab004"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.srab005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab005
            #add-point:ON ACTION controlp INFIELD srab005 name="construct.c.page1.srab005"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_bmaa002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO srab005  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO bmaa002 #特性 

            NEXT FIELD srab005                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab005
            #add-point:BEFORE FIELD srab005 name="construct.b.page1.srab005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab005
            
            #add-point:AFTER FIELD srab005 name="construct.a.page1.srab005"
            
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab006
            #add-point:BEFORE FIELD srab006 name="construct.b.page1.srab006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab006
            
            #add-point:AFTER FIELD srab006 name="construct.a.page1.srab006"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.srab006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab006
            #add-point:ON ACTION controlp INFIELD srab006 name="construct.c.page1.srab006"
            
            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab007
            #add-point:BEFORE FIELD srab007 name="construct.b.page1.srab007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab007
            
            #add-point:AFTER FIELD srab007 name="construct.a.page1.srab007"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.srab007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab007
            #add-point:ON ACTION controlp INFIELD srab007 name="construct.c.page1.srab007"
            
            #END add-point
 
 
         #Ctrlp:construct.c.page1.srab008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab008
            #add-point:ON ACTION controlp INFIELD srab008 name="construct.c.page1.srab008"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ecba002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO srab008  #顯示到畫面上

            NEXT FIELD srab008                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab008
            #add-point:BEFORE FIELD srab008 name="construct.b.page1.srab008"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab008
            
            #add-point:AFTER FIELD srab008 name="construct.a.page1.srab008"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.page1.srab011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab011
            #add-point:ON ACTION controlp INFIELD srab011 name="construct.c.page1.srab011"
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO srab011  #顯示到畫面上

            NEXT FIELD srab011                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab011
            #add-point:BEFORE FIELD srab011 name="construct.b.page1.srab011"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab011
            
            #add-point:AFTER FIELD srab011 name="construct.a.page1.srab011"
            
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
                  WHEN la_wc[li_idx].tableid = "sraa_t" 
                     LET g_wc = la_wc[li_idx].wc
                  WHEN la_wc[li_idx].tableid = "srab_t" 
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
 
{<section id="asrt300.filter" >}
#應用 a50 樣板自動產生(Version:8)
#+ filter過濾功能
PRIVATE FUNCTION asrt300_filter()
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
      CONSTRUCT g_wc_filter ON sraa001,sraa002,sraa003,sraa000
                          FROM s_browse[1].b_sraa001,s_browse[1].b_sraa002,s_browse[1].b_sraa003,s_browse[1].b_sraa000 
 
 
         BEFORE CONSTRUCT
               DISPLAY asrt300_filter_parser('sraa001') TO s_browse[1].b_sraa001
            DISPLAY asrt300_filter_parser('sraa002') TO s_browse[1].b_sraa002
            DISPLAY asrt300_filter_parser('sraa003') TO s_browse[1].b_sraa003
            DISPLAY asrt300_filter_parser('sraa000') TO s_browse[1].b_sraa000
      
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
 
      CALL asrt300_filter_show('sraa001')
   CALL asrt300_filter_show('sraa002')
   CALL asrt300_filter_show('sraa003')
   CALL asrt300_filter_show('sraa000')
 
END FUNCTION
 
{</section>}
 
{<section id="asrt300.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION asrt300_filter_parser(ps_field)
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
 
{<section id="asrt300.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION asrt300_filter_show(ps_field)
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
   LET ls_condition = asrt300_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="asrt300.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION asrt300_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point   
   DEFINE ls_wc STRING
   #add-point:query段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="query.define"
      CALL g_srab_d2.clear()
   CALL g_srab_d3.clear()
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
   CALL g_srab_d.clear()
 
   
   #add-point:query段other name="query.other"
   
   #end add-point   
   
   DISPLAY '' TO FORMONLY.idx
   DISPLAY '' TO FORMONLY.cnt
   DISPLAY '' TO FORMONLY.b_index
   DISPLAY '' TO FORMONLY.b_count
   DISPLAY '' TO FORMONLY.h_index
   DISPLAY '' TO FORMONLY.h_count
   
   CALL asrt300_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      #LET g_wc = ls_wc
      LET g_wc = " 1=2"
      CALL asrt300_browser_fill("")
      CALL asrt300_fetch("")
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
      CALL asrt300_filter_show('sraa001')
   CALL asrt300_filter_show('sraa002')
   CALL asrt300_filter_show('sraa003')
   CALL asrt300_filter_show('sraa000')
   CALL asrt300_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "-100" 
      LET g_errparam.popup = TRUE 
      CALL cl_err()
   ELSE
      CALL asrt300_fetch("F") 
      #顯示單身筆數
      CALL asrt300_idx_chk()
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="asrt300.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION asrt300_fetch(p_flag)
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
   
   LET g_sraa_m.sraa000 = g_browser[g_current_idx].b_sraa000
   LET g_sraa_m.sraa001 = g_browser[g_current_idx].b_sraa001
   LET g_sraa_m.sraa002 = g_browser[g_current_idx].b_sraa002
   LET g_sraa_m.sraa003 = g_browser[g_current_idx].b_sraa003
 
   
   #重讀DB,因TEMP有不被更新特性
   EXECUTE asrt300_master_referesh USING g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003 INTO g_sraa_m.sraa001, 
       g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000,g_sraa_m.sraastus,g_sraa_m.sraacrtid,g_sraa_m.sraacrtdp, 
       g_sraa_m.sraacrtdt,g_sraa_m.sraaownid,g_sraa_m.sraaowndp,g_sraa_m.sraamodid,g_sraa_m.sraamoddt, 
       g_sraa_m.sraacnfid,g_sraa_m.sraacnfdt,g_sraa_m.sraacrtid_desc,g_sraa_m.sraacrtdp_desc,g_sraa_m.sraaownid_desc, 
       g_sraa_m.sraaowndp_desc,g_sraa_m.sraamodid_desc,g_sraa_m.sraacnfid_desc
   
   #遮罩相關處理
   LET g_sraa_m_mask_o.* =  g_sraa_m.*
   CALL asrt300_sraa_t_mask()
   LET g_sraa_m_mask_n.* =  g_sraa_m.*
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt300_set_act_visible()   
   CALL asrt300_set_act_no_visible()
   
   #add-point:fetch段action控制 name="fetch.action_control"
   
   #end add-point  
   
   
   
   #add-point:fetch結束前 name="fetch.after"
 
   #end add-point
   
   #保存單頭舊值
   LET g_sraa_m_t.* = g_sraa_m.*
   LET g_sraa_m_o.* = g_sraa_m.*
   
   LET g_data_owner = g_sraa_m.sraaownid      
   LET g_data_dept  = g_sraa_m.sraaowndp
   
   #重新顯示   
   CALL asrt300_show()
 
   #應用 a56 樣板自動產生(Version:3)
   #檢查此單據是否需顯示BPM簽核狀況按鈕 
   IF cl_bpm_chk() THEN
      CALL cl_set_act_visible("bpm_status",TRUE)
   ELSE
      CALL cl_set_act_visible("bpm_status",FALSE)
   END IF
 
 
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt300.insert" >}
#+ 資料新增
PRIVATE FUNCTION asrt300_insert()
   #add-point:insert段define(客製用) name="insert.define_customerization"
   
   #end add-point    
   #add-point:insert段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert.define"
      DEFINE l_n      LIKE type_t.num5
   DEFINE l_where  STRING
   DEFINE l_sql    STRING
   #end add-point    
   
   #add-point:Function前置處理  name="insert.pre_function"
   
   #end add-point
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_srab_d.clear()   
 
 
   INITIALIZE g_sraa_m.* TO NULL             #DEFAULT 設定
   
   LET g_sraa000_t = NULL
   LET g_sraa001_t = NULL
   LET g_sraa002_t = NULL
   LET g_sraa003_t = NULL
 
   
   LET g_master_insert = FALSE
   
   #add-point:insert段before name="insert.before"
   
   #end add-point    
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_sraa_m.sraaownid = g_user
      LET g_sraa_m.sraaowndp = g_dept
      LET g_sraa_m.sraacrtid = g_user
      LET g_sraa_m.sraacrtdp = g_dept 
      LET g_sraa_m.sraacrtdt = cl_get_current()
      LET g_sraa_m.sraamodid = g_user
      LET g_sraa_m.sraamoddt = cl_get_current()
      LET g_sraa_m.sraastus = 'N'
 
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_sraa_m.sraastus = "N"
 
  
      #add-point:單頭預設值 name="insert.default"
            CALL g_srab_d2.clear()  
      CALL g_srab_d3.clear()  
      CALL s_control_get_sql('srza012','0','6',g_user,g_dept) RETURNING l_success,l_where
      LET l_n = 0 
      LET l_sql = "SELECT COUNT(*) ",
                  " FROM srza_t ",
                  "WHERE srzaent = '",g_enterprise,"'",
                  "  AND srzasite = '",g_site,"'",
                  "  AND srzastus = 'Y' ",
                  "  AND ",l_where
      PREPARE sel_contorl_pre FROM l_sql
      EXECUTE sel_contorl_pre INTO l_n
      IF l_n = 1 THEN
         LET l_sql = "SELECT srza001",
                     " FROM srza_t ",
                     "WHERE srzaent = '",g_enterprise,"'",
                     "  AND srzasite = '",g_site,"'",
                     "  AND srzastus = 'Y' ",
                     "  AND ",l_where
         PREPARE sel_contorl_pre1 FROM l_sql
         EXECUTE sel_contorl_pre1 INTO g_sraa_m.sraa001
      END IF
      LET g_sraa_m.sraa002 = YEAR(g_today)
      LET g_sraa_m.sraa003 = MONTH(g_today)
      CALL asrt300_def_sraa000()
      INITIALIZE g_sraa_m_t.* TO NULL
      #end add-point 
      
      #保存單頭舊值(用於資料輸入錯誤還原預設值時使用)
      LET g_sraa_m_t.* = g_sraa_m.*
      LET g_sraa_m_o.* = g_sraa_m.*
      
      #顯示狀態(stus)圖片
            #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sraa_m.sraastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "C"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/closed.png")
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
 
 
 
    
      CALL asrt300_input("a")
      
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
         INITIALIZE g_sraa_m.* TO NULL
         INITIALIZE g_srab_d TO NULL
 
         #add-point:取消新增後 name="insert.cancel"
         
         #end add-point 
         CALL asrt300_show()
         RETURN
      END IF
      
      LET INT_FLAG = 0
      #CALL g_srab_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   #根據資料狀態切換action狀態
   CALL cl_set_act_visible("statechange,modify,modify_detail,delete,reproduce", TRUE)
   CALL asrt300_set_act_visible()   
   CALL asrt300_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sraa000_t = g_sraa_m.sraa000
   LET g_sraa001_t = g_sraa_m.sraa001
   LET g_sraa002_t = g_sraa_m.sraa002
   LET g_sraa003_t = g_sraa_m.sraa003
 
   
   #組合新增資料的條件
   LET g_add_browse = " sraaent = " ||g_enterprise|| " AND sraasite = '" ||g_site|| "' AND",
                      " sraa000 = '", g_sraa_m.sraa000, "' "
                      ," AND sraa001 = '", g_sraa_m.sraa001, "' "
                      ," AND sraa002 = '", g_sraa_m.sraa002, "' "
                      ," AND sraa003 = '", g_sraa_m.sraa003, "' "
 
                      
   #add-point:組合新增資料的條件後 name="insert.after.add_browse"
   
   #end add-point
      
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL asrt300_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   CLOSE asrt300_cl
   
   CALL asrt300_idx_chk()
   
   #撈取異動後的資料(主要是帶出reference)
   EXECUTE asrt300_master_referesh USING g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003 INTO g_sraa_m.sraa001, 
       g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000,g_sraa_m.sraastus,g_sraa_m.sraacrtid,g_sraa_m.sraacrtdp, 
       g_sraa_m.sraacrtdt,g_sraa_m.sraaownid,g_sraa_m.sraaowndp,g_sraa_m.sraamodid,g_sraa_m.sraamoddt, 
       g_sraa_m.sraacnfid,g_sraa_m.sraacnfdt,g_sraa_m.sraacrtid_desc,g_sraa_m.sraacrtdp_desc,g_sraa_m.sraaownid_desc, 
       g_sraa_m.sraaowndp_desc,g_sraa_m.sraamodid_desc,g_sraa_m.sraacnfid_desc
   
   
   #遮罩相關處理
   LET g_sraa_m_mask_o.* =  g_sraa_m.*
   CALL asrt300_sraa_t_mask()
   LET g_sraa_m_mask_n.* =  g_sraa_m.*
   
   #將資料顯示到畫面上
   DISPLAY BY NAME g_sraa_m.sraa001,g_sraa_m.sraa001_desc,g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000, 
       g_sraa_m.sraastus,g_sraa_m.sraacrtid,g_sraa_m.sraacrtid_desc,g_sraa_m.sraacrtdp,g_sraa_m.sraacrtdp_desc, 
       g_sraa_m.sraacrtdt,g_sraa_m.sraaownid,g_sraa_m.sraaownid_desc,g_sraa_m.sraaowndp,g_sraa_m.sraaowndp_desc, 
       g_sraa_m.sraamodid,g_sraa_m.sraamodid_desc,g_sraa_m.sraamoddt,g_sraa_m.sraacnfid,g_sraa_m.sraacnfid_desc, 
       g_sraa_m.sraacnfdt
   
   #add-point:新增結束後 name="insert.after"
   
   #end add-point 
   
   LET g_data_owner = g_sraa_m.sraaownid      
   LET g_data_dept  = g_sraa_m.sraaowndp
   
   #功能已完成,通報訊息中心
   CALL asrt300_msgcentre_notify('insert')
   
END FUNCTION
 
{</section>}
 
{<section id="asrt300.modify" >}
#+ 資料修改
PRIVATE FUNCTION asrt300_modify()
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
   LET g_sraa_m_t.* = g_sraa_m.*
   LET g_sraa_m_o.* = g_sraa_m.*
   
   IF g_sraa_m.sraa000 IS NULL
   OR g_sraa_m.sraa001 IS NULL
   OR g_sraa_m.sraa002 IS NULL
   OR g_sraa_m.sraa003 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   ERROR ""
  
   LET g_sraa000_t = g_sraa_m.sraa000
   LET g_sraa001_t = g_sraa_m.sraa001
   LET g_sraa002_t = g_sraa_m.sraa002
   LET g_sraa003_t = g_sraa_m.sraa003
 
   CALL s_transaction_begin()
   
   OPEN asrt300_cl USING g_enterprise, g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt300_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE asrt300_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE asrt300_master_referesh USING g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003 INTO g_sraa_m.sraa001, 
       g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000,g_sraa_m.sraastus,g_sraa_m.sraacrtid,g_sraa_m.sraacrtdp, 
       g_sraa_m.sraacrtdt,g_sraa_m.sraaownid,g_sraa_m.sraaowndp,g_sraa_m.sraamodid,g_sraa_m.sraamoddt, 
       g_sraa_m.sraacnfid,g_sraa_m.sraacnfdt,g_sraa_m.sraacrtid_desc,g_sraa_m.sraacrtdp_desc,g_sraa_m.sraaownid_desc, 
       g_sraa_m.sraaowndp_desc,g_sraa_m.sraamodid_desc,g_sraa_m.sraacnfid_desc
   
   #檢查是否允許此動作
   IF NOT asrt300_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_sraa_m_mask_o.* =  g_sraa_m.*
   CALL asrt300_sraa_t_mask()
   LET g_sraa_m_mask_n.* =  g_sraa_m.*
   
   
   
   #add-point:modify段show之前 name="modify.before_show"
   
   #end add-point  
   
   #LET l_wc2_table1 = g_wc2_table1
   #LET g_wc2_table1 = " 1=1"
 
 
   
   CALL asrt300_show()
   #add-point:modify段show之後 name="modify.after_show"
   
   #end add-point
   
   #LET g_wc2_table1 = l_wc2_table1
 
 
    
   WHILE TRUE
      LET g_sraa000_t = g_sraa_m.sraa000
      LET g_sraa001_t = g_sraa_m.sraa001
      LET g_sraa002_t = g_sraa_m.sraa002
      LET g_sraa003_t = g_sraa_m.sraa003
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_sraa_m.sraamodid = g_user 
LET g_sraa_m.sraamoddt = cl_get_current()
LET g_sraa_m.sraamodid_desc = cl_get_username(g_sraa_m.sraamodid)
      
      #add-point:modify段修改前 name="modify.before_input"
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_sraa_m.sraastus MATCHES "[DR]" THEN 
         LET g_sraa_m.sraastus = "N"
      END IF

      #end add-point
      
      #欄位更改
      LET g_loc = 'n'
      LET g_update = FALSE
      LET g_master_commit = "N"
      CALL asrt300_input("u")
      LET g_loc = 'n'
 
      #add-point:modify段修改後 name="modify.after_input"
      
      #end add-point
      
      IF g_update OR NOT INT_FLAG THEN
         #若有modid跟moddt則進行update
         UPDATE sraa_t SET (sraamodid,sraamoddt) = (g_sraa_m.sraamodid,g_sraa_m.sraamoddt)
          WHERE sraaent = g_enterprise AND sraasite = g_site AND sraa000 = g_sraa000_t
            AND sraa001 = g_sraa001_t
            AND sraa002 = g_sraa002_t
            AND sraa003 = g_sraa003_t
 
      END IF
    
      IF INT_FLAG THEN
         CALL s_transaction_end('N','0')
         LET INT_FLAG = 0
         #若單頭無commit則還原
         IF g_master_commit = "N" THEN
            LET g_sraa_m.* = g_sraa_m_t.*
            CALL asrt300_show()
         END IF
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = '' 
         LET g_errparam.code = 9001 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
         RETURN
      END IF 
                  
      #若單頭key欄位有變更
      IF g_sraa_m.sraa000 != g_sraa_m_t.sraa000
      OR g_sraa_m.sraa001 != g_sraa_m_t.sraa001
      OR g_sraa_m.sraa002 != g_sraa_m_t.sraa002
      OR g_sraa_m.sraa003 != g_sraa_m_t.sraa003
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前 name="modify.body.b_fk_update"
         
         #end add-point
         
         #更新單身key值
         UPDATE srab_t SET srab000 = g_sraa_m.sraa000
                                       ,srab001 = g_sraa_m.sraa001
                                       ,srab002 = g_sraa_m.sraa002
                                       ,srab003 = g_sraa_m.sraa003
 
          WHERE srabent = g_enterprise AND srabsite = g_site AND srab000 = g_sraa_m_t.sraa000
            AND srab001 = g_sraa_m_t.sraa001
            AND srab002 = g_sraa_m_t.sraa002
            AND srab003 = g_sraa_m_t.sraa003
 
            
         #add-point:單身fk修改中 name="modify.body.m_fk_update"
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            #   INITIALIZE g_errparam TO NULL 
            #   LET g_errparam.extend = "srab_t" 
            #   LET g_errparam.code = "std-00009" 
            #   LET g_errparam.popup = TRUE 
            #   CALL cl_err()
            #   CALL s_transaction_end('N','0')
            #   CONTINUE WHILE
            WHEN SQLCA.SQLCODE #其他錯誤
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "srab_t:",SQLERRMESSAGE 
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
   CALL asrt300_set_act_visible()   
   CALL asrt300_set_act_no_visible()
 
   #組合新增資料的條件
   LET g_add_browse = " sraaent = " ||g_enterprise|| " AND sraasite = '" ||g_site|| "' AND",
                      " sraa000 = '", g_sraa_m.sraa000, "' "
                      ," AND sraa001 = '", g_sraa_m.sraa001, "' "
                      ," AND sraa002 = '", g_sraa_m.sraa002, "' "
                      ," AND sraa003 = '", g_sraa_m.sraa003, "' "
 
   #填到對應位置
   CALL asrt300_browser_fill("")
 
   CLOSE asrt300_cl
   
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL asrt300_msgcentre_notify('modify')
 
END FUNCTION 
 
{</section>}
 
{<section id="asrt300.input" >}
#+ 資料輸入
PRIVATE FUNCTION asrt300_input(p_cmd)
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
      DEFINE l_srza012        LIKE srza_t.srza012
   DEFINE l_srza004        LIKE srza_t.srza004
   DEFINE l_imae032        LIKE imae_t.imae032
   DEFINE l_time           DATETIME YEAR TO SECOND
   DEFINE l_where          STRING
   DEFINE l_where1         STRING
   DEFINE l_imaa005        LIKE imaa_t.imaa005
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
   DISPLAY BY NAME g_sraa_m.sraa001,g_sraa_m.sraa001_desc,g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000, 
       g_sraa_m.sraastus,g_sraa_m.sraacrtid,g_sraa_m.sraacrtid_desc,g_sraa_m.sraacrtdp,g_sraa_m.sraacrtdp_desc, 
       g_sraa_m.sraacrtdt,g_sraa_m.sraaownid,g_sraa_m.sraaownid_desc,g_sraa_m.sraaowndp,g_sraa_m.sraaowndp_desc, 
       g_sraa_m.sraamodid,g_sraa_m.sraamodid_desc,g_sraa_m.sraamoddt,g_sraa_m.sraacnfid,g_sraa_m.sraacnfid_desc, 
       g_sraa_m.sraacnfdt
   
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
   LET g_forupd_sql = "SELECT srab004,srab005,srab006,srab007,srab008,srab011,srab012,srab009 FROM srab_t  
       WHERE srabent=? AND srabsite=? AND srab000=? AND srab001=? AND srab002=? AND srab003=? AND srab004=?  
       AND srab005=? AND srab006=? AND srab009=? FOR UPDATE"
   #add-point:input段define_sql name="input.after_define_sql"
      LET g_forupd_sql = "SELECT srab004,srab005,srab006,srab007,srab008,srab011,srab012,'1000/01/01','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','' FROM srab_t WHERE srabent=? AND srabsite=? AND srab000=? AND srab001=? AND srab002=? AND srab003=? AND srab004=? AND srab005=? AND srab006=?  FOR UPDATE"
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   LET g_forupd_sql = cl_sql_add_mask(g_forupd_sql)              #遮蔽特定資料
   DECLARE asrt300_bcl CURSOR FROM g_forupd_sql
   
 
   
 
 
   #add-point:input段define_sql name="input.other_sql"
   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL asrt300_set_entry(p_cmd)
   #add-point:set_entry後 name="input.after_set_entry"
      LET g_errshow = 1 
   #end add-point
   CALL asrt300_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000,g_sraa_m.sraastus 
 
   
   LET lb_reproduce = FALSE
   LET l_ac_t = 1
   
   #關閉被遮罩相關欄位輸入, 無法確定USER是否會需要輸入此欄位
   #因此先行關閉, 若有需要可於下方add-point中自行開啟
   CALL cl_mask_set_no_entry()
   
   #add-point:資料輸入前 name="input.before_input"
   
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
{</section>}
 
{<section id="asrt300.input.head" >}
      #單頭段
      INPUT BY NAME g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000,g_sraa_m.sraastus  
 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            IF s_transaction_chk("N",0) THEN
               CALL s_transaction_begin()
            END IF
            OPEN asrt300_cl USING g_enterprise, g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt300_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt300_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #因應離開單頭後已寫入資料庫, 若重新回到單頭則視為修改
            #因此需於此處開啟/關閉欄位
            CALL asrt300_set_entry(p_cmd)
            #add-point:資料輸入前 name="input.m.before_input"
            
            #end add-point
            CALL asrt300_set_no_entry(p_cmd)
    
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraa001
            
            #add-point:AFTER FIELD sraa001 name="input.a.sraa001"
                        CALL asrt300_desc()
            IF NOT cl_null(g_sraa_m.sraa001) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_sraa_m.sraa001
               #160318-00025#4--add--str
               LET g_errshow = TRUE 
               LET g_chkparam.err_str[1] = "asr-00014:sub-01302|asri001|",cl_get_progname("asri001",g_lang,"2"),"|:EXEPROGasri001"
               #160318-00025#4--add--end
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_srza001") THEN
                  LET g_sraa_m.sraa001 = g_sraa_m_t.sraa001
                  CALL asrt300_desc()
                  NEXT FIELD sraa001
               END IF
               CALL asrt300_chk_sraa001()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_sraa_m.sraa001
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_sraa_m.sraa001 = g_sraa_m_t.sraa001
                  CALL asrt300_desc()
                  NEXT FIELD sraa001
               END IF
            END IF
            CALL asrt300_def_sraa000()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraa001
            #add-point:BEFORE FIELD sraa001 name="input.b.sraa001"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sraa001
            #add-point:ON CHANGE sraa001 name="input.g.sraa001"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraa002
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sraa_m.sraa002,"0","1","","","azz-00079",1) THEN
               NEXT FIELD sraa002
            END IF 
 
 
 
            #add-point:AFTER FIELD sraa002 name="input.a.sraa002"
                        CALL asrt300_def_sraa000()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraa002
            #add-point:BEFORE FIELD sraa002 name="input.b.sraa002"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sraa002
            #add-point:ON CHANGE sraa002 name="input.g.sraa002"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraa003
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_sraa_m.sraa003,"1","1","12","1","azz-00087",1) THEN
               NEXT FIELD sraa003
            END IF 
 
 
 
            #add-point:AFTER FIELD sraa003 name="input.a.sraa003"
                        CALL asrt300_def_sraa000()
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraa003
            #add-point:BEFORE FIELD sraa003 name="input.b.sraa003"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sraa003
            #add-point:ON CHANGE sraa003 name="input.g.sraa003"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraa000
            #add-point:BEFORE FIELD sraa000 name="input.b.sraa000"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraa000
            
            #add-point:AFTER FIELD sraa000 name="input.a.sraa000"
                        #此段落由子樣板a05產生
            IF  NOT cl_null(g_sraa_m.sraa000) AND NOT cl_null(g_sraa_m.sraa001) AND NOT cl_null(g_sraa_m.sraa002) AND NOT cl_null(g_sraa_m.sraa003) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_sraa_m.sraa000 != g_sraa000_t  OR g_sraa_m.sraa001 != g_sraa001_t  OR g_sraa_m.sraa002 != g_sraa002_t  OR g_sraa_m.sraa003 != g_sraa003_t )) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sraa_t WHERE "||"sraaent = '" ||g_enterprise|| "' AND sraasite = '" ||g_site|| "' AND "||"sraa000 = '"||g_sraa_m.sraa000 ||"' AND "|| "sraa001 = '"||g_sraa_m.sraa001 ||"' AND "|| "sraa002 = '"||g_sraa_m.sraa002 ||"' AND "|| "sraa003 = '"||g_sraa_m.sraa003 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF



            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sraa000
            #add-point:ON CHANGE sraa000 name="input.g.sraa000"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sraastus
            #add-point:BEFORE FIELD sraastus name="input.b.sraastus"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sraastus
            
            #add-point:AFTER FIELD sraastus name="input.a.sraastus"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sraastus
            #add-point:ON CHANGE sraastus name="input.g.sraastus"
            
            #END add-point 
 
 
 #欄位檢查
                  #Ctrlp:input.c.sraa001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraa001
            #add-point:ON ACTION controlp INFIELD sraa001 name="input.c.sraa001"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sraa_m.sraa001             #給予default值

            #給予arg
            CALL s_control_get_sql('srza012','0','6',g_user,g_dept) RETURNING l_success,g_qryparam.where         
            CALL q_srza001()                                #呼叫開窗

            LET g_sraa_m.sraa001 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sraa_m.sraa001 TO sraa001              #顯示到畫面上
            CALL asrt300_desc()
            NEXT FIELD sraa001                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.sraa002
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraa002
            #add-point:ON ACTION controlp INFIELD sraa002 name="input.c.sraa002"
            
            #END add-point
 
 
         #Ctrlp:input.c.sraa003
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraa003
            #add-point:ON ACTION controlp INFIELD sraa003 name="input.c.sraa003"
            
            #END add-point
 
 
         #Ctrlp:input.c.sraa000
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraa000
            #add-point:ON ACTION controlp INFIELD sraa000 name="input.c.sraa000"
            
            #END add-point
 
 
         #Ctrlp:input.c.sraastus
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sraastus
            #add-point:ON ACTION controlp INFIELD sraastus name="input.c.sraastus"
            
            #END add-point
 
 
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_err_collect_show()      #錯誤訊息統整顯示
            #CALL cl_showmsg()
            DISPLAY BY NAME g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003
                        
            #add-point:單頭INPUT後 name="input.head.after_input"
            
            #end add-point
                        
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前 name="input.head.b_insert"
               CALL asrt300_chk_sraa()
                  IF NOT cl_null(g_errno) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = g_errno
                     LET g_errparam.extend = g_sraa_m.sraa001
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     NEXT FIELD sraa001
                  END IF
               #end add-point
               
               INSERT INTO sraa_t (sraaent, sraasite,sraa001,sraa002,sraa003,sraa000,sraastus,sraacrtid, 
                   sraacrtdp,sraacrtdt,sraaownid,sraaowndp,sraamodid,sraamoddt,sraacnfid,sraacnfdt)
               VALUES (g_enterprise, g_site,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000, 
                   g_sraa_m.sraastus,g_sraa_m.sraacrtid,g_sraa_m.sraacrtdp,g_sraa_m.sraacrtdt,g_sraa_m.sraaownid, 
                   g_sraa_m.sraaowndp,g_sraa_m.sraamodid,g_sraa_m.sraamoddt,g_sraa_m.sraacnfid,g_sraa_m.sraacnfdt)  
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "g_sraa_m:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭新增中 name="input.head.m_insert"
               IF g_sraa_m.sraa000 > 1 THEN
                  IF NOT asrt300_ins_srab_batch(1,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003) THEN
                     CALL s_transaction_end('N','0')
                     NEXT FIELD sraa001
                  ELSE
                     CALL asrt300_b_fill()
                  END IF
               END IF
               IF l_cmd_t = 'r' THEN
                  IF NOT asrt300_ins_srab_batch(g_sraa000_t,g_sraa001_t,g_sraa002_t,g_sraa003_t) THEN
                     CALL s_transaction_end('N','0')
                     NEXT FIELD sraa001
                  ELSE
                     CALL asrt300_b_fill()
                  END IF
               END IF
               #end add-point
               
               
               
               
               #add-point:單頭新增後 name="input.head.a_insert"
                                 
               #end add-point
               CALL s_transaction_end('Y','0') 
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL asrt300_detail_reproduce()
                  #因應特定程式需求, 重新刷新單身資料
                  CALL asrt300_b_fill()
                  CALL asrt300_b_fill2('0')
               END IF
               
               #add-point:單頭新增後 name="input.head.a_insert2"
               
               #end add-point
               
               LET g_master_insert = TRUE
               
               LET p_cmd = 'u'
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前 name="input.head.b_update"
                              CALL asrt300_chk_sraa()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_sraa_m.sraa001
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD sraa001
               END IF
               #end add-point
               
               #將遮罩欄位還原
               CALL asrt300_sraa_t_mask_restore('restore_mask_o')
               
               UPDATE sraa_t SET (sraa001,sraa002,sraa003,sraa000,sraastus,sraacrtid,sraacrtdp,sraacrtdt, 
                   sraaownid,sraaowndp,sraamodid,sraamoddt,sraacnfid,sraacnfdt) = (g_sraa_m.sraa001, 
                   g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000,g_sraa_m.sraastus,g_sraa_m.sraacrtid, 
                   g_sraa_m.sraacrtdp,g_sraa_m.sraacrtdt,g_sraa_m.sraaownid,g_sraa_m.sraaowndp,g_sraa_m.sraamodid, 
                   g_sraa_m.sraamoddt,g_sraa_m.sraacnfid,g_sraa_m.sraacnfdt)
                WHERE sraaent = g_enterprise AND sraasite = g_site AND sraa000 = g_sraa000_t
                  AND sraa001 = g_sraa001_t
                  AND sraa002 = g_sraa002_t
                  AND sraa003 = g_sraa003_t
 
               IF SQLCA.SQLCODE THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = "sraa_t:",SQLERRMESSAGE 
                  LET g_errparam.code = SQLCA.SQLCODE 
                  LET g_errparam.popup = TRUE 
                  CALL s_transaction_end('N','0')
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
               
               #add-point:單頭修改中 name="input.head.m_update"
               
               #end add-point
               
               
               
               
               #將遮罩欄位進行遮蔽
               CALL asrt300_sraa_t_mask_restore('restore_mask_n')
               
               #修改歷程記錄(單頭修改)
               LET g_log1 = util.JSON.stringify(g_sraa_m_t)
               LET g_log2 = util.JSON.stringify(g_sraa_m)
               IF NOT cl_log_modified_record(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               ELSE
                  CALL s_transaction_end('Y','0')
               END IF
               
               #add-point:單頭修改後 name="input.head.a_update"
               
               #end add-point
            END IF
            
            LET g_master_commit = "Y"
            LET g_sraa000_t = g_sraa_m.sraa000
            LET g_sraa001_t = g_sraa_m.sraa001
            LET g_sraa002_t = g_sraa_m.sraa002
            LET g_sraa003_t = g_sraa_m.sraa003
 
            
      END INPUT
   
 
{</section>}
 
{<section id="asrt300.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_srab_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,WITHOUT DEFAULTS, #MAXCOUNT = g_max_rec,
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            #add-point:資料輸入前 name="input.body.before_input2"
            
            #end add-point
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_srab_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL asrt300_b_fill()
            #如果一直都在單身1則控制筆數位置
            IF g_loc = 'm' AND g_rec_b != 0 THEN
               CALL FGL_SET_ARR_CURR(g_idx_group.getValue("'1',"))
            END IF
            LET g_loc = 'm'
            LET g_rec_b = g_srab_d.getLength()
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
            OPEN asrt300_cl USING g_enterprise, g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003
            IF SQLCA.SQLCODE THEN   #(ver:78)
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "OPEN asrt300_cl:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
               LET g_errparam.popup = TRUE 
               CLOSE asrt300_cl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               RETURN
            END IF
            
            LET g_rec_b = g_srab_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_srab_d[l_ac].srab004 IS NOT NULL
               AND g_srab_d[l_ac].srab005 IS NOT NULL
               AND g_srab_d[l_ac].srab006 IS NOT NULL
               AND g_srab_d[l_ac].srab009 IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_srab_d_t.* = g_srab_d[l_ac].*  #BACKUP
               LET g_srab_d_o.* = g_srab_d[l_ac].*  #BACKUP
               CALL asrt300_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b name="input.body.after_set_entry_b"
               
               #end add-point  
               CALL asrt300_set_no_entry_b(l_cmd)
               IF NOT asrt300_lock_b("srab_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH asrt300_bcl INTO g_srab_d[l_ac].srab004,g_srab_d[l_ac].srab005,g_srab_d[l_ac].srab006, 
                      g_srab_d[l_ac].srab007,g_srab_d[l_ac].srab008,g_srab_d[l_ac].srab011,g_srab_d[l_ac].srab012, 
                      g_srab_d[l_ac].srab009
                  IF SQLCA.SQLCODE THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = g_srab_d_t.srab004,":",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF
                  
                  #遮罩相關處理
                  LET g_srab_d_mask_o[l_ac].* =  g_srab_d[l_ac].*
                  CALL asrt300_srab_t_mask()
                  LET g_srab_d_mask_n[l_ac].* =  g_srab_d[l_ac].*
                  
                  LET g_bfill = "N"
                  CALL asrt300_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row name="input.body.before_row"
                        IF g_rec_b >= l_ac 
               AND g_srab_d[l_ac].srab004 IS NOT NULL
               AND g_srab_d[l_ac].srab005 IS NOT NULL
               AND g_srab_d[l_ac].srab006 IS NOT NULL
            THEN
               LET l_cmd='u'
            ELSE
               LET l_cmd = 'a'
            END IF
            CALL asrt300_b_fill_1()
            CALL asrt300_b_fill_2()
            LET g_srab_d_t.* = g_srab_d[l_ac].*  
            LET g_srab_d_o.* = g_srab_d[l_ac].*  
            CALL asrt300_set_entry_b(l_cmd)
            CALL asrt300_set_no_required_b(l_cmd)
            CALL asrt300_set_required_b(l_cmd)
            CALL asrt300_set_no_entry_b(l_cmd)
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
            INITIALIZE g_srab_d[l_ac].* TO NULL 
            INITIALIZE g_srab_d_t.* TO NULL 
            INITIALIZE g_srab_d_o.* TO NULL 
            #公用欄位給值(單身)
            
            #自定義預設值
                  LET g_srab_d[l_ac].l_srab010_1_1 = "0"
      LET g_srab_d[l_ac].l_srab010_1_2 = "0"
      LET g_srab_d[l_ac].l_srab010_1_3 = "0"
      LET g_srab_d[l_ac].l_srab010_1_4 = "0"
      LET g_srab_d[l_ac].l_srab010_1_5 = "0"
      LET g_srab_d[l_ac].l_srab010_1_6 = "0"
      LET g_srab_d[l_ac].l_srab010_1_7 = "0"
      LET g_srab_d[l_ac].l_srab010_1_8 = "0"
      LET g_srab_d[l_ac].l_srab010_1_9 = "0"
      LET g_srab_d[l_ac].l_srab010_1_10 = "0"
      LET g_srab_d[l_ac].l_srab010_1_11 = "0"
      LET g_srab_d[l_ac].l_srab010_1_12 = "0"
      LET g_srab_d[l_ac].l_srab010_1_13 = "0"
      LET g_srab_d[l_ac].l_srab010_1_14 = "0"
      LET g_srab_d[l_ac].l_srab010_1_15 = "0"
      LET g_srab_d[l_ac].l_srab010_1_16 = "0"
      LET g_srab_d[l_ac].l_srab010_1_17 = "0"
      LET g_srab_d[l_ac].l_srab010_1_18 = "0"
      LET g_srab_d[l_ac].l_srab010_1_19 = "0"
      LET g_srab_d[l_ac].l_srab010_1_20 = "0"
      LET g_srab_d[l_ac].l_srab010_1_21 = "0"
      LET g_srab_d[l_ac].l_srab010_1_22 = "0"
      LET g_srab_d[l_ac].l_srab010_1_23 = "0"
      LET g_srab_d[l_ac].l_srab010_1_24 = "0"
      LET g_srab_d[l_ac].l_srab010_1_25 = "0"
      LET g_srab_d[l_ac].l_srab010_1_26 = "0"
      LET g_srab_d[l_ac].l_srab010_1_27 = "0"
      LET g_srab_d[l_ac].l_srab010_1_28 = "0"
      LET g_srab_d[l_ac].l_srab010_1_29 = "0"
      LET g_srab_d[l_ac].l_srab010_1_30 = "0"
      LET g_srab_d[l_ac].l_srab010_1_31 = "0"
      LET g_srab_d[l_ac].sum = "0"
 
            #add-point:modify段before備份 name="input.body.insert.before_bak"
            
            #end add-point
            LET g_srab_d_t.* = g_srab_d[l_ac].*     #新輸入資料
            LET g_srab_d_o.* = g_srab_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL asrt300_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b name="input.body.insert.after_set_entry_b"
            
            #end add-point
            CALL asrt300_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_srab_d[li_reproduce_target].* = g_srab_d[li_reproduce].*
 
               LET g_srab_d[li_reproduce_target].srab004 = NULL
               LET g_srab_d[li_reproduce_target].srab005 = NULL
               LET g_srab_d[li_reproduce_target].srab006 = NULL
               LET g_srab_d[li_reproduce_target].srab009 = NULL
 
            END IF
            
 
            #add-point:modify段before insert name="input.body.before_insert"
                        INITIALIZE g_srab_d_t.* TO NULL            
            INITIALIZE g_srab_d_o.* TO NULL 
            SELECT srza004 INTO l_srza004
              FROM srza_t
             WHERE srzaent = g_enterprise
               AND srzasite = g_site
               AND srza001 = g_sraa_m.sraa001
            IF l_srza004 = 'Y' THEN
               LET g_srab_d[l_ac].srab007 = 'Y'
            ELSE
               LET g_srab_d[l_ac].srab007 = 'N'
            END IF
            CALL asrt300_set_entry_b(l_cmd)
            CALL asrt300_set_no_required_b(l_cmd)
            CALL asrt300_set_required_b(l_cmd)
            CALL asrt300_set_no_entry_b(l_cmd)
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
            
            IF cl_null(g_srab_d[l_ac].srab005) THEN
               LET g_srab_d[l_ac].srab005 = ' '
            END IF
            IF cl_null(g_srab_d[l_ac].srab006) THEN
               LET g_srab_d[l_ac].srab006 = ' '
            END IF
            IF NOT asrt300_chk_date() THEN
               CALL s_transaction_end('N','0') 
               CANCEL INSERT
               NEXT FIELD srab004
            END IF
            IF NOT asrt300_ins_srac() THEN
               CALL s_transaction_end('N','0') 
               CANCEL INSERT
            END IF
            CALL s_transaction_end('Y','0')
            ERROR 'INSERT O.K'
            LET g_rec_b = g_rec_b + 1
            IF FALSE THEN
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(1) INTO l_count FROM srab_t 
             WHERE srabent = g_enterprise AND srabsite = g_site AND srab000 = g_sraa_m.sraa000
               AND srab001 = g_sraa_m.sraa001
               AND srab002 = g_sraa_m.sraa002
               AND srab003 = g_sraa_m.sraa003
 
               AND srab004 = g_srab_d[l_ac].srab004
               AND srab005 = g_srab_d[l_ac].srab005
               AND srab006 = g_srab_d[l_ac].srab006
               AND srab009 = g_srab_d[l_ac].srab009
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前 name="input.body.b_insert"
                              IF cl_null(g_srab_d[l_ac].srab005) THEN
                  LET g_srab_d[l_ac].srab005 = ' '
               END IF
               IF cl_null(g_srab_d[l_ac].srab006) THEN
                  LET g_srab_d[l_ac].srab006 = ' '
               END IF
               
               SELECT MAX(srab012) INTO g_srab_d[l_ac].srab012 FROM srab_t
                WHERE SUBSTR(srab012,1,4) = g_sraa_m.sraa002
                  AND SUBSTR(srab012,5,2) = g_sraa_m.sraa003 
                  AND srabent = g_enterprise   #160905-00007#15 by 08172                  
               IF NOT cl_null(g_srab_d[l_ac].srab012) THEN
                  LET g_srab_d[l_ac].srab012 = g_sraa_m.sraa002 USING '&&&&',g_sraa_m.sraa003 USING "&&",
                                               g_srab_d[l_ac].srab012[7,20] USING '&&&&&&&&&&&&&&' + 1
               ELSE                                                               
                  LET g_srab_d[l_ac].srab012 = g_sraa_m.sraa002 USING '&&&&',g_sraa_m.sraa003 USING "&&",
                                               '00000000000001'                  
               END IF  
               #end add-point
            
               #同步新增到同層的table
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sraa_m.sraa000
               LET gs_keys[2] = g_sraa_m.sraa001
               LET gs_keys[3] = g_sraa_m.sraa002
               LET gs_keys[4] = g_sraa_m.sraa003
               LET gs_keys[5] = g_srab_d[g_detail_idx].srab004
               LET gs_keys[6] = g_srab_d[g_detail_idx].srab005
               LET gs_keys[7] = g_srab_d[g_detail_idx].srab006
               LET gs_keys[8] = g_srab_d[g_detail_idx].srab009
               CALL asrt300_insert_b('srab_t',gs_keys,"'1'")
                           
               #add-point:單身新增後 name="input.body.a_insert"
                              IF NOT asrt300_ins_srac() THEN
                  CALL s_transaction_end('N','0') 
                  CANCEL INSERT
               END IF
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'INSERT' 
               LET g_errparam.code = "std-00006" 
               LET g_errparam.popup = TRUE 
               INITIALIZE g_srab_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CALL cl_err()
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLCODE THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "srab_t:",SQLERRMESSAGE 
               LET g_errparam.code = SQLCA.SQLCODE 
               LET g_errparam.popup = TRUE 
               CALL s_transaction_end('N','0')                    
               CALL cl_err()
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL asrt300_b_fill()
               #資料多語言用-增/改
               
               #add-point:input段-after_insert name="input.body.a_insert2"
                              END IF
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
                              DELETE FROM srab_t
                WHERE srabent = g_enterprise 
                  AND srabsite = g_site 
                  AND srab000 = g_sraa_m.sraa000 
                  AND srab001 = g_sraa_m.sraa001 
                  AND srab002 = g_sraa_m.sraa002
                  AND srab003 = g_sraa_m.sraa003 
                  AND srab004 = g_srab_d_t.srab004
                  AND srab005 = g_srab_d_t.srab005
                  AND srab006 = g_srab_d_t.srab006
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "srab_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')
                  CANCEL DELETE   
               ELSE
                  LET g_rec_b = g_rec_b-1
                  IF NOT asrt300_chk_srac() THEN
                     CALL s_transaction_end('N','0')
                  END IF
                  CALL s_transaction_end('Y','0')
               END IF 
               CLOSE asrt300_bcl
               LET l_count = g_srab_d.getLength()  
               IF FALSE THEN
               #end add-point 
               
               #取得該筆資料key值
               INITIALIZE gs_keys TO NULL
               LET gs_keys[01] = g_sraa_m.sraa000
               LET gs_keys[gs_keys.getLength()+1] = g_sraa_m.sraa001
               LET gs_keys[gs_keys.getLength()+1] = g_sraa_m.sraa002
               LET gs_keys[gs_keys.getLength()+1] = g_sraa_m.sraa003
 
               LET gs_keys[gs_keys.getLength()+1] = g_srab_d_t.srab004
               LET gs_keys[gs_keys.getLength()+1] = g_srab_d_t.srab005
               LET gs_keys[gs_keys.getLength()+1] = g_srab_d_t.srab006
               LET gs_keys[gs_keys.getLength()+1] = g_srab_d_t.srab009
 
            
               #刪除同層單身
               IF NOT asrt300_delete_b('srab_t',gs_keys,"'1'") THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt300_bcl
                  CANCEL DELETE
               END IF
    
               #刪除下層單身
               IF NOT asrt300_key_delete_b(gs_keys,'srab_t') THEN
                  CALL s_transaction_end('N','0')
                  CLOSE asrt300_bcl
                  CANCEL DELETE
               END IF
               
               #刪除多語言
               
 
               
               #add-point:單身刪除中 name="input.body.m_delete"
               
               #end add-point 
               
               CALL s_transaction_end('Y','0')
               CLOSE asrt300_bcl
            
               LET g_rec_b = g_rec_b-1
               #add-point:單身刪除後 name="input.body.a_delete"
                                    IF NOT asrt300_chk_srac() THEN
                     CALL s_transaction_end('N','0')
                  END IF
                  END IF
               #end add-point
               LET l_count = g_srab_d.getLength()
               
               #add-point:單身刪除後(<>d) name="input.body.after_delete"
                        
               #end add-point
            END IF
 
         AFTER DELETE
            #如果是最後一筆
            IF l_ac = (g_srab_d.getLength() + 1) THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
            END IF
 
                  #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab004
            
            #add-point:AFTER FIELD srab004 name="input.a.page1.srab004"
                        CALL asrt300_srab_desc()
            IF NOT cl_null(g_srab_d[l_ac].srab004) THEN
               IF g_srab_d[l_ac].srab005 IS NOT NULL AND g_srab_d[l_ac].srab006 IS NOT NULL THEN   
                  IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_srab_d[l_ac].srab004 != g_srab_d_t.srab004 )) THEN
                     IF NOT ap_chk_notDup(g_srab_d[l_ac].srab004,"SELECT COUNT(*) FROM srab_t WHERE "||"srabent = '" ||g_enterprise|| "' AND srabsite = '" ||g_site|| "' AND "||"srab000 = '"||g_sraa_m.sraa000||"' AND srab001 = '"||g_sraa_m.sraa001||"' AND srab002 = '"||g_sraa_m.sraa002||"' AND srab003 = '"||g_sraa_m.sraa003||"' AND srab004 = '"||g_srab_d[l_ac].srab004||"' AND srab005 = '"||g_srab_d[l_ac].srab005||"' AND srab006 = '"||g_srab_d[l_ac].srab006||"'",'std-00004',0) THEN 
                        LET g_srab_d[l_ac].srab004 = g_srab_d_t.srab004
                        CALL asrt300_srab_desc()
                        NEXT FIELD srab004 
                     END IF
                  END IF
               END IF
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_srab_d[l_ac].srab004

               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_imaf001_1") THEN
                  LET g_srab_d[l_ac].srab004 = g_srab_d_t.srab004
                  CALL asrt300_srab_desc()
                  NEXT FIELD srab004
               END IF
               CALL asrt300_chk_bmaa()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_srab_d[l_ac].srab004
                  #160318-00005#44 --s add
                  CASE g_errno
                     WHEN 'sub-01302'
                        LET g_errparam.replace[1] = 'abmm200'
                        LET g_errparam.replace[2] = cl_get_progname('abmm200',g_lang,"2")
                        LET g_errparam.exeprog = 'abmm200'
                  END CASE
                  #160318-00005#44 --e add
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_srab_d[l_ac].srab004 = g_srab_d_t.srab004
                  CALL asrt300_srab_desc()
                  NEXT FIELD srab004
               END IF
               IF NOT cl_null(g_srab_d[l_ac].srab008) THEN
#                  CALL asrt300_chk_srab008()
#                  IF NOT cl_null(g_errno) THEN
#                     INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno
#                  LET g_errparam.extend = g_srab_d[l_ac].srab004
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#
#                     LET g_srab_d[l_ac].srab004 = g_srab_d_t.srab004
#                     CALL asrt300_srab_desc()
#                     NEXT FIELD srab004
#                  END IF
                  INITIALIZE g_chkparam.* TO NULL
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_site
                  LET g_chkparam.arg2 = g_srab_d[l_ac].srab004
                  LET g_chkparam.arg3 = g_srab_d[l_ac].srab008
                  #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_ecba002_1") THEN
                     LET g_srab_d[l_ac].srab004 = g_srab_d_t.srab004
                     CALL asrt300_srab_desc()
                     NEXT FIELD srab004                     
                  END IF                  
                  
                  IF l_cmd = 'u' AND g_srab_d[l_ac].srab004 <> g_srab_d_t.srab004 THEN              
                     IF NOT asrt300_is_del() THEN
                        LET g_srab_d[l_ac].srab004 = g_srab_d_t.srab004
                        CALL asrt300_srab_desc()
                        NEXT FIELD srab004
                     END IF
                  END IF
               END IF
               IF l_cmd = 'a' THEN
                  CALL asrt300_srab004_def()
               END IF
               IF g_srab_d_o.srab004 <> g_srab_d[l_ac].srab004 THEN
                  UPDATE srab_t 
                     SET srab004 = g_srab_d[l_ac].srab004
                   WHERE srabent = g_enterprise
                     AND srabsite = g_site
                     AND srab000 = g_sraa_m.sraa000
                     AND srab001 = g_sraa_m.sraa001
                     AND srab002 = g_sraa_m.sraa002
                     AND srab003 = g_sraa_m.sraa003
                     AND srab004 = g_srab_d_o.srab004
                     AND srab005 = g_srab_d[l_ac].srab005
                     AND srab006 = g_srab_d[l_ac].srab006
               END IF
            END IF
            CALL asrt300_set_entry_b(l_cmd)
            CALL asrt300_set_no_required_b(l_cmd)
            CALL asrt300_set_required_b(l_cmd)
            CALL asrt300_set_no_entry_b(l_cmd)
            LET g_srab_d_o.srab004 = g_srab_d[l_ac].srab004
            NEXT FIELD srab005
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab004
            #add-point:BEFORE FIELD srab004 name="input.b.page1.srab004"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srab004
            #add-point:ON CHANGE srab004 name="input.g.page1.srab004"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab005
            #add-point:BEFORE FIELD srab005 name="input.b.page1.srab005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab005
            
            #add-point:AFTER FIELD srab005 name="input.a.page1.srab005"
                        IF cl_null(g_srab_d[l_ac].srab005) THEN
               LET g_srab_d[l_ac].srab005 = ' '
            END IF
            IF g_srab_d[l_ac].srab005 IS NOT NULL THEN
               IF NOT cl_null(g_srab_d[l_ac].srab004) AND g_srab_d[l_ac].srab006 IS NOT NULL THEN   
                  IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_srab_d[l_ac].srab005 != g_srab_d_t.srab005 )) THEN
                     IF NOT ap_chk_notDup(g_srab_d[l_ac].srab005,"SELECT COUNT(*) FROM srab_t WHERE "||"srabent = '" ||g_enterprise|| "' AND srabsite = '" ||g_site|| "' AND "||"srab000 = '"||g_sraa_m.sraa000||"' AND srab001 = '"||g_sraa_m.sraa001||"' AND srab002 = '"||g_sraa_m.sraa002||"' AND srab003 = '"||g_sraa_m.sraa003||"' AND srab004 = '"||g_srab_d[l_ac].srab004||"' AND srab005 = '"||g_srab_d[l_ac].srab005||"' AND srab006 = '"||g_srab_d[l_ac].srab006||"'",'std-00004',0) THEN 
                        LET g_srab_d[l_ac].srab005 = g_srab_d_t.srab005
                        NEXT FIELD srab005
                     END IF
                  END IF
               END IF
               CALL asrt300_chk_bmaa()
               IF NOT cl_null(g_errno) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_srab_d[l_ac].srab005
                  #160318-00005#44 --s add
                  CASE g_errno
                     WHEN 'sub-01302'
                        LET g_errparam.replace[1] = 'abmm200'
                        LET g_errparam.replace[2] = cl_get_progname('abmm200',g_lang,"2")
                        LET g_errparam.exeprog = 'abmm200'
                  END CASE
                  #160318-00005#44 --e add
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_srab_d[l_ac].srab005 = g_srab_d_t.srab005
                  NEXT FIELD srab005
               END IF
               IF NOT cl_null(g_srab_d[l_ac].srab008) THEN
                  IF l_cmd = 'u' AND g_srab_d[l_ac].srab005 <> g_srab_d_t.srab005 THEN              
                     IF NOT asrt300_is_del() THEN
                        LET g_srab_d[l_ac].srab005 = g_srab_d_t.srab005
                        NEXT FIELD srab005
                     END IF
                  END IF
               END IF
               IF g_srab_d_o.srab005 <> g_srab_d[l_ac].srab005 THEN
                  UPDATE srab_t 
                     SET srab005 = g_srab_d[l_ac].srab005
                   WHERE srabent = g_enterprise
                     AND srabsite = g_site
                     AND srab000 = g_sraa_m.sraa000
                     AND srab001 = g_sraa_m.sraa001
                     AND srab002 = g_sraa_m.sraa002
                     AND srab003 = g_sraa_m.sraa003
                     AND srab004 = g_srab_d[l_ac].srab004
                     AND srab005 = g_srab_d_o.srab005
                     AND srab006 = g_srab_d[l_ac].srab006
               END IF
            END IF
            CALL asrt300_set_entry_b(l_cmd)
            CALL asrt300_set_no_entry_b(l_cmd)
            LET g_srab_d_o.srab005 = g_srab_d[l_ac].srab005
            NEXT FIELD srab006
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srab005
            #add-point:ON CHANGE srab005 name="input.g.page1.srab005"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab006
            #add-point:BEFORE FIELD srab006 name="input.b.page1.srab006"
            IF NOT cl_null(g_srab_d[l_ac].srab004) THEN
               IF s_feature_auto_chk(g_srab_d[l_ac].srab004) THEN #160314-00009#14 add
                  IF g_srab_d[l_ac].srab006 IS NULL THEN
                     LET l_imaa005 = ''
                     SELECT imaa005 INTO l_imaa005 
                       FROM imaa_t
                      WHERE imaaent = g_enterprise
                        AND imaa001 = g_srab_d[l_ac].srab004 
                     IF NOT cl_null(l_imaa005) THEN
                        CALL s_feature_single(g_srab_d[l_ac].srab004,g_srab_d[l_ac].srab006,g_site,'') RETURNING l_success,g_srab_d[l_ac].srab006
                     END IF
                  END IF
               END IF            #160314-00009#14 add
            END IF
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab006
            
            #add-point:AFTER FIELD srab006 name="input.a.page1.srab006"
            IF cl_null(g_srab_d[l_ac].srab006) THEN
               LET g_srab_d[l_ac].srab006 = ' '
            END IF
            IF g_srab_d[l_ac].srab006 IS NOT NULL THEN
               IF NOT cl_null(g_srab_d[l_ac].srab004) AND g_srab_d[l_ac].srab005 IS NOT NULL THEN   
                  IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_srab_d[l_ac].srab006 != g_srab_d_t.srab006 )) THEN
                     IF NOT ap_chk_notDup(g_srab_d[l_ac].srab006,"SELECT COUNT(*) FROM srab_t WHERE "||"srabent = '" ||g_enterprise|| "' AND srabsite = '" ||g_site|| "' AND "||"srab000 = '"||g_sraa_m.sraa000||"' AND srab001 = '"||g_sraa_m.sraa001||"' AND srab002 = '"||g_sraa_m.sraa002||"' AND srab003 = '"||g_sraa_m.sraa003||"' AND srab004 = '"||g_srab_d[l_ac].srab004||"' AND srab005 = '"||g_srab_d[l_ac].srab005||"' AND srab006 = '"||g_srab_d[l_ac].srab006||"'",'std-00004',0) THEN 
                        LET g_srab_d[l_ac].srab006 = g_srab_d_t.srab006
                        NEXT FIELD srab006
                     END IF
                  END IF
               END IF
               IF NOT cl_null(g_srab_d[l_ac].srab008) THEN
                  IF l_cmd = 'u' AND g_srab_d[l_ac].srab006 <> g_srab_d_t.srab006 THEN              
                     IF NOT asrt300_is_del() THEN
                        LET g_srab_d[l_ac].srab006 = g_srab_d_t.srab006
                        NEXT FIELD srab006
                     END IF
                  END IF
               END IF
               IF g_srab_d_o.srab006 <> g_srab_d[l_ac].srab006 THEN
                  UPDATE srab_t 
                     SET srab006 = g_srab_d[l_ac].srab006
                   WHERE srabent = g_enterprise
                     AND srabsite = g_site
                     AND srab000 = g_sraa_m.sraa000
                     AND srab001 = g_sraa_m.sraa001
                     AND srab002 = g_sraa_m.sraa002
                     AND srab003 = g_sraa_m.sraa003
                     AND srab004 = g_srab_d[l_ac].srab004
                     AND srab005 = g_srab_d[l_ac].srab005
                     AND srab006 = g_srab_d_o.srab006
               END IF
               #--151224-00025#4 add start--
               IF NOT s_feature_direct_input(g_srab_d[l_ac].srab004,g_srab_d[l_ac].srab006,g_srab_d_t.srab006,'',g_site) THEN
                  NEXT FIELD CURRENT
               END IF
               #--151224-00025#4 add end--
            END IF 
            LET l_imaa005 = ''
            SELECT imaa005 INTO l_imaa005 
              FROM imaa_t
             WHERE imaaent = g_enterprise 
               AND imaa001 = g_srab_d[l_ac].srab004
            IF NOT cl_null(l_imaa005) AND cl_null(g_srab_d[l_ac].srab006) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asr-00059'
               LET g_errparam.extend = g_srab_d[l_ac].srab006
               LET g_errparam.popup = TRUE
               CALL cl_err()

               NEXT FIELD srab006
            END IF
            CALL asrt300_set_entry_b(l_cmd)
            CALL asrt300_set_no_entry_b(l_cmd)
            LET g_srab_d_o.srab006 = g_srab_d[l_ac].srab006            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srab006
            #add-point:ON CHANGE srab006 name="input.g.page1.srab006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab007
            #add-point:BEFORE FIELD srab007 name="input.b.page1.srab007"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab007
            
            #add-point:AFTER FIELD srab007 name="input.a.page1.srab007"
                        IF NOT cl_null(g_srab_d[l_ac].srab007) THEN    
               IF g_srab_d_o.srab007 <> g_srab_d[l_ac].srab007 THEN
                  UPDATE srab_t 
                     SET srab007 = g_srab_d[l_ac].srab007
                   WHERE srabent = g_enterprise
                     AND srabsite = g_site
                     AND srab000 = g_sraa_m.sraa000
                     AND srab001 = g_sraa_m.sraa001
                     AND srab002 = g_sraa_m.sraa002
                     AND srab003 = g_sraa_m.sraa003
                     AND srab004 = g_srab_d[l_ac].srab004
                     AND srab005 = g_srab_d[l_ac].srab005
                     AND srab006 = g_srab_d[l_ac].srab006
               END IF
            END IF
            LET g_srab_d_o.srab007 = g_srab_d[l_ac].srab007
            CALL asrt300_set_entry_b(l_cmd)
            CALL asrt300_set_no_required_b(l_cmd)
            CALL asrt300_set_required_b(l_cmd)
            CALL asrt300_set_no_entry_b(l_cmd)
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srab007
            #add-point:ON CHANGE srab007 name="input.g.page1.srab007"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab008
            
            #add-point:AFTER FIELD srab008 name="input.a.page1.srab008"
                        CALL asrt300_srab_desc()
            IF NOT cl_null(g_srab_d[l_ac].srab008) THEN
               INITIALIZE g_chkparam.* TO NULL
               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_site
               LET g_chkparam.arg2 = g_srab_d[l_ac].srab004
               LET g_chkparam.arg3 = g_srab_d[l_ac].srab008
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_ecba002_1") THEN
                 #LET g_srab_d[l_ac].srab008 = g_srab_d_t.srab008   #160824-00007#284 by sakura mark
                  LET g_srab_d[l_ac].srab008 = g_srab_d_o.srab008   #160824-00007#284 by sakura add
                  CALL asrt300_srab_desc()
                  NEXT FIELD srab008                    
               END IF                
               
#               CALL asrt300_chk_srab008()
#               IF NOT cl_null(g_errno) THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = g_errno
#                  LET g_errparam.extend = g_srab_d[l_ac].srab008
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#
#                  LET g_srab_d[l_ac].srab008 = g_srab_d_t.srab008
#                  CALL asrt300_srab_desc()
#                  NEXT FIELD srab008
#               END IF 
              #IF l_cmd = 'u' AND  g_srab_d[l_ac].srab008 <> g_srab_d_t.srab008 THEN                 #160824-00007#284 by sakura mark
               IF g_srab_d[l_ac].srab008 <> g_srab_d_o.srab008 OR cl_null(g_srab_d_o.srab008) THEN   #160824-00007#284 by sakura add
                  IF NOT asrt300_is_del() THEN
                    #LET g_srab_d[l_ac].srab008 = g_srab_d_t.srab008   #160824-00007#284 by sakura mark
                     LET g_srab_d[l_ac].srab008 = g_srab_d_o.srab008   #160824-00007#284 by sakura add
                     CALL asrt300_srab_desc()
                     NEXT FIELD srab008
                  END IF
               END IF
               IF g_srab_d_o.srab008 <> g_srab_d[l_ac].srab008 THEN
                  UPDATE srab_t 
                     SET srab008 = g_srab_d[l_ac].srab008
                   WHERE srabent = g_enterprise
                     AND srabsite = g_site
                     AND srab000 = g_sraa_m.sraa000
                     AND srab001 = g_sraa_m.sraa001
                     AND srab002 = g_sraa_m.sraa002
                     AND srab003 = g_sraa_m.sraa003
                     AND srab004 = g_srab_d[l_ac].srab004
                     AND srab005 = g_srab_d[l_ac].srab005
                     AND srab006 = g_srab_d[l_ac].srab006
               END IF
            END IF
            LET g_srab_d_o.srab008 = g_srab_d[l_ac].srab008
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab008
            #add-point:BEFORE FIELD srab008 name="input.b.page1.srab008"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srab008
            #add-point:ON CHANGE srab008 name="input.g.page1.srab008"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD srab011
            
            #add-point:AFTER FIELD srab011 name="input.a.page1.srab011"
                        IF NOT cl_null(g_srab_d[l_ac].srab011) THEN
               #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_srab_d[l_ac].srab011
               #160318-00025#4--add--str
               LET g_errshow = TRUE 
               LET g_chkparam.err_str[1] = "aim-00005:sub-01302|aooi250|",cl_get_progname("aooi250",g_lang,"2"),"|:EXEPROGaooi250"
               #160318-00025#4--add--end
               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_ooca001") THEN
                  LET g_srab_d[l_ac].srab011 = g_srab_d_t.srab011
                  NEXT FIELD srab011
               END IF
               IF g_srab_d_o.srab011 <> g_srab_d[l_ac].srab011 THEN
                  UPDATE srab_t 
                     SET srab011 = g_srab_d[l_ac].srab011
                   WHERE srabent = g_enterprise
                     AND srabsite = g_site
                     AND srab000 = g_sraa_m.sraa000
                     AND srab001 = g_sraa_m.sraa001
                     AND srab002 = g_sraa_m.sraa002
                     AND srab003 = g_sraa_m.sraa003
                     AND srab004 = g_srab_d[l_ac].srab004
                     AND srab005 = g_srab_d[l_ac].srab005
                     AND srab006 = g_srab_d[l_ac].srab006
               END IF
            END IF
            LET g_srab_d_o.srab011 = g_srab_d[l_ac].srab011
            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD srab011
            #add-point:BEFORE FIELD srab011 name="input.b.page1.srab011"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE srab011
            #add-point:ON CHANGE srab011 name="input.g.page1.srab011"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_1
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_1,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_1
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_1 name="input.a.page1.l_srab010_1_1"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_1) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_1,1) THEN
                  LET g_srab_d[l_ac].l_srab010_1_1 = g_srab_d_t.l_srab010_1_1
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_1
            #add-point:BEFORE FIELD l_srab010_1_1 name="input.b.page1.l_srab010_1_1"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_1
            #add-point:ON CHANGE l_srab010_1_1 name="input.g.page1.l_srab010_1_1"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_2
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_2,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_2
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_2 name="input.a.page1.l_srab010_1_2"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_2) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_2,2) THEN
                  LET g_srab_d[l_ac].l_srab010_1_2 = g_srab_d_t.l_srab010_1_2
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_2
            #add-point:BEFORE FIELD l_srab010_1_2 name="input.b.page1.l_srab010_1_2"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_2
            #add-point:ON CHANGE l_srab010_1_2 name="input.g.page1.l_srab010_1_2"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_3
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_3,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_3
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_3 name="input.a.page1.l_srab010_1_3"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_3) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_3,3) THEN
                  LET g_srab_d[l_ac].l_srab010_1_3 = g_srab_d_t.l_srab010_1_3
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_3
            #add-point:BEFORE FIELD l_srab010_1_3 name="input.b.page1.l_srab010_1_3"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_3
            #add-point:ON CHANGE l_srab010_1_3 name="input.g.page1.l_srab010_1_3"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_4
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_4,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_4
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_4 name="input.a.page1.l_srab010_1_4"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_4) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_4,4) THEN
                  LET g_srab_d[l_ac].l_srab010_1_4 = g_srab_d_t.l_srab010_1_4
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_4
            #add-point:BEFORE FIELD l_srab010_1_4 name="input.b.page1.l_srab010_1_4"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_4
            #add-point:ON CHANGE l_srab010_1_4 name="input.g.page1.l_srab010_1_4"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_5
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_5,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_5
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_5 name="input.a.page1.l_srab010_1_5"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_5) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_5,5) THEN
                  LET g_srab_d[l_ac].l_srab010_1_5 = g_srab_d_t.l_srab010_1_5
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_5
            #add-point:BEFORE FIELD l_srab010_1_5 name="input.b.page1.l_srab010_1_5"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_5
            #add-point:ON CHANGE l_srab010_1_5 name="input.g.page1.l_srab010_1_5"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_6
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_6,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_6
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_6 name="input.a.page1.l_srab010_1_6"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_6) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_6,6) THEN
                  LET g_srab_d[l_ac].l_srab010_1_6 = g_srab_d_t.l_srab010_1_6
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_6
            #add-point:BEFORE FIELD l_srab010_1_6 name="input.b.page1.l_srab010_1_6"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_6
            #add-point:ON CHANGE l_srab010_1_6 name="input.g.page1.l_srab010_1_6"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_7
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_7,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_7
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_7 name="input.a.page1.l_srab010_1_7"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_7) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_7,7) THEN
                  LET g_srab_d[l_ac].l_srab010_1_7 = g_srab_d_t.l_srab010_1_7
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_7
            #add-point:BEFORE FIELD l_srab010_1_7 name="input.b.page1.l_srab010_1_7"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_7
            #add-point:ON CHANGE l_srab010_1_7 name="input.g.page1.l_srab010_1_7"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_8
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_8,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_8
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_8 name="input.a.page1.l_srab010_1_8"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_8) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_8,8) THEN
                  LET g_srab_d[l_ac].l_srab010_1_8 = g_srab_d_t.l_srab010_1_8
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_8
            #add-point:BEFORE FIELD l_srab010_1_8 name="input.b.page1.l_srab010_1_8"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_8
            #add-point:ON CHANGE l_srab010_1_8 name="input.g.page1.l_srab010_1_8"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_9
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_9,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_9
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_9 name="input.a.page1.l_srab010_1_9"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_9) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_9,9) THEN
                  LET g_srab_d[l_ac].l_srab010_1_9 = g_srab_d_t.l_srab010_1_9
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_9
            #add-point:BEFORE FIELD l_srab010_1_9 name="input.b.page1.l_srab010_1_9"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_9
            #add-point:ON CHANGE l_srab010_1_9 name="input.g.page1.l_srab010_1_9"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_10
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_10,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_10
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_10 name="input.a.page1.l_srab010_1_10"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_10) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_10,10) THEN
                  LET g_srab_d[l_ac].l_srab010_1_10 = g_srab_d_t.l_srab010_1_10
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_10
            #add-point:BEFORE FIELD l_srab010_1_10 name="input.b.page1.l_srab010_1_10"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_10
            #add-point:ON CHANGE l_srab010_1_10 name="input.g.page1.l_srab010_1_10"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_11
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_11,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_11
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_11 name="input.a.page1.l_srab010_1_11"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_11) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_11,11) THEN
                  LET g_srab_d[l_ac].l_srab010_1_11 = g_srab_d_t.l_srab010_1_11
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_11
            #add-point:BEFORE FIELD l_srab010_1_11 name="input.b.page1.l_srab010_1_11"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_11
            #add-point:ON CHANGE l_srab010_1_11 name="input.g.page1.l_srab010_1_11"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_12
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_12,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_12
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_12 name="input.a.page1.l_srab010_1_12"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_12) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_12,12) THEN
                  LET g_srab_d[l_ac].l_srab010_1_12 = g_srab_d_t.l_srab010_1_12
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_12
            #add-point:BEFORE FIELD l_srab010_1_12 name="input.b.page1.l_srab010_1_12"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_12
            #add-point:ON CHANGE l_srab010_1_12 name="input.g.page1.l_srab010_1_12"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_13
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_13,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_13
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_13 name="input.a.page1.l_srab010_1_13"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_13) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_13,13) THEN
                  LET g_srab_d[l_ac].l_srab010_1_13 = g_srab_d_t.l_srab010_1_13
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_13
            #add-point:BEFORE FIELD l_srab010_1_13 name="input.b.page1.l_srab010_1_13"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_13
            #add-point:ON CHANGE l_srab010_1_13 name="input.g.page1.l_srab010_1_13"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_14
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_14,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_14
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_14 name="input.a.page1.l_srab010_1_14"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_14) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_14,14) THEN
                  LET g_srab_d[l_ac].l_srab010_1_14 = g_srab_d_t.l_srab010_1_14
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_14
            #add-point:BEFORE FIELD l_srab010_1_14 name="input.b.page1.l_srab010_1_14"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_14
            #add-point:ON CHANGE l_srab010_1_14 name="input.g.page1.l_srab010_1_14"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_15
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_15,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_15
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_15 name="input.a.page1.l_srab010_1_15"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_15) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_15,15) THEN
                  LET g_srab_d[l_ac].l_srab010_1_15 = g_srab_d_t.l_srab010_1_15
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_15
            #add-point:BEFORE FIELD l_srab010_1_15 name="input.b.page1.l_srab010_1_15"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_15
            #add-point:ON CHANGE l_srab010_1_15 name="input.g.page1.l_srab010_1_15"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_16
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_16,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_16
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_16 name="input.a.page1.l_srab010_1_16"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_16) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_16,16) THEN
                  LET g_srab_d[l_ac].l_srab010_1_16 = g_srab_d_t.l_srab010_1_16
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_16
            #add-point:BEFORE FIELD l_srab010_1_16 name="input.b.page1.l_srab010_1_16"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_16
            #add-point:ON CHANGE l_srab010_1_16 name="input.g.page1.l_srab010_1_16"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_17
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_17,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_17
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_17 name="input.a.page1.l_srab010_1_17"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_17) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_17,17) THEN
                  LET g_srab_d[l_ac].l_srab010_1_17 = g_srab_d_t.l_srab010_1_17
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_17
            #add-point:BEFORE FIELD l_srab010_1_17 name="input.b.page1.l_srab010_1_17"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_17
            #add-point:ON CHANGE l_srab010_1_17 name="input.g.page1.l_srab010_1_17"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_18
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_18,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_18
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_18 name="input.a.page1.l_srab010_1_18"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_18) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_18,18) THEN
                  LET g_srab_d[l_ac].l_srab010_1_18 = g_srab_d_t.l_srab010_1_18
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_18
            #add-point:BEFORE FIELD l_srab010_1_18 name="input.b.page1.l_srab010_1_18"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_18
            #add-point:ON CHANGE l_srab010_1_18 name="input.g.page1.l_srab010_1_18"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_19
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_19,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_19
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_19 name="input.a.page1.l_srab010_1_19"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_19) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_19,19) THEN
                  LET g_srab_d[l_ac].l_srab010_1_19 = g_srab_d_t.l_srab010_1_19
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_19
            #add-point:BEFORE FIELD l_srab010_1_19 name="input.b.page1.l_srab010_1_19"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_19
            #add-point:ON CHANGE l_srab010_1_19 name="input.g.page1.l_srab010_1_19"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_20
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_20,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_20
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_20 name="input.a.page1.l_srab010_1_20"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_20) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_20,20) THEN
                  LET g_srab_d[l_ac].l_srab010_1_20 = g_srab_d_t.l_srab010_1_20
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_20
            #add-point:BEFORE FIELD l_srab010_1_20 name="input.b.page1.l_srab010_1_20"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_20
            #add-point:ON CHANGE l_srab010_1_20 name="input.g.page1.l_srab010_1_20"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_21
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_21,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_21
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_21 name="input.a.page1.l_srab010_1_21"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_21) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_21,21) THEN
                  LET g_srab_d[l_ac].l_srab010_1_21 = g_srab_d_t.l_srab010_1_21
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_21
            #add-point:BEFORE FIELD l_srab010_1_21 name="input.b.page1.l_srab010_1_21"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_21
            #add-point:ON CHANGE l_srab010_1_21 name="input.g.page1.l_srab010_1_21"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_22
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_22,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_22
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_22 name="input.a.page1.l_srab010_1_22"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_22) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_22,22) THEN
                  LET g_srab_d[l_ac].l_srab010_1_22 = g_srab_d_t.l_srab010_1_22
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_22
            #add-point:BEFORE FIELD l_srab010_1_22 name="input.b.page1.l_srab010_1_22"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_22
            #add-point:ON CHANGE l_srab010_1_22 name="input.g.page1.l_srab010_1_22"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_23
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_23,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_23
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_23 name="input.a.page1.l_srab010_1_23"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_23) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_23,23) THEN
                  LET g_srab_d[l_ac].l_srab010_1_23 = g_srab_d_t.l_srab010_1_23
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_23
            #add-point:BEFORE FIELD l_srab010_1_23 name="input.b.page1.l_srab010_1_23"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_23
            #add-point:ON CHANGE l_srab010_1_23 name="input.g.page1.l_srab010_1_23"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_24
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_24,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_24
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_24 name="input.a.page1.l_srab010_1_24"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_24) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_24,24) THEN
                  LET g_srab_d[l_ac].l_srab010_1_24 = g_srab_d_t.l_srab010_1_24
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_24
            #add-point:BEFORE FIELD l_srab010_1_24 name="input.b.page1.l_srab010_1_24"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_24
            #add-point:ON CHANGE l_srab010_1_24 name="input.g.page1.l_srab010_1_24"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_25
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_25,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_25
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_25 name="input.a.page1.l_srab010_1_25"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_25) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_25,25) THEN
                  LET g_srab_d[l_ac].l_srab010_1_25 = g_srab_d_t.l_srab010_1_25
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_25
            #add-point:BEFORE FIELD l_srab010_1_25 name="input.b.page1.l_srab010_1_25"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_25
            #add-point:ON CHANGE l_srab010_1_25 name="input.g.page1.l_srab010_1_25"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_26
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_26,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_26
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_26 name="input.a.page1.l_srab010_1_26"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_26) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_26,26) THEN
                  LET g_srab_d[l_ac].l_srab010_1_26 = g_srab_d_t.l_srab010_1_26
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_26
            #add-point:BEFORE FIELD l_srab010_1_26 name="input.b.page1.l_srab010_1_26"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_26
            #add-point:ON CHANGE l_srab010_1_26 name="input.g.page1.l_srab010_1_26"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_27
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_27,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_27
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_27 name="input.a.page1.l_srab010_1_27"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_27) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_27,27) THEN
                  LET g_srab_d[l_ac].l_srab010_1_27 = g_srab_d_t.l_srab010_1_27
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_27
            #add-point:BEFORE FIELD l_srab010_1_27 name="input.b.page1.l_srab010_1_27"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_27
            #add-point:ON CHANGE l_srab010_1_27 name="input.g.page1.l_srab010_1_27"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_28
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_28,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_28
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_28 name="input.a.page1.l_srab010_1_28"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_28) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_28,28) THEN
                  LET g_srab_d[l_ac].l_srab010_1_28 = g_srab_d_t.l_srab010_1_28
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_28
            #add-point:BEFORE FIELD l_srab010_1_28 name="input.b.page1.l_srab010_1_28"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_28
            #add-point:ON CHANGE l_srab010_1_28 name="input.g.page1.l_srab010_1_28"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_29
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_29,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_29
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_29 name="input.a.page1.l_srab010_1_29"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_29) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_29,29) THEN
                  LET g_srab_d[l_ac].l_srab010_1_29 = g_srab_d_t.l_srab010_1_29
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_29
            #add-point:BEFORE FIELD l_srab010_1_29 name="input.b.page1.l_srab010_1_29"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_29
            #add-point:ON CHANGE l_srab010_1_29 name="input.g.page1.l_srab010_1_29"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_30
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_30,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_30
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_30 name="input.a.page1.l_srab010_1_30"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_30) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_30,30) THEN
                  LET g_srab_d[l_ac].l_srab010_1_30 = g_srab_d_t.l_srab010_1_30
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_30
            #add-point:BEFORE FIELD l_srab010_1_30 name="input.b.page1.l_srab010_1_30"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_30
            #add-point:ON CHANGE l_srab010_1_30 name="input.g.page1.l_srab010_1_30"
            
            #END add-point 
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD l_srab010_1_31
            #應用 a15 樣板自動產生(Version:3)
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_srab_d[l_ac].l_srab010_1_31,"0.000000","1","","","azz-00079",1)  
                THEN
               NEXT FIELD l_srab010_1_31
            END IF 
 
 
 
            #add-point:AFTER FIELD l_srab010_1_31 name="input.a.page1.l_srab010_1_31"
                        IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_31) THEN 
               IF NOT asrt300_ins_srab(g_srab_d[l_ac].l_srab010_1_31,31) THEN
                  LET g_srab_d[l_ac].l_srab010_1_31 = g_srab_d_t.l_srab010_1_31
                  NEXT FIELD CURRENT
               END IF
            END IF 

            #END add-point
            
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD l_srab010_1_31
            #add-point:BEFORE FIELD l_srab010_1_31 name="input.b.page1.l_srab010_1_31"
            
            #END add-point
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE l_srab010_1_31
            #add-point:ON CHANGE l_srab010_1_31 name="input.g.page1.l_srab010_1_31"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sum
            #add-point:BEFORE FIELD sum name="input.b.page1.sum"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sum
            
            #add-point:AFTER FIELD sum name="input.a.page1.sum"
                        IF NOT cl_null(g_srab_d[l_ac].sum) THEN 
            END IF 

            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sum
            #add-point:ON CHANGE sum name="input.g.page1.sum"
            
            #END add-point 
 
 
 
                  #Ctrlp:input.c.page1.srab004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab004
            #add-point:ON ACTION controlp INFIELD srab004 name="input.c.page1.srab004"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_srab_d[l_ac].srab004             #給予default值
            LET g_qryparam.default2 = "" #g_srab_d[l_ac].bmaa002 #特性

            #給予arg
            SELECT srza012 INTO l_srza012
			  FROM srza_t
			 WHERE srzaent = g_enterprise
			   AND srzasite = g_site
			   AND srza001 = g_sraa_m.sraa001
            LET g_qryparam.arg1 = l_srza012 #
            CALL s_control_get_sql('imaa009','5','6',g_user,g_dept) RETURNING l_success,l_where
            CALL s_control_get_sql('imaa001','6','6',g_user,g_dept) RETURNING l_success,l_where1
            IF l_where <> " 1=1" AND l_where <> " 1=1" THEN
               LET g_qryparam.where = " (",l_where CLIPPED," OR ",l_where1 CLIPPED,")"
            ELSE
               IF l_where = " 1=1" THEN
                  LET g_qryparam.where = " (",l_where1 CLIPPED,")"
               END IF
               IF l_where1 = " 1=1" THEN
                  LET g_qryparam.where = " (",l_where CLIPPED,")"
               END IF
            END IF
            CALL q_bmaa001_1()                                #呼叫開窗

            LET g_srab_d[l_ac].srab004 = g_qryparam.return1              #將開窗取得的值回傳到變數
            LET g_srab_d[l_ac].srab005 = g_qryparam.return2 #特性

            DISPLAY g_srab_d[l_ac].srab004 TO srab004              #顯示到畫面上
            DISPLAY g_srab_d[l_ac].srab005 TO srab005
            CALL asrt300_srab_desc()
            NEXT FIELD srab004                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.srab005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab005
            #add-point:ON ACTION controlp INFIELD srab005 name="input.c.page1.srab005"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_srab_d[l_ac].srab005             #給予default值

            #給予arg
            IF NOT cl_null(g_srab_d[l_ac].srab004) THEN
               LET g_qryparam.where = " bmaa001 = '",g_srab_d[l_ac].srab004,"' "
            END IF

            CALL q_bmaa002()                                #呼叫開窗

                        
            LET g_srab_d[l_ac].srab005 = g_qryparam.return1    #將開窗取得的值回傳到變數
            
            DISPLAY g_srab_d[l_ac].srab005 TO srab005              #顯示到畫面上
            LET g_qryparam.where = ""
            NEXT FIELD srab005                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.srab006
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab006
            #add-point:ON ACTION controlp INFIELD srab006 name="input.c.page1.srab006"
            IF NOT cl_null(g_srab_d[l_ac].srab004) THEN
               CALL s_feature_single(g_srab_d[l_ac].srab004,g_srab_d[l_ac].srab006,g_site,'') RETURNING l_success,g_srab_d[l_ac].srab006
            END IF
            #END add-point
 
 
         #Ctrlp:input.c.page1.srab007
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab007
            #add-point:ON ACTION controlp INFIELD srab007 name="input.c.page1.srab007"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.srab008
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab008
            #add-point:ON ACTION controlp INFIELD srab008 name="input.c.page1.srab008"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_srab_d[l_ac].srab008             #給予default值

            #給予arg
            IF NOT cl_null(g_srab_d[l_ac].srab004) THEN
#               LET l_imae032 = ''
#               SELECT imae032 INTO l_imae032
#                 FROM imae_t
#                WHERE imaeent = g_enterprise
#                  AND imaesite = g_site
#                  AND imae001 = g_srab_d[l_ac].srab004
               LET g_qryparam.arg1 = g_srab_d[l_ac].srab004
               CALL q_ecba002_2()
            ELSE
               CALL q_ecba002() 
            END IF
                                         #呼叫開窗

            LET g_srab_d[l_ac].srab008 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_srab_d[l_ac].srab008 TO srab008              #顯示到畫面上
            CALL asrt300_srab_desc()
            NEXT FIELD srab008                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.srab011
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD srab011
            #add-point:ON ACTION controlp INFIELD srab011 name="input.c.page1.srab011"
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_srab_d[l_ac].srab011             #給予default值

            #給予arg

            CALL q_ooca001_1()                                #呼叫開窗

            LET g_srab_d[l_ac].srab011 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_srab_d[l_ac].srab011 TO srab011              #顯示到畫面上

            NEXT FIELD srab011                          #返回原欄位


            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_1
            #add-point:ON ACTION controlp INFIELD l_srab010_1_1 name="input.c.page1.l_srab010_1_1"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_2
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_2
            #add-point:ON ACTION controlp INFIELD l_srab010_1_2 name="input.c.page1.l_srab010_1_2"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_3
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_3
            #add-point:ON ACTION controlp INFIELD l_srab010_1_3 name="input.c.page1.l_srab010_1_3"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_4
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_4
            #add-point:ON ACTION controlp INFIELD l_srab010_1_4 name="input.c.page1.l_srab010_1_4"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_5
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_5
            #add-point:ON ACTION controlp INFIELD l_srab010_1_5 name="input.c.page1.l_srab010_1_5"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_6
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_6
            #add-point:ON ACTION controlp INFIELD l_srab010_1_6 name="input.c.page1.l_srab010_1_6"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_7
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_7
            #add-point:ON ACTION controlp INFIELD l_srab010_1_7 name="input.c.page1.l_srab010_1_7"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_8
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_8
            #add-point:ON ACTION controlp INFIELD l_srab010_1_8 name="input.c.page1.l_srab010_1_8"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_9
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_9
            #add-point:ON ACTION controlp INFIELD l_srab010_1_9 name="input.c.page1.l_srab010_1_9"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_10
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_10
            #add-point:ON ACTION controlp INFIELD l_srab010_1_10 name="input.c.page1.l_srab010_1_10"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_11
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_11
            #add-point:ON ACTION controlp INFIELD l_srab010_1_11 name="input.c.page1.l_srab010_1_11"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_12
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_12
            #add-point:ON ACTION controlp INFIELD l_srab010_1_12 name="input.c.page1.l_srab010_1_12"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_13
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_13
            #add-point:ON ACTION controlp INFIELD l_srab010_1_13 name="input.c.page1.l_srab010_1_13"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_14
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_14
            #add-point:ON ACTION controlp INFIELD l_srab010_1_14 name="input.c.page1.l_srab010_1_14"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_15
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_15
            #add-point:ON ACTION controlp INFIELD l_srab010_1_15 name="input.c.page1.l_srab010_1_15"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_16
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_16
            #add-point:ON ACTION controlp INFIELD l_srab010_1_16 name="input.c.page1.l_srab010_1_16"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_17
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_17
            #add-point:ON ACTION controlp INFIELD l_srab010_1_17 name="input.c.page1.l_srab010_1_17"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_18
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_18
            #add-point:ON ACTION controlp INFIELD l_srab010_1_18 name="input.c.page1.l_srab010_1_18"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_19
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_19
            #add-point:ON ACTION controlp INFIELD l_srab010_1_19 name="input.c.page1.l_srab010_1_19"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_20
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_20
            #add-point:ON ACTION controlp INFIELD l_srab010_1_20 name="input.c.page1.l_srab010_1_20"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_21
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_21
            #add-point:ON ACTION controlp INFIELD l_srab010_1_21 name="input.c.page1.l_srab010_1_21"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_22
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_22
            #add-point:ON ACTION controlp INFIELD l_srab010_1_22 name="input.c.page1.l_srab010_1_22"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_23
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_23
            #add-point:ON ACTION controlp INFIELD l_srab010_1_23 name="input.c.page1.l_srab010_1_23"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_24
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_24
            #add-point:ON ACTION controlp INFIELD l_srab010_1_24 name="input.c.page1.l_srab010_1_24"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_25
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_25
            #add-point:ON ACTION controlp INFIELD l_srab010_1_25 name="input.c.page1.l_srab010_1_25"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_26
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_26
            #add-point:ON ACTION controlp INFIELD l_srab010_1_26 name="input.c.page1.l_srab010_1_26"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_27
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_27
            #add-point:ON ACTION controlp INFIELD l_srab010_1_27 name="input.c.page1.l_srab010_1_27"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_28
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_28
            #add-point:ON ACTION controlp INFIELD l_srab010_1_28 name="input.c.page1.l_srab010_1_28"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_29
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_29
            #add-point:ON ACTION controlp INFIELD l_srab010_1_29 name="input.c.page1.l_srab010_1_29"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_30
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_30
            #add-point:ON ACTION controlp INFIELD l_srab010_1_30 name="input.c.page1.l_srab010_1_30"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.l_srab010_1_31
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD l_srab010_1_31
            #add-point:ON ACTION controlp INFIELD l_srab010_1_31 name="input.c.page1.l_srab010_1_31"
            
            #END add-point
 
 
         #Ctrlp:input.c.page1.sum
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sum
            #add-point:ON ACTION controlp INFIELD sum name="input.c.page1.sum"
            
            #END add-point
 
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               LET INT_FLAG = 0
               LET g_srab_d[l_ac].* = g_srab_d_t.*
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = '' 
               LET g_errparam.code = 9001 
               LET g_errparam.popup = FALSE 
               CLOSE asrt300_bcl
               CALL s_transaction_end('N','0')
               CALL cl_err()
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = g_srab_d[l_ac].srab004 
               LET g_errparam.code = -263 
               LET g_errparam.popup = TRUE 
               CALL cl_err()
               LET g_srab_d[l_ac].* = g_srab_d_t.*
            ELSE
            
               #add-point:單身修改前 name="input.body.b_update"
               
               IF cl_null(g_srab_d[l_ac].srab005) THEN
                  LET g_srab_d[l_ac].srab005 = ' '
               END IF 
               IF cl_null(g_srab_d[l_ac].srab006) THEN
                  LET g_srab_d[l_ac].srab006 = ' '
               END IF 
               IF NOT asrt300_chk_date() THEN
                  LET g_srab_d[l_ac].* = g_srab_d_t.*                     
                  CALL s_transaction_end('N','0')
                  NEXT FIELD srab004
               END IF
               LET l_time = cl_get_current()
               UPDATE sraa_t SET sraamodid = g_user,
                                 sraamoddt = l_time
                WHERE sraaent = g_enterprise 
                  AND sraasite = g_site 
                  AND sraa000 = g_sraa_m.sraa000
                  AND sraa001 = g_sraa_m.sraa001
                  AND sraa002 = g_sraa_m.sraa002
                  AND sraa003 = g_sraa_m.sraa003
               IF SQLCA.SQLcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "srab_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_srab_d[l_ac].* = g_srab_d_t.*                     
                  CALL s_transaction_end('N','0')
               END IF
               UPDATE srab_t SET (srab000,srab001,srab002,srab003,srab004,srab005,srab006,srab007,srab008) = (g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003,g_srab_d[l_ac].srab004,g_srab_d[l_ac].srab005,g_srab_d[l_ac].srab006,g_srab_d[l_ac].srab007,g_srab_d[l_ac].srab008)
                WHERE srabent = g_enterprise
                  AND srabsite = g_site 
                  AND srab000 = g_sraa_m.sraa000 
                  AND srab001 = g_sraa_m.sraa001 
                  AND srab002 = g_sraa_m.sraa002
                  AND srab003 = g_sraa_m.sraa003 
                  AND srab004 = g_srab_d_t.srab004
                  AND srab005 = g_srab_d_t.srab005  
                  AND srab006 = g_srab_d_t.srab006  
               CASE
                  WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "srab_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                     LET g_srab_d[l_ac].* = g_srab_d_t.*                     
                     CALL s_transaction_end('N','0')
                  OTHERWISE                
               END CASE
               IF NOT asrt300_chk_srac() THEN
                  CALL s_transaction_end('N','0')
               ELSE
                  IF NOT asrt300_ins_srac() THEN
                     CALL s_transaction_end('N','0')
                  END IF
               END IF
               END IF
               IF FALSE THEN
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               #將遮罩欄位還原
               CALL asrt300_srab_t_mask_restore('restore_mask_o')
      
               UPDATE srab_t SET (srab000,srab001,srab002,srab003,srab004,srab005,srab006,srab007,srab008, 
                   srab011,srab012,srab009) = (g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003, 
                   g_srab_d[l_ac].srab004,g_srab_d[l_ac].srab005,g_srab_d[l_ac].srab006,g_srab_d[l_ac].srab007, 
                   g_srab_d[l_ac].srab008,g_srab_d[l_ac].srab011,g_srab_d[l_ac].srab012,g_srab_d[l_ac].srab009) 
 
                WHERE srabent = g_enterprise AND srabsite = g_site AND srab000 = g_sraa_m.sraa000 
                  AND srab001 = g_sraa_m.sraa001 
                  AND srab002 = g_sraa_m.sraa002 
                  AND srab003 = g_sraa_m.sraa003 
 
                  AND srab004 = g_srab_d_t.srab004 #項次   
                  AND srab005 = g_srab_d_t.srab005  
                  AND srab006 = g_srab_d_t.srab006  
                  AND srab009 = g_srab_d_t.srab009  
 
                  
               #add-point:單身修改中 name="input.body.m_update"
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     LET g_srab_d[l_ac].* = g_srab_d_t.*
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "srab_t" 
                     LET g_errparam.code = "std-00009" 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()
                     
                  WHEN SQLCA.SQLCODE #其他錯誤
                     LET g_srab_d[l_ac].* = g_srab_d_t.*  
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = "srab_t:",SQLERRMESSAGE 
                     LET g_errparam.code = SQLCA.SQLCODE 
                     LET g_errparam.popup = TRUE 
                     CALL s_transaction_end('N','0')
                     CALL cl_err()                   
                     
                  OTHERWISE
                     #資料多語言用-增/改
                     
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sraa_m.sraa000
               LET gs_keys_bak[1] = g_sraa000_t
               LET gs_keys[2] = g_sraa_m.sraa001
               LET gs_keys_bak[2] = g_sraa001_t
               LET gs_keys[3] = g_sraa_m.sraa002
               LET gs_keys_bak[3] = g_sraa002_t
               LET gs_keys[4] = g_sraa_m.sraa003
               LET gs_keys_bak[4] = g_sraa003_t
               LET gs_keys[5] = g_srab_d[g_detail_idx].srab004
               LET gs_keys_bak[5] = g_srab_d_t.srab004
               LET gs_keys[6] = g_srab_d[g_detail_idx].srab005
               LET gs_keys_bak[6] = g_srab_d_t.srab005
               LET gs_keys[7] = g_srab_d[g_detail_idx].srab006
               LET gs_keys_bak[7] = g_srab_d_t.srab006
               LET gs_keys[8] = g_srab_d[g_detail_idx].srab009
               LET gs_keys_bak[8] = g_srab_d_t.srab009
               CALL asrt300_update_b('srab_t',gs_keys,gs_keys_bak,"'1'")
               END CASE
 
               #將遮罩欄位進行遮蔽
               CALL asrt300_srab_t_mask_restore('restore_mask_n')
               
               #判斷key是否有改變
               INITIALIZE gs_keys TO NULL
               IF NOT(g_srab_d[g_detail_idx].srab004 = g_srab_d_t.srab004 
                  AND g_srab_d[g_detail_idx].srab005 = g_srab_d_t.srab005 
                  AND g_srab_d[g_detail_idx].srab006 = g_srab_d_t.srab006 
                  AND g_srab_d[g_detail_idx].srab009 = g_srab_d_t.srab009 
 
                  ) THEN
                  LET gs_keys[01] = g_sraa_m.sraa000
                  LET gs_keys[gs_keys.getLength()+1] = g_sraa_m.sraa001
                  LET gs_keys[gs_keys.getLength()+1] = g_sraa_m.sraa002
                  LET gs_keys[gs_keys.getLength()+1] = g_sraa_m.sraa003
 
                  LET gs_keys[gs_keys.getLength()+1] = g_srab_d_t.srab004
                  LET gs_keys[gs_keys.getLength()+1] = g_srab_d_t.srab005
                  LET gs_keys[gs_keys.getLength()+1] = g_srab_d_t.srab006
                  LET gs_keys[gs_keys.getLength()+1] = g_srab_d_t.srab009
 
                  CALL asrt300_key_update_b(gs_keys,'srab_t')
               END IF
               
               #修改歷程記錄(單身修改)
               LET g_log1 = util.JSON.stringify(g_sraa_m),util.JSON.stringify(g_srab_d_t)
               LET g_log2 = util.JSON.stringify(g_sraa_m),util.JSON.stringify(g_srab_d[l_ac])
               IF NOT cl_log_modified_record_d(g_log1,g_log2) THEN 
                  CALL s_transaction_end('N','0')
               END IF
               
               #add-point:單身修改後 name="input.body.a_update"
                              IF NOT asrt300_chk_srac() THEN
                  CALL s_transaction_end('N','0')
               ELSE
                  IF NOT asrt300_ins_srac() THEN
                     CALL s_transaction_end('N','0')
                  END IF
               END IF
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row name="input.body.after_row"
 
            #end add-point
            CALL asrt300_unlock_b("srab_t","'1'")
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
               LET g_srab_d[li_reproduce_target].* = g_srab_d[li_reproduce].*
 
               LET g_srab_d[li_reproduce_target].srab004 = NULL
               LET g_srab_d[li_reproduce_target].srab005 = NULL
               LET g_srab_d[li_reproduce_target].srab006 = NULL
               LET g_srab_d[li_reproduce_target].srab009 = NULL
 
            ELSE
               CALL FGL_SET_ARR_CURR(g_srab_d.getLength()+1)
               LET lb_reproduce = TRUE
               LET li_reproduce = l_ac
               LET li_reproduce_target = g_srab_d.getLength()+1
            END IF
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
 
      
 
 
 
 
{</section>}
 
{<section id="asrt300.input.other" >}
      
      #add-point:自定義input name="input.more_input"
            INPUT ARRAY g_srab_d2 FROM s_detail2.* 
         ATTRIBUTE(COUNT = g_rec_b1,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                 INSERT ROW = l_allow_insert,
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         BEFORE INPUT
            EXIT DIALOG 
      END INPUT
      
      INPUT ARRAY g_srab_d3 FROM s_detail3.* 
         ATTRIBUTE(COUNT = g_rec_b2,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                 INSERT ROW = l_allow_insert,
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
          BEFORE INPUT
             EXIT DIALOG
      END INPUT
      #end add-point
    
      BEFORE DIALOG 
         #CALL cl_err_collect_init()    
         #add-point:input段before dialog name="input.before_dialog"
                  IF p_cmd = 'a' THEN
            NEXT FIELD sraa001
         END IF
         #end add-point    
         #重新導回資料到正確位置上
         CALL DIALOG.setCurrentRow("s_detail1",g_idx_group.getValue("'1',"))      
 
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            #add-point:input段next_field name="input.next_field"
            
            #end add-point  
            NEXT FIELD sraa000
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD srab004
 
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
      IF INT_FLAG THEN
      CALL s_transaction_end('N','0')
   END IF
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="asrt300.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION asrt300_show()
   #add-point:show段define(客製用) name="show.define_customerization"
   
   #end add-point  
   DEFINE l_ac_t    LIKE type_t.num10
   #add-point:show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="show.define"
      DEFINE l_ac1_t   LIKE type_t.num5
   DEFINE l_ac2_t   LIKE type_t.num5
   #end add-point  
   
   #add-point:Function前置處理 name="show.before"
   
   #end add-point
   
   
   
   IF g_bfill = "Y" THEN
      CALL asrt300_b_fill() #單身填充
      CALL asrt300_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #應用 a12 樣板自動產生(Version:4)
 
 
 
   
   #顯示followup圖示
   #應用 a48 樣板自動產生(Version:3)
   CALL asrt300_set_pk_array()
   #add-point:ON ACTION agendum name="show.follow_pic"
   
   #END add-point
   CALL cl_user_overview_set_follow_pic()
  
 
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference name="show.head.reference"
   CALL asrt300_desc()
#   INITIALIZE g_ref_fields TO NULL
#   LET g_ref_fields[1] = g_sraa_m.sraaownid
#   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
#   LET g_sraa_m.sraaownid_desc = '', g_rtn_fields[1] , ''
#   DISPLAY BY NAME g_sraa_m.sraaownid_desc
#
#   INITIALIZE g_ref_fields TO NULL
#   LET g_ref_fields[1] = g_sraa_m.sraaowndp
#   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
#   LET g_sraa_m.sraaowndp_desc = '', g_rtn_fields[1] , ''
#   DISPLAY BY NAME g_sraa_m.sraaowndp_desc
#
#   INITIALIZE g_ref_fields TO NULL
#   LET g_ref_fields[1] = g_sraa_m.sraacrtid
#   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
#   LET g_sraa_m.sraacrtid_desc = '', g_rtn_fields[1] , ''
#   DISPLAY BY NAME g_sraa_m.sraacrtid_desc
#
#   INITIALIZE g_ref_fields TO NULL
#   LET g_ref_fields[1] = g_sraa_m.sraacrtdp
#   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
#   LET g_sraa_m.sraacrtdp_desc = '', g_rtn_fields[1] , ''
#   DISPLAY BY NAME g_sraa_m.sraacrtdp_desc
#
#   INITIALIZE g_ref_fields TO NULL
#   LET g_ref_fields[1] = g_sraa_m.sraamodid
#   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
#   LET g_sraa_m.sraamodid_desc = '', g_rtn_fields[1] , ''
#   DISPLAY BY NAME g_sraa_m.sraamodid_desc
#
#   INITIALIZE g_ref_fields TO NULL
#   LET g_ref_fields[1] = g_sraa_m.sraacnfid
#   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
#   LET g_sraa_m.sraacnfid_desc = '', g_rtn_fields[1] , ''
#   DISPLAY BY NAME g_sraa_m.sraacnfid_desc

   IF l_ac = 0 OR cl_null(l_ac) THEN
      LET l_ac = 1
   END IF
   IF g_bfill = "Y" THEN
      CALL asrt300_b_fill_1()
      CALL asrt300_b_fill_2()
   END IF
   
   #end add-point
   
   #遮罩相關處理
   LET g_sraa_m_mask_o.* =  g_sraa_m.*
   CALL asrt300_sraa_t_mask()
   LET g_sraa_m_mask_n.* =  g_sraa_m.*
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_sraa_m.sraa001,g_sraa_m.sraa001_desc,g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000, 
       g_sraa_m.sraastus,g_sraa_m.sraacrtid,g_sraa_m.sraacrtid_desc,g_sraa_m.sraacrtdp,g_sraa_m.sraacrtdp_desc, 
       g_sraa_m.sraacrtdt,g_sraa_m.sraaownid,g_sraa_m.sraaownid_desc,g_sraa_m.sraaowndp,g_sraa_m.sraaowndp_desc, 
       g_sraa_m.sraamodid,g_sraa_m.sraamodid_desc,g_sraa_m.sraamoddt,g_sraa_m.sraacnfid,g_sraa_m.sraacnfid_desc, 
       g_sraa_m.sraacnfdt
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sraa_m.sraastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "C"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/closed.png")
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
   FOR l_ac = 1 TO g_srab_d.getLength()
      #add-point:show段單身reference name="show.body.reference"
            CALL asrt300_srab_desc()
      #end add-point
   END FOR
   
 
   
    
   
   #add-point:show段other name="show.other"
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL asrt300_detail_show()
 
   #add-point:show段之後 name="show.after"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="asrt300.detail_show" >}
#+ 第二階單身reference
PRIVATE FUNCTION asrt300_detail_show()
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
 
{<section id="asrt300.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION asrt300_reproduce()
   #add-point:reproduce段define(客製用) name="reproduce.define_customerization"
   
   #end add-point   
   DEFINE l_newno     LIKE sraa_t.sraa000 
   DEFINE l_oldno     LIKE sraa_t.sraa000 
   DEFINE l_newno02     LIKE sraa_t.sraa001 
   DEFINE l_oldno02     LIKE sraa_t.sraa001 
   DEFINE l_newno03     LIKE sraa_t.sraa002 
   DEFINE l_oldno03     LIKE sraa_t.sraa002 
   DEFINE l_newno04     LIKE sraa_t.sraa003 
   DEFINE l_oldno04     LIKE sraa_t.sraa003 
 
   DEFINE l_master    RECORD LIKE sraa_t.* #此變數樣板目前無使用
   DEFINE l_detail    RECORD LIKE srab_t.* #此變數樣板目前無使用
 
 
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
   
   IF g_sraa_m.sraa000 IS NULL
   OR g_sraa_m.sraa001 IS NULL
   OR g_sraa_m.sraa002 IS NULL
   OR g_sraa_m.sraa003 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
    
   LET g_sraa000_t = g_sraa_m.sraa000
   LET g_sraa001_t = g_sraa_m.sraa001
   LET g_sraa002_t = g_sraa_m.sraa002
   LET g_sraa003_t = g_sraa_m.sraa003
 
    
   LET g_sraa_m.sraa000 = ""
   LET g_sraa_m.sraa001 = ""
   LET g_sraa_m.sraa002 = ""
   LET g_sraa_m.sraa003 = ""
 
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #應用 a14 樣板自動產生(Version:5)    
      #公用欄位新增給值  
      LET g_sraa_m.sraaownid = g_user
      LET g_sraa_m.sraaowndp = g_dept
      LET g_sraa_m.sraacrtid = g_user
      LET g_sraa_m.sraacrtdp = g_dept 
      LET g_sraa_m.sraacrtdt = cl_get_current()
      LET g_sraa_m.sraamodid = g_user
      LET g_sraa_m.sraamoddt = cl_get_current()
      LET g_sraa_m.sraastus = 'N'
 
 
 
   
   CALL s_transaction_begin()
   
   #add-point:複製輸入前 name="reproduce.head.b_input"
      LET g_sraa_m.sraastus = "N"
   LET g_sraa_m.sraacnfid = ""
   LET g_sraa_m.sraacnfdt = ""
   LET g_sraa_m.sraa001_desc = ''
   DISPLAY BY NAME g_sraa_m.sraa001_desc
   LET g_sraa_m.sraa002 = YEAR(g_today)
   DISPLAY BY NAME g_sraa_m.sraa002
   LET g_sraa_m.sraa003 = MONTH(g_today)
   DISPLAY BY NAME g_sraa_m.sraa003
   CALL asrt300_desc()
   #end add-point
   
   #顯示狀態(stus)圖片
         #應用 a21 樣板自動產生(Version:3)
	  #根據當下狀態碼顯示圖片
      CASE g_sraa_m.sraastus 
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "C"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/closed.png")
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
      LET g_sraa_m.sraa001_desc = ''
   DISPLAY BY NAME g_sraa_m.sraa001_desc
 
   
   CALL asrt300_input("r")
   
   IF INT_FLAG AND NOT g_master_insert THEN
      LET INT_FLAG = 0
      DISPLAY g_detail_cnt  TO FORMONLY.h_count    #總筆數
      DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
      LET INT_FLAG = 0
      INITIALIZE g_sraa_m.* TO NULL
      INITIALIZE g_srab_d TO NULL
 
      #add-point:複製取消後 name="reproduce.cancel"
      
      #end add-point
      CALL asrt300_show()
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
   CALL asrt300_set_act_visible()   
   CALL asrt300_set_act_no_visible()
   
   #將新增的資料併入搜尋條件中
   LET g_sraa000_t = g_sraa_m.sraa000
   LET g_sraa001_t = g_sraa_m.sraa001
   LET g_sraa002_t = g_sraa_m.sraa002
   LET g_sraa003_t = g_sraa_m.sraa003
 
   
   #組合新增資料的條件
   LET g_add_browse = " sraaent = " ||g_enterprise|| " AND sraasite = '" ||g_site|| "' AND",
                      " sraa000 = '", g_sraa_m.sraa000, "' "
                      ," AND sraa001 = '", g_sraa_m.sraa001, "' "
                      ," AND sraa002 = '", g_sraa_m.sraa002, "' "
                      ," AND sraa003 = '", g_sraa_m.sraa003, "' "
 
   #填到最後面
   LET g_current_idx = g_browser.getLength() + 1
   CALL asrt300_browser_fill("")
   
   DISPLAY g_browser_cnt TO FORMONLY.h_count    #總筆數
   DISPLAY g_current_idx TO FORMONLY.h_index    #當下筆數
   CALL cl_navigator_setting(g_current_idx, g_browser_cnt)
   
   #add-point:完成複製段落後 name="reproduce.after_reproduce"
   
   #end add-point
   
   CALL asrt300_idx_chk()
   
   LET g_data_owner = g_sraa_m.sraaownid      
   LET g_data_dept  = g_sraa_m.sraaowndp
   
   #功能已完成,通報訊息中心
   CALL asrt300_msgcentre_notify('reproduce')
 
END FUNCTION
 
{</section>}
 
{<section id="asrt300.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION asrt300_detail_reproduce()
   #add-point:delete段define(客製用) name="detail_reproduce.define_customerization"
   
   #end add-point    
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE srab_t.* #此變數樣板目前無使用
 
 
   #add-point:delete段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="detail_reproduce.define"
      RETURN
   #end add-point    
   
   #add-point:Function前置處理  name="detail_reproduce.pre_function"
   
   #end add-point
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE asrt300_detail
   
   #add-point:單身複製前1 name="detail_reproduce.body.table1.b_insert"
   
   #end add-point
   
   #CREATE TEMP TABLE
   SELECT * FROM srab_t
    WHERE srabent = g_enterprise AND srabsite = g_site AND srab000 = g_sraa000_t
     AND srab001 = g_sraa001_t
     AND srab002 = g_sraa002_t
     AND srab003 = g_sraa003_t
 
    INTO TEMP asrt300_detail
 
   #將key修正為調整後   
   UPDATE asrt300_detail 
      #更新key欄位
      SET srab000 = g_sraa_m.sraa000
          , srab001 = g_sraa_m.sraa001
          , srab002 = g_sraa_m.sraa002
          , srab003 = g_sraa_m.sraa003
 
      #更新共用欄位
      
 
   #add-point:單身修改前 name="detail_reproduce.body.table1.b_update"
   
   #end add-point                                       
  
   #將資料塞回原table   
   INSERT INTO srab_t SELECT * FROM asrt300_detail
   
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
   DROP TABLE asrt300_detail
   
   #add-point:單身複製後1 name="detail_reproduce.body.table1.a_insert"
      CALL asrt300_b_fill()
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_sraa000_t = g_sraa_m.sraa000
   LET g_sraa001_t = g_sraa_m.sraa001
   LET g_sraa002_t = g_sraa_m.sraa002
   LET g_sraa003_t = g_sraa_m.sraa003
 
   
END FUNCTION
 
{</section>}
 
{<section id="asrt300.delete" >}
#+ 資料刪除
PRIVATE FUNCTION asrt300_delete()
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
   
   IF g_sraa_m.sraa000 IS NULL
   OR g_sraa_m.sraa001 IS NULL
   OR g_sraa_m.sraa002 IS NULL
   OR g_sraa_m.sraa003 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code = "std-00003" 
      LET g_errparam.popup = FALSE 
      CALL cl_err()
      RETURN
   END IF
   
   
   
   CALL s_transaction_begin()
 
   OPEN asrt300_cl USING g_enterprise, g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003
   IF SQLCA.SQLCODE THEN   #(ver:78)
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt300_cl:",SQLERRMESSAGE 
      LET g_errparam.code = SQLCA.SQLCODE   #(ver:78)
      LET g_errparam.popup = TRUE 
      CLOSE asrt300_cl
      CALL s_transaction_end('N','0')
      CALL cl_err()
      RETURN
   END IF
 
   #顯示最新的資料
   EXECUTE asrt300_master_referesh USING g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003 INTO g_sraa_m.sraa001, 
       g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000,g_sraa_m.sraastus,g_sraa_m.sraacrtid,g_sraa_m.sraacrtdp, 
       g_sraa_m.sraacrtdt,g_sraa_m.sraaownid,g_sraa_m.sraaowndp,g_sraa_m.sraamodid,g_sraa_m.sraamoddt, 
       g_sraa_m.sraacnfid,g_sraa_m.sraacnfdt,g_sraa_m.sraacrtid_desc,g_sraa_m.sraacrtdp_desc,g_sraa_m.sraaownid_desc, 
       g_sraa_m.sraaowndp_desc,g_sraa_m.sraamodid_desc,g_sraa_m.sraacnfid_desc
   
   
   #檢查是否允許此動作
   IF NOT asrt300_action_chk() THEN
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #遮罩相關處理
   LET g_sraa_m_mask_o.* =  g_sraa_m.*
   CALL asrt300_sraa_t_mask()
   LET g_sraa_m_mask_n.* =  g_sraa_m.*
   
   CALL asrt300_show()
   
   #add-point:delete段before ask name="delete.before_ask"
   
   #end add-point 
 
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前 name="delete.head.b_delete"
      
      #end add-point   
      
      #應用 a47 樣板自動產生(Version:4)
      #刪除相關文件
      CALL asrt300_set_pk_array()
      #add-point:相關文件刪除前 name="delete.befroe.related_document_remove"
      
      #end add-point   
      CALL cl_doc_remove()  
 
 
 
  
  
      #資料備份
      LET g_sraa000_t = g_sraa_m.sraa000
      LET g_sraa001_t = g_sraa_m.sraa001
      LET g_sraa002_t = g_sraa_m.sraa002
      LET g_sraa003_t = g_sraa_m.sraa003
 
 
      DELETE FROM sraa_t
       WHERE sraaent = g_enterprise AND sraasite = g_site AND sraa000 = g_sraa_m.sraa000
         AND sraa001 = g_sraa_m.sraa001
         AND sraa002 = g_sraa_m.sraa002
         AND sraa003 = g_sraa_m.sraa003
 
       
      #add-point:單頭刪除中 name="delete.head.m_delete"
      
      #end add-point
       
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = g_sraa_m.sraa000,":",SQLERRMESSAGE  
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF
      
      #add-point:單頭刪除後 name="delete.head.a_delete"
      
      #end add-point
  
      #add-point:單身刪除前 name="delete.body.b_delete"
            IF NOT asrt300_del_srac() THEN
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      #end add-point
      
      DELETE FROM srab_t
       WHERE srabent = g_enterprise AND srabsite = g_site AND srab000 = g_sraa_m.sraa000
         AND srab001 = g_sraa_m.sraa001
         AND srab002 = g_sraa_m.sraa002
         AND srab003 = g_sraa_m.sraa003
 
 
      #add-point:單身刪除中 name="delete.body.m_delete"
            
      #end add-point
         
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "srab_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL s_transaction_end('N','0')
         CALL cl_err()
         RETURN
      END IF    
 
      #add-point:單身刪除後 name="delete.body.a_delete"
            CALL g_srab_d2.clear()
      CALL g_srab_d3.clear()
      #end add-point
      
            
                                                               
 
 
 
      
      #修改歷程記錄(刪除)
      LET g_log1 = util.JSON.stringify(g_sraa_m)   #(ver:78)
      IF NOT cl_log_modified_record(g_log1,'') THEN    #(ver:78)
         CLOSE asrt300_cl
         CALL s_transaction_end('N','0')
         RETURN
      END IF
             
      CLEAR FORM
      CALL g_srab_d.clear() 
 
     
      CALL asrt300_ui_browser_refresh()  
      #CALL asrt300_ui_headershow()  
      #CALL asrt300_ui_detailshow()
 
      #add-point:多語言刪除 name="delete.lang.before_delete"
      
      #end add-point
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
 
   
      #add-point:多語言刪除 name="delete.lang.delete"
      
      #end add-point
      
      IF g_browser_cnt > 0 THEN 
         #CALL asrt300_browser_fill("")
         CALL asrt300_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
         DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
      ELSE
         CLEAR FORM
      END IF
      
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE asrt300_cl
 
   #功能已完成,通報訊息中心
   CALL asrt300_msgcentre_notify('delete')
    
END FUNCTION
 
{</section>}
 
{<section id="asrt300.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION asrt300_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point     
   DEFINE p_wc2      STRING
   DEFINE li_idx     LIKE type_t.num10
   #add-point:b_fill段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="b_fill.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="b_fill.pre_function"
   
   #end add-point
   
   #清空第一階單身
   CALL g_srab_d.clear()
 
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
      
   #end add-point
   
   #判斷是否填充
   IF asrt300_fill_chk(1) THEN
      #切換上下筆時不重組SQL
      IF (g_action_choice = "query" OR cl_null(g_action_choice))
      #add-point:b_fill段long_sql_if name="b_fill.long_sql_if"
      
      #end add-point
      THEN
         LET g_sql = "SELECT  DISTINCT srab004,srab005,srab006,srab007,srab008,srab011,srab012,srab009 , 
             t1.imaal003 ,t2.ecba003 FROM srab_t",   
                     " INNER JOIN sraa_t ON sraaent = " ||g_enterprise|| " AND sraasite = '" ||g_site|| "' AND sraa000 = srab000 ",
                     " AND sraa001 = srab001 ",
                     " AND sraa002 = srab002 ",
                     " AND sraa003 = srab003 ",
 
                     #"",
                     
                     "",
                     #下層單身所需的join條件
 
                                    " LEFT JOIN imaal_t t1 ON t1.imaalent="||g_enterprise||" AND t1.imaal001=srab004 AND t1.imaal002='"||g_dlang||"' ",
               " LEFT JOIN ecba_t t2 ON t2.ecbaent="||g_enterprise||" AND t2.ecbasite=srabsite AND t2.ecba001=srab004 AND t2.ecba002=srab008  ",
 
                     " WHERE srabent=? AND srabsite=? AND srab000=? AND srab001=? AND srab002=? AND srab003=?"
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         #add-point:b_fill段sql_before name="b_fill.body.fill_sql"
      
         #end add-point
         IF NOT cl_null(g_wc2_table1) THEN
            LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
         END IF
         
         #子單身的WC
         
         
         LET g_sql = g_sql, " ORDER BY srab_t.srab004,srab_t.srab005,srab_t.srab006,srab_t.srab009"
         
         #add-point:單身填充控制 name="b_fill.sql"
            LET g_sql = "SELECT UNIQUE srab004,srab005,srab006,srab007,srab008,srab011,srab012,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','' FROM srab_t",   
                  " INNER JOIN sraa_t ON sraa000 = srab000 ",
                  "   AND sraa001 = srab001 ",
                  "   AND sraa002 = srab002 ",
                  "   AND sraa003 = srab003 ",
                  " WHERE srabent=? AND srabsite=? AND srab000=? AND srab001=? AND srab002=? AND srab003=?"
      
      IF NOT cl_null(g_wc2_table1) THEN
         LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
      END IF
      
      #子單身的WC
      LET g_sql = g_sql, " ORDER BY srab_t.srab004,srab_t.srab005,srab_t.srab006"
         #end add-point
         
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE asrt300_pb FROM g_sql
         DECLARE b_fill_cs CURSOR FOR asrt300_pb
      END IF
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
   #  OPEN b_fill_cs USING g_enterprise, g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003   #(ver:78)
                                               
      FOREACH b_fill_cs USING g_enterprise, g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002, 
          g_sraa_m.sraa003 INTO g_srab_d[l_ac].srab004,g_srab_d[l_ac].srab005,g_srab_d[l_ac].srab006, 
          g_srab_d[l_ac].srab007,g_srab_d[l_ac].srab008,g_srab_d[l_ac].srab011,g_srab_d[l_ac].srab012, 
          g_srab_d[l_ac].srab009,g_srab_d[l_ac].srab004_desc,g_srab_d[l_ac].srab008_desc   #(ver:78) 
 
         IF SQLCA.SQLCODE THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "FOREACH:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL cl_err()
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充 name="b_fill.fill"
                  LET g_srab_d[l_ac].srab009 = '1000/01/01'
         CALL asrt300_srab_desc()
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
   
   CALL g_srab_d.deleteElement(g_srab_d.getLength())
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE asrt300_pb
 
   
   LET li_idx = l_ac
   
   #遮罩相關處理
   FOR l_ac = 1 TO g_srab_d.getLength()
      LET g_srab_d_mask_o[l_ac].* =  g_srab_d[l_ac].*
      CALL asrt300_srab_t_mask()
      LET g_srab_d_mask_n[l_ac].* =  g_srab_d[l_ac].*
   END FOR
   
 
   
   LET l_ac = li_idx
   
   CALL cl_ap_performance_next_end()
 
END FUNCTION
 
{</section>}
 
{<section id="asrt300.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION asrt300_delete_b(ps_table,ps_keys_bak,ps_page)
   #add-point:delete_b段define(客製用) name="delete_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:delete_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="delete_b.define"
      RETURN
   #end add-point     
   
   #add-point:Function前置處理  name="delete_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE  
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前 name="delete_b.b_delete"
      
      #end add-point    
      DELETE FROM srab_t
       WHERE srabent = g_enterprise AND srabsite = g_site AND
         srab000 = ps_keys_bak[1] AND srab001 = ps_keys_bak[2] AND srab002 = ps_keys_bak[3] AND srab003 = ps_keys_bak[4] AND srab004 = ps_keys_bak[5] AND srab005 = ps_keys_bak[6] AND srab006 = ps_keys_bak[7] AND srab009 = ps_keys_bak[8]
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
         CALL g_srab_d.deleteElement(li_idx) 
      END IF 
 
   END IF
   
 
   
 
   
   #add-point:delete_b段other name="delete_b.other"
   
   #end add-point  
   
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt300.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION asrt300_insert_b(ps_table,ps_keys,ps_page)
   #add-point:insert_b段define(客製用) name="insert_b.define_customerization"
   
   #end add-point     
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE ls_page     STRING
   DEFINE li_idx      LIKE type_t.num10
   #add-point:insert_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="insert_b.define"
      RETURN
   #end add-point     
   
   #add-point:Function前置處理  name="insert_b.pre_function"
   
   #end add-point
   
   LET g_update = TRUE  
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前 name="insert_b.before_insert"
      
      #end add-point 
      INSERT INTO srab_t
                  (srabent, srabsite,
                   srab000,srab001,srab002,srab003,
                   srab004,srab005,srab006,srab009
                   ,srab007,srab008,srab011,srab012) 
            VALUES(g_enterprise, g_site,
                   ps_keys[1],ps_keys[2],ps_keys[3],ps_keys[4],ps_keys[5],ps_keys[6],ps_keys[7],ps_keys[8]
                   ,g_srab_d[g_detail_idx].srab007,g_srab_d[g_detail_idx].srab008,g_srab_d[g_detail_idx].srab011, 
                       g_srab_d[g_detail_idx].srab012)
      #add-point:insert_b段資料新增中 name="insert_b.m_insert"
      
      #end add-point 
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "srab_t:",SQLERRMESSAGE 
         LET g_errparam.code = SQLCA.SQLCODE 
         LET g_errparam.popup = FALSE 
         CALL cl_err()
      END IF
      
      LET li_idx = g_detail_idx
      IF ps_page <> "'1'" THEN 
         CALL g_srab_d.insertElement(li_idx) 
      END IF 
 
      #add-point:insert_b段資料新增後 name="insert_b.after_insert"
      
      #end add-point 
   END IF
   
 
   
 
   
   #add-point:insert_b段other name="insert_b.other"
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="asrt300.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION asrt300_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
      RETURN
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "srab_t" THEN
      #add-point:update_b段修改前 name="update_b.before_update"
      
      #end add-point 
      
      #將遮罩欄位還原
      CALL asrt300_srab_t_mask_restore('restore_mask_o')
               
      UPDATE srab_t 
         SET (srab000,srab001,srab002,srab003,
              srab004,srab005,srab006,srab009
              ,srab007,srab008,srab011,srab012) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3],ps_keys[4],ps_keys[5],ps_keys[6],ps_keys[7],ps_keys[8]
              ,g_srab_d[g_detail_idx].srab007,g_srab_d[g_detail_idx].srab008,g_srab_d[g_detail_idx].srab011, 
                  g_srab_d[g_detail_idx].srab012) 
         WHERE srabent = g_enterprise AND srabsite = g_site AND srab000 = ps_keys_bak[1] AND srab001 = ps_keys_bak[2] AND srab002 = ps_keys_bak[3] AND srab003 = ps_keys_bak[4] AND srab004 = ps_keys_bak[5] AND srab005 = ps_keys_bak[6] AND srab006 = ps_keys_bak[7] AND srab009 = ps_keys_bak[8]
      #add-point:update_b段修改中 name="update_b.m_update"
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "srab_t" 
            LET g_errparam.code = "std-00009" 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         WHEN SQLCA.SQLCODE #其他錯誤
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = "srab_t:",SQLERRMESSAGE 
            LET g_errparam.code = SQLCA.SQLCODE 
            LET g_errparam.popup = TRUE 
            CALL s_transaction_end('N','0')
            CALL cl_err()
            
         OTHERWISE
 
      END CASE
      
      #將遮罩欄位進行遮蔽
      CALL asrt300_srab_t_mask_restore('restore_mask_n')
               
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
 
{<section id="asrt300.key_update_b" >}
#+ 上層單身key欄位變動後, 連帶修正下層單身key欄位
PRIVATE FUNCTION asrt300_key_update_b(ps_keys_bak,ps_table)
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
 
{<section id="asrt300.key_delete_b" >}
#+ 上層單身刪除後, 連帶刪除下層單身key欄位
PRIVATE FUNCTION asrt300_key_delete_b(ps_keys_bak,ps_table)
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
 
{<section id="asrt300.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION asrt300_lock_b(ps_table,ps_page)
   #add-point:lock_b段define(客製用) name="lock_b.define_customerization"
   
   #end add-point   
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   #add-point:lock_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="lock_b.define"
      LET ls_group = "srab_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN asrt300_bcl USING g_enterprise, g_site,
                                       g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003,g_srab_d[g_detail_idx].srab004,g_srab_d[g_detail_idx].srab005,g_srab_d[g_detail_idx].srab006
                                       
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "asrt300_bcl"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   
   END IF
           
   RETURN TRUE
   #end add-point   
   
   #add-point:Function前置處理  name="lock_b.pre_function"
   
   #end add-point
    
   #先刷新資料
   #CALL asrt300_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "srab_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN asrt300_bcl USING g_enterprise, g_site,
                                       g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003, 
                                           g_srab_d[g_detail_idx].srab004,g_srab_d[g_detail_idx].srab005, 
                                           g_srab_d[g_detail_idx].srab006,g_srab_d[g_detail_idx].srab009  
                                               
      IF SQLCA.SQLCODE THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "asrt300_bcl:",SQLERRMESSAGE 
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
 
{<section id="asrt300.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION asrt300_unlock_b(ps_table,ps_page)
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
      CLOSE asrt300_bcl
   END IF
   
 
   
 
 
   #add-point:unlock_b段other name="unlock_b.other"
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="asrt300.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION asrt300_set_entry(p_cmd)
   #add-point:set_entry段define(客製用) name="set_entry.define_customerization"
   
   #end add-point       
   DEFINE p_cmd   LIKE type_t.chr1  
   #add-point:set_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_entry.define"
   
   #end add-point       
   
   #add-point:Function前置處理  name="set_entry.pre_function"
   
   #end add-point
   
   CALL cl_set_comp_entry("",TRUE)
   
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("sraa000,sraa001,sraa002,sraa003",TRUE)
      CALL cl_set_comp_entry("",TRUE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,TRUE)
      END IF
      #add-point:set_entry段欄位控制 name="set_entry.field_control"
      
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後 name="set_entry.after_control"
      CALL cl_set_comp_entry("sraa000",FALSE)
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt300.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION asrt300_set_no_entry(p_cmd)
   #add-point:set_no_entry段define(客製用) name="set_no_entry.define_customerization"
   
   #end add-point     
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry.define"
   
   #end add-point     
   
   #add-point:Function前置處理  name="set_no_entry.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("sraa000,sraa001,sraa002,sraa003",FALSE)
      #根據azzi850使用者身分開關特定欄位
      IF NOT cl_null(g_no_entry) THEN
         CALL cl_set_comp_entry(g_no_entry,FALSE)
      END IF
      #add-point:set_no_entry段欄位控制 name="set_no_entry.field_control"
      
      #end add-point 
   END IF 
   
   IF p_cmd = 'u' THEN  #docno,ld欄位確認是絕對關閉
      CALL cl_set_comp_entry("",FALSE)
   END IF 
 
#  IF p_cmd = 'u' THEN  #docdt欄位依照設定關閉(FALSE則為設定不同意修正) #(ver:78)
      IF NOT cl_chk_update_docdt() THEN
         CALL cl_set_comp_entry("",FALSE)
      END IF
#  END IF 
   
   #add-point:set_no_entry段欄位控制後 name="set_no_entry.after_control"
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt300.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION asrt300_set_entry_b(p_cmd)
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
      CALL cl_set_comp_entry("srab006,srab008",TRUE)
   CALL asrt300_cl_set_comp_entry("l_srab010_1_1,l_srab010_1_2,l_srab010_1_3,l_srab010_1_4,l_srab010_1_5,l_srab010_1_6,l_srab010_1_7,l_srab010_1_8,l_srab010_1_9,l_srab010_1_10,l_srab010_1_11,l_srab010_1_12,l_srab010_1_13,l_srab010_1_14,l_srab010_1_15,l_srab010_1_16,l_srab010_1_17,l_srab010_1_18,l_srab010_1_19,l_srab010_1_20",TRUE)
   CALL asrt300_cl_set_comp_entry("l_srab010_1_21,l_srab010_1_22,l_srab010_1_23,l_srab010_1_24,l_srab010_1_25,l_srab010_1_26,l_srab010_1_27,l_srab010_1_28,l_srab010_1_29,l_srab010_1_30,l_srab010_1_31",TRUE)
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="asrt300.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION asrt300_set_no_entry_b(p_cmd)
   #add-point:set_no_entry_b段define(客製用) name="set_no_entry_b.define_customerization"
   
   #end add-point    
   DEFINE p_cmd   LIKE type_t.chr1   
   #add-point:set_no_entry_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_no_entry_b.define"
      DEFINE l_imaa005    LIKE imaa_t.imaa005
   DEFINE l_days       LIKE type_t.num5
   DEFINE l_d          LIKE type_t.num5
   DEFINE l_d1         LIKE type_t.num5
   DEFINE l_n          LIKE type_t.num5
   DEFINE l_str        STRING
   DEFINE l_str1       STRING
   DEFINE l_srza003    LIKE srza_t.srza003
   #end add-point    
   
   #add-point:Function前置處理  name="set_no_entry_b.pre_function"
   
   #end add-point
   
   IF p_cmd = 'u' AND g_chkey = 'N' THEN
      CALL cl_set_comp_entry("",FALSE)
      #add-point:set_no_entry_b段欄位控制 name="set_no_entry_b.field_control"
      
      #end add-point 
   END IF 
   
   #add-point:set_no_entry_b段 name="set_no_entry_b.set_no_entry_b"
      LET l_imaa005 = ''
   SELECT imaa005 INTO l_imaa005 FROM imaa_t WHERE imaaent = g_enterprise AND imaa001 = g_srab_d[l_ac].srab004
   IF cl_null(l_imaa005) THEN
      CALL cl_set_comp_entry("srab006",FALSE)
      LET g_srab_d[l_ac].srab006 = ' '
   END IF
   IF g_srab_d[l_ac].srab007 = 'N' THEN
      LET g_srab_d[l_ac].srab008 = ' '
      LET g_srab_d[l_ac].srab008_desc = ''
      DISPLAY BY NAME g_srab_d[l_ac].srab008
      DISPLAY BY NAME g_srab_d[l_ac].srab008_desc
      CALL cl_set_comp_entry("srab008",FALSE)
   END IF
   CALL s_date_get_max_day(g_sraa_m.sraa002,g_sraa_m.sraa003) RETURNING l_days
   IF l_days = 30 THEN
      CALL asrt300_cl_set_comp_entry("l_srab010_1_31",FALSE)
   END IF
   IF l_days = 29 THEN
      CALL asrt300_cl_set_comp_entry("l_srab010_1_30,l_srab010_1_31",FALSE)
   END IF
   IF l_days = 28 THEN
      CALL asrt300_cl_set_comp_entry("l_srab010_1_30,l_srab010_1_31,l_srab010_1_29",FALSE)
   END IF
   LET l_d = DAY(g_today)
   SELECT srza003 INTO l_srza003
     FROM srza_t
    WHERE srzaent = g_enterprise
      AND srzasite = g_site
      AND srza001 = g_sraa_m.sraa001
   IF l_srza003 = 'N' THEN
      FOR l_n = 1 TO l_d
         LET l_d1 = l_n
         LET l_str1 = l_d1
         LET l_str = 'l_srab010_1_',l_str1
         CALL asrt300_cl_set_comp_entry(l_str,FALSE)
      END FOR
   END IF
   IF cl_null(g_srab_d[l_ac].srab004) OR g_srab_d[l_ac].srab005 IS NULL OR g_srab_d[l_ac].srab006 IS NULL THEN
      CALL asrt300_cl_set_comp_entry("l_srab010_1_1,l_srab010_1_2,l_srab010_1_3,l_srab010_1_4,l_srab010_1_5,l_srab010_1_6,l_srab010_1_7,l_srab010_1_8,l_srab010_1_9,l_srab010_1_10,l_srab010_1_11,l_srab010_1_12,l_srab010_1_13,l_srab010_1_14,l_srab010_1_15,l_srab010_1_16,l_srab010_1_17,l_srab010_1_18,l_srab010_1_19,l_srab010_1_20",FALSE)
      CALL asrt300_cl_set_comp_entry("l_srab010_1_21,l_srab010_1_22,l_srab010_1_23,l_srab010_1_24,l_srab010_1_25,l_srab010_1_26,l_srab010_1_27,l_srab010_1_28,l_srab010_1_29,l_srab010_1_30,l_srab010_1_31",FALSE)
   END IF
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="asrt300.set_act_visible" >}
#+ 單頭權限開啟
PRIVATE FUNCTION asrt300_set_act_visible()
   #add-point:set_act_visible段define(客製用) name="set_act_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible.define"
   
   #end add-point   
   #add-point:set_act_visible段 name="set_act_visible.set_act_visible"
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt300.set_act_no_visible" >}
#+ 單頭權限關閉
PRIVATE FUNCTION asrt300_set_act_no_visible()
   #add-point:set_act_no_visible段define(客製用) name="set_act_no_visible.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible.define"
   
   #end add-point   
   #add-point:set_act_no_visible段 name="set_act_no_visible.set_act_no_visible"
   IF g_sraa_m.sraastus = 'N' THEN
      CALL cl_set_act_visible("modify,delete,modify_detail", TRUE)
   ELSE
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   IF g_sraa_m.sraastus = 'C' OR g_sraa_m.sraastus = 'X'  THEN
      CALL cl_set_act_visible("statechange", FALSE)
   ELSE
      CALL cl_set_act_visible("statechange", TRUE)
   END IF
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt300.set_act_visible_b" >}
#+ 單身權限開啟
PRIVATE FUNCTION asrt300_set_act_visible_b()
   #add-point:set_act_visible_b段define(客製用) name="set_act_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_visible_b.define"
   
   #end add-point   
   #add-point:set_act_visible_b段 name="set_act_visible_b.set_act_visible_b"
   CALL cl_set_act_visible("statechange", TRUE)
   CALL cl_set_act_visible("modify,delete,insert,modify_detail", TRUE)
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt300.set_act_no_visible_b" >}
#+ 單身權限關閉
PRIVATE FUNCTION asrt300_set_act_no_visible_b()
   #add-point:set_act_no_visible_b段define(客製用) name="set_act_no_visible_b.define_customerization"
   
   #end add-point   
   #add-point:set_act_no_visible_b段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="set_act_no_visible_b.define"
   
   #end add-point   
   #add-point:set_act_no_visible_b段 name="set_act_no_visible_b.set_act_no_visible_b"
   IF g_sraa_m.sraastus <> 'N' THEN
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   IF g_sraa_m.sraastus = 'C' OR g_sraa_m.sraastus = 'X'  THEN
      CALL cl_set_act_visible("statechange", FALSE)
   END IF
   IF g_sraa_m.sraastus NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail", FALSE)
   END IF
   
   #end add-point   
END FUNCTION
 
{</section>}
 
{<section id="asrt300.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION asrt300_default_search()
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
      LET ls_wc = ls_wc, " sraa000 = '", g_argv[01], "' AND "
   END IF
   
   IF NOT cl_null(g_argv[02]) THEN
      LET ls_wc = ls_wc, " sraa001 = '", g_argv[02], "' AND "
   END IF
   IF NOT cl_null(g_argv[03]) THEN
      LET ls_wc = ls_wc, " sraa002 = '", g_argv[03], "' AND "
   END IF
   IF NOT cl_null(g_argv[04]) THEN
      LET ls_wc = ls_wc, " sraa003 = '", g_argv[04], "' AND "
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
               WHEN la_wc[li_idx].tableid = "sraa_t" 
                  LET g_wc = la_wc[li_idx].wc
               WHEN la_wc[li_idx].tableid = "srab_t" 
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
 
{<section id="asrt300.state_change" >}
   #應用 a09 樣板自動產生(Version:17)
#+ 確認碼變更 
PRIVATE FUNCTION asrt300_statechange()
   #add-point:statechange段define(客製用) name="statechange.define_customerization"
   
   #end add-point  
   DEFINE lc_state LIKE type_t.chr5
   #add-point:statechange段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="statechange.define"
      DEFINE l_n         LIKE type_t.num5
   DEFINE l_sraa000   LIKE sraa_t.sraa000
   DEFINE l_time      DATETIME YEAR TO SECOND
   #end add-point  
   
   #add-point:Function前置處理 name="statechange.before"
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_sraa_m.sraa000 IS NULL
      OR g_sraa_m.sraa001 IS NULL      OR g_sraa_m.sraa002 IS NULL      OR g_sraa_m.sraa003 IS NULL
   THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = "std-00003" 
      LET g_errparam.popup  = FALSE 
      CALL cl_err()
      RETURN
   END IF
 
   CALL s_transaction_begin()
   
   OPEN asrt300_cl USING g_enterprise, g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003
   IF STATUS THEN
      CLOSE asrt300_cl
      CALL s_transaction_end('N','0')
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "OPEN asrt300_cl:" 
      LET g_errparam.code   = STATUS 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      RETURN
   END IF
   
   #顯示最新的資料
   EXECUTE asrt300_master_referesh USING g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003 INTO g_sraa_m.sraa001, 
       g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000,g_sraa_m.sraastus,g_sraa_m.sraacrtid,g_sraa_m.sraacrtdp, 
       g_sraa_m.sraacrtdt,g_sraa_m.sraaownid,g_sraa_m.sraaowndp,g_sraa_m.sraamodid,g_sraa_m.sraamoddt, 
       g_sraa_m.sraacnfid,g_sraa_m.sraacnfdt,g_sraa_m.sraacrtid_desc,g_sraa_m.sraacrtdp_desc,g_sraa_m.sraaownid_desc, 
       g_sraa_m.sraaowndp_desc,g_sraa_m.sraamodid_desc,g_sraa_m.sraacnfid_desc
   
 
   #檢查是否允許此動作
   IF NOT asrt300_action_chk() THEN
      CLOSE asrt300_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #將資料顯示到畫面上
   DISPLAY BY NAME g_sraa_m.sraa001,g_sraa_m.sraa001_desc,g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000, 
       g_sraa_m.sraastus,g_sraa_m.sraacrtid,g_sraa_m.sraacrtid_desc,g_sraa_m.sraacrtdp,g_sraa_m.sraacrtdp_desc, 
       g_sraa_m.sraacrtdt,g_sraa_m.sraaownid,g_sraa_m.sraaownid_desc,g_sraa_m.sraaowndp,g_sraa_m.sraaowndp_desc, 
       g_sraa_m.sraamodid,g_sraa_m.sraamodid_desc,g_sraa_m.sraamoddt,g_sraa_m.sraacnfid,g_sraa_m.sraacnfid_desc, 
       g_sraa_m.sraacnfdt
 
   CASE g_sraa_m.sraastus
      WHEN "N"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/unconfirmed.png")
      WHEN "Y"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
      WHEN "C"
         CALL gfrm_curr.setElementImage("statechange", "stus/32/closed.png")
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
         CASE g_sraa_m.sraastus
            
            WHEN "N"
               HIDE OPTION "unconfirmed"
            WHEN "Y"
               HIDE OPTION "confirmed"
            WHEN "C"
               HIDE OPTION "closed"
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

      CASE g_sraa_m.sraastus
         WHEN "N"  
            CALL cl_set_act_visible("unconfirmed,hold",FALSE)
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            IF cl_bpm_chk() THEN
                CALL cl_set_act_visible("signing",TRUE)
                CALL cl_set_act_visible("confirmed",FALSE)
            END IF
 
         WHEN "R"   #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE)

         WHEN "D"   #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,unconfirmed,hold",FALSE) 
          
         WHEN "X"
            CALL cl_set_act_visible("unconfirmed,invalid,confirmed,hold",FALSE)

         WHEN "Y"
            CALL cl_set_act_visible("invalid,confirmed,hold",FALSE)
         
         WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
             CALL cl_set_act_visible("withdraw",TRUE)  
             CALL cl_set_act_visible("unconfirmed,invalid,confirmed,hold",FALSE)
         
         WHEN "A"     #只能顯示確認; 其餘應用功能皆隱藏
             CALL cl_set_act_visible("confirmed ",TRUE)  
             CALL cl_set_act_visible("unconfirmed,invalid,hold",FALSE)

      END CASE
     

      LET l_n = 0
      SELECT COUNT(*) INTO l_n
        FROM sraa_t
       WHERE sraaent = g_enterprise
         AND sraasite = g_site
         AND sraa001 = g_sraa_m.sraa001
         AND sraa002 = g_sraa_m.sraa002
         AND sraa003 = g_sraa_m.sraa003
      IF l_n > 1 THEN         
         SELECT MAX(sraa000) INTO l_sraa000
           FROM sraa_t
          WHERE sraaent = g_enterprise
            AND sraasite = g_site
            AND sraa001 = g_sraa_m.sraa001
            AND sraa002 = g_sraa_m.sraa002
            AND sraa003 = g_sraa_m.sraa003
         IF g_sraa_m.sraa000 <> l_sraa000 THEN
            CALL cl_set_act_visible("open", FALSE)
         END IF 
      END IF
      LET l_n = 0
      SELECT COUNT(*) INTO l_n
        FROM srab_t
       WHERE srabent =  g_enterprise 
         AND srabsite = g_site
         AND srab000 = g_sraa_m.sraa000
         AND srab001 = g_sraa_m.sraa001
         AND srab002 = g_sraa_m.sraa002
         AND srab003 = g_sraa_m.sraa003   
      IF l_n = 0 THEN
         CALL cl_set_act_visible("confirmed", FALSE)
      END IF       
      IF g_sraa_m.sraastus <>'N' THEN
         CALL cl_set_act_visible("invalid", FALSE)  
      END IF
      #end add-point
      
      #應用 a36 樣板自動產生(Version:5)
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
            IF NOT asrt300_send() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE asrt300_cl
            RETURN
         END IF
    
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT asrt300_draw_out() THEN
               CALL s_transaction_end('N','0')
            ELSE
               CALL s_transaction_end('Y','0')
            END IF
            #因應簽核行為, 該動作完成後不再進行後續處理
            #於此處直接返回
            CLOSE asrt300_cl
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
      ON ACTION closed
         IF cl_auth_chk_act("closed") THEN
            LET lc_state = "C"
            #add-point:action控制 name="statechange.closed"
         
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
      AND lc_state <> "C"
      AND lc_state <> "A"
      AND lc_state <> "D"
      AND lc_state <> "R"
      AND lc_state <> "W"
      AND lc_state <> "X"
      ) OR 
      g_sraa_m.sraastus = lc_state OR cl_null(lc_state) THEN
      CLOSE asrt300_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:stus修改前 name="statechange.b_update"

   IF lc_state = 'N' THEN
      IF NOT cl_ask_confirm('aim-00110') THEN
         CALL s_transaction_end('N','0')  #160816-00068#3 add
         RETURN
      ELSE  
         UPDATE sraa_t SET sraacnfid = '',
                           sraacnfdt = ''
          WHERE sraaent = g_enterprise
            AND sraasite = g_site
            AND sraa000 = g_sraa_m.sraa000
            AND sraa001 = g_sraa_m.sraa001
            AND sraa002 = g_sraa_m.sraa002
            AND sraa003 = g_sraa_m.sraa003
      END IF         
   END IF
   IF lc_state = 'Y' THEN
      IF NOT cl_ask_confirm('aim-00108') THEN
         CALL s_transaction_end('N','0')  #160816-00068#3 add
         RETURN
      ELSE
         LET l_time = cl_get_current()
         UPDATE sraa_t SET sraacnfid = g_user,
                           sraacnfdt = l_time
          WHERE sraaent = g_enterprise
            AND sraasite = g_site
            AND sraa000 = g_sraa_m.sraa000
            AND sraa001 = g_sraa_m.sraa001
            AND sraa002 = g_sraa_m.sraa002
            AND sraa003 = g_sraa_m.sraa003
         UPDATE sraa_t SET sraastus = 'C'
          WHERE sraaent = g_enterprise
            AND sraasite = g_site
            AND sraa000 < g_sraa_m.sraa000
            AND sraa001 = g_sraa_m.sraa001
            AND sraa002 = g_sraa_m.sraa002
            AND sraa003 = g_sraa_m.sraa003
            AND sraastus = 'Y'
      END IF         
   END IF
   IF lc_state = 'X' THEN
      IF NOT cl_ask_confirm('aim-00109') THEN
         CALL s_transaction_end('N','0')  #160816-00068#3 add
         RETURN
      END IF         
   END IF
   #end add-point
   
   LET g_sraa_m.sraamodid = g_user
   LET g_sraa_m.sraamoddt = cl_get_current()
   LET g_sraa_m.sraastus = lc_state
   
   #異動狀態碼欄位/修改人/修改日期
   UPDATE sraa_t 
      SET (sraastus,sraamodid,sraamoddt) 
        = (g_sraa_m.sraastus,g_sraa_m.sraamodid,g_sraa_m.sraamoddt)     
    WHERE sraaent = g_enterprise AND sraasite = g_site AND sraa000 = g_sraa_m.sraa000
      AND sraa001 = g_sraa_m.sraa001      AND sraa002 = g_sraa_m.sraa002      AND sraa003 = g_sraa_m.sraa003
    
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
         WHEN "C"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/closed.png")
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
      EXECUTE asrt300_master_referesh USING g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002, 
          g_sraa_m.sraa003 INTO g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000, 
          g_sraa_m.sraastus,g_sraa_m.sraacrtid,g_sraa_m.sraacrtdp,g_sraa_m.sraacrtdt,g_sraa_m.sraaownid, 
          g_sraa_m.sraaowndp,g_sraa_m.sraamodid,g_sraa_m.sraamoddt,g_sraa_m.sraacnfid,g_sraa_m.sraacnfdt, 
          g_sraa_m.sraacrtid_desc,g_sraa_m.sraacrtdp_desc,g_sraa_m.sraaownid_desc,g_sraa_m.sraaowndp_desc, 
          g_sraa_m.sraamodid_desc,g_sraa_m.sraacnfid_desc
      
      #將資料顯示到畫面上
      DISPLAY BY NAME g_sraa_m.sraa001,g_sraa_m.sraa001_desc,g_sraa_m.sraa002,g_sraa_m.sraa003,g_sraa_m.sraa000, 
          g_sraa_m.sraastus,g_sraa_m.sraacrtid,g_sraa_m.sraacrtid_desc,g_sraa_m.sraacrtdp,g_sraa_m.sraacrtdp_desc, 
          g_sraa_m.sraacrtdt,g_sraa_m.sraaownid,g_sraa_m.sraaownid_desc,g_sraa_m.sraaowndp,g_sraa_m.sraaowndp_desc, 
          g_sraa_m.sraamodid,g_sraa_m.sraamodid_desc,g_sraa_m.sraamoddt,g_sraa_m.sraacnfid,g_sraa_m.sraacnfid_desc, 
          g_sraa_m.sraacnfdt
   END IF
 
   #add-point:stus修改後 name="statechange.a_update"
 
   #end add-point
 
   #add-point:statechange段結束前 name="statechange.after"
   
   #end add-point  
 
   CLOSE asrt300_cl
   CALL s_transaction_end('Y','0')
 
   #功能已完成,通報訊息中心
   CALL asrt300_msgcentre_notify('statechange:'||lc_state)
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt300.idx_chk" >}
#+ 顯示正確的單身資料筆數
PRIVATE FUNCTION asrt300_idx_chk()
   #add-point:idx_chk段define(客製用) name="idx_chk.define_customerization"
   
   #end add-point  
   #add-point:idx_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="idx_chk.define"
      IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_srab_d2.getLength() THEN
         LET g_detail_idx = g_srab_d2.getLength()
      END IF
      IF g_detail_idx = 0 AND g_srab_d2.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_srab_d2.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 3 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail3")
      IF g_detail_idx > g_srab_d3.getLength() THEN
         LET g_detail_idx = g_srab_d3.getLength()
      END IF
      IF g_detail_idx = 0 AND g_srab_d3.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_srab_d3.getLength() TO FORMONLY.cnt
   END IF
   #end add-point  
   
   #add-point:Function前置處理  name="idx_chk.pre_function"
   
   #end add-point
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_srab_d.getLength() THEN
         LET g_detail_idx = g_srab_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_srab_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_srab_d.getLength() TO FORMONLY.cnt
   END IF
   
 
   
   #add-point:idx_chk段other name="idx_chk.other"
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="asrt300.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION asrt300_b_fill2(pi_idx)
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
   
   CALL asrt300_detail_show()
   
   LET g_detail_idx = li_detail_idx_tmp
   
END FUNCTION
 
{</section>}
 
{<section id="asrt300.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION asrt300_fill_chk(ps_idx)
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
 
{<section id="asrt300.status_show" >}
PRIVATE FUNCTION asrt300_status_show()
   #add-point:status_show段define(客製用) name="status_show.define_customerization"
   
   #end add-point
   #add-point:status_show段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="status_show.define"
   
   #end add-point
   
   #add-point:status_show段status_show name="status_show.status_show"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="asrt300.mask_functions" >}
&include "erp/asr/asrt300_mask.4gl"
 
{</section>}
 
{<section id="asrt300.signature" >}
   #應用 a39 樣板自動產生(Version:10)
#+ BPM提交
PRIVATE FUNCTION asrt300_send()
   #add-point:send段define(客製用) name="send.define_customerization"
   
   #end add-point 
   #add-point:send段define(請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="send.define"
   
   #end add-point 
   
   #add-point:Function前置處理  name="send.pre_function"
   
   #end add-point
   
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
 
 
   CALL asrt300_show()
   CALL asrt300_set_pk_array()
   
   #add-point: 初始化的ADP name="send.before_send"
   
   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_sraa_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_srab_d))
 
 
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
   #CALL asrt300_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL asrt300_ui_headershow()
   CALL asrt300_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION
 
 
 
#應用 a40 樣板自動產生(Version:9)
#+ BPM抽單
PRIVATE FUNCTION asrt300_draw_out()
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
   CALL asrt300_ui_headershow()  
   CALL asrt300_ui_detailshow()
 
   #add-point:Function後置處理  name="draw.after_function"
   
   #end add-point
 
   RETURN TRUE
   
END FUNCTION
 
 
 
 
 
{</section>}
 
{<section id="asrt300.set_pk_array" >}
   #應用 a51 樣板自動產生(Version:8)
#+ 給予pk_array內容
PRIVATE FUNCTION asrt300_set_pk_array()
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
   LET g_pk_array[1].values = g_sraa_m.sraa000
   LET g_pk_array[1].column = 'sraa000'
   LET g_pk_array[2].values = g_sraa_m.sraa001
   LET g_pk_array[2].column = 'sraa001'
   LET g_pk_array[3].values = g_sraa_m.sraa002
   LET g_pk_array[3].column = 'sraa002'
   LET g_pk_array[4].values = g_sraa_m.sraa003
   LET g_pk_array[4].column = 'sraa003'
   
   #add-point:set_pk_array段之後 name="set_pk_array.after"
   
   #end add-point  
   
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt300.other_dialog" readonly="Y" >}
   
 
{</section>}
 
{<section id="asrt300.msgcentre_notify" >}
#應用 a66 樣板自動產生(Version:6)
PRIVATE FUNCTION asrt300_msgcentre_notify(lc_state)
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
   CALL asrt300_set_pk_array()
   #單頭資料填寫
   LET g_msgparam.data[1] = util.JSON.stringify(g_sraa_m)
 
   #add-point:msgcentre其他通知 name="msgcentre_notify.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
 
 
 
{</section>}
 
{<section id="asrt300.action_chk" >}
#+ 修改/刪除前行為檢查(是否可允許此動作), 若有其他行為須管控也可透過此段落
PRIVATE FUNCTION asrt300_action_chk()
   #add-point:action_chk段define(客製用) name="action_chk.define_customerization"
   
   #end add-point
   #add-point:action_chk段define (請盡量不要在客製環境修改此段落內容, 否則將後續patch的調整需人工處理) name="action_chk.define"
   #160818-00017#37-s
   SELECT sraastus INTO g_sraa_m.sraastus FROM sraa_t
    WHERE sraaent = g_enterprise
      AND sraasite = g_site
      AND sraa000 = g_sraa_m.sraa000
      AND sraa001 = g_sraa_m.sraa001
      AND sraa002 = g_sraa_m.sraa002
      AND sraa003 = g_sraa_m.sraa003
   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_sraa_m.sraastus
        WHEN 'W'
           LET g_errno = 'sub-01347'
        WHEN 'X'
           LET g_errno = 'sub-00229'
        WHEN 'Y'
           LET g_errno = 'sub-00178'
        WHEN 'C'
           LET g_errno = 'ain-00197'

     END CASE

     IF NOT cl_null(g_errno) THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code = g_errno
        LET g_errparam.extend = g_sraa_m.sraa000
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        CALL asrt300_set_act_visible()
        CALL asrt300_set_act_no_visible()
        CALL asrt300_show()
        RETURN FALSE
     END IF
   END IF      
   #160818-00017#37-e
   #end add-point
   
   #add-point:action_chk段action_chk name="action_chk.action_chk"
   
   #end add-point
      
   RETURN TRUE
   
END FUNCTION
 
{</section>}
 
{<section id="asrt300.other_function" readonly="Y" >}
################################################################################
# Descriptions...: 檢查生產計畫檢查，存在有效且使用者有權限
# Memo...........:
# Usage..........: CALL asrt300_chk_sraa001()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/16 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_chk_sraa001()
DEFINE l_n          LIKE type_t.num5
DEFINE l_where      STRING
DEFINE l_success    LIKE type_t.num5
DEFINE l_sql        STRING

   LET g_errno = ""
   CALL s_control_get_sql('srza012','0','6',g_user,g_dept) RETURNING l_success,l_where
   LET l_n = 0 
   LET l_sql = "SELECT COUNT(*) ",
               " FROM srza_t ",
               "WHERE srzaent = '",g_enterprise,"'",
               "  AND srzasite = '",g_site,"'",
               "  AND srza001 = '",g_sraa_m.sraa001,"'",
               "  AND srzastus = 'Y' ",
               "  AND ",l_where
   PREPARE chk_contorl_pre FROM l_sql
   EXECUTE chk_contorl_pre INTO l_n   
   IF l_n = 0 THEN
      LET g_errno = 'asr-00015'
   END IF 
END FUNCTION
################################################################################
# Descriptions...: 單頭參考欄位顯示
# Memo...........:
# Usage..........: CALL asrt300_desc()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/16 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_desc()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_sraa_m.sraa001
   CALL ap_ref_array2(g_ref_fields,"SELECT srza002 FROM srza_t WHERE srzaent='"||g_enterprise||"' AND srzasite ='"||g_site||"'  AND srza001=? ","") RETURNING g_rtn_fields
   LET g_sraa_m.sraa001_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_sraa_m.sraa001_desc
END FUNCTION
################################################################################
# Descriptions...: 單頭生產計畫+計劃年月+版本檢查
# Memo...........:
# Usage..........: CALL asrt300_chk_sraa()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/16 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_chk_sraa()
DEFINE l_n       LIKE type_t.num5

   LET g_errno = ''
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM sraa_t
    WHERE sraaent = g_enterprise
      AND sraasite = g_site
      AND sraa001 = g_sraa_m.sraa001
      AND sraa002 = g_sraa_m.sraa002
      AND sraa003 = g_sraa_m.sraa003  
      AND sraastus = 'N'
   IF l_n > 0 THEN
      LET g_errno = 'asr-00016'
   END IF
   
END FUNCTION
################################################################################
# Descriptions...: 預設版本
# Memo...........:
# Usage..........: CALL asrt300_def_sraa000()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/17 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_def_sraa000()
   IF NOT cl_null(g_sraa_m.sraa001) AND NOT cl_null(g_sraa_m.sraa002) AND NOT cl_null(g_sraa_m.sraa003) THEN
      SELECT MAX(sraa000) +1 INTO g_sraa_m.sraa000
        FROM sraa_t
       WHERE sraaent = g_enterprise
         AND sraasite = g_site
         AND sraa001 = g_sraa_m.sraa001
         AND sraa002 = g_sraa_m.sraa002
         AND sraa003 = g_sraa_m.sraa003
       IF cl_null(g_sraa_m.sraa000) THEN
          LET g_sraa_m.sraa000 = 1
       END IF
    END IF
END FUNCTION
################################################################################
# Descriptions...: 生產料號+BOM特性檢查
# Memo...........:
# Usage..........: CALL asrt300_chk_bmaa()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/17 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_chk_bmaa()
DEFINE l_n             LIKE type_t.num5
DEFINE l_srza012       LIKE srza_t.srza012
DEFINE l_stus          LIKE imaa_t.imaastus
DEFINE l_where         STRING
DEFINE l_where1        STRING
DEFINE l_success       LIKE type_t.num5
DEFINE l_sql           STRING

   LET g_errno = ""
   LET l_srza012 = ""
   SELECT srza012 INTO l_srza012
     FROM srza_t
    WHERE srzaent = g_enterprise
      AND srzasite = g_site
      AND srza001 = g_sraa_m.sraa001
   IF NOT cl_null(g_srab_d[l_ac].srab004) THEN
      CALL s_control_get_sql('imaa009','5','6',g_user,g_dept) RETURNING l_success,l_where
      CALL s_control_get_sql('imaa001','6','6',g_user,g_dept) RETURNING l_success,l_where1
      LET l_n = 0 
      IF l_where <> " 1=1" AND l_where1 <> " 1=1" THEN
         LET l_sql = "SELECT COUNT(*) ",
                     " FROM imaa_t ",
                     "WHERE imaaent = '",g_enterprise,"'",
                     "  AND imaa001 = '",g_srab_d[l_ac].srab004,"'",
                     "  AND imaastus = 'Y' ",
                     "  AND (",l_where CLIPPED,
                     "       OR ",l_where1 CLIPPED,")"
      ELSE
         IF l_where = " 1=1" THEN
            LET l_sql = "SELECT COUNT(*) ",
                        " FROM imaa_t ",
                        "WHERE imaaent = '",g_enterprise,"'",
                        "  AND imaa001 = '",g_srab_d[l_ac].srab004,"'",
                        "  AND imaastus = 'Y' ",
                        "  AND (",l_where1 CLIPPED,")"
         END IF 
         IF l_where1 = " 1=1" THEN
            LET l_sql = "SELECT COUNT(*) ",
                        " FROM imaa_t ",
                        "WHERE imaaent = '",g_enterprise,"'",
                        "  AND imaa001 = '",g_srab_d[l_ac].srab004,"'",
                        "  AND imaastus = 'Y' ",
                        "  AND (",l_where CLIPPED,")"
         END IF             
      END IF
      PREPARE chk_contorl_pre1 FROM l_sql
      EXECUTE chk_contorl_pre1 INTO l_n  
      IF l_n = 0 THEN
         LET g_errno = 'asr-00015'
         RETURN
      END IF
      LET l_n = 0
      SELECT COUNT(*) INTO l_n
        FROM bmaa_t 
       WHERE bmaaent = g_enterprise
         AND bmaasite = g_site
         AND bmaa001 = g_srab_d[l_ac].srab004
      IF l_n = 0 THEN
         LET g_errno = 'aim-00126'
         RETURN
      ELSE
         LET l_stus = ''
         SELECT bmaastus INTO l_stus
           FROM bmaa_t 
          WHERE bmaaent = g_enterprise
            AND bmaasite = g_site
            AND bmaa001 = g_srab_d[l_ac].srab004
         IF l_stus = 'N' THEN
#            LET g_errno = 'asr-00017'     #160318-00005#44     mark
            LET g_errno = 'sub-01302'     #160318-00005#44     add
            RETURN
         END IF
         IF l_stus = 'X' THEN
#            LET g_errno = 'aim-00127'     #160318-00005#44     mark
            LET g_errno = 'sub-01302'     #160318-00005#44     add
            RETURN
         END IF
      END IF
      IF g_srab_d[l_ac].srab005 IS NOT NULL THEN
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM bmaa_t 
          WHERE bmaaent = g_enterprise
            AND bmaasite = g_site
            AND bmaa001 = g_srab_d[l_ac].srab004
            AND bmaa002 = g_srab_d[l_ac].srab005
         IF l_n = 0 THEN
            LET g_errno = 'asr-00018'
            RETURN
         ELSE
            LET l_stus = ''
            SELECT bmaastus INTO l_stus
              FROM bmaa_t 
             WHERE bmaaent = g_enterprise
               AND bmaasite = g_site
               AND bmaa001 = g_srab_d[l_ac].srab004
               AND bmaa002 = g_srab_d[l_ac].srab005
            IF l_stus = 'N' THEN
#               LET g_errno = 'asr-00017'     #160318-00005#44     mark
               LET g_errno = 'sub-01302'     #160318-00005#44     add
               RETURN
            END IF
            IF l_stus = 'X' THEN
#               LET g_errno = 'aim-00127'     #160318-00005#44     mark
               LET g_errno = 'sub-01302'     #160318-00005#44     add
               RETURN
            END IF
         END IF
      END IF
   END IF
END FUNCTION
################################################################################
# Descriptions...: srab單身參考欄位顯示
# Memo...........:
# Usage..........: CALL asrt300_srab_desc()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/17 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_srab_desc()
DEFINE l_srab009       LIKE srab_t.srab009

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_srab_d[l_ac].srab004
   CALL ap_ref_array2(g_ref_fields,"SELECT imaal003,imaal004 FROM imaal_t WHERE imaalent='"||g_enterprise||"' AND imaal001=? AND imaal002 = '"||g_dlang||"' ","") RETURNING g_rtn_fields
   LET g_srab_d[l_ac].srab004_desc = g_rtn_fields[1]
   LET g_srab_d[l_ac].srab004_desc_1 = g_rtn_fields[2]
   DISPLAY BY NAME g_srab_d[l_ac].srab004_desc
   DISPLAY BY NAME g_srab_d[l_ac].srab004_desc_1
   
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_srab_d[l_ac].srab004
   LET g_ref_fields[2] = g_srab_d[l_ac].srab008
   CALL ap_ref_array2(g_ref_fields,"SELECT ecba003 FROM ecba_t WHERE ecbaent='"||g_enterprise||"' AND ecbasite = '"||g_site||"' AND ecba001=? AND ecba002 = ? ","") RETURNING g_rtn_fields
   LET g_srab_d[l_ac].srab008_desc = g_rtn_fields[1]
   DISPLAY BY NAME g_srab_d[l_ac].srab008_desc
   
   LET l_srab009 = MDY(g_sraa_m.sraa003,1,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_1
   LET l_srab009 = MDY(g_sraa_m.sraa003,2,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_2
   LET l_srab009 = MDY(g_sraa_m.sraa003,3,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_3
   LET l_srab009 = MDY(g_sraa_m.sraa003,4,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_4
   LET l_srab009 = MDY(g_sraa_m.sraa003,5,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_5
   LET l_srab009 = MDY(g_sraa_m.sraa003,6,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_6
   LET l_srab009 = MDY(g_sraa_m.sraa003,7,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_7
   LET l_srab009 = MDY(g_sraa_m.sraa003,8,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_8
   LET l_srab009 = MDY(g_sraa_m.sraa003,9,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_9
   LET l_srab009 = MDY(g_sraa_m.sraa003,10,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_10
   LET l_srab009 = MDY(g_sraa_m.sraa003,11,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_11
   LET l_srab009 = MDY(g_sraa_m.sraa003,12,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_12
   LET l_srab009 = MDY(g_sraa_m.sraa003,13,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_13
   LET l_srab009 = MDY(g_sraa_m.sraa003,14,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_14
   LET l_srab009 = MDY(g_sraa_m.sraa003,15,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_15
   LET l_srab009 = MDY(g_sraa_m.sraa003,16,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_16
   LET l_srab009 = MDY(g_sraa_m.sraa003,17,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_17
   LET l_srab009 = MDY(g_sraa_m.sraa003,18,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_18
   LET l_srab009 = MDY(g_sraa_m.sraa003,19,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_19
   LET l_srab009 = MDY(g_sraa_m.sraa003,20,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_20
   LET l_srab009 = MDY(g_sraa_m.sraa003,21,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_21
   LET l_srab009 = MDY(g_sraa_m.sraa003,22,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_22
   LET l_srab009 = MDY(g_sraa_m.sraa003,23,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_23
   LET l_srab009 = MDY(g_sraa_m.sraa003,24,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_24
   LET l_srab009 = MDY(g_sraa_m.sraa003,25,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_25
   LET l_srab009 = MDY(g_sraa_m.sraa003,26,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_26
   LET l_srab009 = MDY(g_sraa_m.sraa003,27,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_27
   LET l_srab009 = MDY(g_sraa_m.sraa003,28,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_28
   LET l_srab009 = MDY(g_sraa_m.sraa003,29,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_29
   LET l_srab009 = MDY(g_sraa_m.sraa003,30,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_30
   LET l_srab009 = MDY(g_sraa_m.sraa003,31,g_sraa_m.sraa002)
   CALL asrt300_srab010(l_srab009) RETURNING g_srab_d[l_ac].l_srab010_1_31
   
   CALL asrt300_srab_sum()
                             
   DISPLAY BY NAME  g_srab_d[l_ac].sum                        
                            
END FUNCTION
################################################################################
# Descriptions...: 單身欄位必輸關閉設定
# Memo...........:
# Usage..........: CALL asrt300_set_no_required_b(p_cmd)
# Input parameter: p_cmd          記錄狀態
# Return code....: 無
# Date & Author..: 2013/12/17 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_set_no_required_b(p_cmd)
DEFINE p_cmd   LIKE type_t.chr1
   
   CALL cl_set_comp_required("srab006",FALSE)
END FUNCTION
################################################################################
# Descriptions...: 單身欄位必輸設定
# Memo...........:
# Usage..........: CALL asrt300_set_required_b(p_cmd)
# Input parameter: p_cmd          記錄狀態
# Return code....: 無
# Date & Author..: 2013/12/17 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_set_required_b(p_cmd)
DEFINE p_cmd        LIKE type_t.chr1
DEFINE l_imaa005    LIKE imaa_t.imaa005

   LET l_imaa005 = ''
   SELECT imaa005 INTO l_imaa005 
     FROM imaa_t
    WHERE imaaent = g_enterprise 
      AND imaa001 = g_srab_d[l_ac].srab004
   IF NOT cl_null(l_imaa005) THEN
      CALL cl_set_comp_required("srab006",TRUE)
   END IF
END FUNCTION
################################################################################
# Descriptions...: 制程編號檢查
# Memo...........:
# Usage..........: CALL asrt300_chk_srab008()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/17 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_chk_srab008()
DEFINE l_imae032         LIKE imae_t.imae032
DEFINE l_n               LIKE type_t.num5
DEFINE l_stus            LIKE ecba_t.ecbastus
DEFINE l_srza004         LIKE srza_t.srza004

#   SELECT srza004 INTO l_srza004
#     FROM srza_t
#    WHERE srzaent = g_enterprise
#      AND srzasite = g_site
#      AND srza001 = g_sraa_m.sraa001
#   LET g_errno = ''
   IF NOT cl_null(g_srab_d[l_ac].srab004) THEN
      IF l_srza004 = 'Y' THEN
      
         INITIALIZE g_chkparam.* TO NULL

         #設定g_chkparam.*的參數
         LET g_chkparam.arg1 = g_site
         LET g_chkparam.arg2 = g_srab_d[l_ac].srab004
         LET g_chkparam.arg3 = g_srab_d[l_ac].srab008
         #呼叫檢查存在並帶值的library
         IF NOT cl_chk_exist("v_ecba002_1") THEN
            LET g_srab_d[l_ac].srab004 = g_srab_d_t.srab004
            CALL asrt300_srab_desc()
            
         END IF


         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM ecba_t
          WHERE ecbaent = g_enterprise
            AND ecbasite = g_site
            AND ecba002 = g_srab_d[l_ac].srab008
            AND ecba001 = (SELECT imae032 FROM imae_t 
                             WHERE imaeent = g_enterprise
                               AND imaesite = g_site 
                               AND imae001 = g_srab_d[l_ac].srab004)
         IF l_n = 0 THEN
            LET g_errno = 'aec-00011'
            RETURN
         ELSE     
            SELECT ecbastus INTO l_stus
              FROM ecba_t
             WHERE ecbaent = g_enterprise
               AND ecbasite = g_site
               AND ecba002 = g_srab_d[l_ac].srab008
               AND ecba001 = (SELECT imae032 FROM imae_t 
                                WHERE imaeent = g_enterprise
                                  AND imaesite = g_site 
                                  AND imae001 = g_srab_d[l_ac].srab004)
            IF l_stus = 'X' THEN
#               LET g_errno = 'aec-00012'     #160318-00005#44  mark
               LET g_errno = 'sub-01302'     #160318-00005#44  add
               RETURN
            END IF
            IF l_stus = 'N' THEN
#               LET g_errno = 'aec-00019'     #160318-00005#44  mark
               LET g_errno = 'sub-01302'     #160318-00005#44  add
               RETURN
            END IF
         END IF
      END IF
   END IF
END FUNCTION
################################################################################
# Descriptions...: 生產料號預設值
# Memo...........:
# Usage..........: CALL asrt300_srab004_def()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/17 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_srab004_def()
   SELECT imae033,imae016 INTO g_srab_d[l_ac].srab008,g_srab_d[l_ac].srab011
     FROM imae_t
    WHERE imaeent = g_enterprise
      AND imaesite = g_site
      AND imae001 = g_srab_d[l_ac].srab004
   CALL asrt300_srab_desc()
END FUNCTION
################################################################################
# Descriptions...: 實際完成狀況數據填充
# Memo...........:
# Usage..........: CALL asrt300_b_fill_1()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/18 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_b_fill_1()
DEFINE l_n         LIKE type_t.num5
DEFINE l_n1        LIKE type_t.num5
DEFINE l_num       LIKE srab_t.srab010
DEFINE l_str       STRING
DEFINE l_str1      STRING
DEFINE l_str2      STRING
DEFINE l_str3      STRING

 
   CALL g_srab_d2.clear()    #g_srab_d2 單頭及單身 
   IF cl_null(g_srab_d[l_ac].srab004) THEN
      CALL g_srab_d.deleteElement(l_ac)
      RETURN
   END IF
   #計畫量
   LET g_srab_d2[1].srab004_1 = g_srab_d[l_ac].srab004
   LET g_srab_d2[1].srab004_1_desc = g_srab_d[l_ac].srab004_desc
   LET g_srab_d2[1].srab004_1_desc1 = g_srab_d[l_ac].srab004_desc_1
   LET g_srab_d2[2].srab004_1 = ''
   LET g_srab_d2[2].srab004_1_desc = ''
   LET g_srab_d2[2].srab004_1_desc1 = ''
   LET g_srab_d2[3].srab004_1 = ''
   LET g_srab_d2[3].srab004_1_desc = ''
   LET g_srab_d2[3].srab004_1_desc1 = ''
   LET g_srab_d2[4].srab004_1 = ''
   LET g_srab_d2[4].srab004_1_desc = ''
   LET g_srab_d2[4].srab004_1_desc1 = ''
   LET g_srab_d2[5].srab004_1 = ''
   LET g_srab_d2[5].srab004_1_desc = ''
   LET g_srab_d2[5].srab004_1_desc1 = ''
   LET g_srab_d2[6].srab004_1 = ''
   LET g_srab_d2[6].srab004_1_desc = ''
   LET g_srab_d2[6].srab004_1_desc1 = ''
   IF NOT cl_null(g_srab_d2[1].srab004_1) THEN
      SELECT gzze003 INTO g_srab_d2[1].chr1 FROM gzze_t WHERE gzze001 = 'asr-00019' AND gzze002 = g_dlang
      SELECT gzze003 INTO g_srab_d2[2].chr1 FROM gzze_t WHERE gzze001 = 'asr-00020' AND gzze002 = g_dlang
      SELECT gzze003 INTO g_srab_d2[3].chr1 FROM gzze_t WHERE gzze001 = 'asr-00021' AND gzze002 = g_dlang
      SELECT gzze003 INTO g_srab_d2[4].chr1 FROM gzze_t WHERE gzze001 = 'asr-00022' AND gzze002 = g_dlang
      SELECT gzze003 INTO g_srab_d2[5].chr1 FROM gzze_t WHERE gzze001 = 'asr-00023' AND gzze002 = g_dlang
      SELECT gzze003 INTO g_srab_d2[6].chr1 FROM gzze_t WHERE gzze001 = 'asr-00024' AND gzze002 = g_dlang
   ELSE
      LET g_srab_d2[1].chr1 = ''
      LET g_srab_d2[2].chr1 = ''
      LET g_srab_d2[3].chr1 = ''
      LET g_srab_d2[4].chr1 = ''
      LET g_srab_d2[5].chr1 = ''
      LET g_srab_d2[6].chr1 = ''
   END IF
   LET g_srab_d2[1].srab010_1 = g_srab_d[l_ac].l_srab010_1_1
   IF cl_null(g_srab_d2[1].srab010_1) THEN
      LET g_srab_d2[1].srab010_1 = 0
   END IF
   LET g_srab_d2[1].srab010_2 = g_srab_d[l_ac].l_srab010_1_2
   IF cl_null(g_srab_d2[1].srab010_2) THEN
      LET g_srab_d2[1].srab010_2 = 0
   END IF
   LET g_srab_d2[1].srab010_3 = g_srab_d[l_ac].l_srab010_1_3
   IF cl_null(g_srab_d2[1].srab010_3) THEN
      LET g_srab_d2[1].srab010_3 = 0
   END IF
   LET g_srab_d2[1].srab010_4 = g_srab_d[l_ac].l_srab010_1_4
   IF cl_null(g_srab_d2[1].srab010_4) THEN
      LET g_srab_d2[1].srab010_4 = 0
   END IF
   LET g_srab_d2[1].srab010_5 = g_srab_d[l_ac].l_srab010_1_5
   IF cl_null(g_srab_d2[1].srab010_5) THEN
      LET g_srab_d2[1].srab010_5 = 0
   END IF
   LET g_srab_d2[1].srab010_6 = g_srab_d[l_ac].l_srab010_1_6
   IF cl_null(g_srab_d2[1].srab010_6) THEN
      LET g_srab_d2[1].srab010_6 = 0
   END IF
   LET g_srab_d2[1].srab010_7 = g_srab_d[l_ac].l_srab010_1_7
   IF cl_null(g_srab_d2[1].srab010_7) THEN
      LET g_srab_d2[1].srab010_7 = 0
   END IF
   LET g_srab_d2[1].srab010_8 = g_srab_d[l_ac].l_srab010_1_8
   IF cl_null(g_srab_d2[1].srab010_8) THEN
      LET g_srab_d2[1].srab010_8 = 0
   END IF
   LET g_srab_d2[1].srab010_9 = g_srab_d[l_ac].l_srab010_1_9
   IF cl_null(g_srab_d2[1].srab010_9) THEN
      LET g_srab_d2[1].srab010_9 = 0
   END IF
   LET g_srab_d2[1].srab010_10 = g_srab_d[l_ac].l_srab010_1_10
   IF cl_null(g_srab_d2[1].srab010_10) THEN
      LET g_srab_d2[1].srab010_10 = 0
   END IF
   LET g_srab_d2[1].srab010_11 = g_srab_d[l_ac].l_srab010_1_11
   IF cl_null(g_srab_d2[1].srab010_11) THEN
      LET g_srab_d2[1].srab010_11 = 0
   END IF
   LET g_srab_d2[1].srab010_12 = g_srab_d[l_ac].l_srab010_1_12
   IF cl_null(g_srab_d2[1].srab010_12) THEN
      LET g_srab_d2[1].srab010_12 = 0
   END IF
   LET g_srab_d2[1].srab010_13 = g_srab_d[l_ac].l_srab010_1_13
   IF cl_null(g_srab_d2[1].srab010_13) THEN
      LET g_srab_d2[1].srab010_13 = 0
   END IF
   LET g_srab_d2[1].srab010_14 = g_srab_d[l_ac].l_srab010_1_14
   IF cl_null(g_srab_d2[1].srab010_14) THEN
      LET g_srab_d2[1].srab010_14 = 0
   END IF
   LET g_srab_d2[1].srab010_15 = g_srab_d[l_ac].l_srab010_1_15
   IF cl_null(g_srab_d2[1].srab010_15) THEN
      LET g_srab_d2[1].srab010_15 = 0
   END IF
   LET g_srab_d2[1].srab010_16 = g_srab_d[l_ac].l_srab010_1_16
   IF cl_null(g_srab_d2[1].srab010_16) THEN
      LET g_srab_d2[1].srab010_16 = 0
   END IF
   LET g_srab_d2[1].srab010_17 = g_srab_d[l_ac].l_srab010_1_17
   IF cl_null(g_srab_d2[1].srab010_17) THEN
      LET g_srab_d2[1].srab010_17 = 0
   END IF
   LET g_srab_d2[1].srab010_18 = g_srab_d[l_ac].l_srab010_1_18
   IF cl_null(g_srab_d2[1].srab010_18) THEN
      LET g_srab_d2[1].srab010_18 = 0
   END IF
   LET g_srab_d2[1].srab010_19 = g_srab_d[l_ac].l_srab010_1_19
   IF cl_null(g_srab_d2[1].srab010_19) THEN
      LET g_srab_d2[1].srab010_19 = 0
   END IF
   LET g_srab_d2[1].srab010_20 = g_srab_d[l_ac].l_srab010_1_20
   IF cl_null(g_srab_d2[1].srab010_20) THEN
      LET g_srab_d2[1].srab010_20 = 0
   END IF
   LET g_srab_d2[1].srab010_21 = g_srab_d[l_ac].l_srab010_1_21
   IF cl_null(g_srab_d2[1].srab010_21) THEN
      LET g_srab_d2[1].srab010_21 = 0
   END IF
   LET g_srab_d2[1].srab010_22 = g_srab_d[l_ac].l_srab010_1_22
   IF cl_null(g_srab_d2[1].srab010_22) THEN
      LET g_srab_d2[1].srab010_22 = 0
   END IF
   LET g_srab_d2[1].srab010_23 = g_srab_d[l_ac].l_srab010_1_23
   IF cl_null(g_srab_d2[1].srab010_23) THEN
      LET g_srab_d2[1].srab010_23 = 0
   END IF
   LET g_srab_d2[1].srab010_24 = g_srab_d[l_ac].l_srab010_1_24
   IF cl_null(g_srab_d2[1].srab010_24) THEN
      LET g_srab_d2[1].srab010_24 = 0
   END IF
   LET g_srab_d2[1].srab010_25 = g_srab_d[l_ac].l_srab010_1_25
   IF cl_null(g_srab_d2[1].srab010_25) THEN
      LET g_srab_d2[1].srab010_25 = 0
   END IF
   LET g_srab_d2[1].srab010_26 = g_srab_d[l_ac].l_srab010_1_26
   IF cl_null(g_srab_d2[1].srab010_26) THEN
      LET g_srab_d2[1].srab010_26 = 0
   END IF
   LET g_srab_d2[1].srab010_27 = g_srab_d[l_ac].l_srab010_1_27
   IF cl_null(g_srab_d2[1].srab010_27) THEN
      LET g_srab_d2[1].srab010_27 = 0
   END IF
   LET g_srab_d2[1].srab010_28 = g_srab_d[l_ac].l_srab010_1_28
   IF cl_null(g_srab_d2[1].srab010_28) THEN
      LET g_srab_d2[1].srab010_28 = 0
   END IF
   LET g_srab_d2[1].srab010_29 = g_srab_d[l_ac].l_srab010_1_29
   IF cl_null(g_srab_d2[1].srab010_29) THEN
      LET g_srab_d2[1].srab010_29 = 0
   END IF
   LET g_srab_d2[1].srab010_30 = g_srab_d[l_ac].l_srab010_1_30
   IF cl_null(g_srab_d2[1].srab010_30) THEN
      LET g_srab_d2[1].srab010_30 = 0
   END IF
   LET g_srab_d2[1].srab010_31 = g_srab_d[l_ac].l_srab010_1_31
   IF cl_null(g_srab_d2[1].srab010_31) THEN
      LET g_srab_d2[1].srab010_31 = 0
   END IF
   
   #實際量（入庫單數量）
   LET g_srab_d2[2].srab010_1 = 0
   LET g_srab_d2[2].srab010_2 = 0
   LET g_srab_d2[2].srab010_3 = 0
   LET g_srab_d2[2].srab010_4 = 0
   LET g_srab_d2[2].srab010_5 = 0
   LET g_srab_d2[2].srab010_6 = 0
   LET g_srab_d2[2].srab010_7 = 0
   LET g_srab_d2[2].srab010_8 = 0
   LET g_srab_d2[2].srab010_9 = 0
   LET g_srab_d2[2].srab010_10 = 0
   LET g_srab_d2[2].srab010_11 = 0
   LET g_srab_d2[2].srab010_12 = 0
   LET g_srab_d2[2].srab010_13 = 0
   LET g_srab_d2[2].srab010_14 = 0
   LET g_srab_d2[2].srab010_15 = 0
   LET g_srab_d2[2].srab010_16 = 0
   LET g_srab_d2[2].srab010_17 = 0
   LET g_srab_d2[2].srab010_18 = 0
   LET g_srab_d2[2].srab010_19 = 0
   LET g_srab_d2[2].srab010_20 = 0
   LET g_srab_d2[2].srab010_21 = 0
   LET g_srab_d2[2].srab010_22 = 0
   LET g_srab_d2[2].srab010_23 = 0
   LET g_srab_d2[2].srab010_24 = 0
   LET g_srab_d2[2].srab010_25 = 0
   LET g_srab_d2[2].srab010_26 = 0
   LET g_srab_d2[2].srab010_27 = 0
   LET g_srab_d2[2].srab010_28 = 0
   LET g_srab_d2[2].srab010_29 = 0
   LET g_srab_d2[2].srab010_30 = 0
   LET g_srab_d2[2].srab010_31 = 0
   #差異量
   LET g_srab_d2[3].srab010_1  = g_srab_d2[2].srab010_1  - g_srab_d2[1].srab010_1  
   LET g_srab_d2[3].srab010_2  = g_srab_d2[2].srab010_2  - g_srab_d2[1].srab010_2 
   LET g_srab_d2[3].srab010_3  = g_srab_d2[2].srab010_3  - g_srab_d2[1].srab010_3 
   LET g_srab_d2[3].srab010_4  = g_srab_d2[2].srab010_4  - g_srab_d2[1].srab010_4 
   LET g_srab_d2[3].srab010_5  = g_srab_d2[2].srab010_5  - g_srab_d2[1].srab010_5 
   LET g_srab_d2[3].srab010_6  = g_srab_d2[2].srab010_6  - g_srab_d2[1].srab010_6 
   LET g_srab_d2[3].srab010_7  = g_srab_d2[2].srab010_7  - g_srab_d2[1].srab010_7 
   LET g_srab_d2[3].srab010_8  = g_srab_d2[2].srab010_8  - g_srab_d2[1].srab010_8 
   LET g_srab_d2[3].srab010_9  = g_srab_d2[2].srab010_9  - g_srab_d2[1].srab010_9 
   LET g_srab_d2[3].srab010_10 = g_srab_d2[2].srab010_10 - g_srab_d2[1].srab010_10
   LET g_srab_d2[3].srab010_11 = g_srab_d2[2].srab010_11 - g_srab_d2[1].srab010_11
   LET g_srab_d2[3].srab010_12 = g_srab_d2[2].srab010_12 - g_srab_d2[1].srab010_12
   LET g_srab_d2[3].srab010_13 = g_srab_d2[2].srab010_13 - g_srab_d2[1].srab010_13
   LET g_srab_d2[3].srab010_14 = g_srab_d2[2].srab010_14 - g_srab_d2[1].srab010_14
   LET g_srab_d2[3].srab010_15 = g_srab_d2[2].srab010_15 - g_srab_d2[1].srab010_15
   LET g_srab_d2[3].srab010_16 = g_srab_d2[2].srab010_16 - g_srab_d2[1].srab010_16
   LET g_srab_d2[3].srab010_17 = g_srab_d2[2].srab010_17 - g_srab_d2[1].srab010_17
   LET g_srab_d2[3].srab010_18 = g_srab_d2[2].srab010_18 - g_srab_d2[1].srab010_18
   LET g_srab_d2[3].srab010_19 = g_srab_d2[2].srab010_19 - g_srab_d2[1].srab010_19
   LET g_srab_d2[3].srab010_20 = g_srab_d2[2].srab010_20 - g_srab_d2[1].srab010_20
   LET g_srab_d2[3].srab010_21 = g_srab_d2[2].srab010_21 - g_srab_d2[1].srab010_21
   LET g_srab_d2[3].srab010_22 = g_srab_d2[2].srab010_22 - g_srab_d2[1].srab010_22
   LET g_srab_d2[3].srab010_23 = g_srab_d2[2].srab010_23 - g_srab_d2[1].srab010_23
   LET g_srab_d2[3].srab010_24 = g_srab_d2[2].srab010_24 - g_srab_d2[1].srab010_24
   LET g_srab_d2[3].srab010_25 = g_srab_d2[2].srab010_25 - g_srab_d2[1].srab010_25
   LET g_srab_d2[3].srab010_26 = g_srab_d2[2].srab010_26 - g_srab_d2[1].srab010_26
   LET g_srab_d2[3].srab010_27 = g_srab_d2[2].srab010_27 - g_srab_d2[1].srab010_27
   LET g_srab_d2[3].srab010_28 = g_srab_d2[2].srab010_28 - g_srab_d2[1].srab010_28
   LET g_srab_d2[3].srab010_29 = g_srab_d2[2].srab010_29 - g_srab_d2[1].srab010_29
   LET g_srab_d2[3].srab010_30 = g_srab_d2[2].srab010_30 - g_srab_d2[1].srab010_30
   LET g_srab_d2[3].srab010_31 = g_srab_d2[2].srab010_31 - g_srab_d2[1].srab010_31
                         
   #計畫累積量
   LET l_num = 0
   IF NOT cl_null(g_srab_d2[1].srab010_1) THEN
      LET l_num = g_srab_d2[1].srab010_1
   END IF 
   LET g_srab_d2[4].srab010_1 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_2) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_2
   END IF    
   LET g_srab_d2[4].srab010_2 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_3) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_3
   END IF    
   LET g_srab_d2[4].srab010_3 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_4) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_4
   END IF    
   LET g_srab_d2[4].srab010_4 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_5) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_5
   END IF    
   LET g_srab_d2[4].srab010_5 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_6) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_6
   END IF    
   LET g_srab_d2[4].srab010_6 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_7) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_7
   END IF    
   LET g_srab_d2[4].srab010_7 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_8) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_8
   END IF    
   LET g_srab_d2[4].srab010_8 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_9) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_9
   END IF    
   LET g_srab_d2[4].srab010_9 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_10) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_10
   END IF    
   LET g_srab_d2[4].srab010_10 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_11) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_11
   END IF    
   LET g_srab_d2[4].srab010_11 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_12) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_12
   END IF    
   LET g_srab_d2[4].srab010_12 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_13) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_13
   END IF    
   LET g_srab_d2[4].srab010_13 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_14) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_14
   END IF    
   LET g_srab_d2[4].srab010_14 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_15) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_15
   END IF    
   LET g_srab_d2[4].srab010_15 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_16) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_16
   END IF    
   LET g_srab_d2[4].srab010_16 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_17) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_17
   END IF    
   LET g_srab_d2[4].srab010_17 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_18) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_18
   END IF    
   LET g_srab_d2[4].srab010_18 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_19) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_19
   END IF    
   LET g_srab_d2[4].srab010_19 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_20) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_20
   END IF    
   LET g_srab_d2[4].srab010_20 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_21) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_21
   END IF    
   LET g_srab_d2[4].srab010_21 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_22) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_22
   END IF    
   LET g_srab_d2[4].srab010_22 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_23) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_23
   END IF    
   LET g_srab_d2[4].srab010_23 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_24) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_24
   END IF    
   LET g_srab_d2[4].srab010_24 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_25) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_25
   END IF    
   LET g_srab_d2[4].srab010_25 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_26) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_26
   END IF    
   LET g_srab_d2[4].srab010_26 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_27) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_27
   END IF    
   LET g_srab_d2[4].srab010_27 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_28) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_28
   END IF    
   LET g_srab_d2[4].srab010_28 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_29) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_29
   END IF    
   LET g_srab_d2[4].srab010_29 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_30) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_30
   END IF    
   LET g_srab_d2[4].srab010_30 = l_num
   IF NOT cl_null(g_srab_d2[1].srab010_31) THEN
      LET l_num = l_num + g_srab_d2[1].srab010_31
   END IF    
   LET g_srab_d2[4].srab010_31 = l_num
                         
       
   #實際累積量  
   LET l_num = 0
   IF NOT cl_null(g_srab_d2[2].srab010_1) THEN
      LET l_num = g_srab_d2[2].srab010_1
   END IF 
   LET g_srab_d2[5].srab010_1 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_1) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_1
   END IF 
   IF NOT cl_null(g_srab_d2[2].srab010_2) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_2
   END IF    
   LET g_srab_d2[5].srab010_2 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_3) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_3
   END IF    
   LET g_srab_d2[5].srab010_3 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_4) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_4
   END IF    
   LET g_srab_d2[5].srab010_4 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_5) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_5
   END IF    
   LET g_srab_d2[5].srab010_5 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_6) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_6
   END IF    
   LET g_srab_d2[5].srab010_6 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_7) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_7
   END IF    
   LET g_srab_d2[5].srab010_7 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_8) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_8
   END IF    
   LET g_srab_d2[5].srab010_8 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_9) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_9
   END IF    
   LET g_srab_d2[5].srab010_9 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_10) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_10
   END IF    
   LET g_srab_d2[5].srab010_10 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_11) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_11
   END IF    
   LET g_srab_d2[5].srab010_11 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_12) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_12
   END IF    
   LET g_srab_d2[5].srab010_12 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_13) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_13
   END IF    
   LET g_srab_d2[5].srab010_13 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_14) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_14
   END IF    
   LET g_srab_d2[5].srab010_14 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_15) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_15
   END IF    
   LET g_srab_d2[5].srab010_15 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_16) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_16
   END IF    
   LET g_srab_d2[5].srab010_16 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_17) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_17
   END IF    
   LET g_srab_d2[5].srab010_17 = l_num	
   IF NOT cl_null(g_srab_d2[2].srab010_18) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_18
   END IF    
   LET g_srab_d2[5].srab010_18 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_19) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_19
   END IF    
   LET g_srab_d2[5].srab010_19 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_20) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_20
   END IF    
   LET g_srab_d2[5].srab010_20 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_21) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_21
   END IF    
   LET g_srab_d2[5].srab010_21 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_22) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_22
   END IF    
   LET g_srab_d2[5].srab010_22 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_23) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_23
   END IF    
   LET g_srab_d2[5].srab010_23 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_24) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_24
   END IF    
   LET g_srab_d2[5].srab010_24 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_25) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_25
   END IF    
   LET g_srab_d2[5].srab010_25 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_26) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_26
   END IF    
   LET g_srab_d2[5].srab010_26 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_27) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_27
   END IF    
   LET g_srab_d2[5].srab010_27 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_28) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_28
   END IF    
   LET g_srab_d2[5].srab010_28 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_29) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_29
   END IF    
   LET g_srab_d2[5].srab010_29 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_30) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_30
   END IF    
   LET g_srab_d2[5].srab010_30 = l_num
   IF NOT cl_null(g_srab_d2[2].srab010_31) THEN
      LET l_num = l_num + g_srab_d2[2].srab010_31
   END IF    
   LET g_srab_d2[5].srab010_31 = l_num
   
         
   #差異累積量      
   LET g_srab_d2[6].srab010_1  = g_srab_d2[5].srab010_1  - g_srab_d2[4].srab010_1  
   LET g_srab_d2[6].srab010_2  = g_srab_d2[5].srab010_2  - g_srab_d2[4].srab010_2 
   LET g_srab_d2[6].srab010_3  = g_srab_d2[5].srab010_3  - g_srab_d2[4].srab010_3 
   LET g_srab_d2[6].srab010_4  = g_srab_d2[5].srab010_4  - g_srab_d2[4].srab010_4 
   LET g_srab_d2[6].srab010_5  = g_srab_d2[5].srab010_5  - g_srab_d2[4].srab010_5 
   LET g_srab_d2[6].srab010_6  = g_srab_d2[5].srab010_6  - g_srab_d2[4].srab010_6 
   LET g_srab_d2[6].srab010_7  = g_srab_d2[5].srab010_7  - g_srab_d2[4].srab010_7 
   LET g_srab_d2[6].srab010_8  = g_srab_d2[5].srab010_8  - g_srab_d2[4].srab010_8 
   LET g_srab_d2[6].srab010_9  = g_srab_d2[5].srab010_9  - g_srab_d2[4].srab010_9 
   LET g_srab_d2[6].srab010_10 = g_srab_d2[5].srab010_10 - g_srab_d2[4].srab010_10
   LET g_srab_d2[6].srab010_11 = g_srab_d2[5].srab010_11 - g_srab_d2[4].srab010_11
   LET g_srab_d2[6].srab010_12 = g_srab_d2[5].srab010_12 - g_srab_d2[4].srab010_12
   LET g_srab_d2[6].srab010_13 = g_srab_d2[5].srab010_13 - g_srab_d2[4].srab010_13
   LET g_srab_d2[6].srab010_14 = g_srab_d2[5].srab010_14 - g_srab_d2[4].srab010_14
   LET g_srab_d2[6].srab010_15 = g_srab_d2[5].srab010_15 - g_srab_d2[4].srab010_15
   LET g_srab_d2[6].srab010_16 = g_srab_d2[5].srab010_16 - g_srab_d2[4].srab010_16
   LET g_srab_d2[6].srab010_17 = g_srab_d2[5].srab010_17 - g_srab_d2[4].srab010_17
   LET g_srab_d2[6].srab010_18 = g_srab_d2[5].srab010_18 - g_srab_d2[4].srab010_18
   LET g_srab_d2[6].srab010_19 = g_srab_d2[5].srab010_19 - g_srab_d2[4].srab010_19
   LET g_srab_d2[6].srab010_20 = g_srab_d2[5].srab010_20 - g_srab_d2[4].srab010_20
   LET g_srab_d2[6].srab010_21 = g_srab_d2[5].srab010_21 - g_srab_d2[4].srab010_21
   LET g_srab_d2[6].srab010_22 = g_srab_d2[5].srab010_22 - g_srab_d2[4].srab010_22
   LET g_srab_d2[6].srab010_23 = g_srab_d2[5].srab010_23 - g_srab_d2[4].srab010_23
   LET g_srab_d2[6].srab010_24 = g_srab_d2[5].srab010_24 - g_srab_d2[4].srab010_24
   LET g_srab_d2[6].srab010_25 = g_srab_d2[5].srab010_25 - g_srab_d2[4].srab010_25
   LET g_srab_d2[6].srab010_26 = g_srab_d2[5].srab010_26 - g_srab_d2[4].srab010_26
   LET g_srab_d2[6].srab010_27 = g_srab_d2[5].srab010_27 - g_srab_d2[4].srab010_27
   LET g_srab_d2[6].srab010_28 = g_srab_d2[5].srab010_28 - g_srab_d2[4].srab010_28
   LET g_srab_d2[6].srab010_29 = g_srab_d2[5].srab010_29 - g_srab_d2[4].srab010_29
   LET g_srab_d2[6].srab010_30 = g_srab_d2[5].srab010_30 - g_srab_d2[4].srab010_30
   LET g_srab_d2[6].srab010_31 = g_srab_d2[5].srab010_31 - g_srab_d2[4].srab010_31
                         
                            
END FUNCTION
################################################################################
# Descriptions...: 制程在制狀況數據填充
# Memo...........:
# Usage..........: CALL asrt300_b_fill_2()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/18 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_b_fill_2()
   
   CALL g_srab_d3.clear()
   IF cl_null(g_srab_d[l_ac].srab004) THEN
      CALL g_srab_d.deleteElement(l_ac)
      RETURN
   END IF
   LET g_sql = " SELECT UNIQUE srac007,srac008,'',srac009,srac010,srac030,srac031,srac032,srac033,srac034,srac035,srac038,srac039,srac040,srac041,srac042,srac043,srac044,srac045",
               "   FROM srac_t",
               "  WHERE sracent = '",g_enterprise,"'",
               "    AND sracsite = '",g_site,"'",
               "    AND srac001 = '",g_sraa_m.sraa001,"'",
               "    AND srac002 = '",g_srab_d[l_ac].srab008,"'",
               "    AND srac004 = '",g_srab_d[l_ac].srab004,"'",
               "    AND srac005 = '",g_srab_d[l_ac].srab005,"'",
               "    AND srac006 = '",g_srab_d[l_ac].srab006,"'"
   PREPARE asrt300_srac_pb FROM g_sql
   DECLARE asrt300_srac_cs CURSOR FOR asrt300_srac_pb
   LET g_cnt = l_ac2
   LET l_ac2 = 1
   FOREACH asrt300_srac_cs INTO g_srab_d3[l_ac2].*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      CALL asrt300_srac_desc()
      LET l_ac2 = l_ac2 + 1
      IF l_ac2 > g_max_rec AND g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
   END FOREACH
   CALL g_srab_d3.deleteElement(g_srab_d3.getLength())
   LET l_ac2 = g_cnt
   LET g_cnt = 0  
   
   FREE asrt300_srac_pb

END FUNCTION
################################################################################
# Descriptions...: 新增制程在制資料
# Memo...........:
# Usage..........: CALL asrt300_ins_srac()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/17 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_ins_srac()
DEFINE l_n            LIKE type_t.num5
DEFINE l_sql          STRING
DEFINE l_imae032      LIKE imae_t.imae032


   IF g_srab_d[l_ac].srab007 = 'Y' THEN
      LET l_imae032 = ''
      SELECT imae032 INTO l_imae032
        FROM imae_t
       WHERE imaeent = g_enterprise
         AND imaesite = g_site
         AND imae001 = g_srab_d[l_ac].srab004
      LET l_n = 0
      SELECT COUNT(*) INTO l_n
        FROM srac_t
       WHERE sracent = g_enterprise 
         AND sracsite = g_site
         AND srac001 = g_sraa_m.sraa001
         AND srac002 = g_srab_d[l_ac].srab008
         AND srac004 = g_srab_d[l_ac].srab004
         AND srac005 = g_srab_d[l_ac].srab005
         AND srac006 = g_srab_d[l_ac].srab006
      IF l_n = 0 THEN
         IF NOT cl_null(l_imae032) THEN
            LET l_sql = "INSERT INTO srac_t(sracent,sracsite,srac001,srac002,srac004,srac005,srac006,srac007,srac008,srac009,srac010,srac011,srac012,srac013,srac014,srac015,srac016,srac017,srac018,srac019,srac020,",
                        "                   srac021,srac022,srac023,srac024,srac025,srac026,srac027,srac028,srac029,srac030,srac031,srac032,srac033,srac034,srac035,srac036,srac037,srac038,srac039,srac040,srac041,srac042,srac043,srac044,srac045,srac046,srac047,srac048)",
                        "SELECT '",g_enterprise,"','",g_site,"','",g_sraa_m.sraa001,"','",g_srab_d[l_ac].srab008,"','",g_srab_d[l_ac].srab004,"','",g_srab_d[l_ac].srab005,"','",g_srab_d[l_ac].srab006,"',ecbb003,ecbb004,ecbb005,",
                        "       ecbb006,ecbb007,ecbb008,ecbb009,ecbb010,ecbb011,ecbb012,ecbb024,ecbb025,ecbb026,ecbb027,ecbb015,ecbb016,ecbb017,ecbb018,ecbb019,ecbb020,ecbb021,ecbb022,ecbb023,0,0,0,0,0,0,ecbb013,ecbb014,0,0,0,0,0,0,0,0,ecbb030,ecbb031,ecbb032 ",
                        "  FROM ecbb_t ",
                        " WHERE ecbbent = '",g_enterprise,"'",
                        "   AND ecbbsite = '",g_site,"'",
                        "   AND ecbb001 = '",l_imae032,"'",
                        "   AND ecbb002 = '",g_srab_d[l_ac].srab008,"' "
            PREPARE asrt300_ins_srac_pre FROM l_sql
            EXECUTE asrt300_ins_srac_pre
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'ins_srac'
               LET g_errparam.popup = FALSE
               CALL cl_err()

               RETURN FALSE
            END IF
            LET l_sql = "INSERT INTO srad_t(sradent,sradsite,srad001,srad002,srad004,srad005,srad006,srad007,srad008,srad009,srad010,srad011,srad012,srad013,srad014,sradseq)",
                        "SELECT '",g_enterprise,"','",g_site,"','",g_sraa_m.sraa001,"','",g_srab_d[l_ac].srab008,"','",g_srab_d[l_ac].srab004,"','",g_srab_d[l_ac].srab005,"','",g_srab_d[l_ac].srab006,"',",
                        "       ecbf003,ecbf004,ecbf005,ecbf006,ecbf007,ecbf008,ecbf009,ecbf010,ecbfseq",
                        "  FROM ecbf_t ",
                        " WHERE ecbfent = '",g_enterprise,"'",
                        "   AND ecbfsite = '",g_site,"'",
                        "   AND ecbf001 = '",l_imae032,"'",
                        "   AND ecbf002 = '",g_srab_d[l_ac].srab008,"' "
            PREPARE asrt300_ins_srad_pre FROM l_sql
            EXECUTE asrt300_ins_srad_pre
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'ins_srad'
               LET g_errparam.popup = FALSE
               CALL cl_err()

               RETURN FALSE
            END IF
            LET l_sql = "INSERT INTO srae_t(sraeent,sraesite,srae001,srae002,srae004,srae005,srae006,srae007,srae008,srae009,sraeseq)",
                        "SELECT '",g_enterprise,"','",g_site,"','",g_sraa_m.sraa001,"','",g_srab_d[l_ac].srab008,"','",g_srab_d[l_ac].srab004,"','",g_srab_d[l_ac].srab005,"','",g_srab_d[l_ac].srab006,"',",
                        "       ecbe003,ecbe004,ecbe005,ecbeseq ",
                        "  FROM ecbe_t ",
                        " WHERE ecbeent = '",g_enterprise,"'",
                        "   AND ecbesite = '",g_site,"'",
                        "   AND ecbe001 = '",l_imae032,"'",
                        "   AND ecbe002 = '",g_srab_d[l_ac].srab008,"' "
            PREPARE asrt300_ins_srae_pre FROM l_sql
            EXECUTE asrt300_ins_srae_pre
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'ins_srae'
               LET g_errparam.popup = FALSE
               CALL cl_err()

               RETURN FALSE
            END IF 
         END IF            
      END IF
   ELSE
      LET l_n = 0
      SELECT COUNT(*) INTO l_n
        FROM srac_t
       WHERE sracent = g_enterprise 
         AND sracsite = g_site
         AND srac001 = g_sraa_m.sraa001
         AND srac002 = ' '
         AND srac004 = g_srab_d[l_ac].srab004
         AND srac005 = g_srab_d[l_ac].srab005
         AND srac006 = g_srab_d[l_ac].srab006
      IF l_n = 0 THEN
         INSERT INTO srac_t(sracent,sracsite,srac001,srac002,srac004,srac005,srac006,srac007,srac008,srac009,srac010,srac011,srac012,srac013,srac014,srac015,srac016,srac017,srac018,srac019,srac020,srac021,srac022,srac023,srac024,srac025,srac026,srac027,srac028,srac029,srac030,srac031,srac032,srac033,srac034,srac035,srac036,srac037,srac038,srac039,srac040,srac041,srac042,srac043,srac044,srac045)
                     VALUES(g_enterprise,g_site,g_sraa_m.sraa001,' ',g_srab_d[l_ac].srab004,g_srab_d[l_ac].srab005,g_srab_d[l_ac].srab006,1,' ',' ',1,'','INIT',0,'END',0,'',0,0,0,0,'N','N','Y','N','N','N',g_srab_d[l_ac].srab011,1,1,0,0,0,0,0,0,'N','',0,0,0,0,0,0,0,0)
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'ins_srac'
               LET g_errparam.popup = FALSE
               CALL cl_err()

            RETURN FALSE
         END IF
      END IF
   END IF
   RETURN TRUE
END FUNCTION
################################################################################
# Descriptions...: 檢查srac_t資料是否有其他對應的srab_t資料
# Memo...........:
# Usage..........: CALL asrt300_chk_srac()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/17 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_chk_srac()
DEFINE l_n       LIKE type_t.num5

   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM srab_t
    WHERE srabent = g_enterprise 
      AND srabsite = g_site
      AND srab001 = g_sraa_m.sraa001
      AND srab008 = g_srab_d[l_ac].srab008
      AND srab004 = g_srab_d[l_ac].srab004
      AND srab005 = g_srab_d[l_ac].srab005
      AND srab006 = g_srab_d[l_ac].srab006
   IF l_n < 1 THEN
      DELETE FROM srac_t
       WHERE sracent = g_enterprise 
         AND sracsite = g_site
         AND srac001 = g_sraa_m.sraa001
         AND srac002 = g_srab_d[l_ac].srab008
         AND srac004 = g_srab_d[l_ac].srab004
         AND srac005 = g_srab_d[l_ac].srab005
         AND srac006 = g_srab_d[l_ac].srab006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del_srac'
         LET g_errparam.popup = FALSE
         CALL cl_err()

         RETURN FALSE
      END IF
      DELETE FROM srad_t
       WHERE sradent = g_enterprise 
         AND sradsite = g_site
         AND srad001 = g_sraa_m.sraa001
         AND srad002 = g_srab_d[l_ac].srab008
         AND srad004 = g_srab_d[l_ac].srab004
         AND srad005 = g_srab_d[l_ac].srab005
         AND srad006 = g_srab_d[l_ac].srab006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del_srad'
         LET g_errparam.popup = FALSE
         CALL cl_err()

         RETURN FALSE
      END IF
      DELETE FROM srae_t
       WHERE sraeent = g_enterprise 
         AND sraesite = g_site
         AND srae001 = g_sraa_m.sraa001
         AND srae002 = g_srab_d[l_ac].srab008
         AND srae004 = g_srab_d[l_ac].srab004
         AND srae005 = g_srab_d[l_ac].srab005
         AND srae006 = g_srab_d[l_ac].srab006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del_srae'
         LET g_errparam.popup = FALSE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM srab_t
    WHERE srabent = g_enterprise 
      AND srabsite = g_site
      AND srab001 = g_sraa_m.sraa001
      AND srab008 = g_srab_d_t.srab008
      AND srab004 = g_srab_d_t.srab004
      AND srab005 = g_srab_d_t.srab005
      AND srab006 = g_srab_d_t.srab006
   IF l_n = 0 THEN
      DELETE FROM srac_t
       WHERE sracent = g_enterprise 
         AND sracsite = g_site
         AND srac001 = g_sraa_m.sraa001
         AND srac002 = g_srab_d_t.srab008
         AND srac004 = g_srab_d_t.srab004
         AND srac005 = g_srab_d_t.srab005
         AND srac006 = g_srab_d_t.srab006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del_srac'
         LET g_errparam.popup = FALSE
         CALL cl_err()

         RETURN FALSE
      END IF
      DELETE FROM srad_t
       WHERE sradent = g_enterprise 
         AND sradsite = g_site
         AND srad001 = g_sraa_m.sraa001
         AND srad002 = g_srab_d_t.srab008
         AND srad004 = g_srab_d_t.srab004
         AND srad005 = g_srab_d_t.srab005
         AND srad006 = g_srab_d_t.srab006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del_srad'
         LET g_errparam.popup = FALSE
         CALL cl_err()

         RETURN FALSE
      END IF
      DELETE FROM srae_t
       WHERE sraeent = g_enterprise 
         AND sraesite = g_site
         AND srae001 = g_sraa_m.sraa001
         AND srae002 = g_srab_d_t.srab008
         AND srae004 = g_srab_d_t.srab004
         AND srae005 = g_srab_d_t.srab005
         AND srae006 = g_srab_d_t.srab006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del_srad'
         LET g_errparam.popup = FALSE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM srab_t
    WHERE srabent = g_enterprise 
      AND srabsite = g_site
      AND srab001 = g_sraa_m.sraa001
      AND srab008 = ''
      AND srab004 = g_srab_d[l_ac].srab004
      AND srab005 = g_srab_d[l_ac].srab005
      AND srab006 = g_srab_d[l_ac].srab006
   IF l_n < 1 THEN
      DELETE FROM srac_t
       WHERE sracent = g_enterprise 
         AND sracsite = g_site
         AND srac001 = g_sraa_m.sraa001
         AND srac002 = ' '
         AND srac004 = g_srab_d[l_ac].srab004
         AND srac005 = g_srab_d[l_ac].srab005
         AND srac006 = g_srab_d[l_ac].srab006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del_srad'
         LET g_errparam.popup = FALSE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM srab_t
    WHERE srabent = g_enterprise 
      AND srabsite = g_site
      AND srab001 = g_sraa_m.sraa001
      AND srab008 = ''
      AND srab004 = g_srab_d_t.srab004
      AND srab005 = g_srab_d_t.srab005
      AND srab006 = g_srab_d_t.srab006
   IF l_n = 0 THEN
      DELETE FROM srac_t
       WHERE sracent = g_enterprise 
         AND sracsite = g_site
         AND srac001 = g_sraa_m.sraa001
         AND srac002 = ' '
         AND srac004 = g_srab_d_t.srab004
         AND srac005 = g_srab_d_t.srab005
         AND srac006 = g_srab_d_t.srab006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del_srad'
         LET g_errparam.popup = FALSE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   RETURN TRUE
END FUNCTION
################################################################################
# Descriptions...: 整批刪除srac_t
# Memo...........:
# Usage..........: CALL asrt300_del_srac()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/17 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_del_srac()
DEFINE l_sql     STRING
#DEFINE l_srab    RECORD LIKE srab_t.* #161124-00048#10 mark
#161124-00048#10 add-s
DEFINE l_srab RECORD  #重覆性生產計畫單身檔
       srabent LIKE srab_t.srabent, #企业编号
       srabsite LIKE srab_t.srabsite, #营运据点
       srab000 LIKE srab_t.srab000, #版本
       srab001 LIKE srab_t.srab001, #生产计划
       srab002 LIKE srab_t.srab002, #年
       srab003 LIKE srab_t.srab003, #月
       srab004 LIKE srab_t.srab004, #料件编号
       srab005 LIKE srab_t.srab005, #BOM特性
       srab006 LIKE srab_t.srab006, #产品特征
       srab007 LIKE srab_t.srab007, #工艺管理
       srab008 LIKE srab_t.srab008, #工艺编号
       srab009 LIKE srab_t.srab009, #日期
       srab010 LIKE srab_t.srab010, #数量
       srab011 LIKE srab_t.srab011, #单位
       srab012 LIKE srab_t.srab012  #重复性工单号码（FOR成本计算）
END RECORD
#161124-00048#10 add-e
DEFINE l_n       LIKE type_t.num5

#   LET l_sql = " SELECT * FROM srab_t ", #161124-00048#10 mark
   #161124-00048#10 add-s
   LET l_sql = " SELECT srabent,srabsite,srab000,srab001,srab002,srab003,srab004,",
               "        srab005,srab006,srab007,srab008,srab009,srab010,srab011,",
               "        srab012 FROM srab_t ",
   #161124-00048#10 add-e
               "  WHERE srabent = '",g_enterprise,"'",
               "    AND srabsite = '",g_site,"'",
               "    AND srab000 = '",g_sraa_m.sraa000,"'",
               "    AND srab001 = '",g_sraa_m.sraa001,"' ",
               "    AND srab002 = '",g_sraa_m.sraa002,"' ",
               "    AND srab003 = '",g_sraa_m.sraa003,"' "
   PREPARE asrt300_sel_srab_pr FROM l_sql
   DECLARE asrt300_sel_srab_cs CURSOR FOR asrt300_sel_srab_pr
   FOREACH asrt300_sel_srab_cs INTO l_srab.*
      LET l_n = 0
      SELECT COUNT(*) INTO l_n
        FROM srab_t
       WHERE srabent = g_enterprise 
         AND srabsite = g_site
         AND srab000 <> g_sraa_m.sraa000
         AND srab001 <> g_sraa_m.sraa001
         AND srab002 <> g_sraa_m.sraa002
         AND srab003 <> g_sraa_m.sraa003
         AND srab008 = l_srab.srab008
         AND srab004 = l_srab.srab004
         AND srab005 = l_srab.srab005
         AND srab006 = l_srab.srab006
      IF l_n = 0 THEN
         DELETE FROM srac_t
          WHERE sracent = g_enterprise 
            AND sracsite = g_site
            AND srac001 = g_sraa_m.sraa001
            AND srac002 = l_srab.srab008
            AND srac004 = l_srab.srab004
            AND srac005 = l_srab.srab005
            AND srac006 = l_srab.srab006
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'del_srac'
            LET g_errparam.popup = FALSE
            CALL cl_err()

            RETURN FALSE
         END IF
         DELETE FROM srad_t
          WHERE sradent = g_enterprise 
            AND sradsite = g_site
            AND srad001 = g_sraa_m.sraa001
            AND srad002 = l_srab.srab008
            AND srad004 = l_srab.srab004
            AND srad005 = l_srab.srab005
            AND srad006 = l_srab.srab006
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'del_srad'
            LET g_errparam.popup = FALSE
            CALL cl_err()

            RETURN FALSE
         END IF
         DELETE FROM srae_t
          WHERE sraeent = g_enterprise 
            AND sraesite = g_site
            AND srae001 = g_sraa_m.sraa001
            AND srae002 = l_srab.srab008
            AND srae004 = l_srab.srab004
            AND srae005 = l_srab.srab005
            AND srae006 = l_srab.srab006
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'del_srae'
            LET g_errparam.popup = FALSE
            CALL cl_err()

            RETURN FALSE
         END IF
      END IF
      LET l_n = 0
      SELECT COUNT(*) INTO l_n
        FROM srab_t
       WHERE srabent = g_enterprise 
         AND srabsite = g_site
         AND srab000 <> g_sraa_m.sraa000
         AND srab001 <> g_sraa_m.sraa001
         AND srab002 <> g_sraa_m.sraa002
         AND srab003 <> g_sraa_m.sraa003
         AND srab008 = ''
         AND srab004 = l_srab.srab004
         AND srab005 = l_srab.srab005
         AND srab006 = l_srab.srab006
      IF l_n = 0 THEN
         DELETE FROM srac_t
          WHERE sracent = g_enterprise 
            AND sracsite = g_site
            AND srac001 = g_sraa_m.sraa001
            AND srac002 = ' '
            AND srac004 = l_srab.srab004
            AND srac005 = l_srab.srab005
            AND srac006 = l_srab.srab006
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = 'del_srac'
            LET g_errparam.popup = FALSE
            CALL cl_err()

            RETURN FALSE
         END IF
      END IF
   END FOREACH
   RETURN TRUE
END FUNCTION
################################################################################
# Descriptions...: 生產排程計畫合計
# Memo...........:
# Usage..........: CALL asrt300_srab_sum()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_srab_sum()
DEFINE l_s1         LIKE srab_t.srab010
   
   LET l_s1 = 0
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_1) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_1
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_2) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_2
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_3) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_3
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_4) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_4
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_5) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_5
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_6) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_6
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_7) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_7
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_8) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_8
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_9) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_9
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_10) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_10
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_11) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_11
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_12) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_12
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_13) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_13
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_14) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_14
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_15) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_15
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_16) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_16
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_17) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_17
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_18) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_18
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_19) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_19
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_20) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_20
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_21) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_21
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_22) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_22
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_23) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_23
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_24) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_24
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_25) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_25
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_26) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_26
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_27) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_27
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_28) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_28
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_29) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_29
   END IF
   IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_30) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_30
   END IF
    IF NOT cl_null(g_srab_d[l_ac].l_srab010_1_31) THEN
      LET l_s1 = l_s1 + g_srab_d[l_ac].l_srab010_1_31
   END IF
   IF cl_null(g_srab_d[l_ac].l_srab010_1_1) AND cl_null(g_srab_d[l_ac].l_srab010_1_2) AND cl_null(g_srab_d[l_ac].l_srab010_1_3) AND cl_null(g_srab_d[l_ac].l_srab010_1_4) AND cl_null(g_srab_d[l_ac].l_srab010_1_5) AND 
      cl_null(g_srab_d[l_ac].l_srab010_1_6) AND cl_null(g_srab_d[l_ac].l_srab010_1_7) AND cl_null(g_srab_d[l_ac].l_srab010_1_8) AND cl_null(g_srab_d[l_ac].l_srab010_1_9) AND cl_null(g_srab_d[l_ac].l_srab010_1_10) AND
      cl_null(g_srab_d[l_ac].l_srab010_1_11) AND cl_null(g_srab_d[l_ac].l_srab010_1_12) AND cl_null(g_srab_d[l_ac].l_srab010_1_13) AND cl_null(g_srab_d[l_ac].l_srab010_1_14) AND cl_null(g_srab_d[l_ac].l_srab010_1_15) AND 
      cl_null(g_srab_d[l_ac].l_srab010_1_16) AND cl_null(g_srab_d[l_ac].l_srab010_1_17) AND cl_null(g_srab_d[l_ac].l_srab010_1_18) AND cl_null(g_srab_d[l_ac].l_srab010_1_19) AND cl_null(g_srab_d[l_ac].l_srab010_1_20) AND
      cl_null(g_srab_d[l_ac].l_srab010_1_21) AND cl_null(g_srab_d[l_ac].l_srab010_1_22) AND cl_null(g_srab_d[l_ac].l_srab010_1_23) AND cl_null(g_srab_d[l_ac].l_srab010_1_24) AND cl_null(g_srab_d[l_ac].l_srab010_1_25) AND 
      cl_null(g_srab_d[l_ac].l_srab010_1_26) AND cl_null(g_srab_d[l_ac].l_srab010_1_27) AND cl_null(g_srab_d[l_ac].l_srab010_1_28) AND cl_null(g_srab_d[l_ac].l_srab010_1_29) AND cl_null(g_srab_d[l_ac].l_srab010_1_30) AND
      cl_null(g_srab_d[l_ac].l_srab010_1_31) THEN
      LET g_srab_d[l_ac].sum = null
   ELSE
      LET g_srab_d[l_ac].sum = l_s1
   END IF   
END FUNCTION
################################################################################
# Descriptions...: INSERT 一筆srab010/UPDATE 一筆
# Memo...........:
# Usage..........: CALL asrt300_ins_srab(p_srab010,p_num)
# Input parameter: p_srab010      數量
#                : p_num          對應哪天 
# Return code....: 無
# Date & Author..: 2013/12/21 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_ins_srab(p_srab010,p_num)
DEFINE p_srab010       LIKE srab_t.srab010
DEFINE p_num           LIKE type_t.num5
DEFINE l_srab009       LIKE srab_t.srab009
DEFINE l_n             LIKE type_t.num5

   IF cl_null(g_srab_d[l_ac].srab005) THEN 
      LET g_srab_d[l_ac].srab005 = ' '
   END IF
   IF cl_null(g_srab_d[l_ac].srab006) THEN 
      LET g_srab_d[l_ac].srab006 = ' '
   END IF
   LET l_srab009 = MDY(g_sraa_m.sraa003,p_num,g_sraa_m.sraa002)
   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM srab_t
    WHERE srabent = g_enterprise
      AND srabsite = g_site
      AND srab000 = g_sraa_m.sraa000
      AND srab001 = g_sraa_m.sraa001
      AND srab002 = g_sraa_m.sraa002
      AND srab003 = g_sraa_m.sraa003
      AND srab004 = g_srab_d[l_ac].srab004
      AND srab005 = g_srab_d[l_ac].srab005
      AND srab006 = g_srab_d[l_ac].srab006
      AND srab009 = l_srab009
   IF l_n = 0 THEN
      SELECT UNIQUE srab012 INTO g_srab_d[l_ac].srab012 FROM srab_t
       WHERE srabent = g_enterprise
         AND srabsite = g_site
         AND srab000 = g_sraa_m.sraa000
         AND srab001 = g_sraa_m.sraa001
         AND srab002 = g_sraa_m.sraa002
         AND srab003 = g_sraa_m.sraa003
         AND srab004 = g_srab_d[l_ac].srab004
         AND srab005 = g_srab_d[l_ac].srab005
         AND srab006 = g_srab_d[l_ac].srab006
         
      IF cl_null(g_srab_d[l_ac].srab012) THEN
         SELECT MAX(srab012) INTO g_srab_d[l_ac].srab012 FROM srab_t
          WHERE SUBSTR(srab012,1,4) = g_sraa_m.sraa002
            AND SUBSTR(srab012,5,2) = g_sraa_m.sraa003 
            AND srabent = g_enterprise   #160905-00007#15 by 08172               
         IF NOT cl_null(g_srab_d[l_ac].srab012) THEN
            LET g_srab_d[l_ac].srab012 = g_sraa_m.sraa002 USING '&&&&',g_sraa_m.sraa003 USING "&&",
                                         (g_srab_d[l_ac].srab012[7,20] + 1) USING '&&&&&&&&&&&&&&' 
         ELSE                                                               
            LET g_srab_d[l_ac].srab012 = g_sraa_m.sraa002 USING '&&&&',g_sraa_m.sraa003 USING "&&",
                                         '00000000000001'                  
         END IF            
      END IF               
      INSERT INTO srab_t(srabent,srabsite,srab000,srab001,srab002,srab003,srab004,srab005,srab006,srab007,srab008,srab009,srab010,srab011,srab012)
                  VALUES(g_enterprise,g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003,g_srab_d[l_ac].srab004,g_srab_d[l_ac].srab005,g_srab_d[l_ac].srab006,g_srab_d[l_ac].srab007,g_srab_d[l_ac].srab008,l_srab009,p_srab010,g_srab_d[l_ac].srab011,g_srab_d[l_ac].srab012)
   ELSE
      UPDATE srab_t 
         SET srab007 = g_srab_d[l_ac].srab007,
             srab008 = g_srab_d[l_ac].srab008,
             srab010 = p_srab010,
             srab011 = g_srab_d[l_ac].srab011
       WHERE srabent = g_enterprise
         AND srabsite = g_site
         AND srab000 = g_sraa_m.sraa000
         AND srab001 = g_sraa_m.sraa001
         AND srab002 = g_sraa_m.sraa002
         AND srab003 = g_sraa_m.sraa003
         AND srab004 = g_srab_d[l_ac].srab004
         AND srab005 = g_srab_d[l_ac].srab005
         AND srab006 = g_srab_d[l_ac].srab006
         AND srab009 = l_srab009
   END IF
   IF SQLCA.SQLcode  THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "srab_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()

      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF 
   CALL asrt300_srab_sum()
   CALL asrt300_b_fill_1()
   RETURN TRUE
END FUNCTION
################################################################################
# Descriptions...: 抓取每天的数量
# Memo...........:
# Usage..........: CALL asrt300_srab010(p_srab009) RETURNING r_srab010
# Input parameter: p_srab009      日期
# Return code....: r_srab010      数量
# Date & Author..: 2013/12/23 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_srab010(p_srab009)
DEFINE p_srab009     LIKE srab_t.srab009
DEFINE r_srab010     LIKE srab_t.srab010

   LET r_srab010 = ''
   SELECT srab010 INTO r_srab010
     FROM srab_t
    WHERE srabent = g_enterprise
      AND srabsite = g_site
      AND srab000 = g_sraa_m.sraa000
      AND srab001 = g_sraa_m.sraa001
      AND srab002 = g_sraa_m.sraa002
      AND srab003 = g_sraa_m.sraa003
      AND srab004 = g_srab_d[l_ac].srab004
      AND srab005 = g_srab_d[l_ac].srab005
      AND srab006 = g_srab_d[l_ac].srab006
      AND srab009 = p_srab009
   RETURN r_srab010
END FUNCTION
################################################################################
# Descriptions...: 是否重帶制程資訊
# Memo...........:
# Usage..........: CALL asrt300_is_del()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/25 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_is_del()
DEFINE l_n       LIKE type_t.num5

   LET l_n = 0
   SELECT COUNT(*) INTO l_n
     FROM srac_t
    WHERE sracent = g_enterprise
      AND sracsite = g_site
      AND srac001 = g_sraa_m.sraa001
      AND srac002 = g_srab_d_t.srab008
      AND srac004 = g_srab_d_t.srab004
      AND srac005 = g_srab_d_t.srab005
      AND srac006 = g_srab_d_t.srab006
   IF l_n > 0 THEN
      IF NOT cl_ask_confirm('asr-00025') THEN
         RETURN  FALSE
      END IF
   END IF
   RETURN TRUE
END FUNCTION
################################################################################
# Descriptions...: 檢查1~31是否存入資料
# Memo...........:
# Usage..........: CALL asrt300_chk_date()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2013/12/27 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_chk_date()
DEFINE l_n      LIKE type_t.num5

   LET l_n =  0
   SELECT COUNT(*) INTO l_n
     FROM srab_t
    WHERE srabent = g_enterprise
      AND srabsite = g_site
      AND srab000 = g_sraa_m.sraa000
      AND srab001 = g_sraa_m.sraa001
      AND srab002 = g_sraa_m.sraa002
      AND srab003 = g_sraa_m.sraa003
      AND srab004 = g_srab_d[l_ac].srab004
      AND srab005 = g_srab_d[l_ac].srab005
      AND srab006 = g_srab_d[l_ac].srab006
   IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asr-00028'
      LET g_errparam.extend = '1~31'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF
   RETURN TRUE
END FUNCTION
################################################################################
# Descriptions...: srac单身参考栏位显示
# Memo...........:
# Usage..........: CALL asrt300_srac_desc()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2014/01/10 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_srac_desc()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_srab_d3[l_ac2].srac008
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '221' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_srab_d3[l_ac2].srac008_desc =  g_rtn_fields[1]
   DISPLAY BY NAME g_srab_d3[l_ac2].srac008_desc
END FUNCTION

################################################################################
# Descriptions...: 動態設定元件是否需輸入值
# Memo...........:
# Usage..........: CALL asrt300_cl_set_comp_entry(ps_fields,pi_entry)
# Input parameter: ps_fields   欄位名稱
#                : pi_entry    是否進入欄位
# Date & Author..: 2014/04/14 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_cl_set_comp_entry(ps_fields,pi_entry)
DEFINE ps_fields       STRING,
       pi_entry        LIKE type_t.num5
DEFINE lst_fields      base.StringTokenizer,
       ls_field_name   STRING
DEFINE lwin_curr       ui.Window
DEFINE lnode_win       om.DomNode,
       llst_items      om.NodeList,
       li_i            LIKE type_t.num5,
       lnode_item      om.DomNode,
       ls_item_name    STRING

   IF g_bgjob = 'Y' AND g_gui_type NOT MATCHES "[13]"  THEN
      RETURN
   END IF

   IF (ps_fields IS NULL) THEN
      RETURN
   END IF

   LET ps_fields = ps_fields.toLowerCase()

   LET lst_fields = base.StringTokenizer.create(ps_fields, ",")

   LET lwin_curr = ui.Window.getCurrent()
   LET lnode_win = lwin_curr.getNode()

   LET llst_items = lnode_win.selectByPath("//Form//*")

   WHILE lst_fields.hasMoreTokens()
     LET ls_field_name = lst_fields.nextToken()
     LET ls_field_name = ls_field_name.trim()

     IF (ls_field_name.getLength() > 0) THEN
        FOR li_i = 1 TO llst_items.getLength()
            LET lnode_item = llst_items.item(li_i)
            LET ls_item_name = lnode_item.getAttribute("colName")

            IF (ls_item_name IS NULL) THEN
               LET ls_item_name = lnode_item.getAttribute("name")

               IF (ls_item_name IS NULL) THEN
                  CONTINUE FOR
               END IF
            END IF

            LET ls_item_name = ls_item_name.trim()

            IF (ls_item_name.equals(ls_field_name)) THEN
               IF (pi_entry) THEN
                  CALL lnode_item.setAttribute("noEntry", "0")
                  CALL lnode_item.setAttribute("active", "1")
               ELSE
                  CALL lnode_item.setAttribute("noEntry", "1")
                  CALL lnode_item.setAttribute("active", "0")
               END IF

               EXIT FOR
            END IF
        END FOR
     END IF
   END WHILE
END FUNCTION
################################################################################
# Descriptions...: 整批新增资料
# Memo...........:
# Usage..........: CALL asrt300_ins_srab_batch(p_srab000,p_srab001,p_srab002,p_srab003)
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2014/01/14 By xumm
# Modify.........:
################################################################################
PRIVATE FUNCTION asrt300_ins_srab_batch(p_srab000,p_srab001,p_srab002,p_srab003)
DEFINE l_sql        STRING
DEFINE p_srab000    LIKE srab_t.srab000
DEFINE p_srab001    LIKE srab_t.srab001
DEFINE p_srab002    LIKE srab_t.srab002
DEFINE p_srab003    LIKE srab_t.srab003
DEFINE l_day        LIKE type_t.num5
DEFINE l_num        LIKE type_t.num5
DEFINE l_n          LIKE type_t.num5
#DEFINE l_srab    RECORD LIKE srab_t.* #161124-00048#10 mark
#161124-00048#10 add-s
DEFINE l_srab RECORD  #重覆性生產計畫單身檔
       srabent LIKE srab_t.srabent, #企业编号
       srabsite LIKE srab_t.srabsite, #营运据点
       srab000 LIKE srab_t.srab000, #版本
       srab001 LIKE srab_t.srab001, #生产计划
       srab002 LIKE srab_t.srab002, #年
       srab003 LIKE srab_t.srab003, #月
       srab004 LIKE srab_t.srab004, #料件编号
       srab005 LIKE srab_t.srab005, #BOM特性
       srab006 LIKE srab_t.srab006, #产品特征
       srab007 LIKE srab_t.srab007, #工艺管理
       srab008 LIKE srab_t.srab008, #工艺编号
       srab009 LIKE srab_t.srab009, #日期
       srab010 LIKE srab_t.srab010, #数量
       srab011 LIKE srab_t.srab011, #单位
       srab012 LIKE srab_t.srab012  #重复性工单号码（FOR成本计算）
END RECORD
#161124-00048#10 add-e
DEFINE l_srab009    LIKE srab_t.srab009

   CALL s_date_get_max_day(g_sraa_m.sraa002,g_sraa_m.sraa003) RETURNING l_day
#   LET l_sql = " SELECT * FROM srab_t ", #161124-00048#10 mark
   #161124-00048#10 add-s
   LET l_sql = " SELECT srabent,srabsite,srab000,srab001,srab002,srab003,srab004,",
               "        srab005,srab006,srab007,srab008,srab009,srab010,srab011,",
               "        srab012 FROM srab_t ",
   #161124-00048#10 add-e
               "  WHERE srabent = '",g_enterprise,"'",
               "    AND srabsite = '",g_site,"'",
               "    AND srab000 = '",p_srab000,"'",
               "    AND srab001 = '",p_srab001,"'",
               "    AND srab002 = '",p_srab002,"'",
               "    AND srab003 = '",p_srab003,"'"
   PREPARE asrt300_sel_srab_pre_1 FROM l_sql
   DECLARE asrt300_sel_srab_cs_1 CURSOR FOR asrt300_sel_srab_pre_1
   FOREACH asrt300_sel_srab_cs_1 INTO l_srab.*
      LET l_num = DAY(l_srab.srab009)
      LET l_srab009 = MDY(g_sraa_m.sraa003,l_num,g_sraa_m.sraa002)
      IF l_day >= l_num THEN
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM srab_t
          WHERE srabent = g_enterprise
            AND srabsite = g_site
            AND srab000 = g_sraa_m.sraa000
            AND srab001 = g_sraa_m.sraa001
            AND srab002 = g_sraa_m.sraa002
            AND srab003 = g_sraa_m.sraa003
            AND srab004 = l_srab.srab004
            AND srab005 = l_srab.srab005
            AND srab006 = l_srab.srab006
            AND srab009 = l_srab009
         IF l_n = 0 THEN
#            SELECT UNIQUE srab012 INTO l_srab.srab012 FROM srab_t
#             WHERE srabent = g_enterprise
#               AND srabsite = g_site
#               AND srab000 = g_sraa_m.sraa000
#               AND srab001 = g_sraa_m.sraa001
#               AND srab002 = g_sraa_m.sraa002
#               AND srab003 = g_sraa_m.sraa003
#               AND srab004 = l_srab.srab004
#               AND srab005 = l_srab.srab005
#               AND srab006 = l_srab.srab006
#               
#            IF cl_null(l_srab.srab012) THEN
#               SELECT MAX(srab012) INTO l_srab.srab012 FROM srab_t
#                WHERE SUBSTR(srab012,1,4) = g_sraa_m.sraa002
#                  AND SUBSTR(srab012,5,2) = g_sraa_m.sraa003     
#               IF NOT cl_null(l_srab.srab012) THEN
#                  LET l_srab.srab012 = g_sraa_m.sraa002 USING '&&&&',g_sraa_m.sraa003 USING "&&",
#                                               l_srab.srab012[7,20] USING '&&&&&&&&&&&&&&' + 1
#               ELSE                                                               
#                  LET l_srab.srab012 = g_sraa_m.sraa002 USING '&&&&',g_sraa_m.sraa003 USING "&&",
#                                               '00000000000001'                  
#               END IF            
#            END IF    
      
            INSERT INTO srab_t(srabent,srabsite,srab000,srab001,srab002,srab003,srab004,srab005,srab006,srab007,srab008,srab009,srab010,srab011,srab012)
                        VALUES(g_enterprise,g_site,g_sraa_m.sraa000,g_sraa_m.sraa001,g_sraa_m.sraa002,g_sraa_m.sraa003,l_srab.srab004,l_srab.srab005,l_srab.srab006,l_srab.srab007,l_srab.srab008,l_srab009,l_srab.srab010,l_srab.srab011,l_srab.srab012)
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'ins srab'
               LET g_errparam.popup = TRUE
               CALL cl_err()

               RETURN FALSE
            END IF
         ELSE
            UPDATE srab_t
               SET srab007 = l_srab.srab007,
                   srab008 = l_srab.srab008,
                   srab010 = l_srab.srab010,
                   srab011 = l_srab.srab011
             WHERE srabent = g_enterprise
               AND srabsite = g_site
               AND srab000 = g_sraa_m.sraa000
               AND srab001 = g_sraa_m.sraa001
               AND srab002 = g_sraa_m.sraa002
               AND srab003 = g_sraa_m.sraa003
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = 'upd srab'
               LET g_errparam.popup = TRUE
               CALL cl_err()

               RETURN FALSE
            END IF
         END IF
      END IF      
   END FOREACH
   #160623-00008#1---add---s
   IF NOT asrt300_ins_srac_batch(p_srab000,p_srab001,p_srab002,p_srab003) THEN 
      RETURN FALSE
   END IF
   #160623-00008#1---add---e
   RETURN TRUE
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL asrt300_ins_srac_batch(p_srab000,p_srab001,p_srab002,p_srab003)
#                  RETURNING r_success
# Input parameter: p_srab000   版本
#                : p_srab001   生产计划
#                : p_srab002   年
#                : p_srab003   月
# Return code....: r_success   TRUE/FALSE
# Date & Author..: 2016/06/29 By xianghui
# Modify.........: #160623-00008#1
################################################################################
PRIVATE FUNCTION asrt300_ins_srac_batch(p_srab000,p_srab001,p_srab002,p_srab003)
DEFINE p_srab000 LIKE srab_t.srab000
DEFINE p_srab001 LIKE srab_t.srab001
DEFINE p_srab002 LIKE srab_t.srab002
DEFINE p_srab003 LIKE srab_t.srab003
DEFINE r_success LIKE type_t.num5
DEFINE l_srab    RECORD 
         srab004 LIKE srab_t.srab004,
         srab005 LIKE srab_t.srab005,
         srab006 LIKE srab_t.srab006,
         srab007 LIKE srab_t.srab007,
         srab008 LIKE srab_t.srab008,
         srab011 LIKE srab_t.srab011
         END RECORD
DEFINE l_n            LIKE type_t.num5
DEFINE l_sql          STRING
DEFINE l_imae032      LIKE imae_t.imae032

   LET r_success = FALSE
   
   LET l_sql = " SELECT DISTINCT srab004,srab005,srab006,srab007,srab008,srab011 FROM srab_t",
               "  WHERE srabent = '",g_enterprise,"'",
               "    AND srabsite = '",g_site,"'",
               "    AND srab000 = '",p_srab000,"'",
               "    AND srab001 = '",p_srab001,"'",
               "    AND srab002 = '",p_srab002,"'",
               "    AND srab003 = '",p_srab003,"'"
   PREPARE asrt300_sel_srac_pre FROM l_sql
   DECLARE asrt300_sel_srac_cs CURSOR FOR asrt300_sel_srac_pre
   FOREACH asrt300_sel_srac_cs INTO l_srab.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF      
      IF l_srab.srab007 = 'Y' THEN
         LET l_imae032 = ''
         SELECT imae032 INTO l_imae032
           FROM imae_t
          WHERE imaeent = g_enterprise
            AND imaesite = g_site
            AND imae001 = l_srab.srab004
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM srac_t
          WHERE sracent = g_enterprise 
            AND sracsite = g_site
            AND srac001 = g_sraa_m.sraa001
            AND srac002 = l_srab.srab008
            AND srac004 = l_srab.srab004
            AND srac005 = l_srab.srab005
            AND srac006 = l_srab.srab006
         IF l_n = 0 THEN
            IF NOT cl_null(l_imae032) THEN
               LET l_sql = "INSERT INTO srac_t(sracent,sracsite,srac001,srac002,srac004,srac005,srac006,srac007,srac008,srac009,srac010,srac011,srac012,srac013,srac014,srac015,srac016,srac017,srac018,srac019,srac020,",
                           "                   srac021,srac022,srac023,srac024,srac025,srac026,srac027,srac028,srac029,srac030,srac031,srac032,srac033,srac034,srac035,srac036,srac037,srac038,srac039,srac040,srac041,srac042,srac043,srac044,srac045,srac046,srac047,srac048)",
                           "SELECT '",g_enterprise,"','",g_site,"','",g_sraa_m.sraa001,"','",l_srab.srab008,"','",l_srab.srab004,"','",l_srab.srab005,"','",l_srab.srab006,"',ecbb003,ecbb004,ecbb005,",
                           "       ecbb006,ecbb007,ecbb008,ecbb009,ecbb010,ecbb011,ecbb012,ecbb024,ecbb025,ecbb026,ecbb027,ecbb015,ecbb016,ecbb017,ecbb018,ecbb019,ecbb020,ecbb021,ecbb022,ecbb023,0,0,0,0,0,0,ecbb013,ecbb014,0,0,0,0,0,0,0,0,ecbb030,ecbb031,ecbb032 ",
                           "  FROM ecbb_t ",
                           " WHERE ecbbent = '",g_enterprise,"'",
                           "   AND ecbbsite = '",g_site,"'",
                           "   AND ecbb001 = '",l_imae032,"'",
                           "   AND ecbb002 = '",l_srab.srab008,"' "
               PREPARE asrt300_batch_srac_pre FROM l_sql
               EXECUTE asrt300_batch_srac_pre
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'ins_srac'
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
     
                  RETURN r_success
               END IF
               LET l_sql = "INSERT INTO srad_t(sradent,sradsite,srad001,srad002,srad004,srad005,srad006,srad007,srad008,srad009,srad010,srad011,srad012,srad013,srad014,sradseq)",
                           "SELECT '",g_enterprise,"','",g_site,"','",g_sraa_m.sraa001,"','",l_srab.srab008,"','",l_srab.srab004,"','",l_srab.srab005,"','",l_srab.srab006,"',",
                           "       ecbf003,ecbf004,ecbf005,ecbf006,ecbf007,ecbf008,ecbf009,ecbf010,ecbfseq",
                           "  FROM ecbf_t ",
                           " WHERE ecbfent = '",g_enterprise,"'",
                           "   AND ecbfsite = '",g_site,"'",
                           "   AND ecbf001 = '",l_imae032,"'",
                           "   AND ecbf002 = '",l_srab.srab008,"' "
               PREPARE asrt300_batch_srad_pre FROM l_sql
               EXECUTE asrt300_batch_srad_pre
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'ins_srad'
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
     
                  RETURN r_success
               END IF
               LET l_sql = "INSERT INTO srae_t(sraeent,sraesite,srae001,srae002,srae004,srae005,srae006,srae007,srae008,srae009,sraeseq)",
                           "SELECT '",g_enterprise,"','",g_site,"','",g_sraa_m.sraa001,"','",l_srab.srab008,"','",l_srab.srab004,"','",l_srab.srab005,"','",l_srab.srab006,"',",
                           "       ecbe003,ecbe004,ecbe005,ecbeseq ",
                           "  FROM ecbe_t ",
                           " WHERE ecbeent = '",g_enterprise,"'",
                           "   AND ecbesite = '",g_site,"'",
                           "   AND ecbe001 = '",l_imae032,"'",
                           "   AND ecbe002 = '",l_srab.srab008,"' "
               PREPARE asrt300_batch_srae_pre FROM l_sql
               EXECUTE asrt300_batch_srae_pre
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'ins_srae'
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
     
                  RETURN r_success
               END IF 
            END IF            
         END IF
      ELSE
         LET l_n = 0
         SELECT COUNT(*) INTO l_n
           FROM srac_t
          WHERE sracent = g_enterprise 
            AND sracsite = g_site
            AND srac001 = g_sraa_m.sraa001
            AND srac002 = ' '
            AND srac004 = l_srab.srab004
            AND srac005 = l_srab.srab005
            AND srac006 = l_srab.srab006
         IF l_n = 0 THEN
            INSERT INTO srac_t(sracent,sracsite,srac001,srac002,srac004,
                               srac005,srac006,srac007,srac008,srac009,
                               srac010,srac011,srac012,srac013,srac014,
                               srac015,srac016,srac017,srac018,srac019,
                               srac020,srac021,srac022,srac023,srac024,
                               srac025,srac026,srac027,srac028,srac029,
                               srac030,srac031,srac032,srac033,srac034,
                               srac035,srac036,srac037,srac038,srac039,
                               srac040,srac041,srac042,srac043,srac044,srac045)
                        VALUES(g_enterprise,g_site,g_sraa_m.sraa001,' ',l_srab.srab004,
                               l_srab.srab005,l_srab.srab006,1,' ',' ',
                               1,'','INIT',0,'END',
                               0,'',0,0,0,
                               0,'N','N','Y','N',
                               'N','N',l_srab.srab011,1,1,
                               0,0,0,0,0,
                               0,'N','',0,0,
                               0,0,0,0,0,0)
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = 'ins_srac'
                  LET g_errparam.popup = FALSE
                  CALL cl_err()
      
               RETURN r_success
            END IF
         END IF         
      END IF            
   END FOREACH   

   LET r_success = TRUE
   RETURN r_success
END FUNCTION

 
{</section>}
 
