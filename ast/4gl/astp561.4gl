#該程式未解開Section, 採用最新樣板產出!
{<section id="astp561.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0004(2015-09-17 13:37:08), PR版次:0004(2017-01-18 11:40:52)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000052
#+ Filename...: astp561
#+ Description: 專櫃成本審批單批量處理作業
#+ Creator....: 06778(2015-09-15 18:21:24)
#+ Modifier...: 06778 -SD/PR- 02159
 
{</section>}
 
{<section id="astp561.global" >}
#應用 p02 樣板自動產生(Version:22)
#add-point:填寫註解說明 name="global.memo"
#151125-00001#4   2015/12/10   By 06948   增加作廢時詢問「是否作廢」
#170109-00037#14  2017/01/13   by sakura  批次LOCK處理1.UI勾選LOCK檢查2.資料處理LOCK
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT util
#add-point:增加匯入項目 name="global.import"

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc" 
#add-point:增加匯入變數檔 name="global.inc"

#end add-point
 
#模組變數(Module Variables)
DEFINE g_wc                 STRING
DEFINE g_wc_t               STRING                        #儲存 user 的查詢條件
DEFINE g_wc2                STRING
DEFINE g_wc_filter          STRING
DEFINE g_wc_filter_t        STRING
DEFINE g_sql                STRING
DEFINE g_forupd_sql         STRING                        #SELECT ... FOR UPDATE SQL
DEFINE g_before_input_done  LIKE type_t.num5
DEFINE g_cnt                LIKE type_t.num10    
DEFINE l_ac                 LIKE type_t.num10              
DEFINE l_ac_d               LIKE type_t.num10             #單身idx 
DEFINE g_curr_diag          ui.Dialog                     #Current Dialog
DEFINE gwin_curr            ui.Window                     #Current Window
DEFINE gfrm_curr            ui.Form                       #Current Form
DEFINE g_current_page       LIKE type_t.num10             #目前所在頁數
DEFINE g_ref_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars           DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys              DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak          DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_insert             LIKE type_t.chr5              #是否導到其他page
DEFINE g_error_show         LIKE type_t.num5
DEFINE g_master_idx         LIKE type_t.num10
 
TYPE type_parameter RECORD
   #add-point:自定背景執行須傳遞的參數(Module Variable) name="global.parameter"
   
   #end add-point
        wc               STRING
                     END RECORD
 
TYPE type_g_detail_d RECORD
#add-point:自定義模組變數(Module Variable)  #注意要在add-point內寫入END RECORD name="global.variable"
     sel               LIKE type_t.chr1,
     b_stbastus        LIKE stba_t.stbastus,
     b_stbasite        LIKE stba_t.stbasite ,
     b_stbasite_desc   LIKE ooefl_t.ooefl003,
     b_stbaunit        LIKE stba_t.stbaunit,
     b_stbaunit_desc   LIKE ooefl_t.ooefl003,
     b_stbadocdt       LIKE stba_t.stbadocdt,
     b_stbadocno       LIKE stba_t.stbadocno,
     b_stba013         LIKE stba_t.stba013  ,
     b_stba013_desc    LIKE mhael_t.mhael023,
     b_stba010         LIKE stba_t.stba010  ,
     b_stba002         LIKE stba_t.stba002  ,
     b_stba002_desc    LIKE pmaal_t.pmaal004,
     b_stba003         LIKE stba_t.stba003  ,
     b_stba005         LIKE stba_t.stba005  ,
     b_stba005_desc    LIKE staal_t.staal003,
     b_stba004         LIKE stba_t.stba004  ,
     b_stba004_desc    LIKE oocql_t.oocql004,
     b_stba001         LIKE stba_t.stba001  ,
     b_stba001_desc    LIKE ooefl_t.ooefl003,
     b_stba021         LIKE stba_t.stba021  ,
     stbb025_sum       LIKE stbb_t.stbb025  , #add by dengdd 151125
     stbb026_sum       LIKE stbb_t.stbb026  , #add by dengdd 151125
     b_stba023         LIKE stba_t.stba023  , #add by dengdd 151201
     b_stba017         LIKE stba_t.stba017  ,
     b_stba018         LIKE stba_t.stba018  ,
     b_stba008         LIKE stba_t.stba008  ,
     b_stba008_desc    LIKE ooag_t.ooag011  ,
     b_stba009         LIKE stba_t.stba009  ,
     b_stba009_desc    LIKE ooefl_t.ooefl003   
                       END RECORD

TYPE type_g_detail3_d RECORD
     l_stbbdocno        LIKE stbb_t.stbbdocno  ,
     l_stbbseq          LIKE stbb_t.stbbseq  ,  
     l_stbb020          LIKE stbb_t.stbb020  , 
     l_stbb021          LIKE stbb_t.stbb021  ,
     l_stbb005          LIKE stbb_t.stbb005  ,      
     l_stbb006          LIKE stbb_t.stbb006  ,      
     l_stbb022          LIKE stbb_t.stbb022  ,      
     l_stbb022_desc     LIKE imaal_t.imaal003  , 
     l_stbb023          LIKE stbb_t.stbb023  ,      
     l_stbb023_desc     LIKE inayl_t.inayl003  , 
     l_stbb024          LIKE stbb_t.stbb024  ,      
     l_stbb024_desc     LIKE mhael_t.mhael023  , 
     l_stbb011          LIKE stbb_t.stbb011  ,     
     l_stbb011_desc     LIKE rtaxl_t.rtaxl003,     
     l_stbb012          LIKE stbb_t.stbb012  ,     
     l_stbb012_desc     LIKE ooefl_t.ooefl003, 
     l_stbb001          LIKE stbb_t.stbb001  ,     
     l_stbb001_desc     LIKE stael_t.stael003,     
     l_stbb025          LIKE stbb_t.stbb025  ,     
     l_stbb026          LIKE stbb_t.stbb026  ,     
     l_stbb027          LIKE stbb_t.stbb027  ,     
     l_stbb028          LIKE stbb_t.stbb028  ,     
     l_stbb009          LIKE stbb_t.stbb009  ,     
     l_stbb017          LIKE stbb_t.stbb017 
                        END RECORD

TYPE type_g_detail2_d RECORD
     b_stbbdocno        LIKE stbb_t.stbbdocno  ,
     b_stbbseq          LIKE stbb_t.stbbseq  ,  
     b_stbb020          LIKE stbb_t.stbb020  , 
     b_stbb021          LIKE stbb_t.stbb021  ,
     b_stbb005          LIKE stbb_t.stbb005  ,      
     b_stbb006          LIKE stbb_t.stbb006  ,      
     b_stbb022          LIKE stbb_t.stbb022  ,      
     b_stbb022_desc     LIKE imaal_t.imaal003  , 
     b_stbb023          LIKE stbb_t.stbb023  ,      
     b_stbb023_desc     LIKE inayl_t.inayl003  , 
     b_stbb024          LIKE stbb_t.stbb024  ,      
     b_stbb024_desc     LIKE mhael_t.mhael023  , 
     b_stbb011          LIKE stbb_t.stbb011  ,     
     b_stbb011_desc     LIKE rtaxl_t.rtaxl003,     
     b_stbb012          LIKE stbb_t.stbb012  ,     
     b_stbb012_desc     LIKE ooefl_t.ooefl003, 
     b_stbb001          LIKE stbb_t.stbb001  ,     
     b_stbb001_desc     LIKE stael_t.stael003,     
     b_stbb025          LIKE stbb_t.stbb025  ,     
     b_stbb026          LIKE stbb_t.stbb026  ,     
     b_stbb027          LIKE stbb_t.stbb027  ,     
     b_stbb028          LIKE stbb_t.stbb028  ,     
     b_stbb009          LIKE stbb_t.stbb009  ,     
     b_stbb017          LIKE stbb_t.stbb017 
                        END RECORD

#DEFINE g_detail2_cnt         LIKE type_t.num5   #170109-00037#14 by sakura mark
DEFINE g_detail2_cnt         LIKE type_t.num10   #170109-00037#14 by sakura add
DEFINE g_detail2_d           DYNAMIC ARRAY OF type_g_detail2_d
#DEFINE g_detail3_cnt         LIKE type_t.num5   #170109-00037#14 by sakura mark
DEFINE g_detail3_cnt         LIKE type_t.num10   #170109-00037#14 by sakura add
DEFINE g_detail3_d           DYNAMIC ARRAY OF type_g_detail3_d
#170109-00037#14 by sakura mark(S)
#DEFINE g_detail_idx          LIKE type_t.num5
#DEFINE g_detail_idx2         LIKE type_t.num5
#170109-00037#14 by sakura mark(E)
#170109-00037#14 by sakura add(S)
DEFINE g_detail_idx          LIKE type_t.num10
DEFINE g_detail_idx2         LIKE type_t.num10
#170109-00037#14 by sakura add(E)

DEFINE l_str                 LIKE type_t.chr500
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
DEFINE g_detail_cnt         LIKE type_t.num10              #單身 總筆數(所有資料)
DEFINE g_detail_d  DYNAMIC ARRAY OF type_g_detail_d
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="astp561.main" >}
#+ 作業開始 
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   DEFINE ls_js  STRING
   #add-point:main段define name="main.define"
   DEFINE l_success  LIKE type_t.num5
   #end add-point   
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   #add-point:初始化前定義 name="main.before_ap_init"
   
   #end add-point
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("ast","")
 
   #add-point:定義背景狀態與整理進入需用參數ls_js name="main.background"
   
   #end add-point
 
   IF g_bgjob = "Y" THEN
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp561 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astp561_init()   
 
      #進入選單 Menu (="N")
      CALL astp561_ui_dialog() 
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp561
   END IF 
   
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success #add by dengdd 1512020
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp561.init" >}
#+ 畫面資料初始化
PRIVATE FUNCTION astp561_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point   
   #add-point:init段define name="init.define"
   DEFINE l_success LIKE type_t.num5
   #end add-point   
   
   LET g_error_show  = 1
   LET g_wc_filter   = " 1=1"
   LET g_wc_filter_t = " 1=1"
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('stbastus','13','N,Y,A,D,R,W,X')
   CALL cl_set_combo_scc_part('b_stbastus','13','N,Y,A,D,R,W,X')
   CALL cl_set_combo_scc_part('stba003','6013','4')
   CALL cl_set_combo_scc_part('b_stba003','6013','4')
   CALL cl_set_combo_scc('l_stbb020','6800')
   CALL cl_set_combo_scc('b_stbb020','6800')
   CALL cl_set_combo_scc('stbb020','6800')  #ADDED BY LANJJ 2015-10-14 
   CALL cl_get_para(g_enterprise,g_site,'E-CIR-0001') RETURNING l_str
   
   CALL s_aooi500_create_temp() RETURNING l_success  #add by dengdd 151202
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp561.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp561_ui_dialog()
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point 
   DEFINE li_idx   LIKE type_t.num10
   #add-point:ui_dialog段define name="init.init"
   DEFINE l_stus   LIKE type_t.chr30
   #end add-point 
   
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   
   LET g_action_choice = " "  
   CALL cl_set_act_visible("accept,cancel", FALSE)
         
   LET g_detail_cnt = g_detail_d.getLength()
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   #170109-00037#14 by sakura add(S)
   #LOCK檢查
   LET g_sql = "SELECT stbadocno FROM stba_t ",
               " WHERE stbaent = ",g_enterprise,
               "   AND stbadocno = ? ",
               "   FOR UPDATE SKIP LOCKED "
   PREPARE astp561_chk_lock_stba FROM g_sql
   #170109-00037#14 by sakura add(E)
   #end add-point
   
   WHILE TRUE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_detail_d.clear()
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astp561_init()
      END IF
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #add-point:ui_dialog段construct name="ui_dialog.more_construct"
          CONSTRUCT BY NAME g_wc ON stbasite,stbaunit,stbadocdt,stbadocno,stba013,stba010, stba002,
                                    stba003, stba005, stba004  ,mhae036, stba001,  stba008,stba009, stba011,
                                    stba012, stba018, stba019,  stba020,  stbastus
                                    ,stbb001,stbb011,stbb020,stbb021,stbb023,stbb024 #ADDED BY LANJJ 2015-10-14
                                                                    
            BEFORE CONSTRUCT
               CALL cl_set_act_visible("filter",FALSE)
               
            ON ACTION controlp
               CASE
                  WHEN INFIELD(stbasite)   #營運組織
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbasite',g_site,'c')
                       CALL q_ooef001_24()
                       DISPLAY g_qryparam.return1 TO stbasite 
                       NEXT FIELD CURRENT
                       
                  WHEN INFIELD(stbaunit)            
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE                  #呼叫開窗
                       LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbaunit',g_site,'c') 
                       CALL q_ooef001_24() 
                       DISPLAY g_qryparam.return1 TO stbaunit  #顯示到畫面上
                       NEXT FIELD CURRENT 
                       
                  WHEN INFIELD(stbadocno)  #單號
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       LET g_qryparam.where = " stba014 = '2' "
                       CALL q_stbadocno()
                       DISPLAY g_qryparam.return1 TO stbadocno 
                       NEXT FIELD CURRENT
                       
                  WHEN INFIELD(stba013)    #專櫃編號
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       LET g_qryparam.arg1 = g_site
                       CALL q_mhae001()
                       DISPLAY g_qryparam.return1 TO stba013 
                       NEXT FIELD CURRENT
                  
                  WHEN INFIELD(stba010)    #合同編號
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       CALL q_stfa001()
                       DISPLAY g_qryparam.return1 TO stba010 
                       NEXT FIELD CURRENT                  
                     
                  WHEN INFIELD(stba002)    #供應商編號
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       CALL q_pmaa001_10()
                       DISPLAY g_qryparam.return1 TO stba002 
                       NEXT FIELD CURRENT
                  
                  WHEN INFIELD(stba005)    #結算類型
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       LET g_qryparam.arg1 = '2060'
                       CALL q_oocq002()
                       DISPLAY g_qryparam.return1 TO stba005 
                       NEXT FIELD CURRENT    
                  
                  WHEN INFIELD(stba004)    #結算方式
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       CALL q_staa001()
                       DISPLAY g_qryparam.return1 TO stba004 
                       NEXT FIELD CURRENT
                  
                  WHEN INFIELD(mhae036)
                       INITIALIZE g_qryparam.* TO NULL 
                       LET g_qryparam.state = 'c' 
                       LET g_qryparam.where = " rtax004 = '",l_str,"'"
                       LET g_qryparam.reqry = FALSE 
                       CALL q_rtax001_1() 
                       DISPLAY g_qryparam.return1 TO mhae036 
                       NEXT FIELD CURRENT 
                  
                  
                  WHEN INFIELD(stba001)    #結算中心
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       IF s_aooi500_setpoint(g_prog,'stba001') THEN
                          LET g_qryparam.where = s_aooi500_q_where(g_prog,'stba001',g_site,'c')
                          CALL q_ooef001_24()                   
                       ELSE
                          CALL q_ooef001_23()
                       END IF
                       DISPLAY g_qryparam.return1 TO stba001 
                       NEXT FIELD CURRENT
                 
                  WHEN INFIELD(stba008)    #員工   
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       CALL q_ooag001()
                       DISPLAY g_qryparam.return1 TO stba008 
                       NEXT FIELD CURRENT
                  
                  WHEN INFIELD(stba009)    #部門
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       CALL q_ooeg001_4()
                       DISPLAY g_qryparam.return1 TO stba009 
                       NEXT FIELD CURRENT
                       
                  WHEN INFIELD(stba011)    #幣別
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       CALL q_ooai001()
                       DISPLAY g_qryparam.return1 TO stba011 
                       NEXT FIELD CURRENT
                 
                  WHEN INFIELD(stba012)    #稅別
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       CALL q_oodb002()
                       DISPLAY g_qryparam.return1 TO stba012 
                       NEXT FIELD CURRENT                 

              #ADDED BY LANJJ 2015-10-14 ---start---
                  WHEN INFIELD(stbb001)    #费用编号
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       CALL q_stae001()
                       DISPLAY g_qryparam.return1 TO stbb001 
                       NEXT FIELD CURRENT 
             
                  WHEN INFIELD(stbb011)    #所属品类
                       INITIALIZE g_qryparam.* TO NULL 
                       LET g_qryparam.state = 'c' 
                       LET g_qryparam.where = " rtax004 = '",l_str,"'"
                       LET g_qryparam.reqry = FALSE 
                       CALL q_rtax001_1() 
                       DISPLAY g_qryparam.return1 TO stbb011 
                       NEXT FIELD CURRENT 
                       
                  WHEN INFIELD(stbb023)    #库区
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       CALL q_inaa001()
                       DISPLAY g_qryparam.return1 TO stbb023 
                       NEXT FIELD CURRENT 
                       
                  WHEN INFIELD(stbb024)    #专柜
                       INITIALIZE g_qryparam.* TO NULL
                       LET g_qryparam.state = 'c'
                       LET g_qryparam.reqry = FALSE
                       LET g_qryparam.arg1 = g_site
                       CALL q_mhae001()
                       DISPLAY g_qryparam.return1 TO stbb024 
                       NEXT FIELD CURRENT
              #ADDED BY LANJJ 2015-10-14 ---end---
               END CASE
         END CONSTRUCT 
         #end add-point
         #add-point:ui_dialog段input name="ui_dialog.more_input"
         INPUT ARRAY g_detail_d FROM s_detail1.*
             ATTRIBUTE(COUNT = g_detail_cnt,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS,
                       INSERT ROW = FALSE,
                       DELETE ROW = FALSE, 
                       APPEND ROW = FALSE)
            BEFORE INPUT
               LET g_current_page = 1
               CALL cl_set_act_visible("filter",FALSE)
               
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               DISPLAY g_detail_idx TO FORMONLY.h_index
               DISPLAY g_detail_d.getLength() TO FORMONLY.h_count
               LET g_master_idx = l_ac
               CALL astp561_fetch()
               IF g_detail_d[l_ac].sel = 'N' THEN
                  NEXT FIELD sel
               END IF
            
            #170109-00037#14 by sakura add(S)               
            ON CHANGE sel
               #UI勾選LOCK檢查
               IF g_detail_d[l_ac].sel = "Y" THEN
                  CALL cl_err_collect_init() 
                  CALL s_transaction_begin()
                  LET l_ac = g_detail_idx                  
                  CALL astp561_lock_chk()
                  CALL s_transaction_end('Y',0)
                  CALL cl_err_collect_show()
               END IF
            #170109-00037#14 by sakura add(E)
         END INPUT     
         #end add-point
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         DISPLAY ARRAY g_detail2_d TO s_detail2.*
            ATTRIBUTES(COUNT=g_detail_cnt)
         
            BEFORE DISPLAY
               LET g_current_page = 2
               CALL cl_set_act_visible("filter",FALSE)
               
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail2")
               LET l_ac = g_detail_idx2
               DISPLAY g_detail_idx2 TO FORMONLY.idx
               DISPLAY g_detail2_d.getLength() TO FORMONLY.cnt
         END DISPLAY
         
         DISPLAY ARRAY g_detail3_d TO s_detail3.*
            ATTRIBUTES(COUNT=g_detail_cnt)
         
            BEFORE DISPLAY
               LET g_current_page = 3
               CALL cl_set_act_visible("filter",FALSE)
               
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail3")
               LET l_ac = g_detail_idx2
               DISPLAY g_detail_idx2 TO FORMONLY.idx
               DISPLAY g_detail3_d.getLength() TO FORMONLY.cnt
         END DISPLAY  
         #end add-point
 
         BEFORE DIALOG
            IF g_detail_d.getLength() > 0 THEN
               CALL gfrm_curr.setFieldHidden("formonly.sel", TRUE)
               CALL gfrm_curr.setFieldHidden("formonly.statepic", TRUE)
            ELSE
               CALL gfrm_curr.setFieldHidden("formonly.sel", FALSE)
               CALL gfrm_curr.setFieldHidden("formonly.statepic", FALSE)
            END IF
            #add-point:ui_dialog段before_dialog2 name="ui_dialog.before_dialog2"
            
            #end add-point
 
         #選擇全部
         ON ACTION selall
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 1)
            #add-point:ui_dialog段on action selall name="ui_dialog.selall.befroe"
            CALL cl_err_collect_init()   #170109-00037#14 by sakura add
            #end add-point            
            FOR li_idx = 1 TO g_detail_d.getLength()
               LET g_detail_d[li_idx].sel = "Y"
               #add-point:ui_dialog段on action selall name="ui_dialog.for.onaction_selall"
               
               #170109-00037#14 by sakura add(S)             
               CALL s_transaction_begin()
               LET l_ac = li_idx
               CALL astp561_lock_chk()
               CALL s_transaction_end('Y',0)
               #170109-00037#14 by sakura add(E)
               
               #end add-point
            END FOR
            #add-point:ui_dialog段on action selall name="ui_dialog.onaction_selall"
            CALL cl_err_collect_show()   #170109-00037#14 by sakura add
            #end add-point
 
         #取消全部
         ON ACTION selnone
            CALL DIALOG.setSelectionRange("s_detail1", 1, -1, 0)
            FOR li_idx = 1 TO g_detail_d.getLength()
               LET g_detail_d[li_idx].sel = "N"
               #add-point:ui_dialog段on action selnone name="ui_dialog.for.onaction_selnone"
               
               #end add-point
            END FOR
            #add-point:ui_dialog段on action selnone name="ui_dialog.onaction_selnone"
            
            #end add-point
 
         #勾選所選資料
         ON ACTION sel
            FOR li_idx = 1 TO g_detail_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_detail_d[li_idx].sel = "Y"
               END IF
            END FOR
            #add-point:ui_dialog段on action sel name="ui_dialog.onaction_sel"
            #170109-00037#14 by sakura add(S)
            CALL cl_err_collect_init()
            FOR li_idx = 1 TO g_detail_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  CALL s_transaction_begin()
                  LET l_ac = g_detail_idx
                  CALL astp561_lock_chk()
                  CALL s_transaction_end('Y',0)
               END IF
            END FOR
            CALL cl_err_collect_show()
            #170109-00037#14 by sakura add(E)
            #end add-point
 
         #取消所選資料
         ON ACTION unsel
            FOR li_idx = 1 TO g_detail_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  LET g_detail_d[li_idx].sel = "N"
               END IF
            END FOR
            #add-point:ui_dialog段on action unsel name="ui_dialog.onaction_unsel"
            
            #end add-point
      
         ON ACTION filter
            LET g_action_choice="filter"
            CALL astp561_filter()
            #add-point:ON ACTION filter name="menu.filter"
            
            #END add-point
            EXIT DIALOG
      
         ON ACTION close
            LET INT_FLAG=FALSE         
            LET g_action_choice = "exit"
            EXIT DIALOG
      
         ON ACTION exit
            LET g_action_choice="exit"
            EXIT DIALOG
 
         ON ACTION accept
            #add-point:ui_dialog段accept之前 name="menu.filter"
            
            #end add-point
            CALL astp561_query()
             
         # 條件清除
         ON ACTION qbeclear
            #add-point:ui_dialog段 name="ui_dialog.qbeclear"
            
            #end add-point
 
         # 重新整理
         ON ACTION datarefresh
            LET g_error_show = 1
            #add-point:ui_dialog段datarefresh name="ui_dialog.datarefresh"
            
            #end add-point
            CALL astp561_b_fill()
 
         #add-point:ui_dialog段action name="ui_dialog.more_action"
         ON ACTION batch_execute
            LET l_stus = ''
            #160225-00040#18 2016/04/13 s983961--add 
            IF g_bgjob <> "Y" THEN
               CALL cl_progress_bar_no_window(2)    
            END IF
            #160225-00040#18 2016/04/13 s983961--add 
            
            #151027-00016#2 20151112 mark by beckxie---S
            #MENU "" ATTRIBUTE(STYLE="popup")
            #   ON ACTION unconfirmed
            #         LET l_stus = "unconf"
            #   ON ACTION confirmed
            #         LET l_stus = "conf"
            #   ON ACTION invalid
            #         LET l_stus = "invalid"
            #END MENU
            #
            #CALL astp561_process(l_stus)
            #151027-00016#2 20151112 mark by beckxie---E
            CALL cl_err_collect_init()   #170109-00037#14 by sakura add            
            #151027-00016#2 20151112  add by beckxie---S
            MENU "" ATTRIBUTE(STYLE="popup")
               ON ACTION unconfirmed
                  IF cl_auth_chk_act("unconfirmed") THEN    
                     LET l_stus = "unconf"
                     #151125-00001#4 --- add start ---
                     IF cl_ask_confirm('aim-00110') THEN                     
                        CALL astp561_process(l_stus)           
                     END IF
                     #151125-00001#4 --- add end   ---                        
                  END IF                                    
               ON ACTION confirmed
                  IF cl_auth_chk_act("confirmed") THEN      
                     LET l_stus = "conf"
                     #151125-00001#4 --- add start ---
                     IF cl_ask_confirm('aim-00108') THEN                     
                        CALL astp561_process(l_stus)           
                     END IF
                     #151125-00001#4 --- add end   ---             
                  END IF                                    
               ON ACTION invalid
                  IF cl_auth_chk_act("invalid") THEN        
                     LET l_stus = "invalid"
                     #151125-00001#4 --- add start ---
                     IF cl_ask_confirm('aim-00109') THEN                     
                        CALL astp561_process(l_stus)           
                     END IF
                     #151125-00001#4 --- add end   ---            
                  END IF                                    
            END MENU
            #151027-00016#2 20151112  add by beckxie---E
            CALL cl_err_collect_show()   #170109-00037#14 by sakura add
            
         ON ACTION export_to_excel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN               
               CALL g_export_node.clear()
              
               LET g_export_node[1] = base.typeInfo.create(g_detail_d)
               LET g_export_id[1]   = "s_detail1"
               LET g_export_node[2] = base.typeInfo.create(g_detail2_d)
               LET g_export_id[2]   = "s_detail2"
               LET g_export_node[3] = base.typeInfo.create(g_detail3_d)
               LET g_export_id[3]   = "s_detail3"
              
               CALL cl_export_to_excel_getpage()
               CALL cl_export_to_excel()
               
          END IF 
          
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify_detail") THEN
               CALL cl_user_contact("astt560","stba_t","stbaent","stbadocno",g_detail_d[g_detail_idx].b_stbadocno) 
            END IF
            CALL astp561_b_fill()            
         #end add-point
 
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
      END DIALOG
 
      #(ver:22) ---start---
      #add-point:ui_dialog段 after dialog name="ui_dialog.exit_dialog"
      
      #end add-point
      #(ver:22) --- end ---
 
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         #(ver:22) ---start---
         #add-point:ui_dialog段離開dialog前 name="ui_dialog.b_exit"
         
         #end add-point
         #(ver:22) --- end ---
         EXIT WHILE
      END IF
      
   END WHILE
 
   CALL cl_set_act_visible("accept,cancel", TRUE)
 
