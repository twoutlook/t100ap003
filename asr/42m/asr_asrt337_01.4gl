#該程式已解開Section, 不再透過樣板產出!
{<section id="asrt337_01.description" >}
#+ Version..: T100-ERP-1.00.00(SD版次:1,PD版次:1) Build-000038
#+ 
#+ Filename...: asrt337_01
#+ Description: ...
#+ Creator....: 00537(2014/03/15)
#+ Modifier...: 00537(2014/05/17)
#+ Buildtype..: 應用 t02 樣板自動產生
#+ 以上段落由子樣板a00產生
 
{</section>}
 
{<section id="asrt337_01.global" >}
#160316-00007#7   2016/03/18 By xianghui 库存管理特征处增加制造批序号处理
#160905-00007#15  2016/09/05 by 08172    调整系统中无ENT的SQL条件增加ent
#161006-00018#14  2016/11/14 By 02295    增加D-MFG-0085参数，当其为Y时，如果申请资料有指定库储批，则实际出入库的库储批不可修改
#160824-00007#285 2016/12/29 by sakura   新舊值備份處理
 
IMPORT os
IMPORT util
#add-point:增加匯入項目
 
#end add-point
    
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
 
#add-point:增加匯入變數檔

#end add-point
 
#單身 type 宣告
PRIVATE TYPE type_g_sfhb_d RECORD
   sfhbdocno LIKE sfhb_t.sfhbdocno, 
   sfhbseq LIKE sfhb_t.sfhbseq, 
   sfhb001 LIKE sfhb_t.sfhb001, 
   sfhb001_desc LIKE type_t.chr500, 
   sfhb001_desc1 LIKE type_t.chr500, 
   sfhb002 LIKE sfhb_t.sfhb002, 
   sfhb003 LIKE sfhb_t.sfhb003, 
   sfhb003_desc LIKE type_t.chr500, 
   sfhb004 LIKE sfhb_t.sfhb004, 
   sfhb004_desc LIKE type_t.chr500, 
   sfhb005 LIKE sfhb_t.sfhb005, 
   sfhb006 LIKE sfhb_t.sfhb006, 
   sfhb007 LIKE sfhb_t.sfhb007, 
   sfhb007_desc LIKE type_t.chr500, 
   sfhb008 LIKE sfhb_t.sfhb008, 
   sfhb009 LIKE sfhb_t.sfhb009, 
   sfhb009_desc LIKE type_t.chr500,
   sfhb010 LIKE sfhb_t.sfhb010, 
   sfhb011 LIKE sfhb_t.sfhb011, 
   sfhb012 LIKE sfhb_t.sfhb012
       END RECORD
PRIVATE TYPE type_g_sfhb2_d RECORD
   sfhcseq1 LIKE type_t.num10, 
   sfhc003 LIKE type_t.chr10, 
   sfhc003_desc LIKE type_t.chr500, 
   sfhc004 LIKE type_t.chr10, 
   sfhc004_desc LIKE type_t.chr500, 
   sfhc005 LIKE type_t.chr30,
   sfhc006 LIKE sfhc_t.sfhc006,   
   sfhc008 LIKE type_t.num20_6, 
   sfhc010 LIKE type_t.num20_6
       END RECORD
 
 
#無單身append欄位定義
 
#模組變數(Module Variables)
DEFINE g_master                     type_g_sfhb_d
DEFINE g_master_t                   type_g_sfhb_d
DEFINE g_sfhb_d          DYNAMIC ARRAY OF type_g_sfhb_d
DEFINE g_sfhb_d_t        type_g_sfhb_d
DEFINE g_sfhb2_d   DYNAMIC ARRAY OF type_g_sfhb2_d
DEFINE g_sfhb2_d_t type_g_sfhb2_d
 
      
DEFINE g_wc                 STRING
DEFINE g_wc2                STRING
DEFINE g_sql                STRING
DEFINE g_forupd_sql         STRING                        #SELECT ... FOR UPDATE SQL
DEFINE g_before_input_done  LIKE type_t.num5
DEFINE g_cnt                LIKE type_t.num10    
DEFINE l_ac                 LIKE type_t.num5              
DEFINE g_curr_diag          ui.Dialog                     #Current Dialog
DEFINE gwin_curr            ui.Window                     #Current Window
DEFINE gfrm_curr            ui.Form                       #Current Form
DEFINE g_detail_idx         LIKE type_t.num5              #單身所在筆數(第一階單身)
DEFINE g_detail_idx2        LIKE type_t.num5              #單身所在筆數(第二階單身)
DEFINE g_detail_cnt         LIKE type_t.num5              #單身總筆數 (第一階單身)
DEFINE g_detail_cnt2        LIKE type_t.num5              #單身總筆數 (第二階單身)
DEFINE g_ref_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_rtn_fields         DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE g_ref_vars           DYNAMIC ARRAY OF VARCHAR(500) #ap_ref用陣列
DEFINE gs_keys              DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE gs_keys_bak          DYNAMIC ARRAY OF VARCHAR(500) #同步資料用陣列
DEFINE g_insert             LIKE type_t.chr5              #是否導到其他page
DEFINE g_error_show         LIKE type_t.num5
DEFINE g_aw                 STRING                        #確定當下點擊的單身
DEFINE g_current_page       LIKE type_t.num5              #判斷單身筆數用
DEFINE g_loc                LIKE type_t.chr5              #判斷游標所在位置
 
#多table用wc
DEFINE g_wc_table           STRING
 
DEFINE g_wc2_table2   STRING
 
 
 
 
#add-point:自定義模組變數(Module Variable)
DEFINE g_sfhb2_d_o type_g_sfhb2_d    #150826-00008#6
#end add-point
 
#add-point:傳入參數說明(global.argv)

#end add-point
 
{</section>}
 
{<section id="asrt337_01.main" >}
#+ 此段落由子樣板a27產生
#+ 資料輸入
PUBLIC FUNCTION asrt337_01(--)
   #add-point:main段變數傳入
   p_sfhadocno
   #end add-point
   )
   #add-point:main段define
   DEFINE p_sfhadocno   LIKE sfha_t.sfhadocno
   DEFINE l_sfhastus    LIKE sfha_t.sfhastus
   #end add-point   
 
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   #add-point:作業初始化
#为default_search里组成查询第一个单身所用的g_wc
   LET g_argv[1] = p_sfhadocno 
   SELECT sfhastus INTO l_sfhastus
     FROM sfha_t
    WHERE sfhaent   = g_enterprise
      AND sfhasite  = g_site
      AND sfhadocno = p_sfhadocno
      
   IF l_sfhastus NOT MATCHES '[YN]' THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'asf-00291'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()

      RETURN
   END IF
   #end add-point
   
   
 
   #LOCK CURSOR (identifier)
   #add-point:SQL_define

   #end add-point
   LET g_forupd_sql = ""
   #add-point:SQL_define

   #end add-point
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)   #轉換不同資料庫語法
   DECLARE asrt337_01_cl CURSOR FROM g_forupd_sql     # LOCK CURSOR
 
   LET g_sql = " SELECT UNIQUE ",
               " FROM ",
               " WHERE  "
   #add-point:SQL_define

   #end add-point
   PREPARE asrt337_01_master_referesh FROM g_sql
   
   #畫面開啟 (identifier)
   OPEN WINDOW w_asrt337_01 WITH FORM cl_ap_formpath("asr","asrt337_01")
   
   #瀏覽頁簽資料初始化
   CALL cl_ui_init()
   
   #程式初始化
   CALL asrt337_01_init()   
 
   #進入選單 Menu (="N")
   CALL asrt337_01_ui_dialog() 
 
   #畫面關閉
   CLOSE WINDOW w_asrt337_01
 
   CLOSE asrt337_01_cl
   
   
 
   #add-point:離開前
   IF INT_FLAG THEN
      LET INT_FLAG = FALSE
   END IF
   LET g_action_choice = ""
   #end add-point
 
END FUNCTION
 
 
 
{</section>}
 
{<section id="asrt337_01.init" >}
#+ 畫面資料初始化
PRIVATE FUNCTION asrt337_01_init()
   #add-point:init段define
   
   #end add-point   
 
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1   
   LET g_error_show = 1
   
   
   LET l_ac = 1
   
   
 
   #避免USER直接進入第二單身時無資料
   IF g_sfhb_d.getLength() > 0 THEN
      LET g_master_t.* = g_sfhb_d[1].*
      LET g_master.* = g_sfhb_d[1].*
   END IF
 
   #add-point:畫面資料初始化
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  = 'N' THEN  
      CALL cl_set_comp_visible("sfhb009,sfhb009_desc,sfhb010,sfhc010",FALSE)
   END IF
   #end add-point
   
   CALL asrt337_01_default_search()
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.ui_dialog" >}
#+ 功能選單 
PRIVATE FUNCTION asrt337_01_ui_dialog()
   DEFINE la_param  RECORD
             prog   STRING,
             param  DYNAMIC ARRAY OF STRING
                    END RECORD
   DEFINE ls_js     STRING
   DEFINE li_idx   LIKE type_t.num5
   #add-point:ui_dialog段define

   #end add-point 
 
   LET g_action_choice = " "  
   LET gwin_curr = ui.Window.getCurrent()
   LET gfrm_curr = gwin_curr.getForm() 
 
   CALL cl_set_act_visible("accept,cancel", FALSE)
   
   #add-point:ui_dialog段before dialog 

   #end add-point
   
   WHILE TRUE
   
      #add-point:ui_dialog段before while

      #end add-point
   
      CALL asrt337_01_b_fill(g_wc)
   
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_sfhb_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               #如果一直都在單頭則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_detail_idx)
               END IF
               LET g_loc = 'm'
               LET g_current_page = 1
	  
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               LET g_master.* = g_sfhb_d[g_detail_idx].*
               CALL cl_show_fld_cont()
               CALL asrt337_01_fetch()
               CALL asrt337_01_idx_chk('m')
               
            #自訂ACTION(detail_show,page_1)
            
               
         END DISPLAY
      
 
         
         DISPLAY ARRAY g_sfhb2_d TO s_detail2.* ATTRIBUTE(COUNT=g_detail_cnt)
         
            BEFORE DISPLAY 
               #如果一直都在單頭則控制筆數位置
               IF g_loc = 'd' THEN
                  CALL FGL_SET_ARR_CURR(g_detail_idx2)
               END IF
               LET g_loc = 'd'
               LET g_current_page = 2
         
            BEFORE ROW
               LET g_detail_idx2 = DIALOG.getCurrentRow("s_detail2")
               LET l_ac = g_detail_idx2
               CALL asrt337_01_idx_chk('d')
               LET g_master.* = g_sfhb_d[g_detail_idx].*
               CALL cl_show_fld_cont() 
               
            #自訂ACTION(detail_show,page_2)
            
               
         END DISPLAY
 
      
         #add-point:ui_dialog段自定義display array
 
         #end add-point
         
         BEFORE DIALOG
            LET g_curr_diag = ui.DIALOG.getCurrent()         
            CALL DIALOG.setSelectionMode("s_detail1", 1)
            IF g_detail_idx > 0 THEN
               IF g_detail_idx > g_sfhb_d.getLength() THEN
                  LET g_detail_idx = g_sfhb_d.getLength()
               END IF
               CALL DIALOG.setCurrentRow("s_detail1", g_detail_idx)
               LET l_ac = g_detail_idx
            END IF 
            LET g_detail_idx = l_ac
            NEXT FIELD CURRENT
         
         AFTER DIALOG
            #add-point:ui_dialog段after dialog

         #+ 此段落由子樣板a43產生
#pattern没产生常规action，自己补
         ON ACTION modify
            LET g_action_choice="modify"
            IF cl_auth_chk_act("modify") THEN
               CALL asrt337_01_input('u')
               EXIT DIALOG
            END IF
 
 
         #+ 此段落由子樣板a43產生
         ON ACTION modify_detail
            LET g_action_choice="modify_detail"
            IF cl_auth_chk_act("modify") THEN
               CALL asrt337_01_input('u')
            END IF

         #+ 此段落由子樣板a43產生
         ON ACTION insert
            LET g_action_choice="insert"
            IF cl_auth_chk_act("insert") THEN
               CALL asrt337_01_input('a')
            END IF
            
         ON ACTION accept
            ACCEPT DIALOG
         
         ON ACTION cancel
            LET INT_FLAG = TRUE 
            LET g_action_choice="exit"
            EXIT DIALOG
            #end add-point
         
         
      
         ON ACTION close
            LET INT_FLAG=FALSE         
            LET g_action_choice="exit"
            EXIT DIALOG
      
         ON ACTION exit
            LET g_action_choice="exit"
            EXIT DIALOG
           
         
      
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
 
