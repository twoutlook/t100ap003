#該程式已解開Section, 不再透過樣板產出!
{<section id="astp517.description" >}
#應用 a00 樣板自動產生(Version:1)
#+ Version..: T100-ERP-1.00.00(SD版次:1,PR版次:1) Build-000143
#+ 
#+ Filename...: astp517
#+ Description: 
#+ Creator....: 06536(2015-07-30 13:42:25)
#+ Modifier...: 06536(2015-07-30 18:08:27) -SD/PR- 02481
 
{</section>}
 
{<section id="astp517.global" >}
#應用 p01 樣板自動產生(Version:10)
#160905-00007#16   2016/09/05  By 02599   SQL条件增加ent
#161111-00028#3    2016/11/15  by 02481       标准程式定义采用宣告模式,弃用.*写法
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_schedule
#add-point:增加匯入項目

#end add-point
 
SCHEMA ds
 
GLOBALS "../../cfg/top_global.inc"
GLOBALS "../../cfg/top_schedule.inc"
GLOBALS
   DEFINE gwin_curr2  ui.Window
   DEFINE gfrm_curr2  ui.Form
   DEFINE gi_hiden_asign       LIKE type_t.num5
   DEFINE gi_hiden_exec        LIKE type_t.num5
   DEFINE gi_hiden_spec        LIKE type_t.num5
   DEFINE gi_hiden_exec_end    LIKE type_t.num5
   DEFINE g_chk_jobid          LIKE type_t.num5
END GLOBALS
 
PRIVATE TYPE type_parameter RECORD
   #add-point:自定背景執行須傳遞的參數(Module Variable)
        l_date           LIKE type_t.dat, #ADDED by LANJJ 2015-10-12
#        l_bdate           LIKE type_t.chr500, #ADDED by LANJJ 2015-10-12
#        l_edate           LIKE type_t.chr500, #ADDED by LANJJ 2015-10-12
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       stfasite LIKE stfa_t.stfasite, 
   stfa005 LIKE stfa_t.stfa005, 
   l_startday LIKE type_t.chr500, 
   l_endday LIKE type_t.chr500, 
   stagenow LIKE type_t.chr80,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
 
#add-point:自定義模組變數(Module Variable)
#DEFINE l_stfasite LIKE stfa_t.stfasite    #zhr
#DEFINE l_stfa005 LIKE stfa_t.stfa005    #zhr
  DEFINE l_bdate           LIKE type_t.dat  #ADDED by LANJJ 2015-10-12
  DEFINE l_edate           LIKE type_t.dat  #ADDED by LANJJ 2015-10-12
  DEFINE l_wc              STRING           #ADDED by LANJJ 2015-10-12 
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable)

#end add-point
 
#add-point:傳入參數說明

#end add-point
 
{</section>}
 
{<section id="astp517.main" >}
MAIN
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
   #add-point:main段define 
   DEFINE       l_where       STRING
   DEFINE l_success LIKE type_t.chr10
   
   #end add-point 
   #add-point:main段define (客製用)
   
   #end add-point 
  
   #設定SQL錯誤記錄方式 (模組內定義有效)
   WHENEVER ERROR CALL cl_err_msg_log
 
   #依模組進行系統初始化設定(系統設定)
   CALL cl_ap_init("ast","")
 
   #add-point:定義背景狀態與整理進入需用參數ls_js
   
   #ADDED BY LANJJ 2015-10-12 ---S---
   INITIALIZE l_bdate TO NULL
   INITIALIZE l_edate TO NULL
#   LET g_bgjob = g_argv[01]
#   LET lc_param.l_date = g_argv[02] #FOR dubugger
#   LET lc_param.wc = g_argv[03]
   #ADDED BY LANJJ 2015-10-12 ---E--- 
   
   CALL s_aooi500_create_temp() RETURNING l_success    #ADDED BY LANJJ 2015-10-10
   #end add-point
 
   #背景(Y) 或半背景(T) 時不做主畫面開窗
   IF g_bgjob = "Y" OR g_bgjob = "T" THEN
      #排程參數由01開始，若不是1開始，表示有保留參數
      LET ls_js = g_argv[01]
     #CALL util.JSON.parse(ls_js,g_master)   #p類主要使用l_param,此處不解析
      #add-point:Service Call
 
      #end add-point
      CALL astp517_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp517 WITH FORM cl_ap_formpath("ast",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL astp517_init()
 
      #進入選單 Menu (="N")
      CALL astp517_ui_dialog()
 
      #add-point:畫面關閉前
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp517
   END IF
 
   #add-point:作業離開前
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp517.init" >}
#+ 初始化作業
PRIVATE FUNCTION astp517_init()
   #add-point:init段define 
  DEFINE l_stfasite LIKE stfa_t.stfasite
  DEFINE l_success LIKE type_t.chr10
   #end add-point
   #add-point:init段define (客製用)
   
   #end add-point
 
   LET g_error_show = 1
   LET gwin_curr2 = ui.Window.getCurrent()
   LET gfrm_curr2 = gwin_curr2.getForm()
   CALL cl_schedule_import_4fd()
   CALL cl_set_combo_scc("gzpa003","75")
   IF cl_get_para(g_enterprise,"","E-SYS-0005") = "N" THEN
       CALL cl_set_comp_visible("scheduling_page,history_page",FALSE)
   END IF 
   #add-point:畫面資料初始化
   #CALL cl_set_combo_scc('stfa003','6014')             #add by dengdd 15/9/16 #mark by geza 20160322
   CALL cl_set_combo_scc_part('stfa003','6013','4,5')   #add by geza 20160322
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp517.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp517_ui_dialog()
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num10
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   #add-point:ui_dialog段define 
   DEFINE       l_stfasite  LIKE stfa_t.stfasite
   DEFINE       l_ooef017   LIKE ooef_t.ooef017
   DEFINE       l_glaa003   LIKE glaa_t.glaa003
   DEFINE       l_flag      LIKE    type_t.chr1
   DEFINE       l_errno      LIKE    type_t.chr100 
   DEFINE       l_glav005    LIKE  glav_t.glav005
   DEFINE       l_sdate_s    LIKE  type_t.chr500
   DEFINE        l_sdate_e   LIKE   type_t.chr500
   DEFINE       l_pdate_s    LIKE   type_t.chr500
   DEFINE       l_pdate_e    LIKE    type_t.chr500
   DEFINE       l_glav007    LIKE  glav_t.glav007
   DEFINE       l_wdate_s    LIKE type_t.chr500
   DEFINE       l_wdate_e    LIKE  type_t.chr500
   DEFINE       l_glav002_1  LIKE  glav_t.glav002
   DEFINE       l_glav002    LIKE  glav_t.glav002
   DEFINE       l_glav006_1  LIKE  glav_t.glav006
   DEFINE       l_glav006   LIKE   glav_t.glav006
   DEFINE       l_where       STRING #ADDED BY lanjj 2015-10-10
   #end add-point
   #add-point:ui_dialog段define (客製用)

   #end add-point
   
   #add-point:ui_dialog段before dialog
   
    #查询資料  ---会计期别
    #抓取法人對應會計週期參照表
      LET l_ooef017 = NULL
      LET l_glaa003 = NULL     
      
     #法人     
     SELECT ooef017 INTO l_ooef017           
        FROM ooef_t
       WHERE ooefent = g_enterprise
         AND ooef001 = g_site
         
     #依据法人+运营组织+主账套--------会计周期参照表号
     SELECT glaa003 INTO l_glaa003
        FROM glaa_t
       WHERE glaaent = g_enterprise
         AND glaacomp = l_ooef017
         AND glaa014 = 'Y'
         
      #取得會計週期資料
      CALL s_get_accdate(l_glaa003,g_today,'','')
         RETURNING l_flag,l_errno,l_glav002,l_glav005,l_sdate_s,l_sdate_e,
                   l_glav006,l_pdate_s,l_pdate_e,l_glav007,l_wdate_s,l_wdate_e
      IF l_flag = 'Y' THEN
         LET l_glav002_1 = l_glav002           #年度glav002,会计期glav006
         LET l_glav006_1 = l_glav006 - 1       #取上一会计期       
         IF l_glav006_1 = 0 THEN               #若为第一个会计期，则去上一年会计期别最大的（即上一年最后一期）
            LET l_glav002_1 = l_glav002 - 1
            SELECT DISTINCT MAX(glav006) INTO l_glav006_1
              FROM glav_t
             WHERE glavent = g_enterprise
               AND glav001 = l_glaa003
               AND glav002 = l_glav002_1
         END IF        
         #抓取当前日期上一会计期的起讫日期l_pdate_s和l_pdate_e
         CALL s_get_accdate(l_glaa003,'',l_glav002_1,l_glav006_1)
            RETURNING l_flag,l_errno,l_glav002,l_glav005,l_sdate_s,l_sdate_e,
                      l_glav006,l_pdate_s,l_pdate_e,l_glav007,l_wdate_s,l_wdate_e                      
         LET g_master.l_startday = l_pdate_s
         LET g_master.l_endday = l_pdate_e
      END IF

      
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2

      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:2)
         INPUT BY NAME g_master.l_startday,g_master.l_endday 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前

               #end add-point
         
                     #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD l_startday
            #add-point:BEFORE FIELD l_startday

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD l_startday
            
            #add-point:AFTER FIELD l_startday
#         IF NOT cl_null(g_master.l_startday) THEN       #zhr
#            IF g_master.l_startday > g_today OR g_master.l_startday > g_master.l_endday THEN
#               INITIALIZE g_errparam TO NULL
#               LET g_errparam.code = 'ast-00397'
#               LET g_errparam.extend = ''
#               LET g_errparam.popup = TRUE
#               CALL cl_err()     
#               LET g_master.l_startday = l_pdate_s               
#               DISPLAY BY NAME g_master.l_startday
#            END IF   
#          END IF
           #MARKED BY LANJJ (用户每次更改开始日期基本都比默认结束日期大，被反映不方便)
            #END add-point
            
 
         #應用 a04 樣板自動產生(Version:2)
         ON CHANGE l_startday
            #add-point:ON CHANGE l_startday

            #END add-point 
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD l_endday
            #add-point:BEFORE FIELD l_endday

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD l_endday
            
            #add-point:AFTER FIELD l_endday
         IF NOT cl_null(g_master.l_endday) THEN
            IF g_master.l_endday > g_today OR g_master.l_startday > g_master.l_endday THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = 'ast-00398'
               LET g_errparam.extend = '结束日期不可小于开始日期或不可大于今天'
               LET g_errparam.popup = TRUE
               CALL cl_err()     
               LET g_master.l_endday = l_pdate_e               
               DISPLAY BY NAME g_master.l_endday
            END IF   
          END IF
            #END add-point
            
 
         #應用 a04 樣板自動產生(Version:2)
         ON CHANGE l_endday
            #add-point:ON CHANGE l_endday

            #END add-point 
 
 
                     #Ctrlp:input.c.l_startday
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD l_startday
            #add-point:ON ACTION controlp INFIELD l_startday

            #END add-point
 
         #Ctrlp:input.c.l_endday
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD l_endday
            #add-point:ON ACTION controlp INFIELD l_endday

            #END add-point
 
 
               
            AFTER INPUT
               #add-point:資料輸入後

               #end add-point
               
            #add-point:其他管控(on row change, etc...)

            #end add-point
         END INPUT
 
 
         
         #應用 a58 樣板自動產生(Version:2)
         CONSTRUCT BY NAME g_master.wc ON stfasite,stfa005,stfa036,stfa051,stfa003,stfa010
            BEFORE CONSTRUCT
               #add-point:cs段before_construct
               # DISPLAY g_site TO stfasite
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.stfasite
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stfasite
            #add-point:ON ACTION controlp INFIELD stfasite
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'i' 
            LET g_qryparam.reqry = FALSE   
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stfasite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
         #   LET l_stfasite=g_qryparam.return1   #zhr
            DISPLAY g_qryparam.return1 TO stfasite  #顯示到畫面上
            NEXT FIELD stfasite                     #返回原欄位
    
            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stfasite
            #add-point:BEFORE FIELD stfasite

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stfasite
            
            #add-point:AFTER FIELD stfasite
          LET l_stfasite=FGL_DIALOG_GETBUFFER()   #zhr
            #END add-point
          
           
           
   
         #Ctrlp:construct.c.stfa005
         #應用 a03 樣板自動產生(Version:2)
         ON ACTION controlp INFIELD stfa005
            #add-point:ON ACTION controlp INFIELD stfa005
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
          #  LET g_qryparam.arg1=l_stfasite   #zhr
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfa005  #顯示到畫面上
            NEXT FIELD stfa005                     #返回原欄位
    


            #END add-point
 
         #應用 a01 樣板自動產生(Version:1)
         BEFORE FIELD stfa005
            #add-point:BEFORE FIELD stfa005

            #END add-point
 
         #應用 a02 樣板自動產生(Version:1)
         AFTER FIELD stfa005
            
            #add-point:AFTER FIELD stfa005
 
            #END add-point
            
         ON ACTION controlp INFIELD stfa036
            #add-point:ON ACTION controlp INFIELD stfa036
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_staa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfa036  #顯示到畫面上
            NEXT FIELD stfa036                     #返回原欄位
            
            
         ON ACTION controlp INFIELD stfa051
            #add-point:ON ACTION controlp INFIELD stfa051
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_rtax001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfa051  #顯示到畫面上
            NEXT FIELD stfa051                     #返回原欄位
    
 
            
            #add-point:其他管控
         #ADDED BY LANJJ 2015-10-12
         ON ACTION controlp INFIELD stfa010
         
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.arg1 = "('1','3')"  
            CALL q_pmaa001_1()                           #ºô½Ðé_´°
            DISPLAY g_qryparam.return1 TO stfa010  #ï@Ê¾µ½®ÃæÉÏ
            NEXT FIELD stfa010                     #·µ»ØÔ­ÚÎ»     
         #ADDED BY LANJJ 2015-10-12
            #end add-point
            
         END CONSTRUCT
 
 
      
         #add-point:ui_dialog段construct
        
         #end add-point
         #add-point:ui_dialog段input

         #end add-point
         #add-point:ui_dialog段自定義display array

         #end add-point
 
         SUBDIALOG lib_cl_schedule.cl_schedule_setting
         SUBDIALOG lib_cl_schedule.cl_schedule_setting_exec_call
         SUBDIALOG lib_cl_schedule.cl_schedule_select_show_history
         SUBDIALOG lib_cl_schedule.cl_schedule_show_history
 
         BEFORE DIALOG
            LET l_dialog = ui.DIALOG.getCurrent()
            CALL astp517_get_buffer(l_dialog)
            #add-point:ui_dialog段before dialog
         #   LET g_master.stfasite = g_site
            DISPLAY g_site TO stfasite
            #end add-point
 
         ON ACTION batch_execute
            LET g_action_choice = "batch_execute"
            ACCEPT DIALOG
 
         #add-point:ui_dialog段before_qbeclear

         #end add-point
 
         ON ACTION qbeclear         
            CLEAR FORM
            INITIALIZE g_master.* TO NULL   #畫面變數清空
            INITIALIZE lc_param.* TO NULL   #傳遞參數變數清空
            #add-point:ui_dialog段qbeclear

            #end add-point
 
         ON ACTION history_fill
            CALL cl_schedule_history_fill()
 
         ON ACTION close
            LET INT_FLAG = TRUE
            EXIT DIALOG
         
         ON ACTION exit
            LET INT_FLAG = TRUE
            EXIT DIALOG
 
         #add-point:ui_dialog段action

         #end add-point
 
         #主選單用ACTION
         &include "main_menu_exit_dialog.4gl"
         &include "relating_action.4gl"
         #交談指令共用ACTION
         &include "common_action.4gl"
            CONTINUE DIALOG
      END DIALOG
 
      IF g_action_choice = "logistics" THEN
         #清除畫面及相關資料
         CLEAR FORM   
         INITIALIZE g_master.* TO NULL
         LET g_wc  = ' 1=2'
         LET g_action_choice = ""
         CALL astp517_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF NOT cl_schedule_exec_check() THEN
         CONTINUE WHILE
      END IF
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog
   
   #ADDED BY LANJJ 2015-10-10
      LET l_bdate = g_master.l_startday
      LET l_edate = g_master.l_endday
   
      IF cl_null(lc_param.wc) THEN
         LET lc_param.wc = " 1=1"
      END IF
      LET l_where = s_aooi500_q_where(g_prog,'stfasite',g_site,'c')
      LET l_where = cl_replace_str(l_where,'ooef001','stfasite')
      DISPLAY "l_where :",l_where
      LET l_wc = lc_param.wc," AND ",l_where
   #ADDED BY LANJJ 2015-10-10
   
      #end add-point
 
      LET ls_js = util.JSON.stringify(lc_param)  #r類使用g_master/p類使用lc_param
 
      IF INT_FLAG THEN
         LET INT_FLAG = FALSE
         EXIT WHILE
      ELSE
         IF g_chk_jobid THEN 
            LET g_jobid = g_schedule.gzpa001
         ELSE 
            LET g_jobid = cl_schedule_get_jobid(g_prog)
         END IF 
 
         #依照指定模式執行報表列印
         CASE 
            WHEN g_schedule.gzpa003 = "0"
                 CALL astp517_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = astp517_transfer_argv(ls_js)
                 CALL cl_cmdrun(ls_js)
 
            WHEN g_schedule.gzpa003 = "2"
                 CALL cl_schedule_update_data(g_jobid,ls_js)
 
            WHEN g_schedule.gzpa003 = "3"
                 CALL cl_schedule_update_data(g_jobid,ls_js)
         END CASE  
 
         IF g_schedule.gzpa003 = "2" OR g_schedule.gzpa003 = "3" THEN 
            CALL cl_ask_confirm3("std-00014","") #設定完成
         END IF    
         LET g_schedule.gzpa003 = "0" #預設一開始 立即於前景執行
 
         #add-point:ui_dialog段after schedule

         #end add-point
 
         #欄位初始資訊 
         CALL cl_schedule_init_info("all",g_schedule.gzpa003) 
         LET gi_hiden_asign = FALSE 
         LET gi_hiden_exec = FALSE 
         LET gi_hiden_spec = FALSE 
         LET gi_hiden_exec_end = FALSE 
         CALL cl_schedule_hidden()
      END IF
   END WHILE
 
END FUNCTION
 
{</section>}
 