END FUNCTION
 
{</section>}
 
{<section id="astp561.query" >}
#+ QBE資料查詢
PRIVATE FUNCTION astp561_query()
   #add-point:query段define(客製用) name="query.define_customerization"
   
   #end add-point 
   DEFINE ls_wc      STRING
   DEFINE ls_return  STRING
   DEFINE ls_result  STRING 
   #add-point:query段define name="query.define"
   
   #end add-point 
    
   #add-point:cs段after_construct name="query.after_construct"
   
   #end add-point
        
   LET g_error_show = 1
   CALL astp561_b_fill()
   LET l_ac = g_master_idx
   IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "" 
      LET g_errparam.code   = -100 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
 
   END IF
   
   #add-point:cs段after_query name="query.cs_after_query"
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp561.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astp561_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   #add-point:b_fill段define name="b_fill.define"
   DEFINE l_where         STRING
   #end add-point
 
   LET g_wc = g_wc, cl_sql_auth_filter()   #(ver:21) add cl_sql_auth_filter()
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   CALL s_aooi500_sql_where(g_prog,'stbasite') RETURNING l_where
   
   IF cl_null(g_wc) THEN 
      LET g_wc = " 1=1"
   END IF
   
   LET g_wc = g_wc,
              " AND stba014 = '6' ",   # 6.专柜成本审批处理作业
              " AND ",l_where 
   
   #LET g_sql = "SELECT 'N'        ,stbastus     ,stbasite    ,t1.ooefl003 ,stbaunit,t2.ooefl003,    MARKED BY LANJJ 2015-11-01
   LET g_sql = "SELECT distinct 'N'        ,stbastus     ,stbasite    ,t1.ooefl003 ,stbaunit,t2.ooefl003, ", #ADDED BY LANJJ 2015-11-01
               "       stbadocdt  ,stbadocno  , ",
               "       stba013    ,t3.mhael023  ,stba010     ,stba002     ,t4.pmaal004 ,stba003, ",
               "       stba005    ,t5.staal003  ,stba004     ,t6.oocql004 , ",
               "       stba001    ,t7.ooefl003  ,",
               
               "       stba021    ,stba017      ,stba018     ,stba008    , ",
               "       t8.ooag011 ,stba009      ,t9.ooefl003 ,stba023 ",
               #"  FROM stba_t ", #MARKED BY LANJJ 2015-10-14
               "  FROM stbb_t,stba_t ", #ADDED BY LANJJ 2015-10-14
               
               "       LEFT JOIN ooefl_t t1 ON t1.ooeflent = stbaent AND t1.ooefl001 = stbasite AND t1.ooefl002 = '",g_dlang,"' ",
               "       LEFT JOIN ooefl_t t2 ON t2.ooeflent = stbaent AND t2.ooefl001 = stbaunit AND t2.ooefl002 = '",g_dlang,"' ",
               "       LEFT JOIN mhael_t t3 ON t3.mhaelent = stbaent AND t3.mhael001 = stba013  AND t3.mhael022 = '",g_dlang,"' ",
               "       LEFT JOIN pmaal_t t4 ON t4.pmaalent = stbaent AND t4.pmaal001 = stba002  AND t4.pmaal002 = '",g_dlang,"' ",
               "       LEFT JOIN staal_t t5 ON t5.staalent = stbaent AND t5.staal001 = stba005  AND t5.staal002 = '",g_dlang,"' ",
               "       LEFT JOIN oocql_t t6 ON t6.oocqlent = stbaent AND t6.oocql001 = '2060'   AND t6.oocql002 = stba004 AND t6.oocql003 = '",g_dlang,"' ",
               "       LEFT JOIN ooefl_t t7 ON t7.ooeflent = stbaent AND t7.ooefl001 = stba001  AND t7.ooefl002 = '",g_dlang,"' ",
               "       LEFT JOIN ooag_t  t8 ON t8.ooagent  = stbaent AND t8.ooag001  = stba008 ",
               "       LEFT JOIN ooefl_t t9 ON t9.ooeflent = stbaent AND t9.ooefl001 = stba009  AND t9.ooefl002 = '",g_dlang,"' ",
               
               "       LEFT JOIN mhae_t     ON  mhaeent = stbaent AND mhae001 = stba013 ",

               " WHERE stbaent = ? ",
               "   AND stbaent = stbbent AND stbadocno = stbbdocno ", #ADDED BY LANJJ 2015-10-14
               "   AND ",g_wc CLIPPED,
               " ORDER BY stbadocno " 
   
   #end add-point
 
   PREPARE astp561_sel FROM g_sql
   DECLARE b_fill_curs CURSOR FOR astp561_sel
   
   CALL g_detail_d.clear()
   #add-point:b_fill段其他頁簽清空 name="b_fill.clear"
   
   #end add-point
 
   LET g_cnt = l_ac
   LET l_ac = 1   
   ERROR "Searching!" 
 
   FOREACH b_fill_curs USING g_enterprise INTO 
   #add-point:b_fill段foreach_into name="b_fill.foreach_into"
     g_detail_d[l_ac].sel             ,g_detail_d[l_ac].b_stbastus     ,g_detail_d[l_ac].b_stbasite,
     g_detail_d[l_ac].b_stbasite_desc ,g_detail_d[l_ac].b_stbaunit     ,g_detail_d[l_ac].b_stbaunit_desc,
     g_detail_d[l_ac].b_stbadocdt     ,g_detail_d[l_ac].b_stbadocno    ,g_detail_d[l_ac].b_stba013,
     g_detail_d[l_ac].b_stba013_desc  ,g_detail_d[l_ac].b_stba010      ,g_detail_d[l_ac].b_stba002 ,
     g_detail_d[l_ac].b_stba002_desc  ,g_detail_d[l_ac].b_stba003      ,g_detail_d[l_ac].b_stba005 ,
     g_detail_d[l_ac].b_stba005_desc  ,g_detail_d[l_ac].b_stba004      ,g_detail_d[l_ac].b_stba004_desc,
     g_detail_d[l_ac].b_stba001       ,g_detail_d[l_ac].b_stba001_desc ,g_detail_d[l_ac].b_stba021,
     g_detail_d[l_ac].b_stba017       ,g_detail_d[l_ac].b_stba018      ,g_detail_d[l_ac].b_stba008 ,
     g_detail_d[l_ac].b_stba008_desc  ,g_detail_d[l_ac].b_stba009      ,g_detail_d[l_ac].b_stba009_desc,
     g_detail_d[l_ac].b_stba023       
   #end add-point
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF
      
      #add-point:b_fill段資料填充 name="b_fill.foreach_iside"
      #add by dengdd 151125(S)
      SELECT SUM(stbb025),SUM(stbb026) INTO g_detail_d[l_ac].stbb025_sum,g_detail_d[l_ac].stbb026_sum
        FROM stbb_t
       WHERE stbbent=g_enterprise
         AND stbbdocno=g_detail_d[l_ac].b_stbadocno
      #add by dengdd 151125(E)
      #end add-point
      
      CALL astp561_detail_show()      
 
      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend =  "" 
            LET g_errparam.code   =  9035 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
 
         END IF
         EXIT FOREACH
      END IF
      
   END FOREACH
   LET g_error_show = 0
   
   #add-point:b_fill段資料填充(其他單身) name="b_fill.other_table"
   CALL g_detail_d.deleteElement(l_ac)
   #end add-point
    
   LET g_detail_cnt = l_ac - 1 
   DISPLAY g_detail_cnt TO FORMONLY.h_count
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CLOSE b_fill_curs
   FREE astp561_sel
   
   LET l_ac = 1
   CALL astp561_fetch()
   #add-point:b_fill段資料填充(其他單身) name="b_fill.after_b_fill"
   #資料清單
   LET g_sql = "SELECT stbbdocno ,stbbseq  , stbb020  , stbb021 , ",
               "       stbb005  , stbb006  , stbb022 , t1.imaal003  , stbb023 ,t2.inayl003, ",
               "       stbb024  , t3.mhael023 , stbb011  , t4.rtaxl003  , stbb012  ,t5.ooefl003, ",
               "       stbb001  , t6.stael003 ,",            
               "       stbb025  , stbb026 , stbb027  , stbb028  ,stbb009   , stbb017  ",
               "  FROM stba_t,stbb_t ",
               
               "  LEFT JOIN imaal_t t1 ON t1.imaalent = stbbent AND t1.imaal001 = stbb022 AND t1.imaal002 = '",g_dlang,"' ",
               "  LEFT JOIN inayl_t t2 ON t2.inaylent = stbbent AND t2.inayl001 = stbb023 AND t2.inayl002 = '",g_dlang,"' ",
               "  LEFT JOIN mhael_t t3 ON t3.mhaelent = stbbent AND t3.mhael001 = stbb024 AND t3.mhael022 = '",g_dlang,"' ",
               "  LEFT JOIN rtaxl_t t4 ON t4.rtaxlent = stbbent AND t4.rtaxl001 = stbb011 AND t4.rtaxl002 = '",g_dlang,"' ",
               "  LEFT JOIN ooefl_t t5 ON t5.ooeflent = stbbent AND t5.ooefl001 = stbb012 AND t5.ooefl002 = '",g_dlang,"' ",
               "  LEFT JOIN stael_t t6 ON t6.staelent = stbbent AND t6.stael001 = stbb001 AND t6.stael002 = '",g_dlang,"' ",
               
               "  LEFT JOIN mhae_t     ON  mhaeent = stbbent AND mhae001 = stbb024 ",

               
               
               " WHERE stbaent = ? ", 
               "   AND stbaent = stbbent AND stbadocno = stbbdocno ",
               "   AND ",g_wc CLIPPED,
               " ORDER BY stbbdocno,stbbseq "  
               
   PREPARE astp561_sel2 FROM g_sql
   DECLARE b_fill_curs2 CURSOR FOR astp561_sel2

   DISPLAY "b_fill_curs2[SQL] ",g_sql

   CALL g_detail3_d.clear()
   
   FOREACH b_fill_curs2 USING g_enterprise INTO 
      g_detail3_d[l_ac].l_stbbdocno    ,g_detail3_d[l_ac].l_stbbseq       ,g_detail3_d[l_ac].l_stbb020 , 
      g_detail3_d[l_ac].l_stbb021      ,g_detail3_d[l_ac].l_stbb005       ,g_detail3_d[l_ac].l_stbb006 ,      
      g_detail3_d[l_ac].l_stbb022      ,g_detail3_d[l_ac].l_stbb022_desc  ,g_detail3_d[l_ac].l_stbb023 ,      
      g_detail3_d[l_ac].l_stbb023_desc ,g_detail3_d[l_ac].l_stbb024       ,g_detail3_d[l_ac].l_stbb024_desc , 
      g_detail3_d[l_ac].l_stbb011      ,g_detail3_d[l_ac].l_stbb011_desc  ,g_detail3_d[l_ac].l_stbb012  ,     
      g_detail3_d[l_ac].l_stbb012_desc ,g_detail3_d[l_ac].l_stbb001       ,g_detail3_d[l_ac].l_stbb001_desc,     
      g_detail3_d[l_ac].l_stbb025      ,g_detail3_d[l_ac].l_stbb026       ,g_detail3_d[l_ac].l_stbb027,           
      g_detail3_d[l_ac].l_stbb028      ,g_detail3_d[l_ac].l_stbb009       ,g_detail3_d[l_ac].l_stbb017       
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH b_fill_curs2:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
 
         EXIT FOREACH
      END IF   
 
      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend =  "" 
            LET g_errparam.code   =  9035 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
 
         END IF
         EXIT FOREACH
      END IF
      
   END FOREACH
   LET g_error_show = 0
   
   CALL g_detail3_d.deleteElement(l_ac)   #Standard---保留彈性,要補上清除ARRAY的最後一行
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astp561.fetch" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astp561_fetch()
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point
   DEFINE li_ac           LIKE type_t.num10
   #add-point:fetch段define name="fetch.define"
   
   #end add-point
   
   LET li_ac = l_ac 
   
   #add-point:單身填充後 name="fetch.after_fill"
   CALL g_detail2_d.clear()
   #IF g_detail_idx = 0 THEN #MARKED BY LANJJ 2015-10-14
   IF g_detail_idx = 0 OR g_detail_idx > g_detail_d.getLength() THEN #ADDED BY LANJJ 2015-10-14 （防止数组扩充）
      LET g_detail_idx = 1
   END IF
   
   LET g_sql = "SELECT stbbdocno ,stbbseq  , stbb020  , stbb021 , ",
               "       stbb005  , stbb006  , stbb022 , t1.imaal003  , stbb023 ,t2.inayl003, ",
               "       stbb024  , t3.mhael023 , stbb011  , t4.rtaxl003  , stbb012  ,t5.ooefl003, ",
               "       stbb001  , t6.stael003 ,",            
               "       stbb025  , stbb026 , stbb027  , stbb028  ,stbb009   , stbb017  ",
               "  FROM stba_t,stbb_t ",
               
               "  LEFT JOIN imaal_t t1 ON t1.imaalent = stbbent AND t1.imaal001 = stbb022 AND t1.imaal002 = '",g_dlang,"' ",
               "  LEFT JOIN inayl_t t2 ON t2.inaylent = stbbent AND t2.inayl001 = stbb023 AND t2.inayl002 = '",g_dlang,"' ",
               "  LEFT JOIN mhael_t t3 ON t3.mhaelent = stbbent AND t3.mhael001 = stbb024 AND t3.mhael022 = '",g_dlang,"' ",
               "  LEFT JOIN rtaxl_t t4 ON t4.rtaxlent = stbbent AND t4.rtaxl001 = stbb011 AND t4.rtaxl002 = '",g_dlang,"' ",
               "  LEFT JOIN ooefl_t t5 ON t5.ooeflent = stbbent AND t5.ooefl001 = stbb012 AND t5.ooefl002 = '",g_dlang,"' ",
               "  LEFT JOIN stael_t t6 ON t6.staelent = stbbent AND t6.stael001 = stbb001 AND t6.stael002 = '",g_dlang,"' ",
               
               "  LEFT JOIN mhae_t     ON  mhaeent = stbbent AND mhae001 = stbb024 ",

               
               
               " WHERE stbbent = ",g_enterprise,
               "   AND stbaent = stbbent AND stbadocno = stbbdocno ",
               "   AND stbbdocno = '",g_detail_d[g_detail_idx].b_stbadocno CLIPPED,"' ",
               " ORDER BY stbbseq "
   PREPARE b_fill_pre3 FROM g_sql
   DECLARE b_fill_curs3 CURSOR FOR b_fill_pre3
   
   DISPLAY "b_fill_curs3[SQL] ",g_sql
   
   LET l_ac = 1
   FOREACH b_fill_curs3 INTO 
       g_detail2_d[l_ac].b_stbbdocno    ,g_detail2_d[l_ac].b_stbbseq       ,g_detail2_d[l_ac].b_stbb020 , 
       g_detail2_d[l_ac].b_stbb021      ,g_detail2_d[l_ac].b_stbb005       ,g_detail2_d[l_ac].b_stbb006 ,      
       g_detail2_d[l_ac].b_stbb022      ,g_detail2_d[l_ac].b_stbb022_desc  ,g_detail2_d[l_ac].b_stbb023 ,      
       g_detail2_d[l_ac].b_stbb023_desc ,g_detail2_d[l_ac].b_stbb024       ,g_detail2_d[l_ac].b_stbb024_desc , 
       g_detail2_d[l_ac].b_stbb011      ,g_detail2_d[l_ac].b_stbb011_desc  ,g_detail2_d[l_ac].b_stbb012  ,     
       g_detail2_d[l_ac].b_stbb012_desc ,g_detail2_d[l_ac].b_stbb001       ,g_detail2_d[l_ac].b_stbb001_desc,     
       g_detail2_d[l_ac].b_stbb025      ,g_detail2_d[l_ac].b_stbb026       ,g_detail2_d[l_ac].b_stbb027,           
       g_detail2_d[l_ac].b_stbb028      ,g_detail2_d[l_ac].b_stbb009       ,g_detail2_d[l_ac].b_stbb017 

      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec THEN
         IF g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code =  9035
            LET g_errparam.extend =  ""
            LET g_errparam.popup = TRUE
            CALL cl_err()

         END IF
         EXIT FOREACH
      END IF   
   END FOREACH   

   CALL g_detail2_d.deleteElement(l_ac)
   LET g_detail2_cnt = l_ac - 1 
   DISPLAY g_detail2_cnt TO FORMONLY.cnt 
   #end add-point 
   
   LET l_ac = li_ac
   
