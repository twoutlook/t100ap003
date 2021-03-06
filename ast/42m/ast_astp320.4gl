#該程式未解開Section, 採用最新樣板產出!
{<section id="astp320.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0008(2016-06-28 11:01:51), PR版次:0008(2017-01-17 09:20:46)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000033
#+ Filename...: astp320
#+ Description: 供應商費用單批次處理作業
#+ Creator....: 06189(2016-02-16 16:54:06)
#+ Modifier...: 07142 -SD/PR- 02159
 
{</section>}
 
{<section id="astp320.global" >}
#應用 p02 樣板自動產生(Version:22)
#add-point:填寫註解說明 name="global.memo"
#151125-00001#4   2015/12/10   By 06948   增加作廢時詢問「是否作廢」
#160318-00005#44  2016/03/26   By pengxin 修正azzi920重复定义之错误讯息
#161111-00028#3   2016/11/15   by 02481   标准程式定义采用宣告模式,弃用.*写法
#170109-00037#11  2017/01/16   by sakura  批次LOCK處理1.UI勾選LOCK檢查2.資料處理LOCK3.單號LOCK
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
     sel             LIKE type_t.chr1,
     stbaunit        LIKE stba_t.stbaunit ,
     stbaunit_desc   LIKE ooefl_t.ooefl003,
     stbadocdt       LIKE stba_t.stbadocdt,
     stba007         LIKE stba_t.stba007  ,
     stbadocno       LIKE stba_t.stbadocno,
     stba013         LIKE stba_t.stba013  ,
     stba013_desc    LIKE mhael_t.mhael023,
     stba002         LIKE stba_t.stba002  ,
     stba002_desc    LIKE pmaal_t.pmaal004,
     stba010         LIKE stba_t.stba010  ,
     stba003         LIKE stba_t.stba003  ,
     stba004         LIKE stba_t.stba004  ,
     stba004_desc    LIKE oocql_t.oocql004,
     stba005         LIKE stba_t.stba005  ,
     stba005_desc    LIKE staal_t.staal003,
     stba006         LIKE stba_t.stba006  ,
     stba001         LIKE stba_t.stba001  ,
     stba001_desc    LIKE ooefl_t.ooefl003,
     stba008         LIKE stba_t.stba008  ,
     stba008_desc    LIKE ooag_t.ooag011  ,
     stba009         LIKE stba_t.stba009  ,
     stba009_desc    LIKE ooefl_t.ooefl003,
     stba011         LIKE stba_t.stba011  ,
     stba011_desc    LIKE ooail_t.ooail003,
     stba012         LIKE stba_t.stba012  ,
     stba012_desc    LIKE oodbl_t.oodbl004 ,
     stbastus        LIKE stba_t.stbastus   
                     END RECORD
                     
TYPE type_g_detail2_d RECORD
     stbbseq          LIKE stbb_t.stbbseq  ,     
     stbb001          LIKE stbb_t.stbb001  ,     
     stbb001_desc     LIKE stael_t.stael003,  
     l_stae003        LIKE stae_t.stae003  ,   
     l_stae003_desc   LIKE oocql_t.oocql004,
     l_stae004        LIKE stae_t.stae004  ,   
     stbb003          LIKE stbb_t.stbb003  ,     
     stbb003_desc     LIKE oodbl_t.oodbl004,
     l_oodb006        LIKE oodb_t.oodb006  ,  
     stbb002          LIKE stbb_t.stbb002  ,     
     stbb002_desc     LIKE ooail_t.ooail003, 
     stbb004          LIKE stbb_t.stbb004  ,     
     stbb005          LIKE stbb_t.stbb005  ,     
     stbb006          LIKE stbb_t.stbb006  ,     
     stbb007          LIKE stbb_t.stbb007  ,     
     stbb008          LIKE stbb_t.stbb008  ,     
     stbb014          LIKE stbb_t.stbb014  ,     
     stbb011          LIKE stbb_t.stbb011  ,     
     stbb011_desc     LIKE rtaxl_t.rtaxl003,
     stbb009          LIKE stbb_t.stbb009  ,     
     stbb010          LIKE stbb_t.stbb010  ,     
     stbb013          LIKE stbb_t.stbb013  , 
     stbbsite         LIKE stbb_t.stbbsite,
     stbbsite_desc    LIKE ooefl_t.ooefl003,      
     stbb012          LIKE stbb_t.stbb012  ,     
     stbbunit         LIKE stbb_t.stbbunit ,
     stbb017          LIKE stbb_t.stbb017   #add by dengdd 151020
                      END RECORD
                      
TYPE type_g_detail3_d RECORD
     l_stbaunit          LIKE stba_t.stbaunit ,   #營運組織
     l_stbaunit_desc     LIKE ooefl_t.ooefl003,
     l_stbadocno         LIKE stba_t.stbadocno,   #單據編號
     l_stbadocdt         LIKE stba_t.stbadocdt,   #單據日期
     l_stba013           LIKE stba_t.stba013  ,   #專櫃編號
     l_stba013_desc      LIKE mhael_t.mhael023,
     l_stba002           LIKE stba_t.stba002  ,   #供應商編號
     l_stba002_desc      LIKE pmaal_t.pmaal004,
     l_stba010           LIKE stba_t.stba010  ,   #合同編號
     l_stba003           LIKE stba_t.stba003  ,   #經營方式
     l_stba004           LIKE stba_t.stba004  ,   #結算方式
     l_stba004_desc      LIKE oocql_t.oocql004,
     l_stba005           LIKE stba_t.stba005  ,   #結算類型
     l_stba005_desc      LIKE staal_t.staal003,
     l_stba006           LIKE stba_t.stba006  ,   #來源類型
     l_stba007           LIKE stba_t.stba007  ,   #來源單號
     l_stba001           LIKE stba_t.stba001  ,   #結算中心
     l_stba001_desc      LIKE ooefl_t.ooefl003,
     l_stba008           LIKE stba_t.stba008  ,   #人員
     l_stba008_desc      LIKE ooag_t.ooag011  ,   
     l_stba009           LIKE stba_t.stba009  ,   #部門
     l_stba009_desc      LIKE ooefl_t.ooefl003,
     l_stba011           LIKE stba_t.stba011  ,   #幣別
     l_stba011_desc      LIKE ooail_t.ooail003,
     l_stba012           LIKE stba_t.stba012  ,   #稅別
     l_stba012_desc      LIKE oodbl_t.oodbl004,
     l_stbastus          LIKE stba_t.stbastus ,   #狀態
     l_stbbseq           LIKE stbb_t.stbbseq  ,   #項次 
     l_stbbsite          LIKE stbb_t.stbbsite,
     l_stbbsite_desc     LIKE ooefl_t.ooefl003,       
     l_stbb001           LIKE stbb_t.stbb001  ,   #費用編號
     l_stbb001_desc      LIKE stael_t.stael003,       
     l_stae003_1         LIKE stae_t.stae003  ,   #費用總額
     l_stae003_1_desc    LIKE oocql_t.oocql004,
     l_stae004_1         LIKE stae_t.stae004  ,   #費用類型       
     l_stbb003           LIKE stbb_t.stbb003  ,   #稅別
     l_stbb003_desc      LIKE oodbl_t.oodbl004,
     l_oodb006_1         LIKE oodb_t.oodb006  ,   #稅率  
     l_stbb004           LIKE stbb_t.stbb004  ,   #價款類別
     l_stbb005           LIKE stbb_t.stbb005  ,   #起始日期  
     l_stbb006           LIKE stbb_t.stbb006  ,   #截止日期   
     l_stbb007           LIKE stbb_t.stbb007  ,   #結算會計期
     l_stbb008           LIKE stbb_t.stbb008  ,   #財務會計期  
     l_stbb009           LIKE stbb_t.stbb009  ,   #費用金額  
     l_stbb010           LIKE stbb_t.stbb010  ,   #承擔對象   
     l_stbb011           LIKE stbb_t.stbb011  ,   #品類  
     l_stbb011_desc      LIKE rtaxl_t.rtaxl003,
     l_stbb013           LIKE stbb_t.stbb013  ,   #結算對象    
     l_stbb014           LIKE stbb_t.stbb014  ,   #財務會計期別
     l_stbb017           LIKE stbb_t.stbb017      #备注        #add by dengdd 151020     
                      END RECORD                      
                     
DEFINE g_detail2_cnt         LIKE type_t.num5      
DEFINE g_detail2_d           DYNAMIC ARRAY OF type_g_detail2_d
DEFINE g_detail3_cnt         LIKE type_t.num5      
DEFINE g_detail3_d           DYNAMIC ARRAY OF type_g_detail3_d
DEFINE g_detail_idx          LIKE type_t.num5
DEFINE g_detail_idx2         LIKE type_t.num5
DEFINE g_time                LIKE stbz_t.stbz001     #20150910 dongsz add
DEFINE g_cnt1                 LIKE type_t.num10     #add by geza 20150911
DEFINE g_deteal_cnt          LIKE type_t.num10     #add by geza 20150911
DEFINE g_aw                  STRING                        #確定當下點擊的單身
DEFINE g_stba007              LIKE stba_t.stba007
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
DEFINE g_detail_cnt         LIKE type_t.num10              #單身 總筆數(所有資料)
DEFINE g_detail_d  DYNAMIC ARRAY OF type_g_detail_d
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="astp320.main" >}
#+ 作業開始 
MAIN
   #add-point:main段define(客製用) name="main.define_customerization"
   
   #end add-point   
   DEFINE ls_js  STRING
   #add-point:main段define name="main.define"
   DEFINE l_success LIKE type_t.num5 
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
      OPEN WINDOW w_astp320 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astp320_init()   
 
      #進入選單 Menu (="N")
      CALL astp320_ui_dialog() 
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp320
   END IF 
   
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp320.init" >}
#+ 畫面資料初始化
PRIVATE FUNCTION astp320_init()
   #add-point:init段define(客製用) name="init.define_customerization"
   
   #end add-point   
   #add-point:init段define name="init.define"
   DEFINE l_success LIKE type_t.num5 
   #end add-point   
   
   LET g_error_show  = 1
   LET g_wc_filter   = " 1=1"
   LET g_wc_filter_t = " 1=1"
 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part('stba003','6013','1,2,3')       #經營方式
   CALL cl_set_combo_scc_part('b_stba003','6013','1,2,3')     #經營方式
   CALL cl_set_combo_scc_part('l_stba003','6013','1,2,3')     #經營方式
                                                 
   CALL cl_set_combo_scc('stba006','6702')       #來源類型
   CALL cl_set_combo_scc('b_stba006','6702')     #來源類型
   CALL cl_set_combo_scc('l_stba006','6702')     #來源類型
                                                 
   CALL cl_set_combo_scc('b_stbb004','6006')     #價款類別
   CALL cl_set_combo_scc('l_stbb004','6006')     #價款類別
                                                 
   CALL cl_set_combo_scc('l_stae004','6004')     #費用性質
   CALL cl_set_combo_scc('l_stae004_1','6004')   #費用性質
   
   CALL cl_set_combo_scc('b_stbb010','6724')       #承担对象  #add by dengdd 151022
   CALL cl_set_combo_scc('l_stbb010','6724')       #承担对象  #add by dengdd 151022
   
   CALL cl_set_combo_scc('b_stbb013','6724')       #结算对象  #add by dengdd 151022
   CALL cl_set_combo_scc('l_stbb013','6724')       #结算对象  #add by dengdd 151022
   
   CALL cl_set_combo_scc_part('stbastus','13','N,Y,A,D,R,W,X')  #add by dengdd 15/11/3
   CALL cl_set_combo_scc_part('b_stbastus','13','N,Y,A,D,R,W,X')  #add by geza 20160218 
   CALL cl_set_combo_scc_part('l_stbastus','13','N,Y,A,D,R,W,X')  #add by geza 20160218
   CALL s_aooi500_create_temp() RETURNING l_success
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp320.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp320_ui_dialog()
   #add-point:ui_dialog段define(客製用) name="ui_dialog.define_customerization"
   
   #end add-point 
   DEFINE li_idx   LIKE type_t.num10
   #add-point:ui_dialog段define name="init.init"
   DEFINE l_stus   LIKE type_t.chr30 
   #150805-00003#13--add by dongsz--s
   DEFINE la_param    RECORD
          prog        STRING,
          actionid    STRING,
          background  LIKE type_t.chr1,
          param       DYNAMIC ARRAY OF STRING
          END RECORD
   DEFINE ls_js       STRING
   DEFINE l_time      DATETIME YEAR TO SECOND
   #150805-00003#13--add by dongsz--e
   DEFINE l_success   LIKE type_t.num5   #add by geza 20150922
   DEFINE l_i         LIKE type_t.num5   #added by lanjj 2016-01-26
   DEFINE report_wc   STRING 
   #end add-point 
   
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm()   
   
   LET g_action_choice = " "  
   CALL cl_set_act_visible("accept,cancel", FALSE)
         
   LET g_detail_cnt = g_detail_d.getLength()
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   #170109-00037#11 by sakura add(S)
   #LOCK檢查
   LET g_sql = "SELECT stbadocno FROM stba_t ",
               " WHERE stbaent = ",g_enterprise,
               "   AND stbadocno = ? ",
               "   FOR UPDATE SKIP LOCKED "
   PREPARE astp320_chk_lock_stba FROM g_sql
   #170109-00037#11 by sakura add(E)
   #end add-point
   
   WHILE TRUE
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM
         CALL g_detail_d.clear()
         LET g_wc  = ' 1=2'
         LET g_wc2 = ' 1=1'
         LET g_action_choice = ""
         CALL astp320_init()
      END IF
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #add-point:ui_dialog段construct name="ui_dialog.more_construct"
         CONSTRUCT BY NAME g_wc ON stbaunit,stbadocdt,stba007,  stbadocno,  stba002,
                                   stba010, stba003,  stba006,  stba001,    stba008,  
                                   stba009, stbastus, stbb001,  stbb005,    stbb006, 
                                   stbb007, stbb008,  stbb009,  stbbsite,   stbb012,    
                                   stbb014, stbb019                                   
            BEFORE CONSTRUCT
               CALL cl_set_act_visible("filter",FALSE)
               
            ON ACTION controlp
               CASE
                  #add by dengdd(s)
                  WHEN INFIELD(stba007)   #来源单号
                     INITIALIZE g_qryparam.* TO NULL
                     LET g_qryparam.state = 'c'
                     LET g_qryparam.reqry = FALSE
                     LET g_qryparam.where = " stba014 = '1' "
                     CALL q_stba007_1()
                     DISPLAY g_qryparam.return1 TO stba007 
                     NEXT FIELD CURRENT
                  #add by dengdd(e)
                  WHEN INFIELD(stbaunit)   #制定組織
                     INITIALIZE g_qryparam.* TO NULL
                     LET g_qryparam.state = 'c'
                     LET g_qryparam.reqry = FALSE
                     LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbaunit',g_site,'c')
                     CALL q_ooef001_24()
                     DISPLAY g_qryparam.return1 TO stbaunit 
                     NEXT FIELD CURRENT
                  WHEN INFIELD(stbadocno)  #費用單號
                     INITIALIZE g_qryparam.* TO NULL
                     LET g_qryparam.state = 'c'
                     LET g_qryparam.reqry = FALSE
                     LET g_qryparam.where = " stba014 = '1' "
                     CALL q_stbadocno()
                     DISPLAY g_qryparam.return1 TO stbadocno 
                     NEXT FIELD CURRENT
                  WHEN INFIELD(stba002)    #供應商編號
                     INITIALIZE g_qryparam.* TO NULL
                     LET g_qryparam.state = 'c'
                     LET g_qryparam.reqry = FALSE
                     CALL q_pmaa001_10()
                     DISPLAY g_qryparam.return1 TO stba002 
                     NEXT FIELD CURRENT
                  WHEN INFIELD(stba010)    #合同編號
                     INITIALIZE g_qryparam.* TO NULL
                     LET g_qryparam.state = 'c'
                     LET g_qryparam.reqry = FALSE
                     CALL q_stan001_2()
                     DISPLAY g_qryparam.return1 TO stba010 
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
                     
                 WHEN INFIELD(stbb001)     #费用编号
                     INITIALIZE g_qryparam.* TO NULL
                     LET g_qryparam.state = 'c'
                     LET g_qryparam.reqry = FALSE
                     CALL q_stae001()
                     DISPLAY g_qryparam.return1 TO stbb001
                     NEXT FIELD CURRENT
                                          
                 WHEN INFIELD(stbb012)     #所属部门
                     INITIALIZE g_qryparam.* TO NULL
                     LET g_qryparam.state = 'c'
                     LET g_qryparam.reqry = FALSE
                     CALL q_ooeg001_4()
                     DISPLAY g_qryparam.return1 TO stbb012
                     NEXT FIELD CURRENT
                 
                WHEN INFIELD(stbbsite)   #制定組織
                     INITIALIZE g_qryparam.* TO NULL
                     LET g_qryparam.state = 'c'
                     LET g_qryparam.reqry = FALSE
                     LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbbsite',g_site,'c')
                     CALL q_ooef001_24()
                     DISPLAY g_qryparam.return1 TO stbbsite 
                     NEXT FIELD CURRENT 

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
               CALL astp320_fetch()
               IF g_detail_d[l_ac].sel = 'N' THEN
                  NEXT FIELD sel
               END IF
            
            #170109-00037#11 by sakura add(S)               
            ON CHANGE sel
               #UI勾選LOCK檢查
               IF g_detail_d[l_ac].sel = "Y" THEN
                  CALL cl_err_collect_init() 
                  CALL s_transaction_begin()
                  LET l_ac = g_detail_idx                  
                  CALL astp320_lock_chk()
                  CALL s_transaction_end('Y',0)
                  CALL cl_err_collect_show()
               END IF
            #170109-00037#11 by sakura add(E)               
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
            CALL cl_err_collect_init()   #170109-00037#11 by sakura add
            #end add-point            
            FOR li_idx = 1 TO g_detail_d.getLength()
               LET g_detail_d[li_idx].sel = "Y"
               #add-point:ui_dialog段on action selall name="ui_dialog.for.onaction_selall"
               
               #170109-00037#11 by sakura add(S)             
               CALL s_transaction_begin()
               LET l_ac = li_idx
               CALL astp320_lock_chk()
               CALL s_transaction_end('Y',0)
               #170109-00037#11 by sakura add(E)
               
               #end add-point
            END FOR
            #add-point:ui_dialog段on action selall name="ui_dialog.onaction_selall"
            CALL cl_err_collect_show()   #170109-00037#11 by sakura add
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
            #170109-00037#11 by sakura add(S)
            CALL cl_err_collect_init()
            FOR li_idx = 1 TO g_detail_d.getLength()
               IF DIALOG.isRowSelected("s_detail1", li_idx) THEN
                  CALL s_transaction_begin()
                  LET l_ac = g_detail_idx
                  CALL astp320_lock_chk()
                  CALL s_transaction_end('Y',0)
               END IF
            END FOR
            CALL cl_err_collect_show()
            #170109-00037#11 by sakura add(E)
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
            CALL astp320_filter()
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
            CALL g_detail_d.clear()
            #end add-point
            CALL astp320_query()
             
         # 條件清除
         ON ACTION qbeclear
            #add-point:ui_dialog段 name="ui_dialog.qbeclear"
            
            #end add-point
 
         # 重新整理
         ON ACTION datarefresh
            LET g_error_show = 1
            #add-point:ui_dialog段datarefresh name="ui_dialog.datarefresh"
            
            #end add-point
            CALL astp320_b_fill()
 
         #add-point:ui_dialog段action name="ui_dialog.more_action"
         ON ACTION batch_execute
            LET l_stus = ''
            #151027-00016#2 20151112 mark by beckxie---S
            #MENU "" ATTRIBUTE(STYLE="popup")
            #   ON ACTION unconfirmed
            #         LET l_stus = "unconf"
            #   ON ACTION confirmed
            #         LET l_stus = "conf"
            #   ON ACTION invalid
            #         LET l_stus = "invalid"
            #END MENU
            #CALL astp320_process(l_stus)
            #151027-00016#2 20151112 mark by beckxie---E
            #151027-00016#2 20151112  add by beckxie---S
            CALL cl_err_collect_init()   #170109-00037#11 by sakura add
            MENU "" ATTRIBUTE(STYLE="popup")
               ON ACTION unconfirmed
                  IF cl_auth_chk_act("unconfirmed") THEN
                     LET l_stus = "unconf"
                     #151125-00001#4 --- add start ---
                     IF cl_ask_confirm('aim-00110') THEN
                        CALL astp320_process(l_stus)
                     END IF
                     #151125-00001#4 --- add end   ---
                  END IF
               ON ACTION confirmed
                  IF cl_auth_chk_act("confirmed") THEN
                     LET l_stus = "conf"
                     #151125-00001#4 --- add start ---
                     IF cl_ask_confirm('aim-00108') THEN
                        CALL astp320_process(l_stus)
                     END IF
                     #151125-00001#4 --- add end   ---
                  END IF
               ON ACTION invalid
                  IF cl_auth_chk_act("invalid") THEN
                     LET l_stus = "invalid"
                     #151125-00001#4 --- add start ---
                     IF cl_ask_confirm('aim-00109') THEN
                        CALL astp320_process(l_stus)
                     END IF
                     #151125-00001#4 --- add end   ---
                  END IF
            END MENU
            #151027-00016#2 20151112  add by beckxie---E
            CALL cl_err_collect_show()   #170109-00037#11 by sakura add
            
         #150805-00003#13--add by dongsz--s
         ON ACTION excel_example
            LET g_action_choice="excel_example"
            IF cl_auth_chk_act("excel_example") THEN

               #add-point:ON ACTION excel_example
               LET la_param.prog = 'awsp200'
               LET la_param.param[1] = g_prog
               LET la_param.param[2] = "excel_example"
               LET ls_js = util.JSON.stringify( la_param )

               CALL cl_cmdrun_wait(ls_js)
               #END add-point

            END IF
          ON ACTION uploadtemplet
            LET g_action_choice="uploadtemplet"
            IF cl_auth_chk_act("uploadtemplet") THEN
               
               #add-point:ON ACTION uploadtemplet name="menu.uploadtemplet"
               CALL s_excel_templet_upload()  
               #END add-point
               
            END IF
           ON ACTION downloadtemplet
            LET g_action_choice="downloadtemplet"
            IF cl_auth_chk_act("downloadtemplet") THEN
               
               #add-point:ON ACTION downloadtemplet name="menu.downloadtemplet"
               CALL s_excel_templet_download()
               #END add-point
               
          END IF            
         ON ACTION excel_load
          call astp320_excel() 
       