{<section id="asrt337_01.query" >}
#+ QBE資料查詢
PRIVATE FUNCTION asrt337_01_query()
   DEFINE ls_wc      STRING
   DEFINE ls_return  STRING
   DEFINE ls_result  STRING 
   #add-point:query段define
   
   #end add-point 
   
   LET INT_FLAG = 0
   CLEAR FORM
   CALL g_sfhb_d.clear()
   
   LET g_qryparam.state = "c"
   LET g_detail_idx  = 1
   LET g_detail_idx2 = 1
   
   #wc備份
   LET ls_wc = g_wc
   LET g_detail_idx = l_ac
   
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
 
      #單身根據table分拆construct
      CONSTRUCT g_wc_table ON sfhbdocno,sfhbseq,sfhb001,sfhb002,sfhb003,sfhb004,sfhb005,sfhb006,sfhb007, 
          sfhb008,sfhb009,sfhb010,sfhb011,sfhb012
           FROM s_detail1[1].sfhbdocno,s_detail1[1].sfhbseq,s_detail1[1].sfhb001,s_detail1[1].sfhb002, 
               s_detail1[1].sfhb003,s_detail1[1].sfhb004,s_detail1[1].sfhb005,s_detail1[1].sfhb006,s_detail1[1].sfhb007, 
               s_detail1[1].sfhb008,s_detail1[1].sfhb009,s_detail1[1].sfhb010,s_detail1[1].sfhb011,s_detail1[1].sfhb012 
 
                      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct
            
            #end add-point 
            
       #單身公用欄位開窗相關處理
       
         
       #單身一般欄位開窗相關處理
       #---------------------<  Detail: page1  >---------------------
         #----<<sfhbdocno>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhbdocno
            #add-point:BEFORE FIELD sfhbdocno
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhbdocno
            
            #add-point:AFTER FIELD sfhbdocno
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.sfhbdocno
         ON ACTION controlp INFIELD sfhbdocno
            #add-point:ON ACTION controlp INFIELD sfhbdocno
            
            #END add-point
 
         #----<<sfhbseq>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhbseq
            #add-point:BEFORE FIELD sfhbseq
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhbseq
            
            #add-point:AFTER FIELD sfhbseq
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.sfhbseq
         ON ACTION controlp INFIELD sfhbseq
            #add-point:ON ACTION controlp INFIELD sfhbseq
            
            #END add-point
 
         #----<<sfhb001>>----
         #Ctrlp:construct.c.page1.sfhb001
         ON ACTION controlp INFIELD sfhb001
            #add-point:ON ACTION controlp INFIELD sfhb001
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_imaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhb001  #顯示到畫面上

            NEXT FIELD sfhb001                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD sfhb001
            #add-point:BEFORE FIELD sfhb001
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhb001
            
            #add-point:AFTER FIELD sfhb001
            
            #END add-point
            
 
         #----<<sfhb001_desc>>----
         #----<<sfhb001_desc1>>----
         #----<<sfhb002>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhb002
            #add-point:BEFORE FIELD sfhb002
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhb002
            
            #add-point:AFTER FIELD sfhb002
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.sfhb002
         ON ACTION controlp INFIELD sfhb002
            #add-point:ON ACTION controlp INFIELD sfhb002
            
            #END add-point
 
         #----<<sfhb003>>----
         #Ctrlp:construct.c.page1.sfhb003
         ON ACTION controlp INFIELD sfhb003
            #add-point:ON ACTION controlp INFIELD sfhb003
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_inaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhb003  #顯示到畫面上

            NEXT FIELD sfhb003                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD sfhb003
            #add-point:BEFORE FIELD sfhb003
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhb003
            
            #add-point:AFTER FIELD sfhb003
            
            #END add-point
            
 
         #----<<sfhb003_desc>>----
         #----<<sfhb004>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhb004
            #add-point:BEFORE FIELD sfhb004
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhb004
            
            #add-point:AFTER FIELD sfhb004
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.sfhb004
         ON ACTION controlp INFIELD sfhb004
            #add-point:ON ACTION controlp INFIELD sfhb004
            
            #END add-point
 
         #----<<sfhb004_desc>>----
         #----<<sfhb005>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhb005
            #add-point:BEFORE FIELD sfhb005
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhb005
            
            #add-point:AFTER FIELD sfhb005
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.sfhb005
         ON ACTION controlp INFIELD sfhb005
            #add-point:ON ACTION controlp INFIELD sfhb005
            
            #END add-point
 
         #----<<sfhb006>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhb006
            #add-point:BEFORE FIELD sfhb006
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhb006
            
            #add-point:AFTER FIELD sfhb006
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.sfhb006
         ON ACTION controlp INFIELD sfhb006
            #add-point:ON ACTION controlp INFIELD sfhb006
            
            #END add-point
 
         #----<<sfhb007>>----
         #Ctrlp:construct.c.page1.sfhb007
         ON ACTION controlp INFIELD sfhb007
            #add-point:ON ACTION controlp INFIELD sfhb007
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhb007  #顯示到畫面上

            NEXT FIELD sfhb007                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD sfhb007
            #add-point:BEFORE FIELD sfhb007
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhb007
            
            #add-point:AFTER FIELD sfhb007
            
            #END add-point
            
 
         #----<<sfhb007_desc>>----
         #----<<sfhb008>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhb008
            #add-point:BEFORE FIELD sfhb008
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhb008
            
            #add-point:AFTER FIELD sfhb008
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.sfhb008
         ON ACTION controlp INFIELD sfhb008
            #add-point:ON ACTION controlp INFIELD sfhb008
            
            #END add-point
 
         #----<<sfhb009>>----
         #Ctrlp:construct.c.page1.sfhb009
         ON ACTION controlp INFIELD sfhb009
            #add-point:ON ACTION controlp INFIELD sfhb009
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_ooca001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhb009  #顯示到畫面上

            NEXT FIELD sfhb009                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD sfhb009
            #add-point:BEFORE FIELD sfhb009
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhb009
            
            #add-point:AFTER FIELD sfhb009
            
            #END add-point
            
 
         #----<<sfhb009_desc>>----
         #----<<sfhb010>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhb010
            #add-point:BEFORE FIELD sfhb010
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhb010
            
            #add-point:AFTER FIELD sfhb010
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.sfhb010
         ON ACTION controlp INFIELD sfhb010
            #add-point:ON ACTION controlp INFIELD sfhb010
            
            #END add-point
 
         #----<<sfhb011>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhb011
            #add-point:BEFORE FIELD sfhb011
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhb011
            
            #add-point:AFTER FIELD sfhb011
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.sfhb011
         ON ACTION controlp INFIELD sfhb011
            #add-point:ON ACTION controlp INFIELD sfhb011
            
            #END add-point
 
         #----<<sfhb012>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhb012
            #add-point:BEFORE FIELD sfhb012
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhb012
            
            #add-point:AFTER FIELD sfhb012
            
            #END add-point
            
 
         #Ctrlp:construct.c.page1.sfhb012
         ON ACTION controlp INFIELD sfhb012
            #add-point:ON ACTION controlp INFIELD sfhb012
            
            #END add-point
 
   
       
      END CONSTRUCT
      
 
      
      CONSTRUCT g_wc2_table2 ON sfhcseq1,sfhc003,sfhc004,sfhc005,sfhc008,sfhc010
           FROM s_detail2[1].sfhcseq1,s_detail2[1].sfhc003,s_detail2[1].sfhc004,s_detail2[1].sfhc005, 
               s_detail2[1].sfhc008,s_detail2[1].sfhc010
                      
         BEFORE CONSTRUCT
            #add-point:cs段more_construct
            
            #end add-point 
            
       #單身公用欄位開窗相關處理(table 2)
       
       
       #單身一般欄位開窗相關處理       
       #---------------------<  Detail: page2  >---------------------
         #----<<sfhcseq1>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhcseq1
            #add-point:BEFORE FIELD sfhcseq1
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhcseq1
            
            #add-point:AFTER FIELD sfhcseq1
            
            #END add-point
            
 
         #Ctrlp:construct.c.page2.sfhcseq1
         ON ACTION controlp INFIELD sfhcseq1
            #add-point:ON ACTION controlp INFIELD sfhcseq1
            
            #END add-point
 
         #----<<sfhc003>>----
         #Ctrlp:construct.c.page2.sfhc003
         ON ACTION controlp INFIELD sfhc003
            #add-point:ON ACTION controlp INFIELD sfhc003
            #此段落由子樣板a08產生
            #開窗c段
			INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c'
			LET g_qryparam.reqry = FALSE
            CALL q_inaa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO sfhc003  #顯示到畫面上

            NEXT FIELD sfhc003                     #返回原欄位


            #END add-point
 
         #此段落由子樣板a01產生
         BEFORE FIELD sfhc003
            #add-point:BEFORE FIELD sfhc003
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhc003
            
            #add-point:AFTER FIELD sfhc003
            
            #END add-point
            
 
         #----<<sfhc003_desc>>----
         #----<<sfhc004>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhc004
            #add-point:BEFORE FIELD sfhc004
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhc004
            
            #add-point:AFTER FIELD sfhc004
            
            #END add-point
            
 
         #Ctrlp:construct.c.page2.sfhc004
         ON ACTION controlp INFIELD sfhc004
            #add-point:ON ACTION controlp INFIELD sfhc004
            
            #END add-point
 
         #----<<sfhc004_desc>>----
         #----<<sfhc005>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhc005
            #add-point:BEFORE FIELD sfhc005
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhc005
            
            #add-point:AFTER FIELD sfhc005
            
            #END add-point
            
 
         #Ctrlp:construct.c.page2.sfhc005
         ON ACTION controlp INFIELD sfhc005
            #add-point:ON ACTION controlp INFIELD sfhc005
            
            #END add-point
 
         #----<<sfhc008>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhc008
            #add-point:BEFORE FIELD sfhc008
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhc008
            
            #add-point:AFTER FIELD sfhc008
            
            #END add-point
            
 
         #Ctrlp:construct.c.page2.sfhc008
         ON ACTION controlp INFIELD sfhc008
            #add-point:ON ACTION controlp INFIELD sfhc008
            
            #END add-point
 
         #----<<sfhc010>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhc010
            #add-point:BEFORE FIELD sfhc010
            
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhc010
            
            #add-point:AFTER FIELD sfhc010
            
            #END add-point
            
 
         #Ctrlp:construct.c.page2.sfhc010
         ON ACTION controlp INFIELD sfhc010
            #add-point:ON ACTION controlp INFIELD sfhc010
            
            #END add-point
 
   
       
      END CONSTRUCT
 
 
  
      #add-point:query段more_construct
      
      #end add-point 
      
      BEFORE DIALOG
         CALL cl_qbe_init()
         #add-point:cs段b_dialog
         
         #end add-point  
 
      ON ACTION qbe_select     #條件查詢
         CALL cl_qbe_list('m') RETURNING ls_wc
 
      ON ACTION qbe_save       #條件儲存
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
 
   IF INT_FLAG THEN
      LET INT_FLAG = 0
      #還原
      LET g_wc = ls_wc
   ELSE
      LET g_detail_idx = 1
   END IF
   
   LET g_wc = g_wc_table 
 
              , " AND ", g_wc2_table2
 
 
        
   LET g_wc2 = " 1=1"
               , " AND ", g_wc2_table2
 
 
        
   #add-point:cs段after_construct
   
   #end add-point
        
   LET g_error_show = 1
   CALL asrt337_01_b_fill(g_wc)
   LET l_ac = g_detail_idx
   CALL asrt337_01_fetch()
   IF g_detail_cnt = 0 AND NOT INT_FLAG THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = -100
      LET g_errparam.extend = ""
      LET g_errparam.popup = TRUE
      CALL cl_err()
 
   END IF
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.insert" >}
#+ 資料修改
PRIVATE FUNCTION asrt337_01_insert()
   #add-point:insert段define
   
   #end add-point 
 
   #add-point:insert段新增前
   
   #end add-point 
   
   #進入資料輸入段落
   CALL g_sfhb_d.clear() 
   CALL g_sfhb2_d.clear() 
 
   CALL asrt337_01_input('a')
   
   CALL asrt337_01_b_fill(g_wc)
   
   #add-point:insert段新增後
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.modify" >}
#+ 資料新增
PRIVATE FUNCTION asrt337_01_modify()
   #add-point:modify段define
   
   #end add-point 
 
   #add-point:modify段新增前
   
   #end add-point 
   
   #進入資料輸入段落
   CALL asrt337_01_input('u')
   
   #add-point:modify段新增後
   
   #end add-point 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.delete" >}
#+ 資料刪除
PRIVATE FUNCTION asrt337_01_delete()
   DEFINE li_ac LIKE type_t.num5
   #add-point:delete段define

   #end add-point 
   IF NOT cl_ask_delete() THEN
      #不刪除
      RETURN
   END IF
   
   LET li_ac = ARR_CURR()
   LET g_sfhb_d_t.* = g_sfhb_d[li_ac].*
   
   CALL s_transaction_begin()  
   
   #add-point:delete段刪除前

   #end add-point 
   
   #刪除單頭
   DELETE FROM sfhb_t 
         WHERE sfhbdocno = g_sfhb_d_t.sfhbdocno
           AND sfhbseq = g_sfhb_d_t.sfhbseq
           AND sfhbent = g_enterprise  #160905-00007#15 by 08172
 
           
   #add-point:delete段刪除中

   #end add-point 
           
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "sfhb_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
 
      CALL s_transaction_end('N','0')
      RETURN
   END IF
   
   #add-point:delete段刪除後

   #end add-point 
   
   #刪除單頭
   #add-point:delete段刪除前

   #end add-point 
   DELETE FROM sfhc_t 
         WHERE sfhcdocno = g_sfhb_d_t.sfhbdocno
           AND sfhcseq = g_sfhb_d_t.sfhbseq
           AND sfhcent = g_enterprise  #160905-00007#15 by 08172
 
   #add-point:delete段刪除中

   #end add-point 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "sfhc_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
 
      CALL s_transaction_end('N','0')
      RETURN
   ELSE
      CALL s_transaction_end('Y','0')
   END IF
   #add-point:delete段刪除後

   #end add-point 
 
 
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.input" >}
#+ 資料輸入
PRIVATE FUNCTION asrt337_01_input(p_cmd)
   DEFINE  p_cmd                 LIKE type_t.chr1
   DEFINE  l_cmd                 LIKE type_t.chr1
   DEFINE  l_ac_t                LIKE type_t.num5                #未取消的ARRAY CNT 
   DEFINE  l_n                   LIKE type_t.num5                #檢查重複用  
   DEFINE  l_cnt                 LIKE type_t.num5                #檢查重複用  
   DEFINE  l_lock_sw             LIKE type_t.chr1                #單身鎖住否  
   DEFINE  l_allow_insert        LIKE type_t.num5                #可新增否 
   DEFINE  l_allow_delete        LIKE type_t.num5                #可刪除否  
   DEFINE  l_count               LIKE type_t.num5
   DEFINE  l_i                   LIKE type_t.num5
   DEFINE  ls_return             STRING
   DEFINE  l_var_keys            DYNAMIC ARRAY OF STRING
   DEFINE  l_field_keys          DYNAMIC ARRAY OF STRING
   DEFINE  l_vars                DYNAMIC ARRAY OF STRING
   DEFINE  l_fields              DYNAMIC ARRAY OF STRING
   DEFINE  l_var_keys_bak        DYNAMIC ARRAY OF STRING
   DEFINE  lb_reproduce          BOOLEAN
   DEFINE  li_reproduce          LIKE type_t.num5
   DEFINE  li_reproduce_target   LIKE type_t.num5
   #add-point:input段define
   DEFINE  l_sum_sfhc008         LIKE sfhc_t.sfhc008
   DEFINE  l_sum_sfhc010         LIKE sfhc_t.sfhc010
   DEFINE  l_sfhc008_t           LIKE sfhc_t.sfhc008
   DEFINE  l_sfhc010_t           LIKE sfhc_t.sfhc010
   DEFINE  l_sfhb008             LIKE sfhb_t.sfhb008
   DEFINE  l_sfhb010             LIKE sfhb_t.sfhb010
   DEFINE  l_inaa007             LIKE inaa_t.inaa007 
   DEFINE  l_sql1                 STRING  
   DEFINE  l_success             LIKE type_t.num5
   DEFINE l_flag                 LIKE type_t.num5    #161006-00018#14 
   DEFINE l_slip                 LIKE ooba_t.ooba002   #161006-00018#14 
   #end add-point 
   
   LET g_action_choice = ""
   
   LET g_qryparam.state = "i"
 
   LET l_allow_insert = cl_auth_detail_input("insert")
   LET l_allow_delete = cl_auth_detail_input("delete")
 
   #add-point:input段define_sql

   #end add-point 
   LET g_forupd_sql = "SELECT sfhbdocno,sfhbseq,sfhb001,'','',sfhb002,sfhb003,'',sfhb004,'',sfhb005, 
       sfhb006,sfhb007,'',sfhb008,sfhb009,'',sfhb010,sfhb011,sfhb012 FROM sfhb_t WHERE sfhbent=? AND  
       sfhbdocno=? AND sfhbseq=? FOR UPDATE"
   #add-point:input段define_sql

   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE asrt337_01_bcl CURSOR FROM g_forupd_sql      # LOCK CURSOR
   
 
   
   #add-point:input段define_sql

   #end add-point 
   LET g_forupd_sql = "SELECT '','','','','','','','' FROM sfhc_t WHERE sfhcent=? AND sfhcdocno=? AND  
       sfhcseq=? AND sfhcseq1=? FOR UPDATE"
   #add-point:input段define_sql