END FUNCTION
 
{</section>}
 
{<section id="astp561.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION astp561_detail_show()
   #add-point:show段define(客製用) name="detail_show.define_customerization"
   
   #end add-point
   #add-point:show段define name="detail_show.define"
   
   #end add-point
   
   #add-point:detail_show段 name="detail_show.detail_show"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astp561.filter" >}
#+ filter過濾功能
PRIVATE FUNCTION astp561_filter()
   #add-point:filter段define(客製用) name="filter.define_customerization"
   
   #end add-point    
   #add-point:filter段define name="filter.define"
   
   #end add-point
   
   DISPLAY ARRAY g_detail_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt)
      ON UPDATE
 
   END DISPLAY
 
   LET l_ac = 1
   LET g_detail_cnt = 1
   #add-point:filter段define name="filter.detail_cnt"
   
   #end add-point    
 
   LET INT_FLAG = 0
 
   LET g_qryparam.state = 'c'
 
   LET g_wc_filter_t = g_wc_filter
   LET g_wc_t = g_wc
   
   LET g_wc = cl_replace_str(g_wc, g_wc_filter, '')
   
   CALL astp561_b_fill()
   
END FUNCTION
 
{</section>}
 
{<section id="astp561.filter_parser" >}
#+ filter欄位解析
PRIVATE FUNCTION astp561_filter_parser(ps_field)
   #add-point:filter段define(客製用) name="filter_parser.define_customerization"
   
   #end add-point    
   DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num10
   DEFINE li_tmp2    LIKE type_t.num10
   DEFINE ls_var     STRING
   #add-point:filter段define name="filter_parser.define"
   
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
 