#            LET g_action_choice="excel_load"
#            IF cl_auth_chk_act("excel_load") THEN
#
#               #add-point:ON ACTION excel_load
#               LET l_time = cl_get_current()
#               LET g_time = cl_replace_str(l_time,'-','')
#               LET g_time = cl_replace_str(g_time,' ','')
#               LET g_time = cl_replace_str(g_time,':','')
#               
#               LET g_etlparam[1].para_id = "g_docno"
#               LET g_etlparam[1].type = "string"
#               LET g_etlparam[1].value = g_time
#               
#               LET la_param.prog = 'awsp200'
#               LET la_param.param[1] = g_prog
#               LET la_param.param[2] = "excel_load"
#               LET la_param.param[3] = util.JSON.stringify(g_etlparam)
#
#               LET ls_js = util.JSON.stringify( la_param )
#               CALL cl_cmdrun_wait(ls_js)
#               #mark by geza 20160325(S)
#               #add by geza 20160314(S)
##               DISPLAY g_time TO stba007    
##               LET g_wc = " stba007='",g_time,"'" 
#               #add by geza 20160314(E)
#               #mark by geza 20160325(E)
#               #END add-point
#
#            END IF
#            #抓暂存表资料写入费用单
#            #add by geza 20150921(S)
#            CALL astp320_astt320_check() RETURNING l_success
#            IF l_success THEN         
#               #add by geza 20150910(S)
#               IF NOT astp320_astt320_insert() THEN 
#                  LET g_errparam.code = 'adz-00218'
#                  LET g_errparam.extend = ''
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()                  
#               ELSE
#                  LET g_errparam.code = 'ast-00471'
#                  LET g_errparam.extend = ''
#                  LET g_errparam.popup = TRUE
#                  LET g_errparam.replace[1] = g_cnt1
#                  CALL cl_err()
#                  #add by geza 20160325(S)
#                  IF g_cnt1 >= 1 THEN
#                     DISPLAY g_time TO stba007    
#                     LET g_wc = " stba007='",g_time,"'" 
#                     CALL astp320_b_fill()    #add by geza 20151010
#                  END IF   
#                  #add by geza 20160325(E)
#               END IF
#               #add by geza 20150910(E)
#               
#            END IF
#            #add by geza 20150921(E)
#            #写入费用单完成，删除暂存表资料
#            DELETE FROM stbz_t WHERE stbzent = g_enterprise
#                                 AND stbz001 = g_time
#            IF SQLCA.sqlcode THEN
#               INITIALIZE g_errparam TO NULL 
#               LET g_errparam.extend = "del_stbz" 
#               LET g_errparam.code   = SQLCA.sqlcode 
#               LET g_errparam.popup  = TRUE 
#               CALL cl_err()
#               CONTINUE DIALOG
#            END IF
         #150805-00003#13--add by dongsz--e
         #add by dengdd 150916-----str-----------
         ON ACTION export_to_excel
            LET g_action_choice="export_to_excel"
            IF cl_auth_chk_act("export_to_excel") THEN               
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
         #add by dengdd 150916----end------------
         #add by dengdd 150917----str------------
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify_detail") THEN 
                CALL cl_cmdrun_wait("astt320 '" || g_detail_d[l_ac].stbadocno || "'")
#                CALL astp320_b_fill()
            END IF
         #add by dengdd 150917----end------------
         
         #add by dengdd 151123(S)
         ON ACTION pdelete
            LET g_action_choice="pdelete"
            IF cl_auth_chk_act("pdelete") THEN
               CALL astp320_p_delete()
               CALL astp320_b_fill()
            END IF
         
         #add by dengdd 151123(E)
         
         #lanjj ADDED ON 2016-01-26 151214-00017#18  ---start---
         ON ACTION output
#            INITIALIZE report_wc TO NULL
#            FOR l_i = 1 TO g_detail_d.getLength()
#               IF g_detail_d[l_i].sel = "Y" THEN
#                  IF cl_null(report_wc) THEN 
#                     LET report_wc = "(stbadocno = '",g_detail_d[l_i].stbadocno,"'"
#                  ELSE 
#                     LET report_wc = report_wc,"OR stbadocno = '",g_detail_d[l_i].stbadocno,"' "
#                  END IF 
#               END IF
#            END FOR
#            LET report_wc = report_wc," ) AND stbaent = '",g_enterprise,"' "
#            CALL astr510_g01(report_wc)
         #lanjj ADDED ON 2016-01-26 151214-00017#18  --- end ---
         
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
 
{<section id="astp320.query" >}
#+ QBE資料查詢
PRIVATE FUNCTION astp320_query()
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
   CALL astp320_b_fill()
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
 