#pattern产生错误，所以自己重走一次sql
   LET g_forupd_sql = "SELECT sfhcseq1,sfhc003,'',sfhc004,'',sfhc005,sfhc008,sfhc010 FROM sfhc_t WHERE sfhcent=? AND sfhcdocno=? AND  
       sfhcseq=? AND sfhcseq1=? FOR UPDATE"
   #end add-point 
   LET g_forupd_sql = cl_sql_forupd(g_forupd_sql)
   DECLARE asrt337_01_bcl2 CURSOR FROM g_forupd_sql
 
 
 
   LET lb_reproduce = FALSE
   
   #add-point:input段修改前
   
   #end add-point
 
   LET INT_FLAG = 0
 
   DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         DISPLAY ARRAY g_sfhb_d TO s_detail1.* ATTRIBUTE(COUNT=g_detail_cnt) 
      
            BEFORE DISPLAY 
               #如果一直都在單頭則控制筆數位置
               IF g_loc = 'm' THEN
                  CALL FGL_SET_ARR_CURR(g_detail_idx)
               END IF
               LET g_loc = 'm'
               LET g_current_page = 1
	  
            BEFORE ROW
               LET g_detail_idx = DIALOG.getCurrentRow("s_detail1")
               LET l_ac = g_detail_idx
               LET g_master.* = g_sfhb_d[g_detail_idx].*
               CALL cl_show_fld_cont()
               CALL asrt337_01_fetch()
               CALL asrt337_01_idx_chk('m')
               
            #自訂ACTION(detail_show,page_1)
            
               
         END DISPLAY 
#      #Page1 預設值產生於此處
#      INPUT ARRAY g_sfhb_d FROM s_detail1.*
#          ATTRIBUTE(COUNT = g_detail_cnt,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
#                  INSERT ROW = ,
#                  DELETE ROW = ,
#                  APPEND ROW = )
# 
#         #自訂ACTION(detail_input,page_1)
#         
#         
#         BEFORE INPUT
#            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
#              CALL FGL_SET_ARR_CURR(g_sfhb_d.getLength()+1) 
#              LET g_insert = 'N' 
#           END IF 
# 
#            LET g_current_page = 1
#            IF p_cmd = 'u' THEN
#               CALL asrt337_01_b_fill(g_wc)
#            END IF
#            LET g_detail_cnt = g_sfhb_d.getLength()
#            #add-point:資料輸入前

#            #end add-point
#            
#         BEFORE ROW
#            LET l_cmd = ''
#            LET l_ac = ARR_CURR()
#            LET g_detail_idx = l_ac
#            LET g_master_t.* = g_sfhb_d[l_ac].*
#            LET g_master.* = g_sfhb_d[l_ac].*
#            LET l_lock_sw = 'N'            #DEFAULT
#            LET l_n = ARR_COUNT()
#            LET g_detail_idx = l_ac
#         
#            CALL s_transaction_begin()
#            LET g_detail_cnt = g_sfhb_d.getLength()
#            
#            IF g_detail_cnt >= l_ac 
#               AND g_sfhb_d[l_ac].sfhbdocno IS NOT NULL
#               AND g_sfhb_d[l_ac].sfhbseq IS NOT NULL
# 
#            THEN
#               LET l_cmd='u'
#               LET g_sfhb_d_t.* = g_sfhb_d[l_ac].*  #BACKUP
#               IF NOT asrt337_01_lock_b("sfhb_t") THEN
#                  LET l_lock_sw='Y'
#               ELSE
#                  FETCH asrt337_01_bcl INTO g_sfhb_d[l_ac].sfhbdocno,g_sfhb_d[l_ac].sfhbseq,g_sfhb_d[l_ac].sfhb001, 
#                      g_sfhb_d[l_ac].sfhb001_desc,g_sfhb_d[l_ac].sfhb001_desc1,g_sfhb_d[l_ac].sfhb002, 
#                      g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb003_desc,g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb004_desc, 
#                      g_sfhb_d[l_ac].sfhb005,g_sfhb_d[l_ac].sfhb006,g_sfhb_d[l_ac].sfhb007,g_sfhb_d[l_ac].sfhb007_desc, 
#                      g_sfhb_d[l_ac].sfhb008,g_sfhb_d[l_ac].sfhb009,g_sfhb_d[l_ac].sfhb009_desc,g_sfhb_d[l_ac].sfhb010, 
#                      g_sfhb_d[l_ac].sfhb011,g_sfhb_d[l_ac].sfhb012
#                  IF SQLCA.sqlcode THEN
#                     CALL cl_err(g_sfhb_d_t.sfhbdocno,SQLCA.sqlcode,1)
#                     LET l_lock_sw = "Y"
#                  END IF
#                  
#                  CALL asrt337_01_detail_show()
#                  CALL cl_show_fld_cont()
#               END IF
#            ELSE
#               LET l_cmd='a'
#            END IF
#            CALL asrt337_01_set_entry_b(l_cmd)
#            CALL asrt337_01_set_no_entry_b(l_cmd)
#            #add-point:input段before row

#            #end add-point  
#            #其他table資料備份(確定是否更改用)
#            
#            #其他table進行lock
#            
#            #讀取對應的單身資料
#            CALL asrt337_01_fetch()
#            CALL asrt337_01_idx_chk('m')
#        
#         BEFORE INSERT
#            
#            #判斷能否在此頁面進行資料新增
#            
#            #清空下層單身
#                        CALL g_sfhb2_d.clear()
# 
#            LET l_n = ARR_COUNT()
#            LET l_cmd = 'a'
#            INITIALIZE g_sfhb_d[l_ac].* TO NULL 
#            #公用欄位給值(單身)
#            
#            
#            LET g_sfhb_d_t.* = g_sfhb_d[l_ac].*     #新輸入資料
#            CALL cl_show_fld_cont()
#            CALL asrt337_01_set_entry_b("a")
#            CALL asrt337_01_set_no_entry_b("a")
#            IF lb_reproduce THEN
#               LET lb_reproduce = FALSE
#               LET g_sfhb_d[li_reproduce_target].* = g_sfhb_d[li_reproduce].*
# 
#               LET g_sfhb_d[g_sfhb_d.getLength()].sfhbdocno = NULL
#               LET g_sfhb_d[g_sfhb_d.getLength()].sfhbseq = NULL
# 
#            END IF
#            #add-point:input段before insert

#            #end add-point  
#  
#         AFTER INSERT
#            IF INT_FLAG THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = 9001
#               LET g_errparam.extend = ''
#               LET g_errparam.popup = FALSE
#               CALL cl_err()
 
#               LET INT_FLAG = 0
#               CANCEL INSERT
#            END IF
#            
#            LET l_count = 1  
#            SELECT COUNT(*) INTO l_count FROM sfhb_t 
#             WHERE sfhbent = g_enterprise AND sfhbdocno = g_sfhb_d[l_ac].sfhbdocno 
#                                       AND sfhbseq = g_sfhb_d[l_ac].sfhbseq 
# 
#                
#            #資料未重複, 插入新增資料
#            IF l_count = 0 THEN 
#               #add-point:單身新增前

#               #end add-point
#            
#                              INITIALIZE gs_keys TO NULL 
#               LET gs_keys[1] = g_sfhb_d[g_detail_idx].sfhbdocno
#               LET gs_keys[2] = g_sfhb_d[g_detail_idx].sfhbseq
#               CALL asrt337_01_insert_b('sfhb_t',gs_keys,"'1'")
#                           
#               #add-point:單身新增後

#               #end add-point
#            ELSE    
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = "std-00006"
#               LET g_errparam.extend = 'INSERT'
#               LET g_errparam.popup = TRUE
#               CALL cl_err()
 
#               INITIALIZE g_sfhb_d[l_ac].* TO NULL
#               CALL s_transaction_end('N','0')
#               CANCEL INSERT
#            END IF
# 
#            IF SQLCA.SQLcode  THEN
#               INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = SQLCA.sqlcode
#                  LET g_errparam.extend = "sfhb_t"
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
  
#               CALL s_transaction_end('N','0')                    
#               CANCEL INSERT
#            ELSE
#               #先刷新資料
#               #CALL asrt337_01_b_fill(g_wc)
#               #資料多語言用-增/改
#               
#               #add-point:input段-after_insert

#               #end add-point
#               CALL s_transaction_end('Y','0')
#               ERROR 'INSERT O.K'
#               LET g_detail_cnt = g_detail_cnt + 1
#               LET g_master.* = g_sfhb_d[l_ac].*
#            END IF
#              
#         BEFORE DELETE  #是否取消單身
#            IF l_cmd = 'a' AND g_sfhb_d.getLength() < l_ac THEN
#               CALL FGL_SET_ARR_CURR(l_ac-1)
#               CALL g_sfhb_d.deleteElement(l_ac)
#               NEXT FIELD sfhbdocno
#            END IF
#            IF g_sfhb_d[l_ac].sfhbdocno IS NOT NULL
#               AND g_sfhb_d_t.sfhbseq IS NOT NULL
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
 
#                  CANCEL DELETE
#               END IF
#               
#               #add-point:單身刪除前

#               #end add-point
#               
#               DELETE FROM sfhb_t
#                WHERE sfhbent = g_enterprise AND 
#                      sfhbdocno = g_sfhb_d_t.sfhbdocno
#                      AND sfhbseq = g_sfhb_d_t.sfhbseq
# 
#                      
#               #add-point:單身刪除中

#               #end add-point
#                      
#               IF SQLCA.sqlcode THEN
#                  INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = SQLCA.sqlcode
#                  LET g_errparam.extend = "sfhb_t"
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
 
#                  CALL s_transaction_end('N','0')
#                  CANCEL DELETE   
#               ELSE
#                  LET g_detail_cnt = g_detail_cnt-1
#                  
#                  #add-point:單身刪除後

#                  #end add-point
#                  CALL s_transaction_end('Y','0')
#               END IF 
#               CLOSE asrt337_01_bcl
#               LET l_count = g_sfhb_d.getLength()
#            END IF 
#            
#                           INITIALIZE gs_keys TO NULL 
#               LET gs_keys[1] = g_sfhb_d[g_detail_idx].sfhbdocno
#               LET gs_keys[2] = g_sfhb_d[g_detail_idx].sfhbseq
# 
#              
#         AFTER DELETE 
#            #add-point:單身刪除後2

#            #end add-point
#                           CALL asrt337_01_delete_b('sfhb_t',gs_keys,"'1'")
# 
#         #---------------------<  Detail: page1  >---------------------
#         #----<<sfhbdocno>>----
#         #----<<sfhbseq>>----
#         #----<<sfhb001>>----
#         #----<<sfhb001_desc>>----
#         #----<<sfhb001_desc1>>----
#         #----<<sfhb002>>----
#         #----<<sfhb003>>----
#         #----<<sfhb003_desc>>----
#         #----<<sfhb004>>----
#         #----<<sfhb004_desc>>----
#         #----<<sfhb005>>----
#         #----<<sfhb006>>----
#         #----<<sfhb007>>----
#         #----<<sfhb007_desc>>----
#         #----<<sfhb008>>----
#         #----<<sfhb009>>----
#         #----<<sfhb009_desc>>----
#         #----<<sfhb010>>----
#         #----<<sfhb011>>----
#         #----<<sfhb012>>----
# 
#         #---------------------<  Detail: page1  >---------------------
#         #----<<sfhbdocno>>----
#         #----<<sfhbseq>>----
#         #----<<sfhb001>>----
#         #----<<sfhb001_desc>>----
#         #----<<sfhb001_desc1>>----
#         #----<<sfhb002>>----
#         #----<<sfhb003>>----
#         #----<<sfhb003_desc>>----
#         #----<<sfhb004>>----
#         #----<<sfhb004_desc>>----
#         #----<<sfhb005>>----
#         #----<<sfhb006>>----
#         #----<<sfhb007>>----
#         #----<<sfhb007_desc>>----
#         #----<<sfhb008>>----
#         #----<<sfhb009>>----
#         #----<<sfhb009_desc>>----
#         #----<<sfhb010>>----
#         #----<<sfhb011>>----
#         #----<<sfhb012>>----
# 
# 
#         ON ROW CHANGE
#            IF INT_FLAG THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = 9001
#               LET g_errparam.extend = ''
#               LET g_errparam.popup = FALSE
#               CALL cl_err()
 
#               LET INT_FLAG = 0
#               LET g_sfhb_d[l_ac].* = g_sfhb_d_t.*
#               CLOSE asrt337_01_bcl
#               CALL s_transaction_end('N','0')
#               EXIT DIALOG 
#            END IF
#              
#            IF l_lock_sw = 'Y' THEN
#               CALL cl_err(g_sfhb_d[l_ac].sfhbdocno,-263,1)
#               LET g_sfhb_d[l_ac].* = g_sfhb_d_t.*
#            ELSE
#               
#               #寫入修改者/修改日期資訊(單身)
#               
#               
#               #add-point:單身修改前

#               #end add-point
#               
#               UPDATE sfhb_t SET (sfhbdocno,sfhbseq,sfhb001,sfhb002,sfhb003,sfhb004,sfhb005,sfhb006, 
#                   sfhb007,sfhb008,sfhb009,sfhb010,sfhb011,sfhb012) = (g_sfhb_d[l_ac].sfhbdocno,g_sfhb_d[l_ac].sfhbseq, 
#                   g_sfhb_d[l_ac].sfhb001,g_sfhb_d[l_ac].sfhb002,g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004, 
#                   g_sfhb_d[l_ac].sfhb005,g_sfhb_d[l_ac].sfhb006,g_sfhb_d[l_ac].sfhb007,g_sfhb_d[l_ac].sfhb008, 
#                   g_sfhb_d[l_ac].sfhb009,g_sfhb_d[l_ac].sfhb010,g_sfhb_d[l_ac].sfhb011,g_sfhb_d[l_ac].sfhb012) 
#
#                WHERE sfhbent = g_enterprise AND
#                  sfhbdocno = g_sfhb_d_t.sfhbdocno #項次   
#                  AND sfhbseq = g_sfhb_d_t.sfhbseq  
# 
#                  
#               #add-point:單身修改中

#               #end add-point
#                  
#               CASE
#                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
#                     CALL cl_err("sfhb_t","std-00009",1)
#                     CALL s_transaction_end('N','0')
#                     LET g_sfhb_d[l_ac].* = g_sfhb_d_t.*
#                  WHEN SQLCA.sqlcode #其他錯誤
#                     INITIALIZE g_errparam TO NULL
#                  LET g_errparam.code = SQLCA.sqlcode
#                  LET g_errparam.extend = "sfhb_t"
#                  LET g_errparam.popup = TRUE
#                  CALL cl_err()
  
