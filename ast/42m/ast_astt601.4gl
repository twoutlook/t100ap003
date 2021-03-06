#該程式已解開Section, 不再透過樣板產出!
{<section id="astt601.description" >}
#+ Version..: T100-ERP-1.00.00(版次:1) Build-000183
#+ 
#+ Filename...: astt601
#+ Description: 自營合約異動申請單
#+ Creator....: 01533(2013/10/21)
#+ Modifier...: 01533(2013/11/08)
#+ Buildtype..: 應用 t01 樣板自動產生
#+ 以上段落由子樣板a00產生
 
{</section>}
 
{<section id="astt601.global" >}

    
IMPORT os
IMPORT util
IMPORT FGL lib_cl_dlg
#add-point:增加匯入項目
#160318-00005#44  2016/03/24  By pengxin     修正azzi920重复定义之错误讯息
#160318-00025#38  2016/04/20  By pengxin     將重複內容的錯誤訊息置換為公用錯誤訊息(r.v)
#160513-00033#7   2016/05/24  By 02097       增加现金返利
#160606-00028#1   2016/06/06  By 02097       配合stae006已经不使用取消控卡
#160818-00017#40 2016-08-23   By 08734       删除修改未重新判断状态码
#160905-00007#17 2016-09-05   By08734        ent调整
#160913-00022#1   2016/09/14  By 06814       相關經銷商頁籤維護值,需控卡不可與單頭的經銷商相同
#161024-00025#4   2016/10/24  by 08172       组织调整
#161024-00025#3   2016/10/26  By dongsz      stca026开窗替换q_ooef001_24,条件ooef201=Y
#161108-00016#1   2016/11/09  by 08742       修改 g_browser_cnt 定义大小
#161111-00028#3   2016/11/16  by 02481       标准程式定义采用宣告模式,弃用.*写法
#161214-00032#1   2016/12/15  by 07900       石狮通达权限设置.freestyle或者是改过section者,需检核规格【资料表关联设定】主表要跟现在程序主表一致;主sql部分要补上cl_sql_add_filter
#170222-00018#1   2017/02/22  By 02111       將 stabent = 99 改為 stabent = g_enterprise。
#end add-point
 
SCHEMA ds 
 
GLOBALS "../../cfg/top_global.inc"
 
{<Module define>}
 
#單頭 type 宣告
PRIVATE type type_g_stca_m        RECORD
       stca000 LIKE stca_t.stca000, 
   stcadocno LIKE stca_t.stcadocno, 
   stcadocdt LIKE stca_t.stcadocdt, 
   stca005 LIKE stca_t.stca005, 
   stca001 LIKE stca_t.stca001, 
   stca002 LIKE stca_t.stca002, 
   stca003 LIKE stca_t.stca003,  
   stca004 LIKE stca_t.stca004, 
   stca004_desc LIKE type_t.chr80, 
   stca009 LIKE stca_t.stca009, 
   stca009_desc LIKE type_t.chr80,
   stca010 LIKE stca_t.stca010,
   stca010_desc LIKE type_t.chr80,
   stca011 LIKE stca_t.stca011,
   stca011_desc LIKE type_t.chr80, 
   stca012 LIKE stca_t.stca012,
   stca012_desc LIKE type_t.chr80,
   stca008 LIKE stca_t.stca008,  
   stca027 LIKE stca_t.stca027,   
   stca021 LIKE stca_t.stca021, 
   stca021_desc LIKE type_t.chr80, 
   stca022 LIKE stca_t.stca022, 
   stca022_desc LIKE type_t.chr80, 
   stca023 LIKE stca_t.stca023, 
   stca023_desc LIKE type_t.chr80, 
   stca006 LIKE stca_t.stca006, 
   stca006_desc LIKE type_t.chr80, 
   stca007 LIKE stca_t.stca007, 
   stca007_desc LIKE type_t.chr80, 
   stca024 LIKE stca_t.stca024, 
   stca024_desc LIKE type_t.chr80,
   stca028 LIKE stca_t.stca028,
   stca028_desc LIKE type_t.chr80,   
   stca025 LIKE stca_t.stca025, 
   stca025_desc LIKE type_t.chr80,
   stca026 LIKE stca_t.stca025, 
   stca026_desc LIKE type_t.chr80,    
   stcaacti LIKE stca_t.stcaacti, 
   stca013 LIKE stca_t.stca013, 
   stca014 LIKE stca_t.stca014, 
   stca014_desc LIKE type_t.chr80, 
   stca015 LIKE stca_t.stca015, 
   stca015_desc LIKE type_t.chr80,
   stca016 LIKE stca_t.stca016, 
   stca016_desc LIKE type_t.chr80,    
   stca017 LIKE stca_t.stca017, 
   stca018 LIKE stca_t.stca018, 
   stca019 LIKE stca_t.stca019, 
   stca020 LIKE stca_t.stca020,
   next_b  LIKE type_t.dat,
   ooff013 LIKE type_t.chr1000,     
   stcasite LIKE stca_t.stcasite, 
   stcasite_desc LIKE type_t.chr80, 
   stcaunit LIKE stca_t.stcaunit, 
   stcastus LIKE stca_t.stcastus, 
   stcaownid LIKE stca_t.stcaownid, 
   stcaownid_desc LIKE type_t.chr80, 
   stcaowndp LIKE stca_t.stcaowndp, 
   stcaowndp_desc LIKE type_t.chr80, 
   stcacrtid LIKE stca_t.stcacrtid, 
   stcacrtid_desc LIKE type_t.chr80, 
   stcacrtdp LIKE stca_t.stcacrtdp, 
   stcacrtdp_desc LIKE type_t.chr80, 
   stcacrtdt DATETIME YEAR TO SECOND, 
   stcamodid LIKE stca_t.stcamodid, 
   stcamodid_desc LIKE type_t.chr80, 
   stcamoddt DATETIME YEAR TO SECOND, 
   stcacnfid LIKE stca_t.stcacnfid, 
   stcacnfid_desc LIKE type_t.chr80, 
   stcacnfdt DATETIME YEAR TO SECOND
       END RECORD
 
#單身 type 宣告
PRIVATE TYPE type_g_stcb_d        RECORD
       stcbseq LIKE stcb_t.stcbseq, 
   stcb002 LIKE stcb_t.stcb002, 
   stcb002_desc LIKE type_t.chr500, 
   stcb021 LIKE stcb_t.stcb021,  #160513-00033#7
   stcb003 LIKE stcb_t.stcb003, 
   stcb004 LIKE stcb_t.stcb004, 
   stcb005 LIKE stcb_t.stcb005, 
   stcb006 LIKE stcb_t.stcb006, 
   stcb007 LIKE stcb_t.stcb007, 
   stcb008 LIKE stcb_t.stcb008, 
   stcb008_desc LIKE type_t.chr500, 
   stcb009 LIKE stcb_t.stcb009, 
   stcb009_desc LIKE type_t.chr500, 
   stcb010 LIKE stcb_t.stcb010, 
   stcb011 LIKE stcb_t.stcb011, 
   stcb012 LIKE stcb_t.stcb012, 
   stcb013 LIKE stcb_t.stcb013, 
   stcb014 LIKE stcb_t.stcb014, 
   stcb015 LIKE stcb_t.stcb015, 
   stcb016 LIKE stcb_t.stcb016, 
   stcb017 LIKE stcb_t.stcb017, 
   stcb018 LIKE stcb_t.stcb018, 
   stcb019 LIKE stcb_t.stcb019,
   stcb020 LIKE stcb_t.stcb020,
   stcbunit LIKE stcb_t.stcbunit, 
   stcbsite LIKE stcb_t.stcbsite
       END RECORD
PRIVATE TYPE type_g_stcb2_d RECORD
       stcdseq LIKE stcd_t.stcdseq, 
   stcd002 LIKE stcd_t.stcd002, 
   stcd002_desc LIKE type_t.chr500, 
   stcd003 LIKE stcd_t.stcd003, 
   stcdunit LIKE stcd_t.stcdunit, 
   stcdsite LIKE stcd_t.stcdsite
       END RECORD
 
 
 
#模組變數(Module Variables)
DEFINE g_stca_m          type_g_stca_m
DEFINE g_stca_m_t        type_g_stca_m
 
   DEFINE g_stcadocno_t LIKE stca_t.stcadocno
 
 
DEFINE g_stcb_d          DYNAMIC ARRAY OF type_g_stcb_d
DEFINE g_stcb_d_t        type_g_stcb_d
DEFINE g_stcb2_d   DYNAMIC ARRAY OF type_g_stcb2_d
DEFINE g_stcb2_d_t type_g_stcb2_d
 
 
 
DEFINE g_browser    DYNAMIC ARRAY OF RECORD    #資料瀏覽之欄位 
         b_statepic     LIKE type_t.chr50,
            b_stcadocno LIKE stca_t.stcadocno,
      b_stcadocdt LIKE stca_t.stcadocdt,
      b_stca000 LIKE stca_t.stca000,
      b_stca001 LIKE stca_t.stca001,
      b_stca005 LIKE stca_t.stca005,
      b_stca002 LIKE stca_t.stca002,
      b_stca004 LIKE stca_t.stca004,
      b_stca009 LIKE stca_t.stca009,
      b_stca021 LIKE stca_t.stca021,
      b_stca022 LIKE stca_t.stca022,
      b_stca023 LIKE stca_t.stca023,
      b_stca006 LIKE stca_t.stca006,
      b_stca007 LIKE stca_t.stca007,
      b_stca008 LIKE stca_t.stca008,
      b_stca013 LIKE stca_t.stca013,
      b_stca014 LIKE stca_t.stca014,
      b_stca015 LIKE stca_t.stca015,
      b_stca024 LIKE stca_t.stca024,
      b_stca025 LIKE stca_t.stca025,
      b_stca017 LIKE stca_t.stca017,
      b_stca018 LIKE stca_t.stca018,
      b_stca019 LIKE stca_t.stca019,
      b_stca020 LIKE stca_t.stca020,
      b_stca003 LIKE stca_t.stca003,
      b_stcasite LIKE stca_t.stcasite,
      b_stcaacti LIKE stca_t.stcaacti
         #,rank           LIKE type_t.num10
      END RECORD 
      
DEFINE g_browser_f  RECORD    #資料瀏覽之欄位 
         b_statepic     LIKE type_t.chr50,
            b_stcadocno LIKE stca_t.stcadocno,
      b_stcadocdt LIKE stca_t.stcadocdt,
      b_stca000 LIKE stca_t.stca000,
      b_stca001 LIKE stca_t.stca001,
      b_stca005 LIKE stca_t.stca005,
      b_stca002 LIKE stca_t.stca002,
      b_stca004 LIKE stca_t.stca004,
      b_stca009 LIKE stca_t.stca009,
      b_stca021 LIKE stca_t.stca021,
      b_stca022 LIKE stca_t.stca022,
      b_stca023 LIKE stca_t.stca023,
      b_stca006 LIKE stca_t.stca006,
      b_stca007 LIKE stca_t.stca007,
      b_stca008 LIKE stca_t.stca008,
      b_stca013 LIKE stca_t.stca013,
      b_stca014 LIKE stca_t.stca014,
      b_stca015 LIKE stca_t.stca015,
      b_stca024 LIKE stca_t.stca024,
      b_stca025 LIKE stca_t.stca025,
      b_stca017 LIKE stca_t.stca017,
      b_stca018 LIKE stca_t.stca018,
      b_stca019 LIKE stca_t.stca019,
      b_stca020 LIKE stca_t.stca020,
      b_stca003 LIKE stca_t.stca003,
      b_stcasite LIKE stca_t.stcasite,
      b_stcaacti LIKE stca_t.stcaacti
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
    
#DEFINE g_pagestart           LIKE type_t.num5             #page起始筆數#161108-00016#1   2016/11/09  by 08742 mark 
DEFINE g_pagestart           LIKE type_t.num10             #page起始筆數#161108-00016#1   2016/11/09  by 08742 add           
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
                                                        
#DEFINE g_current_row         LIKE type_t.num5  #Browser 所在筆數(暫存用) #161108-00016#1   2016/11/09  by 08742 mark
DEFINE g_current_row         LIKE type_t.num10  #Browser 所在筆數(暫存用) #161108-00016#1   2016/11/09  by 08742 add
DEFINE g_current_sw          BOOLEAN                       #Browser所在筆數用開關
#DEFINE g_current_page        LIKE type_t.num5             #目前所在頁數 #161108-00016#1   2016/11/09  by 08742 mark
DEFINE g_current_page        LIKE type_t.num10             #目前所在頁數 #161108-00016#1   2016/11/09  by 08742 add
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
 TYPE type_g_stcc_d        RECORD
    stccseq2 LIKE stcc_t.stccseq2, 
    stcc002 LIKE stcc_t.stcc002, 
    stcc003 LIKE stcc_t.stcc003, 
    stcc004 LIKE stcc_t.stcc004
       END RECORD
DEFINE g_stcc_d        DYNAMIC ARRAY OF type_g_stcc_d  
DEFINE g_stcc_d_t      type_g_stcc_d
DEFINE l_ac3           LIKE type_t.num5
DEFINE g_rec_b3        LIKE type_t.num5
DEFINE g_detail_idx3   LIKE type_t.num5
DEFINE g_wc2_table3          STRING
DEFINE g_ooef004      LIKE ooef_t.ooef004
DEFINE g_ooef005      LIKE ooef_t.ooef005
DEFINE g_assign_no    LIKE type_t.chr1
DEFINE g_stcb_d_o        type_g_stcb_d

TYPE type_g_stcv_d        RECORD
    stcvsite LIKE stcv_t.stcvsite,
    stcvunit LIKE stcv_t.stcvunit,
    stcvseq LIKE stcv_t.stcvseq, 
    stcv002 LIKE stcv_t.stcv002, 
    stcv003 LIKE stcv_t.stcv003, 
    stcv004 LIKE stcv_t.stcv004,
    stcv005 LIKE stcv_t.stcv005,
    stcv006 LIKE stcv_t.stcv006
       END RECORD
DEFINE g_stcv_d        DYNAMIC ARRAY OF type_g_stcv_d  
DEFINE g_stcv_d_t      type_g_stcv_d

DEFINE g_wc2_table4          STRING 
DEFINE g_flag          LIKE type_t.num5

DEFINE g_stca_m_o        type_g_stca_m
DEFINE  g_stcv003             LIKE stcv_t.stcv003 #用于判断是否已经有结算
DEFINE  t_stca           type_g_stca_m
DEFINE g_site_flag           LIKE type_t.num5 #ken---add
#160513-00033#7--(S)
 TYPE type_g_stck_d        RECORD
   stckseq LIKE stck_t.stckseq,    
   stck002 LIKE stck_t.stck002, 
   stck002_desc LIKE type_t.chr500, 
   stck003 LIKE stck_t.stck003, 
   imaal003 LIKE imaal_t.imaal003,
   imaal004 LIKE imaal_t.imaal004,
   stck004 LIKE stck_t.stck004, 
   stck005 LIKE stck_t.stck005, 
   stck006 LIKE stck_t.stck006, 
   stck007 LIKE stck_t.stck007, 
   stck008 LIKE stck_t.stck008, 
   stck009 LIKE stck_t.stck009, 
   stck010 LIKE stck_t.stck010, 
   stck010_desc LIKE type_t.chr500,
   stck011 LIKE stck_t.stck011, 
   stck012 LIKE stck_t.stck012, 
   stck013 LIKE stck_t.stck013, 
   stck014 LIKE stck_t.stck014, 
   stck014_desc LIKE type_t.chr500,
   stcksite LIKE stck_t.stcksite,
   stckunit LIKE stck_t.stckunit,
   stck001 LIKE stck_t.stck001
       END RECORD
DEFINE g_stck_d          DYNAMIC ARRAY OF type_g_stck_d
DEFINE g_stck_d_t        type_g_stck_d
DEFINE g_stck_d_o        type_g_stck_d
DEFINE g_wc2_table5      STRING
DEFINE l_ac5             LIKE type_t.num5
DEFINE g_rec_b5          LIKE type_t.num5
DEFINE g_detail_idx5     LIKE type_t.num5
 TYPE type_g_stct_d        RECORD
   stctseq LIKE stct_t.stctseq, 
   stct001 LIKE stct_t.stct001, 
   stct001_desc LIKE type_t.chr500,
   stctsite LIKE stct_t.stctsite,
   stctunit LIKE stct_t.stctunit
       END RECORD
DEFINE g_stct_d          DYNAMIC ARRAY OF type_g_stct_d
DEFINE g_stct_d_t        type_g_stct_d
DEFINE g_stct_d_o        type_g_stct_d
DEFINE g_wc2_table6      STRING
DEFINE l_ac6             LIKE type_t.num5
DEFINE g_rec_b6          LIKE type_t.num5
DEFINE g_detail_idx6     LIKE type_t.num5
#160513-00033#7--(E)
#end add-point
 
#add-point:傳入參數說明

#end add-point
 
{</section>}
 
{<section id="astt601.main" >}
#test
#+ 此段落由子樣板a26產生
#OPTIONS SHORT CIRCUIT
#+ 作業開始 
MAIN
   #add-point:main段define
   DEFINE l_success LIKE type_t.num5  
   DEFINE l_para_data LIKE type_t.chr80 #150424-00018#2 15/05/28 by s983961 add
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
#160323-00006#1 2016/03/24 申请流程无须由参数控制(S)
#   #150424-00018#2 15/05/28 by s983961 add(s)  
#   CALL cl_get_para(g_enterprise,g_site,'E-CIR-0021') RETURNING l_para_data
#   IF l_para_data='N' THEN      
#     INITIALIZE g_errparam TO NULL
#     LET g_errparam.code = 'ast-00430'
#     LET g_errparam.extend = ''
#     LET g_errparam.popup = TRUE
#     CALL cl_err()      
#     CALL cl_ap_exitprogram("0")
#   END IF  
#   #150424-00018#2 15/05/28 by s983961 add(e) 
#160323-00006#1 2016/03/24 申请流程无须由参数控制(E)
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define
      
   #end add-point
   LET g_forupd_sql = "SELECT stca000,stcadocno,stcadocdt,stca005,stca001,stca002,stca003, stca004, 
       '',stca009,'',stca021,'',stca022,'',stca023,'',stca006,'',stca007,'',stca024,'',stca025,'',stca008, 
       stcaacti,stca013,stca014,'',stca015,'',stca017,stca018,stca019,stca020,stcasite,'',stcaunit,stcastus, 
       stcaownid,'',stcaowndp,'',stcacrtid,'',stcacrtdp,'',stcacrtdt,stcamodid,'',stcamoddt,stcacnfid, 
       '',stcacnfdt FROM stca_t WHERE stcaent= ? AND stcadocno=? FOR UPDATE"
   #add-point:SQL_define
 
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)                #轉換不同資料庫語法
   DECLARE astt601_cl CURSOR FROM g_forupd_sql                 # LOCK CURSOR
 
   IF g_bgjob = "Y" THEN
 
      #add-point:Service Call
            
      #end add-point
 
   ELSE
      
      #畫面開啟 (identifier)
      OPEN WINDOW w_astt601 WITH FORM cl_ap_formpath("ast",g_code)
   
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
   
      #程式初始化
      CALL astt601_init()   
 
      #進入選單 Menu (="N")
      CALL astt601_ui_dialog() 
	  
      #add-point:畫面關閉前
      CALL s_aooi500_drop_temp() RETURNING l_success      
      #end add-point
 
      #畫面關閉
      CLOSE WINDOW w_astt601
      
   END IF 
   
   CLOSE astt601_cl
   
   
 
   #add-point:作業離開前
   CALL s_aooi390_drop_tmp_table()   #add--2015/03/20 By shiun
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
   
END MAIN
 
 
 
{</section>}
 
{<section id="astt601.init" >}
#+ 瀏覽頁簽資料初始化
PRIVATE FUNCTION astt601_init()
   #add-point:init段define
   DEFINE l_success LIKE type_t.num5   
   DEFINE l_ecir0064 LIKE type_t.chr1     #160513-00033#7
   #end add-point    
   
   LET g_bfill       = "Y"
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   LET g_error_show  = 1
 
   CALL cl_set_combo_scc_part('stcastus','13','N,X,Y,A,D,R,W')
 
      CALL cl_set_combo_scc('stca000','32') 
   CALL cl_set_combo_scc('stca005','6013') 
   CALL cl_set_combo_scc('stcb004','6006') 
   CALL cl_set_combo_scc('stcb005','6007') 
   CALL cl_set_combo_scc('stcb006','6008') 
   CALL cl_set_combo_scc('stcb007','6009') 
   CALL cl_set_combo_scc('stcb012','6010') 
   CALL cl_set_combo_scc('stcb015','6011') 
 
   LET gwin_curr = ui.Window.getCurrent()  #取得現行畫面
   LET gfrm_curr = gwin_curr.getForm()     #取出物件化後的畫面物件
 
   #add-point:畫面資料初始化
   CALL cl_set_combo_scc('b_stca000','32') 
   CALL cl_set_combo_scc_part('b_stca005','6013',"11,12,13")
   CALL cl_set_combo_scc_part('stcb004','6006',"1,2") 
   CALL cl_set_combo_scc_part('stca005','6013',"11,12,13") 
   
   LET g_ooef004 = ''
   LET g_ooef005 = ''
   SELECT ooef004,ooef005 INTO g_ooef004,g_ooef005 FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_site
   IF cl_null(g_ooef004) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'art-00007'
      LET g_errparam.extend = g_site
      LET g_errparam.popup = TRUE
      CALL cl_err()

   END IF 
   IF cl_null(g_ooef005) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'art-00008'
      LET g_errparam.extend = g_site
      LET g_errparam.popup = TRUE
      CALL cl_err()

   END IF
   CALL cl_set_comp_visible("b_stca008",FALSE) 
   CALL s_aooi500_create_temp() RETURNING l_success
   #160513-00033#7--(S)
   CALL cl_get_para(g_enterprise,'','E-CIR-0064') RETURNING l_ecir0064 
   CALL cl_set_combo_scc('stck004','6096')
   CALL cl_set_combo_scc('stck005','6097')
   CALL cl_set_combo_scc('stck011','6098')
   IF l_ecir0064 = '1' THEN      #E-CIR-0064:'1.依单据'     
      CALL cl_set_comp_visible('stck003,imaal003,imaal004',FALSE)  #依单据隐藏商品
   ELSE
      CALL cl_set_comp_visible('stck002,stck002_desc',FALSE)       #依商品隐藏摘要
   END IF
   #160513-00033#7--(E)
   #end add-point
   
   CALL astt601_default_search()
    
END FUNCTION
 
{</section>}
 
{<section id="astt601.ui_dialog" >}
#+ 功能選單
PRIVATE FUNCTION astt601_ui_dialog()
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
        
  # IF cl_get_para(g_enterprise,g_site,"E-CIR-0021") = 'N' THEN
  #    INITIALIZE g_errparam TO NULL
  #    LET g_errparam.extend = ""
  #    LET g_errparam.code   = 'ast-00222'
  #    LET g_errparam.popup  = TRUE
  #    CALL cl_err()
  #    RETURN
  # END IF     
   #end add-point
   
   WHILE TRUE 
   
      CALL astt601_browser_fill("")
      CALL lib_cl_dlg.cl_dlg_before_display()
      CALL cl_notice()
            
      #判斷前一個動作是否為新增, 若是的話切換到新增的筆數
      IF g_state = "Y" THEN
         FOR li_idx = 1 TO g_browser.getLength()
            IF g_browser[li_idx].b_stcadocno = g_stcadocno_t
 
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
               
               CALL astt601_fetch('') # reload data
               LET l_ac = 1
               CALL astt601_ui_detailshow() #Setting the current row 
      
               CALL astt601_idx_chk()
               #NEXT FIELD stcbseq
         
         END DISPLAY
        
         DISPLAY ARRAY g_stcb_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b) #page1  
    
            BEFORE ROW
               CALL astt601_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_detail_idx = l_ac
               
               #add-point:page1, before row動作
                                             CALL astt601_b3_fill()
               CALL astt601_reflesh()
               #end add-point
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail1")
               LET g_current_page = 1
               CALL astt601_idx_chk()
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
                        CALL cl_cmdrun_wait("asti203")                        
                        #END add-point
                        
                     END IF
 
 
                  ON ACTION asti205
 
                     LET g_action_choice="asti205"
                     IF cl_auth_chk_act("asti205") THEN 
                        #add-point:ON ACTION asti205
                        CALL cl_cmdrun_wait("asti205")                          
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
        
         DISPLAY ARRAY g_stcb2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               CALL astt601_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_detail_idx = l_ac
               
               #add-point:page2, before row動作
                              
               #end add-point
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail2")
               LET g_current_page = 2
               CALL astt601_idx_chk()
               #add-point:page2自定義行為
                              
               #end add-point
      
            #自訂ACTION(detail_show,page_2)
            
         
            #add-point:page2自定義行為
                        
            #end add-point
         
         END DISPLAY
 
 
         
         #add-point:ui_dialog段自定義display array
          DISPLAY ARRAY g_stcc_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b3) #page1      
            BEFORE ROW
               CALL astt601_idx_chk()
               LET l_ac3 = DIALOG.getCurrentRow("s_detail3")
               LET g_detail_idx3 = l_ac3
               
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx3)
               LET l_ac3 = DIALOG.getCurrentRow("s_detail3")
               CALL astt601_idx_chk()
               LET g_current_page = 3
               
            
         END DISPLAY 
         
         
        DISPLAY ARRAY g_stcv_d TO s_detail4.* ATTRIBUTES(COUNT=g_rec_b)  
    
            BEFORE ROW
               CALL astt601_idx_chk()
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
               LET g_detail_idx = l_ac
               
                           
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx)
               LET l_ac = DIALOG.getCurrentRow("s_detail4")
               LET g_current_page = 4
               CALL astt601_idx_chk()
   
   
         END DISPLAY
         #160513-00033#7--(S)
         DISPLAY ARRAY g_stck_d TO s_detail5.* ATTRIBUTES(COUNT=g_rec_b5)
    
            BEFORE ROW
               CALL astt601_idx_chk()
               LET l_ac3 = DIALOG.getCurrentRow("s_detail5")
               LET g_detail_idx5 = l_ac5
               
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx5)
               LET l_ac3 = DIALOG.getCurrentRow("s_detail5")
               CALL astt601_idx_chk()
               LET g_current_page = 5
               
               
         END DISPLAY

         DISPLAY ARRAY g_stct_d TO s_detail6.* ATTRIBUTES(COUNT=g_rec_b6)
    
            BEFORE ROW
               CALL astt601_idx_chk()
               LET l_ac3 = DIALOG.getCurrentRow("s_detail6")
               LET g_detail_idx6 = l_ac6
               
               
            BEFORE DISPLAY
               CALL FGL_SET_ARR_CURR(g_detail_idx5)
               LET l_ac3 = DIALOG.getCurrentRow("s_detail6")
               CALL astt601_idx_chk()
               LET g_current_page = 6
               
               
         END DISPLAY
         #160513-00033#7--(E)
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
               CALL astt601_fetch('') # reload data
            END IF
            #LET g_detail_idx = 1
            CALL astt601_ui_detailshow() #Setting the current row 
            
            #筆數顯示
            LET g_current_page = 1
            CALL astt601_idx_chk()
            
            #add-point:ui_dialog段before_dialog2
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
                  LET g_export_node[1] = base.typeInfo.create(g_stcb_d)
                  LET g_export_id[1]   = "s_detail1"
             
                  LET g_export_node[2] = base.typeInfo.create(g_stcc_d)
                  LET g_export_id[2]   = "s_detail3"
             
                  LET g_export_node[3] = base.typeInfo.create(g_stcb2_d)
                  LET g_export_id[3]   = "s_detail2"
                  
                  LET g_export_node[4] = base.typeInfo.create(g_stcv_d)
                  LET g_export_id[4]   = "s_detail4"
                  
                  CALL cl_export_to_excel_getpage()
                  CALL cl_export_to_excel()
               END IF
            END IF 
                   
            #end add-point
            
            #NEXT FIELD stcbseq
        
         ON ACTION statechange
            CALL astt601_statechange()
            LET g_action_choice = "statechange"
            EXIT DIALOG
         #簽核狀況
         ON ACTION bpm_status
            #查詢簽核狀況, 統一建立HyperLink
            CALL cl_bpm_status()
            #add-point:ON ACTION bpm_status
         #END add-point
         
          
         #ACTION表單列
         ON ACTION filter
            CALL astt601_filter()
            EXIT DIALOG
         
         ON ACTION first
            CALL astt601_fetch('F')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt601_idx_chk()
            
         ON ACTION previous
            CALL astt601_fetch('P')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt601_idx_chk()
            
         ON ACTION jump
            CALL astt601_fetch('/')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt601_idx_chk()
            
         ON ACTION next
            CALL astt601_fetch('N')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt601_idx_chk()
            
         ON ACTION last
            CALL astt601_fetch('L')
            LET g_current_row = g_current_idx
            LET g_curr_diag = ui.DIALOG.getCurrent()
            CALL astt601_idx_chk()
            
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
               CALL gfrm_curr.setElementHidden("worksheet_detail",0)
               CALL gfrm_curr.setElementImage("controls","small/arr-u.png")
               LET g_header_hidden = 0     #visible
            ELSE
               CALL gfrm_curr.setElementHidden("worksheet_detail",1)
               CALL gfrm_curr.setElementImage("controls","small/arr-d.png")
               LET g_header_hidden = 1     #hidden     
            END IF
    
         
 
         ON ACTION insert
 
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN 
               CALL astt601_insert()
               #add-point:ON ACTION insert
                              
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION query
 
            LET g_action_choice="query"
            IF cl_auth_chk_act("query") THEN 
               CALL astt601_query()
               #add-point:ON ACTION query
                              
               #END add-point
            END IF
 
 
         ON ACTION output
 
            LET g_action_choice="output"
            IF cl_auth_chk_act("output") THEN 
               #add-point:ON ACTION output
                              
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION delete
 
            LET g_action_choice="delete"
            IF cl_auth_chk_act("delete") THEN 
               CALL astt601_delete()
               #add-point:ON ACTION delete
                              
               #END add-point
            END IF
 
 
         ON ACTION modify
 
            LET g_aw = ''
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN 
               CALL astt601_modify()
               #add-point:ON ACTION modify
                              
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION modify_detail
 
            LET g_aw = g_curr_diag.getCurrentItem()
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN 
               CALL astt601_modify()
               #add-point:ON ACTION modify_detail
                              
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION reproduce
 
            LET g_action_choice="reproduce"
            IF cl_auth_chk_act("reproduce") THEN 
               CALL astt601_reproduce()
               #add-point:ON ACTION reproduce
                              
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION prog_stca001
 
            LET g_action_choice="prog_stca001"
            IF cl_auth_chk_act("prog_stca001") THEN 
               CALL cl_cmdrun_wait("astm601")
               #add-point:ON ACTION prog_stca001
                              
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION prog_stca004
 
            LET g_action_choice="prog_stca004"
            IF cl_auth_chk_act("prog_stca004") THEN 
               CALL cl_cmdrun_wait("astm201")
               #add-point:ON ACTION prog_stca004
                              
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION prog_stca009
 
            LET g_action_choice="prog_stca009"
            IF cl_auth_chk_act("prog_stca009") THEN 
               CALL cl_cmdrun_wait("adbm200")
               #add-point:ON ACTION prog_stca009
                              
               #END add-point
               EXIT DIALOG
            END IF
 
         ON ACTION prog_stca010
 
            LET g_action_choice="prog_stca010"
            IF cl_auth_chk_act("prog_stca010") THEN 
               CALL cl_cmdrun_wait("adbm201")
               #add-point:ON ACTION prog_stca009
                              
               #END add-point
               EXIT DIALOG
            END IF
 
         ON ACTION prog_stca021
 
            LET g_action_choice="prog_stca021"
            IF cl_auth_chk_act("prog_stca021") THEN 
               CALL cl_cmdrun_wait("aooi140")
               #add-point:ON ACTION prog_stca021
                              
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION prog_stca022
 
            LET g_action_choice="prog_stca022"
            IF cl_auth_chk_act("prog_stca022") THEN 
               CALL cl_cmdrun_wait("aooi610")
               #add-point:ON ACTION prog_stca022
                              
               #END add-point
               EXIT DIALOG
            END IF
 
 
         ON ACTION prog_stca006
 
            LET g_action_choice="prog_stca006"
            IF cl_auth_chk_act("prog_stca006") THEN 
               CALL cl_cmdrun_wait("asti201")
               #add-point:ON ACTION prog_stca006
                              
               #END add-point
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
 
{<section id="astt601.browser_fill" >}
#+ 瀏覽頁簽資料填充
PRIVATE FUNCTION astt601_browser_fill(ps_page_action)
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
    DEFINE l_where           STRING #ken---add 需求單號：141208-00001 項次：20    
    CALL g_stcc_d.clear()
    CALL g_stcv_d.clear()
    CALL g_stck_d.clear()     #160513-00033#7    
    CALL g_stct_d.clear()     #160513-00033#7    
   #end add-point    
 
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_stca_m.* TO NULL
   CALL g_stcb_d.clear()        
   CALL g_stcb2_d.clear() 
 
 
   CALL g_browser.clear()
   
   #搜尋用
   IF cl_null(g_searchcol) OR g_searchcol = '0' THEN
      LET l_searchcol = "stcadocno"
 
   ELSE
      LET l_searchcol = g_searchcol
   END IF
   
   LET l_wc  = g_wc.trim() 
   LET l_wc2 = g_wc2.trim()
   IF cl_null(l_wc) THEN  #p_wc 查詢條件
      RETURN
   END IF
   
   #add-point:browser_fill,foreach前
   IF cl_null(g_wc)  THEN LET g_wc  = " 1=1" END IF
   IF cl_null(g_wc2) THEN LET g_wc2 = " 1=1" END IF
   #ken---add---str 需求單號：141208-00001 項次：20
   CALL s_aooi500_sql_where(g_prog,'stcasite') RETURNING l_where
   LET g_wc = g_wc," AND ",l_where
   #ken---add---end
   LET l_wc  = g_wc.trim() 
   LET l_wc2 = g_wc2.trim()
   IF cl_null(l_wc) THEN  
      RETURN
   END IF

   #LET l_wc = l_wc CLIPPED," AND stca005='11' "
   #LET g_wc = g_wc CLIPPED," AND stca005='11' "    
   #end add-point
   
   IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT UNIQUE stcadocno ",
 
                        " FROM stca_t ",
                              " ",
                              " LEFT JOIN stcb_t ON stcbent = stcaent AND stcadocno = stcbdocno ",
                              " LEFT JOIN stcd_t ON stcdent = stcaent AND stcadocno = stcddocno", 
 
 
 
                              " ", 
                              " ", 
                       " WHERE stcaent = '" ||g_enterprise|| "' AND stcbent = '" ||g_enterprise|| "' AND ",l_wc, " AND ", l_wc2
 
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT UNIQUE stcadocno ",
 
                        " FROM stca_t ", 
                              " ",
                              " ",
                        "WHERE stcaent = '" ||g_enterprise|| "' AND ",l_wc CLIPPED
 
   END IF
   
   LET g_sql = " SELECT COUNT(*) FROM (",l_sub_sql,")"
   
   #add-point:browser_fill,count前
         IF g_wc2 <> " 1=1" THEN
      #單身有輸入搜尋條件                      
      LET l_sub_sql = " SELECT UNIQUE stcadocno ",
 
                        " FROM stca_t ",
                              " ",
                              " LEFT JOIN stcb_t ON stcbent = stcaent AND stcadocno = stcbdocno ",
                              " LEFT JOIN stcd_t ON stcdent = stcaent AND stcadocno = stcddocno", 
                              " LEFT JOIN stcc_t ON stccent = stcbent AND stccdocno = stcbdocno AND stccseq1 = stcbseq",  
                              " LEFT JOIN stcv_t ON stcvent = stcaent AND stcadocno = stcvdocno ",
                              " LEFT JOIN stck_t ON stcaent = stckent AND stcadocno = stckdocno ",      #160513-00033#7
                              " LEFT JOIN stct_t ON stcaent = stctent AND stcadocno = stctdocno ",      #160513-00033#7
                              " ", 
                              " ", 
                       " WHERE stcaent = '" ||g_enterprise|| "' AND stcbent = '" ||g_enterprise|| "' AND ",l_wc, " AND ", l_wc2 CLIPPED ,cl_sql_add_filter("stca_t") #161214-00032#1 add  CLIPPED ,cl_sql_add_filter("stca_t") 
 
   ELSE
      #單身未輸入搜尋條件
      LET l_sub_sql = " SELECT UNIQUE stcadocno ",
 
                        " FROM stca_t ", 
                              " ",
                              " ",
                        "WHERE stcaent = '" ||g_enterprise|| "' AND ",l_wc CLIPPED,cl_sql_add_filter("stca_t") #161214-00032#1 add cl_sql_add_filter("stca_t") 
 
   END IF
   
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
      #依照stcadocno,stcadocdt,stca000,stca001,stca005,stca002,stca004,stca009,stca021,stca022,stca023,stca006,stca007,stca008,stca013,stca014,stca015,stca024,stca025,stca017,stca018,stca019,stca020,stca003,stcasite,stcaacti Browser欄位定義(取代原本bs_sql功能)
      LET l_sql_rank = "SELECT DISTINCT stcastus,stcadocno,stcadocdt,stca000,stca001,stca005,stca002, 
          stca004,stca009,stca021,stca022,stca023,stca006,stca007,stca008,stca013,stca014,stca015,stca024, 
          stca025,stca017,stca018,stca019,stca020,stca003,stcasite,stcaacti,DENSE_RANK() OVER(ORDER BY stcadocno ", 
          g_order,") AS RANK ",
                        " FROM stca_t ",
                              " ",
                              " LEFT JOIN stcb_t ON stcbent = stcaent AND stcadocno = stcbdocno ",
                              " LEFT JOIN stcd_t ON stcdent = stcaent AND stcadocno = stcddocno",
 
 
 
                              " ",
                              " ",
                       " ",
                       " WHERE stcaent = '" ||g_enterprise|| "' AND ",g_wc," AND ",g_wc2
   ELSE
      #單身無輸入資料
      LET l_sql_rank = "SELECT DISTINCT stcastus,stcadocno,stcadocdt,stca000,stca001,stca005,stca002, 
          stca004,stca009,stca021,stca022,stca023,stca006,stca007,stca008,stca013,stca014,stca015,stca024, 
          stca025,stca017,stca018,stca019,stca020,stca003,stcasite,stcaacti,DENSE_RANK() OVER(ORDER BY stcadocno ", 
          g_order,") AS RANK ",
                       " FROM stca_t ",
                            "  ",
                            "  ",
                       " WHERE stcaent = '" ||g_enterprise|| "' AND ", g_wc
   END IF
   
   #定義翻頁CURSOR
   LET g_sql= "SELECT stcastus,stcadocno,stcadocdt,stca000,stca001,stca005,stca002,stca004,stca009,stca021, 
       stca022,stca023,stca006,stca007,stca008,stca013,stca014,stca015,stca024,stca025,stca017,stca018, 
       stca019,stca020,stca003,stcasite,stcaacti FROM (",l_sql_rank,") WHERE ",
              " RANK >= ",1," AND RANK<",1+g_max_browse,
              " ORDER BY ",l_searchcol," ",g_order
               
   #add-point:browser_fill,before_prepare
          IF g_wc2 <> " 1=1" AND NOT cl_null(g_wc2) THEN 
      #依照stcadocno,stcadocdt,stca000,stca001,stca005,stca002,stca004,stca009,stca021,stca022,stca023,stca006,stca007,stca008,stca013,stca014,stca015,stca024,stca025,stca017,stca018,stca019,stca020,stca003,stcasite,stcaacti Browser欄位定義(取代原本bs_sql功能)
      LET l_sql_rank = "SELECT DISTINCT stcastus,stcadocno,stcadocdt,stca000,stca001,stca005,stca002, 
          stca004,stca009,stca021,stca022,stca023,stca006,stca007,stca008,stca013,stca014,stca015,stca024, 
          stca025,stca017,stca018,stca019,stca020,stca003,stcasite,stcaacti,DENSE_RANK() OVER(ORDER BY stcadocno ", 
          g_order,") AS RANK ",
                        " FROM stca_t ",
                              " ",
                              " LEFT JOIN stcb_t ON stcbent = stcaent AND stcadocno = stcbdocno ",
                              " LEFT JOIN stcd_t ON stcdent = stcaent AND stcadocno = stcddocno",
                              " LEFT JOIN stcc_t ON stccent = stcbent AND stccdocno = stcbdocno AND stccseq1 = stcbseq",  
                              " LEFT JOIN stcv_t ON stcvent = stcaent AND stcadocno = stcvdocno",
                              " LEFT JOIN stck_t ON stcaent = stckent AND stcadocno = stckdocno",      #160513-00033#7
                              " LEFT JOIN stct_t ON stcaent = stctent AND stcadocno = stctdocno",      #160513-00033#7
                              " ",
                              " ",
                       " ",
                       " WHERE stcaent = '" ||g_enterprise|| "' AND ",g_wc," AND ",g_wc2 CLIPPED ,cl_sql_add_filter("stca_t") #161214-00032#1 add  CLIPPED ,cl_sql_add_filter("stca_t") 
   ELSE
      #單身無輸入資料
      LET l_sql_rank = "SELECT DISTINCT stcastus,stcadocno,stcadocdt,stca000,stca001,stca005,stca002, 
          stca004,stca009,stca021,stca022,stca023,stca006,stca007,stca008,stca013,stca014,stca015,stca024, 
          stca025,stca017,stca018,stca019,stca020,stca003,stcasite,stcaacti,DENSE_RANK() OVER(ORDER BY stcadocno ", 
          g_order,") AS RANK ",
                       " FROM stca_t ",
                            "  ",
                            "  ",
                       " WHERE stcaent = '" ||g_enterprise|| "' AND ", g_wc CLIPPED ,cl_sql_add_filter("stca_t") #161214-00032#1 add  CLIPPED ,cl_sql_add_filter("stca_t") 
   END IF
   
   #定義翻頁CURSOR
   LET g_sql= "SELECT stcastus,stcadocno,stcadocdt,stca000,stca001,stca005,stca002,stca004,stca009,stca021, 
       stca022,stca023,stca006,stca007,stca008,stca013,stca014,stca015,stca024,stca025,stca017,stca018, 
       stca019,stca020,stca003,stcasite,stcaacti FROM (",l_sql_rank,") WHERE ",
              " RANK >= ",1," AND RANK<",1+g_max_browse,
              " ORDER BY ",l_searchcol," ",g_order
   #end add-point
               
   PREPARE browse_pre FROM g_sql
   DECLARE browse_cur CURSOR FOR browse_pre
   
   #add-point:browser_fill,open
      
   #end add-point
 
   CALL g_browser.clear()
   LET g_cnt = 1
   FOREACH browse_cur INTO g_browser[g_cnt].b_statepic,g_browser[g_cnt].b_stcadocno,g_browser[g_cnt].b_stcadocdt, 
       g_browser[g_cnt].b_stca000,g_browser[g_cnt].b_stca001,g_browser[g_cnt].b_stca005,g_browser[g_cnt].b_stca002, 
       g_browser[g_cnt].b_stca004,g_browser[g_cnt].b_stca009,g_browser[g_cnt].b_stca021,g_browser[g_cnt].b_stca022, 
       g_browser[g_cnt].b_stca023,g_browser[g_cnt].b_stca006,g_browser[g_cnt].b_stca007,g_browser[g_cnt].b_stca008, 
       g_browser[g_cnt].b_stca013,g_browser[g_cnt].b_stca014,g_browser[g_cnt].b_stca015,g_browser[g_cnt].b_stca024, 
       g_browser[g_cnt].b_stca025,g_browser[g_cnt].b_stca017,g_browser[g_cnt].b_stca018,g_browser[g_cnt].b_stca019, 
       g_browser[g_cnt].b_stca020,g_browser[g_cnt].b_stca003,g_browser[g_cnt].b_stcasite,g_browser[g_cnt].b_stcaacti 
 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'foreach:'
         LET g_errparam.popup = TRUE
         CALL cl_err()
 
         EXIT FOREACH
      END IF
  
      
  
      #add-point:browser_fill段reference
            
      #end add-point
  
            #此段落由子樣板a24產生
      CASE g_browser[g_cnt].b_statepic
         WHEN "N"
            LET g_browser[g_cnt].b_statepic = "stus/16/open.png"
         WHEN "X"
            LET g_browser[g_cnt].b_statepic = "stus/16/invalid.png"
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
 
{<section id="astt601.ui_headershow" >}
#+ 單頭資料重新顯示
PRIVATE FUNCTION astt601_ui_headershow()
   #add-point:ui_headershow段define
      
   #end add-point    
   
   LET g_stca_m.stcadocno = g_browser[g_current_idx].b_stcadocno   
 
    SELECT UNIQUE stca000,stcadocno,stcadocdt,stca005,stca001,stca002,stca003,stca004,stca009,stca010,stca011,stca012,stca027,stca021, 
        stca022,stca023,stca006,stca007,stca024,stca028,stca025,stca026,stca008,stcaacti,stca013,stca014,stca015,stca016,stca017, 
        stca018,stca019,stca020,stcasite,stcaunit,stcastus,stcaownid,stcaowndp,stcacrtid,stcacrtdp,stcacrtdt, 
        stcamodid,stcamoddt,stcacnfid,stcacnfdt
 INTO g_stca_m.stca000,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_stca_m.stca005,g_stca_m.stca001,g_stca_m.stca002, 
     g_stca_m.stca003,g_stca_m.stca004,g_stca_m.stca009,g_stca_m.stca010,g_stca_m.stca011,g_stca_m.stca012,g_stca_m.stca027,g_stca_m.stca021,g_stca_m.stca022,g_stca_m.stca023, 
     g_stca_m.stca006,g_stca_m.stca007,g_stca_m.stca024,g_stca_m.stca028,g_stca_m.stca025,g_stca_m.stca026,g_stca_m.stca008,g_stca_m.stcaacti, 
     g_stca_m.stca013,g_stca_m.stca014,g_stca_m.stca015,g_stca_m.stca016,g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca019, 
     g_stca_m.stca020,g_stca_m.stcasite,g_stca_m.stcaunit,g_stca_m.stcastus,g_stca_m.stcaownid,g_stca_m.stcaowndp, 
     g_stca_m.stcacrtid,g_stca_m.stcacrtdp,g_stca_m.stcacrtdt,g_stca_m.stcamodid,g_stca_m.stcamoddt, 
     g_stca_m.stcacnfid,g_stca_m.stcacnfdt
 FROM stca_t
 WHERE stcaent = g_enterprise AND stcadocno = g_stca_m.stcadocno
   CALL astt601_show()
   
END FUNCTION
 
{</section>}
 
{<section id="astt601.ui_detailshow" >}
#+ 單身資料重新顯示
PRIVATE FUNCTION astt601_ui_detailshow()
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
 
{<section id="astt601.ui_browser_refresh" >}
#+ 瀏覽頁簽資料重新顯示
PRIVATE FUNCTION astt601_ui_browser_refresh()
   {<Local define>}
   DEFINE l_i  LIKE type_t.num10
   {</Local define>}
   #add-point:ui_browser_refresh段define
      
   #end add-point    
   
   FOR l_i =1 TO g_browser.getLength()
      IF g_browser[l_i].b_stcadocno = g_stca_m.stcadocno 
 
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
 
{<section id="astt601.construct" >}
#+ QBE資料查詢
PRIVATE FUNCTION astt601_construct()
 
   {<Local define>}
   DEFINE lc_qbe_sn   LIKE type_t.num10
   DEFINE ls_return   STRING
   DEFINE ls_result   STRING 
   {</Local define>}
   #add-point:cs段define
   DEFINE  l_sys                 LIKE type_t.num5      
       
   #end add-point    
 
   #清除畫面
   CLEAR FORM                
   INITIALIZE g_stca_m.* TO NULL
   CALL g_stcb_d.clear()        
   CALL g_stcb2_d.clear() 
   CALL g_stcv_d.clear()
 
   
   LET g_action_choice = ""
    
   INITIALIZE g_wc TO NULL
   INITIALIZE g_wc2 TO NULL
   
   INITIALIZE g_wc2_table1 TO NULL
   INITIALIZE g_wc2_table2 TO NULL
 
 
    
   LET g_qryparam.state = 'c'
   
   #add-point:cs段開始前
   CALL g_stcc_d.clear() 
   CALL g_stck_d.clear()     #160513-00033#7    
   CALL g_stct_d.clear()     #160513-00033#7    
   CALL cl_set_comp_visible('page_1',TRUE)   
   CALL cl_set_comp_visible('stcb021',TRUE)
   #end add-point 
   
   #使用DIALOG包住 單頭CONSTRUCT及單身CONSTRUCT
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
      
      #單頭
      CONSTRUCT BY NAME g_wc ON stca000,stcadocno,stcadocdt,stca005,stca001,stca002,stca003, 
          stca004,stca009,stca010,stca011,stca012,stca027,stca021,stca022,stca023,stca006,stca007,stca024,stca028,stca025,stca026,stca008,stcaacti,stca013, 
          stca014,stca015,stca016,stca017,stca018,stca019,stca020,stcasite,stcaunit,stcastus,stcaownid,stcaowndp, 
          stcacrtid,stcacrtdp,stcacrtdt,stcamodid,stcamoddt,stcacnfid,stcacnfdt
 
         BEFORE CONSTRUCT
#saki            CALL cl_qbe_init()
            #add-point:cs段before_construct
                        
            #end add-point 
            
         #公用欄位開窗相關處理
         #此段落由子樣板a11產生
         ##----<<stcaownid>>----
         #ON ACTION controlp INFIELD stcaownid
         #   CALL q_common('stca_t','stcaownid',TRUE,FALSE,g_stca_m.stcaownid) RETURNING ls_return
         #   DISPLAY ls_return TO stcaownid
         #   NEXT FIELD stcaownid  
         #
         ##----<<stcaowndp>>----
         #ON ACTION controlp INFIELD stcaowndp
         #   CALL q_common('stca_t','stcaowndp',TRUE,FALSE,g_stca_m.stcaowndp) RETURNING ls_return
         #   DISPLAY ls_return TO stcaowndp
         #   NEXT FIELD stcaowndp
         #
         ##----<<stcacrtid>>----
         #ON ACTION controlp INFIELD stcacrtid
         #   CALL q_common('stca_t','stcacrtid',TRUE,FALSE,g_stca_m.stcacrtid) RETURNING ls_return
         #   DISPLAY ls_return TO stcacrtid
         #   NEXT FIELD stcacrtid
         #
         ##----<<stcacrtdp>>----
         #ON ACTION controlp INFIELD stcacrtdp
         #   CALL q_common('stca_t','stcacrtdp',TRUE,FALSE,g_stca_m.stcacrtdp) RETURNING ls_return
         #   DISPLAY ls_return TO stcacrtdp
         #   NEXT FIELD stcacrtdp
         #
         ##----<<stcamodid>>----
         #ON ACTION controlp INFIELD stcamodid
         #   CALL q_common('stca_t','stcamodid',TRUE,FALSE,g_stca_m.stcamodid) RETURNING ls_return
         #   DISPLAY ls_return TO stcamodid
         #   NEXT FIELD stcamodid
         #
         ##----<<stcacnfid>>----
         #ON ACTION controlp INFIELD stcacnfid
         #   CALL q_common('stca_t','stcacnfid',TRUE,FALSE,g_stca_m.stcacnfid) RETURNING ls_return
         #   DISPLAY ls_return TO stcacnfid
         #   NEXT FIELD stcacnfid
         #
         ##----<<stajpstid>>----
         ##ON ACTION controlp INFIELD stajpstid
         ##   CALL q_common('stca_t','stajpstid',TRUE,FALSE,g_stca_m.stajpstid) RETURNING ls_return
         ##   DISPLAY ls_return TO stajpstid
         ##   NEXT FIELD stajpstid
         
         ##----<<stcacrtdt>>----
         AFTER FIELD stcacrtdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stcamoddt>>----
         AFTER FIELD stcamoddt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stcacnfdt>>----
         AFTER FIELD stcacnfdt
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
            IF NOT cl_null(ls_result) THEN
               IF NOT cl_chk_date_symbol(ls_result) THEN
                  LET ls_result = cl_add_date_extra_cond(ls_result)
               END IF
            END IF
            CALL FGL_DIALOG_SETBUFFER(ls_result)
         
         #----<<stajpstdt>>----
         #AFTER FIELD stajpstdt
         #   CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
         #   IF NOT cl_null(ls_result) THEN
         #      IF NOT cl_chk_date_symbol(ls_result) THEN
         #         LET ls_result = cl_add_date_extra_cond(ls_result)
         #      END IF
         #   END IF
         #   CALL FGL_DIALOG_SETBUFFER(ls_result)
 
 
            
         #一般欄位開窗相關處理    
         #---------------------------<  Master  >---------------------------
         #----<<stca000>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca000
            #add-point:BEFORE FIELD stca000
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca000
            
            #add-point:AFTER FIELD stca000
                        
            #END add-point
            
 
         #Ctrlp:construct.c.stca000
         ON ACTION controlp INFIELD stca000
            #add-point:ON ACTION controlp INFIELD stca000
                        
            #END add-point
 
         #----<<stcadocno>>----
         #Ctrlp:construct.c.stcadocno
         ON ACTION controlp INFIELD stcadocno
            #add-point:ON ACTION controlp INFIELD stcadocno
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_stajdocno()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcadocno  #顯示到畫面上

            NEXT FIELD stcadocno                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcadocno
            #add-point:BEFORE FIELD stcadocno
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcadocno
            
            #add-point:AFTER FIELD stcadocno
                        
            #END add-point
            
 
         #----<<stcadocdt>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcadocdt
            #add-point:BEFORE FIELD stcadocdt
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcadocdt
            
            #add-point:AFTER FIELD stcadocdt
                        
            #END add-point
            
 
         #Ctrlp:construct.c.stcadocdt
         ON ACTION controlp INFIELD stcadocdt
            #add-point:ON ACTION controlp INFIELD stcadocdt
                        
            #END add-point
 
         #----<<stca005>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca005
            #add-point:BEFORE FIELD stca005
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca005
            
            #add-point:AFTER FIELD stca005
                        
            #END add-point
            
 
         #Ctrlp:construct.c.stca005
         ON ACTION controlp INFIELD stca005
            #add-point:ON ACTION controlp INFIELD stca005
                        
            #END add-point
 
         #----<<stca001>>----
         #Ctrlp:construct.c.stca001
         ON ACTION controlp INFIELD stca001
            #add-point:ON ACTION controlp INFIELD stca001
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_stce001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca001  #顯示到畫面上

            NEXT FIELD stca001                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca001
            #add-point:BEFORE FIELD stca001
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca001
            
            #add-point:AFTER FIELD stca001
                        
            #END add-point
            
 
         #----<<stca002>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca002
            #add-point:BEFORE FIELD stca002
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca002
            
            #add-point:AFTER FIELD stca002
                        
            #END add-point
            
 
         #Ctrlp:construct.c.stca002
         ON ACTION controlp INFIELD stca002
            #add-point:ON ACTION controlp INFIELD stca002
                        
            #END add-point
 
         #----<<stca003>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca003
            #add-point:BEFORE FIELD stca003
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca003
            
            #add-point:AFTER FIELD stca003
                        
            #END add-point
            
 
         #Ctrlp:construct.c.stca003
         ON ACTION controlp INFIELD stca003
            #add-point:ON ACTION controlp INFIELD stca003
                        
            #END add-point      
                     
       
                    
 
                  
 
 
         #----<<stca004>>----
         #Ctrlp:construct.c.stca004
         ON ACTION controlp INFIELD stca004
            #add-point:ON ACTION controlp INFIELD stca004
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_stag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca004  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO stagl003 #說明 

            NEXT FIELD stca004                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca004
            #add-point:BEFORE FIELD stca004
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca004
            
            #add-point:AFTER FIELD stca004
                        
            #END add-point
            
 
         #----<<stca009>>----
         #Ctrlp:construct.c.stca009
         ON ACTION controlp INFIELD stca009
            #add-point:ON ACTION controlp INFIELD stca009
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_21()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca009  #顯示到畫面上

            NEXT FIELD stca009                     #返回原欄位




          ON ACTION controlp INFIELD stca010
  
	         INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
		      LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_18()                          #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca010  #顯示到畫面上

            NEXT FIELD stca010     

          ON ACTION controlp INFIELD stca011
  
	         INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
		      LET g_qryparam.reqry = FALSE
		      LET g_qryparam.arg1 = '281'
            CALL q_oocq002()                          #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca011  #顯示到畫面上

            NEXT FIELD stca011   
            
           ON ACTION controlp INFIELD stca012
  
	         #INITIALIZE g_qryparam.* TO NULL
            # LET g_qryparam.state = 'c'
		      #LET g_qryparam.reqry = FALSE
		      #LET g_qryparam.arg1 = '2035'
            #CALL q_oocq002()                      #呼叫開窗
            #DISPLAY g_qryparam.return1 TO stca012  #顯示到畫面上
            #
            #NEXT FIELD stca012 
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "1"
            CALL q_oojd001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca012  #顯示到畫面上

            NEXT FIELD stca012                    #返回原欄位  
            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca009
            #add-point:BEFORE FIELD stca009
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca009
            
            #add-point:AFTER FIELD stca009
                   
            #END add-point
            
 
         #----<<stca021>>----
         #Ctrlp:construct.c.stca021
         ON ACTION controlp INFIELD stca021
            #add-point:ON ACTION controlp INFIELD stca021
                                    #此段落由子樣板a08產生
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_aooi001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca021  #顯示到畫面上

            NEXT FIELD stca021                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca021
            #add-point:BEFORE FIELD stca021
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca021
            
            #add-point:AFTER FIELD stca021
                        
            #END add-point
            
 
         #----<<stca022>>----
         #Ctrlp:construct.c.stca022
         ON ACTION controlp INFIELD stca022
            #add-point:ON ACTION controlp INFIELD stca022
                                    #此段落由子樣板a08產生
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
			   LET g_qryparam.arg1 = g_site
            CALL q_oodb002_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca022  #顯示到畫面上

            NEXT FIELD stca022                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca022
            #add-point:BEFORE FIELD stca022
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca022
            
            #add-point:AFTER FIELD stca022
                        
            #END add-point
            
 
         #----<<stca023>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca023
            #add-point:BEFORE FIELD stca023
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca023
            
            #add-point:AFTER FIELD stca023
                        
            #END add-point
            
 
         #Ctrlp:construct.c.stca023
         ON ACTION controlp INFIELD stca023
            #add-point:ON ACTION controlp INFIELD stca023
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_ooib002_2()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca022  #顯示到畫面上

            NEXT FIELD stca022                     #返回原欄位
            
            #END add-point
 
         #----<<stca006>>----
         #Ctrlp:construct.c.stca006
         ON ACTION controlp INFIELD stca006
            #add-point:ON ACTION controlp INFIELD stca006
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca006  #顯示到畫面上

            NEXT FIELD stca006                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca006
            #add-point:BEFORE FIELD stca006
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca006
            
            #add-point:AFTER FIELD stca006
                        
            #END add-point
            
 
         #----<<stca007>>----
         #Ctrlp:construct.c.stca007
         ON ACTION controlp INFIELD stca007
            #add-point:ON ACTION controlp INFIELD stca007
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_oocq002()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca007  #顯示到畫面上

            NEXT FIELD stca007                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca007
            #add-point:BEFORE FIELD stca007
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca007
            
            #add-point:AFTER FIELD stca007
                        
            #END add-point
            
 
         #----<<stca024>>----
         #Ctrlp:construct.c.stca024
         ON ACTION controlp INFIELD stca024
            #add-point:ON ACTION controlp INFIELD stca024
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
           #LET g_qryparam.arg1 = 'A'
#            CALL q_ooef001_23()                                #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stca024') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stca024',g_site,'c')
               CALL q_ooef001_24() 
            ELSE
               CALL q_ooef001_23() 
            END IF
            DISPLAY g_qryparam.return1 TO stca024  #顯示到畫面上

            NEXT FIELD stca024                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca024
            #add-point:BEFORE FIELD stca024
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca024
            
            #add-point:AFTER FIELD stca024
               
         ON ACTION controlp INFIELD stca028
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE

	         CALL q_dbbc001()                      #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca028  #顯示到畫面上

            NEXT FIELD stca028                     #返回原欄位               
            #END add-point
            
 
         #----<<stca025>>----
         #Ctrlp:construct.c.stca025
         ON ACTION controlp INFIELD stca025
            #add-point:ON ACTION controlp INFIELD stca025
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
           #LET g_qryparam.arg1 = 'D'
#            CALL q_ooef001_18()                             #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stca025') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stca025',g_site,'c')
               CALL q_ooef001_24() 
            ELSE
               CALL q_ooef001_18() 
            END IF
            DISPLAY g_qryparam.return1 TO stca025  #顯示到畫面上

            NEXT FIELD stca025                     #返回原欄位



         ON ACTION controlp INFIELD stca026
  
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
		     #LET g_qryparam.arg1 = '2'
#			   CALL q_ooef001_14()                             #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stca026') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stca026',g_site,'c')
               CALL q_ooef001_24() 
            ELSE
               #CALL q_ooef001_14()              #161024-00025#3 mark
               LET g_qryparam.where = " ooef201 = 'Y' "     #161024-00025#3 add
               CALL q_ooef001_24()               #161024-00025#3 add
            END IF
            DISPLAY g_qryparam.return1 TO stca026  #顯示到畫面上

            NEXT FIELD stca026                    #返回原欄位
            
          ON ACTION controlp INFIELD stca027
  
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            CALL q_stce001_4()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca027  #顯示到畫面上

            NEXT FIELD stca027                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca025
            #add-point:BEFORE FIELD stca025
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca025
            
            #add-point:AFTER FIELD stca025
                        
            #END add-point
            
 
         #----<<stca008>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca008
            #add-point:BEFORE FIELD stca008
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca008
            
            #add-point:AFTER FIELD stca008
                        
            #END add-point
            
 
         #Ctrlp:construct.c.stca008
         ON ACTION controlp INFIELD stca008
            #add-point:ON ACTION controlp INFIELD stca008
                        
            #END add-point
 
         #----<<stcaacti>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcaacti
            #add-point:BEFORE FIELD stcaacti
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcaacti
            
            #add-point:AFTER FIELD stcaacti
                        
            #END add-point
            
 
         #Ctrlp:construct.c.stcaacti
         ON ACTION controlp INFIELD stcaacti
            #add-point:ON ACTION controlp INFIELD stcaacti
                        
            #END add-point
 
         #----<<stca013>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca013
            #add-point:BEFORE FIELD stca013
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca013
            
            #add-point:AFTER FIELD stca013
                        
            #END add-point
            
 
         #Ctrlp:construct.c.stca013
         ON ACTION controlp INFIELD stca013
            #add-point:ON ACTION controlp INFIELD stca013
                        
            #END add-point
 
         #----<<stca014>>----
         #Ctrlp:construct.c.stca014
         ON ACTION controlp INFIELD stca014
            #add-point:ON ACTION controlp INFIELD stca014
                                    #此段落由子樣板a08產生
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
           #LET g_qryparam.arg1 = '1'
#            CALL q_ooef001_2()                          #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stca014') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stca014',g_site,'c')
               CALL q_ooef001_24() 
            ELSE
               #161024-00025#4 -s by 08172
               LET g_qryparam.where = " ooef003='Y'"
               CALL q_ooef001_24()
#               CALL q_ooef001_2()
               #161024-00025#4 -e by 08172               
            END IF
            DISPLAY g_qryparam.return1 TO stca014  #顯示到畫面上

            NEXT FIELD stca014                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca014
            #add-point:BEFORE FIELD stca014
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca014
            
            #add-point:AFTER FIELD stca014
                        
            #END add-point
            
 
         #----<<stca015>>----
         #Ctrlp:construct.c.stca015
         ON ACTION controlp INFIELD stca015
            #add-point:ON ACTION controlp INFIELD stca015
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca015  #顯示到畫面上

            NEXT FIELD stca015                     #返回原欄位


          ON ACTION controlp INFIELD stca016
     
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
		      LET g_qryparam.reqry = FALSE
            CALL q_ooeg001()                          #呼叫開窗
            DISPLAY g_qryparam.return1 TO stca016  #顯示到畫面上

            NEXT FIELD stca016                     #返回原欄位

            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca015
            #add-point:BEFORE FIELD stca015
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca015
            
            #add-point:AFTER FIELD stca015
                        
            #END add-point
            
 
         #----<<stca017>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca017
            #add-point:BEFORE FIELD stca017
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca017
            
            #add-point:AFTER FIELD stca017
                        
            #END add-point
            
 
         #Ctrlp:construct.c.stca017
         ON ACTION controlp INFIELD stca017
            #add-point:ON ACTION controlp INFIELD stca017
                        
            #END add-point
 
         #----<<stca018>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca018
            #add-point:BEFORE FIELD stca018
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca018
            
            #add-point:AFTER FIELD stca018
                        
            #END add-point
            
 
         #Ctrlp:construct.c.stca018
         ON ACTION controlp INFIELD stca018
            #add-point:ON ACTION controlp INFIELD stca018
                        
            #END add-point
 
         #----<<stca019>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca019
            #add-point:BEFORE FIELD stca019
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca019
            
            #add-point:AFTER FIELD stca019
                        
            #END add-point
            
 
         #Ctrlp:construct.c.stca019
         ON ACTION controlp INFIELD stca019
            #add-point:ON ACTION controlp INFIELD stca019
                        
            #END add-point
 
         #----<<stca020>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca020
            #add-point:BEFORE FIELD stca020
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca020
            
            #add-point:AFTER FIELD stca020
            CALL FGL_DIALOG_GETBUFFER() RETURNING ls_result
               IF NOT cl_null(ls_result) THEN
                  IF NOT cl_chk_date_symbol(ls_result) THEN
                     LET ls_result = cl_add_date_extra_cond(ls_result)
                  END IF
               END IF
               CALL FGL_DIALOG_SETBUFFER(ls_result)            
            #END add-point
            
 
         #Ctrlp:construct.c.stca020
         ON ACTION controlp INFIELD stca020
            #add-point:ON ACTION controlp INFIELD stca020
                        
            #END add-point
 
         #----<<stcasite>>----
         #Ctrlp:construct.c.stcasite
         ON ACTION controlp INFIELD stcasite
            #add-point:ON ACTION controlp INFIELD stcasite
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
		      #LET g_qryparam.arg1 = '2'		      
            #CALL q_ooef001_14()                           #呼叫開窗 
            #ken---add---str 需求單號：141208-00001 項次：20
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcasite',g_site,'c')
            CALL q_ooef001_24()                      #呼叫開窗 
            #ken---add---end
            DISPLAY g_qryparam.return1 TO stcasite  #顯示到畫面上

            NEXT FIELD stcasite                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcasite
            #add-point:BEFORE FIELD stcasite
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcasite
            
            #add-point:AFTER FIELD stcasite
                        
            #END add-point
            
 
         #----<<stcaunit>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcaunit
            #add-point:BEFORE FIELD stcaunit
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcaunit
            
            #add-point:AFTER FIELD stcaunit
                        
            #END add-point
            
 
         #Ctrlp:construct.c.stcaunit
         ON ACTION controlp INFIELD stcaunit
            #add-point:ON ACTION controlp INFIELD stcaunit
                        
            #END add-point
 
         #----<<stcastus>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcastus
            #add-point:BEFORE FIELD stcastus
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcastus
            
            #add-point:AFTER FIELD stcastus
                        
            #END add-point
            
 
         #Ctrlp:construct.c.stcastus
         ON ACTION controlp INFIELD stcastus
            #add-point:ON ACTION controlp INFIELD stcastus
                        
            #END add-point
 
         #----<<stcaownid>>----
         #Ctrlp:construct.c.stcaownid
         ON ACTION controlp INFIELD stcaownid
            #add-point:ON ACTION controlp INFIELD stcaownid
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcaownid  #顯示到畫面上

            NEXT FIELD stcaownid                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcaownid
            #add-point:BEFORE FIELD stcaownid
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcaownid
            
            #add-point:AFTER FIELD stcaownid
                        
            #END add-point
            
 
         #----<<stcaowndp>>----
         #Ctrlp:construct.c.stcaowndp
         ON ACTION controlp INFIELD stcaowndp
            #add-point:ON ACTION controlp INFIELD stcaowndp
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcaowndp  #顯示到畫面上

            NEXT FIELD stcaowndp                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcaowndp
            #add-point:BEFORE FIELD stcaowndp
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcaowndp
            
            #add-point:AFTER FIELD stcaowndp
                        
            #END add-point
            
 
         #----<<stcacrtid>>----
         #Ctrlp:construct.c.stcacrtid
         ON ACTION controlp INFIELD stcacrtid
            #add-point:ON ACTION controlp INFIELD stcacrtid
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcacrtid  #顯示到畫面上

            NEXT FIELD stcacrtid                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcacrtid
            #add-point:BEFORE FIELD stcacrtid
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcacrtid
            
            #add-point:AFTER FIELD stcacrtid
                        
            #END add-point
            
 
         #----<<stcacrtdp>>----
         #Ctrlp:construct.c.stcacrtdp
         ON ACTION controlp INFIELD stcacrtdp
            #add-point:ON ACTION controlp INFIELD stcacrtdp
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooeg001_9()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcacrtdp  #顯示到畫面上

            NEXT FIELD stcacrtdp                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcacrtdp
            #add-point:BEFORE FIELD stcacrtdp
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcacrtdp
            
            #add-point:AFTER FIELD stcacrtdp
                        
            #END add-point
            
 
         #----<<stcacrtdt>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcacrtdt
            #add-point:BEFORE FIELD stcacrtdt
                        
            #END add-point
 
         #----<<stcamodid>>----
         #Ctrlp:construct.c.stcamodid
         ON ACTION controlp INFIELD stcamodid
            #add-point:ON ACTION controlp INFIELD stcamodid
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcamodid  #顯示到畫面上

            NEXT FIELD stcamodid                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcamodid
            #add-point:BEFORE FIELD stcamodid
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcamodid
            
            #add-point:AFTER FIELD stcamodid
                        
            #END add-point
            
 
         #----<<stcamoddt>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcamoddt
            #add-point:BEFORE FIELD stcamoddt
                        
            #END add-point
 
         #----<<stcacnfid>>----
         #Ctrlp:construct.c.stcacnfid
         ON ACTION controlp INFIELD stcacnfid
            #add-point:ON ACTION controlp INFIELD stcacnfid
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooag001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcacnfid  #顯示到畫面上

            NEXT FIELD stcacnfid                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcacnfid
            #add-point:BEFORE FIELD stcacnfid
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcacnfid
            
            #add-point:AFTER FIELD stcacnfid
                        
            #END add-point
            
 
         #----<<stcacnfdt>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcacnfdt
            #add-point:BEFORE FIELD stcacnfid
                        
            #END add-point
 
 
         
      END CONSTRUCT
 
      #單身根據table分拆construct
      CONSTRUCT g_wc2_table1 ON stcbseq,stcb002,stcb003,stcb004,stcb005,stcb006,stcb007,stcb008,stcb009, 
          stcb010,stcb011,stcb012,stcb013,stcb014,stcb015,stcb016,stcb017,stcb018,stcb019,stcb020,stcbunit,stcbsite
           FROM s_detail1[1].stcbseq,s_detail1[1].stcb002,s_detail1[1].stcb003,s_detail1[1].stcb004, 
               s_detail1[1].stcb005,s_detail1[1].stcb006,s_detail1[1].stcb007,s_detail1[1].stcb008,s_detail1[1].stcb009, 
               s_detail1[1].stcb010,s_detail1[1].stcb011,s_detail1[1].stcb012,s_detail1[1].stcb013,s_detail1[1].stcb014, 
               s_detail1[1].stcb015,s_detail1[1].stcb016,s_detail1[1].stcb017,s_detail1[1].stcb018,s_detail1[1].stcb019,s_detail1[1].stcb020,s_detail1[1].stcbunit, 
               s_detail1[1].stcbsite
                      
         BEFORE CONSTRUCT
#saki            CALL cl_qbe_display_condition(lc_qbe_sn)
            #add-point:cs段before_construct
                        
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
       #---------------------<  Detail: page1  >---------------------
         #----<<stcbseq>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcbseq
            #add-point:BEFORE FIELD stcbseq
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcbseq
            
            #add-point:AFTER FIELD stcbseq
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcbseq
         ON ACTION controlp INFIELD stcbseq
            #add-point:ON ACTION controlp INFIELD stcbseq
                        
            #END add-point
 
         #----<<stcb002>>----
         #Ctrlp:construct.c.page1.stcb002
         ON ACTION controlp INFIELD stcb002
            #add-point:ON ACTION controlp INFIELD stcb002
                                    #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_stae001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcb002  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO stael003 #說明 
               #DISPLAY g_qryparam.return3 TO stae001 #費用編號 

            NEXT FIELD stcb002                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcb002
            #add-point:BEFORE FIELD stcb002
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb002
            
            #add-point:AFTER FIELD stcb002
                        
            #END add-point
            
 
         #----<<stcb003>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb003
            #add-point:BEFORE FIELD stcb003
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb003
            
            #add-point:AFTER FIELD stcb003
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcb003
         ON ACTION controlp INFIELD stcb003
            #add-point:ON ACTION controlp INFIELD stcb003
                        
            #END add-point
 
         #----<<stcb004>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb004
            #add-point:BEFORE FIELD stcb004
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb004
            
            #add-point:AFTER FIELD stcb004
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcb004
         ON ACTION controlp INFIELD stcb004
            #add-point:ON ACTION controlp INFIELD stcb004
                        
            #END add-point
 
         #----<<stcb005>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb005
            #add-point:BEFORE FIELD stcb005
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb005
            
            #add-point:AFTER FIELD stcb005
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcb005
         ON ACTION controlp INFIELD stcb005
            #add-point:ON ACTION controlp INFIELD stcb005
                        
            #END add-point
 
         #----<<stcb006>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb006
            #add-point:BEFORE FIELD stcb006
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb006
            
            #add-point:AFTER FIELD stcb006
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcb006
         ON ACTION controlp INFIELD stcb006
            #add-point:ON ACTION controlp INFIELD stcb006
                        
            #END add-point
 
         #----<<stcb007>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb007
            #add-point:BEFORE FIELD stcb007
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb007
            
            #add-point:AFTER FIELD stcb007
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcb007
         ON ACTION controlp INFIELD stcb007
            #add-point:ON ACTION controlp INFIELD stcb007
                        
            #END add-point
 
         #----<<stcb008>>----
         #Ctrlp:construct.c.page1.stcb008
         ON ACTION controlp INFIELD stcb008
            #add-point:ON ACTION controlp INFIELD stcb008
                                    #此段落由子樣板a08產生
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
            #LET g_qryparam.arg1 = g_stca_m.stca005
            #LET g_qryparam.arg2 = g_stca_m.stca007
            CALL q_stab001_3()   #呼叫開窗
                                                       #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcb008  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO stabl003 #說明 
               #DISPLAY g_qryparam.return3 TO stabl004 #助記碼 

            NEXT FIELD stcb008                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcb008
            #add-point:BEFORE FIELD stcb008
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb008
            
            #add-point:AFTER FIELD stcb008
                        
            #END add-point
            
 
         #----<<stcb009>>----
         #Ctrlp:construct.c.page1.stcb009
         ON ACTION controlp INFIELD stcb009
            #add-point:ON ACTION controlp INFIELD stcb009
                                    #此段落由子樣板a08產生
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
           #LET g_qryparam.arg1 = g_stca_m.stca005
           # LET g_qryparam.arg2 = g_stca_m.stca007
            CALL q_stab001_3()   #呼叫開窗
                                                        #呼叫開窗
            DISPLAY g_qryparam.return1 TO stcb009  #顯示到畫面上
               #DISPLAY g_qryparam.return2 TO stabl003 #說明 
               #DISPLAY g_qryparam.return3 TO stabl004 #助記碼 

            NEXT FIELD stcb009                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcb009
            #add-point:BEFORE FIELD stcb009
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb009
            
            #add-point:AFTER FIELD stcb009
                        
            #END add-point
            
 
         #----<<stcb010>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb010
            #add-point:BEFORE FIELD stcb010
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb010
            
            #add-point:AFTER FIELD stcb010
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcb010
         ON ACTION controlp INFIELD stcb010
            #add-point:ON ACTION controlp INFIELD stcb010
                        
            #END add-point
 
         #----<<stcb011>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb011
            #add-point:BEFORE FIELD stcb011
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb011
            
            #add-point:AFTER FIELD stcb011
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcb011
         ON ACTION controlp INFIELD stcb011
            #add-point:ON ACTION controlp INFIELD stcb011
                        
            #END add-point
 
         #----<<stcb012>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb012
            #add-point:BEFORE FIELD stcb012
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb012
            
            #add-point:AFTER FIELD stcb012
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcb012
         ON ACTION controlp INFIELD stcb012
            #add-point:ON ACTION controlp INFIELD stcb012
                        
            #END add-point
 
         #----<<stcb013>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb013
            #add-point:BEFORE FIELD stcb013
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb013
            
            #add-point:AFTER FIELD stcb013
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcb013
         ON ACTION controlp INFIELD stcb013
            #add-point:ON ACTION controlp INFIELD stcb013
                        
            #END add-point
 
         #----<<stcb014>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb014
            #add-point:BEFORE FIELD stcb014
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb014
            
            #add-point:AFTER FIELD stcb014
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcb014
         ON ACTION controlp INFIELD stcb014
            #add-point:ON ACTION controlp INFIELD stcb014
                        
            #END add-point
 
         #----<<stcb015>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb015
            #add-point:BEFORE FIELD stcb015
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb015
            
            #add-point:AFTER FIELD stcb015
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcb015
         ON ACTION controlp INFIELD stcb015
            #add-point:ON ACTION controlp INFIELD stcb015
                        
            #END add-point
 
         #----<<stcb016>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb016
            #add-point:BEFORE FIELD stcb016
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb016
            
            #add-point:AFTER FIELD stcb016
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcb016
         ON ACTION controlp INFIELD stcb016
            #add-point:ON ACTION controlp INFIELD stcb016
                        
            #END add-point
 
         #----<<stcb017>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb017
            #add-point:BEFORE FIELD stcb017
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb017
            
            #add-point:AFTER FIELD stcb017
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcb017
         ON ACTION controlp INFIELD stcb017
            #add-point:ON ACTION controlp INFIELD stcb017
                        
            #END add-point
 
         #----<<stcb018>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb018
            #add-point:BEFORE FIELD stcb018
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb018
            
            #add-point:AFTER FIELD stcb018
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcb018
         ON ACTION controlp INFIELD stcb018
            #add-point:ON ACTION controlp INFIELD stcb018
                        
            #END add-point
 
         #----<<stcbunit>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcbunit
            #add-point:BEFORE FIELD stcbunit
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcbunit
            
            #add-point:AFTER FIELD stcbunit
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcbunit
         ON ACTION controlp INFIELD stcbunit
            #add-point:ON ACTION controlp INFIELD stcbunit
                        
            #END add-point
 
         #----<<stcbsite>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcbsite
            #add-point:BEFORE FIELD stcbsite
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcbsite
            
            #add-point:AFTER FIELD stcbsite
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page1.stcbsite
         ON ACTION controlp INFIELD stcbsite
            #add-point:ON ACTION controlp INFIELD stcbsite
                        
            #END add-point
 
   
       
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table2 ON stcdseq,stcd002,stcd003,stcdunit,stcdsite
           FROM s_detail2[1].stcdseq,s_detail2[1].stcd002,s_detail2[1].stcd003,s_detail2[1].stcdunit, 
               s_detail2[1].stcdsite
                      
         BEFORE CONSTRUCT
#saki            CALL cl_qbe_display_condition(lc_qbe_sn)
            #add-point:cs段before_construct
                        
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
       #---------------------<  Detail: page2  >---------------------
         #----<<stcdseq>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcdseq
            #add-point:BEFORE FIELD stcdseq
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcdseq
            
            #add-point:AFTER FIELD stcdseq
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page2.stcdseq
         ON ACTION controlp INFIELD stcdseq
            #add-point:ON ACTION controlp INFIELD stcdseq
                        
            #END add-point
 
         #----<<stcd002>>----
         #Ctrlp:construct.c.page2.stcd002
         ON ACTION controlp INFIELD stcd002
            #add-point:ON ACTION controlp INFIELD stcd002
                                    #此段落由子樣板a08產生
            #開窗c段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			   LET g_qryparam.reqry = FALSE
			  #CALL cl_get_para(g_enterprise,g_site,'E-CIR-0001') RETURNING l_sys
           ##給予arg
           #LET g_qryparam.arg1 = l_sys 
           #CALL q_rtax001_3()                           #呼叫開窗
            CALL q_dbbb003()
            DISPLAY g_qryparam.return1 TO stcd002  #顯示到畫面上

            NEXT FIELD stcd002                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcd002
            #add-point:BEFORE FIELD stcd002
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcd002
            
            #add-point:AFTER FIELD stcd002
                        
            #END add-point
            
 
         #----<<stcd003>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcd003
            #add-point:BEFORE FIELD stcd003
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcd003
            
            #add-point:AFTER FIELD stcd003
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page2.stcd003
         ON ACTION controlp INFIELD stcd003
            #add-point:ON ACTION controlp INFIELD stcd003
                        
            #END add-point
 
         #----<<stcdunit>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcdunit
            #add-point:BEFORE FIELD stcdunit
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcdunit
            
            #add-point:AFTER FIELD stcdunit
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page2.stcdunit
         ON ACTION controlp INFIELD stcdunit
            #add-point:ON ACTION controlp INFIELD stcdunit
                        
            #END add-point
 
         #----<<stcdsite>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcdsite
            #add-point:BEFORE FIELD stcdsite
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcdsite
            
            #add-point:AFTER FIELD stcdsite
                        
            #END add-point
            
 
         #Ctrlp:construct.c.page2.stcdsite
         ON ACTION controlp INFIELD stcdsite
            #add-point:ON ACTION controlp INFIELD stcdsite
                        
            #END add-point
 
   
       
      END CONSTRUCT
 
 
      
 
      
      #add-point:cs段add_cs(本段內只能出現新的CONSTRUCT指令)
      CONSTRUCT g_wc2_table3 ON stccseq2,stcc002,stcc003,stcc004
           FROM s_detail3[1].stccseq2, s_detail3[1].stcc002, s_detail3[1].stcc003, s_detail3[1].stcc004
                      
         BEFORE CONSTRUCT
        
      END CONSTRUCT
      
      CONSTRUCT g_wc2_table4 ON stcvseq,stcv002,stcv003,stcv004,stcv005,stcv006
           FROM s_detail4[1].stcvseq,s_detail4[1].stcv002,s_detail4[1].stcv003,s_detail4[1].stcv004,s_detail4[1].stcv005,s_detail4[1].stcv006
                      
         BEFORE CONSTRUCT
       
      END CONSTRUCT
      #160513-00033#7--(S)
      CONSTRUCT g_wc2_table5 ON stckseq,stck002,stck003,stck004,stck005,
                                stck006,stck007,stck008,stck009,stck010,
                                stck011,stck012,stck013,stck014
           FROM s_detail5[1].stckseq,s_detail5[1].stck002,s_detail5[1].stck003,s_detail5[1].stck004,s_detail5[1].stck005,
                s_detail5[1].stck006,s_detail5[1].stck007,s_detail5[1].stck008,s_detail5[1].stck009,s_detail5[1].stck010,
                s_detail5[1].stck011,s_detail5[1].stck012,s_detail5[1].stck013,s_detail5[1].stck014
                      
         ON ACTION controlp INFIELD stck002
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
   			LET g_qryparam.reqry = FALSE
   			LET g_qryparam.arg1 = '2147'
            CALL q_oocq002()                     
            DISPLAY g_qryparam.return1 TO stck002
            NEXT FIELD stck002 
         
         ON ACTION controlp INFIELD stck003
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
   			LET g_qryparam.reqry = FALSE
            CALL q_imaa001()                     
            DISPLAY g_qryparam.return1 TO stck003
            NEXT FIELD stck003 
         
         ON ACTION controlp INFIELD stck010
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
   			LET g_qryparam.reqry = FALSE
   			LET g_qryparam.where = " stat001 = '11'"
            CALL q_stab001_3()                     
            DISPLAY g_qryparam.return1 TO stck010
            NEXT FIELD stck010 
         
         ON ACTION controlp INFIELD stck014
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
   			LET g_qryparam.reqry = FALSE
   			LET g_qryparam.arg1 = '2146'
            CALL q_oocq002()                     
            DISPLAY g_qryparam.return1 TO stck014
            NEXT FIELD stck014 
            
      END CONSTRUCT
      CONSTRUCT g_wc2_table6 ON stctseq,stct001
           FROM s_detail6[1].stctseq,s_detail6[1].stct001
                      
         ON ACTION controlp INFIELD stck001
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
   			LET g_qryparam.reqry = FALSE
            CALL q_pmaa001_21()
            DISPLAY g_qryparam.return1 TO stct001
            NEXT FIELD stck001            
      END CONSTRUCT
      #160513-00033#7--(E)
      #end add-point
 
      BEFORE DIALOG
         #add-point:cs段b_dialog
        # DISPLAY '11' TO stca005         
         #end add-point  
 
      ON ACTION qbe_select     #條件查詢
#saki         CALL cl_qbe_list() RETURNING lc_qbe_sn
#saki         CALL cl_qbe_display_condition(lc_qbe_sn)
 
      ON ACTION qbe_save       #條件儲存
#saki         CALL cl_qbe_save()
 
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
   #160513-00033#7--(S)
   IF cl_null(g_wc2_table5) THEN LET g_wc2_table5 = " 1=1" END IF
   IF g_wc2_table5 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table5
   END IF
   IF cl_null(g_wc2_table6) THEN LET g_wc2_table6 = " 1=1" END IF
   IF g_wc2_table6 <> " 1=1" THEN
      LET g_wc2 = g_wc2 ," AND ", g_wc2_table6
   END IF
   #160513-00033#7--(E)
   #end add-point    
 
   IF INT_FLAG THEN
      RETURN
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt601.filter" >}
#+ filter過濾功能
PRIVATE FUNCTION astt601_filter()
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
      CONSTRUCT g_wc_filter ON stcadocno,stcadocdt,stca000,stca001,stca002,stca004,stca009,stca021, 
          stca022,stca023,stca006,stca007,stca008,stca013,stca014,stca015,stca024,stca025,stca017,stca018, 
          stca019,stca020,stca003,stcasite,stcaacti
                          FROM s_browse[1].b_stcadocno,s_browse[1].b_stcadocdt,s_browse[1].b_stca000, 
                              s_browse[1].b_stca001,s_browse[1].b_stca002,s_browse[1].b_stca004, 
                              s_browse[1].b_stca009,s_browse[1].b_stca021,s_browse[1].b_stca022,s_browse[1].b_stca023, 
                              s_browse[1].b_stca006,s_browse[1].b_stca007,s_browse[1].b_stca008,s_browse[1].b_stca013, 
                              s_browse[1].b_stca014,s_browse[1].b_stca015,s_browse[1].b_stca024,s_browse[1].b_stca025, 
                              s_browse[1].b_stca017,s_browse[1].b_stca018,s_browse[1].b_stca019,s_browse[1].b_stca020, 
                              s_browse[1].b_stca003,s_browse[1].b_stcasite,s_browse[1].b_stcaacti
 
         BEFORE CONSTRUCT
               DISPLAY astt601_filter_parser('stcadocno') TO s_browse[1].b_stcadocno
            DISPLAY astt601_filter_parser('stcadocdt') TO s_browse[1].b_stcadocdt
            DISPLAY astt601_filter_parser('stca000') TO s_browse[1].b_stca000
            DISPLAY astt601_filter_parser('stca001') TO s_browse[1].b_stca001
            DISPLAY '11' TO s_browse[1].b_stca005
            DISPLAY astt601_filter_parser('stca002') TO s_browse[1].b_stca002
            DISPLAY astt601_filter_parser('stca004') TO s_browse[1].b_stca004
            DISPLAY astt601_filter_parser('stca009') TO s_browse[1].b_stca009
            DISPLAY astt601_filter_parser('stca021') TO s_browse[1].b_stca021
            DISPLAY astt601_filter_parser('stca022') TO s_browse[1].b_stca022
            DISPLAY astt601_filter_parser('stca023') TO s_browse[1].b_stca023
            DISPLAY astt601_filter_parser('stca006') TO s_browse[1].b_stca006
            DISPLAY astt601_filter_parser('stca007') TO s_browse[1].b_stca007
            DISPLAY astt601_filter_parser('stca008') TO s_browse[1].b_stca008
            DISPLAY astt601_filter_parser('stca013') TO s_browse[1].b_stca013
            DISPLAY astt601_filter_parser('stca014') TO s_browse[1].b_stca014
            DISPLAY astt601_filter_parser('stca015') TO s_browse[1].b_stca015
            DISPLAY astt601_filter_parser('stca024') TO s_browse[1].b_stca024
            DISPLAY astt601_filter_parser('stca025') TO s_browse[1].b_stca025
            DISPLAY astt601_filter_parser('stca017') TO s_browse[1].b_stca017
            DISPLAY astt601_filter_parser('stca018') TO s_browse[1].b_stca018
            DISPLAY astt601_filter_parser('stca019') TO s_browse[1].b_stca019
            DISPLAY astt601_filter_parser('stca020') TO s_browse[1].b_stca020
            DISPLAY astt601_filter_parser('stca003') TO s_browse[1].b_stca003
            DISPLAY astt601_filter_parser('stcasite') TO s_browse[1].b_stcasite
            DISPLAY astt601_filter_parser('stcaacti') TO s_browse[1].b_stcaacti
      
                            #add-point:filter段cs_ctrl
            AFTER FIELD b_stca020   
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
 
      CALL astt601_filter_show('stcadocno')
   CALL astt601_filter_show('stcadocdt')
   CALL astt601_filter_show('stca000')
   CALL astt601_filter_show('stca001')
   CALL astt601_filter_show('stca005')
   CALL astt601_filter_show('stca002')
   CALL astt601_filter_show('stca004')
   CALL astt601_filter_show('stca009')
   CALL astt601_filter_show('stca021')
   CALL astt601_filter_show('stca022')
   CALL astt601_filter_show('stca023')
   CALL astt601_filter_show('stca006')
   CALL astt601_filter_show('stca007')
   CALL astt601_filter_show('stca008')
   CALL astt601_filter_show('stca013')
   CALL astt601_filter_show('stca014')
   CALL astt601_filter_show('stca015')
   CALL astt601_filter_show('stca024')
   CALL astt601_filter_show('stca025')
   CALL astt601_filter_show('stca017')
   CALL astt601_filter_show('stca018')
   CALL astt601_filter_show('stca019')
   CALL astt601_filter_show('stca020')
   CALL astt601_filter_show('stca003')
   CALL astt601_filter_show('stcasite')
   CALL astt601_filter_show('stcaacti')
 
END FUNCTION
 
{</section>}
 
{<section id="astt601.filter_parser" >}
#+ filter過濾功能
PRIVATE FUNCTION astt601_filter_parser(ps_field)
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
 
{<section id="astt601.filter_show" >}
#+ 顯示過濾條件
PRIVATE FUNCTION astt601_filter_show(ps_field)
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
   LET ls_condition = astt601_filter_parser(ps_field)
   IF NOT cl_null(ls_condition) THEN
      LET ls_title = ls_title, '※', ls_condition, '※'
   END IF
   
   #將資料顯示回去
   CALL lnode_item.setAttribute("text",ls_title)
   
END FUNCTION
 
{</section>}
 
{<section id="astt601.query" >}
#+ 資料查詢QBE功能準備
PRIVATE FUNCTION astt601_query()
   {<Local define>}
   DEFINE ls_wc STRING
   {</Local define>}
   #add-point:query段define
          CALL g_stcc_d.clear()
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
   CALL g_stcb_d.clear()
   CALL g_stcb2_d.clear()
 
 
   
   #add-point:query段other
   CALL g_stcv_d.clear()   
   CALL g_stck_d.clear()     #160513-00033#7    
   CALL g_stct_d.clear()     #160513-00033#7    
   #end add-point   
   
   DISPLAY ' ' TO FORMONLY.idx
   DISPLAY ' ' TO FORMONLY.cnt
   DISPLAY ' ' TO FORMONLY.b_index
   DISPLAY ' ' TO FORMONLY.b_count
   DISPLAY ' ' TO FORMONLY.h_index
   DISPLAY ' ' TO FORMONLY.h_count
   
   CALL astt601_construct()
 
   IF INT_FLAG THEN
      #取消查詢
      LET INT_FLAG = 0
      LET g_wc = ls_wc
      CALL astt601_browser_fill("")
      CALL astt601_fetch("")
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
      CALL astt601_filter_show('stcadocno')
   CALL astt601_filter_show('stcadocdt')
   CALL astt601_filter_show('stca000')
   CALL astt601_filter_show('stca001')
   CALL astt601_filter_show('stca005')
   CALL astt601_filter_show('stca002')
   CALL astt601_filter_show('stca004')
   CALL astt601_filter_show('stca009')
   CALL astt601_filter_show('stca021')
   CALL astt601_filter_show('stca022')
   CALL astt601_filter_show('stca023')
   CALL astt601_filter_show('stca006')
   CALL astt601_filter_show('stca007')
   CALL astt601_filter_show('stca008')
   CALL astt601_filter_show('stca013')
   CALL astt601_filter_show('stca014')
   CALL astt601_filter_show('stca015')
   CALL astt601_filter_show('stca024')
   CALL astt601_filter_show('stca025')
   CALL astt601_filter_show('stca017')
   CALL astt601_filter_show('stca018')
   CALL astt601_filter_show('stca019')
   CALL astt601_filter_show('stca020')
   CALL astt601_filter_show('stca003')
   CALL astt601_filter_show('stcasite')
   CALL astt601_filter_show('stcaacti')
   LET g_error_show = 1
   CALL astt601_browser_fill("F")
         
   IF g_browser_cnt = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "-100"
      LET g_errparam.extend = ""
      LET g_errparam.popup = TRUE
      CALL cl_err()
 
   ELSE
      CALL astt601_fetch("F") 
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="astt601.fetch" >}
#+ 指定PK後抓取單頭其他資料
PRIVATE FUNCTION astt601_fetch(p_flag)
   {<Local define>}
   DEFINE p_flag     LIKE type_t.chr1
   DEFINE ls_msg     STRING
   {</Local define>}
   #add-point:fetch段define
      
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
   
   LET g_stca_m.stcadocno = g_browser[g_current_idx].b_stcadocno
 
   
   #重讀DB,因TEMP有不被更新特性
    SELECT UNIQUE stca000,stcadocno,stcadocdt,stca005,stca001,stca002,stca003,stca004,stca009,stca010,stca011,stca012,stca027,stca021, 
        stca022,stca023,stca006,stca007,stca024,stca028,stca025,stca026,stca008,stcaacti,stca013,stca014,stca015,stca016,stca017, 
        stca018,stca019,stca020,stcasite,stcaunit,stcastus,stcaownid,stcaowndp,stcacrtid,stcacrtdp,stcacrtdt, 
        stcamodid,stcamoddt,stcacnfid,stcacnfdt
 INTO g_stca_m.stca000,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_stca_m.stca005,g_stca_m.stca001,g_stca_m.stca002, 
     g_stca_m.stca003,g_stca_m.stca004,g_stca_m.stca009,g_stca_m.stca010,g_stca_m.stca011,g_stca_m.stca012,g_stca_m.stca027,g_stca_m.stca021,g_stca_m.stca022,g_stca_m.stca023, 
     g_stca_m.stca006,g_stca_m.stca007,g_stca_m.stca024,g_stca_m.stca028,g_stca_m.stca025,g_stca_m.stca026,g_stca_m.stca008,g_stca_m.stcaacti, 
     g_stca_m.stca013,g_stca_m.stca014,g_stca_m.stca015,g_stca_m.stca016,g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca019, 
     g_stca_m.stca020,g_stca_m.stcasite,g_stca_m.stcaunit,g_stca_m.stcastus,g_stca_m.stcaownid,g_stca_m.stcaowndp, 
     g_stca_m.stcacrtid,g_stca_m.stcacrtdp,g_stca_m.stcacrtdt,g_stca_m.stcamodid,g_stca_m.stcamoddt, 
     g_stca_m.stcacnfid,g_stca_m.stcacnfdt
 FROM stca_t
 WHERE stcaent = g_enterprise AND stcadocno = g_stca_m.stcadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "stca_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
 
      INITIALIZE g_stca_m.* TO NULL
      RETURN
   END IF
   
   #add-point:fetch段action控制
   CALL cl_set_act_visible("modify,delete,insert,modify_detail",TRUE)
   IF g_stca_m.stcastus  NOT MATCHES "[NDR]" THEN   # N未確認/D抽單/R已拒絕允許修改
      CALL cl_set_act_visible("modify,delete,modify_detail",FALSE)
   ELSE
      CALL cl_set_act_visible("modify,delete,modify_detail",TRUE)
   END IF  
   CALL cl_set_act_visible("reproduce",FALSE)
   #end add-point  
   
   
   
   #add-point:fetch結束前
      
   #end add-point
   
   #LET g_data_owner =       
   #LET g_data_group =   
   
   #重新顯示   
   CALL astt601_show()
 
END FUNCTION
 
{</section>}
 
{<section id="astt601.insert" >}
#+ 資料新增
PRIVATE FUNCTION astt601_insert()
   #add-point:insert段define
   DEFINE l_success     LIKE type_t.num5 
   #ken---add---str 需求單號：141208-00001 項次：20
   DEFINE l_insert      LIKE type_t.num5 
   #ken---add---end    
   #end add-point    
   
   #清畫面欄位內容
   CLEAR FORM                    
   CALL g_stcb_d.clear()   
   CALL g_stcb2_d.clear()  
   CALL g_stcc_d.clear() 
   CALL g_stcv_d.clear() 
 
 
   INITIALIZE g_stca_m.* LIKE stca_t.*             #DEFAULT 設定
   
   LET g_stcadocno_t = NULL
 
   
   CALL s_transaction_begin()
   WHILE TRUE
      #公用欄位給值(單頭)
      #此段落由子樣板a14產生    
      LET g_stca_m.stcaownid = g_user
      LET g_stca_m.stcaowndp = g_dept
      LET g_stca_m.stcacrtid = g_user
      LET g_stca_m.stcacrtdp = g_dept 
      LET g_stca_m.stcacrtdt = cl_get_current()
      LET g_stca_m.stcamodid = ""
      LET g_stca_m.stcamoddt = ""
      #LET g_stca_m.stcastus = ""
 
 
 
      #append欄位給值
      
     
      #一般欄位給值
            LET g_stca_m.stca000 = "I"
      LET g_stca_m.stca005 = "11"
 
  
      #add-point:單頭預設值
      CALL g_stck_d.clear()     #160513-00033#7    
      CALL g_stct_d.clear()     #160513-00033#7    
      LET g_stca_m.stca002 = 1
      LET g_stca_m.stcadocdt = g_today
      LET g_stca_m.stca005 = '11'
      LET g_stca_m.stcastus = "N"   
      LET g_stca_m.stca013 = cl_get_current()
      #LET g_stca_m.stcasite = g_site #ken_mark
      #LET g_stca_m.stcaunit = g_site #ken_mark
      #ken---add---str 需求單號：141208-00001 項次：20
      LET g_site_flag = FALSE
      CALL s_aooi500_default(g_prog,'stcasite',g_stca_m.stcasite)
         RETURNING l_insert,g_stca_m.stcasite
      IF NOT l_insert THEN
         RETURN
      END IF
      LET g_stca_m.stcaunit = g_stca_m.stcasite
      #ken---add---end             
      CALL astt601_stcasite_ref()
      SELECT ooef017 INTO g_stca_m.stca014 FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_stca_m.stcasite
      #LET g_stca_m.stca017 = cl_get_current()
      #LET g_stca_m.stca018 = g_stca_m.stca017+1
      CALL astt601_stca014_ref()
      LET g_stca_m.stca008 = '1'
      LET g_stca_m.stcaacti = 'Y'
      LET g_stca_m.stca015 = g_user
      CALL astt601_stca015_ref()
      LET g_stca_m.stca016 = g_dept
      CALL astt601_stca016_ref()
     #IF NOT s_date_chk_lastday(g_stca_m.stca017) THEN
     #   LET g_stca_m.next_b = g_stca_m.stca018
     #ELSE
     #   LET g_stca_m.next_b = g_stca_m.stca017
     #END IF
      DISPLAY g_stca_m.next_b TO next_b
      CALL s_arti200_get_def_doc_type(g_site,g_prog,'1') RETURNING l_success,g_stca_m.stcadocno
      
      LET g_stca_m_t.* = g_stca_m.*
      LET g_stca_m_o.* = g_stca_m.*
      #end add-point 
     
      CALL astt601_input("a")
      
      #add-point:單頭輸入後
                  CALL g_stcc_d.clear()
      LET g_rec_b3 = 0 
      CALL g_stck_d.clear()     #160513-00033#7
      CALL g_stct_d.clear()     #160513-00033#7    
      #end add-point
      
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         LET g_stca_m.* = g_stca_m_t.*
         CALL astt601_show()
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 9001
         LET g_errparam.extend = ''
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         EXIT WHILE
      END IF
      
      CALL g_stcb_d.clear()
      CALL g_stcb2_d.clear()
      CALL g_stcv_d.clear()
 
 
      LET g_rec_b = 0
      CALL s_transaction_end('Y','0')
      EXIT WHILE
        
   END WHILE
   
   LET g_state = "Y"
   
   LET g_stcadocno_t = g_stca_m.stcadocno
 
   
   LET g_wc = g_wc,  
              " OR ( stcaent = '" ||g_enterprise|| "' AND",
              " stcadocno = '", g_stca_m.stcadocno CLIPPED, "' "
 
              , ") "
   
   CLOSE astt601_cl
   
END FUNCTION
 
{</section>}
 
{<section id="astt601.modify" >}
#+ 資料修改
PRIVATE FUNCTION astt601_modify()
   {<Local define>}
   DEFINE l_new_key    DYNAMIC ARRAY OF STRING
   DEFINE l_old_key    DYNAMIC ARRAY OF STRING
   DEFINE l_field_key  DYNAMIC ARRAY OF STRING
   {</Local define>}
   #add-point:modify段define
      
   #end add-point    
   
   IF g_stca_m.stcadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "std-00003"
      LET g_errparam.extend = ""
      LET g_errparam.popup = FALSE
      CALL cl_err()
 
      RETURN
   END IF
   
    SELECT UNIQUE stca000,stcadocno,stcadocdt,stca005,stca001,stca002,stca003,stca004,stca009,stca010,stca011,stca012,stca027,stca021, 
        stca022,stca023,stca006,stca007,stca024,stca028,stca025,stca026,stca008,stcaacti,stca013,stca014,stca015,stca016,stca017, 
        stca018,stca019,stca020,stcasite,stcaunit,stcastus,stcaownid,stcaowndp,stcacrtid,stcacrtdp,stcacrtdt, 
        stcamodid,stcamoddt,stcacnfid,stcacnfdt
 INTO g_stca_m.stca000,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_stca_m.stca005,g_stca_m.stca001,g_stca_m.stca002, 
     g_stca_m.stca003,g_stca_m.stca004,g_stca_m.stca009,g_stca_m.stca010,g_stca_m.stca011,g_stca_m.stca012,g_stca_m.stca027,g_stca_m.stca021,g_stca_m.stca022,g_stca_m.stca023, 
     g_stca_m.stca006,g_stca_m.stca007,g_stca_m.stca024,g_stca_m.stca028,g_stca_m.stca025,g_stca_m.stca026,g_stca_m.stca008,g_stca_m.stcaacti, 
     g_stca_m.stca013,g_stca_m.stca014,g_stca_m.stca015,g_stca_m.stca016,g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca019, 
     g_stca_m.stca020,g_stca_m.stcasite,g_stca_m.stcaunit,g_stca_m.stcastus,g_stca_m.stcaownid,g_stca_m.stcaowndp, 
     g_stca_m.stcacrtid,g_stca_m.stcacrtdp,g_stca_m.stcacrtdt,g_stca_m.stcamodid,g_stca_m.stcamoddt, 
     g_stca_m.stcacnfid,g_stca_m.stcacnfdt
 FROM stca_t
 WHERE stcaent = g_enterprise AND stcadocno = g_stca_m.stcadocno
 
   ERROR ""
  
   LET g_stcadocno_t = g_stca_m.stcadocno
 
   CALL s_transaction_begin()
   
   OPEN astt601_cl USING g_enterprise,g_stca_m.stcadocno
 
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code =  STATUS
      LET g_errparam.extend = "OPEN astt601_cl:"
      LET g_errparam.popup = TRUE
      CALL cl_err()
 
      CLOSE astt601_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #鎖住將被更改或取消的資料
   FETCH astt601_cl INTO g_stca_m.stca000,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_stca_m.stca005,g_stca_m.stca001, 
       g_stca_m.stca002,g_stca_m.stca003,g_stca_m.stca004,g_stca_m.stca004_desc,g_stca_m.stca009, 
       g_stca_m.stca009_desc,g_stca_m.stca021,g_stca_m.stca021_desc,g_stca_m.stca022,g_stca_m.stca022_desc, 
       g_stca_m.stca023,g_stca_m.stca023_desc,g_stca_m.stca006,g_stca_m.stca006_desc,g_stca_m.stca007,g_stca_m.stca007_desc, 
       g_stca_m.stca024,g_stca_m.stca024_desc,g_stca_m.stca025,g_stca_m.stca025_desc,g_stca_m.stca008, 
       g_stca_m.stcaacti,g_stca_m.stca013,g_stca_m.stca014,g_stca_m.stca014_desc,g_stca_m.stca015,g_stca_m.stca015_desc, 
       g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca019,g_stca_m.stca020,g_stca_m.stcasite,g_stca_m.stcasite_desc, 
       g_stca_m.stcaunit,g_stca_m.stcastus,g_stca_m.stcaownid,g_stca_m.stcaownid_desc,g_stca_m.stcaowndp, 
       g_stca_m.stcaowndp_desc,g_stca_m.stcacrtid,g_stca_m.stcacrtid_desc,g_stca_m.stcacrtdp,g_stca_m.stcacrtdp_desc, 
       g_stca_m.stcacrtdt,g_stca_m.stcamodid,g_stca_m.stcamodid_desc,g_stca_m.stcamoddt,g_stca_m.stcacnfid, 
       g_stca_m.stcacnfid_desc,g_stca_m.stcacnfdt
 
   #資料被他人LOCK, 或是sql執行時出現錯誤
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = g_stca_m.stcadocno
      LET g_errparam.popup = FALSE
      CALL cl_err()
 
      CLOSE astt601_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   
 
   CALL astt601_show()
   WHILE TRUE
      LET g_stcadocno_t = g_stca_m.stcadocno
 
      
      #寫入修改者/修改日期資訊(單頭)
      LET g_stca_m.stcamodid = g_user 
LET g_stca_m.stcamoddt = cl_get_current()
 
      
      #add-point:modify段修改前
      #檢查是否允許此動作
   IF NOT astt601_action_chk() THEN
      CLOSE astt601_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
      
      IF NOT astt601_chk_b() THEN
         CALL s_transaction_end('N','0')
         EXIT WHILE    
      END IF
      #「D抽單 / R已拒絕」狀況碼更改資料後，需還原為「N未確認」
      IF g_stca_m.stcastus MATCHES "[DR]" THEN
         LET g_stca_m.stcastus = "N"
      END IF      
      #end add-point
      
      CALL astt601_input("u")     #欄位更改
 
      #add-point:modify段修改後
            
      #end add-point
      
      IF INT_FLAG THEN
         LET INT_FLAG = 0
         LET g_stca_m.* = g_stca_m_t.*
         CALL astt601_show()        
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 9001
         LET g_errparam.extend = ''
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         EXIT WHILE
      END IF
      
      #若單頭key欄位有變更
      IF g_stca_m.stcadocno != g_stcadocno_t 
 
      THEN
         CALL s_transaction_begin()
         
         #add-point:單身fk修改前
                  
         #end add-point
         
         #更新單身key值
         UPDATE stcb_t SET stcbdocno = g_stca_m.stcadocno
 
          WHERE stcbent = g_enterprise AND stcbdocno = g_stcadocno_t
 
            
         #add-point:單身fk修改中
                  
         #end add-point
 
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00009"
               LET g_errparam.extend = "stcb_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               CALL s_transaction_end('N','0')
               CONTINUE WHILE
            WHEN SQLCA.sqlcode #其他錯誤
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stcb_t"
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
         UPDATE stcd_t
            SET stcddocno = g_stca_m.stcadocno
 
          WHERE stcdent = g_enterprise AND
                stcddocno = g_stcadocno_t
 
         #add-point:單身fk修改中
                  
         #end add-point
         CASE
            WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00009"
               LET g_errparam.extend = "stcd_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               CALL s_transaction_end('N','0')
               CONTINUE WHILE
            WHEN SQLCA.sqlcode #其他錯誤
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stcd_t"
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
   IF NOT cl_log_modified_record(g_stca_m.stcadocno,g_site) THEN 
      CALL s_transaction_end('N','0')
   END IF
 
   CLOSE astt601_cl
   CALL s_transaction_end('Y','0')
 
   #流程通知預埋點-U
   CALL cl_flow_notify(g_stca_m.stcadocno,'U')
 
END FUNCTION   
 
{</section>}
 
{<section id="astt601.input" >}
#+ 資料輸入
PRIVATE FUNCTION astt601_input(p_cmd)
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
   DEFINE  t_stca004             LIKE stca_t.stca004
   DEFINE  l_flag                LIKE type_t.chr1
   DEFINE  l_sys                 LIKE type_t.num5
   DEFINE  l_sys_1               LIKE type_t.chr1
   DEFINE  l_success             LIKE type_t.num5

   DEFINE  l_stce017             LIKE stce_t.stce017
   DEFINE  l_stce018             LIKE stce_t.stce018
   DEFINE  l_stcw003             LIKE stcw_t.stcw003
   DEFINE  l_ac1                 LIKE type_t.num5
   DEFINE  l_stcf019             LIKE stcf_t.stcf019
   DEFINE  l_stcvseq             LIKE stcv_t.stcvseq
   DEFINE  l_stcv003             LIKE stcv_t.stcv003
   #ken---add---str 需求單號：141208-00001 項次：20
   DEFINE  l_errno               LIKE type_t.chr10
   #ken---add---end     
   DEFINE  l_dbba002             LIKE dbba_t.dbba002
   DEFINE  l_dbbc004             LIKE dbbc_t.dbbc004
   DEFINE  l_ooef019             LIKE ooef_t.ooef019
   #add--2015/05/08 By shiun--(S)
   DEFINE  l_oofg_return    DYNAMIC ARRAY OF RECORD
                     oofg019     LIKE oofg_t.oofg019,   #field
                     oofg020     LIKE oofg_t.oofg020    #value
                           END RECORD
   #add--2015/05/08 By shiun--(E)
   DEFINE l_substring            STRING                  #160513-00033#7
   DEFINE l_index                LIKE type_t.num5        #160513-00033#7
   DEFINE l_seq                  LIKE type_t.num5        #160513-00033#7
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
         LET g_forupd_sql = "SELECT stccseq2,stcc002,stcc003,stcc004 FROM stcc_t WHERE stccent=? AND stccdocno=? AND stccseq1=? AND stccseq2 = ? FOR UPDATE"
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE astt601_bcl3 CURSOR FROM g_forupd_sql
   #end add-point 
   LET g_forupd_sql = "SELECT stcbseq,stcb002,'',stcb021,stcb003,stcb004,stcb005,stcb006,stcb007,stcb008,'', 
       stcb009,'',stcb010,stcb011,stcb012,stcb013,stcb014,stcb015,stcb016,stcb017,stcb018,stcbunit,stcbsite  
       FROM stcb_t WHERE stcbent=? AND stcbdocno=? AND stcbseq=? FOR UPDATE"
   #add-point:input段define_sql
      
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE astt601_bcl CURSOR FROM g_forupd_sql
   
   #add-point:input段define_sql
      
   #end add-point    
   LET g_forupd_sql = "SELECT stcdseq,stcd002,'',stcd003,stcdunit,stcdsite FROM stcd_t WHERE stcdent=?  
       AND stcddocno=? AND stcdseq=? FOR UPDATE"
   #add-point:input段define_sql
      
   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE astt601_bcl2 CURSOR FROM g_forupd_sql
 
 
   
 
 
   #add-point:input段define_sql
   LET g_forupd_sql = "SELECT stcvsite,stcvunit,stcvseq,stcv002,stcv003,stcv004,stcv005,stcv006 FROM stcv_t WHERE stcvent=? AND stcvdocno=? AND  
       stcvseq=? FOR UPDATE"
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE astt601_bcl4 CURSOR FROM g_forupd_sql  
   #160513-00033#7--(S)
   LET g_forupd_sql = "SELECT stcksite,stckunit,stckseq,stck001,stck002,stck003,stck004,stck005,stck006,stck007,stck008,stck009,stck010,stck011,stck012,stck013,stck014 FROM stck_t ",
                      " WHERE stckent=? AND stckdocno=? AND  stckseq=? FOR UPDATE"
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE astt601_bcl5 CURSOR FROM g_forupd_sql
   LET g_forupd_sql = "SELECT stctsite,stctunit,stctseq,stct001 FROM stct_t ",
                      " WHERE stctent=? AND stctdocno=? AND  stctseq=? FOR UPDATE"
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE astt601_bcl6 CURSOR FROM g_forupd_sql 
   #160513-00033#7--(E)   
   #end add-point 
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
   LET g_qryparam.state = 'i'
   
   #控制key欄位可否輸入
   CALL astt601_set_entry(p_cmd)
   #add-point:set_entry後
      
   #end add-point
   CALL astt601_set_no_entry(p_cmd)
 
   DISPLAY BY NAME g_stca_m.stca000,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_stca_m.stca005,g_stca_m.stca001, 
       g_stca_m.stca002,g_stca_m.stca003,g_stca_m.stca004,g_stca_m.stca009,g_stca_m.stca021, 
       g_stca_m.stca022,g_stca_m.stca023,g_stca_m.stca006,g_stca_m.stca007,g_stca_m.stca024,g_stca_m.stca025, 
       g_stca_m.stca008,g_stca_m.stcaacti,g_stca_m.stca013,g_stca_m.stca014,g_stca_m.stca015,g_stca_m.stca017, 
       g_stca_m.stca018,g_stca_m.stca019,g_stca_m.stca020,g_stca_m.stcasite,g_stca_m.stcaunit,g_stca_m.stcastus 
 
   
   LET lb_reproduce = FALSE
   
   #add-point:資料輸入前
   LET g_ooef004 = ''
   LET g_ooef005 = ''
   SELECT ooef004,ooef005 INTO g_ooef004,g_ooef005 FROM ooef_t
    WHERE ooefent = g_enterprise
      AND ooef001 = g_site
   IF cl_null(g_ooef004) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'art-00007'
      LET g_errparam.extend = g_site
      LET g_errparam.popup = TRUE
      CALL cl_err()

   END IF 
   IF cl_null(g_ooef005) THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'art-00008'
      LET g_errparam.extend = g_site
      LET g_errparam.popup = TRUE
      CALL cl_err()

   END IF  
   LET t_stca.* = g_stca_m.*
   LET t_stca004 = g_stca_m.stca004
   
   LET l_flag = TRUE
   LET g_flag = FALSE
   #end add-point
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
   
 
{</section>}
 
{<section id="astt601.input.head" >}
      #單頭段
      INPUT BY NAME g_stca_m.stca000,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_stca_m.stca005,g_stca_m.stca001, 
          g_stca_m.stca002,g_stca_m.stca003,g_stca_m.stca004,g_stca_m.stca009,g_stca_m.stca010,
          g_stca_m.stca011,g_stca_m.stca012,g_stca_m.stca027,g_stca_m.stca021, 
          g_stca_m.stca022,g_stca_m.stca023,g_stca_m.stca006,g_stca_m.stca007,g_stca_m.stca024,g_stca_m.stca028,g_stca_m.stca025,g_stca_m.stca026, 
          g_stca_m.stca008,g_stca_m.stcaacti,g_stca_m.stca013,g_stca_m.stca014,g_stca_m.stca015,g_stca_m.stca016,g_stca_m.stca017, 
          g_stca_m.stca018,g_stca_m.stca019,g_stca_m.stca020,g_stca_m.next_b,g_stca_m.stcasite,g_stca_m.stcaunit,g_stca_m.ooff013,g_stca_m.stcastus  
 
         ATTRIBUTE(WITHOUT DEFAULTS)
         
         #自訂ACTION(master_input)
         
     
         BEFORE INPUT
            
            IF l_cmd_t = 'r' THEN
               
            END IF
            #add-point:資料輸入前
                                    CALL astt601_set_entry(p_cmd)
 
            CALL astt601_set_no_entry(p_cmd)
            IF p_cmd = 'a' THEN
#               NEXT FIELD stcadocno
                NEXT FIELD stcasite
            END IF
            #end add-point
 
         #---------------------------<  Master  >---------------------------
         #----<<stca000>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca000
            #add-point:BEFORE FIELD stca000
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca000
            
            #add-point:AFTER FIELD stca000
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stca000
            #add-point:ON CHANGE stca000
            CALL astt601_set_entry(p_cmd)
            CALL astt601_set_no_entry(p_cmd)
                  
            CALL astt601_clear()
            IF g_stca_m.stca000 = 'I' THEN
               CALL cl_set_comp_visible('page_4',TRUE)
            ELSE
               CALL cl_set_comp_visible('page_4',FALSE)
            END IF
         
            #END add-point
 
         #----<<stcadocno>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcadocno
            #add-point:BEFORE FIELD stcadocno
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcadocno
            
            #add-point:AFTER FIELD stcadocno
            #此段落由子樣板a05產生
            #160613-00026#1 160619 by sakura mark(S)
            #IF NOT cl_null(g_stca_m.stcadocno) AND p_cmd = 'a' THEN
            #  #IF NOT s_aooi200_chk_slip(g_site,'',g_stca_m.stcadocno,g_prog) THEN #sakura mark
            #   IF NOT s_aooi200_chk_slip(g_stca_m.stcasite,'',g_stca_m.stcadocno,g_prog) THEN #sakura add
            #      LET g_stca_m.stcadocno = g_stca_m_t.stcadocno
            #      NEXT FIELD CURRENT
            #   END IF
            #END IF
            #IF  NOT cl_null(g_stca_m.stcadocno) THEN 
            #   IF p_cmd = 'a' OR ( p_cmd = 'u' AND ( p_cmd = 'u' AND (g_stca_m.stcadocno != g_stcadocno_t ))) THEN
            #      IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stca_t WHERE "||"stcaent = '" ||g_enterprise|| "' AND "||"stcadocno = '"||g_stca_m.stcadocno ||"'",'std-00004',0) THEN
            #         NEXT FIELD CURRENT
            #      END IF
            #   END IF
            #   
            #                 
            #  #CALL s_aooi200_gen_docno(g_site,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_prog) RETURNING l_flag,g_stca_m.stcadocno #sakura mark
            #   CALL s_aooi200_gen_docno(g_stca_m.stcasite,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_prog) RETURNING l_flag,g_stca_m.stcadocno #sakura add
            #   IF NOT l_flag THEN
            #      INITIALIZE g_errparam TO NULL
            #      LET g_errparam.code = 'apm-00003'
            #      LET g_errparam.extend = g_stca_m.stcadocno
            #      LET g_errparam.popup = TRUE
            #      CALL cl_err()
            #   
            #      LET g_stca_m.stcadocno = g_stca_m_t.stcadocno
            #      DISPLAY g_stca_m.stcadocno TO stcadocno
            #      NEXT FIELD CURRENT
            #   END IF
            #   LET g_flag = TRUE
            #ELSE
            #   NEXT FIELD CURRENT
            #END IF
            #160613-00026#1 160619 by sakura mark(E)
            IF  NOT cl_null(g_stca_m.stcadocno) THEN  
               IF p_cmd = 'a' OR ( p_cmd = 'u' AND (g_stca_m.stcadocno != g_stcadocno_t )) THEN
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stca_t WHERE "||"stcaent = '" ||g_enterprise|| "' AND "||"stcadocno = '"||g_stca_m.stcadocno ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
                  IF NOT s_aooi200_chk_slip(g_stca_m.stcasite,'',g_stca_m.stcadocno,g_prog) THEN
                     LET g_stca_m.stcadocno = g_stcadocno_t
                     NEXT FIELD CURRENT
                  END IF  
               END IF                  
            END IF            
            #160613-00026#1 160619 by sakura add(S)
            
            #160613-00026#1 160619 by sakura add(E)
            CALL astt601_set_entry(p_cmd)
            CALL astt601_set_no_entry(p_cmd)
            

            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcadocno
            #add-point:ON CHANGE stcadocno
                        
            #END add-point
 
         #----<<stcadocdt>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcadocdt
            #add-point:BEFORE FIELD stcadocdt
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcadocdt
            
            #add-point:AFTER FIELD stcadocdt
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcadocdt
            #add-point:ON CHANGE stcadocdt
                        
            #END add-point
 
         #----<<stca005>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca005
            #add-point:BEFORE FIELD stca005
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca005
            
            #add-point:AFTER FIELD stca005
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stca005
            #add-point:ON CHANGE stca005
             IF NOT cl_null(g_stca_m.stca004) THEN
                  SELECT stag002 INTO l_stag002 FROM stag_t WHERE stagent = g_enterprise AND stag001 = g_stca_m.stca004
                  IF l_stag002 <> g_stca_m.stca005 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00023'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_stca_m.stca005 = g_stca_m_t.stca005
                     NEXT FIELD stca005   
                  END IF
             END IF
             
              #IF NOT cl_null(g_stca_m.stca009) AND NOT cl_null(g_stca_m.stca005)         
              #    AND NOT cl_null(g_stca_m.stca017) AND NOT cl_null(g_stca_m.stca018) THEN
              #    IF NOT astt601_interval_chk(p_cmd) THEN
              #       LET g_stca_m.stca005 = g_stca_m_t.stca005
              #       NEXT FIELD stca005   
              #    END IF        
              #END IF  
              
              IF NOT cl_null(g_stca_m.stca010) AND NOT cl_null(g_stca_m.stca027) THEN
                 IF t_stca.stca005 <> g_stca_m.stca005 AND  NOT cl_null(t_stca.stca005) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00118'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_stca_m.stca005 = g_stca_m_t.stca005
                     NEXT FIELD stca005  
                 END IF        
              END IF
              LET t_stca.stca005 = g_stca_m.stca005
            #END add-point
 
         #----<<stca001>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca001
            #add-point:BEFORE FIELD stca001
            CALL cl_get_para(g_enterprise,g_site,'E-CIR-0010') RETURNING l_sys_1
            IF l_sys_1 = 'Y' THEN
               IF p_cmd = 'a' AND g_stca_m.stca000 = 'I' AND cl_null(g_stca_m.stca001) THEN    
#                  CALL s_aooi390('26') RETURNING l_flag,g_stca_m.stca001
                  CALL s_aooi390_gen('26') RETURNING l_success,g_stca_m.stca001,l_oofg_return   #add--2015/05/08 By shiun
                  IF NOT astt601_stca001_chk(p_cmd,g_stca_m.stca001) THEN
                     LET g_stca_m.stca001 = ''
                  END IF
                  
               END IF     
            END IF               
            #END add-point
   
         #此段落由子樣板a02產生
         AFTER FIELD stca001
            
            #add-point:AFTER FIELD stca001
             IF NOT cl_null(g_stca_m.stca001) THEN
               IF NOT astt601_stca001_chk(p_cmd,g_stca_m.stca001) THEN
                  LET g_stca_m.stca001 = g_stca_m_o.stca001
                  NEXT FIELD stca001
               END IF
               #U修改时，如果合同有异动自动带出单身
               IF g_stca_m.stca000 = 'U' AND (cl_null(g_stca_m_o.stca001) OR g_stca_m_o.stca001 <>  g_stca_m.stca001) THEN
                  #160628-00032#1 160629 by sakura mark(S)
                  #IF NOT astt601_stca001_genb() THEN
                  #   LET g_stca_m.stca001 = g_stca_m_o.stca001
                  #   NEXT FIELD stca001
                  #END IF
                  CALL astt601_stca001_other()
                  #CALL astt601_b_fill()
                  #LET l_ac3 = 1
                  #CALL astt601_b3_fill()
                  #CALL astt601_reflesh()
                  #LET g_stca_m_o.stca001 = g_stca_m.stca001
                  #160628-00032#1 160629 by sakura mark(E)
                  IF g_stca_m.stca005 = '11' THEN
                     CALL cl_set_comp_visible('page_1',TRUE)
                     CALL cl_set_comp_visible('stcb021',TRUE)
                  ELSE
                     CALL cl_set_comp_visible('page_1',FALSE)
                     CALL cl_set_comp_visible('stcb021',FALSE)
                  END IF
                  IF g_stca_m.stca000 = 'I' THEN
                     CALL cl_set_comp_visible('page_4',TRUE)
                  ELSE
                     CALL cl_set_comp_visible('page_4',FALSE)
                  END IF
               END IF
               IF g_stca_m.stca000 = 'I' THEN  
                   #网点为空。结算编号 = 当前合约编号
                  IF cl_null(g_stca_m.stca010) THEN
                     LET g_stca_m.stca027 = g_stca_m.stca001
                     DISPLAY BY NAME g_stca_m.stca027
                  END IF
                  #add--2015/05/18 By shiun--(S)
                  IF NOT s_aooi390_chk('26',g_stca_m.stca001) THEN
                     LET g_stca_m.stca001 = g_stca_m_t.stca001
                     DISPLAY BY NAME g_stca_m.stca001
                     NEXT FIELD CURRENT
                  END IF
                  #add--2015/05/18 By shiun--(E)
               END IF
               CALL cl_set_comp_entry("stca000",FALSE)
               IF g_stca_m.stca000 = 'U' THEN 
                  CALL cl_set_comp_entry("stca004,stca005",FALSE)
               ELSE
                  CALL cl_set_comp_entry("stca004,stca005",TRUE)               
               END IF               
            ELSE
               CALL cl_set_comp_entry("stca000",TRUE)            
            END IF
            CALL astt601_set_entry(p_cmd)
            CALL astt601_set_no_entry(p_cmd)
            CALL astt601_set_visible()
            
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stca001
            #add-point:ON CHANGE stca001
            
            #END add-point
 
         #----<<stca002>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca002
            #add-point:BEFORE FIELD stca002
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca002
            
            #add-point:AFTER FIELD stca002
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stca002
            #add-point:ON CHANGE stca002
                        
            #END add-point
 
         #----<<stca003>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca003
            #add-point:BEFORE FIELD stca003
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca003
            
            #add-point:AFTER FIELD stca003
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stca003
            #add-point:ON CHANGE stca003
                        
            #END add-point     
                        
         
                        
     
 
                        
 
 
         #----<<stca004>>----
         #此段落由子樣板a02產生
         AFTER FIELD stca004
            
            #add-point:AFTER FIELD stca004
                                   LET g_stca_m.stca004_desc = ''
           DISPLAY BY NAME  g_stca_m.stca004_desc
           IF NOT cl_null(g_stca_m.stca004) THEN
              IF NOT astt601_stca004_chk(g_stca_m.stca004) THEN
                  LET g_stca_m.stca004 = g_stca_m_t.stca004
                  CALL astt601_stca004_ref()
                  NEXT FIELD stca004
               END IF 
               
                IF NOT cl_null(g_stca_m.stca005) THEN
                  SELECT stag002 INTO l_stag002 FROM stag_t WHERE stagent = g_enterprise AND stag001 = g_stca_m.stca004
                  IF l_stag002 <> g_stca_m.stca005 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00023'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET g_stca_m.stca004 = g_stca_m_t.stca004
                     CALL astt601_stca004_ref()
                     NEXT FIELD stca004   
                  END IF
               END IF
           END IF
           CALL astt601_stca004_ref()
            IF g_stca_m.stca004 <>t_stca004 OR  t_stca004 is null THEN
               CALL astt601_stca004_other()
            END IF
            LET t_stca004 =  g_stca_m.stca004
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca004
            #add-point:BEFORE FIELD stca004
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stca004
            #add-point:ON CHANGE stca004
                        
            #END add-point
 
         #----<<stca009>>----
         #此段落由子樣板a02產生
         AFTER FIELD stca009
            
            #add-point:AFTER FIELD stca009
            LET g_stca_m.stca009_desc = ''
            DISPLAY BY NAME g_stca_m.stca009_desc
            IF NOT cl_null(g_stca_m.stca009) THEN 
               IF NOT astt601_stca009_chk(g_stca_m.stca009) THEN
                  LET g_stca_m.stca009 = g_stca_m_t.stca009
                  CALL astt601_stca009_ref()
                  NEXT FIELD stca009
               END IF
               #160913-00022#1 20160914 add by beckxie---S
               #相關經銷商頁籤維護值,需控卡不可與單頭的經銷商相同
               #單頭維護檢查是否已存在單身
               LET l_cnt = 0
               SELECT COUNT(1) INTO l_cnt FROM stct_t
               WHERE stctent = g_enterprise
                 AND stctdocno = g_stca_m.stcadocno
                 AND stct001 = g_stca_m.stca009
               IF l_cnt > 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00861'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_stca_m.stca009 = g_stca_m_t.stca009
                  CALL astt601_stca009_ref()
                  NEXT FIELD stca009
               END IF
               #160913-00022#1 20160914 add by beckxie---E
               IF NOT cl_null(g_stca_m.stca010) THEN 
                  IF NOT astt601_stca009_stca010_chk(g_stca_m.stca009,g_stca_m.stca010) THEN
                     LET g_stca_m.stca009 = g_stca_m_t.stca009
                     CALL astt601_stca009_ref()
                     NEXT FIELD stca009
                  END IF

                     #經銷商沒有簽訂合約的報錯
                     SELECT COUNT(*) INTO l_n FROM stce_t 
                      WHERE stceent = g_enterprise AND stce009 = g_stca_m.stca009 AND stce005 =g_stca_m.stca005 AND stcestus = 'Y'
                     IF l_n = 0 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'ast-00112'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        LET g_stca_m.stca009 = g_stca_m_t.stca009
                        NEXT FIELD stca009
                     ELSE
                         #經銷商簽訂合約失效的報錯
                        SELECT COUNT(*) INTO l_n FROM stce_t 
                         WHERE stceent = g_enterprise AND stce009 = g_stca_m.stca009  AND stce005 =g_stca_m.stca005 AND stca018 >= g_today AND stcastus = 'Y'
                        IF l_n = 0 THEN
                          INITIALIZE g_errparam TO NULL
                          LET g_errparam.code = 'ast-00117'
                          LET g_errparam.extend = ''
                          LET g_errparam.popup = TRUE
                          CALL cl_err()
                        
                          LET g_stca_m.stca009 = g_stca_m_t.stca009
                          NEXT FIELD stca009
                        END IF                   
                     END IF
                      #结算合同不为空
                     IF NOT cl_null(g_stca_m.stca027 ) THEN
                        SELECT COUNT(*) INTO l_n FROM stce_t 
                         WHERE stceent = g_enterprise AND stce001 = g_stca_m.stca027 AND stce009 =g_stca_m.stca009
                        IF l_n = 0 THEN
                            INITIALIZE g_errparam TO NULL
                           LET g_errparam.code = 'ast-00128'
                           LET g_errparam.extend = ''
                           LET g_errparam.popup = TRUE
                           CALL cl_err()
                         
                           LET g_stca_m.stca009 = g_stca_m_t.stca009
                           NEXT FIELD stca009
                        END IF                       
                     END IF
                                     
               
                  LET g_stca_m.stca008 = '2' 
               ELSE
                  LET g_stca_m.stca008 = '1'               
               END IF
               IF (p_cmd = 'a' AND cl_null(t_stca.stca009))  OR ( NOT cl_null(t_stca.stca009) AND g_stca_m.stca009 <> t_stca.stca009 ) THEN
                   CALL astt601_stca009_other()                      
               END IF
               LET t_stca.stca009 = g_stca_m.stca009
            END IF
            CALL astt601_stca009_ref() 
            
            
          AFTER FIELD stca010
            LET g_stca_m.stca010_desc = ''
            DISPLAY BY NAME g_stca_m.stca010_desc
            IF NOT cl_null(g_stca_m.stca010) THEN 
               IF NOT astt601_stca010_chk(g_stca_m.stca010) THEN
                  LET g_stca_m.stca010 = g_stca_m_t.stca010
                  CALL astt601_stca010_ref()
                  NEXT FIELD stca010
               END IF               
               IF NOT cl_null(g_stca_m.stca009) THEN
                  IF NOT astt601_stca009_stca010_chk(g_stca_m.stca009,g_stca_m.stca010) THEN
                     LET g_stca_m.stca010 = g_stca_m_t.stca010
                     CALL astt601_stca010_ref()
                     NEXT FIELD stca010
                  END IF
                 # IF NOT cl_null(g_stca_m.stca017) AND NOT cl_null(g_stca_m.stca018) THEN
                 #   IF NOT astt601_interval_chk(p_cmd) THEN
                 #      LET g_stca_m.stca010 = g_stca_m_t.stca010
                 #      CALL astt601_stca010_ref()
                 #      NEXT FIELD stca010
                 #   END IF        
                 # END IF 
                  
                  IF g_stca_m.stca000 = 'I' THEN
                     #經銷商沒有簽訂合約的報錯
                     SELECT COUNT(*) INTO l_n FROM stce_t 
                      WHERE stceent = g_enterprise AND stce009 = g_stca_m.stca009 AND stce005 =g_stca_m.stca005 AND stcestus = 'Y'
                     IF l_n = 0 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'ast-00112'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()

                        LET g_stca_m.stca010 = ''
                        NEXT FIELD stca010
                     END IF
                     IF ((NOT cl_null(t_stca.stca010) AND  g_stca_m.stca010 <> t_stca.stca010) OR cl_null(t_stca.stca010)) THEN
                        CALL astt601_stca010_other()
                     END IF
                   END IF
                END IF
                CALL astt601_stcb005_chk(0) RETURNING l_success,l_ac1
                IF NOT l_success THEN
                   LET g_stca_m.stca010 = g_stca_m_t.stca010
                   CALL astt601_stca010_ref()
                   NEXT FIELD stca010
                END IF
                LET g_stca_m.stca008 = '2'
            ELSE
               LET g_stca_m.stca008 = '1'
               IF g_stca_m.stca000 = 'I' THEN 
                 LET g_stca_m.stca027 = g_stca_m.stca001
                 DISPLAY BY NAME g_stca_m.stca027 
               END IF
            END IF
            LET t_stca.stca010 = g_stca_m.stca010
            CALL astt601_stca010_ref() 
            CALL astt601_set_entry(p_cmd)
            CALL astt601_set_no_entry(p_cmd)
            CALL astt601_set_visible()
            
        
      AFTER FIELD stca012       
         IF NOT cl_null(g_stca_m.stca012) THEN 
#               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stca_m.stca012 != g_stca_m_t.stca012 OR g_stca_m_t.stca012 IS NULL )) THEN   #150427-00012#7 20150707 mark by beckxie
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stca_m.stca012 != g_stca_m_t.stca012 OR cl_null(g_stca_m_t.stca012) )) THEN   #150427-00012#7 20150707 add by beckxie
                  #此段落由子樣板a19產生
                  #校驗代值
                  #設定g_chkparam.*的參數前，先將其初始化，避免之前設定遺留的參數值造成影響。
                  INITIALIZE g_chkparam.* TO NULL
                  
                  #設定g_chkparam.*的參數
                  LET g_chkparam.arg1 = g_stca_m.stca012
                  LET g_chkparam.arg2 = '1'
                  LET g_chkparam.err_str[1] = "aoo-00299|",'1'
                  #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_oojd001") THEN
                     #檢查失敗時後續處理
                     LET g_stca_m.stca012 = g_stca_m_t.stca012
                     CALL s_desc_get_oojdl003_desc(g_stca_m.stca012) RETURNING g_stca_m.stca012_desc
                     DISPLAY BY NAME g_stca_m.stca012_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF 
            CALL s_desc_get_oojdl003_desc(g_stca_m.stca012) RETURNING g_stca_m.stca012_desc
            DISPLAY BY NAME g_stca_m.stca012_desc   
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca009
            #add-point:BEFORE FIELD stca009
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stca009
            #add-point:ON CHANGE stca009
       
          
          
          
         AFTER FIELD stca027
            IF NOT cl_null(g_stca_m.stca027) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND g_stca_m.stca027 <>t_stca.stca027) THEN
                  IF NOT astt601_stca027_chk() THEN
                     LET g_stca_m.stca027 = t_stca.stca027
                     NEXT FIELD stca027
                  END IF
                  CALL astt601_stca027_other()                  
               END IF
            END IF
             
            #END add-point
 
         #----<<stca021>>----
         #此段落由子樣板a02產生
         AFTER FIELD stca021
            
            #add-point:AFTER FIELD stca021
                                    LET g_stca_m.stca021_desc = ''
            DISPLAY BY NAME g_stca_m.stca021_desc
            IF NOT cl_null(g_stca_m.stca021) THEN
               IF NOT astt601_stca021_chk(g_stca_m.stca021) THEN
                  LET g_stca_m.stca021 = g_stca_m_t.stca021
                  CALL astt601_stca021_ref()
                  NEXT FIELD stca021
               END IF   
            END IF
            CALL astt601_stca021_ref() 
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca021
            #add-point:BEFORE FIELD stca021
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stca021
            #add-point:ON CHANGE stca021
                        
            #END add-point
 
         #----<<stca022>>----
         #此段落由子樣板a02產生
         AFTER FIELD stca022
            
            #add-point:AFTER FIELD stca022
                                    LET g_stca_m.stca022_desc = ''
            DISPLAY BY NAME g_stca_m.stca022_desc
            IF NOT cl_null(g_stca_m.stca022) THEN
               IF NOT astt601_stca022_chk(g_stca_m.stca022) THEN
                  LET g_stca_m.stca022 = g_stca_m_t.stca022 
                  CALL astt601_stca022_ref()
                  NEXT FIELD stca022
               END IF 
               CALL astt601_stca022_ref()             
            ELSE
               LET g_stca_m.stca022_desc = ''
               DISPLAY BY NAME g_stca_m.stca022_desc
            END IF
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca022
            #add-point:BEFORE FIELD stca022
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stca022
            #add-point:ON CHANGE stca022
                        
            #END add-point
 
         #----<<stca023>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca023
            #add-point:BEFORE FIELD stca023
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca023
            
            #add-point:AFTER FIELD stca023
            LET g_stca_m.stca023_desc = ''
            DISPLAY BY NAME g_stca_m.stca023_desc 
            IF NOT cl_null(g_stca_m.stca023) THEN
               INITIALIZE g_chkparam.* TO NULL
               LET g_errshow = '1'
               LET g_chkparam.arg1 = g_stca_m.stca023
               #160318-00025#38  2016/04/20  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "apm-00184:sub-01302|aooi714|",cl_get_progname("aooi714",g_lang,"2"),"|:EXEPROGaooi714"
               #160318-00025#38  2016/04/20  by pengxin  add(E)
               IF NOT cl_chk_exist("v_ooib002_1") THEN
                  LET g_stca_m.stca023 = g_stca_m_t.stca023
                  CALL astt601_stca023_ref()
                  NEXT FIELD stca023
               END IF
            END IF
            CALL astt601_stca023_ref()         
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stca023
            #add-point:ON CHANGE stca023
                        
            #END add-point
 
         #----<<stca006>>----
         #此段落由子樣板a02產生
         AFTER FIELD stca006
            
            #add-point:AFTER FIELD stca006
            LET g_stca_m.stca006_desc = ''
            DISPLAY BY NAME g_stca_m.stca006_desc
            IF NOT cl_null(g_stca_m.stca006) THEN
               IF NOT astt601_stca006_chk(g_stca_m.stca006)THEN 
                  LET g_stca_m.stca006 = g_stca_m_t.stca006
                  CALL astt601_stca006_ref()
                  NEXT FIELD stca006
               END IF
               
               #计算下次计算日
               IF NOT astt601_stca017_018_chk(p_cmd,'stca006') THEN
                  LET g_stca_m.stca017 = g_stca_m_t.stca017
                  NEXT FIELD stca017
               END IF
            END IF
            CALL astt601_stca006_ref()
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca006
            #add-point:BEFORE FIELD stca006
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stca006
            #add-point:ON CHANGE stca006
                        
            #END add-point
 
         #----<<stca007>>----
         #此段落由子樣板a02產生
         AFTER FIELD stca007
            
            #add-point:AFTER FIELD stca007
                                    LET g_stca_m.stca007_desc = ''
            DISPLAY BY NAME g_stca_m.stca007_desc
            IF NOT cl_null(g_stca_m.stca007) THEN
               IF NOT astt601_stca007_chk(g_stca_m.stca007)THEN 
                  LET g_stca_m.stca007 = g_stca_m_t.stca007
                  CALL astt601_stca007_ref()
                  NEXT FIELD stca007
               END IF
            END IF
            CALL astt601_stca007_ref()
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca007
            #add-point:BEFORE FIELD stca007
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stca007
            #add-point:ON CHANGE stca007
                        
            #END add-point
 
         #----<<stca024>>----
         #此段落由子樣板a02產生
         AFTER FIELD stca024
            
            #add-point:AFTER FIELD stca024
           LET g_stca_m.stca024_desc = ''
           DISPLAY BY NAME  g_stca_m.stca024_desc 
           IF NOT cl_null(g_stca_m.stca024) THEN
#               IF NOT astt601_stca024_chk(g_stca_m.stca024)THEN 
#                  LET g_stca_m.stca024 = g_stca_m_t.stca024
#                  CALL astt601_stca024_ref()
#                  NEXT FIELD stca024
#               END IF
              IF s_aooi500_setpoint(g_prog,'stca024') THEN
                  CALL s_aooi500_chk(g_prog,'stca024',g_stca_m.stca024,g_site) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stca_m.stca024
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     LET g_stca_m.stca024 = g_stca_m_t.stca024
                     CALL s_desc_get_department_desc(g_stca_m.stca024) RETURNING g_stca_m.stca024_desc
                     DISPLAY BY NAME g_stca_m.stca024,g_stca_m.stca024_desc
                     NEXT FIELD CURRENT
                  END IF
               ELSE
                  IF NOT astt601_stca024_chk(g_stca_m.stca024)THEN 
                     LET g_stca_m.stca024 = g_stca_m_t.stca024
                     CALL astt601_stca024_ref()
                     NEXT FIELD stca024
                  END IF
               END IF
            END IF
            CALL astt601_stca024_ref() 
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca024
            #add-point:BEFORE FIELD stca024
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stca024
            #add-point:ON CHANGE stca024
      

         AFTER FIELD stca028
            IF NOT cl_null(g_stca_m.stca028) THEN
               IF NOT cl_null(t_stca.stca028) AND t_stca.stca028 <> g_stca_m.stca028 THEN
                  #单身经营范围不为空，不可更改
                  SELECT COUNT(*) INTO l_n  FROM stcd_t 
                   WHERE stcdent = g_enterprise AND stcddocno = g_stca_m.stcadocno 
                  IF l_n > 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00217'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_stca_m.stca028 = t_stca.stca028
                     NEXT FIELD stca028
                  END IF                  
               END IF
               IF NOT astt601_stca028_chk() THEN
                  LET g_stca_m.stca028 = g_stca_m_t.stca028
                  CALL astt601_stca028_ref()
                  NEXT FIELD stca028
               END IF
               LET t_stca.stca028 = g_stca_m.stca028
            END IF
            CALL astt601_stca028_ref()  
         
            #END add-point
 
         #----<<stca025>>----
         #此段落由子樣板a02產生
         AFTER FIELD stca025
            
            #add-point:AFTER FIELD stca025
            LET g_stca_m.stca025_desc = ''
            DISPLAY BY NAME g_stca_m.stca025_desc
            IF NOT cl_null(g_stca_m.stca025) THEN
#               IF NOT astt601_stca025_chk(g_stca_m.stca025)THEN 
#                  LET g_stca_m.stca025 = g_stca_m_t.stca025
#                  CALL astt601_stca025_ref()
#                  NEXT FIELD stca025
#               END IF
               IF s_aooi500_setpoint(g_prog,'stca025') THEN
                  CALL s_aooi500_chk(g_prog,'stca025',g_stca_m.stca025,g_site) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stca_m.stca025
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     LET g_stca_m.stca025 = g_stca_m_t.stca025
                     CALL s_desc_get_department_desc(g_stca_m.stca025) RETURNING g_stca_m.stca025_desc
                     DISPLAY BY NAME g_stca_m.stca025,g_stca_m.stca025_desc
                     NEXT FIELD CURRENT
                  END IF
               ELSE
                  IF NOT astt601_stca025_chk(g_stca_m.stca025)THEN 
                     LET g_stca_m.stca025 = g_stca_m_t.stca025
                     CALL astt601_stca025_ref()
                     NEXT FIELD stca025
                  END IF
               END IF
            END IF
            CALL astt601_stca025_ref()
            
            
         AFTER FIELD stca026
            
            LET g_stca_m.stca026_desc = ''
            IF NOT cl_null(g_stca_m.stca026) THEN
#               IF NOT astt601_stca026_chk(g_stca_m.stca026)THEN 
#                  LET g_stca_m.stca026 = g_stca_m_t.stca026
#                  CALL astt601_stca026_ref()
#                  NEXT FIELD stca026
#               END IF
               IF s_aooi500_setpoint(g_prog,'stca026') THEN
                  CALL s_aooi500_chk(g_prog,'stca026',g_stca_m.stca026,g_site) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stca_m.stca026
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     LET g_stca_m.stca026 = g_stca_m_t.stca026
                     CALL s_desc_get_department_desc(g_stca_m.stca026) RETURNING g_stca_m.stca026_desc
                     DISPLAY BY NAME g_stca_m.stca026,g_stca_m.stca026_desc
                     NEXT FIELD CURRENT
                  END IF
               ELSE
                  IF NOT astt601_stca026_chk(g_stca_m.stca026)THEN 
                     LET g_stca_m.stca026 = g_stca_m_t.stca026
                     CALL astt601_stca026_ref()
                     NEXT FIELD stca026
                  END IF
               END IF
            END IF
            CALL astt601_stca026_ref()

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca025
            #add-point:BEFORE FIELD stca025
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stca025
            #add-point:ON CHANGE stca025
              
         
         AFTER FIELD next_b
            IF NOT cl_null(g_stca_m.next_b) THEN
              IF g_stca_m.next_b < g_stca_m.stca017 OR g_stca_m.next_b > g_stca_m.stca018 THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = 'ast-00047'
                 LET g_errparam.extend = ''
                 LET g_errparam.popup = TRUE
                 CALL cl_err()

                 LET g_stca_m.next_b = g_stca_m_t.next_b  
                 NEXT FIELD next_b
              END IF
              
              SELECT MAX(stcvseq) INTO l_stcvseq FROM stcv_t 
               WHERE stcvent = g_enterprise AND stcvdocno = g_stca_m.stcadocno  AND stcv005 = 'Y'
              
              IF NOT cl_null(l_stcvseq) OR l_stcvseq<> 0 THEN
                 SELECT stcv003 INTO l_stcv003 FROM stcv_t 
                  WHERE stcvent = g_enterprise AND stcvdocno = g_stca_m.stcadocno
                   AND stcvseq = l_stcvseq
                   
                 IF g_stca_m.next_b <= l_stcv003 THEN
                   INITIALIZE g_errparam TO NULL
                   LET g_errparam.code = 'ast-00205'
                   LET g_errparam.extend = ''
                   LET g_errparam.popup = TRUE
                   CALL cl_err()
                  
                   LET g_stca_m.next_b = g_stca_m_t.next_b  
                   NEXT FIELD next_b
                 END IF
                   
              END IF
            
           END IF
         
            #END add-point
 
         #----<<stca008>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca008
            #add-point:BEFORE FIELD stca008
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca008
            
            #add-point:AFTER FIELD stca008
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stca008
            #add-point:ON CHANGE stca008
                        
            #END add-point
 
         #----<<stcaacti>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcaacti
            #add-point:BEFORE FIELD stcaacti
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcaacti
            
            #add-point:AFTER FIELD stcaacti
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcaacti
            #add-point:ON CHANGE stcaacti
                        
            #END add-point
 
         #----<<stca013>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca013
            #add-point:BEFORE FIELD stca013
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca013
            
            #add-point:AFTER FIELD stca013
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stca013
            #add-point:ON CHANGE stca013
                        
            #END add-point
 
         #----<<stca014>>----
         #此段落由子樣板a02產生
         AFTER FIELD stca014
            
            #add-point:AFTER FIELD stca014
            LET g_stca_m.stca014_desc = ''
            DISPLAY BY NAME g_stca_m.stca014_desc
            IF NOT cl_null(g_stca_m.stca014) THEN
#               IF NOT astt601_stca014_chk(g_stca_m.stca014) THEN
#                  LET g_stca_m.stca014 = g_stca_m_t.stca014
#                  CALL astt601_stca014_ref()
#                  NEXT FIELD stca014
#               END IF
               IF s_aooi500_setpoint(g_prog,'stca014') THEN
                  CALL s_aooi500_chk(g_prog,'stca014',g_stca_m.stca014,g_site) RETURNING l_success,l_errno
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.extend = g_stca_m.stca014
                     LET g_errparam.code   = l_errno
                     LET g_errparam.popup  = TRUE
                     CALL cl_err()
                     
                     LET g_stca_m.stca014 = g_stca_m_t.stca014
                     CALL s_desc_get_department_desc(g_stca_m.stca014) RETURNING g_stca_m.stca014_desc
                     DISPLAY BY NAME g_stca_m.stca014,g_stca_m.stca014_desc
                     NEXT FIELD CURRENT
                  END IF
               ELSE
                  IF NOT astt601_stca014_chk(g_stca_m.stca014) THEN
                     LET g_stca_m.stca014 = g_stca_m_t.stca014
                     CALL astt601_stca014_ref()
                     NEXT FIELD stca014
                  END IF
               END IF 
            END IF
            CALL astt601_stca014_ref()
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca014
            #add-point:BEFORE FIELD stca014
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stca014
            #add-point:ON CHANGE stca014
                        
            #END add-point
 
         #----<<stca015>>----
         #此段落由子樣板a02產生
         AFTER FIELD stca015
            
            #add-point:AFTER FIELD stca015
                                    LET g_stca_m.stca015_desc = ''
            DISPLAY BY NAME g_stca_m.stca015_desc 
            IF NOT cl_null(g_stca_m.stca015) THEN
               IF NOT astt601_stca015_chk(g_stca_m.stca015) THEN
                  LET g_stca_m.stca015 = g_stca_m_t.stca015
                  CALL astt601_stca015_ref()
                  NEXT FIELD stca015
               END IF
            END IF
            CALL astt601_stca015_ref()



         AFTER FIELD stca016
            
            LET g_stca_m.stca016_desc = ''
            DISPLAY BY NAME g_stca_m.stca016_desc
            IF NOT cl_null(g_stca_m.stca016) THEN
       
               INITIALIZE g_chkparam.* TO NULL

               #設定g_chkparam.*的參數
               LET g_chkparam.arg1 = g_stca_m.stca016
               LET g_chkparam.arg2 = g_stca_m.stca013

               #160318-00025#38  2016/04/20  by pengxin  add(S)
               LET g_errshow = TRUE #是否開窗 
               LET g_chkparam.err_str[1] = "aoo-00029:sub-01302|aooi125|",cl_get_progname("aooi125",g_lang,"2"),"|:EXEPROGaooi125"
               #160318-00025#38  2016/04/20  by pengxin  add(E)

               #呼叫檢查存在並帶值的library
               IF NOT cl_chk_exist("v_ooeg001") THEN
                  LET g_stca_m.stca016 = g_stca_m_t.stca016
                  CALL astt601_stca016_ref()
                  #檢查失敗時後續處理
                  NEXT FIELD CURRENT
               END IF

            END IF
            CALL astt601_stca016_ref()
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stca015
            #add-point:BEFORE FIELD stca015
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stca015
            #add-point:ON CHANGE stca015
                        
            #END add-point
 
         #----<<stca017>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca017
            #add-point:BEFORE FIELD stca017
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca017
            
            #add-point:AFTER FIELD stca017
            IF NOT cl_null(g_stca_m.stca017) THEN
               IF NOT astt601_stca017_018_chk(p_cmd,'stca017') THEN
                  LET g_stca_m.stca017 = g_stca_m_t.stca017
                  NEXT FIELD stca017
               END IF
              ##IF NOT cl_null( g_stca_m.next_b) AND cl_null(g_stca_m.stca010) THEN
              ##   IF g_stca_m.stca017 > g_stca_m.next_b THEN
              ##      INITIALIZE g_errparam TO NULL
              ##      LET g_errparam.code = 'ast-00126'
              ##      LET g_errparam.extend = ''
              ##      LET g_errparam.popup = TRUE
              ##      CALL cl_err()
              ##      LET g_stca_m.stca017 = g_stca_m_t.stca017
              ##      NEXT FIELD stca017
              ##   END IF
              ##   
              ##END IF
              #IF NOT cl_null(g_stca_m.stca009) AND NOT cl_null(g_stca_m.stca018) THEN
              #   IF NOT astt601_interval_chk(p_cmd) THEN
              #      LET g_stca_m.stca017 = g_stca_m_t.stca017
              #      NEXT FIELD stca017
              #   END IF   
              #END IF 
               
              ##IF NOT cl_null(g_stca_m.stca018) AND p_cmd = 'a' AND g_stca_m.stca000 = 'I' THEN
              ##   IF s_date_get_last_date(g_stca_m.stca017) >= g_stca_m.stca018 THEN
              ##      LET g_stca_m.next_b = g_stca_m.stca018
              ##   ELSE
              ##      LET g_stca_m.next_b = s_date_get_last_date(g_stca_m.stca017)
              ##   END IF
              ##   DISPLAY g_stca_m.next_b TO next_b
              ##END IF
               
         
               
              # IF NOT cl_null(g_stca_m.stca018) 
              #   AND ( NOT cl_null(t_stca.stca017)  AND g_stca_m.stca017<>t_stca.stca017 ) THEN
              #   SELECT COUNT(*) INTO l_n FROM stcv_t WHERE stcvent = g_enterprise AND stcvdocno = g_stca_m.stcadocno AND stcv005 = 'N'
              #    IF l_n > 0 THEN
              #       IF cl_ask_confirm('ast-00097') THEN
              #          IF NOT s_astt601_cal_period(g_stca_m.stcadocno,g_stca_m.stca001,g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca006,g_stca_m.next_b,g_stca_m.stcasite,g_stca_m.stcaunit) THEN
              #              INITIALIZE g_errparam TO NULL
              #              LET g_errparam.code = 'ast-00049'
              #              LET g_errparam.extend = ''
              #              LET g_errparam.popup = TRUE
              #              CALL cl_err()
              #
              #              LET g_stca_m.stca017 = g_stca_m_t.stca017
              #          ELSE
              #              CALL astt601_b_fill()
              #          END IF
              #       ELSE
              #          LET g_stca_m.stca017 = g_stca_m_t.stca017
              #          NEXT FIELD stca017
              #       END IF
              #    END IF 
              #  END IF
              #  LET t_stca.stca017 =  g_stca_m.stca017               
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stca017
            #add-point:ON CHANGE stca017
                        
            #END add-point
 
         #----<<stca018>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca018
            #add-point:BEFORE FIELD stca018
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca018
            
            #add-point:AFTER FIELD stca018
            IF NOT cl_null(g_stca_m.stca018) THEN
               IF NOT astt601_stca017_018_chk(p_cmd,'stca018') THEN
                  LET g_stca_m.stca018 = g_stca_m_t.stca018
                  NEXT FIELD stca018
               END IF
              ##IF NOT cl_null(g_stca_m.next_b) AND cl_null(g_stca_m.stca010) THEN
              ##   IF g_stca_m.stca018 < g_stca_m.next_b THEN
              ##      INITIALIZE g_errparam TO NULL
              ##      LET g_errparam.code = 'ast-00127'
              ##      LET g_errparam.extend = ''
              ##      LET g_errparam.popup = TRUE
              ##      CALL cl_err()
              ##      LET g_stca_m.stca018 = g_stca_m_t.stca018
              ##      NEXT FIELD stca018
              ##   END IF
              ##END IF
              ##
              ##IF g_stca_m.stca000 = 'U' AND NOT cl_null( g_stca_m.stca001) THEN
              ##   
              ##   SELECT stcw003 INTO l_stcw003 FROM stcw_t 
              ##    WHERE stcwent = g_enterprise AND stcw001 = g_stca_m.stca001 
              ##      AND stcwseq = ( SELECT MAX(stcwseq) FROM stcw_t
              ##                       WHERE stcwent = g_enterprise AND stcw001 = g_stca_m.stca001  AND stcw005 = 'Y' )
              ##                       
              ##   IF g_stca_m.stca018 <= l_stcw003 THEN
              ##      INITIALIZE g_errparam TO NULL
              ##      LET g_errparam.code = 'ast-00140'
              ##      LET g_errparam.extend = ''
              ##      LET g_errparam.popup = TRUE
              ##      CALL cl_err()
              ##      LET g_stca_m.stca018 = g_stca_m_t.stca018
              ##      NEXT FIELD stca018
              ##   
              ##   END IF
              ##END IF
               
              #IF NOT cl_null(g_stca_m.stca009) AND NOT cl_null(g_stca_m.stca017) THEN
              #   IF NOT astt601_interval_chk(p_cmd) THEN
              #      LET g_stca_m.stca018 = g_stca_m_t.stca018
              #      NEXT FIELD stca018
              #   END IF   
              #END IF
               
              ##IF NOT cl_null(g_stca_m.stca017) AND p_cmd = 'a' AND g_stca_m.stca000 = 'I' THEN
              ##   IF s_date_get_last_date(g_stca_m.stca017) >= g_stca_m.stca018 THEN
              ##      LET g_stca_m.next_b = g_stca_m.stca018
              ##   ELSE
              ##      LET g_stca_m.next_b = s_date_get_last_date(g_stca_m.stca017)
              ##   END IF
              ##   DISPLAY g_stca_m.next_b TO next_b
              ##END IF
               
              # IF NOT cl_null(g_stca_m.stca017) 
              #   AND (NOT cl_null(t_stca.stca018)  AND g_stca_m.stca018<>t_stca.stca018) THEN
              # 
              #    SELECT COUNT(*) INTO l_n FROM stcv_t WHERE stcvent = g_enterprise AND stcvdocno = g_stca_m.stcadocno AND stcv005 = 'N'
              #    IF l_n > 0 THEN
              #       IF cl_ask_confirm('ast-00097') THEN
              #          IF NOT s_astt601_cal_period(g_stca_m.stcadocno,g_stca_m.stca001,g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca006,g_stca_m.next_b,g_stca_m.stcasite,g_stca_m.stcaunit) THEN
              #              INITIALIZE g_errparam TO NULL
              #              LET g_errparam.code = 'ast-00049'
              #              LET g_errparam.extend = ''
              #              LET g_errparam.popup = TRUE
              #              CALL cl_err()
              #
              #              LET g_stca_m.stca018 = g_stca_m_t.stca018
              #          ELSE
              #              CALL astt601_b_fill()
              #          END IF
              #       ELSE
              #          LET g_stca_m.stca018 = g_stca_m_t.stca018
              #          NEXT FIELD stca018
              #       END IF
              #    END IF       
              # END IF
              # LET t_stca.stca018 = g_stca_m.stca018
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stca018
            #add-point:ON CHANGE stca018
                        
            #END add-point
 
         #----<<stca019>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca019
            #add-point:BEFORE FIELD stca019
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca019
            
            #add-point:AFTER FIELD stca019
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stca019
            #add-point:ON CHANGE stca019
                        
            #END add-point
 
         #----<<stca020>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stca020
            #add-point:BEFORE FIELD stca020
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stca020
            
            #add-point:AFTER FIELD stca020
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stca020
            #add-point:ON CHANGE stca020
                        
            #END add-point
 
         #----<<stcasite>>----
         #此段落由子樣板a02產生
         AFTER FIELD stcasite
            
            #add-point:AFTER FIELD stcasite
            #ken---add---str 需求單號：141208-00001 項次：20
            IF NOT cl_null(g_stca_m.stcasite) THEN
               CALL s_aooi500_chk(g_prog,'prcasite',g_stca_m.stcasite,g_stca_m.stcasite)
                  RETURNING l_success,l_errno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.extend = ''
                  LET g_errparam.code   = l_errno
                  LET g_errparam.popup  = TRUE
                  CALL cl_err()
            
                  LET g_stca_m.stcasite = g_stca_m_t.stcasite
                  CALL s_desc_get_department_desc(g_stca_m.stcasite)
                     RETURNING g_stca_m.stcasite_desc
                  DISPLAY BY NAME g_stca_m.stcasite,g_stca_m.stcasite_desc
                  NEXT FIELD CURRENT
               END IF
            #sakura---add---str
            ELSE
               INITIALIZE g_errparam TO NULL
               LET g_errparam.extend = ''
               LET g_errparam.code   = 'axc-00120'
               LET g_errparam.popup  = TRUE
               CALL cl_err()
               
               LET g_stca_m.stcasite = g_stca_m_t.stcasite
               CALL s_desc_get_department_desc(g_stca_m.stcasite)
                  RETURNING g_stca_m.stcasite_desc
               DISPLAY BY NAME g_stca_m.stcasite,g_stca_m.stcasite_desc
               NEXT FIELD CURRENT            
            #sakura---add---end
            END IF              
            LET g_site_flag = TRUE            
            CALL s_desc_get_department_desc(g_stca_m.stcasite)
               RETURNING g_stca_m.stcasite_desc
            DISPLAY BY NAME g_stca_m.stcasite,g_stca_m.stcasite_desc             
            CALL astt601_set_entry(p_cmd)
            CALL astt601_set_no_entry(p_cmd)            
            #ken---add---end            
            #CALL astt601_stcasite_ref() #ken_mark

            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcasite
            #add-point:BEFORE FIELD stcasite
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stcasite
            #add-point:ON CHANGE stcasite
                        
            #END add-point
 
         #----<<stcaunit>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcaunit
            #add-point:BEFORE FIELD stcaunit
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcaunit
            
            #add-point:AFTER FIELD stcaunit
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcaunit
            #add-point:ON CHANGE stcaunit
                        
            #END add-point
 
         #----<<stcastus>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcastus
            #add-point:BEFORE FIELD stcastus
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcastus
            
            #add-point:AFTER FIELD stcastus
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcastus
            #add-point:ON CHANGE stcastus
                        
            #END add-point
 
         #----<<stcaownid>>----
         #----<<stcaowndp>>----
         #----<<stcacrtid>>----
         #----<<stcacrtdp>>----
         #----<<stcacrtdt>>----
         #----<<stcamodid>>----
         #----<<stcamoddt>>----
         #----<<stcacnfid>>----
         #----<<stcacnfdt>>----
 #欄位檢查
         #---------------------------<  Master  >---------------------------
         #----<<stca000>>----
         #Ctrlp:input.c.stca000
         ON ACTION controlp INFIELD stca000
            #add-point:ON ACTION controlp INFIELD stca000
                        
            #END add-point
 
         #----<<stcadocno>>----
         #Ctrlp:input.c.stcadocno
         ON ACTION controlp INFIELD stcadocno
            #add-point:ON ACTION controlp INFIELD stcadocno
                        #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stcadocno             #給予default值

            #給予arg
            LET g_qryparam.arg1 =  g_ooef004 #
            #LET g_qryparam.arg2 = "astt601" #   #160705-00042#5 160711 by sakura mark
            LET g_qryparam.arg2 = g_prog         #160705-00042#5 160711 by sakura add

            CALL q_ooba002_1()                                #呼叫開窗

            LET g_stca_m.stcadocno = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stcadocno TO stcadocno              #顯示到畫面上

            NEXT FIELD stcadocno                          #返回原欄位


            #END add-point
 
         #----<<stcadocdt>>----
         #Ctrlp:input.c.stcadocdt
         ON ACTION controlp INFIELD stcadocdt
            #add-point:ON ACTION controlp INFIELD stcadocdt
                        
            #END add-point
 
         #----<<stca005>>----
         #Ctrlp:input.c.stca005
         ON ACTION controlp INFIELD stca005
            #add-point:ON ACTION controlp INFIELD stca005
                        
            #END add-point
 
         #----<<stca001>>----
         #Ctrlp:input.c.stca001
         ON ACTION controlp INFIELD stca001
            #add-point:ON ACTION controlp INFIELD stca001
                        #此段落由子樣板a07產生            
            IF g_stca_m.stca000 = 'U' THEN
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca001             #給予default值

            #給予arg

            CALL q_stce001()                                #呼叫開窗

            LET g_stca_m.stca001 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca001 TO stca001              #顯示到畫面上

            NEXT FIELD stca001                          #返回原欄位
            END IF

            #END add-point
 
         #----<<stca002>>----
         #Ctrlp:input.c.stca002
         ON ACTION controlp INFIELD stca002
            #add-point:ON ACTION controlp INFIELD stca002
                        
            #END add-point
 
         #----<<stca003>>----
         #Ctrlp:input.c.stca003
         ON ACTION controlp INFIELD stca003
            #add-point:ON ACTION controlp INFIELD stca003
                        
            #END add-point
 
        
                        
 
 
         #----<<stca004>>----
         #Ctrlp:input.c.stca004
         ON ACTION controlp INFIELD stca004
            #add-point:ON ACTION controlp INFIELD stca004
                        #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca004             #給予default值
            LET g_qryparam.default2 = '' #g_stca_m.stagl003 #說明
            LET g_qryparam.where = " stag002 = '",g_stca_m.stca005,"'"
            #給予arg

            CALL q_stag001()                                #呼叫開窗
            LET g_qryparam.where = ''   
            LET g_stca_m.stca004 = g_qryparam.return1              #將開窗取得的值回傳到變數
            #LET g_stca_m.stagl003 = g_qryparam.return2 #說明

            DISPLAY g_stca_m.stca004 TO stca004              #顯示到畫面上
            #DISPLAY g_stca_m.stagl003 TO stagl003 #說明
            CALL astt601_stca004_ref()
            NEXT FIELD stca004                          #返回原欄位


            #END add-point
 
         #----<<stca009>>----
         #Ctrlp:input.c.stca009
         ON ACTION controlp INFIELD stca009
            #add-point:ON ACTION controlp INFIELD stca009
                        #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca009             #給予default值

            CALL q_pmaa001_21()                               #呼叫開窗

            LET g_stca_m.stca009 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca009 TO stca009              #顯示到畫面上
        
            CALL astt601_stca009_ref()
            NEXT FIELD stca009                          #返回原欄位




          ON ACTION controlp INFIELD stca010

		      INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
		      LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca010             #給予default值
            IF cl_null(g_stca_m.stca009) THEN
               CALL q_pmaa001_18()                #呼叫開窗
            ELSE
               LET g_qryparam.arg1 = g_stca_m.stca009
               CALL q_pmaa001_22() 
            END IF

            LET g_stca_m.stca010 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca010 TO stca010              #顯示到畫面上
        
            CALL astt601_stca010_ref()
            NEXT FIELD stca010                          #返回原欄位


         ON ACTION controlp INFIELD stca012
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca012            #給予default值

            #給予arg
            LET g_qryparam.arg1 = "1"
            CALL q_oojd001_1()                                #呼叫開窗

            LET g_stca_m.stca012 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca012 TO stca012             #顯示到畫面上
            CALL s_desc_get_oojdl003_desc(g_stca_m.stca012) RETURNING g_stca_m.stca012_desc
            DISPLAY BY NAME g_stca_m.stca012_desc
            NEXT FIELD stca012                          #返回原欄位
          
            #END add-point
 
         #----<<stca021>>----
         #Ctrlp:input.c.stca021
         ON ACTION controlp INFIELD stca021
            #add-point:ON ACTION controlp INFIELD stca021
                        #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca021             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_site
            CALL q_ooaj002_1()                                #呼叫開窗

            LET g_stca_m.stca021 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca021 TO stca021              #顯示到畫面上
            CALL astt601_stca021_ref()
            NEXT FIELD stca021                          #返回原欄位


            #END add-point
 
         #----<<stca022>>----
         #Ctrlp:input.c.stca022
         ON ACTION controlp INFIELD stca022
            #add-point:ON ACTION controlp INFIELD stca022
                        #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca022             #給予default值

            #給予arg
            LET g_qryparam.arg1 = g_site #

            CALL q_oodb002_1()                                #呼叫開窗

            LET g_stca_m.stca022 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca022 TO stca022              #顯示到畫面上
            CALL astt601_stca022_ref()
            NEXT FIELD stca022                          #返回原欄位


            #END add-point
 
         #----<<stca023>>----
         #Ctrlp:input.c.stca023
         ON ACTION controlp INFIELD stca023
            #add-point:ON ACTION controlp INFIELD stca023
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca023             #給予default值

            CALL q_ooib002_2()                                #呼叫開窗

            LET g_stca_m.stca023 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca023 TO stca023              #顯示到畫面上
            CALL astt601_stca023_ref()
            NEXT FIELD stca023                          #返回原欄位             
            #END add-point
 
         #----<<stca006>>----
         #Ctrlp:input.c.stca006
         ON ACTION controlp INFIELD stca006
            #add-point:ON ACTION controlp INFIELD stca006
                        #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca006             #給予default值

            #給予arg

            CALL q_staa001()                                #呼叫開窗

            LET g_stca_m.stca006 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca006 TO stca006              #顯示到畫面上
            CALL astt601_stca006_ref() 
            NEXT FIELD stca006                          #返回原欄位


            #END add-point
 
         #----<<stca007>>----
         #Ctrlp:input.c.stca007
         ON ACTION controlp INFIELD stca007
            #add-point:ON ACTION controlp INFIELD stca007
                        #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca007             #給予default值

            #給予arg
            LET g_qryparam.arg1 = "2060" #

            CALL q_oocq002()                                #呼叫開窗

            LET g_stca_m.stca007 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca007 TO stca007              #顯示到畫面上
            CALL astt601_stca007_ref()
            NEXT FIELD stca007                          #返回原欄位


            #END add-point
 
         #----<<stca024>>----
         #Ctrlp:input.c.stca024
         ON ACTION controlp INFIELD stca024
            #add-point:ON ACTION controlp INFIELD stca024
                        #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca024             #給予default值

            #給予arg
           #LET g_qryparam.arg1 = 'A'
#            CALL q_ooef001_23()                               #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stca024') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stca024',g_stca_m.stcasite,'i')
               CALL q_ooef001_24() 
            ELSE
               CALL q_ooef001_23() 
            END IF
            LET g_stca_m.stca024 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca024 TO stca024              #顯示到畫面上
            CALL astt601_stca024_ref()
            NEXT FIELD stca024                          #返回原欄位




         ON ACTION controlp INFIELD stca028
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
		      LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca028             #給予default值

            CALL q_dbbc001()                            #呼叫開窗

            LET g_stca_m.stca028 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca028 TO stca028              #顯示到畫面上
            CALL astt601_stca028_ref()
            NEXT FIELD stca028                         #返回原欄位 

            #END add-point
 
         #----<<stca025>>----
         #Ctrlp:input.c.stca025
         ON ACTION controlp INFIELD stca025
            #add-point:ON ACTION controlp INFIELD stca025
                        #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca025             #給予default值

            #給予arg

           #LET g_qryparam.arg1 = 'D'
#            CALL q_ooef001_18()                                #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stca025') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stca025',g_stca_m.stcasite,'i')
               CALL q_ooef001_24() 
            ELSE
               CALL q_ooef001_18()
            END IF

            LET g_stca_m.stca025 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca025 TO stca025              #顯示到畫面上
            CALL astt601_stca025_ref()
            NEXT FIELD stca025                          #返回原欄位



         ON ACTION controlp INFIELD stca026

			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca026             #給予default值

           #LET g_qryparam.arg1 = '2'
#            CALL q_ooef001_14()                                #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stca026') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stca026',g_stca_m.stcasite,'i')
               CALL q_ooef001_24() 
            ELSE
               #CALL q_ooef001_14()              #161024-00025#3 mark
               LET g_qryparam.where = " ooef201 = 'Y' "     #161024-00025#3 add
               CALL q_ooef001_24()               #161024-00025#3 add
            END IF

            LET g_stca_m.stca026 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca026 TO stca026              #顯示到畫面上
            CALL astt601_stca026_ref()
            NEXT FIELD stca026                          #返回原欄位
            
            
          ON ACTION controlp INFIELD stca027
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
		      LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca027 
            IF NOT cl_null(g_stca_m.stca005) THEN 
               LET g_qryparam.where = " stce005 = '",g_stca_m.stca005,"'"              
            END IF 
            IF NOT cl_null(g_stca_m.stca009) THEN 
               LET g_qryparam.where = " stce009 = '",g_stca_m.stca009,"'"     
            END IF            
            CALL q_stce001_4()                                #呼叫開窗

            LET g_stca_m.stca027 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca027 TO stca027             #顯示到畫面上

            NEXT FIELD stca027                          #返回原欄位
         

            #END add-point
 
         #----<<stca008>>----
         #Ctrlp:input.c.stca008
         ON ACTION controlp INFIELD stca008
            #add-point:ON ACTION controlp INFIELD stca008
                        
            #END add-point
 
         #----<<stcaacti>>----
         #Ctrlp:input.c.stcaacti
         ON ACTION controlp INFIELD stcaacti
            #add-point:ON ACTION controlp INFIELD stcaacti
                        
            #END add-point
 
         #----<<stca013>>----
         #Ctrlp:input.c.stca013
         ON ACTION controlp INFIELD stca013
            #add-point:ON ACTION controlp INFIELD stca013
                        
            #END add-point
 
         #----<<stca014>>----
         #Ctrlp:input.c.stca014
         ON ACTION controlp INFIELD stca014
            #add-point:ON ACTION controlp INFIELD stca014
                        #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca014             #給予default值

            #給予arg

           #LET g_qryparam.arg1 = '1'
#            CALL q_ooef001_2()                                #呼叫開窗
            IF s_aooi500_setpoint(g_prog,'stca014') THEN
               LET g_qryparam.where = s_aooi500_q_where(g_prog,'stca014',g_stca_m.stcasite,'i')
               CALL q_ooef001_24() 
            ELSE
               #161024-00025#4 -s by 08172
               LET g_qryparam.where = " ooef003='Y'"
               CALL q_ooef001_24()
#               CALL q_ooef001_2()
               #161024-00025#4 -e by 08172               
            END IF
            LET g_stca_m.stca014 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca014 TO stca014              #顯示到畫面上
            CALL astt601_stca014_ref()  
            NEXT FIELD stca014                          #返回原欄位


           
            #END add-point
 
         #----<<stca015>>----
         #Ctrlp:input.c.stca015
         ON ACTION controlp INFIELD stca015
            #add-point:ON ACTION controlp INFIELD stca015
                        #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca015             #給予default值

            #給予arg

            CALL q_ooag001()                                #呼叫開窗

            LET g_stca_m.stca015 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca015 TO stca015              #顯示到畫面上
            CALL astt601_stca015_ref()
            NEXT FIELD stca015                          #返回原欄位


      
         ON ACTION controlp INFIELD stca016
           
		      INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stca016            #給予default值
            LET g_qryparam.arg1 = g_stca_m.stca013

            CALL q_ooeg001()                                #呼叫開窗

            LET g_stca_m.stca016 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stca_m.stca016 TO stca016              #顯示到畫面上
            CALL astt601_stca016_ref()
            NEXT FIELD stca016                          #返回原欄位

            #END add-point
 
         #----<<stca017>>----
         #Ctrlp:input.c.stca017
         ON ACTION controlp INFIELD stca017
            #add-point:ON ACTION controlp INFIELD stca017
                        
            #END add-point
 
         #----<<stca018>>----
         #Ctrlp:input.c.stca018
         ON ACTION controlp INFIELD stca018
            #add-point:ON ACTION controlp INFIELD stca018
                        
            #END add-point
 
         #----<<stca019>>----
         #Ctrlp:input.c.stca019
         ON ACTION controlp INFIELD stca019
            #add-point:ON ACTION controlp INFIELD stca019
                        
            #END add-point
 
         #----<<stca020>>----
         #Ctrlp:input.c.stca020
         ON ACTION controlp INFIELD stca020
            #add-point:ON ACTION controlp INFIELD stca020
                        
            #END add-point
 
         #----<<stcasite>>----
         #Ctrlp:input.c.stcasite
         ON ACTION controlp INFIELD stcasite
            #add-point:ON ACTION controlp INFIELD stcasite
                        #此段落由子樣板a07產生            
            #開窗i段
			#INITIALIZE g_qryparam.* TO NULL
         #   LET g_qryparam.state = 'i'
			#LET g_qryparam.reqry = FALSE
         #
         #   LET g_qryparam.default1 = g_stca_m.stcasite             #給予default值
         #
         #   #給予arg
         #   LET g_qryparam.arg1 = "" #
         #   LET g_qryparam.arg2 = "" #
         #
         #   CALL q_ooed004()                                #呼叫開窗
         #
         #   LET g_stca_m.stcasite = g_qryparam.return1              #將開窗取得的值回傳到變數
         #
         #   DISPLAY g_stca_m.stcasite TO stcasite              #顯示到畫面上
         #
         #   NEXT FIELD stcasite                          #返回原欄位
        
            #ken---add---str 需求單號：141208-00001 項次：20
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stca_m.stcasite             #給予default值

            #給予arg

            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stcasite',g_stca_m.stcasite,'i')
            CALL q_ooef001_24()                                #呼叫開窗

            LET g_stca_m.stcasite = g_qryparam.return1              

            DISPLAY g_stca_m.stcasite TO stcasite              #

            NEXT FIELD stcasite                          #返回原欄位
            #ken---addd---end

            #END add-point
 
         #----<<stcaunit>>----
         #Ctrlp:input.c.stcaunit
         ON ACTION controlp INFIELD stcaunit
            #add-point:ON ACTION controlp INFIELD stcaunit
                        
            #END add-point
 
         #----<<stcastus>>----
         #Ctrlp:input.c.stcastus
         ON ACTION controlp INFIELD stcastus
            #add-point:ON ACTION controlp INFIELD stcastus
                        
            #END add-point
 
         #----<<stcaownid>>----
         #----<<stcaowndp>>----
         #----<<stcacrtid>>----
         #----<<stcacrtdp>>----
         #----<<stcacrtdt>>----
         #----<<stcamodid>>----
         #----<<stcamoddt>>----
         #----<<stcacnfid>>----
         #----<<stcacnfdt>>----
 #欄位開窗
            
         AFTER INPUT
            IF INT_FLAG THEN
               EXIT DIALOG
            END IF
 
            CALL cl_showmsg()      #錯誤訊息統整顯示
            DISPLAY BY NAME g_stca_m.stcadocno             
 
                            
            IF p_cmd <> 'u' THEN
    
               CALL s_transaction_begin()
               
               #add-point:單頭新增前
               #add by geza 20160901 #160825-00029#1(S)
               CALL s_aooi200_gen_docno(g_stca_m.stcasite,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_prog)
                  RETURNING l_success,g_stca_m.stcadocno
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'apm-00003'
                  LET g_errparam.extend = g_stca_m.stcadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD stcadocno           
               END IF               
               #add by geza 20160901 #160825-00029#1(E) 
               IF NOT astt601_interval_chk(p_cmd) THEN
                 #CALL s_transaction_end('N','0')
                  NEXT FIELD CURRENT
               END IF
               
               #网点不为空，检查生失效日是否在结算生效期内
               IF NOT cl_null( g_stca_m.stca010) AND NOT cl_null(g_stca_m.stca027)  THEN
                  SELECT stce017,stce018 INTO l_stce017,l_stce018 FROM stce_t
                   WHERE stceent = g_enterprise AND stce001 = g_stca_m.stca027
                  IF NOT (l_stce017 <= g_stca_m.stca017 AND l_stce018 >=  g_stca_m.stca018) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "ast-00119"
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                    #CALL s_transaction_end('N','0')
                     NEXT FIELD stca017
                  END IF                 
               END IF
               IF cl_null(g_stca_m.stca010) THEN
                  IF NOT astt601_upd_stcv(p_cmd) THEN
                    #CALL s_transaction_end('N','0')
                     NEXT FIELD CURRENT
                  END IF
               END IF
               #mark by geza 20160901 #160825-00029#1(S)
               #160613-00026#1 160619 by sakura add(S)
#               CALL s_aooi200_gen_docno(g_stca_m.stcasite,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_prog)
#                  RETURNING l_success,g_stca_m.stcadocno
#               IF NOT l_success THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = 'apm-00003'
#                  LET g_errparam.extend = g_stca_m.stcadocno
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
#                  NEXT FIELD stcadocno           
#               END IF               
               #160613-00026#1 160619 by sakura add(E) 
               #mark by geza 20160901 #160825-00029#1(E)               
               #ken---add---str
               #CALL s_aooi200_gen_docno(g_site,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_prog) RETURNING l_flag,g_stca_m.stcadocno       
               #IF NOT l_flag THEN
               #   INITIALIZE g_errparam TO NULL
               #   LET g_errparam.code = 'apm-00003'
               #   LET g_errparam.extend = g_stca_m.stcadocno
               #   LET g_errparam.popup = TRUE
               #   CALL cl_err()
               #
               #   LET g_stca_m.stcadocno = g_stca_m_t.stcadocno
               #   DISPLAY g_stca_m.stcadocno TO stcadocno
               #   NEXT FIELD CURRENT
               #END IF
               LET g_stca_m_t.stcaunit = g_stca_m_t.stcasite
               #ken---add---end               
               
               IF g_stca_m.stca000 = 'I' THEN   #160707-00007#1 160707 by sakura add
                  #add--2015/07/02 By shiun--(S)
                  CALL s_aooi390_get_auto_no('26',g_stca_m.stca001) RETURNING l_success,g_stca_m.stca001
                  IF NOT l_success THEN
                     CALL s_transaction_end('N','0')
                     NEXT FIELD CURRENT
                  END IF   
                  DISPLAY BY NAME g_stca_m.stca001
                  #add--2015/07/02 By shiun--(E)
                  CALL s_aooi390_oofi_upd('26',g_stca_m.stca001) RETURNING l_success  #add--2015/05/18 By shiun 增加編碼功能
               END IF   #160707-00007#1 160707 by sakura add
               #end add-point
               
               INSERT INTO stca_t (stcaent,stca000,stcadocno,stcadocdt,stca005,stca001,stca002,stca003, 
                   stca004,stca009,stca010,stca011,stca012,stca027,stca021,stca022,stca023,stca006,stca007,stca024,stca028,stca025,stca026,stca008,stcaacti, 
                   stca013,stca014,stca015,stca016,stca017,stca018,stca019,stca020,stcasite,stcaunit,stcastus, 
                   stcaownid,stcaowndp,stcacrtid,stcacrtdp,stcacrtdt,stcamodid,stcamoddt,stcacnfid,stcacnfdt) 
 
               VALUES (g_enterprise,g_stca_m.stca000,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_stca_m.stca005, 
                   g_stca_m.stca001,g_stca_m.stca002,g_stca_m.stca003,g_stca_m.stca004,g_stca_m.stca009,
                   g_stca_m.stca010,g_stca_m.stca011,g_stca_m.stca012,g_stca_m.stca027,
                   g_stca_m.stca021,g_stca_m.stca022,g_stca_m.stca023,g_stca_m.stca006,g_stca_m.stca007, 
                   g_stca_m.stca024,g_stca_m.stca028,g_stca_m.stca025,g_stca_m.stca026,g_stca_m.stca008,g_stca_m.stcaacti,g_stca_m.stca013, 
                   g_stca_m.stca014,g_stca_m.stca015,g_stca_m.stca016,g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca019, 
                   g_stca_m.stca020,g_stca_m.stcasite,g_stca_m.stcaunit,g_stca_m.stcastus,g_stca_m.stcaownid, 
                   g_stca_m.stcaowndp,g_stca_m.stcacrtid,g_stca_m.stcacrtdp,g_stca_m.stcacrtdt,g_stca_m.stcamodid, 
                   g_stca_m.stcamoddt,g_stca_m.stcacnfid,g_stca_m.stcacnfdt) 
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "g_stca_m"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
  
                  CALL s_transaction_end('N','0')
                  CONTINUE DIALOG
               END IF
               
               #add-point:單頭新增中
               IF NOT cl_null(g_stca_m.ooff013) THEN
                  LET l_success = ''
                  CALL s_aooi360_gen('2',g_stca_m.stcadocno,'','','','','','','','','','4',g_stca_m.ooff013) RETURNING l_success
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "ooff_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CONTINUE DIALOG
                  END IF
               ELSE
                  CALL s_aooi360_del('2',g_stca_m.stcadocno,'','','','','','','','','','4') RETURNING l_success
                  IF NOT l_success THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = "ooff_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     CONTINUE DIALOG
                  END IF
               END IF

               #如果是I:新增，通过合同模板带出单身的费用
               IF NOT cl_null(g_stca_m.stca004) AND g_stca_m.stca000 = 'I' THEN
                  CALL astt601_stca004_genb()
                  CALL astt601_b_fill()
                  LET l_ac3 = 1
                  CALL astt601_b3_fill()
                  CALL astt601_reflesh()
               END IF

              ##自动新增单身帐期
              #IF g_stca_m.stca000 = 'I' THEN
              #   IF NOT s_astt601_cal_period(g_stca_m.stcadocno,g_stca_m.stca001,g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca006,g_stca_m.next_b,g_stca_m.stcasite,g_stca_m.stcaunit) THEN
              #      INITIALIZE g_errparam TO NULL
              #      LET g_errparam.code = 'ast-00049'
              #      LET g_errparam.extend = ''
              #      LET g_errparam.popup = TRUE
              #      CALL cl_err()
              #   
              #      CALL s_transaction_end('N','0')
              #      CONTINUE DIALOG
              #   END IF
              #END IF
              #IF g_stca_m.stca000 = 'U' THEN
              #   IF g_stca_m.stca006 <> g_stca_m_o.stca006 OR g_stca_m.stca017 <> g_stca_m_o.stca017 OR g_stca_m.stca018 <> g_stca_m_o.stca018 THEN
              #      IF NOT s_astt601_cal_period(g_stca_m.stcadocno,g_stca_m.stca001,g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca006,g_stca_m.next_b,g_stca_m.stcasite,g_stca_m.stcaunit) THEN
              #         INITIALIZE g_errparam TO NULL
              #         LET g_errparam.code = 'ast-00049'
              #         LET g_errparam.extend = ''
              #         LET g_errparam.popup = TRUE
              #         CALL cl_err()
              #      
              #         CALL s_transaction_end('N','0')
              #         CONTINUE DIALOG
              #      END IF
              #   END IF
              #END IF
               #end add-point
               
               
               
               CALL s_transaction_end('Y','0') 
               
               #add-point:單頭新增後
               #160628-00032#1 160629 by sakura add(S)
               #U修改时，如果合同有异动自动带出单身
               IF g_stca_m.stca000 = 'U' AND (cl_null(g_stca_m_o.stca001) OR g_stca_m_o.stca001 <>  g_stca_m.stca001) THEN
                  IF NOT astt601_stca001_genb() THEN
                     CALL s_transaction_end('N','0')
                     NEXT FIELD CURRENT                   
                  END IF
                  CALL astt601_b_fill()
                  CALL astt601_b3_fill()
                  CALL astt601_reflesh()
               END IF
               #160628-00032#1 160629 by sakura add(E)                  
               #end add-point
               
               IF l_cmd_t = 'r' AND p_cmd = 'a' THEN
                  CALL astt601_detail_reproduce()
               END IF
               
               LET p_cmd = 'u'
 
            ELSE
               CALL s_transaction_begin()
            
               #add-point:單頭修改前
               #检查合同日期是否重复
               IF NOT astt601_interval_chk(p_cmd) THEN
                  CALL s_transaction_end('N','0')
                  NEXT FIELD CURRENT
               END IF
               
               #网点不为空，检查生失效日是否在结算生效期内
               IF NOT cl_null( g_stca_m.stca010) AND NOT cl_null(g_stca_m.stca027)  THEN
                  SELECT stce017,stce018 INTO l_stce017,l_stce018 FROM stce_t
                   WHERE stceent = g_enterprise AND stce001 = g_stca_m.stca027
                  IF NOT (l_stce017 <= g_stca_m.stca017 AND l_stce018 >=  g_stca_m.stca018) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "ast-00119"
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                    #CALL s_transaction_end('N','0')
                     NEXT FIELD stca017
                  END IF                 
               END IF  
             
              ##计算帐期，如果生失效日期、下次计算日、结算方式有异动，重新计算帐期
              #IF NOT cl_null(g_stca_m.stca001) AND NOT cl_null(g_stca_m.stca006) AND NOT cl_null(g_stca_m.stca017) AND NOT cl_null(g_stca_m.stca018)  AND NOT cl_null(g_stca_m.next_b) AND NOT cl_null(g_stca_m.stcasite) AND NOT cl_null(g_stca_m.stcaunit)
              #    AND (g_stca_m.stca006 <> g_stca_m_t.stca006 OR g_stca_m.stca017 <> g_stca_m_t.stca017 OR g_stca_m.stca018 <> g_stca_m_t.stca018 OR g_stca_m.next_b<>g_stca_m_t.next_b )   THEN
              #   SELECT COUNT(*) INTO l_n FROM stcv_t WHERE stcvent = g_enterprise AND stcvdocno = g_stca_m.stcadocno AND stcv005 = 'N'
              #   IF l_n > 0 THEN
              #      IF cl_ask_confirm('ast-00097') THEN
              #         IF NOT s_astt601_cal_period(g_stca_m.stcadocno,g_stca_m.stca001,g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca006,g_stca_m.next_b,g_stca_m.stcasite,g_stca_m.stcaunit) THEN
              #             INITIALIZE g_errparam TO NULL
              #             LET g_errparam.code = 'ast-00049'
              #             LET g_errparam.extend = ''
              #             LET g_errparam.popup = TRUE
              #             CALL cl_err()              
              #             LET g_stca_m.stca006 = g_stca_m_t.stca006
              #             LET g_stca_m.stca017 = g_stca_m_t.stca017
              #             LET g_stca_m.stca018 = g_stca_m_t.stca018
              #             LET g_stca_m.next_b = g_stca_m_t.next_b
              #         ELSE
              #             CALL astt601_b_fill()
              #         END IF
              #      ELSE
              #         LET g_stca_m.stca006 = g_stca_m_t.stca006
              #         LET g_stca_m.stca017 = g_stca_m_t.stca017
              #         LET g_stca_m.stca018 = g_stca_m_t.stca018
              #         LET g_stca_m.next_b = g_stca_m_t.next_b
              #      END IF
              #   END IF                 
              #END IF
               IF cl_null(g_stca_m.stca010) THEN
                 IF NOT astt601_upd_stcv(p_cmd) THEN
                    CALL s_transaction_end('N','0')
                    NEXT FIELD CURRENT
                 END IF
               END IF
               #add--2015/07/02 By shiun--(S)
               CALL s_aooi390_get_auto_no('26',g_stca_m.stca001) RETURNING l_success,g_stca_m.stca001
               IF NOT l_success THEN
                  CALL s_transaction_end('N','0')
                  NEXT FIELD CURRENT
               END IF   
               DISPLAY BY NAME g_stca_m.stca001
               CALL s_aooi390_oofi_upd('26',g_stca_m.stca001) RETURNING l_success
               #add--2015/07/02 By shiun--(E)               
               #end add-point
               
               UPDATE stca_t SET (stca000,stcadocno,stcadocdt,stca005,stca001,stca002,stca003,stca004, 
                   stca009,stca010,stca011,stca012,stca027,stca021,stca022,stca023,stca006,stca007,stca024,stca028,stca025,stca026,stca008,stcaacti, 
                   stca013,stca014,stca015,stca016,stca017,stca018,stca019,stca020,stcasite,stcaunit,stcastus, 
                   stcaownid,stcaowndp,stcacrtid,stcacrtdp,stcacrtdt,stcamodid,stcamoddt,stcacnfid,stcacnfdt) = (g_stca_m.stca000, 
                   g_stca_m.stcadocno,g_stca_m.stcadocdt,g_stca_m.stca005,g_stca_m.stca001,g_stca_m.stca002, 
                   g_stca_m.stca003,g_stca_m.stca004,g_stca_m.stca009,g_stca_m.stca010,g_stca_m.stca011,g_stca_m.stca012,
                   g_stca_m.stca027,g_stca_m.stca021,g_stca_m.stca022, 
                   g_stca_m.stca023,g_stca_m.stca006,g_stca_m.stca007,g_stca_m.stca024,g_stca_m.stca028,g_stca_m.stca025,g_stca_m.stca026,  
                   g_stca_m.stca008,g_stca_m.stcaacti,g_stca_m.stca013,g_stca_m.stca014,g_stca_m.stca015,g_stca_m.stca016, 
                   g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca019,g_stca_m.stca020,g_stca_m.stcasite, 
                   g_stca_m.stcaunit,g_stca_m.stcastus,g_stca_m.stcaownid,g_stca_m.stcaowndp,g_stca_m.stcacrtid, 
                   g_stca_m.stcacrtdp,g_stca_m.stcacrtdt,g_stca_m.stcamodid,g_stca_m.stcamoddt,g_stca_m.stcacnfid, 
                   g_stca_m.stcacnfdt)
                WHERE stcaent = g_enterprise AND stcadocno = g_stcadocno_t
 
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "stca_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
  
                  CALL s_transaction_end('N','0')
                  CONTINUE DIALOG
               END IF
               
               #add-point:單頭修改中
               IF NOT cl_null(g_stca_m.ooff013) THEN
                   LET l_success = ''
                   CALL s_aooi360_gen('2',g_stca_m.stcadocno,'','','','','','','','','','4',g_stca_m.ooff013) RETURNING l_success
                   IF NOT l_success THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = "ooff_t"
                      LET g_errparam.popup = TRUE
                      CALL cl_err()

                      CONTINUE DIALOG
                   END IF
                ELSE
                   CALL s_aooi360_del('2',g_stca_m.stcadocno,'','','','','','','','','','4') RETURNING l_success
                   IF NOT l_success THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = SQLCA.sqlcode
                      LET g_errparam.extend = "ooff_t"
                      LET g_errparam.popup = TRUE
                      CALL cl_err()

                      CONTINUE DIALOG
                   END IF
               END IF
              IF g_stca_m_t.stca004 <> g_stca_m.stca004 AND p_cmd = 'u' THEN  
                IF NOT cl_null(g_stca_m.stca004) AND g_stca_m.stca000 = 'I'  THEN            
                   DELETE FROM stcb_t WHERE stcbent = g_enterprise AND stcbdocno = g_stca_m.stcadocno
                   DELETE FROM stcc_t WHERE stccent = g_enterprise AND stccdocno = g_stca_m.stcadocno
                   CALL astt601_stca004_genb()
                   CALL astt601_b_fill()
                   LET l_ac3 = 1
                   CALL astt601_b3_fill()
                   CALL astt601_reflesh()
                END IF
              END IF
             # IF g_stca_m_t.stca001 <> g_stca_m.stca001 AND p_cmd = 'u' THEN  
             #   IF NOT cl_null(g_stca_m.stca001) AND g_stca_m.stca000 = 'U' THEN
             #      CALL astt601_stca001_genb()
             #      CALL astt601_b_fill()
             #      LET l_ac3 = 1
             #      CALL astt601_b3_fill()
             #      CALL astt601_reflesh()
             #   END IF
             # END IF                
               #end add-point
               
               
               
               CALL s_transaction_end('Y','0')
               
               #add-point:單頭修改後
                              
               #end add-point
            END IF
            
            LET g_stcadocno_t = g_stca_m.stcadocno
 
            #controlp
            
      END INPUT
   
 
{</section>}
 
{<section id="astt601.input.body" >}
   
      #Page1 預設值產生於此處
      INPUT ARRAY g_stcb_d FROM s_detail1.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 
         #自訂ACTION(detail_input,page_1)
         
         
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stcb_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt601_b_fill()
            LET g_rec_b = g_stcb_d.getLength()
            #add-point:資料輸入前
          # LET g_stcv003 = NULL
          # SELECT MAX(stcv003) INTO g_stcv003 FROM stcv_t
          #  WHERE stcvent = g_enterprise
          #    AND stcvdocno = g_stca_m.stcadocno
          #    AND stcv005 = 'Y'
            
            CALL astt601_stcb005_chk(0) RETURNING l_success,l_ac1    
            IF NOT l_success THEN
               CALL FGL_SET_ARR_CURR(l_ac1) 
               NEXT FIELD stcb005
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
            OPEN astt601_cl USING g_enterprise,g_stca_m.stcadocno
 
            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN astt601_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               CLOSE astt601_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            
            LET g_rec_b = g_stcb_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stcb_d[l_ac].stcbseq IS NOT NULL
 
            THEN
               LET l_cmd='u'
               LET g_stcb_d_t.* = g_stcb_d[l_ac].*  #BACKUP
               CALL astt601_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b
                              
               #end add-point  
               CALL astt601_set_no_entry_b(l_cmd)
               IF NOT astt601_lock_b("stcb_t","'1'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt601_bcl INTO g_stcb_d[l_ac].stcbseq,g_stcb_d[l_ac].stcb002,g_stcb_d[l_ac].stcb002_desc,g_stcb_d[l_ac].stcb021,   #160513-00033#7
                      g_stcb_d[l_ac].stcb003,g_stcb_d[l_ac].stcb004,g_stcb_d[l_ac].stcb005,g_stcb_d[l_ac].stcb006, 
                      g_stcb_d[l_ac].stcb007,g_stcb_d[l_ac].stcb008,g_stcb_d[l_ac].stcb008_desc,g_stcb_d[l_ac].stcb009, 
                      g_stcb_d[l_ac].stcb009_desc,g_stcb_d[l_ac].stcb010,g_stcb_d[l_ac].stcb011,g_stcb_d[l_ac].stcb012, 
                      g_stcb_d[l_ac].stcb013,g_stcb_d[l_ac].stcb014,g_stcb_d[l_ac].stcb015,g_stcb_d[l_ac].stcb016, 
                      g_stcb_d[l_ac].stcb017,g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcbunit,g_stcb_d[l_ac].stcbsite 
 
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = g_stcb_d_t.stcbseq
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
 
                     LET l_lock_sw = "Y"
                  END IF
                  
                  LET g_bfill = "N"
                  CALL astt601_show()
                  LET g_bfill = "Y"
                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            #add-point:modify段before row
                                         IF l_cmd = 'u' THEN
                 CALL astt601_b3_fill()
                 CALL astt601_reflesh()
             END IF 
  
             CALL astt601_set_entry_b(l_cmd)
             CALL astt601_set_no_required_b(l_cmd)
             CALL astt601_set_required_b(l_cmd)
             CALL astt601_set_no_entry_b(l_cmd)
             LET g_stcb_d_t.* = g_stcb_d[l_ac].*
             LET g_stcb_d_o.* = g_stcb_d[l_ac].*               
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
            #其他table進行lock
            
        
         BEFORE INSERT
            
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stcb_d[l_ac].* TO NULL 
                  LET g_stcb_d[l_ac].stcb012 = "1"
      LET g_stcb_d[l_ac].stcb015 = "1"
 
 
            LET g_stcb_d_t.* = g_stcb_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt601_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b
                        
            #end add-point
            CALL astt601_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stcb_d[li_reproduce_target].* = g_stcb_d[li_reproduce].*
 
               LET g_stcb_d[li_reproduce_target].stcbseq = NULL
 
            END IF
            #公用欄位給值(單身)
            
            
            #add-point:modify段before insert
                                     LET g_insert = 'Y'
             CALL g_stcc_d.clear()
            
            SELECT MAX(stcbseq)+1 INTO  g_stcb_d[l_ac].stcbseq FROM stcb_t
             WHERE stcbent = g_enterprise AND stcbdocno = g_stca_m.stcadocno
            IF cl_null( g_stcb_d[l_ac].stcbseq ) THEN             
               LET g_stcb_d[l_ac].stcbseq = 1
            END IF
            LET g_stcb_d[l_ac].stcb016  = g_stca_m.stca017
            LET g_stcb_d[l_ac].stcb017  = g_stca_m.stca018
            LET g_stcb_d[l_ac].stcb021  = 'N'      #160513-00033#7
           # LET g_stcv003 = NULL
           #SELECT MAX(stcv003) INTO g_stcv003 FROM stcv_t
           # WHERE stcvent = g_enterprise
           #   AND stcvdocno = g_stca_m.stcadocno
           #   AND stcv005 = 'Y'
           #IF NOT cl_null(g_stcv003) THEN
           #   IF g_stcv003 = g_stca_m.stca018 THEN
           #      LET g_stcb_d[l_ac].stcb016  = NULL
           #      LET g_stcb_d[l_ac].stcb016  = NULL
           #   ELSE
           #      LET g_stcb_d[l_ac].stcb016  = g_stcv003 + 1
           #      LET g_stcb_d[l_ac].stcb017  = g_stca_m.stca018
           #   END IF
           #END IF
           
           
            LET g_stcb_d[l_ac].stcbsite = g_stca_m.stcasite
            LET g_stcb_d[l_ac].stcbunit = g_stca_m.stcaunit
            LET g_stcb_d_t.* = g_stcb_d[l_ac].*
            IF NOT cl_null(g_stca_m.stca010) THEN
               LET g_stcb_d[l_ac].stcb005 = '2'
            ELSE
               LET g_stcb_d[l_ac].stcb005 = '1'
            END IF
            CALL astt601_set_entry_b(l_cmd)
            CALL astt601_set_no_required_b(l_cmd)
            CALL astt601_set_required_b(l_cmd)
            CALL astt601_set_no_entry_b(l_cmd)
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
            SELECT COUNT(*) INTO l_count FROM stcb_t 
             WHERE stcbent = g_enterprise AND stcbdocno = g_stca_m.stcadocno
 
               AND stcbseq = g_stcb_d[l_ac].stcbseq
 
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前
                              
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stca_m.stcadocno
               LET gs_keys[2] = g_stcb_d[g_detail_idx].stcbseq
               CALL astt601_insert_b('stcb_t',gs_keys,"'1'")
                           
               #add-point:單身新增後
                              
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00006"
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               INITIALIZE g_stcb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stcb_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
               CALL s_transaction_end('N','0')                    
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt601_b_fill()
               #資料多語言用-增/改
               
               #add-point:input段-after_insert
                              
               #end add-point
               CALL s_transaction_end('Y','0')
               ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' AND g_stcb_d.getLength() < l_ac THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
               CALL g_stcb_d.deleteElement(l_ac)
               NEXT FIELD stcbseq
            END IF
         
            IF g_stcb_d[l_ac].stcbseq IS NOT NULL
 
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
               #LET g_stcv003 = NULL
               #SELECT MAX(stcv003) INTO g_stcv003 FROM stcv_t
               # WHERE stcvent = g_enterprise
               #   AND stcvdocno = g_stca_m.stcadocno
               #   AND stcv005 = 'Y'
               #IF NOT cl_null(g_stcv003) AND g_stcb_d[l_ac].stcb016 <= g_stcv003 THEN
               #   INITIALIZE g_errparam TO NULL
               #   LET g_errparam.code =  "ast-00148"
               #   LET g_errparam.extend = ""
               #   LET g_errparam.popup = TRUE
               #   CALL cl_err()
               #
               #   CANCEL DELETE
               #END IF
               IF astt601_chk_astm601_jiesuan(g_stcb_d_t.stcbseq) THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code =  "ast-00148"
                  LET g_errparam.extend = ""
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
               
                  CANCEL DELETE
               END IF
               
               DELETE FROM stcc_t
                WHERE stccent = g_enterprise AND stccdocno = g_stca_m.stcadocno AND

                      stccseq1 = g_stcb_d_t.stcbseq
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "stcc_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  CALL s_transaction_end('N','0')
                  CANCEL DELETE 
               END IF    
               #end add-point 
               
               DELETE FROM stcb_t
                WHERE stcbent = g_enterprise AND stcbdocno = g_stca_m.stcadocno AND
 
                      stcbseq = g_stcb_d_t.stcbseq
 
                  
               #add-point:單身刪除中
                              
               #end add-point 
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stcb_t"
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
               CLOSE astt601_bcl
               LET l_count = g_stcb_d.getLength()
            END IF 
            
                           INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stca_m.stcadocno
               LET gs_keys[2] = g_stcb_d[g_detail_idx].stcbseq
 
              
         AFTER DELETE 
            #add-point:單身刪除後2
                        
            #end add-point
                           CALL astt601_delete_b('stcb_t',gs_keys,"'1'")
 
         #---------------------<  Detail: page1  >---------------------
         #----<<stcbseq>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcbseq
            #add-point:BEFORE FIELD stcbseq
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcbseq
            
            #add-point:AFTER FIELD stcbseq
                                    #此段落由子樣板a05產生
            IF  NOT cl_null(g_stca_m.stcadocno) AND NOT cl_null(g_stcb_d[g_detail_idx].stcbseq) THEN 
               #150427-00012#7 150527 mark by beckxie
               #IF l_cmd = 'a' OR ( l_cmd = 'u' AND ( l_cmd = 'u' AND (g_stca_m.stcadocno != g_stcadocno_t OR g_stcb_d[g_detail_idx].stcbseq != g_stcb_d_t.stcbseq))) THEN 
               #150427-00012#7 20160104 mark by beckxie---S
               #IF g_stca_m.stcadocno != g_stcadocno_t OR g_stcb_d[g_detail_idx].stcbseq != g_stcb_d_t.stcbseq THEN #150427-00012#7 150527 add by beckxie
               #150427-00012#7 20160104 mark by beckxie---E
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_stca_m.stcadocno != g_stcadocno_t OR g_stcb_d[g_detail_idx].stcbseq != g_stcb_d_t.stcbseq)) THEN   #150427-00012#7 20160104 add by beckxie
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stcb_t WHERE "||"stcbent = '" ||g_enterprise|| "' AND "||"stcbdocno = '"||g_stca_m.stcadocno ||"' AND "|| "stcbseq = '"||g_stcb_d[g_detail_idx].stcbseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
                  IF astt601_chk_astm601_jiesuan(g_stcb_d_t.stcbseq) THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = 'ast-00204'
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET g_stcb_d[l_ac].stcbseq  = g_stcb_d_t.stcbseq 
                     NEXT FIELD stcbseq
                  END IF                
               END IF
                           
            END IF
            LET g_stcb_d_o.stcbseq = g_stcb_d[l_ac].stcbseq 

            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcbseq
            #add-point:ON CHANGE stcbseq
                        
            #END add-point
 
         #----<<stcb002>>----
         #此段落由子樣板a02產生
         AFTER FIELD stcb002
            
            #add-point:AFTER FIELD stcb002
           LET g_stcb_d[l_ac].stcb002_desc = ''
           DISPLAY BY NAME g_stcb_d[l_ac].stcb002_desc           
           IF NOT cl_null(g_stcb_d[l_ac].stcb002) THEN
              IF NOT astt601_stcb002_chk(g_stcb_d[l_ac].stcb002 ) THEN
                 LET g_stcb_d[l_ac].stcb002 = g_stcb_d_t.stcb002
                 CALL astt601_stcb002_ref() 
                 SELECT stae006 INTO  g_stcb_d[l_ac].stcb004 FROM stae_t WHERE staeent = g_enterprise AND stae001 = g_stcb_d[l_ac].stcb002
                 DISPLAY BY NAME g_stcb_d[l_ac].stcb004 
                 
                 NEXT FIELD stcb002
              END IF
              
             
               
              IF g_stcb_d[l_ac].stcb002 <> g_stcb_d_o.stcb002 AND NOT cl_null(g_stcb_d_o.stcb002) THEN
                # SELECT COUNT(*) INTO l_n FROM staf_t
                #  WHERE stafent = g_enterprise AND staf001= g_stcb_d[l_ac].stcb002 AND staf002 = g_stca_m.stca005
                #    AND staf003 = 'stcb015' AND staf004 = 'N'
                # IF l_n> 0 THEN
                #       IF cl_ask_confirm('ast-00024') THEN
                #          DELETE FROM stcc_t
                #           WHERE stccent = g_enterprise AND stccdocno = g_stca_m.stcadocno AND
                #                 stccseq1 = g_stcb_d_t.stcbseq
                #           CALL g_stcc_d.clear()
                #       ELSE
                #           LET g_stcb_d[l_ac].stcb002 = g_stcb_d_t.stcb002
                #           CALL astt601_stcb002_ref() 
                #           NEXT FIELD stcb002
                #       END IF
                # END IF
                 IF l_cmd = 'u' AND g_stcc_d.getlength() > 0 THEN
                     IF cl_ask_confirm('ast-00018') THEN
                        DELETE FROM stcc_t
                         WHERE stccent = g_enterprise AND stccdocno = g_stca_m.stcadocno AND
                               stccseq1 = g_stcb_d_t.stcbseq
                         CALL g_stcc_d.clear()
               
                     END IF  
                 END IF  
               END IF
               IF (g_stcb_d[l_ac].stcb002 <> g_stcb_d_o.stcb002 AND NOT cl_null(g_stcb_d_o.stcb002)) OR (l_cmd = 'a' AND cl_null(g_stcb_d_o.stcb002)) THEN
                 LET g_stcb_d_o.stcbseq = g_stcb_d[l_ac].stcbseq
                 LET g_stcb_d_o.stcb002 = g_stcb_d[l_ac].stcb002
                 INITIALIZE g_stcb_d[l_ac].* TO NULL
                 LET g_stcb_d[l_ac].stcbsite = g_stca_m.stcasite
                 LET g_stcb_d[l_ac].stcbunit = g_stca_m.stcaunit
                 LET g_stcb_d[l_ac].stcb012 = "1"
                 LET g_stcb_d[l_ac].stcb015 = "1"
                 LET g_stcb_d[l_ac].stcb016  = g_stca_m.stca017
                 LET g_stcb_d[l_ac].stcb017  = g_stca_m.stca018
                 LET g_stcb_d[l_ac].stcb021  = 'N'    #160513-00033#7
                #IF NOT cl_null(g_stcv003) THEN
                #   IF g_stcv003 = g_stca_m.stca018 THEN
                #      LET g_stcb_d[l_ac].stcb016  = NULL
                #      LET g_stcb_d[l_ac].stcb017  = NULL
                #   ELSE
                #      LET g_stcb_d[l_ac].stcb016  = g_stcv003 + 1
                #      LET g_stcb_d[l_ac].stcb017  = g_stca_m.stca018
                #   END IF
                #END IF
                 LET g_stcb_d[l_ac].stcbseq = g_stcb_d_o.stcbseq
                 LET g_stcb_d[l_ac].stcb002 = g_stcb_d_o.stcb002 
                 
                  #帶出費用編號預設
                 SELECT stae006 INTO  g_stcb_d[l_ac].stcb004 FROM stae_t WHERE staeent = g_enterprise AND stae001 = g_stcb_d[l_ac].stcb002
                   DISPLAY BY NAME g_stcb_d[l_ac].stcb002_desc,g_stcb_d[l_ac].stcb004 
                 IF g_stcb_d[l_ac].stcb004 = '3' THEN
                    LET g_stcb_d[l_ac].stcb004 = ''
                 END IF    
                   
                #費用合約設定asti204
                 CALL astt601_default(g_stca_m.stca005,g_stcb_d[l_ac].stcb002)
              END IF
              IF NOT cl_null(g_stcb_d[l_ac].stcb016) AND NOT cl_null(g_stcb_d[l_ac].stcb017) AND NOT cl_null(g_stcb_d[l_ac].stcbseq)THEN
                 IF NOT astt601_stcb016_017_chk() THEN
                    CALL astt601_stcb002_ref()               
                    NEXT FIELD stab016
                 END IF
              END IF
            
              CALL astt601_stcb002_ref()
              #SELECT stae006 INTO  g_stcb_d[l_ac].stcb004 FROM stae_t WHERE staeent = g_enterprise AND stae001 = g_stcb_d[l_ac].stcb002
           ELSE
              LET g_stcb_d[l_ac].stcb002_desc = ''
              LET g_stcb_d[l_ac].stcb004 = ''
           END IF
           
           LET g_stcb_d_o.stcb002 = g_stcb_d[l_ac].stcb002
              CALL astt601_set_entry_b(l_cmd)
              CALL astt601_set_no_required_b(l_cmd)
              CALL astt601_set_required_b(l_cmd)
              CALL astt601_set_no_entry_b(l_cmd)
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcb002
            #add-point:BEFORE FIELD stcb002
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stcb002
            #add-point:ON CHANGE stcb002
                        
            #END add-point
         #160513-00033#7--(S)
         #當此欄位異動時,將價款類別,費用週期,費用週期方式,條件基準,計算基準,條件/固定金額,費用比率,保底金額,保低扣率的值清空
         #計算類型,保底否與分量扣點給固定值1         
         ON CHANGE stcb021
            LET g_stcb_d[l_ac].stcb004 = ''  #價款類別
            LET g_stcb_d[l_ac].stcb006 = ''  #費用週期
            LET g_stcb_d[l_ac].stcb007 = ''  #費用週期方式
            LET g_stcb_d[l_ac].stcb008 = ''  #條件基準
            LET g_stcb_d[l_ac].stcb008_desc = '' 
            LET g_stcb_d[l_ac].stcb009 = ''  #計算基準
            LET g_stcb_d[l_ac].stcb009_desc = '' 
            LET g_stcb_d[l_ac].stcb010 = ''  #條件/固定金額
            LET g_stcb_d[l_ac].stcb011 = ''  #費用比率            
            LET g_stcb_d[l_ac].stcb013 = ''  #保底金額
            LET g_stcb_d[l_ac].stcb014 = ''  #保低扣率的值
            LET g_stcb_d[l_ac].stcb005 = '1' #計算類型            
            LET g_stcb_d[l_ac].stcb012 = '1' #保底否
            LET g_stcb_d[l_ac].stcb015 = '1' #分量扣點
            
            CALL astt601_set_entry_b(l_cmd)
            CALL astt601_set_no_required_b(l_cmd)
            CALL astt601_set_required_b(l_cmd)
            CALL astt601_set_no_entry_b(l_cmd)
         #160513-00033#7--(E)
         #----<<stcb003>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb003
            #add-point:BEFORE FIELD stcb003
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb003
            
            #add-point:AFTER FIELD stcb003
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcb003
            #add-point:ON CHANGE stcb003
                        
            #END add-point
 
         #----<<stcb004>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb004
            #add-point:BEFORE FIELD stcb004
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb004
            
            #add-point:AFTER FIELD stcb004
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcb004
            #add-point:ON CHANGE stcb004
                        
            #END add-point
 
         #----<<stcb005>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb005
            #add-point:BEFORE FIELD stcb005
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb005
            
            #add-point:AFTER FIELD stcb005
                                    CALL astt601_set_entry_b(l_cmd)
             CALL astt601_set_no_required_b(l_cmd)
             CALL astt601_set_required_b(l_cmd)
             CALL astt601_set_no_entry_b(l_cmd) 
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcb005
            #add-point:ON CHANGE stcb005
            IF NOT cl_null(g_stcb_d[l_ac].stcb005) THEN
               CALL astt601_stcb005_chk(l_ac) RETURNING l_success,l_ac1
               IF NOT l_success THEN
                  LET g_stcb_d[l_ac].stcb005 = g_stcb_d_t.stcb005
                  NEXT FIELD stcb005
               END IF
            END IF
            CALL astt601_cal_nextd() RETURNING g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020      
            #END add-point
 
         #----<<stcb006>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb006
            #add-point:BEFORE FIELD stcb006
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb006
            
            #add-point:AFTER FIELD stcb006
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcb006
            #add-point:ON CHANGE stcb006
            IF NOT cl_null(g_stcb_d[l_ac].stcb006) AND NOT cl_null(g_stcb_d[l_ac].stcb007)  AND NOT cl_null(g_stcb_d[l_ac].stcb016) AND NOT cl_null(g_stcb_d[l_ac].stcb017) THEN    
               CALL astt601_cal_nextd() RETURNING g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020
            END IF            
            #END add-point
 
         #----<<stcb007>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb007
            #add-point:BEFORE FIELD stcb007
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb007
            
            #add-point:AFTER FIELD stcb007
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcb007
            #add-point:ON CHANGE stcb007
            IF NOT cl_null(g_stcb_d[l_ac].stcb006) AND NOT cl_null(g_stcb_d[l_ac].stcb007)  AND NOT cl_null(g_stcb_d[l_ac].stcb016) AND NOT cl_null(g_stcb_d[l_ac].stcb017) THEN    
               CALL astt601_cal_nextd() RETURNING g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020
            END IF            
            #END add-point
 
         #----<<stcb008>>----
         #此段落由子樣板a02產生
         AFTER FIELD stcb008
            
            #add-point:AFTER FIELD stcb008
                                    LET g_stcb_d[l_ac].stcb008_desc = ''
            IF NOT cl_null(g_stcb_d[l_ac].stcb008) THEN
               IF NOT astt601_stcb008_chk(g_stcb_d[l_ac].stcb008) THEN
                  LET g_stcb_d[l_ac].stcb008 = g_stcb_d_t.stcb008
                  CALL astt601_stcb008_ref()
                  NEXT FIELD stcb008
               END IF
            END IF
            CALL astt601_stcb008_ref()
            
             CALL astt601_set_entry_b(l_cmd)
             CALL astt601_set_no_required_b(l_cmd)
             CALL astt601_set_required_b(l_cmd)
             CALL astt601_set_no_entry_b(l_cmd)
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcb008
            #add-point:BEFORE FIELD stcb008
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stcb008
            #add-point:ON CHANGE stcb008
                        
            #END add-point
 
         #----<<stcb009>>----
         #此段落由子樣板a02產生
         AFTER FIELD stcb009
            
            #add-point:AFTER FIELD stcb009
                                   LET g_stcb_d[l_ac].stcb009_desc = ''
            IF NOT cl_null(g_stcb_d[l_ac].stcb009) THEN
               IF NOT astt601_stcb008_chk(g_stcb_d[l_ac].stcb009) THEN
                  LET g_stcb_d[l_ac].stcb009 = g_stcb_d_t.stcb009
                  CALL astt601_stcb009_ref()
                  NEXT FIELD stcb009
               END IF
            END IF
            CALL astt601_stcb009_ref()
            CALL astt601_set_entry_b(l_cmd)
             CALL astt601_set_no_required_b(l_cmd)
             CALL astt601_set_required_b(l_cmd)
             CALL astt601_set_no_entry_b(l_cmd)
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcb009
            #add-point:BEFORE FIELD stcb009
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stcb009
            #add-point:ON CHANGE stcb009
                        
            #END add-point
 
         #----<<stcb010>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb010
            #add-point:BEFORE FIELD stcb010
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb010
            
            #add-point:AFTER FIELD stcb010
                                   IF NOT cl_null(g_stcb_d[l_ac].stcb010) THEN
               IF g_stcb_d[l_ac].stcb010 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcb_d[l_ac].stcb010 = g_stcb_d_t.stcb010
                  NEXT FIELD stcb010
               END IF
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcb010
            #add-point:ON CHANGE stcb010
                        
            #END add-point
 
         #----<<stcb011>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb011
            #add-point:BEFORE FIELD stcb011
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb011
            
            #add-point:AFTER FIELD stcb011
                                     IF NOT cl_null( g_stcb_d[l_ac].stcb011) THEN
               IF g_stcb_d[l_ac].stcb011 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcb_d[l_ac].stcb011 = g_stcb_d_t.stcb011
                  NEXT FIELD stcb011
               END IF
            END IF 
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcb011
            #add-point:ON CHANGE stcb011
                        
            #END add-point
 
         #----<<stcb012>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb012
            #add-point:BEFORE FIELD stcb012
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb012
            
            #add-point:AFTER FIELD stcb012
                                    CALL astt601_set_entry_b(l_cmd)
             CALL astt601_set_no_required_b(l_cmd)
             CALL astt601_set_required_b(l_cmd)
             CALL astt601_set_no_entry_b(l_cmd)
             
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcb012
            #add-point:ON CHANGE stcb012
                        
            #END add-point
 
         #----<<stcb013>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb013
            #add-point:BEFORE FIELD stcb013
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb013
            
            #add-point:AFTER FIELD stcb013
                                    IF NOT cl_null(g_stcb_d[l_ac].stcb013) THEN
               IF g_stcb_d[l_ac].stcb013 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcb_d[l_ac].stcb013 = g_stcb_d_t.stcb013
                  NEXT FIELD stcb013
               END IF
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcb013
            #add-point:ON CHANGE stcb013
                        
            #END add-point
 
         #----<<stcb014>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb014
            #add-point:BEFORE FIELD stcb014
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb014
            
            #add-point:AFTER FIELD stcb014
                                    IF NOT cl_null(g_stcb_d[l_ac].stcb014) THEN
               IF g_stcb_d[l_ac].stcb014 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcb_d[l_ac].stcb014 = g_stcb_d_t.stcb014
                  NEXT FIELD stcb014
               END IF
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcb014
            #add-point:ON CHANGE stcb014
                        
            #END add-point
 
         #----<<stcb015>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb015
            #add-point:BEFORE FIELD stcb015
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb015
            
            #add-point:AFTER FIELD stcb015
                                    CALL astt601_set_entry_b(l_cmd)
             CALL astt601_set_no_required_b(l_cmd)
             CALL astt601_set_required_b(l_cmd)
             CALL astt601_set_no_entry_b(l_cmd)
            IF g_stcb_d[l_ac].stcb015 = '1' AND g_stcc_d.getlength() > 0 THEN
               IF cl_ask_confirm('ast-00018') THEN
                  DELETE FROM stcc_t
                   WHERE stccent = g_enterprise AND stccdocno = g_stca_m.stcadocno AND
                         stccseq1 = g_stcb_d_t.stcbseq
                   CALL g_stcc_d.clear()
               ELSE
                  LET  g_stcb_d[l_ac].stcb015 = g_stcb_d_t.stcb015 
               END IF  
             END IF  
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcb015
            #add-point:ON CHANGE stcb015
                        
            #END add-point
 
         #----<<stcb016>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb016
            #add-point:BEFORE FIELD stcb016
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb016
            
            #add-point:AFTER FIELD stcb016
            IF NOT cl_null(g_stcb_d[l_ac].stcb016) THEN
               IF NOT astt601_stcb016_017_chk() THEN
                  LET g_stcb_d[l_ac].stcb016 =g_stcb_d_t.stcb016
                  NEXT FIELD CURRENT
               END IF
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcb016
            #add-point:ON CHANGE stcb016
                        
            #END add-point
 
         #----<<stcb017>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb017
            #add-point:BEFORE FIELD stcb017
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb017
            
            #add-point:AFTER FIELD stcb017
            IF NOT cl_null(g_stcb_d[l_ac].stcb017) THEN
               IF NOT astt601_stcb016_017_chk() THEN
                  LET g_stcb_d[l_ac].stcb017 =g_stcb_d_t.stcb017
                  NEXT FIELD CURRENT
               END IF
               #失效日期修改不可以小于astm601里面的下次费用开始日期-1天
               IF g_stca_m.stca000 = 'U' THEN
                  IF astt601_chk_astm601_jiesuan(g_stcb_d[l_ac].stcbseq) THEN
                     SELECT stcf019 INTO l_stcf019 FROM stcf_t 
                       WHERE stcfent = g_enterprise AND stcf001 = g_stca_m.stca001 AND stcfseq = g_stcb_d[l_ac].stcbseq
                     IF g_stcb_d[l_ac].stcb017 < l_stcf019-1 THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = 'ast-00203'
                        LET g_errparam.extend = ''
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        
                        LET g_stcb_d[l_ac].stcb017 = g_stcb_d_t.stcb017
                        NEXT FIELD stcb017 
                     END IF
                  END IF
               END IF
               
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcb017
            #add-point:ON CHANGE stcb017
                        
            #END add-point
 
         #----<<stcb018>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcb018
            #add-point:BEFORE FIELD stcb018
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcb018
            
            #add-point:AFTER FIELD stcb018
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcb018
            #add-point:ON CHANGE stcb018
                        
            #END add-point
 
         #----<<stcbunit>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcbunit
            #add-point:BEFORE FIELD stcbunit
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcbunit
            
            #add-point:AFTER FIELD stcbunit
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcbunit
            #add-point:ON CHANGE stcbunit
                        
            #END add-point
 
         #----<<stcbsite>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcbsite
            #add-point:BEFORE FIELD stcbsite
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcbsite
            
            #add-point:AFTER FIELD stcbsite
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcbsite
            #add-point:ON CHANGE stcbsite
                        
            #END add-point
 
 
         #---------------------<  Detail: page1  >---------------------
         #----<<stcbseq>>----
         #Ctrlp:input.c.page1.stcbseq
         ON ACTION controlp INFIELD stcbseq
            #add-point:ON ACTION controlp INFIELD stcbseq
                        
            #END add-point
 
         #----<<stcb002>>----
         #Ctrlp:input.c.page1.stcb002
         ON ACTION controlp INFIELD stcb002
            #add-point:ON ACTION controlp INFIELD stcb002
                        #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcb_d[l_ac].stcb002             #給予default值
            LET g_qryparam.default2 = "" #g_stcb_d[l_ac].stael003 #說明
            LET g_qryparam.default3 = "" #g_stcb_d[l_ac].stae001 #費用編號

            #給予arg
            SELECT ooef019 INTO l_ooef019 FROM ooef_t 
             WHERE ooefent = g_enterprise AND ooef001 = g_stca_m.stca014
            LET g_qryparam.where = " (stae009 = 'N' OR stae010 IN (SELECT oodb002 FROM oodb_t WHERE oodbent = '",g_enterprise,"' AND oodb001 = '",l_ooef019,"'))"
                            
            
            CALL q_stae001_3()                                #呼叫開窗

            LET g_stcb_d[l_ac].stcb002 = g_qryparam.return1              #將開窗取得的值回傳到變數
            #LET g_stcb_d[l_ac].stael003 = g_qryparam.return2 #說明
            #LET g_stcb_d[l_ac].stae001 = g_qryparam.return3 #費用編號

            DISPLAY g_stcb_d[l_ac].stcb002 TO stcb002              #顯示到畫面上
            #DISPLAY g_stcb_d[l_ac].stael003 TO stael003 #說明
            #DISPLAY g_stcb_d[l_ac].stae001 TO stae001 #費用編號

            NEXT FIELD stcb002                          #返回原欄位


            #END add-point
 
         #----<<stcb003>>----
         #Ctrlp:input.c.page1.stcb003
         ON ACTION controlp INFIELD stcb003
            #add-point:ON ACTION controlp INFIELD stcb003
                        
            #END add-point
 
         #----<<stcb004>>----
         #Ctrlp:input.c.page1.stcb004
         ON ACTION controlp INFIELD stcb004
            #add-point:ON ACTION controlp INFIELD stcb004
                        
            #END add-point
 
         #----<<stcb005>>----
         #Ctrlp:input.c.page1.stcb005
         ON ACTION controlp INFIELD stcb005
            #add-point:ON ACTION controlp INFIELD stcb005
                        
            #END add-point
 
         #----<<stcb006>>----
         #Ctrlp:input.c.page1.stcb006
         ON ACTION controlp INFIELD stcb006
            #add-point:ON ACTION controlp INFIELD stcb006
                        
            #END add-point
 
         #----<<stcb007>>----
         #Ctrlp:input.c.page1.stcb007
         ON ACTION controlp INFIELD stcb007
            #add-point:ON ACTION controlp INFIELD stcb007
                        
            #END add-point
 
         #----<<stcb008>>----
         #Ctrlp:input.c.page1.stcb008
         ON ACTION controlp INFIELD stcb008
            #add-point:ON ACTION controlp INFIELD stcb008
                        #此段落由子樣板a07產生            
            #開窗i段
			    INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcb_d[l_ac].stcb008             #給予default值
            LET g_qryparam.default2 = "" #g_stcb_d[l_ac].stabl003 #說明
            LET g_qryparam.default3 = "" #g_stcb_d[l_ac].stabl004 #助記碼
            LET g_qryparam.arg1 = g_stca_m.stca005
            LET g_qryparam.arg2 = g_stca_m.stca007
            CALL q_stab001_3()   #呼叫開窗
                              

            LET g_stcb_d[l_ac].stcb008 = g_qryparam.return1              #將開窗取得的值回傳到變數
            #LET g_stcb_d[l_ac].stabl003 = g_qryparam.return2 #說明
            #LET g_stcb_d[l_ac].stabl004 = g_qryparam.return3 #助記碼

            DISPLAY g_stcb_d[l_ac].stcb008 TO stcb008              #顯示到畫面上
            #DISPLAY g_stcb_d[l_ac].stabl003 TO stabl003 #說明
            #DISPLAY g_stcb_d[l_ac].stabl004 TO stabl004 #助記碼
            CALL astt601_stcb008_ref()
            NEXT FIELD stcb008                          #返回原欄位


            #END add-point
 
         #----<<stcb009>>----
         #Ctrlp:input.c.page1.stcb009
         ON ACTION controlp INFIELD stcb009
            #add-point:ON ACTION controlp INFIELD stcb009
                        #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcb_d[l_ac].stcb009             #給予default值
            LET g_qryparam.default2 = "" #g_stcb_d[l_ac].stabl003 #說明
            LET g_qryparam.default3 = "" #g_stcb_d[l_ac].stabl004 #助記碼
            LET g_qryparam.arg1 = g_stca_m.stca005
            LET g_qryparam.arg2 = g_stca_m.stca007
            CALL q_stab001_3()   #呼叫開窗
                              

            LET g_stcb_d[l_ac].stcb009 = g_qryparam.return1              #將開窗取得的值回傳到變數
            #LET g_stcb_d[l_ac].stabl003 = g_qryparam.return2 #說明
            #LET g_stcb_d[l_ac].stabl004 = g_qryparam.return3 #助記碼

            DISPLAY g_stcb_d[l_ac].stcb009 TO stcb009              #顯示到畫面上
            #DISPLAY g_stcb_d[l_ac].stabl003 TO stabl003 #說明
            #DISPLAY g_stcb_d[l_ac].stabl004 TO stabl004 #助記碼
            CALL astt601_stcb009_ref()
            NEXT FIELD stcb009                          #返回原欄位


            #END add-point
 
         #----<<stcb010>>----
         #Ctrlp:input.c.page1.stcb010
         ON ACTION controlp INFIELD stcb010
            #add-point:ON ACTION controlp INFIELD stcb010
                        
            #END add-point
 
         #----<<stcb011>>----
         #Ctrlp:input.c.page1.stcb011
         ON ACTION controlp INFIELD stcb011
            #add-point:ON ACTION controlp INFIELD stcb011
                        
            #END add-point
 
         #----<<stcb012>>----
         #Ctrlp:input.c.page1.stcb012
         ON ACTION controlp INFIELD stcb012
            #add-point:ON ACTION controlp INFIELD stcb012
                        
            #END add-point
 
         #----<<stcb013>>----
         #Ctrlp:input.c.page1.stcb013
         ON ACTION controlp INFIELD stcb013
            #add-point:ON ACTION controlp INFIELD stcb013
                        
            #END add-point
 
         #----<<stcb014>>----
         #Ctrlp:input.c.page1.stcb014
         ON ACTION controlp INFIELD stcb014
            #add-point:ON ACTION controlp INFIELD stcb014
                        
            #END add-point
 
         #----<<stcb015>>----
         #Ctrlp:input.c.page1.stcb015
         ON ACTION controlp INFIELD stcb015
            #add-point:ON ACTION controlp INFIELD stcb015
                        
            #END add-point
 
         #----<<stcb016>>----
         #Ctrlp:input.c.page1.stcb016
         ON ACTION controlp INFIELD stcb016
            #add-point:ON ACTION controlp INFIELD stcb016
                        
            #END add-point
 
         #----<<stcb017>>----
         #Ctrlp:input.c.page1.stcb017
         ON ACTION controlp INFIELD stcb017
            #add-point:ON ACTION controlp INFIELD stcb017
                        
            #END add-point
 
         #----<<stcb018>>----
         #Ctrlp:input.c.page1.stcb018
         ON ACTION controlp INFIELD stcb018
            #add-point:ON ACTION controlp INFIELD stcb018
                        
            #END add-point
 
         #----<<stcbunit>>----
         #Ctrlp:input.c.page1.stcbunit
         ON ACTION controlp INFIELD stcbunit
            #add-point:ON ACTION controlp INFIELD stcbunit
                        
            #END add-point
 
         #----<<stcbsite>>----
         #Ctrlp:input.c.page1.stcbsite
         ON ACTION controlp INFIELD stcbsite
            #add-point:ON ACTION controlp INFIELD stcbsite
                        
            #END add-point
 
 
 
         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()
 
               LET INT_FLAG = 0
               LET g_stcb_d[l_ac].* = g_stcb_d_t.*
               CLOSE astt601_bcl
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = g_stcb_d[l_ac].stcbseq
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               LET g_stcb_d[l_ac].* = g_stcb_d_t.*
            ELSE
            
               #add-point:單身修改前
               IF cl_null(g_stcb_d[l_ac].stcb021) THEN LET g_stcb_d[l_ac].stcb021 = 'N' END IF  
               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               UPDATE stcb_t SET (stcbdocno,stcbseq,stcb002,stcb003,stcb004,stcb005,stcb006,stcb007, 
                   stcb008,stcb009,stcb010,stcb011,stcb012,stcb013,stcb014,stcb015,stcb016,stcb017,stcb018, 
                   stcb019,stcb020,
                   stcbunit,stcbsite,stcb021) = (g_stca_m.stcadocno,g_stcb_d[l_ac].stcbseq,g_stcb_d[l_ac].stcb002, 
                   g_stcb_d[l_ac].stcb003,g_stcb_d[l_ac].stcb004,g_stcb_d[l_ac].stcb005,g_stcb_d[l_ac].stcb006, 
                   g_stcb_d[l_ac].stcb007,g_stcb_d[l_ac].stcb008,g_stcb_d[l_ac].stcb009,g_stcb_d[l_ac].stcb010, 
                   g_stcb_d[l_ac].stcb011,g_stcb_d[l_ac].stcb012,g_stcb_d[l_ac].stcb013,g_stcb_d[l_ac].stcb014, 
                   g_stcb_d[l_ac].stcb015,g_stcb_d[l_ac].stcb016,g_stcb_d[l_ac].stcb017,g_stcb_d[l_ac].stcb018, 
                   g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020,
                   g_stcb_d[l_ac].stcbunit,g_stcb_d[l_ac].stcbsite,g_stcb_d[l_ac].stcb021)
                WHERE stcbent = g_enterprise AND stcbdocno = g_stca_m.stcadocno 
 
                  AND stcbseq = g_stcb_d_t.stcbseq #項次   
 
                  
               #add-point:單身修改中
                              
               #end add-point
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.extend = "stcb_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
 
                     CALL s_transaction_end('N','0')
                     LET g_stcb_d[l_ac].* = g_stcb_d_t.*
                  WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stcb_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
                     LET g_stcb_d[l_ac].* = g_stcb_d_t.*                     
                     CALL s_transaction_end('N','0')
                  OTHERWISE
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stca_m.stcadocno
               LET gs_keys_bak[1] = g_stcadocno_t
               LET gs_keys[2] = g_stcb_d[g_detail_idx].stcbseq
               LET gs_keys_bak[2] = g_stcb_d_t.stcbseq
               CALL astt601_update_b('stcb_t',gs_keys,gs_keys_bak,"'1'")
                     #資料多語言用-增/改
                     
               END CASE
               
               #add-point:單身修改後
                              
               #end add-point
 
            END IF
            
         AFTER ROW
            #add-point:單身after_row
       
            CALL astt601_stcb005_chk(l_ac) RETURNING l_success,l_ac1    
            IF NOT l_success THEN
               NEXT FIELD stcb005
            END IF 
            #end add-point
            CALL astt601_unlock_b("stcb_t","'1'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            
              
         AFTER INPUT
            #add-point:input段after input 
            #IF NOT astt601_stca017_018_chk() THEN
            #   NEXT FIELD stca017
            #END IF     
            CALL astt601_stcb005_chk(0) RETURNING l_success,l_ac1    
            IF NOT l_success THEN
               CALL FGL_SET_ARR_CURR(l_ac1) 
               NEXT FIELD stcb005
            END IF                
            #end add-point 
 
         ON ACTION controlo    
            CALL FGL_SET_ARR_CURR(g_stcb_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac
            LET li_reproduce_target = g_stcb_d.getLength()+1
            
         #ON ACTION cancel
         #   LET INT_FLAG = 1
         #   LET g_detail_idx = 1
         #   EXIT DIALOG 
 
      END INPUT
      
      INPUT ARRAY g_stcb2_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stcb2_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            CALL astt601_b_fill()
            LET g_rec_b = g_stcb2_d.getLength()
            #add-point:資料輸入前
                        
            #end add-point
            
         BEFORE INSERT
            
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stcb2_d[l_ac].* TO NULL 
                  LET g_stcb2_d[l_ac].stcd003 = "Y"
 
 
            LET g_stcb2_d_t.* = g_stcb2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt601_set_entry_b(l_cmd)
            #add-point:modify段after_set_entry_b
                        
            #end add-point
            CALL astt601_set_no_entry_b(l_cmd)
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_stcb2_d[li_reproduce_target].* = g_stcb2_d[li_reproduce].*
 
               LET g_stcb2_d[li_reproduce_target].stcdseq = NULL
            END IF
            #公用欄位給值(單身2)
            
            
            #add-point:modify段before insert
                                    SELECT MAX(stcdseq)+1 INTO  g_stcb2_d[l_ac].stcdseq FROM stcd_t
             WHERE stcdent = g_enterprise AND stcddocno = g_stca_m.stcadocno
            IF cl_null(  g_stcb2_d[l_ac].stcdseq ) THEN             
               LET   g_stcb2_d[l_ac].stcdseq = 1
            END IF
           # LET g_stcb2_d[l_ac].stcdsite = g_stca_m.stcasite
            LET g_stcb2_d[l_ac].stcdunit = g_stca_m.stcaunit
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
            OPEN astt601_cl USING g_enterprise,g_stca_m.stcadocno
            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN astt601_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               CLOSE astt601_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
            
            LET g_rec_b = g_stcb2_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND g_stcb2_d[l_ac].stcdseq IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_stcb2_d_t.* = g_stcb2_d[l_ac].*  #BACKUP
               CALL astt601_set_entry_b(l_cmd)
               #add-point:modify段after_set_entry_b
                              
               #end add-point  
               CALL astt601_set_no_entry_b(l_cmd)
               IF NOT astt601_lock_b("stcd_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt601_bcl2 INTO g_stcb2_d[l_ac].stcdseq,g_stcb2_d[l_ac].stcd002,g_stcb2_d[l_ac].stcd002_desc, 
                      g_stcb2_d[l_ac].stcd003,g_stcb2_d[l_ac].stcdunit,g_stcb2_d[l_ac].stcdsite
                   IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
 
                     LET l_lock_sw = "Y"
                  END IF
                  
                  LET g_bfill = "N"
                  CALL astt601_show()
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
            IF l_cmd = 'a' AND g_stcb2_d.getLength() < l_ac THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
               CALL g_stcb2_d.deleteElement(l_ac)
               NEXT FIELD stcdseq
            END IF
         
            IF g_stcb2_d[l_ac].stcdseq IS NOT NULL
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
               
               DELETE FROM stcd_t
                WHERE stcdent = g_enterprise AND stcddocno = g_stca_m.stcadocno AND
                      stcdseq = g_stcb2_d_t.stcdseq
                  
               #add-point:單身2刪除中
                              
               #end add-point    
                  
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stcb_t"
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
               CLOSE astt601_bcl
               LET l_count = g_stcb_d.getLength()
            END IF 
            
                           INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stca_m.stcadocno
               LET gs_keys[2] = g_stcb2_d[g_detail_idx].stcdseq
 
            
         AFTER DELETE 
            #add-point:單身AFTER DELETE 
                        
            #end add-point
                           CALL astt601_delete_b('stcd_t',gs_keys,"'2'")
 
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
            SELECT COUNT(*) INTO l_count FROM stcd_t 
             WHERE stcdent = g_enterprise AND stcddocno = g_stca_m.stcadocno
               AND stcdseq = g_stcb2_d[l_ac].stcdseq
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前
                              
               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stca_m.stcadocno
               LET gs_keys[2] = g_stcb2_d[g_detail_idx].stcdseq
               CALL astt601_insert_b('stcd_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2
                              
               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00006"
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               INITIALIZE g_stcb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stcd_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
               CALL s_transaction_end('N','0')                    
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL astt601_b_fill()
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
               LET g_stcb2_d[l_ac].* = g_stcb2_d_t.*
               CLOSE astt601_bcl2
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
            
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               LET g_stcb2_d[l_ac].* = g_stcb2_d_t.*
            ELSE
               #add-point:單身page2修改前
                              
               #end add-point
               
               #寫入修改者/修改日期資訊(單身2)
               
               
               UPDATE stcd_t SET (stcddocno,stcdseq,stcd002,stcd003,stcdunit,stcdsite) = (g_stca_m.stcadocno, 
                   g_stcb2_d[l_ac].stcdseq,g_stcb2_d[l_ac].stcd002,g_stcb2_d[l_ac].stcd003,g_stcb2_d[l_ac].stcdunit, 
                   g_stcb2_d[l_ac].stcdsite) #自訂欄位頁簽
                WHERE stcdent = g_enterprise AND stcddocno = g_stca_m.stcadocno
                  AND stcdseq = g_stcb2_d_t.stcdseq #項次 
                  
               #add-point:單身page2修改中
                              
               #end add-point
                  
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.extend = "stcd_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
 
                     CALL s_transaction_end('N','0')
                     LET g_stcb2_d[l_ac].* = g_stcb2_d_t.*
                  WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stcd_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
                     CALL s_transaction_end('N','0')
                     LET g_stcb2_d[l_ac].* = g_stcb2_d_t.*
                  OTHERWISE
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stca_m.stcadocno
               LET gs_keys_bak[1] = g_stcadocno_t
               LET gs_keys[2] = g_stcb2_d[g_detail_idx].stcdseq
               LET gs_keys_bak[2] = g_stcb2_d_t.stcdseq
               CALL astt601_update_b('stcd_t',gs_keys,gs_keys_bak,"'2'")
                     #資料多語言用-增/改
                     
               END CASE
               #add-point:單身page2修改後
                              
               #end add-point
            END IF
         
         #---------------------<  Detail: page2  >---------------------
         #----<<stcdseq>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcdseq
            #add-point:BEFORE FIELD stcdseq
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcdseq
            
            #add-point:AFTER FIELD stcdseq
                                    #此段落由子樣板a05產生
            IF  NOT cl_null(g_stca_m.stcadocno) AND NOT cl_null(g_stcb2_d[g_detail_idx].stcdseq) THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND ( l_cmd = 'u' AND (g_stca_m.stcadocno != g_stcadocno_t OR g_stcb2_d[g_detail_idx].stcdseq != g_stcb2_d_t.stcdseq))) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM stcd_t WHERE "||"stcdent = '" ||g_enterprise|| "' AND "||"stcddocno = '"||g_stca_m.stcadocno ||"' AND "|| "stcdseq = '"||g_stcb2_d[g_detail_idx].stcdseq ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcdseq
            #add-point:ON CHANGE stcdseq
                        
            #END add-point
 
         #----<<stcd002>>----
         #此段落由子樣板a02產生
         AFTER FIELD stcd002
            
            #add-point:AFTER FIELD stcd002
           LET g_stcb2_d[l_ac].stcd002_desc = ''
           IF NOT cl_null(g_stcb2_d[l_ac].stcd002) THEN
              IF NOT astt601_stcd002_chk(l_cmd,g_stcb2_d[l_ac].stcd002) THEN
                    LET g_stcb2_d[l_ac].stcd002 = g_stcb2_d_t.stcd002
                    CALL astt601_stcd002_ref()
                    NEXT FIELD  stcd002                
              END IF
             
              IF l_cmd = 'a' THEN             
                SELECT COUNT(*) INTO l_n FROM stcd_t
                 WHERE stcdent = g_enterprise AND stcddocno= g_stca_m.stcadocno
                   AND stcd002 =g_stcb2_d[l_ac].stcd002 AND stcdseq <> g_stcb2_d[l_ac].stcdseq
              ELSE
                 SELECT COUNT(*) INTO l_n FROM stcd_t
                 WHERE stcdent = g_enterprise AND stcddocno= g_stca_m.stcadocno
                   AND stcd002 =g_stcb2_d[l_ac].stcd002 AND stcdseq <> g_stcb2_d_t.stcdseq 
              END IF
              IF l_n > 0 THEN
                 INITIALIZE g_errparam TO NULL
                 LET g_errparam.code = 'ast-00025'
                 LET g_errparam.extend = ''
                 LET g_errparam.popup = TRUE
                 CALL cl_err()
                 LET g_stcb2_d[l_ac].stcd002 = g_stcb2_d_t.stcd002
                 CALL astt601_stcd002_ref() 
                 NEXT FIELD  stcd002 
              END IF 
           END IF
           CALL astt601_stcd002_ref()
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD stcd002
            #add-point:BEFORE FIELD stcd002
                        
            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE stcd002
            #add-point:ON CHANGE stcd002
                        
            #END add-point
 
         #----<<stcd003>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcd003
            #add-point:BEFORE FIELD stcd003
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcd003
            
            #add-point:AFTER FIELD stcd003
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcd003
            #add-point:ON CHANGE stcd003
                        
            #END add-point
 
         #----<<stcdunit>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcdunit
            #add-point:BEFORE FIELD stcdunit
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcdunit
            
            #add-point:AFTER FIELD stcdunit
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcdunit
            #add-point:ON CHANGE stcdunit
                        
            #END add-point
 
         #----<<stcdsite>>----
         #此段落由子樣板a01產生
         BEFORE FIELD stcdsite
            #add-point:BEFORE FIELD stcdsite
                        
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD stcdsite
            
            #add-point:AFTER FIELD stcdsite
                        
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE stcdsite
            #add-point:ON CHANGE stcdsite
                        
            #END add-point
 
 
         #---------------------<  Detail: page2  >---------------------
         #----<<stcdseq>>----
         #Ctrlp:input.c.page2.stcdseq
         ON ACTION controlp INFIELD stcdseq
            #add-point:ON ACTION controlp INFIELD stcdseq
                        
            #END add-point
 
         #----<<stcd002>>----
         #Ctrlp:input.c.page2.stcd002
         ON ACTION controlp INFIELD stcd002
            #add-point:ON ACTION controlp INFIELD stcd002
                        #此段落由子樣板a07產生            
            #開窗i段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_stcb2_d[l_ac].stcd002             #給予default值
            
           SELECT dbbc004,dbba002 INTO l_dbbc004,l_dbba002 FROM  dbba_t,dbbc_t
            WHERE dbbaent = dbbcent AND dbbc001 = g_stca_m.stca028
              AND dbbc004 = dbba001 AND dbbaent = g_enterprise 
              
           LET g_qryparam.arg1 = l_dbbc004
           IF l_dbba002 = '1' THEN           
             # CALL cl_get_para(g_enterprise,g_site,'E-CIR-0001') RETURNING l_sys
             ##給予arg
             #LET g_qryparam.arg1 = l_sys 
             #
             #CALL q_rtax001_3() 
              CALL q_dbbb003_1()             
           ELSE
             #CALL q_oocq002_2002() 
              CALL q_dbbb003_2() 
           END IF           

            LET g_stcb2_d[l_ac].stcd002 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_stcb2_d[l_ac].stcd002 TO stcd002              #顯示到畫面上
            CALL astt601_stcd002_ref()
            NEXT FIELD stcd002                          #返回原欄位


            #END add-point
 
         #----<<stcd003>>----
         #Ctrlp:input.c.page2.stcd003
         ON ACTION controlp INFIELD stcd003
            #add-point:ON ACTION controlp INFIELD stcd003
                        
            #END add-point
 
         #----<<stcdunit>>----
         #Ctrlp:input.c.page2.stcdunit
         ON ACTION controlp INFIELD stcdunit
            #add-point:ON ACTION controlp INFIELD stcdunit
                        
            #END add-point
 
         #----<<stcdsite>>----
         #Ctrlp:input.c.page2.stcdsite
         ON ACTION controlp INFIELD stcdsite
            #add-point:ON ACTION controlp INFIELD stcdsite
                        
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
                  LET g_stcb2_d[l_ac].* = g_stcb2_d_t.*
               END IF
               CLOSE astt601_bcl2
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
            CALL astt601_unlock_b("stcd_t","'2'")
            CALL s_transaction_end('Y','0')
 
         AFTER INPUT
            #add-point:input段after input 
                        
            #end add-point   
    
         ON ACTION controlo
            CALL FGL_SET_ARR_CURR(g_stcb2_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac
            LET li_reproduce_target = g_stcb2_d.getLength()+1
 
      END INPUT
 
 
      
 
      
 
      
 
      
 
{</section>}
 
{<section id="astt601.input.other" >}
      
      #add-point:自定義input
                   INPUT ARRAY g_stcc_d FROM s_detail3.*
          ATTRIBUTE(COUNT = g_rec_b3,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 

         BEFORE INPUT
            IF g_stcb_d[l_ac].stcb015 = '1' OR cl_null(g_stcb_d[l_ac].stcb015) THEN
               NEXT FIELD stcbseq
            END IF
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stcc_d.getLength()+1) 
              LET g_insert = 'N' 
            END IF 

            CALL astt601_b3_fill()
            LET g_rec_b3 = g_stcc_d.getLength()

            
         BEFORE ROW
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac3 = ARR_CURR()
            LET g_detail_idx3 = l_ac3
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac3 TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astt601_cl USING g_enterprise,g_stca_m.stca001

            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN astt601_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               CLOSE astt601_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
         
            
            LET g_rec_b3 = g_stcc_d.getLength()
            
            IF g_rec_b3 >= l_ac3 
               AND NOT cl_null(g_stcc_d[l_ac3].stccseq2) 

            THEN
               LET l_cmd='u'
               LET g_stcc_d_t.* = g_stcc_d[l_ac3].*  #BACKUP
               CALL astt601_set_entry_b(l_cmd)
               CALL astt601_set_no_entry_b(l_cmd)
               IF NOT astt601_lock_b("stcc_t","'2'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt601_bcl3 INTO g_stcc_d[l_ac3].stccseq2,  g_stcc_d[l_ac3].stcc002,g_stcc_d[l_ac3].stcc003,g_stcc_d[l_ac3].stcc004
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = g_stcc_d_t.stccseq2
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET l_lock_sw = "Y"
                  END IF
                  
                  LET g_bfill = "N"
                  CALL astt601_show()
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
            INITIALIZE g_stcc_d[l_ac3].* TO NULL 
            
            LET g_stcc_d_t.* = g_stcc_d[l_ac3].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt601_set_entry_b(l_cmd)
            CALL astt601_set_no_entry_b(l_cmd)
            #公用欄位給值(單身)
            
   
            SELECT MAX(stccseq2)+1 INTO  g_stcc_d[l_ac3].stccseq2 FROM stcc_t
             WHERE stccent = g_enterprise AND stccdocno = g_stca_m.stcadocno AND stccseq1 =g_stcb_d[l_ac].stcbseq 
            IF cl_null(  g_stcc_d[l_ac3].stccseq2 ) THEN             
               LET  g_stcc_d[l_ac3].stccseq2 = 1
            END IF
            
            SELECT MAX(stcc003)+1 INTO  g_stcc_d[l_ac3].stcc002 FROM stcc_t
             WHERE stccent = g_enterprise AND stccdocno = g_stca_m.stcadocno AND stccseq1 =g_stcb_d[l_ac].stcbseq  
            IF cl_null(  g_stcc_d[l_ac3].stcc002 ) THEN             
               LET  g_stcc_d[l_ac3].stccseq2 = 1
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
            SELECT COUNT(*) INTO l_count FROM stcc_t 
             WHERE stccent = g_enterprise AND stccdocno = g_stca_m.stcadocno

               AND stccseq1 = g_stcb_d[l_ac].stcbseq AND stccseq2 = g_stcc_d[l_ac3].stccseq2

                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前

               #end add-point
            
               INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stca_m.stcadocno
               LET gs_keys[2] = g_stcb_d[l_ac].stcbseq
               CALL astt601_insert_b('stcc_t',gs_keys,"'3'")
                           
               #add-point:單身新增後

               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00006"
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               CALL cl_err()

               INITIALIZE g_stcc_d[l_ac3].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stcc_t"
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
            IF NOT cl_null(g_stcc_d[l_ac3].stccseq2) 

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
               
               DELETE FROM stcc_t
                WHERE stccent = g_enterprise AND stccdocno = g_stca_m.stcadocno AND

                      stccseq1 = g_stcb_d[l_ac].stcbseq AND stccseq2 =  g_stcc_d_t.stccseq2

                  
               #add-point:單身刪除中

               #end add-point 
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stcc_t"
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
               CLOSE astt601_bcl3
               LET l_count = g_stcc_d.getLength()
            END IF 
            
                           INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stca_m.stcadocno
               LET gs_keys[2] = g_stcb_d[l_ac].stcbseq



         
         AFTER FIELD stcc002,stcc003
            IF NOT cl_null(g_stcc_d[l_ac3].stcc002) THEN
               IF g_stcc_d[l_ac3].stcc002 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcc_d[l_ac3].stcc002 = g_stcc_d_t.stcc002
                  NEXT FIELD stcc002
               END IF
            END IF
            IF NOT cl_null(g_stcc_d[l_ac3].stcc003) THEN
               IF g_stcc_d[l_ac3].stcc003 <=0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  LET g_stcc_d[l_ac3].stcc003 = g_stcc_d_t.stcc003
                  NEXT FIELD stcc003
               END IF
            END IF
            IF NOT cl_null(g_stcc_d[l_ac3].stcc002) AND NOT cl_null(g_stcc_d[l_ac3].stcc003) THEN
               IF g_stcc_d[l_ac3].stcc003 < g_stcc_d[l_ac3].stcc002 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00017'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD CURRENT
               END IF
            
               SELECT COUNT(*) INTO l_n FROM stcc_t
                WHERE stccent = g_enterprise AND stccdocno = g_stca_m.stcadocno 
                  AND stccseq1 = g_stcb_d[l_ac].stcbseq
                  AND ((stcc002 between g_stcc_d[l_ac3].stcc002 AND g_stcc_d[l_ac3].stcc003)
                      OR (stcc003 between g_stcc_d[l_ac3].stcc002 AND g_stcc_d[l_ac3].stcc003)
                      OR (g_stcc_d[l_ac3].stcc002  between stcc002 AND stcc003)
                      OR (g_stcc_d[l_ac3].stcc003  between stcc002 AND stcc003))
                  AND stccseq2 <> g_stcc_d[l_ac3].stccseq2
               IF l_n > 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00016'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                  NEXT FIELD CURRENT
               END IF
             
            END IF
         
     
         
         
         AFTER FIELD stcc004
            IF NOT cl_null(g_stcc_d[l_ac3].stcc004) THEN
               IF g_stcc_d[l_ac3].stcc004<= 0 THEN
                 INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = '-32406'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

                 LET g_stcc_d[l_ac3].stcc004 = g_stcc_d_t.stcc004
                 NEXT FIELD stcc004
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
               LET g_stcc_d[l_ac3].* = g_stcc_d_t.*
               CLOSE astt601_bcl3
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = g_stcc_d[l_ac3].stccseq2
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET g_stcc_d[l_ac3].* = g_stcc_d_t.*
            ELSE
            
               #add-point:單身修改前

               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               UPDATE stcc_t SET (stccseq2,stcc002,stcc003,stcc004) = (g_stcc_d[l_ac3].stccseq2,g_stcc_d[l_ac3].stcc002,g_stcc_d[l_ac3].stcc003,g_stcc_d[l_ac3].stcc004)
                WHERE stccent = g_enterprise AND stccdocno = g_stca_m.stcadocno 
                  AND stccseq1 = g_stcb_d[l_ac].stcbseq #項次   
                  AND stccseq2 = g_stcc_d_t.stccseq2
                  
               #add-point:單身修改中

               #end add-point
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stcc_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
   
                  LET g_stcc_d[l_ac3].* = g_stcc_d_t.*
             
                  
               END IF
               
               #add-point:單身修改後

               #end add-point
 
            END IF
            
         AFTER ROW
            CALL astt601_unlock_b("stcc_t","'3'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            
              
         AFTER INPUT
            #add-point:input段after input 

            #end add-point   
              
     
                 
      END INPUT 
      
      
      INPUT ARRAY g_stcv_d FROM s_detail4.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = l_allow_insert, 
                  DELETE ROW = l_allow_delete,
                  APPEND ROW = l_allow_insert)
 

         BEFORE INPUT      
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_stcv_d.getLength()+1) 
              LET g_insert = 'N' 
            END IF 
            CALL astt601_b_fill()
            LET g_rec_b = g_stcv_d.getLength()

            
         BEFORE ROW
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astt601_cl USING g_enterprise,g_stca_m.stcadocno

            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN astt601_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()

               CLOSE astt601_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
         
            
            LET g_rec_b = g_stcv_d.getLength()
            
            IF g_rec_b >= l_ac 
               AND NOT cl_null(g_stcv_d[l_ac].stcvseq) 

            THEN
               LET l_cmd='u'
               LET g_stcv_d_t.* = g_stcv_d[l_ac].*  #BACKUP
               CALL astt601_set_entry_b(l_cmd)
               CALL astt601_set_no_entry_b(l_cmd)
               IF NOT astt601_lock_b("stcv_t","'4'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt601_bcl4 INTO g_stcv_d[l_ac].stcvsite,g_stcv_d[l_ac].stcvunit,g_stcv_d[l_ac].stcvseq,  g_stcv_d[l_ac].stcv002,g_stcv_d[l_ac].stcv003,g_stcv_d[l_ac].stcv004,g_stcv_d[l_ac].stcv005,g_stcv_d[l_ac].stcv006
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = g_stcv_d_t.stcvseq
                     LET g_errparam.popup = TRUE
                     CALL cl_err()

                     LET l_lock_sw = "Y"
                  END IF
                  
                  LET g_bfill = "N"
                  CALL astt601_show()
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
            INITIALIZE g_stcv_d[l_ac].* TO NULL 
            
            LET g_stcv_d_t.* = g_stcv_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL astt601_set_entry_b(l_cmd)
            CALL astt601_set_no_entry_b(l_cmd)
            #公用欄位給值(單身)
            
            LET g_stcv_d[l_ac].stcvsite = g_stca_m.stcasite
            LET g_stcv_d[l_ac].stcvunit = g_stca_m.stcaunit
   
     
  
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
            SELECT COUNT(*) INTO l_count FROM stcv_t 
             WHERE stcvent = g_enterprise AND stcvdocno = g_stca_m.stcadocno

               AND stcvseq = g_stcv_d[l_ac].stcvseq 

                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身新增前

               #end add-point
            
               INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stca_m.stcadocno
               LET gs_keys[2] = g_stcv_d[l_ac].stcvseq
               CALL astt601_insert_b('stcv_t',gs_keys,"'4'")
                           
               #add-point:單身新增後

               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00006"
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               CALL cl_err()

               INITIALIZE g_stcv_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stcv_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
               CALL s_transaction_end('N','0')                    
               CANCEL INSERT
            ELSE
               #先刷新資料
              
               CALL s_transaction_end('Y','0')
               ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF NOT cl_null(g_stcv_d[l_ac].stcvseq) 

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
               
               DELETE FROM stcv_t
                WHERE stcvent = g_enterprise AND stcvdocno = g_stca_m.stcadocno AND

                      stcvseq = g_stcv_d_t.stcvseq 

                  
               #add-point:單身刪除中

               #end add-point 
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stcv_t"
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
               CLOSE astt601_bcl4
               LET l_count = g_stcv_d.getLength()
            END IF 
            
                           INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stca_m.stcadocno
               LET gs_keys[2] = g_stcv_d[l_ac].stcvseq



         
       
     
         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()

               LET INT_FLAG = 0
               LET g_stcv_d[l_ac].* = g_stcv_d_t.*
               CLOSE astt601_bcl4
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = g_stcv_d[l_ac].stcvseq
               LET g_errparam.popup = TRUE
               CALL cl_err()

               LET g_stcv_d[l_ac].* = g_stcv_d_t.*
            ELSE
            
               #add-point:單身修改前

               #end add-point
               
               #寫入修改者/修改日期資訊(單身)
               
      
               UPDATE stcv_t SET (stcvseq,stcv002,stcv003,stcv004) = (g_stcv_d[l_ac].stcvseq,g_stcv_d[l_ac].stcv002,g_stcv_d[l_ac].stcv003,g_stcv_d[l_ac].stcv004)
                WHERE stcvent = g_enterprise AND stcvdocno = g_stca_m.stcadocno   
                  AND stcvseq = g_stcv_d_t.stcvseq
                  
               #add-point:單身修改中

               #end add-point
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stcv_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
   
                  LET g_stcv_d[l_ac].* = g_stcv_d_t.*
             
                  
               END IF
               
               #add-point:單身修改後

               #end add-point
 
            END IF
            
         AFTER ROW
            CALL astt601_unlock_b("stcv_t","'4'")
            CALL s_transaction_end('Y','0')
            #其他table進行unlock
            
              
         AFTER INPUT
            #add-point:input段after input 

            #end add-point   
              
     
                 
      END INPUT 
      #160513-00033#7--(S)
      
      INPUT ARRAY g_stck_d FROM s_detail5.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = TRUE, 
                  DELETE ROW = TRUE,
                  APPEND ROW = TRUE)
                 
         BEFORE INPUT      
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
               CALL FGL_SET_ARR_CURR(g_stck_d.getLength()+1) 
               LET g_insert = 'N' 
            END IF 
            CALL astt601_b_fill()
            LET g_rec_b = g_stck_d.getLength()

            
         BEFORE ROW
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astt601_cl USING g_enterprise,g_stca_m.stcadocno

            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN astt601_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()
               CLOSE astt601_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
         
            
            LET g_rec_b = g_stck_d.getLength()
            
            IF g_rec_b >= l_ac AND NOT cl_null(g_stck_d[l_ac].stckseq) THEN
               LET l_cmd='u'
               LET g_stck_d_t.* = g_stck_d[l_ac].*
               CALL astt601_set_entry_b(l_cmd)
               CALL astt601_set_no_entry_b(l_cmd)
               IF NOT astt601_lock_b("stck_t","'5'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt601_bcl5 INTO g_stck_d[l_ac].stcksite,g_stck_d[l_ac].stckunit,g_stck_d[l_ac].stckseq,g_stck_d[l_ac].stck001,  g_stck_d[l_ac].stck002,g_stck_d[l_ac].stck003,g_stck_d[l_ac].stck004,g_stck_d[l_ac].stck005,g_stck_d[l_ac].stck006
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = g_stck_d_t.stckseq
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF                  
                  LET g_bfill = "N"
                  CALL astt601_show()
                  LET g_bfill = "Y"                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
                  
        
         BEFORE INSERT            
            LET l_insert = TRUE
            LET l_ac = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stck_d[l_ac].* TO NULL 
            CALL cl_show_fld_cont()            
            #公用欄位給值(單身)            
            LET g_stck_d[l_ac].stcksite = g_stca_m.stcasite
            LET g_stck_d[l_ac].stckunit = g_stca_m.stcaunit
            LET g_stck_d[l_ac].stck001  = g_stca_m.stca001
            SELECT MAX(stckseq) +1  INTO g_stck_d[l_ac].stckseq
              FROM stck_t
             WHERE stckent = g_enterprise
               AND stckdocno = g_stca_m.stcadocno
            IF cl_null(g_stck_d[l_ac].stckseq) THEN LET g_stck_d[l_ac].stckseq = 1 END IF
            LET g_stck_d[l_ac].stck004 = '1'
            LET g_stck_d[l_ac].stck006 = g_today
            #LET g_stck_d[l_ac].stck007 = g_today           #160704-00007#1 160705 by sakura mark
            LET g_stck_d[l_ac].stck007 = g_stca_m.stca018   #160704-00007#1 160705 by sakura add
            LET g_stck_d[l_ac].stck008 = 0
            LET g_stck_d[l_ac].stck009 = 0
            LET g_stck_d[l_ac].stck011 = '1'
            IF l_ac > 1 THEN
               LET g_stck_d[l_ac].stck010 = g_stck_d[l_ac-1].stck010
               CALL astt601_stck010_ref()
            END IF
            LET g_stck_d_t.* = g_stck_d[l_ac].*
            CALL astt601_set_entry_b(l_cmd)
            CALL astt601_set_no_entry_b(l_cmd)
  
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
            
            LET l_count = 1  
            SELECT COUNT(*) INTO l_count FROM stck_t 
             WHERE stckent = g_enterprise AND stckdocno = g_stca_m.stcadocno
               AND stckseq = g_stck_d[l_ac].stckseq 
                
            IF l_count = 0 THEN 
               INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stca_m.stcadocno
               LET gs_keys[2] = g_stck_d[l_ac].stckseq
               CALL astt601_insert_b('stck_t',gs_keys,"'5'")
            ELSE    
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00006"
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               INITIALIZE g_stck_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stck_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()  
               CALL s_transaction_end('N','0')                    
               CANCEL INSERT
            ELSE
               #先刷新資料              
               CALL s_transaction_end('Y','0')
               ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF NOT cl_null(g_stck_d[l_ac].stckseq) THEN 
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
               
               DELETE FROM stck_t
                WHERE stckent = g_enterprise AND stckdocno = g_stca_m.stcadocno 
                  AND stckseq = g_stck_d_t.stckseq 
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "stck_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CALL s_transaction_end('N','0')
                  CANCEL DELETE   
               ELSE
                  LET g_rec_b = g_rec_b-1
                  CALL s_transaction_end('Y','0')
               END IF 
               CLOSE astt601_bcl5
               LET l_count = g_stck_d.getLength()
            END IF             
            INITIALIZE gs_keys TO NULL 
            LET gs_keys[1] = g_stca_m.stcadocno
            LET gs_keys[2] = g_stck_d[l_ac].stckseq
     
         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()
               LET INT_FLAG = 0
               LET g_stck_d[l_ac].* = g_stck_d_t.*
               CLOSE astt601_bcl5
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = g_stck_d[l_ac].stckseq
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET g_stck_d[l_ac].* = g_stck_d_t.*
            ELSE
               UPDATE stck_t 
                  SET stckseq = g_stck_d[l_ac].stckseq,
                      stck002 = g_stck_d[l_ac].stck002,
                      stck003 = g_stck_d[l_ac].stck003,
                      stck004 = g_stck_d[l_ac].stck004,
                      stck005 = g_stck_d[l_ac].stck005,
                      stck006 = g_stck_d[l_ac].stck006,
                      stck007 = g_stck_d[l_ac].stck007,
                      stck008 = g_stck_d[l_ac].stck008,
                      stck009 = g_stck_d[l_ac].stck009,
                      stck010 = g_stck_d[l_ac].stck010,
                      stck011 = g_stck_d[l_ac].stck011,
                      stck012 = g_stck_d[l_ac].stck012,
                      stck013 = g_stck_d[l_ac].stck013,
                      stck014 = g_stck_d[l_ac].stck014
                WHERE stckent = g_enterprise AND stckdocno = g_stca_m.stcadocno   
                  AND stckseq = g_stck_d_t.stckseq
                  
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "stck_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_stck_d[l_ac].* = g_stck_d_t.*
               END IF
            END IF
            
         AFTER ROW
            CALL astt601_unlock_b("stck_t","'5'")
            CALL s_transaction_end('Y','0')         
         
         #项次
         AFTER FIELD stckseq
            IF NOT cl_null(g_stck_d[l_ac].stckseq) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stck_d[l_ac].stckseq != g_stck_d_t.stckseq OR g_stck_d_t.stckseq IS NULL )) THEN
                  LET l_cnt = 0
                  SELECT count(*) INTO l_cnt FROM stck_t
                   WHERE stckent = g_enterprise
                     AND stckdocno = g_stca_m.stcadocno AND stckseq = g_stck_d[l_ac].stckseq
                  IF l_cnt > 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00004"
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     LET  g_stck_d[l_ac].stckseq = g_stck_d_t.stckseq
                     NEXT FIELD CURRENT
                  END IF  
               END IF
            END IF
         #摘要
         ON ACTION controlp INFIELD stck002
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
   			LET g_qryparam.reqry = FALSE
   			LET g_qryparam.arg1 = '2147'
            CALL q_oocq002()                     
            LET g_stck_d[l_ac].stck002 = g_qryparam.return1
            DISPLAY g_qryparam.return1 TO stck002
            NEXT FIELD stck002 
         
         AFTER FIELD stck002
            LET g_stck_d[l_ac].stck002_desc = ''
            IF NOT cl_null(g_stck_d[l_ac].stck002) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stck_d[l_ac].stck002 != g_stck_d_t.stck002 OR g_stck_d_t.stck002 IS NULL )) THEN
                  IF NOT s_azzi650_chk_exist('2147',g_stck_d[l_ac].stck002) THEN
                     LET g_stck_d[l_ac].stck002  = g_stck_d_t.stck002
                     CALL s_desc_get_acc_desc('2147',g_stck_d[l_ac].stck002) RETURNING g_stck_d[l_ac].stck002_desc
                     DISPLAY BY NAME g_stck_d[l_ac].stck002_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF   
            CALL s_desc_get_acc_desc('2147',g_stck_d[l_ac].stck002) RETURNING g_stck_d[l_ac].stck002_desc
            DISPLAY BY NAME g_stck_d[l_ac].stck002_desc
         
         #商品编号
         ON ACTION controlp INFIELD stck003
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
   			LET g_qryparam.reqry = FALSE
            CALL q_imaa001()                  
            LET g_stck_d[l_ac].stck003 = g_qryparam.return1            
            DISPLAY g_qryparam.return1 TO stck003
            NEXT FIELD stck003 
         
         AFTER FIELD stck003
            LET g_stck_d[l_ac].imaal003 = ''
            LET g_stck_d[l_ac].imaal004 = ''
            IF NOT cl_null(g_stck_d[l_ac].stck003) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stck_d[l_ac].stck003 != g_stck_d_t.stck003 OR g_stck_d_t.stck003 IS NULL )) THEN
                  CALL s_aimm200_chk_item(g_stck_d[l_ac].stck003) RETURNING g_sub_success
                  IF NOT g_sub_success THEN
                     LET g_stck_d[l_ac].stck003 = g_stck_d_t.stck003
                     NEXT FIELD CURRENT
                  END IF
                  INITIALIZE g_chkparam.* TO NULL
                  LET g_chkparam.arg1 = g_stck_d[l_ac].stcksite
                  LET g_chkparam.arg2 = g_stck_d[l_ac].stck003
                  IF NOT cl_chk_exist("v_imaf001_3") THEN
                     LET g_stck_d[l_ac].stck003 = g_stck_d_t.stck003
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF
            CALL s_desc_get_item_desc(g_stck_d[l_ac].stck003) RETURNING g_stck_d[l_ac].imaal003,g_stck_d[l_ac].imaal004
            DISPLAY BY NAME g_stck_d[l_ac].imaal003,g_stck_d[l_ac].imaal004
         
         #现返类型
         ON CHANGE stck004
            CALL astt601_set_entry_b(l_cmd)
            CALL astt601_set_no_entry_b(l_cmd)
         
         AFTER FIELD stck004
            IF cl_null(g_stck_d[l_ac].stck004) THEN
               NEXT FIELD CURRENT
            END IF
            IF NOT cl_null(g_stck_d[l_ac].stck004) THEN
               IF NOT g_stck_d[l_ac].stck004 MATCHES '[12]' THEN
                  LET g_stck_d[l_ac].stck004 = g_stck_d_t.stck004
                  NEXT FIELD CURRENT
               END IF
            END IF
            #160704-00007#1 160705 by sakura mark(S)
            ##160629-00005#1 160630 by sakura add(S)
            #IF g_stck_d[l_ac].stck004 = '1'THEN
            #   LET g_stck_d[l_ac].stck006 = NULL
            #   LET g_stck_d[l_ac].stck007 = NULL
            #END IF
            #CALL astt601_set_entry_b(l_cmd)
            #CALL astt601_set_no_entry_b(l_cmd)            
            ##160629-00005#1 160630 by sakura add(E)
            #160704-00007#1 160705 by sakura mark(E)
         
         #条件区间
         ON CHANGE stck005
            CALL astt601_set_entry_b(l_cmd)
            CALL astt601_set_no_entry_b(l_cmd)
         
         #起始日期
         AFTER FIELD stck006
            IF NOT cl_null(g_stck_d[l_ac].stck006) AND NOT cl_null(g_stck_d[l_ac].stck007) THEN
               IF g_stck_d[l_ac].stck006 > g_stck_d[l_ac].stck007 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'sub-00095'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
         
         #截止日期
         AFTER FIELD stck007
            IF NOT cl_null(g_stck_d[l_ac].stck006) AND NOT cl_null(g_stck_d[l_ac].stck007) THEN
               IF g_stck_d[l_ac].stck006 > g_stck_d[l_ac].stck007 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'sub-00095'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
         
         #起始金额
         AFTER FIELD stck008
            IF NOT cl_null(g_stck_d[l_ac].stck008) THEN
                IF l_cmd = 'a' AND g_stck_d[l_ac].stck009 = 0 THEN
                  LET g_stck_d[l_ac].stck009 = g_stck_d[l_ac].stck008
               END IF
               IF g_stck_d[l_ac].stck008 < 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00049'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
            IF NOT cl_null(g_stck_d[l_ac].stck008) AND NOT cl_null(g_stck_d[l_ac].stck009) THEN
               IF g_stck_d[l_ac].stck008 > g_stck_d[l_ac].stck009 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00783'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
         
         #截止日期
         AFTER FIELD stck009
            IF NOT cl_null(g_stck_d[l_ac].stck009) THEN
               IF g_stck_d[l_ac].stck009 < 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00049'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
            IF NOT cl_null(g_stck_d[l_ac].stck008) AND NOT cl_null(g_stck_d[l_ac].stck009) THEN
               IF g_stck_d[l_ac].stck008 > g_stck_d[l_ac].stck009 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00783'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
         
         #计算基准   
         ON ACTION controlp INFIELD stck010
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
   			LET g_qryparam.reqry = FALSE
   			LET g_qryparam.arg1 = g_stca_m.stca005
            LET g_qryparam.arg2 = g_stca_m.stca007
            CALL q_stab001_3()                    
            LET g_stck_d[l_ac].stck010 = g_qryparam.return1            
            DISPLAY g_qryparam.return1 TO stck010
            NEXT FIELD stck010 
         
         AFTER FIELD stck010
            LET g_stck_d[l_ac].stck010_desc = ''
            IF NOT cl_null(g_stck_d[l_ac].stck010) THEN               
               IF NOT astt601_stck0010_chk(g_stck_d[l_ac].stck010) THEN
                  LET g_stck_d[l_ac].stck010 = g_stck_d_t.stck010
                  CALL astt601_stck010_ref()
                  NEXT FIELD CURRENT
               END IF

            END IF
            CALL astt601_stck010_ref()
         
         #折扣类型
         ON CHANGE stck011
            CALL astt601_set_entry_b(l_cmd)
            CALL astt601_set_no_entry_b(l_cmd)
            
         #折扣比率
         AFTER FIELD stck012
            IF NOT cl_null(g_stck_d[l_ac].stck012) THEN
               IF NOT cl_ap_chk_range(g_stck_d[l_ac].stck012,"0","1","100","1","azz-00087",1) THEN
                  NEXT FIELD stck012
               END IF
            END IF
         
         #固定金额
         AFTER FIELD stck013
            IF NOT cl_null(g_stck_d[l_ac].stck013) THEN
               IF g_stck_d[l_ac].stck013 < 0 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'agl-00049'
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT
               END IF
            END IF
         
         #理由码
         ON ACTION controlp INFIELD stck014
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
   			LET g_qryparam.reqry = FALSE
   			LET g_qryparam.arg1 = '2146'
            CALL q_oocq002()           
            LET g_stck_d[l_ac].stck014 = g_qryparam.return1            
            DISPLAY g_qryparam.return1 TO stck014
            NEXT FIELD stck014 
         
         AFTER FIELD stck014
            LET g_stck_d[l_ac].stck014_desc = ''
            IF NOT cl_null(g_stck_d[l_ac].stck014) THEN
               IF p_cmd = 'a' OR (p_cmd = 'u' AND (g_stck_d[l_ac].stck014 != g_stck_d_t.stck014 OR g_stck_d_t.stck014 IS NULL )) THEN
                  IF NOT s_azzi650_chk_exist('2146',g_stck_d[l_ac].stck014) THEN
                     LET g_stck_d[l_ac].stck014  = g_stck_d_t.stck014
                     CALL s_desc_get_acc_desc('2146',g_stck_d[l_ac].stck014) RETURNING g_stck_d[l_ac].stck014_desc
                     DISPLAY BY NAME g_stck_d[l_ac].stck014_desc
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF   
            CALL s_desc_get_acc_desc('2146',g_stck_d[l_ac].stck014) RETURNING g_stck_d[l_ac].stck014_desc
            DISPLAY BY NAME g_stck_d[l_ac].stck014_desc   
      END INPUT
      
      INPUT ARRAY g_stct_d FROM s_detail6.*
          ATTRIBUTE(COUNT = g_rec_b,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                  INSERT ROW = TRUE, 
                  DELETE ROW = TRUE,
                  APPEND ROW = TRUE)
                 
         BEFORE INPUT      
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
               CALL FGL_SET_ARR_CURR(g_stct_d.getLength()+1) 
               LET g_insert = 'N' 
            END IF 
            CALL astt601_b_fill()
            LET g_rec_b = g_stct_d.getLength()

            
         BEFORE ROW
            LET l_insert = FALSE
            LET l_cmd = ''
            LET l_ac = ARR_CURR()
            LET g_detail_idx = l_ac
            
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            DISPLAY l_ac TO FORMONLY.idx
         
            CALL s_transaction_begin()
            OPEN astt601_cl USING g_enterprise,g_stca_m.stcadocno

            IF STATUS THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code =  STATUS
               LET g_errparam.extend = "OPEN astt601_cl:"
               LET g_errparam.popup = TRUE
               CALL cl_err()
               CLOSE astt601_cl
               CALL s_transaction_end('N','0')
               RETURN
            END IF
         
            
            LET g_rec_b = g_stct_d.getLength()
            
            IF g_rec_b >= l_ac AND NOT cl_null(g_stct_d[l_ac].stctseq) THEN
               LET l_cmd='u'
               LET g_stct_d_t.* = g_stct_d[l_ac].*
               CALL astt601_set_entry_b(l_cmd)
               CALL astt601_set_no_entry_b(l_cmd)
               IF NOT astt601_lock_b("stct_t","'6'") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH astt601_bcl6 INTO g_stct_d[l_ac].stctsite,g_stct_d[l_ac].stctunit,g_stct_d[l_ac].stctseq,g_stct_d[l_ac].stct001
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = g_stct_d_t.stctseq
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
                     LET l_lock_sw = "Y"
                  END IF                  
                  LET g_bfill = "N"
                  CALL astt601_show()
                  LET g_bfill = "Y"                  
                  CALL cl_show_fld_cont()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
                  
        
         BEFORE INSERT            
            LET l_insert = TRUE
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_stct_d[l_ac].* TO NULL 
            CALL cl_show_fld_cont()            
            #公用欄位給值(單身)            
            LET g_stct_d[l_ac].stctsite = g_stca_m.stcasite
            LET g_stct_d[l_ac].stctunit = g_stca_m.stcaunit
            SELECT MAX(stctseq) +1  INTO g_stct_d[l_ac].stctseq
              FROM stct_t
             WHERE stctent = g_enterprise
               AND stctdocno = g_stca_m.stcadocno
            IF cl_null(g_stct_d[l_ac].stctseq) THEN LET g_stct_d[l_ac].stctseq = 1 END IF
            
            LET g_stct_d_t.* = g_stct_d[l_ac].*
            CALL astt601_set_entry_b(l_cmd)
            CALL astt601_set_no_entry_b(l_cmd)
  
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
            
            LET l_count = 1  
            SELECT COUNT(*) INTO l_count FROM stct_t 
             WHERE stctent = g_enterprise AND stctdocno = g_stca_m.stcadocno
               AND stctseq = g_stct_d[l_ac].stctseq 
                
            IF l_count = 0 THEN 
               INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_stca_m.stcadocno
               LET gs_keys[2] = g_stct_d[l_ac].stctseq
               CALL astt601_insert_b('stct_t',gs_keys,"'6'")
            ELSE    
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00006"
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               CALL cl_err()
               INITIALIZE g_stct_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "stct_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()  
               CALL s_transaction_end('N','0')                    
               CANCEL INSERT
            ELSE
               #先刷新資料              
               CALL s_transaction_end('Y','0')
               ERROR 'INSERT O.K'
               LET g_rec_b = g_rec_b + 1
            END IF
              
         BEFORE DELETE                            #是否取消單身
            IF NOT cl_null(g_stct_d[l_ac].stctseq) THEN 
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
               
               DELETE FROM stct_t
                WHERE stctent = g_enterprise AND stctdocno = g_stca_m.stcadocno 
                  AND stctseq = g_stct_d_t.stctseq 
               
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "stct_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  CALL s_transaction_end('N','0')
                  CANCEL DELETE   
               ELSE
                  LET g_rec_b = g_rec_b-1
                  CALL s_transaction_end('Y','0')
               END IF 
               CLOSE astt601_bcl6
               LET l_count = g_stct_d.getLength()
            END IF             
            INITIALIZE gs_keys TO NULL 
            LET gs_keys[1] = g_stca_m.stcadocno
            LET gs_keys[2] = g_stct_d[l_ac].stctseq
     
         ON ROW CHANGE
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()
               LET INT_FLAG = 0
               LET g_stct_d[l_ac].* = g_stct_d_t.*
               CLOSE astt601_bcl6
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
              
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = g_stct_d[l_ac].stctseq
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET g_stct_d[l_ac].* = g_stct_d_t.*
            ELSE
               UPDATE stct_t 
                  SET stctseq = g_stct_d[l_ac].stctseq,
                      stct001 = g_stct_d[l_ac].stct001
                WHERE stctent = g_enterprise AND stctdocno = g_stca_m.stcadocno   
                  AND stctseq = g_stct_d_t.stctseq
                  
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "stct_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET g_stct_d[l_ac].* = g_stct_d_t.*
               END IF
            END IF
            
         AFTER ROW
            CALL astt601_unlock_b("stct_t","'6'")
            CALL s_transaction_end('Y','0')         
         
         #项次
         AFTER FIELD stctseq
            IF NOT cl_null(g_stct_d[l_ac].stctseq) THEN
               IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_stct_d[l_ac].stctseq != g_stct_d_t.stctseq OR g_stct_d_t.stctseq IS NULL )) THEN
                  LET l_cnt = 0
                  SELECT count(*) INTO l_cnt FROM stct_t
                   WHERE stctent = g_enterprise
                     AND stctdocno = g_stca_m.stcadocno AND stctseq = g_stct_d[l_ac].stctseq
                  IF l_cnt > 0 THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00004"
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = FALSE
                     CALL cl_err()
                     LET g_stct_d[l_ac].stctseq = g_stct_d_t.stctseq
                     NEXT FIELD CURRENT
                  END IF  
               END IF
            END IF
         
         #供应商
         ON ACTION controlp INFIELD stct001
            INITIALIZE g_qryparam.* TO NULL
            IF l_cmd = 'a' THEN
               LET g_qryparam.state = 'm'
            ELSE
               LET g_qryparam.state = 'i'
            END IF
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.default1 = g_stct_d[l_ac].stct001
            LET g_qryparam.where = " pmaa001 <> '",g_stca_m.stca009,"' AND pmaa001 NOT IN (SELECT stct001 FROM stct_t WHERE stctent = ",g_enterprise ," AND stctdocno = '",g_stca_m.stcadocno,"' AND stct001 IS NOT NULL)"
            CALL q_pmaa001_21()
            LET g_stct_d[l_ac].stct001 = g_qryparam.return1
            DISPLAY g_qryparam.return1 TO stct001
            IF g_qryparam.state = 'i' THEN
               LET g_stct_d[l_ac].stct001_desc = g_qryparam.return2
              #CALL s_desc_get_trading_partner_abbr_desc(g_stct_d[l_ac].stct001) RETURNING g_stct_d[l_ac].stct001_desc
               DISPLAY BY NAME g_stct_d[l_ac].stct001_desc
            ELSE
               LET l_seq = l_ac 
               FOR l_i = 1 TO g_qryparam.str_array.getLength()
                  LET l_substring = g_qryparam.str_array[l_i]
                  LET l_index = l_substring.getIndexOf("|",1)                  
                  LET g_stct_d[l_seq].stct001 = l_substring.substring('1',l_index-1)
                  IF NOT astt601_stca009_chk(g_stct_d[l_seq].stct001) THEN
                     CONTINUE FOR
                  END IF
                  LET l_count = 0
                  SELECT COUNT(*) INTO l_count FROM stct_t 
                   WHERE stctent = g_enterprise AND stctdocno = g_stca_m.stcadocno
                     AND stct001 = g_stct_d[l_seq].stct001
                     AND stctseq <> g_stct_d[l_seq].stctseq
                  IF l_count > 0 THEN
                     CONTINUE FOR
                  END IF
                  IF NOT l_index = l_substring.getLength() THEN
                     LET g_stct_d[l_seq].stct001_desc = l_substring.substring(l_index+1,l_substring.getLength())
                  END IF
                  DISPLAY BY NAME g_stct_d[l_seq].stct001,g_stct_d[l_seq].stct001_desc
                  IF l_seq > l_ac THEN
                     SELECT MAX(stctseq) +1 INTO g_stct_d[l_seq].stctseq
                       FROM stct_t
                      WHERE stctent = g_enterprise
                        AND stctdocno = g_stca_m.stcadocno
                     IF cl_null(g_stct_d[l_seq].stctseq) THEN LET g_stct_d[l_seq].stctseq = 2 END IF
                     IF g_stct_d[l_seq].stctseq = g_stct_d[l_ac].stctseq THEN LET g_stct_d[l_seq].stctseq = g_stct_d[l_seq].stctseq + 1 END IF
                     LET l_count = 1  
                     SELECT COUNT(*) INTO l_count FROM stct_t 
                      WHERE stctent = g_enterprise AND stctdocno = g_stca_m.stcadocno
                        AND stctseq = g_stct_d[l_seq].stctseq                          
                     IF l_count = 0 THEN 
                        LET l_count = 0
                        SELECT COUNT(*) INTO l_count FROM stct_t 
                         WHERE stctent = g_enterprise AND stctdocno = g_stca_m.stcadocno
                           AND stct001 = g_stct_d[l_seq].stct001
                           AND stctseq <> g_stct_d[l_seq].stctseq
                        IF l_count > 0 THEN
                           CONTINUE FOR
                        END IF
                        INSERT INTO stct_t (stctent,stctsite,stctunit,stctdocno,stctseq,stct001)
                                     VALUES(g_enterprise,g_stca_m.stcasite,g_stca_m.stcaunit,g_stca_m.stcadocno,g_stct_d[l_seq].stctseq,g_stct_d[l_seq].stct001)
                     ELSE
                        CONTINUE FOR
                     END IF
                  END IF
                  LET l_seq = l_seq +1
               END FOR
            END IF            
            NEXT FIELD stct001
            
         AFTER FIELD stct001
            LET g_stct_d[l_ac].stct001_desc = ''
            IF NOT cl_null(g_stct_d[l_ac].stct001) THEN
               
               IF NOT astt601_stca009_chk(g_stct_d[l_ac].stct001) THEN
                  LET g_stct_d[l_ac].stct001 = g_stct_d_t.stct001
                  CALL s_desc_get_trading_partner_abbr_desc(g_stct_d[l_ac].stct001) RETURNING g_stct_d[l_ac].stct001_desc
                  DISPLAY BY NAME g_stct_d[l_ac].stct001
                  NEXT FIELD stct001
               END IF
               
               IF g_stct_d[l_ac].stct001 = g_stca_m.stca009 THEN
                  INITIALIZE g_errparam TO NULL 
                  #LET g_errparam.code   = 'azz-00704' #160913-00022#1 20160914 mark by beckxie
                  LET g_errparam.code   = 'ast-00862' #160913-00022#1 20160914 add by beckxie
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  LET g_stct_d[l_ac].stct001 = g_stct_d_t.stct001
                  CALL s_desc_get_trading_partner_abbr_desc(g_stct_d[l_ac].stct001) RETURNING g_stct_d[l_ac].stct001_desc
                  DISPLAY BY NAME g_stct_d[l_ac].stct001
                  NEXT FIELD stct001
               END IF
               LET l_count = 0
               SELECT COUNT(*) INTO l_count FROM stct_t 
                WHERE stctent = g_enterprise AND stctdocno = g_stca_m.stcadocno
                  AND stct001 = g_stct_d[l_ac].stct001
                  AND stctseq <> g_stct_d[l_ac].stctseq
               IF l_count > 0 THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.code   = 'azz-00704' 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  LET g_stct_d[l_ac].stct001 = g_stct_d_t.stct001
                  CALL s_desc_get_trading_partner_abbr_desc(g_stct_d[l_ac].stct001) RETURNING g_stct_d[l_ac].stct001_desc
                  DISPLAY BY NAME g_stct_d[l_ac].stct001
                  NEXT FIELD stct001
               END IF
            END IF
      END INPUT
      #160513-00033#7--(E)
      #end add-point
      
      BEFORE DIALOG 
         #add-point:input段before dialog
      
         #end add-point    
         #新增時強制從單頭開始填
         IF p_cmd = 'a' THEN
            NEXT FIELD stcasite #sakura add
            NEXT FIELD stcadocno
         ELSE
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD stcbseq
               WHEN "s_detail2"
                  NEXT FIELD stcdseq
 
 
            END CASE
         END IF
    
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) RETURNING g_fld_name,g_frm_name
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang)
 
      ON ACTION controlr
         CALL cl_show_req_fields()
 
      ON ACTION controls
         CALL cl_set_head_visible("","AUTO")
 
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
 
{<section id="astt601.show" >}
#+ 單頭資料重新顯示及單身資料重抓
PRIVATE FUNCTION astt601_show()
   {<Local define>}
   DEFINE l_ac_t    LIKE type_t.num5
   {</Local define>}
   #add-point:show段define
   DEFINE l_success  LIKE type_t.num5  
   #end add-point  
 
   #add-point:show段之前
      
   LET g_stca_m_o.* = g_stca_m.*
   #end add-point
   
   
   
   LET g_stca_m_t.* = g_stca_m.*      #保存單頭舊值
   
   IF g_bfill = "Y" THEN
      CALL astt601_b_fill() #單身填充
      CALL astt601_b_fill2('0') #單身填充
   END IF
     
   #帶出公用欄位reference值
   #此段落由子樣板a12產生
      #LET g_stca_m.stcaownid_desc = cl_get_username(g_stca_m.stcaownid)
      #LET g_stca_m.stcaowndp_desc = cl_get_deptname(g_stca_m.stcaowndp)
      #LET g_stca_m.stcacrtid_desc = cl_get_username(g_stca_m.stcacrtid)
      #LET g_stca_m.stcacrtdp_desc = cl_get_deptname(g_stca_m.stcacrtdp)
      #LET g_stca_m.stcamodid_desc = cl_get_username(g_stca_m.stcamodid)
      #LET g_stca_m.stcacnfid_desc = cl_get_deptname(g_stca_m.stcacnfid)
 
      
 
 
   
   LET l_ac_t = l_ac
   
   #讀入ref值(單頭)
   #add-point:show段reference
            CALL astt601_stca009_ref()
      CALL astt601_stca004_ref()
      CALL astt601_stca021_ref()
      CALL astt601_stca022_ref()
      CALL astt601_stca023_ref()
      CALL astt601_stca006_ref()
      CALL astt601_stca007_ref()
      CALL astt601_stca024_ref()
      CALL astt601_stca028_ref()
      CALL astt601_stca025_ref()
      CALL astt601_stca014_ref()
      CALL astt601_stca015_ref()     
      CALL astt601_stcasite_ref()
  
      CALL astt601_stca010_ref() 
      CALL astt601_stca011_ref()
      CALL astt601_stca012_ref()
      CALL astt601_stca016_ref()
      CALL astt601_stca026_ref()
   
      SELECT stcv004 INTO g_stca_m.next_b FROM ( SELECT * FROM stcv_t
       WHERE stcvent = g_enterprise AND  stcvdocno = g_stca_m.stcadocno AND stcv005= 'N' ORDER BY stcvseq) WHERE rownum = 1
     
      DISPLAY g_stca_m.next_b TO next_b
      
      IF NOT cl_null(g_stca_m.stcadocno) THEN
         CALL s_aooi360_sel('2',g_stca_m.stcadocno,'','','','','','','','','','4') RETURNING l_success,g_stca_m.ooff013
      END IF
      DISPLAY BY NAME g_stca_m.ooff013, g_stca_m.stca027
            
   
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stca_m.stcaownid
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stca_m.stcaownid_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stca_m.stcaownid_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stca_m.stcaowndp
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stca_m.stcaowndp_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stca_m.stcaowndp_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stca_m.stcacrtid
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stca_m.stcacrtid_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stca_m.stcacrtid_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stca_m.stcacrtdp
            CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
            LET g_stca_m.stcacrtdp_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stca_m.stcacrtdp_desc

            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stca_m.stcamodid
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stca_m.stcamodid_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stca_m.stcamodid_desc
            
            INITIALIZE g_ref_fields TO NULL
            LET g_ref_fields[1] = g_stca_m.stcacnfid
            CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
            LET g_stca_m.stcacnfid_desc = '', g_rtn_fields[1] , ''
            DISPLAY BY NAME g_stca_m.stcacnfid_desc
   #160513-00033#7--(S)
   IF g_stca_m.stca005 = '11' THEN
      CALL cl_set_comp_visible('page_1',TRUE)
      CALL cl_set_comp_visible('stcb021',TRUE)
   ELSE
      CALL cl_set_comp_visible('page_1',FALSE)
      CALL cl_set_comp_visible('stcb021',FALSE)
   END IF
   IF g_stca_m.stca000 = 'I' THEN
      CALL cl_set_comp_visible('page_4',TRUE)
   ELSE
      CALL cl_set_comp_visible('page_4',FALSE)
   END IF
   #160513-00033#7--(E)
   #end add-point
   
   #將資料輸出到畫面上
   DISPLAY BY NAME g_stca_m.stca000,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_stca_m.stca005,g_stca_m.stca001, 
       g_stca_m.stca002,g_stca_m.stca003,g_stca_m.stca004,g_stca_m.stca004_desc,g_stca_m.stca009, 
       g_stca_m.stca009_desc,g_stca_m.stca010,g_stca_m.stca010_desc,g_stca_m.stca011,g_stca_m.stca011_desc,
       g_stca_m.stca012,g_stca_m.stca012_desc,g_stca_m.stca021,g_stca_m.stca021_desc,g_stca_m.stca022,g_stca_m.stca022_desc, 
       g_stca_m.stca023,g_stca_m.stca006,g_stca_m.stca006_desc,g_stca_m.stca007,g_stca_m.stca007_desc, 
       g_stca_m.stca024,g_stca_m.stca024_desc,g_stca_m.stca028,g_stca_m.stca028_desc,g_stca_m.stca025,g_stca_m.stca025_desc,g_stca_m.stca026,g_stca_m.stca026_desc,g_stca_m.stca008, 
       g_stca_m.stcaacti,g_stca_m.stca013,g_stca_m.stca014,g_stca_m.stca014_desc,g_stca_m.stca015,g_stca_m.stca015_desc,g_stca_m.stca016,g_stca_m.stca016_desc, 
       g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca019,g_stca_m.stca020,g_stca_m.stcasite,g_stca_m.stcasite_desc, 
       g_stca_m.stcaunit,g_stca_m.stcastus,g_stca_m.stcaownid,g_stca_m.stcaownid_desc,g_stca_m.stcaowndp, 
       g_stca_m.stcaowndp_desc,g_stca_m.stcacrtid,g_stca_m.stcacrtid_desc,g_stca_m.stcacrtdp,g_stca_m.stcacrtdp_desc, 
       g_stca_m.stcacrtdt,g_stca_m.stcamodid,g_stca_m.stcamodid_desc,g_stca_m.stcamoddt,g_stca_m.stcacnfid, 
       g_stca_m.stcacnfid_desc,g_stca_m.stcacnfdt
   
   #顯示狀態(stus)圖片
         #此段落由子樣板a21產生
      CASE g_stca_m.stcastus
         WHEN "N"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/open.png")
         WHEN "X"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
 
         WHEN "Y"
            CALL gfrm_curr.setElementImage("statechange", "stus/32/confirmed.png")
         WHEN "A"
            CALL gfrm_curr.setElementImage("statechange","stus/32/approved.png")
         WHEN "D"
            CALL gfrm_curr.setElementImage("statechange","stus/32/withdraw.png")
         WHEN "R"
            CALL gfrm_curr.setElementImage("statechange","stus/32/rejection.png")
         WHEN "W"
            CALL gfrm_curr.setElementImage("statechange","stus/32/signing.png")
 
         
      END CASE
 
 
   
   #讀入ref值(單身)
   FOR l_ac = 1 TO g_stcb_d.getLength()
      #帶出公用欄位reference值
      
      #add-point:show段單身reference
                    INITIALIZE g_ref_fields TO NULL
        LET g_ref_fields[1] = g_stcb_d[l_ac].stcb002
        CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
        LET g_stcb_d[l_ac].stcb002_desc = '', g_rtn_fields[1] , ''
         DISPLAY BY NAME g_stcb_d[l_ac].stcb002_desc
         
         CALL astt601_stcb008_ref()
         CALL astt601_stcb009_ref()
      #end add-point
   END FOR
   
   FOR l_ac = 1 TO g_stcb2_d.getLength()
      #帶出公用欄位reference值
      
      #add-point:show段單身reference
                  CALL astt601_stcd002_ref()
      #end add-point
   END FOR
 
 
   
    
   
   #add-point:show段other
      
   #end add-point  
   
   LET l_ac = l_ac_t
   
   #移動上下筆可以連動切換資料
   CALL cl_show_fld_cont()     
 
   CALL astt601_detail_show()
   
   #add-point:show段之後
      
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt601.detail_show" >}
#+ 單身reference detail_show
PRIVATE FUNCTION astt601_detail_show()
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
 
{<section id="astt601.reproduce" >}
#+ 資料複製
PRIVATE FUNCTION astt601_reproduce()
   {<Local define>}
   DEFINE l_newno     LIKE stca_t.stcadocno 
   DEFINE l_oldno     LIKE stca_t.stcadocno 
 
   DEFINE l_master    RECORD LIKE stca_t.*
   DEFINE l_detail    RECORD LIKE stcb_t.*
   DEFINE l_detail2    RECORD LIKE stcd_t.*
 
 
 
   DEFINE l_cnt       LIKE type_t.num5
   {</Local define>}
   #add-point:reproduce段define
   #ken---add---str 需求單號：141208-00001 項次：20
   DEFINE r_success     LIKE type_t.num5
   DEFINE r_doctype     LIKE rtai_t.rtai004 
   DEFINE l_insert      LIKE type_t.num5 
   #ken---add---end      
   #end add-point   
 
   #切換畫面
   IF g_main_hidden THEN
      CALL gfrm_curr.setElementHidden("mainlayout",0)
      CALL gfrm_curr.setElementHidden("worksheet",1)
      LET g_main_hidden = 0
   END IF
   
   IF g_stca_m.stcadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "std-00003"
      LET g_errparam.extend = ""
      LET g_errparam.popup = FALSE
      CALL cl_err()
 
      RETURN
   END IF
    
   LET g_stcadocno_t = g_stca_m.stcadocno
 
    
   LET g_stca_m.stcadocno = ""
 
    
   CALL astt601_set_entry('a')
   CALL astt601_set_no_entry('a')
 
   CALL cl_set_head_visible("","YES")
 
   #公用欄位給予預設值
   #此段落由子樣板a14產生    
      LET g_stca_m.stcaownid = g_user
      LET g_stca_m.stcaowndp = g_dept
      LET g_stca_m.stcacrtid = g_user
      LET g_stca_m.stcacrtdp = g_dept 
      LET g_stca_m.stcacrtdt = cl_get_current()
      LET g_stca_m.stcamodid = ""
      LET g_stca_m.stcamoddt = ""
      #LET g_stca_m.stcastus = ""
 
 
   
   #add-point:複製輸入前
   CALL s_aooi500_default(g_prog,'stcasite',g_stca_m.stcasite)
      RETURNING l_insert,g_stca_m.stcasite
   IF l_insert = FALSE THEN
      RETURN
   END IF 
   #預設單據的單別
   LET r_success = ''
   LET r_doctype = ''
   CALL s_arti200_get_def_doc_type(g_stca_m.stcasite,g_prog,'1')
       RETURNING r_success,r_doctype
   LET g_stca_m.stcadocno = r_doctype   
   #ken---add---end   
   #end add-point
   
   CALL astt601_input("r")
   
   
   
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      RETURN
   END IF
 
   LET g_state = "Y"
   
   LET g_wc = g_wc,  
              " OR (",
              " stcadocno = '", g_stca_m.stcadocno CLIPPED, "' "
 
              , ") "
   
   #add-point:完成複製段落後
      
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astt601.detail_reproduce" >}
#+ 單身自動複製
PRIVATE FUNCTION astt601_detail_reproduce()
   {<Local define>}
   DEFINE ls_sql      STRING
   DEFINE ld_date     DATETIME YEAR TO SECOND
   DEFINE l_detail    RECORD LIKE stcb_t.*
   DEFINE l_detail2    RECORD LIKE stcd_t.*
 
 
 
   {</Local define>}
   #add-point:delete段define
      
   #end add-point    
   
   CALL s_transaction_begin()
   
   LET ld_date = cl_get_current()
   
   DROP TABLE astt601_detail
   
   #add-point:單身複製前1
      
   #end add-point
   
   #CREATE TEMP TABLE
   LET ls_sql = "CREATE GLOBAL TEMPORARY TABLE astt601_detail AS ",
                "SELECT * FROM stcb_t "
   PREPARE repro_tbl FROM ls_sql
   EXECUTE repro_tbl
   FREE repro_tbl
                
   #將符合條件的資料丟入TEMP TABLE
   INSERT INTO astt601_detail SELECT * FROM stcb_t 
                                         WHERE stcbent = g_enterprise AND stcbdocno = g_stcadocno_t
 
   
   #將key修正為調整後   
   UPDATE astt601_detail 
      #更新key欄位
      SET stcbdocno = g_stca_m.stcadocno
 
      #更新共用欄位
      
                                       
  
   #將資料塞回原table   
   INSERT INTO stcb_t SELECT * FROM astt601_detail
   
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
   DROP TABLE astt601_detail
   
   #add-point:單身複製後1
      
   #end add-point
 
   #add-point:單身複製前
      
   #end add-point
   
   #CREATE TEMP TABLE
   LET ls_sql = 
      "CREATE GLOBAL TEMPORARY TABLE astt601_detail AS ",
      "SELECT * FROM stcd_t "
   PREPARE repro_tbl2 FROM ls_sql
   EXECUTE repro_tbl2
   FREE repro_tbl2
      
   #將符合條件的資料丟入TEMP TABLE
   INSERT INTO astt601_detail SELECT * FROM stcd_t
                                         WHERE stcdent = g_enterprise AND stcddocno = g_stcadocno_t
 
 
   #將key修正為調整後   
   UPDATE astt601_detail SET stcddocno = g_stca_m.stcadocno
 
  
   #將資料塞回原table   
   INSERT INTO stcd_t SELECT * FROM astt601_detail
   
   #add-point:單身複製中
      
   #end add-point
   
   #刪除TEMP TABLE
   DROP TABLE astt601_detail
   
   #add-point:單身複製後
      
   #end add-point
 
 
   
 
   
   #多語言複製段落
   
   
   CALL s_transaction_end('Y','0')
   
   #已新增完, 調整資料內容(修改時使用)
   LET g_stcadocno_t = g_stca_m.stcadocno
 
   
   DROP TABLE astt601_detail
   
END FUNCTION
 
{</section>}
 
{<section id="astt601.delete" >}
#+ 資料刪除
PRIVATE FUNCTION astt601_delete()
   {<Local define>}
   DEFINE  l_var_keys      DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys    DYNAMIC ARRAY OF STRING
   DEFINE  l_vars          DYNAMIC ARRAY OF STRING
   DEFINE  l_fields        DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak  DYNAMIC ARRAY OF STRING
   {</Local define>}
   #add-point:delete段define
      
   #end add-point     
   
   IF g_stca_m.stcadocno IS NULL
 
   THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = "std-00003"
      LET g_errparam.extend = ""
      LET g_errparam.popup = FALSE
      CALL cl_err()
 
      RETURN
   END IF
 
    SELECT UNIQUE stca000,stcadocno,stcadocdt,stca005,stca001,stca002,stca003,stca004,stca009,stca010,stca011,stca012,stca027,stca021, 
        stca022,stca023,stca006,stca007,stca024,stca028,stca025,stca026,stca008,stcaacti,stca013,stca014,stca015,stca016,stca017, 
        stca018,stca019,stca020,stcasite,stcaunit,stcastus,stcaownid,stcaowndp,stcacrtid,stcacrtdp,stcacrtdt, 
        stcamodid,stcamoddt,stcacnfid,stcacnfdt
 INTO g_stca_m.stca000,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_stca_m.stca005,g_stca_m.stca001,g_stca_m.stca002, 
     g_stca_m.stca003,g_stca_m.stca004,g_stca_m.stca009,g_stca_m.stca010,g_stca_m.stca011,g_stca_m.stca012,g_stca_m.stca027,g_stca_m.stca021,g_stca_m.stca022,g_stca_m.stca023, 
     g_stca_m.stca006,g_stca_m.stca007,g_stca_m.stca024,g_stca_m.stca028,g_stca_m.stca025,g_stca_m.stca026,g_stca_m.stca008,g_stca_m.stcaacti, 
     g_stca_m.stca013,g_stca_m.stca014,g_stca_m.stca015,g_stca_m.stca016,g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca019, 
     g_stca_m.stca020,g_stca_m.stcasite,g_stca_m.stcaunit,g_stca_m.stcastus,g_stca_m.stcaownid,g_stca_m.stcaowndp, 
     g_stca_m.stcacrtid,g_stca_m.stcacrtdp,g_stca_m.stcacrtdt,g_stca_m.stcamodid,g_stca_m.stcamoddt, 
     g_stca_m.stcacnfid,g_stca_m.stcacnfdt
 FROM stca_t
 WHERE stcaent = g_enterprise AND stcadocno = g_stca_m.stcadocno
   
   
 
   CALL astt601_show()
   
   CALL s_transaction_begin()
 
   OPEN astt601_cl USING g_enterprise,g_stca_m.stcadocno
 
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code =  STATUS
      LET g_errparam.extend = "OPEN astt601_cl:"
      LET g_errparam.popup = TRUE
      CALL cl_err()
 
      CLOSE astt601_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   FETCH astt601_cl INTO g_stca_m.stca000,g_stca_m.stcadocno,g_stca_m.stcadocdt,g_stca_m.stca005,g_stca_m.stca001, 
       g_stca_m.stca002,g_stca_m.stca003,g_stca_m.stca004,g_stca_m.stca004_desc,g_stca_m.stca009, 
       g_stca_m.stca009_desc,g_stca_m.stca021,g_stca_m.stca021_desc,g_stca_m.stca022,g_stca_m.stca022_desc, 
       g_stca_m.stca023,g_stca_m.stca023_desc,g_stca_m.stca006,g_stca_m.stca006_desc,g_stca_m.stca007,g_stca_m.stca007_desc, 
       g_stca_m.stca024,g_stca_m.stca024_desc,g_stca_m.stca025,g_stca_m.stca025_desc,g_stca_m.stca008, 
       g_stca_m.stcaacti,g_stca_m.stca013,g_stca_m.stca014,g_stca_m.stca014_desc,g_stca_m.stca015,g_stca_m.stca015_desc, 
       g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca019,g_stca_m.stca020,g_stca_m.stcasite,g_stca_m.stcasite_desc, 
       g_stca_m.stcaunit,g_stca_m.stcastus,g_stca_m.stcaownid,g_stca_m.stcaownid_desc,g_stca_m.stcaowndp, 
       g_stca_m.stcaowndp_desc,g_stca_m.stcacrtid,g_stca_m.stcacrtid_desc,g_stca_m.stcacrtdp,g_stca_m.stcacrtdp_desc, 
       g_stca_m.stcacrtdt,g_stca_m.stcamodid,g_stca_m.stcamodid_desc,g_stca_m.stcamoddt,g_stca_m.stcacnfid, 
       g_stca_m.stcacnfid_desc,g_stca_m.stcacnfdt              #鎖住將被更改或取消的資料 
 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = g_stca_m.stcadocno
      LET g_errparam.popup = FALSE
      CALL cl_err()
          #資料被他人LOCK
      CALL s_transaction_end('N','0')
      RETURN
   END IF
 
   #IF NOT cl_ask_delete() THEN             #確認一下
   IF cl_ask_del_master() THEN              #確認一下
   
      #add-point:單頭刪除前
      #檢查是否允許此動作
   IF NOT astt601_action_chk() THEN
      CLOSE astt601_cl
      CALL s_transaction_end('N','0')
      RETURN
   END IF      
      #end add-point   
      
      INITIALIZE g_doc.* TO NULL         
      LET g_doc.column1 = "stcadocno"       
      LET g_doc.value1 = g_stca_m.stcadocno     
      CALL cl_doc_remove()  
  
      #資料備份
      LET g_stcadocno_t = g_stca_m.stcadocno
 
 
      DELETE FROM stca_t
       WHERE stcaent = g_enterprise AND stcadocno = g_stca_m.stcadocno
 
       
      #add-point:單頭刪除中
            
      #end add-point
       
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = g_stca_m.stcadocno
      LET g_errparam.popup = FALSE
      CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
      END IF
      
      #add-point:單頭刪除後
      #ken---add---str
      IF NOT s_aooi200_del_docno(g_stca_m.stcadocno,g_stca_m.stcadocdt) THEN 
         CALL s_transaction_end('N','0') RETURN END IF      
      #ken---add---end
      #end add-point
  
      #add-point:單身刪除前
                   DELETE FROM stcc_t
       WHERE stccent = g_enterprise AND stccdocno = g_stca_m.stcadocno
       IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stcc_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
       END IF   
      CALL g_stcc_d.clear()
      #end add-point
      
      DELETE FROM stcb_t
       WHERE stcbent = g_enterprise AND stcbdocno = g_stca_m.stcadocno
 
 
      #add-point:單身刪除中
            
      #end add-point
         
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stcb_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
      END IF    
 
      #add-point:單身刪除後
            
      #end add-point
      
            
                                                               
      #add-point:單身刪除前
            
      #end add-point
      DELETE FROM stcd_t
       WHERE stcdent = g_enterprise AND
             stcddocno = g_stca_m.stcadocno
      #add-point:單身刪除中
            
      #end add-point
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stcd_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
      END IF      
 
      #add-point:單身刪除後
      DELETE FROM stcv_t WHERE stcvent = g_enterprise AND stcvdocno = g_stca_m.stcadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stcv_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
         CALL s_transaction_end('N','0')
         RETURN
      END IF  
            #160513-00033#7
      DELETE FROM stck_t WHERE stckent = g_enterprise AND stckdocno = g_stca_m.stcadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del stck'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
      DELETE FROM stct_t WHERE stctent = g_enterprise AND stctdocno = g_stca_m.stcadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del stck'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
      CALL g_stck_d.clear()
      CALL g_stct_d.clear()
      #160513-00033#7     
      #end add-point
 
 
 
 
                                                               
      CLEAR FORM
      CALL g_stcb_d.clear() 
      CALL g_stcb2_d.clear()       
      CALL g_stcv_d.clear()
 
     
      CALL astt601_ui_browser_refresh()  
      CALL astt601_ui_headershow()  
      CALL astt601_ui_detailshow()
       
      IF g_browser_cnt > 0 THEN 
         CALL astt601_fetch('P')
         DISPLAY g_browser_cnt TO FORMONLY.h_count   #總筆數的顯示
      ELSE
         LET g_wc = " 1=1"
         CALL astt601_browser_fill("F")
      END IF
      
      #單頭多語言刪除
      
      
      #單身多語言刪除
      
      
 
 
 
   
   END IF
 
   CALL s_transaction_end('Y','0')
   
   CLOSE astt601_cl
 
   #流程通知預埋點-D
   CALL cl_flow_notify(g_stca_m.stcadocno,'D')
    
END FUNCTION
 
{</section>}
 
{<section id="astt601.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION astt601_b_fill()
   {<Local define>}
   DEFINE p_wc2      STRING
   {</Local define>}
   #add-point:b_fill段define
      
   #end add-point     
 
   CALL g_stcb_d.clear()    #g_stcb_d 單頭及單身 
   CALL g_stcb2_d.clear()
 
 
 
   #add-point:b_fill段sql_before
   CALL g_stcv_d.clear()   
   CALL g_stck_d.clear()     #160513-00033#7    
   CALL g_stct_d.clear()     #160513-00033#7    
   #end add-point
   
   #判斷是否填充
   IF astt601_fill_chk(1) THEN
   
      LET g_sql = "SELECT  UNIQUE stcbseq,stcb002,'',stcb003,stcb004,stcb005,stcb006,stcb007,stcb008, 
          '',stcb009,'',stcb010,stcb011,stcb012,stcb013,stcb014,stcb015,stcb016,stcb017,stcb018,stcbunit, 
          stcbsite FROM stcb_t",   
                  " INNER JOIN stca_t ON stcadocno = stcbdocno ",
 
                  #"",
                  
                  "",
                  " WHERE stcbent=? AND stcbdocno=?"
      #add-point:b_fill段sql_before
            
      #end add-point
      IF NOT cl_null(g_wc2_table1) THEN
         LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
      END IF
      
      #子單身的WC
      
      
      LET g_sql = g_sql, " ORDER BY stcb_t.stcbseq"
      
      #add-point:單身填充控制
                  LET g_sql = "SELECT  UNIQUE stcbseq,stcb002,'',stcb021,stcb003,stcb004,stcb005,stcb006,stcb007,stcb008,     
          '',stcb009,'',stcb010,stcb011,stcb012,stcb013,stcb014,stcb015,stcb016,stcb017,stcb018,stcb019,stcb020 FROM stcb_t", 
                   " LEFT JOIN stcc_t ON stccent = stcbent AND stcbdocno = stccdocno AND stcbseq = stccseq1 ",      
             
                  "",
                  " WHERE stcbent=? AND stcbdocno=?"     #160513-00033#7 add stcb021
      
      IF NOT cl_null(g_wc2_table1) THEN
         LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table1 CLIPPED
      END IF
      IF NOT cl_null(g_wc2_table3) THEN
         LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table3 CLIPPED
      END IF
      #子單身的WC
      
      
      LET g_sql = g_sql, " ORDER BY stcb_t.stcbseq"  
      #end add-point
      
      PREPARE astt601_pb FROM g_sql
      DECLARE b_fill_cs CURSOR FOR astt601_pb
      
      LET g_cnt = l_ac
      LET l_ac = 1
      
      OPEN b_fill_cs USING g_enterprise,g_stca_m.stcadocno
 
                                               
      FOREACH b_fill_cs INTO g_stcb_d[l_ac].stcbseq,g_stcb_d[l_ac].stcb002,g_stcb_d[l_ac].stcb002_desc,g_stcb_d[l_ac].stcb021, #160513-00033#7 add stcb021
          g_stcb_d[l_ac].stcb003,g_stcb_d[l_ac].stcb004,g_stcb_d[l_ac].stcb005,g_stcb_d[l_ac].stcb006, 
          g_stcb_d[l_ac].stcb007,g_stcb_d[l_ac].stcb008,g_stcb_d[l_ac].stcb008_desc,g_stcb_d[l_ac].stcb009, 
          g_stcb_d[l_ac].stcb009_desc,g_stcb_d[l_ac].stcb010,g_stcb_d[l_ac].stcb011,g_stcb_d[l_ac].stcb012, 
          g_stcb_d[l_ac].stcb013,g_stcb_d[l_ac].stcb014,g_stcb_d[l_ac].stcb015,g_stcb_d[l_ac].stcb016, 
          g_stcb_d[l_ac].stcb017,g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020,g_stcb_d[l_ac].stcbunit,g_stcb_d[l_ac].stcbsite 
 
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "FOREACH:"
            LET g_errparam.popup = TRUE
            CALL cl_err()
 
            EXIT FOREACH
         END IF
        
         #add-point:b_fill段資料填充
                          CALL astt601_stcb002_ref()
         CALL astt601_stcb008_ref()
         CALL astt601_stcb009_ref()
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
   IF astt601_fill_chk(2) THEN
      LET g_sql = "SELECT  UNIQUE stcdseq,stcd002,'',stcd003,stcdunit,stcdsite FROM stcd_t",   
                  " INNER JOIN stca_t ON stcadocno = stcddocno ",
 
                  "",
                  
                  " WHERE stcdent=? AND stcddocno=?"   
      #add-point:b_fill段sql_before
      LET g_sql = "SELECT  UNIQUE stcdseq,stcd002,'',stcd003,stcdunit,stcdsite FROM stcd_t",
                  " WHERE stcdent=? AND stcddocno=?" 
      #end add-point
      IF NOT cl_null(g_wc2_table2) THEN
         LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
      END IF
      
      #子單身的WC
      
      
      LET g_sql = g_sql, " ORDER BY stcd_t.stcdseq"
      
      #add-point:單身填充控制
            
      #end add-point
      
      PREPARE astt601_pb2 FROM g_sql
      DECLARE b_fill_cs2 CURSOR FOR astt601_pb2
      
      LET l_ac = 1
      
      OPEN b_fill_cs2 USING g_enterprise,g_stca_m.stcadocno
 
                                               
      FOREACH b_fill_cs2 INTO g_stcb2_d[l_ac].stcdseq,g_stcb2_d[l_ac].stcd002,g_stcb2_d[l_ac].stcd002_desc, 
          g_stcb2_d[l_ac].stcd003,g_stcb2_d[l_ac].stcdunit,g_stcb2_d[l_ac].stcdsite
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
   IF astt601_fill_chk(4) THEN
      LET g_sql = "SELECT  UNIQUE stcvsite,stcvunit,stcvseq,stcv002,stcv003,stcv004,stcv005,stcv006 FROM stcv_t",   
                  "",
                  
                  " WHERE stcvent=? AND stcvdocno=?"   
      #add-point:b_fill段sql_before
      
      #end add-point
      IF NOT cl_null(g_wc2_table4) THEN
         LET g_sql = g_sql CLIPPED," AND ",g_wc2_table4 CLIPPED
      END IF
      
      #子單身的WC
      
      
      LET g_sql = g_sql, " ORDER BY stcv_t.stcvseq"
      
      #add-point:單身填充控制
      
      #end add-point
      
      PREPARE astt601_pb4 FROM g_sql
      DECLARE b_fill_cs4 CURSOR FOR astt601_pb4
      
      LET l_ac = 1
      
      OPEN b_fill_cs4 USING g_enterprise,g_stca_m.stcadocno
 
                                               
      FOREACH b_fill_cs4 INTO g_stcv_d[l_ac].stcvsite,g_stcv_d[l_ac].stcvunit,g_stcv_d[l_ac].stcvseq, g_stcv_d[l_ac].stcv002, 
          g_stcv_d[l_ac].stcv003,g_stcv_d[l_ac].stcv004,g_stcv_d[l_ac].stcv005,g_stcv_d[l_ac].stcv006
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
            LET g_errparam.popup = TRUE
            CALL cl_err()

            EXIT FOREACH
         END IF
         
      END FOREACH
   END IF
 
   CALL g_stcv_d.deleteElement(g_stcv_d.getLength())    
   #160513-00033#7--(S)
   LET g_sql = "SELECT UNIQUE stckseq,stck002,stck003,stck004,stck005 ",
               "             ,stck006,stck007,stck008,stck009,stck010 ",
               "             ,stck011,stck012,stck013,stck014 ",
               "  FROM stck_t",
               " WHERE stckent = ? AND stckdocno = ?",
               " ORDER BY stckseq"
   PREPARE astt601_pb5 FROM g_sql
   DECLARE b_fill_cs5 CURSOR FOR astt601_pb5      
   LET l_ac = 1   
   OPEN b_fill_cs5 USING g_enterprise,g_stca_m.stcadocno
   FOREACH b_fill_cs5 INTO g_stck_d[l_ac].stckseq,g_stck_d[l_ac].stck002,g_stck_d[l_ac].stck003,g_stck_d[l_ac].stck004,g_stck_d[l_ac].stck005 
                          ,g_stck_d[l_ac].stck006,g_stck_d[l_ac].stck007,g_stck_d[l_ac].stck008,g_stck_d[l_ac].stck009,g_stck_d[l_ac].stck010 
                          ,g_stck_d[l_ac].stck011,g_stck_d[l_ac].stck012,g_stck_d[l_ac].stck013,g_stck_d[l_ac].stck014 
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      CALL s_desc_get_acc_desc('2147',g_stck_d[l_ac].stck002) RETURNING g_stck_d[l_ac].stck002_desc
      CALL s_desc_get_item_desc(g_stck_d[l_ac].stck003) RETURNING g_stck_d[l_ac].imaal003,g_stck_d[l_ac].imaal004
      SELECT stabl003 INTO g_stck_d[l_ac].stck010_desc
        FROM stabl_t 
       WHERE stablent = g_enterprise AND stabl001 = g_stck_d[l_ac].stck010 AND stabl002 = g_lang
      CALL s_desc_get_acc_desc('2146',g_stck_d[l_ac].stck014) RETURNING g_stck_d[l_ac].stck014_desc
      
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
   CALL g_stck_d.deleteElement(g_stck_d.getLength())
   LET g_sql = "SELECT UNIQUE stctseq,stct001",
               "  FROM stct_t",
               " WHERE stctent = ? AND stctdocno = ?",
               " ORDER BY stctseq"
   PREPARE astt601_pb6 FROM g_sql
   DECLARE b_fill_cs6 CURSOR FOR astt601_pb6
   LET l_ac = 1   
   OPEN b_fill_cs6 USING g_enterprise,g_stca_m.stcadocno
   FOREACH b_fill_cs6 INTO g_stct_d[l_ac].stctseq,g_stct_d[l_ac].stct001
   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         EXIT FOREACH
      END IF
      LET g_stct_d[l_ac].stct001_desc  = s_desc_get_trading_partner_abbr_desc(g_stct_d[l_ac].stct001)
            
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
   CALL g_stct_d.deleteElement(g_stct_d.getLength())
   #160513-00033#7--(E)
   #end add-point
   
   CALL g_stcb_d.deleteElement(g_stcb_d.getLength())
   CALL g_stcb2_d.deleteElement(g_stcb2_d.getLength())
 
 
   
 
   LET l_ac = g_cnt
   LET g_cnt = 0  
   
   FREE astt601_pb
   FREE astt601_pb2
 
 
   
END FUNCTION
 
{</section>}
 
{<section id="astt601.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION astt601_delete_b(ps_table,ps_keys_bak,ps_page)
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
      DELETE FROM stcb_t
       WHERE stcbent = g_enterprise AND
         stcbdocno = ps_keys_bak[1] AND stcbseq = ps_keys_bak[2]
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
      DELETE FROM stcd_t
       WHERE stcdent = g_enterprise AND
         stcddocno = ps_keys_bak[1] AND stcdseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中
            
      #end add-point    
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stcd_t"
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
 
{<section id="astt601.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION astt601_insert_b(ps_table,ps_keys,ps_page)
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
      INSERT INTO stcc_t
                  (stccent,stccdocno,stccseq1,stccseq2,stcc002,stcc003,stcc004)
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],
                   g_stcc_d[l_ac3].stccseq2,g_stcc_d[l_ac3].stcc002,g_stcc_d[l_ac3].stcc003,g_stcc_d[l_ac3].stcc004)

      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stcc_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()

      END IF
  
   END IF
   
   
          LET ls_group = "'4',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前

      #end add-point 
     INSERT INTO stcv_t
                  (stcvent,stcvsite,stcvunit,stcvseq,stcv001,stcv002,stcv003,stcv004,stcv005,stcv006)
            VALUES(g_enterprise,g_stcv_d[l_ac].stcvsite,g_stcv_d[l_ac].stcvunit,
                   ps_keys[2],ps_keys[1],
                   g_stcv_d[l_ac].stcv002,g_stcv_d[l_ac].stcv003,g_stcv_d[l_ac].stcv004,g_stcv_d[l_ac].stcv005,
                   g_stcv_d[l_ac].stcv006)
                   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stcc_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()

      END IF
  
   END IF
   #160513-00033#7--(S)
   LET ls_group = "'5',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
     INSERT INTO stck_t
                  (stckent,stcksite,stckunit,stckdocno,stckseq,
                   stck001,stck002,stck003,stck004,stck005,
                   stck006,stck007,stck008,stck009,stck010, 
                   stck011,stck012,stck013,stck014)
            VALUES(g_enterprise,g_stck_d[l_ac].stcksite,g_stck_d[l_ac].stckunit,ps_keys[1],ps_keys[2],
                   g_stck_d[l_ac].stck001,g_stck_d[l_ac].stck002,g_stck_d[l_ac].stck003,g_stck_d[l_ac].stck004,g_stck_d[l_ac].stck005,
                   g_stck_d[l_ac].stck006,g_stck_d[l_ac].stck007,g_stck_d[l_ac].stck008,g_stck_d[l_ac].stck009,g_stck_d[l_ac].stck010, 
                   g_stck_d[l_ac].stck011,g_stck_d[l_ac].stck012,g_stck_d[l_ac].stck013,g_stck_d[l_ac].stck014)                   
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stck_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
      END IF  
   END IF
   LET ls_group = "'6',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
     INSERT INTO stct_t
                  (stctent,stctsite,stctunit,stctdocno,stctseq,
                   stct001)
            VALUES(g_enterprise,g_stct_d[l_ac].stctsite,g_stct_d[l_ac].stctunit,ps_keys[1],ps_keys[2],
                   g_stct_d[l_ac].stct001)
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stct_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
      END IF  
   END IF
   #160513-00033#7--(E)
   #end add-point     
   
   #判斷是否是同一群組的table
   LET ls_group = "'1',"
   IF ls_group.getIndexOf(ps_page,1) > 0 THEN
      #add-point:insert_b段資料新增前
      IF cl_null(g_stcb_d[l_ac].stcb021) THEN LET g_stcb_d[l_ac].stcb021 = 'N' END IF
      #end add-point 
      INSERT INTO stcb_t
                  (stcbent,
                   stcbdocno,
                   stcbseq
                   ,stcb002,stcb003,stcb004,stcb005,stcb006,stcb007,stcb008,stcb009,stcb010,stcb011,stcb012,stcb013,stcb014,stcb015,stcb016,stcb017,stcb018,stcb019,stcb020,stcbunit,stcbsite,stcb021)   #160513-00033#7 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stcb_d[g_detail_idx].stcb002,g_stcb_d[g_detail_idx].stcb003,g_stcb_d[g_detail_idx].stcb004, 
                       g_stcb_d[g_detail_idx].stcb005,g_stcb_d[g_detail_idx].stcb006,g_stcb_d[g_detail_idx].stcb007, 
                       g_stcb_d[g_detail_idx].stcb008,g_stcb_d[g_detail_idx].stcb009,g_stcb_d[g_detail_idx].stcb010, 
                       g_stcb_d[g_detail_idx].stcb011,g_stcb_d[g_detail_idx].stcb012,g_stcb_d[g_detail_idx].stcb013, 
                       g_stcb_d[g_detail_idx].stcb014,g_stcb_d[g_detail_idx].stcb015,g_stcb_d[g_detail_idx].stcb016, 
                       g_stcb_d[g_detail_idx].stcb017,g_stcb_d[g_detail_idx].stcb018,
                       g_stcb_d[g_detail_idx].stcb019,g_stcb_d[g_detail_idx].stcb020,g_stcb_d[g_detail_idx].stcbunit, 
                       g_stcb_d[g_detail_idx].stcbsite,g_stcb_d[g_detail_idx].stcb021)     #160513-00033#7 add atcb021
      #add-point:insert_b段資料新增中
            
      #end add-point 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stcb_t"
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
      INSERT INTO stcd_t
                  (stcdent,
                   stcddocno,
                   stcdseq
                   ,stcd002,stcd003,stcdunit,stcdsite) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_stcb2_d[g_detail_idx].stcd002,g_stcb2_d[g_detail_idx].stcd003,g_stcb2_d[g_detail_idx].stcdunit, 
                       g_stcb2_d[g_detail_idx].stcdsite)
      #add-point:insert_b段資料新增中
            
      #end add-point
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "stcd_t"
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
 
{<section id="astt601.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION astt601_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stcb_t" THEN
      #add-point:update_b段修改前
      IF cl_null(g_stcb_d[l_ac].stcb021) THEN LET g_stcb_d[l_ac].stcb021 = 'N' END IF
      #end add-point     
      UPDATE stcb_t 
         SET (stcbdocno,
              stcbseq
              ,stcb002,stcb003,stcb004,stcb005,stcb006,stcb007,stcb008,stcb009,stcb010,stcb011,stcb012,stcb013,stcb014,stcb015,stcb016,stcb017,stcb018,stcbunit,stcbsite,stcb021) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stcb_d[g_detail_idx].stcb002,g_stcb_d[g_detail_idx].stcb003,g_stcb_d[g_detail_idx].stcb004, 
                  g_stcb_d[g_detail_idx].stcb005,g_stcb_d[g_detail_idx].stcb006,g_stcb_d[g_detail_idx].stcb007, 
                  g_stcb_d[g_detail_idx].stcb008,g_stcb_d[g_detail_idx].stcb009,g_stcb_d[g_detail_idx].stcb010, 
                  g_stcb_d[g_detail_idx].stcb011,g_stcb_d[g_detail_idx].stcb012,g_stcb_d[g_detail_idx].stcb013, 
                  g_stcb_d[g_detail_idx].stcb014,g_stcb_d[g_detail_idx].stcb015,g_stcb_d[g_detail_idx].stcb016, 
                  g_stcb_d[g_detail_idx].stcb017,g_stcb_d[g_detail_idx].stcb018,g_stcb_d[g_detail_idx].stcbunit, 
                  g_stcb_d[g_detail_idx].stcbsite,g_stcb_d[g_detail_idx].stcb021) 
         WHERE stcbent = g_enterprise AND stcbdocno = ps_keys_bak[1] AND stcbseq = ps_keys_bak[2]
      #add-point:update_b段修改中
            
      #end add-point   
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = "std-00009"
            LET g_errparam.extend = "stcb_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
 
            CALL s_transaction_end('N','0')
         WHEN SQLCA.sqlcode #其他錯誤
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "stcb_t"
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
   IF ls_group.getIndexOf(ps_page,1) > 0 AND ps_table <> "stcd_t" THEN
      #add-point:update_b段修改前
            
      #end add-point     
      UPDATE stcd_t 
         SET (stcddocno,
              stcdseq
              ,stcd002,stcd003,stcdunit,stcdsite) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_stcb2_d[g_detail_idx].stcd002,g_stcb2_d[g_detail_idx].stcd003,g_stcb2_d[g_detail_idx].stcdunit, 
                  g_stcb2_d[g_detail_idx].stcdsite) 
         WHERE stcdent = g_enterprise AND stcddocno = ps_keys_bak[1] AND stcdseq = ps_keys_bak[2]
      #add-point:update_b段修改中
            
      #end add-point  
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = "std-00009"
            LET g_errparam.extend = "stcd_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
 
            CALL s_transaction_end('N','0')
         WHEN SQLCA.sqlcode #其他錯誤
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "stcd_t"
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
 
{<section id="astt601.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION astt601_lock_b(ps_table,ps_page)
   {<Local define>}
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   {</Local define>}
   #add-point:lock_b段define
   IF ps_table = "stcc_t" THEN
      OPEN astt601_bcl3 USING g_enterprise,g_stca_m.stcadocno,g_stcb_d[l_ac].stcbseq,g_stcc_d[l_ac3].stccseq2
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "astt601_bcl3"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF 
   
   IF ps_table = "stcv_t" THEN
      OPEN astt601_bcl4 USING g_enterprise,g_stca_m.stcadocno,g_stcv_d[l_ac].stcvseq
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "astt601_bcl4"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
   
   #160513-00033#7--(S)
   IF ps_table = "stck_t" THEN
      OPEN astt601_bcl5 USING g_enterprise,g_stca_m.stcadocno,g_stck_d[l_ac].stckseq
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "astt601_bcl5"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   IF ps_table = "stct_t" THEN
      OPEN astt601_bcl6 USING g_enterprise,g_stca_m.stcadocno,g_stct_d[l_ac].stctseq
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "astt601_bcl6"
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF 
   #160513-00033#7--(E)
   #end add-point   
   
   #先刷新資料
   #CALL astt601_b_fill()
   
   #鎖定整組table
   #LET ls_group = "'1',"
   #僅鎖定自身table
   LET ls_group = "stcb_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astt601_bcl USING g_enterprise,
                                       g_stca_m.stcadocno,g_stcb_d[g_detail_idx].stcbseq
                                       
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "astt601_bcl"
         LET g_errparam.popup = TRUE
         CALL cl_err()
 
         RETURN FALSE
      END IF
   
   END IF
                                    
   #鎖定整組table
   #LET ls_group = "'2',"
   #僅鎖定自身table
   LET ls_group = "stcd_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN astt601_bcl2 USING g_enterprise,
                                             g_stca_m.stcadocno,g_stcb2_d[g_detail_idx].stcdseq
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "astt601_bcl2"
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
 
{<section id="astt601.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION astt601_unlock_b(ps_table,ps_page)
   {<Local define>}
   DEFINE ps_page     STRING
   DEFINE ps_table    STRING
   DEFINE ls_group    STRING
   {</Local define>}
   #add-point:unlock_b段define
          LET ls_group = "'3',"
   
   IF ls_group.getIndexOf(ps_page,3) THEN
      CLOSE astt601_bcl3
   END IF
   
           LET ls_group = "'4',"
   
   IF ls_group.getIndexOf(ps_page,4) THEN
      CLOSE astt601_bcl3
   END IF
   #end add-point  
   
   LET ls_group = "'1',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astt601_bcl
   END IF
   
   LET ls_group = "'2',"
   
   IF ls_group.getIndexOf(ps_page,1) THEN
      CLOSE astt601_bcl2
   END IF
 
 
   
 
 
   #add-point:unlock_b段other
      
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt601.set_entry" >}
#+ 單頭欄位開啟設定
PRIVATE FUNCTION astt601_set_entry(p_cmd)
   {<Local define>}
   DEFINE p_cmd   LIKE type_t.chr1  
   {</Local define>}
   #add-point:set_entry段define
      
   #end add-point       
 
   IF p_cmd = 'a' THEN
      CALL cl_set_comp_entry("stcadocno",TRUE)
      #add-point:set_entry段欄位控制
      CALL cl_set_comp_entry("stcadocdt,stca000",TRUE)
      CALL cl_set_comp_entry("stca001",TRUE) 
      CALL cl_set_comp_entry("stca004,stca005",TRUE) 
      CALL cl_set_comp_entry("stcasite",TRUE) #ken---add
      #end add-point  
   END IF
   
   #add-point:set_entry段欄位控制後
   IF g_stca_m.stca000 = 'U' THEN
      CALL cl_set_comp_entry("stcaacti",TRUE) 
   ELSE
      CALL cl_set_comp_entry("stca009,stca010,stca017",TRUE) 
   END IF
   
   IF g_stca_m.stca000 = 'I' THEN
      IF cl_null(g_stca_m.stca010) THEN
         CALL cl_set_comp_entry("stca027",FALSE)
         CALL cl_set_comp_entry("stca021,stca022,stca023,stca024,stca026",TRUE) 
      ELSE
         CALL cl_set_comp_entry("stca027",TRUE)
         CALL cl_set_comp_entry("stca021,stca022,stca023,stca024,stca026",FALSE)
      END IF
   ELSE
      CALL cl_set_comp_entry("stca027,stca021,stca022,stca023,stca024,stca025,stca026",FALSE)
   END IF
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt601.set_no_entry" >}
#+ 單頭欄位關閉設定
PRIVATE FUNCTION astt601_set_no_entry(p_cmd)
   {<Local define>}
   DEFINE p_cmd   LIKE type_t.chr1   
   {</Local define>}
   #add-point:set_no_entry段define
   DEFINE l_n     LIKE type_t.num5  
   #end add-point     
 
   IF p_cmd = 'u' THEN
      CALL cl_set_comp_entry("stcadocno",FALSE)
      #add-point:set_no_entry段欄位控制
                  CALL cl_set_comp_entry("stcadocdt,stca000",FALSE)
                  CALL cl_set_comp_entry("stca001",FALSE)
                  CALL cl_set_comp_entry("stcasite",TRUE) #ken---add
      #end add-point 
   END IF
   
   #add-point:set_no_entry段欄位控制後
  
   IF g_stca_m.stca000 = 'I' THEN
      LET g_stca_m.stcaacti = 'Y'
      CALL cl_set_comp_entry("stcaacti",FALSE) 
   ELSE
      CALL cl_set_comp_entry("stca009,stca010",FALSE) 
   END IF
   IF g_stca_m.stca000 = 'U' OR p_cmd = 'u' THEN
      CALL cl_set_comp_entry("stca004,stca005",FALSE) 
   END IF
   
   IF g_stca_m.stca000 = 'U' AND NOT cl_null(g_stca_m.stca001) THEN
      SELECT COUNT(*) INTO l_n FROM stcw_t
      WHERE stcwent = g_enterprise AND stcw001 = g_stca_m.stca001 AND stcw005 = 'Y'
     IF l_n > 0 THEN
        CALL cl_set_comp_entry("stca017",FALSE)
     ELSE
        CALL cl_set_comp_entry("stca017",TRUE)
     END IF
   END IF
   IF g_flag THEN
      CALL cl_set_comp_entry("stcadocno,stcadocdt",FALSE)
   END IF
   
   #ken---add---str 需求單號：141208-00001 項次：20
   IF NOT s_aooi500_comp_entry(g_prog,'stcasite') OR g_site_flag THEN
      CALL cl_set_comp_entry("stcasite",FALSE)
   END IF 
   #ken---add---end   
   
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="astt601.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION astt601_set_entry_b(p_cmd)
   {<Local define>}
   DEFINE p_cmd   LIKE type_t.chr1   
   {</Local define>}
   #add-point:set_entry_b段define
         DEFINE l_n     LIKE type_t.num5
   DEFINE l_staf003 LIKE staf_t.staf003
   DEFINE l_staf004 LIKE staf_t.staf004
   DEFINE l_staf005 LIKE staf_t.staf005
   DEFINE l_stcb004 LIKE stcb_t.stcb004
   #end add-point     
   #add-point:set_entry_b段
   CALL cl_set_comp_entry('stcb002',TRUE)
   CALL cl_set_comp_entry('stcb004',TRUE)    #160513-00033#7
   #160513-00033#7--s
   IF g_stcb_d[l_ac].stcb021 = 'Y' THEN
      CALL cl_set_comp_entry('stcb006,stcb007,stcb008,stcb013,stcb014,stcb012,stcb015',TRUE)
      CALL cl_set_comp_entry('stcb010,stcb011',TRUE)
      CALL cl_set_comp_required('stcb010,stcb011',TRUE)
   END IF
   #可输入
   CALL cl_set_comp_entry('stck005,stck006,stck007,stck010,stck011,stck012,stck013',TRUE)
   #必填
   CALL cl_set_comp_required('stckseq,stck008,stck009',TRUE)
   CALL cl_set_comp_required('stck005,stck006,stck007,stck012,stck013',TRUE)
   #160513-00033#7--e
   CALL astt601_init_entry(p_cmd)
   IF NOT cl_null(g_stcb_d[l_ac].stcb002) THEN
      #檢查費用編號+經營方式是否存在asti204
      
      SELECT COUNT(*) INTO l_n FROM staf_t
       WHERE stafent = g_enterprise AND staf001= g_stcb_d[l_ac].stcb002 AND staf002 = g_stca_m.stca005
      IF l_n > 0 THEN
         DECLARE sel_staf CURSOR FOR 
          SELECT staf003,staf004,staf005 FROM staf_t
           WHERE  stafent = g_enterprise AND staf001= g_stcb_d[l_ac].stcb002 AND staf002 = g_stca_m.stca005
         FOREACH sel_staf INTO l_staf003,l_staf004,l_staf005
            LET l_staf003 = cl_str_replace(l_staf003,"stao","stcb")
            CALL astt601_convert(l_staf003)  RETURNING l_staf003
            IF l_staf004 = 'Y' THEN
               CALL cl_set_comp_entry(l_staf003,TRUE)
            END IF
         END FOREACH 
      ELSE
         IF g_stcb_d[l_ac].stcb005 = '1' THEN    #變動
            IF g_stcb_d[l_ac].stcb015 = '1' THEN      
               CALL cl_set_comp_entry('stcb011',TRUE)
            END IF
            CALL cl_set_comp_entry('stcb008,stcb009',TRUE)
            CALL cl_set_comp_entry('stcb012,stcb013,stcb014,stcb015',TRUE)
         ELSE                                    #固定
            CALL cl_set_comp_entry('stcb010',TRUE)
         END IF
         IF g_stcb_d[l_ac].stcb012 <> '1' THEN    #保底
            CALL cl_set_comp_entry('stcb013,stcb014',TRUE)
         END IF 
          #抓取价款类型
         #160606-00028#1--(S) 
         #SELECT stae006 INTO  l_stcb004 FROM stae_t WHERE staeent = g_enterprise AND stae001 = g_stcb_d[l_ac].stcb002
         #IF l_stcb004 = '3' THEN
         #   CALL cl_set_comp_entry('stcb004',TRUE)
         #ELSE
         #   CALL cl_set_comp_entry('stcb004',FALSE)
         #END IF  
         #160606-00028#1--(E) 
      END IF    
   ELSE
       IF g_stcb_d[l_ac].stcb005 = '1' THEN    #變動
          IF g_stcb_d[l_ac].stcb015 = '1' THEN      
             CALL cl_set_comp_entry('stcb011',TRUE)
          END IF
          CALL cl_set_comp_entry('stcb008,stcb009',TRUE)
          CALL cl_set_comp_entry('stcb012,stcb013,stcb014,stcb015',TRUE)
       ELSE                                    #固定
          CALL cl_set_comp_entry('stcb010',TRUE)
       END IF
       IF g_stcb_d[l_ac].stcb012 <> '1' THEN    #保底
          CALL cl_set_comp_entry('stcb013,stcb014',TRUE)
       END IF 
   END IF   
   #费用编号不为空
  #IF NOT cl_null(g_stcb_d[l_ac].stcb002) THEN
  #   #抓取价款类型
  #   SELECT stae006 INTO  l_stcb004 FROM stae_t WHERE staeent = g_enterprise AND stae001 = g_stcb_d[l_ac].stcb002
  #   IF l_stcb004 = '3' THEN
  #      CALL cl_set_comp_entry('stcb004',TRUE)
  #   ELSE
  #      CALL cl_set_comp_entry('stcb004',FALSE)
  #   END IF       
  #END IF
   #end add-point  
END FUNCTION
 
{</section>}
 
{<section id="astt601.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION astt601_set_no_entry_b(p_cmd)
   {<Local define>}
   DEFINE p_cmd   LIKE type_t.chr1   
   {</Local define>}
   #add-point:set_no_entry_b段define
          DEFINE l_n     LIKE type_t.num5
   DEFINE l_staf003 LIKE staf_t.staf003
   DEFINE l_staf004 LIKE staf_t.staf004
   DEFINE l_staf005 LIKE staf_t.staf005
   DEFINE l_stcw003 LIKE stcw_t.stcw003
   #end add-point    
   #add-point:set_no_entry_b段
        
  
 
  
  # #已结算费用不可维护
  # IF astt601_chk_astm601_jiesuan(g_stcb_d[l_ac].stcbseq) THEN
  #    CALL cl_set_comp_entry("stcb002,stcb016",FALSE) 
  # ELSE
  #    CALL cl_set_comp_entry("stcb002,stcb016",TRUE) 
  # END IF
  # 
  # #结算完的费用不可维护费用截止日
  # IF astt601_chk_astm601_jiesuan_end(g_stcb_d[l_ac].stcbseq) THEN
  #    CALL cl_set_comp_entry("stcb017",FALSE) 
  # ELSE
  #    CALL cl_set_comp_entry("stcb017",TRUE) 
  # END IF
  #已结算费用不可维护
   IF g_stca_m.stca000 = 'U' THEN
     IF astt601_chk_astm601_jiesuan(g_stcb_d[l_ac].stcbseq) THEN
        #结算完的费用不可维护费用截止日以及其它
        IF astt601_chk_astm601_jiesuan_end(g_stcb_d[l_ac].stcbseq) THEN
           CALL cl_set_comp_entry("stcb017",FALSE) 
           CALL cl_set_comp_entry("stcb002,stcb003,stcb004,stcb005,stcb006,stcb007,stcb008,stcb009,stcb010,stcb011,stcb012,stcb013,stcb014,stcb015,stcb016",FALSE) 
        ELSE
           CALL cl_set_comp_entry("stcb002,stcb016",FALSE) 
           CALL cl_set_comp_entry("stcb003,stcb004,stcb005,stcb006,stcb007,stcb008,stcb009,stcb010,stcb011,stcb012,stcb013,stcb014,stcb015,stcb017",TRUE)            
        END IF
     ELSE
        CALL cl_set_comp_entry("stcb002,stcb016",TRUE) 
     END IF
   END IF
   
   IF NOT cl_null(g_stcb_d[l_ac].stcb002) THEN
      #檢查費用編號+經營方式是否存在asti204
      LET l_n = 0
      SELECT COUNT(*) INTO l_n FROM staf_t
       WHERE stafent = g_enterprise AND staf001= g_stcb_d[l_ac].stcb002 AND staf002 = g_stca_m.stca005
      IF l_n > 0 THEN
         DECLARE sel_staf_ne CURSOR FOR 
          SELECT staf003,staf004,staf005 FROM staf_t
           WHERE  stafent = g_enterprise AND staf001= g_stcb_d[l_ac].stcb002 AND staf002 = g_stca_m.stca005
         FOREACH sel_staf_ne INTO l_staf003,l_staf004,l_staf005
            LET l_staf003 = cl_str_replace(l_staf003,"stao","stcb")
            CALL astt601_convert(l_staf003)  RETURNING l_staf003
            IF l_staf004 = 'N' THEN
               CALL cl_set_comp_entry(l_staf003,FALSE)
            END IF
         END FOREACH 
      ELSE
         IF g_stcb_d[l_ac].stcb005 = '1' THEN    #變動
            IF g_stcb_d[l_ac].stcb015 <> '1' THEN      
               LET g_stcb_d[l_ac].stcb011 = ''
               CALL cl_set_comp_entry('stcb011',FALSE)
            END IF
         ELSE                                    #固定
            LET g_stcb_d[l_ac].stcb008 = ''
            LET g_stcb_d[l_ac].stcb008_desc = ''
            LET g_stcb_d[l_ac].stcb009 = ''
            LET g_stcb_d[l_ac].stcb009_desc = ''
            LET g_stcb_d[l_ac].stcb011 = ''
            LET g_stcb_d[l_ac].stcb012 = '1'
            LET g_stcb_d[l_ac].stcb013 = ''
            LET g_stcb_d[l_ac].stcb014 = ''
            LET g_stcb_d[l_ac].stcb015 = '1'
            CALL cl_set_comp_entry('stcb008,stcb009,stcb011',FALSE)
            CALL cl_set_comp_entry('stcb012,stcb013,stcb014,stcb015',FALSE)
         END IF
         
         IF g_stcb_d[l_ac].stcb012 = '1' THEN    #保底
            LET g_stcb_d[l_ac].stcb013 = ''
            LET g_stcb_d[l_ac].stcb014 = ''
            CALL cl_set_comp_entry('stcb013,stcb014',FALSE)
         END IF
      END IF 
   ELSE
      IF g_stcb_d[l_ac].stcb005 = '1' THEN         #變動
         IF g_stcb_d[l_ac].stcb015 <> '1' THEN      
            LET g_stcb_d[l_ac].stcb011 = ''
            CALL cl_set_comp_entry('stcb011',FALSE) #費用比率
         END IF
      ELSE                                    #固定
         LET g_stcb_d[l_ac].stcb008 = ''
         LET g_stcb_d[l_ac].stcb008_desc = ''
         LET g_stcb_d[l_ac].stcb009 = ''
         LET g_stcb_d[l_ac].stcb009_desc = ''
         LET g_stcb_d[l_ac].stcb011 = ''
         LET g_stcb_d[l_ac].stcb012 = '1'
         LET g_stcb_d[l_ac].stcb013 = ''
         LET g_stcb_d[l_ac].stcb014 = ''
         LET g_stcb_d[l_ac].stcb015 = '1'
         CALL cl_set_comp_entry('stcb008,stcb009,stcb011',FALSE)
         CALL cl_set_comp_entry('stcb012,stcb013,stcb014,stcb015',FALSE)
      END IF
      
      IF g_stcb_d[l_ac].stcb012 = '1' THEN    #保底
         LET g_stcb_d[l_ac].stcb013 = ''
         LET g_stcb_d[l_ac].stcb014 = ''           
         CALL cl_set_comp_entry('stcb013,stcb014',FALSE)         
      END IF
   END IF   
   #160513-00033#7-s
   #僅可維護 計算類型stcb005,計算基準stcb009,條件/固定金額stcb010,費用比率stcb011
   IF g_stcb_d[l_ac].stcb021 = 'Y' THEN   
      CALL cl_set_comp_entry('stcb004,stcb006,stcb007,stcb008,stcb013,stcb014,stcb012,stcb015',FALSE)
   END IF
   #當計算類型=1.變動 則費用比率必填,條件/固定金額不可輸入
   #當計算類型=2.固定 則條件/固定金額必填,費用比率不可輸入   
   IF g_stcb_d[l_ac].stcb005 = '1' THEN
      LET g_stcb_d[l_ac].stcb010 = ''
      CALL cl_set_comp_required('stcb010',FALSE)
      CALL cl_set_comp_entry('stcb010',FALSE)      
   END IF
   IF g_stcb_d[l_ac].stcb005 = '2' THEN
      LET g_stcb_d[l_ac].stcb011 = ''
      CALL cl_set_comp_required('stcb011',FALSE)
      CALL cl_set_comp_entry('stcb011',FALSE)      
   END IF  
   IF g_stck_d[l_ac].stck004 = '1' THEN   #现返类型='1.单次返'
      LET g_stck_d[l_ac].stck005 = ''
      CALL cl_set_comp_required('stck005',FALSE)
      CALL cl_set_comp_entry('stck005',FALSE)
   END IF
   IF g_stck_d[l_ac].stck005 <> '4' THEN  #条件区间<>'4.起止期间返'
      LET g_stck_d[l_ac].stck006 = ''
      LET g_stck_d[l_ac].stck007 = ''
      CALL cl_set_comp_required('stck006,stck007',FALSE)
      CALL cl_set_comp_entry('stck006,stck007',FALSE)
   #160704-00007#1 160705 by sakura add(S)
   ELSE
     IF cl_null(g_stck_d[l_ac].stck006) AND cl_null(g_stck_d[l_ac].stck007) THEN
        LET g_stck_d[l_ac].stck006 = g_today
        LET g_stck_d[l_ac].stck007 = g_stca_m.stca018  
     END IF
   #160704-00007#1 160705 by sakura add(E)
   END IF
   IF g_stck_d[l_ac].stck011 = '1' THEN   #折扣比率='1.折扣比率'/固定金额栏位控制
      LET g_stck_d[l_ac].stck013 = ''
      CALL cl_set_comp_required('stck013',FALSE)
      CALL cl_set_comp_entry('stck013',FALSE)
   END IF
   IF g_stck_d[l_ac].stck011 = '2' THEN  #折扣比率='2.固定金额'/折扣比率栏位控制
      LET g_stck_d[l_ac].stck012 = ''
      CALL cl_set_comp_required('stck012',FALSE)
      CALL cl_set_comp_entry('stck012',FALSE)
   END IF   
   #160513-00033#7-e
  # IF g_stca_m.stca000 = 'U' THEN
  #   SELECT stcw003 INTO l_stcw003 FROM stcw_t
  #    WHERE stcwent = g_enterprise AND stcw001 = g_stca_m.stca001
  #      AND stcwseq = (SELECT MAX(stcwseq) FROM stcw_t WHERE stcwent = g_enterprise AND stcw001 = g_stca_m.stca001  AND stcw005 = 'Y')
  #
  #    IF NOT cl_null(g_stcb_d[l_ac].stcb016) AND g_stcb_d[l_ac].stcb016 <= l_stcw003 THEN
  #       CALL cl_set_comp_entry('stcb016',FALSE)       
  #    ELSE
  #       IF l_n = 0 THEN
  #          CALL cl_set_comp_entry('stcb016',TRUE)
  #       END IF
  #    END IF
  #    IF p_cmd = 'u' THEN
  #       CALL cl_set_comp_entry('stcb002',FALSE)
  #    END IF
  # END IF
   #160704-00007#1 160705 by sakura mark(S)
   ##160629-00005#1 160630 by sakura add(S)
   #IF (g_stck_d[l_ac].stck004 = '1') THEN
   #   CALL cl_set_comp_entry('stck006,stck007',FALSE)
   #END IF   
   ##160629-00005#1 160630 by sakura add(E)  
   #160704-00007#1 160705 by sakura mark(E)
   #end add-point     
END FUNCTION
 
{</section>}
 
{<section id="astt601.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION astt601_default_search()
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
      LET ls_wc = ls_wc, " stcadocno = '", g_argv[1], "' AND "
   END IF
   
 
   
   IF NOT cl_null(ls_wc) THEN
      LET g_wc = ls_wc.subString(1,ls_wc.getLength()-5)
   ELSE
      IF cl_null(g_wc) THEN
         LET g_wc = " 1=1"
      END IF
   END IF
   
   #add-point:default_search段結束前
      
   #end add-point  
 
END FUNCTION
 
{</section>}
 
{<section id="astt601.state_change" >}
   #+ 此段落由子樣板a09產生
#+ 確認碼變更
PRIVATE FUNCTION astt601_statechange()
   {<Local define>}
   DEFINE lc_state LIKE type_t.chr5
   {</Local define>}
   #add-point:statechange段define
         DEFINE l_success LIKE type_t.chr5
   #end add-point  
   
   #add-point:statechange段開始前
      
   #end add-point  
   
   ERROR ""     #清空畫面右下側ERROR區塊
 
   IF g_stca_m.stcadocno IS NULL
 
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
         HIDE OPTION "approved"
         HIDE OPTION "rejection"
         CASE g_stca_m.stcastus
            WHEN "N"
               HIDE OPTION "open"
            WHEN "X"
               HIDE OPTION "invalid"
 
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
            
         END CASE
     
      #add-point:menu前
      CALL cl_set_act_visible("signing,withdraw",FALSE)
      CASE g_stca_m.stcastus
         WHEN "N"
            CALL cl_set_act_visible("open,hold",FALSE)
            #需提交至BPM時，則顯示「提交」功能並隱藏「確認」功能
            LET g_action_choice = "statechange"                 #151109-00006#3 151223 add TT.Jessica
            IF cl_bpm_chk() THEN
               CALL cl_set_act_visible("signing",TRUE)
               CALL cl_set_act_visible("confirmed",FALSE)
            END IF
            
         WHEN "R"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,open,hold",FALSE)
            
         WHEN "D"    #保留修改的功能(如作廢)，隱藏其他應用功能(如: 確認、未確認、留置、過帳…)
            CALL cl_set_act_visible("confirmed,open,hold",FALSE)
            
         WHEN "Y"
            HIDE OPTION "open"
            HIDE OPTION "invalid"
            RETURN
            
         WHEN "X"
            HIDE OPTION "open"
            HIDE OPTION "confirmed"
            RETURN 
            
         WHEN "W"    #只能顯示抽單;其餘應用功能皆隱藏
            CALL cl_set_act_visible("withdraw",TRUE)
            CALL cl_set_act_visible("open,invalid,confirmed,hold",FALSE)
            
         WHEN "A"    #只能顯示確認; 其餘應用功能皆隱藏
            CALL cl_set_act_visible("confirmed",TRUE)
            CALL cl_set_act_visible("open,invalid,hold",FALSE)
            
      END CASE
      #end add-point
      
      ON ACTION open
         LET lc_state = "N"
         #add-point:action控制
                  
         #end add-point
         EXIT MENU
      
      
      #ON ACTION invalid
      #   LET lc_state = "X"
      #   #add-point:action控制
                  
      #   #end add-point
      #   EXIT MENU
      #160628-00032#1 160629 by sakura mark(E)
 
      ON ACTION confirmed
         LET lc_state = "Y"
         #add-point:action控制
                  
         #end add-point
         EXIT MENU
 
      #提交
      ON ACTION signing
         IF cl_auth_chk_act("signing") THEN
       IF NOT astt601_send() THEN
         RETURN
       END IF
         END IF
         LET lc_state = ''  #因為_send()已有執行update動作
         EXIT MENU
 
      #抽單
      ON ACTION withdraw
         IF cl_auth_chk_act("withdraw") THEN
            IF NOT astt601_draw_out() THEN
               RETURN
            END IF
         END IF
         LET lc_state = ''   #因為_draw_out()已有執行update動作
         EXIT MENU 
      
      
      
      #add-point:stus控制
      #160628-00032#1 160629 by sakura add(S)
      ON ACTION invalid
         LET lc_state = "X"
         
         EXIT MENU
      #160628-00032#1 160629 by sakura add(S)
      #end add-point
      
   END MENU
   
   IF (lc_state <> "N" 
      AND lc_state <> "X"
 
      AND lc_state <> "Y"
      AND lc_state <> "A"
      AND lc_state <> "D"
      AND lc_state <> "R"
      AND lc_state <> "W"
 
      ) OR 
      cl_null(lc_state) THEN
      RETURN
   END IF
   
   #add-point:stus修改前
          LET l_success = TRUE
   CASE lc_state 
      WHEN 'Y'       
         CALL s_astt601_conf_chk(g_stca_m.stcadocno) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('aim-00108') THEN
               CALL s_transaction_begin()
               CALL s_astt601_conf_upd(g_stca_m.stcadocno) RETURNING l_success
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_stca_m.stcadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

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
                  LET g_errparam.extend = g_stca_m.stcadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

            RETURN            
         END IF         
      WHEN 'X'
         CALL s_astt601_void_chk(g_stca_m.stcadocno) RETURNING l_success,g_errno
         IF l_success THEN
            IF cl_ask_confirm('lib-016') THEN
               CALL s_transaction_begin()
               CALL s_astt601_void_upd(g_stca_m.stcadocno) RETURNING l_success
               IF NOT l_success THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = g_errno
                  LET g_errparam.extend = g_stca_m.stcadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

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
                  LET g_errparam.extend = g_stca_m.stcadocno
                  LET g_errparam.popup = TRUE
                  CALL cl_err()

            RETURN    
         END IF
   END CASE
   #end add-point
      
   UPDATE stca_t SET stcastus = lc_state 
    WHERE stcaent = g_enterprise AND stcadocno = g_stca_m.stcadocno
 
  
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
            CALL gfrm_curr.setElementImage("statechange", "stus/32/invalid.png")
 
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
 
         
      END CASE
      LET g_stca_m.stcastus = lc_state
      DISPLAY BY NAME g_stca_m.stcastus
   END IF
 
   #add-point:stus修改後
   
    
   #end add-point
 
   #add-point:statechange段結束前
      
   #end add-point  
 
END FUNCTION
 
 
 
{</section>}
 
{<section id="astt601.idx_chk" >}
#+ 單身筆數變更
PRIVATE FUNCTION astt601_idx_chk()
   #add-point:idx_chk段define
         IF g_current_page = 3 THEN
      LET g_detail_idx3 = g_curr_diag.getCurrentRow("s_detail3")
      IF g_detail_idx3 > g_stcc_d.getLength() THEN
         LET g_detail_idx3 = g_stcc_d.getLength()
      END IF
      IF g_detail_idx3 = 0 AND g_stcc_d.getLength() <> 0 THEN
         LET g_detail_idx3 = 1
      END IF
      DISPLAY g_detail_idx3 TO FORMONLY.idx
      DISPLAY g_stcc_d.getLength() TO FORMONLY.cnt
   END IF
   #end add-point  
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_stcb_d.getLength() THEN
         LET g_detail_idx = g_stcb_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stcb_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stcb_d.getLength() TO FORMONLY.cnt
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx > g_stcb2_d.getLength() THEN
         LET g_detail_idx = g_stcb2_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_stcb2_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      DISPLAY g_detail_idx TO FORMONLY.idx
      DISPLAY g_stcb2_d.getLength() TO FORMONLY.cnt
   END IF
 
 
   
   #add-point:idx_chk段other
      
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="astt601.b_fill2" >}
#+ 單身陣列填充2
PRIVATE FUNCTION astt601_b_fill2(pi_idx)
   {<Local define>}
   DEFINE pi_idx          LIKE type_t.num5
   DEFINE li_ac           LIKE type_t.num5
   DEFINE ls_chk          LIKE type_t.chr1
   {</Local define>}
   #add-point:b_fill2段define
      
   #end add-point
   
   LET li_ac = l_ac 
   
 
      
   #add-point:單身填充後
         CALL astt601_b3_fill()
   CALL astt601_reflesh()
   #end add-point
    
   LET l_ac = li_ac
   
   CALL astt601_detail_show()
   
END FUNCTION
 
{</section>}
 
{<section id="astt601.fill_chk" >}
#+ 單身填充確認
PRIVATE FUNCTION astt601_fill_chk(ps_idx)
   {<Local define>}
   DEFINE ps_idx        LIKE type_t.chr10
   {</Local define>}
   #add-point:fill_chk段define
      
   #end add-point
   
   #全部為1=1 or null時回傳true
   IF (cl_null(g_wc2_table1) OR g_wc2_table1.trim() = '1=1')  AND 
      (cl_null(g_wc2_table2) OR g_wc2_table2.trim() = '1=1') THEN
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
 
 
 
   RETURN FALSE
 
END FUNCTION
 
{</section>}
 
{<section id="astt601.signature" >}
   
 
{</section>}
 
{<section id="astt601.set_pk_array" >}
 
 
{</section>}
 
{<section id="astt601.other_dialog" readonly="Y" >}
 
 
{</section>}
 
{<section id="astt601.other_function" readonly="Y" >}
   
#+
PUBLIC FUNCTION astt601_b3_fill()
DEFINE p_wc2      STRING
 DEFINE l_a      LIKE type_t.num5
 
   CALL g_stcc_d.clear()   
   
   LET g_sql = "SELECT  UNIQUE stccseq2,stcc002,stcc003,stcc004 FROM stcc_t",    
               "",
               " WHERE stccent=? AND stccdocno=? AND stccseq1 = ?"
 
   IF NOT cl_null(g_wc2_table3) THEN
      LET g_sql = g_sql CLIPPED, " AND ", g_wc2_table3 CLIPPED
   END IF
 
   LET g_sql = g_sql, " ORDER BY stcc_t.stccdocno,stcc_t.stccseq1,stcc_t.stccseq2"
 
   #add-point:單身填充控制

   #end add-point
   
   PREPARE astt601_pb3 FROM g_sql
   DECLARE b_fill_cs3 CURSOR FOR astt601_pb3
 
   LET g_cnt = l_a
   LET l_a = 1
   IF cl_null(l_ac) OR l_ac = 0 THEN
      LET l_ac = 1
   END IF
   IF g_stcb_d.getLength() < 1 THEN
      RETURN
   END IF
   IF l_ac > g_stcb_d.getLength() THEN
      LET l_ac = g_stcb_d.getLength()
   END IF
   OPEN b_fill_cs3 USING g_enterprise,g_stca_m.stcadocno,g_stcb_d[l_ac].stcbseq

                                            
   FOREACH b_fill_cs3 INTO g_stcc_d[l_a].stccseq2,g_stcc_d[l_a].stcc002,g_stcc_d[l_a].stcc003,g_stcc_d[l_a].stcc004
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
   
   CALL g_stcc_d.deleteElement(g_stcc_d.getLength())

   LET l_a = g_cnt
   LET g_cnt = 0  
   
   FREE astt601_pb3
END FUNCTION
#+
PUBLIC FUNCTION astt601_reflesh()
   DISPLAY ARRAY g_stcb_d TO s_detail1.* ATTRIBUTES(COUNT=g_rec_b)
     BEFORE DISPLAY
         EXIT DISPLAY
   END DISPLAY 
   
   DISPLAY ARRAY g_stcb2_d TO s_detail2.* ATTRIBUTES(COUNT=g_rec_b)
       BEFORE DISPLAY
         EXIT DISPLAY
   END DISPLAY
   
   DISPLAY ARRAY g_stcc_d TO s_detail3.* ATTRIBUTES(COUNT=g_rec_b3)
       BEFORE DISPLAY
         EXIT DISPLAY
    END DISPLAY
    
   DISPLAY ARRAY g_stcv_d TO s_detail4.* ATTRIBUTES(COUNT=g_rec_b)
     BEFORE DISPLAY
       EXIT DISPLAY
   END DISPLAY
END FUNCTION
#+
PUBLIC FUNCTION astt601_set_no_required_b(p_cmd)
 DEFINE p_cmd   LIKE type_t.chr1   
   DEFINE l_n     LIKE type_t.num5
   DEFINE l_staf003 LIKE staf_t.staf003
   DEFINE l_staf004 LIKE staf_t.staf004
   DEFINE l_staf005 LIKE staf_t.staf005


  
   CALL astt601_init_required(p_cmd)

   IF NOT cl_null(g_stcb_d[l_ac].stcb002) THEN
      #檢查費用編號+經營方式是否存在asti204
      
      SELECT COUNT(*) INTO l_n FROM staf_t
       WHERE stafent = g_enterprise AND staf001= g_stcb_d[l_ac].stcb002 AND staf002 = g_stca_m.stca005
      IF l_n > 0 THEN
         DECLARE sel_staf_nq CURSOR FOR 
          SELECT staf003,staf004,staf005 FROM staf_t
           WHERE  stafent = g_enterprise AND staf001= g_stcb_d[l_ac].stcb002 AND staf002 = g_stca_m.stca005
         FOREACH sel_staf_nq INTO l_staf003,l_staf004,l_staf005
            LET l_staf003 = cl_str_replace(l_staf003,"stao","stcb")
            CALL astt601_convert(l_staf003)  RETURNING l_staf003
            #160613-00026#1 160619 by sakura add(S)
            IF l_staf003 = "stcb004" THEN
               CONTINUE FOREACH
            END IF            
            #160613-00026#1 160619 by sakura add(E)            
            IF l_staf005 = 'N' THEN
               CALL cl_set_comp_required(l_staf003,FALSE)
            END IF
         END FOREACH 
      ELSE
         IF g_stcb_d[l_ac].stcb005 = '1' THEN    #變動
             CALL cl_set_comp_required('stcb008',FALSE) 
             IF cl_null(g_stcb_d[l_ac].stcb008) THEN
               CALL cl_set_comp_required('stcb010',FALSE)
            END IF
            IF g_stcb_d[l_ac].stcb015 <> '1' THEN      
               LET g_stcb_d[l_ac].stcb011 = ''
               CALL cl_set_comp_required('stcb011',FALSE)
            END IF
         ELSE                                    #固定
            CALL cl_set_comp_required('stcb009',FALSE) 
            LET g_stcb_d[l_ac].stcb011 = ''
            CALL cl_set_comp_required('stcb011',FALSE) 
         END IF   
         IF g_stcb_d[l_ac].stcb012 = '1' THEN    #保底
            CALL cl_set_comp_required('stcb013,stcb014',FALSE)
         END IF
      END IF 
   ELSE
      IF g_stcb_d[l_ac].stcb005 = '1' THEN    #變動
         CALL cl_set_comp_required('stcb008',FALSE) 
         IF cl_null(g_stcb_d[l_ac].stcb008) THEN
           CALL cl_set_comp_required('stcb010',FALSE)
        END IF
         IF g_stcb_d[l_ac].stcb015 <> '1' THEN      
            LET g_stcb_d[l_ac].stcb011 = ''
            CALL cl_set_comp_required('stcb011',FALSE)
         END IF
      ELSE                                    #固定
         CALL cl_set_comp_required('stcb009',FALSE) 
         LET g_stcb_d[l_ac].stcb011 = ''
         CALL cl_set_comp_required('stcb011',FALSE) 
      END IF   
      IF g_stcb_d[l_ac].stcb012 = '1' THEN    #保底
         CALL cl_set_comp_required('stcb013,stcb014',FALSE)
      END IF   
   END IF  
  
END FUNCTION
#+
PUBLIC FUNCTION astt601_stcb002_ref()
    INITIALIZE g_ref_fields TO NULL
    LET g_ref_fields[1] = g_stcb_d[l_ac].stcb002
    CALL ap_ref_array2(g_ref_fields,"SELECT stael003 FROM stael_t WHERE staelent='"||g_enterprise||"' AND stael001=? AND stael002='"||g_dlang||"'","") RETURNING g_rtn_fields
    LET g_stcb_d[l_ac].stcb002_desc = '', g_rtn_fields[1] , ''  
    DISPLAY BY NAME g_stcb_d[l_ac].stcb002_desc
END FUNCTION
#+
PUBLIC FUNCTION astt601_set_required_b(p_cmd)
DEFINE p_cmd   LIKE type_t.chr1   
DEFINE l_n     LIKE type_t.num5
DEFINE l_staf003 LIKE staf_t.staf003
DEFINE l_staf004 LIKE staf_t.staf004
DEFINE l_staf005 LIKE staf_t.staf005



  

   IF NOT cl_null(g_stcb_d[l_ac].stcb002) THEN
      #檢查費用編號+經營方式是否存在asti204
      
      SELECT COUNT(*) INTO l_n FROM staf_t
       WHERE stafent = g_enterprise AND staf001= g_stcb_d[l_ac].stcb002 AND staf002 = g_stca_m.stca005
      IF l_n > 0 THEN
         DECLARE sel_staf_q CURSOR FOR 
          SELECT staf003,staf004,staf005 FROM staf_t
           WHERE  stafent = g_enterprise AND staf001= g_stcb_d[l_ac].stcb002 AND staf002 = g_stca_m.stca005
         FOREACH sel_staf_q INTO l_staf003,l_staf004,l_staf005
            LET l_staf003 = cl_str_replace(l_staf003,"stao","stcb")           
            CALL astt601_convert(l_staf003)  RETURNING l_staf003
            #160613-00026#1 160619 by sakura add(S)
            IF l_staf003 = "stcb004" THEN
               CONTINUE FOREACH
            END IF            
            #160613-00026#1 160619 by sakura add(E)             
            IF l_staf005 = 'Y' THEN
               CALL cl_set_comp_required(l_staf003,TRUE)
            END IF
         END FOREACH
      ELSE
          IF g_stcb_d[l_ac].stcb005 = '1' THEN    #變動
             CALL cl_set_comp_required('stcb008',FALSE)
             IF NOT cl_null(g_stcb_d[l_ac].stcb008) THEN
                CALL cl_set_comp_required('stcb010',TRUE)
             END IF
             CALL cl_set_comp_required('stcb009',TRUE)
             IF g_stcb_d[l_ac].stcb015 = '1' THEN      
                CALL cl_set_comp_required('stcb011',TRUE) 
             END IF
          ELSE                                    #固定
             CALL cl_set_comp_required('stcb010',TRUE)
          END IF   
          IF g_stcb_d[l_ac].stcb012 <> '1' THEN    #保底
             CALL cl_set_comp_required('stcb013,stcb014',TRUE)
          END IF      
      END IF    
   ELSE
      IF g_stcb_d[l_ac].stcb005 = '1' THEN    #變動
         CALL cl_set_comp_required('stcb008',FALSE)
         IF NOT cl_null(g_stcb_d[l_ac].stcb008) THEN
            CALL cl_set_comp_required('stcb010',TRUE)
         END IF
         CALL cl_set_comp_required('stcb009',TRUE)
         IF g_stcb_d[l_ac].stcb015 = '1' THEN      
            CALL cl_set_comp_required('stcb011',TRUE) 
         END IF
      ELSE                                    #固定
         CALL cl_set_comp_required('stcb010',TRUE)
      END IF   
      IF g_stcb_d[l_ac].stcb012 <> '1' THEN    #保底
         CALL cl_set_comp_required('stcb013,stcb014',TRUE)
      END IF   
   END IF 
  
END FUNCTION
#+
PUBLIC FUNCTION astt601_stcb008_chk(p_stab001)
DEFINE p_stab001   LIKE stab_t.stab001
DEFINE l_n         LIKE type_t.num5

   LET g_errshow = '1'
   INITIALIZE g_chkparam.* TO NULL
   LET g_chkparam.arg1 = p_stab001
   IF NOT cl_chk_exist("v_stab001_1") THEN
      RETURN FALSE
   END IF
   
   SELECT COUNT(*) INTO l_n FROM stab_t LEFT OUTER JOIN stat_t ON stabent = statent AND stab001 = stat003
     #WHERE  stabent = 99 AND stab001= p_stab001 AND stat001 = g_stca_m.stca005 AND stat002 = g_stca_m.stca007 #170222-00018#1 mark
     WHERE  stabent = g_enterprise AND stab001= p_stab001 AND stat001 = g_stca_m.stca005 AND stat002 = g_stca_m.stca007  #170222-00018#1 add    
   IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00108'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF
  
   RETURN TRUE
END FUNCTION
#+
PUBLIC FUNCTION astt601_stcb002_chk(p_stae001)
DEFINE p_stae001  LIKE stae_t.stae001
DEFINE l_staestus LIKE stae_t.staestus
DEFINE l_stae010  LIKE stae_t.stae010
DEFINE l_n        LIKE type_t.num5
DEFINE l_ooef019  LIKE ooef_t.ooef019

   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = p_stae001
   IF NOT cl_chk_exist("v_stae001_1") THEN
      RETURN FALSE
   END IF
   
    #税别要存在于签订法人税区里面的税别
   SELECT stae010 INTO l_stae010 FROM stae_t WHERE staeent = g_enterprise AND stae001 = p_stae001
   SELECT ooef019 INTO l_ooef019 FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_stca_m.stca014
   
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
PUBLIC FUNCTION astt601_stca009_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stca009
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stca_m.stca009_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stca009_desc
   
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca009_chk(p_pmaa001)
DEFINE p_pmaa001   LIKE pmaa_t.pmaa001

   LET g_errshow = '1'
   INITIALIZE g_chkparam.* TO NULL
   LET g_chkparam.arg1 = p_pmaa001
   #160318-00025#38  2016/04/20  by pengxin  add(S)
   LET g_errshow = TRUE #是否開窗 
   LET g_chkparam.err_str[1] = "apm-00638:sub-01302|adbm200|",cl_get_progname("adbm200",g_lang,"2"),"|:EXEPROGadbm200"
   #160318-00025#38  2016/04/20  by pengxin  add(E)
   IF NOT cl_chk_exist("v_pmaa001_17") THEN
      RETURN FALSE
   END IF
   RETURN TRUE
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca004_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stca004
   CALL ap_ref_array2(g_ref_fields,"SELECT stagl003 FROM stagl_t WHERE staglent='"||g_enterprise||"' AND stagl001=? AND stagl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stca_m.stca004_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stca004_desc
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca004_chk(p_stag001)
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
PUBLIC FUNCTION astt601_stca021_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stca021
   CALL ap_ref_array2(g_ref_fields,"SELECT ooail003 FROM ooail_t WHERE ooailent='"||g_enterprise||"' AND ooail001=? AND ooail002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stca_m.stca021_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stca021_desc
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca021_chk(p_stca021)
DEFINE p_stca021  LIKE stca_t.stca021
  
   LET g_errshow = '1'
   INITIALIZE g_chkparam.* TO NULL
   LET g_chkparam.arg1 = g_site
   LET g_chkparam.arg2 = p_stca021
   
   #160318-00025#38  2016/04/20  by pengxin  add(S)
   LET g_errshow = TRUE #是否開窗 
   LET g_chkparam.err_str[1] = "aoo-00176:sub-01302|aooi150|",cl_get_progname("aooi150",g_lang,"2"),"|:EXEPROGaooi150"
   #160318-00025#38  2016/04/20  by pengxin  add(E)
   
   IF NOT cl_chk_exist("v_ooaj002") THEN
      RETURN FALSE
   END IF
   
   RETURN TRUE
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca022_ref()
  SELECT oodbl004 INTO g_stca_m.stca022_desc
    FROM oodbl_t,ooef_t
  WHERE oodblent = g_enterprise AND oodbl001 = ooef019 
    AND oodbl002 = g_stca_m.stca022 AND oodbl003 = g_dlang
    AND ooefent = g_enterprise AND ooef001 = g_site
  DISPLAY  BY NAME g_stca_m.stca022_desc
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca022_chk(p_stca022)
DEFINE  p_stca022    LIKE stca_t.stca022
DEFINE  l_oodcstus   LIKE oodc_t.oodcstus

   LET g_errno = ''
   SELECT oodbstus INTO l_oodcstus
     FROM oodb_t,ooef_t
    WHERE oodbent = g_enterprise AND oodb001 = ooef019 AND oodb002 = p_stca022 AND oodb004 = '1'
      AND ooefent = g_enterprise AND ooef001 = g_site
   CASE
      WHEN SQLCA.sqlcode = 100 LET g_errno = 'ast-00009' #稅目不存在
                               LET g_stca_m.stca022_desc = ''
      WHEN l_oodcstus <> 'Y'   LET g_errno = 'ast-00010' #稅目已無效
                               LET  g_stca_m.stca022_desc = ''
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
PUBLIC FUNCTION astt601_stca006_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stca006
   CALL ap_ref_array2(g_ref_fields,"SELECT staal003 FROM staal_t WHERE staalent='"||g_enterprise||"' AND staal001=? AND staal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stca_m.stca006_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stca006_desc
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca007_ref()
    INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stca007
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '2060' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stca_m.stca007_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stca007_desc
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca007_chk(p_stca007)
DEFINE p_stca007  LIKE stca_t.stca007
DEFINE l_oocqstus LIKE oocq_t.oocqstus
DEFINE l_n1        LIKE type_t.num5
DEFINE l_n2        LIKE type_t.num5

  
   SELECT oocqstus INTO l_oocqstus FROM oocq_t
    WHERE oocqent =  g_enterprise AND oocq001 = '2060' AND oocq002 = p_stca007
    
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
   
    #单身条件基准 和单头的结算类型不符合就报错 
   SELECT COUNT(*) INTO l_n1 FROM stcb_t 
    WHERE stcbent = g_enterprise AND stcbdocno = g_stca_m.stcadocno AND stcb008 IS NOT NULL
      AND  NOT EXISTS (SELECT 1 FROM stab_t LEFT OUTER JOIN stat_t ON stabent = statent AND stab001 = stat003
              WHERE stab001 = stcb008 AND stat001 = g_stca_m.stca005 AND stat002 = g_stca_m.stca007)
              
              
   SELECT COUNT(*) INTO l_n2 FROM stcb_t 
    WHERE stcbent = g_enterprise AND stcbdocno = g_stca_m.stcadocno AND stcb009 IS NOT NULL
      AND  NOT EXISTS (SELECT 1 FROM stab_t LEFT OUTER JOIN stat_t ON stabent = statent AND stab001 = stat003
              WHERE stab001 = stcb009 AND stat001 = g_stca_m.stca005 AND stat002 = g_stca_m.stca007)

   
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
#+
PUBLIC FUNCTION astt601_stca006_chk(p_stca006)
DEFINE p_stca006  LIKE stca_t.stca006
DEFINE l_staastus LIKE staa_t.staastus


   SELECT staastus INTO l_staastus FROM staa_t 
     WHERE staaent = g_enterprise AND staa001 = p_stca006
     
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
PUBLIC FUNCTION astt601_stca024_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stca024
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stca_m.stca024_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stca024_desc
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca024_chk(p_stca024)
DEFINE p_stca024  LIKE stca_t.stca024

   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = p_stca024
  #LET g_chkparam.arg2 = 'A'
   IF NOT cl_chk_exist("v_ooef001_31") THEN
      RETURN FALSE
   END IF
 
   RETURN TRUE
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca025_ref()
   INITIALIZE g_ref_fields TO NULL
  LET g_ref_fields[1] = g_stca_m.stca025
  CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
  LET g_stca_m.stca025_desc = '', g_rtn_fields[1] , ''
  DISPLAY BY NAME g_stca_m.stca025_desc
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca025_chk(p_stca025)
DEFINE p_stca025  LIKE stca_t.stca025

   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = p_stca025
  #LET g_chkparam.arg2 = 'D'
   IF NOT cl_chk_exist("v_ooef001_27") THEN
      RETURN FALSE
   END IF
   RETURN TRUE  
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca004_other()
 SELECT stag003,stag004,stag005,stag006,stag007#,stag008 
     INTO g_stca_m.stca023,g_stca_m.stca006,g_stca_m.stca007,g_stca_m.stca021,g_stca_m.stca022#,g_stca_m.stcasite
     FROM stag_t
    WHERE stagent = g_enterprise AND stag001 = g_stca_m.stca004
    
   
   #LET g_stca_m_t.* = g_stca_m.*
   LET g_stca_m_t.stca023 = g_stca_m.stca023
   LET g_stca_m_t.stca006 = g_stca_m.stca006
   LET g_stca_m_t.stca007 = g_stca_m.stca007
   LET g_stca_m_t.stca021 = g_stca_m.stca021
   LET g_stca_m_t.stca022 = g_stca_m.stca022
   
   DISPLAY BY NAME g_stca_m.stca023,g_stca_m.stca006,g_stca_m.stca007,g_stca_m.stca021,g_stca_m.stca022,g_stca_m.stcasite
   
   CALL astt601_stca023_ref()
   CALL astt601_stca006_ref()
   CALL astt601_stca007_ref()
   CALL astt601_stca021_ref()
   CALL astt601_stca022_ref()
   
   LET t_stca.* = g_stca_m.*
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca004_genb()
DEFINE l_sql    STRING
DEFINE l_stah   RECORD LIKE stah_t.*
DEFINE l_next_b LIKE type_t.dat
DEFINE l_stcb018 LIKE stcb_t.stcb018
DEFINE l_stcb019 LIKE stcb_t.stcb019
DEFINE l_stcb020 LIKE stcb_t.stcb020
DEFINE l_stcb021 LIKE stcb_t.stcb021   #160513-00033#7
DEFINE l_flag    LIKE type_t.chr1
DEFINE l_stbq    RECORD
         stbq002 LIKE stbq_t.stbq002,
         stbq003 LIKE stbq_t.stbq003,
         stbq004 LIKE stbq_t.stbq004,
         stbq005 LIKE stbq_t.stbq005,
         stbq006 LIKE stbq_t.stbq006,
         stbq007 LIKE stbq_t.stbq007,
         stbq008 LIKE stbq_t.stbq008,
         stbq009 LIKE stbq_t.stbq009,
         stbq010 LIKE stbq_t.stbq010,
         stbq011 LIKE stbq_t.stbq011,
         stbq012 LIKE stbq_t.stbq012,
         stbq013 LIKE stbq_t.stbq013,
         stbq014 LIKE stbq_t.stbq014,
         stbq015 LIKE stbq_t.stbq015
             END RECORD

   LET l_flag = 'N'
   DECLARE  sel_stah CURSOR FOR SELECT stahent,stah001,stah002,stah003,stah004,stah005,stah006,
          stah007,stah008,stah009,stah010,stah011,stah012,stah013,stah014,stah015,stah016,stah017     #160513-00033#7
     FROM stah_t 
    WHERE stahent = g_enterprise AND stah001 =g_stca_m.stca004 
   
   FOREACH sel_stah INTO l_stah.stahent,
                         l_stah.stah001,l_stah.stah002,l_stah.stah003,l_stah.stah004,l_stah.stah005,
                         l_stah.stah006,l_stah.stah007,l_stah.stah008,l_stah.stah009,l_stah.stah010,
                         l_stah.stah011,l_stah.stah012,l_stah.stah013,l_stah.stah014,l_stah.stah015,
                         l_stah.stah016,l_stah.stah017
      #推算下次计算日 .结算开始。结算截止
      IF NOT cl_null(g_stca_m.stca010) AND l_stah.stah006 = '1' THEN
         LET l_flag = 'Y'
         CONTINUE FOREACH
      END IF
      CALL s_astm601_cal_nextd(l_stah.stah007,l_stah.stah008,g_stca_m.stca017,g_stca_m.stca018,'','') RETURNING l_stcb018,l_stcb019,l_stcb020
      INSERT INTO stcb_t (stcbent,stcbsite,stcbunit,stcbdocno,stcbseq,stcb001,stcb002,stcb003,
                       stcb004,stcb005,stcb006,stcb007,stcb008,stcb009,stcb010,stcb011,stcb012,
                       stcb013,stcb014,stcb015,stcb016,stcb017,stcb018,stcb019,stcb020,stcb021) #160513-00033#7
            VALUES (l_stah.stahent,g_stca_m.stcasite,g_stca_m.stcaunit,g_stca_m.stcadocno,l_stah.stah002,g_stca_m.stca001,l_stah.stah003,l_stah.stah004,l_stah.stah005,
                    l_stah.stah006,l_stah.stah007,l_stah.stah008,l_stah.stah009,l_stah.stah010,l_stah.stah011,l_stah.stah012,
                    l_stah.stah013,l_stah.stah014,l_stah.stah015,l_stah.stah016,g_stca_m.stca017,g_stca_m.stca018,l_stcb018,l_stcb019,l_stcb020,l_stah.stah017)  #160513-00033#7
                                  
   END FOREACH 
   
   IF l_flag = 'Y' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00198'
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()
   END IF
   
   LET l_sql = "  INSERT INTO stcc_t(stccent,stccsite,stccunit,stccdocno,stccseq1,stccseq2,stcc001,stcc002,stcc003,stcc004)  ",
               "   SELECT staient,'",g_stca_m.stcasite,"','",g_stca_m.stcaunit,"','",g_stca_m.stcadocno,"',stai002,stai003,'",g_stca_m.stca001,"',stai004,stai005,stai006 ",
               "   FROM stai_t ",
               "   WHERE staient = '",g_enterprise,"' AND stai001 ='",g_stca_m.stca004,"'"
   IF NOT cl_null(g_stca_m.stca010) THEN
      LET l_sql = l_sql," AND stai002 IN (SELECT stah002 FROM stah_t WHERE stahent ='",g_enterprise,"' AND stah001 = '",g_stca_m.stca004,"' AND stah006 ='2' ) "
   END IF
   PREPARE ins_stcc FROM l_sql
   EXECUTE ins_stcc
   IF SQLCA.SQLCODE THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.SQLCODE 
      LET g_errparam.extend = ''
      LET g_errparam.popup = FALSE
      CALL cl_err()
   END IF 
   #160513-00033#7(S)
   LET l_sql = " SELECT stbq002,stbq003,stbq004,stbq005,",
                      " stbq006,stbq007,stbq008,stbq009,stbq010,",
                      " stbq011,stbq012,stbq013,stbq014,stbq015 ",
                " FROM stbq_t ",
               " WHERE stbqent = ",g_enterprise," AND stbq001 = '",g_stca_m.stca004 ,"'"
   PREPARE sel_stbq_p FROM l_sql
   DECLARE sel_stbq_c CURSOR FOR sel_stbq_p   
   FOREACH sel_stbq_c INTO l_stbq.stbq002,l_stbq.stbq003,l_stbq.stbq004,l_stbq.stbq005,
                         l_stbq.stbq006,l_stbq.stbq007,l_stbq.stbq008,l_stbq.stbq009,l_stbq.stbq010,
                         l_stbq.stbq011,l_stbq.stbq012,l_stbq.stbq013,l_stbq.stbq014,l_stbq.stbq015
      INSERT INTO  stck_t (stckent,stcksite,stckunit,stckdocno,stckseq,
                           stck001,stck002,stck003,stck004,stck005,
                           stck006,stck007,stck008,stck009,stck010,
                           stck011,stck012,stck013,stck014)
            VALUES (g_enterprise,g_stca_m.stcasite,g_stca_m.stcaunit,g_stca_m.stcadocno,l_stbq.stbq002,
                    g_stca_m.stca001,l_stbq.stbq003,l_stbq.stbq004,l_stbq.stbq005,l_stbq.stbq006,
                    l_stbq.stbq007,l_stbq.stbq008,l_stbq.stbq009,l_stbq.stbq010,l_stbq.stbq011,
                    l_stbq.stbq012,l_stbq.stbq013,l_stbq.stbq014,l_stbq.stbq015)                                  
   END FOREACH 
   #160513-00033#7--(E)
END FUNCTION
#+
PUBLIC FUNCTION astt601_stcd002_ref()
DEFINE l_dbba002  LIKE dbba_t.dbba002 
  
    SELECT dbba002 INTO l_dbba002 FROM  dbba_t,dbbc_t
       WHERE dbbaent = dbbcent AND dbbc001 = g_stca_m.stca028
         AND dbbc004 = dbba001 AND dbbaent = g_enterprise 
   IF l_dbba002 = '1' THEN      
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcb2_d[l_ac].stcd002
      CALL ap_ref_array2(g_ref_fields,"SELECT rtaxl003 FROM rtaxl_t WHERE rtaxlent='"||g_enterprise||"' AND rtaxl001=? AND rtaxl002='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcb2_d[l_ac].stcd002_desc = '', g_rtn_fields[1] , ''
   ELSE
      INITIALIZE g_ref_fields TO NULL
      LET g_ref_fields[1] = g_stcb2_d[l_ac].stcd002
      CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '2002' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
      LET g_stcb2_d[l_ac].stcd002_desc = '', g_rtn_fields[1] , ''
   END IF

   DISPLAY BY NAME g_stcb2_d[l_ac].stcd002_desc
END FUNCTION
#+
PUBLIC FUNCTION astt601_stcd002_chk(p_cmd,p_stcd002)
DEFINE p_cmd      LIKE type_t.chr1
DEFINE p_stcd002  LIKE stcd_t.stcd002
DEFINE l_sys      LIKE type_t.num5
DEFINE l_n        LIKE type_t.num5
DEFINE l_dbba001  LIKE dbba_t.dbba001
DEFINE l_dbba002  LIKE dbba_t.dbba002
DEFINE l_dbbbstus LIKE dbbb_t.dbbbstus

   #IF p_cmd = 'a' THEN
   #   SELECT COUNT(*) INTO l_n FROM stcd_t
   #    WHERE stcdent = g_enterprise AND stcddocno =  g_stca_m.stcadocno AND stcd002 = 'ALL'  
   #ELSE
   #    SELECT COUNT(*) INTO l_n FROM stcd_t
   #    WHERE stcdent = g_enterprise AND stcddocno =  g_stca_m.stcadocno AND stcd002 = 'ALL'  AND stcdseq <> g_stcb2_d[l_ac].stcdseq 
   #END IF
   #
   #IF l_n > 0 THEN
   #   INITIALIZE g_errparam TO NULL
   #   LET g_errparam.code = 'ast-00114'
   #   LET g_errparam.extend = ''
   #   LET g_errparam.popup = FALSE
   #   CALL cl_err()
   #
   #   RETURN FALSE
   #END IF
   # 
   #IF p_stcd002 <> "ALL" THEN 
   
     LET g_errshow = '1'
     SELECT dbba001,dbba002 INTO l_dbba001,l_dbba002 FROM  dbba_t,dbbc_t
       WHERE dbbaent = dbbcent AND dbbc001 = g_stca_m.stca028
         AND dbbc004 = dbba001 AND dbbaent = g_enterprise 
       
     IF l_dbba002 = '1' THEN          
       INITIALIZE g_chkparam.* TO NULL
       
       LET g_chkparam.arg1 = p_stcd002
       CALL cl_get_para(g_enterprise,g_site,'E-CIR-0001') RETURNING l_sys
       LET g_chkparam.arg2 = l_sys
       #160318-00025#38  2016/04/20  by pengxin  add(S)
       LET g_errshow = TRUE #是否開窗 
       LET g_chkparam.err_str[1] = "ast-00215:sub-01302|arti202|",cl_get_progname("arti202",g_lang,"2"),"|:EXEPROGarti202"
       #160318-00025#38  2016/04/20  by pengxin  add(E)
       #呼叫檢查存在並帶值的library
       IF NOT cl_chk_exist("v_rtax001_2") THEN
          RETURN FALSE
       END IF
     ELSE
         INITIALIZE g_chkparam.* TO NULL
         LET g_chkparam.arg1 = p_stcd002
           
         #呼叫檢查存在並帶值的library
         IF NOT cl_chk_exist("v_oocq002_2002") THEN
            RETURN FALSE     
         END IF  
     END IF
     #检查是否存在对应销售范围的产品组
      SELECT COUNT(*) INTO l_n FROM dbbb_t
       WHERE dbbbent = g_enterprise AND dbbb001 = l_dbba001 AND dbbb003 = p_stcd002
      IF l_n = 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00216'
         LET g_errparam.extend = ''
         LET g_errparam.popup = FALSE
         CALL cl_err()
         RETURN FALSE
      END IF  
      
     #检查是否无效
     SELECT dbbbstus INTO l_dbbbstus FROM dbbb_t
      WHERE dbbbent = g_enterprise AND dbbb001 = l_dbba001 AND dbbb003 = p_stcd002
     IF l_dbbbstus = 'N' THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code = 'ast-00218'
        LET g_errparam.extend = ''
        LET g_errparam.popup = FALSE
        CALL cl_err()
        RETURN FALSE
     END IF
   #ELSE
   #    #单身是否有其它资料
   #   SELECT COUNT(*) INTO l_n FROM stcd_t
   #    WHERE stcdent = g_enterprise AND stcddocno =  g_stca_m.stcadocno AND stcd002 <> 'ALL' AND stcdseq <> g_stcb2_d[l_ac].stcdseq
   #   IF l_n > 0 THEN
   #      INITIALIZE g_errparam TO NULL
   #      LET g_errparam.code = 'ast-00121'
   #      LET g_errparam.extend = ''
   #      LET g_errparam.popup = FALSE
   #      CALL cl_err()
   #      RETURN FALSE
   #   END IF     
   #END IF
   RETURN TRUE
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca014_ref()
    INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stca014
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stca_m.stca014_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stca014_desc
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca015_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stca015
   CALL ap_ref_array2(g_ref_fields,"SELECT ooag011 FROM ooag_t WHERE ooagent='"||g_enterprise||"' AND ooag001=? ","") RETURNING g_rtn_fields
   LET g_stca_m.stca015_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stca015_desc
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca014_chk(p_stca014)
DEFINE p_stca014  LIKE stca_t.stca014

   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = p_stca014
  #LET g_chkparam.arg2 = '1'
   IF NOT cl_chk_exist("v_ooef001_1") THEN
      RETURN FALSE
   END IF
   RETURN TRUE   
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca015_chk(p_stca015)
DEFINE p_stca015  LIKE stca_t.stca015
DEFINE l_ooagstus LIKE ooag_t.ooagstus

   SELECT ooagstus INTO l_ooagstus FROM ooag_t
    WHERE ooagent = g_enterprise AND ooag001 = p_stca015
    
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
#         LET g_errparam.code = 'aoo-00071'   #160318-00005#44  mark
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
#
PUBLIC FUNCTION astt601_stca001_chk(p_cmd,p_stca001)
DEFINE p_stca001   LIKE stca_t.stca001
DEFINE l_stcestus  LIKE stce_t.stcestus
DEFINE l_n         LIKE type_t.num5
DEFINE p_cmd       LIKE type_t.chr1

   #新增
   IF g_stca_m.stca000 = 'I' THEN
      SELECT COUNT(*) INTO l_n FROM stce_t WHERE stceent = g_enterprise AND stce001 = p_stca001
      IF l_n > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00142'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   #更改
   IF g_stca_m.stca000 = 'U' THEN
      SELECT stcestus INTO l_stcestus FROM stce_t WHERE stceent = g_enterprise AND stce001 = p_stca001
      IF STATUS = 100 OR cl_null(l_stcestus) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00143'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
      IF l_stcestus = 'N' THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00200'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
   END IF
   
   IF p_cmd = 'a' THEN
      SELECT COUNT(*) INTO l_n FROM stca_t
      WHERE stcaent = g_enterprise AND stca001 = p_stca001 AND stcastus = 'N'
   ELSE
     SELECT COUNT(*) INTO l_n FROM stca_t
      WHERE stcaent = g_enterprise AND stca001 = p_stca001 AND stcastus = 'N'
        AND stcadocno <> g_stca_m.stcadocno
   END IF
   
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00141'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF
   RETURN TRUE
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca001_other()
           
  SELECT  NVL(stce002+1,2),stce003,stce004,stce005,stce006,stce007,stce008,stce009,stce010,stce011,stce012,stce013,
          stce014,stce017,stce018,stce019,stce020,CASE stcestus WHEN 'X' THEN 'N' ELSE 'Y' END ,
          stce021,stce022,stce023,stce024,stce028,stce025,stce026,stce027,stce015,stce016
  
     INTO g_stca_m.stca002,g_stca_m.stca003,g_stca_m.stca004,g_stca_m.stca005,g_stca_m.stca006,
          g_stca_m.stca007,g_stca_m.stca008,g_stca_m.stca009,g_stca_m.stca010,
          g_stca_m.stca011,g_stca_m.stca012,g_stca_m.stca013,g_stca_m.stca014,
          g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca019,g_stca_m.stca020,
          g_stca_m.stcaacti,g_stca_m.stca021,g_stca_m.stca022,g_stca_m.stca023,
          g_stca_m.stca024,g_stca_m.stca028,g_stca_m.stca025,g_stca_m.stca026,g_stca_m.stca027,g_stca_m.stca015,g_stca_m.stca016
         
     FROM stce_t
    WHERE stceent = g_enterprise AND stce001 = g_stca_m.stca001
  
   SELECT stcw004 INTO g_stca_m.next_b FROM ( SELECT * FROM stcw_t
     WHERE stcwent = g_enterprise AND  stcw001 = g_stca_m.stca001 AND stcw005= 'N' ORDER BY stcwseq) WHERE rownum = 1
   DISPLAY g_stca_m.next_b TO next_b
   
   LET g_stca_m.stca002 = g_stca_m.stca002 USING "<<<<<<<<<#" 
   
   #LET g_stca_m_t.* = g_stca_m.*
   DISPLAY BY NAME  g_stca_m.stca002,g_stca_m.stca003,g_stca_m.stca004,g_stca_m.stca005,g_stca_m.stca006,
          g_stca_m.stca007,g_stca_m.stca008,g_stca_m.stca009,g_stca_m.stca010,
          g_stca_m.stca011,g_stca_m.stca012,g_stca_m.stca013,g_stca_m.stca014,
          g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca019,g_stca_m.stca020,
          g_stca_m.stcaacti,g_stca_m.stca021,g_stca_m.stca022,g_stca_m.stca023,
          g_stca_m.stca024,g_stca_m.stca028,g_stca_m.stca025,g_stca_m.stca026,g_stca_m.stca027,g_stca_m.stca015,g_stca_m.stca016
   
   CALL astt601_stca023_ref()
   CALL astt601_stca004_ref()
   CALL astt601_stca006_ref()
   CALL astt601_stca007_ref()
   CALL astt601_stca009_ref()
   CALL astt601_stca010_ref()
   CALL astt601_stca011_ref()
   CALL astt601_stca012_ref()
   CALL astt601_stca014_ref()
   
   CALL astt601_stca021_ref()
   CALL astt601_stca022_ref()
  
   CALL astt601_stca024_ref()
   CALL astt601_stca028_ref()
   CALL astt601_stca025_ref()
   CALL astt601_stca026_ref()
   
   CALL astt601_stca015_ref()
   CALL astt601_stca016_ref()

   LET t_stca.* = g_stca_m.*
END FUNCTION
#+
PUBLIC FUNCTION astt601_stca001_genb()
   IF g_stcb_d.getLength() > 0 OR g_stcb2_d.getLength() > 0 OR g_stcv_d.getLength() > 0 THEN
      IF NOT cl_ask_confirm('axm-00175') THEN
         RETURN FALSE
      END IF
      DELETE FROM stcb_t WHERE stcbent = g_enterprise AND stcbdocno = g_stca_m.stcadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del stcb'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
      DELETE FROM stcc_t WHERE stccent = g_enterprise AND stccdocno = g_stca_m.stcadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del stcc'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
      DELETE FROM stcd_t WHERE stcdent = g_enterprise AND stcddocno = g_stca_m.stcadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del stcd'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
      DELETE FROM stcv_t WHERE stcvent = g_enterprise AND stcvdocno = g_stca_m.stcadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del stcv'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
      #160513-00033#7
      DELETE FROM stck_t WHERE stckent = g_enterprise AND stckdocno = g_stca_m.stcadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del stck'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
      DELETE FROM stct_t WHERE stctent = g_enterprise AND stctdocno = g_stca_m.stcadocno
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = 'del stck'
         LET g_errparam.popup = TRUE
         CALL cl_err()

         RETURN FALSE
      END IF
      #160513-00033#7
   END IF
   
   INSERT INTO stcb_t(stcbent,stcbsite,stcbunit,stcbdocno,stcbseq,stcb001,stcb002,stcb003,stcb004,stcb005,stcb006,
                      stcb007,stcb008,stcb009,stcb010,stcb011,stcb012,stcb013,stcb014,stcb015,stcb016,stcb017,stcb018,stcb019,stcb020,stcb021)  #160513-00033#7
   SELECT stcfent,stcfsite,stcfunit,g_stca_m.stcadocno,stcfseq,stcf001,stcf002,stcf003,stcf004,stcf005,stcf006,
          stcf007,stcf008,stcf009,stcf010,stcf011,stcf012,stcf013,stcf014,stcf015,stcf016,stcf017,stcf018,stcf019,stcf020,stcf021      #160513-00033#7
     FROM stcf_t 
    WHERE stcfent = g_enterprise AND stcf001 =g_stca_m.stca001
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'ins stcb'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF
    
   INSERT INTO stcc_t(stccent,stccsite,stccunit,stccdocno,stccseq1,stccseq2,stcc001,stcc002,stcc003,stcc004)
   SELECT stcgent,stcgsite,stcgunit,g_stca_m.stcadocno,stcgseq1,stcgseq2,stcg001,stcg002,stcg003,stcg004
     FROM stcg_t 
    WHERE stcgent = g_enterprise AND stcg001 = g_stca_m.stca001
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'ins stcc'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF

   INSERT INTO stcd_t(stcdent,stcdsite,stcdunit,stcddocno,stcdseq,stcd001,stcd002,stcd003)
   SELECT stchent,stchsite,stchunit,g_stca_m.stcadocno,stchseq,stch001,stch002,stch003
     FROM stch_t
    WHERE stchent = g_enterprise AND stch001 = g_stca_m.stca001
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'ins stcd'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF
 
   INSERT INTO stcv_t(stcvent,stcvsite,stcvunit,stcvdocno,stcvseq,stcv001,stcv002,stcv003,stcv004,stcv005,stcv006)
     SELECT stcwent,stcwsite,stcwunit,g_stca_m.stcadocno,stcwseq,stcw001,stcw002,stcw003,stcw004,stcw005,stcw006  
      FROM stcw_t
     WHERE stcwent = g_enterprise AND stcw001 =  g_stca_m.stca001
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'ins stcv'
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   END IF
   #160513-00033#7
   INSERT INTO stck_t(stckent,stcksite,stckunit,stckdocno,stckseq,
                      stck001,stck002,stck003,stck004,stck005,
                      stck006,stck007,stck008,stck009,stck010,
                      stck011,stck012,stck013,stck014)
               #160707-00007#1 160707 by sakura add(S)
               SELECT stclent,stclsite,stclunit,g_stca_m.stcadocno,stclseq,
                      stcl001,stcl002,stcl003,stcl004,stcl005,
                      stcl006,stcl007,stcl008,stcl009,stcl010,
                      stcl011,stcl012,stcl013,stcl014
                 FROM stcl_t
                WHERE stclent = g_enterprise AND stcl001 =  g_stca_m.stca001
               #160707-00007#1 160707 by sakura add(E)
               #160707-00007#1 160707 by sakura mark(S)
               #SELECT stckent,stcksite,stckunit,g_stca_m.stcadocno,stckseq,
               #       stck001,stck002,stck003,stck004,stck005,
               #       stck006,stck007,stck008,stck009,stck010,
               #       stck011,stck012,stck013,stck014
               #  FROM stck_t
               # WHERE stckent = g_enterprise AND stck001 =  g_stca_m.stca001
               #160707-00007#1 160707 by sakura mark(E)
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'ins stck'
      LET g_errparam.popup = TRUE
      CALL cl_err()
   
      RETURN FALSE
   END IF
   INSERT INTO stct_t(stctent,stctsite,stctunit,stctdocno,stctseq,stct001)
               SELECT stctent,stctsite,stctunit,g_stca_m.stcadocno,stctseq,stct001
                 FROM stct_t
                WHERE stctent = g_enterprise AND stct001 =  g_stca_m.stca001
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'ins stct'
      LET g_errparam.popup = TRUE
      CALL cl_err()
   
      RETURN FALSE
   END IF      
   #160513-00033#7
   RETURN TRUE
END FUNCTION
################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL astt601_default(p_stca005,p_stcb002)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astt601_default(p_stca005,p_stcb002)
DEFINE p_stca005 LIKE stca_t.stca005
DEFINE p_stcb002 LIKE stcb_t.stcb002
DEFINE l_staf003 LIKE staf_t.staf003
DEFINE l_staf006 LIKE staf_t.staf006

    DECLARE sel_staf_d CURSOR FOR 
     SELECT staf003,staf006 FROM staf_t
      WHERE  stafent = g_enterprise AND staf001= p_stcb002 AND staf002 = p_stca005
   FOREACH sel_staf_d INTO l_staf003,l_staf006
       LET l_staf003 = cl_str_replace(l_staf003,"stao","stcb")
       CALL astt601_convert(l_staf003)  RETURNING l_staf003
      CASE l_staf003
          WHEN 'stcb003'
             LET g_stcb_d[l_ac].stcb003 = l_staf006
          WHEN 'stcb004'
             IF NOT cl_null(l_staf006) THEN
                LET g_stcb_d[l_ac].stcb004 = l_staf006
             END IF
          WHEN 'stcb005'
             LET g_stcb_d[l_ac].stcb005 = l_staf006
          WHEN 'stcb006'
             LET g_stcb_d[l_ac].stcb006 = l_staf006
          WHEN 'stcb007'
             LET g_stcb_d[l_ac].stcb007 = l_staf006
          WHEN 'stcb008'
             LET g_stcb_d[l_ac].stcb008 = l_staf006
             CALL astt601_stcb008_ref()
          WHEN 'stcb009'
             LET g_stcb_d[l_ac].stcb009 = l_staf006
             CALL astt601_stcb009_ref()
          WHEN 'stcb010'
             LET g_stcb_d[l_ac].stcb010 = l_staf006
          WHEN 'stcb011'
             LET g_stcb_d[l_ac].stcb011 = l_staf006
          WHEN 'stcb012'
             LET g_stcb_d[l_ac].stcb012 = l_staf006
          WHEN 'stcb013'
             LET g_stcb_d[l_ac].stcb013 = l_staf006
          WHEN 'stcb014'
             LET g_stcb_d[l_ac].stcb014 = l_staf006
          WHEN 'stcb015'
             LET g_stcb_d[l_ac].stcb015 = l_staf006
          WHEN 'stcb016'
             LET g_stcb_d[l_ac].stcb016 = l_staf006
          WHEN 'stcb017'
             LET g_stcb_d[l_ac].stcb017 = l_staf006
      END CASE

      CALL astt601_cal_nextd() RETURNING g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020

   END FOREACH 
   DISPLAY BY NAME g_stcb_d[l_ac].stcb003,g_stcb_d[l_ac].stcb004,g_stcb_d[l_ac].stcb005,
                  g_stcb_d[l_ac].stcb006,g_stcb_d[l_ac].stcb007,g_stcb_d[l_ac].stcb008,g_stcb_d[l_ac].stcb008_desc,
                  g_stcb_d[l_ac].stcb009,g_stcb_d[l_ac].stcb009_desc,g_stcb_d[l_ac].stcb010,g_stcb_d[l_ac].stcb011,
                  g_stcb_d[l_ac].stcb012,g_stcb_d[l_ac].stcb013,g_stcb_d[l_ac].stcb014,
                  g_stcb_d[l_ac].stcb015,g_stcb_d[l_ac].stcb016,g_stcb_d[l_ac].stcb017


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
PUBLIC FUNCTION astt601_stcb008_ref()
  
  INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcb_d[l_ac].stcb008
   CALL ap_ref_array2(g_ref_fields,"SELECT stabl003 FROM stabl_t WHERE stablent='"||g_enterprise||"' AND stabl001=? AND stabl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcb_d[l_ac].stcb008_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcb_d[l_ac].stcb008_desc
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
PUBLIC FUNCTION astt601_stcb009_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stcb_d[l_ac].stcb009
   CALL ap_ref_array2(g_ref_fields,"SELECT stabl003 FROM stabl_t WHERE stablent='"||g_enterprise||"' AND stabl001=? AND stabl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stcb_d[l_ac].stcb009_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stcb_d[l_ac].stcb009_desc
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
PUBLIC FUNCTION astt601_stcb016_017_chk()
DEFINE l_n         LIKE type_t.num5
DEFINE l_staf004_stao017   LIKE staf_t.staf004
DEFINE l_staf004_stao018   LIKE staf_t.staf004

   #费用编号不为空的话 检查asti204是否设置日期为noentry
   IF NOT cl_null( g_stcb_d[l_ac].stcb002) THEN
      SELECT staf004 INTO l_staf004_stao017 FROM staf_t
       WHERE stafent = g_enterprise AND staf001 =  g_stcb_d[l_ac].stcb002 AND staf002 = g_stca_m.stca005
         AND staf003 = 'stao017'
   
      SELECT staf004 INTO l_staf004_stao018 FROM staf_t
       WHERE stafent = g_enterprise AND staf001 =   g_stcb_d[l_ac].stcb002 AND staf002 = g_stca_m.stca005
         AND staf003 = 'stao018'
         
      IF l_staf004_stao017 = 'N' AND l_staf004_stao017 = 'N' THEN
         RETURN TRUE
      END IF
   END IF
   
   LET l_n = 0
   IF g_stcb_d[l_ac].stcb016 < g_stca_m.stca017 OR g_stcb_d[l_ac].stcb016 > g_stca_m.stca018 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00032'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
   
      RETURN FALSE
   END IF
   
   IF g_stcb_d[l_ac].stcb017 < g_stca_m.stca017 OR g_stcb_d[l_ac].stcb017 > g_stca_m.stca018 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00032'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
   
      RETURN FALSE
   END IF
   
   IF NOT cl_null(g_stcb_d[l_ac].stcb016) AND NOT cl_null(g_stcb_d[l_ac].stcb017) THEN
      IF g_stcb_d[l_ac].stcb016 > g_stcb_d[l_ac].stcb017 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'aoo-00122'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
   
         RETURN FALSE
      END IF
   END IF
   
 
 # LET g_stcv003 = NULL
 # SELECT MAX(stcv003) INTO g_stcv003 FROM stcv_t
 #  WHERE stcvent = g_enterprise
 #    AND stcvdocno = g_stca_m.stcadocno
 #    AND stcv005 = 'Y'
 # #生效日期不可小于等于最大已结算的截止日期
 # IF NOT cl_null(g_stcv003) AND NOT cl_null(g_stcb_d[l_ac].stcb016) AND g_stcb_d[l_ac].stcb016 <> g_stcb_d_t.stcb016 THEN
 #    IF g_stcb_d[l_ac].stcb016 <= g_stcv003 THEN
 #       INITIALIZE g_errparam TO NULL
 #       LET g_errparam.code = 'ast-00147'
 #       LET g_errparam.extend = ''
 #       LET g_errparam.popup = TRUE
 #       CALL cl_err()
 #       
 #       RETURN FALSE
 #    END IF
 # END IF
 # #失效日期不可小于最大已结算的截止日期
 # IF NOT cl_null(g_stcv003) AND NOT cl_null(g_stcb_d[l_ac].stcb017) AND g_stcb_d[l_ac].stcb017 <> g_stcb_d_t.stcb017 THEN
 #    IF g_stcb_d[l_ac].stcb017 < g_stcv003 THEN
 #       INITIALIZE g_errparam TO NULL
 #       LET g_errparam.code = 'ast-00140'
 #       LET g_errparam.extend = ''
 #       LET g_errparam.popup = TRUE
 #       CALL cl_err()
 #       
 #       RETURN FALSE
 #    END IF
 # END IF
   
  ##先不控管，可能有两种做法，一种区间不可重复，一种另外记一笔用差价的方式
  ##同一費用編號,开始日期和截止日期不可重叠！
  #IF NOT cl_null(g_stcb_d[l_ac].stcb016) AND NOT cl_null(g_stcb_d[l_ac].stcb017) AND NOT cl_null(g_stcb_d[l_ac].stcbseq) AND NOT cl_null(g_stcb_d[l_ac].stcb002)THEN
  #  SELECT COUNT(*) INTO l_n FROM stcb_t 
  #   WHERE stcbent = g_enterprise
  #     AND stcbdocno = g_stca_m.stcadocno
  #     AND stcb002 = g_stcb_d[l_ac].stcb002
  #     AND stcbseq <> g_stcb_d[l_ac].stcbseq
  #     AND ((stcb016 between g_stcb_d[l_ac].stcb016 AND g_stcb_d[l_ac].stcb017)
  #      OR (stcb017 between g_stcb_d[l_ac].stcb016 AND g_stcb_d[l_ac].stcb017)
  #      OR (g_stcb_d[l_ac].stcb016 between stcb016 AND stcb017  )
  #      OR (g_stcb_d[l_ac].stcb017 between stcb016 AND stcb017  ))         
  #END IF      
  #IF l_n > 0 THEN
  #   INITIALIZE g_errparam TO NULL
  #   LET g_errparam.code = 'ast-00031'
  #   LET g_errparam.extend = ''
  #   LET g_errparam.popup = TRUE
  #   CALL cl_err()
  #
  #   RETURN FALSE
  #END IF
  
   CALL astt601_cal_nextd() RETURNING g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020
   
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
PUBLIC FUNCTION astt601_stca017_018_chk(p_cmd,p_field)
DEFINE p_cmd       LIKE type_t.chr1
DEFINE p_field     STRING
DEFINE l_cnt       LIKE type_t.num5
DEFINE l_stcw003   LIKE stcw_t.stcw003

   #判断生效日期不可大于失效日期
   IF NOT cl_null(g_stca_m.stca017) AND NOT cl_null(g_stca_m.stca018) THEN
      IF g_stca_m.stca017 >g_stca_m.stca018 THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = 'aoo-00122'
          LET g_errparam.extend = ''
          LET g_errparam.popup = TRUE
          CALL cl_err()

          RETURN FALSE
      END IF
   END IF
   
   #判断生效日期，不可大于单身的生效日期
   IF p_field = 'stca017' THEN
      LET l_cnt = 0
      SELECT COUNT(*) INTO l_cnt
        FROM stcb_t
       WHERE stcbent = g_enterprise
         AND stcbdocno = g_stca_m.stcadocno
         AND stcb016 < g_stca_m.stca017
         
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
   IF p_field = 'stca018' THEN
      LET l_cnt = 0
      SELECT COUNT(*) INTO l_cnt
        FROM stcb_t
       WHERE stcbent = g_enterprise
         AND stcbdocno = g_stca_m.stcadocno
         AND stcb017 > g_stca_m.stca018
      IF l_cnt > 0 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00032'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
   
         RETURN FALSE
      END IF
   END IF
   
   #U修改合同时，判断失效日期，不可小于最小已结算帐期的截止日期
   LET l_stcw003 = NULL
   IF g_stca_m.stca000 = 'U' AND NOT cl_null( g_stca_m.stca001) THEN
      SELECT stcw003 INTO l_stcw003 FROM stcw_t 
       WHERE stcwent = g_enterprise AND stcw001 = g_stca_m.stca001 
         AND stcwseq = ( SELECT MAX(stcwseq) FROM stcw_t
                          WHERE stcwent = g_enterprise AND stcw001 = g_stca_m.stca001
                            AND stcw005 = 'Y' )
      IF SQLCA.sqlcode = 100 THEN LET l_stcw003 = NULL END IF
      IF g_stca_m.stca018 < l_stcw003 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00140'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN FALSE
      END IF
   END IF
   
   #如果生效/失效日期/结算方式有修改，自动算下次计算日（网点为NULL时）
   IF cl_null(g_stca_m.stca010) THEN
      IF NOT cl_null(g_stca_m.stca017) AND NOT cl_NULL(g_stca_m.stca018) AND NOT cl_null(g_stca_m.stca006) THEN
         IF cl_null(g_stca_m_o.stca017) OR 
            g_stca_m.stca017 <> g_stca_m_o.stca017 OR g_stca_m.stca018 <> g_stca_m_o.stca018 OR
            g_stca_m.stca006 <> g_stca_m_o.stca006 THEN
            IF NOT cl_null(l_stcw003) THEN #表示已经有结算，已结算部分的帐期不可以异动
               LET g_stca_m.next_b = astt601_get_nextdate(g_stca_m.stca006,l_stcw003+1,g_stca_m.stca018)
            ELSE
               LET g_stca_m.next_b = astt601_get_nextdate(g_stca_m.stca006,g_stca_m.stca017,g_stca_m.stca018)
            END IF
         END IF
         DISPLAY g_stca_m.next_b TO next_b
         LET g_stca_m_o.stca017 = g_stca_m.stca017
         LET g_stca_m_o.stca018 = g_stca_m.stca018
         LET g_stca_m_o.stca006 = g_stca_m.stca006
      END IF
   ELSE
      #网点不为空，对网点的合同，不设置帐期
      LET g_stca_m.next_b = NULL
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
PUBLIC FUNCTION astt601_stcasite_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stcasite
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stca_m.stcasite_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stcasite_desc
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
PUBLIC FUNCTION astt601_init_required(p_cmd)
DEFINE p_cmd   LIKE type_t.chr1
   #CALL cl_set_comp_required("stcb004,stcb005,stcb006,stcb007,stcb008,stcb009,stcb010,stcb012,stcb015,stcb016,stcb017",TRUE)   #160613-00026#1 160619 by sakura mark
   CALL cl_set_comp_required("stcb005,stcb006,stcb007,stcb008,stcb009,stcb010,stcb012,stcb015,stcb016,stcb017",TRUE)            #160613-00026#1 160619 by sakura add 
   CALL cl_set_comp_required("stcb003,stcb011,stcb013,stcb014",FALSE)
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
PUBLIC FUNCTION astt601_interval_chk(p_cmd)
DEFINE l_n       LIKE type_t.num5
DEFINE p_cmd     LIKE type_t.chr1

  IF g_stca_m.stca000 = 'I' AND (p_cmd = 'a' OR  p_cmd = 'r' ) THEN
    IF NOT cl_null(g_stca_m.stca010) THEN
       SELECT COUNT(*) INTO l_n FROM stce_t
        WHERE stceent = g_enterprise AND stce005 = g_stca_m.stca005 
          AND stce009 = g_stca_m.stca009 AND stce010 = g_stca_m.stca010
          AND stce006 = g_stca_m.stca006
          AND (stce017 BETWEEN g_stca_m.stca017 AND g_stca_m.stca018
               OR stce018 BETWEEN g_stca_m.stca017 AND g_stca_m.stca018
               OR g_stca_m.stca017 BETWEEN stce017 AND stce018
               OR g_stca_m.stca018 BETWEEN stce017 AND stce018)
          AND stcestus = 'Y'
    ELSE
       SELECT COUNT(*) INTO l_n FROM stce_t
        WHERE stceent = g_enterprise AND stce005 = g_stca_m.stca005 
          AND stce009 = g_stca_m.stca009  AND stce010 IS NULL
          AND stce006 = g_stca_m.stca006
          AND (stce017 BETWEEN g_stca_m.stca017 AND g_stca_m.stca018
               OR stce018 BETWEEN g_stca_m.stca017 AND g_stca_m.stca018
               OR g_stca_m.stca017 BETWEEN stce017 AND stce018
               OR g_stca_m.stca018 BETWEEN stce017 AND stce018)
          AND stcestus = 'Y'
    END IF
    
  ELSE
     IF NOT cl_null(g_stca_m.stca010) THEN
        SELECT COUNT(*) INTO l_n FROM stce_t
         WHERE stceent = g_enterprise AND stce005 = g_stca_m.stca005 
           AND stce009 = g_stca_m.stca009 AND stce010 = g_stca_m.stca010 
           AND stce006 = g_stca_m.stca006
           AND (stce017 BETWEEN g_stca_m.stca017 AND g_stca_m.stca018
                OR stce018 BETWEEN g_stca_m.stca017 AND g_stca_m.stca018
                OR g_stca_m.stca017 BETWEEN stce017 AND stce018
                OR g_stca_m.stca018 BETWEEN stce017 AND stce018)
           AND stce001 <>  g_stca_m.stca001
           AND stcestus = 'Y'
     ELSE
         SELECT COUNT(*) INTO l_n FROM stce_t
         WHERE stceent = g_enterprise AND stce005 = g_stca_m.stca005 
           AND stce009 = g_stca_m.stca009 AND stce010 IS NULL 
           AND stce006 = g_stca_m.stca006
           AND (stce017 BETWEEN g_stca_m.stca017 AND g_stca_m.stca018
                OR stce018 BETWEEN g_stca_m.stca017 AND g_stca_m.stca018
                OR g_stca_m.stca017 BETWEEN stce017 AND stce018
                OR g_stca_m.stca018 BETWEEN stce017 AND stce018)
           AND stce001 <>  g_stca_m.stca001
           AND stcestus = 'Y'  
     END IF
  END IF
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00050'
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
PUBLIC FUNCTION astt601_init_entry(p_cmd)
DEFINE p_cmd   LIKE type_t.chr1

   CALL cl_set_comp_entry("stcb003,stcb004,stcb005,stcb006,stcb007,stcb008,stcb009,stcb010,stcb011,stcb012,stcb013,stcb014,stcb015,stcb016,stcb017",TRUE)
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
PUBLIC FUNCTION astt601_stca010_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stca010
   CALL ap_ref_array2(g_ref_fields,"SELECT pmaal004 FROM pmaal_t WHERE pmaalent='"||g_enterprise||"' AND pmaal001=? AND pmaal002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stca_m.stca010_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stca010_desc
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
PUBLIC FUNCTION astt601_stca016_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stca016
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stca_m.stca016_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stca016_desc
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
PUBLIC FUNCTION astt601_stca011_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stca011
   CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '281' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stca_m.stca011_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stca011_desc
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
PUBLIC FUNCTION astt601_stca012_ref()
  #   INITIALIZE g_ref_fields TO NULL
  # LET g_ref_fields[1] = g_stca_m.stca012
  # CALL ap_ref_array2(g_ref_fields,"SELECT oocql004 FROM oocql_t WHERE oocqlent='"||g_enterprise||"' AND oocql001 = '2035' AND oocql002=? AND oocql003='"||g_dlang||"'","") RETURNING g_rtn_fields
  # LET g_stca_m.stca012_desc = '', g_rtn_fields[1] , ''
  # DISPLAY BY NAME g_stca_m.stca012_desc
   CALL s_desc_get_oojdl003_desc(g_stca_m.stca012) RETURNING g_stca_m.stca012_desc
   DISPLAY BY NAME g_stca_m.stca012_desc
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
PUBLIC FUNCTION astt601_stca026_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stca026
   CALL ap_ref_array2(g_ref_fields,"SELECT ooefl003 FROM ooefl_t WHERE ooeflent='"||g_enterprise||"' AND ooefl001=? AND ooefl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stca_m.stca026_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stca026_desc

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
PUBLIC FUNCTION astt601_stca009_stca010_chk(p_stca009,p_stca010)
DEFINE p_stca009 LIKE stca_t.stca009
DEFINE p_stca010 LIKE stca_t.stca010
DEFINE l_n       LIKE type_t.num5

  SELECT COUNT(*) INTO l_n FROM pmaa_t 
   WHERE pmaaent = g_enterprise AND pmaa001 = p_stca010 AND pmaa006 = p_stca009
  
  IF l_n =0 THEN
     INITIALIZE g_errparam TO NULL
     LET g_errparam.code = 'ast-00043'
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
PUBLIC FUNCTION astt601_stca010_chk(p_stca010)
DEFINE p_stca010 LIKE stca_t.stca010

   INITIALIZE g_chkparam.* TO NULL
   LET g_errshow = '1'
   LET g_chkparam.arg1 = p_stca010
   #160318-00025#38  2016/04/20  by pengxin  add(S)
   LET g_errshow = TRUE #是否開窗 
   LET g_chkparam.err_str[1] = "adb-00285:sub-01302|adbm201|",cl_get_progname("adbm201",g_lang,"2"),"|:EXEPROGadbm201"
   #160318-00025#38  2016/04/20  by pengxin  add(E)
   IF NOT cl_chk_exist("v_pmaa001_21") THEN
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
PUBLIC FUNCTION astt601_stca026_chk(p_stca026)
DEFINE p_stca026  LIKE stca_t.stca026

  
  INITIALIZE g_chkparam.* TO NULL
  LET g_errshow = '1'
  LET g_chkparam.arg1 = p_stca026
 #LET g_chkparam.arg2 = '2'
  IF NOT cl_chk_exist("v_ooef001_20") THEN
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
PUBLIC FUNCTION astt601_stca009_other()
   
    SELECT pmaa090,pmaa231 INTO g_stca_m.stca011,g_stca_m.stca012 FROM pmaa_t
     WHERE pmaaent = g_enterprise AND pmaa001 = g_stca_m.stca009
    DISPLAY BY NAME  g_stca_m.stca011,g_stca_m.stca012 
    CALL astt601_stca011_ref()
    CALL astt601_stca012_ref()
       
   LET t_stca.* = g_stca_m.*
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
PUBLIC FUNCTION astt601_stca027_other()
   SELECT stce006,stce021,stce022,stce023,stce024,stce028,stce025,stce026,stce017,stce018 INTO 
     g_stca_m.stca006,g_stca_m.stca021, g_stca_m.stca022, g_stca_m.stca023, g_stca_m.stca024,g_stca_m.stca028, g_stca_m.stca025, g_stca_m.stca026,g_stca_m.stca017, g_stca_m.stca018
   FROM stce_t WHERE stceent=g_enterprise AND stce001 = g_stca_m.stca027
   CALL astt601_stca021_ref()
   CALL astt601_stca022_ref()
   CALL astt601_stca024_ref()
   CALL astt601_stca028_ref()
   CALL astt601_stca025_ref()
   CALL astt601_stca026_ref()
   DISPLAY BY NAME g_stca_m.stca006,g_stca_m.stca021, g_stca_m.stca022, g_stca_m.stca023, g_stca_m.stca024,g_stca_m.stca028, g_stca_m.stca025, g_stca_m.stca026,g_stca_m.stca017, g_stca_m.stca018
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
PUBLIC FUNCTION astt601_stca027_chk()
DEFINE l_n    LIKE type_t.num5
DEFINE l_stce005 LIKE stce_t.stce005
DEFINE l_stce009 LIKE stce_t.stce009

    SELECT COUNT(*) INTO l_n FROM stce_t
     WHERE stceent = g_enterprise AND stce001 = g_stca_m.stca027 AND stcestus = 'Y'
   IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00113'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
   END IF
   

   SELECT COUNT(*) INTO l_n FROM stce_t
     WHERE stceent = g_enterprise AND stce001 = g_stca_m.stca027 AND stce008 = '2' AND stcestus = 'Y'
   IF l_n > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00132'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN FALSE
   ELSE
      SELECT stce005,stce009 INTO l_stce005,l_stce009 FROM stce_t
       WHERE stceent = g_enterprise AND stce001 =  g_stca_m.stca027
      IF l_stce005 <> g_stca_m.stca005 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00118'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN FALSE
      END IF
       IF l_stce009 <> g_stca_m.stca009 THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00128'
         LET g_errparam.extend = ''
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
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astt601_set_visible()
   IF g_stca_m.stca008 = '2' OR NOT cl_null(g_stca_m.stca010) THEN
      CALL cl_set_comp_visible("next_b,page_period",FALSE)
   ELSE
      CALL cl_set_comp_visible("next_b,page_period",TRUE)
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
PUBLIC FUNCTION astt601_convert(p_stcf003)
DEFINE p_stcf003   LIKE stcf_t.stcf003
DEFINE l_num       LIKE type_t.num5
DEFINE l_str       STRING

   LET l_str = p_stcf003
   LET l_str = l_str.subString(5,7)
   LET l_num = l_str-1   
   LET l_str = l_num USING "&&&"
   LET l_str = p_stcf003[1,4]||l_str
   
   RETURN l_str
END FUNCTION

################################################################################
# Descriptions...: 根据结算方式计算下次计算日
# Memo...........:
# Usage..........: CALL astt601_get_nextdate(p_stca006,p_date1,p_date2)
#                  RETURNING r_nextdate 下次计算日
# Input parameter: p_stca006      结算方式
#                : p_date1        开始日期
#                : p_date2        截止日期
# Return code....: r_success      TRUE/FALSE
#                : r_nextdate     下次计算日
# Date & Author..: 20140804 By shiwy
# Modify.........:
################################################################################
PUBLIC FUNCTION astt601_get_nextdate(p_stca006,p_date1,p_date2)
DEFINE p_stca006   LIKE stca_t.stca006
DEFINE p_date1     LIKE stca_t.stca017
DEFINE p_date2     LIKE stca_t.stca018
DEFINE r_nextdate  LIKE stca_t.stca017
DEFINE l_staa002   LIKE staa_t.staa002
DEFINE l_staa003   LIKE staa_t.staa003
DEFINE l_staa004   LIKE staa_t.staa004
DEFINE l_date      LIKE type_t.dat

   IF cl_null(p_stca006) OR cl_null(p_date1) OR cl_null(p_date2) THEN
      RETURN ''
   END IF
   
   SELECT staa002,staa003,staa004 INTO l_staa002,l_staa003,l_staa004
     FROM staa_t
    WHERE staa001 = p_stca006
          AND staaent=g_enterprise  #160905-00007#17 add
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
# Descriptions...: 计算帐期
# Memo...........:
# Usage..........: CALL astt601_upd_stcv(p_cmd)
#                  RETURNING TRUE/FALSE
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astt601_upd_stcv(p_cmd)
DEFINE p_cmd       LIKE type_t.chr1
DEFINE r_success   LIKE type_t.num5
DEFINE l_cnt       LIKE type_t.num5
DEFINE l_stce006   LIKE stce_t.stce006
DEFINE l_stce017   LIKE stce_t.stce017
DEFINE l_stce018   LIKE stce_t.stce018
DEFINE l_stcw004   LIKE stcw_t.stcw004

   LET r_success = TRUE
   #如果结算方式、生失效日期、下次计算日有异动才提示是否删除为结算帐期，重新产生帐期
   IF p_cmd = 'a' AND g_stca_m.stca000 = 'U' THEN
      SELECT stce006,stce017,stce018 INTO l_stce006,l_stce017,l_stce018
       FROM stce_t
      WHERE stceent = g_enterprise
        AND stce001 = g_stca_m.stca001
      SELECT MIN(stcw004) INTO l_stcw004 FROM stcw_t
       WHERE stcwent = g_enterprise
         AND stcw001 = g_stca_m.stca001
         AND stcw005 = 'N'
      IF g_stca_m.stca006 <> l_stce006 OR g_stca_m.stca017 <> l_stce017 OR 
         g_stca_m.stca018 <> l_stce018 OR g_stca_m.next_b <> l_stcw004 THEN
         IF NOT cl_ask_confirm('ast-00146') THEN
            LET r_success = FALSE
         END IF
      ELSE
         #没有变，不用更新单身帐期
         RETURN TRUE
      END IF
   END IF
   
   IF p_cmd = 'u'  THEN
      IF g_stca_m.stca006 <> g_stca_m_t.stca006 OR g_stca_m.stca017 <> g_stca_m_t.stca017 OR 
         g_stca_m.stca018 <> g_stca_m_t.stca018 OR g_stca_m.next_b <> g_stca_m_t.next_b THEN
         LET l_cnt = 0
         SELECT COUNT(*) INTO l_cnt FROM stcv_t
          WHERE stcvent = g_enterprise AND stcvdocno = g_stca_m.stcadocno
            AND stcv005 = 'Y'
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
      IF NOT s_astt601_cal_period(g_stca_m.stcadocno,g_stca_m.stca001,g_stca_m.stca017,g_stca_m.stca018,g_stca_m.stca006,g_stca_m.next_b,g_stca_m.stcasite,g_stca_m.stcaunit) THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'ast-00049'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
      END IF
   END IF
   
   IF r_success = FALSE THEN
      IF p_cmd = 'a' AND g_stca_m.stca000 = 'U' THEN
         LET g_stca_m.stca006 = l_stce006
         LET g_stca_m.stca017 = l_stce017
         LET g_stca_m.stca018 = l_stce018
         LET g_stca_m.next_b = l_stcw004
      ELSE
         LET g_stca_m.stca006 = g_stca_m_t.stca006
         LET g_stca_m.stca017 = g_stca_m_t.stca017
         LET g_stca_m.stca018 = g_stca_m_t.stca018
         LET g_stca_m.next_b = g_stca_m_t.next_b
      END IF
   ELSE
      CALL astt601_b_fill()
   END IF
   DISPLAY BY NAME g_stca_m.stca006,g_stca_m.stca017,g_stca_m.stca018,g_stca_m.next_b
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
PUBLIC FUNCTION astt601_cal_nextd()
DEFINE p_stcf006   LIKE stcf_t.stcf006
DEFINE p_stcf007   LIKE stcf_t.stcf007
DEFINE p_stcf016   LIKE stcf_t.stcf016
DEFINE p_stcf017   LIKE stcf_t.stcf017
DEFINE p_begin     LIKE type_t.dat
DEFINE p_end       LIKE type_t.dat
DEFINE r_nextd     LIKE type_t.dat
DEFINE r_begin     LIKE type_t.dat
DEFINE r_end       LIKE type_t.dat
DEFINE l_stcb019   LIKE stcb_t.stcb019

  # #计算下次计算日stcb018，下次费用开始日stcb019和下次费用截止日stcb020
  # IF NOT cl_null(g_stcb_d[l_ac].stcb005) AND NOT cl_null(g_stcb_d[l_ac].stcb006) AND NOT cl_null(g_stcb_d[l_ac].stcb007) AND NOT cl_null(g_stcb_d[l_ac].stcb016) AND NOT cl_null(g_stcb_d[l_ac].stcb017) THEN
  #    #如果是U:修改，已有部分费用已结算，且修改了失效日期
  #    IF g_stca_m.stca000 = 'U' AND g_stcv003 >= g_stcb_d[l_ac].stcb016 THEN
  #       #如果失效日期修改为最大的已结算日期，表示这个费用已全部结算
  #       IF g_stcb_d[l_ac].stcb017 = g_stcv003 THEN
  #          LET g_stcb_d[l_ac].stcb018 = NULL
  #          LET g_stcb_d[l_ac].stcb019 = NULL
  #          LET g_stcb_d[l_ac].stcb020 = NULL
  #          RETURN g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020
  #       END IF
  #       #否则stb017 > 已结算的最大日期，从g_stcv003+1开始算下次计算日
  #       IF g_stcb_d[l_ac].stcb017 <> g_stcb_d_t.stcb017 OR g_stcb_d[l_ac].stcb005 <> g_stcb_d_t.stcb005 OR 
  #          g_stcb_d[l_ac].stcb006 <> g_stcb_d_t.stcb006 OR g_stcb_d[l_ac].stcb007 <> g_stcb_d_t.stcb007 THEN
  #          IF g_stcb_d[l_ac].stcb005 = '1' THEN
  #             CALL s_astm601_cal_nextd(g_stcb_d[l_ac].stcb006,g_stcb_d[l_ac].stcb007,g_stcv003+1,g_stcb_d[l_ac].stcb017,'','')
  #             RETURNING g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020
  #          ELSE
  #             LET g_stcb_d[l_ac].stcb018 = g_stcv003+1
  #             LET g_stcb_d[l_ac].stcb019 = g_stcv003+1
  #             LET g_stcb_d[l_ac].stcb020 = g_stcb_d[l_ac].stcb017
  #          END IF
  #       ELSE
  #          LET g_stcb_d[l_ac].stcb018 = g_stcb_d_t.stcb018
  #          LET g_stcb_d[l_ac].stcb019 = g_stcb_d_t.stcb019
  #          LET g_stcb_d[l_ac].stcb020 = g_stcb_d_t.stcb020
  #       END IF
  #    ELSE
  #    #否则正常计算下次计算日、下次费用开始日stcb019和下次费用截止日stcb020
  #       CALL s_astm601_cal_nextd(g_stcb_d[l_ac].stcb006,g_stcb_d[l_ac].stcb007,g_stcb_d[l_ac].stcb016,g_stcb_d[l_ac].stcb017,'','')
  #          RETURNING g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020
  #    END IF
  # ELSE
  #    RETURN '','',''
  # END IF
  
  IF NOT cl_null(g_stcb_d[l_ac].stcb005) AND NOT cl_null(g_stcb_d[l_ac].stcb006) AND NOT cl_null(g_stcb_d[l_ac].stcb007) AND NOT cl_null(g_stcb_d[l_ac].stcb016) AND NOT cl_null(g_stcb_d[l_ac].stcb017) THEN
     #如果是U:修改，已有部分费用已结算，且修改了失效日期
     IF astt601_chk_astm601_jiesuan(g_stcb_d[l_ac].stcbseq) THEN
        IF astt601_chk_astm601_jiesuan_end(g_stcb_d[l_ac].stcbseq) THEN
           LET g_stcb_d[l_ac].stcb018 = NULL
           LET g_stcb_d[l_ac].stcb019 = NULL
           LET g_stcb_d[l_ac].stcb020 = NULL
           RETURN g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020
        ELSE
           IF g_stcb_d[l_ac].stcb017 = g_stcb_d[l_ac].stcb019 - 1 THEN
              LET g_stcb_d[l_ac].stcb018 = NULL
              LET g_stcb_d[l_ac].stcb019 = NULL
              LET g_stcb_d[l_ac].stcb020 = NULL
              RETURN g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020
           END IF           
        END IF
        IF g_stcb_d[l_ac].stcb017 <> g_stcb_d_t.stcb017 OR g_stcb_d[l_ac].stcb005 <> g_stcb_d_t.stcb005 OR 
           g_stcb_d[l_ac].stcb006 <> g_stcb_d_t.stcb006 OR g_stcb_d[l_ac].stcb007 <> g_stcb_d_t.stcb007 THEN
           
              IF cl_null(g_stcb_d_t.stcb019) THEN
                 LET l_stcb019 = g_stcb_d_t.stcb017+1
              ELSE
                 LET l_stcb019 =  g_stcb_d_t.stcb019
              END IF
              CALL s_astm601_cal_nextd(g_stcb_d[l_ac].stcb006,g_stcb_d[l_ac].stcb007,g_stcb_d[l_ac].stcb016,g_stcb_d[l_ac].stcb017,l_stcb019,'')
                   RETURNING g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020   
        ELSE
           LET g_stcb_d[l_ac].stcb018 = g_stcb_d_t.stcb018
           LET g_stcb_d[l_ac].stcb019 = g_stcb_d_t.stcb019
           LET g_stcb_d[l_ac].stcb020 = g_stcb_d_t.stcb020
        END IF
      ELSE
      #否则正常计算下次计算日、下次费用开始日stcb019和下次费用截止日stcb020
         CALL s_astm601_cal_nextd(g_stcb_d[l_ac].stcb006,g_stcb_d[l_ac].stcb007,g_stcb_d[l_ac].stcb016,g_stcb_d[l_ac].stcb017,'','')
            RETURNING g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020
      END IF   
  ELSE
      RETURN '','',''
  END IF
  
   RETURN g_stcb_d[l_ac].stcb018,g_stcb_d[l_ac].stcb019,g_stcb_d[l_ac].stcb020
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
PUBLIC FUNCTION astt601_stca023_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stca023
   CALL ap_ref_array2(g_ref_fields,"SELECT ooibl004 FROM ooibl_t WHERE ooiblent='"||g_enterprise||"' AND ooibl002=? AND ooibl003='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stca_m.stca023_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stca023_desc
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
PUBLIC FUNCTION astt601_clear()
DEFINE l_stca   type_g_stca_m

   LET l_stca.* = g_stca_m.*  
   INITIALIZE g_stca_m.* TO NULL
   LET g_stca_m_o.stca001 = ''

   LET g_stca_m.stcasite = g_site
   CALL astt601_stcasite_ref()
   LET g_stca_m.stcaunit = g_site
   LET g_stca_m.stcadocdt = l_stca.stcadocdt
   LET g_stca_m.stcadocno = l_stca.stcadocno
   LET g_stca_m.stca000 = l_stca.stca000
   LET g_stca_m.stcaownid = g_user
   LET g_stca_m.stcaowndp = g_dept
   LET g_stca_m.stcacrtid = g_user
   LET g_stca_m.stcacrtdp = g_dept 
   LET g_stca_m.stcacrtdt = cl_get_current()
   LET g_stca_m.stcamodid = ""
   LET g_stca_m.stcamoddt = ""
   LET g_stca_m.stcastus = "N" 
   IF g_stca_m.stca000 = 'I' THEN
      LET g_stca_m.stca002 = 1
      LET g_stca_m.stca005 = "11"
      LET g_stca_m.stca013 = cl_get_current()
      SELECT ooef017 INTO g_stca_m.stca014 FROM ooef_t WHERE ooefent = g_enterprise AND ooef001 = g_stca_m.stcasite
      CALL astt601_stca014_ref()
      LET g_stca_m.stca008 = '1'
      LET g_stca_m.stcaacti = 'Y'
      LET g_stca_m.stca015 = g_user
      CALL astt601_stca015_ref()
      LET g_stca_m.stca016 = g_dept
      CALL astt601_stca016_ref()  
   END IF
   
   CLEAR FORM
   CALL g_stcb_d.clear()
   CALL g_stcb2_d.clear()  
   CALL g_stcc_d.clear() 
   CALL g_stcv_d.clear() 
   CALL g_stct_d.clear()     #160513-00033#7    
   CALL g_stck_d.clear()     #160513-00033#7    
   DELETE FROM stcb_t WHERE stcbent = g_enterprise AND stcbdocno = l_stca.stcadocno
   DELETE FROM stcc_t WHERE stccent = g_enterprise AND stccdocno = l_stca.stcadocno
   DELETE FROM stcd_t WHERE stcdent = g_enterprise AND stcddocno = l_stca.stcadocno
   DELETE FROM stcv_t WHERE stcvent = g_enterprise AND stcvdocno = l_stca.stcadocno 
   DELETE FROM stct_t WHERE stctent = g_enterprise AND stctdocno = l_stca.stcadocno    #160513-00033#7  
   DELETE FROM stck_t WHERE stckent = g_enterprise AND stckdocno = l_stca.stcadocno    #160513-00033#7  
   LET g_bfill = 'N'   
   CALL astt601_show()
   LET g_bfill = 'Y'
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
PUBLIC FUNCTION astt601_stcb005_chk(p_ac)
DEFINE p_ac  LIKE type_t.num5
DEFINE l_n   LIKE type_t.num5
DEFINE r_ac  LIKE type_t.num5
  #160613-00026#1 160619 by sakura mark(S)
  #IF p_ac > 0 THEN     #检查单笔
  #   IF NOT cl_null(g_stca_m.stca010) AND g_stcb_d[l_ac].stcb005 <> '2' THEN
  #       INITIALIZE g_errparam TO NULL
  #       LET g_errparam.code = 'ast-00191'
  #       LET g_errparam.extend = ''
  #       LET g_errparam.popup = TRUE
  #       CALL cl_err()
  #       LET r_ac = p_ac
  #       RETURN FALSE,r_ac
  #   END IF
  #ELSE                  #检查单身多笔
  #160613-00026#1 160619 by sakura mark(E)
     IF g_stcb_d.getLength() > 0 THEN
        FOR l_n = 1 TO g_stcb_d.getLength()
            IF NOT cl_null(g_stca_m.stca010) AND  g_stcb_d[l_n].stcb005 <> '2' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'ast-00191'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET r_ac = l_n
               RETURN FALSE,r_ac
            END IF
        END FOR
        #160613-00026#1 160619 by sakura add(S)
        LET l_n = l_n -1
        IF cl_null(g_stcb_d[g_stcb_d.getLength()].stcbseq) THEN 
           CALL g_stcb_d.deleteElement(g_stcb_d.getLength())
        END IF
        #160613-00026#1 160619 by sakura add(E)
     END IF    
  #END IF  #160613-00026#1 160619 by sakura mark(E)
  RETURN TRUE,''
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
PUBLIC FUNCTION astt601_chk_astm601_jiesuan(p_stcbseq)
DEFINE p_stcbseq    LIKE stcb_t.stcbseq
#DEFINE l_stcf  RECORD LIKE stcf_t.*  #161111-00028#3--mark
#161111-00028#3---add----begin-----------
DEFINE l_stcf RECORD  #分銷合約費用設定主檔
       stcfent LIKE stcf_t.stcfent, #企業編號
       stcfsite LIKE stcf_t.stcfsite, #營運據點
       stcfunit LIKE stcf_t.stcfunit, #應用組織
       stcfseq LIKE stcf_t.stcfseq, #項次
       stcf001 LIKE stcf_t.stcf001, #合約編號
       stcf002 LIKE stcf_t.stcf002, #費用編號
       stcf003 LIKE stcf_t.stcf003, #會計期間
       stcf004 LIKE stcf_t.stcf004, #價款類別
       stcf005 LIKE stcf_t.stcf005, #計算類型
       stcf006 LIKE stcf_t.stcf006, #費用週期
       stcf007 LIKE stcf_t.stcf007, #費用週期方式
       stcf008 LIKE stcf_t.stcf008, #條件基準
       stcf009 LIKE stcf_t.stcf009, #計算基準
       stcf010 LIKE stcf_t.stcf010, #費用淨額
       stcf011 LIKE stcf_t.stcf011, #費用比率
       stcf012 LIKE stcf_t.stcf012, #保底否
       stcf013 LIKE stcf_t.stcf013, #保底金額
       stcf014 LIKE stcf_t.stcf014, #保底扣率
       stcf015 LIKE stcf_t.stcf015, #分量扣點
       stcf016 LIKE stcf_t.stcf016, #生效日期
       stcf017 LIKE stcf_t.stcf017, #失效日期
       stcf018 LIKE stcf_t.stcf018, #下次計算日
       stcf019 LIKE stcf_t.stcf019, #下次計算開始日
       stcf020 LIKE stcf_t.stcf020, #下次計算截止日
       stcf021 LIKE stcf_t.stcf021  #是否參與現金折扣
END RECORD
#161111-00028#3---add---end--------------


   INITIALIZE l_stcf.* TO NULL
   
   IF g_stca_m.stca000 = 'U' THEN
      
     #161111-00028#3---modify---begin--------------
       #SELECT * INTO l_stcf.* 
        SELECT stcfent,stcfsite,stcfunit,stcfseq,stcf001,stcf002,stcf003,stcf004,stcf005,stcf006,
               stcf007,stcf008,stcf009,stcf010,stcf011,stcf012,stcf013,stcf014,stcf015,stcf016,
               stcf017,stcf018,stcf019,stcf020,stcf021 INTO l_stcf.* 
       #161111-00028#3---modify---end-------------- 
      FROM stcf_t
       WHERE stcfent = g_enterprise AND stcf001 = g_stca_m.stca001 AND stcfseq = p_stcbseq
     
      IF NOT cl_null(l_stcf.stcf016) AND NOT cl_null(l_stcf.stcf019) THEN       
         #看astm601有结算与否
         IF l_stcf.stcf016 = l_stcf.stcf019 THEN
            #未结算
            RETURN FALSE         
         ELSE   
            #有结算
            RETURN TRUE
         END IF
      ELSE 
         IF NOT cl_null(l_stcf.stcf016) AND cl_null(l_stcf.stcf019) THEN        
            #有结算
            RETURN TRUE 
         ELSE
             #未结算
            RETURN FALSE  
         END IF         
      END IF

   ELSE
      RETURN FALSE   
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
PUBLIC FUNCTION astt601_chk_astm601_jiesuan_end(p_stcbseq)
DEFINE p_stcbseq    LIKE stcb_t.stcbseq
#DEFINE l_stcf  RECORD LIKE stcf_t.*  #161111-00028#3--mark
#161111-00028#3---add----begin-----------
DEFINE l_stcf RECORD  #分銷合約費用設定主檔
       stcfent LIKE stcf_t.stcfent, #企業編號
       stcfsite LIKE stcf_t.stcfsite, #營運據點
       stcfunit LIKE stcf_t.stcfunit, #應用組織
       stcfseq LIKE stcf_t.stcfseq, #項次
       stcf001 LIKE stcf_t.stcf001, #合約編號
       stcf002 LIKE stcf_t.stcf002, #費用編號
       stcf003 LIKE stcf_t.stcf003, #會計期間
       stcf004 LIKE stcf_t.stcf004, #價款類別
       stcf005 LIKE stcf_t.stcf005, #計算類型
       stcf006 LIKE stcf_t.stcf006, #費用週期
       stcf007 LIKE stcf_t.stcf007, #費用週期方式
       stcf008 LIKE stcf_t.stcf008, #條件基準
       stcf009 LIKE stcf_t.stcf009, #計算基準
       stcf010 LIKE stcf_t.stcf010, #費用淨額
       stcf011 LIKE stcf_t.stcf011, #費用比率
       stcf012 LIKE stcf_t.stcf012, #保底否
       stcf013 LIKE stcf_t.stcf013, #保底金額
       stcf014 LIKE stcf_t.stcf014, #保底扣率
       stcf015 LIKE stcf_t.stcf015, #分量扣點
       stcf016 LIKE stcf_t.stcf016, #生效日期
       stcf017 LIKE stcf_t.stcf017, #失效日期
       stcf018 LIKE stcf_t.stcf018, #下次計算日
       stcf019 LIKE stcf_t.stcf019, #下次計算開始日
       stcf020 LIKE stcf_t.stcf020, #下次計算截止日
       stcf021 LIKE stcf_t.stcf021  #是否參與現金折扣
END RECORD
#161111-00028#3---add---end--------------


   INITIALIZE l_stcf.* TO NULL
    
   IF astt601_chk_astm601_jiesuan(p_stcbseq) THEN    
      #161111-00028#3---modify---begin--------------
       #SELECT * INTO l_stcf.* 
        SELECT stcfent,stcfsite,stcfunit,stcfseq,stcf001,stcf002,stcf003,stcf004,stcf005,stcf006,
               stcf007,stcf008,stcf009,stcf010,stcf011,stcf012,stcf013,stcf014,stcf015,stcf016,
               stcf017,stcf018,stcf019,stcf020,stcf021 INTO l_stcf.* 
       #161111-00028#3---modify---end--------------
      FROM stcf_t
       WHERE stcfent = g_enterprise AND stcf001 = g_stca_m.stca001 AND stcfseq = p_stcbseq
     
      #看astm601有结算完毕
      IF cl_null(l_stcf.stcf019) AND cl_null(l_stcf.stcf020) THEN
         #结算完毕
         RETURN TRUE         
      ELSE   
         #未结算完
         RETURN FALSE
      END IF
   ELSE
      RETURN FALSE  
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
PUBLIC FUNCTION astt601_chk_b()
DEFINE i  LIKE type_t.num5
#DEFINE l_stcf  RECORD LIKE stcf_t.*  #161111-00028#3--mark
#DEFINE l_stcb  RECORD LIKE stcb_t.*  #161111-00028#3--mark
#161111-00028#3---add----begin-----------
DEFINE l_stcb RECORD  #分銷合約申請費用設定表
       stcbent LIKE stcb_t.stcbent, #企業編號
       stcbsite LIKE stcb_t.stcbsite, #營運據點
       stcbunit LIKE stcb_t.stcbunit, #應用組織
       stcbdocno LIKE stcb_t.stcbdocno, #單據編號
       stcbseq LIKE stcb_t.stcbseq, #項次
       stcb001 LIKE stcb_t.stcb001, #合約編號
       stcb002 LIKE stcb_t.stcb002, #費用編號
       stcb003 LIKE stcb_t.stcb003, #會計期間
       stcb004 LIKE stcb_t.stcb004, #價款類別
       stcb005 LIKE stcb_t.stcb005, #計算類型
       stcb006 LIKE stcb_t.stcb006, #費用週期
       stcb007 LIKE stcb_t.stcb007, #費用週期方式
       stcb008 LIKE stcb_t.stcb008, #條件基準
       stcb009 LIKE stcb_t.stcb009, #計算基準
       stcb010 LIKE stcb_t.stcb010, #費用淨額
       stcb011 LIKE stcb_t.stcb011, #費用比率
       stcb012 LIKE stcb_t.stcb012, #保底否
       stcb013 LIKE stcb_t.stcb013, #保底金額
       stcb014 LIKE stcb_t.stcb014, #保底扣率
       stcb015 LIKE stcb_t.stcb015, #分量扣點
       stcb016 LIKE stcb_t.stcb016, #生效日期
       stcb017 LIKE stcb_t.stcb017, #失效日期
       stcb018 LIKE stcb_t.stcb018, #下次計算日
       stcb019 LIKE stcb_t.stcb019, #費用開始日期
       stcb020 LIKE stcb_t.stcb020, #費用截止日期
       stcb021 LIKE stcb_t.stcb021  #是否參與現金折扣
       END RECORD

DEFINE l_stcf RECORD  #分銷合約費用設定主檔
       stcfent LIKE stcf_t.stcfent, #企業編號
       stcfsite LIKE stcf_t.stcfsite, #營運據點
       stcfunit LIKE stcf_t.stcfunit, #應用組織
       stcfseq LIKE stcf_t.stcfseq, #項次
       stcf001 LIKE stcf_t.stcf001, #合約編號
       stcf002 LIKE stcf_t.stcf002, #費用編號
       stcf003 LIKE stcf_t.stcf003, #會計期間
       stcf004 LIKE stcf_t.stcf004, #價款類別
       stcf005 LIKE stcf_t.stcf005, #計算類型
       stcf006 LIKE stcf_t.stcf006, #費用週期
       stcf007 LIKE stcf_t.stcf007, #費用週期方式
       stcf008 LIKE stcf_t.stcf008, #條件基準
       stcf009 LIKE stcf_t.stcf009, #計算基準
       stcf010 LIKE stcf_t.stcf010, #費用淨額
       stcf011 LIKE stcf_t.stcf011, #費用比率
       stcf012 LIKE stcf_t.stcf012, #保底否
       stcf013 LIKE stcf_t.stcf013, #保底金額
       stcf014 LIKE stcf_t.stcf014, #保底扣率
       stcf015 LIKE stcf_t.stcf015, #分量扣點
       stcf016 LIKE stcf_t.stcf016, #生效日期
       stcf017 LIKE stcf_t.stcf017, #失效日期
       stcf018 LIKE stcf_t.stcf018, #下次計算日
       stcf019 LIKE stcf_t.stcf019, #下次計算開始日
       stcf020 LIKE stcf_t.stcf020, #下次計算截止日
       stcf021 LIKE stcf_t.stcf021  #是否參與現金折扣
       END RECORD
#161111-00028#3---add---end--------------
DEFINE l_stcvseq LIKE stcv_t.stcvseq
DEFINE l_stcwseq LIKE stcw_t.stcwseq

   IF g_stca_m.stca000 = 'U' THEN
     #FOR i = 1 TO g_stcb_d.getLength() 
     #161111-00028#3---modify---begin--------------
     #DECLARE sel_stcb CURSOR  FOR  SELECT * FROM stcb_t
      DECLARE sel_stcb CURSOR  FOR  SELECT stcbent,stcbsite,stcbunit,stcbdocno,stcbseq,stcb001,stcb002,stcb003,stcb004,stcb005,
                                           stcb006,stcb007,stcb008,stcb009,stcb010,stcb011,stcb012,stcb013,stcb014,
                                           stcb015,stcb016,stcb017,stcb018,stcb019,stcb020,stcb021 FROM stcb_t
     #161111-00028#3---modify---end--------------
                                 WHERE stcbent = g_enterprise AND stcbdocno = g_stca_m.stcadocno 
      FOREACH sel_stcb INTO l_stcb.*
       #161111-00028#3---modify---begin--------------
       #SELECT * INTO l_stcf.* 
        SELECT stcfent,stcfsite,stcfunit,stcfseq,stcf001,stcf002,stcf003,stcf004,stcf005,stcf006,
               stcf007,stcf008,stcf009,stcf010,stcf011,stcf012,stcf013,stcf014,stcf015,stcf016,
               stcf017,stcf018,stcf019,stcf020,stcf021 INTO l_stcf.* 
       #161111-00028#3---modify---end--------------
         FROM stcf_t
         WHERE stcfent = g_enterprise AND stcf001 = g_stca_m.stca001 AND stcfseq =l_stcb.stcbseq
            
        #单身有一笔资料的下次费用开始日与astm601不一致，提示
        IF astt601_chk_astm601_jiesuan(l_stcb.stcbseq) AND (l_stcb.stcb019 <> l_stcf.stcf019 OR (NOT cl_null(l_stcb.stcb019) AND cl_null(l_stcf.stcf019))) THEN
           INITIALIZE g_errparam TO NULL
           LET g_errparam.code = 'ast-00201'
           LET g_errparam.extend = ''
           LET g_errparam.popup = TRUE
           CALL cl_err()
           RETURN FALSE            
        END IF
     END FOREACH
    # END FOR
     SELECT NVL(MAX(stcvseq),0) INTO l_stcvseq FROM stcv_t
      WHERE stcvent = g_enterprise AND stcvdocno = g_stca_m.stcadocno AND stcv005 = 'Y'
     
     SELECT NVL(MAX(stcwseq),0) INTO l_stcwseq FROM stcw_t
      WHERE stcwent = g_enterprise AND stcw001 = g_stca_m.stca001 AND stcw005 = 'Y'
     
     IF l_stcvseq <> l_stcwseq THEN
        INITIALIZE g_errparam TO NULL
        LET g_errparam.code = 'ast-00202'
        LET g_errparam.extend = ''
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
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION astt601_stca028_ref()
   INITIALIZE g_ref_fields TO NULL
   LET g_ref_fields[1] = g_stca_m.stca028
   CALL ap_ref_array2(g_ref_fields,"SELECT dbbcl003 FROM dbbcl_t WHERE dbbclent='"||g_enterprise||"' AND dbbcl001=? AND dbbcl002='"||g_dlang||"'","") RETURNING g_rtn_fields
   LET g_stca_m.stca028_desc = '', g_rtn_fields[1] , ''
   DISPLAY BY NAME g_stca_m.stca028_desc
   CALL astt601_stca028_other()
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
PUBLIC FUNCTION astt601_stca028_other()
   SELECT dbbc002,dbbc003 INTO g_stca_m.stca025,g_stca_m.stca012 FROM dbbc_t
    WHERE dbbcent = g_enterprise AND dbbc001 = g_stca_m.stca028
   DISPLAY BY NAME g_stca_m.stca025,g_stca_m.stca012
   CALL astt601_stca025_ref()
   CALL astt601_stca012_ref()
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
PUBLIC FUNCTION astt601_stca028_chk()
   INITIALIZE g_chkparam.* TO NULL
  LET g_errshow = '1'
  LET g_chkparam.arg1 = g_stca_m.stca028

  IF NOT cl_chk_exist("v_dbbc001") THEN
     RETURN FALSE
  END IF
   RETURN TRUE
END FUNCTION
#BPM提交
PRIVATE FUNCTION astt601_send()
   #add-point:send段define
   DEFINE l_success  LIKE type_t.num5
   #end add-point 
   #add-point:send段define(客製用)

   #end add-point 
 
   #依據單據個數，需要指定所有單身條件為" 1=1"  (單身有幾個就要設幾個)
   LET g_wc2_table1 = " 1=1"
 
 
   CALL astt601_show()
   CALL astt601_set_pk_array()
   
   #add-point: 提交前的ADP
   #確認前檢核段
   CALL s_astt601_conf_chk(g_stca_m.stcadocno) RETURNING l_success,g_errno
   #MOD BY zhujing 2015-6-16 添加错误讯息
   IF NOT l_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = g_errno
      LET g_errparam.extend = g_stca_m.stcadocno
      LET g_errparam.popup = TRUE
      CALL cl_err()
      CLOSE astt601_cl
      CALL s_transaction_end('N','0')
      RETURN FALSE
   END IF

   #end add-point
   
   #公用變數初始化
   CALL cl_bpm_data_init()
                  
   #依照主檔/單身個數產生 CALL cl_bpm_set_master_data() / cl_bpm_set_detail_data() 
   #單頭固定為 CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(xxxx)) 傳入參數: (1)單頭陣列  ; 回傳值: 無
   CALL cl_bpm_set_master_data(util.JSONObject.fromFGL(g_stca_m))
                              
   #單身固定為 CALL cl_bpm_set_detail_data(s_detailX, util.JSONArray.fromFGL(xxxx)) 傳入參數: (1)單身SR名稱  (2)單身陣列  ; 回傳值: 無
   CALL cl_bpm_set_detail_data("s_detail1", util.JSONArray.fromFGL(g_stcb_d))
   CALL cl_bpm_set_detail_data("s_detail2", util.JSONArray.fromFGL(g_stcb2_d))
   CALL cl_bpm_set_detail_data("s_detail3", util.JSONArray.fromFGL(g_stcc_d))
   CALL cl_bpm_set_detail_data("s_detail4", util.JSONArray.fromFGL(g_stcv_d))
 
 
   # cl_bpm_cli() 裡有包含以前的aws_condition()=>送簽資料檢核和更新單據狀況碼為'W'
   # cl_bpm_cli() 傳入參數:無  ;  回傳值: 0 開單失敗; 1 開單成功
 
   #開單失敗
   IF NOT cl_bpm_cli() THEN 
      RETURN FALSE
   END IF
 
   #add-point: 提交後的ADP

   #end add-point
 
   #此段落不需要刪除資料,但是否需要refresh圖片樣式???
   #CALL astt601_ui_browser_refresh()
 
   #重新指定此筆單據資料狀態圖片=>送簽中
   LET g_browser[g_current_idx].b_statepic = "stus/16/signing.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt601_ui_headershow()
   CALL astt601_ui_detailshow()
 
   RETURN TRUE
   
END FUNCTION

PRIVATE FUNCTION astt601_set_pk_array()
   #add-point:set_pk_array段define

   #end add-point
   #add-point:set_pk_array段define

   #end add-point
   
   #add-point:set_pk_array段之前

   #end add-point  
   
   #若l_ac<=0代表沒有資料
   IF l_ac <= 0 THEN
      RETURN
   END IF
   
   CALL g_pk_array.clear()
   LET g_pk_array[1].values = g_stca_m.stcadocno
   LET g_pk_array[1].column = 'stcadocno'
 
   
   #add-point:set_pk_array段之後

   #end add-point  
   
END FUNCTION
#BPM抽单
PRIVATE FUNCTION astt601_draw_out()
   #add-point:draw段define

   #end add-point
   #add-point:draw段define

   #end add-point
 
   #抽單失敗
   IF NOT cl_bpm_draw_out() THEN 
      RETURN FALSE
   END IF    
          
   #重新指定此筆單據資料狀態圖片=>抽單
   LET g_browser[g_current_row].b_statepic = "stus/16/draw_out.png"
 
   #重新取得單頭/單身資料,DISPLAY在畫面上
   CALL astt601_ui_headershow()  
   CALL astt601_ui_detailshow()
 
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
PRIVATE FUNCTION astt601_stca010_other()
  
   #抓取合约编号预设到结算合约编号
   SELECT stce001 INTO g_stca_m.stca027 FROM stce_t
    WHERE stceent = g_enterprise AND stce009 = g_stca_m.stca009 
      AND stce005 = g_stca_m.stca005
      AND stce008 = '1' AND stce018 >= g_today  AND stcestus = 'Y' AND  rownum = 1
   DISPLAY BY NAME  g_stca_m.stca027
   
   CALL astt601_stca027_other()
   LET t_stca.* = g_stca_m.*
END FUNCTION

################################################################################
# Descriptions...: 计算基准检查
# Memo...........:
# Date & Author..: 
# Modify.........:
################################################################################
PRIVATE FUNCTION astt601_stck0010_chk(p_stck010)
DEFINE p_stck010     LIKE stck_t.stck010
DEFINE l_stabstus  LIKE stab_t.stabstus
DEFINE l_n         LIKE type_t.num5

   SELECT COUNT(*) INTO l_n 
     FROM stab_t LEFT OUTER JOIN stat_t ON stabent = statent AND stab001 = stat003
    WHERE stabent = g_enterprise AND stab001= p_stck010 AND stat001 = '11'
   
   IF l_n = 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'ast-00189'
      LET g_errparam.replace[1] = "asti205"
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
   END IF

   RETURN TRUE
   
END FUNCTION

################################################################################
# Descriptions...: 计算基准说明
# Memo...........:
# Date & Author..: 
# Modify.........:
################################################################################
PRIVATE FUNCTION astt601_stck010_ref()

   SELECT stabl003 INTO g_stck_d[l_ac].stck010_desc
     FROM stabl_t 
    WHERE stablent = g_enterprise AND stabl001 = g_stck_d[l_ac].stck010 AND stabl002 = g_lang
    
   DISPLAY BY NAME g_stck_d[l_ac].stck010_desc
END FUNCTION

################################################################################
# Date & Author..: 2016/08/23 By 08734
# Modify.........:
################################################################################
PRIVATE FUNCTION astt601_action_chk()
 #160818-00017#40 add-S
   SELECT stcastus  INTO g_stca_m.stcastus
     FROM stca_t
    WHERE stcaent = g_enterprise
      AND stcadocno = g_stca_m.stcadocno

   IF (g_action_choice="modify" OR g_action_choice="delete" OR g_action_choice="modify_detail")  THEN
     LET g_errno = NULL
     CASE g_stca_m.stcastus
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
        LET g_errparam.extend = g_stca_m.stcadocno
        LET g_errparam.popup = TRUE
        CALL cl_err()
        LET g_errno = NULL
        IF g_stca_m.stcastus MATCHES "[NDR]" THEN
           CALL cl_set_act_visible("modify,delete,modify_detail",TRUE)
        ELSE 
           CALL cl_set_act_visible("modify,delete,modify_detail",FALSE)
        END IF
        CALL astt601_show()
        RETURN FALSE
     END IF
   END IF
   #160818-00017#40 add-E
   RETURN TRUE
END FUNCTION

 
{</section>}
 