{<section id="astp561.filter_show" >}
#+ Browser標題欄位顯示搜尋條件
PRIVATE FUNCTION astp561_filter_show(ps_field,ps_object)
   DEFINE ps_field         STRING
   DEFINE ps_object        STRING
   DEFINE lnode_item       om.DomNode
   DEFINE ls_title         STRING
   DEFINE ls_name          STRING
   DEFINE ls_condition     STRING
 
   LET ls_name = "formonly.", ps_object
 
   LET lnode_item = gfrm_curr.findNode("TableColumn", ls_name)
   LET ls_title = lnode_item.getAttribute("text")
   IF ls_title.getIndexOf('※',1) > 0 THEN
      LEt ls_title = ls_title.subString(1,ls_title.getIndexOf('※',1)-1)
   END IF
 
   #顯示資料組合
   LET ls_condition = astp561_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astp561.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

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
PRIVATE FUNCTION astp561_process(p_stus)

   DEFINE l_msg       LIKE type_t.chr100   #160225-00040#18 2016/04/13 s983961--add
   DEFINE p_stus      LIKE type_t.chr30
   #170109-00037#14 by sakura mark(S)
   #DEFINE li_idx      LIKE type_t.num5
   #DEFINE l_cnt       LIKE type_t.num5
   #170109-00037#14 by sakura mark(E)
   #170109-00037#14 by sakura add(S)
   DEFINE li_idx      LIKE type_t.num10
   DEFINE l_cnt       LIKE type_t.num10
   DEFINE l_lockcnt   LIKE type_t.num10    #計算有勾選但是被lock的筆數
   #170109-00037#14 by sakura add(E)
   
   LET l_cnt = 0 
   LET l_lockcnt = 0   #170109-00037#14 by sakura add
   #CALL cl_err_collect_init()   #170109-00037#14 by sakura mark
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('ast-00330',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#18 2016/04/13 s983961--add(e)
   
   FOR li_idx = 1 TO g_detail_d.getLength()
      IF g_detail_d[li_idx].sel = "Y" THEN
         LET l_cnt = l_cnt + 1
         
        CALL s_transaction_begin()
        #170109-00037#14 by sakura add(S)
        #檢查LOCK
        LET l_ac = li_idx
        CALL astp561_lock_chk()
        IF g_detail_d[li_idx].sel = "Y" THEN        
        #170109-00037#14 by sakura add(E)
           CASE p_stus
              WHEN "unconf"
                 IF NOT s_astt560_unconf_chk(g_detail_d[li_idx].b_stbadocno) THEN
                    CALL s_transaction_end('N',0)
                 ELSE
                    IF NOT s_astt560_unconf_upd(g_detail_d[li_idx].b_stbadocno) THEN
                       CALL s_transaction_end('N',0)
                    END IF
                 END IF
              WHEN "conf"
                 IF NOT s_astt560_conf_chk(g_detail_d[li_idx].b_stbadocno) THEN
                    CALL s_transaction_end('N',0)
                 ELSE
                    IF NOT s_astt560_conf_upd(g_detail_d[li_idx].b_stbadocno) THEN
                       CALL s_transaction_end('N',0)
                    END IF
                 END IF      
              WHEN "invalid"
                 IF NOT s_astt560_void_chk(g_detail_d[li_idx].b_stbadocno) THEN
                    CALL s_transaction_end('N',0)
                 ELSE
                    IF NOT s_astt560_void_upd(g_detail_d[li_idx].b_stbadocno) THEN
                       CALL s_transaction_end('N',0)
                    ELSE
                       #add by dengdd 160302(S)
                       #更新astq501的资料
                       UPDATE stga_t SET stga016='',stga017='',stga015='N'
                        WHERE stgaent=g_enterprise
                          #AND stga016=g_stba_m.stbadocno #lanjj mark on 2016-04-05
                          AND stga016 = g_detail_d[li_idx].b_stbadocno #lanjj modify on 2016-04-05
                       IF SQLCA.sqlcode THEN
                          INITIALIZE g_errparam TO NULL 
                          LET g_errparam.extend = "" 
                          LET g_errparam.code   = SQLCA.sqlcode 
                          LET g_errparam.popup  = FALSE 
                          CALL cl_err()
                          CALL s_transaction_end('N','0')
                          RETURN
                       END IF
                       #add by dengdd 160302(E)
                    END IF
                 END IF
           END CASE
           #CALL s_transaction_end('Y',1)  #170109-00037#14 by sakura mark 
        #170109-00037#14 by sakura add(S)
           CALL s_transaction_end('Y',0)
        ELSE
           LET l_lockcnt = l_lockcnt + 1   #原本有勾，但是被LOCK所以sel變回N
           CALL s_transaction_end('N',0)
        END IF
        #170109-00037#14 by sakura add(E)        
      END IF
   END FOR
  
   #CALL cl_err_collect_show()   #170109-00037#14 by sakura mark
   
   IF l_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'adb-00078'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      #160225-00040#18 2016/04/13 s983961--add(s)
      LET l_msg = cl_getmsg('std-00012',g_lang)
      CALL cl_progress_no_window_ing(l_msg)  
      #160225-00040#18 2016/04/13 s983961--add(e)   
      #RETURN   #170109-00037#14 by sakura mark
   #170109-00037#14 by sakura add(S)
   ELSE
      IF l_cnt = l_lockcnt THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00867'   #目前選取的資料，均已被鎖定，請重新操作
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END IF
   #170109-00037#14 by sakura add(E)      
   END IF 
   CALL astp561_b_fill()
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('std-00012',g_lang)
   CALL cl_progress_no_window_ing(l_msg)  
   #160225-00040#18 2016/04/13 s983961--add(e)   
END FUNCTION

################################################################################
# Descriptions...: 檢查該筆的stba_t是否被lock
# Memo...........:
# Usage..........: CALL astp561_lock_chk()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2017/01/13  By sakura #170109-00037#14
# Modify.........:
################################################################################
PRIVATE FUNCTION astp561_lock_chk()
   DEFINE l_stbadocno LIKE stba_t.stbadocno
   
   LET l_stbadocno = ''
   
   EXECUTE astp561_chk_lock_stba USING g_detail_d[l_ac].b_stbadocno
                                  INTO l_stbadocno
                                  
   IF cl_null(l_stbadocno) THEN
      LET g_detail_d[l_ac].sel = 'N'
      
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ''
      LET g_errparam.code   = 'ast-00868'
      LET g_errparam.replace[1] = g_detail_d[l_ac].b_stbadocno
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   END IF
END FUNCTION

#end add-point
 
{</section>}
 