#                     CALL s_transaction_end('N','0')
#                     LET g_sfhb_d[l_ac].* = g_sfhb_d_t.*
#                  OTHERWISE
#                                    INITIALIZE gs_keys TO NULL 
#               LET gs_keys[1] = g_sfhb_d[g_detail_idx].sfhbdocno
#               LET gs_keys_bak[1] = g_sfhb_d_t.sfhbdocno
#               LET gs_keys[2] = g_sfhb_d[g_detail_idx].sfhbseq
#               LET gs_keys_bak[2] = g_sfhb_d_t.sfhbseq
#               CALL asrt337_01_update_b('sfhb_t',gs_keys,gs_keys_bak,"'1'")
#                     #資料多語言用-增/改
#                     
#               END CASE
#               
#               #若Key欄位有變動
#               LET g_master.* = g_sfhb_d[l_ac].*
#               CALL asrt337_01_key_update_b()
#               
#               #add-point:單身修改後

#               #end add-point
# 
#            END IF
#            
#         AFTER ROW
#            CALL asrt337_01_unlock_b("sfhb_t")
#            CALL s_transaction_end('Y','0')
#            #其他table進行unlock
#            
#              
#         AFTER INPUT
#            #add-point:input段after input 

#            #end add-point   
#              
#         ON ACTION controlo   
#            CALL FGL_SET_ARR_CURR(g_sfhb_d.getLength()+1)
#            LET lb_reproduce = TRUE
#            LET li_reproduce = l_ac
#            LET li_reproduce_target = g_sfhb_d.getLength()+1
#              
#      END INPUT
      
 
      
      #實際單身段落
      INPUT ARRAY g_sfhb2_d FROM s_detail2.*
         ATTRIBUTE(COUNT = g_detail_cnt,MAXCOUNT = g_max_rec,WITHOUT DEFAULTS, 
                 INSERT ROW = l_allow_insert, #此頁面insert功能由產生器控制, 手動之設定無效! 
 
                 DELETE ROW = l_allow_delete,
                 APPEND ROW = l_allow_insert)
                 
         #自訂ACTION(detail_input,page_2)
         
         
         BEFORE INPUT
            IF g_insert = 'Y' AND NOT cl_null(g_insert) THEN 
              CALL FGL_SET_ARR_CURR(g_sfhb2_d.getLength()+1) 
              LET g_insert = 'N' 
           END IF 
 
            LET g_detail_cnt = g_sfhb2_d.getLength()
            LET g_current_page = 2
            #add-point:資料輸入前

            #end add-point
 
         BEFORE INSERT
            IF g_sfhb_d.getLength() = 0 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'std-00013'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               NEXT FIELD sfhbdocno
            END IF 
            #判斷能否在此頁面進行資料新增
            
            LET l_n = ARR_COUNT()
            LET l_cmd = 'a'
            INITIALIZE g_sfhb2_d[l_ac].* TO NULL 
            
            LET g_sfhb2_d_t.* = g_sfhb2_d[l_ac].*     #新輸入資料
            CALL cl_show_fld_cont()
            CALL asrt337_01_set_entry_b("a")
            CALL asrt337_01_set_no_entry_b("a")
            IF lb_reproduce THEN
               LET lb_reproduce = FALSE
               LET g_sfhb2_d[li_reproduce_target].* = g_sfhb2_d[li_reproduce].*
 
               LET g_sfhb2_d[li_reproduce_target].sfhcseq1 = NULL
            END IF
            #add-point:input段before insert
            LET g_sfhb2_d_o.* = g_sfhb2_d[l_ac].*       #150826-00008#6
            LET g_sfhb2_d[l_ac].sfhc003 = g_sfhb_d[g_detail_idx].sfhb003
            LET g_sfhb2_d[l_ac].sfhc004 = g_sfhb_d[g_detail_idx].sfhb004
            LET g_sfhb2_d[l_ac].sfhc005 = g_sfhb_d[g_detail_idx].sfhb005
            LET g_sfhb2_d[l_ac].sfhc006 = g_sfhb_d[g_detail_idx].sfhb006
            LET g_sfhb2_d[l_ac].sfhc008 = 0  
            LET g_sfhb2_d[l_ac].sfhc010 = 0  
            IF g_sfhb2_d[l_ac].sfhcseq1 IS NULL OR g_sfhb2_d[l_ac].sfhcseq1 = 0 THEN
               SELECT MAX(sfhcseq1)+1 INTO g_sfhb2_d[l_ac].sfhcseq1
                 FROM sfhc_t
                WHERE sfhcent   = g_enterprise 
                  AND sfhcdocno = g_sfhb_d[g_detail_idx].sfhbdocno
                  AND sfhcseq   = g_sfhb_d[g_detail_idx].sfhbseq

            END IF
            IF g_sfhb2_d[l_ac].sfhcseq1 IS NULL THEN
               LET g_sfhb2_d[l_ac].sfhcseq1 = 1
            END IF 
            CALL s_desc_get_stock_desc(g_site,g_sfhb2_d[l_ac].sfhc003)
            RETURNING g_sfhb2_d[l_ac].sfhc003_desc
            CALL s_desc_get_locator_desc(g_site,g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004)
            RETURNING g_sfhb2_d[l_ac].sfhc004_desc 
            #end add-point  
            
         BEFORE ROW 
            LET l_cmd = ''
            LET l_ac = ARR_CURR()
            LET g_detail_idx2 = l_ac
            LET l_lock_sw = 'N'            #DEFAULT
            LET l_n = ARR_COUNT()
            CALL s_transaction_begin()
            LET g_detail_cnt = g_sfhb2_d.getLength()
            
            IF g_detail_cnt >= l_ac 
               AND g_sfhb2_d[l_ac].sfhcseq1 IS NOT NULL
            THEN 
               LET l_cmd='u'
               LET g_sfhb2_d_t.* = g_sfhb2_d[l_ac].*  #BACKUP
               IF NOT asrt337_01_lock_b("sfhc_t") THEN
                  LET l_lock_sw='Y'
               ELSE
                  FETCH asrt337_01_bcl2 INTO g_sfhb2_d[l_ac].sfhcseq1,g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc003_desc, 
                      g_sfhb2_d[l_ac].sfhc004,g_sfhb2_d[l_ac].sfhc004_desc,g_sfhb2_d[l_ac].sfhc005,g_sfhb2_d[l_ac].sfhc006,
                      g_sfhb2_d[l_ac].sfhc008,g_sfhb2_d[l_ac].sfhc010
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = SQLCA.sqlcode
                     LET g_errparam.extend = ''
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
 
                     LET l_lock_sw = "Y"
                  END IF
                  CALL cl_show_fld_cont()
                  CALL asrt337_01_detail_show()
               END IF
            ELSE
               LET l_cmd='a'
            END IF
            CALL asrt337_01_set_entry_b(l_cmd)
            CALL asrt337_01_set_no_entry_b(l_cmd)
            #add-point:input段before row
            LET g_sfhb2_d_o.* = g_sfhb2_d[l_ac].*          #150826-00008#6
            CALL asrt337_01_set_no_required_b()
            CALL asrt337_01_set_required_b()
            CALL s_desc_get_stock_desc(g_site,g_sfhb2_d[l_ac].sfhc003)
            RETURNING g_sfhb2_d[l_ac].sfhc003_desc
            CALL s_desc_get_locator_desc(g_site,g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004)
            RETURNING g_sfhb2_d[l_ac].sfhc004_desc 
            #end add-point  
            #其他table資料備份(確定是否更改用)
            
            #其他table進行lock
            
            CALL asrt337_01_idx_chk('d')
            
         BEFORE DELETE                            #是否取消單身
            IF l_cmd = 'a' AND g_sfhb2_d.getLength() < l_ac THEN
               CALL FGL_SET_ARR_CURR(l_ac-1)
               CALL g_sfhb2_d.deleteElement(l_ac)
               NEXT FIELD sfhcseq1
            END IF
            IF g_sfhb2_d[l_ac].sfhcseq1 IS NOT NULL
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
               
               DELETE FROM sfhc_t
                WHERE sfhcent = g_enterprise AND
                   sfhcdocno = g_master.sfhbdocno
                   AND sfhcseq = g_master.sfhbseq
                   AND sfhcseq1 = g_sfhb2_d_t.sfhcseq1
                   
               #add-point:單身2刪除中

               #end add-point  
                   
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = "sfhb_t"
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
 
                  CALL s_transaction_end('N','0')
                  CANCEL DELETE   
               ELSE
                  LET g_detail_cnt = g_detail_cnt-1
                  
                  #add-point:單身2刪除後
                  #150826-00008#6-b
                  DELETE FROM inao_t
                   WHERE inaoent = g_enterprise
                     AND inaosite = g_site
                     AND inaodocno = g_master.sfhbdocno
                     AND inaoseq = g_master.sfhbseq
                     AND inaoseq1 = g_sfhb2_d_t.sfhcseq1
                     AND inao000 = '2'
                  #150826-00008#6-e    
                  #end add-point
                  CALL s_transaction_end('Y','0')
               END IF 
               CLOSE asrt337_01_bcl
               LET l_count = g_sfhb_d.getLength()
            END IF 
                           INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfhb_d[g_detail_idx].sfhbdocno
               LET gs_keys[2] = g_sfhb_d[g_detail_idx].sfhbseq
               LET gs_keys[3] = g_sfhb2_d[g_detail_idx2].sfhcseq1
 
            
         AFTER DELETE 
            #add-point:單身AFTER DELETE 

            #end add-point
                           CALL asrt337_01_delete_b('sfhc_t',gs_keys,"'2'")
 
         AFTER INSERT    
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
            SELECT COUNT(*) INTO l_count FROM sfhc_t 
             WHERE sfhcent = g_enterprise AND
                   sfhcdocno = g_master.sfhbdocno
                   AND sfhcseq = g_master.sfhbseq
                   AND sfhcseq1 = g_sfhb2_d[g_detail_idx2].sfhcseq1
                
            #資料未重複, 插入新增資料
            IF l_count = 0 THEN 
               #add-point:單身2新增前

               #end add-point
            
                              INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfhb_d[g_detail_idx].sfhbdocno
               LET gs_keys[2] = g_sfhb_d[g_detail_idx].sfhbseq
               LET gs_keys[3] = g_sfhb2_d[g_detail_idx2].sfhcseq1
               CALL asrt337_01_insert_b('sfhc_t',gs_keys,"'2'")
                           
               #add-point:單身新增後2

               #end add-point
            ELSE    
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "std-00006"
               LET g_errparam.extend = 'INSERT'
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               INITIALIZE g_sfhb_d[l_ac].* TO NULL
               CALL s_transaction_end('N','0')
               CANCEL INSERT
            END IF
 
            IF SQLCA.SQLcode  THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "sfhc_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
               CALL s_transaction_end('N','0')                    
               CANCEL INSERT
            ELSE
               #先刷新資料
               #CALL asrt337_01_b_fill(g_wc)
               #資料多語言用-增/改
               
               #add-point:單身新增後

               #end add-point
               CALL s_transaction_end('Y','0')
               ERROR 'INSERT O.K'
               LET g_detail_cnt = g_detail_cnt + 1
            END IF
            
         ON ROW CHANGE 
            IF INT_FLAG THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 9001
               LET g_errparam.extend = ''
               LET g_errparam.popup = FALSE
               CALL cl_err()
 
               LET INT_FLAG = 0
               LET g_sfhb2_d[l_ac].* = g_sfhb2_d_t.*
               CLOSE asrt337_01_bcl2
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
            
            IF l_lock_sw = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = -263
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()
 
               LET g_sfhb2_d[l_ac].* = g_sfhb2_d_t.*
            ELSE
               #寫入修改者/修改日期資訊(單身2)
               
               
               #add-point:單身page2修改前

               #end add-point
               
               UPDATE sfhc_t SET (sfhcseq1,sfhc003,sfhc004,sfhc005,sfhc006,sfhc008,sfhc010) = (g_sfhb2_d[l_ac].sfhcseq1, 
                   g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004,g_sfhb2_d[l_ac].sfhc005,g_sfhb2_d[l_ac].sfhc006,g_sfhb2_d[l_ac].sfhc008, 
                   g_sfhb2_d[l_ac].sfhc010) #自訂欄位頁簽
                WHERE sfhcent = g_enterprise AND
                   sfhcdocno = g_master.sfhbdocno
                   AND sfhcseq = g_master.sfhbseq
                   AND sfhcseq1 = g_sfhb2_d_t.sfhcseq1
                   
               #add-point:單身修改中

               #end add-point
                   
               CASE
                  WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
                     INITIALIZE g_errparam TO NULL
                     LET g_errparam.code = "std-00009"
                     LET g_errparam.extend = "sfhc_t"
                     LET g_errparam.popup = TRUE
                     CALL cl_err()
 
                     CALL s_transaction_end('N','0')
                     LET g_sfhb2_d[l_ac].* = g_sfhb2_d_t.*
                  WHEN SQLCA.sqlcode #其他錯誤
                     INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = "sfhc_t"
               LET g_errparam.popup = TRUE
               CALL cl_err()
  
                     CALL s_transaction_end('N','0')
                     LET g_sfhb2_d[l_ac].* = g_sfhb2_d_t.*
                  OTHERWISE
                                    INITIALIZE gs_keys TO NULL 
               LET gs_keys[1] = g_sfhb_d[g_detail_idx].sfhbdocno
               LET gs_keys_bak[1] = g_sfhb_d[g_detail_idx].sfhbdocno
               LET gs_keys[2] = g_sfhb_d[g_detail_idx].sfhbseq
               LET gs_keys_bak[2] = g_sfhb_d[g_detail_idx].sfhbseq
               LET gs_keys[3] = g_sfhb2_d[g_detail_idx2].sfhcseq1
               LET gs_keys_bak[3] = g_sfhb2_d_t.sfhcseq1
               CALL asrt337_01_update_b('sfhc_t',gs_keys,gs_keys_bak,"'2'")
                     #資料多語言用-增/改
                     
               END CASE
               #add-point:單身page2修改後

               #end add-point
            END IF
         
         #---------------------<  Detail: page2  >---------------------
         #----<<sfhcseq1>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhcseq1
            #add-point:BEFORE FIELD sfhcseq1
            IF g_sfhb2_d[l_ac].sfhcseq1 IS NULL OR g_sfhb2_d[l_ac].sfhcseq1 = 0 THEN
               SELECT MAX(sfhcseq1)+1 INTO g_sfhb2_d[l_ac].sfhcseq1
                 FROM sfhc_t
                WHERE sfhcent   = g_enterprise 
                  AND sfhcdocno = g_sfhb_d[g_detail_idx].sfhbdocno
                  AND sfhcseq   = g_sfhb_d[g_detail_idx].sfhbseq

            END IF
            IF g_sfhb2_d[l_ac].sfhcseq1 IS NULL THEN
               LET g_sfhb2_d[l_ac].sfhcseq1 = 1
            END IF 
            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhcseq1
            
            #add-point:AFTER FIELD sfhcseq1
            #此段落由子樣板a05產生
            IF  g_sfhb_d[g_detail_idx].sfhbdocno IS NOT NULL AND g_sfhb_d[g_detail_idx].sfhbseq IS NOT NULL AND g_sfhb2_d[g_detail_idx2].sfhcseq1 IS NOT NULL THEN 
               IF l_cmd = 'a' OR ( l_cmd = 'u' AND (g_sfhb_d[g_detail_idx].sfhbdocno != g_sfhb_d[g_detail_idx].sfhbdocno OR g_sfhb_d[g_detail_idx].sfhbseq != g_sfhb_d[g_detail_idx].sfhbseq OR g_sfhb2_d[g_detail_idx2].sfhcseq1 != g_sfhb2_d_t.sfhcseq1)) THEN 
                  IF NOT ap_chk_notDup("","SELECT COUNT(*) FROM sfhc_t WHERE "||"sfhcent = '" ||g_enterprise|| "' AND "||"sfhcdocno = '"||g_sfhb_d[g_detail_idx].sfhbdocno ||"' AND "|| "sfhcseq = '"||g_sfhb_d[g_detail_idx].sfhbseq ||"' AND "|| "sfhcseq1 = '"||g_sfhb2_d[g_detail_idx2].sfhcseq1 ||"'",'std-00004',0) THEN 
                     NEXT FIELD CURRENT
                  END IF
               END IF
            END IF


            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE sfhcseq1
            #add-point:ON CHANGE sfhcseq1

            #END add-point
 
         #----<<sfhc003>>----
         #此段落由子樣板a02產生
         AFTER FIELD sfhc003
            
            #add-point:AFTER FIELD sfhc003
            IF NOT cl_null(g_sfhb2_d[l_ac].sfhc003) THEN
              #IF l_cmd = 'a' OR (l_cmd = 'u' AND g_sfhb2_d[l_ac].sfhc003 <> g_sfhb2_d_t.sfhc003) THEN  #160824-00007#285 by sakura mark
               IF g_sfhb2_d[l_ac].sfhc003 <> g_sfhb2_d_o.sfhc003 OR cl_null(g_sfhb2_d_o.sfhc003) THEN   #160824-00007#285 by sakura add
                  #161006-00018#14--mod---e                   
                  #IF NOT s_asrt337_warehouse_chk(g_argv[1],g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004) THEN
                  #   LET g_sfhb2_d[l_ac].sfhc003 = g_sfhb2_d_t.sfhc003
                  #   NEXT FIELD CURRENT
                  #END IF
                  INITIALIZE g_chkparam.* TO NULL
                  #設定g_chkparam.*的參數      
                  LET g_chkparam.arg1 = g_site
                  LET g_chkparam.arg2 = g_sfhb2_d[l_ac].sfhc003
                  LET g_errshow = TRUE                                                                                                #160328-00029#3 add
                  LET g_chkparam.err_str[1] = "aim-00065:sub-01302|aini001|",cl_get_progname("aini001",g_lang,"2"),"|:EXEPROGaini001" #160328-00029#3 add
                  
                  #呼叫檢查存在並帶值的library
                  IF NOT cl_chk_exist("v_inaa001") THEN
                    #LET g_sfhb2_d[l_ac].sfhc003 = g_sfhb2_d_t.sfhc003   #160824-00007#285 by sakura mark
                     LET g_sfhb2_d[l_ac].sfhc003 = g_sfhb2_d_o.sfhc003   #160824-00007#285 by sakura add
                     NEXT FIELD CURRENT
                  END IF
                  LET g_sfhb2_d[l_ac].sfhc003 = ''
                  LET g_sfhb2_d[l_ac].sfhc003_desc = ''
                  #161006-00018#14--mod---e                   
               END IF               
               #150826-00008#6-b
               IF s_lot_batch_number(g_master.sfhb001,g_site) THEN
                  IF g_sfhb2_d[l_ac].sfhc003 <> g_sfhb2_d_o.sfhc003 OR g_sfhb2_d_o.sfhc003 IS NULL OR
                     g_sfhb2_d[l_ac].sfhc004 <> g_sfhb2_d_o.sfhc004 OR g_sfhb2_d_o.sfhc004 IS NULL OR
                     g_sfhb2_d[l_ac].sfhc005 <> g_sfhb2_d_o.sfhc005 OR g_sfhb2_d_o.sfhc005 IS NULL THEN
                     CALL s_lot_upd_inao(g_master.sfhbdocno,g_master.sfhbseq,g_sfhb2_d[l_ac].sfhcseq1,'2',g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004,g_sfhb2_d[l_ac].sfhc005,g_site,g_sfhb2_d[l_ac].sfhc006)   ##160316-00007#7 add sfhc006 
                        RETURNING l_success
                  END IF
               END IF                     
               #150826-00008#6-e              
            END IF
            CALL s_desc_get_stock_desc(g_site,g_sfhb2_d[l_ac].sfhc003)
            RETURNING g_sfhb2_d[l_ac].sfhc003_desc
            LET g_sfhb2_d_o.* = g_sfhb2_d[l_ac].*   #160824-00007#285 by sakura add
            #160824-00007#285 by sakura mark(S)
            #LET g_sfhb2_d_o.sfhc003 = g_sfhb2_d[l_ac].sfhc003    #150826-00008#6
            #LET g_sfhb2_d_o.sfhc004 = g_sfhb2_d[l_ac].sfhc004    #150826-00008#6
            #LET g_sfhb2_d_o.sfhc005 = g_sfhb2_d[l_ac].sfhc005    #150826-00008#6
            #160824-00007#285 by sakura mark(E)
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sfhc003
            #add-point:BEFORE FIELD sfhc003

            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sfhc003
            #add-point:ON CHANGE sfhc003

            #END add-point
 
         #----<<sfhc003_desc>>----
         #----<<sfhc004>>----
         #此段落由子樣板a02產生
         AFTER FIELD sfhc004
            
            #add-point:AFTER FIELD sfhc004
            IF NOT cl_null(g_sfhb2_d[l_ac].sfhc004) THEN
              #IF l_cmd = 'a' OR (l_cmd = 'u' AND (g_sfhb2_d_t.sfhc004 IS NULL OR g_sfhb2_d[l_ac].sfhc004 <> g_sfhb2_d_t.sfhc004)) THEN   #160824-00007#285 by sakura mark
               IF g_sfhb2_d_o.sfhc004 IS NULL OR g_sfhb2_d[l_ac].sfhc004 <> g_sfhb2_d_o.sfhc004 THEN   #160824-00007#285 by sakura add
                  #161006-00018#14--mod---s                  
                  #IF NOT s_asrt337_warehouse_chk(g_argv[1],g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004) THEN
                  #   LET g_sfhb2_d[l_ac].sfhc004 = g_sfhb2_d_t.sfhc004
                  #   NEXT FIELD CURRENT
                  #END IF
                  IF NOT cl_null(g_sfhb2_d[l_ac].sfhc003) THEN
                  　 INITIALIZE g_chkparam.* TO NULL
                  　 #設定g_chkparam.*的參數
                  　 LET g_chkparam.arg1 = g_site
                  　 LET g_chkparam.arg2 = g_sfhb2_d[l_ac].sfhc003
                  　 LET g_chkparam.arg3 = g_sfhb2_d[l_ac].sfhc004
                  　 LET g_errshow = TRUE                                                                                                #160328-00029#3 add
                  　 LET g_chkparam.err_str[1] = "aim-00063:sub-01302|aini002|",cl_get_progname("aini002",g_lang,"2"),"|:EXEPROGaini002" #160328-00029#3 add
                  　 
                  　 #呼叫檢查存在並帶值的library
                  　 IF NOT cl_chk_exist("v_inab002") THEN
                  　   #LET g_sfhb2_d[l_ac].sfhc004 = g_sfhb2_d_t.sfhc004   #160824-00007#285 by sakura mark
                        LET g_sfhb2_d[l_ac].sfhc004 = g_sfhb2_d_o.sfhc004   #160824-00007#285 by sakura add
                  　    NEXT FIELD CURRENT  
                  　 END IF
                     CALL s_aooi200_get_slip(g_master.sfhbdocno)
                          RETURNING l_success,l_slip
                     CALL s_control_chk_doc('6',l_slip,g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004,'','','')
                         RETURNING l_success,l_flag
                     IF NOT l_success OR NOT l_flag THEN
                  　   #LET g_sfhb2_d[l_ac].sfhc004 = g_sfhb2_d_t.sfhc004   #160824-00007#285 by sakura mark
                        LET g_sfhb2_d[l_ac].sfhc004 = g_sfhb2_d_o.sfhc004   #160824-00007#285 by sakura add
                  　    NEXT FIELD CURRENT
                     END IF                
                  END IF
                  #161006-00018#14--mod---e                  
               END IF
             
               #150826-00008#6-b
               IF s_lot_batch_number(g_master.sfhb001,g_site) THEN
                  IF g_sfhb2_d[l_ac].sfhc003 <> g_sfhb2_d_o.sfhc003 OR g_sfhb2_d_o.sfhc003 IS NULL OR
                     g_sfhb2_d[l_ac].sfhc004 <> g_sfhb2_d_o.sfhc004 OR g_sfhb2_d_o.sfhc004 IS NULL OR
                     g_sfhb2_d[l_ac].sfhc005 <> g_sfhb2_d_o.sfhc005 OR g_sfhb2_d_o.sfhc005 IS NULL THEN
                     CALL s_lot_upd_inao(g_master.sfhbdocno,g_master.sfhbseq,g_sfhb2_d[l_ac].sfhcseq1,'2',g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004,g_sfhb2_d[l_ac].sfhc005,g_site,g_sfhb2_d[l_ac].sfhc006)   ##160316-00007#7 add sfhc006
                        RETURNING l_success
                  END IF
               END IF                     
               #150826-00008#6-e                    
            END IF        
            CALL s_desc_get_locator_desc(g_site,g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004)
            RETURNING g_sfhb2_d[l_ac].sfhc004_desc
            LET g_sfhb2_d_o.* = g_sfhb2_d[l_ac].*   #160824-00007#285 by sakura add
            #160824-00007#285 by sakura mark(S)
            #LET g_sfhb2_d_o.sfhc003 = g_sfhb2_d[l_ac].sfhc003    #150826-00008#6
            #LET g_sfhb2_d_o.sfhc004 = g_sfhb2_d[l_ac].sfhc004    #150826-00008#6
            #LET g_sfhb2_d_o.sfhc005 = g_sfhb2_d[l_ac].sfhc005    #150826-00008#6 
            #160824-00007#285 by sakura mark(E)
            #END add-point
            
 
         #此段落由子樣板a01產生
         BEFORE FIELD sfhc004
            #add-point:BEFORE FIELD sfhc004

            #END add-point
 
         #此段落由子樣板a04產生
         ON CHANGE sfhc004
            #add-point:ON CHANGE sfhc004

            #END add-point
 
         #----<<sfhc004_desc>>----
         #----<<sfhc005>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhc005
            #add-point:BEFORE FIELD sfhc005

            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhc005
            
            #add-point:AFTER FIELD sfhc005
            IF g_sfhb2_d[l_ac].sfhc005 IS NULL THEN 
               LET g_sfhb2_d[l_ac].sfhc005 = ' ' 
            END IF 
          
            #150826-00008#6-b
            IF s_lot_batch_number(g_master.sfhb001,g_site) THEN
               IF g_sfhb2_d[l_ac].sfhc003 <> g_sfhb2_d_o.sfhc003 OR g_sfhb2_d_o.sfhc003 IS NULL OR
                  g_sfhb2_d[l_ac].sfhc004 <> g_sfhb2_d_o.sfhc004 OR g_sfhb2_d_o.sfhc004 IS NULL OR
                  g_sfhb2_d[l_ac].sfhc005 <> g_sfhb2_d_o.sfhc005 OR g_sfhb2_d_o.sfhc005 IS NULL THEN
                  CALL s_lot_upd_inao(g_master.sfhbdocno,g_master.sfhbseq,g_sfhb2_d[l_ac].sfhcseq1,'2',g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004,g_sfhb2_d[l_ac].sfhc005,g_site,g_sfhb2_d[l_ac].sfhc006)   ##160316-00007#7 add sfhc006
                     RETURNING l_success
               END IF
            END IF                     
            #150826-00008#6-e             
            LET g_sfhb2_d_o.sfhc003 = g_sfhb2_d[l_ac].sfhc003    #150826-00008#6
            LET g_sfhb2_d_o.sfhc004 = g_sfhb2_d[l_ac].sfhc004    #150826-00008#6
            LET g_sfhb2_d_o.sfhc005 = g_sfhb2_d[l_ac].sfhc005    #150826-00008#6 


         AFTER FIELD sfhc006
            
            #add-point:AFTER FIELD sfhc005
            #160316-00007#7---add---begin
            IF g_sfhb2_d[l_ac].sfhc006 IS NULL THEN 
               LET g_sfhb2_d[l_ac].sfhc006 = ' ' 
            END IF                 
            IF s_lot_batch_number(g_master.sfhb001,g_site) THEN
               IF g_sfhb2_d[l_ac].sfhc006 <> g_sfhb2_d_o.sfhc006 OR g_sfhb2_d_o.sfhc006 IS NULL THEN
                  CALL s_lot_upd_inao(g_master.sfhbdocno,g_master.sfhbseq,g_sfhb2_d[l_ac].sfhcseq1,'2',g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004,g_sfhb2_d[l_ac].sfhc005,g_site,g_sfhb2_d[l_ac].sfhc006)  
                     RETURNING l_success
               END IF
            END IF                     
            LET g_sfhb2_d_o.sfhc006 = g_sfhb2_d[l_ac].sfhc006   
            #160316-00007#7---add---end
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE sfhc005
            #add-point:ON CHANGE sfhc005

            #END add-point
 
         #----<<sfhc008>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhc008
            #add-point:BEFORE FIELD sfhc008

            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhc008
            
            #add-point:AFTER FIELD sfhc008
            #此段落由子樣板a15產生

            IF g_sfhb2_d[l_ac].sfhc008 IS NOT NULL THEN
              #IF l_cmd = 'a' OR (l_cmd= 'u' AND g_sfhb2_d[l_ac].sfhc008 <> g_sfhb2_d_t.sfhc008) THEN   #160824-00007#285 by sakura mark
               IF g_sfhb2_d[l_ac].sfhc008 <> g_sfhb2_d_o.sfhc008 OR cl_null(g_sfhb2_d_o.sfhc008) THEN   #160824-00007#285 by sakura add
                  #预设参考数量=数量*参考单位：单位换算率
                  CALL s_asrt337_get_sfhb010_default(g_sfhb_d[g_detail_idx].sfhb001,g_sfhb_d[g_detail_idx].sfhb007,g_sfhb2_d[l_ac].sfhc008,g_sfhb_d[g_detail_idx].sfhb009,g_sfhb2_d[l_ac].sfhc010)
                   RETURNING g_sfhb2_d[l_ac].sfhc010
                  #检查每个申请单身与对应的入库明细总数量匹配 
                   SELECT SUM(sfhc008) INTO l_sum_sfhc008
                     FROM sfhc_t
                    WHERE sfhcent   = g_enterprise
                      AND sfhcdocno = g_sfhb_d[g_detail_idx].sfhbdocno
                      AND sfhcseq   = g_sfhb_d[g_detail_idx].sfhbseq
                   
                   SELECT SUM(sfhb008) INTO l_sfhb008
                     FROM sfhb_t
                    WHERE sfhbent   = g_enterprise
                      AND sfhbdocno = g_sfhb_d[g_detail_idx].sfhbdocno
                      AND sfhbseq   = g_sfhb_d[g_detail_idx].sfhbseq
                      
                   IF l_sum_sfhc008 IS NULL THEN LET l_sum_sfhc008 = 0 END IF
                   IF l_sfhb008 IS NULL THEN LET l_sfhb008 = 0 END IF
                  #LET l_sfhc008_t = g_sfhb2_d_t.sfhc008
                   LET l_sfhc008_t = g_sfhb2_d_o.sfhc008
                   IF l_sfhc008_t IS NULL THEN LET l_sfhc008_t = 0 END IF
                   
                   IF l_sum_sfhc008 - l_sfhc008_t + g_sfhb2_d[l_ac].sfhc008 > l_sfhb008 THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = 'asf-00307'
                      LET g_errparam.extend = ''
                      LET g_errparam.popup = TRUE
                      CALL cl_err()

                     #LET g_sfhb2_d[l_ac].sfhc008 = g_sfhb2_d_t.sfhc008   #160824-00007#285 by sakura mark
                      LET g_sfhb2_d[l_ac].sfhc008 = g_sfhb2_d_o.sfhc008   #160824-00007#285 by sakura add
                      NEXT FIELD sfhc008
                   END IF
                END IF
                #150826-00008#6-b
                IF g_sfhb2_d[l_ac].sfhc008 <> g_sfhb2_d_o.sfhc008 OR cl_null(g_sfhb2_d_o.sfhc008) THEN    
                   IF s_lot_batch_number(g_sfhb_d[g_detail_idx].sfhb001,g_site) THEN
                      #資料抓取來源'1'代表從現有的製造批序號庫存明細檔inai_t中抓出資料供挑選
                      #           '2'代表從單據對應的申請資料inao_t中抓取出資料供挑選
                      #    資料類型:1.申請資料， 2.實際異動資料
                      CALL s_lot_sel('2','2',
                                     #營運據點 目的單據編號
                                     g_site,g_sfhb_d[g_detail_idx].sfhbdocno,
                                     #目的單據項次                    目的單據項序(若單據沒有到項序層則此參數固定傳0)
                                     g_sfhb_d[g_detail_idx].sfhbseq,g_sfhb2_d[l_ac].sfhcseq1,
                                     #料件編號                        產品特徵
                                     g_sfhb_d[g_detail_idx].sfhb001,g_sfhb_d[g_detail_idx].sfhb002,
                                     #庫存管理特徵                   庫位                    
                                     g_sfhb2_d[l_ac].sfhc006,g_sfhb2_d[l_ac].sfhc003,
                                     #儲位                          批號                     
                                     g_sfhb2_d[l_ac].sfhc004,g_sfhb2_d[l_ac].sfhc005,
                                     #交易單位                      交易數量                 
                                     g_sfhb_d[g_detail_idx].sfhb007,g_sfhb2_d[l_ac].sfhc008,
                                     #'入庫'  作業編號 營運據點
                                     '1',g_prog,g_site,
                                     #来源單據編號       来源單據項次
                                     g_sfhb_d[g_detail_idx].sfhbdocno,g_sfhb_d[g_detail_idx].sfhbseq,
                                     #来源單據項序(若單據沒有到項序層則此參數固定傳0)  启用来源单据
                                     '','1'
                                     )
                           RETURNING l_success                        
                   END IF
                END IF   
                #150826-00008#6-e                
            END IF
            LET g_sfhb2_d_o.*  = g_sfhb2_d[l_ac].*   #160824-00007#285 by sakura add
           #LET g_sfhb2_d_o.sfhc008  = g_sfhb2_d[l_ac].sfhc008    #150826-00008#6   #160824-00007#285 by sakura mark
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE sfhc008
            #add-point:ON CHANGE sfhc008

            #END add-point
 
         #----<<sfhc010>>----
         #此段落由子樣板a01產生
         BEFORE FIELD sfhc010
            #add-point:BEFORE FIELD sfhc010

            #END add-point
 
         #此段落由子樣板a02產生
         AFTER FIELD sfhc010
            
            #add-point:AFTER FIELD sfhc010
            #此段落由子樣板a15產生
            IF g_sfhb2_d[l_ac].sfhc010 IS NOT NULL THEN
               IF l_cmd = 'a' OR (l_cmd= 'u' AND g_sfhb2_d[l_ac].sfhc010 <> g_sfhb2_d_t.sfhc010) THEN