{<section id="astp517.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION astp517_transfer_argv(ls_js)
   DEFINE ls_js       STRING
   DEFINE la_cmdrun   RECORD
             prog       STRING,
             actionid   STRING,
             background LIKE type_t.chr1,
             param      DYNAMIC ARRAY OF STRING
                  END RECORD
   DEFINE la_param    type_parameter
   #add-point:transfer_agrv段define 
   
   #end add-point
   #add-point:transfer_agrv段define (客製用)
   
   #end add-point
 
   LET la_cmdrun.prog = g_prog
   LET la_cmdrun.background = "Y"
   LET la_cmdrun.param[1] = ls_js
 
   #add-point:transfer.argv段程式內容
   
   #end add-point
 
   RETURN util.JSON.stringify( la_cmdrun )
END FUNCTION
 
{</section>}
 
{<section id="astp517.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION astp517_process(ls_js)
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define 
   DEFINE l_success     LIKE type_t.num5     #zhr
   DEFINE l_string       STRING
   DEFINE l_where       STRING
   DEFINE l_msg       LIKE type_t.chr100   #160225-00040#18 2016/04/13 s983961--add
   #end add-point
   #add-point:process段define (客製用)
   
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理
   #160225-00040#19 s983961--mark(s)      
   ##ADDED BY LANJJ 2015-10-12 ---S---
   #IF cl_null(l_edate) THEN 
   #   LET l_edate = lc_param.l_date
   #END IF 
   #IF cl_null(l_bdate) THEN 
   #   LET l_bdate = s_date_get_first_date(l_edate) 
   #END IF 
   #LET l_where = s_aooi500_q_where(g_prog,'stfasite',g_site,'c')
   #LET l_where = cl_replace_str(l_where,'ooef001','stfasite')
   #DISPLAY "l_where :",l_where
   #LET l_wc = lc_param.wc," AND ",l_where
   ##ADDED BY LANJJ 2015-10-12 ---E---
   #
   #IF cl_null(l_wc) THEN 
   #   LET l_wc = " 1=1"
   #END IF
   ##CALL astp517_insert (g_master.wc,g_master.l_startday,g_master.l_endday) RETURNING  l_success,l_string #MARKED BY LANJJ 2015-10-12
   #CALL astp517_insert (l_wc,l_bdate,l_edate) RETURNING  l_success,l_string #ADDED BY LANJJ 2015-10-12
   #IF NOT l_success THEN
   #   CALL s_transaction_end('N','0')
   #ELSE
   #   CALL s_transaction_end('Y','0')
   #END IF
   #160225-00040#19 s983961--mark(e) 
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress
      CALL cl_progress_bar_no_window(4)   #160225-00040#18 2016/04/13 s983961--add  
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE astp517_process_cs CURSOR FROM ls_sql
#  FOREACH astp517_process_cs INTO
   #add-point:process段process
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('ade-00114',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#18 2016/04/13 s983961--add(e)

   
   #ADDED BY LANJJ 2015-10-12 ---S---
   IF cl_null(l_edate) THEN 
      LET l_edate = lc_param.l_date
   END IF 
   IF cl_null(l_bdate) THEN 
      LET l_bdate = s_date_get_first_date(l_edate) 
   END IF 
   LET l_where = s_aooi500_q_where(g_prog,'stfasite',g_site,'c')
   LET l_where = cl_replace_str(l_where,'ooef001','stfasite')
   DISPLAY "l_where :",l_where
   LET l_wc = lc_param.wc," AND ",l_where
   #ADDED BY LANJJ 2015-10-12 ---E---
   
   IF cl_null(l_wc) THEN 
      LET l_wc = " 1=1"
   END IF
   #160613-00045#5 20160616 add by beckxie---S
   CALL cl_err_collect_init()
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('ast-00329',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#18 2016/04/13 s983961--add(e)
   #經營方式
   IF l_wc.getIndexOf("stfa003='4'",1) OR l_wc.getIndexOf("stfa003='5'",1) THEN
      #經營方式=4
      IF l_wc.getIndexOf("stfa003='4'",1) THEN
         #開啟事務
         CALL s_transaction_begin()
         CALL astp517_insert(l_wc,l_bdate,l_edate) RETURNING  l_success,l_string
         IF NOT l_success THEN
            CALL s_transaction_end('N','0')
         ELSE
            CALL s_transaction_end('Y','0')
         END IF
      END IF
      #經營方式=5
      IF l_wc.getIndexOf("stfa003='5'",1) THEN
         #開啟事務
         CALL s_transaction_begin()
         CALL astp517_insert_1(l_wc,l_bdate,l_edate) RETURNING  l_success,l_string
         IF NOT l_success THEN
            CALL s_transaction_end('N','0')
         ELSE
            CALL s_transaction_end('Y','0')
         END IF
      END IF
   ELSE
      #開啟事務
      CALL s_transaction_begin()
      CALL astp517_insert(l_wc,l_bdate,l_edate) RETURNING  l_success,l_string
      IF NOT l_success THEN
         CALL s_transaction_end('N','0')
      ELSE
         CALL s_transaction_end('Y','0')
      END IF
      #開啟事務
      CALL s_transaction_begin()
      CALL astp517_insert_1(l_wc,l_bdate,l_edate) RETURNING l_success,l_string
      IF NOT l_success THEN
         CALL s_transaction_end('N','0')
      ELSE
         CALL s_transaction_end('Y','0')
      END IF
   END IF
   
   CALL cl_err_collect_show() 
   #160613-00045#5 20160616 add by beckxie---E
   
   #CALL astp517_insert (g_master.wc,g_master.l_startday,g_master.l_endday) RETURNING  l_success,l_string #MARKED BY LANJJ 2015-10-12
   
   #160613-00045#5 20160616 mark by beckxie---S
   #CALL astp517_insert (l_wc,l_bdate,l_edate) RETURNING  l_success,l_string #ADDED BY LANJJ 2015-10-12
   #IF NOT l_success THEN
   #   CALL s_transaction_end('N','0')
   #ELSE
   #   CALL s_transaction_end('Y','0')
   #END IF
   #160613-00045#5 20160616 mark by beckxie---E
   
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('std-00012',g_lang)
   CALL cl_progress_no_window_ing(l_msg)  
   #160225-00040#18 2016/04/13 s983961--add(e)   
   #end add-point
#  END FOREACH
 
   IF g_bgjob = "N" THEN
      #前景作業完成處理
      #add-point:process段foreground完成處理
      
      #end add-point
      CALL cl_ask_confirm3("std-00012","")
   ELSE
      #背景作業完成處理
      #add-point:process段background完成處理
      
      #end add-point
      CALL cl_schedule_exec_call(li_p01_status)
   END IF
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL astp517_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp517.get_buffer" >}
PRIVATE FUNCTION astp517_get_buffer(p_dialog)
   DEFINE p_dialog   ui.DIALOG
   
   LET g_master.l_startday = p_dialog.getFieldBuffer('l_startday')
   LET g_master.l_endday = p_dialog.getFieldBuffer('l_endday')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astp517.msgcentre_notify" >}
PRIVATE FUNCTION astp517_msgcentre_notify()
 
   DEFINE lc_state LIKE type_t.chr5
 
   INITIALIZE g_msgparam TO NULL
 
   #action-id與狀態填寫
   LET g_msgparam.state = "process"
 
   #add-point:msgcentre其他通知
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp517.other_function" >}
#add-point:自定義元件(Function)

################################################################################
# Descriptions...:p处理
# Memo...........:
# Usage..........: CALL astp517_insert (传入参数)
#                  RETURNING r_success,l_stbadocno
# Input parameter: p_wc
#                : p_sday
#                : p_eday
# Return code....: r_success
# Return code....: l_stbadocno
# Date & Author..: 2015/08/06  By zhr
# Modify.........:
################################################################################
PUBLIC FUNCTION astp517_insert(p_wc,p_sday,p_eday)

DEFINE p_wc       STRING
DEFINE l_sql      STRING
DEFINE l_sql2      STRING
DEFINE p_sday     LIKE  type_t.chr500
DEFINE p_eday     LIKE  type_t.chr500
DEFINE l_success      LIKE type_t.num5
DEFINE r_success      LIKE type_t.num5
define r_string       string
DEFINE l_stbadocno    LIKE stba_t.stbadocno
define l_stfa005      like stfa_t.stfa005  
define l_stfjseq      like stfj_t.stfjseq
define l_stfasite     like stfa_t.stfasite
#ADDED BY LanJJ 15/10/09 (S)---------------
   DEFINE g_stbadocno_d  DYNAMIC ARRAY OF RECORD 
      stbadocno_del LIKE stba_t.stbadocno,  
      stfasite      LIKE stfa_t.stfasite,
      stfa005       LIKE stfa_t.stfa005
      END RECORD
   DEFINE l_ac           LIKE TYPE_T.NUM5 
   DEFINE l_stgb004      LIKE stgb_t.stgb004
   DEFINE l_sumstgb009   LIKE stgb_t.stgb009
   DEFINE l_stfa005_t    LIKE stfa_t.stfa005
   DEFINE l_count        LIKE type_t.num5
   DEFINE l_stfj002      LIKE stfj_t.stfj002
   DEFINE l_stfj003      LIKE stfj_t.stfj003
   DEFINE l_msg          LIKE type_t.chr100   #160225-00040#18 2016/04/13 s983961--add
#ADDED BY LanJJ 15/10/09 (E)----------------
   #160613-00045#5 20160616 mark by beckxie---S
   ##160225-00040#18 2016/04/13 s983961--add(s)
   #LET l_msg = cl_getmsg('ast-00329',g_lang)   
   #CALL cl_progress_no_window_ing(l_msg)
   ##160225-00040#18 2016/04/13 s983961--add(e)
   #160613-00045#5 20160616 mark by beckxie---E
   #開啟事務
   #CALL s_transaction_begin()   #160613-00045#5 20160617 mark by beckxie


   LET r_success=TRUE
    LET r_string=''
  
  #ADDED BY LANJJ 15/10/09 
    LET l_count = 0
    LET l_sql = NULL
  LET l_sql = "SELECT COUNT(*) ",
              "  FROM STBA_T,stbb_t, STFA_T,stfk_t,stgb_t ",
              " WHERE STBAENT = STFAENT ",
              "   AND STBA010 = STFA001 ",
              "   AND STFAENT = STFKENT ",
              "   AND STFA001 = STFK001 ",
              "   AND STFASITE = STFKSITE ", 
              "   AND stbaent = stbbent ",
              "   AND stbadocno = stbbdocno ",
              "   and STFK002 = STBB001",
              "   and stgbent = STFAENT ",
              "   and stgbsite = STFAsite ",
              "   and stgb002 = STFA005 ",
              "   and stgb001 >= to_date('",p_sday,"','yy/mm/dd')  ",
              "   and stgb001 <= to_date('",p_eday,"','yy/mm/dd')  ",
              "   AND stbadocdt >= to_date('",p_sday,"','yy/mm/dd') ",
              "   AND stbadocdt = to_date('",p_eday,"','yy/mm/dd') ",
              "   AND STBA006 = '18' ",
              "   and stbastus ='Y' ",
              "   AND ",p_wc
   PREPARE del_docno1 FROM l_sql
   EXECUTE del_docno1 into l_count
   IF l_count > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "费用单已经生成且已经审核，不能重新生成"
      LET g_errparam.code = 'ast-00122'
      LET g_errparam.popup = TRUE
      CALL cl_err() 
      LET r_success = FALSE
      RETURN r_success,r_string
   END IF
   
   LET l_sql = NULL
   LET l_sql = "SELECT DISTINCT stfasite,stbadocno,stfa005 ",
               "  FROM STBA_T,stbb_t, STFA_T,stfk_t,stgb_t ",
               " WHERE STBAENT = STFAENT ",
               "   AND STBA010 = STFA001 ",
               "   AND STFAENT = STFKENT ",
               "   AND STFA001 = STFK001 ",
               "   AND STFASITE = STFKSITE ", 
               "   AND stbaent = stbbent ",
               "   AND stbadocno = stbbdocno ",
               "   and STFK002 = STBB001",
               "   and stgbent = STFAENT ",
               "   and stgbsite = STFAsite ",
               "   and stgb002 = STFA005 ",
               "   and stgb001 >= to_date('",p_sday,"','yy/mm/dd')  ",
               "   and stgb001 <= to_date('",p_eday,"','yy/mm/dd')  ",
               "   AND stbadocdt >= to_date('",p_sday,"','yy/mm/dd') ",
               "   AND stbadocdt = to_date('",p_eday,"','yy/mm/dd') ",
               "   AND STBA006 = '18' ",
               "   and stbastus ='N' ",
               "   AND ",p_wc
   PREPARE del_docno FROM l_sql
   DECLARE del_docno_cur CURSOR FOR del_docno
   LET l_ac = 1
   FOREACH del_docno_cur INTO g_stbadocno_d[l_ac].stfasite,
                              g_stbadocno_d[l_ac].stbadocno_del,
                              g_stbadocno_d[l_ac].stfa005
      
      DELETE FROM stba_t WHERE stbaent = g_enterprise AND stbadocno = g_stbadocno_d[l_ac].stbadocno_del
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "del stba_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success,r_string
      END IF 
     
      DELETE FROM stbb_t WHERE stbbent=g_enterprise AND stbbdocno = g_stbadocno_d[l_ac].stbadocno_del                  
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "del stbb_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success,r_string
      END IF 

      UPDATE stgb_t SET stgb011='N' 
       WHERE stgb001 BETWEEN p_sday AND p_eday
         AND stgbent = g_enterprise
         AND stgb002 = g_stbadocno_d[l_ac].stfa005
         AND stgbsite = g_stbadocno_d[l_ac].stfasite
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err() 
         LET r_success = FALSE
         RETURN r_success,r_string         
      END IF       

      LET l_ac = l_ac + 1
   END FOREACH  
  #ADDED BY LANJJ 15/10/09 
  
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('ast-00330',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#18 2016/04/13 s983961--add(e)
   
   INITIALIZE l_stfa005_t TO NULL
   LET l_sql=" SELECT stfa005,maxstfjseq,stfasite,stgb004,SUM(stgb009),stfj002,stfj003  ",
             "   FROM ( SELECT stfaent,stfa005,maxstfjseq,stfasite,stfj002,stfj003 ",
             "            FROM ( select stfaent,stfa001,stfa005,max(stfjseq) maxstfjseq,stfasite,stfj002 j002,stfj003 j003 ",
             "                     FROM stfa_t,stfj_t ",
             "                    WHERE stfaent = stfjent ",
             "                      AND stfj004 = to_date('",p_eday,"','yy/mm/dd') ",
             "                      AND stfa001 = stfj001 ",
             "                      AND stfj004 BETWEEN to_date('",p_sday,"','yy/mm/dd') ",
             "                                      AND to_date('",p_eday,"','yy/mm/dd') ", 
             "                      AND stfj005='N' AND ",p_wc CLIPPED,
             "                    GROUP BY stfaent,stfa001,stfa005,stfasite,stfj002,stfj003 ",
             "                 ),stfj_t ",
             "           WHERE STFAENT = STFJENT ",
             "             AND stfj004 = to_date('",p_eday,"','yy/mm/dd') ",
             "             AND STFA001 = STFJ001 ",
             "             AND stfj004 BETWEEN to_date('",p_sday,"','yy/mm/dd') ",
             "                             AND to_date('",p_eday,"','yy/mm/dd') ",
             "             AND STFJ005 = 'N' ",
             "             AND stfjseq = MAXSTFJSEQ ",
             "        ) a , stgb_t ",
             "  WHERE stgbent = a.stfaent ",
             "    AND stgbsite = a.stfasite ",
             "    AND stgb002 = a.stfa005 ",
             "    AND stgb001 BETWEEN stfj002 AND stfj003 ",    
             "    AND stfj002 >= to_date('",p_sday,"','yy/mm/dd') ",
             "    AND stfj003 <= to_date('",p_eday,"','yy/mm/dd') ",
             "  GROUP BY stfa005,maxstfjseq,stfasite,stgb004,stfj002,stfj003 ",
             "  ORDER BY stfa005 "             
             #modify by lanjj 15/10/09 主sql

   PREPARE s_astp517_stfa_pre FROM l_sql
   DECLARE s_astp517_stfa_cur CURSOR FOR s_astp517_stfa_pre
   FOREACH s_astp517_stfa_cur INTO l_stfa005,l_stfjseq,l_stfasite,l_stgb004,l_sumstgb009,l_stfj002,l_stfj003
      
      IF cl_null(l_stfa005_t) OR l_stfa005_t != l_stfa005 THEN #ADDED BY LANJJ 15/10/09 
         #CALL cl_err_collect_init() 
         CALL s_astp517_ins_stba(l_stfa005,l_stfjseq,l_stfasite,p_sday,p_eday) RETURNING l_success,l_stbadocno
         IF NOT l_success THEN
            CONTINUE FOREACH                  
         END IF   
         #CALL cl_err_collect_show()            
      END IF #ADDED BY LANJJ 15/10/09
      
      #费用单单身stbb_t
#   CALL s_astp517_ins_stbb(l_stbadocno,l_stfjseq,l_stfa005,p_sday,p_eday) RETURNING l_success #MARKED BY LANJJ 15/10/09
    CALL astp517_ins_stbb(l_stbadocno,l_stfjseq,l_stfa005,p_sday,p_eday,l_stgb004,l_sumstgb009,l_stfj002,l_stfj003) RETURNING l_success #ADDED BY LANJJ 15/10/09
       IF NOT l_success THEN
         delete from stba_t where stbadocno=l_stbadocno
         AND stbaent=g_enterprise #160905-00007#16 add
         CONTINUE FOREACH                  
       END IF

      #结转完成后，对应的【astq502(专柜每日银行卡手续费明细查询作业) 】中，“已结转否”更新为“Y”。
      LET l_sql2="UPDATE stgb_t SET stgb011='Y' ",
              "WHERE stgb001 between to_date('",p_sday,"','yy/mm/dd') and to_date('",p_eday,"','yy/mm/dd') ",
             " AND stgbent= ",g_enterprise,
             " AND  stgb002 = '",l_stfa005,"'   ",
             " AND stgbsite = '",l_stfasite,"' "
      PREPARE astp517_upd_pre FROM l_sql2
   
      EXECUTE astp517_upd_pre  
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()      
         LET r_success=FALSE
         RETURN r_success,r_string
      END IF       

     IF cl_null(r_string) THEN
         LET r_string=" stbadocno IN (","'",l_stbadocno,"'"
     ELSE
         LET r_string=r_string CLIPPED,",'",l_stbadocno,"'"  
     END IF         
     LET l_stfa005_t = l_stfa005
   END FOREACH     
    
   IF NOT cl_null(r_string) THEN
      LET r_string=r_string CLIPPED,")"
   END IF

   #沒有滿足條件的資料，無费用单生成！                   
   IF r_success AND cl_null(r_string)  THEN    
      INITIALIZE g_errparam TO NULL
      #160613-00045#5 20160616 modify by beckxie---S
      #LET g_errparam.extend = ''   
      LET g_errparam.extend = "4.",s_desc_gzcbl004_desc('6013','4')
      #160613-00045#5 20160616 modify by beckxie---E
      LET g_errparam.code = 'ast-00122'
      LET g_errparam.popup = TRUE
      CALL cl_err() 
      LET r_success = FALSE
      RETURN r_success,r_string
#   ELSE 
#      #结转完成后，对应的【astq502(专柜每日银行卡手续费明细查询作业) 】中，“已结转否”更新为“Y”。
#      LET l_sql2="UPDATE stgb_t SET stgb011='Y' ",
#              "WHERE stgb001 between to_date('",p_sday,"','yy/mm/dd') and to_date('",p_eday,"','yy/mm/dd') ",
#             " AND stgbent= ",g_enterprise,
#             " AND  stgb002 = '",l_stfa005,"'   ",
#             " AND stgbsite = '",l_stfasite,"' "
#      PREPARE astp517_upd_pre FROM l_sql2
#   
#       #p_day代入？中
#      EXECUTE astp517_upd_pre  
#     IF SQLCA.SQLcode THEN
#       INITIALIZE g_errparam TO NULL
#       LET g_errparam.code = SQLCA.sqlcode
#       LET g_errparam.extend = ''
#       LET g_errparam.popup = TRUE
#       CALL cl_err()      
#       LET r_success=FALSE
#       RETURN r_success
#      END IF 
   END IF    

   RETURN r_success,r_string


END FUNCTION

################################################################################
# Descriptions...: 单头
# Memo...........:
# Usage..........: CALL astp517_ins_stbas (传入参数)
#                  RETURNING 回传参数
# Input parameter: p_sday
#                : p_eday
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........:
################################################################################
PUBLIC FUNCTION s_astp517_ins_stba(p_stfa005,p_stfjseq,p_stfasite,p_sday,p_eday)

DEFINE p_stfa005       LIKE stfa_t.stfa005
DEFINE p_stfjseq       LIKE stfj_t.stfjseq
define p_stfasite      like stfa_t.stfasite
DEFINE r_success       LIKE type_t.num5
DEFINE r_stbadocno     LIKE stba_t.stbadocno
DEFINE l_success       LIKE type_t.num5
#161111-00028#3---modify---------begin---------
#DEFINE l_stfa  RECORD  LIKE stfa_t.*
#DEFINE l_stba  RECORD  LIKE stba_t.*
#DEFINE l_stfj  record  like stfj_t.*
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
DEFINE l_stfa RECORD  #專櫃合約主檔
       stfaent LIKE stfa_t.stfaent, #企業編號
       stfasite LIKE stfa_t.stfasite, #營運據點
       stfaunit LIKE stfa_t.stfaunit, #制定組織
       stfaacti LIKE stfa_t.stfaacti, #合約有效
       stfa001 LIKE stfa_t.stfa001, #合約編號
       stfa002 LIKE stfa_t.stfa002, #版本
       stfa003 LIKE stfa_t.stfa003, #經營方式
       stfa004 LIKE stfa_t.stfa004, #合約狀態
       stfa005 LIKE stfa_t.stfa005, #专柜编号
       stfa006 LIKE stfa_t.stfa006, #專櫃類型
       stfa007 LIKE stfa_t.stfa007, #建築面積
       stfa008 LIKE stfa_t.stfa008, #經營面積
       stfa009 LIKE stfa_t.stfa009, #檔案編號
       stfa010 LIKE stfa_t.stfa010, #供應商編號
       stfa011 LIKE stfa_t.stfa011, #主品類
       stfa012 LIKE stfa_t.stfa012, #主品牌
       stfa013 LIKE stfa_t.stfa013, #模板編號
       stfa014 LIKE stfa_t.stfa014, #簽訂法人
       stfa015 LIKE stfa_t.stfa015, #簽訂人員
       stfa016 LIKE stfa_t.stfa016, #簽訂日期
       stfa017 LIKE stfa_t.stfa017, #進場日期
       stfa018 LIKE stfa_t.stfa018, #撤場日期
       stfa019 LIKE stfa_t.stfa019, #生效日期
       stfa020 LIKE stfa_t.stfa020, #失效日期
       stfa021 LIKE stfa_t.stfa021, #作廢日期
       stfa022 LIKE stfa_t.stfa022, #甲方日期
       stfa023 LIKE stfa_t.stfa023, #乙方日期
       stfa024 LIKE stfa_t.stfa024, #清退日期
       stfa025 LIKE stfa_t.stfa025, #延期日期
       stfa026 LIKE stfa_t.stfa026, #蓋章日期
       stfa027 LIKE stfa_t.stfa027, #文字蓋章否
       stfa028 LIKE stfa_t.stfa028, #按天產生銷售成本
       stfa029 LIKE stfa_t.stfa029, #收銀方式
       stfa030 LIKE stfa_t.stfa030, #定價屬性
       stfa031 LIKE stfa_t.stfa031, #專櫃ABC
       stfa032 LIKE stfa_t.stfa032, #幣別
       stfa033 LIKE stfa_t.stfa033, #進項稅
       stfa034 LIKE stfa_t.stfa034, #銷項稅
       stfa035 LIKE stfa_t.stfa035, #收付款方式
       stfa036 LIKE stfa_t.stfa036, #結算方式
       stfa037 LIKE stfa_t.stfa037, #結算類別
       stfa038 LIKE stfa_t.stfa038, #結算中心
       stfa039 LIKE stfa_t.stfa039, #基本提成率
       stfa040 LIKE stfa_t.stfa040, #增值稅扣率
       stfa041 LIKE stfa_t.stfa041, #合約摘要
       stfa042 LIKE stfa_t.stfa042, #經營範圍說明
       stfa043 LIKE stfa_t.stfa043, #備註
       stfa044 LIKE stfa_t.stfa044, #所屬部門
       stfa045 LIKE stfa_t.stfa045, #管理方式
       stfa046 LIKE stfa_t.stfa046, #業態
       stfa047 LIKE stfa_t.stfa047, #樓棟
       stfa048 LIKE stfa_t.stfa048, #樓層
       stfa049 LIKE stfa_t.stfa049, #續簽日期
       stfaownid LIKE stfa_t.stfaownid, #資料所屬者
       stfaowndp LIKE stfa_t.stfaowndp, #資料所有部門
       stfacrtid LIKE stfa_t.stfacrtid, #資料建立者
       stfacrtdp LIKE stfa_t.stfacrtdp, #資料建立部門
       stfacrtdt LIKE stfa_t.stfacrtdt, #資料創建日
       stfamodid LIKE stfa_t.stfamodid, #資料修改者
       stfamoddt LIKE stfa_t.stfamoddt, #最近修改日
       stfastus LIKE stfa_t.stfastus, #狀態碼
       stfacnfid LIKE stfa_t.stfacnfid, #資料確認者
       stfacnfdt LIKE stfa_t.stfacnfdt, #資料確認日
       stfa050 LIKE stfa_t.stfa050, #代扣代繳稅否
       stfa051 LIKE stfa_t.stfa051, #管理品類
       stfa052 LIKE stfa_t.stfa052, #最低折扣率
       stfa053 LIKE stfa_t.stfa053, #促銷庫區參與保底否
       stfa054 LIKE stfa_t.stfa054, #是否補差
       stfa055 LIKE stfa_t.stfa055, #庫區商品化否
       stfa056 LIKE stfa_t.stfa056 #工衣情況
       END RECORD
DEFINE l_stfj RECORD  #專櫃合約結算帳期檔
       stfjent LIKE stfj_t.stfjent, #企業編號
       stfjsite LIKE stfj_t.stfjsite, #營運據點
       stfjunit LIKE stfj_t.stfjunit, #應用組織
       stfjseq LIKE stfj_t.stfjseq, #帳期
       stfj001 LIKE stfj_t.stfj001, #合約編號
       stfj002 LIKE stfj_t.stfj002, #起始日期
       stfj003 LIKE stfj_t.stfj003, #截止日期
       stfj004 LIKE stfj_t.stfj004, #結算日期
       stfj005 LIKE stfj_t.stfj005, #結算否
       stfj006 LIKE stfj_t.stfj006 #結算單號
       END RECORD
#161111-00028#3---modify---------end---------
DEFINE p_sday     LIKE  type_t.chr500
DEFINE p_eday     LIKE  type_t.chr500
DEFINE r_doctype      LIKE type_t.chr10

   LET r_success = TRUE
   LET r_stbadocno=''

   IF cl_null(p_stfa005) or cl_null(p_stfjseq) or cl_null(p_stfasite) THEN
      LET r_success=FALSE
      RETURN r_success,r_stbadocno
   END IF
   
   INITIALIZE l_stfa.* TO NULL
 
   #依据运营组织+专柜编号======专柜合同资料
 # SELECT * INTO l_stfa.*  #161111-00028#3--mark
  #161111-00028#3--add----begin---------
   SELECT stfaent,stfasite,stfaunit,stfaacti,stfa001,stfa002,stfa003,stfa004,stfa005,stfa006,
          stfa007,stfa008,stfa009,stfa010,stfa011,stfa012,stfa013,stfa014,stfa015,stfa016,stfa017,
          stfa018,stfa019,stfa020,stfa021,stfa022,stfa023,stfa024,stfa025,stfa026,stfa027,stfa028,
          stfa029,stfa030,stfa031,stfa032,stfa033,stfa034,stfa035,stfa036,stfa037,stfa038,stfa039,
          stfa040,stfa041,stfa042,stfa043,stfa044,stfa045,stfa046,stfa047,stfa048,stfa049,stfaownid,
          stfaowndp,stfacrtid,stfacrtdp,stfacrtdt,stfamodid,stfamoddt,stfastus,stfacnfid,stfacnfdt,
          stfa050,stfa051,stfa052,stfa053,stfa054,stfa055,stfa056 INTO l_stfa.*
  #161111-00028#3--add----end-----------
     FROM stfa_t
    WHERE stfaent=g_enterprise
      AND stfa005=p_stfa005
      and stfasite=p_stfasite
     
   #结算账单资料
  # SELECT * INTO l_stfj.*  #161111-00028#3--mark
  #161111-00028#3--add----begin---------
   SELECT stfjent,stfjsite,stfjunit,stfjseq,stfj001,stfj002,stfj003,stfj004,stfj005,stfj006 INTO l_stfj.*
  #161111-00028#3--add----end-----------
     from  stfj_t
    where  stfjent=g_enterprise
      and  stfj001=l_stfa.stfa001
      and  stfjseq=p_stfjseq
      
      
   #获取单头资料
   # SELECT * INTO l_stba.*  #161111-00028#3--mark
  #161111-00028#3--add----begin---------
   SELECT stbaent,stbasite,stbaunit,stbadocno,stbadocdt,stba001,stba002,stba003,stba004,stba005,stba006,
          stba007,stba008,stba009,stbastus,stbaownid,stbaowndp,stbacrtid,stbacrtdp,stbacrtdt,stbamodid,
          stbamoddt,stbacnfid,stbacnfdt,stba010,stba011,stba012,stba013,stba014,stba015,stba000,stba016,
          stba017,stba018,stba019,stba020,stba021,stba022,stba023,stba024,stba025,stba026,stba027 INTO l_stba.*
  #161111-00028#3--add----end-----------
     FROM stba_t 
    WHERE stbadocno = p_stbadocno
      and stbaent = g_enterprise
     
   INITIALIZE l_stba.* TO NULL
     #抓取默認單別arti200的設定
  
   CALL s_arti200_get_def_doc_type(l_stfa.stfasite,'astt510','2') RETURNING l_success,r_doctype
   IF NOT l_success THEN
      LET r_success=FALSE
      RETURN r_success,r_stbadocno  
  
   END IF

   #自動編號-----单据编号l_stba.stbadocno
   #CALL s_aooi200_gen_docno(l_stfa.stfasite,r_doctype,g_today,'astt510') RETURNING l_success,l_stba.stbadocno   #160803-00040#1 20160804 mark by beckxie
   CALL s_aooi200_gen_docno(l_stfa.stfasite,r_doctype,p_eday,'astt510') RETURNING l_success,l_stba.stbadocno   #160803-00040#1 20160804 add by beckxie
   IF NOT l_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'apm-00003'
      LET g_errparam.extend = r_doctype
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success=FALSE
      RETURN r_success,r_stbadocno         
    END IF  
       
   #制定组织：按照专柜合同的营运据点进行赋值。
   #合同编号、供应商编号、经营方式、结算方式、结算类型、币别、按照专柜合同赋值。
   #税别：赋值为销项税。
   #来源类型：2-合约
   #人员：签约人员，并带出对应部门。
   #结算中心：签订法人。
   #异动资讯：按照标准赋值。
   LET l_stba.stba000  = 'astt510'   #160613-00045#5 20160616 add by beckxie
    #zhanghr
   LET l_stba.stbasite = p_stfasite    
   #单据日期
   #LET l_stba.stbadocdt = g_today             #单据日期    
   LET l_stba.stbadocdt = p_eday             #单据日期    #modified by LanJJ 15/10/09
   LET l_stba.stbaunit = p_stfasite      #指定组织=运营据点
   LET l_stba.stba010  = l_stfa.stfa001  #合同编号
   #LET l_stba.stba002  = l_stfa.stfa010  #供应商编号   #mark by yangxf 
   CALL s_astt401_stey003_get(l_stfa.stfa005,l_stba.stbadocdt) RETURNING l_stba.stba002    #add by yangxf #供應商編號 
   #zhanghr
   LET l_stba.stba013  = l_stfa.stfa005   #专柜编号
   #单据编号
   #单据日期
   LET l_stba.stba003  = l_stfa.stfa003  #经营方式
   LET l_stba.stba004  = l_stfa.stfa036  #结算方式
   #结算类型zhanghr
   LET l_stba.stba005  = l_stfa.stfa037  #结算类型
   LET l_stba.stba005  = l_stfa.stfa037  #类型
     #状态码
   LET l_stba.stbastus  = 'N'                 #状态码     
   #LET l_stba.stba006  = '2'             #À´Ô´ÀàÐÍ #MARKED BY LANJJ 2015-10-12
   LET l_stba.stba006  = '18'             #À´Ô´ÀàÐÍ #ADDED BY LANJJ2015-10-12
   #LET l_stba.stba001  = l_stfa.stfa014  #结算中心 #MARKED BY LANJJ 151022
   #LET l_stba.stba001  = l_stfa.stfa038  #ADDED BY LANJJ 151022
   CALL s_astt401_stey006_get(l_stfa.stfa005,l_stba.stbadocdt) RETURNING l_stba.stba001   #l 结算中心 anjj add on 2016-07-28
   
   #费用总额zhanghr
   #??????????
   LET l_stba.stba011  = l_stfa.stfa032  #币别
   #LET l_stba.stba012  = l_stfa.stfa033  #销项税
   CALL s_astt401_stey004_get(l_stfa.stfa005,l_stba.stbadocdt) RETURNING l_stba.stba012  #税别 lanjj add on 2016-07-28
   LET l_stba.stba008  = l_stfa.stfa015  #人员
   LET l_stba.stba009  = g_dept               #部门？？？？？？？？？？
  
  #zhanghr
   #费用类型
   LET l_stba.stba014 = '2'
  
   #异动资讯
   LET l_stba.stbaownid = g_user                    #资料所有者
   LET l_stba.stbaowndp = g_dept                    #资料所有部门
   LET l_stba.stbacrtid = g_user                    #资料创建者
   LET l_stba.stbacrtdp = g_dept                    #资料创建部门
   LET l_stba.stbacrtdt = g_today                   #资料创建日
   LET l_stba.stbamodid = g_user                   #资料修改者
   LET l_stba.stbamoddt = cl_get_current()         #最近修改日
   LET l_stba.stbacnfid = g_user                   #资料确认者
   LET l_stba.stbacnfdt = ''                        #数据确认日
   LET l_stba.stbaent = l_stfa.stfaent
   
   
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
      LET g_errparam.extend = "ins stba_t",l_stba.stba013
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success=FALSE
      RETURN r_success,r_stbadocno 
    
   END IF  
   
   LET r_stbadocno=l_stba.stbadocno
   RETURN r_success,r_stbadocno


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
PUBLIC FUNCTION s_astp517_ins_stbb(p_stbadocno,p_stfjseq,p_stfa005,p_sday,p_eday)

DEFINE l_success       LIKE type_t.num5
DEFINE p_stbadocno   LIKE stba_t.stbadocno
define p_stfa005     like stfa_t.stfa005
DEFINE r_success     LIKE type_t.num5
DEFINE p_sday     LIKE  type_t.chr500
DEFINE p_eday     LIKE  type_t.chr500
DEFINE p_stfjseq       LIKE stfj_t.stfjseq
DEFINE l_sum1     LIKE stgb_t.stgb009
DEFINE l_sum2     LIKE stgb_t.stgb009
DEFINE l_sum3     LIKE stgb_t.stgb009
DEFINE l_sql      STRING
DEFINE l_sql2      STRING
#161111-00028#3---MODIFY--BEGIN--------
#DEFINE l_stfa  RECORD  LIKE stfa_t.*
#DEFINE l_stfj  RECORD  LIKE stfj_t.*
#DEFINE l_stbb  RECORD  LIKE stbb_t.*
#DEFINE l_stba  RECORD  LIKE stba_t.*
DEFINE l_stfj RECORD  #專櫃合約結算帳期檔
       stfjent LIKE stfj_t.stfjent, #企業編號
       stfjsite LIKE stfj_t.stfjsite, #營運據點
       stfjunit LIKE stfj_t.stfjunit, #應用組織
       stfjseq LIKE stfj_t.stfjseq, #帳期
       stfj001 LIKE stfj_t.stfj001, #合約編號
       stfj002 LIKE stfj_t.stfj002, #起始日期
       stfj003 LIKE stfj_t.stfj003, #截止日期
       stfj004 LIKE stfj_t.stfj004, #結算日期
       stfj005 LIKE stfj_t.stfj005, #結算否
       stfj006 LIKE stfj_t.stfj006 #結算單號
       END RECORD
DEFINE l_stfa RECORD  #專櫃合約主檔
       stfaent LIKE stfa_t.stfaent, #企業編號
       stfasite LIKE stfa_t.stfasite, #營運據點
       stfaunit LIKE stfa_t.stfaunit, #制定組織
       stfaacti LIKE stfa_t.stfaacti, #合約有效
       stfa001 LIKE stfa_t.stfa001, #合約編號
       stfa002 LIKE stfa_t.stfa002, #版本
       stfa003 LIKE stfa_t.stfa003, #經營方式
       stfa004 LIKE stfa_t.stfa004, #合約狀態
       stfa005 LIKE stfa_t.stfa005, #专柜编号
       stfa006 LIKE stfa_t.stfa006, #專櫃類型
       stfa007 LIKE stfa_t.stfa007, #建築面積
       stfa008 LIKE stfa_t.stfa008, #經營面積
       stfa009 LIKE stfa_t.stfa009, #檔案編號
       stfa010 LIKE stfa_t.stfa010, #供應商編號
       stfa011 LIKE stfa_t.stfa011, #主品類
       stfa012 LIKE stfa_t.stfa012, #主品牌
       stfa013 LIKE stfa_t.stfa013, #模板編號
       stfa014 LIKE stfa_t.stfa014, #簽訂法人
       stfa015 LIKE stfa_t.stfa015, #簽訂人員
       stfa016 LIKE stfa_t.stfa016, #簽訂日期
       stfa017 LIKE stfa_t.stfa017, #進場日期
       stfa018 LIKE stfa_t.stfa018, #撤場日期
       stfa019 LIKE stfa_t.stfa019, #生效日期
       stfa020 LIKE stfa_t.stfa020, #失效日期
       stfa021 LIKE stfa_t.stfa021, #作廢日期
       stfa022 LIKE stfa_t.stfa022, #甲方日期
       stfa023 LIKE stfa_t.stfa023, #乙方日期
       stfa024 LIKE stfa_t.stfa024, #清退日期
       stfa025 LIKE stfa_t.stfa025, #延期日期
       stfa026 LIKE stfa_t.stfa026, #蓋章日期
       stfa027 LIKE stfa_t.stfa027, #文字蓋章否
       stfa028 LIKE stfa_t.stfa028, #按天產生銷售成本
       stfa029 LIKE stfa_t.stfa029, #收銀方式
       stfa030 LIKE stfa_t.stfa030, #定價屬性
       stfa031 LIKE stfa_t.stfa031, #專櫃ABC
       stfa032 LIKE stfa_t.stfa032, #幣別
       stfa033 LIKE stfa_t.stfa033, #進項稅
       stfa034 LIKE stfa_t.stfa034, #銷項稅
       stfa035 LIKE stfa_t.stfa035, #收付款方式
       stfa036 LIKE stfa_t.stfa036, #結算方式
       stfa037 LIKE stfa_t.stfa037, #結算類別
       stfa038 LIKE stfa_t.stfa038, #結算中心
       stfa039 LIKE stfa_t.stfa039, #基本提成率
       stfa040 LIKE stfa_t.stfa040, #增值稅扣率
       stfa041 LIKE stfa_t.stfa041, #合約摘要
       stfa042 LIKE stfa_t.stfa042, #經營範圍說明
       stfa043 LIKE stfa_t.stfa043, #備註
       stfa044 LIKE stfa_t.stfa044, #所屬部門
       stfa045 LIKE stfa_t.stfa045, #管理方式
       stfa046 LIKE stfa_t.stfa046, #業態
       stfa047 LIKE stfa_t.stfa047, #樓棟
       stfa048 LIKE stfa_t.stfa048, #樓層
       stfa049 LIKE stfa_t.stfa049, #續簽日期
       stfaownid LIKE stfa_t.stfaownid, #資料所屬者
       stfaowndp LIKE stfa_t.stfaowndp, #資料所有部門
       stfacrtid LIKE stfa_t.stfacrtid, #資料建立者
       stfacrtdp LIKE stfa_t.stfacrtdp, #資料建立部門
       stfacrtdt LIKE stfa_t.stfacrtdt, #資料創建日
       stfamodid LIKE stfa_t.stfamodid, #資料修改者
       stfamoddt LIKE stfa_t.stfamoddt, #最近修改日
       stfastus LIKE stfa_t.stfastus, #狀態碼
       stfacnfid LIKE stfa_t.stfacnfid, #資料確認者
       stfacnfdt LIKE stfa_t.stfacnfdt, #資料確認日
       stfa050 LIKE stfa_t.stfa050, #代扣代繳稅否
       stfa051 LIKE stfa_t.stfa051, #管理品類
       stfa052 LIKE stfa_t.stfa052, #最低折扣率
       stfa053 LIKE stfa_t.stfa053, #促銷庫區參與保底否
       stfa054 LIKE stfa_t.stfa054, #是否補差
       stfa055 LIKE stfa_t.stfa055, #庫區商品化否
       stfa056 LIKE stfa_t.stfa056 #工衣情況
       END RECORD
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
       
define l_stae003 like stae_t.stae003
DEFINE l_stgb009   LIKE stgb_t.stgb009
DEFINE l_stgb004   LIKE stgb_t.stgb004   #费用代码
 DEFINE l_cnt         LIKE type_t.num10
define l_stba013 like stba_t.stba013
define l_count     integer  
define l_stbb012 like stbb_t.stbb012
define l_stbb013 like stbb_t.stbb013
define l_stbb011 like stbb_t.stbb011
define l_stbb014 like stbb_t.stbb014
define l_stbb008 like stbb_t.stbb008
define l_stfa001 like stfa_t.stfa001
DEFINE l_stgb     RECORD
     stgb004 LIKE stgb_t.stgb004,
     stgb009 LIKE stgb_t.stgb009,
     stgb001 LIKE stgb_t.stgb001,
     stgb011 LIKE stgb_t.stgb011
   END RECORD
DEFINE l_stfj002 LIKE stfj_t.stfj002
DEFINE l_stfj003 LIKE stfj_t.stfj003
   
DEFINE l_ac like type_t.num10
DEFINE  l_stfa050             LIKE stfa_t.stfa050    #add by geza 20150908 
   LET r_success=TRUE
   
   #传进单据编号
   IF cl_null(p_stbadocno) THEN
      LET r_success=FALSE
      RETURN r_success   
   END IF    
   LET l_sql = "SELECT distinct stgb004,stgb009,stgb001,stgb011 from stgb_t",
                 " WHERE stgbsite='",g_site,"' and stgb002 = '",p_stfa005,"'"
                                
   PREPARE astp517_pb FROM l_sql
   DECLARE b_fill_curs CURSOR FOR astp517_pb  
   FOREACH b_fill_curs INTO l_stgb.stgb004,l_stgb.stgb009,l_stgb.stgb001,l_stgb.stgb011
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "FOREACH:" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         EXIT FOREACH
         LET r_success=FALSE
      END IF
      
      IF l_stgb.stgb011='Y' THEN
         CONTINUE FOREACH
      END IF
  
      #获取单头资料
      #SELECT * INTO l_stba.*  #161111-00028#3--mark
      #161111-00028#3--add----begin---------
     SELECT stbaent,stbasite,stbaunit,stbadocno,stbadocdt,stba001,stba002,stba003,stba004,stba005,stba006,
            stba007,stba008,stba009,stbastus,stbaownid,stbaowndp,stbacrtid,stbacrtdp,stbacrtdt,stbamodid,
            stbamoddt,stbacnfid,stbacnfdt,stba010,stba011,stba012,stba013,stba014,stba015,stba000,stba016,
            stba017,stba018,stba019,stba020,stba021,stba022,stba023,stba024,stba025,stba026,stba027 INTO l_stba.*
     #161111-00028#3--add----end-----------
       FROM stba_t
      WHERE stbadocno = p_stbadocno 
        AND stbaent = g_enterprise      
  　#专柜编号+企业编号
    #SELECT * INTO l_stfa.*  #161111-00028#3--mark
    #161111-00028#3--add----begin---------  
     SELECT stfaent,stfasite,stfaunit,stfaacti,stfa001,stfa002,stfa003,stfa004,stfa005,stfa006,stfa007,
            stfa008,stfa009,stfa010,stfa011,stfa012,stfa013,stfa014,stfa015,stfa016,stfa017,stfa018,stfa019,
            stfa020,stfa021,stfa022,stfa023,stfa024,stfa025,stfa026,stfa027,stfa028,stfa029,stfa030,stfa031,
            stfa032,stfa033,stfa034,stfa035,stfa036,stfa037,stfa038,stfa039,stfa040,stfa041,stfa042,stfa043,
            stfa044,stfa045,stfa046,stfa047,stfa048,stfa049,stfaownid,stfaowndp,stfacrtid,stfacrtdp,stfacrtdt,
            stfamodid,stfamoddt,stfastus,stfacnfid,stfacnfdt,stfa050,stfa051,stfa052,stfa053,
            stfa054,stfa055,stfa056 INTO l_stfa.*
    #161111-00028#3--add----end---------
       FROM stfa_t
      WHERE stfaent = l_stba.stbaent
        AND stfa005 = l_stba.stba013 
    #mark by geza 20150831(S)        
    #获取专柜合同所属部门和主品类、合同编号
#     SELECT stfa044,stfa011,stfa001
#       INTO l_stbb012,l_stbb011,l_stfa001
#       FROM stfa_t
#      WHERE stfaent = g_enterprise
#        AND stfa005 = p_stfa005
#        AND stfasite = l_stba.stbasite
    #mark by geza 20150831(E)
    #add by geza 20150831(S) 
    #获取专柜合同所属部门和管理品类、合同编号
     SELECT stfa044,stfa051,stfa001
       INTO l_stbb012,l_stbb011,l_stfa001
       FROM stfa_t
      WHERE stfaent = g_enterprise
        AND stfa005 = p_stfa005
        AND stfasite = l_stba.stbasite
     #add by geza 20150831(S)   
    #######################
    #判断销售日期是否在所选账期日期内
    SELECT stfj002,stfj003
      INTO l_stfj002,l_stfj003   
      FROM stfj_t
     WHERE stfjseq = p_stfjseq
       AND stfj001 = l_stfa001          #合同编号
       AND stfjent =g_enterprise
    
     IF l_stgb.stgb001 > l_stfj003 OR l_stgb.stgb001 < l_stfj002 THEN
         CONTINUE FOREACH
     END IF
    
    
    ###########################################
    
    
  
     
    #根据单头资料提供的合同编号获取stfj_t的起始/截止日期/账期等
  # SELECT * INTO l_stfj.* #161111-00028#3--mark
  #161111-00028#3--add--begin----
    SELECT stfjent,stfjsite,stfjunit,stfjseq,stfj001,stfj002,stfj003,stfj004,stfj005,stfj006 INTO l_stfj.*
  #161111-00028#3--add--end------
      FROM stfj_t
     WHERE stfjent = l_stfa.stfaent  #企业编号
       AND stfj001 = l_stfa001       #合同编号
       AND stfjseq = p_stfjseq       #账期

    #结算会计期：stbb007 
    SELECT to_char(to_date(l_stfj.stfj003,'yyyy/mm/dd'), 'yyyymm') INTO l_stbb.stbb007 from dual
        
    #结算日期所属的会计年度和会计期别
   SELECT  distinct glav002,glav006 
     INTO l_stbb.stbb008,l_stbb.stbb014
     FROM glav_t
     WHERE glav004 = l_stfj.stfj004
      AND glavent = l_stfj.stfjent
 #
    LET l_stbb.stbb009 =l_stgb.stgb009
    
    LET l_stbb.stbb001 =l_stgb.stgb004
  #费用总类3、费用性质4、扣票否7、纳入计算11/价款类别6、
#    
      #     #mark by geza 20150904(S)
#      SELECT stae003,stae007,stae011 ,stae006
#       INTO l_stae003,l_stbb.stbb016,l_stbb.stbb015,l_stbb.stbb004
#       FROM stae_t
#      WHERE staeent = g_enterprise
#        AND stae001 = l_stgb.stgb004
       #mark by geza 20150904(E)  
      #add by geza 20150904(S)
      SELECT stae003,stae006
       INTO l_stae003,l_stbb.stbb004
       FROM stae_t
      WHERE staeent = g_enterprise
        AND stae001 = l_stgb.stgb004
      SELECT stfk020,stfk021 INTO l_stbb.stbb015,l_stbb.stbb016
        FROM stfk_t
       WHERE stfkent = g_enterprise
         AND stfk001 = l_stba.stba010 
         AND rownum=1    #add by geza 20150910         
      IF l_stbb.stbb015 IS NULL AND l_stbb.stbb016 IS NULL THEN
         #mark by geza 20150908(S)  
         #CALL s_get_stfa050_stbb015(l_stba.stba010)  RETURNING  l_stbb.stbb015,l_stbb.stbb016   
         #mark by geza 20150908(E)
         #add by geza 20150908(S)
         #抓取纳入结算单否    
         INITIALIZE l_stfa050 TO NULL
         SELECT stfa050 INTO l_stfa050
           FROM stfa_t
          WHERE stfaent = g_enterprise
            AND stfastus = 'Y' 
            AND stfa001 = l_stba.stba010
         CALL s_astt401_get_stae007(l_stfa050,l_stbb.stbb001)  RETURNING  l_stbb.stbb015,l_stbb.stbb016   
         #add by geza 20150908(E)          
      END IF       
      #add by geza 20150904(E)
      LET l_stbb.stbbent=g_enterprise
      LET l_stbb.stbbsite=l_stba.stbasite
      LET l_stbb.stbbdocno = p_stbadocno
      LET l_stbb.stbb002 = l_stba.stba011                          #币别
      LET l_stbb.stbb003 = l_stba.stba012                          #税别
      LET l_stbb.stbb005 = p_sday                                  #起始日期
      LET l_stbb.stbb006 = p_eday                                  #截止日期
     # LET l_stbb.stbb008 = l_stbb008         #结算会计年度
     # LET l_stbb.stbb014 = l_stbb014         #结算会计期别
      LET l_stbb.stbb010 ='1'                            #承担对象zhr5015818
      LET l_stbb.stbb013 = '1'                            #结算对象zhr5015818
      LET l_stbb.stbbsite =l_stba.stbasite                           #运营组织
      LET l_stbb.stbbunit = l_stba.stbaunit
      LET l_stbb.stbb012  = l_stbb012                               #所属部门
      
      LET l_stbb.stbb011  = l_stbb011  
      LET l_stbb.stbbent = l_stba.stbaent  
     
      SELECT MAX(stbbseq)+1 INTO l_stbb.stbbseq
        FROM stbb_t
       WHERE stbbent=g_enterprise
         AND stbbdocno=p_stbadocno
         
      IF cl_null(l_stbb.stbbseq) THEN
         LET l_stbb.stbbseq=1
      END IF      
      #add by geza 20150831(S)
      #根据开始日期结束日期抓取结算账期和结算日期
      CALL s_settle_date_get_stbb019(l_stba.stba010,l_stbb.stbb005,l_stbb.stbb006,'2') 
         RETURNING  l_stbb.stbb018,l_stbb.stbb019  
      #add by geza 20150831(E)
      CALL s_curr_round(l_stba.stbasite,l_stbb.stbb002,l_stbb.stbb009,'2') RETURNING l_stbb.stbb009  #add by yangxf
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
          LET g_errparam.extend = "into stbb_t"
          LET g_errparam.popup = TRUE
          CALL cl_err()
          LET r_success=FALSE
          RETURN r_success    
       END IF

    
   END FOREACH            

  select count(*)  into l_count from stbb_t where stbbdocno=p_stbadocno
  AND stbbent=g_enterprise #160905-00007#16 add
   if l_count>0 then 
      RETURN r_success
   else 
      LET r_success=FALSE
      RETURN r_success  
   end if 
END FUNCTION

################################################################################
# Descriptions...: 插单身
# Date & Author..: 15/10/18 BY lanjj
# Modify.........:
################################################################################
PRIVATE FUNCTION astp517_ins_stbb(p_stbadocno,p_stfjseq,p_stfa005,p_sday,p_eday,p_stgb004,p_sumstgb009,p_stfj002,p_stfj003)
###### FUNTION ADDED BY LANJJ 15/10/09 ###########
-------FUNTION 替换掉 s_astp517_ins_stbb()---------
DEFINE l_success     LIKE type_t.num5
DEFINE p_stbadocno   LIKE stba_t.stbadocno
define p_stfa005     like stfa_t.stfa005
DEFINE r_success     LIKE type_t.num5
DEFINE p_sday        LIKE  type_t.chr500
DEFINE p_eday        LIKE  type_t.chr500
DEFINE p_stfjseq     LIKE stfj_t.stfjseq
DEFINE p_stgb004     like stgb_t.stgb004   #ADDED BY LANJJ 15/10/09 费用编号
DEFINE p_sumstgb009  LIKE stgb_t.stgb009   #ADDED BY LANJJ 15/10/09 费用合计
DEFINE p_stfj002     LIKE stfj_t.stfj002   #ADDED BY LANJJ 15/10/09 结算开始周期
DEFINE p_stfj003     LIKE stfj_t.stfj003   #ADDED BY LANJJ 15/10/09 结算结束日期
DEFINE l_sum1     LIKE stgb_t.stgb009
DEFINE l_sum2     LIKE stgb_t.stgb009
DEFINE l_sum3     LIKE stgb_t.stgb009
DEFINE l_sql      STRING
DEFINE l_sql2     STRING
#161111-00028#3--modify----begin------------  
#DEFINE l_stfa     RECORD  LIKE stfa_t.*
#DEFINE l_stfj     RECORD  LIKE stfj_t.*
#DEFINE l_stbb     RECORD  LIKE stbb_t.*
#DEFINE l_stba     RECORD  LIKE stba_t.*
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
DEFINE l_stfa RECORD  #專櫃合約主檔
       stfaent LIKE stfa_t.stfaent, #企業編號
       stfasite LIKE stfa_t.stfasite, #營運據點
       stfaunit LIKE stfa_t.stfaunit, #制定組織
       stfaacti LIKE stfa_t.stfaacti, #合約有效
       stfa001 LIKE stfa_t.stfa001, #合約編號
       stfa002 LIKE stfa_t.stfa002, #版本
       stfa003 LIKE stfa_t.stfa003, #經營方式
       stfa004 LIKE stfa_t.stfa004, #合約狀態
       stfa005 LIKE stfa_t.stfa005, #专柜编号
       stfa006 LIKE stfa_t.stfa006, #專櫃類型
       stfa007 LIKE stfa_t.stfa007, #建築面積
       stfa008 LIKE stfa_t.stfa008, #經營面積
       stfa009 LIKE stfa_t.stfa009, #檔案編號
       stfa010 LIKE stfa_t.stfa010, #供應商編號
       stfa011 LIKE stfa_t.stfa011, #主品類
       stfa012 LIKE stfa_t.stfa012, #主品牌
       stfa013 LIKE stfa_t.stfa013, #模板編號
       stfa014 LIKE stfa_t.stfa014, #簽訂法人
       stfa015 LIKE stfa_t.stfa015, #簽訂人員
       stfa016 LIKE stfa_t.stfa016, #簽訂日期
       stfa017 LIKE stfa_t.stfa017, #進場日期
       stfa018 LIKE stfa_t.stfa018, #撤場日期
       stfa019 LIKE stfa_t.stfa019, #生效日期
       stfa020 LIKE stfa_t.stfa020, #失效日期
       stfa021 LIKE stfa_t.stfa021, #作廢日期
       stfa022 LIKE stfa_t.stfa022, #甲方日期
       stfa023 LIKE stfa_t.stfa023, #乙方日期
       stfa024 LIKE stfa_t.stfa024, #清退日期
       stfa025 LIKE stfa_t.stfa025, #延期日期
       stfa026 LIKE stfa_t.stfa026, #蓋章日期
       stfa027 LIKE stfa_t.stfa027, #文字蓋章否
       stfa028 LIKE stfa_t.stfa028, #按天產生銷售成本
       stfa029 LIKE stfa_t.stfa029, #收銀方式
       stfa030 LIKE stfa_t.stfa030, #定價屬性
       stfa031 LIKE stfa_t.stfa031, #專櫃ABC
       stfa032 LIKE stfa_t.stfa032, #幣別
       stfa033 LIKE stfa_t.stfa033, #進項稅
       stfa034 LIKE stfa_t.stfa034, #銷項稅
       stfa035 LIKE stfa_t.stfa035, #收付款方式
       stfa036 LIKE stfa_t.stfa036, #結算方式
       stfa037 LIKE stfa_t.stfa037, #結算類別
       stfa038 LIKE stfa_t.stfa038, #結算中心
       stfa039 LIKE stfa_t.stfa039, #基本提成率
       stfa040 LIKE stfa_t.stfa040, #增值稅扣率
       stfa041 LIKE stfa_t.stfa041, #合約摘要
       stfa042 LIKE stfa_t.stfa042, #經營範圍說明
       stfa043 LIKE stfa_t.stfa043, #備註
       stfa044 LIKE stfa_t.stfa044, #所屬部門
       stfa045 LIKE stfa_t.stfa045, #管理方式
       stfa046 LIKE stfa_t.stfa046, #業態
       stfa047 LIKE stfa_t.stfa047, #樓棟
       stfa048 LIKE stfa_t.stfa048, #樓層
       stfa049 LIKE stfa_t.stfa049, #續簽日期
       stfaownid LIKE stfa_t.stfaownid, #資料所屬者
       stfaowndp LIKE stfa_t.stfaowndp, #資料所有部門
       stfacrtid LIKE stfa_t.stfacrtid, #資料建立者
       stfacrtdp LIKE stfa_t.stfacrtdp, #資料建立部門
       stfacrtdt LIKE stfa_t.stfacrtdt, #資料創建日
       stfamodid LIKE stfa_t.stfamodid, #資料修改者
       stfamoddt LIKE stfa_t.stfamoddt, #最近修改日
       stfastus LIKE stfa_t.stfastus, #狀態碼
       stfacnfid LIKE stfa_t.stfacnfid, #資料確認者
       stfacnfdt LIKE stfa_t.stfacnfdt, #資料確認日
       stfa050 LIKE stfa_t.stfa050, #代扣代繳稅否
       stfa051 LIKE stfa_t.stfa051, #管理品類
       stfa052 LIKE stfa_t.stfa052, #最低折扣率
       stfa053 LIKE stfa_t.stfa053, #促銷庫區參與保底否
       stfa054 LIKE stfa_t.stfa054, #是否補差
       stfa055 LIKE stfa_t.stfa055, #庫區商品化否
       stfa056 LIKE stfa_t.stfa056 #工衣情況
       END RECORD
DEFINE l_stfj RECORD  #專櫃合約結算帳期檔
       stfjent LIKE stfj_t.stfjent, #企業編號
       stfjsite LIKE stfj_t.stfjsite, #營運據點
       stfjunit LIKE stfj_t.stfjunit, #應用組織
       stfjseq LIKE stfj_t.stfjseq, #帳期
       stfj001 LIKE stfj_t.stfj001, #合約編號
       stfj002 LIKE stfj_t.stfj002, #起始日期
       stfj003 LIKE stfj_t.stfj003, #截止日期
       stfj004 LIKE stfj_t.stfj004, #結算日期
       stfj005 LIKE stfj_t.stfj005, #結算否
       stfj006 LIKE stfj_t.stfj006 #結算單號
       END RECORD
#161111-00028#3--modify----end------------
define l_stae003  like stae_t.stae003
DEFINE l_stgb009  LIKE stgb_t.stgb009
DEFINE l_stgb004  LIKE stgb_t.stgb004   #费用代码
 DEFINE l_cnt     LIKE type_t.num10
define l_stba013  like stba_t.stba013
define l_count    integer  
define l_stbb012 like stbb_t.stbb012
define l_stbb013 like stbb_t.stbb013
define l_stbb011 like stbb_t.stbb011
define l_stbb014 like stbb_t.stbb014
define l_stbb008 like stbb_t.stbb008
define l_stfa001 like stfa_t.stfa001
DEFINE l_stgb     RECORD
     stgb004 LIKE stgb_t.stgb004,
     stgb009 LIKE stgb_t.stgb009,
     stgb001 LIKE stgb_t.stgb001,
     stgb011 LIKE stgb_t.stgb011
   END RECORD
DEFINE l_stfj002 LIKE stfj_t.stfj002
DEFINE l_stfj003 LIKE stfj_t.stfj003
   
DEFINE l_ac like type_t.num10
DEFINE  l_stfa050             LIKE stfa_t.stfa050    #add by geza 20150908 
   LET r_success=TRUE
   
   #传进单据编号
   IF cl_null(p_stbadocno) THEN
      LET r_success=FALSE
      RETURN r_success   
   END IF    
# {  LET l_sql = "SELECT distinct stgb004,stgb009,stgb001,stgb011 from stgb_t",
#                 " WHERE stgbsite='",g_site,"' and stgb002 = '",p_stfa005,"'"
#                                
#   PREPARE astp517_pb FROM l_sql
#   DECLARE b_fill_curs CURSOR FOR astp517_pb  
#   FOREACH b_fill_curs INTO l_stgb.stgb004,l_stgb.stgb009,l_stgb.stgb001,l_stgb.stgb011
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL 
#         LET g_errparam.extend = "FOREACH:" 
#         LET g_errparam.code   = SQLCA.sqlcode 
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err()
#         EXIT FOREACH
#      END IF
#      
#      IF l_stgb.stgb011='Y' THEN
#         CONTINUE FOREACH
#      END IF
#  }                                        #MARKED BY LANJJ 15/10/09
  LET l_stgb.stgb004 = p_stgb004           #ADDED BY LANJJ 15/10/09
  LET l_stgb.stgb009 = p_sumstgb009        #ADDED BY LANJJ 15/10/09
      #获取单头资料
  #SELECT * INTO l_stba.*  #161111-00028#3--mark
  #161111-00028#3--add----begin---------
   SELECT stbaent,stbasite,stbaunit,stbadocno,stbadocdt,stba001,stba002,stba003,stba004,stba005,stba006,
          stba007,stba008,stba009,stbastus,stbaownid,stbaowndp,stbacrtid,stbacrtdp,stbacrtdt,stbamodid,
          stbamoddt,stbacnfid,stbacnfdt,stba010,stba011,stba012,stba013,stba014,stba015,stba000,stba016,
          stba017,stba018,stba019,stba020,stba021,stba022,stba023,stba024,stba025,stba026,stba027 INTO l_stba.*
  #161111-00028#3--add----end-----------
       FROM stba_t      
      WHERE stbadocno = p_stbadocno 
        AND stbaent = g_enterprise      
  　#专柜编号+企业编号
    #SELECT * INTO l_stfa.*  #161111-00028#3--mark
    #161111-00028#3--add----begin---------  
    SELECT stfaent,stfasite,stfaunit,stfaacti,stfa001,stfa002,stfa003,stfa004,stfa005,stfa006,stfa007,
            stfa008,stfa009,stfa010,stfa011,stfa012,stfa013,stfa014,stfa015,stfa016,stfa017,stfa018,stfa019,
            stfa020,stfa021,stfa022,stfa023,stfa024,stfa025,stfa026,stfa027,stfa028,stfa029,stfa030,stfa031,
            stfa032,stfa033,stfa034,stfa035,stfa036,stfa037,stfa038,stfa039,stfa040,stfa041,stfa042,stfa043,
            stfa044,stfa045,stfa046,stfa047,stfa048,stfa049,stfaownid,stfaowndp,stfacrtid,stfacrtdp,stfacrtdt,
            stfamodid,stfamoddt,stfastus,stfacnfid,stfacnfdt,stfa050,stfa051,stfa052,stfa053,
            stfa054,stfa055,stfa056 INTO l_stfa.*
    #161111-00028#3--add----end---------
       FROM stfa_t
      WHERE stfaent = l_stba.stbaent
        AND stfa005 = l_stba.stba013 
    #mark by geza 20150831(S)        
    #获取专柜合同所属部门和主品类、合同编号
#     SELECT stfa044,stfa011,stfa001
#       INTO l_stbb012,l_stbb011,l_stfa001
#       FROM stfa_t
#      WHERE stfaent = g_enterprise
#        AND stfa005 = p_stfa005
#        AND stfasite = l_stba.stbasite
    #mark by geza 20150831(E)
    #add by geza 20150831(S) 
    #获取专柜合同所属部门和管理品类、合同编号
     SELECT stfa044,stfa051,stfa001
       INTO l_stbb012,l_stbb011,l_stfa001
       FROM stfa_t
      WHERE stfaent = g_enterprise
        AND stfa005 = p_stfa005
        AND stfasite = l_stba.stbasite
     #add by geza 20150831(S)   
#    #######################
#    #判断销售日期是否在所选账期日期内
#    SELECT stfj002,stfj003
#      INTO l_stfj002,l_stfj003   
#      FROM stfj_t
#     WHERE stfjseq = p_stfjseq
#       AND stfj001 = l_stfa001          #合同编号
#       AND stfjent =g_enterprise
#    
#     IF l_stgb.stgb001 > l_stfj003 OR l_stgb.stgb001 < l_stfj002 THEN
#         CONTINUE FOREACH
#     END IF
#    
#    
#    ###########################################      #MARKED BY LANJJ 15/10/09
    
    
  
     
    #根据单头资料提供的合同编号获取stfj_t的起始/截止日期/账期等
    #SELECT * INTO l_stfj.*  #161111-00028#3--mark
    #161111-00028#3--add----begin---------
    SELECT stfjent,stfjsite,stfjunit,stfjseq,stfj001,stfj002,stfj003,stfj004,stfj005,stfj006 INTO l_stfj.*
    #161111-00028#3--add----end-----------
      FROM stfj_t
     WHERE stfjent = l_stfa.stfaent  #企业编号
       AND stfj001 = l_stfa001       #合同编号
       AND stfjseq = p_stfjseq       #账期

    #结算会计期：stbb007 
    SELECT to_char(to_date(l_stfj.stfj003,'yyyy/mm/dd'), 'yyyymm') INTO l_stbb.stbb007 from dual
        
    #结算日期所属的会计年度和会计期别
   SELECT  distinct glav002,glav006 
     INTO l_stbb.stbb008,l_stbb.stbb014
     FROM glav_t
     WHERE glav004 = l_stfj.stfj004
      AND glavent = l_stfj.stfjent
 #
    LET l_stbb.stbb009 =l_stgb.stgb009
    LET l_stbb.stbb001 =l_stgb.stgb004
  #费用总类3、费用性质4、扣票否7、纳入计算11/价款类别6、
#    
      #     #mark by geza 20150904(S)
#      SELECT stae003,stae007,stae011 ,stae006
#       INTO l_stae003,l_stbb.stbb016,l_stbb.stbb015,l_stbb.stbb004
#       FROM stae_t
#      WHERE staeent = g_enterprise
#        AND stae001 = l_stgb.stgb004
       #mark by geza 20150904(E)  
      #add by geza 20150904(S)
      SELECT stae003,stae006
       INTO l_stae003,l_stbb.stbb004
       FROM stae_t
      WHERE staeent = g_enterprise
        AND stae001 = l_stgb.stgb004
      SELECT stfk020,stfk021 INTO l_stbb.stbb015,l_stbb.stbb016
        FROM stfk_t
       WHERE stfkent = g_enterprise
         AND stfk001 = l_stba.stba010 
         AND rownum=1    #add by geza 20150910         
      INITIALIZE l_stfa050 TO NULL
         SELECT stfa050 INTO l_stfa050
           FROM stfa_t
          WHERE stfaent = g_enterprise
            AND stfastus = 'Y' 
            AND stfa001 = l_stba.stba010
              
      #LET l_stbb.stbbud001 = l_stfa050
      CALL s_astt401_stey005_get(l_stba.stba013,l_stba.stbadocdt) RETURNING l_stbb.stbbud001 #含发票否 lanjj add on 2016-07-28
      
      IF l_stbb.stbb015 IS NULL AND l_stbb.stbb016 IS NULL THEN
         #mark by geza 20150908(S)  
         #CALL s_get_stfa050_stbb015(l_stba.stba010)  RETURNING  l_stbb.stbb015,l_stbb.stbb016   
         #mark by geza 20150908(E)
         #add by geza 20150908(S)
         #抓取纳入结算单否    
         CALL s_astt401_get_stae007(l_stfa050,l_stbb.stbb001)  RETURNING  l_stbb.stbb015,l_stbb.stbb016   
         #add by geza 20150908(E)          
      END IF       
      #add by geza 20150904(E)
      LET l_stbb.stbbent=g_enterprise
      LET l_stbb.stbbsite=l_stba.stbasite
      LET l_stbb.stbbdocno = p_stbadocno
      LET l_stbb.stbb002 = l_stba.stba011                          #币别
      
      #LET l_stbb.stbb003 = l_stba.stba012                          #税别  MARKED BY LANJJ 2015-10-13
      #ADDED BY LANJJ 2015-10-13 START 
      IF l_stbb.stbb016 = 'Y' THEN 
#         SELECT stfa033
#           INTO l_stbb.stbb003  #税别编号
#           FROM stfa_t
#          WHERE stfaent = g_enterprise
#            AND stfasite = g_site
#            AND stfa005 = p_stfa005
         --   AND stfastus = 'Y'  
         CALL s_astt401_stey004_get(l_stba.stba013,l_stba.stbadocdt) RETURNING l_stbb.stbb003   #税别 lanjj add on 2016-07-28
         END IF 
      IF l_stbb.stbb016 = 'N' THEN 
         SELECT stae010 
           INTO l_stbb.stbb003  #税别编号
           FROM stae_t
          WHERE staeent = g_enterprise
            AND stae001 = l_stbb.stbb001
         --  AND staestus = 'Y'
      END IF 
      #ADDED BY LANJJ 2015-10-13 END 
      #LET l_stbb.stbb005 = p_sday                                 #起始日期
      #LET l_stbb.stbb006 = p_eday                                 #截止日期
      LET l_stbb.stbb005 = p_stfj002                               #起始日期 #ADDED BY LANJJ 2015-10-13
      LET l_stbb.stbb006 = p_stfj003                               #截止日期 #ADDED BY LANJJ 2015-10-13
     # LET l_stbb.stbb008 = l_stbb008         #结算会计年度
     # LET l_stbb.stbb014 = l_stbb014         #结算会计期别
      LET l_stbb.stbb010 ='1'                            #承担对象zhr5015818
      LET l_stbb.stbb013 = '1'                            #结算对象zhr5015818
      LET l_stbb.stbbsite =l_stba.stbasite                           #运营组织
      LET l_stbb.stbbunit = l_stba.stbaunit
      LET l_stbb.stbb012  = l_stbb012                               #所属部门
      
      LET l_stbb.stbb011  = l_stbb011  
      LET l_stbb.stbbent = l_stba.stbaent   
      
      SELECT MAX(stbbseq)+1 INTO l_stbb.stbbseq
        FROM stbb_t
       WHERE stbbent=g_enterprise
         AND stbbdocno=p_stbadocno
         
      IF cl_null(l_stbb.stbbseq) THEN
         LET l_stbb.stbbseq=1
      END IF      
      #add by geza 20150831(S)
      #根据开始日期结束日期抓取结算账期和结算日期
      CALL s_settle_date_get_stbb019(l_stba.stba010,l_stbb.stbb005,l_stbb.stbb006,'2') 
         RETURNING  l_stbb.stbb018,l_stbb.stbb019  
      #add by geza 20150831(E)
    CALL s_curr_round(l_stba.stbasite,l_stbb.stbb002,l_stbb.stbb009,'2') RETURNING l_stbb.stbb009  #add by yangxf
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
          LET g_errparam.extend = "into stbb_t"
          LET g_errparam.popup = TRUE
          CALL cl_err()
          LET r_success=FALSE
          RETURN r_success    
       END IF

 #  END FOREACH         #MARKED BY LANJJ 15/10/09   
   
#  #select count(*)  into l_count from stbb_t where stbbdocno=p_stbadocno
#   if l_count>0 then 
#      RETURN r_success
#   else 
#      LET r_success=FALSE 
      RETURN r_success  
#   end if              #MARKED BY LANJJ 15/10/09  
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........: 複製astp517_insert() for 5.租賃使用 add by beckxie
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........: #160613-00045#5 20160616 add by beckxie
################################################################################
PRIVATE FUNCTION astp517_insert_1(p_wc,p_sday,p_eday)
DEFINE p_wc       STRING
DEFINE l_sql      STRING
DEFINE l_sql2      STRING
DEFINE p_sday     LIKE  type_t.chr500
DEFINE p_eday     LIKE  type_t.chr500
DEFINE l_success      LIKE type_t.num5
DEFINE r_success      LIKE type_t.num5
DEFINE r_string       STRING
DEFINE l_stbadocno    LIKE stba_t.stbadocno
DEFINE l_stje001      LIKE stje_t.stje001   #160801-00036#1 20160801 add by beckxie
DEFINE l_stje008      LIKE stje_t.stje008   
DEFINE l_stjoseq      LIKE stjo_t.stjoseq
DEFINE l_stjesite     LIKE stje_t.stjesite
#ADDED BY LanJJ 15/10/09 (S)---------------
DEFINE g_stbadocno_d  DYNAMIC ARRAY OF RECORD 
        stbadocno_del LIKE stba_t.stbadocno,  
        stjesite      LIKE stje_t.stjesite,
        stje008       LIKE stje_t.stje008
        END RECORD
DEFINE l_ac           LIKE TYPE_T.NUM5 
DEFINE l_stgb004      LIKE stgb_t.stgb004
DEFINE l_sumstgb009   LIKE stgb_t.stgb009
DEFINE l_stje008_t    LIKE stje_t.stje008
DEFINE l_count        LIKE type_t.num5
DEFINE l_stjo003      LIKE stjo_t.stjo003
DEFINE l_stjo004      LIKE stjo_t.stjo004
DEFINE l_msg          LIKE type_t.chr100   #160225-00040#18 2016/04/13 s983961--add
#ADDED BY LanJJ 15/10/09 (E)----------------

   #160613-00045#5 20160616 mark by beckxie---S
   #160225-00040#18 2016/04/13 s983961--add(s)
   #LET l_msg = cl_getmsg('ast-00329',g_lang)   
   #CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#18 2016/04/13 s983961--add(e)
   #160613-00045#5 20160616 mark by beckxie---E
   #開啟事務
   #CALL s_transaction_begin()   #160613-00045#5 20160617 mark by beckxie
   
   #160613-00045#5 20160616 add by beckxie---S
   #取代p_wc字串 
   LET p_wc = cl_replace_str(p_wc, 'stfasite', 'stjesite')         
   LET p_wc = cl_replace_str(p_wc, 'stfa005', 'stje008')         #鋪位編號
   LET p_wc = cl_replace_str(p_wc, 'stfa036', 'stje031')         #結算方式
   LET p_wc = cl_replace_str(p_wc, 'stfa051', 'stje028')         #管理品類
   LET p_wc = cl_replace_str(p_wc, 'stfa003', 'stje004')         #經營方式
   LET p_wc = cl_replace_str(p_wc, 'stfa010', 'stje007')         #商戶編號
   #160613-00045#5 20160616 add by beckxie---E
   
   LET r_success=TRUE
   LET r_string=''
   
   #ADDED BY LANJJ 15/10/09 
   LET l_count = 0
   LET l_sql = NULL
   LET l_sql = "SELECT COUNT(*) ",
               "  FROM stba_t,stbb_t, stje_t,stgb_t ",
               " WHERE stbaent = stjeent ",
               "   AND stba010 = stje001 ",
               "   AND stbaent = stbbent ",
               "   AND stbadocno = stbbdocno ",
               "   AND stgb004 = stbb001",
               "   AND stgbent = stjeent ",
               "   AND stgbsite = stjesite ",
               "   AND stgb002 = stje008 ",
               "   AND stgb001 >= to_date('",p_sday,"','yy/mm/dd')  ",
               "   AND stgb001 <= to_date('",p_eday,"','yy/mm/dd')  ",
               "   AND stbadocdt >= to_date('",p_sday,"','yy/mm/dd') ",
               "   AND stbadocdt = to_date('",p_eday,"','yy/mm/dd') ",
               "   AND stba006 = '18' ",
               "   AND stbastus ='Y' ",
               "   AND ",p_wc
   PREPARE del_docno1_1 FROM l_sql
   EXECUTE del_docno1_1 into l_count
   IF l_count > 0 THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.extend = "费用单已经生成且已经审核，不能重新生成"
      LET g_errparam.code = 'ast-00122'
      LET g_errparam.popup = TRUE
      CALL cl_err() 
      LET r_success = FALSE
      RETURN r_success,r_string
   END IF
   
   LET l_sql = NULL
   LET l_sql = "SELECT DISTINCT stjesite,stbadocno,stje005 ",
               "  FROM stba_t,stbb_t, stje_t,stgb_t ",
               " WHERE stbaent = stjeent ",
               "   AND stba010 = stje001 ",
               "   AND stbaent = stbbent ",
               "   AND stbadocno = stbbdocno ",
               "   AND stgb004 = stbb001",
               "   AND stgbent = stjeent ",
               "   AND stgbsite = stjesite ",
               "   AND stgb002 = stje008 ",
               "   AND stgb001 >= to_date('",p_sday,"','yy/mm/dd')  ",
               "   AND stgb001 <= to_date('",p_eday,"','yy/mm/dd')  ",
               "   AND stbadocdt >= to_date('",p_sday,"','yy/mm/dd') ",
               "   AND stbadocdt = to_date('",p_eday,"','yy/mm/dd') ",
               "   AND stba006 = '18' ",
               "   AND stbastus ='N' ",
               "   AND ",p_wc
   PREPARE del_docno_1 FROM l_sql
   DECLARE del_docno_cur_1 CURSOR FOR del_docno_1
   LET l_ac = 1
   FOREACH del_docno_cur_1 INTO g_stbadocno_d[l_ac].stjesite,
                              g_stbadocno_d[l_ac].stbadocno_del,
                              g_stbadocno_d[l_ac].stje008
      
      DELETE FROM stba_t WHERE stbaent = g_enterprise AND stbadocno = g_stbadocno_d[l_ac].stbadocno_del
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "del stba_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success,r_string
      END IF 
     
      DELETE FROM stbb_t WHERE stbbent=g_enterprise AND stbbdocno = g_stbadocno_d[l_ac].stbadocno_del                  
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "del stbb_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET r_success = FALSE
         RETURN r_success,r_string
      END IF 

      UPDATE stgb_t SET stgb011='N' 
       WHERE stgb001 BETWEEN p_sday AND p_eday
         AND stgbent = g_enterprise
         AND stgb002 = g_stbadocno_d[l_ac].stje008
         AND stgbsite = g_stbadocno_d[l_ac].stjesite
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err() 
         LET r_success = FALSE
         RETURN r_success,r_string         
      END IF       

      LET l_ac = l_ac + 1
   END FOREACH  
  #ADDED BY LANJJ 15/10/09 
  
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('ast-00330',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#18 2016/04/13 s983961--add(e)
   
   INITIALIZE l_stje008_t TO NULL
   #160801-00036#1 20160801 mark by beckxie---S
   #LET l_sql=" SELECT stje008,maxstjoseq,stjesite,stgb004,SUM(stgb009),stjo003,stjo004  ",
   #         "   FROM ( SELECT  stjeent,stje008,maxstjoseq,stjesite,stjo003,stjo004 ",        
   #160801-00036#1 20160801 mark by beckxie---E
   #160801-00036#1 20160801 add by beckxie---S
   LET l_sql=" SELECT stgb013,stje008,maxstjoseq,stjesite,stgb004,SUM(stgb009),stjo003,stjo004  ",
             "   FROM ( SELECT  stjeent,stje001,stje008,maxstjoseq,stjesite,stjo003,stjo004 ",
   #160801-00036#1 20160801 add by beckxie---E
             "            FROM ( SELECT stjeent,stje001,stje008,MAX(stjoseq) maxstjoseq,stjesite,stjo003 j002,stjo004 j003    ",
             "                     FROM stje_t,stjo_t ",
             "                    WHERE stjeent = stjoent ",
             "                      AND stjo002 = to_date('",p_eday,"','yy/mm/dd') ",
             "                      AND stje001 = stjo001 ",
             "                      AND stjo002 BETWEEN to_date('",p_sday,"','yy/mm/dd') ",
             "                                      AND to_date('",p_eday,"','yy/mm/dd') ", 
             "                      AND stjo005='N' AND ",p_wc CLIPPED,
             "                    GROUP BY stjeent,stje001,stje008,stjesite,stjo003,stjo004 ",
             "                 ),stjo_t ",
             "           WHERE stjeent = stjoent ",
             "             AND stjo002 = to_date('",p_eday,"','yy/mm/dd') ",
             "             AND stje001 = stjo001 ",
             "             AND stjo002 BETWEEN to_date('",p_sday,"','yy/mm/dd') ",
             "                             AND to_date('",p_eday,"','yy/mm/dd') ",
             "             AND stjo005 = 'N' ",
             "             AND stjoseq = maxstjoseq ",
             "        ) a , stgb_t ",
             "  WHERE stgbent = a.stjeent ",
             "    AND stgbsite = a.stjesite ",
             "    AND stgb002 = a.stje008 ",
             "    AND stgb001 BETWEEN stjo003 AND stjo004 ",    
             "    AND stjo003 >= to_date('",p_sday,"','yy/mm/dd') ",
             "    AND stjo004 <= to_date('",p_eday,"','yy/mm/dd') ",
             "    AND a.stje001 = stgb013 ",   #160801-00036#1 20160801 add by beckxie
             #"  GROUP BY stje008,maxstjoseq,stjesite,stgb004,stjo003,stjo004 ",   #160801-00036#1 20160801 mark by beckxie
             "  GROUP BY stgb013,stje008,maxstjoseq,stjesite,stgb004,stjo003,stjo004 ",   #160801-00036#1 20160801 add by beckxie
             "  ORDER BY stje008 "             
             #modify by beckxie 20160616 主sql

   PREPARE s_astp517_stfa_pre_1 FROM l_sql
   DECLARE s_astp517_stfa_cur_1 CURSOR FOR s_astp517_stfa_pre_1
   #160801-00036#1 20160801 modify by beckxie---S
   #FOREACH s_astp517_stfa_cur_1 INTO l_stje008,l_stjoseq,l_stjesite,l_stgb004,l_sumstgb009,l_stjo003,l_stjo004   
   FOREACH s_astp517_stfa_cur_1 INTO l_stje001,l_stje008,l_stjoseq,l_stjesite,l_stgb004,l_sumstgb009,l_stjo003,l_stjo004
   #160801-00036#1 20160801 modify by beckxie---E
   
      IF cl_null(l_stje008_t) OR l_stje008_t != l_stje008 THEN #ADDED BY LANJJ 15/10/09 
         #CALL cl_err_collect_init() 
         #160801-00036#1 20160801 modify by beckxie---S
         #CALL astp517_ins_stba_1(l_stje008,l_stjoseq,l_stjesite,p_sday,p_eday) RETURNING l_success,l_stbadocno
         CALL astp517_ins_stba_1(l_stje001,l_stje008,l_stjoseq,l_stjesite,p_sday,p_eday) RETURNING l_success,l_stbadocno
         #160801-00036#1 20160801 modify by beckxie---E
         IF NOT l_success THEN
            CONTINUE FOREACH                  
         END IF   
         #CALL cl_err_collect_show()            
      END IF #ADDED BY LANJJ 15/10/09
      
      #费用单单身stbb_t
      CALL astp517_ins_stbb_1(l_stbadocno,l_stjoseq,l_stje008,p_sday,p_eday,l_stgb004,l_sumstgb009,l_stjo003,l_stjo004) RETURNING l_success #ADDED BY LANJJ 15/10/09
      IF NOT l_success THEN
        DELETE FROM stba_t WHERE stbadocno=l_stbadocno
        AND stbaent=g_enterprise #160905-00007#16 add
        CONTINUE FOREACH                  
      END IF

      #结转完成后，对应的【astq502(专柜每日银行卡手续费明细查询作业) 】中，“已结转否”更新为“Y”。
      LET l_sql2="UPDATE stgb_t SET stgb011='Y' ",
              "WHERE stgb001 between to_date('",p_sday,"','yy/mm/dd') and to_date('",p_eday,"','yy/mm/dd') ",
             " AND stgbent= ",g_enterprise,
             " AND stgb002 = '",l_stje008,"'   ",
             " AND stgbsite = '",l_stjesite,"' "
      PREPARE astp517_upd_pre_1 FROM l_sql2
   
      EXECUTE astp517_upd_pre_1  
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()      
         LET r_success=FALSE
         RETURN r_success,r_string
      END IF       

     IF cl_null(r_string) THEN
         LET r_string=" stbadocno IN (","'",l_stbadocno,"'"
     ELSE
         LET r_string=r_string CLIPPED,",'",l_stbadocno,"'"  
     END IF         
     LET l_stje008_t = l_stje008
   END FOREACH     
    
   IF NOT cl_null(r_string) THEN
      LET r_string=r_string CLIPPED,")"
   END IF

   #沒有滿足條件的資料，無费用单生成！           
   IF r_success AND cl_null(r_string)  THEN    
      INITIALIZE g_errparam TO NULL
      #160613-00045#5 20160616 modify by beckxie---S
      #LET g_errparam.extend = ''   
      LET g_errparam.extend = "5.",s_desc_gzcbl004_desc('6013','5')
      #160613-00045#5 20160616 modify by beckxie---E
      LET g_errparam.code = 'ast-00122'
      LET g_errparam.popup = TRUE
      CALL cl_err() 
      LET r_success = FALSE
      RETURN r_success,r_string
   END IF    

   RETURN r_success,r_string
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........: 複製s_astp517_ins_stba() for 5.租賃使用 add by beckxie
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........: #160613-00045#5 20160616 add by beckxie
#                : #160801-00036#1 20160801 add(傳參新增stje001) by beckxie
################################################################################
PRIVATE FUNCTION astp517_ins_stba_1(p_stje001,p_stje008,p_stjoseq,p_stjesite,p_sday,p_eday)
DEFINE p_stje001       LIKE stje_t.stje001   #160801-00036#1 20160801 add by beckxie
DEFINE p_stje008       LIKE stje_t.stje008
DEFINE p_stjoseq       LIKE stjo_t.stjoseq
define p_stjesite      like stje_t.stjesite
DEFINE r_success       LIKE type_t.num5
DEFINE r_stbadocno     LIKE stba_t.stbadocno
DEFINE l_success       LIKE type_t.num5
DEFINE l_stje          RECORD                #招商租賃合約單頭檔
       stjeent         LIKE stje_t.stjeent,  #企业代码
       stjesite        LIKE stje_t.stjesite, #营运组织
       stjeunit        LIKE stje_t.stjeunit, #制定組織
       stje001         LIKE stje_t.stje001,  #合約編號
       stje002         LIKE stje_t.stje002,  #版本
       stje003         LIKE stje_t.stje003,  #合約項編號
       stje004         LIKE stje_t.stje004,  #經營方式
       stje005         LIKE stje_t.stje005,  #合約狀態
       stje006         LIKE stje_t.stje006,  #文件編號
       stje007         LIKE stje_t.stje007,  #商戶編號
       stje008         LIKE stje_t.stje008,  #鋪位編號
       stje009         LIKE stje_t.stje009,  #租賃類型
       stje010         LIKE stje_t.stje010,  #門牌號
       stje011         LIKE stje_t.stje011,  #租賃開始日期
       stje012         LIKE stje_t.stje012,  #租賃結束日期
       stje013         LIKE stje_t.stje013,  #免租天數
       stje014         LIKE stje_t.stje014,  #首零合併
       stje015         LIKE stje_t.stje015,  #尾零合併
       stje016         LIKE stje_t.stje016,  #簽訂日期
       stje017         LIKE stje_t.stje017,  #簽訂人員
       stje018         LIKE stje_t.stje018,  #簽訂部門
       stje019         LIKE stje_t.stje019,  #樓棟編號
       stje020         LIKE stje_t.stje020,  #樓層編號
       stje021         LIKE stje_t.stje021,  #區域編號
       stje022         LIKE stje_t.stje022,  #鋪位用途
       stje023         LIKE stje_t.stje023,  #建築面積
       stje024         LIKE stje_t.stje024,  #測量面積
       stje025         LIKE stje_t.stje025,  #經營面積
       stje026         LIKE stje_t.stje026,  #人數
       stje027         LIKE stje_t.stje027,  #no use
       stje028         LIKE stje_t.stje028,  #管理品類
       stje029         LIKE stje_t.stje029,  #經營主品牌
       stje030         LIKE stje_t.stje030,  #結算組織
       stje031         LIKE stje_t.stje031,  #結算方式
       stje032         LIKE stje_t.stje032,  #結算類型
       stje033         LIKE stje_t.stje033,  #收銀方式
       stje034         LIKE stje_t.stje034,  #付款條件
       stje035         LIKE stje_t.stje035,  #交易條件
       stje036         LIKE stje_t.stje036,  #幣別
       stje037         LIKE stje_t.stje037,  #匯率計算基準
       stje038         LIKE stje_t.stje038,  #稅別
       stje039         LIKE stje_t.stje039,  #發票類型
       stje040         LIKE stje_t.stje040,  #含發票否
       stje041         LIKE stje_t.stje041,  #執行日期
       stje042         LIKE stje_t.stje042,  #進場日期
       stje043         LIKE stje_t.stje043,  #延期日期
       stje044         LIKE stje_t.stje044,  #續簽日期
       stje045         LIKE stje_t.stje045,  #清退日期
       stje046         LIKE stje_t.stje046,  #作廢日期
       stje047         LIKE stje_t.stje047,  #蓋章日期
       stje048         LIKE stje_t.stje048,  #預租協議
       stje049         LIKE stje_t.stje049,  #備註
       stje050         LIKE stje_t.stje050,  #初審異動日期
       stje051         LIKE stje_t.stje051,  #初審異動人員
       stje052         LIKE stje_t.stje052,  #終審異動日期
       stje053         LIKE stje_t.stje053,  #終審異動人員
       stjestus        LIKE stje_t.stjestus  #狀態碼
END RECORD
DEFINE l_stba RECORD  #費用單資料表
       stbaent   LIKE stba_t.stbaent,   #企業編號
       stbasite  LIKE stba_t.stbasite,  #營運據點
       stbaunit  LIKE stba_t.stbaunit,  #應用組織
       stbadocno LIKE stba_t.stbadocno, #單據編號
       stbadocdt LIKE stba_t.stbadocdt, #單據日期
       stba001   LIKE stba_t.stba001,   #結算中心
       stba002   LIKE stba_t.stba002,   #供應商編號
       stba003   LIKE stba_t.stba003,   #經營方式
       stba004   LIKE stba_t.stba004,   #結算方式
       stba005   LIKE stba_t.stba005,   #結算類型
       stba006   LIKE stba_t.stba006,   #來源類型
       stba007   LIKE stba_t.stba007,   #來源單號
       stba008   LIKE stba_t.stba008,   #人員
       stba009   LIKE stba_t.stba009,   #部門
       stbastus  LIKE stba_t.stbastus,  #狀態碼
       stbaownid LIKE stba_t.stbaownid, #資料所屬者
       stbaowndp LIKE stba_t.stbaowndp, #資料所有部門
       stbacrtid LIKE stba_t.stbacrtid, #資料建立者
       stbacrtdp LIKE stba_t.stbacrtdp, #資料建立部門
       stbacrtdt LIKE stba_t.stbacrtdt, #資料創建日
       stbamodid LIKE stba_t.stbamodid, #資料修改者
       stbamoddt LIKE stba_t.stbamoddt, #最近修改日
       stbacnfid LIKE stba_t.stbacnfid, #資料確認者
       stbacnfdt LIKE stba_t.stbacnfdt, #資料確認日
       stba010   LIKE stba_t.stba010,   #合約編號
       stba011   LIKE stba_t.stba011,   #幣別
       stba012   LIKE stba_t.stba012,   #稅別
       stba013   LIKE stba_t.stba013,   #專櫃編號/鋪位編號
       stba014   LIKE stba_t.stba014,   #費用類型
       stba015   LIKE stba_t.stba015,   #交款狀態
       stba000   LIKE stba_t.stba000,   #程式編號
       stba016   LIKE stba_t.stba016,   #交款人
       stba017   LIKE stba_t.stba017,   #結算帳期
       stba018   LIKE stba_t.stba018,   #結算日期
       stba019   LIKE stba_t.stba019,   #開始日期
       stba020   LIKE stba_t.stba020,   #結束日期
       stba021   LIKE stba_t.stba021,   #成本總額
       stba022   LIKE stba_t.stba022,   #法人
       stba023   LIKE stba_t.stba023,   #會員折扣金額
       stba024   LIKE stba_t.stba024,   #no use(原:鋪位編號)
       stba025   LIKE stba_t.stba025,   #合約帳期
       stba026   LIKE stba_t.stba026    #計算日期
END RECORD
DEFINE l_stjo   RECORD                #招商租賃合約結算帳期單身檔
       stjoent  LIKE stjo_t.stjoent,  #企業編號
       stjosite LIKE stjo_t.stjosite, #營運組織
       stjounit LIKE stjo_t.stjounit, #制定組織
       stjoseq  LIKE stjo_t.stjoseq,  #結算帳期
       stjo001  LIKE stjo_t.stjo001,  #合約編號
       stjo002  LIKE stjo_t.stjo002,  #結算日期
       stjo003  LIKE stjo_t.stjo003,  #起始日期
       stjo004  LIKE stjo_t.stjo004,  #截止日期
       stjo005  LIKE stjo_t.stjo005,  #已結算
       stjo006  LIKE stjo_t.stjo006,  #結算單號
       stjo007  LIKE stjo_t.stjo007   #合約版本
END RECORD
DEFINE p_sday     LIKE  type_t.chr500
DEFINE p_eday     LIKE  type_t.chr500
DEFINE r_doctype      LIKE type_t.chr10

   LET r_success = TRUE
   LET r_stbadocno=''

   IF cl_null(p_stje008) or cl_null(p_stjoseq) or cl_null(p_stjesite) THEN
      LET r_success=FALSE
      RETURN r_success,r_stbadocno
   END IF
   
   INITIALIZE l_stje.* TO NULL
 
   
   #依合同編號取合同
   SELECT stjeent,stjesite,stjeunit,stje001,stje002,
          stje003,stje004,stje005,stje006,stje007,
          stje008,stje009,stje010,stje011,stje012,
          stje013,stje014,stje015,stje016,stje017,
          stje018,stje019,stje020,stje021,stje022,
          stje023,stje024,stje025,stje026,stje027,
          stje028,stje029,stje030,stje031,stje032,
          stje033,stje034,stje035,stje036,stje037,
          stje038,stje039,stje040,stje041,stje042,
          stje043,stje044,stje045,stje046,stje047,
          stje048,stje049,stje050,stje051,stje052,
          stje053,stjestus 
     INTO l_stje.stjeent,l_stje.stjesite,l_stje.stjeunit,l_stje.stje001,l_stje.stje002,
          l_stje.stje003,l_stje.stje004,l_stje.stje005,l_stje.stje006,l_stje.stje007,
          l_stje.stje008,l_stje.stje009,l_stje.stje010,l_stje.stje011,l_stje.stje012,
          l_stje.stje013,l_stje.stje014,l_stje.stje015,l_stje.stje016,l_stje.stje017,
          l_stje.stje018,l_stje.stje019,l_stje.stje020,l_stje.stje021,l_stje.stje022,
          l_stje.stje023,l_stje.stje024,l_stje.stje025,l_stje.stje026,l_stje.stje027,
          l_stje.stje028,l_stje.stje029,l_stje.stje030,l_stje.stje031,l_stje.stje032,
          l_stje.stje033,l_stje.stje034,l_stje.stje035,l_stje.stje036,l_stje.stje037,
          l_stje.stje038,l_stje.stje039,l_stje.stje040,l_stje.stje041,l_stje.stje042,
          l_stje.stje043,l_stje.stje044,l_stje.stje045,l_stje.stje046,l_stje.stje047,
          l_stje.stje048,l_stje.stje049,l_stje.stje050,l_stje.stje051,l_stje.stje052,
          l_stje.stje053,l_stje.stjestus
     FROM stje_t
    WHERE stjeent = g_enterprise
    #160801-00036#1 20160801 modify by beckxie---S
    #  AND stje008 = p_stje008
    #  AND stjesite= p_stjesite   
       AND stje001 = p_stje001
    #160801-00036#1 20160801 modify by beckxie---E 
   #结算账单资料
   SELECT stjoent,stjosite,stjounit,stjoseq,stjo001,stjo002,stjo003,stjo004,stjo005,stjo006,stjo007
     INTO l_stjo.stjoent,l_stjo.stjosite,l_stjo.stjounit,l_stjo.stjoseq,l_stjo.stjo001,
          l_stjo.stjo002,l_stjo.stjo003,l_stjo.stjo004,l_stjo.stjo005,l_stjo.stjo006,
          l_stjo.stjo007 
     FROM stjo_t
    WHERE stjoent = g_enterprise
      AND stjo001 = l_stje.stje001
      AND stjoseq = p_stjoseq
      
   INITIALIZE l_stba.* TO NULL
     #抓取默認單別arti200的設定
  
   CALL s_arti200_get_def_doc_type(l_stje.stjesite,'astt810','2') RETURNING l_success,r_doctype
   IF NOT l_success THEN
      LET r_success=FALSE
      RETURN r_success,r_stbadocno  
   END IF

   #自動編號-----单据编号l_stba.stbadocno
   #CALL s_aooi200_gen_docno(l_stje.stjesite,r_doctype,g_today,'astt810') RETURNING l_success,l_stba.stbadocno   #160803-00040#1 20160804 mark by beckxie
   CALL s_aooi200_gen_docno(l_stje.stjesite,r_doctype,p_eday,'astt810') RETURNING l_success,l_stba.stbadocno   #160803-00040#1 20160804 add by beckxie
   IF NOT l_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = 'apm-00003'
      LET g_errparam.extend = r_doctype
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success=FALSE
      RETURN r_success,r_stbadocno         
    END IF  
       
   #制定组织：按照专柜合同的营运据点进行赋值。
   #合同编号、供应商编号、经营方式、结算方式、结算类型、币别、按照专柜合同赋值。
   #税别：赋值为销项税。
   #来源类型：2-合约
   #人员：签约人员，并带出对应部门。
   #结算中心：签订法人。
   #异动资讯：按照标准赋值。
    #zhanghr
   LET l_stba.stbasite = p_stjesite    
   #单据日期
   #LET l_stba.stbadocdt = g_today             #单据日期    
   LET l_stba.stbadocdt = p_eday             #单据日期    #modified by LanJJ 15/10/09
   LET l_stba.stbaunit = p_stjesite      #指定组织=运营据点
   LET l_stba.stba010  = l_stje.stje001  #合同编号
   
   LET l_stba.stba000  = 'astt810'
   
   LET l_stba.stba002  = l_stje.stje007  #供应商编号   #mark by yangxf 
   #CALL s_astt401_stey003_get(l_stje.stje008,l_stba.stbadocdt) RETURNING l_stba.stba002    #add by yangxf #供應商編號 
   #zhanghr
   LET l_stba.stba013  = l_stje.stje008   #专柜编号
   #单据编号
   #单据日期
   LET l_stba.stba003  = l_stje.stje004  #经营方式
   LET l_stba.stba004  = l_stje.stje031  #结算方式
   #结算类型zhanghr
   LET l_stba.stba005  = l_stje.stje032  #结算类型
   #状态码
   LET l_stba.stbastus  = 'N'                 #状态码     
   #LET l_stba.stba006  = '2'             #À´Ô´ÀàÐÍ #MARKED BY LANJJ 2015-10-12
   LET l_stba.stba006  = '18'             #À´Ô´ÀàÐÍ #ADDED BY LANJJ2015-10-12
   #LET l_stba.stba001  = l_stfa.stfa014  #结算中心 #MARKED BY LANJJ 151022
   LET l_stba.stba001  = l_stje.stje030   #結算中心
   #费用总额zhanghr
   LET l_stba.stba011  = l_stje.stje036  #币别
   LET l_stba.stba012  = l_stje.stje038  #税別
   LET l_stba.stba008  = l_stje.stje017  #人员
   LET l_stba.stba009  = l_stje.stje018  #部门
  
  #zhanghr
   #费用类型
   LET l_stba.stba014 = '9' 
   #stba025,stba026
   LET l_stba.stba025 = l_stjo.stjoseq
   LET l_stba.stba026 = l_stjo.stjo002
   #异动资讯
   LET l_stba.stbaownid = g_user                    #资料所有者
   LET l_stba.stbaowndp = g_dept                    #资料所有部门
   LET l_stba.stbacrtid = g_user                    #资料创建者
   LET l_stba.stbacrtdp = g_dept                    #资料创建部门
   LET l_stba.stbacrtdt = cl_get_current()          #资料创建日
   LET l_stba.stbamodid = ''                        #资料修改者
   LET l_stba.stbamoddt = ''                        #最近修改日
   LET l_stba.stbacnfid = ''                        #资料确认者
   LET l_stba.stbacnfdt = ''                        #数据确认日
   LET l_stba.stbaent = l_stje.stjeent
   
   
   INSERT INTO stba_t 
   (stbaent,stbasite,stbaunit,stbadocno,stbadocdt,
    stba001,stba002,stba003,stba004,stba005,
    stba006,stba007,stba008,stba009,stbastus,
    stbaownid,stbaowndp,stbacrtid,stbacrtdp,stbacrtdt,
    stbamodid,stbamoddt,stbacnfid,stbacnfdt,stba010,
    stba011,stba012,stba013,stba014,stba015,stba000,
    stba016,stba017,stba018,stba019,stba020,stba021,
    stba022,stba023,stba024,stba025,stba026 ) 
   VALUES 
   (l_stba.stbaent,l_stba.stbasite,l_stba.stbaunit,l_stba.stbadocno,l_stba.stbadocdt,
    l_stba.stba001,l_stba.stba002,l_stba.stba003,l_stba.stba004,l_stba.stba005,
    l_stba.stba006,l_stba.stba007,l_stba.stba008,l_stba.stba009,l_stba.stbastus,
    l_stba.stbaownid,l_stba.stbaowndp,l_stba.stbacrtid,l_stba.stbacrtdp,l_stba.stbacrtdt,
    l_stba.stbamodid,l_stba.stbamoddt,l_stba.stbacnfid,l_stba.stbacnfdt,l_stba.stba010,
    l_stba.stba011,l_stba.stba012,l_stba.stba013,l_stba.stba014,l_stba.stba015,l_stba.stba000,
    l_stba.stba016,l_stba.stba017,l_stba.stba018,l_stba.stba019,l_stba.stba020,l_stba.stba021,
    l_stba.stba022,l_stba.stba023,l_stba.stba024,l_stba.stba025,l_stba.stba026 )    
    
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "ins stba_t",l_stba.stba013
      LET g_errparam.popup = TRUE
      CALL cl_err()

      LET r_success=FALSE
      RETURN r_success,r_stbadocno 
    
   END IF  
   
   LET r_stbadocno=l_stba.stbadocno
   RETURN r_success,r_stbadocno


END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........: 複製astp517_ins_stbb() for 5.租賃使用 add by beckxie
# Usage..........: CALL s_aooi150_ins (传入参数)
#                  RETURNING 回传参数
# Input parameter: 传入参数变量1   传入参数变量说明1
#                : 传入参数变量2   传入参数变量说明2
# Return code....: 回传参数变量1   回传参数变量说明1
#                : 回传参数变量2   回传参数变量说明2
# Date & Author..: 日期 By 作者
# Modify.........: #160613-00045#5 20160616 add by beckxie
################################################################################
PRIVATE FUNCTION astp517_ins_stbb_1(p_stbadocno,p_stjoseq,p_stje008,p_sday,p_eday,p_stgb004,p_sumstgb009,p_stjo003,p_stjo004)
###### FUNTION ADDED BY LANJJ 15/10/09 ###########
-------FUNTION 替换掉 s_astp517_ins_stbb()---------
DEFINE l_success     LIKE type_t.num5
DEFINE p_stbadocno   LIKE stba_t.stbadocno
DEFINE p_stje008     like stje_t.stje008
DEFINE r_success     LIKE type_t.num5
DEFINE p_sday        LIKE  type_t.chr500
DEFINE p_eday        LIKE  type_t.chr500
DEFINE p_stjoseq     LIKE stjo_t.stjoseq
DEFINE p_stgb004     like stgb_t.stgb004   #ADDED BY LANJJ 15/10/09 费用编号
DEFINE p_sumstgb009  LIKE stgb_t.stgb009   #ADDED BY LANJJ 15/10/09 费用合计
DEFINE p_stjo003     LIKE stjo_t.stjo003   #ADDED BY LANJJ 15/10/09 结算开始周期
DEFINE p_stjo004     LIKE stjo_t.stjo004   #ADDED BY LANJJ 15/10/09 结算结束日期
DEFINE l_sum1     LIKE stgb_t.stgb009
DEFINE l_sum2     LIKE stgb_t.stgb009
DEFINE l_sum3     LIKE stgb_t.stgb009
DEFINE l_sql      STRING
DEFINE l_sql2     STRING
DEFINE l_stje          RECORD                #招商租賃合約單頭檔
       stjeent         LIKE stje_t.stjeent,  #企业代码
       stjesite        LIKE stje_t.stjesite, #营运组织
       stjeunit        LIKE stje_t.stjeunit, #制定組織
       stje001         LIKE stje_t.stje001,  #合約編號
       stje002         LIKE stje_t.stje002,  #版本
       stje003         LIKE stje_t.stje003,  #合約項編號
       stje004         LIKE stje_t.stje004,  #經營方式
       stje005         LIKE stje_t.stje005,  #合約狀態
       stje006         LIKE stje_t.stje006,  #文件編號
       stje007         LIKE stje_t.stje007,  #商戶編號
       stje008         LIKE stje_t.stje008,  #鋪位編號
       stje009         LIKE stje_t.stje009,  #租賃類型
       stje010         LIKE stje_t.stje010,  #門牌號
       stje011         LIKE stje_t.stje011,  #租賃開始日期
       stje012         LIKE stje_t.stje012,  #租賃結束日期
       stje013         LIKE stje_t.stje013,  #免租天數
       stje014         LIKE stje_t.stje014,  #首零合併
       stje015         LIKE stje_t.stje015,  #尾零合併
       stje016         LIKE stje_t.stje016,  #簽訂日期
       stje017         LIKE stje_t.stje017,  #簽訂人員
       stje018         LIKE stje_t.stje018,  #簽訂部門
       stje019         LIKE stje_t.stje019,  #樓棟編號
       stje020         LIKE stje_t.stje020,  #樓層編號
       stje021         LIKE stje_t.stje021,  #區域編號
       stje022         LIKE stje_t.stje022,  #鋪位用途
       stje023         LIKE stje_t.stje023,  #建築面積
       stje024         LIKE stje_t.stje024,  #測量面積
       stje025         LIKE stje_t.stje025,  #經營面積
       stje026         LIKE stje_t.stje026,  #人數
       stje027         LIKE stje_t.stje027,  #no use
       stje028         LIKE stje_t.stje028,  #管理品類
       stje029         LIKE stje_t.stje029,  #經營主品牌
       stje030         LIKE stje_t.stje030,  #結算組織
       stje031         LIKE stje_t.stje031,  #結算方式
       stje032         LIKE stje_t.stje032,  #結算類型
       stje033         LIKE stje_t.stje033,  #收銀方式
       stje034         LIKE stje_t.stje034,  #付款條件
       stje035         LIKE stje_t.stje035,  #交易條件
       stje036         LIKE stje_t.stje036,  #幣別
       stje037         LIKE stje_t.stje037,  #匯率計算基準
       stje038         LIKE stje_t.stje038,  #稅別
       stje039         LIKE stje_t.stje039,  #發票類型
       stje040         LIKE stje_t.stje040,  #含發票否
       stje041         LIKE stje_t.stje041,  #執行日期
       stje042         LIKE stje_t.stje042,  #進場日期
       stje043         LIKE stje_t.stje043,  #延期日期
       stje044         LIKE stje_t.stje044,  #續簽日期
       stje045         LIKE stje_t.stje045,  #清退日期
       stje046         LIKE stje_t.stje046,  #作廢日期
       stje047         LIKE stje_t.stje047,  #蓋章日期
       stje048         LIKE stje_t.stje048,  #預租協議
       stje049         LIKE stje_t.stje049,  #備註
       stje050         LIKE stje_t.stje050,  #初審異動日期
       stje051         LIKE stje_t.stje051,  #初審異動人員
       stje052         LIKE stje_t.stje052,  #終審異動日期
       stje053         LIKE stje_t.stje053,  #終審異動人員
       stjestus        LIKE stje_t.stjestus  #狀態碼
END RECORD
DEFINE l_stjo   RECORD                #招商租賃合約結算帳期單身檔
       stjoent  LIKE stjo_t.stjoent,  #企業編號
       stjosite LIKE stjo_t.stjosite, #營運組織
       stjounit LIKE stjo_t.stjounit, #制定組織
       stjoseq  LIKE stjo_t.stjoseq,  #結算帳期
       stjo001  LIKE stjo_t.stjo001,  #合約編號
       stjo002  LIKE stjo_t.stjo002,  #結算日期
       stjo003  LIKE stjo_t.stjo003,  #起始日期
       stjo004  LIKE stjo_t.stjo004,  #截止日期
       stjo005  LIKE stjo_t.stjo005,  #已結算
       stjo006  LIKE stjo_t.stjo006,  #結算單號
       stjo007  LIKE stjo_t.stjo007   #合約版本
END RECORD
DEFINE l_stbb RECORD  #費用單明細資料表
       stbbent   LIKE stbb_t.stbbent,   #企業編號
       stbbunit  LIKE stbb_t.stbbunit,  #應用組織
       stbbsite  LIKE stbb_t.stbbsite,  #營運據點
       stbbdocno LIKE stbb_t.stbbdocno, #單據編號
       stbbseq   LIKE stbb_t.stbbseq,   #項次
       stbb001   LIKE stbb_t.stbb001,   #費用編號
       stbb002   LIKE stbb_t.stbb002,   #幣別
       stbb003   LIKE stbb_t.stbb003,   #稅別
       stbb004   LIKE stbb_t.stbb004,   #價款類別
       stbb005   LIKE stbb_t.stbb005,   #起始日期
       stbb006   LIKE stbb_t.stbb006,   #截止日期
       stbb007   LIKE stbb_t.stbb007,   #結算會計期
       stbb008   LIKE stbb_t.stbb008,   #財務會計期
       stbb009   LIKE stbb_t.stbb009,   #費用金額
       stbb010   LIKE stbb_t.stbb010,   #承擔對象
       stbb011   LIKE stbb_t.stbb011,   #所屬品類
       stbb012   LIKE stbb_t.stbb012,   #所屬部門
       stbb013   LIKE stbb_t.stbb013,   #結算對象
       stbb014   LIKE stbb_t.stbb014,   #財務會計期別
       stbb015   LIKE stbb_t.stbb015,   #納入結算單否
       stbb016   LIKE stbb_t.stbb016,   #票扣否
       stbb017   LIKE stbb_t.stbb017,   #備註
       stbb018   LIKE stbb_t.stbb018,   #結算帳期
       stbb019   LIKE stbb_t.stbb019,   #結算日期
       stbb020   LIKE stbb_t.stbb020,   #日結成本類型
       stbb021   LIKE stbb_t.stbb021,   #調整日期
       stbb022   LIKE stbb_t.stbb022,   #商品編號
       stbb023   LIKE stbb_t.stbb023,   #庫區編號
       stbb024   LIKE stbb_t.stbb024,   #专柜编号
       stbb025   LIKE stbb_t.stbb025,   #應收金額
       stbb026   LIKE stbb_t.stbb026,   #實收金額
       stbb027   LIKE stbb_t.stbb027,   #費率
       stbb028   LIKE stbb_t.stbb028,   #成本金額
       stbb029   LIKE stbb_t.stbb029,   #促銷銷售額
       stbb030   LIKE stbb_t.stbb030,   #費用歸屬類型
       stbb031   LIKE stbb_t.stbb031,   #費用歸屬組織
       stbb032   LIKE stbb_t.stbb032,   #銷售數量
       stbb033   LIKE stbb_t.stbb033    #銷售單位
END RECORD
define l_stae003  like stae_t.stae003
DEFINE l_stgb009  LIKE stgb_t.stgb009
DEFINE l_stba RECORD  #費用單資料表
       stbaent   LIKE stba_t.stbaent,   #企業編號
       stbasite  LIKE stba_t.stbasite,  #營運據點
       stbaunit  LIKE stba_t.stbaunit,  #應用組織
       stbadocno LIKE stba_t.stbadocno, #單據編號
       stbadocdt LIKE stba_t.stbadocdt, #單據日期
       stba001   LIKE stba_t.stba001,   #結算中心
       stba002   LIKE stba_t.stba002,   #供應商編號
       stba003   LIKE stba_t.stba003,   #經營方式
       stba004   LIKE stba_t.stba004,   #結算方式
       stba005   LIKE stba_t.stba005,   #結算類型
       stba006   LIKE stba_t.stba006,   #來源類型
       stba007   LIKE stba_t.stba007,   #來源單號
       stba008   LIKE stba_t.stba008,   #人員
       stba009   LIKE stba_t.stba009,   #部門
       stbastus  LIKE stba_t.stbastus,  #狀態碼
       stba010   LIKE stba_t.stba010,   #合約編號
       stba011   LIKE stba_t.stba011,   #幣別
       stba012   LIKE stba_t.stba012,   #稅別
       stba013   LIKE stba_t.stba013,   #專櫃編號/鋪位編號
       stba014   LIKE stba_t.stba014,   #費用類型
       stba015   LIKE stba_t.stba015,   #交款狀態
       stba000   LIKE stba_t.stba000,   #程式編號
       stba016   LIKE stba_t.stba016,   #交款人
       stba017   LIKE stba_t.stba017,   #結算帳期
       stba018   LIKE stba_t.stba018,   #結算日期
       stba019   LIKE stba_t.stba019,   #開始日期
       stba020   LIKE stba_t.stba020,   #結束日期
       stba021   LIKE stba_t.stba021,   #成本總額
       stba022   LIKE stba_t.stba022,   #法人
       stba023   LIKE stba_t.stba023,   #會員折扣金額
       stba024   LIKE stba_t.stba024,   #no use(原:鋪位編號)
       stba025   LIKE stba_t.stba025,   #合約帳期
       stba026   LIKE stba_t.stba026    #計算日期
END RECORD
DEFINE l_stgb004  LIKE stgb_t.stgb004   #费用代码
DEFINE l_cnt     LIKE type_t.num10
DEFINE l_stba013  like stba_t.stba013
DEFINE l_count    integer  
DEFINE l_stbb012 like stbb_t.stbb012
DEFINE l_stbb013 like stbb_t.stbb013
DEFINE l_stbb011 like stbb_t.stbb011
DEFINE l_stbb014 like stbb_t.stbb014
DEFINE l_stbb008 like stbb_t.stbb008
DEFINE l_stgb     RECORD
     stgb004 LIKE stgb_t.stgb004,
     stgb009 LIKE stgb_t.stgb009,
     stgb001 LIKE stgb_t.stgb001,
     stgb011 LIKE stgb_t.stgb011
   END RECORD
DEFINE l_stjo003 LIKE stjo_t.stjo003
DEFINE l_stjo004 LIKE stjo_t.stjo004
   
DEFINE l_ac like type_t.num10
DEFINE  l_stfa050             LIKE stfa_t.stfa050    #add by geza 20150908 
   LET r_success=TRUE
   
   #传进单据编号
   IF cl_null(p_stbadocno) THEN
      LET r_success=FALSE
      RETURN r_success   
   END IF    
# {  LET l_sql = "SELECT distinct stgb004,stgb009,stgb001,stgb011 from stgb_t",
#                 " WHERE stgbsite='",g_site,"' and stgb002 = '",p_stfa005,"'"
#                                
#   PREPARE astp517_pb FROM l_sql
#   DECLARE b_fill_curs CURSOR FOR astp517_pb  
#   FOREACH b_fill_curs INTO l_stgb.stgb004,l_stgb.stgb009,l_stgb.stgb001,l_stgb.stgb011
#      IF SQLCA.sqlcode THEN
#         INITIALIZE g_errparam TO NULL 
#         LET g_errparam.extend = "FOREACH:" 
#         LET g_errparam.code   = SQLCA.sqlcode 
#         LET g_errparam.popup  = TRUE 
#         CALL cl_err()
#         EXIT FOREACH
#      END IF
#      
#      IF l_stgb.stgb011='Y' THEN
#         CONTINUE FOREACH
#      END IF
#  }                                        #MARKED BY LANJJ 15/10/09
     LET l_stgb.stgb004 = p_stgb004           #ADDED BY LANJJ 15/10/09
     LET l_stgb.stgb009 = p_sumstgb009        #ADDED BY LANJJ 15/10/09
     #获取单头资料
     SELECT stbaent,stbasite,stbaunit,stbadocno,stbadocdt,
            stba001,stba002,stba003,stba004,stba005,
            stba006,stba007,stba008,stba009,stbastus,
            stba010,stba011,stba012,stba013,stba014,
            stba015,stba000,stba016,stba017,stba018,
            stba019,stba020,stba021,stba022,stba023,
            stba024,stba025,stba026 
       INTO l_stba.stbaent,l_stba.stbasite,l_stba.stbaunit,l_stba.stbadocno,l_stba.stbadocdt,
            l_stba.stba001,l_stba.stba002,l_stba.stba003,l_stba.stba004,l_stba.stba005,
            l_stba.stba006,l_stba.stba007,l_stba.stba008,l_stba.stba009,l_stba.stbastus,
            l_stba.stba010,l_stba.stba011,l_stba.stba012,l_stba.stba013,l_stba.stba014,
            l_stba.stba015,l_stba.stba000,l_stba.stba016,l_stba.stba017,l_stba.stba018,
            l_stba.stba019,l_stba.stba020,l_stba.stba021,l_stba.stba022,l_stba.stba023,
            l_stba.stba024,l_stba.stba025,l_stba.stba026 
       FROM stba_t      
      WHERE stbadocno = p_stbadocno 
        AND stbaent = g_enterprise      
  　#依費用單單頭合約編號取合約資訊
    SELECT stjeent,stjesite,stjeunit,stje001,stje002,
           stje003,stje004,stje005,stje006,stje007,
           stje008,stje009,stje010,stje011,stje012,
           stje013,stje014,stje015,stje016,stje017,
           stje018,stje019,stje020,stje021,stje022,
           stje023,stje024,stje025,stje026,stje027,
           stje028,stje029,stje030,stje031,stje032,
           stje033,stje034,stje035,stje036,stje037,
           stje038,stje039,stje040,stje041,stje042,
           stje043,stje044,stje045,stje046,stje047,
           stje048,stje049,stje050,stje051,stje052,
           stje053,stjestus 
      INTO l_stje.stjeent,l_stje.stjesite,l_stje.stjeunit,l_stje.stje001,l_stje.stje002,
           l_stje.stje003,l_stje.stje004,l_stje.stje005,l_stje.stje006,l_stje.stje007,
           l_stje.stje008,l_stje.stje009,l_stje.stje010,l_stje.stje011,l_stje.stje012,
           l_stje.stje013,l_stje.stje014,l_stje.stje015,l_stje.stje016,l_stje.stje017,
           l_stje.stje018,l_stje.stje019,l_stje.stje020,l_stje.stje021,l_stje.stje022,
           l_stje.stje023,l_stje.stje024,l_stje.stje025,l_stje.stje026,l_stje.stje027,
           l_stje.stje028,l_stje.stje029,l_stje.stje030,l_stje.stje031,l_stje.stje032,
           l_stje.stje033,l_stje.stje034,l_stje.stje035,l_stje.stje036,l_stje.stje037,
           l_stje.stje038,l_stje.stje039,l_stje.stje040,l_stje.stje041,l_stje.stje042,
           l_stje.stje043,l_stje.stje044,l_stje.stje045,l_stje.stje046,l_stje.stje047,
           l_stje.stje048,l_stje.stje049,l_stje.stje050,l_stje.stje051,l_stje.stje052,
           l_stje.stje053,l_stje.stjestus
      FROM stje_t
     WHERE stjeent = g_enterprise
       AND stje001 = l_stba.stba010
    
    #mark by geza 20150831(S)        
    #获取专柜合同所属部门和主品类、合同编号
#     SELECT stfa044,stfa011,stfa001
#       INTO l_stbb012,l_stbb011,l_stfa001
#       FROM stfa_t
#      WHERE stfaent = g_enterprise
#        AND stfa005 = p_stfa005
#        AND stfasite = l_stba.stbasite
    #mark by geza 20150831(E)
    #add by geza 20150831(S) 
    #获取专柜合同所属部门和管理品类、合同编号
    # SELECT stfa044,stfa051,stfa001
    #   INTO l_stbb012,l_stbb011,l_stfa001
    #   FROM stfa_t
    #  WHERE stfaent = g_enterprise
    #    AND stfa005 = p_stfa005
    #    AND stfasite = l_stba.stbasite
    # #add by geza 20150831(S)   
#    #######################
#    #判断销售日期是否在所选账期日期内
#    SELECT stfj002,stfj003
#      INTO l_stfj002,l_stfj003   
#      FROM stfj_t
#     WHERE stfjseq = p_stfjseq
#       AND stfj001 = l_stfa001          #合同编号
#       AND stfjent =g_enterprise
#    
#     IF l_stgb.stgb001 > l_stfj003 OR l_stgb.stgb001 < l_stfj002 THEN
#         CONTINUE FOREACH
#     END IF
#    
#    
#    ###########################################      #MARKED BY LANJJ 15/10/09
    
    
   #结算账单资料
   SELECT stjoent,stjosite,stjounit,stjoseq,stjo001,stjo002,stjo003,stjo004,stjo005,stjo006,stjo007
     INTO l_stjo.stjoent,l_stjo.stjosite,l_stjo.stjounit,l_stjo.stjoseq,l_stjo.stjo001,
          l_stjo.stjo002,l_stjo.stjo003,l_stjo.stjo004,l_stjo.stjo005,l_stjo.stjo006,
          l_stjo.stjo007 
     FROM stjo_t
    WHERE stjoent = g_enterprise
      AND stjo001 = l_stje.stje001
      AND stjoseq = p_stjoseq
    

    #结算会计期：stbb007 
    SELECT to_char(to_date(l_stjo.stjo004,'yyyy/mm/dd'), 'yyyymm') INTO l_stbb.stbb007 from dual
        
    #结算日期所属的会计年度和会计期别
   SELECT  distinct glav002,glav006 
     INTO l_stbb.stbb008,l_stbb.stbb014
     FROM glav_t
     WHERE glav004 = l_stjo.stjo002
      AND glavent = l_stjo.stjoent
 #
    LET l_stbb.stbb009 =l_stgb.stgb009
    LET l_stbb.stbb001 =l_stgb.stgb004
  #费用总类3、费用性质4、扣票否7、纳入计算11/价款类别6、
#    
      #     #mark by geza 20150904(S)
#      SELECT stae003,stae007,stae011 ,stae006
#       INTO l_stae003,l_stbb.stbb016,l_stbb.stbb015,l_stbb.stbb004
#       FROM stae_t
#      WHERE staeent = g_enterprise
#        AND stae001 = l_stgb.stgb004
       #mark by geza 20150904(E)  
      #add by geza 20150904(S)
      SELECT stae003,stae006
       INTO l_stae003,l_stbb.stbb004
       FROM stae_t
      WHERE staeent = g_enterprise
        AND stae001 = l_stgb.stgb004
        
      ###################################################
      #SELECT stfk020,stfk021 INTO l_stbb.stbb015,l_stbb.stbb016
      #  FROM stfk_t
      # WHERE stfkent = g_enterprise
      #   AND stfk001 = l_stba.stba010 
      #   AND rownum=1    #add by geza 20150910         
      #
      #
      #IF l_stbb.stbb015 IS NULL AND l_stbb.stbb016 IS NULL THEN
      #   #mark by geza 20150908(S)  
      #   #CALL s_get_stfa050_stbb015(l_stba.stba010)  RETURNING  l_stbb.stbb015,l_stbb.stbb016   
      #   #mark by geza 20150908(E)
      #   #add by geza 20150908(S)
      #   #抓取纳入结算单否    
      #   CALL s_astt401_get_stae007(l_stfa050,l_stbb.stbb001)  RETURNING  l_stbb.stbb015,l_stbb.stbb016   
      #   #add by geza 20150908(E)          
      #END IF       
      ###################################################
      
      #add by geza 20150904(E)
      LET l_stbb.stbbent=g_enterprise
      LET l_stbb.stbbsite=l_stba.stbasite
      LET l_stbb.stbbdocno = p_stbadocno
      LET l_stbb.stbb002 = l_stba.stba011                          #币别
      #160613-00045#5 20160617 add by beckxie---S
      CALL s_expense_get_stae_info(l_stbb.stbb001) RETURNING l_stbb.stbb016,l_stbb.stbb015,l_stbb.stbb030,l_stbb.stbb031
      IF l_stbb.stbb030 = '1' AND cl_null(l_stbb.stbb031) THEN
         LET l_stbb.stbb031 = l_stbb.stbbsite
      END IF
      #160613-00045#5 20160617 add by beckxie---E
      #LET l_stbb.stbb003 = l_stba.stba012                          #税别  MARKED BY LANJJ 2015-10-13
      #ADDED BY LANJJ 2015-10-13 START 
      IF l_stbb.stbb016 = 'Y' THEN 
         SELECT stje038
           INTO l_stbb.stbb003  #税别编号
           FROM stje_t
          WHERE stjeent = g_enterprise
            AND stjesite = g_site
            AND stje001 = l_stje.stje001
         --   AND stfastus = 'Y'  
         END IF 
      IF l_stbb.stbb016 = 'N' THEN 
         SELECT stae010 
           INTO l_stbb.stbb003  #税别编号
           FROM stae_t
          WHERE staeent = g_enterprise
            AND stae001 = l_stbb.stbb001
         --  AND staestus = 'Y'
      END IF 
      #ADDED BY LANJJ 2015-10-13 END 
      #LET l_stbb.stbb005 = p_sday                                 #起始日期
      #LET l_stbb.stbb006 = p_eday                                 #截止日期
      LET l_stbb.stbb005 = p_stjo003                               #起始日期 #ADDED BY LANJJ 2015-10-13
      LET l_stbb.stbb006 = p_stjo004                               #截止日期 #ADDED BY LANJJ 2015-10-13
     # LET l_stbb.stbb008 = l_stbb008         #结算会计年度
     # LET l_stbb.stbb014 = l_stbb014         #结算会计期别
      LET l_stbb.stbb010 = '1'                            #承担对象zhr5015818
      LET l_stbb.stbb013 = '1'                            #结算对象zhr5015818
      LET l_stbb.stbbsite =l_stba.stbasite                           #运营组织
      LET l_stbb.stbbunit = l_stba.stbaunit
      LET l_stbb.stbb012  = l_stje.stje018                               #所属部门
      
      LET l_stbb.stbb011  = l_stje.stje028
      LET l_stbb.stbbent = l_stba.stbaent   
      
      SELECT MAX(stbbseq)+1 INTO l_stbb.stbbseq
        FROM stbb_t
       WHERE stbbent=g_enterprise
         AND stbbdocno=p_stbadocno
         
      IF cl_null(l_stbb.stbbseq) THEN
         LET l_stbb.stbbseq=1
      END IF
      #add by geza 20150831(S)
      #根据开始日期结束日期抓取结算账期和结算日期
      CALL s_settle_date_get_stbb019(l_stba.stba010,l_stbb.stbb005,l_stbb.stbb006,'2') 
         RETURNING  l_stbb.stbb018,l_stbb.stbb019  
      #add by geza 20150831(E)
    CALL s_curr_round(l_stba.stbasite,l_stbb.stbb002,l_stbb.stbb009,'2') RETURNING l_stbb.stbb009  #add by yangxf
    INSERT INTO stbb_t 
           (stbbent,stbbunit,stbbsite,stbbdocno,stbbseq,
            stbb001,stbb002,stbb003,stbb004,stbb005,
            stbb006,stbb007,stbb008,stbb009,stbb010,
            stbb011,stbb012,stbb013,stbb014,stbb015,
            stbb016,stbb017,stbb018,stbb019,stbb020,
            stbb021,stbb022,stbb023,stbb024,stbb025,
            stbb026,stbb027,stbb028,stbb029,stbb030,
            stbb031,stbb032,stbb033)
    VALUES (l_stbb.stbbent,l_stbb.stbbunit,l_stbb.stbbsite,l_stbb.stbbdocno,l_stbb.stbbseq,
            l_stbb.stbb001,l_stbb.stbb002,l_stbb.stbb003,l_stbb.stbb004,l_stbb.stbb005,
            l_stbb.stbb006,l_stbb.stbb007,l_stbb.stbb008,l_stbb.stbb009,l_stbb.stbb010,
            l_stbb.stbb011,l_stbb.stbb012,l_stbb.stbb013,l_stbb.stbb014,l_stbb.stbb015,
            l_stbb.stbb016,l_stbb.stbb017,l_stbb.stbb018,l_stbb.stbb019,l_stbb.stbb020,
            l_stbb.stbb021,l_stbb.stbb022,l_stbb.stbb023,l_stbb.stbb024,l_stbb.stbb025,
            l_stbb.stbb026,l_stbb.stbb027,l_stbb.stbb028,l_stbb.stbb029,l_stbb.stbb030,
            l_stbb.stbb031,l_stbb.stbb032,l_stbb.stbb033)   
       IF SQLCA.sqlcode THEN
          INITIALIZE g_errparam TO NULL
          LET g_errparam.code = SQLCA.sqlcode
          LET g_errparam.extend = "into stbb_t"
          LET g_errparam.popup = TRUE
          CALL cl_err()
          LET r_success=FALSE
          RETURN r_success    
       END IF

 #  END FOREACH         #MARKED BY LANJJ 15/10/09   
   
#  #select count(*)  into l_count from stbb_t where stbbdocno=p_stbadocno
#   if l_count>0 then 
#      RETURN r_success
#   else 
#      LET r_success=FALSE 
      RETURN r_success  
#   end if              #MARKED BY LANJJ 15/10/09  
END FUNCTION

#end add-point
 
{</section>}
 
