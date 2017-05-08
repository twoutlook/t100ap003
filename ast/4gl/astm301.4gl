#該程式已解開Section, 不再透過樣板產出!
{<section id="astm301.description" >}
#+ Version..: T100-ERP-1.00.00(版次:1) Build-000275
#+ 
#+ Filename...: astm301
#+ Description: 自營合約維護作業
#+ Creator....: 01533(2013/10/17)
#+ Modifier...: 01533(2013/10/18)
#+ Buildtype..: 應用 t01 樣板自動產生
#+ 以上段落由子樣板a00產生
 
{</section>}
 
{<section id="astm301.global" >}

    
IMPORT os
IMPORT util
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目
#160318-00005#44  2016/03/26  By pengxin     修正azzi920重复定义之错误讯息
#160318-00025#37  2016/04/19  By pengxin     將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160513-00002#3   2016/05/24  by 08172       画面调整
#160905-00007#15  2016/09/05  by 08172       调整系统中无ENT的SQL条件增加ent
#161024-00025#6   2016/10/25  By 02481       门店开窗调整
#161108-00043#1   2016/11/08  by 08172       灰掉除了查询的其他按钮
#161108-00016#1   2016/11/09  by 08742       修改 g_browser_cnt等定义数值大小
#161111-00028#3   2016/11/15  by 02481       标准程式定义采用宣告模式,弃用.*写法
#161214-00032#1   2016/12/15  by 07900       石狮通达权限设置.freestyle或者是改过section者,需检核规格【资料表关联设定】主表要跟现在程序主表一致;主sql部分要补上cl_sql_add_filter
#end add-point
 
SCHEMA ds 
 
GLOBALS "../../cfg/top_global.inc"
 
{<Module define>}
 
#單頭 type 宣告
PRIVATE type type_g_stan_m        RECORD
       stan002 LIKE stan_t.stan002, 
   stan001 LIKE stan_t.stan001, 
   stan003 LIKE stan_t.stan003, 
   stan021 LIKE stan_t.stan021, 
   stan005 LIKE stan_t.stan005, 
   stan005_desc LIKE type_t.chr80, 
   stan004 LIKE stan_t.stan004, 
   stan004_desc LIKE type_t.chr80, 
   stanunit LIKE stan_t.stanunit, 
   stanunit_desc LIKE type_t.chr80, 
   stan006 LIKE stan_t.stan006, 
   stan006_desc LIKE type_t.chr80, 
   stan007 LIKE stan_t.stan007, 
   stan007_desc LIKE type_t.chr80, 
   stan008 LIKE stan_t.stan008,
   stan008_desc LIKE type_t.chr80,
   stan022 LIKE stan_t.stan022,    #150506-00007#4 150523 by sakura add 
   stan022_desc LIKE type_t.chr80, #150506-00007#4 150523 by sakura add
   stan023 LIKE stan_t.stan023,    #150506-00007#4 150523 by sakura add 
   stan023_desc LIKE type_t.chr80, #150506-00007#4 150523 by sakura add 
   stan037 LIKE stan_t.stan037,   
   stan024 LIKE stan_t.stan024,    #150506-00007#4 150523 by sakura add 
   stan025 LIKE stan_t.stan025,    #150506-00007#4 150523 by sakura add
   stan026 LIKE stan_t.stan026,    #150506-00007#4 150523 by sakura add
   stan034 LIKE stan_t.stan034,
   stan035 LIKE stan_t.stan035,
   stan036 LIKE stan_t.stan036,
   stan027 LIKE stan_t.stan027,    #150506-00007#4 150523 by sakura add
   stan028 LIKE stan_t.stan028,    #150506-00007#4 150523 by sakura add
   stan029 LIKE stan_t.stan029,
   stan030 LIKE stan_t.stan030,
   stan031 LIKE stan_t.stan031, 
   stan032 LIKE stan_t.stan032,   
   stan009 LIKE stan_t.stan009, 
   stan009_desc LIKE type_t.chr80, 
   stan010 LIKE stan_t.stan010, 
   stan010_desc LIKE type_t.chr80, 
   stan015 LIKE stan_t.stan015, 
   stan015_desc LIKE type_t.chr80, 
   stan016 LIKE stan_t.stan016, 
   stan016_desc LIKE type_t.chr80, 
   stan011 LIKE stan_t.stan011, 
   stan012 LIKE stan_t.stan012, 
   stan013 LIKE stan_t.stan013, 
   stan013_desc LIKE type_t.chr80, 
   stan033 LIKE stan_t.stan033,
   stan014 LIKE stan_t.stan014, 
   stan014_desc LIKE type_t.chr80, 
   stan038 LIKE stan_t.stan038,
   stan038_desc LIKE type_t.chr80,
   stan017 LIKE stan_t.stan017, 
   stan018 LIKE stan_t.stan018, 
   stan019 LIKE stan_t.stan019, 
   stan020 LIKE stan_t.stan020,
   stan039 LIKE stan_t.stan039,   #160303-00028#33 add by geza  
   next_b  LIKE type_t.dat,
   stanstus LIKE stan_t.stanstus, 
   stanownid LIKE stan_t.stanownid, 
   stanownid_desc LIKE type_t.chr80, 
   stanowndp LIKE stan_t.stanowndp, 
   stanowndp_desc LIKE type_t.chr80, 
   stancrtid LIKE stan_t.stancrtid, 
   stancrtid_desc LIKE type_t.chr80, 
   stancrtdp LIKE stan_t.stancrtdp, 
   stancrtdp_desc LIKE type_t.chr80, 
   stancrtdt DATETIME YEAR TO SECOND, 
   stanmodid LIKE stan_t.stanmodid, 
   stanmodid_desc LIKE type_t.chr80, 
   stanmoddt DATETIME YEAR TO SECOND, 
   stancnfid LIKE stan_t.stancnfid, 
   stancnfid_desc LIKE type_t.chr80, 
   stancnfdt DATETIME YEAR TO SECOND
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stao_d        RECORD
       stao002 LIKE stao_t.stao002, 
   stao003 LIKE stao_t.stao003, 
   stao003_desc LIKE type_t.chr500, 
   stao023 LIKE stao_t.stao023,    #add by geza 20150610 150602-00003#12
   stao024 LIKE stao_t.stao024,    #add by geza 20150610 150602-00003#12 
   stao025 LIKE stao_t.stao025,
   stao025_desc LIKE type_t.chr500, 
   stao004 LIKE stao_t.stao004, 
   stao005 LIKE stao_t.stao005, 
   stao006 LIKE stao_t.stao006, 
   stao028 LIKE stao_t.stao028,
   stao007 LIKE stao_t.stao007, 
   stao008 LIKE stao_t.stao008,
   stao027 LIKE stao_t.stao027,   #150612-00023#6 add
   stao009 LIKE stao_t.stao009, 
   stao009_desc LIKE type_t.chr500, 
   stao010 LIKE stao_t.stao010, 
   stao010_desc LIKE type_t.chr500, 
   stao011 LIKE stao_t.stao011, 
   stao012 LIKE stao_t.stao012, 
   stao013 LIKE stao_t.stao013, 
   stao014 LIKE stao_t.stao014, 
   stao015 LIKE stao_t.stao015, 
   stao016 LIKE stao_t.stao016, 
   stao029 LIKE stao_t.stao029,
   stao030 LIKE stao_t.stao030,
   stao022 LIKE stao_t.stao022,
   stao017 LIKE stao_t.stao017, 
   stao018 LIKE stao_t.stao018, 
   staoacti     LIKE stao_t.staoacti,
   stao026 LIKE stao_t.stao026,      #add by yangxf
   stao019 LIKE stao_t.stao019,
   stao020 LIKE stao_t.stao020,
   stao021 LIKE stao_t.stao021
       END RECORD
PRIVATE TYPE type_g_stao2_d RECORD
       staq002 LIKE staq_t.staq002, 
   staq003 LIKE staq_t.staq003, 
   staq003_desc LIKE type_t.chr500, 
   staq005 LIKE staq_t.staq005,
   staq004 LIKE staq_t.staq004,
   staqacti LIKE staq_t.staqacti
       END RECORD
 
 
 
#模組變數(Module Variables)
DEFINE g_stan_m          type_g_stan_m
DEFINE g_stan_m_t        type_g_stan_m
DEFINE g_stan_m_o        type_g_stan_m 
 
   DEFINE g_stan001_t LIKE stan_t.stan001
 
 
DEFINE g_stao_d          DYNAMIC ARRAY OF type_g_stao_d
DEFINE g_stao_d_t        type_g_stao_d
DEFINE g_stao2_d   DYNAMIC ARRAY OF type_g_stao2_d
DEFINE g_stao2_d_t type_g_stao2_d
 
 
 
DEFINE g_browser    DYNAMIC ARRAY OF RECORD    #資料瀏覽之欄位 
         b_statepic     LIKE type_t.chr50,
            b_stan001 LIKE stan_t.stan001,
      b_stan002 LIKE stan_t.stan002,
      b_stan003 LIKE stan_t.stan003,
      b_stan004 LIKE stan_t.stan004,
      b_stan005 LIKE stan_t.stan005,
      b_stan005_desc LIKE type_t.chr500,
      b_stan006 LIKE stan_t.stan006,
      b_stan007 LIKE stan_t.stan007,
      b_stan008 LIKE stan_t.stan008,
      b_stan009 LIKE stan_t.stan009,
      b_stan010 LIKE stan_t.stan010,
      b_stan011 LIKE stan_t.stan011,
      b_stan012 LIKE stan_t.stan012,
      b_stan013 LIKE stan_t.stan013,
      b_stan014 LIKE stan_t.stan014,
      b_stan015 LIKE stan_t.stan015,
      b_stan016 LIKE stan_t.stan016,
      b_stan017 LIKE stan_t.stan017,
      b_stan018 LIKE stan_t.stan018,
      b_stan019 LIKE stan_t.stan019,
      b_stan020 LIKE stan_t.stan020,
      b_stan021 LIKE stan_t.stan021,
      b_stanunit LIKE stan_t.stanunit
         #,rank           LIKE type_t.num10
      END RECORD 
      
DEFINE g_browser_f  RECORD    #資料瀏覽之欄位 
         b_statepic     LIKE type_t.chr50,
            b_stan001 LIKE stan_t.stan001,
      b_stan002 LIKE stan_t.stan002,
      b_stan003 LIKE stan_t.stan003,
      b_stan004 LIKE stan_t.stan004,
      b_stan005 LIKE stan_t.stan005,
      b_stan005_desc LIKE type_t.chr500,
      b_stan006 LIKE stan_t.stan006,
      b_stan007 LIKE stan_t.stan007,
      b_stan008 LIKE stan_t.stan008,
      b_stan009 LIKE stan_t.stan009,
      b_stan010 LIKE stan_t.stan010,
      b_stan011 LIKE stan_t.stan011,
      b_stan012 LIKE stan_t.stan012,
      b_stan013 LIKE stan_t.stan013,
      b_stan014 LIKE stan_t.stan014,
      b_stan015 LIKE stan_t.stan015,
      b_stan016 LIKE stan_t.stan016,
      b_stan017 LIKE stan_t.stan017,
      b_stan018 LIKE stan_t.stan018,
      b_stan019 LIKE stan_t.stan019,
      b_stan020 LIKE stan_t.stan020,
      b_stan021 LIKE stan_t.stan021,
      b_stanunit LIKE stan_t.stanunit
         #,rank           LIKE type_t.num10
      END RECORD 
      
#無單頭append欄位定義
#無單身append欄位定義
 
DEFINE g_wc                  STRING
DEFINE g_wc_t                STRING
DEFINE g_wc2                 STRING                          #單身CONSTRUCT結果
DEFINE g_wc2_table1          STRING
DEFINE g_wc2_table2   STRING
 
 
 
DEFINE g_wc_filter           STRING
DEFINE g_wc_filter_t         STRING
 
DEFINE g_sql                 STRING
DEFINE g_forupd_sql          STRING
DEFINE g_cnt                 LIKE type_t.num10
DEFINE g_current_idx         LIKE type_t.num10     
DEFINE g_jump                LIKE type_t.num10        
DEFINE g_no_ask              LIKE type_t.num5        
#DEFINE g_rec_b               LIKE type_t.num5             #單身筆數   #161108-00016#1   2016/11/09  by 08742 mark                      
DEFINE g_rec_b               LIKE type_t.num10             #單身筆數    #161108-00016#1   2016/11/09  by 08742 add                   
#DEFINE l_ac                  LIKE type_t.num5             #161108-00016#1   2016/11/09  by 08742 mark       
DEFINE l_ac                  LIKE type_t.num10             #161108-00016#1   2016/11/09  by 08742 add   
DEFINE g_curr_diag           ui.Dialog                     #Current Dialog
    
#DEFINE g_pagestart           LIKE type_t.num5             #161108-00016#1   2016/11/09  by 08742 mark 
DEFINE g_pagestart           LIKE type_t.num10             #161108-00016#1   2016/11/09  by 08742 add #page起始筆數         
DEFINE gwin_curr             ui.Window                     #Current Window
DEFINE gfrm_curr             ui.Form                       #Current Form
DEFINE g_page_action         STRING                        #page action
DEFINE g_header_hidden       LIKE type_t.num5              #隱藏單頭
DEFINE g_worksheet_hidden    LIKE type_t.num5              #隱藏工作Panel
DEFINE g_page                STRING                        #第幾頁
DEFINE g_state               STRING       
 
#161108-00016#1   2016/11/09  by 08742 -S
#DEFINE g_detail_cnt          LIKE type_t.num5             #單身總筆數 
#DEFINE g_detail_idx          LIKE type_t.num5             #單身目前所在筆數
#DEFINE g_detail_idx2         LIKE type_t.num5             #單身2目前所在筆數
#DEFINE g_browser_cnt         LIKE type_t.num5             #Browser總筆數
#DEFINE g_browser_idx         LIKE type_t.num5             #Browser目前所在筆數
#DEFINE g_temp_idx            LIKE type_t.num5             #Browser目前所在筆數(暫存用)
DEFINE g_detail_cnt          LIKE type_t.num10             #單身總筆數  
DEFINE g_detail_idx          LIKE type_t.num10             #單身目前所在筆數
DEFINE g_detail_idx2         LIKE type_t.num10             #單身2目前所在筆數
DEFINE g_browser_cnt         LIKE type_t.num10             
DEFINE g_browser_idx         LIKE type_t.num10             #Browser目前所在筆數
DEFINE g_temp_idx            LIKE type_t.num10             #Browser目前所在筆數(暫存用)
#161108-00016#1   2016/11/09  by 08742 -E
 
DEFINE g_searchcol           STRING                        #查詢欄位代碼
DEFINE g_searchstr           STRING                        #查詢欄位字串
DEFINE g_order               STRING                        #查詢排序欄位
                                                        
#DEFINE g_current_row         LIKE type_t.num5             #Browser所在筆數  #161108-00016#1   2016/11/09  by 08742 mark
DEFINE g_current_row         LIKE type_t.num10             #Browser所在筆數  #161108-00016#1   2016/11/09  by 08742 add
DEFINE g_current_sw          BOOLEAN                       #Browser所在筆數用開關
#DEFINE g_current_page        LIKE type_t.num5             #目前所在頁數     #161108-00016#1   2016/11/09  by 08742 mark
DEFINE g_current_page        LIKE type_t.num10             #目前所在頁數     #161108-00016#1   2016/11/09  by 08742 add
DEFINE g_insert              LIKE type_t.chr5              #是否導到其他page
 
DEFINE g_ref_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars            DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields          DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys               DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak           DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_bfill               LIKE type_t.chr5              #是否刷新單身
DEFINE g_error_show          LIKE type_t.num5              #
 
DEFINE g_wc_frozen           STRING                        #凍結欄位使用
DEFINE g_chk                 BOOLEAN                       #助記碼判斷用
DEFINE g_aw                  STRING                        #確定當下點擊的單身
  
{</Module define>}
 
#add-point:自定義模組變數(Module Variable)
############150601-00025#1
 TYPE type_g_stao3_d RECORD
   stbk002 LIKE stbk_t.stbk002, 
   stbk003 LIKE stbk_t.stbk003
       END RECORD 
DEFINE g_stao3_d   DYNAMIC ARRAY OF type_g_stao3_d
DEFINE g_stao3_d_t type_g_stao3_d
DEFINE g_wc2_table7          STRING
###########150601-00025#1

 TYPE type_g_stao4_d RECORD
   stbo002 LIKE stbo_t.stbo002, 
   stbo003 LIKE stbo_t.stbo003,
   stbo003_desc LIKE type_t.chr500,
   stboacti LIKE stbo_t.stboacti
       END RECORD 
DEFINE g_stao4_d   DYNAMIC ARRAY OF type_g_stao4_d
DEFINE g_stao4_d_t type_g_stao4_d
DEFINE g_wc2_table8          STRING

 TYPE type_g_stap_d        RECORD
    stap003 LIKE stap_t.stap003, 
    stap004 LIKE stap_t.stap004, 
    stap005 LIKE stap_t.stap005, 
    stap006 LIKE stap_t.stap006
       END RECORD
DEFINE g_stap_d        DYNAMIC ARRAY OF type_g_stap_d  
DEFINE g_stap_d_t      type_g_stap_d
DEFINE l_ac3           LIKE type_t.num5
DEFINE g_rec_b3        LIKE type_t.num5
DEFINE g_detail_idx3   LIKE type_t.num5
DEFINE g_wc2_table3          STRING

TYPE type_g_stax_d        RECORD
    staxsite LIKE stax_t.staxsite,
    staxunit LIKE stax_t.staxunit,
    staxseq  LIKE stax_t.staxseq, 
    stax007  LIKE stax_t.stax007,
    stax007_desc  LIKE type_t.chr50,
    stax002  LIKE stax_t.stax002, 
    stax003  LIKE stax_t.stax003, 
    stax004  LIKE stax_t.stax004,
    stax005  LIKE stax_t.stax005,
    stax006  LIKE stax_t.stax006
       END RECORD
DEFINE g_stax_d        DYNAMIC ARRAY OF type_g_stax_d  
DEFINE g_stax_d_t      type_g_stax_d

DEFINE g_wc2_table4          STRING   
DEFINE g_stao_d_o        type_g_stao_d
DEFINE g_site_flag   LIKE type_t.num5
DEFINE g_ooef019     LIKE ooef_t.ooef019 #稅區 #150506-00007#4 150523 by sakura add

TYPE type_g_staz_d        RECORD
      stazseq2 LIKE staz_t.stazseq2,
      staz002  LIKE staz_t.staz002,
      staz004  LIKE staz_t.staz004,
      staz004_desc LIKE type_t.chr80
      END RECORD
DEFINE g_staz_d        DYNAMIC ARRAY OF type_g_staz_d  
DEFINE g_staz_d_t      type_g_staz_d      
DEFINE g_wc2_table5          STRING  

TYPE type_g_staz1_d        RECORD
      stazseq2 LIKE staz_t.stazseq2,
      staz002  LIKE staz_t.staz002,
      staz005  LIKE staz_t.staz005,
      staz003  LIKE staz_t.staz003,
      staz004  LIKE staz_t.staz004,
      staz004_desc LIKE type_t.chr80
      END RECORD
DEFINE g_staz1_d        DYNAMIC ARRAY OF type_g_staz1_d  
DEFINE g_staz1_d_t      type_g_staz1_d      
DEFINE g_wc2_table6          STRING  

TYPE type_g_stbx_d        RECORD
    stbxsite LIKE stbx_t.stbxsite,
    stbxunit LIKE stbx_t.stbxunit,
    stbxseq  LIKE stbx_t.stbxseq, 
    stbxseq1 LIKE stbx_t.stbxseq1, 
    stbx008  LIKE stbx_t.stbx008,
    stbx008_desc  LIKE type_t.chr50,
    stbx009  LIKE stbx_t.stbx009,
    stbx007  LIKE stbx_t.stbx007,
    stbx007_desc  LIKE type_t.chr50,
    stbx002  LIKE stbx_t.stbx002, 
    stbx003  LIKE stbx_t.stbx003, 
    stbx004  LIKE stbx_t.stbx004,
    stbx005  LIKE stbx_t.stbx005,
    stbx006  LIKE stbx_t.stbx006
       END RECORD
DEFINE g_stbx_d        DYNAMIC ARRAY OF type_g_stbx_d  
DEFINE g_stbx_d_t      type_g_stbx_d
DEFINE g_wc2_table9    STRING  
#end add-point
 
#add-point:傳入參數說明

#end add-point
 
{</section>}
 
{<section id="astm301.main" >}
#test
#+ 此段落由子樣板a26產生
#OPTIONS SHORT CIRCUIT
#+ 作業開始 
MAIN
   #add-point:main段define
   DEFINE l_success LIKE type_t.num5
   #end add-point   
 
   OPTIONS
   INPUT NO WRAP
   DEFER INTERRUPT
   
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
       
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("ast","")
 
   #add-point:作業初始化
   CALL s_aooi390_cre_tmp_table() RETURNING l_success   #add--2015/03/20 By shiun
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define
   
   #end add-point
   LET g_forupd_sql = "SELECT stan002,stan001,stan003,stan021,stan005,'',stan004,'',stanunit,'',stan006, 
       '',stan007,'',stan008,'',stan022,'',stan023,'',stan037,stan024,stan025,stan026,stan034,stan035,stan036,stan027,stan028,stan029,stan030,stan031,stan032,stan009,'',stan010,'',stan015,'',stan016,'',stan011,stan012,stan013,'', 
       stan014,'',stan017,stan018,stan019,stan020,stanstus,stanownid,'',stanowndp,'',stancrtid,'',stancrtdp, 
       '',stancrtdt,stanmodid,'',stanmoddt,stancnfid,'',stancnfdt FROM stan_t WHERE stanent= ? AND stan001=?  
       FOR UPDATE"
   #add-point:SQL_define
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   DECLARE astm301_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   IF g_bgjob = "Y" THEN
 
      #add-point:Service Call
      
      #end add-point
 
   ELSE
      
      #畫面開啟 (identifier)
      OPEN WINDOW w_astm301 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astm301_init()   
 
      #進入選單 Menu (="N")
      CALL astm301_ui_dialog() 
	  
      #add-point:畫面關閉前
      CALL s_aooi500_drop_temp() RETURNING l_success
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astm301
      
   END IF 
   
   CLOSE astm301_cl
   
   
 
   #add-point:作業離開前
   CALL s_aooi390_drop_tmp_table()   #add--2015/03/20 By shiun
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
   
END MAIN
 
 
 
{</section>}
 
{<section id="astm301.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astm301_init()
   #add-point:init段define
   DEFINE l_success LIKE type_t.num5  
   #end add-point    
   
   LET g_bfill       = "Y"
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_error_show  = 1
      CALL cl_set_combo_scc_part('stanstus','50','N,X,Y')
 
      CALL cl_set_combo_scc('stan002','6013')                    
   CALL cl_set_combo_scc('stao005','6006') 
   CALL cl_set_combo_scc('stao006','6007') 
   CALL cl_set_combo_scc('stao007','6008') 
   CALL cl_set_combo_scc('stao008','6009') 
   CALL cl_set_combo_scc('stao013','6010') 
   CALL cl_set_combo_scc('stao016','6011') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
 
   #add-point:畫面資料初始化
   #CALL cl_set_combo_scc_part('stan002','6013','1,2,3,4,5') #160303-00028#33 mark by geza   
   CALL cl_set_combo_scc_part('stan002','6013','1,2,3')  #160303-00028#33 add by geza   
   CALL cl_set_combo_scc_part('b_stan002','6013','1,2,3,4,5')
   CALL cl_set_combo_scc_part('stao005','6006','1,2') 
   CALL s_aooi500_create_temp() RETURNING l_success
   #150506-00007#4 150523 by sakura add---STR
   CALL cl_set_combo_scc('stan026','6816') #超出處理方式
   CALL cl_set_combo_scc('stan027','2087') #內外購
   CALL cl_set_combo_scc('stan028','2086') #匯率計算基準
   #150506-00007#4 150523 by sakura add---END   
   CALL cl_set_combo_scc('stan029','6785') #合約狀態
   CALL cl_set_combo_scc('stan032','6202')
   CALL cl_set_combo_scc('stao022','6818') #自定義範圍  #150512-00006#2
   CALL cl_set_combo_scc('staz005','6761')    #add by yangxf
   CALL cl_set_combo_scc_part('staz003','6517','4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,11,12') #屬性類型    #150512-00006#2
   
   #end add-point
   
   CALL astm301_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astm301.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astm301_ui_dialog()
   {<Local define>}
   DEFINE li_idx  LIKE type_t.num5
   {</Local define>}
   #add-point:ui_dialog段define
   
   #end add-point
   
   CALL cl_set_act_visible("accept,cancel", FALSE)
 
   CALL gfrm_curr.setElementImage("logo","logo/applogo.png") 
   IF g_wc.trim() <> "1=1" THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   ELSE
      CALL gfrm_curr.setElementHidden("mainlayout",1)
      CALL gfrm_curr.setElementHidden("worksheet",0)
      LET g_main_hidden = 1
   END IF
   
   #add-point:ui_dialog段before dialog 
   
   #end add-point
   
   WHILE TRUE 
   
      CALL astm301_browser_fill("")
      CALL lib_cl_dlg.cl_dlg_before_display()
      CALL cl_notice()
            
      #判斷前一個動作是否為新增, 若是的話切換到新增的筆數
      IF g_state = "Y" THEN
         FOR li_idx = 1 TO g_browser.getLength()
            IF g_browser[li_idx].b_stan001 = g_stan001_t
 
               THEN
               LET g_current_row = li_idx
               LET g_current_idx = li_idx
               EXIT FOR
            END IF
         END FOR
         LET g_state = ""
      END IF
            
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
         #INPUT g_searchstr,g_searchcol FROM formonly.searchstr,formonly.cbo_searchcol
         #
         #   BEFORE INPUT
         #   
         #END INPUT
 
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
               
               CALL astm301_fetch('') # reload data
               LET l_ac = 1
               CALL astm301_ui_detailshow() #Setting the current row 
      
               CALL astm301_idx_chk()
               #NEXT FIELD stao002
         
         END DISPLAY
        
         DISPLAY ARRAY g_stao_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               CALL astm301_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               
               #add-point:page1, before row動作
                              CALL astm301_b3_fill()
               CALL astm301_reflesh()
               # add geza 150504-00002#1 (S)  
               IF g_stao_d[l_ac].stao016 = '1' THEN
                  CALL cl_set_comp_visible('group7',FALSE)
               ELSE
                  CALL cl_set_comp_visible('group7',TRUE)
               END IF 
               # add geza 150504-00002#1 (E)  
               CALL astm301_set_visible(g_detail_idx)               
               CALL astm301_b_fill2('2')
               CALL astm301_b_fill2('3')
               #end add-point
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_current_page = 1
               CALL astm301_idx_chk()
               #add-point:page1自定義行為
               
               #end add-point
               
            #自訂ACTION(detail_show,page_1)
            
 
 
         ON ACTION detail_qrystr
 
            LET g_action_choice="detail_qrystr"
            IF cl_auth_chk_act("detail_qrystr") THEN 
               MENU "" ATTRIBUTE(STYLE="popup")
 
                  ON ACTION asti203
 
                     LET g_action_choice="asti203"
                     IF cl_auth_chk_act("asti203") THEN 
                        #add-point:ON ACTION asti203
                        
                        #END add-point
                        
                     END IF
 
 
                  ON ACTION asti202
 
                     LET g_action_choice="asti202"
                     IF cl_auth_chk_act("asti202") THEN 
                        #add-point:ON ACTION asti202
                        
                        #END add-point
                        
                     END IF
 
               END MENU
               #add-point:ON ACTION detail_qrystr
               
               #END add-point
               EXIT DIALOG
            END IF
 
               
            #add-point:page1自定義行為
            
            #end add-point
               
         END DISPLAY
        
         DISPLAY ARRAY g_stao2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               CALL astm301_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx = l_ac
               
               #add-point:page2, before row動作
               
               #end add-point
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_current_page = 2
               CALL astm301_idx_chk()
               #add-point:page2自定義行為
               
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為
            
            #end add-point
         
         END DISPLAY
 
 
         
         #add-point:ui_dialog段自定義display array
        DISPLAY ARRAY g_stao3_d TO s_detail7.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               CALL astm301_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail7")
               LET g_detail_idx = l_ac
               
               #add-point:page2, before row動作
               
               #end add-point
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail7")
               LET g_current_page = 7
               CALL astm301_idx_chk()
               #add-point:page2自定義行為
               
               #end add-point
      
         END DISPLAY
         
          DISPLAY ARRAY g_stao4_d TO s_detail8.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               CALL astm301_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail8")
               LET g_detail_idx = l_ac
               
               #add-point:page2, before row動作
               
               #end add-point
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail8")
               LET g_current_page = 8
               CALL astm301_idx_chk()
               #add-point:page2自定義行為
               
               #end add-point
      
         END DISPLAY
 
 
        DISPLAY ARRAY g_stap_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b3) #page1  
    
            BEFORE ROW
               CALL astm301_idx_chk()
               LET l_ac3 = DIALOG.getCurrentRow("s_detail3")
               LET g_detail_idx3 = l_ac3
               
               #add-point:page1, before row動作

               #end add-point
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx3)
               LET l_ac3 = DIALOG.getCurrentRow("s_detail3")
               CALL astm301_idx_chk()
               LET g_current_page = 3
               
            #自訂ACTION(detail_show,page_1)
            

            #add-point:page1自定義行為
            
            #end add-point
               
         END DISPLAY
         
          DISPLAY ARRAY g_stax_d TO s_detail4.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               CALL astm301_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
               LET g_detail_idx = l_ac
               
               #add-point:page2, before row動作
               
               #end add-point
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
               LET g_current_page = 4
               CALL astm301_idx_chk()
               #add-point:page2自定義行為
               
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為
            
            #end add-point
         
         END DISPLAY
         
         DISPLAY ARRAY g_staz_d TO s_detail5.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               CALL astm301_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail5")
               LET g_detail_idx2 = l_ac
               
               #add-point:page2, before row動作
               
               #end add-point
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx2)
               LET l_ac = DIALOG.getCurrentRow("s_detail5")
               LET g_current_page = 5
               CALL astm301_idx_chk()
               #add-point:page2自定義行為
               
               #end add-point
      
         END DISPLAY
           DISPLAY ARRAY g_staz1_d TO s_detail6.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               CALL astm301_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail6")
               LET g_detail_idx2 = l_ac
               
               #add-point:page2, before row動作
               
               #end add-point
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx2)
               LET l_ac = DIALOG.getCurrentRow("s_detail6")
               LET g_current_page = 6
               CALL astm301_idx_chk()
               #add-point:page2自定義行為
               
               #end add-point
      
         END DISPLAY
         DISPLAY ARRAY g_stbx_d TO s_detail9.* ATTRIBUTES(COUNT=g_rec_b)  
          
           BEFORE ROW
              CALL astm301_idx_chk()
              LET l_ac = DIALOG.getCurrentRow("s_detail9")
              LET g_detail_idx = l_ac
              
              
           BEFORE DISPLAY
              CALL FGL_SET_ARR_CURR(g_detail_idx)
              LET l_ac = DIALOG.getCurrentRow("s_detail9")
              LET g_current_page = 9
              CALL astm301_idx_chk()

          
         END DISPLAY
         #end add-point
         
         SUBDIALOG lib_cl_dlg.cl_dlg_qryplan
         SUBDIALOG lib_cl_dlg.cl_dlg_relateapps
      
         BEFORE DIALOG
            CALL cl_navigator_setting(g_current_idx, g_detail_cnt)
            LET g_curr_diag = ui.DIALOG.getCurrent()
            LET g_page = "first"
            LET g_current_sw = FALSE
            #回歸舊筆數位置 (回到當時異動的筆數)
            LET g_current_idx = DIALOG.getCurrentRow("s_browse")
            IF g_current_row > 1 AND g_current_idx = 1 AND g_current_sw = FALSE THEN
               CALL DIALOG.setCurrentRow("s_browse",g_current_row)
               LET g_current_idx = g_current_row
            END IF
            LET g_current_row = g_current_idx #目前指標
            IF g_current_idx = 0 THEN
               LET g_current_idx = 1
            END IF
            LET g_current_sw = TRUE
            
            IF g_current_idx > g_browser.getLength() THEN
               LEt g_current_idx = g_browser.getLength()
            END IF 
            
            #有資料才進行fetch
            IF g_current_idx <> 0 THEN
               CALL astm301_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astm301_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astm301_idx_chk()
            
            #add-point:ui_dialog段before_dialog2
            
            #   CALL cl_set_act_visible("insert,modify,delete,reproduce,modify_detail,statechange", FALSE)    
            #END IF
            CALL cl_set_act_visible("insert,modify,delete,reproduce,statechange", FALSE)  #161108-00043#1 by 08172

        ON ACTION exporttoexcel
            LET g_action_choice="exporttoexcel"
            IF cl_auth_chk_act("exporttoexcel") THEN
               CALL g_export_node.clear()
               IF g_main_hidden = 1 THEN
                  LET g_export_node[1] = base.typeInfo.create(g_browser)
                  LET g_export_id[1]   = "s_browse"
                  CALL cl_export_to_excel()
               #非browser
               ELSE
                  LET g_export_node[1] = base.typeInfo.create(g_stao_d)
                  LET g_export_id[1]   = "s_detail1"
                  LET g_export_node[2] = base.typeInfo.create(g_stao2_d)
                  LET g_export_id[2]   = "s_detail2"
                  LET g_export_node[3] = base.typeInfo.create(g_stap_d)
                  LET g_export_id[3]   = "s_detail3"
                  LET g_export_node[4] = base.typeInfo.create(g_stax_d)
                  LET g_export_id[4]   = "s_detail4"
                  CALL cl_export_to_excel_getpage()
                  CALL cl_export_to_excel()
               END IF   
            END IF
            #end add-point
            
            #NEXT FIELD stao002
        
         ON ACTION statechange
            CALL astm301_statechange()
            LET g_action_choice = "statechange"
            EXIT DIALOG
      
         
          
         #ACTION表單列
         ON ACTION filter
            CALL astm301_filter()
            EXIT DIALOG
         
         ON ACTION first
            CALL astm301_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm301_idx_chk()
            
         ON ACTION previous
            CALL astm301_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm301_idx_chk()
            
         ON ACTION jump
            CALL astm301_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm301_idx_chk()
            
         ON ACTION next
            CALL astm301_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm301_idx_chk()
            
         ON ACTION last
            CALL astm301_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astm301_idx_chk()
            
         ON ACTION close
            LET INT_FLAG = FALSE
            LET g_action_choice = "exit"
            EXIT DIALOG
          
         ON ACTION exit
            LET g_action_choice = "exit"
            EXIT DIALOG
      
         ON ACTION mainhidden       #主頁摺疊
            IF g_main_hidden THEN
               CALL gfrm_curr.setElementHidden("mainlayout",0)
               CALL gfrm_curr.setElementHidden("worksheet",1)
               LET g_main_hidden = 0
            ELSE
               CALL gfrm_curr.setElementHidden("mainlayout",1)
               CALL gfrm_curr.setElementHidden("worksheet",0)
               LET g_main_hidden = 1
            END IF
            
         ON ACTION worksheethidden   #瀏覽頁折疊
            IF g_main_hidden THEN
               CALL gfrm_curr.setElementHidden("mainlayout",0)
               CALL gfrm_curr.setElementHidden("worksheet",1)
               LET g_main_hidden = 0
            ELSE
               CALL gfrm_curr.setElementHidden("mainlayout",1)
               CALL gfrm_curr.setElementHidden("worksheet",0)
               LET g_main_hidden = 1
            END IF
       
         ON ACTION controls      #單頭摺疊，可利用hot key "Ctrl-s"開啟/關閉單頭
            IF g_header_hidden THEN
               CALL gfrm_curr.setElementHidden("vb_master",0)
               CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
               LET g_header_hidden = 0     #visible
            ELSE
               CALL gfrm_curr.setElementHidden("vb_master",1)
               CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
               LET g_header_hidden = 1     #hidden     
            END IF
    
         
 
         ON ACTION delete
 
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN 
               CALL astm301_delete()
               #add-point:ON ACTION delete
               
               #END add-point
            END IF
 
 
         ON ACTION insert
 
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN 
               CALL astm301_insert()
               #add-point:ON ACTION insert
               
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION modify
 
            LET g_aw = ''
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN 
               CALL astm301_modify()
               #add-point:ON ACTION modify
               
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION modify_detail
 
            LET g_aw = g_curr_diag.getCurrentItem()
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN 
               CALL astm301_modify()
               #add-point:ON ACTION modify_detail
               
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION output
 
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN 
               #add-point:ON ACTION output
               
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION query
 
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN 
               CALL astm301_query()
               #add-point:ON ACTION query
               
               #END add-point
            END IF
 
 
         ON ACTION reproduce
 
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN 
               CALL astm301_reproduce()
               #add-point:ON ACTION reproduce
               
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION prog_stan005
 
            LET g_action_choice="prog_stan005"
            IF cl_auth_chk_act("prog_stan005") THEN 
               CALL cl_cmdrun_wait("apmm800")
               #add-point:ON ACTION prog_stan005
               
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION prog_stan004
 
            LET g_action_choice="prog_stan004"
            IF cl_auth_chk_act("prog_stan004") THEN 
               CALL cl_cmdrun_wait("astm201")
               #add-point:ON ACTION prog_stan004
               
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION prog_stan006
 
            LET g_action_choice="prog_stan006"
            IF cl_auth_chk_act("prog_stan006") THEN 
               CALL cl_cmdrun_wait("aooi140")
               #add-point:ON ACTION prog_stan006
               
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION prog_stan007
 
            LET g_action_choice="prog_stan007"
            IF cl_auth_chk_act("prog_stan007") THEN 
               CALL cl_cmdrun_wait("aooi610")
               #add-point:ON ACTION prog_stan007
               
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION prog_stan009
 
            LET g_action_choice="prog_stan009"
            IF cl_auth_chk_act("prog_stan009") THEN 
               CALL cl_cmdrun_wait("asti201")
               #add-point:ON ACTION prog_stan009
               
               #END add-point
               EXIT DIALOG
            END IF
 
         ON ACTION astm301_01
            LET g_action_choice="astm301_01"
            IF cl_auth_chk_act("astm301_01") THEN 
               CALL astm301_01()
               EXIT DIALOG
            END IF
         
         #主選單用ACTION
         &include "main_menu.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl" 
            CONTINUE DIALOG
            
      END DIALOG
    
      IF g_action_choice = "exit" AND NOT cl_null(g_action_choice) THEN
         EXIT WHILE
      END IF
    
   END WHILE    
      
   CALL cl_set_act_visible("accept,cancel", TRUE)
    
END FUNCTION
 
{</section>}
 
{<section id="astm301.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astm301_browser_fill(ps_page_action)
   {<Local define>}
   DEFINE ps_page_action    STRING
   DEFINE l_wc              STRING
   DEFINE l_wc2             STRING
   DEFINE l_sql             STRING
   DEFINE l_sub_sql         STRING
   DEFINE l_sql_rank        STRING
   DEFINE l_searchcol       STRING
   {</Local define>}
   #add-point:browser_fill段define
   DEFINE l_where           STRING  #161024-00025#6--add 
   CALL g_stap_d.clear()
   #end add-point    
 
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_stan_m.* TO NULL
   CALL g_stao_d.clear()        
   CALL g_stao2_d.clear() 
   CALL g_stao3_d.clear() 
   CALL g_stao4_d.clear()  
   CALL g_browser.clear()
   
   #搜尋用
   IF cl_null(g_searchcol) OR g_searchcol = '0' THEN
      LET l_searchcol = "stan001"
 
   ELSE
      LET l_searchcol = g_searchcol
   END IF
   
   LET l_wc  = g_wc.trim() 
   LET l_wc2 = g_wc2.trim()
   IF cl_null(l_wc) THEN  #p_wc 查詢條件
      RETURN
   END IF
   
   #add-point:browser_fill,foreach前
   #161024-00025#12----add----begin------------
   LET l_where = ''
   CALL s_aooi500_sql_where(g_prog,'stanunit') RETURNING l_where
   LET l_wc = l_wc," AND ",l_where
   LET g_wc = g_wc," AND ",l_where
   #161024-00025#12----add----end------------


   LET l_wc = l_wc CLIPPED," AND stan002 IN ('1','2','3','4','5') "
   LET g_wc = g_wc CLIPPED," AND stan002 IN ('1','2','3','4','5') "
   #160810-00002#1 160812 by lori mark---(S)
   #IF cl_null(l_wc2) THEN 
   #   LET l_wc2 = " 1=1"
   #END IF 
   #IF cl_null(g_wc2) THEN 
   #   LET g_wc2 = " 1=1"
   #END IF 
   #160810-00002#1 160812 by lori mark---(E)
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT UNIQUE stan001 ",
 
                        " FROM stan_t ",
                              " ",
                              " LEFT JOIN stao_t ON staoent = stanent AND stan001 = stao001 ",
                              " LEFT JOIN staq_t ON staqent = stanent AND stan001 = staq001", 
 
 
 
                              " ", 
                              " ", 
                       " WHERE stanent = '" ||g_enterprise|| "' AND staoent = '" ||g_enterprise|| "' AND ",l_wc, " AND ", l_wc2
 
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT UNIQUE stan001 ",
 
                        " FROM stan_t ", 
                              " ",
                              " ",
                        "WHERE stanent = '" ||g_enterprise|| "' AND ",l_wc CLIPPED
 
   END IF
   
   LET g_sql = " SELECT COUNT(*) FROM (",l_sub_sql,")"
   
   #add-point:browser_fill,count前
   IF cl_null(g_wc2_table1) THEN 
      LET g_wc2_table1 = " 1=1"
   END IF 
   IF cl_null(g_wc2_table2) THEN 
      LET g_wc2_table2 = " 1=1"
   END IF 
   IF cl_null(g_wc2_table3) THEN 
      LET g_wc2_table3 = " 1=1"
   END IF 
   IF cl_null(g_wc2_table4) THEN 
      LET g_wc2_table4 = " 1=1"
   END IF 
   IF cl_null(g_wc2_table5) THEN 
      LET g_wc2_table5 = " 1=1"
   END IF 
   IF cl_null(g_wc2_table6) THEN 
      LET g_wc2_table6 = " 1=1"
   END IF 
   IF cl_null(g_wc2_table7) THEN 
      LET g_wc2_table7 = " 1=1"
   END IF 
   IF cl_null(g_wc2_table8) THEN 
      LET g_wc2_table8 = " 1=1"
   END IF 
   IF cl_null(g_wc2_table9) THEN 
      LET g_wc2_table9 = " 1=1"
   END IF 
   LET l_sub_sql = " SELECT UNIQUE stan001 ",
                   "   FROM stan_t "
   IF g_wc2_table1 <> " 1=1" THEN 
      LET l_sub_sql = l_sub_sql," LEFT JOIN stao_t ON staoent = stanent AND stan001 = stao001 "
   END IF 
   IF g_wc2_table2 <> " 1=1" THEN 
      LET l_sub_sql = l_sub_sql," LEFT JOIN staq_t ON staqent = stanent AND stan001 = staq001 "
   END IF 
   IF g_wc2_table3 <> " 1=1" THEN 
      LET l_sub_sql = l_sub_sql," LEFT JOIN stap_t ON stapent = stanent AND stan001 = stap001 "
   END IF 
   IF g_wc2_table4 <> " 1=1" THEN 
      LET l_sub_sql = l_sub_sql," LEFT JOIN stax_t ON staxent = stanent AND stan001 = stax001 "
   END IF 
   IF g_wc2_table5 <> " 1=1" OR g_wc2_table6 <> " 1=1" THEN 
      LET l_sub_sql = l_sub_sql," LEFT JOIN staz_t ON stazent = stanent AND staz001 = stan001 "
   END IF 
   IF g_wc2_table7 <> " 1=1" THEN 
      LET l_sub_sql = l_sub_sql," LEFT JOIN stbk_t ON stbkent = stanent AND stbk001 = stan001  "
   END IF 
   IF g_wc2_table8 <> " 1=1" THEN 
      LET l_sub_sql = l_sub_sql," LEFT JOIN stbo_t ON stboent = stanent AND stbo001 = stan001  "
   END IF 
   IF g_wc2_table9 <> " 1=1" THEN 
      LET l_sub_sql = l_sub_sql," LEFT JOIN stbx_t ON stbxent = stanent AND stbx001 = stan001  "
   END IF 
   LET l_sub_sql = l_sub_sql," WHERE stanent = '" ||g_enterprise|| "' AND ",l_wc, " AND ", l_wc2 CLIPPED,cl_sql_add_filter("stan_t")  #161214-00032#1 add  CLIPPED,cl_sql_add_filter("stan_t") 
   LET g_sql = " SELECT COUNT(*) FROM (",l_sub_sql,")"
   #end add-point
   
   PREPARE header_cnt_pre FROM g_sql
   EXECUTE header_cnt_pre INTO g_browser_cnt   #總筆數
   FREE header_cnt_pre
 
   DISPLAY g_browser_cnt TO FORMONLY.b_count   #總筆數的顯示
   DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
   
   #LET g_page_action = ps_page_action          # Keep Action
   
   IF ps_page_action = "F" OR
      ps_page_action = "P" OR
      ps_page_action = "N" OR
      ps_page_action = "L" THEN
      LET g_page_action = ps_page_action
   END IF
   
   CASE ps_page_action
      WHEN "F" 
         LET g_pagestart = 1
          
      WHEN "P"  
         LET g_pagestart = g_pagestart - g_max_browse
         IF g_pagestart < 1 THEN
            LET g_pagestart = 1
         END IF
          
      WHEN "N"  
         LET g_pagestart = g_pagestart + g_max_browse
         IF g_pagestart > g_browser_cnt THEN
            LET g_pagestart = g_browser_cnt - (g_browser_cnt mod g_max_browse) + 1
            WHILE g_pagestart > g_browser_cnt 
               LET g_pagestart = g_pagestart - g_max_browse
            END WHILE
         END IF
      
      WHEN "L"  
         LET g_pagestart = g_browser_cnt - (g_browser_cnt mod g_max_browse) + 1
         WHILE g_pagestart > g_browser_cnt 
            LET g_pagestart = g_pagestart - g_max_browse
         END WHILE
         
      WHEN '/'
         LET g_pagestart = g_jump
         IF g_pagestart > g_browser_cnt THEN
            LET g_pagestart = 1
         END IF
         
   END CASE
  
   #單身有輸入查詢條件且非null
   IF g_wc2 <> " 1=1" AND NOT cl_null(g_wc2) THEN 
      #依照stan001,stan002,stan003,stan004,stan005,stan006,stan007,stan008,stan009,stan010,stan011,stan012,stan013,stan014,stan015,stan016,stan017,stan018,stan019,stan020,stan021,stanunit Browser欄位定義(取代原本bs_sql功能)
      LET l_sql_rank = "SELECT DISTINCT stanstus,stan001,stan002,stan003,stan004,stan005,stan006,stan007, 
          stan008,stan022,stan023,stan024,stan025,stan026,stan027,stan028,stan009,stan010,stan011,stan012,stan013,stan014,stan015,stan016,stan017,stan018,stan019, 
          stan020,stan021,stanunit,DENSE_RANK() OVER(ORDER BY stan001 ",g_order,") AS RANK ",
                        " FROM stan_t ",
                              " ",
                              " LEFT JOIN stao_t ON staoent = stanent AND stan001 = stao001 ",
                              " LEFT JOIN staq_t ON staqent = stanent AND stan001 = staq001",
 
 
 
                              " ",
                              " ",
                       " ",
                       " WHERE stanent = '" ||g_enterprise|| "' AND ",g_wc," AND ",g_wc2
   ELSE
      #單身無輸入資料
      LET l_sql_rank = "SELECT DISTINCT stanstus,stan001,stan002,stan003,stan004,stan005,stan006,stan007, 
          stan008,stan022,stan023,stan024,stan025,stan026,stan027,stan028,stan009,stan010,stan011,stan012,stan013,stan014,stan015,stan016,stan017,stan018,stan019, 
          stan020,stan021,stanunit,DENSE_RANK() OVER(ORDER BY stan001 ",g_order,") AS RANK ",
                       " FROM stan_t ",
                            "  ",
                            "  ",
                       " WHERE stanent = '" ||g_enterprise|| "' AND ", g_wc
   END IF
   
   #定義翻頁CURSOR
   LET g_sql= "SELECT stanstus,stan001,stan002,stan003,stan004,stan005,stan006,stan007,stan008,stan022,stan023,stan024,stan025,stan026,stan027,stan028,stan009, 
       stan010,stan011,stan012,stan013,stan014,stan015,stan016,stan017,stan018,stan019,stan020,stan021, 
       stanunit FROM (",l_sql_rank,") WHERE ",
              " RANK >= ",1," AND RANK<",1+g_max_browse,
              " ORDER BY ",l_searchcol," ",g_order
               
   #add-point:browser_fill,before_prepare
   LET l_sql_rank = "SELECT DISTINCT stanstus,stan001,stan002,stan003,stan004,stan005,stan006,stan007,stan008,stan022,stan023,stan024,stan025,stan026,stan027,stan028,stan009,stan010,stan011,stan012,stan013,stan014,stan015,stan016,stan017,stan018,stan019,stan020,stan021,stanunit,DENSE_RANK() OVER(ORDER BY stan001 ",g_order,") AS RANK ",
                    "  FROM stan_t "
   IF g_wc2_table1 <> " 1=1" THEN 
      LET l_sql_rank = l_sql_rank," LEFT JOIN stao_t ON staoent = stanent AND stan001 = stao001 "
   END IF 
   IF g_wc2_table2 <> " 1=1" THEN 
      LET l_sql_rank = l_sql_rank," LEFT JOIN staq_t ON staqent = stanent AND stan001 = staq001"
   END IF 
   IF g_wc2_table3 <> " 1=1" THEN 
      LET l_sql_rank = l_sql_rank," LEFT JOIN stap_t ON stapent = stanent AND stan001 = stap001 "
   END IF 
   IF g_wc2_table4 <> " 1=1" THEN 
      LET l_sql_rank = l_sql_rank," LEFT JOIN stax_t ON staxent = stanent AND stan001 = stax001"
   END IF 
   IF g_wc2_table5 <> " 1=1" OR g_wc2_table6 <> " 1=1" THEN 
      LET l_sql_rank = l_sql_rank," LEFT JOIN staz_t ON stazent = stanent AND staz001 = stan001 "
   END IF 
   IF g_wc2_table7 <> " 1=1" THEN 
      LET l_sql_rank = l_sql_rank," LEFT JOIN stbk_t ON stbkent = stanent AND stbk001 = stan001  "
   END IF 
   IF g_wc2_table8 <> " 1=1" THEN 
      LET l_sql_rank = l_sql_rank," LEFT JOIN stbo_t ON stboent = stanent AND stbo001 = stan001  "
   END IF 
   IF g_wc2_table9 <> " 1=1" THEN 
      LET l_sql_rank = l_sql_rank," LEFT JOIN stbx_t ON stbxent = stanent AND stbx001 = stan001  "
   END IF 
   LET l_sql_rank = l_sql_rank," WHERE stanent = '" ||g_enterprise|| "' AND ",g_wc," AND ",g_wc2 CLIPPED,cl_sql_add_filter("stan_t")  #161214-00032#1 add  CLIPPED,cl_sql_add_filter("stan_t") 
   #定義翻頁CURSOR
   LET g_sql= "SELECT stanstus,stan001,stan002,stan003,stan004,stan005,stan006,stan007,stan008,stan009,stan010,stan011,stan012,stan013,stan014,stan015,stan016,stan017,stan018,stan019,stan020,stan021,stanunit FROM (",l_sql_rank,") WHERE ",
              " RANK >= ",1," AND RANK<",1+g_max_browse,
              " ORDER BY ",l_searchcol," ",g_order 
   #end add-point
               
   PREPARE browse_pre FROM g_sql
   DECLARE browse_cur CURSOR FOR browse_pre
   
   #add-point:browser_fill,open
   
   #end add-point
 
   CALL g_browser.clear()
   LET g_cnt = 1
   FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stan001,g_browser[g_cnt].b_stan002, 
       g_browser[g_cnt].b_stan003,g_browser[g_cnt].b_stan004,g_browser[g_cnt].b_stan005,g_browser[g_cnt].b_stan006, 
       g_browser[g_cnt].b_stan007,g_browser[g_cnt].b_stan008,g_browser[g_cnt].b_stan009,g_browser[g_cnt].b_stan010, 
       g_browser[g_cnt].b_stan011,g_browser[g_cnt].b_stan012,g_browser[g_cnt].b_stan013,g_browser[g_cnt].b_stan014, 
       g_browser[g_cnt].b_stan015,g_browser[g_cnt].b_stan016,g_browser[g_cnt].b_stan017,g_browser[g_cnt].b_stan018, 
       g_browser[g_cnt].b_stan019,g_browser[g_cnt].b_stan020,g_browser[g_cnt].b_stan021,g_browser[g_cnt].b_stanunit 
 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()
 
         EXIT FOREACH
      END IF
  
      
  
      #add-point:browser_fill段reference
      SELECT pmaal004 INTO g_browser[g_cnt].b_stan005_desc FROM pmaal_t
       WHERE pmaalent = g_enterprise AND pmaal001 = g_browser[g_cnt].b_stan005 AND pmaal002 = g_dlang
      #end add-point
  
            #此段落由子樣板a24產生
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/open.png"
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/void.png"
 
         WHEN "Y"
            LET g_browser[g_cnt].b_statepic = "stus/16/valid.png"
 
 
         
      END CASE
 
 
      LET g_cnt = g_cnt + 1
      IF g_cnt > g_max_rec THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 9035
         LET g_errparam.extend = ''
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         EXIT FOREACH
      END IF
      
   END FOREACH
 
   CALL g_browser.deleteElement(g_cnt)
   LET g_header_cnt = g_browser.getLength()
 
   LET g_rec_b = g_cnt - 1
   LET g_detail_cnt = g_rec_b
   LET g_cnt = 0
   
   FREE browse_pre
   
   #add-point:browser_fill段結束前
   
   #end add-point
   
   #若無資料則關閉相關功能
   IF g_browser_cnt = 0 THEN
      CALL cl_set_act_visible("statechange,modify,delete,reproduce", FALSE)
   ELSE
      CALL cl_set_act_visible("statechange,modify,delete,reproduce", TRUE)
   END IF
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astm301_ui_headershow()
   #add-point:ui_headershow段define
   
   #end add-point    
   
   LET g_stan_m.stan001 = g_browser[g_current_idx].b_stan001   
 
    SELECT UNIQUE stan002,stan001,stan003,stan021,stan005,stan004,stanunit,stan006,stan007,stan008,
        stan022,stan023,stan024,stan025,stan026,stan027,stan028, #150506-00007#4 150523 by sakura add
        stan029,stan030,stan031,stan032,
        stan009, 
        stan010,stan015,stan016,stan011,stan012,stan013,stan014,stan017,stan018,stan019,stan020,stanstus, 
        stanownid,stanowndp,stancrtid,stancrtdp,stancrtdt,stanmodid,stanmoddt,stancnfid,stancnfdt
 INTO g_stan_m.stan002,g_stan_m.stan001,g_stan_m.stan003,g_stan_m.stan021,g_stan_m.stan005,g_stan_m.stan004, 
     g_stan_m.stanunit,g_stan_m.stan006,g_stan_m.stan007,g_stan_m.stan008,
     g_stan_m.stan022,g_stan_m.stan023,g_stan_m.stan024,g_stan_m.stan025,g_stan_m.stan026,g_stan_m.stan027,g_stan_m.stan028, #150506-00007#4 150523 by sakura add
     g_stan_m.stan029,g_stan_m.stan030,g_stan_m.stan031,g_stan_m.stan032,
     g_stan_m.stan009,g_stan_m.stan010, 
     g_stan_m.stan015,g_stan_m.stan016,g_stan_m.stan011,g_stan_m.stan012,g_stan_m.stan013,g_stan_m.stan014, 
     g_stan_m.stan017,g_stan_m.stan018,g_stan_m.stan019,g_stan_m.stan020,g_stan_m.stanstus,g_stan_m.stanownid, 
     g_stan_m.stanowndp,g_stan_m.stancrtid,g_stan_m.stancrtdp,g_stan_m.stancrtdt,g_stan_m.stanmodid, 
     g_stan_m.stanmoddt,g_stan_m.stancnfid,g_stan_m.stancnfdt
 FROM stan_t
 WHERE stanent = g_enterprise AND stan001 = g_stan_m.stan001
   CALL astm301_show()
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astm301_ui_detailshow()
   #add-point:ui_detailshow段define
   
   #end add-point    
   
   #add-point:ui_detailshow段before
   
   #end add-point    
   
   IF g_curr_diag IS NOT NULL THEN
      CALL g_curr_diag.setCurrentRow("s_detail1",g_detail_idx)      
      CALL g_curr_diag.setCurrentRow("s_detail2",g_detail_idx)
 
 
   END IF
   
   #add-point:ui_detailshow段after
   
   #end add-point    
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astm301_ui_browser_refresh()
   {<Local define>}
   DEFINE l_i  LIKE type_t.num10
   {</Local define>}
   #add-point:ui_browser_refresh段define
   
   #end add-point    
   
   FOR l_i =1 TO g_browser.getLength()
      IF g_browser[l_i].b_stan001 = g_stan_m.stan001 
 
         THEN  
         CALL g_browser.deleteElement(l_i)
         LET g_header_cnt = g_header_cnt - 1
      END IF
   END FOR
 
   LET g_browser_cnt = g_browser_cnt - 1
   IF g_current_row > g_browser_cnt THEN        #確定browse 筆數指在同一筆
      LET g_current_row = g_browser_cnt
   END IF
 
   #DISPLAY g_browser_cnt TO FORMONLY.b_count    #總筆數的顯示
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astm301_construct()
   DEFINE ls_return   STRING
   DEFINE ls_result   STRING 
   DEFINE ls_wc       STRING 
   #add-point:cs段define
   DEFINE  l_sys      LIKE type_t.num5
   #end add-point    
 
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_stan_m.* TO NULL
   CALL g_stao_d.clear()        
   CALL g_stao2_d.clear() 
   CALL g_stao3_d.clear() 
   CALL g_stao4_d.clear() 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
   INITIALIZE g_wc2_table2 TO NULL
   INITIALIZE g_wc2_table7 TO NULL
   INITIALIZE g_wc2_table8 TO NULL
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前
   CALL g_stap_d.clear()
   CALL g_stbx_d.clear()
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON stanunit,stan002,stan001,stan003,stan004,stan029,stan021,stan005,stan016,stan017,stan018,
          stan012,stan014,stan038,stan013,stan034,stan035,stan036,stan015,stan009,stan010,stan032,stan031,stan033,
          stan019,stan020,stan039,stan027,stan028,stan008,stan022,stan006,stan007,stan023,stan037,
          stan024,stan025,stan026,stan011,stanstus,stanownid,stanowndp,stancrtid,stancrtdp,
          stancrtdt,stanmodid,stanmoddt,stancnfid,stancnfdt
 
         BEFORE CONSTRUCT
            #add-point:cs段before_construct
            
            #end add-point 
            
         #公用欄位開窗相關處理
         #此段落由子樣板a11產生
         ##----<<stanownid>>----
         #ON ACTION controlp INFIELD stanownid
         #   CALL q_common('stan_t','stanownid',TRUE,FALSE,g_stan_m.stanownid) RETURNING ls_return
         #   DISPLAY ls_return TO stanownid
         #   NEXT FIELD stanownid  
         #
         ##----<<stanowndp>>----
         #ON ACTION controlp INFIELD stanowndp
         #   CALL q_common('stan_t','stanowndp',TRUE,FALSE,g_stan_m.stanowndp) RETURNING ls_return
         #   DISPLAY ls_return TO stanowndp
         #   NEXT FIELD stanowndp
         #
         ##----<<stancrtid>>----
         #ON ACTION controlp INFIELD stancrtid
         #   CALL q_common('stan_t','stancrtid',TRUE,FALSE,g_stan_m.stancrtid) RETURNING ls_return
         #   DISPLAY ls_return TO stancrtid
         #   NEXT FIELD stancrtid
         #
         ##----<<stancrtdp>>----
         #ON ACTION controlp INFIELD stancrtdp
         #   CALL q_common('stan_t','stancrtdp',TRUE,FALSE,g_stan_m.stancrtdp) RETURNING ls_return
         #   DISPLAY ls_return TO stancrtdp
         #   NEXT FIELD stancrtdp
         #
         ##----<<stanmodid>>----
         #ON ACTION controlp INFIELD stanmodid
         #   CALL q_common('stan_t','stanmodid',TRUE,FALSE,g_stan_m.stanmodid) RETURNING ls_return
         #   DISPLAY ls_return TO stanmodid
         #   NEXT FIELD stanmodid
         #
         ##----<<stancnfid>>----
         #ON ACTION controlp INFIELD stancnfid
         #   CALL q_common('stan_t','stancnfid',TRUE,FALSE,g_stan_m.stancnfid) RETURNING ls_return
         #   DISPLAY ls_return TO stancnfid
         #   NEXT FIELD stancnfid
         #
         ##----<<stanpstid>>----
         ##ON ACTION controlp INFIELD stanpstid
         ##   CALL q_common('stan_t','stanpstid',TRUE,FALSE,g_stan_m.stanpstid) RETURNING ls_return
         ##   DISPLAY ls_return TO stanpstid
         ##   NEXT FIELD stanpstid
         
         ##----<<stancrtdt>>----
         AFTER FIELD stancrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stanmoddt>>----
         AFTER FIELD stanmoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stancnfdt>>----
         AFTER FIELD stancnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stanpstdt>>----
         #AFTER FIELD stanpstdt
         #   CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
         #   IF NOT cl_null(ls_result) THEN
         #      IF NOT cl_chk_date_symbol(ls_result) THEN
         #         LET ls_result = cl_add_date_extra_cond(ls_result)
         #      END IF
         #   END IF
         #   CALL FGL_DIALOG_SETBUFFER(ls_result)
 
 
            
         #一般欄位開窗相關處理    
         #---------------------------<  Master  >---------------------------
         #----<<stanunit>>----
         #Ctrlp:construct.c.stanunit
         ON ACTION controlp INFIELD stanunit
            #add-point:ON ACTION controlp INFIELD stanunit
                        #此段落由子樣板a08產生
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
#			   LET g_qryparam.where = "ooef201 = 'Y'"
#            CALL q_ooef001()                           #呼叫開窗
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stanunit',g_site,'c')
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stanunit  #顯示到畫面上

            NEXT FIELD stanunit                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stanunit
            #add-point:BEFORE FIELD stanunit
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stanunit
            
            #add-point:AFTER FIELD stanunit
            
            #END add-point
            
 
         #----<<stan002>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan002
            #add-point:BEFORE FIELD stan002
            
            #END add-point
       
         #此段落由子樣板a02產生
         AFTER FIELD stan002
            
            #add-point:AFTER FIELD stan002
            
            #END add-point
            
       
         #Ctrlp:construct.c.stan002
         ON ACTION controlp INFIELD stan002
            #add-point:ON ACTION controlp INFIELD stan002
            
            #END add-point
 
         #----<<stan001>>----
         #Ctrlp:construct.c.stan001
         ON ACTION controlp INFIELD stan001
            #add-point:ON ACTION controlp INFIELD stan001
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_stan001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stan001  #顯示到畫面上

            NEXT FIELD stan001                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan001
            #add-point:BEFORE FIELD stan001
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan001
            
            #add-point:AFTER FIELD stan001
            
            #END add-point
            
 
         #----<<stan003>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan003
            #add-point:BEFORE FIELD stan003
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan003
            
            #add-point:AFTER FIELD stan003
            
            #END add-point
            
 
         #Ctrlp:construct.c.stan003
         ON ACTION controlp INFIELD stan003
            #add-point:ON ACTION controlp INFIELD stan003
            
            #END add-point
 
         #----<<stan021>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan021
            #add-point:BEFORE FIELD stan021
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan021
            
            #add-point:AFTER FIELD stan021
            
            #END add-point
            
 
         #Ctrlp:construct.c.stan021
         ON ACTION controlp INFIELD stan021
            #add-point:ON ACTION controlp INFIELD stan021
            
            #END add-point
 
         #----<<stan005>>----
         #Ctrlp:construct.c.stan005
         ON ACTION controlp INFIELD stan005
            #add-point:ON ACTION controlp INFIELD stan005
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
		   LET g_qryparam.arg1 = "('1','3')"
            CALL q_pmaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stan005  #顯示到畫面上

            NEXT FIELD stan005                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan005
            #add-point:BEFORE FIELD stan005
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan005
            
            #add-point:AFTER FIELD stan005
            
            #END add-point
            
 
         #----<<stan004>>----
         #Ctrlp:construct.c.stan004
         ON ACTION controlp INFIELD stan004
            #add-point:ON ACTION controlp INFIELD stan004
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_stag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stan004  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO stagl003 #說明 

            NEXT FIELD stan004                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan004
            #add-point:BEFORE FIELD stan004
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan004
            
            #add-point:AFTER FIELD stan004
            
            #END add-point
            
 
         #----<<stan006>>----
         #Ctrlp:construct.c.stan006
         ON ACTION controlp INFIELD stan006
            #add-point:ON ACTION controlp INFIELD stan006
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stan006  #顯示到畫面上

            NEXT FIELD stan006                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan006
            #add-point:BEFORE FIELD stan006
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan006
            
            #add-point:AFTER FIELD stan006
            
            #END add-point
            
 
         #----<<stan007>>----
         #Ctrlp:construct.c.stan007
         ON ACTION controlp INFIELD stan007
            #add-point:ON ACTION controlp INFIELD stan007
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1 = g_site
            CALL q_oodb002_1()                      #呼叫開窗
            DISPLAY g_qryparam.return1 TO stan007  #顯示到畫面上

            NEXT FIELD stan007                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan007
            #add-point:BEFORE FIELD stan007
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan007
            
            #add-point:AFTER FIELD stan007
            
            #END add-point
            
 
         #----<<stan008>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan008
            #add-point:BEFORE FIELD stan008
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan008
            
            #add-point:AFTER FIELD stan008
            
            #END add-point
            
 
         #Ctrlp:construct.c.stan008
         ON ACTION controlp INFIELD stan008
            #add-point:ON ACTION controlp INFIELD stan008
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
		      LET g_qryparam.reqry = FALSE
            CALL q_ooib002_1()                      #呼叫開窗
            DISPLAY g_qryparam.return1 TO stan008  #顯示到畫面上

            NEXT FIELD stan008                     #返回原欄位
            #END add-point
 
         #150506-00007#4 150523 by sakura add---STR
         #交易條件
         ON ACTION controlp INFIELD stan022
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = '238'
            CALL q_oocq002()
            DISPLAY g_qryparam.return1 TO stan022
            NEXT FIELD stan022
         #發票類型
         ON ACTION controlp INFIELD stan023
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = g_ooef019 #稅區
            LET g_qryparam.arg2 = "1"       #進銷項類型            
            CALL q_isac002_2()
            DISPLAY g_qryparam.return1 TO stan023
            NEXT FIELD stan023         
         #150506-00007#4 150523 by sakura add---END
 
         #----<<stan009>>----
         #Ctrlp:construct.c.stan009
         ON ACTION controlp INFIELD stan009
            #add-point:ON ACTION controlp INFIELD stan009
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stan009  #顯示到畫面上

            NEXT FIELD stan009                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan009
            #add-point:BEFORE FIELD stan009
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan009
            
            #add-point:AFTER FIELD stan009
            
            #END add-point
            
 
         #----<<stan010>>----
         #Ctrlp:construct.c.stan010
         ON ACTION controlp INFIELD stan010
            #add-point:ON ACTION controlp INFIELD stan010
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			LET g_qryparam.arg1 = "2060"
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stan010  #顯示到畫面上

            NEXT FIELD stan010                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan010
            #add-point:BEFORE FIELD stan010
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan010
            
            #add-point:AFTER FIELD stan010
            
            #END add-point
            
 
         #----<<stan015>>----
         #Ctrlp:construct.c.stan015
         ON ACTION controlp INFIELD stan015
            #add-point:ON ACTION controlp INFIELD stan015
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			#LET g_qryparam.arg1 ='A' 
#			   LET g_qryparam.where = "ooef212 = 'Y'"
#            CALL q_ooef001()                     #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stan015') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stan015',g_site,'c')
               CALL q_ooef001_24() 
            ELSE
               LET g_qryparam.where = "ooef212 = 'Y'"
               CALL q_ooef001() 
            END IF
            DISPLAY g_qryparam.return1 TO stan015  #顯示到畫面上

            NEXT FIELD stan015                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan015
            #add-point:BEFORE FIELD stan015
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan015
            
            #add-point:AFTER FIELD stan015
            
            #END add-point
            
 
         #----<<stan016>>----
         #Ctrlp:construct.c.stan016
         ON ACTION controlp INFIELD stan016
            #add-point:ON ACTION controlp INFIELD stan016
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			#LET g_qryparam.arg1 = 'D'
#			   LET g_qryparam.where = "ooef303 = 'Y'"
#			   CALL q_ooef001()                      #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stan016') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stan016',g_site,'c')
               CALL q_ooef001_24() 
            ELSE
               LET g_qryparam.where = "ooef303 = 'Y'"
               CALL q_ooef001() 
            END IF
            DISPLAY g_qryparam.return1 TO stan016  #顯示到畫面上

            NEXT FIELD stan016                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan016
            #add-point:BEFORE FIELD stan016
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan016
            
            #add-point:AFTER FIELD stan016
            
            #END add-point
            
 
         #----<<stan011>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan011
            #add-point:BEFORE FIELD stan011
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan011
            
            #add-point:AFTER FIELD stan011
            
            #END add-point
            
 
         #Ctrlp:construct.c.stan011
         ON ACTION controlp INFIELD stan011
            #add-point:ON ACTION controlp INFIELD stan011
            
            #END add-point
 
         #----<<stan012>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan012
            #add-point:BEFORE FIELD stan012
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan012
            
            #add-point:AFTER FIELD stan012
            
            #END add-point
            
 
         #Ctrlp:construct.c.stan012
         ON ACTION controlp INFIELD stan012
            #add-point:ON ACTION controlp INFIELD stan012
            
            #END add-point
 
         #----<<stan013>>----
         #Ctrlp:construct.c.stan013
         ON ACTION controlp INFIELD stan013
            #add-point:ON ACTION controlp INFIELD stan013
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			#LET g_qryparam.arg1 = '1'
#			   LET g_qryparam.where = "ooef003 = 'Y'"
#            CALL q_ooef001()                           #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stan013') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stan013',g_site,'c')
               CALL q_ooef001_24() 
            ELSE
               LET g_qryparam.where = "ooef003 = 'Y'"
               CALL q_ooef001() 
            END IF
            DISPLAY g_qryparam.return1 TO stan013  #顯示到畫面上

            NEXT FIELD stan013                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan013
            #add-point:BEFORE FIELD stan013
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan013
            
            #add-point:AFTER FIELD stan013
            
            #END add-point
            
 
         #----<<stan014>>----
         #Ctrlp:construct.c.stan014
         ON ACTION controlp INFIELD stan014
            #add-point:ON ACTION controlp INFIELD stan014
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stan014  #顯示到畫面上

            NEXT FIELD stan014                     #返回原欄位

         ON ACTION controlp INFIELD stan038
            #add-point:ON ACTION controlp INFIELD stan014
                                    #此段落由子樣板a08產生
            #開窗c段
		    	INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
			   LET g_qryparam.arg1 = g_today
            CALL q_ooeg001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stan038  #顯示到畫面上

            NEXT FIELD stan038                     #返回原欄位
            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan014
            #add-point:BEFORE FIELD stan014
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan014
            
            #add-point:AFTER FIELD stan014
            
            #END add-point
            
 
         #----<<stan017>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan017
            #add-point:BEFORE FIELD stan017
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan017
            
            #add-point:AFTER FIELD stan017
            
            #END add-point
            
 
         #Ctrlp:construct.c.stan017
         ON ACTION controlp INFIELD stan017
            #add-point:ON ACTION controlp INFIELD stan017
            
            #END add-point
 
         #----<<stan018>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan018
            #add-point:BEFORE FIELD stan018
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan018
            
            #add-point:AFTER FIELD stan018
            
            #END add-point
            
 
         #Ctrlp:construct.c.stan018
         ON ACTION controlp INFIELD stan018
            #add-point:ON ACTION controlp INFIELD stan018
            
            #END add-point
 
         #----<<stan019>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan019
            #add-point:BEFORE FIELD stan019
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan019
            
            #add-point:AFTER FIELD stan019
            
            #END add-point
            
 
         #Ctrlp:construct.c.stan019
         ON ACTION controlp INFIELD stan019
            #add-point:ON ACTION controlp INFIELD stan019
            
            #END add-point
 
         #----<<stan020>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan020
            #add-point:BEFORE FIELD stan020
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan020
            
            #add-point:AFTER FIELD stan020
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
            #END add-point
            
 
         #Ctrlp:construct.c.stan020
         ON ACTION controlp INFIELD stan020
            #add-point:ON ACTION controlp INFIELD stan020
            
            #END add-point
 
         #----<<stanstus>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stanstus
            #add-point:BEFORE FIELD stanstus
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stanstus
            
            #add-point:AFTER FIELD stanstus
            
            #END add-point
            
 
         #Ctrlp:construct.c.stanstus
         ON ACTION controlp INFIELD stanstus
            #add-point:ON ACTION controlp INFIELD stanstus
            
            #END add-point
 
         #----<<stanownid>>----
         #Ctrlp:construct.c.stanownid
         ON ACTION controlp INFIELD stanownid
            #add-point:ON ACTION controlp INFIELD stanownid
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stanownid  #顯示到畫面上

            NEXT FIELD stanownid                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stanownid
            #add-point:BEFORE FIELD stanownid
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stanownid
            
            #add-point:AFTER FIELD stanownid
            
            #END add-point
            
 
         #----<<stanowndp>>----
         #Ctrlp:construct.c.stanowndp
         ON ACTION controlp INFIELD stanowndp
            #add-point:ON ACTION controlp INFIELD stanowndp
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stanowndp  #顯示到畫面上

            NEXT FIELD stanowndp                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stanowndp
            #add-point:BEFORE FIELD stanowndp
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stanowndp
            
            #add-point:AFTER FIELD stanowndp
            
            #END add-point
            
 
         #----<<stancrtid>>----
         #Ctrlp:construct.c.stancrtid
         ON ACTION controlp INFIELD stancrtid
            #add-point:ON ACTION controlp INFIELD stancrtid
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stancrtid  #顯示到畫面上

            NEXT FIELD stancrtid                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stancrtid
            #add-point:BEFORE FIELD stancrtid
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stancrtid
            
            #add-point:AFTER FIELD stancrtid
            
            #END add-point
            
 
         #----<<stancrtdp>>----
         #Ctrlp:construct.c.stancrtdp
         ON ACTION controlp INFIELD stancrtdp
            #add-point:ON ACTION controlp INFIELD stancrtdp
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stancrtdp  #顯示到畫面上

            NEXT FIELD stancrtdp                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stancrtdp
            #add-point:BEFORE FIELD stancrtdp
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stancrtdp
            
            #add-point:AFTER FIELD stancrtdp
            
            #END add-point
            
 
         #----<<stancrtdt>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stancrtdt
            #add-point:BEFORE FIELD stancrtdt
            
            #END add-point
 
         #----<<stanmodid>>----
         #Ctrlp:construct.c.stanmodid
         ON ACTION controlp INFIELD stanmodid
            #add-point:ON ACTION controlp INFIELD stanmodid
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stanmodid  #顯示到畫面上

            NEXT FIELD stanmodid                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stanmodid
            #add-point:BEFORE FIELD stanmodid
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stanmodid
            
            #add-point:AFTER FIELD stanmodid
            
            #END add-point
            
 
         #----<<stanmoddt>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stanmoddt
            #add-point:BEFORE FIELD stanmoddt
            
            #END add-point
 
         #----<<stancnfid>>----
         #Ctrlp:construct.c.stancnfid
         ON ACTION controlp INFIELD stancnfid
            #add-point:ON ACTION controlp INFIELD stancnfid
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stancnfid  #顯示到畫面上

            NEXT FIELD stancnfid                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stancnfid
            #add-point:BEFORE FIELD stancnfid
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stancnfid
            
            #add-point:AFTER FIELD stancnfid
            
            #END add-point
            
 
         #----<<stancnfdt>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stancnfdt
            #add-point:BEFORE FIELD stancnfdt
            
            #END add-point
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stao002,stao003,stao023,stao024,stao025,stao004,
                                stao005,stao006,stao028,stao007,stao008,stao027,
                                stao009,stao010, #add by geza 20150610 150602-00003#12  stao023,stao024
                                stao011,stao012,stao013,stao014,stao015,stao016,
                                stao029,stao030,stao022,stao017,stao018,staoacti,
                                stao026,stao019,stao020,stao021
           FROM s_detail1[1].stao002,s_detail1[1].stao003,s_detail1[1].stao023,s_detail1[1].stao024,s_detail1[1].stao025,s_detail1[1].stao004,                      #add by geza 20150610 150602-00003#12  stao023,stao024
                s_detail1[1].stao005,s_detail1[1].stao006,s_detail1[1].stao028,s_detail1[1].stao007,s_detail1[1].stao008,s_detail1[1].stao027,
                s_detail1[1].stao009,s_detail1[1].stao010,   #150612-00023#6 add
                s_detail1[1].stao011,s_detail1[1].stao012,s_detail1[1].stao013,s_detail1[1].stao014,s_detail1[1].stao015,s_detail1[1].stao016,
                s_detail1[1].stao029,s_detail1[1].stao030,s_detail1[1].stao022,s_detail1[1].stao017,s_detail1[1].stao018,s_detail1[1].staoacti,
                s_detail1[1].stao026,s_detail1[1].stao019,s_detail1[1].stao020,s_detail1[1].stao021
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
       #---------------------<  Detail: page1  >---------------------
         #----<<stao002>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao002
            #add-point:BEFORE FIELD stao002
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao002
            
            #add-point:AFTER FIELD stao002
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao002
         ON ACTION controlp INFIELD stao002
            #add-point:ON ACTION controlp INFIELD stao002
            
            #END add-point
 
         #----<<stao003>>----
         #Ctrlp:construct.c.page1.stao003
         ON ACTION controlp INFIELD stao003
            #add-point:ON ACTION controlp INFIELD stao003
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_stae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stao003  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO stael003 #說明 
               #DISPLAY g_qryparam.return3 TO stae001 #費用編號 

            NEXT FIELD stao003                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stao003
            #add-point:BEFORE FIELD stao003
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao003
            
            #add-point:AFTER FIELD stao003
            
            #END add-point
            
 
         #----<<stao004>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao004
            #add-point:BEFORE FIELD stao004
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao004
            
            #add-point:AFTER FIELD stao004
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao004
         ON ACTION controlp INFIELD stao004
            #add-point:ON ACTION controlp INFIELD stao004
      
         ON ACTION controlp INFIELD stao025
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
			   CALL cl_get_para(g_enterprise,g_site,'E-CIR-0001') RETURNING l_sys
      
            LET g_qryparam.arg1 = l_sys 
            CALL q_rtax001_3()                       
            DISPLAY g_qryparam.return1 TO stao025  #顯示到畫面上
            NEXT FIELD stao025                     #返回原欄位
             
            #END add-point
 
         #----<<stao005>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao005
            #add-point:BEFORE FIELD stao005
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao005
            
            #add-point:AFTER FIELD stao005
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao005
         ON ACTION controlp INFIELD stao005
            #add-point:ON ACTION controlp INFIELD stao005
            
            #END add-point
 
         #----<<stao006>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao006
            #add-point:BEFORE FIELD stao006
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao006
            
            #add-point:AFTER FIELD stao006
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao006
         ON ACTION controlp INFIELD stao006
            #add-point:ON ACTION controlp INFIELD stao006
            
            #END add-point
 
         #----<<stao007>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao007
            #add-point:BEFORE FIELD stao007
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao007
            
            #add-point:AFTER FIELD stao007
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao007
         ON ACTION controlp INFIELD stao007
            #add-point:ON ACTION controlp INFIELD stao007
            
            #END add-point
 
         #----<<stao008>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao008
            #add-point:BEFORE FIELD stao008
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao008
            
            #add-point:AFTER FIELD stao008
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao008
         ON ACTION controlp INFIELD stao008
            #add-point:ON ACTION controlp INFIELD stao008
            
            #END add-point
 
         #----<<stao009>>----
         #Ctrlp:construct.c.page1.stao009
         ON ACTION controlp INFIELD stao009
            #add-point:ON ACTION controlp INFIELD stao009
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_stab001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stao009  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO stabl003 #說明 
               #DISPLAY g_qryparam.return3 TO stabl004 #助記碼 

            NEXT FIELD stao009                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stao009
            #add-point:BEFORE FIELD stao009
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao009
            
            #add-point:AFTER FIELD stao009
            
            #END add-point
            
 
         #----<<stao010>>----
         #Ctrlp:construct.c.page1.stao010
         ON ACTION controlp INFIELD stao010
            #add-point:ON ACTION controlp INFIELD stao010
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_stab001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stao010  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO stabl003 #說明 
               #DISPLAY g_qryparam.return3 TO stabl004 #助記碼 

            NEXT FIELD stao010                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stao010
            #add-point:BEFORE FIELD stao010
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao010
            
            #add-point:AFTER FIELD stao010
            
            #END add-point
            
 
         #----<<stao011>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao011
            #add-point:BEFORE FIELD stao011
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao011
            
            #add-point:AFTER FIELD stao011
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao011
         ON ACTION controlp INFIELD stao011
            #add-point:ON ACTION controlp INFIELD stao011
            
            #END add-point
 
         #----<<stao012>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao012
            #add-point:BEFORE FIELD stao012
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao012
            
            #add-point:AFTER FIELD stao012
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao012
         ON ACTION controlp INFIELD stao012
            #add-point:ON ACTION controlp INFIELD stao012
            
            #END add-point
 
         #----<<stao013>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao013
            #add-point:BEFORE FIELD stao013
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao013
            
            #add-point:AFTER FIELD stao013
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao013
         ON ACTION controlp INFIELD stao013
            #add-point:ON ACTION controlp INFIELD stao013
            
            #END add-point
 
         #----<<stao014>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao014
            #add-point:BEFORE FIELD stao014
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao014
            
            #add-point:AFTER FIELD stao014
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao014
         ON ACTION controlp INFIELD stao014
            #add-point:ON ACTION controlp INFIELD stao014
            
            #END add-point
 
         #----<<stao015>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao015
            #add-point:BEFORE FIELD stao015
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao015
            
            #add-point:AFTER FIELD stao015
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao015
         ON ACTION controlp INFIELD stao015
            #add-point:ON ACTION controlp INFIELD stao015
            
            #END add-point
 
         #----<<stao016>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao016
            #add-point:BEFORE FIELD stao016
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao016
            
            #add-point:AFTER FIELD stao016
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao016
         ON ACTION controlp INFIELD stao016
            #add-point:ON ACTION controlp INFIELD stao016
            
            #END add-point
 
         #----<<stao017>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao017
            #add-point:BEFORE FIELD stao017
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao017
            
            #add-point:AFTER FIELD stao017
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao017
         ON ACTION controlp INFIELD stao017
            #add-point:ON ACTION controlp INFIELD stao017
            
            #END add-point
 
         #----<<stao018>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao018
            #add-point:BEFORE FIELD stao018
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao018
            
            #add-point:AFTER FIELD stao018
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao018
         ON ACTION controlp INFIELD stao018
            #add-point:ON ACTION controlp INFIELD stao018
            
            #END add-point
 
         #----<<stao019>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao019
            #add-point:BEFORE FIELD stao019
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao019
            
            #add-point:AFTER FIELD stao019
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stao019
         ON ACTION controlp INFIELD stao019
            #add-point:ON ACTION controlp INFIELD stao019
            
            #END add-point
 
   
       
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table2 ON staq002,staq003,staq005,staq004,staqacti
           FROM s_detail2[1].staq002,s_detail2[1].staq003,s_detail2[1].staq005,s_detail2[1].staq004,s_detail2[1].staqacti
                      
         BEFORE CONSTRUCT
            #add-point:cs段before_construct
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
       #---------------------<  Detail: page2  >---------------------
         #----<<staq002>>----
         #此段落由子樣板a01產生
         BEFORE FIELD staq002
            #add-point:BEFORE FIELD staq002
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD staq002
            
            #add-point:AFTER FIELD staq002
            
            #END add-point
            
 
         #Ctrlp:construct.c.page2.staq002
         ON ACTION controlp INFIELD staq002
            #add-point:ON ACTION controlp INFIELD staq002
            
            #END add-point
 
         #----<<staq003>>----
         #Ctrlp:construct.c.page2.staq003
         ON ACTION controlp INFIELD staq003
            #add-point:ON ACTION controlp INFIELD staq003
                        #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
			CALL cl_get_para(g_enterprise,g_site,'E-CIR-0001') RETURNING l_sys
            #給予arg
            LET g_qryparam.arg1 = l_sys 
            CALL q_rtax001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO staq003  #顯示到畫面上

            NEXT FIELD staq003                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD staq003
            #add-point:BEFORE FIELD staq003
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD staq003
            
            #add-point:AFTER FIELD staq003
            
            #END add-point
            
 
         #----<<staq004>>----
         #此段落由子樣板a01產生
         BEFORE FIELD staq004
            #add-point:BEFORE FIELD staq004
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD staq004
            
            #add-point:AFTER FIELD staq004
            
            #END add-point
            
 
         #Ctrlp:construct.c.page2.staq004
         ON ACTION controlp INFIELD staq004
            #add-point:ON ACTION controlp INFIELD staq004
            
            #END add-point
 
   
       
      END CONSTRUCT
 
 
      
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令)
      CONSTRUCT g_wc2_table3 ON stap003,stap004,stap005,stap006
           FROM s_detail3[1].stap003, s_detail3[1].stap004, s_detail3[1].stap005, s_detail3[1].stap006
                      
         BEFORE CONSTRUCT
        
            #add-point:cs段more_construct
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table4 ON staxseq,stax007,stax002,stax003,stax004,stax005,stax006
           FROM s_detail4[1].staxseq,s_detail4[1].stax007,s_detail4[1].stax002,s_detail4[1].stax003,s_detail4[1].stax004,s_detail4[1].stax005,s_detail4[1].stax006
                      
         BEFORE CONSTRUCT

       
      END CONSTRUCT
 
       CONSTRUCT g_wc2_table5 ON stazseq2,staz002,staz004
           FROM s_detail5[1].stazseq2,s_detail5[1].staz002,s_detail5[1].staz004
           
         BEFORE CONSTRUCT
         
         ON ACTION controlp INFIELD staz004
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
			   
			  #161024-00025#6--mark----begin-----------
           # IF s_aooi500_setpoint(g_prog,'staz004') THEN
           #    LET g_qryparam.where = s_aooi500_q_where(g_prog,'staz004',g_site,'c')                
           # END IF
           # CALL q_ooef001_23()    
           #161024-00025#6--mark----end--------------             
           #161024-00025#6---add----begin-----
            IF s_aooi500_setpoint(g_prog,'staz004') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'staz004',g_site,'c')
               CALL q_ooef001_24()  
            ELSE
               LET g_qryparam.where = " ooef304 = 'Y'"
               CALL q_ooef001()
            END IF
           
           #161024-00025#6---add----end-----            
            DISPLAY g_qryparam.return1 TO staz004  #顯示到畫面上

            NEXT FIELD staz004                     #返回原欄位
       
      END CONSTRUCT
      
       CONSTRUCT g_wc2_table6 ON stazseq2,staz002,staz005,staz003,staz004
           FROM s_detail6[1].stazseq2_1,s_detail6[1].staz002_1,s_detail6[1].staz005,s_detail6[1].staz003,s_detail6[1].staz004_1
           
         BEFORE CONSTRUCT

       
      END CONSTRUCT
      
      
       CONSTRUCT g_wc2_table7 ON stbk002,stbk003
           FROM s_detail7[1].stbk002,s_detail7[1].stbk003
           
         BEFORE CONSTRUCT

       
      END CONSTRUCT
      
       CONSTRUCT g_wc2_table8 ON stbo002,stbo003
           FROM s_detail8[1].stbo002,s_detail8[1].stbo003
           
         BEFORE CONSTRUCT
   
         ON ACTION controlp INFIELD stbo003
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
			 #161024-00025#6---mark----begin-----    
          # IF s_aooi500_setpoint(g_prog,'stbo003') THEN
          #    LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbo003',g_site,'c')                
          # END IF
          # CALL q_ooef001_23()
          #161024-00025#6---mark----end-----
          #161024-00025#6---add----begin-----
           IF s_aooi500_setpoint(g_prog,'stbo003') THEN 
              LET g_qryparam.where = s_aooi500_q_where(g_prog,'stbo003',g_site,'c')
              CALL q_ooef001_24()   
           ELSE
               LET g_qryparam.where = " ooef304 = 'Y'"
               CALL q_ooef001()
           END IF
           
          #161024-00025#6---add----end----- 
           
            DISPLAY g_qryparam.return1 TO stbo003  #顯示到畫面上

            NEXT FIELD stbo003                     #返回原欄位  
       
      END CONSTRUCT
      CONSTRUCT g_wc2_table9 ON stbxseq,stbxseq1,stbx008,stbx009,stbx007,stbx002,stbx003,stbx004,stbx005,stbx006
           FROM s_detail9[1].stbxseq,s_detail9[1].stbxseq1,s_detail9[1].stbx008,s_detail9[1].stbx009,s_detail9[1].stbx007,
                s_detail9[1].stbx002,s_detail9[1].stbx003,s_detail9[1].stbx004,s_detail9[1].stbx005,
                s_detail9[1].stbx006
                      
         BEFORE CONSTRUCT

         ON ACTION controlp INFIELD stbx008
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_ooef001_24()
            DISPLAY g_qryparam.return1 TO stbx008  #顯示到畫面上
            NEXT FIELD stbx008                     #返回原欄位  
            
         ON ACTION controlp INFIELD stbx007
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_stae001()
            DISPLAY g_qryparam.return1 TO stbx007  #顯示到畫面上
            NEXT FIELD stbx007                     #返回原欄位  
            
         ON ACTION controlp INFIELD stbx005
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_stbx005()
            DISPLAY g_qryparam.return1 TO stbx005  #顯示到畫面上
            NEXT FIELD stbx005                     #返回原欄位  
            
      END CONSTRUCT
      #end add-point
 
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog
         
         #end add-point  
 
      #查詢方案列表
      ON ACTION qbe_select
         LET ls_wc = ""
         CALL cl_qbe_list("c") RETURNING ls_wc
    
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
 
 
 
 
   
   #add-point:cs段結束前
      IF g_wc2_table3 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table3
   END IF
   IF g_wc2_table4 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table4
   END IF
    IF g_wc2_table5 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table5
   END IF
    IF g_wc2_table6 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table6
   END IF
   IF g_wc2_table7 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table7
   END IF
   IF g_wc2_table8 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table8
   END IF
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astm301.filter" >}
#+ filter過濾功能
PRIVATE FUNCTION astm301_filter()
   #add-point:filter段define
   DEFINE ls_result   STRING
   #end add-point   
 
   #切換畫面
   IF NOT g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",1)
      CALL gfrm_curr.setElementHidden("worksheet",0)
      LET g_main_hidden = 1
   END IF   
 
   LET INT_FLAG = 0
 
   LET g_qryparam.state = 'c'
 
   LET g_wc_filter_t = g_wc_filter
   LET g_wc_t = g_wc
 
   LET g_wc = cl_replace_str(g_wc, g_wc_filter, '')
 
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單頭
      CONSTRUCT g_wc_filter ON stan001,stan002,stan003,stan004,stan005,stan006,stan007,stan008,
          #stan022,stan023,stan024,stan025,stan026,stan027,stan028, #150506-00007#4 150523 by sakura add    
          stan009, 
          stan010,stan011,stan012,stan013,stan014,stan015,stan016,stan017,stan018,stan019,stan020,stan021, 
          stanunit
                          FROM s_browse[1].b_stan001,s_browse[1].b_stan002,s_browse[1].b_stan003,s_browse[1].b_stan004, 
                               s_browse[1].b_stan005,s_browse[1].b_stan006,s_browse[1].b_stan007,s_browse[1].b_stan008,
                              #s_browse[1].b_stan022,s_browse[1].b_stan023,s_browse[1].b_stan024,s_browse[1].b_stan025, #150506-00007#4 150523 by sakura add
                              #s_browse[1].b_stan026,s_browse[1].b_stan027,s_browse[1].b_stan028,                       #150506-00007#4 150523 by sakura add
                               s_browse[1].b_stan009,s_browse[1].b_stan010,s_browse[1].b_stan011,s_browse[1].b_stan012, 
                               s_browse[1].b_stan013,s_browse[1].b_stan014,s_browse[1].b_stan015,s_browse[1].b_stan016, 
                               s_browse[1].b_stan017,s_browse[1].b_stan018,s_browse[1].b_stan019,s_browse[1].b_stan020, 
                               s_browse[1].b_stan021,s_browse[1].b_stanunit
 
         BEFORE CONSTRUCT
               DISPLAY astm301_filter_parser('stan001') TO s_browse[1].b_stan001
            #DISPLAY '1' TO s_browse[1].b_stan002
            DISPLAY astm301_filter_parser('stan003') TO s_browse[1].b_stan003
            DISPLAY astm301_filter_parser('stan004') TO s_browse[1].b_stan004
            DISPLAY astm301_filter_parser('stan005') TO s_browse[1].b_stan005
            DISPLAY astm301_filter_parser('stan006') TO s_browse[1].b_stan006
            DISPLAY astm301_filter_parser('stan007') TO s_browse[1].b_stan007
            DISPLAY astm301_filter_parser('stan008') TO s_browse[1].b_stan008
            #150506-00007#4 150523 by sakura add---STR
            #DISPLAY astm301_filter_parser('stan022') TO s_browse[1].b_stan022
            #DISPLAY astm301_filter_parser('stan023') TO s_browse[1].b_stan023
            #DISPLAY astm301_filter_parser('stan024') TO s_browse[1].b_stan024
            #DISPLAY astm301_filter_parser('stan025') TO s_browse[1].b_stan025
            #DISPLAY '1' TO s_browse[1].b_stan026
            #DISPLAY '1' TO s_browse[1].b_stan027
            #DISPLAY '1' TO s_browse[1].b_stan028
            #150506-00007#4 150523 by sakura add---END
            DISPLAY astm301_filter_parser('stan009') TO s_browse[1].b_stan009
            DISPLAY astm301_filter_parser('stan010') TO s_browse[1].b_stan010
            DISPLAY astm301_filter_parser('stan011') TO s_browse[1].b_stan011
            DISPLAY astm301_filter_parser('stan012') TO s_browse[1].b_stan012
            DISPLAY astm301_filter_parser('stan013') TO s_browse[1].b_stan013
            DISPLAY astm301_filter_parser('stan014') TO s_browse[1].b_stan014
            DISPLAY astm301_filter_parser('stan015') TO s_browse[1].b_stan015
            DISPLAY astm301_filter_parser('stan016') TO s_browse[1].b_stan016
            DISPLAY astm301_filter_parser('stan017') TO s_browse[1].b_stan017
            DISPLAY astm301_filter_parser('stan018') TO s_browse[1].b_stan018
            DISPLAY astm301_filter_parser('stan019') TO s_browse[1].b_stan019
            DISPLAY astm301_filter_parser('stan020') TO s_browse[1].b_stan020
            DISPLAY astm301_filter_parser('stan021') TO s_browse[1].b_stan021
            DISPLAY astm301_filter_parser('stanunit') TO s_browse[1].b_stanunit
      
                            #add-point:filter段cs_ctrl
            AFTER FIELD b_stan020
               CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
               IF NOT cl_null(ls_result) THEN
                  IF NOT cl_chk_date_symbol(ls_result) THEN
                     LET ls_result = cl_add_date_extra_cond(ls_result)
                  END IF
               END IF
               CALL FGL_DIALOG_SETBUFFER(ls_result)
                            #end add-point
      
      END CONSTRUCT
 
      #add-point:filter段add_cs
      
      #end add-point
 
      BEFORE DIALOG
         #add-point:filter段b_dialog
         
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
 
      CALL astm301_filter_show('stan001')
   CALL astm301_filter_show('stan002')
   CALL astm301_filter_show('stan003')
   CALL astm301_filter_show('stan004')
   CALL astm301_filter_show('stan005')
   CALL astm301_filter_show('stan006')
   CALL astm301_filter_show('stan007')
   CALL astm301_filter_show('stan008')
   #150506-00007#4 150523 by sakura add---STR
   CALL astm301_filter_show('stan022')
   CALL astm301_filter_show('stan023')
   CALL astm301_filter_show('stan024')
   CALL astm301_filter_show('stan025')
   CALL astm301_filter_show('stan026')
   CALL astm301_filter_show('stan027')
   CALL astm301_filter_show('stan028')
   #150506-00007#4 150523 by sakura add---END
   CALL astm301_filter_show('stan009')
   CALL astm301_filter_show('stan010')
   CALL astm301_filter_show('stan011')
   CALL astm301_filter_show('stan012')
   CALL astm301_filter_show('stan013')
   CALL astm301_filter_show('stan014')
   CALL astm301_filter_show('stan015')
   CALL astm301_filter_show('stan016')
   CALL astm301_filter_show('stan017')
   CALL astm301_filter_show('stan018')
   CALL astm301_filter_show('stan019')
   CALL astm301_filter_show('stan020')
   CALL astm301_filter_show('stan021')
   CALL astm301_filter_show('stanunit')
 
END FUNCTION
 
{</section>}
 
{<section id="astm301.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astm301_filter_parser(ps_field)
   {<Local define>}
   DEFINE ps_field   STRING
   DEFINE ls_tmp     STRING
   DEFINE li_tmp     LIKE type_t.num5
   DEFINE li_tmp2    LIKE type_t.num5
   DEFINE ls_var     STRING
   {</Local define>}
   #add-point:filter段define
   
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
 
{<section id="astm301.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astm301_filter_show(ps_field)
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
   LET ls_condition = astm301_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
   
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astm301_query()
   {<Local define>}
   DEFINE ls_wc STRING
   {</Local define>}
   #add-point:query段define
      CALL g_stap_d.clear()
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
   CALL g_stao_d.clear()
   CALL g_stao2_d.clear()
   CALL g_stao3_d.clear()
   CALL g_stao4_d.clear()
   
   #add-point:query段other
   CALL cl_set_comp_visible('group7',TRUE)
   CALL cl_set_comp_visible('group_6',TRUE) 
   CALL cl_set_comp_visible('s_detail5',TRUE)
   CALL cl_set_comp_visible('s_detail6',TRUE)   
   #end add-point   
   
   DISPLAY ' ' TO FORMONLY.idx
   DISPLAY ' ' TO FORMONLY.cnt
   DISPLAY ' ' TO FORMONLY.b_index
   DISPLAY ' ' TO FORMONLY.b_count
   DISPLAY ' ' TO FORMONLY.h_index
   DISPLAY ' ' TO FORMONLY.h_count
   
   CALL astm301_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      LET g_wc = ls_wc
      CALL astm301_browser_fill("")
      CALL astm301_fetch("")
      RETURN
   END IF
   
   #搜尋後資料初始化
   LET g_detail_cnt = 0
   LET g_current_idx = 1
   LET g_current_row = 0
   LET g_detail_idx = 1
   LET g_detail_idx2 = 1
   LET l_ac = 1
   LET g_wc_filter = ""
   CALL FGL_SET_ARR_CURR(1)
      CALL astm301_filter_show('stan001')
   CALL astm301_filter_show('stan002')
   CALL astm301_filter_show('stan003')
   CALL astm301_filter_show('stan004')
   CALL astm301_filter_show('stan005')
   CALL astm301_filter_show('stan006')
   CALL astm301_filter_show('stan007')
   CALL astm301_filter_show('stan008')
   #150506-00007#4 150523 by sakura add---STR
   CALL astm301_filter_show('stan022')
   CALL astm301_filter_show('stan023')
   CALL astm301_filter_show('stan024')
   CALL astm301_filter_show('stan025')
   CALL astm301_filter_show('stan026')
   CALL astm301_filter_show('stan027')
   CALL astm301_filter_show('stan028')
   #150506-00007#4 150523 by sakura add---END   
   CALL astm301_filter_show('stan009')
   CALL astm301_filter_show('stan010')
   CALL astm301_filter_show('stan011')
   CALL astm301_filter_show('stan012')
   CALL astm301_filter_show('stan013')
   CALL astm301_filter_show('stan014')
   CALL astm301_filter_show('stan015')
   CALL astm301_filter_show('stan016')
   CALL astm301_filter_show('stan017')
   CALL astm301_filter_show('stan018')
   CALL astm301_filter_show('stan019')
   CALL astm301_filter_show('stan020')
   CALL astm301_filter_show('stan021')
   CALL astm301_filter_show('stanunit')
   LET g_error_show = 1
   CALL astm301_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "-100"
      LET g_errparam.extend = ""
      LET g_errparam.popup = TRUE
      CALL cl_err()
 
   ELSE
      CALL astm301_fetch("F") 
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astm301.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astm301_fetch(p_flag)
   {<Local define>}
   DEFINE p_flag     LIKE type_t.chr1
   DEFINE ls_msg     STRING
   {</Local define>}
   #add-point:fetch段define
   DEFINE l_success  LIKE type_t.num5 #150506-00007#4 150523 by sakura add
   #end add-point    
   
   IF g_browser_cnt = 0 THEN
      RETURN
   END IF
   
   CASE p_flag
      WHEN 'F' LET g_current_idx = 1
      WHEN 'L' LET g_current_idx = g_header_cnt        
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
   
   LET g_detail_cnt = g_header_cnt                  
   
   #單身總筆數顯示
   #LET g_detail_idx = 1
   IF g_detail_cnt > 0 THEN
      #LET g_detail_idx = 1
      DISPLAY g_detail_idx TO FORMONLY.idx  
   ELSE
      LET g_detail_idx = 0
      DISPLAY ' ' TO FORMONLY.idx    
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
   
   #超出範圍
   IF g_current_idx > g_browser.getLength() THEN
      LET g_current_idx = g_browser.getLength()
   END IF
   
   LET g_stan_m.stan001 = g_browser[g_current_idx].b_stan001
 
   
   #重讀DB,因TEMP有不被更新特性
    SELECT UNIQUE stan002,stan001,stan003,stan021,stan005,stan004,stanunit,stan006,stan007,stan008,
        stan022,stan023,stan037,stan024,stan025,stan026,stan034,stan035,stan036,stan027,stan028, #150506-00007#4 150523 by sakura add
        stan029,stan030,stan031,stan032,
        stan009, 
        stan010,stan015,stan016,stan011,stan012,stan013,stan014,stan038,stan017,stan018,stan019,stan020,stan039,stanstus, 
        stanownid,stanowndp,stancrtid,stancrtdp,stancrtdt,stanmodid,stanmoddt,stancnfid,stancnfdt
 INTO g_stan_m.stan002,g_stan_m.stan001,g_stan_m.stan003,g_stan_m.stan021,g_stan_m.stan005,g_stan_m.stan004, 
     g_stan_m.stanunit,g_stan_m.stan006,g_stan_m.stan007,g_stan_m.stan008,
     g_stan_m.stan022,g_stan_m.stan023,g_stan_m.stan037,g_stan_m.stan024,g_stan_m.stan025,g_stan_m.stan026,
     g_stan_m.stan034,g_stan_m.stan035,g_stan_m.stan036,g_stan_m.stan027,g_stan_m.stan028, #150506-00007#4 150523 by sakura add
     g_stan_m.stan029,g_stan_m.stan030,g_stan_m.stan031, g_stan_m.stan032,
     g_stan_m.stan009,g_stan_m.stan010, 
     g_stan_m.stan015,g_stan_m.stan016,g_stan_m.stan011,g_stan_m.stan012,g_stan_m.stan013,g_stan_m.stan014,g_stan_m.stan038, 
     g_stan_m.stan017,g_stan_m.stan018,g_stan_m.stan019,g_stan_m.stan020,g_stan_m.stan039,g_stan_m.stanstus,g_stan_m.stanownid, 
     g_stan_m.stanowndp,g_stan_m.stancrtid,g_stan_m.stancrtdp,g_stan_m.stancrtdt,g_stan_m.stanmodid, 
     g_stan_m.stanmoddt,g_stan_m.stancnfid,g_stan_m.stancnfdt
 FROM stan_t
 WHERE stanent = g_enterprise AND stan001 = g_stan_m.stan001
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "stan_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
 
      INITIALIZE g_stan_m.* TO NULL
      RETURN
   END IF
   
   #add-point:fetch段action控制
  # IF g_stan_m.stanstus = 'N' THEN
  #    CALL cl_set_act_visible("modify,delete",TRUE)
  # ELSE
  #    CALL cl_set_act_visible("modify,delete",FALSE)
  # END IF  
  CALL cl_set_act_visible("insert,modify,delete,reproduce,modify_detail,statechange", FALSE)
 
   #end add-point  
   
   
   
   #add-point:fetch結束前
   #150506-00007#4 150523 by sakura add---STR
   LET g_ooef019 = ''
   CALL s_tax_get_ooef019(g_site) RETURNING l_success,g_ooef019
   #150506-00007#4 150523 by sakura add---END   
   #end add-point
   
   #LET g_data_owner =       
   #LET g_data_group =   
   
   #重新顯示   
   CALL astm301_show()
 
END FUNCTION
 
{</section>}
 
{<section id="astm301.insert" >}
#+ 資料新增
PRIVATE FUNCTION astm301_insert()
   #add-point:insert段define
   DEFINE l_insert      LIKE type_t.num5
   CALL g_stap_d.clear() 
   #end add-point    
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stao_d.clear()   
   CALL g_stao2_d.clear()
   CALL g_stao3_d.clear()
   CALL g_stao4_d.clear()
    CALL g_stax_d.clear()
 
 
   INITIALIZE g_stan_m.* LIKE stan_t.*             #DEFAULT 設定
   
   LET g_stan001_t = NULL
 
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #此段落由子樣板a14產生    
      LET g_stan_m.stanownid = g_user
      LET g_stan_m.stanowndp = g_dept
      LET g_stan_m.stancrtid = g_user
      LET g_stan_m.stancrtdp = g_dept 
      LET g_stan_m.stancrtdt = cl_get_current()
      LET g_stan_m.stanmodid = ""
      LET g_stan_m.stanmoddt = ""
      #LET g_stan_m.stanstus = ""
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_stan_m.stan002 = "1"
      LET g_stan_m.stan011 = "N"
 
  
      #add-point:單頭預設值
      LET g_stan_m.stan002 = "1"
      LET g_stan_m.stan003 = ""
      LET g_stan_m.stanstus = "N"   
      LET g_stan_m.stan012 = cl_get_current()
#      LET g_stan_m.stanunit = g_site
      LET g_site_flag = FALSE
      CALL s_aooi500_default(g_prog,'stanunit',g_stan_m.stanunit)
         RETURNING l_insert,g_stan_m.stanunit
      IF NOT l_insert THEN
         RETURN
      END IF
      CALL astm301_stanunit_ref()
      LET g_stan_m.stan013 = g_legal
      CALL astm301_stan013_ref()
     #LET g_stan_m.stan017 = cl_get_current()
     #LET g_stan_m.stan018 = g_stan_m.stan017+1
      LET g_stan_m.stan014 = g_user
      CALL astm301_stan014_ref()
      #150506-00007#4 150523 by sakura add---STR
      LET g_stan_m.stan024 = 'N' #採購價格允許人工修改
      LET g_stan_m.stan025 = 0   #修改容差率
      LET g_stan_m.stan026 = '1' #超出處理方式
      LET g_stan_m.stan027 = '1' #內外購
      LET g_stan_m.stan028 = '1' #匯率計算基準
      #150506-00007#4 150523 by sakura add---END      
      LET g_stan_m.stan029 = '1'
      LET g_stan_m.stan037 = 'Y'
      LET g_stan_m_t.* = g_stan_m.*
      LET g_stan_m_o.* = g_stan_m.*
      #end add-point 
     
      CALL astm301_input("a")
      
      #add-point:單頭輸入後
            CALL g_stap_d.clear()
      LET g_rec_b3 = 0
      #end add-point
      
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         LET g_stan_m.* = g_stan_m_t.*
         CALL astm301_show()
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 9001
         LET g_errparam.extend = ''
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         EXIT WHILE
      END IF
      
      CALL g_stao_d.clear()
      CALL g_stao2_d.clear()
      CALL g_stao3_d.clear()
      CALL g_stao4_d.clear()
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   LET g_state = "Y"
   
   LET g_stan001_t = g_stan_m.stan001
 
   
   LET g_wc = g_wc,  
              " OR ( stanent = '" ||g_enterprise|| "' AND",
              " stan001 = '", g_stan_m.stan001 CLIPPED, "' "
 
              , ") "
   
   CLOSE astm301_cl
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.modify" >}
#+ 資料修改
PRIVATE FUNCTION astm301_modify()
   {<Local define>}
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   {</Local define>}
   #add-point:modify段define
   
   #end add-point    
   
   IF g_stan_m.stan001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "std-00003"
      LET g_errparam.extend = ""
      LET g_errparam.popup = FALSE
      CALL cl_err()
 
      RETURN
   END IF
   
    SELECT UNIQUE stan002,stan001,stan003,stan021,stan005,stan004,stanunit,stan006,stan007,stan008,
        stan022,stan023,stan024,stan025,stan026,stan027,stan028, #150506-00007#4 150523 by sakura add
        stan029,stan030,stan031,stan032,
        stan009, 
        stan010,stan015,stan016,stan011,stan012,stan013,stan014,stan017,stan018,stan019,stan020,stanstus, 
        stanownid,stanowndp,stancrtid,stancrtdp,stancrtdt,stanmodid,stanmoddt,stancnfid,stancnfdt
 INTO g_stan_m.stan002,g_stan_m.stan001,g_stan_m.stan003,g_stan_m.stan021,g_stan_m.stan005,g_stan_m.stan004, 
      g_stan_m.stanunit,g_stan_m.stan006,g_stan_m.stan007,g_stan_m.stan008,
      g_stan_m.stan022,g_stan_m.stan023,g_stan_m.stan024,g_stan_m.stan025,g_stan_m.stan026,g_stan_m.stan027,g_stan_m.stan028, #150506-00007#4 150523 by sakura add
      g_stan_m.stan029,g_stan_m.stan030,g_stan_m.stan031,g_stan_m.stan032,
      g_stan_m.stan009,g_stan_m.stan010, 
      g_stan_m.stan015,g_stan_m.stan016,g_stan_m.stan011,g_stan_m.stan012,g_stan_m.stan013,g_stan_m.stan014, 
      g_stan_m.stan017,g_stan_m.stan018,g_stan_m.stan019,g_stan_m.stan020,g_stan_m.stanstus,g_stan_m.stanownid, 
      g_stan_m.stanowndp,g_stan_m.stancrtid,g_stan_m.stancrtdp,g_stan_m.stancrtdt,g_stan_m.stanmodid, 
      g_stan_m.stanmoddt,g_stan_m.stancnfid,g_stan_m.stancnfdt
 FROM stan_t
 WHERE stanent = g_enterprise AND stan001 = g_stan_m.stan001
 
   ERROR ""
  
   LET g_stan001_t = g_stan_m.stan001
 
   CALL s_transaction_begin()
   
   OPEN astm301_cl USING g_enterprise,g_stan_m.stan001
 
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code =  STATUS
      LET g_errparam.extend = "OPEN astm301_cl:"
      LET g_errparam.popup = TRUE
      CALL cl_err()
 
      CLOSE astm301_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #鎖住將被更改或取消的資料
   FETCH astm301_cl INTO g_stan_m.stan002,g_stan_m.stan001,g_stan_m.stan003,g_stan_m.stan021,g_stan_m.stan005, 
       g_stan_m.stan005_desc,g_stan_m.stan004,g_stan_m.stan004_desc,g_stan_m.stanunit,g_stan_m.stanunit_desc, 
       g_stan_m.stan006,g_stan_m.stan006_desc,g_stan_m.stan007,g_stan_m.stan007_desc,g_stan_m.stan008,g_stan_m.stan008_desc, 
       g_stan_m.stan022,g_stan_m.stan022_desc,g_stan_m.stan023,g_stan_m.stan023_desc,g_stan_m.stan037,g_stan_m.stan024,g_stan_m.stan025,  #150506-00007#4 150523 by sakura add
       g_stan_m.stan026,g_stan_m.stan034,g_stan_m.stan035,g_stan_m.stan036,g_stan_m.stan027,g_stan_m.stan028,                                                               #150506-00007#4 150523 by sakura add
       g_stan_m.stan029,g_stan_m.stan030,g_stan_m.stan031,g_stan_m.stan032,
       g_stan_m.stan009,g_stan_m.stan009_desc,g_stan_m.stan010,g_stan_m.stan010_desc,g_stan_m.stan015, 
       g_stan_m.stan015_desc,g_stan_m.stan016,g_stan_m.stan016_desc,g_stan_m.stan011,g_stan_m.stan012, 
       g_stan_m.stan013,g_stan_m.stan013_desc,g_stan_m.stan014,g_stan_m.stan014_desc,g_stan_m.stan017, 
       g_stan_m.stan018,g_stan_m.stan019,g_stan_m.stan020,g_stan_m.stanstus,g_stan_m.stanownid,g_stan_m.stanownid_desc, 
       g_stan_m.stanowndp,g_stan_m.stanowndp_desc,g_stan_m.stancrtid,g_stan_m.stancrtid_desc,g_stan_m.stancrtdp, 
       g_stan_m.stancrtdp_desc,g_stan_m.stancrtdt,g_stan_m.stanmodid,g_stan_m.stanmodid_desc,g_stan_m.stanmoddt, 
       g_stan_m.stancnfid,g_stan_m.stancnfid_desc,g_stan_m.stancnfdt
 
   #資料被他人LOCK, 或是sql執行時出現錯誤
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = g_stan_m.stan001
      LET g_errparam.popup = FALSE
      CALL cl_err()
 
      CLOSE astm301_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   
 
   CALL astm301_show()
   WHILE TRUE
      LET g_stan001_t = g_stan_m.stan001
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stan_m.stanmodid = g_user 
LET g_stan_m.stanmoddt = cl_get_current()
 
      
      #add-point:modify段修改前
      
      #end add-point
      
      CALL astm301_input("u")     #欄位更改
 
      #add-point:modify段修改後
      
      #end add-point
      
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         LET g_stan_m.* = g_stan_m_t.*
         CALL astm301_show()
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 9001
         LET g_errparam.extend = ''
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         EXIT WHILE
      END IF
      
      #若單頭key欄位有變更
      IF g_stan_m.stan001 != g_stan001_t 
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前
         
         #end add-point
         
         #更新單身key值
         UPDATE stao_t SET stao001 = g_stan_m.stan001
 
          WHERE staoent = g_enterprise AND stao001 = g_stan001_t
 
            
         #add-point:單身fk修改中
         
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00009"
               LET g_errparam.extend = "stao_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               CALL s_transaction_end('N','0')
               CONTINUE WHILE
            WHEN SQLCA.sqlcode #其他錯誤
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stao_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
               CALL s_transaction_end('N','0')
               CONTINUE WHILE
         END CASE
         
         #add-point:單身fk修改後
         
         #end add-point
         
         #更新單身key值
         #add-point:單身fk修改前
         
         #end add-point
         UPDATE staq_t
            SET staq001 = g_stan_m.stan001
 
          WHERE staqent = g_enterprise AND
                staq001 = g_stan001_t
 
         #add-point:單身fk修改中
         
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00009"
               LET g_errparam.extend = "staq_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               CALL s_transaction_end('N','0')
               CONTINUE WHILE
            WHEN SQLCA.sqlcode #其他錯誤
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "staq_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
               CALL s_transaction_end('N','0')
               CONTINUE WHILE
         END CASE
         #add-point:單身fk修改後
         
         #end add-point
 
 
         
 
         
         #UPDATE 多語言table key值
         
         
 
 
         CALL s_transaction_end('Y','0')
      END IF
    
      EXIT WHILE
   END WHILE
 
   #修改歷程記錄
   IF NOT cl_log_modified_record(g_stan_m.stan001,g_site) THEN 
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astm301_cl
   CALL s_transaction_end('Y','0')
 
   #流程通知預埋點-U
   CALL cl_flow_notify(g_stan_m.stan001,'U')
 
END FUNCTION   
 
{</section>}
 
{<section id="astm301.input" >}
#+ 資料輸入
PRIVATE FUNCTION astm301_input(p_cmd)
   {<Local define>}
   DEFINE  p_cmd                 LIKE type_t.chr1
   DEFINE  l_cmd_t               LIKE type_t.chr1
   DEFINE  l_cmd                 LIKE type_t.chr1
   DEFINE  l_ac_t                LIKE type_t.num5                #未取消的ARRAY CNT 
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
   {</Local define>}
   #add-point:input段define
   DEFINE  l_stag002             LIKE stag_t.stag002
   DEFINE  t_stan004             LIKE stan_t.stan004
   DEFINE  l_flag                LIKE type_t.chr1
   DEFINE  l_success             LIKE type_t.num5
   DEFINE  l_sys                 LIKE type_t.num5
   DEFINE  l_sys_1               LIKE type_t.chr1
   DEFINE  l_errno               LIKE type_t.chr10
   DEFINE  l_ooef019             LIKE ooef_t.ooef019
   #add--2015/05/08 By shiun--(S)
   DEFINE l_oofg_return    DYNAMIC ARRAY OF RECORD
                   oofg019     LIKE oofg_t.oofg019,   #field
                   oofg020     LIKE oofg_t.oofg020    #value
                           END RECORD
   #add--2015/05/08 By shiun--(E)
   #end add-point  
 
   #先做狀態判定
   IF p_cmd = 'r' THEN
      LET l_cmd_t = 'r'
      LET p_cmd   = 'a'
   ELSE
      LET l_cmd_t = p_cmd
   END IF   
   
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
 
   CALL cl_set_head_visible("","YES")  
 
   LET l_insert = FALSE
   LET g_action_choice = ""
 
   #add-point:input段define_sql
      LET g_forupd_sql = "SELECT stap003,stap004,stap005,stap006 FROM stap_t WHERE stapent=? AND stap001=? AND stap002=? AND stap003 = ? FOR UPDATE"
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE astm301_bcl3 CURSOR FROM g_forupd_sql
   
   #end add-point 
   LET g_forupd_sql = "SELECT stao002,stao003,'',stao023,stao024,stao025,'',stao004,stao005,stao006,stao007,stao008,stao027,stao009,'', 
       stao010,'',stao011,stao012,stao013,stao014,stao015,stao016,stao022,stao017,stao018,stao019,stao020,stao021 FROM stao_t  
       WHERE staoent=? AND stao001=? AND stao002=? FOR UPDATE"  #add by geza 20150610 150602-00003#12  stao023,stao024
   #add-point:input段define_sql
   
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE astm301_bcl CURSOR FROM g_forupd_sql
   
   #add-point:input段define_sql
   
   #end add-point    
   LET g_forupd_sql = "SELECT staq002,staq003,'',staq005,staq004 FROM staq_t WHERE staqent=? AND staq001=? AND  
       staq002=? FOR UPDATE"
   #add-point:input段define_sql
   
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE astm301_bcl2 CURSOR FROM g_forupd_sql
 
 
   
 
 
   #add-point:input段define_sql
    LET g_forupd_sql = "SELECT staxsite,staxunit,staxseq,stax002,stax003,stax004,stax005,stax006 FROM stax_t WHERE staxent=? AND stax001=? AND  
       staxseq=? FOR UPDATE"
    LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE astm301_bcl4 CURSOR FROM g_forupd_sql  
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astm301_set_entry(p_cmd)
   #add-point:set_entry後
   
   #end add-point
   CALL astm301_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stan_m.stan002,g_stan_m.stan001,g_stan_m.stan003,g_stan_m.stan021,g_stan_m.stan005, 
       g_stan_m.stan004,g_stan_m.stanunit,g_stan_m.stan006,g_stan_m.stan007,g_stan_m.stan008,
       g_stan_m.stan022,g_stan_m.stan023,g_stan_m.stan037,g_stan_m.stan024,g_stan_m.stan025,g_stan_m.stan026,g_stan_m.stan027,g_stan_m.stan028, #150506-00007#4 150523 by sakura add
       g_stan_m.stan029,g_stan_m.stan030,g_stan_m.stan031,g_stan_m.stan032,
       g_stan_m.stan009, 
       g_stan_m.stan010,g_stan_m.stan015,g_stan_m.stan016,g_stan_m.stan011,g_stan_m.stan012,g_stan_m.stan013,g_stan_m.stan033,
       g_stan_m.stan014,g_stan_m.stan017,g_stan_m.stan018,g_stan_m.stan019,g_stan_m.stan020,g_stan_m.stanstus 
 
   
   LET lb_reproduce = FALSE
   
   #add-point:資料輸入前
    DISPLAY BY NAME g_stan_m.stan002
    LET t_stan004 =  g_stan_m.stan004
    LET l_success = FALSE
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
 
{</section>}
 
{<section id="astm301.input.head" >}
      #單頭段
      INPUT BY NAME g_stan_m.stan002,g_stan_m.stan001,g_stan_m.stan003,g_stan_m.stan021,g_stan_m.stan005, 
          g_stan_m.stan004,g_stan_m.stanunit,g_stan_m.stan006,g_stan_m.stan007,g_stan_m.stan008,
          g_stan_m.stan022,g_stan_m.stan023,g_stan_m.stan037,g_stan_m.stan024,g_stan_m.stan025,g_stan_m.stan026,g_stan_m.stan027,g_stan_m.stan028, #150506-00007#4 150523 by sakura add
          g_stan_m.stan029,g_stan_m.stan031,g_stan_m.stan032,    #161024-00025#12--mark g_stan_m.stan030画面无此字段
          g_stan_m.stan009, 
          g_stan_m.stan010,g_stan_m.stan015,g_stan_m.stan016,g_stan_m.stan011,g_stan_m.stan012,g_stan_m.stan013,g_stan_m.stan033,
          g_stan_m.stan014,g_stan_m.stan017,g_stan_m.stan018,g_stan_m.stan019,g_stan_m.stan020,g_stan_m.stanstus    #161024-00025#12--mark g_stan_m.next_b画面无此字段
 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #add-point:資料輸入前
           
            #end add-point
 
         #---------------------------<  Master  >---------------------------
         #----<<stan002>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan002
            #add-point:BEFORE FIELD stan002
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan002
            
            #add-point:AFTER FIELD stan002
             IF NOT cl_null(g_stan_m.stan004) THEN
                  SELECT stag002 INTO l_stag002 FROM stag_t WHERE stagent = g_enterprise AND stag001 = g_stan_m.stan004
                  IF l_stag002 <> g_stan_m.stan002 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00023'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_stan_m.stan002 = g_stan_m_t.stan002
                     NEXT FIELD stan002   
                  END IF
             END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stan002
            #add-point:ON CHANGE stan002
            IF NOT astm301_b_chk() THEN
               LET g_stan_m.stan002 = g_stan_m_t.stan002
               NEXT FIELD stan002
            END IF
           
            #END add-point
 
         #----<<stan001>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan001
            #add-point:BEFORE FIELD stan001
            CALL cl_get_para(g_enterprise,g_site,'E-CIR-0010') RETURNING l_sys_1
            IF l_sys_1 = 'Y' THEN
               IF p_cmd = 'a' AND cl_null(g_stan_m.stan001) THEN
#                  CALL s_aooi390('22') RETURNING l_success,g_stan_m.stan001   #mark--2015/05/08 By shiun
                  CALL s_aooi390_gen('22') RETURNING l_success,g_stan_m.stan001,l_oofg_return   #add--2015/05/08 By shiun
                 IF NOT cl_null(g_stan_m.stan001) THEN
                    IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stan_t WHERE "||"stanent = '" ||g_enterprise|| "' AND "||"stan001 = '"||g_stan_m.stan001 ||"'",'std-00004',0) THEN 
                       LET g_stan_m.stan001 = ''
                    END IF    
                 END IF                    
                
              END IF
            END IF
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan001
            
            #add-point:AFTER FIELD stan001
                        #此段落由子樣板a05產生
            IF  NOT cl_null(g_stan_m.stan001) THEN 
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND ( p_cmd = 'u' AND (g_stan_m.stan001 != g_stan001_t ))) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stan_t WHERE "||"stanent = '" ||g_enterprise|| "' AND "||"stan001 = '"||g_stan_m.stan001 ||"'",'std-00004',0) THEN 
                     LET g_stan_m.stan001 =  g_stan_m_t.stan001
                     NEXT FIELD CURRENT
                  END IF
                  #add--2015/05/08 By shiun--(S)
                  IF NOT s_aooi390_chk('22',g_stan_m.stan001) THEN
                     LET g_stan_m.stan001 = g_stan_m_t.stan001
                     DISPLAY BY NAME g_stan_m.stan001
                     NEXT FIELD CURRENT
                  END IF
                  #add--2015/05/08 By shiun--(E)
               END IF
            END IF



            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stan001
            #add-point:ON CHANGE stan001
            
            #END add-point
 
         #----<<stan003>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan003
            #add-point:BEFORE FIELD stan003
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan003
            
            #add-point:AFTER FIELD stan003
            
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stan003
            #add-point:ON CHANGE stan003
            
            #END add-point
 
         #----<<stan021>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan021
            #add-point:BEFORE FIELD stan021
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan021
            
            #add-point:AFTER FIELD stan021
            
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stan021
            #add-point:ON CHANGE stan021
            
            #END add-point
 
         #----<<stan005>>----
         #此段落由子樣板a02產生
         AFTER FIELD stan005
            
            #add-point:AFTER FIELD stan005
            LET g_stan_m.stan005_desc = ''
            DISPLAY BY NAME g_stan_m.stan005_desc
            IF NOT cl_null(g_stan_m.stan005) THEN 
               IF NOT astm301_stan005_chk(g_stan_m.stan005) THEN
                  LET g_stan_m.stan005 = g_stan_m_t.stan005
                  CALL astm301_stan005_ref()
                  NEXT FIELD stan005
               END IF
               
              #IF NOT cl_null(g_stan_m.stan017) AND NOT cl_null(g_stan_m.stan018) THEN
              #   IF NOT astm301_interval_chk(p_cmd) THEN
              #      LET g_stan_m.stan005 = g_stan_m_t.stan005
              #      CALL astm301_stan005_ref()
              #      NEXT FIELD stan005
              #   END IF        
              #END IF
               #150506-00007#4 150523 by sakura add--STR
               #新增時,抓取廠商帳戶資料為預設值
               CALL astm301_stan005_other()
               #150506-00007#4 150523 by sakura add--END              
            END IF
            
            CALL astm301_stan005_ref()

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan005
            #add-point:BEFORE FIELD stan005
            
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stan005
            #add-point:ON CHANGE stan005
            
            #END add-point
 
         #----<<stan004>>----
         #此段落由子樣板a02產生
         AFTER FIELD stan004
            
            #add-point:AFTER FIELD stan004
                        LET g_stan_m.stan004_desc = ''
            DISPLAY BY NAME  g_stan_m.stan004_desc
            IF NOT cl_null(g_stan_m.stan004) THEN
               IF NOT astm301_stan004_chk(g_stan_m.stan004) THEN
                  LET g_stan_m.stan004 = g_stan_m_t.stan004
                  CALL astm301_stan004_ref()
                  NEXT FIELD stan004
               END IF 
               IF NOT cl_null(g_stan_m.stan002) THEN
                  SELECT stag002 INTO l_stag002 FROM stag_t WHERE stagent = g_enterprise AND stag001 = g_stan_m.stan004
                  IF l_stag002 <> g_stan_m.stan002 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00023'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_stan_m.stan004 = g_stan_m_t.stan004
                     CALL astm301_stan004_ref()
                     NEXT FIELD stan004   
                  END IF
               END IF
            END IF
            
            CALL astm301_stan004_ref()
            IF g_stan_m.stan004 <>t_stan004 OR  t_stan004 is null THEN
               CALL astm301_stan004_other()
            END IF
            LET t_stan004 =  g_stan_m.stan004
            
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan004
            #add-point:BEFORE FIELD stan004
            
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stan004
            #add-point:ON CHANGE stan004
            
            #END add-point
 
         #----<<stanunit>>----
         #此段落由子樣板a02產生
         AFTER FIELD stanunit
            
            #add-point:AFTER FIELD stanunit
            IF NOT cl_null(g_stan_m.stanunit) THEN    
               IF s_aooi500_setpoint(g_prog,'stanunit') THEN
                  CALL s_aooi500_chk(g_prog,'stanunit',g_stan_m.stanunit,g_site) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stan_m.stanunit
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     LET g_stan_m.stanunit = g_stan_m_t.stanunit
                     CALL s_desc_get_department_desc(g_stan_m.stanunit) RETURNING g_stan_m.stanunit_desc
                     DISPLAY BY NAME g_stan_m.stanunit,g_stan_m.stanunit_desc
                     NEXT FIELD CURRENT
                  END IF  
               END IF
            #sakura---add---str
            ELSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ''
               LET g_errparam.code   = 'axc-00120'
               LET g_errparam.popup  = TRUE
               CALL cl_err()            
               
               LET g_stan_m.stanunit = g_stan_m_t.stanunit
               CALL s_desc_get_department_desc(g_stan_m.stanunit) RETURNING g_stan_m.stanunit_desc
               DISPLAY BY NAME g_stan_m.stanunit,g_stan_m.stanunit_desc
               NEXT FIELD CURRENT            
            #sakura---add---end
            END IF
            LET g_site_flag = TRUE            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stan_m.stanunit
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stan_m.stanunit_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stan_m.stanunit_desc
            CALL astm301_set_entry(p_cmd)
            CALL astm301_set_no_entry(p_cmd)              

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stanunit
            #add-point:BEFORE FIELD stanunit
            
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stanunit
            #add-point:ON CHANGE stanunit
            
            #END add-point
 
         #----<<stan006>>----
         #此段落由子樣板a02產生
         AFTER FIELD stan006
            
            #add-point:AFTER FIELD stan006
                        LET g_stan_m.stan006_desc = ''
            DISPLAY BY NAME g_stan_m.stan006_desc
            IF NOT cl_null(g_stan_m.stan006) THEN
               IF NOT astm301_stan006_chk(g_stan_m.stan006) THEN
                  LET g_stan_m.stan006 = g_stan_m_t.stan006
                  CALL astm301_stan006_ref()
                  NEXT FIELD stan006
               END IF   
            END IF
            CALL astm301_stan006_ref() 
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan006
            #add-point:BEFORE FIELD stan006
            
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stan006
            #add-point:ON CHANGE stan006
            
            #END add-point
 
         #----<<stan007>>----
         #此段落由子樣板a02產生
         AFTER FIELD stan007
            
            #add-point:AFTER FIELD stan007
            LET g_stan_m.stan007_desc = ''
            DISPLAY BY NAME g_stan_m.stan007_desc
            IF NOT cl_null(g_stan_m.stan007) THEN
               #150213-00006#2 2015/02/13 By pomelo add(S)
               IF g_stan_m.stan007 != g_stan_m_o.stan007 OR cl_null(g_stan_m_o.stan007) THEN
               #150213-00006#2 2015/02/13 By pomelo add(E)
                  IF NOT astm301_stan007_chk(g_stan_m.stan007) THEN
                     #LET g_stan_m.stan007 = g_stan_m_t.stan007 #150213-00006#1 2015/02/13 By pomelo mark
                     LET g_stan_m.stan007 = g_stan_m_o.stan007  #150213-00006#1 2015/02/13 By pomelo add
                     CALL astm301_stan007_ref()
                     NEXT FIELD stan007
                  END IF 
                  CALL astm301_stan007_ref()
               END IF    #150213-00006#2 2015/02/13 By pomelo add
            ELSE
               LET g_stan_m.stan007_desc = ''
               DISPLAY BY NAME g_stan_m.stan007_desc
            END IF
            CALL astm301_stan007_ref() #150506-00007#4 150523 by sakura add
            LET g_stan_m_o.stan007 = g_stan_m.stan007   #150213-00006#1 2015/02/13 By pomelo add
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan007
            #add-point:BEFORE FIELD stan007
            #150213-00006#2 2015/02/13 By pomelo add(S)
            IF cl_null(g_stan_m.stan013) THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'ast-00220'
               LET g_errparam.extend = ""
               LET g_errparam.popup = TRUE
               CALL cl_err()
               NEXT FIELD stan013
            END IF
            #150213-00006#2 2015/02/13 By pomelo add(E)
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stan007
            #add-point:ON CHANGE stan007
            
            #END add-point
 
         #----<<stan008>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan008
            #add-point:BEFORE FIELD stan008
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan008
            
            #add-point:AFTER FIELD stan008
            LET g_stan_m.stan008_desc = ''
            DISPLAY BY NAME g_stan_m.stan008_desc
            IF NOT cl_null(g_stan_m.stan008) THEN     
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = '1'
               LET g_chkparam.arg1 = g_stan_m.stan008
               #160318-00025#37  2016/04/19  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "apm-00186:sub-01302|aooi716|",cl_get_progname("aooi716",g_lang,"2"),"|:EXEPROGaooi716"
               #160318-00025#37  2016/04/19  by pengxin  add(E)
               IF NOT cl_chk_exist("v_ooib002") THEN
                  LET g_stan_m.stan008 = g_stan_m_t.stan008
                  CALL astm301_stan008_ref()
                  NEXT FIELD stan008
               END IF 
               CALL astm301_stan008_ref()             
            ELSE
               LET g_stan_m.stan008_desc = ''
               DISPLAY BY NAME g_stan_m.stan008_desc
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stan008
            #add-point:ON CHANGE stan008
            
            #END add-point
 
         #150506-00007#4 150523 by sakura add---STR
         #交易條件
         BEFORE FIELD stan022
         AFTER FIELD stan022
            LET g_stan_m.stan022_desc = ' '
            DISPLAY BY NAME g_stan_m.stan022_desc
            IF NOT cl_null(g_stan_m.stan022) THEN
               IF g_stan_m.stan022 != g_stan_m_o.stan022 OR cl_null(g_stan_m_o.stan022) THEN
                  IF NOT s_azzi650_chk_exist('238',g_stan_m.stan022) THEN
                     LET g_stan_m.stan022 = g_stan_m_o.stan022
                     CALL s_desc_get_acc_desc('238',g_stan_m.stan022) RETURNING g_stan_m.stan022_desc
                     DISPLAY BY NAME g_stan_m.stan022_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_stan_m_o.stan022 = g_stan_m.stan022
            CALL s_desc_get_acc_desc('238',g_stan_m.stan022) RETURNING g_stan_m.stan022_desc
            DISPLAY BY NAME g_stan_m.stan022_desc         
         ON CHANGE stan022
         #發票類型
         BEFORE FIELD stan023
         AFTER FIELD stan023
            LET g_stan_m.stan023_desc = ''
            DISPLAY BY NAME g_stan_m.stan023_desc
            IF NOT cl_null(g_stan_m.stan023) THEN
               IF g_stan_m.stan023 != g_stan_m_o.stan023 OR cl_null(g_stan_m_o.stan023)THEN
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_ooef019
                  LET g_chkparam.arg2 = g_stan_m.stan023
                  IF NOT cl_chk_exist("v_isac002_1") THEN
                     LET g_stan_m.stan023 = g_stan_m_o.stan023
                     CALL s_desc_get_invoice_type_desc1(g_site,g_stan_m.stan023) RETURNING g_stan_m.stan023_desc
                     DISPLAY BY NAME g_stan_m.stan023_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_stan_m_o.stan023 = g_stan_m.stan023
            CALL s_desc_get_invoice_type_desc1(g_site,g_stan_m.stan023) RETURNING g_stan_m.stan023_desc
            DISPLAY BY NAME g_stan_m.stan023_desc         
         ON CHANGE stan023         
         #採購價格允許人工修改
         BEFORE FIELD stan024
         AFTER FIELD stan024
         ON CHANGE stan024          
         #修改容差率
         BEFORE FIELD stan025
         AFTER FIELD stan025
            #確認欄位值在特定區間內
            IF NOT cl_ap_chk_range(g_stan_m.stan025,"0","1","100","1","azz-00087",1) THEN
               NEXT FIELD stan025
            END IF          
         ON CHANGE stan025          
         #超出處理方式
         BEFORE FIELD stan026
         AFTER FIELD stan026
         ON CHANGE stan026         
         #內外購
         BEFORE FIELD stan027
         AFTER FIELD stan027
         ON CHANGE stan027         
         #匯率計算基準
         BEFORE FIELD stan028
         AFTER FIELD stan028
         ON CHANGE stan028         
         #150506-00007#4 150523 by sakura add---END
 
         #----<<stan009>>----
         #此段落由子樣板a02產生
         AFTER FIELD stan009
            
            #add-point:AFTER FIELD stan009
            IF NOT cl_null(g_stan_m.stan009) THEN
               IF NOT astm301_stan009_chk(g_stan_m.stan009)THEN 
                  LET g_stan_m.stan009 = g_stan_m_t.stan009
                  CALL astm301_stan009_ref()
                  NEXT FIELD stan009
               END IF
               IF NOT astm301_stan017_018_chk(p_cmd,"stan009") THEN
                  LET g_stan_m.stan009 = g_stan_m_t.stan009
                  CALL astm301_stan009_ref()
                  NEXT FIELD stan009
               END IF
            END IF
            CALL astm301_stan009_ref()
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan009
            #add-point:BEFORE FIELD stan009
            
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stan009
            #add-point:ON CHANGE stan009
            
            #END add-point
 
         #----<<stan010>>----
         #此段落由子樣板a02產生
         AFTER FIELD stan010
            
            #add-point:AFTER FIELD stan010
            IF NOT cl_null(g_stan_m.stan010) THEN
               IF NOT astm301_stan010_chk(g_stan_m.stan010)THEN 
                  LET g_stan_m.stan010 = g_stan_m_t.stan010
                  CALL astm301_stan010_ref()
                  NEXT FIELD stan010
               END IF
               IF NOT astm301_b_chk() THEN
                  LET g_stan_m.stan010 = g_stan_m_t.stan010
                  CALL astm301_stan010_ref()
                  NEXT FIELD stan010
               END IF
            END IF
            CALL astm301_stan010_ref()

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan010
            #add-point:BEFORE FIELD stan010
            
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stan010
            #add-point:ON CHANGE stan010
            
            #END add-point
 
         #----<<stan015>>----
         #此段落由子樣板a02產生
         AFTER FIELD stan015
            
            #add-point:AFTER FIELD stan015
            IF NOT cl_null(g_stan_m.stan015) THEN
#               IF NOT astm301_stan015_chk(g_stan_m.stan015)THEN 
#                  LET g_stan_m.stan015 = g_stan_m_t.stan015
#                  CALL astm301_stan015_ref()
#                  NEXT FIELD stan015
#               END IF
               IF s_aooi500_setpoint(g_prog,'stan015') THEN
                  CALL s_aooi500_chk(g_prog,'stan015',g_stan_m.stan015,g_site) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stan_m.stan015
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     LET g_stan_m.stan015 = g_stan_m_t.stan015
                     CALL s_desc_get_department_desc(g_stan_m.stan015) RETURNING g_stan_m.stan015_desc
                     DISPLAY BY NAME g_stan_m.stan015,g_stan_m.stan015_desc
                     NEXT FIELD CURRENT
                  END IF
               ELSE
                  IF NOT astm301_stan015_chk(g_stan_m.stan015)THEN 
                     LET g_stan_m.stan015 = g_stan_m_t.stan015
                     CALL astm301_stan015_ref()
                     NEXT FIELD stan015
                  END IF
               END IF
            END IF
            CALL astm301_stan015_ref()

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan015
            #add-point:BEFORE FIELD stan015
            
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stan015
            #add-point:ON CHANGE stan015
            
            #END add-point
 
         #----<<stan016>>----
         #此段落由子樣板a02產生
         AFTER FIELD stan016
            
            #add-point:AFTER FIELD stan016
            IF NOT cl_null(g_stan_m.stan016) THEN
#               IF NOT astm301_stan016_chk(g_stan_m.stan016)THEN 
#                  LET g_stan_m.stan016 = g_stan_m_t.stan016
#                  CALL astm301_stan016_ref()
#                  NEXT FIELD stan016
#               END IF
                IF s_aooi500_setpoint(g_prog,'stan016') THEN
                  CALL s_aooi500_chk(g_prog,'stan016',g_stan_m.stan016,g_site) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stan_m.stan016
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     LET g_stan_m.stan016 = g_stan_m_t.stan016
                     CALL s_desc_get_department_desc(g_stan_m.stan016) RETURNING g_stan_m.stan016_desc
                     DISPLAY BY NAME g_stan_m.stan016,g_stan_m.stan016_desc
                     NEXT FIELD CURRENT
                  END IF
               ELSE
                  IF NOT astm301_stan016_chk(g_stan_m.stan016)THEN 
                     LET g_stan_m.stan016 = g_stan_m_t.stan016
                     CALL astm301_stan016_ref()
                     NEXT FIELD stan016
                  END IF
               END IF
            END IF
            CALL astm301_stan016_ref()

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan016
            #add-point:BEFORE FIELD stan016
            
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stan016
            #add-point:ON CHANGE stan016
            
            #END add-point
 
         #----<<stan011>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan011
            #add-point:BEFORE FIELD stan011
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan011
            
            #add-point:AFTER FIELD stan011
            
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stan011
            #add-point:ON CHANGE stan011
            
            #END add-point
 
         #----<<stan012>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan012
            #add-point:BEFORE FIELD stan012
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan012
            
            #add-point:AFTER FIELD stan012
            
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stan012
            #add-point:ON CHANGE stan012
            
            #END add-point
 
         #----<<stan013>>----
         #此段落由子樣板a02產生
         AFTER FIELD stan013
            
            #add-point:AFTER FIELD stan013
            LET g_stan_m.stan013_desc = ''
            DISPLAY BY NAME g_stan_m.stan013_desc
            IF NOT cl_null(g_stan_m.stan013) THEN
#               IF NOT astm301_stan013_chk(g_stan_m.stan013) THEN
#                  LET g_stan_m.stan013 = g_stan_m_t.stan013
#                  CALL astm301_stan013_ref()
#                  NEXT FIELD stan013
#               END IF
               #150213-00006#2 2015/02/13 By pomelo add(S)
               IF g_stan_m.stan013 != g_stan_m_o.stan013 OR cl_null(g_stan_m_o.stan013) THEN
               #150213-00006#2 2015/02/13 By pomelo add(E)
                  IF s_aooi500_setpoint(g_prog,'stan013') THEN
                     CALL s_aooi500_chk(g_prog,'stan013',g_stan_m.stan013,g_site) RETURNING l_success,l_errno
                     IF NOT l_success THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.extend = g_stan_m.stan013
                        LET g_errparam.code   = l_errno
                        LET g_errparam.popup  = TRUE
                        CALL cl_err()
                        
                        #LET g_stan_m.stan013 = g_stan_m_t.stan013   #150213-00006#2 2015/02/13 By pomelo mark
                        LET g_stan_m.stan013 = g_stan_m_o.stan013    #150213-00006#2 2015/02/13 By pomelo mark
                        CALL s_desc_get_department_desc(g_stan_m.stan013) RETURNING g_stan_m.stan013_desc
                        DISPLAY BY NAME g_stan_m.stan013,g_stan_m.stan013_desc
                        NEXT FIELD CURRENT
                     END IF
                  ELSE
                     IF NOT astm301_stan013_chk(g_stan_m.stan013) THEN
                        #LET g_stan_m.stan013 = g_stan_m_t.stan013   #150213-00006#2 2015/02/13 By pomelo mark
                        LET g_stan_m.stan013 = g_stan_m_o.stan013    #150213-00006#2 2015/02/13 By pomelo mark
                        CALL astm301_stan013_ref()
                        NEXT FIELD stan013
                     END IF
                  END IF
            #150213-00006#2 2015/02/13 By pomelo add(S)
                  IF NOT cl_null(g_stan_m.stan007) THEN
                     IF NOT astm301_stan007_chk(g_stan_m.stan007) THEN
                        LET g_stan_m.stan013 = g_stan_m_o.stan013
                        CALL astm301_stan013_ref()
                        NEXT FIELD stan007
                     END IF 
                     CALL astm301_stan007_ref()
                  END IF
               END IF
            ELSE
               LET g_stan_m.stan007 = ''
               LET g_stan_m.stan007_desc = ''
               DISPLAY BY NAME g_stan_m.stan007, g_stan_m.stan007_desc
            #150213-00006#2 2015/02/13 By pomelo add(E)
            END IF
            CALL astm301_stan013_ref()
            #150213-00006#2 2015/02/13 By pomelo add(S)
            LET g_stan_m_o.stan007 = g_stan_m.stan007
            LET g_stan_m_o.stan013 = g_stan_m.stan013
            #150213-00006#2 2015/02/13 By pomelo add(E)
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan013
            #add-point:BEFORE FIELD stan013
            
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stan013
            #add-point:ON CHANGE stan013
            
            #END add-point
 
         #----<<stan014>>----
         #此段落由子樣板a02產生
         AFTER FIELD stan014
            
            #add-point:AFTER FIELD stan014
                        LET g_stan_m.stan014_desc = ''
            DISPLAY BY NAME g_stan_m.stan014_desc 
            IF NOT cl_null(g_stan_m.stan014) THEN
               IF NOT astm301_stan014_chk(g_stan_m.stan014) THEN
                  LET g_stan_m.stan014 = g_stan_m_t.stan014
                  CALL astm301_stan014_ref()
                  NEXT FIELD stan014
               END IF
            END IF
            CALL astm301_stan014_ref()

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stan014
            #add-point:BEFORE FIELD stan014
            
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stan014
            #add-point:ON CHANGE stan014
            
            #END add-point
 
         #----<<stan017>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan017
            #add-point:BEFORE FIELD stan017
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan017
            
            #add-point:AFTER FIELD stan017
            IF NOT cl_null(g_stan_m.stan017) THEN
               IF NOT astm301_stan017_018_chk(p_cmd,"stan017") THEN
                  LET g_stan_m.stan017 = g_stan_m_t.stan017
                  NEXT FIELD stan017
               END IF
               #IF NOT cl_null(g_stan_m.stan005) AND NOT cl_null(g_stan_m.stan018) THEN
               #   IF NOT astm301_interval_chk(p_cmd) THEN
               #       LET g_stan_m.stan017 = g_stan_m_t.stan017
               #       NEXT FIELD stan017
               #   END IF        
               #END IF         
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stan017
            #add-point:ON CHANGE stan017
            
            #END add-point
 
         #----<<stan018>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan018
            #add-point:BEFORE FIELD stan018
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan018
            
            #add-point:AFTER FIELD stan018
            IF NOT cl_null(g_stan_m.stan018) THEN
               IF NOT astm301_stan017_018_chk(p_cmd,"stan018") THEN
                  LET g_stan_m.stan018 = g_stan_m_t.stan018
                  NEXT FIELD stan018
               END IF
              # IF NOT cl_null(g_stan_m.stan005) AND NOT cl_null(g_stan_m.stan017) THEN
              #    IF NOT astm301_interval_chk(p_cmd) THEN
              #        LET g_stan_m.stan018 = g_stan_m_t.stan018
              #        NEXT FIELD stan018
              #    END IF        
              # END IF   
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stan018
            #add-point:ON CHANGE stan018
            
            #END add-point
 
         #----<<stan019>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan019
            #add-point:BEFORE FIELD stan019
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan019
            
            #add-point:AFTER FIELD stan019
            
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stan019
            #add-point:ON CHANGE stan019
            
            #END add-point
 
         #----<<stan020>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stan020
            #add-point:BEFORE FIELD stan020
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stan020
            
            #add-point:AFTER FIELD stan020
            
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stan020
            #add-point:ON CHANGE stan020
     
         AFTER FIELD next_b
           IF NOT cl_null(g_stan_m.next_b) THEN
              IF g_stan_m.next_b < g_stan_m.stan017 OR g_stan_m.next_b > g_stan_m.stan018 THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = 'ast-00047'
                 LET g_errparam.extend = ''
                 LET g_errparam.popup = TRUE
                 CALL cl_err()

                 LET g_stan_m.next_b = g_stan_m_t.next_b  
                 NEXT FIELD next_b
              END IF
           END IF     
            #END add-point
 
         #----<<stanstus>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stanstus
            #add-point:BEFORE FIELD stanstus
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stanstus
            
            #add-point:AFTER FIELD stanstus
            
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stanstus
            #add-point:ON CHANGE stanstus
            
            #END add-point
 
         #----<<stanownid>>----
         #----<<stanowndp>>----
         #----<<stancrtid>>----
         #----<<stancrtdp>>----
         #----<<stancrtdt>>----
         #----<<stanmodid>>----
         #----<<stanmoddt>>----
         #----<<stancnfid>>----
         #----<<stancnfdt>>----
 #欄位檢查
         #---------------------------<  Master  >---------------------------
         #----<<stan002>>----
         #Ctrlp:input.c.stan002
         ON ACTION controlp INFIELD stan002
            #add-point:ON ACTION controlp INFIELD stan002
            
            #END add-point
 
         #----<<stan001>>----
         #Ctrlp:input.c.stan001
         ON ACTION controlp INFIELD stan001
            #add-point:ON ACTION controlp INFIELD stan001
            
            #END add-point
 
         #----<<stan003>>----
         #Ctrlp:input.c.stan003
         ON ACTION controlp INFIELD stan003
            #add-point:ON ACTION controlp INFIELD stan003
            
            #END add-point
 
         #----<<stan021>>----
         #Ctrlp:input.c.stan021
         ON ACTION controlp INFIELD stan021
            #add-point:ON ACTION controlp INFIELD stan021
            
            #END add-point
 
         #----<<stan005>>----
         #Ctrlp:input.c.stan005
         ON ACTION controlp INFIELD stan005
            #add-point:ON ACTION controlp INFIELD stan005
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stan_m.stan005             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "('1','3')" #

            CALL q_pmaa001_1()                                #呼叫開窗

            LET g_stan_m.stan005 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stan_m.stan005 TO stan005              #顯示到畫面上
            CALL astm301_stan005_ref()
            NEXT FIELD stan005                          #返回原欄位


            #END add-point
 
         #----<<stan004>>----
         #Ctrlp:input.c.stan004
         ON ACTION controlp INFIELD stan004
            #add-point:ON ACTION controlp INFIELD stan004
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stan_m.stan004             #給予default值
            LET g_qryparam.default2 = "" #g_stan_m.stagl003 #說明
            LET g_qryparam.where = " stag002 = '",g_stan_m.stan002,"'"
            #給予arg

            CALL q_stag001()                                #呼叫開窗
            LET g_qryparam.where = '' 
            LET g_stan_m.stan004 = g_qryparam.return1              #將開窗取得的值回傳到變數
            #LET g_stan_m.stagl003 = g_qryparam.return2 #說明

            DISPLAY g_stan_m.stan004 TO stan004              #顯示到畫面上
            #DISPLAY g_stan_m.stagl003 TO stagl003 #說明
            CALL astm301_stan004_ref()
            NEXT FIELD stan004                          #返回原欄位


            #END add-point
 
         #----<<stanunit>>----
         #Ctrlp:input.c.stanunit
         ON ACTION controlp INFIELD stanunit
            #add-point:ON ACTION controlp INFIELD stanunit
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stan_m.stanunit              #給予default值

            #給予arg

            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stanunit',g_site,'i')
            CALL q_ooef001_24()                                #呼叫開窗

            LET g_stan_m.stanunit = g_qryparam.return1              #將開窗取得的值回傳到變數
            DISPLAY g_stan_m.stanunit TO stanunit              #顯示到畫面上
            CALL s_desc_get_department_desc(g_stan_m.stanunit)
               RETURNING g_stan_m.stanunit_desc
            DISPLAY BY NAME g_stan_m.stanunit_desc

            NEXT FIELD stanunit
            #END add-point
 
         #----<<stan006>>----
         #Ctrlp:input.c.stan006
         ON ACTION controlp INFIELD stan006
            #add-point:ON ACTION controlp INFIELD stan006
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stan_m.stan006             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_site
            CALL q_ooaj002_1()                                #呼叫開窗

            LET g_stan_m.stan006 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stan_m.stan006 TO stan006              #顯示到畫面上
            CALL astm301_stan006_ref()
            NEXT FIELD stan006                          #返回原欄位


            #END add-point
 
         #----<<stan007>>----
         #Ctrlp:input.c.stan007
         ON ACTION controlp INFIELD stan007
            #add-point:ON ACTION controlp INFIELD stan007
            #此段落由子樣板a07產生            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stan_m.stan007             #給予default值

            #給予arg
            #LET g_qryparam.arg1 = g_site           #150213-00006#2 2015/02/13 By pomelo mark
            LET g_qryparam.arg1 = g_stan_m.stan013  #150213-00006#2 2015/02/13 By pomelo add

            CALL q_oodb002_1()                                #呼叫開窗

            LET g_stan_m.stan007 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stan_m.stan007 TO stan007              #顯示到畫面上
            CALL astm301_stan007_ref()
            NEXT FIELD stan007                          #返回原欄位


            #END add-point
 
         #----<<stan008>>----
         #Ctrlp:input.c.stan008
         ON ACTION controlp INFIELD stan008
            #add-point:ON ACTION controlp INFIELD stan008
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stan_m.stan008            #給予default值

            CALL q_ooib002_1()                                #呼叫開窗

            LET g_stan_m.stan008 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stan_m.stan008 TO stan008              #顯示到畫面上
            CALL astm301_stan008_ref()
            NEXT FIELD stan008                          #返回原欄位
            #END add-point
 
         #150506-00007#4 150523 by sakura add---STR
         #交易條件
         ON ACTION controlp INFIELD stan022
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stan_m.stan022
            LET g_qryparam.arg1 = '238'
            CALL q_oocq002()
            LET g_stan_m.stan022 = g_qryparam.return1              
            DISPLAY g_stan_m.stan022 TO stan022              
            CALL s_desc_get_acc_desc('238',g_stan_m.stan022) RETURNING g_stan_m.stan022_desc
            DISPLAY BY NAME g_stan_m.stan022_desc
            NEXT FIELD stan022
         #發票類型   
         ON ACTION controlp INFIELD stan023            
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stan_m.stan023
            LET g_qryparam.arg1 = g_ooef019  #稅區
            LET g_qryparam.arg2 = "1"        #進銷項類型
            CALL q_isac002_2()
            LET g_stan_m.stan023 = g_qryparam.return1
            DISPLAY g_stan_m.stan023 TO stan023
            CALL s_desc_get_invoice_type_desc1(g_site,g_stan_m.stan023) RETURNING g_stan_m.stan023_desc
            DISPLAY BY NAME g_stan_m.stan023_desc
            NEXT FIELD stan023            
         #150506-00007#4 150523 by sakura add---END
 
         #----<<stan009>>----
         #Ctrlp:input.c.stan009
         ON ACTION controlp INFIELD stan009
            #add-point:ON ACTION controlp INFIELD stan009
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stan_m.stan009             #給予default值

            #給予arg

            CALL q_staa001()                                #呼叫開窗

            LET g_stan_m.stan009 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stan_m.stan009 TO stan009              #顯示到畫面上
            CALL astm301_stan009_ref()
            NEXT FIELD stan009                          #返回原欄位


            #END add-point
 
         #----<<stan010>>----
         #Ctrlp:input.c.stan010
         ON ACTION controlp INFIELD stan010
            #add-point:ON ACTION controlp INFIELD stan010
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stan_m.stan010             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "2060" #

            CALL q_oocq002()                                #呼叫開窗

            LET g_stan_m.stan010 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stan_m.stan010 TO stan010              #顯示到畫面上
            CALL astm301_stan010_ref()
            NEXT FIELD stan010                          #返回原欄位


            #END add-point
 
         #----<<stan015>>----
         #Ctrlp:input.c.stan015
         ON ACTION controlp INFIELD stan015
            #add-point:ON ACTION controlp INFIELD stan015
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stan_m.stan015             #給予default值

            #給予arg
            #LET g_qryparam.arg1 = 'A'
#            LET g_qryparam.where = "ooef212 = 'Y'"
#            CALL q_ooef001()                                #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stan015') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stan015',g_site,'i')
               CALL q_ooef001_24() 
            ELSE
               LET g_qryparam.where = "ooef212 = 'Y'"
               CALL q_ooef001() 
            END IF

            LET g_stan_m.stan015 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stan_m.stan015 TO stan015              #顯示到畫面上
            CALL astm301_stan015_ref()
            NEXT FIELD stan015                          #返回原欄位


            #END add-point
 
         #----<<stan016>>----
         #Ctrlp:input.c.stan016
         ON ACTION controlp INFIELD stan016
            #add-point:ON ACTION controlp INFIELD stan016
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stan_m.stan016             #給予default值

            #給予arg
            #LET g_qryparam.arg1 = 'D'  
#            LET g_qryparam.where = "ooef303 = 'Y'"
#            CALL q_ooef001()                                #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stan016') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stan016',g_site,'i')
               CALL q_ooef001_24() 
            ELSE
               LET g_qryparam.where = "ooef303 = 'Y'"
               CALL q_ooef001() 
            END IF

            LET g_stan_m.stan016 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stan_m.stan016 TO stan016              #顯示到畫面上
            CALL astm301_stan016_ref()
            NEXT FIELD stan016                          #返回原欄位


            #END add-point
 
         #----<<stan011>>----
         #Ctrlp:input.c.stan011
         ON ACTION controlp INFIELD stan011
            #add-point:ON ACTION controlp INFIELD stan011
            
            #END add-point
 
         #----<<stan012>>----
         #Ctrlp:input.c.stan012
         ON ACTION controlp INFIELD stan012
            #add-point:ON ACTION controlp INFIELD stan012
            
            #END add-point
 
         #----<<stan013>>----
         #Ctrlp:input.c.stan013
         ON ACTION controlp INFIELD stan013
            #add-point:ON ACTION controlp INFIELD stan013
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stan_m.stan013             #給予default值

            #給予arg
            #LET g_qryparam.arg1 = '1'
#            LET g_qryparam.where = "ooef003 = 'Y'"
#            CALL q_ooef001()                                #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stan013') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stan013',g_site,'i')
               CALL q_ooef001_24() 
            ELSE
              LET g_qryparam.where = "ooef003 = 'Y'"
              CALL q_ooef001() 
            END IF

            LET g_stan_m.stan013 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stan_m.stan013 TO stan013              #顯示到畫面上
            CALL astm301_stan013_ref()
            NEXT FIELD stan013                          #返回原欄位


            #END add-point
 
         #----<<stan014>>----
         #Ctrlp:input.c.stan014
         ON ACTION controlp INFIELD stan014
            #add-point:ON ACTION controlp INFIELD stan014
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stan_m.stan014             #給予default值

            #給予arg

            CALL q_ooag001()                                #呼叫開窗

            LET g_stan_m.stan014 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stan_m.stan014 TO stan014              #顯示到畫面上
            CALL astm301_stan014_ref()
            NEXT FIELD stan014                          #返回原欄位


            #END add-point
 
         #----<<stan017>>----
         #Ctrlp:input.c.stan017
         ON ACTION controlp INFIELD stan017
            #add-point:ON ACTION controlp INFIELD stan017
            
            #END add-point
 
         #----<<stan018>>----
         #Ctrlp:input.c.stan018
         ON ACTION controlp INFIELD stan018
            #add-point:ON ACTION controlp INFIELD stan018
            
            #END add-point
 
         #----<<stan019>>----
         #Ctrlp:input.c.stan019
         ON ACTION controlp INFIELD stan019
            #add-point:ON ACTION controlp INFIELD stan019
            
            #END add-point
 
         #----<<stan020>>----
         #Ctrlp:input.c.stan020
         ON ACTION controlp INFIELD stan020
            #add-point:ON ACTION controlp INFIELD stan020
            
            #END add-point
 
         #----<<stanstus>>----
         #Ctrlp:input.c.stanstus
         ON ACTION controlp INFIELD stanstus
            #add-point:ON ACTION controlp INFIELD stanstus
            
            #END add-point
 
         #----<<stanownid>>----
         #----<<stanowndp>>----
         #----<<stancrtid>>----
         #----<<stancrtdp>>----
         #----<<stancrtdt>>----
         #----<<stanmodid>>----
         #----<<stanmoddt>>----
         #----<<stancnfid>>----
         #----<<stancnfdt>>----
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            #CALL cl_showmsg()      #錯誤訊息統整顯示
            DISPLAY BY NAME g_stan_m.stan001             
 
                            
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前
               IF NOT astm301_interval_chk(p_cmd) THEN       
                  CALL s_transaction_end('N','0')
                  NEXT FIELD CURRENT
               END IF
               
               IF NOT astm301_upd_stax(p_cmd) THEN
                     CALL s_transaction_end('N','0')
                     NEXT FIELD CURRENT
               END IF
                  
               IF l_cmd_t = 'r' THEN 
                  LET  g_stan_m.stanunit = g_site
               END IF
               
               #add--2015/07/30 By shiun--(S)
               CALL s_aooi390_get_auto_no('22',g_stan_m.stan001) RETURNING l_success,g_stan_m.stan001
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  NEXT FIELD CURRENT
               END IF   
               DISPLAY BY NAME g_stan_m.stan001
               #add--2015/07/30 By shiun--(E)
               CALL s_aooi390_oofi_upd('22',g_stan_m.stan001) RETURNING l_success  #add--2015/05/08 By shiun 增加編碼功能
               #end add-point
               
               INSERT INTO stan_t (stanent,stan002,stan001,stan003,stan021,stan005,stan004,stanunit, 
                   stan006,stan007,stan008,
                   stan022,stan023,stan024,stan025,stan026,stan027,stan028, #150506-00007#4 150523 by sakura add
                   stan029,stan030,stan031,stan032,
                   stan009,stan010,stan015,stan016,stan011,stan012,stan013,stan014, 
                   stan017,stan018,stan019,stan020,stanstus,stanownid,stanowndp,stancrtid,stancrtdp, 
                   stancrtdt,stanmodid,stanmoddt,stancnfid,stancnfdt)
               VALUES (g_enterprise,g_stan_m.stan002,g_stan_m.stan001,g_stan_m.stan003,g_stan_m.stan021, 
                   g_stan_m.stan005,g_stan_m.stan004,g_stan_m.stanunit,g_stan_m.stan006,g_stan_m.stan007, 
                   g_stan_m.stan008,
                   g_stan_m.stan022,g_stan_m.stan023,g_stan_m.stan024,g_stan_m.stan025,g_stan_m.stan026,g_stan_m.stan027,g_stan_m.stan028, #150506-00007#4 150523 by sakura add
                   g_stan_m.stan029,g_stan_m.stan030,g_stan_m.stan031,g_stan_m.stan032,
                   g_stan_m.stan009,g_stan_m.stan010,g_stan_m.stan015,g_stan_m.stan016, 
                   g_stan_m.stan011,g_stan_m.stan012,g_stan_m.stan013,g_stan_m.stan014,g_stan_m.stan017, 
                   g_stan_m.stan018,g_stan_m.stan019,g_stan_m.stan020,g_stan_m.stanstus,g_stan_m.stanownid, 
                   g_stan_m.stanowndp,g_stan_m.stancrtid,g_stan_m.stancrtdp,g_stan_m.stancrtdt,g_stan_m.stanmodid, 
                   g_stan_m.stanmoddt,g_stan_m.stancnfid,g_stan_m.stancnfdt) 
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "g_stan_m"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
  
                  CALL s_transaction_end('N','0')
                  CONTINUE DIALOG
               END IF
               
               #add-point:單頭新增中
                             IF l_cmd_t <> 'r' THEN 
                 IF NOT cl_null(g_stan_m.stan004) THEN
                    CALL astm301_stan004_genb()
                    CALL astm301_b_fill()
                    LET l_ac3 = 1
                    CALL astm301_b3_fill()
                    CALL astm301_reflesh()
                 END IF
               END IF
               #end add-point
               
               
               
               CALL s_transaction_end('Y','0') 
               
               #add-point:單頭新增後
                             
               #end add-point
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astm301_detail_reproduce()
               END IF
               
               LET p_cmd = 'u'
 
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前
               IF NOT astm301_interval_chk(p_cmd) THEN       
                  CALL s_transaction_end('N','0')
                  NEXT FIELD CURRENT
               END IF
                IF NOT astm301_upd_stax(p_cmd) THEN
                     CALL s_transaction_end('N','0')
                     NEXT FIELD CURRENT
               END IF
               
               IF cl_null(g_stan_m.stan003) THEN
                  LET g_stan_m.stan003 = 1
               END IF
               LET g_stan_m.stan003 =  g_stan_m.stan003+1
               LET g_stan_m.stan003 =  g_stan_m.stan003 USING "<<<<<<<<<#"
               #end add-point
               
               UPDATE stan_t SET (stan002,stan001,stan003,stan021,stan005,stan004,stanunit,stan006,stan007, 
                   stan008,
                   stan022,stan023,stan024,stan025,stan026,stan027,stan028, #150506-00007#4 150523 by sakura add
                   stan029,stan030,stan031,stan032,
                   stan009,stan010,stan015,stan016,stan011,stan012,stan013,stan014,stan017,stan018, 
                   stan019,stan020,stanstus,stanownid,stanowndp,stancrtid,stancrtdp,stancrtdt,stanmodid, 
                   stanmoddt,stancnfid,stancnfdt) = (g_stan_m.stan002,g_stan_m.stan001,g_stan_m.stan003, 
                   g_stan_m.stan021,g_stan_m.stan005,g_stan_m.stan004,g_stan_m.stanunit,g_stan_m.stan006, 
                   g_stan_m.stan007,g_stan_m.stan008,
                   g_stan_m.stan022,g_stan_m.stan023,g_stan_m.stan024,g_stan_m.stan025,g_stan_m.stan026,g_stan_m.stan027,g_stan_m.stan028, #150506-00007#4 150523 by sakura add
                   g_stan_m.stan029,g_stan_m.stan030,g_stan_m.stan031,g_stan_m.stan032,
                   g_stan_m.stan009,g_stan_m.stan010,g_stan_m.stan015, 
                   g_stan_m.stan016,g_stan_m.stan011,g_stan_m.stan012,g_stan_m.stan013,g_stan_m.stan014, 
                   g_stan_m.stan017,g_stan_m.stan018,g_stan_m.stan019,g_stan_m.stan020,g_stan_m.stanstus, 
                   g_stan_m.stanownid,g_stan_m.stanowndp,g_stan_m.stancrtid,g_stan_m.stancrtdp,g_stan_m.stancrtdt, 
                   g_stan_m.stanmodid,g_stan_m.stanmoddt,g_stan_m.stancnfid,g_stan_m.stancnfdt)
                WHERE stanent = g_enterprise AND stan001 = g_stan001_t
 
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "stan_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
  
                  CALL s_transaction_end('N','0')
                  CONTINUE DIALOG
               END IF
               
               #add-point:單頭修改中
                               IF g_stan_m.stan004 <> g_stan_m_t.stan004 AND p_cmd = 'u' THEN
                    IF NOT cl_null(g_stan_m.stan004) THEN
                       CALL astm301_stan004_genb()
                       CALL astm301_b_fill()
                       LET l_ac3 = 1
                       CALL astm301_b3_fill()
                       CALL astm301_reflesh()
                    END IF
                 END IF
               #end add-point
               
               
               
               CALL s_transaction_end('Y','0')
               
               #add-point:單頭修改後
               
               #end add-point
            END IF
            
            LET g_stan001_t = g_stan_m.stan001
 
            #controlp
            
      END INPUT
   
 
{</section>}
 
{<section id="astm301.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stao_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stao_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astm301_b_fill()
            LET g_rec_b = g_stao_d.getLength()
            #add-point:資料輸入前
            
            #end add-point
         
         BEFORE ROW
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            CALL astm301_b_fill2('2')
            CALL astm301_b_fill2('3')
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astm301_cl USING g_enterprise,g_stan_m.stan001
 
            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN astm301_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               CLOSE astm301_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            
            LET g_rec_b = g_stao_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stao_d[l_ac].stao002 IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stao_d_t.* = g_stao_d[l_ac].*  #BACKUP
               CALL astm301_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b
               
               #end add-point  
               CALL astm301_set_no_entry_b(l_cmd)
               IF NOT astm301_lock_b("stao_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astm301_bcl INTO g_stao_d[l_ac].stao002,g_stao_d[l_ac].stao003,g_stao_d[l_ac].stao003_desc,g_stao_d[l_ac].stao023,g_stao_d[l_ac].stao024, #add by geza 20150610 150602-00003#12  stao023,stao024
                      g_stao_d[l_ac].stao025,g_stao_d[l_ac].stao025_desc,g_stao_d[l_ac].stao004,g_stao_d[l_ac].stao005,g_stao_d[l_ac].stao006,g_stao_d[l_ac].stao007, 
                      g_stao_d[l_ac].stao008,g_stao_d[l_ac].stao027,g_stao_d[l_ac].stao009,g_stao_d[l_ac].stao009_desc,g_stao_d[l_ac].stao010, 
                      g_stao_d[l_ac].stao010_desc,g_stao_d[l_ac].stao011,g_stao_d[l_ac].stao012,g_stao_d[l_ac].stao013, 
                      g_stao_d[l_ac].stao014,g_stao_d[l_ac].stao015,g_stao_d[l_ac].stao016,g_stao_d[l_ac].stao022,g_stao_d[l_ac].stao017, 
                      g_stao_d[l_ac].stao018,g_stao_d[l_ac].stao019,g_stao_d[l_ac].stao020,g_stao_d[l_ac].stao021
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = g_stao_d_t.stao002
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
 
                     LET l_lock_sw = "Y"
                  END IF
                  
                  LET g_bfill = "N"
                  CALL astm301_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row
                          IF l_cmd = 'u' THEN
                 CALL astm301_b3_fill()
                 CALL astm301_reflesh()
             END IF 
  
             CALL astm301_set_entry_b(l_cmd)
             CALL astm301_set_no_required_b(l_cmd)
             CALL astm301_set_required_b(l_cmd)
             CALL astm301_set_no_entry_b(l_cmd)
             LET g_stao_d_t.* = g_stao_d[l_ac].* 
             LET g_stao_d_o.* = g_stao_d[l_ac].* 
             IF g_stao_d[l_ac].stao016 = '1' THEN
                CALL cl_set_comp_visible('group7',FALSE)
             ELSE
                CALL cl_set_comp_visible('group7',TRUE)
             END IF 
             CALL astm301_set_visible(g_detail_idx)   
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
            #其他table進行lock
            
        
         BEFORE INSERT
            
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stao_d[l_ac].* TO NULL 
                  LET g_stao_d[l_ac].stao013 = "1"
      LET g_stao_d[l_ac].stao016 = "1"
 
 
            LET g_stao_d_t.* = g_stao_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astm301_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b
            
            #end add-point
            CALL astm301_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stao_d[li_reproduce_target].* = g_stao_d[li_reproduce].*
 
               LET g_stao_d[li_reproduce_target].stao002 = NULL
 
            END IF
            #公用欄位給值(單身)
            
            
            #add-point:modify段before insert
                         LET g_insert = 'Y'
             CALL g_stap_d.clear()
             CALL astm301_set_entry_b(l_cmd)
             CALL astm301_set_no_required_b(l_cmd)
             CALL astm301_set_required_b(l_cmd)
             CALL astm301_set_no_entry_b(l_cmd)
            SELECT MAX(stao002)+1 INTO  g_stao_d[l_ac].stao002 FROM stao_t
             WHERE staoent = g_enterprise AND stao001 = g_stan_m.stan001
            IF cl_null( g_stao_d[l_ac].stao002 ) THEN             
               LET g_stao_d[l_ac].stao002 = 1
            END IF
            LET g_stao_d[l_ac].stao017 = g_stan_m.stan017
            LET g_stao_d[l_ac].stao018 = g_stan_m.stan018
            LET g_stao_d[l_ac].stao027 = 'Y'      #160513-00002#3  by 08172
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
               
            #add-point:單身新增
            
            #end add-point
               
            LET l_count = 1  
            SELECT COUNT(*) INTO l_count FROM stao_t 
             WHERE staoent = g_enterprise AND stao001 = g_stan_m.stan001
 
               AND stao002 = g_stao_d[l_ac].stao002
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stan_m.stan001
               LET gs_keys[2] = g_stao_d[g_detail_idx].stao002
               CALL astm301_insert_b('stao_t',gs_keys,"'1'")
                           
               #add-point:單身新增後
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00006"
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               INITIALIZE g_stao_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stao_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
               CALL s_transaction_end('N','0')                    
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astm301_b_fill()
               #資料多語言用-增/改
               
               #add-point:input段-after_insert
               
               #end add-point
               CALL s_transaction_end('Y','0')
               ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' AND g_stao_d.getLength() < l_ac THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
               CALL g_stao_d.deleteElement(l_ac)
               NEXT FIELD stao002
            END IF
         
            IF g_stao_d[l_ac].stao002 IS NOT NULL
 
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
               
               #add-point:單身刪除前
                              DELETE FROM stap_t
                WHERE stapent = g_enterprise AND stap001 = g_stan_m.stan001 AND

                      stap002 = g_stao_d_t.stao002
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "stap_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')
                  CANCEL DELETE 
               END IF   
               #end add-point 
               
               DELETE FROM stao_t
                WHERE staoent = g_enterprise AND stao001 = g_stan_m.stan001 AND
 
                      stao002 = g_stao_d_t.stao002
 
                  
               #add-point:單身刪除中
               
               #end add-point 
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stao_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
                  CALL s_transaction_end('N','0')
                  CANCEL DELETE   
               ELSE
                  LET g_rec_b = g_rec_b-1
                  
                  #add-point:單身刪除後
                  
                  #end add-point
                  CALL s_transaction_end('Y','0')
               END IF 
               CLOSE astm301_bcl
               LET l_count = g_stao_d.getLength()
            END IF 
            
                           INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stan_m.stan001
               LET gs_keys[2] = g_stao_d[g_detail_idx].stao002
 
              
         AFTER DELETE 
            #add-point:單身刪除後2
            
            #end add-point
                           CALL astm301_delete_b('stao_t',gs_keys,"'1'")
 
         #---------------------<  Detail: page1  >---------------------
         #----<<stao002>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao002
            #add-point:BEFORE FIELD stao002
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao002
            
            #add-point:AFTER FIELD stao002
                        #此段落由子樣板a05產生
            IF  NOT cl_null(g_stan_m.stan001) AND NOT cl_null(g_stao_d[g_detail_idx].stao002) THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND ( l_cmd = 'u' AND (g_stan_m.stan001 != g_stan001_t OR g_stao_d[g_detail_idx].stao002 != g_stao_d_t.stao002))) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stao_t WHERE "||"staoent = '" ||g_enterprise|| "' AND "||"stao001 = '"||g_stan_m.stan001 ||"' AND "|| "stao002 = '"||g_stao_d[g_detail_idx].stao002 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            LET g_stao_d_t.stao002 = g_stao_d[l_ac].stao002

            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao002
            #add-point:ON CHANGE stao002
            
            #END add-point
 
         #----<<stao003>>----
         #此段落由子樣板a02產生
         AFTER FIELD stao003
            
            #add-point:AFTER FIELD stao003
                       LET g_stao_d[l_ac].stao003_desc = ''
           DISPLAY BY NAME g_stao_d[l_ac].stao003_desc           
           IF NOT cl_null(g_stao_d[l_ac].stao003) THEN
              IF NOT astm301_stao003_chk(g_stao_d[l_ac].stao003 ) THEN
                 LET g_stao_d[l_ac].stao003 = g_stao_d_t.stao003
                 CALL astm301_stao003_ref() 
                 SELECT stae006 INTO  g_stao_d[l_ac].stao005 FROM stae_t WHERE staeent = g_enterprise AND stae001 = g_stao_d[l_ac].stao003
                 DISPLAY BY NAME g_stao_d[l_ac].stao005 
               
                 NEXT FIELD stao003
              END IF
       
               IF NOT cl_null(g_stao_d[l_ac].stao017) AND NOT cl_null(g_stao_d[l_ac].stao018) AND NOT cl_null(g_stao_d[l_ac].stao002) THEN
                  IF NOT astm301_stao017_018_chk() THEN
                     LET g_stao_d[l_ac].stao003 =g_stao_d_t.stao003
                     NEXT FIELD stao003
                  END IF
               END IF
               
              IF g_stao_d[l_ac].stao003 <> g_stao_d_o.stao003 AND NOT cl_null(g_stao_d_o.stao003) THEN
                 #SELECT COUNT(*) INTO l_n FROM staf_t
                 # WHERE stafent = g_enterprise AND staf001= g_stao_d[l_ac].stao003 AND staf002 = g_stan_m.stan002
                 #   AND staf003 = 'stao016' AND staf004 = 'N'
                 #IF l_n> 0 THEN
                 #      IF cl_ask_confirm('ast-00024') THEN
                 #         DELETE FROM stap_t
                 #          WHERE stapent = g_enterprise AND stap001 = g_stan_m.stan001 AND
                 #                stap002 = g_stao_d_t.stao002
                 #          CALL g_stap_d.clear()
                 #      ELSE
                 #          LET g_stao_d[l_ac].stao003 = g_stao_d_t.stao003
                 #          CALL astm301_stao003_ref() 
                 #          NEXT FIELD stao003
                 #      END IF
                 #END IF
                 IF l_cmd = 'u' AND g_stap_d.getlength() > 0 THEN
                     IF cl_ask_confirm('ast-00018') THEN
                        DELETE FROM stap_t
                         WHERE stapent = g_enterprise AND stap001 = g_stan_m.stan001 AND
                               stap002 = g_stao_d_t.stao002
                         CALL g_stap_d.clear()
                     ELSE
                        
                     END IF  
                 END IF 
                END IF   
       
               IF (g_stao_d[l_ac].stao003 <> g_stao_d_o.stao003 AND NOT cl_null(g_stao_d_o.stao003)) OR (l_cmd = 'a' AND cl_null(g_stao_d_o.stao003)) THEN         
                 LET g_stao_d_t.stao002 = g_stao_d[l_ac].stao002
                 LET g_stao_d_t.stao003 = g_stao_d[l_ac].stao003
                 INITIALIZE g_stao_d[l_ac].* TO NULL
                 LET g_stao_d[l_ac].stao013 = "1"
                 LET g_stao_d[l_ac].stao016 = "1"
                 LET g_stao_d[l_ac].stao017 = g_stan_m.stan017
                 LET g_stao_d[l_ac].stao018 = g_stan_m.stan018
                 LET g_stao_d[l_ac].stao002 = g_stao_d_t.stao002
                 LET g_stao_d[l_ac].stao003 =  g_stao_d_t.stao003 
                  #帶出費用編號預設
                 SELECT stae006 INTO  g_stao_d[l_ac].stao005 FROM stae_t WHERE staeent = g_enterprise AND stae001 = g_stao_d[l_ac].stao003
                   DISPLAY BY NAME g_stao_d[l_ac].stao003_desc,g_stao_d[l_ac].stao005 
                 IF g_stao_d[l_ac].stao005 = '3' THEN
                    LET g_stao_d[l_ac].stao005 = ''
                 END IF
                #費用合約設定asti204
                 CALL astm301_default(g_stan_m.stan002,g_stao_d[l_ac].stao003) 
               END IF
               CALL astm301_stao003_ref()
              #SELECT stae006 INTO  g_stao_d[l_ac].stao005 FROM stae_t WHERE staeent = g_enterprise AND stae001 = g_stao_d[l_ac].stao003
           ELSE
              LET g_stao_d[l_ac].stao003_desc = ''
              LET g_stao_d[l_ac].stao005 = ''
           END IF
           
           LET g_stao_d_o.stao003 = g_stao_d[l_ac].stao003
              CALL astm301_set_entry_b(l_cmd)
              CALL astm301_set_no_required_b(l_cmd)
              CALL astm301_set_required_b(l_cmd)
              CALL astm301_set_no_entry_b(l_cmd)

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stao003
            #add-point:BEFORE FIELD stao003
                        IF cl_null(g_stao_d[l_ac].stao002) THEN
               NEXT FIELD stao002
            END IF
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stao003
            #add-point:ON CHANGE stao003
            
            #END add-point
 
         #----<<stao004>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao004
            #add-point:BEFORE FIELD stao004
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao004
            
            #add-point:AFTER FIELD stao004
            
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao004
            #add-point:ON CHANGE stao004
            
            #END add-point
 
         #----<<stao005>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao005
            #add-point:BEFORE FIELD stao005
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao005
            
            #add-point:AFTER FIELD stao005
            
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao005
            #add-point:ON CHANGE stao005
            
            #END add-point
 
         #----<<stao006>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao006
            #add-point:BEFORE FIELD stao006
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao006
            
            #add-point:AFTER FIELD stao006
                         CALL astm301_set_entry_b(l_cmd)
             CALL astm301_set_no_required_b(l_cmd)
             CALL astm301_set_required_b(l_cmd)
             CALL astm301_set_no_entry_b(l_cmd)
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao006
            #add-point:ON CHANGE stao006
            
            #END add-point
 
         #----<<stao007>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao007
            #add-point:BEFORE FIELD stao007
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao007
            
            #add-point:AFTER FIELD stao007
            
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao007
            #add-point:ON CHANGE stao007
            IF NOT cl_null(g_stao_d[l_ac].stao007) AND NOT cl_null(g_stao_d[l_ac].stao008)  AND NOT cl_null(g_stao_d[l_ac].stao017) AND NOT cl_null(g_stao_d[l_ac].stao018) THEN    
               #CALL s_astm301_cal_nextd(g_stao_d[l_ac].stao007,g_stao_d[l_ac].stao008,g_stao_d[l_ac].stao017,g_stao_d[l_ac].stao018,'','') RETURNING g_stao_d[l_ac].stao019,g_stao_d[l_ac].stao020,g_stao_d[l_ac].stao021
            END IF
            #END add-point
 
         #----<<stao008>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao008
            #add-point:BEFORE FIELD stao008
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao008
            
            #add-point:AFTER FIELD stao008
            
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao008
            #add-point:ON CHANGE stao008
             IF NOT cl_null(g_stao_d[l_ac].stao007) AND NOT cl_null(g_stao_d[l_ac].stao008)  AND NOT cl_null(g_stao_d[l_ac].stao017) AND NOT cl_null(g_stao_d[l_ac].stao018) THEN    
                #CALL s_astm301_cal_nextd(g_stao_d[l_ac].stao007,g_stao_d[l_ac].stao008,g_stao_d[l_ac].stao017,g_stao_d[l_ac].stao018,'','') RETURNING g_stao_d[l_ac].stao019,g_stao_d[l_ac].stao020,g_stao_d[l_ac].stao021
            END IF
            #END add-point
 
         #----<<stao009>>----
         #此段落由子樣板a02產生
         AFTER FIELD stao009
            
            #add-point:AFTER FIELD stao009
                        LET g_stao_d[l_ac].stao009_desc = ''
            IF NOT cl_null(g_stao_d[l_ac].stao009) THEN
               IF NOT astm301_stao009_chk(g_stao_d[l_ac].stao009) THEN
                  LET g_stao_d[l_ac].stao009 = g_stao_d_t.stao009
                  CALL astm301_stao009_ref()
                  NEXT FIELD stao009
               END IF
            END IF
            CALL astm301_stao009_ref()
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stao009
            #add-point:BEFORE FIELD stao009
            
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stao009
            #add-point:ON CHANGE stao009
            
            #END add-point
 
         #----<<stao010>>----
         #此段落由子樣板a02產生
         AFTER FIELD stao010
            
            #add-point:AFTER FIELD stao010
                       LET g_stao_d[l_ac].stao010_desc = ''
           IF NOT cl_null(g_stao_d[l_ac].stao010) THEN
               IF NOT astm301_stao009_chk(g_stao_d[l_ac].stao010) THEN
                  LET g_stao_d[l_ac].stao010 = g_stao_d_t.stao010
                  CALL astm301_stao010_ref()
                  NEXT FIELD stao010
               END IF
            END IF
            CALL astm301_stao010_ref()
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stao010
            #add-point:BEFORE FIELD stao010
            
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stao010
            #add-point:ON CHANGE stao010
            
            #END add-point
 
         #----<<stao011>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao011
            #add-point:BEFORE FIELD stao011
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao011
            
            #add-point:AFTER FIELD stao011
                        IF NOT cl_null(g_stao_d[l_ac].stao011) THEN
               IF g_stao_d[l_ac].stao011 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stao_d[l_ac].stao011 = g_stao_d_t.stao011
                  NEXT FIELD stao011
               END IF
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao011
            #add-point:ON CHANGE stao011
            
            #END add-point
 
         #----<<stao012>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao012
            #add-point:BEFORE FIELD stao012
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao012
            
            #add-point:AFTER FIELD stao012
                         IF NOT cl_null( g_stao_d[l_ac].stao012) THEN
               IF g_stao_d[l_ac].stao012 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stao_d[l_ac].stao012 = g_stao_d_t.stao012
                  NEXT FIELD stao012
               END IF
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao012
            #add-point:ON CHANGE stao012
            
            #END add-point
 
         #----<<stao013>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao013
            #add-point:BEFORE FIELD stao013
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao013
            
            #add-point:AFTER FIELD stao013
                        CALL astm301_set_entry_b(l_cmd)
             CALL astm301_set_no_required_b(l_cmd)
             CALL astm301_set_required_b(l_cmd)
             CALL astm301_set_no_entry_b(l_cmd)
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao013
            #add-point:ON CHANGE stao013
            
            #END add-point
 
         #----<<stao014>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao014
            #add-point:BEFORE FIELD stao014
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao014
            
            #add-point:AFTER FIELD stao014
                        IF NOT cl_null(g_stao_d[l_ac].stao014) THEN
               IF g_stao_d[l_ac].stao014 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stao_d[l_ac].stao014 = g_stao_d_t.stao014
                  NEXT FIELD stao014
               END IF
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao014
            #add-point:ON CHANGE stao014
            
            #END add-point
 
         #----<<stao015>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao015
            #add-point:BEFORE FIELD stao015
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao015
            
            #add-point:AFTER FIELD stao015
                        IF NOT cl_null(g_stao_d[l_ac].stao015) THEN
               IF g_stao_d[l_ac].stao015 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stao_d[l_ac].stao015 = g_stao_d_t.stao015
                  NEXT FIELD stao015
               END IF
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao015
            #add-point:ON CHANGE stao015
            
            #END add-point
 
         #----<<stao016>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao016
            #add-point:BEFORE FIELD stao016
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao016
            
            #add-point:AFTER FIELD stao016
                        CALL astm301_set_entry_b(l_cmd)
             CALL astm301_set_no_required_b(l_cmd)
             CALL astm301_set_required_b(l_cmd)
             CALL astm301_set_no_entry_b(l_cmd)
             IF g_stao_d[l_ac].stao016 = '1' AND g_stap_d.getlength() > 0 THEN
                IF cl_ask_confirm('ast-00018') THEN
                   DELETE FROM stap_t
                    WHERE stapent = g_enterprise AND stap001 = g_stan_m.stan001 AND
                          stap002 = g_stao_d_t.stao002
                    CALL g_stap_d.clear()
                ELSE
                   LET g_stao_d[l_ac].stao016 =  g_stao_d_t.stao016
                END IF  
             END IF 
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao016
            #add-point:ON CHANGE stao016
            
            #END add-point
 
         #----<<stao017>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao017
            #add-point:BEFORE FIELD stao017
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao017
            
            #add-point:AFTER FIELD stao017
            IF NOT cl_null(g_stao_d[l_ac].stao017) THEN  
               IF NOT astm301_stao017_018_chk() THEN
                  LET g_stao_d[l_ac].stao017 =g_stao_d_t.stao017
                  NEXT FIELD stao017
               END IF  
            END IF
            IF NOT cl_null(g_stao_d[l_ac].stao007) AND NOT cl_null(g_stao_d[l_ac].stao008)  AND NOT cl_null(g_stao_d[l_ac].stao017) AND NOT cl_null(g_stao_d[l_ac].stao018) THEN    
               #CALL s_astm301_cal_nextd(g_stao_d[l_ac].stao007,g_stao_d[l_ac].stao008,g_stao_d[l_ac].stao017,g_stao_d[l_ac].stao018,'','') RETURNING g_stao_d[l_ac].stao019,g_stao_d[l_ac].stao020,g_stao_d[l_ac].stao021
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao017
            #add-point:ON CHANGE stao017
      
            
            
            #END add-point
 
         #----<<stao018>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao018
            #add-point:BEFORE FIELD stao018
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao018
            
            #add-point:AFTER FIELD stao018
            IF NOT cl_null(g_stao_d[l_ac].stao018) THEN     
               IF NOT astm301_stao017_018_chk() THEN
                     LET g_stao_d[l_ac].stao018 =g_stao_d_t.stao018
                     NEXT FIELD stao018
                END IF
            END IF
             IF NOT cl_null(g_stao_d[l_ac].stao007) AND NOT cl_null(g_stao_d[l_ac].stao008)  AND NOT cl_null(g_stao_d[l_ac].stao017) AND NOT cl_null(g_stao_d[l_ac].stao018) THEN    
                #CALL s_astm301_cal_nextd(g_stao_d[l_ac].stao007,g_stao_d[l_ac].stao008,g_stao_d[l_ac].stao017,g_stao_d[l_ac].stao018,'','') RETURNING g_stao_d[l_ac].stao019,g_stao_d[l_ac].stao020,g_stao_d[l_ac].stao021
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao018
            #add-point:ON CHANGE stao018
            
            #END add-point
 
         #----<<stao019>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stao019
            #add-point:BEFORE FIELD stao019
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stao019
            
            #add-point:AFTER FIELD stao019
            
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stao019
            #add-point:ON CHANGE stao019
            
            #END add-point
 
 
         #---------------------<  Detail: page1  >---------------------
         #----<<stao002>>----
         #Ctrlp:input.c.page1.stao002
         ON ACTION controlp INFIELD stao002
            #add-point:ON ACTION controlp INFIELD stao002
            
            #END add-point
 
         #----<<stao003>>----
         #Ctrlp:input.c.page1.stao003
         ON ACTION controlp INFIELD stao003
            #add-point:ON ACTION controlp INFIELD stao003
            #此段落由子樣板a07產生            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stao_d[l_ac].stao003             #給予default值
            LET g_qryparam.default2 = "" #g_stao_d[l_ac].stael003 #說明
            LET g_qryparam.default3 = "" #g_stao_d[l_ac].stae001 #費用編號

            #給予arg
            SELECT ooef019 INTO l_ooef019 FROM ooef_t 
             WHERE ooefent = g_enterprise AND ooef001 = g_stan_m.stan013
            LET g_qryparam.where = " (stae009 = 'N' OR stae010 IN (SELECT oodb002 FROM oodb_t WHERE oodbent = '",g_enterprise,"' AND oodb001 = '",l_ooef019,"'))"
                                                               
            CALL q_stae001()                                #呼叫開窗

            LET g_stao_d[l_ac].stao003 = g_qryparam.return1              #將開窗取得的值回傳到變數
            #LET g_stao_d[l_ac].stael003 = g_qryparam.return2 #說明
            #LET g_stao_d[l_ac].stae001 = g_qryparam.return3 #費用編號

            DISPLAY g_stao_d[l_ac].stao003 TO stao003              #顯示到畫面上
            #DISPLAY g_stao_d[l_ac].stael003 TO stael003 #說明
            #DISPLAY g_stao_d[l_ac].stae001 TO stae001 #費用編號
            CALL astm301_stao003_ref()
            NEXT FIELD stao003                          #返回原欄位


            #END add-point
 
         #----<<stao004>>----
         #Ctrlp:input.c.page1.stao004
         ON ACTION controlp INFIELD stao004
            #add-point:ON ACTION controlp INFIELD stao004
            
            #END add-point
 
         #----<<stao005>>----
         #Ctrlp:input.c.page1.stao005
         ON ACTION controlp INFIELD stao005
            #add-point:ON ACTION controlp INFIELD stao005
            
            #END add-point
 
         #----<<stao006>>----
         #Ctrlp:input.c.page1.stao006
         ON ACTION controlp INFIELD stao006
            #add-point:ON ACTION controlp INFIELD stao006
            
            #END add-point
 
         #----<<stao007>>----
         #Ctrlp:input.c.page1.stao007
         ON ACTION controlp INFIELD stao007
            #add-point:ON ACTION controlp INFIELD stao007
            
            #END add-point
 
         #----<<stao008>>----
         #Ctrlp:input.c.page1.stao008
         ON ACTION controlp INFIELD stao008
            #add-point:ON ACTION controlp INFIELD stao008
            
            #END add-point
 
         #----<<stao009>>----
         #Ctrlp:input.c.page1.stao009
         ON ACTION controlp INFIELD stao009
            #add-point:ON ACTION controlp INFIELD stao009
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stao_d[l_ac].stao009             #給予default值
            LET g_qryparam.default2 = "" #g_stao_d[l_ac].stabl003 #說明
            LET g_qryparam.default3 = "" #g_stao_d[l_ac].stabl004 #助記碼

            #給予arg
            LET g_qryparam.arg1 = g_stan_m.stan002
            LET g_qryparam.arg2 = g_stan_m.stan010
            CALL q_stab001_3()                                #呼叫開窗

            LET g_stao_d[l_ac].stao009 = g_qryparam.return1              #將開窗取得的值回傳到變數
            #LET g_stao_d[l_ac].stabl003 = g_qryparam.return2 #說明
            #LET g_stao_d[l_ac].stabl004 = g_qryparam.return3 #助記碼

            DISPLAY g_stao_d[l_ac].stao009 TO stao009              #顯示到畫面上
            #DISPLAY g_stao_d[l_ac].stabl003 TO stabl003 #說明
            #DISPLAY g_stao_d[l_ac].stabl004 TO stabl004 #助記碼
            CALL astm301_stao009_ref()
            NEXT FIELD stao009                          #返回原欄位


            #END add-point
 
         #----<<stao010>>----
         #Ctrlp:input.c.page1.stao010
         ON ACTION controlp INFIELD stao010
            #add-point:ON ACTION controlp INFIELD stao010
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stao_d[l_ac].stao010             #給予default值
            LET g_qryparam.default2 = "" #g_stao_d[l_ac].stabl003 #說明
            LET g_qryparam.default3 = "" #g_stao_d[l_ac].stabl004 #助記碼

            #給予arg
            LET g_qryparam.arg1 = g_stan_m.stan002
            LET g_qryparam.arg2 = g_stan_m.stan010
            CALL q_stab001_3()                                #呼叫開窗

            LET g_stao_d[l_ac].stao010 = g_qryparam.return1              #將開窗取得的值回傳到變數
            #LET g_stao_d[l_ac].stabl003 = g_qryparam.return2 #說明
            #LET g_stao_d[l_ac].stabl004 = g_qryparam.return3 #助記碼

            DISPLAY g_stao_d[l_ac].stao010 TO stao010              #顯示到畫面上
            #DISPLAY g_stao_d[l_ac].stabl003 TO stabl003 #說明
            #DISPLAY g_stao_d[l_ac].stabl004 TO stabl004 #助記碼
            CALL astm301_stao010_ref() 
            NEXT FIELD stao010                          #返回原欄位


            #END add-point
 
         #----<<stao011>>----
         #Ctrlp:input.c.page1.stao011
         ON ACTION controlp INFIELD stao011
            #add-point:ON ACTION controlp INFIELD stao011
            
            #END add-point
 
         #----<<stao012>>----
         #Ctrlp:input.c.page1.stao012
         ON ACTION controlp INFIELD stao012
            #add-point:ON ACTION controlp INFIELD stao012
            
            #END add-point
 
         #----<<stao013>>----
         #Ctrlp:input.c.page1.stao013
         ON ACTION controlp INFIELD stao013
            #add-point:ON ACTION controlp INFIELD stao013
            
            #END add-point
 
         #----<<stao014>>----
         #Ctrlp:input.c.page1.stao014
         ON ACTION controlp INFIELD stao014
            #add-point:ON ACTION controlp INFIELD stao014
            
            #END add-point
 
         #----<<stao015>>----
         #Ctrlp:input.c.page1.stao015
         ON ACTION controlp INFIELD stao015
            #add-point:ON ACTION controlp INFIELD stao015
            
            #END add-point
 
         #----<<stao016>>----
         #Ctrlp:input.c.page1.stao016
         ON ACTION controlp INFIELD stao016
            #add-point:ON ACTION controlp INFIELD stao016
            
            #END add-point
 
         #----<<stao017>>----
         #Ctrlp:input.c.page1.stao017
         ON ACTION controlp INFIELD stao017
            #add-point:ON ACTION controlp INFIELD stao017
            
            #END add-point
 
         #----<<stao018>>----
         #Ctrlp:input.c.page1.stao018
         ON ACTION controlp INFIELD stao018
            #add-point:ON ACTION controlp INFIELD stao018
            
            #END add-point
 
         #----<<stao019>>----
         #Ctrlp:input.c.page1.stao019
         ON ACTION controlp INFIELD stao019
            #add-point:ON ACTION controlp INFIELD stao019
            
            #END add-point
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()
 
               LET INT_FLAG = 0
               LET g_stao_d[l_ac].* = g_stao_d_t.*
               CLOSE astm301_bcl
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = g_stao_d[l_ac].stao002
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               LET g_stao_d[l_ac].* = g_stao_d_t.*
            ELSE
            
               #add-point:單身修改前
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               UPDATE stao_t SET (stao001,stao002,stao003,stao023,stao024,stao025,stao004,stao005,stao006,stao007,stao008,stao027,stao009, #add by geza 20150610 150602-00003#12  stao023,stao024
                   stao010,stao011,stao012,stao013,stao014,stao015,stao016,stao017,stao018,stao019,stao020,stao021,stao022) = (g_stan_m.stan001, 
                   g_stao_d[l_ac].stao002,g_stao_d[l_ac].stao003,g_stao_d[l_ac].stao023,g_stao_d[l_ac].stao024,g_stao_d[l_ac].stao025,g_stao_d[l_ac].stao004,g_stao_d[l_ac].stao005, #add by geza 20150610 150602-00003#12  stao023,stao024
                   g_stao_d[l_ac].stao006,g_stao_d[l_ac].stao007,g_stao_d[l_ac].stao008,g_stao_d[l_ac].stao027,g_stao_d[l_ac].stao009, 
                   g_stao_d[l_ac].stao010,g_stao_d[l_ac].stao011,g_stao_d[l_ac].stao012,g_stao_d[l_ac].stao013, 
                   g_stao_d[l_ac].stao014,g_stao_d[l_ac].stao015,g_stao_d[l_ac].stao016,g_stao_d[l_ac].stao017, 
                   g_stao_d[l_ac].stao018,g_stao_d[l_ac].stao019,g_stao_d[l_ac].stao020,g_stao_d[l_ac].stao021,g_stao_d[l_ac].stao022)
                WHERE staoent = g_enterprise AND stao001 = g_stan_m.stan001 
 
                  AND stao002 = g_stao_d_t.stao002 #項次   
 
                  
               #add-point:單身修改中
               
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.extend = "stao_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
 
                     CALL s_transaction_end('N','0')
                     LET g_stao_d[l_ac].* = g_stao_d_t.*
                  WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stao_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
                     LET g_stao_d[l_ac].* = g_stao_d_t.*                     
                     CALL s_transaction_end('N','0')
                  OTHERWISE
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stan_m.stan001
               LET gs_keys_bak[1] = g_stan001_t
               LET gs_keys[2] = g_stao_d[g_detail_idx].stao002
               LET gs_keys_bak[2] = g_stao_d_t.stao002
               CALL astm301_update_b('stao_t',gs_keys,gs_keys_bak,"'1'")
                     #資料多語言用-增/改
                     
               END CASE
               
               #add-point:單身修改後
               
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row
            
            #end add-point
            CALL astm301_unlock_b("stao_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            
              
         AFTER INPUT
            #add-point:input段after input 
                       
            #end add-point 
 
         ON ACTION controlo    
            CALL FGL_SET_ARR_CURR(g_stao_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac
            LET li_reproduce_target = g_stao_d.getLength()+1
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
      INPUT ARRAY g_stao2_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stao2_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astm301_b_fill()
            LET g_rec_b = g_stao2_d.getLength()
            #add-point:資料輸入前
            
            #end add-point
            
         BEFORE INSERT
            
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stao2_d[l_ac].* TO NULL 
                  LET g_stao2_d[l_ac].staq004 = "Y"
 
 
            LET g_stao2_d_t.* = g_stao2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astm301_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b
            
            #end add-point
            CALL astm301_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stao2_d[li_reproduce_target].* = g_stao2_d[li_reproduce].*
 
               LET g_stao2_d[li_reproduce_target].staq002 = NULL
            END IF
            #公用欄位給值(單身2)
            
            
            #add-point:modify段before insert
                         SELECT MAX(staq002)+1 INTO  g_stao2_d[l_ac].staq002 FROM staq_t
             WHERE staqent = g_enterprise AND staq001 = g_stan_m.stan001  
            IF cl_null(  g_stao2_d[l_ac].staq002 ) THEN             
               LET   g_stao2_d[l_ac].staq002 = 1
            END IF
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
            OPEN astm301_cl USING g_enterprise,g_stan_m.stan001
            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN astm301_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               CLOSE astm301_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            
            LET g_rec_b = g_stao2_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stao2_d[l_ac].staq002 IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_stao2_d_t.* = g_stao2_d[l_ac].*  #BACKUP
               CALL astm301_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b
               
               #end add-point  
               CALL astm301_set_no_entry_b(l_cmd)
               IF NOT astm301_lock_b("staq_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astm301_bcl2 INTO g_stao2_d[l_ac].staq002,g_stao2_d[l_ac].staq003,g_stao2_d[l_ac].staq003_desc,g_stao2_d[l_ac].staq005, 
                      g_stao2_d[l_ac].staq004
                   IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
 
                     LET l_lock_sw = "Y"
                  END IF
                  
                  LET g_bfill = "N"
                  CALL astm301_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row
            
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
            #其他table進行lock
            
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' AND g_stao2_d.getLength() < l_ac THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
               CALL g_stao2_d.deleteElement(l_ac)
               NEXT FIELD staq002
            END IF
         
            IF g_stao2_d[l_ac].staq002 IS NOT NULL
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
               
               DELETE FROM staq_t
                WHERE staqent = g_enterprise AND staq001 = g_stan_m.stan001 AND
                      staq002 = g_stao2_d_t.staq002
                  
               #add-point:單身2刪除中
               
               #end add-point    
                  
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stao_t"
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
               CLOSE astm301_bcl
               LET l_count = g_stao_d.getLength()
            END IF 
            
                           INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stan_m.stan001
               LET gs_keys[2] = g_stao2_d[g_detail_idx].staq002
 
            
         AFTER DELETE 
            #add-point:單身AFTER DELETE 
            
            #end add-point
                           CALL astm301_delete_b('staq_t',gs_keys,"'2'")
 
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
            SELECT COUNT(*) INTO l_count FROM staq_t 
             WHERE staqent = g_enterprise AND staq001 = g_stan_m.stan001
               AND staq002 = g_stao2_d[l_ac].staq002
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前
               
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stan_m.stan001
               LET gs_keys[2] = g_stao2_d[g_detail_idx].staq002
               CALL astm301_insert_b('staq_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2
               
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00006"
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               INITIALIZE g_stao_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "staq_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
               CALL s_transaction_end('N','0')                    
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astm301_b_fill()
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
               LET g_stao2_d[l_ac].* = g_stao2_d_t.*
               CLOSE astm301_bcl2
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
            
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               LET g_stao2_d[l_ac].* = g_stao2_d_t.*
            ELSE
               #add-point:單身page2修改前
               
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               UPDATE staq_t SET (staq001,staq002,staq003,staq004,staq005) = (g_stan_m.stan001,g_stao2_d[l_ac].staq002, 
                   g_stao2_d[l_ac].staq003,g_stao2_d[l_ac].staq004,g_stao2_d[l_ac].staq005) #自訂欄位頁簽
                WHERE staqent = g_enterprise AND staq001 = g_stan_m.stan001
                  AND staq002 = g_stao2_d_t.staq002 #項次 
                  
               #add-point:單身page2修改中
               
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.extend = "staq_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
 
                     CALL s_transaction_end('N','0')
                     LET g_stao2_d[l_ac].* = g_stao2_d_t.*
                  WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "staq_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
                     CALL s_transaction_end('N','0')
                     LET g_stao2_d[l_ac].* = g_stao2_d_t.*
                  OTHERWISE
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stan_m.stan001
               LET gs_keys_bak[1] = g_stan001_t
               LET gs_keys[2] = g_stao2_d[g_detail_idx].staq002
               LET gs_keys_bak[2] = g_stao2_d_t.staq002
               CALL astm301_update_b('staq_t',gs_keys,gs_keys_bak,"'2'")
                     #資料多語言用-增/改
                     
               END CASE
               #add-point:單身page2修改後
               
               #end add-point
            END IF
         
         #---------------------<  Detail: page2  >---------------------
         #----<<staq002>>----
         #此段落由子樣板a01產生
         BEFORE FIELD staq002
            #add-point:BEFORE FIELD staq002
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD staq002
            
            #add-point:AFTER FIELD staq002
                        #此段落由子樣板a05產生
            IF  NOT cl_null(g_stan_m.stan001) AND NOT cl_null(g_stao2_d[g_detail_idx].staq002) THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND ( l_cmd = 'u' AND (g_stan_m.stan001 != g_stan001_t OR g_stao2_d[g_detail_idx].staq002 != g_stao2_d_t.staq002))) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM staq_t WHERE "||"staqent = '" ||g_enterprise|| "' AND "||"staq001 = '"||g_stan_m.stan001 ||"' AND "|| "staq002 = '"||g_stao2_d[g_detail_idx].staq002 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE staq002
            #add-point:ON CHANGE staq002
            
            #END add-point
 
         #----<<staq003>>----
         #此段落由子樣板a02產生
         AFTER FIELD staq003
            
            #add-point:AFTER FIELD staq003
                       LET g_stao2_d[l_ac].staq003_desc = ''
           DISPLAY BY NAME g_stao2_d[l_ac].staq003_desc
           IF NOT cl_null(g_stao2_d[l_ac].staq003) THEN
              IF NOT astm301_staq003_chk(g_stao2_d[l_ac].staq003) THEN
                    LET g_stao2_d[l_ac].staq003 = g_stao2_d_t.staq003
                    CALL astm301_staq003_ref()
                    NEXT FIELD  staq003                
              END IF
                 SELECT COUNT(*) INTO l_n FROM staq_t
                  WHERE staqent = g_enterprise AND staq001= g_stan_m.stan001 
                    AND staq003 =g_stao2_d[l_ac].staq003 AND staq002 <> g_stao2_d[l_ac].staq002
                 IF l_n > 0 THEN
                    INITIALIZE g_errparam TO NULL
                    LET g_errparam.code = 'ast-00025'
                    LET g_errparam.extend = ''
                    LET g_errparam.popup = TRUE
                    CALL cl_err()

                    NEXT FIELD  staq003 
                 END IF
             
           END IF
           CALL astm301_staq003_ref()
       
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD staq003
            #add-point:BEFORE FIELD staq003
            
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE staq003
            #add-point:ON CHANGE staq003
            
            #END add-point
 
         #----<<staq004>>----
         #此段落由子樣板a01產生
         BEFORE FIELD staq004
            #add-point:BEFORE FIELD staq004
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD staq004
            
            #add-point:AFTER FIELD staq004
            
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE staq004
            #add-point:ON CHANGE staq004
            
            #END add-point
 
 
         #---------------------<  Detail: page2  >---------------------
         #----<<staq002>>----
         #Ctrlp:input.c.page2.staq002
         ON ACTION controlp INFIELD staq002
            #add-point:ON ACTION controlp INFIELD staq002
            
            #END add-point
 
         #----<<staq003>>----
         #Ctrlp:input.c.page2.staq003
         ON ACTION controlp INFIELD staq003
            #add-point:ON ACTION controlp INFIELD staq003
            #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stao2_d[l_ac].staq003             #給予default值
            CALL cl_get_para(g_enterprise,g_site,'E-CIR-0001') RETURNING l_sys
            #給予arg
            LET g_qryparam.arg1 = l_sys 

            CALL q_rtax001_3()                               #呼叫開窗

            LET g_stao2_d[l_ac].staq003 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stao2_d[l_ac].staq003 TO staq003              #顯示到畫面上
            CALL astm301_staq003_ref()
            NEXT FIELD staq003                          #返回原欄位


            #END add-point
 
         #----<<staq004>>----
         #Ctrlp:input.c.page2.staq004
         ON ACTION controlp INFIELD staq004
            #add-point:ON ACTION controlp INFIELD staq004
            
            #END add-point
 
 
 
         AFTER ROW
            #add-point:單身page2 after_row
            
            #end add-point
            LET l_ac = ARR_CURR()
            LET l_ac_t = l_ac
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()
 
               LET INT_FLAG = 0
               IF l_cmd = 'u' THEN
                  LET g_stao2_d[l_ac].* = g_stao2_d_t.*
               END IF
               CLOSE astm301_bcl2
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL astm301_unlock_b("staq_t","'2'")
            CALL s_transaction_end('Y','0')
 
         AFTER INPUT
            #add-point:input段after input 
            
            #end add-point   
    
         ON ACTION controlo
            CALL FGL_SET_ARR_CURR(g_stao2_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac
            LET li_reproduce_target = g_stao2_d.getLength()+1
 
      END INPUT
 
 
      
 
      
 
      
 
      
 
{</section>}
 
{<section id="astm301.input.other" >}
      
      #add-point:自定義input
            INPUT ARRAY g_stap_d FROM s_detail3.*
          ATTRIBUTE(COUNT = g_rec_b3,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 

         BEFORE INPUT
            IF g_stao_d[l_ac].stao016 = '1' OR cl_null(g_stao_d[l_ac].stao016) THEN
               NEXT FIELD stao002
            END IF
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stap_d.getLength()+1) 
              LET g_insert = 'N' 
            END IF 

            CALL astm301_b3_fill()
            LET g_rec_b3 = g_stap_d.getLength()

            
         BEFORE ROW
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac3 = ARR_CURR()
            LET g_detail_idx3 = l_ac3
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac3 TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astm301_cl USING g_enterprise,g_stan_m.stan001

            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN astm301_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               CLOSE astm301_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
         
            
            LET g_rec_b3 = g_stap_d.getLength()
            
            IF g_rec_b3 >= l_ac3 
               AND NOT cl_null(g_stap_d[l_ac3].stap003) 

            THEN
               LET l_cmd='u'
               LET g_stap_d_t.* = g_stap_d[l_ac3].*  #BACKUP
               CALL astm301_set_entry_b(l_cmd)
               CALL astm301_set_no_entry_b(l_cmd)
               IF NOT astm301_lock_b("stap_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astm301_bcl3 INTO g_stap_d[l_ac3].stap003,  g_stap_d[l_ac3].stap004,g_stap_d[l_ac3].stap005,g_stap_d[l_ac3].stap006
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = g_stap_d_t.stap003
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET l_lock_sw = "Y"
                  END IF
                  
                  LET g_bfill = "N"
                  CALL astm301_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
      
            #其他table資料備份(確定是否更改用)
             
            #其他table進行lock
            
        
         BEFORE INSERT
            
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stap_d[l_ac3].* TO NULL 
            
            LET g_stap_d_t.* = g_stap_d[l_ac3].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astm301_set_entry_b(l_cmd)
            CALL astm301_set_no_entry_b(l_cmd)
            #公用欄位給值(單身)
            
   
            SELECT MAX(stap003)+1 INTO  g_stap_d[l_ac3].stap003 FROM stap_t
             WHERE stapent = g_enterprise AND stap001 = g_stan_m.stan001 AND stap002 =g_stao_d[l_ac].stao002  
            IF cl_null(  g_stap_d[l_ac3].stap003 ) THEN             
               LET  g_stap_d[l_ac3].stap003 = 1
            END IF
            
            SELECT MAX(stap005)+1 INTO  g_stap_d[l_ac3].stap004 FROM stap_t
             WHERE stapent = g_enterprise AND stap001 = g_stan_m.stan001 AND stap002 =g_stao_d[l_ac].stao002  
            IF cl_null(  g_stap_d[l_ac3].stap004 ) THEN             
               LET  g_stap_d[l_ac3].stap003 = 1
            END IF
        
  
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
               
            #add-point:單身新增

            #end add-point
			   
            LET l_count = 1  
            SELECT COUNT(*) INTO l_count FROM stap_t 
             WHERE stapent = g_enterprise AND stap001 = g_stan_m.stan001

               AND stap002 = g_stao_d[l_ac].stao002 AND stap003 = g_stap_d[l_ac3].stap003

                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前

               #end add-point
            
               INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stan_m.stan001
               LET gs_keys[2] = g_stao_d[l_ac].stao002
               CALL astm301_insert_b('stap_t',gs_keys,"'3'")
                           
               #add-point:單身新增後

               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00006"
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               CALL cl_err()

               INITIALIZE g_stap_d[l_ac3].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stap_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
               CALL s_transaction_end('N','0')                    
               CANCEL INSERT
            ELSE
               #先刷新資料
              
               CALL s_transaction_end('Y','0')
               ERROR 'INSERT O.K'
               LET g_rec_b3 = g_rec_b3 + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF NOT cl_null(g_stap_d[l_ac3].stap003) 

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
               
               #add-point:單身刪除前

               #end add-point 
               
               DELETE FROM stap_t
                WHERE stapent = g_enterprise AND stap001 = g_stan_m.stan001 AND

                      stap002 = g_stao_d[l_ac].stao002 AND stap003 =  g_stap_d_t.stap003

                  
               #add-point:單身刪除中

               #end add-point 
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stap_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()

                  CALL s_transaction_end('N','0')
                  CANCEL DELETE   
               ELSE
                  LET g_rec_b3 = g_rec_b3-1
                  
                  #add-point:單身刪除後

                  #end add-point
                  CALL s_transaction_end('Y','0')
               END IF 
               CLOSE astm301_bcl3
               LET l_count = g_stap_d.getLength()
            END IF 
            
                           INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stan_m.stan001
               LET gs_keys[2] = g_stao_d[l_ac].stao002



         
         AFTER FIELD stap004,stap005
            IF NOT cl_null(g_stap_d[l_ac3].stap004) THEN
               IF g_stap_d[l_ac3].stap004 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stap_d[l_ac3].stap004 = g_stap_d_t.stap004
                  NEXT FIELD stap004
               END IF
            END IF
            IF NOT cl_null(g_stap_d[l_ac3].stap005) THEN
               IF g_stap_d[l_ac3].stap005 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stap_d[l_ac3].stap005 = g_stap_d_t.stap005
                  NEXT FIELD stap005
               END IF
            END IF
            IF NOT cl_null(g_stap_d[l_ac3].stap004) AND NOT cl_null(g_stap_d[l_ac3].stap005) THEN
               IF g_stap_d[l_ac3].stap005 < g_stap_d[l_ac3].stap004 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00017'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD CURRENT
               END IF
            
               SELECT COUNT(*) INTO l_n FROM stap_t
                WHERE stapent = g_enterprise AND stap001 = g_stan_m.stan001 
                  AND stap002 = g_stao_d[l_ac].stao002
                  AND ((stap004 between g_stap_d[l_ac3].stap004 AND g_stap_d[l_ac3].stap005)
                      OR (stap005 between g_stap_d[l_ac3].stap004 AND g_stap_d[l_ac3].stap005)
                      OR (g_stap_d[l_ac3].stap004  between stap004 AND stap005)
                      OR (g_stap_d[l_ac3].stap005  between stap004 AND stap005))
                  AND stap003 <> g_stap_d[l_ac3].stap003
               IF l_n > 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00016'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD CURRENT
               END IF
             
            END IF
         
     
         
         
         AFTER FIELD stap006
            IF NOT cl_null(g_stap_d[l_ac3].stap006) THEN
               IF g_stap_d[l_ac3].stap006<= 0 THEN
                 INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                 LET g_stap_d[l_ac3].stap006 = g_stap_d_t.stap006
                 NEXT FIELD stap006
               END IF
            END IF
         
     
         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               LET g_stap_d[l_ac3].* = g_stap_d_t.*
               CLOSE astm301_bcl3
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = g_stap_d[l_ac3].stap003
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET g_stap_d[l_ac3].* = g_stap_d_t.*
            ELSE
            
               #add-point:單身修改前

               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               UPDATE stap_t SET (stap003,stap004,stap005,stap006) = (g_stap_d[l_ac3].stap003,g_stap_d[l_ac3].stap004,g_stap_d[l_ac3].stap005,g_stap_d[l_ac3].stap006)
                WHERE stapent = g_enterprise AND stap001 = g_stan_m.stan001 
                  AND stap002 = g_stao_d[l_ac].stao002 #項次   
                  AND stap003 = g_stap_d_t.stap003
                  
               #add-point:單身修改中

               #end add-point
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stap_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
   
                  LET g_stap_d[l_ac3].* = g_stap_d_t.*
             
                  
               END IF
               
               #add-point:單身修改後

               #end add-point
 
            END IF
            
         AFTER ROW
            CALL astm301_unlock_b("stap_t","'3'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            
              
         AFTER INPUT
            #add-point:input段after input 

            #end add-point   
              
     
                 
      END INPUT   
#160513-00002#3   by 08172
#      INPUT ARRAY g_stax_d FROM s_detail4.*
#          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
#                  INSERT ROW = l_allow_insert, 
#                  DELETE ROW = l_allow_delete,
#                  APPEND ROW = l_allow_insert)
# 
#
#         BEFORE INPUT      
#            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
#              CALL FGL_SET_ARR_CURR(g_stax_d.getLength()+1) 
#              LET g_insert = 'N' 
#            END IF 
#
#            LET g_rec_b = g_stax_d.getLength()
#
#            
#         BEFORE ROW
#            LET l_insert = FALSE
#            LET l_cmd = ''
#            LET l_ac = ARR_CURR()
#            LET g_detail_idx = l_ac
#            
#            LET l_lock_sw = 'N'            #DEFAULT
#            LET l_n = ARR_COUNT()
#            DISPLAY l_ac TO FORMONLY.idx
#         
#            CALL s_transaction_begin()
#            OPEN astm301_cl USING g_enterprise,g_stan_m.stan001
#
#            IF STATUS THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code =  STATUS
#               LET g_errparam.extend = "OPEN astm301_cl:"
#               LET g_errparam.popup = TRUE
#               CALL cl_err()
#
#               CLOSE astm301_cl
#               CALL s_transaction_end('N','0')
#               RETURN
#            END IF
#         
#            
#            LET g_rec_b = g_stax_d.getLength()
#            
#            IF g_rec_b >= l_ac 
#               AND NOT cl_null(g_stax_d[l_ac].staxseq) 
#
#            THEN
#               LET l_cmd='u'
#               LET g_stax_d_t.* = g_stax_d[l_ac].*  #BACKUP
#               CALL astm301_set_entry_b(l_cmd)
#               CALL astm301_set_no_entry_b(l_cmd)
#               IF NOT astm301_lock_b("stax_t","'4'") THEN
#                  LET l_lock_sw='Y'
#               ELSE
#                  FETCH astm301_bcl4 INTO g_stax_d[l_ac].staxsite,g_stax_d[l_ac].staxunit,g_stax_d[l_ac].staxseq,  g_stax_d[l_ac].stax002,g_stax_d[l_ac].stax003,g_stax_d[l_ac].stax004,g_stax_d[l_ac].stax005,g_stax_d[l_ac].stax006
#                  IF SQLCA.sqlcode THEN
#                     INITIALIZE g_errparam TO NULL
#                     LET g_errparam.code = SQLCA.sqlcode
#                     LET g_errparam.extend = g_stax_d_t.staxseq
#                     LET g_errparam.popup = TRUE
#                     CALL cl_err()
#
#                     LET l_lock_sw = "Y"
#                  END IF
#                  
#                  LET g_bfill = "N"
#                  CALL astm301_show()
#                  LET g_bfill = "Y"
#                  
#                  CALL cl_show_fld_cont()
#               END IF
#            ELSE
#               LET l_cmd='a'
#            END IF
#      
#            #其他table資料備份(確定是否更改用)
#             
#            #其他table進行lock
#            
#        
#         BEFORE INSERT
#            
#            LET l_insert = TRUE
#            LET l_n = ARR_COUNT()
#            LET l_cmd = 'a'
#            INITIALIZE g_stax_d[l_ac].* TO NULL 
#            
#            LET g_stax_d_t.* = g_stax_d[l_ac].*     #新輸入資料
#            CALL cl_show_fld_cont()
#            CALL astm301_set_entry_b(l_cmd)
#            CALL astm301_set_no_entry_b(l_cmd)
#            #公用欄位給值(單身)
#            
#            LET g_stax_d[l_ac].staxsite = g_stan_m.stanunit
#            LET g_stax_d[l_ac].staxunit = g_stan_m.stanunit
#   
#     
#  
#         AFTER INSERT
#            LET l_insert = FALSE
#            IF INT_FLAG THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = 9001
#               LET g_errparam.extend = ''
#               LET g_errparam.popup = FALSE
#               CALL cl_err()
#
#               LET INT_FLAG = 0
#               CANCEL INSERT
#            END IF
#               
#            #add-point:單身新增
#
#            #end add-point
#			   
#            LET l_count = 1  
#            SELECT COUNT(*) INTO l_count FROM stax_t 
#             WHERE staxent = g_enterprise AND stax001 = g_stan_m.stan001
#
#               AND staxseq = g_stax_d[l_ac].staxseq 
#
#                
#            #資料未重複, 插入新增資料
#            IF l_count = 0 THEN 
#               #add-point:單身新增前
#
#               #end add-point
#            
#               INITIALIZE gs_keys TO NULL 
#               LET gs_keys[1] = g_stan_m.stan001
#               LET gs_keys[2] = g_stax_d[l_ac].staxseq
#               CALL astm301_insert_b('stax_t',gs_keys,"'4'")
#                           
#               #add-point:單身新增後
#
#               #end add-point
#            ELSE    
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = "std-00006"
#               LET g_errparam.extend = 'INSERT'
#               LET g_errparam.popup = TRUE
#               CALL cl_err()
#
#               INITIALIZE g_stax_d[l_ac].* TO NULL
#               CALL s_transaction_end('N','0')
#               CANCEL INSERT
#            END IF
# 
#            IF SQLCA.SQLcode  THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = SQLCA.sqlcode
#               LET g_errparam.extend = "stax_t"
#               LET g_errparam.popup = TRUE
#               CALL cl_err()
#  
#               CALL s_transaction_end('N','0')                    
#               CANCEL INSERT
#            ELSE
#               #先刷新資料
#              
#               CALL s_transaction_end('Y','0')
#               ERROR 'INSERT O.K'
#               LET g_rec_b = g_rec_b + 1
#            END IF
#              
#         BEFORE DELETE                            #是否取消單身
#            IF NOT cl_null(g_stax_d[l_ac].staxseq) 
#
#               THEN 
#               
#               IF NOT cl_ask_del_detail() THEN
#                  CANCEL DELETE
#               END IF
#               IF l_lock_sw = "Y" THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code =  -263
#                  LET g_errparam.extend = ""
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#
#                  CANCEL DELETE
#               END IF
#               
#               #add-point:單身刪除前
#
#               #end add-point 
#               
#               DELETE FROM stax_t
#                WHERE staxent = g_enterprise AND stax001 = g_stan_m.stan001 AND
#
#                      staxseq = g_stax_d_t.staxseq 
#
#                  
#               #add-point:單身刪除中
#
#               #end add-point 
#               
#               IF SQLCA.sqlcode THEN
#                  INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = SQLCA.sqlcode
#               LET g_errparam.extend = "stax_t"
#               LET g_errparam.popup = TRUE
#               CALL cl_err()
#
#                  CALL s_transaction_end('N','0')
#                  CANCEL DELETE   
#               ELSE
#                  LET g_rec_b = g_rec_b-1
#                  
#                  #add-point:單身刪除後
#
#                  #end add-point
#                  CALL s_transaction_end('Y','0')
#               END IF 
#               CLOSE astm301_bcl4
#               LET l_count = g_stax_d.getLength()
#            END IF 
#            
#                           INITIALIZE gs_keys TO NULL 
#               LET gs_keys[1] = g_stan_m.stan001
#               LET gs_keys[2] = g_stax_d[l_ac].staxseq
#
#
#
#         
#       
#     
#         ON ROW CHANGE
#            IF INT_FLAG THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = 9001
#               LET g_errparam.extend = ''
#               LET g_errparam.popup = FALSE
#               CALL cl_err()
#
#               LET INT_FLAG = 0
#               LET g_stax_d[l_ac].* = g_stax_d_t.*
#               CLOSE astm301_bcl4
#               CALL s_transaction_end('N','0')
#               EXIT DIALOG 
#            END IF
#              
#            IF l_lock_sw = 'Y' THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = -263
#               LET g_errparam.extend = g_stax_d[l_ac].staxseq
#               LET g_errparam.popup = TRUE
#               CALL cl_err()
#
#               LET g_stax_d[l_ac].* = g_stax_d_t.*
#            ELSE
#            
#               #add-point:單身修改前
#
#               #end add-point
#               
#               #寫入修改者/修改日期資訊(單身)
#               
#      
#               UPDATE stax_t SET (staxseq,stax002,stax003,stax004) = (g_stax_d[l_ac].staxseq,g_stax_d[l_ac].stax002,g_stax_d[l_ac].stax003,g_stax_d[l_ac].stax004)
#                WHERE staxent = g_enterprise AND stax001 = g_stan_m.stan001   
#                  AND staxseq = g_stax_d_t.staxseq
#                  
#               #add-point:單身修改中
#
#               #end add-point
#               
#               IF SQLCA.sqlcode THEN
#                  INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = SQLCA.sqlcode
#               LET g_errparam.extend = "stax_t"
#               LET g_errparam.popup = TRUE
#               CALL cl_err()
#   
#                  LET g_stax_d[l_ac].* = g_stax_d_t.*
#             
#                  
#               END IF
#               
#               #add-point:單身修改後
#
#               #end add-point
# 
#            END IF
#            
#         AFTER ROW
#            CALL astm301_unlock_b("stax_t","'4'")
#            CALL s_transaction_end('Y','0')
#            #其他table進行unlock
#            
#              
#         AFTER INPUT
#            #add-point:input段after input 
#
#            #end add-point   
#              
#     
#                 
#      END INPUT   
      #end add-point
      
      BEFORE DIALOG 
         #add-point:input段before dialog
         IF p_cmd = 'a' THEN
            NEXT FIELD stanunit
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stao002
               WHEN "s_detail2"
                  NEXT FIELD staq002
 
 
            END CASE
         END IF
         #end add-point    
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            NEXT FIELD stan001
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stao002
               WHEN "s_detail2"
                  NEXT FIELD staq002
 
 
            END CASE
         END IF
    
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang)
 
      ON ACTION controlr
         CALL cl_show_req_fields()
 
      ON ACTION controls
         CALL cl_set_head_visible("","AUTO")
         CALL cl_set_head_visible("","AUTO")
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
    
   #add-point:input段after input 
   
   #end add-point    
 
END FUNCTION
 
{</section>}
 
{<section id="astm301.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astm301_show()
   {<Local define>}
   DEFINE l_ac_t    LIKE type_t.num5
   {</Local define>}
   #add-point:show段define
   
   #end add-point  
 
   #add-point:show段之前
   LET g_stan_m_o.* = g_stan_m.*
   #end add-point
   
   
   
   LET g_stan_m_t.* = g_stan_m.*      #保存單頭舊值
   
   IF g_bfill = "Y" THEN
      CALL astm301_b_fill() #單身填充
      CALL astm301_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #此段落由子樣板a12產生
      #LET g_stan_m.stanownid_desc = cl_get_username(g_stan_m.stanownid)
      #LET g_stan_m.stanowndp_desc = cl_get_deptname(g_stan_m.stanowndp)
      #LET g_stan_m.stancrtid_desc = cl_get_username(g_stan_m.stancrtid)
      #LET g_stan_m.stancrtdp_desc = cl_get_deptname(g_stan_m.stancrtdp)
      #LET g_stan_m.stanmodid_desc = cl_get_username(g_stan_m.stanmodid)
      #LET g_stan_m.stancnfid_desc = cl_get_deptname(g_stan_m.stancnfid)
      ##LET g_stan_m.stanpstid_desc = cl_get_deptname(g_stan_m.stanpstid)
      
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference
             

    CALL astm301_stan005_ref()
    CALL astm301_stan004_ref()
    CALL astm301_stan006_ref()
    CALL astm301_stan007_ref()
    CALL astm301_stan008_ref()
    #150506-00007#4 150523 by sakura add---STR
    #交易條件
    CALL s_desc_get_acc_desc('238',g_stan_m.stan022) RETURNING g_stan_m.stan022_desc
    DISPLAY BY NAME g_stan_m.stan022_desc
    #發票類型
    CALL s_desc_get_invoice_type_desc1(g_site,g_stan_m.stan023) RETURNING g_stan_m.stan023_desc
    DISPLAY BY NAME g_stan_m.stan023_desc
    #150506-00007#4 150523 by sakura add---END      
    CALL astm301_stan009_ref()
    CALL astm301_stan010_ref()
    CALL astm301_stan015_ref()
    CALL astm301_stan016_ref()
    CALL astm301_stan013_ref()
    CALL astm301_stan014_ref()
    CALL astm301_stanunit_ref()  

     SELECT stax004 INTO g_stan_m.next_b FROM ( SELECT * FROM stax_t
     WHERE staxent = g_enterprise AND  stax001 = g_stan_m.stan001 AND stax005= 'N' ORDER BY staxseq) WHERE rownum = 1
     
    DISPLAY g_stan_m.next_b TO next_b 
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stan_m.stanownid
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stan_m.stanownid_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stan_m.stanownid_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stan_m.stanowndp
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stan_m.stanowndp_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stan_m.stanowndp_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stan_m.stancrtid
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stan_m.stancrtid_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stan_m.stancrtid_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stan_m.stancrtdp
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stan_m.stancrtdp_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stan_m.stancrtdp_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stan_m.stanmodid
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stan_m.stanmodid_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stan_m.stanmodid_desc
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stan_m.stancnfid
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stan_m.stancnfid_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stan_m.stancnfid_desc
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stan_m.stan038
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stan_m.stan038_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stan_m.stan038_desc
    
   #end add-point
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stan_m.stanunit,g_stan_m.stan002,g_stan_m.stan001,g_stan_m.stan003,g_stan_m.stan004,g_stan_m.stan029,
       g_stan_m.stan021,g_stan_m.stan005,g_stan_m.stan005_desc,g_stan_m.stan016,g_stan_m.stan016_desc, 
       g_stan_m.stan017,g_stan_m.stan018,g_stan_m.stan012,g_stan_m.stan014,g_stan_m.stan038,g_stan_m.stan013,
       g_stan_m.stan034,g_stan_m.stan035,g_stan_m.stan036,
       g_stan_m.stan015,g_stan_m.stan009,g_stan_m.stan010,g_stan_m.stan032,g_stan_m.stan031,g_stan_m.stan033,
       g_stan_m.stan019,g_stan_m.stan020,g_stan_m.stan039,g_stan_m.stan027,g_stan_m.stan028,g_stan_m.stan008,g_stan_m.stan022,
       g_stan_m.stan006,g_stan_m.stan007,g_stan_m.stan023,g_stan_m.stan037,g_stan_m.stan024,g_stan_m.stan025,
       g_stan_m.stan026,g_stan_m.stan011,g_stan_m.stanstus,g_stan_m.stanownid,g_stan_m.stanownid_desc, 
       g_stan_m.stanowndp,g_stan_m.stanowndp_desc,g_stan_m.stancrtid,g_stan_m.stancrtid_desc,g_stan_m.stancrtdp, 
       g_stan_m.stancrtdp_desc,g_stan_m.stancrtdt,g_stan_m.stanmodid,g_stan_m.stanmodid_desc,g_stan_m.stanmoddt, 
       g_stan_m.stancnfid,g_stan_m.stancnfid_desc,g_stan_m.stancnfdt
   
   #顯示狀態(stus)圖片
         #此段落由子樣板a21產生
      CASE g_stan_m.stanstus
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
 
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
 
 
         
      END CASE
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_stao_d.getLength()
      #帶出公用欄位reference值
      
      #add-point:show段單身reference
                  INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stao_d[l_ac].stao003
            CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stao_d[l_ac].stao003_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stao_d[l_ac].stao003_desc

            CALL astm301_stao009_ref()
            CALL astm301_stao010_ref()   
            CALL astm301_stao025_ref()            
      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_stao2_d.getLength()
      #帶出公用欄位reference值
      
      #add-point:show段單身reference
                 CALL astm301_staq003_ref()

      #end add-point
   END FOR
 
 
   
    
   
   #add-point:show段other
   
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astm301_detail_show()
   
   #add-point:show段之後
   # add geza 150504-00002#1 (S)  
   IF g_stao_d[1].stao016 = '1' THEN
      CALL cl_set_comp_visible('group7',FALSE)
   ELSE
      CALL cl_set_comp_visible('group7',TRUE)
   END IF 
   # add geza 150504-00002#1 (E)
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.detail_show" >}
#+ 單身reference detail_show
PRIVATE FUNCTION astm301_detail_show()
   {<Local define>}
   DEFINE l_ac_t    LIKE type_t.num5
   {</Local define>}
   #add-point:detail_show段define
   
   #end add-point  
 
   #add-point:detail_show段之前
   
   #end add-point
   
   LET l_ac_t = l_ac
 
   LET l_ac = l_ac_t
   
   #add-point:detail_show段之後
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astm301_reproduce()
   {<Local define>}
   DEFINE l_newno     LIKE stan_t.stan001 
   DEFINE l_oldno     LIKE stan_t.stan001 
 
   DEFINE l_master    RECORD LIKE stan_t.*
   DEFINE l_detail    RECORD LIKE stao_t.*
   DEFINE l_detail2    RECORD LIKE staq_t.*
 
 
 
   DEFINE l_cnt       LIKE type_t.num5
   {</Local define>}
   #add-point:reproduce段define
   DEFINE l_insert      LIKE type_t.num5
   #end add-point   
 
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
   
   IF g_stan_m.stan001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "std-00003"
      LET g_errparam.extend = ""
      LET g_errparam.popup = FALSE
      CALL cl_err()
 
      RETURN
   END IF
    
   LET g_stan001_t = g_stan_m.stan001
 
    
   LET g_stan_m.stan001 = ""
 
    
   CALL astm301_set_entry('a')
   CALL astm301_set_no_entry('a')
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #此段落由子樣板a14產生    
      LET g_stan_m.stanownid = g_user
      LET g_stan_m.stanowndp = g_dept
      LET g_stan_m.stancrtid = g_user
      LET g_stan_m.stancrtdp = g_dept 
      LET g_stan_m.stancrtdt = cl_get_current()
      LET g_stan_m.stanmodid = ""
      LET g_stan_m.stanmoddt = ""
      #LET g_stan_m.stanstus = ""
 
 
   
   #add-point:複製輸入前
#        LET g_stan_m.stanunit = g_site
      LET g_site_flag = FALSE
      CALL s_aooi500_default(g_prog,'stanunit',g_stan_m.stanunit)
         RETURNING l_insert,g_stan_m.stanunit
      IF NOT l_insert THEN
         RETURN
      END IF
        CALL astm301_stanunit_ref()
        LET g_stan_m.stan001 = ''
      LET g_stan_m.stancnfid = ""
      LET g_stan_m.stancnfdt = ""
      LET g_stan_m.stanstus = 'N'
      LET g_stan_m.stancnfid_desc = ''
      LET g_stan_m.stanmodid_desc = ''
      DISPLAY BY NAME g_stan_m.*        
   #end add-point
   
   CALL astm301_input("r")
   
   
   
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      RETURN
   END IF
 
   LET g_state = "Y"
   
   LET g_wc = g_wc,  
              " OR (",
              " stan001 = '", g_stan_m.stan001 CLIPPED, "' "
 
              , ") "
   
   #add-point:完成複製段落後
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astm301_detail_reproduce()
   {<Local define>}
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stao_t.*
   DEFINE l_detail2    RECORD LIKE staq_t.*
 
 
 
   {</Local define>}
   #add-point:delete段define
   
   #end add-point    
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astm301_detail
   
   #add-point:單身複製前1
   
   #end add-point
   
   #CREATE TEMP TABLE
   LET ls_sql = "CREATE GLOBAL TEMPORARY TABLE astm301_detail AS ",
                "SELECT * FROM stao_t "
   PREPARE repro_tbl FROM ls_sql
   EXECUTE repro_tbl
   FREE repro_tbl
                
   #將符合條件的資料丟入TEMP TABLE
   INSERT INTO astm301_detail SELECT * FROM stao_t 
                                         WHERE staoent = g_enterprise AND stao001 = g_stan001_t
 
   
   #將key修正為調整後   
   UPDATE astm301_detail 
      #更新key欄位
      SET stao001 = g_stan_m.stan001
 
      #更新共用欄位
      
                                       
  
   #將資料塞回原table   
   INSERT INTO stao_t SELECT * FROM astm301_detail
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "reproduce"
      LET g_errparam.popup = TRUE
      CALL cl_err()
 
      RETURN
   END IF
   
   #add-point:單身複製中1
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astm301_detail
   
   #add-point:單身複製後1
       LET ls_sql = 
      "CREATE GLOBAL TEMPORARY TABLE astm301_detail AS ",
      "SELECT * FROM stap_t "
   PREPARE repro_tbl3 FROM ls_sql
   EXECUTE repro_tbl3
   FREE repro_tbl3
   
    #將符合條件的資料丟入TEMP TABLE
   INSERT INTO astm301_detail SELECT * FROM stap_t
                                         WHERE stapent = g_enterprise AND stap001 = g_stan001_t
                                         
    #將key修正為調整後   
   UPDATE astm301_detail SET stap001 = g_stan_m.stan001
 
  
   #將資料塞回原table   
   INSERT INTO stap_t SELECT * FROM astm301_detail
     
    
   #end add-point
 
   #add-point:單身複製前
       #刪除TEMP TABLE
   DROP TABLE astm301_detail
   #end add-point
   
   #CREATE TEMP TABLE
   LET ls_sql = 
      "CREATE GLOBAL TEMPORARY TABLE astm301_detail AS ",
      "SELECT * FROM staq_t "
   PREPARE repro_tbl2 FROM ls_sql
   EXECUTE repro_tbl2
   FREE repro_tbl2
      
   #將符合條件的資料丟入TEMP TABLE
   INSERT INTO astm301_detail SELECT * FROM staq_t
                                         WHERE staqent = g_enterprise AND staq001 = g_stan001_t
 
 
   #將key修正為調整後   
   UPDATE astm301_detail SET staq001 = g_stan_m.stan001
 
  
   #將資料塞回原table   
   INSERT INTO staq_t SELECT * FROM astm301_detail
   
   #add-point:單身複製中
   
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astm301_detail
   
   #add-point:單身複製後
   
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stan001_t = g_stan_m.stan001
 
   
   DROP TABLE astm301_detail
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astm301_delete()
   {<Local define>}
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   {</Local define>}
   #add-point:delete段define
   
   #end add-point     
   
   IF g_stan_m.stan001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "std-00003"
      LET g_errparam.extend = ""
      LET g_errparam.popup = FALSE
      CALL cl_err()
 
      RETURN
   END IF
 
    SELECT UNIQUE stan002,stan001,stan003,stan021,stan005,stan004,stanunit,stan006,stan007,stan008,
        stan022,stan023,stan024,stan025,stan026,stan027,stan028, #150506-00007#4 150523 by sakura add
        stan029,stan030,
        stan009, 
        stan010,stan015,stan016,stan011,stan012,stan013,stan014,stan017,stan018,stan019,stan020,stanstus, 
        stanownid,stanowndp,stancrtid,stancrtdp,stancrtdt,stanmodid,stanmoddt,stancnfid,stancnfdt
 INTO g_stan_m.stan002,g_stan_m.stan001,g_stan_m.stan003,g_stan_m.stan021,g_stan_m.stan005,g_stan_m.stan004, 
     g_stan_m.stanunit,g_stan_m.stan006,g_stan_m.stan007,g_stan_m.stan008,
     g_stan_m.stan022,g_stan_m.stan023,g_stan_m.stan024,g_stan_m.stan025,g_stan_m.stan026,g_stan_m.stan027,g_stan_m.stan028, #150506-00007#4 150523 by sakura add
     g_stan_m.stan029,g_stan_m.stan030,
     g_stan_m.stan009,g_stan_m.stan010, 
     g_stan_m.stan015,g_stan_m.stan016,g_stan_m.stan011,g_stan_m.stan012,g_stan_m.stan013,g_stan_m.stan014, 
     g_stan_m.stan017,g_stan_m.stan018,g_stan_m.stan019,g_stan_m.stan020,g_stan_m.stanstus,g_stan_m.stanownid, 
     g_stan_m.stanowndp,g_stan_m.stancrtid,g_stan_m.stancrtdp,g_stan_m.stancrtdt,g_stan_m.stanmodid, 
     g_stan_m.stanmoddt,g_stan_m.stancnfid,g_stan_m.stancnfdt
 FROM stan_t
 WHERE stanent = g_enterprise AND stan001 = g_stan_m.stan001
   
   
 
   CALL astm301_show()
   
   CALL s_transaction_begin()
 
   OPEN astm301_cl USING g_enterprise,g_stan_m.stan001
 
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code =  STATUS
      LET g_errparam.extend = "OPEN astm301_cl:"
      LET g_errparam.popup = TRUE
      CALL cl_err()
 
      CLOSE astm301_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   FETCH astm301_cl INTO g_stan_m.stan002,g_stan_m.stan001,g_stan_m.stan003,g_stan_m.stan021,g_stan_m.stan005, 
       g_stan_m.stan005_desc,g_stan_m.stan004,g_stan_m.stan004_desc,g_stan_m.stanunit,g_stan_m.stanunit_desc, 
       g_stan_m.stan006,g_stan_m.stan006_desc,g_stan_m.stan007,g_stan_m.stan007_desc,g_stan_m.stan008,g_stan_m.stan008_desc,
       g_stan_m.stan022,g_stan_m.stan022_desc,g_stan_m.stan023,g_stan_m.stan023_desc,g_stan_m.stan037,g_stan_m.stan024, #150506-00007#4 150523 by sakura add
       g_stan_m.stan025,g_stan_m.stan026,g_stan_m.stan034,g_stan_m.stan035,g_stan_m.stan036,g_stan_m.stan027,g_stan_m.stan028,                            #150506-00007#4 150523 by sakura add
       g_stan_m.stan029,g_stan_m.stan030,g_stan_m.stan031,g_stan_m.stan032,
       g_stan_m.stan009,g_stan_m.stan009_desc,g_stan_m.stan010,g_stan_m.stan010_desc,g_stan_m.stan015, 
       g_stan_m.stan015_desc,g_stan_m.stan016,g_stan_m.stan016_desc,g_stan_m.stan011,g_stan_m.stan012, 
       g_stan_m.stan013,g_stan_m.stan013_desc,g_stan_m.stan014,g_stan_m.stan014_desc,g_stan_m.stan017, 
       g_stan_m.stan018,g_stan_m.stan019,g_stan_m.stan020,g_stan_m.stanstus,g_stan_m.stanownid,g_stan_m.stanownid_desc, 
       g_stan_m.stanowndp,g_stan_m.stanowndp_desc,g_stan_m.stancrtid,g_stan_m.stancrtid_desc,g_stan_m.stancrtdp, 
       g_stan_m.stancrtdp_desc,g_stan_m.stancrtdt,g_stan_m.stanmodid,g_stan_m.stanmodid_desc,g_stan_m.stanmoddt, 
       g_stan_m.stancnfid,g_stan_m.stancnfid_desc,g_stan_m.stancnfdt              #鎖住將被更改或取消的資料 
 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = g_stan_m.stan001
      LET g_errparam.popup = FALSE
      CALL cl_err()
          #資料被他人LOCK
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #IF NOT cl_ask_delete() THEN             #確認一下
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前
      
      #end add-point   
      
      INITIALIZE g_doc.* TO NULL         
      LET g_doc.column1 = "stan001"       
      LET g_doc.value1 = g_stan_m.stan001     
      CALL cl_doc_remove() 
 
      #資料備份
      LET g_stan001_t = g_stan_m.stan001
 
 
      DELETE FROM stan_t
       WHERE stanent = g_enterprise AND stan001 = g_stan_m.stan001
 
       
      #add-point:單頭刪除中
      
      #end add-point
       
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = g_stan_m.stan001
      LET g_errparam.popup = FALSE
      CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      
      #add-point:單頭刪除後
      
      #end add-point
  
      #add-point:單身刪除前
            DELETE FROM stap_t
       WHERE stapent = g_enterprise AND stap001 = g_stan_m.stan001
       IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stap_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
       END IF   
      CALL g_stap_d.clear()
      #end add-point
      
      DELETE FROM stao_t
       WHERE staoent = g_enterprise AND stao001 = g_stan_m.stan001
 
 
      #add-point:單身刪除中
      
      #end add-point
         
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stao_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
      END IF    
 
      #add-point:單身刪除後
      
      #end add-point
      
            
                                                               
      #add-point:單身刪除前
      
      #end add-point
      DELETE FROM staq_t
       WHERE staqent = g_enterprise AND
             staq001 = g_stan_m.stan001
      #add-point:單身刪除中
      
      #end add-point
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "staq_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
      END IF      
 
      #add-point:單身刪除後
      
      #end add-point
 
 
 
 
                                                               
      CLEAR FORM
      CALL g_stao_d.clear() 
      CALL g_stao2_d.clear()       
      CALL g_stao3_d.clear()
      CALL g_stao4_d.clear()
     
      CALL astm301_ui_browser_refresh()  
      CALL astm301_ui_headershow()  
      CALL astm301_ui_detailshow()
       
      IF g_browser_cnt > 0 THEN 
         CALL astm301_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
      ELSE
         LET g_wc = " 1=1"
         CALL astm301_browser_fill("F")
      END IF
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
      
 
 
 
   
   END IF
 
   CALL s_transaction_end('Y','0')
   
   CLOSE astm301_cl
 
   #流程通知預埋點-D
   CALL cl_flow_notify(g_stan_m.stan001,'D')
    
END FUNCTION
 
{</section>}
 
{<section id="astm301.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astm301_b_fill()
   {<Local define>}
   DEFINE p_wc2      STRING
   {</Local define>}
   #add-point:b_fill段define
   CALL g_stax_d.clear()
   #end add-point     
 
   CALL g_stao_d.clear()    #g_stao_d 單頭及單身 
   CALL g_stao2_d.clear()
   CALL g_stao3_d.clear()
   CALL g_stao4_d.clear()
 
   #add-point:b_fill段sql_before
   
   #end add-point
   
   #判斷是否填充
   IF astm301_fill_chk(1) THEN
   
      LET g_sql = "SELECT  UNIQUE stao002,stao003,'',stao023,stao024,stao025,'',stao004,stao005,stao006,stao007,stao008,stao009, 
          '',stao010,'',stao011,stao012,stao013,stao014,stao015,stao016,stao017,stao018,stao026,stao019 FROM stao_t", 
             
                  " INNER JOIN stan_t ON stan001 = stao001 ",
 
                  #"",
                  
                  "",
                  " WHERE staoent=? AND stao001=?"
      #add-point:b_fill段sql_before
      
      #end add-point
      IF NOT cl_null(g_wc2_table1) THEN
         LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
      END IF
      
      #子單身的WC
      
      
      LET g_sql = g_sql, " ORDER BY stao_t.stao002"
      
      #add-point:單身填充控制
      #add by geza 20150610 150602-00003#12  stao023,stao024     
      LET g_sql = "SELECT  UNIQUE stao002,stao003,'',stao023,stao024,stao025,'',stao004,stao005,stao006,stao028,stao007,stao008,stao027,stao009,'',stao010,'',stao011,stao012,stao013,stao014,stao015,stao016,stao029,stao030,stao022,stao017,stao018,stao026,stao019,stao020,stao021,staoacti FROM stao_t",   
                  " INNER JOIN stan_t ON stan001 = stao001 ",
                  " LEFT JOIN stap_t ON stapent = staoent AND stao001 = stap001 AND stao002 = stap002 ",      
               
                  " WHERE staoent=? AND stao001=?"
      
      IF NOT cl_null(g_wc2_table1) THEN
         LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
      END IF
      IF NOT cl_null(g_wc2_table3) THEN
         LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table3 CLIPPED
      END IF
   
      LET g_sql = g_sql, " ORDER BY stao_t.stao002"
      #end add-point
      
      PREPARE astm301_pb FROM g_sql
      DECLARE b_fill_cs CURSOR FOR astm301_pb
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
      OPEN b_fill_cs USING g_enterprise,g_stan_m.stan001
 
                                               
      FOREACH b_fill_cs INTO g_stao_d[l_ac].stao002,g_stao_d[l_ac].stao003,g_stao_d[l_ac].stao003_desc,g_stao_d[l_ac].stao023,g_stao_d[l_ac].stao024, #add by geza 20150610 150602-00003#12  stao023,stao024  
          g_stao_d[l_ac].stao025,g_stao_d[l_ac].stao025_desc,g_stao_d[l_ac].stao004,g_stao_d[l_ac].stao005,g_stao_d[l_ac].stao006,g_stao_d[l_ac].stao028,g_stao_d[l_ac].stao007,  
          g_stao_d[l_ac].stao008,g_stao_d[l_ac].stao027,g_stao_d[l_ac].stao009,g_stao_d[l_ac].stao009_desc,g_stao_d[l_ac].stao010,  #150612-00023#6 add 
          g_stao_d[l_ac].stao010_desc,g_stao_d[l_ac].stao011,g_stao_d[l_ac].stao012,g_stao_d[l_ac].stao013, 
          g_stao_d[l_ac].stao014,g_stao_d[l_ac].stao015,g_stao_d[l_ac].stao016,g_stao_d[l_ac].stao029,g_stao_d[l_ac].stao030,g_stao_d[l_ac].stao022,g_stao_d[l_ac].stao017, 
          g_stao_d[l_ac].stao018,g_stao_d[l_ac].stao026,g_stao_d[l_ac].stao019,g_stao_d[l_ac].stao020,g_stao_d[l_ac].stao021,g_stao_d[l_ac].staoacti
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
 
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充
         CALL astm301_stao003_ref() 
         CALL astm301_stao009_ref()
         CALL astm301_stao010_ref()
         CALL astm301_stao025_ref()
         # add geza 150504-00002#1 (S)  
         IF g_stao_d[1].stao016 = '1' THEN
            CALL cl_set_comp_visible('group7',FALSE)
         ELSE
            CALL cl_set_comp_visible('group7',TRUE)
         END IF 
         CALL astm301_set_visible(1) 
         # add geza 150504-00002#1 (E)    
         #end add-point
      
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec AND g_error_show = 1 THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code =  9035
            LET g_errparam.extend =  ''
            LET g_errparam.popup = TRUE
            CALL cl_err()
 
            EXIT FOREACH
         END IF
         
      END FOREACH
      LET g_error_show = 0
   
   END IF
   
   #判斷是否填充
   IF astm301_fill_chk(2) THEN
      LET g_sql = "SELECT  UNIQUE staq002,staq003,'',staq005,staq004,staqacti FROM staq_t",   
                  " INNER JOIN stan_t ON stan001 = staq001 AND stanent = staqent ",
 
                  "",
                  
                  " WHERE staqent=? AND staq001=?"   
      #add-point:b_fill段sql_before
      
      #end add-point
      IF NOT cl_null(g_wc2_table2) THEN
         LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
      END IF
      
      #子單身的WC
      
      
      LET g_sql = g_sql, " ORDER BY staq_t.staq002"
      
      #add-point:單身填充控制
      
      #end add-point
      
      PREPARE astm301_pb2 FROM g_sql
      DECLARE b_fill_cs2 CURSOR FOR astm301_pb2
      
      LET l_ac = 1
      
      OPEN b_fill_cs2 USING g_enterprise,g_stan_m.stan001
 
                                               
      FOREACH b_fill_cs2 INTO g_stao2_d[l_ac].staq002,g_stao2_d[l_ac].staq003,g_stao2_d[l_ac].staq003_desc,g_stao2_d[l_ac].staq005, 
          g_stao2_d[l_ac].staq004,g_stao2_d[l_ac].staqacti
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
 
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充
               CALL astm301_staq003_ref()
         #end add-point
      
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code =  9035
            LET g_errparam.extend =  ''
            LET g_errparam.popup = FALSE
            CALL cl_err()
 
            EXIT FOREACH
         END IF
         
      END FOREACH
   END IF
 
 
   
   #add-point:browser_fill段其他table處理
    IF astm301_fill_chk(7) THEN
      LET g_sql = "SELECT  UNIQUE stbk002,stbk003 FROM stbk_t",   
                  "",                 
                  " WHERE stbkent=? AND stbk001=?"   
      #add-point:b_fill段sql_before
      
      #end add-point
      IF NOT cl_null(g_wc2_table7) THEN
         LET g_sql = g_sql CLIPPED," AND ",g_wc2_table7 CLIPPED
      END IF
      
      #子單身的WC
      
      
      LET g_sql = g_sql, " ORDER BY stbk_t.stbk002"
      
      #add-point:單身填充控制
      
      #end add-point
      
      PREPARE astm301_pb7 FROM g_sql
      DECLARE b_fill_cs7 CURSOR FOR astm301_pb7
      
      LET l_ac = 1
      
      OPEN b_fill_cs7 USING g_enterprise,g_stan_m.stan001
 
                                               
      FOREACH b_fill_cs7 INTO g_stao3_d[l_ac].stbk002,g_stao3_d[l_ac].stbk003
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()

            EXIT FOREACH
         END IF
        
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code =  9035
            LET g_errparam.extend =  ''
            LET g_errparam.popup = FALSE
            CALL cl_err()

            EXIT FOREACH
         END IF
         
      END FOREACH
   END IF
   CALL g_stao3_d.deleteElement(g_stao3_d.getLength())
   
   IF astm301_fill_chk(8) THEN
      LET g_sql = "SELECT  UNIQUE stbo002,stbo003,ooefl003,stboacti FROM stbo_t LEFT JOIN ooefl_t ON stboent = ooeflent AND stbo003 = ooefl001 AND ooefl002 = '",g_dlang,"'",   
                  "",                 
                  " WHERE stboent=? AND stbo001=?"   
      #add-point:b_fill段sql_before
      
      #end add-point
      IF NOT cl_null(g_wc2_table8) THEN
         LET g_sql = g_sql CLIPPED," AND ",g_wc2_table8 CLIPPED
      END IF
      
      #子單身的WC
      
      
      LET g_sql = g_sql, " ORDER BY stbo_t.stbo002"
      
      #add-point:單身填充控制
      
      #end add-point
      
      PREPARE astm301_pb8 FROM g_sql
      DECLARE b_fill_cs8 CURSOR FOR astm301_pb8
      
      LET l_ac = 1
      
      OPEN b_fill_cs8 USING g_enterprise,g_stan_m.stan001
 
                                               
      FOREACH b_fill_cs8 INTO g_stao4_d[l_ac].stbo002,g_stao4_d[l_ac].stbo003,g_stao4_d[l_ac].stbo003_desc,g_stao4_d[l_ac].stboacti
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()

            EXIT FOREACH
         END IF
        
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code =  9035
            LET g_errparam.extend =  ''
            LET g_errparam.popup = FALSE
            CALL cl_err()

            EXIT FOREACH
         END IF
         
      END FOREACH
   END IF
   CALL g_stao4_d.deleteElement(g_stao4_d.getLength())


   IF astm301_fill_chk(4) THEN
      LET g_sql = "SELECT  UNIQUE staxsite,staxunit,staxseq,stax007,ooefl003,stax002,stax003,stax004,stax005,stax006 FROM stax_t",   
                  " INNER JOIN stan_t ON stan001 = stax001 AND stanent = staxent ",
                  " LEFT JOIN ooefl_t ON ooeflent = ",g_enterprise," AND ooefl001 = stax007 AND ooefl002 = '",g_dlang,"'",  
                  " WHERE staxent=? AND stax001=?"   
      #add-point:b_fill段sql_before
      
      #end add-point
      IF NOT cl_null(g_wc2_table4) THEN
         LET g_sql = g_sql CLIPPED," AND ",g_wc2_table4 CLIPPED
      END IF
      
      #子單身的WC
      
      
      LET g_sql = g_sql, " ORDER BY stax_t.staxseq"
      
      #add-point:單身填充控制
      
      #end add-point
      
      PREPARE astm301_pb4 FROM g_sql
      DECLARE b_fill_cs4 CURSOR FOR astm301_pb4
      
      LET l_ac = 1
      
      OPEN b_fill_cs4 USING g_enterprise,g_stan_m.stan001
 
                                               
      FOREACH b_fill_cs4 INTO g_stax_d[l_ac].staxsite,g_stax_d[l_ac].staxunit,g_stax_d[l_ac].staxseq,g_stax_d[l_ac].stax007,
                              g_stax_d[l_ac].stax007_desc,g_stax_d[l_ac].stax002, 
          g_stax_d[l_ac].stax003,g_stax_d[l_ac].stax004,g_stax_d[l_ac].stax005,g_stax_d[l_ac].stax006
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()

            EXIT FOREACH
         END IF
    
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code =  9035
            LET g_errparam.extend =  ''
            LET g_errparam.popup = FALSE
            CALL cl_err()

            EXIT FOREACH
         END IF
         
      END FOREACH
   END IF
 
   CALL g_stax_d.deleteElement(g_stax_d.getLength())
   
   IF astm301_fill_chk(9) THEN
      LET g_sql = "SELECT  UNIQUE stbxsite,stbxunit,stbxseq,stbxseq1,stbx008,ooefl003,stbx007,stael003,stbx002,stbx003,stbx004,stbx005,stbx006,stbx009 FROM stbx_t",   
                  " LEFT JOIN stan_t ON stan001 = stbx001 AND stanent = stbxent ",
                  " LEFT JOIN ooefl_t ON ooeflent = ",g_enterprise," AND ooefl001 = stbx008 AND ooefl002 = '",g_dlang,"'",
                  " LEFT JOIN stael_t ON staelent = ",g_enterprise," AND stael001 = stbx007 AND stael002 = '",g_dlang,"'",  
                  " WHERE stbxent=? AND stbx001=?"   

      IF NOT cl_null(g_wc2_table9) THEN
         LET g_sql = g_sql CLIPPED," AND ",g_wc2_table9 CLIPPED
      END IF
      
      LET g_sql = g_sql, " ORDER BY stbx_t.stbxseq"
      CALL g_stbx_d.clear()
      PREPARE astm301_pb9 FROM g_sql
      DECLARE b_fill_cs9 CURSOR FOR astm301_pb9
      
      LET l_ac = 1
      
      OPEN b_fill_cs9 USING g_enterprise,g_stan_m.stan001
 
                                               
      FOREACH b_fill_cs9 INTO g_stbx_d[l_ac].stbxsite,g_stbx_d[l_ac].stbxunit,g_stbx_d[l_ac].stbxseq,g_stbx_d[l_ac].stbxseq1,g_stbx_d[l_ac].stbx008,
                              g_stbx_d[l_ac].stbx008_desc,g_stbx_d[l_ac].stbx007,g_stbx_d[l_ac].stbx007_desc,g_stbx_d[l_ac].stbx002, 
          g_stbx_d[l_ac].stbx003,g_stbx_d[l_ac].stbx004,g_stbx_d[l_ac].stbx005,g_stbx_d[l_ac].stbx006,g_stbx_d[l_ac].stbx009
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()

            EXIT FOREACH
         END IF
    
         LET l_ac = l_ac + 1
         IF l_ac > g_max_rec THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code =  9035
            LET g_errparam.extend =  ''
            LET g_errparam.popup = FALSE
            CALL cl_err()

            EXIT FOREACH
         END IF
         
      END FOREACH
   END IF
 
   CALL g_stbx_d.deleteElement(g_stbx_d.getLength())
   #end add-point
   
   CALL g_stao_d.deleteElement(g_stao_d.getLength())
   CALL g_stao2_d.deleteElement(g_stao2_d.getLength())
 
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astm301_pb
   FREE astm301_pb2
 
 
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astm301_delete_b(ps_table,ps_keys_bak,ps_page)
   {<Local define>}
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   {</Local define>}
   #add-point:delete_b段define
   
   #end add-point     
 
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前
      
      #end add-point    
      DELETE FROM stao_t
       WHERE staoent = g_enterprise AND
         stao001 = ps_keys_bak[1] AND stao002 = ps_keys_bak[2]
      #add-point:delete_b段刪除中
      
      #end add-point    
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = ""
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
      END IF
      #add-point:delete_b段刪除後
      
      #end add-point   
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:delete_b段刪除前
      
      #end add-point    
      DELETE FROM staq_t
       WHERE staqent = g_enterprise AND
         staq001 = ps_keys_bak[1] AND staq002 = ps_keys_bak[2]
      #add-point:delete_b段刪除中
      
      #end add-point    
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "staq_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
      END IF
      #add-point:delete_b段刪除後
      
      #end add-point    
   END IF
 
 
   
 
   
   #add-point:delete_b段other
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astm301_insert_b(ps_table,ps_keys,ps_page)
   {<Local define>}
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   DEFINE ls_page     STRING
   {</Local define>}
   #add-point:insert_b段define
      LET ls_group = "'3',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前

      #end add-point 
      INSERT INTO stap_t
                  (stapent,stap001,stap002,stap003,stap004,stap005,stap006)
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],
                   g_stap_d[l_ac3].stap003,g_stap_d[l_ac3].stap004,g_stap_d[l_ac3].stap005,g_stap_d[l_ac3].stap006)
      #add-point:insert_b段資料新增中

      #end add-point 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stap_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()

      END IF
      #add-point:insert_b段資料新增後

      #end add-point 
   END IF
   
       LET ls_group = "'4',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前

      #end add-point 
      INSERT INTO stax_t
                  (staxent,staxsite,staxunit,staxseq,stax001,stax002,stax003,stax004,stax005,stax006)
            VALUES(g_enterprise,g_stax_d[l_ac].staxsite,g_stax_d[l_ac].staxunit,
                   ps_keys[2],ps_keys[1],
                   g_stax_d[l_ac].stax002,g_stax_d[l_ac].stax003,g_stax_d[l_ac].stax004,g_stax_d[l_ac].stax005,
                   g_stax_d[l_ac].stax006)
      #add-point:insert_b段資料新增中

      #end add-point 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stax_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()

      END IF
      #add-point:insert_b段資料新增後

      #end add-point 
   END IF
   #end add-point     
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前
      
      #end add-point 
      INSERT INTO stao_t
                  (staoent,
                   stao001,
                   stao002
                   ,stao003,stao023,stao024,stao025,stao004,stao005,stao006,stao007,stao008,stao027,stao009,stao010,stao011,stao012,stao013,stao014,stao015,stao016,stao017,stao018,stao019,stao020,stao021,stao022)#add by geza 20150610 150602-00003#12  stao023,stao024 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stao_d[g_detail_idx].stao003,g_stao_d[g_detail_idx].stao023,g_stao_d[g_detail_idx].stao024,g_stao_d[g_detail_idx].stao025,g_stao_d[g_detail_idx].stao004,g_stao_d[g_detail_idx].stao005, #add by geza 20150610 150602-00003#12  stao023,stao024
                       g_stao_d[g_detail_idx].stao006,g_stao_d[g_detail_idx].stao007,g_stao_d[g_detail_idx].stao008,g_stao_d[g_detail_idx].stao027, 
                       g_stao_d[g_detail_idx].stao009,g_stao_d[g_detail_idx].stao010,g_stao_d[g_detail_idx].stao011, 
                       g_stao_d[g_detail_idx].stao012,g_stao_d[g_detail_idx].stao013,g_stao_d[g_detail_idx].stao014, 
                       g_stao_d[g_detail_idx].stao015,g_stao_d[g_detail_idx].stao016,g_stao_d[g_detail_idx].stao017, 
                       g_stao_d[g_detail_idx].stao018,g_stao_d[g_detail_idx].stao019,g_stao_d[g_detail_idx].stao020,g_stao_d[g_detail_idx].stao021,g_stao_d[g_detail_idx].stao022)
      #add-point:insert_b段資料新增中
      
      #end add-point 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stao_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
      END IF
      #add-point:insert_b段資料新增後
      
      #end add-point 
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前
      
      #end add-point 
      INSERT INTO staq_t
                  (staqent,
                   staq001,
                   staq002
                   ,staq003,staq004,staq005) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stao2_d[g_detail_idx].staq003,g_stao2_d[g_detail_idx].staq004,g_stao2_d[g_detail_idx].staq005)
      #add-point:insert_b段資料新增中
      
      #end add-point
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "staq_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
      END IF
      #add-point:insert_b段資料新增後
      
      #end add-point
   END IF
 
 
   
 
   
   #add-point:insert_b段other
   
   #end add-point     
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astm301_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
   {<Local define>}
   DEFINE ps_table         STRING
   DEFINE ps_page          STRING
   DEFINE ps_keys          DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ps_keys_bak      DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group         STRING
   DEFINE li_idx           LIKE type_t.num5 
   DEFINE lb_chk           BOOLEAN
   DEFINE l_new_key        DYNAMIC ARRAY OF STRING
   DEFINE l_old_key        DYNAMIC ARRAY OF STRING
   DEFINE l_field_key      DYNAMIC ARRAY OF STRING
   {</Local define>}
   #add-point:update_b段define
   
   #end add-point     
   
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stao_t" THEN
      #add-point:update_b段修改前
      
      #end add-point     
      UPDATE stao_t 
         SET (stao001,
              stao002
              ,stao003,stao023,stao024,stao025,stao004,stao005,stao006,stao007,stao008,stao027,stao009,stao010,stao011,stao012,stao013,stao014,stao015,stao016,stao017,stao018,stao019,stao020,stao021,stao022) #add by geza 20150610 150602-00003#12  stao023,stao024
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stao_d[g_detail_idx].stao003,g_stao_d[g_detail_idx].stao023,g_stao_d[g_detail_idx].stao024,g_stao_d[g_detail_idx].stao025,g_stao_d[g_detail_idx].stao004,g_stao_d[g_detail_idx].stao005, #add by geza 20150610 150602-00003#12  stao023,stao024
                  g_stao_d[g_detail_idx].stao006,g_stao_d[g_detail_idx].stao007,g_stao_d[g_detail_idx].stao008,g_stao_d[g_detail_idx].stao027, 
                  g_stao_d[g_detail_idx].stao009,g_stao_d[g_detail_idx].stao010,g_stao_d[g_detail_idx].stao011, 
                  g_stao_d[g_detail_idx].stao012,g_stao_d[g_detail_idx].stao013,g_stao_d[g_detail_idx].stao014, 
                  g_stao_d[g_detail_idx].stao015,g_stao_d[g_detail_idx].stao016,g_stao_d[g_detail_idx].stao017, 
                  g_stao_d[g_detail_idx].stao018,g_stao_d[g_detail_idx].stao019,g_stao_d[g_detail_idx].stao020,g_stao_d[g_detail_idx].stao021,g_stao_d[g_detail_idx].stao022) 
         WHERE staoent = g_enterprise AND stao001 = ps_keys_bak[1] AND stao002 = ps_keys_bak[2]
      #add-point:update_b段修改中
      
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = "std-00009"
            LET g_errparam.extend = "stao_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
 
            CALL s_transaction_end('N','0')
         WHEN SQLCA.sqlcode #其他錯誤
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "stao_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
  
            CALL s_transaction_end('N','0')
         OTHERWISE
            
      END CASE
      #add-point:update_b段修改後
      
      #end add-point  
   END IF
   
   LET ls_group = "'2',"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "staq_t" THEN
      #add-point:update_b段修改前
      
      #end add-point     
      UPDATE staq_t 
         SET (staq001,
              staq002
              ,staq003,staq004,staq005) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stao2_d[g_detail_idx].staq003,g_stao2_d[g_detail_idx].staq004,g_stao2_d[g_detail_idx].staq005) 
         WHERE staqent = g_enterprise AND staq001 = ps_keys_bak[1] AND staq002 = ps_keys_bak[2]
      #add-point:update_b段修改中
      
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = "std-00009"
            LET g_errparam.extend = "staq_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
 
            CALL s_transaction_end('N','0')
         WHEN SQLCA.sqlcode #其他錯誤
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "staq_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
  
            CALL s_transaction_end('N','0')
         OTHERWISE
            
      END CASE
      #add-point:update_b段修改後
      
      #end add-point  
   END IF
 
 
   
 
   
 
   
   #add-point:update_b段other
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astm301_lock_b(ps_table,ps_page)
   {<Local define>}
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   {</Local define>}
   #add-point:lock_b段define
      IF ps_table = "stap_t" THEN
      OPEN astm301_bcl3 USING g_enterprise,
                                       g_stan_m.stan001,g_stao_d[l_ac].stao002,g_stap_d[l_ac3].stap003
                                       
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "astm301_bcl3"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   
    IF ps_table = "stax_t" THEN
      OPEN astm301_bcl4 USING g_enterprise,
                                       g_stan_m.stan001,g_stax_d[l_ac].staxseq
                                       
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "astm301_bcl4"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   #end add-point   
   
   #先刷新資料
   #CALL astm301_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stao_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astm301_bcl USING g_enterprise,
                                       g_stan_m.stan001,g_stao_d[g_detail_idx].stao002
                                       
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "astm301_bcl"
         LET g_errparam.popup = TRUE
         CALL cl_err()
 
         RETURN FALSE
      END IF
   
   END IF
                                    
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "staq_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astm301_bcl2 USING g_enterprise,
                                             g_stan_m.stan001,g_stao2_d[g_detail_idx].staq002
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "astm301_bcl2"
         LET g_errparam.popup = TRUE
         CALL cl_err()
 
         RETURN FALSE
      END IF
   END IF
 
 
   
 
   
   #add-point:lock_b段other
   
   #end add-point  
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="astm301.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astm301_unlock_b(ps_table,ps_page)
   {<Local define>}
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   {</Local define>}
   #add-point:unlock_b段define
      LET ls_group = "'3',"
   
   IF ls_group.getIndexOf(ps_page,3) THEN
      CLOSE astm301_bcl3
   END IF
   #end add-point  
   
   LET ls_group = "'1',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astm301_bcl
   END IF
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astm301_bcl2
   END IF
 
 
   
 
 
   #add-point:unlock_b段other

   LET ls_group = "'4',"
   
   IF ls_group.getIndexOf(ps_page,4) THEN
      CLOSE astm301_bcl4
   END IF
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astm301.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astm301_set_entry(p_cmd)
   {<Local define>}
   DEFINE p_cmd   LIKE type_t.chr1  
   {</Local define>}
   #add-point:set_entry段define
   
   #end add-point       
 
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stan001",TRUE)
      #add-point:set_entry段欄位控制
      CALL cl_set_comp_entry("stan004",TRUE)
      CALL cl_set_comp_entry("stanunit",TRUE)
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後
 
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astm301.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astm301_set_no_entry(p_cmd)
   {<Local define>}
   DEFINE p_cmd   LIKE type_t.chr1   
   {</Local define>}
   #add-point:set_no_entry段define
   
   #end add-point     
 
   IF p_cmd = 'u' THEN
      CALL cl_set_comp_entry("stan001",FALSE)
      #add-point:set_no_entry段欄位控制
      CALL cl_set_comp_entry("stan004",FALSE)
      #end add-point 
   END IF
   
   #add-point:set_no_entry段欄位控制後
   IF NOT s_aooi500_comp_entry(g_prog,'stanunit') OR g_site_flag THEN
      CALL cl_set_comp_entry("stanunit",FALSE)
   END IF 
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astm301.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astm301_set_entry_b(p_cmd)
   {<Local define>}
   DEFINE p_cmd   LIKE type_t.chr1   
   {</Local define>}
   #add-point:set_entry_b段define
      DEFINE l_n     LIKE type_t.num5
   DEFINE l_staf003 LIKE staf_t.staf003
   DEFINE l_staf004 LIKE staf_t.staf004
   DEFINE l_staf005 LIKE staf_t.staf005
   DEFINE l_stao005 LIKE stao_t.stao005
   #end add-point     
   #add-point:set_entry_b段
      CALL astm301_init_entry(p_cmd)
   IF NOT cl_null(g_stao_d[l_ac].stao003) THEN
      #檢查費用編號+經營方式是否存在asti204
      
      SELECT COUNT(*) INTO l_n FROM staf_t
       WHERE stafent = g_enterprise AND staf001= g_stao_d[l_ac].stao003 AND staf002 = g_stan_m.stan002
      IF l_n > 0 THEN
         DECLARE sel_staf CURSOR FOR 
          SELECT staf003,staf004,staf005 FROM staf_t
           WHERE  stafent = g_enterprise AND staf001= g_stao_d[l_ac].stao003 AND staf002 = g_stan_m.stan002
         FOREACH sel_staf INTO l_staf003,l_staf004,l_staf005
            IF l_staf003 = "stao005" THEN
               CONTINUE FOREACH
            END IF
            IF l_staf004 = 'Y' THEN
               CALL cl_set_comp_entry(l_staf003,TRUE)
            END IF
         END FOREACH 
      ELSE
         IF g_stao_d[l_ac].stao006 = '1' THEN    #變動
            IF g_stao_d[l_ac].stao016 = '1' THEN      
               CALL cl_set_comp_entry('stao012',TRUE)
            END IF
            CALL cl_set_comp_entry('stao009,stao010',TRUE)
            CALL cl_set_comp_entry('stao013,stao014,stao015,stao016',TRUE)
         ELSE                                    #固定
            CALL cl_set_comp_entry('stao011',TRUE)
         END IF
         IF g_stao_d[l_ac].stao013 <> '1' THEN    #保底

            CALL cl_set_comp_entry('stao014,stao015',TRUE)
         END IF
         
          #抓取价款类型
         SELECT stae006 INTO  l_stao005 FROM stae_t WHERE staeent = g_enterprise AND stae001 = g_stao_d[l_ac].stao003
         IF l_stao005 = '3' THEN
            CALL cl_set_comp_entry('stao005',TRUE)
         ELSE
            CALL cl_set_comp_entry('stao005',FALSE)
         END IF   
      END IF    
   ELSE
      IF g_stao_d[l_ac].stao006 = '1' THEN    #變動
         IF g_stao_d[l_ac].stao016 = '1' THEN      
            CALL cl_set_comp_entry('stao012',TRUE)
         END IF
         CALL cl_set_comp_entry('stao009,stao010',TRUE)
         CALL cl_set_comp_entry('stao013,stao014,stao015,stao016',TRUE)
      ELSE                                    #固定
         CALL cl_set_comp_entry('stao011',TRUE)
      END IF
      IF g_stao_d[l_ac].stao013 <> '1' THEN    #保底
 
         CALL cl_set_comp_entry('stao014,stao015',TRUE)
      END IF
   END IF   
  
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="astm301.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astm301_set_no_entry_b(p_cmd)
   {<Local define>}
   DEFINE p_cmd   LIKE type_t.chr1   
   {</Local define>}
   #add-point:set_no_entry_b段define
      DEFINE l_n     LIKE type_t.num5
   DEFINE l_staf003 LIKE staf_t.staf003
   DEFINE l_staf004 LIKE staf_t.staf004
   DEFINE l_staf005 LIKE staf_t.staf005
   #end add-point    
   #add-point:set_no_entry_b段
       
   
    
    IF NOT cl_null(g_stao_d[l_ac].stao003) THEN
      #檢查費用編號+經營方式是否存在asti204
      
      SELECT COUNT(*) INTO l_n FROM staf_t
       WHERE stafent = g_enterprise AND staf001= g_stao_d[l_ac].stao003 AND staf002 = g_stan_m.stan002
      IF l_n > 0 THEN
         DECLARE sel_staf_ne CURSOR FOR 
          SELECT staf003,staf004,staf005 FROM staf_t
           WHERE  stafent = g_enterprise AND staf001= g_stao_d[l_ac].stao003 AND staf002 = g_stan_m.stan002
 
         FOREACH sel_staf_ne INTO l_staf003,l_staf004,l_staf005
            IF l_staf003 = "stao005" THEN
               CONTINUE FOREACH
            END IF
            IF l_staf004 = 'N' THEN
               CALL cl_set_comp_entry(l_staf003,FALSE)
            END IF
         END FOREACH 
      ELSE
         IF g_stao_d[l_ac].stao006 = '1' THEN    #變動
            IF g_stao_d[l_ac].stao016 <> '1' THEN      
               LET g_stao_d[l_ac].stao012 = ''
               CALL cl_set_comp_entry('stao012',FALSE)
            END IF
         ELSE                                    #固定
            LET g_stao_d[l_ac].stao009 = ''
            LET g_stao_d[l_ac].stao009_desc = ''
            LET g_stao_d[l_ac].stao010 = ''
            LET g_stao_d[l_ac].stao010_desc = ''
            LET g_stao_d[l_ac].stao012 = ''
            LET g_stao_d[l_ac].stao013 = '1'
            LET g_stao_d[l_ac].stao014 = ''
            LET g_stao_d[l_ac].stao015 = ''
            LET g_stao_d[l_ac].stao016 = '1'
            CALL cl_set_comp_entry('stao009,stao010,stao012',FALSE)
            CALL cl_set_comp_entry('stao013,stao014,stao015,stao016',FALSE)
   
         END IF
         
         IF g_stao_d[l_ac].stao013 = '1' THEN    #保底
            LET g_stao_d[l_ac].stao014 = ''
            LET g_stao_d[l_ac].stao015 = ''
            CALL cl_set_comp_entry('stao014,stao015',FALSE)
         END IF
      END IF  
   ELSE
      IF g_stao_d[l_ac].stao006 = '1' THEN    #變動
         IF g_stao_d[l_ac].stao016 <> '1' THEN      
            LET g_stao_d[l_ac].stao012 = ''
            CALL cl_set_comp_entry('stao012',FALSE)
         END IF
      ELSE                                    #固定
         LET g_stao_d[l_ac].stao012 = ''
         CALL cl_set_comp_entry('stao012',FALSE)
      END IF
      
      IF g_stao_d[l_ac].stao013 = '1' THEN    #保底
         LET g_stao_d[l_ac].stao014 = ''
         LET g_stao_d[l_ac].stao015 = ''
         CALL cl_set_comp_entry('stao014,stao015',FALSE)
      END IF   
   END IF   
  
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="astm301.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astm301_default_search()
   {<Local define>}
   DEFINE li_idx  LIKE type_t.num5
   DEFINE li_cnt  LIKE type_t.num5
   DEFINE ls_wc   STRING
   {</Local define>}
   #add-point:default_search段define
   
   #end add-point  
   
   #add-point:default_search段開始前
   
   #end add-point  
   
   LET g_pagestart = 1
   
   IF cl_null(g_order) THEN
      LET g_order = "ASC"
   END IF
   
   IF NOT cl_null(g_argv[1]) THEN
      LET ls_wc = ls_wc, " stan001 = '", g_argv[1], "' AND "
   END IF
   
 
   
   IF NOT cl_null(ls_wc) THEN
      LET g_wc = ls_wc.subString(1,ls_wc.getLength()-5)
   ELSE
      #160810-00002#1 160812 by lori mod---(S)  
      #舊程式樣板標準---(S)
      #IF cl_null(g_wc) THEN
      #   LET g_wc = " 1=1" 
      #END IF
      #舊程式樣板標準---(E)
      
      #若無外部參數則預設為1=2
      IF cl_null(g_wc) AND cl_null(g_wc2) THEN
         LET g_wc = " 1=2"
      END IF  
      #160810-00002#1 160812 by lori mod---(E)
   END IF
   
   #add-point:default_search段結束前
   
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astm301.state_change" >}
   #+ 此段落由子樣板a09產生
#+ 確認碼變更
PRIVATE FUNCTION astm301_statechange()
   {<Local define>}
   DEFINE lc_state LIKE type_t.chr5
   {</Local define>}
   #add-point:statechange段define
      DEFINE l_success      LIKE type_t.num5 
   #end add-point  
   
   #add-point:statechange段開始前
   
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stan_m.stan001 IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "std-00003"
      LET g_errparam.extend = ""
      LET g_errparam.popup = FALSE
      CALL cl_err()
 
      RETURN
   END IF
 
   MENU "" ATTRIBUTES (STYLE="popup")
      BEFORE MENU
         CASE g_stan_m.stanstus
            WHEN "N"
               HIDE OPTION "open"
            WHEN "X"
               HIDE OPTION "void"
 
            WHEN "Y"
               HIDE OPTION "valid"
 
 
            
         END CASE
     
      #add-point:menu前
               CASE g_stan_m.stanstus
            WHEN "Y"
               HIDE OPTION "void"
            WHEN "X"
               HIDE OPTION "valid"
         END CASE
      #end add-point
      
      ON ACTION open
         LET lc_state = "N"
         #add-point:action控制
         
         #end add-point
         EXIT MENU
      ON ACTION void
         LET lc_state = "X"
         #add-point:action控制
         
         #end add-point
         EXIT MENU
 
      ON ACTION valid
         LET lc_state = "Y"
         #add-point:action控制
         
         #end add-point
         EXIT MENU
 
 
      
      
      
      #add-point:stus控制
      
      #end add-point
      
   END MENU
   
   IF (lc_state <> "N" 
      AND lc_state <> "X"
 
      AND lc_state <> "Y"
 
 
      ) OR 
      cl_null(lc_state) THEN
      RETURN
   END IF
   
   #add-point:stus修改前
      LET l_success = TRUE
   CASE 
      WHEN lc_state = 'Y' AND g_stan_m.stanstus = 'N'
         CALL s_astm301_conf_chk(g_stan_m.stan001) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('aim-00108') THEN
               CALL s_transaction_begin()
               CALL s_astm301_conf_upd(g_stan_m.stan001) RETURNING l_success
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               RETURN
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = g_errno
            LET g_errparam.extend = g_stan_m.stan001
            LET g_errparam.popup = TRUE
            CALL cl_err()

            RETURN
         END IF
         
      WHEN lc_state = 'X' AND g_stan_m.stanstus = 'N'
         CALL s_astm301_void_chk(g_stan_m.stan001) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('art-00039') THEN
               CALL s_transaction_begin()
               CALL s_astm301_void_upd(g_stan_m.stan001) RETURNING l_success
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  RETURN
               ELSE
                  CALL s_transaction_end('Y','1')
               END IF
            ELSE
               RETURN 
            END IF
         ELSE
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = g_errno
            LET g_errparam.extend = g_stan_m.stan001
            LET g_errparam.popup = TRUE
            CALL cl_err()

            RETURN
         END IF   
         
       WHEN lc_state = 'N' AND g_stan_m.stanstus = 'X'
         
             CALL s_astm301_void_chk(g_stan_m.stan001) RETURNING l_success,g_errno
             IF l_success THEN
                IF cl_ask_confirm('art-00038') THEN                
                  CALL s_transaction_begin()
                  CALL s_astm301_void_upd(g_stan_m.stan001) RETURNING l_success
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                     RETURN
                  ELSE
                     CALL s_transaction_end('Y','1')
                  END IF
               ELSE
                  RETURN 
               END IF
            ELSE
               INITIALIZE g_errparam TO NULL
            LET g_errparam.code = g_errno
            LET g_errparam.extend = g_stan_m.stan001
            LET g_errparam.popup = TRUE
            CALL cl_err()

               RETURN
            END IF
       WHEN lc_state = 'N' AND g_stan_m.stanstus = 'Y'       
             CALL s_astm301_unconf_chk(g_stan_m.stan001) RETURNING l_success,g_errno
             IF l_success THEN
               IF cl_ask_confirm('aim-00110') THEN
                  CALL s_transaction_begin()
                  CALL s_astm301_unconf_upd(g_stan_m.stan001) RETURNING l_success
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                     RETURN
                  ELSE
                     CALL s_transaction_end('Y','1')
                  END IF
               ELSE 
                  RETURN
               END IF
             ELSE
                INITIALIZE g_errparam TO NULL
            LET g_errparam.code = g_errno
            LET g_errparam.extend = g_stan_m.stan001
            LET g_errparam.popup = TRUE
            CALL cl_err()

                RETURN
             END IF   
                 
     END CASE   
   #end add-point
      
   UPDATE stan_t SET stanstus = lc_state 
    WHERE stanent = g_enterprise AND stan001 = g_stan_m.stan001
 
  
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = ""
      LET g_errparam.popup = FALSE
      CALL cl_err()
 
   ELSE
      CASE lc_state
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/void.png")
 
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/valid.png")
 
 
         
      END CASE
      LET g_stan_m.stanstus = lc_state
      DISPLAY BY NAME g_stan_m.stanstus
   END IF
 
   #add-point:stus修改後
      
 
   #end add-point
 
   #add-point:statechange段結束前
   
   #end add-point  
 
END FUNCTION
 
 
 
{</section>}
 
{<section id="astm301.idx_chk" >}
#+ 單身筆數變更
PRIVATE FUNCTION astm301_idx_chk()
   #add-point:idx_chk段define
      IF g_current_page = 3 THEN
      LET g_detail_idx3 = g_curr_diag.getCurrentRow("s_detail3")
      IF g_detail_idx3 > g_stap_d.getLength() THEN
         LET g_detail_idx3 = g_stap_d.getLength()
      END IF
      IF g_detail_idx3 = 0 AND g_stap_d.getLength() <> 0 THEN
         LET g_detail_idx3 = 1
      END IF
      DISPLAY g_detail_idx3 TO FORMONLY.idx
      DISPLAY g_stap_d.getLength() TO FORMONLY.cnt
   END IF
   #end add-point  
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stao_d.getLength() THEN
         LET g_detail_idx = g_stao_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stao_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stao_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_stao2_d.getLength() THEN
         LET g_detail_idx = g_stao2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stao2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stao2_d.getLength() TO FORMONLY.cnt
   END IF
 
 
   
   #add-point:idx_chk段other
   #IF g_detail_idx = 0 OR cl_null(g_detail_idx) THEN LET g_detail_idx = 1 END IF
   # IF g_stao_d[g_detail_idx].stao016 = '1' THEN
   #    CALL cl_set_comp_visible('group7',FALSE)
   # ELSE
   #    CALL cl_set_comp_visible('group7',TRUE)
   # END IF 
   # 
   # CALL astm301_set_visible(g_detail_idx)
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astm301_b_fill2(pi_idx)
   {<Local define>}
   DEFINE pi_idx          LIKE type_t.num5
   DEFINE li_ac           LIKE type_t.num5
   DEFINE ls_chk          LIKE type_t.chr1
   {</Local define>}
   #add-point:b_fill2段define
   DEFINE l_success       LIKE type_t.num5  
   #end add-point
   
   LET li_ac = l_ac 
   
 
      
   #add-point:單身填充後
   IF g_detail_idx > g_stao_d.getLength() THEN 
      RETURN 
   END IF 
   CALL astm301_b3_fill()
   CALL astm301_reflesh()
   
   ###################150512-00006#2
   IF (pi_idx = 2 OR pi_idx = 0 ) AND g_stao_d.getLength() > 0 THEN
               CALL g_staz_d.clear()
 
         LET g_sql = "SELECT  UNIQUE stazseq2,staz002,staz004,ooefl003 FROM staz_t",    
                     "",
                     " LEFT JOIN ooefl_t ON stazent = ooeflent AND staz002 = '1' AND staz004 = ooefl001 AND ooefl002='"||g_dlang||"' ",
 
                     " WHERE stazent=? AND staz001=? AND stazseq1=? AND staz002 = '1' "
         
         IF NOT cl_null(g_wc2_table5) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table5 CLIPPED
         END IF
         
         LET g_sql = g_sql, " ORDER BY  staz_t.stazseq2" 
                            
    
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astm301_pb5 FROM g_sql
         DECLARE b_fill_curs5 CURSOR FOR astm301_pb5
         
         OPEN b_fill_curs5 USING g_enterprise,g_stan_m.stan001,g_stao_d[g_detail_idx].stao002
         LET l_ac = 1
         FOREACH b_fill_curs5 INTO g_staz_d[l_ac].stazseq2,g_staz_d[l_ac].staz002,g_staz_d[l_ac].staz004,g_staz_d[l_ac].staz004_desc 
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "FOREACH:" 
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               EXIT FOREACH
            END IF
            
      
           
            IF l_ac > g_max_rec THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_ac
               LET g_errparam.code   = 9035 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               EXIT FOREACH
            END IF
            
            LET l_ac = l_ac + 1
            
         END FOREACH
         CALL g_staz_d.deleteElement(g_staz_d.getLength())
 
      END IF
      
      
       IF (pi_idx = 3 OR pi_idx = 0 ) AND g_stao_d.getLength() > 0 THEN
               CALL g_staz1_d.clear()
 
         LET g_sql = "SELECT  UNIQUE stazseq2,staz002,staz005,staz003,staz004,'' FROM staz_t",    
                     "",
                     " WHERE stazent=? AND staz001=? AND stazseq1=? AND staz002 = '2' "
         
         IF NOT cl_null(g_wc2_table6) THEN
            LET g_sql = g_sql CLIPPED," AND ",g_wc2_table6 CLIPPED
         END IF
         
         LET g_sql = g_sql, " ORDER BY  staz_t.stazseq2" 
                            
    
         LET g_sql = cl_sql_add_mask(g_sql)              #遮蔽特定資料
         PREPARE astm301_pb6 FROM g_sql
         DECLARE b_fill_curs6 CURSOR FOR astm301_pb6
         
         OPEN b_fill_curs6 USING g_enterprise,g_stan_m.stan001,g_stao_d[g_detail_idx].stao002
         LET l_ac = 1
         FOREACH b_fill_curs6 INTO g_staz1_d[l_ac].stazseq2,g_staz1_d[l_ac].staz002,g_staz1_d[l_ac].staz005,g_staz1_d[l_ac].staz003,g_staz1_d[l_ac].staz004,g_staz1_d[l_ac].staz004_desc 
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = "FOREACH:" 
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               EXIT FOREACH
            END IF
            
             CALL s_aint800_01_show(g_staz1_d[l_ac].staz003,g_staz1_d[l_ac].staz004,'','','') RETURNING l_success,g_staz1_d[l_ac].staz004_desc 
           
            IF l_ac > g_max_rec THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = l_ac
               LET g_errparam.code   = 9035 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               EXIT FOREACH
            END IF
            
            LET l_ac = l_ac + 1
            
         END FOREACH
         CALL g_staz1_d.deleteElement(g_staz1_d.getLength())
 
      END IF

   ###################
   #end add-point
    
   LET l_ac = li_ac
   
   CALL astm301_detail_show()
   
END FUNCTION
 
{</section>}
 
{<section id="astm301.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astm301_fill_chk(ps_idx)
   {<Local define>}
   DEFINE ps_idx        LIKE type_t.chr10
   {</Local define>}
   #add-point:fill_chk段define
 
   #end add-point
   
   #全部為1=1 or null時回傳true
   RETURN TRUE  #add by geza 20160322
   IF (cl_null(g_wc2_table1) OR g_wc2_table1.trim() = '1=1')  AND 
      (cl_null(g_wc2_table2) OR g_wc2_table2.trim() = '1=1')  AND 
      (cl_null(g_wc2_table4) OR g_wc2_table4.trim() = '1=1')  AND 
      (cl_null(g_wc2_table7) OR g_wc2_table7.trim() = '1=1')  AND
      (cl_null(g_wc2_table8) OR g_wc2_table8.trim() = '1=1') THEN
      #add-point:fill_chk段define
      
      #end add-point
      RETURN TRUE
   END IF
   
   #第一單身
   IF ps_idx = 1 AND
      ((NOT cl_null(g_wc2_table1) AND g_wc2_table1.trim() <> '1=1')) THEN
      RETURN TRUE
   END IF
   
   #根據wc判定是否需要填充
   IF ps_idx = 2 AND
      ((NOT cl_null(g_wc2_table2) AND g_wc2_table2.trim() <> '1=1')) THEN
      RETURN TRUE
   END IF
 
    #根據wc判定是否需要填充
   IF ps_idx = 4 AND
      ((NOT cl_null(g_wc2_table4) AND g_wc2_table4.trim() <> '1=1')) THEN
      RETURN TRUE
   END IF
 
    #根據wc判定是否需要填充
   IF ps_idx = 7 AND
      ((NOT cl_null(g_wc2_table7) AND g_wc2_table7.trim() <> '1=1')) THEN
      RETURN TRUE
   END IF
 
    #根據wc判定是否需要填充
   IF ps_idx = 8 AND
      ((NOT cl_null(g_wc2_table8) AND g_wc2_table8.trim() <> '1=1')) THEN
      RETURN TRUE
   END IF
   
   RETURN FALSE
 
END FUNCTION
 
{</section>}
 
{<section id="astm301.signature" >}
   
 
{</section>}
 
{<section id="astm301.set_pk_array" >}
 
 
{</section>}
 
{<section id="astm301.other_dialog" readonly="Y" >}
 
 
{</section>}
 
{<section id="astm301.other_function" readonly="Y" >}
   
#+
PUBLIC FUNCTION astm301_b3_fill()
DEFINE p_wc2      STRING
 DEFINE l_a      LIKE type_t.num5
 
   CALL g_stap_d.clear()   
   
   LET g_sql = "SELECT  UNIQUE stap003,stap004,stap005,stap006 FROM stap_t",    
               "",
               " WHERE stapent=? AND stap001=? AND stap002 = ?"
 
   IF NOT cl_null(g_wc2_table3) THEN
      LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table3 CLIPPED
   END IF
 
   LET g_sql = g_sql, " ORDER BY stap_t.stap003"
 
   #add-point:單身填充控制

   #end add-point
   
   PREPARE astm301_pb3 FROM g_sql
   DECLARE b_fill_cs3 CURSOR FOR astm301_pb3
 
   LET g_cnt = l_a
   LET l_a = 1
   IF cl_null(l_ac) OR l_ac = 0 THEN
      LET l_ac = 1
   END IF
   IF l_ac > g_stao_d.getlength() THEN 
      RETURN 
   END IF 
   OPEN b_fill_cs3 USING g_enterprise,g_stan_m.stan001,g_stao_d[l_ac].stao002

                                            
   FOREACH b_fill_cs3 INTO g_stap_d[l_a].stap003,g_stap_d[l_a].stap004,g_stap_d[l_a].stap005,g_stap_d[l_a].stap006
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
     
      #add-point:b_fill段資料填充

      #end add-point
 
      LET l_a = l_a + 1
      IF l_a > g_max_rec AND g_error_show = 1 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code =  9035
         LET g_errparam.extend =  ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         EXIT FOREACH
      END IF
      
   END FOREACH
   LET g_error_show = 0
   
   CALL g_stap_d.deleteElement(g_stap_d.getLength())

   LET l_a = g_cnt
   LET g_cnt = 0  
   
   FREE astm301_pb3
END FUNCTION
#+
PUBLIC FUNCTION astm301_reflesh()
  DISPLAY ARRAY g_stao_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b)
     BEFORE DISPLAY
         EXIT DISPLAY
  END DISPLAY 
  DISPLAY ARRAY g_stap_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b3)
       BEFORE DISPLAY
         EXIT DISPLAY
    END DISPLAY
END FUNCTION
#+
PUBLIC FUNCTION astm301_stao003_ref()
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stao_d[l_ac].stao003
    CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stao_d[l_ac].stao003_desc = '', g_rtn_fields[1] , ''  
    DISPLAY BY NAME g_stao_d[l_ac].stao003_desc
END FUNCTION
#+
PUBLIC FUNCTION astm301_set_no_required_b(p_cmd)
   DEFINE p_cmd   LIKE type_t.chr1   
   DEFINE l_n     LIKE type_t.num5
   DEFINE l_staf003 LIKE staf_t.staf003
   DEFINE l_staf004 LIKE staf_t.staf004
   DEFINE l_staf005 LIKE staf_t.staf005


  
   CALL astm301_init_required(p_cmd)
   IF NOT cl_null(g_stao_d[l_ac].stao003) THEN
      #檢查費用編號+經營方式是否存在asti204
      
      SELECT COUNT(*) INTO l_n FROM staf_t
       WHERE stafent = g_enterprise AND staf001= g_stao_d[l_ac].stao003 AND staf002 = g_stan_m.stan002
      IF l_n > 0 THEN
         DECLARE sel_staf_nq CURSOR FOR 
          SELECT staf003,staf004,staf005 FROM staf_t
           WHERE  stafent = g_enterprise AND staf001= g_stao_d[l_ac].stao003 AND staf002 = g_stan_m.stan002
         FOREACH sel_staf_nq INTO l_staf003,l_staf004,l_staf005
            IF l_staf003 = "stao005" THEN
               CONTINUE FOREACH
            END IF
            IF l_staf005 = 'N' THEN
               CALL cl_set_comp_required(l_staf003,FALSE)
            END IF
         END FOREACH 
      ELSE
          IF g_stao_d[l_ac].stao006 = '1' THEN    #變動
             IF g_stao_d[l_ac].stao016 <> '1' THEN      
                LET g_stao_d[l_ac].stao012 = ''
                CALL cl_set_comp_required('stao012',FALSE)
             END IF
          ELSE                                    #固定
             CALL cl_set_comp_required('stao010',FALSE) 
             LET g_stao_d[l_ac].stao012 = ''
             CALL cl_set_comp_required('stao012',FALSE) 
          END IF   
          IF g_stao_d[l_ac].stao013 = '1' THEN    #保底
             CALL cl_set_comp_required('stao014,stao015',FALSE)
          END IF
       END IF 
   ELSE
      IF g_stao_d[l_ac].stao006 = '1' THEN    #變動
         IF g_stao_d[l_ac].stao016 <> '1' THEN      
            LET g_stao_d[l_ac].stao012 = ''
            CALL cl_set_comp_required('stao012',FALSE)
         END IF
      ELSE                                    #固定
         CALL cl_set_comp_required('stao010',FALSE) 
         LET g_stao_d[l_ac].stao012 = ''
         CALL cl_set_comp_required('stao012',FALSE) 
      END IF   
      IF g_stao_d[l_ac].stao013 = '1' THEN    #保底
         CALL cl_set_comp_required('stao014,stao015',FALSE)
      END IF   
   END IF  
   
END FUNCTION
#+
PUBLIC FUNCTION astm301_set_required_b(p_cmd)
DEFINE p_cmd   LIKE type_t.chr1   
DEFINE l_n     LIKE type_t.num5
DEFINE l_staf003 LIKE staf_t.staf003
DEFINE l_staf004 LIKE staf_t.staf004
DEFINE l_staf005 LIKE staf_t.staf005

   
  
    
   IF NOT cl_null(g_stao_d[l_ac].stao003) THEN
      #檢查費用編號+經營方式是否存在asti204
      
      SELECT COUNT(*) INTO l_n FROM staf_t
       WHERE stafent = g_enterprise AND staf001= g_stao_d[l_ac].stao003 AND staf002 = g_stan_m.stan002
      IF l_n > 0 THEN
         DECLARE sel_staf_q CURSOR FOR 
          SELECT staf003,staf004,staf005 FROM staf_t
           WHERE  stafent = g_enterprise AND staf001= g_stao_d[l_ac].stao003 AND staf002 = g_stan_m.stan002
         FOREACH sel_staf_q INTO l_staf003,l_staf004,l_staf005
            IF l_staf003 = "stao005" THEN
               CONTINUE FOREACH
            END IF
            IF l_staf005 = 'Y' THEN
               CALL cl_set_comp_required(l_staf003,TRUE)
            END IF
         END FOREACH 
      ELSE
          IF g_stao_d[l_ac].stao006 = '1' THEN    #變動
             CALL cl_set_comp_required('stao010',TRUE)
             IF g_stao_d[l_ac].stao016 = '1' THEN      
                CALL cl_set_comp_required('stao012',TRUE) 
             END IF
          ELSE                                    #固定
             CALL cl_set_comp_required('stao011',TRUE)
          END IF   
          IF g_stao_d[l_ac].stao013 <> '1' THEN    #保底
             CALL cl_set_comp_required('stao014,stao015',TRUE)
          END IF
      END IF  
   ELSE
      IF g_stao_d[l_ac].stao006 = '1' THEN    #變動
         CALL cl_set_comp_required('stao010',TRUE)
         IF g_stao_d[l_ac].stao016 = '1' THEN      
            CALL cl_set_comp_required('stao012',TRUE) 
         END IF
      ELSE                                    #固定
         CALL cl_set_comp_required('stao011',TRUE)
      END IF   
      IF g_stao_d[l_ac].stao013 <> '1' THEN    #保底
         CALL cl_set_comp_required('stao014,stao015',TRUE)
      END IF   
   END IF 
  
END FUNCTION
#+
PUBLIC FUNCTION astm301_stao009_chk(p_stab001)
DEFINE p_stab001   LIKE stab_t.stab001
DEFINE l_n         LIKE type_t.num5

   LET g_errshow = '1'
   INITIALIZE g_chkparam.* TO NULL
   LET g_chkparam.arg1 = p_stab001
   IF NOT cl_chk_exist("v_stab001") THEN
      RETURN FALSE
   END IF
      
   SELECT COUNT(*) INTO l_n FROM stab_t LEFT OUTER JOIN stat_t ON stabent = statent AND stab001 = stat003
     WHERE  stabent = g_enterprise AND stab001= p_stab001 AND stat001 = g_stan_m.stan002 AND stat002 = g_stan_m.stan010 
   IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00189'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF
   RETURN TRUE
END FUNCTION
#+
PUBLIC FUNCTION astm301_stao003_chk(p_stae001)
DEFINE p_stae001  LIKE stae_t.stae001
DEFINE l_staestus LIKE stae_t.staestus
DEFINE l_stae010  LIKE stae_t.stae010
DEFINE l_n        LIKE type_t.num5
DEFINE l_ooef019  LIKE ooef_t.ooef019

   SELECT staestus INTO l_staestus FROM stae_t
    WHERE stae001 = p_stae001 AND staeent = g_enterprise
   
   IF STATUS = 100 OR  cl_null(l_staestus) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00001'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   ELSE
      IF l_staestus = 'N' THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00002'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   
   #税别要存在于签订法人税区里面的税别
   SELECT stae010 INTO l_stae010 FROM stae_t WHERE staeent = g_enterprise AND stae001 = p_stae001
   SELECT ooef019 INTO l_ooef019 FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_stan_m.stan013
   
   IF NOT cl_null(l_stae010) THEN
      SELECT COUNT(*) INTO l_n FROM oodb_t WHERE oodbent = g_enterprise AND oodb001 = l_ooef019 AND oodb002 = l_stae010
      IF l_n = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00224'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN FALSE
      END IF    
   END IF
  
   RETURN TRUE
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan005_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stan_m.stan005
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stan_m.stan005_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stan_m.stan005_desc
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan005_chk(p_pmaa001)
DEFINE p_pmaa001   LIKE pmaa_t.pmaa001
DEFINE l_pmaastus  LIKE pmaa_t.pmaastus

   SELECT pmaastus INTO l_pmaastus FROM pmaa_t
    WHERE pmaaent = g_enterprise AND pmaa001 = p_pmaa001 AND pmaa002 IN ('1','3')
   IF STATUS = 100 OR cl_null(l_pmaastus) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'apm-00016'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   ELSE
      IF l_pmaastus = 'N' THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'apm-00017'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   RETURN TRUE
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan004_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stan_m.stan004
   CALL ap_ref_array2(g_ref_fields,"SELECT stagl003 FROM stagl_t WHERE staglent='"||g_enterprise||"' AND stagl001=? AND stagl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stan_m.stan004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stan_m.stan004_desc
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan004_chk(p_stag001)
DEFINE p_stag001  LIKE stag_t.stag001
DEFINE l_stagstus LIKE stag_t.stagstus

  SELECT stagstus INTO l_stagstus FROM stag_t
   WHERE stagent = g_enterprise AND stag001 = p_stag001
  IF STATUS = 100 OR cl_null(l_stagstus) THEN
    INITIALIZE g_errparam TO NULL
    LET g_errparam.code = 'ast-00019'
    LET g_errparam.extend = ''
    LET g_errparam.popup = TRUE
    CALL cl_err()

    RETURN FALSE
  ELSE
    IF l_stagstus = 'N' THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = 'ast-00020'
       LET g_errparam.extend = ''
       LET g_errparam.popup = TRUE
       CALL cl_err()

       RETURN FALSE
    END IF
    IF l_stagstus = 'X' THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = 'ast-00021'
       LET g_errparam.extend = ''
       LET g_errparam.popup = TRUE
       CALL cl_err()

       RETURN FALSE
    END IF
  END IF  
  RETURN TRUE 
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan006_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stan_m.stan006
   CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stan_m.stan006_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stan_m.stan006_desc
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan006_chk(p_stan006)
DEFINE p_stan006  LIKE stan_t.stan006
  
   LET g_errshow = '1'
   INITIALIZE g_chkparam.* TO NULL
   LET g_chkparam.arg1 = g_site
   LET g_chkparam.arg2 = p_stan006
   
   #160318-00025#37  2016/04/19  by pengxin  add(S)
   LET g_errshow = TRUE #是否開窗 
   LET g_chkparam.err_str[1] = "aoo-00176:sub-01302|aooi150|",cl_get_progname("aooi150",g_lang,"2"),"|:EXEPROGaooi150"
   #160318-00025#37  2016/04/19  by pengxin  add(E)
   
   IF NOT cl_chk_exist("v_ooaj002") THEN
      RETURN FALSE
   END IF
   RETURN TRUE
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan007_ref()
  SELECT oodbl004 INTO g_stan_m.stan007_desc
    FROM oodbl_t,ooef_t
   WHERE oodblent = g_enterprise
     AND oodbl001 = ooef019 
     AND oodbl002 = g_stan_m.stan007
     AND oodbl003 = g_dlang
     AND ooefent = g_enterprise
     AND ooef001 = g_stan_m.stan013    #150213-00006#2 2015/02/13 By pomelo 
     #AND ooef001 = g_site             #150213-00006#2 2015/02/13 By mark
   DISPLAY BY NAME g_stan_m.stan007_desc
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan007_chk(p_stan007)
DEFINE  p_stan007    LIKE stan_t.stan007
DEFINE  l_oodcstus   LIKE oodc_t.oodcstus

   LET g_errno = ''
   SELECT oodbstus INTO l_oodcstus
     FROM oodb_t,ooef_t
    WHERE oodbent = g_enterprise
      AND oodb001 = ooef019
      AND oodb002 = p_stan007
      AND oodb004 = '1'
      AND ooefent = g_enterprise
      AND ooef001 = g_stan_m.stan013    #150213-00006#2 2015/02/13 By pomelo 
      #AND ooef001 = g_site             #150213-00006#2 2015/02/13 By mark
   CASE
      WHEN SQLCA.sqlcode = 100 LET g_errno = 'ast-00009' #稅目不存在
                               LET g_stan_m.stan007_desc = ''
      WHEN l_oodcstus <> 'Y'   LET g_errno = 'ast-00010' #稅目已無效
                               LET  g_stan_m.stan007_desc = ''
   END CASE
   IF cl_null(g_errno) THEN
      RETURN TRUE
   ELSE
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = g_errno
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan009_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stan_m.stan009
   CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stan_m.stan009_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stan_m.stan009_desc
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan010_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stan_m.stan010
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stan_m.stan010_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stan_m.stan010_desc
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan010_chk(p_stan010)
DEFINE p_stan010  LIKE stan_t.stan010
DEFINE l_oocqstus LIKE oocq_t.oocqstus


   SELECT oocqstus INTO l_oocqstus FROM oocq_t
    WHERE oocqent =  g_enterprise AND oocq001 = '2060' AND oocq002 = p_stan010
    
   IF STATUS = 100 OR cl_null(l_oocqstus) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00005'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   ELSE
      IF l_oocqstus = 'N' THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = 'ast-00006'
          LET g_errparam.extend = ''
          LET g_errparam.popup = TRUE
          CALL cl_err()

          RETURN FALSE
      END IF
   END IF
   RETURN TRUE
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan009_chk(p_stan009)
DEFINE p_stan009  LIKE stan_t.stan009
DEFINE l_staastus LIKE staa_t.staastus

   SELECT staastus INTO l_staastus FROM staa_t 
     WHERE staaent = g_enterprise AND staa001 = p_stan009
     
   IF STATUS = 100 OR cl_null(l_staastus) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00003'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   ELSE
      IF l_staastus = 'N' THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00004'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   RETURN TRUE
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan015_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stan_m.stan015
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stan_m.stan015_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stan_m.stan015_desc
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan015_chk(p_stan015)
DEFINE p_stan015  LIKE stan_t.stan015


  INITIALIZE g_chkparam.* TO NULL
  LET g_errshow = '1'
  LET g_chkparam.arg1 = p_stan015
  #LET g_chkparam.arg2 = 'A'
  IF NOT cl_chk_exist("v_ooef001_31") THEN
     RETURN FALSE
  END IF
  RETURN TRUE
    
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan016_ref()
  INITIALIZE g_ref_fields TO NULL
  LET g_ref_fields[1] = g_stan_m.stan016
  CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
  LET g_stan_m.stan016_desc = '', g_rtn_fields[1] , ''
  DISPLAY BY NAME g_stan_m.stan016_desc
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan016_chk(p_stan016)
DEFINE p_stan016  LIKE stan_t.stan016

  
  INITIALIZE g_chkparam.* TO NULL
  LET g_errshow = '1'
  LET g_chkparam.arg1 = p_stan016
  #LET g_chkparam.arg2 = 'D'
  IF NOT cl_chk_exist("v_ooef001_34") THEN
     RETURN FALSE
  END IF
   RETURN TRUE
    
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan004_other()
   SELECT stag003,stag004,stag005,stag006,stag007
     INTO g_stan_m.stan008,g_stan_m.stan009,g_stan_m.stan010,g_stan_m.stan006,g_stan_m.stan007
     FROM stag_t
    WHERE stagent = g_enterprise AND stag001 = g_stan_m.stan004
    
   #LET g_stan_m_t.* = g_stan_m.*
   DISPLAY BY NAME g_stan_m.stan008,g_stan_m.stan009,g_stan_m.stan010,g_stan_m.stan006,g_stan_m.stan007,g_stan_m.stanunit
   
   CALL astm301_stan008_ref()
   CALL astm301_stan009_ref()
   CALL astm301_stan010_ref()
   CALL astm301_stan006_ref()
   CALL astm301_stan007_ref()
 
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan004_genb()
DEFINE l_sql    STRING
#DEFINE l_stah   RECORD LIKE stah_t.* #161111-00028#3--mark
#161111-00028#3--add----begin---------
DEFINE l_stah RECORD  #自營合約模板費用設定檔
       stahent LIKE stah_t.stahent, #企業編號
       stah001 LIKE stah_t.stah001, #模板編號
       stah002 LIKE stah_t.stah002, #序號
       stah003 LIKE stah_t.stah003, #費用編號
       stah004 LIKE stah_t.stah004, #會計期間
       stah005 LIKE stah_t.stah005, #價款類別
       stah006 LIKE stah_t.stah006, #計算類型
       stah007 LIKE stah_t.stah007, #費用週期
       stah008 LIKE stah_t.stah008, #費用週期方式
       stah009 LIKE stah_t.stah009, #條件基準
       stah010 LIKE stah_t.stah010, #計算基準
       stah011 LIKE stah_t.stah011, #費用淨額
       stah012 LIKE stah_t.stah012, #費用比率
       stah013 LIKE stah_t.stah013, #保底
       stah014 LIKE stah_t.stah014, #保底金額
       stah015 LIKE stah_t.stah015, #保底扣率
       stah016 LIKE stah_t.stah016, #分量扣點
       stah017 LIKE stah_t.stah017  #是否參與現金折扣
       END RECORD
#161111-00028#3--add----end-----------
DEFINE l_next_b LIKE type_t.dat
DEFINE l_stao019 LIKE stao_t.stao019
DEFINE l_stao020 LIKE stao_t.stao020
DEFINE l_stao021 LIKE stao_t.stao021
DEFINE l_flag    LIKE type_t.chr1  
  
    DECLARE  sel_stah CURSOR FOR SELECT stahent,stah001,stah002,stah003,stah004,stah005,stah006,stah007,stah008,stah009,
                                        stah010,stah011,stah012,stah013,stah014,stah015,stah016,stah017   ##161111-00028#3--add stah017
     FROM stah_t 
    WHERE stahent = g_enterprise AND stah001 =g_stan_m.stan004
  
    FOREACH sel_stah INTO l_stah.*
       #推算下次计算日 .结算开始。结算截止
       #CALL s_astm301_cal_nextd(l_stah.stah007,l_stah.stah008,g_stan_m.stan017,g_stan_m.stan018,'','') RETURNING l_stao019,l_stao020,l_stao021
       INSERT INTO stao_t(staoent,stao001,stao002,stao003,stao004,stao005,stao006,
                     stao007,stao008,stao009,stao010,stao011,stao012,stao013,stao014,stao015,stao016,stao017,stao018,stao019,stao020,stao021)
                  VALUES (l_stah.stahent,g_stan_m.stan001,l_stah.stah002,l_stah.stah003,l_stah.stah004,l_stah.stah005,
                    l_stah.stah006,l_stah.stah007,l_stah.stah008,l_stah.stah009,l_stah.stah010,l_stah.stah011,l_stah.stah012,
                    l_stah.stah013,l_stah.stah014,l_stah.stah015,l_stah.stah016,g_stan_m.stan017,g_stan_m.stan018,l_stao019,l_stao020,l_stao021)
              
    END FOREACH 

    
   INSERT INTO stap_t(stapent,stap001,stap002,stap003,stap004,stap005,stap006)
   SELECT staient,g_stan_m.stan001,stai002,stai003,stai004,stai005,stai006
     FROM stai_t 
    WHERE staient =   g_enterprise AND stai001 = g_stan_m.stan004   
    

END FUNCTION
#+
PUBLIC FUNCTION astm301_staq003_ref()
   IF cl_null(g_stao2_d[l_ac].staq003) THEN
      LET g_stao2_d[l_ac].staq003_desc = ''
      DISPLAY BY NAME g_stao2_d[l_ac].staq003_desc
      RETURN 
   END IF

   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stao2_d[l_ac].staq003
   CALL ap_ref_array2(g_ref_fields,"SELECT rtaxl003 FROM rtaxl_t WHERE rtaxlent='"||g_enterprise||"' AND rtaxl001=? AND rtaxl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stao2_d[l_ac].staq003_desc = '', g_rtn_fields[1] , ''

   DISPLAY BY NAME g_stao2_d[l_ac].staq003_desc
END FUNCTION
#+
PUBLIC FUNCTION astm301_staq003_chk(p_staq003)
DEFINE p_staq003  LIKE staq_t.staq003
DEFINE l_sys      LIKE type_t.num5

   INITIALIZE g_chkparam.* TO NULL

   LET g_chkparam.arg1 = p_staq003
   CALL cl_get_para(g_enterprise,g_site,'E-CIR-0001') RETURNING l_sys
   LET g_chkparam.arg2 = l_sys
   
   #160318-00025#37  2016/04/19  by pengxin  add(S)
   LET g_errshow = TRUE #是否開窗 
   LET g_chkparam.err_str[1] = "ast-00215:sub-01302|arti202|",cl_get_progname("arti202",g_lang,"2"),"|:EXEPROGarti202"
   #160318-00025#37  2016/04/19  by pengxin  add(E)
   
   #呼叫檢查存在並帶值的library
   IF NOT cl_chk_exist("v_rtax001_2") THEN
      RETURN FALSE
   ELSE
      RETURN TRUE
   END IF

END FUNCTION
#+
PUBLIC FUNCTION astm301_stan013_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stan_m.stan013
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stan_m.stan013_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stan_m.stan013_desc
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan014_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stan_m.stan014
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stan_m.stan014_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stan_m.stan014_desc
END FUNCTION
#+
PUBLIC FUNCTION astm301_stan013_chk(p_stan013)
DEFINE p_stan013  LIKE stan_t.stan013
    
   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = p_stan013
   #LET g_chkparam.arg2 = '1'
   IF NOT cl_chk_exist("v_ooef001_1") THEN
      RETURN FALSE
   END IF
   RETURN TRUE

END FUNCTION
#+
PUBLIC FUNCTION astm301_stan014_chk(p_stan014)
DEFINE p_stan014  LIKE stan_t.stan014
DEFINE l_ooagstus LIKE ooag_t.ooagstus

   SELECT ooagstus INTO l_ooagstus FROM ooag_t
    WHERE ooagent = g_enterprise AND ooag001 = p_stan014
    
   IF status = 100 OR cl_null(l_ooagstus) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'aoo-00074'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   ELSE
      IF l_ooagstus = 'N' THEN
         INITIALIZE g_errparam TO NULL
#         LET g_errparam.code = 'aoo-00071'  #160318-00005#44  mark
         LET g_errparam.code = 'sub-01302'   #160318-00005#44  add
         LET g_errparam.extend = ''
         #160318-00005#44 --s add
         LET g_errparam.replace[1] = 'aooi130'
         LET g_errparam.replace[2] = cl_get_progname('aooi130',g_lang,"2")
         LET g_errparam.exeprog = 'aooi130'
         #160318-00005#44 --e add
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   RETURN TRUE
END FUNCTION
################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL astm301_default(p_stan002,p_stao003)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astm301_default(p_stan002,p_stao003)
DEFINE p_stan002 LIKE stan_t.stan002
DEFINE p_stao003 LIKE stao_t.stao003
DEFINE l_staf003 LIKE staf_t.staf003
DEFINE l_staf006 LIKE staf_t.staf006

    DECLARE sel_staf_d CURSOR FOR 
     SELECT staf003,staf006 FROM staf_t
      WHERE  stafent = g_enterprise AND staf001= p_stao003 AND staf002 = p_stan002
   FOREACH sel_staf_d INTO l_staf003,l_staf006
     
      CASE l_staf003
          WHEN 'stao004'
             LET g_stao_d[l_ac].stao004 = l_staf006
          WHEN 'stao005'
             IF NOT cl_null(l_staf006) THEN
                LET g_stao_d[l_ac].stao005 = l_staf006
             END IF
          WHEN 'stao006'
             LET g_stao_d[l_ac].stao006 = l_staf006
          WHEN 'stao007'
             LET g_stao_d[l_ac].stao007 = l_staf006
          WHEN 'stao008'
             LET g_stao_d[l_ac].stao008 = l_staf006
          WHEN 'stao009'
             LET g_stao_d[l_ac].stao009 = l_staf006
             CALL astm301_stao009_ref()
          WHEN 'stao010'
             LET g_stao_d[l_ac].stao010 = l_staf006
             CALL astm301_stao010_ref()
          WHEN 'stao011'
             LET g_stao_d[l_ac].stao011 = l_staf006
          WHEN 'stao012'
             LET g_stao_d[l_ac].stao012 = l_staf006
          WHEN 'stao013'
             LET g_stao_d[l_ac].stao013 = l_staf006
          WHEN 'stao014'
             LET g_stao_d[l_ac].stao014 = l_staf006
          WHEN 'stao015'
             LET g_stao_d[l_ac].stao015 = l_staf006
          WHEN 'stao016'
             LET g_stao_d[l_ac].stao016 = l_staf006
          WHEN 'stao017'
             LET g_stao_d[l_ac].stao017 = l_staf006
          WHEN 'stao018'
             LET g_stao_d[l_ac].stao018 = l_staf006
      END CASE

      IF NOT cl_null(g_stao_d[l_ac].stao007) AND NOT cl_null(g_stao_d[l_ac].stao008)  AND NOT cl_null(g_stao_d[l_ac].stao017) AND NOT cl_null(g_stao_d[l_ac].stao018) THEN    
          #CALL s_astm301_cal_nextd(g_stao_d[l_ac].stao007,g_stao_d[l_ac].stao008,g_stao_d[l_ac].stao017,g_stao_d[l_ac].stao018,'','') RETURNING g_stao_d[l_ac].stao019,g_stao_d[l_ac].stao020,g_stao_d[l_ac].stao021
      END IF

   END FOREACH 
   DISPLAY BY NAME g_stao_d[l_ac].stao004,g_stao_d[l_ac].stao005,g_stao_d[l_ac].stao006,
                  g_stao_d[l_ac].stao007,g_stao_d[l_ac].stao008,g_stao_d[l_ac].stao009,g_stao_d[l_ac].stao009_desc,
                  g_stao_d[l_ac].stao010,g_stao_d[l_ac].stao010_desc,g_stao_d[l_ac].stao011,g_stao_d[l_ac].stao012,
                  g_stao_d[l_ac].stao013,g_stao_d[l_ac].stao014,g_stao_d[l_ac].stao015,
                  g_stao_d[l_ac].stao016,g_stao_d[l_ac].stao017,g_stao_d[l_ac].stao018,g_stao_d[l_ac].stao019,g_stao_d[l_ac].stao020,g_stao_d[l_ac].stao021

   
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
PUBLIC FUNCTION astm301_stao009_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stao_d[l_ac].stao009
   CALL ap_ref_array2(g_ref_fields,"SELECT stabl003 FROM stabl_t WHERE stablent='"||g_enterprise||"' AND stabl001=? AND stabl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stao_d[l_ac].stao009_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stao_d[l_ac].stao009_desc
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
PUBLIC FUNCTION astm301_stao010_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stao_d[l_ac].stao010
   CALL ap_ref_array2(g_ref_fields,"SELECT stabl003 FROM stabl_t WHERE stablent='"||g_enterprise||"' AND stabl001=? AND stabl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stao_d[l_ac].stao010_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stao_d[l_ac].stao010_desc
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
PUBLIC FUNCTION astm301_stao017_018_chk()
DEFINE l_n  LIKE type_t.num5
   
   LET l_n = 0
   IF g_stao_d[l_ac].stao017 < g_stan_m.stan017 OR g_stao_d[l_ac].stao017 > g_stan_m.stan018 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00032'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF
   
   IF g_stao_d[l_ac].stao018 < g_stan_m.stan017 OR g_stao_d[l_ac].stao018 > g_stan_m.stan018 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00032'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF
   
   IF NOT cl_null(g_stao_d[l_ac].stao017) AND NOT cl_null(g_stao_d[l_ac].stao018) THEN
      IF g_stao_d[l_ac].stao017 > g_stao_d[l_ac].stao018 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aoo-00122'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   
   IF NOT cl_null(g_stao_d[l_ac].stao017) AND NOT cl_null(g_stao_d[l_ac].stao018) AND NOT cl_null(g_stao_d[l_ac].stao002) AND NOT cl_null(g_stao_d[l_ac].stao003)THEN
     SELECT COUNT(*) INTO l_n FROM stao_t 
      WHERE stao001 = g_stan_m.stan001
        AND stao003 = g_stao_d[l_ac].stao003
        AND stao002 <> g_stao_d[l_ac].stao002
        AND ((stao017 between g_stao_d[l_ac].stao017 AND g_stao_d[l_ac].stao018)
         OR (stao018 between g_stao_d[l_ac].stao017 AND g_stao_d[l_ac].stao018)
         OR (g_stao_d[l_ac].stao017 between stao017 AND stao018  )
         OR (g_stao_d[l_ac].stao018 between stao017 AND stao018  )) 
        AND staoent = g_enterprise  #160905-00007#15 by 08172         
   END IF      
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00031'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   ELSE
      RETURN TRUE 
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
PUBLIC FUNCTION astm301_stan017_018_chk(p_cmd,p_field)
DEFINE p_cmd       LIKE type_t.chr1
DEFINE p_field     STRING
DEFINE l_cnt       LIKE type_t.num5

   IF NOT cl_null(g_stan_m.stan017) AND NOT cl_null(g_stan_m.stan018) THEN
      IF g_stan_m.stan017 >g_stan_m.stan018 THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = 'aoo-00122'
          LET g_errparam.extend = ''
          LET g_errparam.popup = TRUE
          CALL cl_err()

          RETURN FALSE
      END IF
   END IF
   
     #判断生效日期，不可大于单身的生效日期
   IF p_field = 'stan017' THEN
      LET l_cnt = 0
      SELECT COUNT(*) INTO l_cnt
        FROM stao_t
       WHERE staoent = g_enterprise
         AND stao001 = g_stan_m.stan001
         AND stao017 < g_stan_m.stan017
      IF l_cnt > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00032'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   
   #判断失效日期，不可小于单身的失效日期
   IF p_field = 'stan018' THEN
      LET l_cnt = 0
      SELECT COUNT(*) INTO l_cnt
        FROM stao_t
       WHERE staoent = g_enterprise
         AND stao001 = g_stan_m.stan001
         AND stao018 > g_stan_m.stan018
      IF l_cnt > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00032'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF

  
   #如果生效/失效日期/结算方式有修改，自动算下次计算日

      IF NOT cl_null(g_stan_m.stan017) AND NOT cl_null(g_stan_m.stan018) AND NOT cl_null(g_stan_m.stan009) THEN
         IF cl_null(g_stan_m_o.stan017) OR 
            g_stan_m.stan017 <> g_stan_m_o.stan017 OR g_stan_m.stan018 <> g_stan_m_o.stan018 OR
            g_stan_m.stan009 <> g_stan_m_o.stan009 THEN
            
            LET g_stan_m.next_b = astm301_get_nextdate(g_stan_m.stan009,g_stan_m.stan017,g_stan_m.stan018)
         END IF
         DISPLAY g_stan_m.next_b TO next_b
         LET g_stan_m_o.stan017 = g_stan_m.stan017
         LET g_stan_m_o.stan018 = g_stan_m.stan018
         LET g_stan_m_o.stan009 = g_stan_m.stan009
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
PUBLIC FUNCTION astm301_stanunit_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stan_m.stanunit
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stan_m.stanunit_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stan_m.stanunit_desc
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
PUBLIC FUNCTION astm301_init_required(p_cmd)
DEFINE p_cmd   LIKE type_t.chr1
   CALL cl_set_comp_required("stao005,stao006,stao007,stao008,stao009,stao010,stao011,stao013,stao016,stao017,stao018",TRUE)
   CALL cl_set_comp_required("stao004,stao012,stao014,stao015",FALSE)
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
PUBLIC FUNCTION astm301_init_entry(p_cmd)
DEFINE p_cmd   LIKE type_t.chr1

   CALL cl_set_comp_entry("stao004,stao005,stao006,stao007,stao008,stao009,stao010,stao011,stao012,stao013,stao014,stao015,stao016,stao017,stao018",TRUE)
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
PUBLIC FUNCTION astm301_interval_chk(p_cmd)
DEFINE p_cmd     LIKE type_t.chr1
DEFINE l_n       LIKE type_t.num5

  
   IF p_cmd = 'a' OR p_cmd = 'r' THEN 
      SELECT COUNT(*) INTO l_n FROM stan_t
       WHERE stanent = g_enterprise AND stan002 = g_stan_m.stan002 
         AND stan005 = g_stan_m.stan005 
         AND (stan017 BETWEEN g_stan_m.stan017 AND g_stan_m.stan018
              OR stan018 BETWEEN g_stan_m.stan017 AND g_stan_m.stan018
              OR g_stan_m.stan017 BETWEEN stan017 AND stan018
              OR g_stan_m.stan018 BETWEEN stan017 AND stan018)
         AND stanstus = 'Y'
      
   ELSE
      SELECT COUNT(*) INTO l_n FROM stan_t
       WHERE stanent = g_enterprise AND stan002 = g_stan_m.stan002 
         AND stan005 = g_stan_m.stan005 
         AND (stan017 BETWEEN g_stan_m.stan017 AND g_stan_m.stan018
              OR stan018 BETWEEN g_stan_m.stan017 AND g_stan_m.stan018
              OR g_stan_m.stan017 BETWEEN stan017 AND stan018
              OR g_stan_m.stan018 BETWEEN stan017 AND stan018) 
         AND stan001 <>  g_stan_m.stan001
         AND stanstus = 'Y'         
   END IF
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00036'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
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
PUBLIC FUNCTION astm301_stan008_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stan_m.stan008
   CALL ap_ref_array2(g_ref_fields,"SELECT ooibl004 FROM ooibl_t WHERE ooiblent='"||g_enterprise||"' AND ooibl002=? AND ooibl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stan_m.stan008_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stan_m.stan008_desc
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
PUBLIC FUNCTION astm301_b_chk()
DEFINE l_n1        LIKE type_t.num5
DEFINE l_n2        LIKE type_t.num5

  #单身条件基准 和单头的结算类型不符合就报错
     SELECT COUNT(*) INTO l_n1 FROM stao_t 
       WHERE staoent = g_enterprise AND stao001 = g_stan_m.stan001 AND stao009 IS NOT NULL
         AND NOT EXISTS (SELECT 1 FROM stab_t LEFT OUTER JOIN stat_t ON stabent = statent AND stab001 = stat003
              WHERE stab001 = stao009 AND stat001 = g_stan_m.stan002 AND stat002 = g_stan_m.stan010)

    SELECT COUNT(*) INTO l_n2 FROM stcf_t 
       WHERE stcfent = g_enterprise AND stcf001 = g_stan_m.stan001 AND stao010 IS NOT NULL
         AND NOT EXISTS (SELECT 1 FROM stab_t LEFT OUTER JOIN stat_t ON stabent = statent AND stab001 = stat003
              WHERE stab001 = stao010 AND stat001 = g_stan_m.stan002 AND stat002 = g_stan_m.stan010) 
   
   IF l_n1 > 0 OR l_n2 > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00110'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
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
PRIVATE FUNCTION astm301_get_nextdate(p_stan009,p_date1,p_date2)
DEFINE p_stan009   LIKE stan_t.stan009
DEFINE p_date1     LIKE stan_t.stan017
DEFINE p_date2     LIKE stan_t.stan018
DEFINE r_nextdate  LIKE stan_t.stan017
DEFINE l_staa002   LIKE staa_t.staa002
DEFINE l_staa003   LIKE staa_t.staa003
DEFINE l_staa004   LIKE staa_t.staa004
DEFINE l_date      LIKE type_t.dat

   IF cl_null(p_stan009) OR cl_null(p_date1) OR cl_null(p_date2) THEN
      RETURN ''
   END IF
   
   SELECT staa002,staa003,staa004 INTO l_staa002,l_staa003,l_staa004
     FROM staa_t
    WHERE staa001 = p_stan009
      AND staaent = g_enterprise   #160905-00007#15 by 08172
   IF cl_null(l_staa002) THEN LET l_staa002 = 0 END IF
   IF cl_null(l_staa003) THEN LET l_staa003 = 0 END IF
   IF l_staa002 = 0 AND l_staa003 = 0 THEN RETURN '' END IF
   
   LET l_date = p_date1
   IF l_staa002 > 0 THEN
      IF l_staa004 = '1' THEN
         LET r_nextdate = s_date_get_date(p_date1,l_staa002,0)
      ELSE
         LET r_nextdate = s_date_get_date(p_date1,l_staa002-1,0)
      END IF
      LET l_date = r_nextdate
   END IF

   IF l_staa004 = '1' THEN
      LET r_nextdate = s_date_get_date(l_date,0,l_staa003-1)
   ELSE
      IF l_staa003 > 0 THEN
         LET r_nextdate = s_date_get_date(l_date,0,l_staa003-1)
      END IF
   END IF
   IF l_staa004 = '2' THEN
      LET r_nextdate = s_date_get_last_date(r_nextdate)   
   END IF
   IF r_nextdate > p_date2 THEN LET r_nextdate = p_date2 END IF
   RETURN r_nextdate
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
PRIVATE FUNCTION astm301_upd_stax(p_cmd)
DEFINE p_cmd       LIKE type_t.chr1
DEFINE r_success   LIKE type_t.num5
DEFINE l_cnt       LIKE type_t.num5
DEFINE l_stan009   LIKE stan_t.stan009
DEFINE l_stan017   LIKE stan_t.stan017
DEFINE l_stan018   LIKE stan_t.stan018
DEFINE l_stax004   LIKE stax_t.stax004

   LET r_success = TRUE
   #如果结算方式、生失效日期、下次计算日有异动才提示是否删除为结算帐期，重新产生帐期
 
   IF p_cmd = 'u'  THEN
      IF g_stan_m.stan009 <> g_stan_m_t.stan009 OR g_stan_m.stan017 <> g_stan_m_t.stan017 OR 
         g_stan_m.stan018 <> g_stan_m_t.stan018 OR g_stan_m.next_b <> g_stan_m_t.next_b THEN
         LET l_cnt = 0
         SELECT COUNT(*) INTO l_cnt FROM stax_t
          WHERE staxent = g_enterprise AND stax001 = g_stan_m.stan001
            AND stax005 = 'Y'
         IF l_cnt > 0 THEN
            IF NOT cl_ask_confirm('ast-00097') THEN
               LET r_success = FALSE
            END IF
         ELSE
            IF NOT cl_ask_confirm('ast-00146') THEN
               LET r_success = FALSE
            END IF
         END IF
      ELSE
         #没有变，不用更新单身帐期
         RETURN TRUE
      END IF
   END IF
   
   IF r_success THEN
      IF NOT s_astm301_cal_period(g_stan_m.stan001,g_stan_m.stan017,g_stan_m.stan018,g_stan_m.stan009,g_stan_m.next_b,g_stan_m.stanunit,g_stan_m.stanunit) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00049'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF
   
   IF r_success = FALSE THEN
      LET g_stan_m.stan009 = g_stan_m_t.stan009
      LET g_stan_m.stan017 = g_stan_m_t.stan017
      LET g_stan_m.stan018 = g_stan_m_t.stan018
      LET g_stan_m.next_b = g_stan_m_t.next_b     
   ELSE
      CALL astm301_b_fill()
   END IF
   DISPLAY BY NAME g_stan_m.stan009,g_stan_m.stan017,g_stan_m.stan018,g_stan_m.next_b
   RETURN r_success
      
END FUNCTION

################################################################################
# Descriptions...: 取供應商帳務資料
# Memo...........:
# Usage..........: CALL astm301_stan005_other()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2015/05/23 By sakura #150506-00007#4
# Modify.........:
################################################################################
PRIVATE FUNCTION astm301_stan005_other()
DEFINE l_stan006   LIKE stan_t.stan006  #幣別   
DEFINE l_stan007   LIKE stan_t.stan007  #稅別
DEFINE l_stan008   LIKE stan_t.stan008  #付款方式
DEFINE l_stan022   LIKE stan_t.stan022  #交易條件
DEFINE l_stan023   LIKE stan_t.stan023  #發票類型
DEFINE l_stan027   LIKE stan_t.stan027  #內外購
DEFINE l_stan028   LIKE stan_t.stan028  #匯率計算基準
   
   SELECT pmab033,pmab034,pmab037,pmab053,pmab056,pmab057,pmab058
     INTO l_stan006,l_stan007,l_stan008,l_stan022,
          l_stan023,l_stan027,l_stan028
     FROM pmab_t
    WHERE pmabent = g_enterprise AND pmab001 = g_stan_m.stan005
    
    IF cl_null(g_stan_m.stan006) THEN
       LET g_stan_m.stan006 = l_stan006
    END IF
    IF cl_null(g_stan_m.stan007) THEN
       LET g_stan_m.stan007 = l_stan007
    END IF
    IF cl_null(g_stan_m.stan008) THEN
       LET g_stan_m.stan008 = l_stan008
    END IF
    LET g_stan_m.stan022 = l_stan022  
    LET g_stan_m.stan023 = l_stan023
    LET g_stan_m.stan027 = l_stan027
    LET g_stan_m.stan028 = l_stan028
    
    DISPLAY BY NAME g_stan_m.stan006,g_stan_m.stan007,g_stan_m.stan008,
                    g_stan_m.stan022,g_stan_m.stan023,g_stan_m.stan027,
                    g_stan_m.stan028
                    
    CALL astm301_stan006_ref()
    CALL astm301_stan007_ref()
    CALL astm301_stan008_ref()
    
    CALL s_desc_get_acc_desc('238',g_stan_m.stan022) 
      RETURNING g_stan_m.stan022_desc
    DISPLAY BY NAME g_stan_m.stan022_desc 
    CALL s_desc_get_invoice_type_desc1(g_site,g_stan_m.stan023) 
      RETURNING g_stan_m.stan023_desc
    DISPLAY BY NAME g_stan_m.stan023_desc
    
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
PRIVATE FUNCTION astm301_set_visible(p_ac)
DEFINE  p_ac    LIKE type_t.num5

    IF g_stao_d[p_ac].stao022 = '0' THEN
       CALL cl_set_comp_visible('group_6',FALSE)
    ELSE
       CALL cl_set_comp_visible('group_6',TRUE)
       IF g_stao_d[p_ac].stao022 = '1' THEN 
          CALL cl_set_comp_visible('s_detail5',TRUE)
          CALL cl_set_comp_visible('s_detail6',FALSE)       
       END IF
       IF g_stao_d[p_ac].stao022 = '2' THEN 
          CALL cl_set_comp_visible('s_detail5',FALSE)
          CALL cl_set_comp_visible('s_detail6',TRUE)       
       END IF
       IF g_stao_d[p_ac].stao022 = '3' THEN 
          CALL cl_set_comp_visible('s_detail5',TRUE)
          CALL cl_set_comp_visible('s_detail6',TRUE)       
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
PRIVATE FUNCTION astm301_stao025_ref()
   SELECT rtaxl003 INTO g_stao_d[l_ac].stao025_desc
    FROM rtaxl_t
   WHERE rtaxlent = g_enterprise AND rtaxl001 = g_stao_d[l_ac].stao025 AND rtaxl002 = g_dlang
   
   DISPLAY BY NAME g_stao_d[l_ac].stao025_desc
END FUNCTION

################################################################################
# Descriptions...: 文本蓋章
# Memo...........:
# Usage..........: CALL astm301_01()
# Input parameter: 無
# Return code....: 無
# Date & Author..: 2015/10/13 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astm301_01()

   IF g_stan_m.stan034 = 'Y' THEN 
      RETURN 
   END IF 
   CALL cl_set_comp_entry('stan035,stan036',FALSE)
   INPUT BY NAME g_stan_m.stan034,g_stan_m.stan035,g_stan_m.stan036
         ATTRIBUTE(WITHOUT DEFAULTS)
         
      ON CHANGE stan034
         IF g_stan_m.stan034 = 'Y' THEN 
            CALL cl_set_comp_entry('stan035,stan036',TRUE)
         ELSE
            LET g_stan_m.stan035 = ''
            LET g_stan_m.stan036 = ''
            CALL cl_set_comp_entry('stan035,stan036',FALSE)
         END IF 
         
      ON ACTION accept
         ACCEPT INPUT
 
      ON ACTION cancel
         LET INT_FLAG = 1
         EXIT INPUT 
         
      AFTER INPUT 
         UPDATE stan_t SET stan034 = g_stan_m.stan034,
                           stan035 = g_stan_m.stan035,
                           stan036 = g_stan_m.stan036
          WHERE stanent = g_enterprise
            AND stan001 = g_stan_m.stan001
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'upd stan_t'
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN 
      END IF
   END INPUT
   IF INT_FLAG THEN 
      LET g_stan_m.stan034 = g_stan_m_t.stan034
      LET g_stan_m.stan035 = g_stan_m_t.stan035
      LET g_stan_m.stan036 = g_stan_m_t.stan036
   END IF 
   DISPLAY BY NAME g_stan_m.stan034,g_stan_m.stan035,g_stan_m.stan036
END FUNCTION

 
{</section>}
 