#检查每个申请单身与对应的入库明细总数量匹配 
                   SELECT SUM(sfhc010) INTO l_sum_sfhc010
                     FROM sfhc_t
                    WHERE sfhcent   = g_enterprise
                      AND sfhcdocno = g_sfhb_d[g_detail_idx].sfhbdocno
                      AND sfhcseq   = g_sfhb_d[g_detail_idx].sfhbseq
                   
                   SELECT SUM(sfhb010) INTO l_sfhb010
                     FROM sfhb_t
                    WHERE sfhbent   = g_enterprise
                      AND sfhbdocno = g_sfhb_d[g_detail_idx].sfhbdocno
                      AND sfhbseq   = g_sfhb_d[g_detail_idx].sfhbseq
                      
                   IF l_sum_sfhc010 IS NULL THEN LET l_sum_sfhc010 = 0 END IF
                   IF l_sfhb010 IS NULL THEN LET l_sfhb010 = 0 END IF
                   LET l_sfhc010_t = g_sfhb2_d_t.sfhc010
                   IF l_sfhc010_t IS NULL THEN LET l_sfhc010_t = 0 END IF
                   
                   IF l_sum_sfhc010 - l_sfhc010_t + g_sfhb2_d[l_ac].sfhc010 > l_sfhb010 THEN
                      INITIALIZE g_errparam TO NULL
                      LET g_errparam.code = 'asf-00307'
                      LET g_errparam.extend = ''
                      LET g_errparam.popup = TRUE
                      CALL cl_err()

                      LET g_sfhb2_d[l_ac].sfhc010 = g_sfhb2_d_t.sfhc010
                      NEXT FIELD sfhc010
                   END IF
                        
                END IF
            END IF
            #END add-point
            
 
         #此段落由子樣板a04產生
         ON CHANGE sfhc010
            #add-point:ON CHANGE sfhc010

            #END add-point
 
 
         #---------------------<  Detail: page2  >---------------------
         #----<<sfhcseq1>>----
         #Ctrlp:input.c.page2.sfhcseq1
         ON ACTION controlp INFIELD sfhcseq1
            #add-point:ON ACTION controlp INFIELD sfhcseq1

            #END add-point
 
         #----<<sfhc003>>----
         #Ctrlp:input.c.page2.sfhc003
         ON ACTION controlp INFIELD sfhc003
            #add-point:ON ACTION controlp INFIELD sfhc003