{<section id="astp320.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astp320_b_fill()
   #add-point:b_fill段define(客製用) name="b_fill.define_customerization"
   
   #end add-point
   DEFINE ls_wc           STRING
   #add-point:b_fill段define name="b_fill.define"
   DEFINE l_where         STRING
   DEFINE l_where1        STRING    
   #end add-point
 
   LET g_wc = g_wc, cl_sql_auth_filter()   #(ver:21) add cl_sql_auth_filter()
 
   #add-point:b_fill段sql_before name="b_fill.sql_before"
   #CALL s_aooi500_sql_where(g_prog,'stbasite') RETURNING l_where #mark by geza 20160314
   #CALL g_detail_d.clear()
   
   
   IF cl_null(g_wc) THEN 
      LET g_wc = " 1=1"
   END IF
   IF cl_null(g_stba007) THEN 
      LET l_where1 = " 1=1"
   ELSE
      LET l_where1 = " stba007='",g_stba007,"' "
   END IF
   LET g_wc = g_wc,
              " AND stba014 = '1' "
              #" AND ",l_where #mark by geza 20160314
   
   LET g_sql = "SELECT DISTINCT 'N'        ,stbaunit     ,t1.ooefl003 ,stbadocdt   ,stba007   ,stbadocno  , ",
               "                stba013    ,''           ,stba002     ,t2.pmaal004 ,stba010    , ",
               "                stba003    ,stba004      ,t4.staal003 ,stba005     ,t3.oocql004 , ",
               "                stba006     ,stba001     ,t5.ooefl003 ,stba008    , ",
               "                t6.ooag011 ,stba009      ,t7.ooefl003 ,stba011     ,t8.ooail003, ",
               "                stba012    ,t9.oodbl004  ,stbastus     ",
               "  FROM stba_t ",
               "       LEFT JOIN stbb_t  t0 ON t0.stbbent  = stbaent AND t0.stbbdocno = stbadocno ",  #add by dengdd 151014
               "       LEFT JOIN ooefl_t t1 ON t1.ooeflent = stbaent AND t1.ooefl001 = stbaunit AND t1.ooefl002 = '",g_dlang,"' ",
               "       LEFT JOIN pmaal_t t2 ON t2.pmaalent = stbaent AND t2.pmaal001 = stba002  AND t2.pmaal002 = '",g_dlang,"' ",
               "       LEFT JOIN oocql_t t3 ON t3.oocqlent = stbaent AND t3.oocql001 = '2060'   AND t3.oocql002 = stba005 AND t3.oocql003 = '",g_dlang,"' ",
               "       LEFT JOIN staal_t t4 ON t4.staalent = stbaent AND t4.staal001 = stba004  AND t4.staal002 = '",g_dlang,"' ",
               "       LEFT JOIN ooefl_t t5 ON t5.ooeflent = stbaent AND t5.ooefl001 = stba001  AND t5.ooefl002 = '",g_dlang,"' ",
               "       LEFT JOIN ooag_t  t6 ON t6.ooagent  = stbaent AND t6.ooag001  = stba008 ",
               "       LEFT JOIN ooefl_t t7 ON t7.ooeflent = stbaent AND t7.ooefl001 = stba009  AND t7.ooefl002 = '",g_dlang,"' ",
               "       LEFT JOIN ooail_t t8 ON t8.ooailent = stbaent AND t8.ooail001 = stba011  AND t8.ooail002 = '",g_dlang,"' ",
               "       LEFT JOIN (SELECT oodblent,ooef001,oodb006,oodb005,oodbl002,oodbl003,oodbl004 ",                                            #稅別說明
               "                    FROM ooef_t,oodb_t LEFT JOIN oodbl_t ON oodblent = oodbent AND oodbl001 = oodb001 AND oodbl002 = oodb002 ",
               "                   WHERE ooefent = oodblent AND ooef019 = oodbl001) t9 ",
               "              ON t9.oodblent = stbaent AND t9.ooef001 = stbaunit AND t9.oodbl002 = stba012 AND t9.oodbl003 = '",g_dlang,"' ",
               " WHERE stbaent = ? ",
               "   AND ",g_wc CLIPPED," AND ",l_where1,
               " ORDER BY stbadocno "  
   #end add-point
 
   PREPARE astp320_sel FROM g_sql
   DECLARE b_fill_curs CURSOR FOR astp320_sel
   
   CALL g_detail_d.clear()
   #add-point:b_fill段其他頁簽清空 name="b_fill.clear"
   DISPLAY "b_fill_curs[SQL] ",g_sql
   #end add-point
 
   LET g_cnt = l_ac
   LET l_ac = 1   
   ERROR "Searching!" 
 
   FOREACH b_fill_curs USING g_enterprise INTO 
   #add-point:b_fill段foreach_into name="b_fill.foreach_into"
      g_detail_d[l_ac].sel           ,g_detail_d[l_ac].stbaunit      ,g_detail_d[l_ac].stbaunit_desc ,
      g_detail_d[l_ac].stbadocdt     ,g_detail_d[l_ac].stba007       ,g_detail_d[l_ac].stbadocno     ,g_detail_d[l_ac].stba013       ,
      g_detail_d[l_ac].stba013_desc  ,g_detail_d[l_ac].stba002       ,g_detail_d[l_ac].stba002_desc  ,
      g_detail_d[l_ac].stba010       ,g_detail_d[l_ac].stba003       ,g_detail_d[l_ac].stba004       ,
      g_detail_d[l_ac].stba004_desc  ,g_detail_d[l_ac].stba005       ,g_detail_d[l_ac].stba005_desc  ,
      g_detail_d[l_ac].stba006       ,g_detail_d[l_ac].stba001       ,
      g_detail_d[l_ac].stba001_desc  ,g_detail_d[l_ac].stba008       ,g_detail_d[l_ac].stba008_desc  ,
      g_detail_d[l_ac].stba009       ,g_detail_d[l_ac].stba009_desc  ,g_detail_d[l_ac].stba011       ,
      g_detail_d[l_ac].stba011_desc  ,g_detail_d[l_ac].stba012       ,g_detail_d[l_ac].stba012_desc  ,
      g_detail_d[l_ac].stbastus      ,g_detail_d[l_ac].stbaunit 
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
      
      #end add-point
      
      CALL astp320_detail_show()      
 
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
   CALL g_detail_d.deleteElement(l_ac)   #Standard---保留彈性,要補上清除ARRAY的最後一行
   
   #end add-point
    
   LET g_detail_cnt = l_ac - 1 
   DISPLAY g_detail_cnt TO FORMONLY.h_count
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CLOSE b_fill_curs
   FREE astp320_sel
   
   LET l_ac = 1
   CALL astp320_fetch()
   #add-point:b_fill段資料填充(其他單身) name="b_fill.after_b_fill"
      
   #資料清單
   LET g_sql = "SELECT stbaunit     , t1.ooefl003, stbadocno   , stbadocdt   , stba013  , ",
               "       ''           , stba002    , t2.pmaal004 , stba010     , stba003  , ",
               "       stba004      , t3.oocql004, stba005     , t4.staal003 , stba006  , ",
               "       stba007      , stba001    , t5.ooefl003 , stba008     , t6.ooag011  , ",
               "       stba009      , t7.ooefl003, stba011     , t8.ooail003 , stba012  , ",
               "       t9.oodbl004  , stbastus   , t0.stbbseq  , t0.stbbsite  , t0.ooefl003 , t0.stbb001  , t0.stael003 , ",
               "       t0.stae003   , t0.oocql004, t0.stae004  , t0.stbb003  , t0.oodbl004 , ",
               "       t0.oodb006   , t0.stbb004 , t0.stbb005  , t0.stbb006  , t0.stbb007  , ",
               "       t0.stbb008   , t0.stbb009 , t0.stbb010  , t0.stbb011  , t0.rtaxl003 , ",
               "       t0.stbb013   , t0.stbb014 , t0.stbb017",
               "  FROM stba_t ",
               "       LEFT JOIN ( SELECT stbbent    ,stbbdocno, ",
               "                          stbbseq    ,stbbsite , t10.ooefl003, stbb001  ,t1.stael003 ,t2.stae003 ,t2.oocql004, ",
               "                          t2.stae004 ,stbb003  ,t3.oodbl004 ,t3.oodb006 ,stbb002    , ",
               "                          t4.ooail003,stbb004    ,stbb005  ,stbb006     ,stbb007    , ", 
               "                          stbb008    ,stbb014    ,stbb011  ,t5.rtaxl003 ,stbb009    , ", 
               "                          stbb010    ,stbb013    ,stbb012  ,stbbunit    ,stbb017 ",
               "                     FROM stbb_t ",
               "                          LEFT JOIN ooefl_t t10 ON t10.ooeflent = stbbent AND t10.ooefl001 = stbbsite  AND t10.ooefl002 = '",g_dlang,"' ",
               "                          LEFT JOIN stael_t t1 ON t1.staelent = stbbent AND t1.stael001 = stbb001 AND t1.stael002 = '",g_dlang,"' ",
               "                          LEFT JOIN (SELECT staeent,stae001,stae003,stae004,oocql004",
               "                                       FROM stae_t LEFT ",
               "                                            JOIN oocql_t ON oocqlent = staeent AND oocql001 = '2058' AND oocql002 = stae003 AND oocql003 = '",g_dlang,"') t2 ",
               "                                 ON t2.staeent = stbbent AND t2.stae001 = stbb001 ",
               "                          LEFT JOIN (SELECT oodblent,ooef001,oodb006,oodb005,oodbl002,oodbl003,oodbl004 ",                                            #稅別說明
               "                                       FROM ooef_t,oodb_t LEFT JOIN oodbl_t ON oodblent = oodbent AND oodbl001 = oodb001 AND oodbl002 = oodb002 ",
               "                                      WHERE ooefent = oodblent AND ooef019 = oodbl001) t3 ",
               "                                 ON t3.oodblent = stbbent AND t3.ooef001 = stbbsite AND t3.oodbl002 = stbb003 AND t3.oodbl003 = '",g_dlang,"' ",
               "                          LEFT JOIN ooail_t t4 ON t4.ooailent = stbbent AND t4.ooail001 = stbb002 AND t4.ooail002 = '",g_dlang,"' ",
               "                          LEFT JOIN rtaxl_t t5 ON t5.rtaxlent = stbbent AND t5.rtaxl001 = stbb011 AND t5.rtaxl003 = '",g_dlang,"' ",
               "                 ) t0 ",
               "              ON t0.stbbent = stbaent AND t0.stbbdocno = stbadocno ",
               "       LEFT JOIN ooefl_t t1 ON t1.ooeflent = stbaent AND t1.ooefl001 = stbaunit AND t1.ooefl002 = '",g_dlang,"' ",
               "       LEFT JOIN pmaal_t t2 ON t2.pmaalent = stbaent AND t2.pmaal001 = stba002  AND t2.pmaal002 = '",g_dlang,"' ",
               "       LEFT JOIN oocql_t t3 ON t3.oocqlent = stbaent AND t3.oocql001 = '2060'   AND t3.oocql002 = stba005 AND t3.oocql003 = '",g_dlang,"' ",
               "       LEFT JOIN staal_t t4 ON t4.staalent = stbaent AND t4.staal001 = stba004  AND t4.staal002 = '",g_dlang,"' ",
               "       LEFT JOIN ooefl_t t5 ON t5.ooeflent = stbaent AND t5.ooefl001 = stba001  AND t5.ooefl002 = '",g_dlang,"' ",
               "       LEFT JOIN ooag_t  t6 ON t6.ooagent  = stbaent AND t6.ooag001  = stba008 ",
               "       LEFT JOIN ooefl_t t7 ON t7.ooeflent = stbaent AND t7.ooefl001 = stba009  AND t7.ooefl002 = '",g_dlang,"' ",
               "       LEFT JOIN ooail_t t8 ON t8.ooailent = stbaent AND t8.ooail001 = stba011  AND t8.ooail002 = '",g_dlang,"' ",
               "       LEFT JOIN (SELECT oodblent,ooef001,oodb006,oodb005,oodbl002,oodbl003,oodbl004 ",                                            #稅別說明
               "                    FROM ooef_t,oodb_t LEFT JOIN oodbl_t ON oodblent = oodbent AND oodbl001 = oodb001 AND oodbl002 = oodb002 ",
               "                   WHERE ooefent = oodblent AND ooef019 = oodbl001) t9 ",
               "              ON t9.oodblent = stbaent AND t9.ooef001 = stbaunit AND t9.oodbl002 = stba012 AND t9.oodbl003 = '",g_dlang,"' ",
               " WHERE stbaent = ? ",
               "   AND ",g_wc CLIPPED," AND ",l_where1,
               " ORDER BY stbadocno,stbbseq "  
               
   PREPARE astp320_sel2 FROM g_sql
   DECLARE b_fill_curs2 CURSOR FOR astp320_sel2

   DISPLAY "b_fill_curs2[SQL] ",g_sql

   CALL g_detail3_d.clear()
   LET l_ac = 1
   
   FOREACH b_fill_curs2 USING g_enterprise INTO 
      g_detail3_d[l_ac].l_stbaunit      , g_detail3_d[l_ac].l_stbaunit_desc , g_detail3_d[l_ac].l_stbadocno     ,
      g_detail3_d[l_ac].l_stbadocdt     , g_detail3_d[l_ac].l_stba013       , g_detail3_d[l_ac].l_stba013_desc  ,
      g_detail3_d[l_ac].l_stba002       , g_detail3_d[l_ac].l_stba002_desc  , g_detail3_d[l_ac].l_stba010       ,
      g_detail3_d[l_ac].l_stba003       , g_detail3_d[l_ac].l_stba004       , g_detail3_d[l_ac].l_stba004_desc  ,
      g_detail3_d[l_ac].l_stba005       , g_detail3_d[l_ac].l_stba005_desc  , g_detail3_d[l_ac].l_stba006       ,
      g_detail3_d[l_ac].l_stba007       , g_detail3_d[l_ac].l_stba001       , g_detail3_d[l_ac].l_stba001_desc  ,
      g_detail3_d[l_ac].l_stba008       , g_detail3_d[l_ac].l_stba008_desc  , g_detail3_d[l_ac].l_stba009       ,
      g_detail3_d[l_ac].l_stba009_desc  , g_detail3_d[l_ac].l_stba011       , g_detail3_d[l_ac].l_stba011_desc  ,
      g_detail3_d[l_ac].l_stba012       , g_detail3_d[l_ac].l_stba012_desc  , g_detail3_d[l_ac].l_stbastus      ,
      g_detail3_d[l_ac].l_stbbseq       , g_detail3_d[l_ac].l_stbbsite      , g_detail3_d[l_ac].l_stbbsite_desc , g_detail3_d[l_ac].l_stbb001       , g_detail3_d[l_ac].l_stbb001_desc  ,
      g_detail3_d[l_ac].l_stae003_1     , g_detail3_d[l_ac].l_stae003_1_desc, g_detail3_d[l_ac].l_stae004_1     ,
      g_detail3_d[l_ac].l_stbb003       , g_detail3_d[l_ac].l_stbb003_desc  , g_detail3_d[l_ac].l_oodb006_1     ,
      g_detail3_d[l_ac].l_stbb004       , g_detail3_d[l_ac].l_stbb005       , g_detail3_d[l_ac].l_stbb006       ,
      g_detail3_d[l_ac].l_stbb007       , g_detail3_d[l_ac].l_stbb008       , g_detail3_d[l_ac].l_stbb009       ,
      g_detail3_d[l_ac].l_stbb010       , g_detail3_d[l_ac].l_stbb011       , g_detail3_d[l_ac].l_stbb011_desc  ,
      g_detail3_d[l_ac].l_stbb013       , g_detail3_d[l_ac].l_stbb014       , g_detail3_d[l_ac].l_stbb017
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
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
 
{<section id="astp320.fetch" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astp320_fetch()
   #add-point:fetch段define(客製用) name="fetch.define_customerization"
   
   #end add-point
   DEFINE li_ac           LIKE type_t.num10
   #add-point:fetch段define name="fetch.define"
   DEFINE l_stbadocno     LIKE stba_t.stbadocno
   #end add-point
   
   LET li_ac = l_ac 
   
   #add-point:單身填充後 name="fetch.after_fill"
   CALL g_detail2_d.clear()
   IF g_detail_idx = 0 THEN
      LET g_detail_idx = 1
   END IF
   LET l_stbadocno=g_detail_d[l_ac].stbadocno   #add by dengdd 151014
   
   LET g_sql = "SELECT stbbseq    ,stbb001  ,t1.stael003 ,t2.stae003 ,t2.oocql004, ",
               "       t2.stae004 ,stbb003  ,t3.oodbl004 ,t3.oodb006 ,stbb002    , ",
               "       t4.ooail003,stbb004    ,stbb005  ,stbb006     ,stbb007    , ", 
               "       stbb008    ,stbb014    ,stbb011  ,t5.rtaxl003 ,stbb009    , ", 
               "       stbb010    ,stbb013    ,stbbsite ,t7.ooefl003 ,stbb012  ,stbbunit    ,stbb017 ",
               "  FROM stbb_t ",
               "       LEFT JOIN stael_t t1 ON t1.staelent = stbbent AND t1.stael001 = stbb001 AND t1.stael002 = '",g_dlang,"' ",
               "       LEFT JOIN (SELECT staeent,stae001,stae003,stae004,oocql004",
               "                    FROM stae_t LEFT ",
               "                         JOIN oocql_t ON oocqlent = staeent AND oocql001 = '2058' AND oocql002 = stae003 AND oocql003 = '",g_dlang,"') t2 ",
               "              ON t2.staeent = stbbent AND t2.stae001 = stbb001 ",
               "       LEFT JOIN (SELECT oodblent,ooef001,oodb006,oodb005,oodbl002,oodbl003,oodbl004 ",                                            #稅別說明
               "                    FROM ooef_t,oodb_t LEFT JOIN oodbl_t ON oodblent = oodbent AND oodbl001 = oodb001 AND oodbl002 = oodb002 ",
               "                   WHERE ooefent = oodblent AND ooef019 = oodbl001) t3 ",
               "              ON t3.oodblent = stbbent AND t3.ooef001 = stbbsite AND t3.oodbl002 = stbb003 AND t3.oodbl003 = '",g_dlang,"' ",
               "       LEFT JOIN ooefl_t t7 ON t7.ooeflent = stbbent AND t7.ooefl001 = stbbsite AND t7.ooefl002 = '",g_dlang,"' ",
               "       LEFT JOIN ooail_t t4 ON t4.ooailent = stbbent AND t4.ooail001 = stbb002 AND t4.ooail002 = '",g_dlang,"' ",
               "       LEFT JOIN rtaxl_t t5 ON t5.rtaxlent = stbbent AND t5.rtaxl001 = stbb011 AND t5.rtaxl002 = '",g_dlang,"' ",
               " WHERE stbbent = ",g_enterprise,
               "   AND stbbdocno = '",l_stbadocno CLIPPED,"'",
               " ORDER BY stbbseq "
   PREPARE astp320_b_fill_pre2 FROM g_sql
   DECLARE astp320_b_fill_cur2 CURSOR FOR astp320_b_fill_pre2
   
   DISPLAY "astp320_b_fill_cur2[SQL] ",g_sql
   
   LET l_ac = 1
   
   FOREACH astp320_b_fill_cur2 INTO 
       g_detail2_d[l_ac].stbbseq       , g_detail2_d[l_ac].stbb001       , g_detail2_d[l_ac].stbb001_desc  , 
       g_detail2_d[l_ac].l_stae003     , g_detail2_d[l_ac].l_stae003_desc,# g_detail2_d[l_ac].l_oodb006     ,
       g_detail2_d[l_ac].l_stae004     , g_detail2_d[l_ac].stbb003       , g_detail2_d[l_ac].stbb003_desc  , g_detail2_d[l_ac].l_oodb006     , 
       g_detail2_d[l_ac].stbb002       , g_detail2_d[l_ac].stbb002_desc  , g_detail2_d[l_ac].stbb004       ,  
       g_detail2_d[l_ac].stbb005       , g_detail2_d[l_ac].stbb006       , g_detail2_d[l_ac].stbb007       ,  
       g_detail2_d[l_ac].stbb008       , g_detail2_d[l_ac].stbb014       , g_detail2_d[l_ac].stbb011       ,  
       g_detail2_d[l_ac].stbb011_desc  , g_detail2_d[l_ac].stbb009       , g_detail2_d[l_ac].stbb010       , 
       g_detail2_d[l_ac].stbb013       , g_detail2_d[l_ac].stbbsite      , g_detail2_d[l_ac].stbbsite_desc ,
       g_detail2_d[l_ac].stbb012       , g_detail2_d[l_ac].stbbunit      , g_detail2_d[l_ac].stbb017       


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
 
{<section id="astp320.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION astp320_detail_show()
   #add-point:show段define(客製用) name="detail_show.define_customerization"
   
   #end add-point
   #add-point:show段define name="detail_show.define"
   
   #end add-point
   
   #add-point:detail_show段 name="detail_show.detail_show"
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="astp320.filter" >}
#+ filter過濾功能
PRIVATE FUNCTION astp320_filter()
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
   
   CALL astp320_b_fill()
   
END FUNCTION
 
{</section>}
 
{<section id="astp320.filter_parser" >}
#+ filter欄位解析
PRIVATE FUNCTION astp320_filter_parser(ps_field)
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
 
{<section id="astp320.filter_show" >}
#+ Browser標題欄位顯示搜尋條件
PRIVATE FUNCTION astp320_filter_show(ps_field,ps_object)
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
   LET ls_condition = astp320_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
 
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
 
END FUNCTION
 
{</section>}
 
{<section id="astp320.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: 批次處理
# Memo...........:
# Usage..........: CALL astp320_process(p_stus)
# Input parameter: p_stus         處理狀態
# Date & Author..: 2015/05/16 By Lori
# Modify.........:
################################################################################
PRIVATE FUNCTION astp320_process(p_stus)
   DEFINE p_stus   LIKE type_t.chr30
   DEFINE li_idx   LIKE type_t.num5
   DEFINE l_cnt    LIKE type_t.num5
   DEFINE l_success      LIKE type_t.num5
   DEFINE l_errno        LIKE type_t.chr100
   DEFINE l_stbamoddt    LIKE stba_t.stbamoddt
   DEFINE l_lockcnt      LIKE type_t.num5    #計算有勾選但是被lock的筆數#170109-00037#11 by sakura add
   
   LET l_cnt = 0
   LET l_lockcnt = 0   #170109-00037#11 by sakura add
   #CALL cl_err_collect_init()   #170109-00037#11 by sakura mark
   
   FOR li_idx = 1 TO g_detail_d.getLength()
      IF g_detail_d[li_idx].sel = "Y" THEN
         LET l_cnt = l_cnt + 1
         LET l_stbamoddt=cl_get_current()
         CALL s_transaction_begin()
         
         #170109-00037#11 by sakura add(S)
         #檢查LOCK
         LET l_ac = li_idx
         CALL astp320_lock_chk()
         IF g_detail_d[li_idx].sel = "Y" THEN        
         #170109-00037#11 by sakura add(E)         
         
           CASE p_stus
              WHEN "unconf"
                 IF g_detail_d[li_idx].stbastus != 'Y' THEN
                    CALL s_transaction_end('N',0)
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = 'afa-00026'
                    LET g_errparam.extend = g_detail_d[li_idx].stbadocno
                    LET g_errparam.popup = TRUE
                    CALL cl_err()
                 ELSE
                    CALL s_astt320_conf_chk(g_detail_d[li_idx].stbadocno,'N') RETURNING l_success,l_errno
                    IF NOT l_success THEN
                       CALL s_transaction_end('N',0)
                       INITIALIZE g_errparam TO NULL
                       LET g_errparam.code = l_errno
                       LET g_errparam.extend = g_detail_d[li_idx].stbadocno
                       LET g_errparam.popup = TRUE
                       CALL cl_err()
                    ELSE
                       CALL s_astt320_conf_upd(g_detail_d[li_idx].stbadocno,'N') RETURNING l_success,l_errno
                       UPDATE stba_t SET stbacnfid = g_user,stbacnfdt=l_stbamoddt,stbastus = 'N'
                        WHERE stbaent = g_enterprise AND stbadocno = g_detail_d[li_idx].stbadocno
                       IF NOT l_success THEN
                          CALL s_transaction_end('N',0)
                          INITIALIZE g_errparam TO NULL
                          LET g_errparam.code = l_errno
                          LET g_errparam.extend = g_detail_d[li_idx].stbadocno
                          LET g_errparam.popup = TRUE
                          CALL cl_err()
                       END IF
                    END IF
                 END IF   
              WHEN "conf"
                 IF g_detail_d[li_idx].stbastus != 'N' THEN
                    CALL s_transaction_end('N',0)
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = 'afa-00024'
                    LET g_errparam.extend = g_detail_d[li_idx].stbadocno
                    LET g_errparam.popup = TRUE
                    CALL cl_err()
                 ELSE               
                    CALL s_astt320_conf_chk(g_detail_d[li_idx].stbadocno,'Y') RETURNING l_success,l_errno
                    IF NOT l_success THEN
                       CALL s_transaction_end('N',0)
                       INITIALIZE g_errparam TO NULL
                       LET g_errparam.code = l_errno
                       LET g_errparam.extend = g_detail_d[li_idx].stbadocno
                       LET g_errparam.popup = TRUE
                       CALL cl_err()
                    ELSE
                       CALL s_astt320_conf_upd(g_detail_d[li_idx].stbadocno,'Y') RETURNING l_success,l_errno
                       UPDATE stba_t SET stbacnfid = g_user,stbacnfdt=l_stbamoddt,stbastus = 'Y'
                        WHERE stbaent = g_enterprise AND stbadocno = g_detail_d[li_idx].stbadocno
                       IF NOT l_success THEN
                          CALL s_transaction_end('N',0)
                          INITIALIZE g_errparam TO NULL
                          LET g_errparam.code = l_errno
                          LET g_errparam.extend = g_detail_d[li_idx].stbadocno
                          LET g_errparam.popup = TRUE
                          CALL cl_err()
                       END IF
                    END IF
                 END IF   
              WHEN "invalid"
                 IF g_detail_d[li_idx].stbastus != 'N' THEN
                    CALL s_transaction_end('N',0)
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = 'afa-00049'
                    LET g_errparam.extend = g_detail_d[li_idx].stbadocno
                    LET g_errparam.popup = TRUE
                    CALL cl_err()
                 ELSE  
                    CALL s_astt320_conf_chk(g_detail_d[li_idx].stbadocno,'X') RETURNING l_success,l_errno
                    IF NOT l_success THEN
                       CALL s_transaction_end('N',0)
                       INITIALIZE g_errparam TO NULL
                       LET g_errparam.code = l_errno
                       LET g_errparam.extend = g_detail_d[li_idx].stbadocno
                       LET g_errparam.popup = TRUE
                       CALL cl_err()
                    ELSE
                       CALL s_astt320_conf_upd(g_detail_d[li_idx].stbadocno,'X') RETURNING l_success,l_errno
                       UPDATE stba_t SET stbacnfid = g_user,stbacnfdt=l_stbamoddt,stbastus = 'X'
                        WHERE stbaent = g_enterprise AND stbadocno = g_detail_d[li_idx].stbadocno
                       IF NOT l_success THEN
                          CALL s_transaction_end('N',0)
                          INITIALIZE g_errparam TO NULL
                          LET g_errparam.code = l_errno
                          LET g_errparam.extend = g_detail_d[li_idx].stbadocno
                          LET g_errparam.popup = TRUE
                          CALL cl_err()
                       END IF
                    END IF
                 END IF    
           END CASE

           #CALL s_transaction_end('Y',1)  #170109-00037#11 by sakura mark
        #170109-00037#11 by sakura add(S)
           CALL s_transaction_end('Y',0)
        ELSE
           LET l_lockcnt = l_lockcnt + 1   #原本有勾，但是被LOCK所以sel變回N
           CALL s_transaction_end('N',0)
        END IF
        #170109-00037#11 by sakura add(E)         
      END IF
   END FOR
   #CALL cl_err_collect_show()   #170109-00037#11 by sakura mark
   
   IF l_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'adb-00078'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
    
      #RETURN   #170109-00037#11 by sakura mark
   #170109-00037#11 by sakura add(S)
   ELSE
      IF l_cnt = l_lockcnt THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00867'   #目前選取的資料，均已被鎖定，請重新操作
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END IF
   #170109-00037#11 by sakura add(E)      
   END IF 
   
   CALL astp320_b_fill()
   
END FUNCTION

################################################################################
# Descriptions...: 插入费用单
# Memo...........:
# Usage..........: CALL astp320_astt320_insert()
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 20150910 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astp320_astt320_insert()
DEFINE l_sql       STRING 
##161111-00028#3---modify---begin-------------
#DEFINE l_stbz      RECORD LIKE stbz_t.*
#DEFINE l_stan      RECORD LIKE stan_t.*
#DEFINE l_stba      RECORD LIKE stba_t.*
#DEFINE l_stbb      RECORD LIKE stbb_t.*
DEFINE l_stbb RECORD  #費用單明細資料表
       stbbent LIKE stbb_t.stbbent, #企業編號
       stbbunit LIKE stbb_t.stbbunit, #應用組織
       stbbsite LIKE stbb_t.stbbsite, #營運據點
       stbbdocno LIKE stbb_t.stbbdocno, #單據編號
       stbbseq LIKE stbb_t.stbbseq, #項次
       stbb001 LIKE stbb_t.stbb001, #費用編號
       stbb002 LIKE stbb_t.stbb002, #幣別
       stbb003 LIKE stbb_t.stbb003, #稅別
       stbb004 LIKE stbb_t.stbb004, #價款類別
       stbb005 LIKE stbb_t.stbb005, #起始日期
       stbb006 LIKE stbb_t.stbb006, #截止日期
       stbb007 LIKE stbb_t.stbb007, #結算會計期
       stbb008 LIKE stbb_t.stbb008, #財務會計期
       stbb009 LIKE stbb_t.stbb009, #費用金額
       stbb010 LIKE stbb_t.stbb010, #承擔對象
       stbb011 LIKE stbb_t.stbb011, #所屬品類
       stbb012 LIKE stbb_t.stbb012, #所屬部門
       stbb013 LIKE stbb_t.stbb013, #結算對象
       stbb014 LIKE stbb_t.stbb014, #財務會計期別
       stbb015 LIKE stbb_t.stbb015, #納入結算單否
       stbb016 LIKE stbb_t.stbb016, #票扣否
       stbb017 LIKE stbb_t.stbb017, #備註
       stbb018 LIKE stbb_t.stbb018, #結算帳期
       stbb019 LIKE stbb_t.stbb019, #結算日期
       stbb020 LIKE stbb_t.stbb020, #日結成本類型
       stbb021 LIKE stbb_t.stbb021, #調整日期
       stbb022 LIKE stbb_t.stbb022, #商品編號
       stbb023 LIKE stbb_t.stbb023, #庫區編號
       stbb024 LIKE stbb_t.stbb024, #专柜编号
       stbb025 LIKE stbb_t.stbb025, #應收金額
       stbb026 LIKE stbb_t.stbb026, #實收金額
       stbb027 LIKE stbb_t.stbb027, #費率
       stbb028 LIKE stbb_t.stbb028, #成本金額
       stbb029 LIKE stbb_t.stbb029, #促銷銷售額
       stbb030 LIKE stbb_t.stbb030, #費用歸屬類型
       stbb031 LIKE stbb_t.stbb031, #費用歸屬組織
       stbb032 LIKE stbb_t.stbb032, #銷售數量
       stbb033 LIKE stbb_t.stbb033, #銷售單位
       stbbud001 LIKE stbb_t.stbbud001 
       END RECORD 
DEFINE l_stba RECORD  #費用單資料表
       stbaent LIKE stba_t.stbaent, #企業編號
       stbasite LIKE stba_t.stbasite, #營運據點
       stbaunit LIKE stba_t.stbaunit, #應用組織
       stbadocno LIKE stba_t.stbadocno, #單據編號
       stbadocdt LIKE stba_t.stbadocdt, #單據日期
       stba001 LIKE stba_t.stba001, #結算中心
       stba002 LIKE stba_t.stba002, #供應商編號
       stba003 LIKE stba_t.stba003, #經營方式
       stba004 LIKE stba_t.stba004, #結算方式
       stba005 LIKE stba_t.stba005, #結算類型
       stba006 LIKE stba_t.stba006, #來源類型
       stba007 LIKE stba_t.stba007, #來源單號
       stba008 LIKE stba_t.stba008, #人員
       stba009 LIKE stba_t.stba009, #部門
       stbastus LIKE stba_t.stbastus, #狀態碼
       stbaownid LIKE stba_t.stbaownid, #資料所屬者
       stbaowndp LIKE stba_t.stbaowndp, #資料所有部門
       stbacrtid LIKE stba_t.stbacrtid, #資料建立者
       stbacrtdp LIKE stba_t.stbacrtdp, #資料建立部門
       stbacrtdt LIKE stba_t.stbacrtdt, #資料創建日
       stbamodid LIKE stba_t.stbamodid, #資料修改者
       stbamoddt LIKE stba_t.stbamoddt, #最近修改日
       stbacnfid LIKE stba_t.stbacnfid, #資料確認者
       stbacnfdt LIKE stba_t.stbacnfdt, #資料確認日
       stba010 LIKE stba_t.stba010, #合約編號
       stba011 LIKE stba_t.stba011, #幣別
       stba012 LIKE stba_t.stba012, #稅別
       stba013 LIKE stba_t.stba013, #專櫃編號/鋪位編號
       stba014 LIKE stba_t.stba014, #費用類型
       stba015 LIKE stba_t.stba015, #交款狀態
       stba000 LIKE stba_t.stba000, #程式編號
       stba016 LIKE stba_t.stba016, #交款人
       stba017 LIKE stba_t.stba017, #結算帳期
       stba018 LIKE stba_t.stba018, #結算日期
       stba019 LIKE stba_t.stba019, #開始日期
       stba020 LIKE stba_t.stba020, #結束日期
       stba021 LIKE stba_t.stba021, #成本總額
       stba022 LIKE stba_t.stba022, #法人
       stba023 LIKE stba_t.stba023, #會員折扣金額
       stba024 LIKE stba_t.stba024, #no_use
       stba025 LIKE stba_t.stba025, #合約帳期
       stba026 LIKE stba_t.stba026, #計算日期
       stba027 LIKE stba_t.stba027  #促銷協議項次
       END RECORD
DEFINE l_stbz RECORD  #自營費用單匯入資料暫存表
       stbzent LIKE stbz_t.stbzent, #企業編號
       stbzsite LIKE stbz_t.stbzsite, #營運據點
       stbzdocdt LIKE stbz_t.stbzdocdt, #單據日期
       stbz001 LIKE stbz_t.stbz001, #來源單號
       stbz002 LIKE stbz_t.stbz002, #合約編號
       stbz003 LIKE stbz_t.stbz003, #費用編號
       stbz004 LIKE stbz_t.stbz004, #起始日期
       stbz005 LIKE stbz_t.stbz005, #截止日期
       stbz006 LIKE stbz_t.stbz006, #費用金額
       stbz007 LIKE stbz_t.stbz007, #備註
       stbz008 LIKE stbz_t.stbz008  #供應商編號
       END RECORD  
DEFINE l_stan RECORD  #自營合約主檔
       stanent LIKE stan_t.stanent, #企業編號
       stanunit LIKE stan_t.stanunit, #應用組織
       stan001 LIKE stan_t.stan001, #合約編號
       stan002 LIKE stan_t.stan002, #經營方式
       stan003 LIKE stan_t.stan003, #版本
       stan004 LIKE stan_t.stan004, #模板編號
       stan005 LIKE stan_t.stan005, #供應商編號
       stan006 LIKE stan_t.stan006, #幣別
       stan007 LIKE stan_t.stan007, #稅別
       stan008 LIKE stan_t.stan008, #收付款方式
       stan009 LIKE stan_t.stan009, #結算方式
       stan010 LIKE stan_t.stan010, #結算類別
       stan011 LIKE stan_t.stan011, #訂貨滿足率
       stan012 LIKE stan_t.stan012, #簽訂日期
       stan013 LIKE stan_t.stan013, #簽訂法人
       stan014 LIKE stan_t.stan014, #簽訂人員
       stan015 LIKE stan_t.stan015, #結算中心
       stan016 LIKE stan_t.stan016, #採購中心
       stan017 LIKE stan_t.stan017, #生效日期
       stan018 LIKE stan_t.stan018, #失效日期
       stan019 LIKE stan_t.stan019, #清退日期
       stan020 LIKE stan_t.stan020, #作廢日期
       stan021 LIKE stan_t.stan021, #檔案編號
       stanownid LIKE stan_t.stanownid, #資料所有者
       stanowndp LIKE stan_t.stanowndp, #資料所有部門
       stancrtid LIKE stan_t.stancrtid, #資料建立者
       stancrtdp LIKE stan_t.stancrtdp, #資料建立部門
       stancrtdt LIKE stan_t.stancrtdt, #資料創建日
       stanmodid LIKE stan_t.stanmodid, #資料修改者
       stanmoddt LIKE stan_t.stanmoddt, #最近修改日
       stanstus LIKE stan_t.stanstus, #狀態碼
       stancnfid LIKE stan_t.stancnfid, #資料確認者
       stancnfdt LIKE stan_t.stancnfdt, #資料確認日
       stan022 LIKE stan_t.stan022, #交易條件
       stan023 LIKE stan_t.stan023, #發票類型
       stan024 LIKE stan_t.stan024, #採購價格允許人工修改
       stan025 LIKE stan_t.stan025, #修改容差率
       stan026 LIKE stan_t.stan026, #超出處理方式
       stan027 LIKE stan_t.stan027, #內外購
       stan028 LIKE stan_t.stan028, #匯率計算基準
       stan029 LIKE stan_t.stan029, #合約狀態
       stan030 LIKE stan_t.stan030, #原合約編號
       stan031 LIKE stan_t.stan031, #延期日期
       stan032 LIKE stan_t.stan032, #收銀方式
       stan033 LIKE stan_t.stan033, #續期日期
       stan034 LIKE stan_t.stan034, #文本盖章否
       stan035 LIKE stan_t.stan035, #蓋章日期
       stan036 LIKE stan_t.stan036, #備註
       stan037 LIKE stan_t.stan037, #含發票否
       stan038 LIKE stan_t.stan038, #部門
       stan039 LIKE stan_t.stan039  #按法人結算
       END RECORD       
##161111-00028#3---modify---end-------------
DEFINE l_bdate     LIKE type_t.dat
DEFINE l_success   LIKE type_t.num5
DEFINE r_success   LIKE type_t.num5
DEFINE r_doctype   LIKE rtai_t.rtai004
DEFINE l_stbastus  LIKE stba_t.stbastus
DEFINE l_stbz002   LIKE stbz_t.stbz002
DEFINE r_stau004   LIKE stau_t.stau004
DEFINE r_period    LIKE type_t.num5
DEFINE r_period2   LIKE type_t.num5
DEFINE l_stbzdocdt LIKE stbz_t.stbzdocdt
   WHENEVER ERROR CONTINUE
   
   CALL s_transaction_begin()
   CALL cl_err_collect_init()
   LET l_success = TRUE
   LET l_sql = " SELECT DISTINCT stbz002,stbzdocdt FROM stbz_t ",
               "  WHERE stbzent = ",g_enterprise,
               "    AND stbz001 = '",g_time,"'"
   PREPARE sel_stbz FROM l_sql
   DECLARE sel_stbz_cs CURSOR FOR sel_stbz
   LET g_cnt1 = 0
   INITIALIZE l_stbz002 TO NULL 
   INITIALIZE l_stbzdocdt TO NULL 
   FOREACH sel_stbz_cs INTO l_stbz002,l_stbzdocdt
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = 'foreach:' 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET l_success = FALSE
         EXIT FOREACH
      END IF
      #SELECT * INTO l_stan.*  ##161111-00028#3--mark
      #161111-00028#3---add---begin-----------
      SELECT stanent,stanunit,stan001,stan002,stan003,stan004,stan005,stan006,stan007,stan008,stan009,
             stan010,stan011,stan012,stan013,stan014,stan015,stan016,stan017,stan018,stan019,stan020,
             stan021,stanownid,stanowndp,stancrtid,stancrtdp,stancrtdt,stanmodid,stanmoddt,stanstus,
             stancnfid,stancnfdt,stan022,stan023,stan024,stan025,stan026,stan027,stan028,stan029,
             stan030,stan031,stan032,stan033,stan034,stan035,stan036,stan037,stan038,stan039 INTO l_stan.*  
      #161111-00028#3---add---end-------------
        FROM stan_t
       WHERE stanent = g_enterprise
         AND stan001 = l_stbz002        
      #费用单单头栏位赋值
      INITIALIZE l_stba.* TO NULL
      LET l_stba.stbaownid = g_user
      LET l_stba.stbaowndp = g_dept
      LET l_stba.stbacrtid = g_user
      LET l_stba.stbacrtdp = g_dept 
      LET l_stba.stbacrtdt = cl_get_current()
      LET l_stba.stbamodid = g_user
      LET l_stba.stbamoddt = cl_get_current()
      LET l_stba.stbastus = 'N'
      LET l_stba.stbaent = g_enterprise
      #LET l_stba.stbasite = l_stan.stanunit #mark by geza 20160229
      #LET l_stba.stbaunit = l_stan.stanunit #mark by geza 20160229
      LET l_stba.stbasite = l_stan.stan015 #add by geza 20160229
      LET l_stba.stbaunit = l_stan.stan015 #add by geza 20160229
      #add by geza 20160229(S)
      #抓取结算法人
      SELECT ooef017 INTO l_stba.stba022
        FROM ooef_t
       WHERE ooefent=g_enterprise
         AND ooef001=l_stba.stbaunit
      #add by geza 20160229(E)
      IF l_stbzdocdt IS NOT NULL THEN
         LET l_stba.stbadocdt = l_stbzdocdt
      ELSE
         LET l_stba.stbadocdt = g_today
      END IF   
      ##預設單據的單別
      LET r_success = ''
      LET r_doctype = ''
      CALL s_arti200_get_def_doc_type(l_stba.stbasite,'astt320','1')
           RETURNING r_success,r_doctype
      LET l_stba.stbadocno = r_doctype
      CALL s_aooi200_gen_docno(l_stba.stbasite,l_stba.stbadocno,l_stba.stbadocdt,'astt320') RETURNING r_success,l_stba.stbadocno  
      IF NOT r_success THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'apm-00003'
         LET g_errparam.extend = l_stba.stbadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET l_success = FALSE
         EXIT FOREACH              
      END IF 
      LET l_stba.stba001 = l_stan.stan015    #結算中心
      LET l_stba.stba002 = l_stan.stan005    #供應商編號 
      LET l_stba.stba003 = l_stan.stan002    #經營方式
      LET l_stba.stba004 = l_stan.stan009    #結算方式
      LET l_stba.stba005 = l_stan.stan010    #結算類型
      LET l_stba.stba006 = '1'               #來源類型
      LET l_stba.stba007 = g_time            #來源單號
      LET l_stba.stba008 = l_stan.stan014    #人員
      LET l_stba.stba009 = l_stan.stan038    #部門    
      LET l_stba.stba010 = l_stan.stan001    #合同編號
      LET l_stba.stba011 = l_stan.stan006    #幣別
      LET l_stba.stba012 = l_stan.stan007    #稅別
      LET l_stba.stba013 = ''                #專櫃編號
      LET l_stba.stba014 = '1'               #費用類型
      LET l_stba.stba015 = ''                #交款狀態
      LET l_stba.stba016 = ''                #交款人
      LET l_stba.stba000 = 'astt320'         #程式編號
     #INSERT INTO stba_t VALUES(l_stba.*)  #161111-00028#3--mark
     #161111-00028#3---add---begin--------
      INSERT INTO stba_t (stbaent,stbasite,stbaunit,stbadocno,stbadocdt,stba001,stba002,stba003,stba004,stba005,stba006,stba007,
                          stba008,stba009,stbastus,stbaownid,stbaowndp,stbacrtid,stbacrtdp,stbacrtdt,stbamodid,stbamoddt,
                          stbacnfid,stbacnfdt,stba010,stba011,stba012,stba013,stba014,stba015,stba000,stba016,stba017,
                          stba018,stba019,stba020,stba021,stba022,stba023,stba024,stba025,stba026,stba027)
       VALUES (l_stba.stbaent,l_stba.stbasite,l_stba.stbaunit,l_stba.stbadocno,l_stba.stbadocdt,l_stba.stba001,l_stba.stba002,l_stba.stba003,l_stba.stba004,l_stba.stba005,l_stba.stba006,l_stba.stba007,
               l_stba.stba008,l_stba.stba009,l_stba.stbastus,l_stba.stbaownid,l_stba.stbaowndp,l_stba.stbacrtid,l_stba.stbacrtdp,l_stba.stbacrtdt,l_stba.stbamodid,l_stba.stbamoddt,
               l_stba.stbacnfid,l_stba.stbacnfdt,l_stba.stba010,l_stba.stba011,l_stba.stba012,l_stba.stba013,l_stba.stba014,l_stba.stba015,l_stba.stba000,l_stba.stba016,l_stba.stba017,
               l_stba.stba018,l_stba.stba019,l_stba.stba020,l_stba.stba021,l_stba.stba022,l_stba.stba023,l_stba.stba024,l_stba.stba025,l_stba.stba026,l_stba.stba027)
     #161111-00028#3---add---end----------
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = " INTO stba_t "
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET l_success = FALSE
         EXIT FOREACH   
      END IF
      LET g_cnt1 = g_cnt1 + 1
      INITIALIZE l_stbz.* TO NULL
      LET g_deteal_cnt = 0
     #LET l_sql = " SELECT * FROM stbz_t ",  #161111-00028#3--mark
     #161111-00028#3--add----begin----------
      LET l_sql = " SELECT stbzent,stbzsite,stbzdocdt,stbz001,stbz002,stbz003,stbz004,stbz005,stbz006,",
                  " stbz007,stbz008 FROM stbz_t ",
     #161111-00028#3--add----end------------
                  "  WHERE stbzent = ",g_enterprise,
                  "    AND stbz002 = '",l_stbz002,"'",
                  "    AND stbz001 = '",g_time,"'"
      IF l_stbzdocdt IS NOT NULL THEN
         LET l_sql=l_sql," AND stbzdocdt = '",l_stbzdocdt,"'"
      ELSE
         LET l_sql=l_sql," AND stbzdocdt IS NULL "
      END IF              
      PREPARE sel_stbz1 FROM l_sql
      DECLARE sel_stbz_cs1 CURSOR FOR sel_stbz1         
      FOREACH sel_stbz_cs1 INTO l_stbz.*
         #写入费用单---start----
         INITIALIZE l_stbb.* TO NULL
         LET l_stbb.stbbent = g_enterprise      #企业编号
         LET l_stbb.stbbunit = l_stba.stbaunit  #制定组织
         LET l_stbb.stbbsite = l_stbz.stbzsite  #营运组织
         LET l_stbb.stbbdocno = l_stba.stbadocno#单据编号
         SELECT MAX(stbbseq) + 1 INTO l_stbb.stbbseq  #项次
           FROM stbb_t 
          WHERE stbbent = g_enterprise
            AND stbbdocno = l_stba.stbadocno
         IF cl_null(l_stbb.stbbseq) THEN 
            LET l_stbb.stbbseq = 1
         END IF 
         LET l_stbb.stbb001 = l_stbz.stbz003    #费用编号
         LET l_stbb.stbb002 = l_stba.stba011    #幣別
         
         SELECT stae006  INTO l_stbb.stbb004    #價款類別
           FROM stae_t 
          WHERE staeent=g_enterprise  
            AND stae001=l_stbb.stbb001               
         LET l_stbb.stbb005 = l_stbz.stbz004    #开始日期
         LET l_stbb.stbb006 = l_stbz.stbz005    #截止日期
         
         CALL s_asti206_get_period(l_stbb.stbb005,l_stbb.stbb006,l_stba.stba001,'astt320')
         RETURNING r_success,r_stau004,r_period,r_period2
         
         LET l_stbb.stbb007=r_stau004           #结算会计期
         LET l_stbb.stbb008=r_period            #财务会计期
         LET l_stbb.stbb014=r_period2           #财务会计期别
         LET l_stbb.stbb009=l_stbz.stbz006      #费用金额 
         LET l_stbb.stbb010 = '1'               #承擔對象
         SELECT DISTINCT staq003                #所屬品類
           INTO l_stbb.stbb011 
           FROM staq_t 
          WHERE staqent = g_enterprise 
            AND staq001 = l_stba.stba010 
            AND staq005 = 'Y' 
         LET l_stbb.stbb012 = l_stan.stan038    #所屬部門
         LET l_stbb.stbb013 = '1'               #結算對象
         
         #抓取纳入结算单否,票扣否    
         CALL s_astt301_get_stak023_stak024(l_stan.stan037,l_stbb.stbb001)  RETURNING  l_stbb.stbb015,l_stbb.stbb016   
         LET l_stbb.stbb017 = l_stbz.stbz007    #备注   #add by dengdd 15/11/3
        
         #票扣否=Y，税带合同里面的，票扣否=N，税带费用编号asti203里面的   
         IF l_stbb.stbb016='Y' THEN 
            SELECT stan007 INTO l_stbb.stbb003
              FROM stan_t
             WHERE stanent=g_enterprise
               AND stan001=l_stba.stba010
         ELSE
             SELECT stae010 INTO l_stbb.stbb003
              FROM stae_t
             WHERE staeent = g_enterprise
               AND stae001 = l_stbb.stbb001 
         END IF
         
         #根据开始日期结束日期抓取结算账期和结算日期
         CALL s_expense_get_stbb019(l_stba.stba010,l_stbb.stbb005,l_stbb.stbb006,l_stba.stbasite) 
            RETURNING  l_stbb.stbb018,l_stbb.stbb019  
         
         SELECT stan037 INTO l_stbb.stbbud001
           FROM stan_t
          WHERE stanent=g_enterprise
            AND stan001=l_stba.stba010
            
         CALL s_curr_round(l_stba.stbasite,l_stbb.stbb002,l_stbb.stbb009,'2') RETURNING l_stbb.stbb009  
         
         #INSERT INTO stbb_t VALUES(l_stbb.*)  #161111-00028#3--mark
         #161111-00028#3--add----begin----------
         INSERT INTO stbb_t (stbbent,stbbunit,stbbsite,stbbdocno,stbbseq,stbb001,stbb002,stbb003,stbb004,
                          stbb005,stbb006,stbb007,stbb008,stbb009,stbb010,stbb011,stbb012,stbb013,stbb014,
                          stbb015,stbb016,stbb017,stbb018,stbb019,stbb020,stbb021,stbb022,stbb023,stbb024,
                          stbb025,stbb026,stbb027,stbb028,stbb029,stbb030,stbb031,stbb032,stbb033,stbbud001)
         VALUES(l_stbb.stbbent,l_stbb.stbbunit,l_stbb.stbbsite,l_stbb.stbbdocno,l_stbb.stbbseq,l_stbb.stbb001,l_stbb.stbb002,l_stbb.stbb003,l_stbb.stbb004,
               l_stbb.stbb005,l_stbb.stbb006,l_stbb.stbb007,l_stbb.stbb008,l_stbb.stbb009,l_stbb.stbb010,l_stbb.stbb011,l_stbb.stbb012,l_stbb.stbb013,l_stbb.stbb014,
               l_stbb.stbb015,l_stbb.stbb016,l_stbb.stbb017,l_stbb.stbb018,l_stbb.stbb019,l_stbb.stbb020,l_stbb.stbb021,l_stbb.stbb022,l_stbb.stbb023,l_stbb.stbb024,
               l_stbb.stbb025,l_stbb.stbb026,l_stbb.stbb027,l_stbb.stbb028,l_stbb.stbb029,l_stbb.stbb030,l_stbb.stbb031,l_stbb.stbb032,l_stbb.stbb033,l_stbb.stbbud001)
         #161111-00028#3--add----end------------
     
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = " INTO stbb_t "
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH   
         END IF
         #写入费用单----end-----
         LET g_deteal_cnt = g_deteal_cnt + 1
      END FOREACH 
      IF g_deteal_cnt = 0 THEN 
         #删除费用单单头表
         DELETE FROM stba_t WHERE stbaent = g_enterprise AND stbadocno = l_stba.stbadocno
         LET g_cnt1 = g_cnt1 - 1
      END IF 
      IF NOT l_success THEN 
         EXIT FOREACH 
      END IF 
   END FOREACH 
   IF l_success THEN 
      CALL cl_err_collect_show()
      CALL s_transaction_end('Y','0')
      RETURN TRUE
   ELSE
      CALL cl_err_collect_show()
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF 
END FUNCTION

################################################################################
# Descriptions...: 检查导入资料是否为空
# Memo...........:
# Usage..........: CALL astp320_astt320_check()
#                  RETURNING 回传参数
# Date & Author..: 20150921 By geza
# Modify.........:
################################################################################
PRIVATE FUNCTION astp320_astt320_check()
#DEFINE l_stbz      RECORD LIKE stbz_t.*  #161111-00028#3--mark
#161111-00028#3--add---begin-------
DEFINE l_stbz RECORD  #自營費用單匯入資料暫存表
       stbzent LIKE stbz_t.stbzent, #企業編號
       stbzsite LIKE stbz_t.stbzsite, #營運據點
       stbzdocdt LIKE stbz_t.stbzdocdt, #單據日期
       stbz001 LIKE stbz_t.stbz001, #來源單號
       stbz002 LIKE stbz_t.stbz002, #合約編號
       stbz003 LIKE stbz_t.stbz003, #費用編號
       stbz004 LIKE stbz_t.stbz004, #起始日期
       stbz005 LIKE stbz_t.stbz005, #截止日期
       stbz006 LIKE stbz_t.stbz006, #費用金額
       stbz007 LIKE stbz_t.stbz007, #備註
       stbz008 LIKE stbz_t.stbz008  #供應商編號
       END RECORD
#161111-00028#3--add---end---------
DEFINE l_cnt       LIKE type_t.num10
DEFINE r_success   LIKE type_t.num5  
DEFINE l_sql       STRING 
DEFINE l_stan001   LIKE stan_t.stan001
   LET r_success = TRUE
   #更新单据日期为空的资料，单据日期为今天
   UPDATE stbz_t SET stbzdocdt = g_today
    WHERE stbzent = g_enterprise
      AND stbzdocdt IS NULL
      AND stbz001 = g_time
   IF SQLCA.SQLcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success=FALSE
      RETURN r_success
   END IF          
   CALL cl_err_collect_init()   
   INITIALIZE l_stbz.* TO NULL
  #LET l_sql = " SELECT * FROM stbz_t ",  #161111-00028#3--mark
   LET l_sql = " SELECT stbzent,stbzsite,stbzdocdt,stbz001,stbz002,stbz003,stbz004,stbz005,stbz006,stbz007,stbz008 FROM stbz_t ",  #161111-00028#3--add
               "  WHERE stbzent = ",g_enterprise,
               "    AND stbz001 = '",g_time,"'"
   PREPARE sel_stb_chk FROM l_sql
   DECLARE sel_stb_chk_cs CURSOR FOR sel_stb_chk
   
   FOREACH sel_stb_chk_cs INTO l_stbz.*
      IF l_stbz.stbzsite IS NULL THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00465'
         LET g_errparam.extend = l_stbz.stbzdocdt
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success=FALSE
      END IF
      #mark by geza 20160303(S)
#      IF l_stbz.stbz002 IS NULL THEN
#         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'ast-00547'
#         LET g_errparam.extend = l_stbz.stbzdocdt
#         LET g_errparam.popup = TRUE
#         CALL cl_err()
#         LET r_success=FALSE
#      END IF
      #mark by geza 20160303(E)
      IF l_stbz.stbz003 IS NULL THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00467'
         LET g_errparam.extend = l_stbz.stbzdocdt
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success=FALSE
      END IF
      IF l_stbz.stbz004 IS NULL THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00468'
         LET g_errparam.extend = l_stbz.stbzdocdt
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success=FALSE
      END IF
      IF l_stbz.stbz005 IS NULL THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00469'
         LET g_errparam.extend = l_stbz.stbzdocdt
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success=FALSE
      END IF
      IF l_stbz.stbz006 IS NULL THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00470'
         LET g_errparam.extend = l_stbz.stbzdocdt
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success=FALSE
      END IF
      #add by geza 20160303(S)
      #供应商不能为空
      IF l_stbz.stbz008 IS NULL THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00235'
         LET g_errparam.extend = l_stbz.stbzdocdt
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success=FALSE
      END IF
      #如果合同和供应商都不为空，则判断合同和供应商是否对应
      IF l_stbz.stbz008 IS NOT NULL AND l_stbz.stbz002 IS NOT NULL THEN
         LET l_cnt = 0
         SELECT COUNT(*) INTO l_cnt 
           FROM stan_t
          WHERE stanent = g_enterprise
            AND stan001 = l_stbz.stbz002
            AND stan005 = l_stbz.stbz008
            AND stanstus = 'Y'
            AND stan029 IN ('2','3','4','6')
         IF l_cnt < 1 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'ast-00316'
            LET g_errparam.extend = l_stbz.stbz008
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success=FALSE
         END IF
      END IF
      #如果合同为空，则根据供应商抓取合同，供应商对应的合同如果不为1笔则报错
      IF l_stbz.stbz002 IS NULL THEN
         IF l_stbz.stbz008 IS NOT NULL THEN
            LET l_cnt = 0 
            SELECT COUNT(*) INTO l_cnt 
              FROM stan_t
             WHERE stanent = g_enterprise
               AND stan005 = l_stbz.stbz008
               AND stanstus = 'Y'
               AND stan029 IN ('2','3','4','6')
            IF l_cnt > 1 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'ast-00549'
               LET g_errparam.extend = l_stbz.stbzdocdt
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = l_stbz.stbz008
               CALL cl_err()
               LET r_success=FALSE
            END IF
            IF l_cnt = 1 THEN
               INITIALIZE l_stan001 TO NULL
               SELECT stan001 INTO l_stan001
                 FROM stan_t 
                WHERE stanent = g_enterprise
                  AND stanstus = 'Y'
                  AND stan029 IN ('2','3','4','6')
               #更新合同栏位              
               UPDATE stbz_t SET stbz002 = l_stan001
                WHERE stbzent = g_enterprise
                  AND stbz002 IS NULL
                  AND stbz008 = l_stbz.stbz008 
                  AND stbz001 = g_time
               IF SQLCA.SQLcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET r_success=FALSE
                  RETURN r_success
               END IF   
            END IF
            IF l_cnt < 1 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'ast-00550'
               LET g_errparam.extend = l_stbz.stbzdocdt
               LET g_errparam.popup = TRUE
               LET g_errparam.replace[1] = l_stbz.stbz008
               CALL cl_err()
               LET r_success=FALSE 
            END IF            
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'ast-00547'
            LET g_errparam.extend = l_stbz.stbzdocdt
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success=FALSE        
         END IF   
      END IF
      #add by geza 20160303(E)
      #判断营运组织是否有效
      LET l_cnt = 0
      SELECT COUNT(*) INTO l_cnt
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = l_stbz.stbzsite
      IF l_cnt <= 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aoo-00094'
         LET g_errparam.extend = l_stbz.stbzsite
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success=FALSE
      ELSE
         LET l_cnt = 0
         SELECT COUNT(*) INTO l_cnt
           FROM ooef_t
          WHERE ooefent = g_enterprise
            AND ooef001 = l_stbz.stbzsite
            AND ooefstus = 'Y'
         IF l_cnt <= 0 THEN
            INITIALIZE g_errparam TO NULL
#            LET g_errparam.code = 'aoo-00095'   #160318-00005#44  mark
            LET g_errparam.code = 'sub-01302'   #160318-00005#44  add
            LET g_errparam.extend = l_stbz.stbzsite
            #160318-00005#44 --s add
            LET g_errparam.replace[1] = 'aooi125'
            LET g_errparam.replace[2] = cl_get_progname('aooi125',g_lang,"2")
            LET g_errparam.exeprog = 'aooi125'
            #160318-00005#44 --e add
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success=FALSE
         END IF                
      END IF 
      #判断合同是否有效
      IF l_stbz.stbz002 IS NOT NULL THEN
         LET l_cnt = 0
         SELECT COUNT(*) INTO l_cnt
           FROM stan_t 
          WHERE stanent = g_enterprise 
            AND stan001 = l_stbz.stbz002
         IF l_cnt <= 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'aap-00438'
            LET g_errparam.extend = l_stbz.stbz002
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success=FALSE
         ELSE
            LET l_cnt = 0
            SELECT COUNT(*) INTO l_cnt
              FROM stan_t 
             WHERE stanent = g_enterprise 
               AND stan001 = l_stbz.stbz002
               AND stanstus = 'Y'
            IF l_cnt <= 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'ast-00548'
               LET g_errparam.extend = l_stbz.stbz002
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_success=FALSE
            END IF                
         END IF
      END IF   
      #判断费用编号是否有效
      LET l_cnt = 0
      SELECT COUNT(*) INTO l_cnt
        FROM stae_t
       WHERE staeent = g_enterprise 
         AND stae001 = l_stbz.stbz003
      IF l_cnt <= 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00001'
         LET g_errparam.extend = l_stbz.stbz003
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success=FALSE
      ELSE
         LET l_cnt = 0
         SELECT COUNT(*) INTO l_cnt
           FROM stae_t
          WHERE staeent = g_enterprise 
            AND stae001 = l_stbz.stbz003
            AND staestus = 'Y'
         IF l_cnt <= 0 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = 'ast-00002'
            LET g_errparam.extend = l_stbz.stbz003
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET r_success=FALSE
         END IF                
      END IF 
      #判断开始日期不能大于结束日期
      IF l_stbz.stbz004 > l_stbz.stbz005 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'amm-00080'
         LET g_errparam.extend = l_stbz.stbzdocdt
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success=FALSE
      END IF
   END FOREACH
   CALL cl_err_collect_show()
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
# Date & Author..: 15/11/23 By dengdd
# Modify.........:
################################################################################
PRIVATE FUNCTION astp320_p_delete()
DEFINE li_ac     LIKE type_t.num5
DEFINE l_success LIKE type_t.num5
DEFINE l_cnt     LIKE type_t.num5


       WHENEVER ERROR CONTINUE
       
       CALL s_transaction_begin()
       CALL cl_err_collect_init()
       LET l_success = TRUE
       LET l_cnt = 0 
       
       FOR li_ac=1 TO g_detail_d.getlength()
         IF g_detail_d[li_ac].sel='Y' THEN
           LET l_cnt=l_cnt+1
           IF g_detail_d[li_ac].stbastus<>'N' THEN
              INITIALIZE g_errparam TO NULL
              LET g_errparam.code = "amh-00622"
              LET g_errparam.extend = g_detail_d[li_ac].stbadocno
              LET g_errparam.popup = TRUE
              CALL cl_err()
              LET l_success = FALSE
           ELSE
              DELETE FROM stba_t WHERE stbaent=g_enterprise
                                   AND stbadocno=g_detail_d[li_ac].stbadocno
              IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = g_detail_d[li_ac].stbadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE  
              END IF 
              
              DELETE FROM stbb_t WHERE stbbent=g_enterprise
                                   AND stbbdocno=g_detail_d[li_ac].stbadocno
              IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = g_detail_d[li_ac].stbadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE  
              END IF                            
           END IF
         END IF           
      END FOR
      
      IF l_cnt = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'adb-00078'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET l_success = FALSE
      END IF 
       
      IF l_success THEN 
          CALL cl_err_collect_show()
          CALL s_transaction_end('Y','0')
          RETURN
      ELSE
          CALL cl_err_collect_show()
          CALL s_transaction_end('N','0')
          RETURN
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
PRIVATE FUNCTION astp320_excel()
DEFINE p_rtdudocno LIKE rtdu_t.rtdudocno
DEFINE l_time      DATETIME YEAR TO SECOND
   DEFINE ls_str        STRING,
          ls_file       STRING,
          ls_location   STRING
   DEFINE l_success     LIKE type_t.chr1
   DEFINE l_suc         LIKE type_t.chr1
   DEFINE l_path   STRING
   DEFINE xlapp,iRes,iRow,i,j     INTEGER
   DEFINE sValue                  STRING
   DEFINE gs_location   STRING
   DEFINE g_fileloc               STRING
   DEFINE p_row,p_col,l_n         SMALLINT
   DEFINE l_msg        STRING
   DEFINE l_msg1       STRING #lanjj add on 2016-03-30
   DEFINE l_cnt         LIKE type_t.num10
   DEFINE l_stan006  LIKE stan_t.stan006
   DEFINE l_stan007  LIKE stan_t.stan007
   DEFINE l_stan013  LIKE stan_t.stan013
   DEFINE l_count   LIKE rtdv_t.rtdv019   #進價*訂貨數(計稅基礎)  
   DEFINE l_imaa114   LIKE imaa_t.imaa114 
   DEFINE l_imaa124   LIKE imaa_t.imaa124 
   DEFINE g_oodb011   LIKE oodb_t.oodb011
   DEFINE l_str             STRING 
   DEFINE l_sql             STRING 
   DEFINE l_oofg_return   DYNAMIC ARRAY OF RECORD
         oofg019       LIKE oofg_t.oofg019,  #field
         oofg020       LIKE oofg_t.oofg020   #value
                           END RECORD
#161111-00028#3--modify----begin----------                           
#DEFINE l_stba      RECORD LIKE stba_t.*
#DEFINE l_stbb      RECORD LIKE stbb_t.*
DEFINE l_stbb RECORD  #費用單明細資料表
       stbbent LIKE stbb_t.stbbent, #企業編號
       stbbunit LIKE stbb_t.stbbunit, #應用組織
       stbbsite LIKE stbb_t.stbbsite, #營運據點
       stbbdocno LIKE stbb_t.stbbdocno, #單據編號
       stbbseq LIKE stbb_t.stbbseq, #項次
       stbb001 LIKE stbb_t.stbb001, #費用編號
       stbb002 LIKE stbb_t.stbb002, #幣別
       stbb003 LIKE stbb_t.stbb003, #稅別
       stbb004 LIKE stbb_t.stbb004, #價款類別
       stbb005 LIKE stbb_t.stbb005, #起始日期
       stbb006 LIKE stbb_t.stbb006, #截止日期
       stbb007 LIKE stbb_t.stbb007, #結算會計期
       stbb008 LIKE stbb_t.stbb008, #財務會計期
       stbb009 LIKE stbb_t.stbb009, #費用金額
       stbb010 LIKE stbb_t.stbb010, #承擔對象
       stbb011 LIKE stbb_t.stbb011, #所屬品類
       stbb012 LIKE stbb_t.stbb012, #所屬部門
       stbb013 LIKE stbb_t.stbb013, #結算對象
       stbb014 LIKE stbb_t.stbb014, #財務會計期別
       stbb015 LIKE stbb_t.stbb015, #納入結算單否
       stbb016 LIKE stbb_t.stbb016, #票扣否
       stbb017 LIKE stbb_t.stbb017, #備註
       stbb018 LIKE stbb_t.stbb018, #結算帳期
       stbb019 LIKE stbb_t.stbb019, #結算日期
       stbb020 LIKE stbb_t.stbb020, #日結成本類型
       stbb021 LIKE stbb_t.stbb021, #調整日期
       stbb022 LIKE stbb_t.stbb022, #商品編號
       stbb023 LIKE stbb_t.stbb023, #庫區編號
       stbb024 LIKE stbb_t.stbb024, #专柜编号
       stbb025 LIKE stbb_t.stbb025, #應收金額
       stbb026 LIKE stbb_t.stbb026, #實收金額
       stbb027 LIKE stbb_t.stbb027, #費率
       stbb028 LIKE stbb_t.stbb028, #成本金額
       stbb029 LIKE stbb_t.stbb029, #促銷銷售額
       stbb030 LIKE stbb_t.stbb030, #費用歸屬類型
       stbb031 LIKE stbb_t.stbb031, #費用歸屬組織
       stbb032 LIKE stbb_t.stbb032, #銷售數量
       stbb033 LIKE stbb_t.stbb033, #銷售單位
       stbbud001 LIKE stbb_t.stbbud001 
       END RECORD 
DEFINE l_stba RECORD  #費用單資料表
       stbaent LIKE stba_t.stbaent, #企業編號
       stbasite LIKE stba_t.stbasite, #營運據點
       stbaunit LIKE stba_t.stbaunit, #應用組織
       stbadocno LIKE stba_t.stbadocno, #單據編號
       stbadocdt LIKE stba_t.stbadocdt, #單據日期
       stba001 LIKE stba_t.stba001, #結算中心
       stba002 LIKE stba_t.stba002, #供應商編號
       stba003 LIKE stba_t.stba003, #經營方式
       stba004 LIKE stba_t.stba004, #結算方式
       stba005 LIKE stba_t.stba005, #結算類型
       stba006 LIKE stba_t.stba006, #來源類型
       stba007 LIKE stba_t.stba007, #來源單號
       stba008 LIKE stba_t.stba008, #人員
       stba009 LIKE stba_t.stba009, #部門
       stbastus LIKE stba_t.stbastus, #狀態碼
       stbaownid LIKE stba_t.stbaownid, #資料所屬者
       stbaowndp LIKE stba_t.stbaowndp, #資料所有部門
       stbacrtid LIKE stba_t.stbacrtid, #資料建立者
       stbacrtdp LIKE stba_t.stbacrtdp, #資料建立部門
       stbacrtdt LIKE stba_t.stbacrtdt, #資料創建日
       stbamodid LIKE stba_t.stbamodid, #資料修改者
       stbamoddt LIKE stba_t.stbamoddt, #最近修改日
       stbacnfid LIKE stba_t.stbacnfid, #資料確認者
       stbacnfdt LIKE stba_t.stbacnfdt, #資料確認日
       stba010 LIKE stba_t.stba010, #合約編號
       stba011 LIKE stba_t.stba011, #幣別
       stba012 LIKE stba_t.stba012, #稅別
       stba013 LIKE stba_t.stba013, #專櫃編號/鋪位編號
       stba014 LIKE stba_t.stba014, #費用類型
       stba015 LIKE stba_t.stba015, #交款狀態
       stba000 LIKE stba_t.stba000, #程式編號
       stba016 LIKE stba_t.stba016, #交款人
       stba017 LIKE stba_t.stba017, #結算帳期
       stba018 LIKE stba_t.stba018, #結算日期
       stba019 LIKE stba_t.stba019, #開始日期
       stba020 LIKE stba_t.stba020, #結束日期
       stba021 LIKE stba_t.stba021, #成本總額
       stba022 LIKE stba_t.stba022, #法人
       stba023 LIKE stba_t.stba023, #會員折扣金額
       stba024 LIKE stba_t.stba024, #no_use
       stba025 LIKE stba_t.stba025, #合約帳期
       stba026 LIKE stba_t.stba026, #計算日期
       stba027 LIKE stba_t.stba027  #促銷協議項次
       END RECORD
#161111-00028#3--modify----end----------
   DEFINE l_stae010  LIKE stae_t.stae010
   define l_stbb018  like stbb_t.stbb018
   DEFINE l_m   INT
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_doctype     LIKE rtai_t.rtai004
   DEFINE r_stau004    LIKE stau_t.stau004
   DEFINE r_period     LIKE type_t.num5
   DEFINE r_period2    LIKE type_t.num5
   DEFINE g_sql1                STRING 
   DEFINE  p_msg      STRING  
   define  l_t int    
      

   WHENEVER ERROR CALL cl_err_msg_log      
   LET l_success = 'Y'
   LET l_time = cl_get_current()
   LET g_time = cl_replace_str(l_time,'-','')
   LET g_time = cl_replace_str(g_time,' ','')
   LET g_time = cl_replace_str(g_time,':','')
   
    
   #获取EXCEL文档所在位置
   CALL ui.Interface.frontCall("standard","openfile",["C:", "All Files", "*.*", "File Browser"],[gs_location])
   
   LET g_fileloc=gs_location
   
   IF cl_null(g_fileloc) THEN 
      RETURN
   END IF
   
   IF l_success='Y' THEN
   #创建EXCEL实例进程
      #MS OFFICE EXCEL
      CALL ui.interface.frontCall('WinCOM','CreateInstance',['Excel.Application'],[xlApp])
      IF xlApp = -1 THEN
         #KS WPS 9.0 KET
         CALL ui.interface.frontCall('WinCOM','CreateInstance',['Ket.Application'],[xlApp])
      END IF
      IF xlApp = -1 THEN
         #KS WPS 8.0及以下 ET
         CALL ui.interface.frontCall('WinCOM','CreateInstance',['ET.Application'],[xlApp])
      END IF
      IF xlApp <> -1 THEN
         #打开EXCEL文件
         CALL ui.interface.frontCall('WinCOM','CallMethod',[xlApp,'Workbooks.Open',g_fileloc],[iRes])
         IF iRes <> -1 THEN
            #获取EXCEL中的行数
            CALL ui.interface.frontCall('WinCOM','GetProperty',[xlApp,'ActiveSheet.UsedRange.Rows.Count'],[iRow])
            
            IF iRow > 1 THEN
               LET l_n = 0
               CALL cl_showmsg_init()
               #显示进度条，EXCEL中有多少行不算正式数据就减多少
               CALL cl_progress_bar(iRow-2)              
               #BEGIN WORK
               CALL s_transaction_begin()               
               FOR i = 3 TO iRow             
                  LET l_n = l_n +1                   
                  IF iRow > = l_n THEN
                     CALL cl_progress_ing('正在导入第'||i||'行数据')
                  END IF 
                  
                  INITIALIZE l_stba.* TO NULL
                  INITIALIZE l_stbb.* TO NULL
                  let l_stba.stba007=g_time
                  CALL ui.interface.frontcall('WinCOM','GetProperty',
                                              [xlApp,'ActiveSheet.Range("A'||i||':H'||i||'").value'],                                                                                      
                                              [l_stbb.stbb017,l_stbb.stbb009,l_stbb.stbb006,l_stbb.stbb005,l_stbb.stbb001,
                                               l_stba.stba002,l_stba.stbadocdt,l_stba.stbaunit ])
                                                                  
                  LET l_msg = "导入excel中第",i,"行数据失败"
                  LET l_msg1 = "导入excel中第",i,"行"
                  call astp320_excel_chk(l_stba.*,l_stbb.*,'') RETURNING l_suc
                  IF NOT l_suc THEN
                     LET l_success='N'                  
                     CONTINUE FOR
                  END IF 
                  #IF NOT astp320_excel_chk(p_stba,p_stbb,p_msg) THEN 
                  #   CONTINUE FOR
                  #END IF
                  SELECT COUNT(*) INTO l_m FROM stba_t 
                  WHERE stbaent=g_enterprise AND stbadocdt=l_stba.stbadocdt  AND stba002=l_stba.stba002   and stba000='astt320' AND stba007=l_stba.stba007 and stbastus<>'X' 
                  IF l_m=0 THEN 
                     LET l_stba.stbasite=g_site
                     LET l_stba.stba006='1'
                     #LET l_stba.stba007=''
                     LET l_stba.stba013=''
                     LET l_stba.stba008=g_user
                     LET l_stba.stba009=g_dept
                     LET l_stba.stba014='1'
                     LET l_stba.stbastus='N'
                     LET l_stba.stba015='N'
                     LET l_stba.stba000 = 'astt320'      
                     #LET l_stba.stba003 ='5'
                     LET l_stba.stbaownid = g_user
                     LET l_stba.stbaowndp = g_dept
                     LET l_stba.stbacrtid = g_user
                     LET l_stba.stbacrtdp = g_dept
                     #LET l_stba.stba025 =''
                     #LET l_stba.stba026 =l_stba.stbadocdt
                     LET l_stba.stbacrtdt = cl_get_current()         
                     SELECT ooef017 INTO l_stba.stba022
                     FROM ooef_t
                     WHERE ooefent=g_enterprise
                     AND ooef001=l_stba.stbaunit
                     CALL s_arti200_get_def_doc_type(l_stba.stbaunit,'astt320','1')
                     RETURNING r_success,r_doctype
                     LET l_stba.stbadocno = r_doctype
                     CALL s_aooi200_gen_docno(g_site,l_stba.stbadocno,l_stba.stbadocdt,'astt320') RETURNING l_suc,l_stba.stbadocno
                     IF NOT l_suc THEN
                        CALL s_transaction_end('N','0')
                        LET l_success='N'
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'apm-00003'
                        LET g_errparam.extend = l_stba.stbadocno
                        LET g_errparam.popup = TRUE
                        CALL cl_err()                 
                     END IF 
                     SELECT stan001,stan002,stan009,stan010,stan015,stan006,stan007,stan013 INTO 
                           l_stba.stba010,l_stba.stba003,l_stba.stba004,l_stba.stba005,l_stba.stba001,l_stba.stba011,l_stba.stba012,l_stba.stba022   
                      FROM stan_t
                      WHERE stanent=g_enterprise
                      AND stan005=l_stba.stba002
                      AND stanstus='Y' 
                      AND (stan029 !='5' AND stan029 != '7')
              
                      let g_sql=" INSERT INTO stba_t (stbaent,stbaunit,stbasite,stbadocdt,stbadocno,stba001,",
                               "stba002,stba003,stba004,stba005,stba006,stba007,",
                               "stba008,stba009,stbastus,stba010,stba011,",
                               "stba012,stba013,stba014,stba000,",
                               "stba022,",
                               "stbaownid,stbaowndp,stbacrtid,stbacrtdp,stbacrtdt)",
                             "VALUES (?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?,?, ?,?)"
                      PREPARE ins_stba FROM g_sql
                      EXECUTE ins_stba  using g_enterprise,l_stba.stbaunit,l_stba.stbasite,l_stba.stbadocdt,l_stba.stbadocno,l_stba.stba001, 
                              l_stba.stba002,l_stba.stba003,l_stba.stba004,l_stba.stba005,l_stba.stba006,l_stba.stba007,
                              l_stba.stba008,l_stba.stba009,l_stba.stbastus,
                              l_stba.stba010,l_stba.stba011,l_stba.stba012,l_stba.stba013,
                              l_stba.stba014,l_stba.stba000,l_stba.stba022,l_stba.stbaownid,l_stba.stbaowndp,l_stba.stbacrtid, 
                              l_stba.stbacrtdp,l_stba.stbacrtdt
                      IF SQLCA.sqlcode THEN
                         INITIALIZE g_errparam TO NULL 
                         LET g_errparam.extend = "stba_t" 
                         LET g_errparam.code   = SQLCA.sqlcode 
                         LET g_errparam.popup  = TRUE 
                         CALL cl_err()
                         CALL s_transaction_end('N','0')
                         LET l_success='N'
                         EXIT FOR
                      END IF
                   ELSE
               	   #SELECT * INTO l_stba.*   #161111-00028#3--mark
               	   #161111-00028#3--add---begin-----------
               	    SELECT stbaent,stbasite,stbaunit,stbadocno,stbadocdt,stba001,stba002,stba003,stba004,stba005,
               	            stba006,stba007,stba008,stba009,stbastus,stbaownid,stbaowndp,stbacrtid,stbacrtdp,stbacrtdt,
               	            stbamodid,stbamoddt,stbacnfid,stbacnfdt,stba010,stba011,stba012,stba013,stba014,stba015,
               	            stba000,stba016,stba017,stba018,stba019,stba020,stba021,stba022,stba023,stba024,
               	            stba025,stba026,stba027 INTO l_stba.* 
               	   #161111-00028#3--add---end-------------
               	     FROM stba_t
                      WHERE stbaent=g_enterprise AND stbadocdt=l_stba.stbadocdt  AND stba002=l_stba.stba002 and stba000='astt320' and stba007=l_stba.stba007              
                   END IF    
                      SELECT max(stbbseq) INTO l_t FROM stbb_t WHERE stbbent=g_enterprise AND stbbdocno=l_stba.stbadocno
                      IF cl_null(l_t) THEN 
                         LET l_stbb.stbbseq=1
                      ELSE
                         LET l_stbb.stbbseq=l_t+1
                      END IF 
                      SELECT stae013,stae014,stae011,stae007,stae006
                      INTO l_stbb.stbb030,l_stbb.stbb031,l_stbb.stbb015,l_stbb.stbb016,l_stbb.stbb004
                      FROM stae_t WHERE stae001=l_stbb.stbb001 AND staeent=g_enterprise
               	    CALL s_expense_get_stae_info(l_stbb.stbb001) RETURNING l_stbb.stbb016,l_stbb.stbb015,l_stbb.stbb030,l_stbb.stbb031
                      IF l_stbb.stbb030 = '1'  THEN
                         LET l_stbb.stbb031 = l_stba.stbasite  
                      END IF 
                      IF cl_null(l_stbb.stbb015) THEN
                         LET l_stbb.stbb015 = 'Y' 
                      END IF
                      IF cl_null(l_stbb.stbb016) THEN
                         LET l_stbb.stbb016 = 'N' 
                      END IF
                      IF l_stbb.stbb016='Y' THEN 
                         SELECT stan007 INTO l_stbb.stbb003
                         FROM stan_t
                         WHERE stanent=g_enterprise
                         AND stan001=l_stba.stba010
                      ELSE
                         SELECT stae010 INTO l_stbb.stbb003
                         FROM stae_t
                         WHERE staeent = g_enterprise
                         AND stae001 = l_stbb.stbb001 
                      END IF
                      CALL s_asti206_get_period(l_stbb.stbb005,l_stbb.stbb006,l_stba.stba001,'astt320')
                         RETURNING r_success,r_stau004,r_period,r_period2
                      LET l_stbb.stbb007 = r_stau004
                      LET l_stbb.stbb008 = r_period
                      LET l_stbb.stbb014 = r_period2
                      CALL s_expense_get_stbb019(l_stba.stba010,l_stbb.stbb005,l_stbb.stbb006,l_stbb.stbbsite)           
                         RETURNING  l_stbb018,l_stbb.stbb019 
     	                LET l_stbb.stbb012 = l_stba.stba009
     	                LET l_stbb.stbb010='1'
     	                #LET l_stbb.stbb014=0
                      LET l_stbb.stbb013='1'
                      LET l_stbb.stbbsite=l_stba.stbasite
                      LET l_stbb.stbbunit=l_stba.stbaunit
                      SELECT DISTINCT staq003                #所屬品類
                      INTO l_stbb.stbb011 
                      FROM staq_t 
                      WHERE staqent = g_enterprise 
                      AND staq001 = l_stba.stba010 
                      AND staq005 = 'Y' 
                       CALL s_curr_round(l_stba.stbasite,l_stba.stba011,l_stbb.stbb009,'2') RETURNING l_stbb.stbb009   
                      LET g_sql1="	INSERT INTO stbb_t(stbbent,stbbunit,stbbsite,stbbdocno,stbbseq,stbb001,stbb030,",
                                         "stbb031,stbb015,stbb016,stbb002,stbb003,",
                                         "stbb004,stbb005,stbb006,stbb007,stbb008,",
                                         "stbb009,stbb010,stbb011,stbb012,stbb013,stbb014,stbb017)",
                      "VALUES(?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?)"
                      PREPARE ins_stbb FROM g_sql1
                      EXECUTE ins_stbb  USING g_enterprise,l_stbb.stbbunit,l_stbb.stbbsite,l_stba.stbadocno,l_stbb.stbbseq,l_stbb.stbb001,l_stbb.stbb030,
                            l_stbb.stbb031,l_stbb.stbb015,l_stbb.stbb016,l_stba.stba011,l_stbb.stbb003,
                            l_stbb.stbb004,l_stbb.stbb005,l_stbb.stbb006,l_stbb.stbb007,l_stbb.stbb008,
                            l_stbb.stbb009,l_stbb.stbb010,l_stbb.stbb011,l_stbb.stbb012,l_stbb.stbb013,l_stbb.stbb014,
                           l_stbb.stbb017
                      IF SQLCA.sqlcode THEN
                          INITIALIZE g_errparam TO NULL 
                          LET g_errparam.extend = "stbb_t" 
                          LET g_errparam.code   = SQLCA.sqlcode 
                          LET g_errparam.popup  = TRUE 
                          CALL cl_err()
                          CALL s_transaction_end('N','0')
                          LET l_success='N'
                          EXIT FOR
                      END IF                   
               END FOR

               #如果意外停职循环则关闭进度条
               IF i<> iRow  THEN  
                  CALL cl_progress_counter_increase()  
               END IF               
               IF l_success='Y' THEN
                  CALL s_transaction_end('Y','0')
                  CALL astp320_dr()
                  CLEAR FORM
                  DISPLAY g_time TO stba007
                  let g_wc=''
                  let g_stba007=g_time
                  CALL astp320_b_fill()
               ELSE
                  CALL s_transaction_end('N','0')
               END IF
            END IF
         ELSE 
            DISPLAY 'NO FILE'
         END IF
      ELSE
   	   DISPLAY 'NO EXCEL'
      END IF 
   
      CALL ui.interface.frontCall('WinCOM','CallMethod',[xlApp,'Quit'],[iRes])
      CALL ui.interface.frontCall('WinCOM','ReleaseInstance',[xlApp],[iRes])
      
      CALL cl_showmsg()
   END IF
   let g_stba007='' 
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
PRIVATE FUNCTION astp320_excel_chk(p_stba,p_stbb,p_msg)
 DEFINE  p_rtdudocno LIKE rtdu_t.rtdudocno
   DEFINE  p_msg      STRING 
   #161111-00028#3--modify----begin----------                           
   #DEFINE p_stba      RECORD LIKE stba_t.*
   #DEFINE p_stbb      RECORD LIKE stbb_t.*
   DEFINE p_stbb RECORD  #費用單明細資料表
       stbbent LIKE stbb_t.stbbent, #企業編號
       stbbunit LIKE stbb_t.stbbunit, #應用組織
       stbbsite LIKE stbb_t.stbbsite, #營運據點
       stbbdocno LIKE stbb_t.stbbdocno, #單據編號
       stbbseq LIKE stbb_t.stbbseq, #項次
       stbb001 LIKE stbb_t.stbb001, #費用編號
       stbb002 LIKE stbb_t.stbb002, #幣別
       stbb003 LIKE stbb_t.stbb003, #稅別
       stbb004 LIKE stbb_t.stbb004, #價款類別
       stbb005 LIKE stbb_t.stbb005, #起始日期
       stbb006 LIKE stbb_t.stbb006, #截止日期
       stbb007 LIKE stbb_t.stbb007, #結算會計期
       stbb008 LIKE stbb_t.stbb008, #財務會計期
       stbb009 LIKE stbb_t.stbb009, #費用金額
       stbb010 LIKE stbb_t.stbb010, #承擔對象
       stbb011 LIKE stbb_t.stbb011, #所屬品類
       stbb012 LIKE stbb_t.stbb012, #所屬部門
       stbb013 LIKE stbb_t.stbb013, #結算對象
       stbb014 LIKE stbb_t.stbb014, #財務會計期別
       stbb015 LIKE stbb_t.stbb015, #納入結算單否
       stbb016 LIKE stbb_t.stbb016, #票扣否
       stbb017 LIKE stbb_t.stbb017, #備註
       stbb018 LIKE stbb_t.stbb018, #結算帳期
       stbb019 LIKE stbb_t.stbb019, #結算日期
       stbb020 LIKE stbb_t.stbb020, #日結成本類型
       stbb021 LIKE stbb_t.stbb021, #調整日期
       stbb022 LIKE stbb_t.stbb022, #商品編號
       stbb023 LIKE stbb_t.stbb023, #庫區編號
       stbb024 LIKE stbb_t.stbb024, #专柜编号
       stbb025 LIKE stbb_t.stbb025, #應收金額
       stbb026 LIKE stbb_t.stbb026, #實收金額
       stbb027 LIKE stbb_t.stbb027, #費率
       stbb028 LIKE stbb_t.stbb028, #成本金額
       stbb029 LIKE stbb_t.stbb029, #促銷銷售額
       stbb030 LIKE stbb_t.stbb030, #費用歸屬類型
       stbb031 LIKE stbb_t.stbb031, #費用歸屬組織
       stbb032 LIKE stbb_t.stbb032, #銷售數量
       stbb033 LIKE stbb_t.stbb033, #銷售單位
       stbbud001 LIKE stbb_t.stbbud001 
       END RECORD 
    DEFINE p_stba RECORD  #費用單資料表
       stbaent LIKE stba_t.stbaent, #企業編號
       stbasite LIKE stba_t.stbasite, #營運據點
       stbaunit LIKE stba_t.stbaunit, #應用組織
       stbadocno LIKE stba_t.stbadocno, #單據編號
       stbadocdt LIKE stba_t.stbadocdt, #單據日期
       stba001 LIKE stba_t.stba001, #結算中心
       stba002 LIKE stba_t.stba002, #供應商編號
       stba003 LIKE stba_t.stba003, #經營方式
       stba004 LIKE stba_t.stba004, #結算方式
       stba005 LIKE stba_t.stba005, #結算類型
       stba006 LIKE stba_t.stba006, #來源類型
       stba007 LIKE stba_t.stba007, #來源單號
       stba008 LIKE stba_t.stba008, #人員
       stba009 LIKE stba_t.stba009, #部門
       stbastus LIKE stba_t.stbastus, #狀態碼
       stbaownid LIKE stba_t.stbaownid, #資料所屬者
       stbaowndp LIKE stba_t.stbaowndp, #資料所有部門
       stbacrtid LIKE stba_t.stbacrtid, #資料建立者
       stbacrtdp LIKE stba_t.stbacrtdp, #資料建立部門
       stbacrtdt LIKE stba_t.stbacrtdt, #資料創建日
       stbamodid LIKE stba_t.stbamodid, #資料修改者
       stbamoddt LIKE stba_t.stbamoddt, #最近修改日
       stbacnfid LIKE stba_t.stbacnfid, #資料確認者
       stbacnfdt LIKE stba_t.stbacnfdt, #資料確認日
       stba010 LIKE stba_t.stba010, #合約編號
       stba011 LIKE stba_t.stba011, #幣別
       stba012 LIKE stba_t.stba012, #稅別
       stba013 LIKE stba_t.stba013, #專櫃編號/鋪位編號
       stba014 LIKE stba_t.stba014, #費用類型
       stba015 LIKE stba_t.stba015, #交款狀態
       stba000 LIKE stba_t.stba000, #程式編號
       stba016 LIKE stba_t.stba016, #交款人
       stba017 LIKE stba_t.stba017, #結算帳期
       stba018 LIKE stba_t.stba018, #結算日期
       stba019 LIKE stba_t.stba019, #開始日期
       stba020 LIKE stba_t.stba020, #結束日期
       stba021 LIKE stba_t.stba021, #成本總額
       stba022 LIKE stba_t.stba022, #法人
       stba023 LIKE stba_t.stba023, #會員折扣金額
       stba024 LIKE stba_t.stba024, #no_use
       stba025 LIKE stba_t.stba025, #合約帳期
       stba026 LIKE stba_t.stba026, #計算日期
       stba027 LIKE stba_t.stba027  #促銷協議項次
       END RECORD
#161111-00028#3--modify----end----------
   DEFINE l_success    LIKE type_t.num5
   DEFINE l_errno      STRING   
   DEFINE  l_cnt LIKE type_t.num5
   
   CASE
      WHEN (cl_null(p_stba.stbaunit)) 
         CALL cl_errmsg('stbaunit','营运据点不可为空',p_msg,'!',1)
         RETURN FALSE 
      WHEN (cl_null(p_stba.stbadocdt)) 
         CALL cl_errmsg('stbadocdt','单据日期不能为空',p_msg,'!',1)
         RETURN FALSE 
      WHEN (cl_null(p_stba.stba002))
         CALL cl_errmsg('stba002','供应商编号不能为空',p_msg,'!',1)
         RETURN FALSE 
      WHEN (cl_null(p_stbb.stbb001))
         CALL cl_errmsg('stbb001','费用编号不能为空',p_msg,'!',1)
         RETURN FALSE  
      WHEN (cl_null(p_stbb.stbb005))
         CALL cl_errmsg('stbb005','起始日期不能为空',p_msg,'!',1)
         RETURN FALSE  
      WHEN (cl_null(p_stbb.stbb006))
         CALL cl_errmsg('stbb006','截止日期不能为空',p_msg,'!',1)
         RETURN FALSE
      WHEN (cl_null(p_stbb.stbb009))
         CALL cl_errmsg('stbb009','费用金额不能为空',p_msg,'!',1)
         RETURN FALSE      
   END CASE      
   IF NOT cl_null(p_stba.stbaunit) THEN 
       CALL s_aooi500_chk('astt320','stbaunit',p_stba.stbaunit,g_site) RETURNING l_success,l_errno
       IF NOT l_success THEN
         CALL cl_errmsg('stbaunit','营运据点错误，请核实！',p_msg,'!',1)
         RETURN FALSE 
       END IF
   END IF     
   RETURN TRUE
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
PRIVATE FUNCTION astp320_dr()
 DEFINE ls_msg     STRING
   DEFINE ls_title   STRING

   WHENEVER ERROR CALL cl_err_msg_log

   LET ls_msg = cl_getmsg("ast-00782",g_lang)
   LET ls_title = cl_getmsg("lib-041",g_lang)

   #若為背景進入(Y)時,不詢問直接離開 (0729)
   IF g_bgjob = "Y" THEN
   ELSE
      MENU ls_title ATTRIBUTE (STYLE="dialog", COMMENT=ls_msg CLIPPED, IMAGE="information")
         ON ACTION ok
            EXIT MENU
         ON IDLE g_idle_seconds
            CALL cl_on_idle()
            CONTINUE MENU
      END MENU

      IF INT_FLAG THEN
         LET INT_FLAG = 0
      END IF
   END IF
END FUNCTION

################################################################################
# Descriptions...: 檢查該筆的stba_t是否被lock
# Memo...........:
# Usage..........: CALL astp320_lock_chk()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2017/01/13  By sakura #170109-00037#11
# Modify.........:
################################################################################
PRIVATE FUNCTION astp320_lock_chk()
   DEFINE l_stbadocno LIKE stba_t.stbadocno
   
   LET l_stbadocno = ''
   
   EXECUTE astp320_chk_lock_stba USING g_detail_d[l_ac].stbadocno
                                  INTO l_stbadocno
                                  
   IF cl_null(l_stbadocno) THEN
      LET g_detail_d[l_ac].sel = 'N'
      
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = ''
      LET g_errparam.code   = 'ast-00868'
      LET g_errparam.replace[1] = g_detail_d[l_ac].stbadocno
      LET g_errparam.popup  = TRUE
      CALL cl_err()
   END IF
END FUNCTION

#end add-point
 
{</section>}
 