#此段落由子樣板a07產生            
            #開窗i段
			   INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
			   LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfhb2_d[l_ac].sfhc003             #給予default值

            #給予arg
            LET l_sql1 = ''
            LET g_qryparam.where = ' 1=1'
            CALL s_control_get_doc_sql("inaa001",g_sfhb_d[g_detail_idx].sfhbdocno,'6') RETURNING l_success,l_sql1
            IF l_success THEN
               LET g_qryparam.where = g_qryparam.where ," AND ",l_sql1
            END IF
            LET g_qryparam.where = g_qryparam.where ," AND inaa016 = 'N' "
            CALL q_inaa001_2()

            LET g_sfhb2_d[l_ac].sfhc003 = g_qryparam.return1              #將開窗取得的值回傳到變數

            DISPLAY g_sfhb2_d[l_ac].sfhc003 TO sfhc003              #顯示到畫面上

            NEXT FIELD sfhc003                          #返回原欄位


            #END add-point
 
         #----<<sfhc003_desc>>----
         #----<<sfhc004>>----
         #Ctrlp:input.c.page2.sfhc004
         ON ACTION controlp INFIELD sfhc004
            #add-point:ON ACTION controlp INFIELD sfhc004
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i'
            LET g_qryparam.reqry = FALSE

            LET g_qryparam.default1 = g_sfhb2_d[l_ac].sfhc004             #給予default值
            
            LET g_qryparam.where = " inab001 = '",g_sfhb2_d[l_ac].sfhc003,"' "
            CALL q_inab002()
            LET g_sfhb2_d[l_ac].sfhc004 = g_qryparam.return1              #將開窗取得的值回傳到變數
            #END add-point
 
         #----<<sfhc004_desc>>----
         #----<<sfhc005>>----
         #Ctrlp:input.c.page2.sfhc005
         ON ACTION controlp INFIELD sfhc005
            #add-point:ON ACTION controlp INFIELD sfhc005

            #END add-point
 
         #----<<sfhc008>>----
         #Ctrlp:input.c.page2.sfhc008
         ON ACTION controlp INFIELD sfhc008
            #add-point:ON ACTION controlp INFIELD sfhc008

            #END add-point
 
         #----<<sfhc010>>----
         #Ctrlp:input.c.page2.sfhc010
         ON ACTION controlp INFIELD sfhc010
            #add-point:ON ACTION controlp INFIELD sfhc010

            #END add-point
 
 
 
         AFTER ROW
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
                  LET g_sfhb2_d[l_ac].* = g_sfhb2_d_t.*
               END IF
               CLOSE asrt337_01_bcl2
               CALL s_transaction_end('N','0')
               EXIT DIALOG 
            END IF
            
            #其他table進行unlock
            
 
            CALL asrt337_01_unlock_b("sfhc_t")
            CALL s_transaction_end('Y','0')
 
         AFTER INPUT
            #add-point:input段after input 
#检查每个申请单身与对应的入库明细总数量匹配 
            SELECT SUM(sfhc008) INTO l_sum_sfhc008
              FROM sfhc_t
             WHERE sfhcent   = g_enterprise
               AND sfhcdocno = g_sfhb_d[g_detail_idx].sfhbdocno
               AND sfhcseq   = g_sfhb_d[g_detail_idx].sfhbseq
            
            SELECT SUM(sfhb008) INTO l_sfhb008
              FROM sfhb_t
             WHERE sfhbent   = g_enterprise
               AND sfhbdocno = g_sfhb_d[g_detail_idx].sfhbdocno
               AND sfhbseq   = g_sfhb_d[g_detail_idx].sfhbseq
               
            IF l_sum_sfhc008 IS NULL THEN LET l_sum_sfhc008 = 0 END IF
            IF l_sfhb008 IS NULL THEN LET l_sfhb008 = 0 END IF
            
            IF l_sum_sfhc008 <> l_sfhb008 THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00171'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

               NEXT FIELD sfhc008
            END IF
            
#检查每个申请单身与对应的入库明细总数量匹配 
            IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  ='N' THEN
               SELECT SUM(sfhc010) INTO l_sum_sfhc010
                 FROM sfhc_t
                WHERE sfhcent   = g_enterprise
                  AND sfhcdocno = g_sfhb_d[g_detail_idx].sfhbdocno
                  AND sfhcseq   = g_sfhb_d[g_detail_idx].sfhbseq
               
               SELECT SUM(sfhb010) INTO l_sfhb010
                 FROM sfhb_t
                WHERE sfhbent   = g_enterprise
                  AND sfhbdocno = g_sfhb_d[g_detail_idx].sfhbdocno
                  AND sfhbseq   = g_sfhb_d[g_detail_idx].sfhbseq
                  
               IF l_sum_sfhc010 IS NULL THEN LET l_sum_sfhc010 = 0 END IF
               IF l_sfhb010 IS NULL THEN LET l_sfhb010 = 0 END IF
               
               IF l_sum_sfhc010 <> l_sfhb010 THEN
                  INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'asf-00171'
               LET g_errparam.extend = ''
               LET g_errparam.popup = TRUE
               CALL cl_err()

                  NEXT FIELD sfhc010
               END IF
            END IF
            CALL asrt337_01_b_fill(g_wc)
            #end add-point   
 
         ON ACTION controlo   
            CALL FGL_SET_ARR_CURR(g_sfhb2_d.getLength()+1)
            LET lb_reproduce = TRUE
            LET li_reproduce = l_ac
            LET li_reproduce_target = g_sfhb2_d.getLength()+1
 
      END INPUT
 
      
 
    
 
      
      #add-point:input段input_array"

      #end add-point
      
      BEFORE DIALOG 
         LET g_curr_diag = ui.DIALOG.getCurrent()
         IF g_detail_idx > 0 THEN
            IF g_detail_idx > g_sfhb_d.getLength() THEN
               LET g_detail_idx = g_sfhb_d.getLength()
            END IF
            CALL DIALOG.setCurrentRow("s_detail1", g_detail_idx)
            LET l_ac = g_detail_idx
         END IF 
         LET g_detail_idx = l_ac
         #add-point:input段input_array"

         #end add-point
         #先確定單頭(第一單身)是否有資料
         IF g_sfhb_d.getLength() > 0 THEN
            CASE g_aw
               WHEN "s_detail1"
                  NEXT FIELD sfhbdocno
               WHEN "s_detail2"
                  NEXT FIELD sfhcseq1
 
            END CASE
         ELSE
            NEXT FIELD sfhbdocno
         END IF
   
      ON ACTION accept
         ACCEPT DIALOG
      
      ON ACTION cancel
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION close
         LET INT_FLAG = TRUE 
         EXIT DIALOG
 
      ON ACTION controlr
         CALL cl_show_req_fields()
 
      ON ACTION controlf
         CALL cl_set_focus_form(ui.Interface.getRootNode()) 
              RETURNING g_fld_name,g_frm_name 
         CALL cl_fldhelp(g_frm_name,g_fld_name,g_lang) 
           
      #交談指令共用ACTION
      &include "common_action.4gl"
         CONTINUE DIALOG
   
   END DIALOG 
   
   #add-point:input段修改後

   #end add-point
 
   CLOSE asrt337_01_bcl
   CALL s_transaction_end('Y','0')
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.b_fill" >}
#+ 單身陣列填充
PRIVATE FUNCTION asrt337_01_b_fill(p_wc2)
   DEFINE p_wc2           STRING
   DEFINE l_ac_t          LIKE type_t.num5
   #add-point:b_fill段define
   
   #end add-point
 
   #add-point:b_fill段sql_before
   
   #end add-point
   
   LET g_sql = "SELECT  UNIQUE sfhbdocno,sfhbseq,sfhb001,'','',sfhb002,sfhb003,'',sfhb004,'',sfhb005, 
       sfhb006,sfhb007,'',sfhb008,sfhb009,'',sfhb010,sfhb011,sfhb012 FROM sfhb_t",
 
               " LEFT JOIN sfhc_t ON sfhcent = sfhbent AND sfhbdocno = sfhcdocno AND sfhbseq = sfhcseq",
 
 
               "",
               " WHERE sfhbent= ? AND 1=1 AND ", p_wc2
    
   LET g_sql = g_sql, #,cl_get_extra_cond('zzuser', 'zzgrup')
                      " ORDER BY sfhb_t.sfhbdocno,sfhb_t.sfhbseq"
  
   #add-point:b_fill段sql_after
   
   #end add-point
  
   PREPARE asrt337_01_pb FROM g_sql
   DECLARE b_fill_curs CURSOR FOR asrt337_01_pb
   
   OPEN b_fill_curs USING g_enterprise
 
   CALL g_sfhb_d.clear()
   CALL g_sfhb2_d.clear()   
 
 
   LET g_cnt = l_ac
   LET l_ac = 1   
   ERROR "Searching!" 
 
   FOREACH b_fill_curs INTO g_sfhb_d[l_ac].sfhbdocno,g_sfhb_d[l_ac].sfhbseq,g_sfhb_d[l_ac].sfhb001,g_sfhb_d[l_ac].sfhb001_desc, 
       g_sfhb_d[l_ac].sfhb001_desc1,g_sfhb_d[l_ac].sfhb002,g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb003_desc, 
       g_sfhb_d[l_ac].sfhb004,g_sfhb_d[l_ac].sfhb004_desc,g_sfhb_d[l_ac].sfhb005,g_sfhb_d[l_ac].sfhb006, 
       g_sfhb_d[l_ac].sfhb007,g_sfhb_d[l_ac].sfhb007_desc,g_sfhb_d[l_ac].sfhb008,g_sfhb_d[l_ac].sfhb009, 
       g_sfhb_d[l_ac].sfhb009_desc,g_sfhb_d[l_ac].sfhb010,g_sfhb_d[l_ac].sfhb011,g_sfhb_d[l_ac].sfhb012 
 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
 
         EXIT FOREACH
      END IF
  
      #add-point:b_fill段資料填充
      CALL s_desc_get_item_desc(g_sfhb_d[l_ac].sfhb001)
      RETURNING g_sfhb_d[l_ac].sfhb001_desc,g_sfhb_d[l_ac].sfhb001_desc1 
      
      CALL s_desc_get_unit_desc(g_sfhb_d[l_ac].sfhb007)
      RETURNING g_sfhb_d[l_ac].sfhb007_desc

      CALL s_desc_get_unit_desc(g_sfhb_d[l_ac].sfhb009)
      RETURNING g_sfhb_d[l_ac].sfhb009_desc
      
      CALL s_desc_get_stock_desc(g_site,g_sfhb_d[l_ac].sfhb003)
      RETURNING g_sfhb_d[l_ac].sfhb003_desc
      
      CALL s_desc_get_locator_desc(g_site,g_sfhb_d[l_ac].sfhb003,g_sfhb_d[l_ac].sfhb004)
      RETURNING g_sfhb_d[l_ac].sfhb004_desc
      #end add-point
      
      CALL asrt337_01_detail_show()      
 
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
   LET g_error_show = 0
   
 
   CALL g_sfhb_d.deleteElement(g_sfhb_d.getLength())   
   CALL g_sfhb2_d.deleteElement(g_sfhb2_d.getLength())
 
 
   #確定指標無超過上限, 超過則指到最後一筆
   IF g_detail_idx > g_sfhb_d.getLength() THEN
      LET g_detail_idx = g_sfhb_d.getLength()
   END IF
 
   #將key欄位填到每個page
   LET l_ac_t = g_detail_idx
   FOR g_detail_idx = 1 TO g_sfhb_d.getLength()
      #LET g_sfhb2_d[g_detail_idx2].sfhcseq1 = g_sfhb_d[g_detail_idx].sfhbdocno 
 
   END FOR
   LET g_detail_idx = l_ac_t
   
   #add-point:b_fill段資料填充(其他單身)
   
   #end add-point
    
   LET g_detail_cnt = l_ac - 1
   DISPLAY g_detail_cnt TO FORMONLY.h_count
   LET l_ac = g_cnt
   LET g_cnt = 0
   
   CLOSE b_fill_curs
   FREE asrt337_01_pb
   
   LET l_ac = 1
   IF g_sfhb_d.getLength() > 0 THEN
      CALL asrt337_01_fetch()
   END IF
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.fetch" >}
#+ 單身陣列填充2
PRIVATE FUNCTION asrt337_01_fetch()
   DEFINE li_ac           LIKE type_t.num5
   #add-point:fetch段define

   #end add-point
   
   #判定單頭是否有資料
   IF cl_null(g_sfhb_d[g_detail_idx].sfhbdocno) THEN
      RETURN
   END IF
   
   CALL g_sfhb2_d.clear()
 
   
   LET li_ac = l_ac 
   
   LET g_sql = "SELECT  UNIQUE sfhcseq1,sfhc003,'',sfhc004,'',sfhc005,sfhc006,sfhc008,sfhc010 FROM sfhc_t",  
          
               "",
               " WHERE sfhcent=? AND sfhcdocno=? AND sfhcseq=?"
 
   IF NOT cl_null(g_wc2_table2) THEN
      LET g_sql = g_sql CLIPPED," AND ",g_wc2_table2 CLIPPED
   END IF
 
   LET g_sql = g_sql, " ORDER BY sfhc_t.sfhcseq1" 
                      
   #add-point:單身填充前

   #end add-point
   
   PREPARE asrt337_01_pb2 FROM g_sql
   DECLARE b_fill_curs2 CURSOR FOR asrt337_01_pb2
   
   OPEN b_fill_curs2 USING g_enterprise,g_sfhb_d[g_detail_idx].sfhbdocno
                                  ,g_sfhb_d[g_detail_idx].sfhbseq
 
   LET l_ac = 1
   FOREACH b_fill_curs2 INTO g_sfhb2_d[l_ac].sfhcseq1,g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc003_desc, 
       g_sfhb2_d[l_ac].sfhc004,g_sfhb2_d[l_ac].sfhc004_desc,g_sfhb2_d[l_ac].sfhc005,g_sfhb2_d[l_ac].sfhc006,
       g_sfhb2_d[l_ac].sfhc008,g_sfhb2_d[l_ac].sfhc010
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "FOREACH:"
         LET g_errparam.popup = TRUE
         CALL cl_err()
 
         EXIT FOREACH
      END IF
      
      #add-point:b_fill段資料填充
      CALL s_desc_get_stock_desc(g_site,g_sfhb2_d[l_ac].sfhc003)
      RETURNING g_sfhb2_d[l_ac].sfhc003_desc
      
      CALL s_desc_get_locator_desc(g_site,g_sfhb2_d[l_ac].sfhc003,g_sfhb2_d[l_ac].sfhc004)
      RETURNING g_sfhb2_d[l_ac].sfhc004_desc   
      #end add-point
      
      LET l_ac = l_ac + 1
      IF l_ac > g_max_rec THEN
         EXIT FOREACH
      END IF
      
   END FOREACH
 
 
 
   #add-point:單身填充後

   #end add-point
   
   CALL g_sfhb2_d.deleteElement(g_sfhb2_d.getLength())   
 
   
   LET l_ac = li_ac
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.detail_show" >}
#+ 顯示相關資料
PRIVATE FUNCTION asrt337_01_detail_show()
   #add-point:show段define
   DEFINE l_ac1   LIKE type_t.num5
   #end add-point
 
   #add-point:detail_show段之前
 
   #end add-point
   
   
   
   #帶出公用欄位reference值page1
   
    
   #帶出公用欄位reference值page2
   
 
   
   #讀入ref值
   #add-point:show段單身reference
 
   #end add-point
   
   #add-point:show段單身reference
   
   #end add-point
 
   
   #add-point:detail_show段之後
   
   #end add-point
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.set_entry_b" >}
#+ 單身欄位開啟設定
PRIVATE FUNCTION asrt337_01_set_entry_b(p_cmd)                                                  
   DEFINE p_cmd   LIKE type_t.chr1         
   #add-point:set_entry_b段define
   
   #end add-point
   
   #add-point:set_entry段欄位控制後
   CALL cl_set_comp_entry("sfhc005,sfhc010",TRUE) 
   CALL cl_set_comp_entry("sfhc003,sfhc004",TRUE)   #161006-00018#14
   #end add-point 
                                                                     
END FUNCTION                                                                    
 
{</section>}
 
{<section id="asrt337_01.set_no_entry_b" >}
#+ 單身欄位關閉設定
PRIVATE FUNCTION asrt337_01_set_no_entry_b(p_cmd)                                               
   DEFINE p_cmd   LIKE type_t.chr1           
   #add-point:set_no_entry_b段define
   DEFINE l_inaa007  LIKE inaa_t.inaa007
   DEFINE l_imaf061  LIKE imaf_t.imaf061 
   DEFINE l_success  LIKE type_t.num5      #161006-00018#14
   DEFINE l_ooba002   LIKE ooba_t.ooba002  #161006-00018#14
   DEFINE l_mfg_0085  LIKE type_t.chr1     #161006-00018#14   
   #end add-point
   
   #add-point:set_no_entry段欄位控制後
   #若設定imaf055(庫存管理特徵)等於'0.無'時，則[C:庫存管理特徵]欄位不可輸入
   SELECT imaf061 INTO l_imaf061 FROM imaf_t WHERE imafent = g_enterprise AND imaf001 = g_sfhb_d[g_detail_idx].sfhb001 AND imafsite = g_site
   #[T:料件據點進銷存檔].[C:庫存批號控管]=2時,[C:批號]欄位不可輸入
   IF l_imaf061 ='2' THEN
      CALL cl_set_comp_entry("sfhc005",FALSE)
      LET g_sfhb2_d[l_ac].sfhc005 = ''      
   END IF
   
   #若[T:庫位資料檔].[C:儲位管理]='5'(不使用儲位管理)時，則[C:限定儲位]不可以維護
   SELECT inaa007 INTO l_inaa007 FROM inaa_t WHERE inaaent = g_enterprise AND inaasite = g_site AND inaa001 = g_sfhb2_d[l_ac].sfhc003
   IF l_inaa007 = '5' THEN
      CALL cl_set_comp_entry("sfhc004",FALSE)
      LET g_sfhb2_d[l_ac].sfhc004 = ' '
      LET g_sfhb2_d[l_ac].sfhc004_desc = ''
   END IF
   
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  ='N' THEN   
      LET g_sfhb2_d[l_ac].sfhc010 = ''
      CALL cl_set_comp_entry("sfhc010",FALSE)
   END IF 
   #161006-00018#14---add---s
   LET l_ooba002 = ''
   CALL s_aooi200_get_slip(g_master.sfhbdocno) RETURNING l_success,l_ooba002
   CALL cl_get_doc_para(g_enterprise,g_site,l_ooba002,'D-MFG-0085') RETURNING l_mfg_0085 
   IF l_mfg_0085 <> 'Y' THEN
      IF NOT cl_null(g_master.sfhb003) THEN 
         CALL cl_set_comp_entry("sfhc003",FALSE)
      END IF
      IF NOT cl_null(g_master.sfhb004) THEN 
         CALL cl_set_comp_entry("sfhc004",FALSE)
      END IF 
      IF NOT cl_null(g_master.sfhb005) THEN 
         CALL cl_set_comp_entry("sfhc005",FALSE)
      END IF       
   END IF   
   #161006-00018#14---add---e
   #end add-point 
                                                                          
END FUNCTION  
 
{</section>}
 
{<section id="asrt337_01.default_search" >}
#+ 外部參數搜尋
PRIVATE FUNCTION asrt337_01_default_search()
   DEFINE li_idx  LIKE type_t.num5
   DEFINE li_cnt  LIKE type_t.num5
   DEFINE ls_wc   STRING
   #add-point:default_search段define
   
   #end add-point  
   
   IF NOT cl_null(g_argv[1]) THEN
      LET ls_wc = ls_wc, " sfhbdocno = '", g_argv[1], "' AND "
   END IF
   
   IF NOT cl_null(g_argv[02]) THEN
      LET ls_wc = ls_wc, " sfhbseq = ", g_argv[02], " AND "
   END IF
 
   
   IF NOT cl_null(ls_wc) THEN
      LET ls_wc = ls_wc.subString(1,ls_wc.getLength()-5)
      LET g_wc = ls_wc
   ELSE
      LET g_wc = " 1=1"
   END IF
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.delete_b" >}
#+ 刪除單身後其他table連動
PRIVATE FUNCTION asrt337_01_delete_b(ps_table,ps_keys_bak,ps_page)
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys_bak DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   #add-point:delete_b段define
   
   #end add-point     
 
   #判斷是否是同一群組的table
   LET ls_group = "sfhb_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      #add-point:delete_b段刪除前
      
      #end add-point  
      DELETE FROM sfhb_t
       WHERE sfhbent = g_enterprise AND
         sfhbdocno = ps_keys_bak[1] AND sfhbseq = ps_keys_bak[2]
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
   
 
   
   LET ls_group = "sfhc_t,"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      #add-point:delete_b段刪除前
      
      #end add-point  
      DELETE FROM sfhc_t
       WHERE sfhcent = g_enterprise AND
         sfhcdocno = ps_keys_bak[1] AND sfhcseq = ps_keys_bak[2] AND sfhcseq1 = ps_keys_bak[3]
      #add-point:delete_b段刪除中
 
      #end add-point  
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "sfhc_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
      END IF
      #add-point:delete_b段刪除後
      
      #end add-point  
      RETURN
   END IF
 
 
   
   #單頭刪除, 連帶刪除單身
   LET ls_group = "sfhb_t,"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      #add-point:delete_b段刪除前
      
      #end add-point  
      DELETE FROM sfhc_t
       WHERE sfhcent = g_enterprise AND
         sfhcdocno = ps_keys_bak[1] AND sfhcseq = ps_keys_bak[2]
      #add-point:delete_b段刪除中
      
      #end add-point  
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "sfhc_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
      END IF
      #add-point:delete_b段刪除後
      
      #end add-point  
      RETURN
   END IF
 
 
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.insert_b" >}
#+ 新增單身後其他table連動
PRIVATE FUNCTION asrt337_01_insert_b(ps_table,ps_keys,ps_page)
   DEFINE ps_table    STRING
   DEFINE ps_page     STRING
   DEFINE ps_keys     DYNAMIC ARRAY OF VARCHAR(500)
   DEFINE ls_group    STRING
   #add-point:insert_b段define
   
   #end add-point
 
   #判斷是否是同一群組的table
   LET ls_group = "sfhb_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      #add-point:insert_b段新增前
      
      #end add-point
      INSERT INTO sfhb_t
                  (sfhbent,
                   sfhbdocno,sfhbseq
                   ,sfhb001,sfhb002,sfhb003,sfhb004,sfhb005,sfhb006,sfhb007,sfhb008,sfhb009,sfhb010,sfhb011,sfhb012) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2]
                   ,g_sfhb_d[g_detail_idx].sfhb001,g_sfhb_d[g_detail_idx].sfhb002,g_sfhb_d[g_detail_idx].sfhb003, 
                       g_sfhb_d[g_detail_idx].sfhb004,g_sfhb_d[g_detail_idx].sfhb005,g_sfhb_d[g_detail_idx].sfhb006, 
                       g_sfhb_d[g_detail_idx].sfhb007,g_sfhb_d[g_detail_idx].sfhb008,g_sfhb_d[g_detail_idx].sfhb009, 
                       g_sfhb_d[g_detail_idx].sfhb010,g_sfhb_d[g_detail_idx].sfhb011,g_sfhb_d[g_detail_idx].sfhb012) 
 
      #add-point:insert_b段新增中
      
      #end add-point
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "sfhb_t"
         LET g_errparam.popup = FALSE
         CALL cl_err()
 
      END IF
      #add-point:insert_b段新增後
      
      #end add-point
   END IF
   
 
   
   LET ls_group = "sfhc_t,"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_table,1) > 0 THEN
      #add-point:insert_b段新增前
 
#      #end add-point
#      INSERT INTO sfhc_t
#                  (sfhcent,
#                   sfhcdocno,sfhcseq,sfhcseq1
#                   ,sfhc003,sfhc004,sfhc005,sfhc008,sfhc010) 
#            VALUES(g_enterprise,
#                   ps_keys[1],ps_keys[2],ps_keys[3]
#                   ,g_sfhb2_d[g_detail_idx2].sfhc003,g_sfhb2_d[g_detail_idx2].sfhc004,g_sfhb2_d[g_detail_idx2].sfhc005, 
#                       g_sfhb2_d[g_detail_idx2].sfhc008,g_sfhb2_d[g_detail_idx2].sfhc010)
#      #add-point:insert_b段新增中
      INSERT INTO sfhc_t
                  (sfhcent,
                   sfhcdocno,sfhcseq,sfhcseq1
                   ,sfhc003,sfhc004,sfhc005,sfhc008,sfhc010,sfhcsite) 
            VALUES(g_enterprise,
                   ps_keys[1],ps_keys[2],ps_keys[3]
                   ,g_sfhb2_d[g_detail_idx2].sfhc003,g_sfhb2_d[g_detail_idx2].sfhc004,g_sfhb2_d[g_detail_idx2].sfhc005, 
                       g_sfhb2_d[g_detail_idx2].sfhc008,g_sfhb2_d[g_detail_idx2].sfhc010,g_site)
      #end add-point
      IF SQLCA.sqlcode THEN
         RETURN
      END IF
      #add-point:insert_b段新增後
#更新主程序入库明细单身其他栏位资料
      UPDATE sfhc_t SET sfhc001 = g_sfhb_d[g_detail_idx].sfhb001,
                        sfhc002 = g_sfhb_d[g_detail_idx].sfhb002,
                        sfhc006 = g_sfhb_d[g_detail_idx].sfhb006,
                        sfhc007 = g_sfhb_d[g_detail_idx].sfhb007,
                        sfhc009 = g_sfhb_d[g_detail_idx].sfhb009,
                        sfhc011 = g_sfhb_d[g_detail_idx].sfhb011,
                        sfhc012 = g_sfhb_d[g_detail_idx].sfhb012
       WHERE sfhcent   = g_enterprise
         AND sfhcdocno = ps_keys[1]
         AND sfhcseq   = ps_keys[2]
         AND sfhcseq1  = ps_keys[3]
      #end add-point
   END IF
 
 
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.update_b" >}
#+ 修改單身後其他table連動
PRIVATE FUNCTION asrt337_01_update_b(ps_table,ps_keys,ps_keys_bak,ps_page)
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
   LET ls_group = "sfhb_t,"
   IF ls_group.getIndexOf(ps_table,1) > 0 AND ps_table <> "sfhb_t" THEN
   
      #add-point:update_b段修改前

      #end add-point     
   
      UPDATE sfhb_t 
         SET (sfhbdocno,sfhbseq
              ,sfhb001,sfhb002,sfhb003,sfhb004,sfhb005,sfhb006,sfhb007,sfhb008,sfhb009,sfhb010,sfhb011,sfhb012) 
              = 
             (ps_keys[1],ps_keys[2]
              ,g_sfhb_d[g_detail_idx].sfhb001,g_sfhb_d[g_detail_idx].sfhb002,g_sfhb_d[g_detail_idx].sfhb003, 
                  g_sfhb_d[g_detail_idx].sfhb004,g_sfhb_d[g_detail_idx].sfhb005,g_sfhb_d[g_detail_idx].sfhb006, 
                  g_sfhb_d[g_detail_idx].sfhb007,g_sfhb_d[g_detail_idx].sfhb008,g_sfhb_d[g_detail_idx].sfhb009, 
                  g_sfhb_d[g_detail_idx].sfhb010,g_sfhb_d[g_detail_idx].sfhb011,g_sfhb_d[g_detail_idx].sfhb012)  
 
         WHERE sfhbent = g_enterprise AND sfhbdocno = ps_keys_bak[1] AND sfhbseq = ps_keys_bak[2] #160905-00007#15 by 08172 add ent
 
      #add-point:update_b段修改中

      #end add-point 
         
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = "std-00009"
            LET g_errparam.extend = "sfhb_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
 
            CALL s_transaction_end('N','0')
         WHEN SQLCA.sqlcode #其他錯誤
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "sfhb_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
  
            CALL s_transaction_end('N','0')
         OTHERWISE
            
      END CASE
 
      #add-point:update_b段修改後

      #end add-point
      
      RETURN
   END IF
   
 
   
   LET ls_group = "sfhc_t,"
   #判斷是否是同一群組的table
   IF ls_group.getIndexOf(ps_table,1) > 0 AND ps_table <> "sfhc_t" THEN
   
      #add-point:update_b段修改前

      #end add-point    
      
      UPDATE sfhc_t 
         SET (sfhcdocno,sfhcseq,sfhcseq1
              ,sfhc003,sfhc004,sfhc005,sfhc008,sfhc010) 
              = 
             (ps_keys[1],ps_keys[2],ps_keys[3]
              ,g_sfhb2_d[g_detail_idx2].sfhc003,g_sfhb2_d[g_detail_idx2].sfhc004,g_sfhb2_d[g_detail_idx2].sfhc005, 
                  g_sfhb2_d[g_detail_idx2].sfhc008,g_sfhb2_d[g_detail_idx2].sfhc010) 
         WHERE sfhcent = g_enterprise AND sfhcdocno = ps_keys_bak[1] AND sfhcseq = ps_keys_bak[2] AND sfhcseq1 = ps_keys_bak[3] #160905-00007#15 by 08172 add ent
 
      #add-point:update_b段修改中
           AND sfhcent = g_enterprise
      #end add-point 
         
      CASE
         WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = "std-00009"
            LET g_errparam.extend = "sfhc_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
 
            CALL s_transaction_end('N','0')
         WHEN SQLCA.sqlcode #其他錯誤
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = "sfhc_t"
            LET g_errparam.popup = TRUE
            CALL cl_err()
  
            CALL s_transaction_end('N','0')
         OTHERWISE
            
      END CASE
      
      #add-point:update_b段修改後

      #end add-point 
      
      RETURN
   END IF
 
 
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.key_update_b" >}
#+ 單頭key欄位變動後, 連帶修正其他單身table
PRIVATE FUNCTION asrt337_01_key_update_b()
   DEFINE li_idx           LIKE type_t.num5 
   DEFINE lb_chk           BOOLEAN
   DEFINE l_new_key        DYNAMIC ARRAY OF STRING
   DEFINE l_old_key        DYNAMIC ARRAY OF STRING
   DEFINE l_field_key      DYNAMIC ARRAY OF STRING
   #add-point:update_b段define

   #end add-point
 
   #判斷key是否有改變
   LET lb_chk = TRUE
   
   IF g_master.sfhbdocno <> g_master_t.sfhbdocno THEN
      LET lb_chk = FALSE
   END IF
   IF g_master.sfhbseq <> g_master_t.sfhbseq THEN
      LET lb_chk = FALSE
   END IF
 
   #不需要做處理
   IF lb_chk THEN
      RETURN
   END IF
    
   #add-point:update_b段修改前

   #end add-point
   
   UPDATE sfhc_t 
      SET (sfhcdocno,sfhcseq) 
           = 
          (g_master.sfhbdocno,g_master.sfhbseq) 
      WHERE 
           sfhcdocno = g_master_t.sfhbdocno
           AND sfhcseq = g_master_t.sfhbseq
           AND sfhcent = g_enterprise  #160905-00007#15 by 08172
 
           
   #add-point:update_b段修改中

   #end add-point
           
   CASE
      #WHEN SQLCA.sqlerrd[3] = 0  #更新不到的處理
      #   CALL cl_err("sfhc_t","std-00009",1)
      #   CALL s_transaction_end('N','0')
      WHEN SQLCA.sqlcode #其他錯誤
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "sfhc_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
  
         CALL s_transaction_end('N','0')
      OTHERWISE
         #若有多語言table資料一同更新
         
   END CASE
   
   #add-point:update_b段修改後

   #end add-point
 
 
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.lock_b" >}
#+ 連動lock其他單身table資料
PRIVATE FUNCTION asrt337_01_lock_b(ps_table)
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:lock_b段define
   
   #end add-point   
   
   #先刷新資料
   #CALL asrt337_01_b_fill(g_wc)
   
   #鎖定整組table
   #LET ls_group = ""
   #僅鎖定自身table
   LET ls_group = "sfhb_t"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
   
      OPEN asrt337_01_bcl USING g_enterprise,
                                       g_sfhb_d[g_detail_idx].sfhbdocno,g_sfhb_d[g_detail_idx].sfhbseq 
 
                                       
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "asrt337_01_bcl"
         LET g_errparam.popup = TRUE
         CALL cl_err()
 
         RETURN FALSE
      END IF
   
   END IF
                                    
 
   
   #鎖定整組table
   #LET ls_group = "sfhc_t,"
   #僅鎖定自身table
   LET ls_group = "sfhc_t"
   IF ls_group.getIndexOf(ps_table,1) THEN
      OPEN asrt337_01_bcl2 USING g_enterprise,
                                             g_master.sfhbdocno,g_master.sfhbseq,
                                             g_sfhb2_d[g_detail_idx2].sfhcseq1
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "asrt337_01_bcl2"
         LET g_errparam.popup = TRUE
         CALL cl_err()
 
         RETURN FALSE
      END IF
   END IF
 
 
   
   RETURN TRUE
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.unlock_b" >}
#+ 連動unlock其他單身table資料
PRIVATE FUNCTION asrt337_01_unlock_b(ps_table)
   DEFINE ps_table STRING
   DEFINE ls_group STRING
   #add-point:unlock_b段define
   
   #end add-point  
   
   LET ls_group = ""
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      CLOSE asrt337_01_bcl
   END IF
   
 
    
   LET ls_group = "sfhc_t,"
   
   IF ls_group.getIndexOf(ps_table,1) THEN
      CLOSE asrt337_01_bcl2
   END IF
 
 
 
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.idx_chk" >}
#+ 單身筆數變更
PRIVATE FUNCTION asrt337_01_idx_chk(ps_loc)
   DEFINE ps_loc   LIKE type_t.chr10
   DEFINE li_idx   LIKE type_t.num5
   DEFINE li_cnt   LIKE type_t.num5
   #add-point:idx_chk段define
   
   #end add-point  
   
   IF g_current_page = 1 THEN
      LET g_detail_idx = g_curr_diag.getCurrentRow("s_detail1")
      IF g_detail_idx > g_sfhb_d.getLength() THEN
         LET g_detail_idx = g_sfhb_d.getLength()
      END IF
      IF g_detail_idx = 0 AND g_sfhb_d.getLength() <> 0 THEN
         LET g_detail_idx = 1
      END IF
      LET li_idx = g_detail_idx
      LET li_cnt = g_sfhb_d.getLength()
   END IF
   
   IF g_current_page = 2 THEN
      LET g_detail_idx2 = g_curr_diag.getCurrentRow("s_detail2")
      IF g_detail_idx2 > g_sfhb2_d.getLength() THEN
         LET g_detail_idx2 = g_sfhb2_d.getLength()
      END IF
      IF g_detail_idx2 = 0 AND g_sfhb2_d.getLength() <> 0 THEN
         LET g_detail_idx2 = 1
      END IF
      LET li_idx = g_detail_idx2
      LET li_cnt = g_sfhb2_d.getLength()
   END IF
 
    
   IF ps_loc = 'm' THEN
      DISPLAY li_idx TO FORMONLY.h_index
      DISPLAY li_cnt TO FORMONLY.h_count
      IF g_sfhb2_d.getLength() = 0 THEN
         DISPLAY '' TO FORMONLY.idx
         DISPLAY '' TO FORMONLY.cnt
      ELSE
         DISPLAY 1 TO FORMONLY.idx
         DISPLAY g_sfhb2_d.getLength() TO FORMONLY.cnt
      END IF
 
   ELSE
      DISPLAY li_idx TO FORMONLY.idx
      DISPLAY li_cnt TO FORMONLY.cnt
   END IF
   
   #add-point:idx_chk段other
   
   #end add-point  
   
END FUNCTION
 
{</section>}
 
{<section id="asrt337_01.set_pk_array" >}
 
 
{</section>}
 
{<section id="asrt337_01.state_change" >}
    
 
{</section>}
 
{<section id="asrt337_01.func_signature" >}
   
 
{</section>}
 
{<section id="asrt337_01.other_dialog" readonly="Y" >}

 
{</section>}
 
{<section id="asrt337_01.other_function" readonly="Y" >}
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
PRIVATE FUNCTION asrt337_01_set_no_required_b()
   CALL cl_set_comp_required("sfhc005,sfhc010",FALSE)
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
PRIVATE FUNCTION asrt337_01_set_required_b()
   DEFINE l_imaf056  LIKE imaf_t.imaf056
   DEFINE l_imaf061  LIKE imaf_t.imaf061

#以下都是根据料号在控制
   SELECT imaf056,imaf061 INTO l_imaf056,l_imaf061 FROM imaf_t WHERE imafent = g_enterprise AND imafsite = g_site AND imaf001 = g_sfhb_d[g_detail_idx].sfhb001
#料号设置的批号控制
   IF l_imaf061 = '1' THEN
      CALL cl_set_comp_required("sfhc005",TRUE)
   END IF
   
   IF cl_get_para(g_enterprise,g_site,'S-BAS-0028')  = 'Y' THEN  
      CALL cl_set_comp_required("sfhc010",TRUE)
   END IF
END FUNCTION

 
{</section>}
 
