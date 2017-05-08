#該程式未解開Section, 採用最新樣板產出!
{<section id="astp515.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0006(2016-01-25 18:37:16), PR版次:0006(2016-11-15 14:26:23)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000092
#+ Filename...: astp515
#+ Description: 專櫃合約費用單批次產生作業
#+ Creator....: 02003(2015-07-31 17:16:06)
#+ Modifier...: 02003 -SD/PR- 02481
 
{</section>}
 
{<section id="astp515.global" >}
#應用 p01 樣板自動產生(Version:19)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#+ Modifier...: NO.160408-00010#1 2016/04/08 by 02003 重复产生费用单调整
#+ Modifier...: NO.161111-00028#3 2016/11/15 by 02481 标准程式定义采用宣告模式,弃用.*写法
#end add-point
#add-point:填寫註解說明(客製用) name="global.memo_customerization"

#end add-point
 
IMPORT os
IMPORT util
IMPORT FGL lib_cl_schedule
#add-point:增加匯入項目 name="global.import"

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
   #add-point:自定背景執行須傳遞的參數(Module Variable) name="global.parameter"
   stfb021              LIKE stfb_t.stfb021,
   sel                  LIKE type_t.chr1,
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       stfasite LIKE type_t.chr10, 
   mhae001 LIKE type_t.chr20, 
   pmaa001 LIKE type_t.chr10, 
   stfa001 LIKE type_t.chr20, 
   stfb006 LIKE type_t.chr10, 
   bdate LIKE type_t.dat, 
   sel LIKE type_t.chr500, 
   stagenow LIKE type_t.chr80,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
 
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE g_cnt        LIKE type_t.num10
DEFINE g_deteal_cnt LIKE type_t.num10
#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="astp515.main" >}
MAIN
   #add-point:main段define (客製用) name="main.define_customerization"
   
   #end add-point 
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
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
 
   #背景(Y) 或半背景(T) 時不做主畫面開窗
   IF g_bgjob = "Y" OR g_bgjob = "T" THEN
      #排程參數由01開始，若不是1開始，表示有保留參數
      LET ls_js = g_argv[01]
     #CALL util.JSON.parse(ls_js,g_master)   #p類主要使用l_param,此處不解析
      #add-point:Service Call name="main.servicecall"
      
      #end add-point
      CALL astp515_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp515 WITH FORM cl_ap_formpath("ast",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL astp515_init()
 
      #進入選單 Menu (="N")
      CALL astp515_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp515
   END IF
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp515.init" >}
#+ 初始化作業
PRIVATE FUNCTION astp515_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   DEFINE l_success  LIKE type_t.num5 
   #end add-point
 
   LET g_error_show = 1
   LET gwin_curr2 = ui.Window.getCurrent()
   LET gfrm_curr2 = gwin_curr2.getForm()
   CALL cl_schedule_import_4fd()
   CALL cl_set_combo_scc("gzpa003","75")
   IF cl_get_para(g_enterprise,"","E-SYS-0005") = "N" THEN
       CALL cl_set_comp_visible("scheduling_page,history_page",FALSE)
   END IF 
   #add-point:畫面資料初始化 name="init.init"
   CALL cl_set_combo_scc_part("stfb006","6008",'1,2,3,4,5')
   CALL cl_set_comp_visible("stfb006",FALSE)
   CALL s_aooi500_create_temp() RETURNING l_success
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp515.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp515_ui_dialog()
 
   #add-point:ui_dialog段define (客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num10
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   #add-point:ui_dialog段define name="ui_dialog.define"
   DEFINE l_edate  LIKE type_t.dat
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   LET g_master.stfb006 = ''
   LET g_master.bdate = g_today
   LET g_master.sel = 'N'
   DISPLAY BY NAME g_master.stfb006,g_master.bdate,g_master.sel
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.stfb006,g_master.bdate,g_master.sel 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               
               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfb006
            #add-point:BEFORE FIELD stfb006 name="input.b.stfb006"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfb006
            
            #add-point:AFTER FIELD stfb006 name="input.a.stfb006"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfb006
            #add-point:ON CHANGE stfb006 name="input.g.stfb006"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD bdate
            #add-point:BEFORE FIELD bdate name="input.b.bdate"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD bdate
            
            #add-point:AFTER FIELD bdate name="input.a.bdate"
            IF NOT cl_null(g_master.bdate) THEN 
               LET l_edate = ''
               LET l_edate = s_date_get_last_date(g_today)
               IF l_edate < g_master.bdate THEN 
                  LET g_master.bdate = ''
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00400'
                  LET g_errparam.extend = g_master.bdate
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  NEXT FIELD CURRENT 
               END IF 
            END IF 
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE bdate
            #add-point:ON CHANGE bdate name="input.g.bdate"
            
            #END add-point 
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD sel
            #add-point:BEFORE FIELD sel name="input.b.sel"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD sel
            
            #add-point:AFTER FIELD sel name="input.a.sel"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE sel
            #add-point:ON CHANGE sel name="input.g.sel"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.stfb006
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfb006
            #add-point:ON ACTION controlp INFIELD stfb006 name="input.c.stfb006"
            
            #END add-point
 
 
         #Ctrlp:input.c.bdate
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD bdate
            #add-point:ON ACTION controlp INFIELD bdate name="input.c.bdate"
            
            #END add-point
 
 
         #Ctrlp:input.c.sel
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD sel
            #add-point:ON ACTION controlp INFIELD sel name="input.c.sel"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON stfasite,mhae001,pmaa001,stfa001
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.stfasite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfasite
            #add-point:ON ACTION controlp INFIELD stfasite name="construct.c.stfasite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stfasite',g_site,'c') 
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfasite  #顯示到畫面上
            NEXT FIELD stfasite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfasite
            #add-point:BEFORE FIELD stfasite name="construct.b.stfasite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfasite
            
            #add-point:AFTER FIELD stfasite name="construct.a.stfasite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.mhae001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD mhae001
            #add-point:ON ACTION controlp INFIELD mhae001 name="construct.c.mhae001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.WHERE = " mhaestus = 'Y' AND mhaesite = '",g_site,"'"
            CALL q_mhae001_2()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO mhae001  #顯示到畫面上
            NEXT FIELD mhae001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD mhae001
            #add-point:BEFORE FIELD mhae001 name="construct.b.mhae001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD mhae001
            
            #add-point:AFTER FIELD mhae001 name="construct.a.mhae001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.pmaa001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD pmaa001
            #add-point:ON ACTION controlp INFIELD pmaa001 name="construct.c.pmaa001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            LET g_qryparam.WHERE = " pmaastus = 'Y' "
            CALL q_pmaa001_3()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO pmaa001  #顯示到畫面上
            NEXT FIELD pmaa001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD pmaa001
            #add-point:BEFORE FIELD pmaa001 name="construct.b.pmaa001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD pmaa001
            
            #add-point:AFTER FIELD pmaa001 name="construct.a.pmaa001"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stfa001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfa001
            #add-point:ON ACTION controlp INFIELD stfa001 name="construct.c.stfa001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stfa001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stfa001  #顯示到畫面上
            NEXT FIELD stfa001                     #返回原欄位


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfa001
            #add-point:BEFORE FIELD stfa001 name="construct.b.stfa001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfa001
            
            #add-point:AFTER FIELD stfa001 name="construct.a.stfa001"
            
            #END add-point
            
 
 
 
            
            #add-point:其他管控 name="cs.other"
            
            #end add-point
            
         END CONSTRUCT
 
 
 
      
         #add-point:ui_dialog段construct name="ui_dialog.more_construct"
         
         #end add-point
         #add-point:ui_dialog段input name="ui_dialog.more_input"
         
         #end add-point
         #add-point:ui_dialog段自定義display array name="ui_dialog.more_displayarray"
         
         #end add-point
 
         SUBDIALOG lib_cl_schedule.cl_schedule_setting
         SUBDIALOG lib_cl_schedule.cl_schedule_setting_exec_call
         SUBDIALOG lib_cl_schedule.cl_schedule_select_show_history
         SUBDIALOG lib_cl_schedule.cl_schedule_show_history
 
         BEFORE DIALOG
            LET l_dialog = ui.DIALOG.getCurrent()
            CALL astp515_get_buffer(l_dialog)
            #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog3"
            NEXT FIELD stfasite
            #end add-point
 
         ON ACTION batch_execute
            LET g_action_choice = "batch_execute"
            ACCEPT DIALOG
 
         #add-point:ui_dialog段before_qbeclear name="ui_dialog.before_qbeclear"
         
         #end add-point
 
         ON ACTION qbeclear         
            CLEAR FORM
            INITIALIZE g_master.* TO NULL   #畫面變數清空
            INITIALIZE lc_param.* TO NULL   #傳遞參數變數清空
            #add-point:ui_dialog段qbeclear name="ui_dialog.qbeclear"
            
            #end add-point
 
         ON ACTION history_fill
            CALL cl_schedule_history_fill()
 
         ON ACTION close
            LET INT_FLAG = TRUE
            EXIT DIALOG
         
         ON ACTION exit
            LET INT_FLAG = TRUE
            EXIT DIALOG
 
         #add-point:ui_dialog段action name="ui_dialog.more_action"
         
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
         CALL astp515_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF NOT cl_schedule_exec_check() THEN
         CONTINUE WHILE
      END IF
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog name="process.exit_dialog"
      LET lc_param.stfb021 = g_master.bdate
      LET lc_param.sel = g_master.sel
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
                 CALL astp515_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = astp515_transfer_argv(ls_js)
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
 
         #add-point:ui_dialog段after schedule name="process.after_schedule"
         
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
 
{<section id="astp515.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION astp515_transfer_argv(ls_js)
 
   #add-point:transfer_agrv段define (客製用) name="transfer_agrv.define_customerization"
   
   #end add-point
   DEFINE ls_js       STRING
   DEFINE la_cmdrun   RECORD
             prog       STRING,
             actionid   STRING,
             background LIKE type_t.chr1,
             param      DYNAMIC ARRAY OF STRING
                  END RECORD
   DEFINE la_param    type_parameter
   #add-point:transfer_agrv段define name="transfer_agrv.define"
   
   #end add-point
 
   LET la_cmdrun.prog = g_prog
   LET la_cmdrun.background = "Y"
   LET la_cmdrun.param[1] = ls_js
 
   #add-point:transfer.argv段程式內容 name="transfer.argv.define"
   
   #end add-point
 
   RETURN util.JSON.stringify( la_cmdrun )
END FUNCTION
 
{</section>}
 
{<section id="astp515.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION astp515_process(ls_js)
 
   #add-point:process段define (客製用) name="process.define_customerization"
   
   #end add-point
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define name="process.define"
   DEFINE i             LIKE type_t.num5
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_str         STRING 
   DEFINE l_msg       LIKE type_t.chr100   #160225-00040#18 2016/04/13 s983961--add
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
   
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      CALL cl_progress_bar_no_window(4)   #160225-00040#18 2016/04/13 s983961--add  
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE astp515_process_cs CURSOR FROM ls_sql
#  FOREACH astp515_process_cs INTO
   #add-point:process段process name="process.process"
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('ade-00114',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#18 2016/04/13 s983961--add(e)
   
   IF cl_null(lc_param.stfb021) THEN 
      LET lc_param.stfb021 = g_today-1                                  
   END IF
   IF cl_null(lc_param.sel) THEN 
      LET lc_param.sel = 'N'
   END IF 
   LET g_cnt = 0
   #正常费用计算
   IF NOT astp515_process_1('1',lc_param.wc,lc_param.stfb021) THEN 
      LET g_errparam.code = 'adz-00218'
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()
   ELSE
      IF lc_param.sel = 'Y' THEN 
         #固定租金提前一个月计算
         LET lc_param.stfb021 = s_date_get_date(lc_param.stfb021,1,0)
      END IF 
      IF NOT astp515_process_1('2',lc_param.wc,lc_param.stfb021) THEN 
         LET g_errparam.code = 'adz-00218'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
      ELSE
         LET g_errparam.code = 'ast-00405'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         LET g_errparam.replace[1] = g_cnt
         CALL cl_err()
      END IF 
   END IF
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('std-00012',g_lang)
   CALL cl_progress_no_window_ing(l_msg)  
   #160225-00040#18 2016/04/13 s983961--add(e)   
   #end add-point
#  END FOREACH
 
   IF g_bgjob = "N" THEN
      #前景作業完成處理
      #add-point:process段foreground完成處理 name="process.foreground_finish"
 
      #end add-point
      CALL cl_ask_confirm3("std-00012","")
   ELSE
      #背景作業完成處理
      #add-point:process段background完成處理 name="process.background_finish"
 
      #end add-point
      CALL cl_schedule_exec_call(li_p01_status)
   END IF
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL astp515_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp515.get_buffer" >}
PRIVATE FUNCTION astp515_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.stfb006 = p_dialog.getFieldBuffer('stfb006')
   LET g_master.bdate = p_dialog.getFieldBuffer('bdate')
   LET g_master.sel = p_dialog.getFieldBuffer('sel')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astp515.msgcentre_notify" >}
PRIVATE FUNCTION astp515_msgcentre_notify()
 
   #add-point:process段define (客製用) name="msgcentre_notify.define_customerization"
   
   #end add-point
   DEFINE lc_state LIKE type_t.chr5
   #add-point:process段define name="msgcentre_notify.define"
   
   #end add-point
 
   INITIALIZE g_msgparam TO NULL
 
   #action-id與狀態填寫
   LET g_msgparam.state = "process"
 
   #add-point:msgcentre其他通知 name="msg_centre.process"
   
   #end add-point
 
   #呼叫訊息中心傳遞本關完成訊息
   CALL cl_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp515.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: 批次处理
# Memo...........:
# Usage..........: CALL astp515_process_1(p_type,p_wc,p_date)
# Input parameter: p_type   类型：1.正常费用计算 2.固定租金计算
#                : p_wc     查询条件
# Return code....: p_date   执行日期
# Date & Author..: 2015/08/01 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp515_process_1(p_type,p_wc,p_date)
DEFINE p_type      LIKE type_t.chr1
DEFINE p_wc        STRING 
DEFINE p_date      LIKE stfb_t.stfb021
DEFINE l_sql       STRING 
#161111-00028#3--modify---end----------
#DEFINE l_stfb      RECORD LIKE stfb_t.*
#DEFINE l_stfa      RECORD LIKE stfa_t.*
#DEFINE l_stba      RECORD LIKE stba_t.*
#DEFINE l_stbb      RECORD LIKE stbb_t.*
#DEFINE l_stfi      RECORD LIKE stfi_t.*
DEFINE l_stfi RECORD  #專櫃合約優惠條件資料檔
       stfient LIKE stfi_t.stfient, #企業編號
       stfiunit LIKE stfi_t.stfiunit, #應用組織
       stfiacti LIKE stfi_t.stfiacti, #資料有效
       stfisite LIKE stfi_t.stfisite, #營運據點
       stfiseq LIKE stfi_t.stfiseq, #項次
       stfi001 LIKE stfi_t.stfi001, #合約編號
       stfi002 LIKE stfi_t.stfi002, #優惠類型
       stfi003 LIKE stfi_t.stfi003, #費用編碼
       stfi004 LIKE stfi_t.stfi004, #優惠金額
       stfi005 LIKE stfi_t.stfi005, #優惠開始日期
       stfi006 LIKE stfi_t.stfi006, #優惠截止日期
       stfi007 LIKE stfi_t.stfi007, #優惠單號
       stfi008 LIKE stfi_t.stfi008, #優惠項次
       stfi009 LIKE stfi_t.stfi009, #備註
       stfi010 LIKE stfi_t.stfi010, #優惠原因
       stfi011 LIKE stfi_t.stfi011, #費用編號
       stfi012 LIKE stfi_t.stfi012  #費用項次
       END RECORD
DEFINE l_stfb RECORD  #專櫃合約費用設定檔
       stfbent LIKE stfb_t.stfbent, #企業編號
       stfbunit LIKE stfb_t.stfbunit, #應用組織
       stfbsite LIKE stfb_t.stfbsite, #營運據點
       stfbseq LIKE stfb_t.stfbseq, #項次
       stfb001 LIKE stfb_t.stfb001, #合約編號
       stfb002 LIKE stfb_t.stfb002, #費用編號
       stfb003 LIKE stfb_t.stfb003, #會計期間
       stfb004 LIKE stfb_t.stfb004, #價款類別
       stfb005 LIKE stfb_t.stfb005, #計算類型
       stfb006 LIKE stfb_t.stfb006, #費用週期
       stfb007 LIKE stfb_t.stfb007, #費用週期方式
       stfb008 LIKE stfb_t.stfb008, #條件基準
       stfb009 LIKE stfb_t.stfb009, #計算基準
       stfb010 LIKE stfb_t.stfb010, #費用淨額
       stfb011 LIKE stfb_t.stfb011, #費用比率
       stfb012 LIKE stfb_t.stfb012, #供應商承擔比率
       stfb013 LIKE stfb_t.stfb013, #生效日期
       stfb014 LIKE stfb_t.stfb014, #失效日期
       stfb015 LIKE stfb_t.stfb015, #下次計算日
       stfb016 LIKE stfb_t.stfb016, #下次費用開始日
       stfb017 LIKE stfb_t.stfb017, #下次費用截止日
       stfb018 LIKE stfb_t.stfb018, #納入結算單否
       stfb019 LIKE stfb_t.stfb019, #票扣否
       stfb020 LIKE stfb_t.stfb020, #按自然月計費否
       stfb021 LIKE stfb_t.stfb021, #上次計算日期
       stfb022 LIKE stfb_t.stfb022, #上次費用開始日期
       stfb023 LIKE stfb_t.stfb023, #上次費用結束日期
       stfb024 LIKE stfb_t.stfb024, #費用單號
       stfb025 LIKE stfb_t.stfb025, #費用項次
       stfb026 LIKE stfb_t.stfb026  #有效
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
       stfa056 LIKE stfa_t.stfa056  #工衣情況
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

DEFINE l_bdate     LIKE type_t.dat
DEFINE l_edate     LIKE type_t.dat
DEFINE l_sys       LIKE type_t.num5
DEFINE l_year      LIKE type_t.num5
DEFINE l_month     LIKE type_t.num5
DEFINE l_first     LIKE type_t.dat
DEFINE l_last      LIKE type_t.dat
DEFINE l_success   LIKE type_t.num5
DEFINE r_success   LIKE type_t.num5
DEFINE r_doctype   LIKE rtai_t.rtai004
DEFINE r_nextd     LIKE type_t.dat
DEFINE r_begin     LIKE type_t.dat
DEFINE r_end       LIKE type_t.dat
DEFINE l_stab008   LIKE stab_t.stab008
DEFINE l_stab009   LIKE stab_t.stab009
DEFINE l_stab010   LIKE stab_t.stab010
DEFINE l_stab013   LIKE stab_t.stab013
DEFINE l_stab008_2 LIKE stab_t.stab008
DEFINE l_stab009_2 LIKE stab_t.stab009
DEFINE l_stab010_2 LIKE stab_t.stab010
DEFINE l_stab013_2 LIKE stab_t.stab013
DEFINE l_stbb009   LIKE stbb_t.stbb009
DEFINE l_stbb009_2 LIKE stbb_t.stbb009
DEFINE l_stae005   LIKE stae_t.stae005
DEFINE l_nextd     LIKE type_t.dat
DEFINE l_begin     LIKE type_t.dat
DEFINE l_end       LIKE type_t.dat
DEFINE l_sum       LIKE stbb_t.stbb009
DEFINE l_acount_t  LIKE stbb_t.stbb009
DEFINE l_exit      LIKE type_t.chr1
DEFINE l_day       LIKE type_t.num5
DEFINE l_stbastus  LIKE stba_t.stbastus
DEFINE l_where     STRING
DEFINE l_msg       LIKE type_t.chr100   #160225-00040#18 2016/04/13 s983961--add

   WHENEVER ERROR CONTINUE
   
   CALL s_transaction_begin()
   CALL cl_err_collect_init()
   LET l_bdate = ''
   LET l_edate = ''
   LET l_success = TRUE
   IF cl_null(p_wc) THEN 
      LET p_wc = " 1=1"
   END IF 
 
   #按照“上次计算日期、上次费用开始日期、上次费用结束日期”更新到“下次计算日、下次费用开始日、下次费用结束日”
   LET l_sql = " UPDATE stfb_t SET stfb015 = stfb021, ",
               "                   stfb016 = stfb022, ",
               "                   stfb017 = stfb023 ",
               "  WHERE stfbent = ",g_enterprise,
               "    AND stfb021 = '",p_date,"'",
               "    AND EXISTS (SELECT 1 FROM stfa_t ",
               "                         LEFT JOIN pmaa_t ON pmaaent = stfaent AND pmaa001 = stfa010 ",
               "                         LEFT JOIN mhae_t ON mhaeent = stfaent AND mhae001 = stfa005 AND mhaesite = stfasite ",    
               "                 WHERE stfaent = stfbent ",
               "                   AND stfaent = ",g_enterprise,
               "                   AND stfasite = '",g_site,"'",
               "                   AND stfa001 = stfb001 ",
               "                   AND stfa003 IN('4','5') ",
               "                   AND stfa004 IN('3','4','5','6')",
               "                   AND ",p_wc,")"
   IF p_type = '1' THEN 
      #LET l_sql = l_sql," AND NOT EXISTS(SELECT 1 FROM stae_t WHERE staeent = stfbent AND stae001 = stfb002 AND stae012 = '0001' AND stfb005 = '2') "
      LET l_sql = l_sql," AND stfb005 <> '2' "
   ELSE
      #LET l_sql = l_sql," AND EXISTS(SELECT 1 FROM stae_t WHERE staeent = stfbent AND stae001 = stfb002 AND stae012 = '0001' AND stfb005 = '2') "
      LET l_sql = l_sql," AND stfb005 = '2' "
   END IF 
   PREPARE upd_stfb FROM l_sql
   EXECUTE upd_stfb 
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = 'foreach:' 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      LET l_success = FALSE      
      #160225-00040#18 2016/04/13 s983961--add(s)
      LET l_msg = cl_getmsg('ast-00330',g_lang)   
      CALL cl_progress_no_window_ing(l_msg)
      #160225-00040#18 2016/04/13 s983961--add(e)      
      RETURN FALSE
   END IF
    
   INITIALIZE l_stfa.* TO NULL
 # LET l_sql = " SELECT DISTINCT stfa_t.* FROM stfa_t ",  #161111-00028#3--mark
   #161111-00028#3--add--begin------
   LET l_sql = " SELECT DISTINCT stfaent,stfasite,stfaunit,stfaacti,stfa001,stfa002,stfa003,stfa004,",
               "stfa005,stfa006,stfa007,stfa008,stfa009,stfa010,stfa011,stfa012,stfa013,stfa014,stfa015,",
               "stfa016,stfa017,stfa018,stfa019,stfa020,stfa021,stfa022,stfa023,stfa024,stfa025,stfa026,",
               "stfa027,stfa028,stfa029,stfa030,stfa031,stfa032,stfa033,stfa034,stfa035,stfa036,stfa037,",
               "stfa038,stfa039,stfa040,stfa041,stfa042,stfa043,stfa044,stfa045,stfa046,stfa047,stfa048,",
               "stfa049,stfaownid,stfaowndp,stfacrtid,stfacrtdp,stfacrtdt,stfamodid,stfamoddt,stfastus,",
               "stfacnfid,stfacnfdt,stfa050,stfa051,stfa052,stfa053,stfa054,stfa055,stfa056 FROM stfa_t ", 
   #161111-00028#3--add--end------
               "   LEFT JOIN pmaa_t ON pmaaent = stfaent AND pmaa001 = stfa010 ",
               "   LEFT JOIN mhae_t ON mhaeent = stfaent AND mhae001 = stfa005 AND mhaesite = stfasite ",
               "   LEFT JOIN stfb_t ON stfbent = stfaent AND stfb001 = stfa001 ",
               "  WHERE stfaent = ",g_enterprise,
               "    AND stfb015 <='",p_date,"'",
               "    AND stfasite = '",g_site,"'",
               "    AND stfa003 IN('4','5') ",
               "    AND stfa004 IN('3','4','5','6')",
               "    AND ",p_wc
   IF p_type = '1' THEN 
      #LET l_sql = l_sql," AND NOT EXISTS(SELECT 1 FROM stae_t WHERE staeent = stfbent AND stae001 = stfb002 AND stae012 = '0001' AND stfb005 = '2' )"
      LET l_sql = l_sql," AND stfb005 <> '2' "
   ELSE
      #LET l_sql = l_sql," AND EXISTS(SELECT 1 FROM stae_t WHERE staeent = stfbent AND stae001 = stfb002 AND stae012 = '0001' AND stfb005 = '2' ) "
      LET l_sql = l_sql," AND stfb005 = '2' "
   END IF 
   PREPARE sel_stfa FROM l_sql
   DECLARE sel_stfa_cs CURSOR FOR sel_stfa
 # LET l_sql = " SELECT * FROM stfb_t ", #161111-00028#3--mark
 #161111-00028#3--add---begin--------
   LET l_sql = " SELECT stfbent,stfbunit,stfbsite,stfbseq,stfb001,stfb002,stfb003,stfb004,stfb005,stfb006,",
               "stfb007,stfb008,stfb009,stfb010,stfb011,stfb012,stfb013,stfb014,stfb015,stfb016,stfb017,",
               "stfb018,stfb019,stfb020,stfb021,stfb022,stfb023,stfb024,stfb025,stfb026 FROM stfb_t ", 
 #161111-00028#3--add---end----------
               "  WHERE stfbent = ",g_enterprise,
               "    AND stfb015 <= '",p_date,"'",
               "    AND stfb001 = ? "
   IF p_type = '1' THEN 
      #LET l_sql = l_sql," AND NOT EXISTS(SELECT 1 FROM stae_t WHERE staeent = stfbent AND stae001 = stfb002 AND stae012 = '0001' AND stfb005 = '2')"
      LET l_sql = l_sql," AND stfb005 <> '2' "
   ELSE
      #LET l_sql = l_sql," AND EXISTS(SELECT 1 FROM stae_t WHERE staeent = stfbent AND stae001 = stfb002 AND stae012 = '0001' AND stfb005 = '2') "
      LET l_sql = l_sql," AND stfb005 = '2' "
   END IF 
   PREPARE sel_stfb FROM l_sql
   DECLARE sel_stfb_cs CURSOR FOR sel_stfb
   #优惠费用抓取资料
 # LET l_sql = " SELECT DISTINCT stfa_t.* FROM stfa_t ",  #161111-00028#3--mark
   #161111-00028#3--add--begin------
   LET l_sql = " SELECT DISTINCT stfaent,stfasite,stfaunit,stfaacti,stfa001,stfa002,stfa003,stfa004,",
               "stfa005,stfa006,stfa007,stfa008,stfa009,stfa010,stfa011,stfa012,stfa013,stfa014,stfa015,",
               "stfa016,stfa017,stfa018,stfa019,stfa020,stfa021,stfa022,stfa023,stfa024,stfa025,stfa026,",
               "stfa027,stfa028,stfa029,stfa030,stfa031,stfa032,stfa033,stfa034,stfa035,stfa036,stfa037,",
               "stfa038,stfa039,stfa040,stfa041,stfa042,stfa043,stfa044,stfa045,stfa046,stfa047,stfa048,",
               "stfa049,stfaownid,stfaowndp,stfacrtid,stfacrtdp,stfacrtdt,stfamodid,stfamoddt,stfastus,",
               "stfacnfid,stfacnfdt,stfa050,stfa051,stfa052,stfa053,stfa054,stfa055,stfa056 FROM stfa_t ", 
   #161111-00028#3--add--end------
               "   LEFT JOIN pmaa_t ON pmaaent = stfaent AND pmaa001 = stfa010 ",
               "   LEFT JOIN mhae_t ON mhaeent = stfaent AND mhae001 = stfa005 AND mhaesite = stfasite ",
               "   LEFT JOIN stfi_t ON stfient = stfaent AND stfi001 = stfa001 ",
               "  WHERE stfaent = ",g_enterprise,
               "    AND stfi006 ='",p_date,"'",
               "    AND stfasite = '",g_site,"'",
               "    AND stfa003 IN('4','5') ",
               "    AND stfa004 IN('3','4','5','6')",
               "    AND ",p_wc
   IF p_type = '1' THEN 
      #LET l_sql = l_sql," AND NOT EXISTS(SELECT 1 FROM stae_t WHERE staeent = stfient AND stae001 = stfi003 AND stae012 = '0001')"
      LET l_sql = l_sql," AND stfb005 <> '2' "
   ELSE
      #LET l_sql = l_sql," AND EXISTS(SELECT 1 FROM stae_t WHERE staeent = stfient AND stae001 = stfi003 AND stae012 = '0001') "
      LET l_sql = l_sql," AND stfb005 = '2' "
   END IF 
   PREPARE sel_stfa_2 FROM l_sql
   DECLARE sel_stfa_cs_2 CURSOR FOR sel_stfa_2
  #LET l_sql = " SELECT * FROM stfi_t ", #161111-00028#3--mark
  #161111-00028#3--add----begin----------
   LET l_sql = " SELECT stfient,stfiunit,stfiacti,stfisite,stfiseq,stfi001,stfi002,stfi003,stfi004,",
               "stfi005,stfi006,stfi007,stfi008,stfi009,stfi010,stfi011,stfi012 FROM stfi_t ",
  #161111-00028#3--add----end------------
               "  WHERE stfient = ",g_enterprise,
               "    AND stfi006 ='",p_date,"'",
               "    AND stfi001 = ? "
   IF p_type = '1' THEN 
      #LET l_sql = l_sql," AND NOT EXISTS(SELECT 1 FROM stae_t WHERE staeent = stfient AND stae001 = stfi003 AND stae012 = '0001')"
      LET l_sql = l_sql," AND stfb005 <> '2' "
   ELSE
      #LET l_sql = l_sql," AND EXISTS(SELECT 1 FROM stae_t WHERE staeent = stfient AND stae001 = stfi003 AND stae012 = '0001') "
      LET l_sql = l_sql," AND stfb005 = '2' "
   END IF 
   PREPARE sel_stfi FROM l_sql
   DECLARE sel_stfi_cs CURSOR FOR sel_stfi
   
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('ade-00114',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#18 2016/04/13 s983961--add(e)
   
   FOREACH sel_stfa_cs INTO l_stfa.*   
              
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = 'foreach:' 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET l_success = FALSE
         EXIT FOREACH
      END IF
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
      LET l_stba.stbasite = l_stfa.stfasite
      LET l_stba.stbaunit = l_stfa.stfasite
      LET l_stba.stbadocdt = p_date
      ##預設單據的單別
      LET r_success = ''
      LET r_doctype = ''
      CALL s_arti200_get_def_doc_type(l_stba.stbaunit,'astt510','1')
           RETURNING r_success,r_doctype
      LET l_stba.stbadocno = r_doctype
      CALL s_aooi200_gen_docno(g_site,l_stba.stbadocno,l_stba.stbadocdt,'astt510') RETURNING r_success,l_stba.stbadocno
      IF NOT r_success THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'apm-00003'
         LET g_errparam.extend = l_stba.stbadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET l_success = FALSE
         EXIT FOREACH              
      END IF 
#     LET l_stba.stba001 = l_stfa.stfa038    #結算中心
      CALL s_astt401_stey006_get(l_stfa.stfa005,l_stba.stbadocdt) RETURNING l_stba.stba001    #lanjj add on 2016-07-28
#     LET l_stba.stba002 = l_stfa.stfa010    #供應商編號   #mark by yangxf 
      CALL s_astt401_stey003_get(l_stfa.stfa005,l_stba.stbadocdt) RETURNING l_stba.stba002    #add by yangxf #供應商編號 
      LET l_stba.stba003 = l_stfa.stfa003    #經營方式
      LET l_stba.stba004 = l_stfa.stfa036    #結算方式
      LET l_stba.stba005 = l_stfa.stfa037    #結算類型
      LET l_stba.stba006 = '2'               #來源類型
      LET l_stba.stba007 = l_stfa.stfa001    #來源單號
      LET l_stba.stba008 = l_stfa.stfa015    #人員
      SELECT ooag003 INTO l_stba.stba009     #部門
        FROM ooag_t
       WHERE ooagent = g_enterprise
         AND ooag001 = l_stba.stba008       
      LET l_stba.stbastus = 'N'              #狀態碼
      LET l_stba.stba010 = l_stfa.stfa001    #合同編號
      LET l_stba.stba011 = l_stfa.stfa032    #幣別
      #LET l_stba.stba012 = l_stfa.stfa034    #稅別 lanjj mark
      CALL s_astt401_stey004_get(l_stfa.stfa005,l_stba.stbadocdt) RETURNING l_stba.stba012 #稅別 lanjj add on 2016-07-28
      LET l_stba.stba013 = l_stfa.stfa005    #專櫃編號
      LET l_stba.stba014 = '2'               #費用類型
      LET l_stba.stba015 = ''                #交款狀態
      LET l_stba.stba016 = ''                #交款人
      LET l_stba.stba000 = 'astt510'         #程式編號
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
      LET g_cnt = g_cnt + 1
      INITIALIZE l_stfb.* TO NULL
      LET g_deteal_cnt = 0
      FOREACH sel_stfb_cs USING l_stfa.stfa001 INTO l_stfb.*     
         #如果合约状态为'6'清退
         IF l_stfa.stfa004 = '6' THEN 
            #开始日期大于清退日期不产生费用 OR 费用为期初，不用产生费用
            IF l_stfb.stfb016 > l_stfa.stfa024 OR l_stfb.stfb007 = '1' THEN 
               CONTINUE FOREACH 
            END IF 
         END IF 
         
         #lanjj add on 2016-04-29 start 顾问 刘鑫   清退中的合同 费用单生成限制
            IF NOT cl_null(l_stfa.stfa024) THEN #清退日期不为空
               IF (l_stfb.stfb005 = '2' AND l_stfb.stfb007 = '1') THEN # 固定+期初
                  IF l_stfb.stfb015 > l_stfa.stfa024 THEN #将要更新为上次结算日的下次结算日，即本次结算日，若大于结算日期，则不生成费用单
                     CONTINUE FOREACH 
                  END IF
               END IF
            END IF 
         #lanjj add on 2016-04-29  end  顾问 刘鑫 
         
         
         IF l_stfb.stfb021 = l_stfb.stfb015 AND NOT cl_null(l_stfb.stfb021) THEN  #160408-00010#1 add 
            #判断如果对应的费用单的审核码NOT IN(N/R/X)，则提示费用单已审核，不允许重新执行。
            SELECT stbastus INTO l_stbastus
              FROM stba_t
             WHERE stbaent = g_enterprise
               AND stbadocno = l_stfb.stfb024
              #AND stbadocdt = p_date        #160408-00010#1 MARK
            #费用单已审核不可删除重新执行
            IF l_stbastus = 'Y' THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = "ast-00447"
               LET g_errparam.extend = l_stfb.stfb024
               LET g_errparam.popup = TRUE
               CALL cl_err()
               
               #更新下次费用计算日、下次费用开始日、下次费用截止日
               CALL s_astm301_cal_nextd(l_stfb.stfb006,l_stfb.stfb007,l_stfb.stfb013,l_stfb.stfb014,l_stfb.stfb016,l_stfb.stfb017,l_stfb.stfb001,'2',l_stfb.stfb020,l_stfb.stfb003)
                    RETURNING r_nextd,r_begin,r_end
               IF l_stfb.stfb006 = '4' THEN 
                  LET r_nextd = ''
                  LET r_begin = ''
                  LET r_end = ''
               END IF
               UPDATE stfb_t SET stfb015 = r_nextd,
                                 stfb016 = r_begin,
                                 stfb017 = r_end
                WHERE stfbent = g_enterprise
                  AND stfb001 = l_stfb.stfb001
                  AND stfbseq = l_stfb.stfbseq
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = " UPD stfb_t "
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
                  EXIT FOREACH   
               END IF
               CONTINUE FOREACH 
            ELSE
               #则删除对应的费用单号+项次（删除后判断该单号对应费用单是否还有单身，如果没有则删除单头，否则不删除单头）
               DELETE FROM stbb_t
                WHERE stbbent = g_enterprise
                  AND EXISTS(SELECT 1 FROM stba_t WHERE stbaent = stbbent
                                                    AND stbadocno = stbbdocno
                                                   #AND stbadocdt = p_date               #160408-00010#1 mark 
                                                    AND stbaent = g_enterprise
                                                    AND stbadocno = l_stfb.stfb024)
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = " DEL stfb_t "
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
                  EXIT FOREACH   
               END IF
               #删除单头
               #DELETE FROM stba_t WHERE stbaent = g_enterprise AND stbadocno = l_stfb.stfb024 AND stbadocdt = p_date   #160408-00010#1 mark
               DELETE FROM stba_t WHERE stbaent = g_enterprise AND stbadocno = l_stfb.stfb024  #160408-00010#1 add 
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = SQLCA.sqlcode
                  LET g_errparam.extend = " DEL stfa_t "
                  LET g_errparam.popup = TRUE
                  CALL cl_err()
                  LET l_success = FALSE
                  EXIT FOREACH   
               END IF
            END IF 
         END IF       #160408-00010#1 add 
         #“费用明细”中的有效码=“N”的资料，则本次计算的费用资料的下次计算日、下次费用开始日期、下次费用结束日期更新为空
         IF l_stfb.stfb026 = 'N' THEN 
            UPDATE stfb_t SET stfb015 = '',
                              stfb016 = '',
                              stfb017 = '',
                              stfb021 = l_stfb.stfb015,
                              stfb022 = l_stfb.stfb016,
                              stfb023 = l_stfb.stfb017,
                              stfb024 = '',
                              stfb025 = ''
             WHERE stfbent = g_enterprise
               AND stfb001 = l_stfb.stfb001
               AND stfbseq = l_stfb.stfbseq
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = " UPD stfb_t "
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH   
            END IF
            CONTINUE FOREACH 
         END IF 
         WHILE TRUE
            LET l_bdate = l_stfb.stfb016      #费用计算开始日期
            LET l_edate = l_stfb.stfb017      #费用计算截止日期
            #如果合约状态为'6'清退，且清退日期在开始和截止日期之间
            IF l_stfa.stfa004 = '6' AND NOT cl_null(l_stfa.stfa024) THEN 
               IF l_bdate <= l_stfa.stfa024 AND l_stfa.stfa024 <= l_edate THEN 
                  LET l_edate = l_stfa.stfa024
               END IF 
            END IF 
            CALL cl_get_para(g_enterprise,l_stfa.stfasite,'S-CIR-2003') RETURNING l_sys
            #开始日期按进场日期算
            IF l_sys = '1' THEN
               IF NOT cl_null(l_stfa.stfa017) THEN 
                  #费用开始日期<进场日期<费用截止日赋值。则费用开始日期 = 进场日期      
                  IF l_bdate < l_stfa.stfa017 AND l_stfa.stfa017 < l_edate THEN 
                     LET l_bdate = l_stfa.stfa017
                  ELSE
                     IF l_stfa.stfa017 > l_edate THEN 
                        WHILE TRUE 
                           #更新下次费用计算日、下次费用开始日、下次费用截止日
                           CALL s_astm301_cal_nextd(l_stfb.stfb006,l_stfb.stfb007,l_stfb.stfb013,l_stfb.stfb014,l_stfb.stfb016,l_stfb.stfb017,l_stfb.stfb001,'2',l_stfb.stfb020,l_stfb.stfb003)
                                RETURNING r_nextd,r_begin,r_end
                           IF l_stfb.stfb006 = '4' THEN 
                              LET r_nextd = ''
                              LET r_begin = ''
                              LET r_end = ''
                           END IF
                          #lanjj add on 2016-04-29 start 顾问 刘鑫   清退中的合同 费用单生成限制
                           IF NOT cl_null(l_stfa.stfa024) THEN #清退日期不为空
                              IF (l_stfb.stfb005 = '1' AND l_stfb.stfb007 = '2') OR (l_stfb.stfb005 = '2' AND l_stfb.stfb007 = '2') THEN #变动+期末 或 固定+期末
                                 IF l_stfb.stfb015 > l_stfa.stfa024 THEN #将要更新为上次结算日的下次结算日，即本次结算日，若大于结算日期，则把下次结算日，开始、结束日更新为空，下次不生成费用单
                                    LET r_nextd = ''
                                    LET r_begin = ''
                                    LET r_end = ''
                                 END IF
                              END IF
                           END IF 
                          #lanjj add on 2016-04-29  end  顾问 刘鑫 
                           UPDATE stfb_t SET stfb015 = r_nextd,
                                             stfb016 = r_begin,
                                             stfb017 = r_end
                            WHERE stfbent = g_enterprise
                              AND stfb001 = l_stfb.stfb001
                              AND stfbseq = l_stfb.stfbseq
                           IF SQLCA.sqlcode THEN
                              INITIALIZE g_errparam TO NULL
                              LET g_errparam.code = SQLCA.sqlcode
                              LET g_errparam.extend = " UPD stfb_t "
                              LET g_errparam.popup = TRUE
                              CALL cl_err()
                              LET l_success = FALSE
                              EXIT WHILE   
                           END IF
                           LET l_bdate = r_begin      #费用计算开始日期
                           LET l_edate = r_end        #费用计算截止日期
                           LET l_stfb.stfb016 = r_begin
                           LET l_stfb.stfb017 = r_end
                           IF cl_null(l_bdate) THEN 
                              EXIT WHILE
                           END IF 
                           IF l_bdate < l_stfa.stfa017 AND l_stfa.stfa017 < l_edate THEN 
                              LET l_bdate = l_stfa.stfa017
                              EXIT WHILE 
                           END IF 
                        END WHILE                  
                     END IF 
                     IF cl_null(l_bdate) THEN 
                        EXIT WHILE 
                     END IF 
                  END IF 
               END IF 
            END IF 
            #清退日期不为空且为本月，则结束日期给清退日期
            IF NOT cl_null(l_stfa.stfa024) THEN 
               IF YEAR(l_stfa.stfa024) = YEAR(g_today) AND MONTH(l_stfa.stfa024) = MONTH(g_today) THEN 
                  LET l_edate = l_stfa.stfa024
               END IF 
            END IF 
            #费用类型为"固定"
            IF l_stfb.stfb005 = '2' THEN 
               CASE l_stfb.stfb006
                    #年
                    WHEN '1'
                        #按自然月计费
                        IF l_stfb.stfb020 = 'Y' THEN 
                           LET l_year = YEAR(l_bdate)
                           #获取当前年份第一天
                           LET l_first = MDY(1,1,l_year)
                           #获取当前年份最后一天
                           LET l_last = MDY(12,31,l_year)
                           #费用 = 一年的费用/一年的天数*费用天数*供应商承担比例
                           LET l_stbb009 = l_stfb.stfb010/(l_last-l_first+1)*(l_edate-l_bdate+1)*(l_stfb.stfb012/100)
                        ELSE
                           #费用 = 一年的费用/(下次费用截止日期-下次费用开始日期)*费用天数*供应商承担比例
                           LET l_stbb009 = l_stfb.stfb010/(l_stfb.stfb017-l_stfb.stfb016+1)*(l_edate-l_bdate+1)*(l_stfb.stfb012/100)
                        END IF 
                    #季
                    WHEN '2'
                        #按自然月计费
                        IF l_stfb.stfb020 = 'Y' THEN 
                           LET l_year = YEAR(l_bdate)
                           LET l_month = MONTH(l_bdate)
                           #获取当前季度第一天
                           #四个季度 1-3 4-6 7-9 10-12
                           IF l_month >= 1 AND l_month <= 3 THEN 
                              LET l_first = MDY( 1, 1, l_year)
                              LET l_last  = MDY( 3,31, l_year)
                           END IF 
                           IF l_month >= 4 AND l_month <= 6 THEN 
                              LET l_first = MDY( 4, 1, l_year)
                              LET l_last  = MDY( 6,30, l_year)
                           END IF 
                           IF l_month >= 7 AND l_month <= 9 THEN 
                              LET l_first = MDY( 7, 1, l_year)
                              LET l_last  = MDY( 9,30, l_year)
                           END IF 
                           IF l_month >= 10 AND l_month <= 12 THEN 
                              LET l_first = MDY(10, 1, l_year)
                              LET l_last  = MDY(12,31, l_year)
                           END IF 
                           #费用 = 一季度的费用/一年的天数*费用天数*供应商承担比例
                           LET l_stbb009 = l_stfb.stfb010/(l_last-l_first+1)*(l_edate-l_bdate+1)*(l_stfb.stfb012/100)
                        ELSE
                           #费用 = 一季度费用/(下次费用截止日期-下次费用开始日期)*费用天数*供应商承担比例
                           LET l_stbb009 = l_stfb.stfb010/(l_stfb.stfb017-l_stfb.stfb016+1)*(l_edate-l_bdate+1)*(l_stfb.stfb012/100)
                        END IF 
                    #月
                    WHEN '3'
                        #按自然月计费
                        IF l_stfb.stfb020 = 'Y' THEN 
                           #获取当前月第一天
                           CALL s_date_get_first_date(l_bdate) RETURNING l_first
                           #获取当月最后一天
                           CALL s_date_get_last_date(l_bdate) RETURNING l_last
                           #费用 = 一月的费用/一年的天数*费用天数*供应商承担比例
                           LET l_stbb009 = l_stfb.stfb010/(l_last-l_first+1)*(l_edate-l_bdate+1)*(l_stfb.stfb012/100)
                        ELSE
                           #费用 = 一月的费用/(下次费用截止日期-下次费用开始日期)*费用天数*供应商承担比例
                           LET l_stbb009 = l_stfb.stfb010/(l_stfb.stfb017-l_stfb.stfb016+1)*(l_edate-l_bdate+1)*(l_stfb.stfb012/100)
                        END IF 
                    #单次
                    WHEN '4'
                        LET l_stbb009 = l_stfb.stfb010*(l_stfb.stfb012/100)
                        
                    #按结算帐期
                    WHEN '5'
                        #费用 = 一结算帐期的费用/(下次费用截止日期-下次费用开始日期)*费用天数*供应商承担比例
                        LET l_stbb009 = l_stfb.stfb010/(l_stfb.stfb017-l_stfb.stfb016+1)*(l_edate-l_bdate+1)*(l_stfb.stfb012/100)
                        
                    OTHERWISE 
                       EXIT WHILE  
               END CASE 
            
            #变动费用
            ELSE
               #计算基准条件
               SELECT stab008,stab009,stab010,stab013
                 INTO l_stab008,l_stab009,l_stab010,l_stab013
                 FROM stab_t
                WHERE stabent = g_enterprise
                  AND stab001 = l_stfb.stfb009
               #取原价金额
               IF l_stab008 = 'Y' AND l_stab009 ='Y'  AND l_stab010 = 'Y' THEN 
                  SELECT COALESCE(SUM(debg013),0) INTO l_stbb009
                    FROM debg_t
                   WHERE debgent = g_enterprise
                     AND debgsite = l_stfa.stfasite
                     AND debg005 = l_stfa.stfa005
                     AND debg002 BETWEEN l_bdate AND l_edate
                     AND debg027 != '5'     #160420-00008#1 Add By Ken 160429加上經營方式不等於租賃 
               END IF 
               #实收金额
               IF l_stab008 = 'Y' AND l_stab009 ='Y'  AND l_stab010 = 'N' THEN 
                  SELECT COALESCE(SUM(debg017),0) INTO l_stbb009
                    FROM debg_t
                   WHERE debgent = g_enterprise
                     AND debgsite = l_stfa.stfasite
                     AND debg005 = l_stfa.stfa005
                     AND debg002 BETWEEN l_bdate AND l_edate 
                     AND debg027 != '5'     #160420-00008#1 Add By Ken 160429加上經營方式不等於租賃
               END IF 
               IF l_stab013 = 'Y' THEN 
#                  SELECT COALESCE(SUM(debb030),0) INTO l_stbb009
#                    FROM debb_t 
#                   WHERE debbent = g_enterprise
#                     AND debb017 = l_stfa.stfa005
#                     AND debb002 BETWEEN l_bdate AND l_edate
                     
                  SELECT SUM(rtjb029) INTO l_stbb009
                    FROM rtja_t,rtjb_t
                   WHERE rtjaent = rtjbent
                     AND rtjb028 = l_stfa.stfa005
                     AND rtjadocdt BETWEEN l_bdate AND l_edate
                     AND rtjadocno = rtjbdocno
                     AND rtjb029 <>0 
                     AND rtjb029 IS NOT NULL
               END IF 
               #条件基准
               IF NOT cl_null(l_stfb.stfb008) THEN 
                  #计算条件基准
                  SELECT stab008,stab009,stab010,stab013
                    INTO l_stab008_2,l_stab009_2,l_stab010_2,l_stab013_2
                    FROM stab_t
                   WHERE stabent = g_enterprise
                     AND stab001 = l_stfb.stfb008
                  #取原价金额
                  IF l_stab008_2 = 'Y' AND l_stab009_2 ='Y'  AND l_stab010_2 = 'Y' THEN 
                     SELECT COALESCE(SUM(debg013),0) INTO l_stbb009_2
                       FROM debg_t
                      WHERE debgent = g_enterprise
                        AND debgsite = l_stfa.stfasite
                        AND debg005 = l_stfa.stfa005
                        AND debg002 BETWEEN l_bdate AND l_edate 
                        AND debg027 != '5'     #160420-00008#1 Add By Ken 160429加上經營方式不等於租賃
                  END IF 
                  #实收金额
                  IF l_stab008_2 = 'Y' AND l_stab009_2 ='Y'  AND l_stab010_2 = 'N' THEN 
                     SELECT COALESCE(SUM(debg017),0) INTO l_stbb009_2
                       FROM debg_t
                      WHERE debgent = g_enterprise
                        AND debgsite = l_stfa.stfasite
                        AND debg005 = l_stfa.stfa005
                        AND debg002 BETWEEN l_bdate AND l_edate 
                        AND debg027 != '5'     #160420-00008#1 Add By Ken 160429加上經營方式不等於租賃
                  END IF
                  IF l_stab013_2 = 'Y' THEN 
#                     SELECT COALESCE(SUM(debb030),0) INTO l_stbb009_2
#                       FROM debb_t 
#                      WHERE debbent = g_enterprise
#                        AND debb017 = l_stfa.stfa005
#                        AND debb002 BETWEEN l_bdate AND l_edate
                     SELECT SUM(rtjb029) INTO l_stbb009_2
                       FROM rtja_t,rtjb_t
                      WHERE rtjaent = rtjbent
                        AND rtjb028 = l_stfa.stfa005
                        AND rtjadocdt BETWEEN l_bdate AND l_edate
                        AND rtjadocno = rtjbdocno
                        AND rtjb029 <>0 
                        AND rtjb029 IS NOT NULL
                  END IF 
                  #条件基准不满足条件则更新下次计算日、下次费用开始日期，下次费用结束日期
                  IF l_stbb009_2 < l_stfb.stfb010 THEN 
                     #更新下次费用计算日、下次费用开始日、下次费用截止日
                     CALL s_astm301_cal_nextd(l_stfb.stfb006,l_stfb.stfb007,l_stfb.stfb013,l_stfb.stfb014,l_stfb.stfb016,l_stfb.stfb017,l_stfb.stfb001,'2',l_stfb.stfb020,l_stfb.stfb003)
                          RETURNING r_nextd,r_begin,r_end
                     IF l_stfb.stfb006 = '4' THEN 
                        LET r_nextd = ''
                        LET r_begin = ''
                        LET r_end = ''
                     END IF 
                    #lanjj add on 2016-04-29 start 顾问 刘鑫   清退中的合同 费用单生成限制
                     IF NOT cl_null(l_stfa.stfa024) THEN #清退日期不为空
                        IF (l_stfb.stfb005 = '1' AND l_stfb.stfb007 = '2') OR (l_stfb.stfb005 = '2' AND l_stfb.stfb007 = '2') THEN #变动+期末 或 固定+期末
                           IF l_stfb.stfb015 > l_stfa.stfa024 THEN #将要更新为上次结算日的下次结算日，即本次结算日，若大于结算日期，则把下次结算日，开始、结束日更新为空，下次不生成费用单
                              LET r_nextd = ''
                              LET r_begin = ''
                              LET r_end = ''
                           END IF
                        END IF
                     END IF 
                    #lanjj add on 2016-04-29  end  顾问 刘鑫 
                     UPDATE stfb_t SET stfb015 = r_nextd,
                                       stfb016 = r_begin,
                                       stfb017 = r_end,
                                       stfb021 = l_stfb.stfb015,
                                       stfb022 = l_stfb.stfb016,
                                       stfb023 = l_stfb.stfb017
                      WHERE stfbent = g_enterprise
                        AND stfb001 = l_stfb.stfb001
                        AND stfbseq = l_stfb.stfbseq
                     IF SQLCA.sqlcode THEN
                        INITIALIZE g_errparam TO NULL
                        LET g_errparam.code = SQLCA.sqlcode
                        LET g_errparam.extend = " UPD stfb_t "
                        LET g_errparam.popup = TRUE
                        CALL cl_err()
                        LET l_success = FALSE
                        EXIT WHILE    
                     END IF
                     LET l_stfb.stfb015 = r_nextd
                     LET l_stfb.stfb016 = r_begin
                     LET l_stfb.stfb017 = r_end
                     IF r_nextd > p_date OR cl_null(r_nextd) THEN 
                        EXIT WHILE 
                     ELSE
                        CONTINUE WHILE
                     END IF 
                  END IF 
               END IF 
               IF cl_null(l_stbb009) THEN 
                  LET l_stbb009 = 0
               END IF 
               LET l_stbb009 = l_stbb009*(l_stfb.stfb011/100)*(l_stfb.stfb012/100)
            END IF 
            IF l_stbb009 != 0 THEN 
               #写入费用单---start----
               INITIALIZE l_stbb.* TO NULL
               LET l_stbb.stbbent = g_enterprise      #企业编号
               LET l_stbb.stbbunit = l_stba.stbaunit  #制定组织
               LET l_stbb.stbbsite = l_stba.stbasite  #营运组织
               LET l_stbb.stbbdocno = l_stba.stbadocno#单据编号
               LET l_stbb.stbb001 = l_stfb.stfb002    #费用编号
               LET l_stbb.stbb002 = l_stfa.stfa032    #幣別
               #LET l_stbb.stbb003 = l_stfa.stfa034    #稅別   #mark by geza 20151014
               LET l_stbb.stbb004 = l_stfb.stfb004    #價款類別
               LET l_stbb.stbb010 = '1'               #承擔對象
               LET l_stbb.stbb011 = l_stfa.stfa051    #所屬品類
               LET l_stbb.stbb012 = l_stfa.stfa044    #所屬部門
               LET l_stbb.stbb013 = '1'               #結算對象
               LET l_stbb.stbb015 = l_stfb.stfb018    #納入結算單否
               LET l_stbb.stbb016 = l_stfb.stfb019    #票扣否
               LET l_stbb.stbb017 = ''                #備註
               
               #add by geza 20151014(S)
               #票扣否=Y，税带合同里面的，票扣否=N，税带费用编号asti203里面的
               IF l_stbb.stbb016 = 'Y' THEN
#                  SELECT stfa033 INTO l_stbb.stbb003
#                    FROM stfa_t
#                   WHERE stfaent = g_enterprise
#                     AND stfa005 = l_stba.stba013 #lanjj mark
                  CALL s_astt401_stey004_get(l_stba.stba013,l_stba.stbadocdt) RETURNING l_stbb.stbb003   #lanjj add on 2016-07-28
               ELSE
                  SELECT stae010 INTO l_stbb.stbb003
                    FROM stae_t
                   WHERE staeent = g_enterprise
                     AND stae001 = l_stbb.stbb001
               END IF
               #add by geza 20151014(E)
               
#               #add by geza 20151010(S) #含发票否
#               SELECT stfa050 INTO l_stbb.stbbud001
#                 FROM stfa_t
#                WHERE stfaent = g_enterprise
#                  AND stfa001 = l_stfa.stfa001 
#               #add by geza 20151010(E)
               CALL s_astt401_stey005_get(l_stfa.stfa005,l_stba.stbadocdt) RETURNING l_stbb.stbbud001 #lanjj add on 2016-07-28

               #mark by geza 20150831(S)
#               SELECT stfjseq INTO l_stbb.stbb018     #结算帐期
#                 FROM stfj_t
#                WHERE stfjent = g_enterprise
#                  AND stfj001 = l_stfb.stfb001
#                  AND p_date BETWEEN stfj002 AND stfj003
               #mark by geza 20150831(E)   
               #当费用核算制度为2.权责发生制 写入费用单的开始日期和截止日期，按照自然月以及天数拆分处理
               SELECT stae005 INTO l_stae005
                 FROM stae_t 
                WHERE staeent = g_enterprise
                  AND stae001 = l_stbb.stbb001
               
#               #add by geza 20150831(S)
#               #根据开始日期结束日期抓取结算账期和结算日期
#               CALL s_settle_date_get_stbb019(l_stba.stba010,p_date,p_date,'2') 
#                  RETURNING  l_stbb.stbb018,l_stbb.stbb019  
#               #add by geza 20150831(E)
               
               IF l_stae005 = '2' THEN    
                  CALL s_curr_round(l_stba.stbasite,l_stbb.stbb002,l_stbb009,'2') RETURNING l_stbb009
                  LET l_acount_t = l_stbb009
                  #根据费用开始和截止拆分
                  LET l_begin = ''
                  LET l_end = ''
                  LET l_sum = 0
                  WHILE TRUE
                     #费用下次计算开始日-下次计算截止日
                     CALL s_astm301_cal_nextd('3',l_stfb.stfb007,l_bdate,l_edate,l_begin,l_end,l_stfb.stfb001,'2','Y',l_stfb.stfb003) RETURNING l_nextd,l_begin,l_end
                     IF l_end> = l_edate THEN
                        LET l_end = l_edate
                        LET l_exit = 'Y'   #退出循环标志 'Y' 退出
                     ELSE
                        LET l_exit = 'N'
                     END IF
                     LET l_day = l_end - l_begin+1
                     LET l_stbb.stbb005 = l_begin
                     LET l_stbb.stbb006 = l_end
                   
                     CALL s_asti206_get_period(l_stbb.stbb005,l_stbb.stbb006,l_stba.stba001,"astt510") 
                           RETURNING l_success,l_stbb.stbb007, 
                                     l_year,#会计期年度
                                     l_month #会计期月份
                     LET l_stbb.stbb008 = l_year                
                     LET l_stbb.stbb014 = l_month
                     IF NOT l_success THEN
                        LET l_success = FALSE
                        EXIT WHILE
                     END IF
                     SELECT MAX(stbbseq)+1 INTO l_stbb.stbbseq FROM stbb_t
                      WHERE stbbent = g_enterprise AND stbbdocno = l_stba.stbadocno
                  
                     IF cl_null(l_stbb.stbbseq) THEN
                        LET l_stbb.stbbseq = 1
                     END IF
                     IF l_exit = 'Y' THEN
                        LET l_stbb.stbb009 = l_acount_t -l_sum
                     ELSE 
                        LET l_stbb.stbb009 = l_acount_t/(l_edate - l_bdate+1)*l_day
                        CALL s_curr_round(l_stba.stbasite,l_stbb.stbb002,l_stbb.stbb009,'2') RETURNING l_stbb.stbb009  
                        LET l_sum = l_sum+ l_stbb.stbb009
                     END IF
                     
                     CALL s_settle_date_get_stbb019(l_stba.stba010,l_stbb.stbb005,l_stbb.stbb006,'2')  RETURNING  l_stbb.stbb018,l_stbb.stbb019  #lanjj add on 2016-08-02
                     
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
                        EXIT WHILE
                     END IF
                     LET g_deteal_cnt = g_deteal_cnt + 1
                     IF l_exit = 'Y' THEN     
                        EXIT WHILE
                     END IF
                                  
                  END WHILE
                  IF NOT l_success THEN 
                     EXIT WHILE 
                  END IF 
               ELSE
                  SELECT MAX(stbbseq) + 1 INTO l_stbb.stbbseq
                    FROM stbb_t 
                   WHERE stbbent = g_enterprise
                     AND stbbdocno = l_stba.stbadocno
                  IF cl_null(l_stbb.stbbseq) THEN 
                     LET l_stbb.stbbseq = 1
                  END IF 
                  LET l_stbb.stbb005 = l_bdate           #起始日期
                  LET l_stbb.stbb006 = l_edate           #截止日期
                  CALL s_asti206_get_period(l_stbb.stbb005,l_stbb.stbb006,l_stba.stba001,"astt510") 
                                 RETURNING l_success,l_stbb.stbb007, 
                                           l_year,#会计期年度
                                           l_month #会计期月份
                  LET l_stbb.stbb008 = l_year                
                  LET l_stbb.stbb014 = l_month           #財務會計期別    
                  IF NOT l_success THEN
                     LET l_success = FALSE
                     EXIT WHILE
                  END IF
                  LET l_stbb.stbb009 = l_stbb009         #費用金額
                  CALL s_curr_round(l_stba.stbasite,l_stbb.stbb002,l_stbb.stbb009,'2') RETURNING l_stbb.stbb009
                               
                  CALL s_settle_date_get_stbb019(l_stba.stba010,l_stbb.stbb005,l_stbb.stbb006,'2')  RETURNING  l_stbb.stbb018,l_stbb.stbb019  #lanjj add on 2016-08-02
                     
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
                     EXIT WHILE   
                  END IF
                  LET g_deteal_cnt = g_deteal_cnt + 1
               END IF 
               #写入费用单----end-----
            END IF 
            #更新下次费用计算日、下次费用开始日、下次费用截止日
            CALL s_astm301_cal_nextd(l_stfb.stfb006,l_stfb.stfb007,l_stfb.stfb013,l_stfb.stfb014,l_stfb.stfb016,l_stfb.stfb017,l_stfb.stfb001,'2',l_stfb.stfb020,l_stfb.stfb003)
                 RETURNING r_nextd,r_begin,r_end
            IF l_stfb.stfb006 = '4' THEN 
               LET r_nextd = ''
               LET r_begin = ''
               LET r_end = ''
            END IF
            
           #lanjj add on 2016-04-29 start 顾问 刘鑫   清退中的合同 费用单生成限制
            IF NOT cl_null(l_stfa.stfa024) THEN #清退日期不为空
               IF (l_stfb.stfb005 = '1' AND l_stfb.stfb007 = '2') OR (l_stfb.stfb005 = '2' AND l_stfb.stfb007 = '2') THEN #变动+期末 或 固定+期末
                  IF l_stfb.stfb015 > l_stfa.stfa024 THEN #将要更新为上次结算日的下次结算日，即本次结算日，若大于结算日期，则把下次结算日，开始、结束日更新为空，下次不生成费用单
                     LET r_nextd = ''
                     LET r_begin = ''
                     LET r_end = ''
                  END IF
               END IF
            END IF 
           #lanjj add on 2016-04-29  end  顾问 刘鑫 
            
            UPDATE stfb_t SET stfb015 = r_nextd,
                              stfb016 = r_begin,
                              stfb017 = r_end,
                              stfb021 = l_stfb.stfb015,
                              stfb022 = l_stfb.stfb016,
                              stfb023 = l_stfb.stfb017,
                              stfb024 = l_stbb.stbbdocno,
                              stfb025 = l_stbb.stbbseq
             WHERE stfbent = g_enterprise
               AND stfb001 = l_stfb.stfb001
               AND stfbseq = l_stfb.stfbseq
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = " UPD stfb_t "
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
               EXIT WHILE   
            END IF
            LET l_stfb.stfb015 = r_nextd
            LET l_stfb.stfb016 = r_begin
            LET l_stfb.stfb017 = r_end
            IF r_nextd > p_date OR cl_null(r_nextd) THEN 
               EXIT WHILE  
            END IF 
         END WHILE 
      END FOREACH 
      IF g_deteal_cnt = 0 THEN 
         #删除费用单单头表
         DELETE FROM stba_t WHERE stbaent = g_enterprise AND stbadocno = l_stba.stbadocno
         LET g_cnt = g_cnt - 1
      END IF 
   END FOREACH 
   INITIALIZE l_stfa.* TO NULL
   #产生优惠费用单   
   #160225-00040#18 2016/04/13 s983961--add(s)
   LET l_msg = cl_getmsg('ast-00330',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#18 2016/04/13 s983961--add(e)
   
   FOREACH sel_stfa_cs_2 INTO l_stfa.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = 'foreach:' 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET l_success = FALSE
         EXIT FOREACH
      END IF
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
      LET l_stba.stbasite = l_stfa.stfasite
      LET l_stba.stbaunit = l_stfa.stfasite
      LET l_stba.stbadocdt = p_date
      ##預設單據的單別
      LET r_success = ''
      LET r_doctype = ''
      CALL s_arti200_get_def_doc_type(l_stba.stbaunit,'astt510','1')
           RETURNING r_success,r_doctype
      LET l_stba.stbadocno = r_doctype
      CALL s_aooi200_gen_docno(g_site,l_stba.stbadocno,l_stba.stbadocdt,'astt510') RETURNING r_success,l_stba.stbadocno
      IF NOT r_success THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'apm-00003'
         LET g_errparam.extend = l_stba.stbadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET l_success = FALSE
         EXIT FOREACH              
      END IF 
#      LET l_stba.stba001 = l_stfa.stfa038    #結算中心
      CALL s_astt401_stey006_get(l_stfa.stfa005,l_stba.stbadocdt) RETURNING l_stba.stba001    #lanjj add on 2016-07-28
      CALL s_astt401_stey003_get(l_stfa.stfa005,l_stba.stbadocdt) RETURNING l_stba.stba002    #add by yangxf #供應商編號 
      LET l_stba.stba003 = l_stfa.stfa003    #經營方式
      LET l_stba.stba004 = l_stfa.stfa036    #結算方式
      LET l_stba.stba005 = l_stfa.stfa037    #結算類型
      LET l_stba.stba006 = '2'               #來源類型
      LET l_stba.stba007 = l_stfa.stfa001    #來源單號
      LET l_stba.stba008 = l_stfa.stfa015    #人員
      SELECT ooag003 INTO l_stba.stba009     #部門
        FROM ooag_t
       WHERE ooagent = g_enterprise
         AND ooag001 = l_stba.stba008       
      LET l_stba.stbastus = 'N'              #狀態碼
      LET l_stba.stba010 = l_stfa.stfa001    #合同編號
      LET l_stba.stba011 = l_stfa.stfa032    #幣別
      #LET l_stba.stba012 = l_stfa.stfa034    #稅別 lanjj mark
      CALL s_astt401_stey004_get(l_stfa.stfa005,l_stba.stbadocdt) RETURNING l_stba.stba012 #稅別 lanjj add on 2016-07-28
      LET l_stba.stba013 = l_stfa.stfa005    #專櫃編號
      LET l_stba.stba014 = '2'               #費用類型
      LET l_stba.stba015 = ''                #交款狀態
      LET l_stba.stba016 = ''                #交款人
      LET l_stba.stba000 = 'astt510'         #程式編號
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
      LET g_cnt = g_cnt + 1
      INITIALIZE l_stfi.* TO NULL
      LET g_deteal_cnt = 0
      FOREACH sel_stfi_cs USING l_stfa.stfa001 INTO l_stfi.*
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = 'foreach:' 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
         END IF
         #判断如果对应的费用单的审核码NOT IN(N/R/X)，则提示费用单已审核，不允许重新执行。
         SELECT stbastus INTO l_stbastus
           FROM stba_t
          WHERE stbaent = g_enterprise
            AND stbadocno = l_stfi.stfi011
            AND stbadocdt = p_date
      
         #费用单已审核不可删除重新执行
         IF l_stbastus = 'Y' THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = "ast-00447"
            LET g_errparam.extend = l_stfi.stfi011
            LET g_errparam.popup = TRUE
            CALL cl_err()
            CONTINUE FOREACH 
         ELSE
            #则删除对应的费用单号+项次（删除后判断该单号对应费用单是否还有单身，如果没有则删除单头，否则不删除单头）
            DELETE FROM stbb_t
             WHERE stbbent = g_enterprise
               AND EXISTS(SELECT 1 FROM stba_t WHERE stbaent = stbbent
                                                 AND stbadocno = stbbdocno
                                                 AND stbadocdt = p_date
                                                 AND stbaent = g_enterprise
                                                 AND stbadocno = l_stfi.stfi011)
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = " DEL stfb_t "
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH   
            END IF
            #删除单头
            DELETE FROM stba_t WHERE stbaent = g_enterprise AND stbadocno = l_stfi.stfi011 AND stbadocdt = p_date
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL
               LET g_errparam.code = SQLCA.sqlcode
               LET g_errparam.extend = " DEL stfa_t "
               LET g_errparam.popup = TRUE
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH   
            END IF
         END IF 
      
         LET l_bdate = l_stfi.stfi005      #费用计算开始日期
         LET l_edate = l_stfi.stfi006      #费用计算截止日期
      
         INITIALIZE l_stbb.* TO NULL
         LET l_stbb.stbbent = g_enterprise      #企业编号
         LET l_stbb.stbbunit = l_stba.stbaunit  #制定组织
         LET l_stbb.stbbsite = l_stba.stbasite  #营运组织
         LET l_stbb.stbbdocno = l_stba.stbadocno#单据编号
         LET l_stbb.stbb001 = l_stfi.stfi003    #费用编号
         LET l_stbb.stbb002 = l_stfa.stfa032    #幣別
         SELECT stae006 INTO l_stbb.stbb004     #價款類別
           FROM stae_t 
          WHERE staeent = g_enterprise
            AND stae001 = l_stbb.stbb001
         LET l_stbb.stbb010 = '1'               #承擔對象
         LET l_stbb.stbb011 = l_stfa.stfa051    #所屬品類
         LET l_stbb.stbb012 = l_stfa.stfa044    #所屬部門
         LET l_stbb.stbb013 = '1'               #結算對象
         CALL s_astt401_get_stae007(l_stfa.stfa050,l_stbb.stbb001) RETURNING l_stbb.stbb015,l_stbb.stbb016   #納入結算單否,#票扣否  
         LET l_stbb.stbb017 = ''                #備註
          
         #票扣否=Y，税带合同里面的，票扣否=N，税带费用编号asti203里面的
         IF l_stbb.stbb016 = 'Y' THEN
#            SELECT stfa033 INTO l_stbb.stbb003
#              FROM stfa_t
#             WHERE stfaent = g_enterprise
#               AND stfa005 = l_stba.stba013
         CALL s_astt401_stey004_get(l_stba.stba013,l_stba.stbadocdt) RETURNING l_stbb.stbb003   #lanjj add on 2016-07-28
         ELSE
            SELECT stae010 INTO l_stbb.stbb003
              FROM stae_t
             WHERE staeent = g_enterprise
               AND stae001 = l_stbb.stbb001
         END IF
         LET l_stbb.stbbud001 = l_stfa.stfa050
          
         #当费用核算制度为2.权责发生制 写入费用单的开始日期和截止日期，按照自然月以及天数拆分处理
         SELECT stae005 INTO l_stae005
           FROM stae_t 
          WHERE staeent = g_enterprise
            AND stae001 = l_stbb.stbb001
         
          
         #根据开始日期结束日期抓取结算账期和结算日期
         CALL s_settle_date_get_stbb019(l_stba.stba010,l_stfi.stfi005,l_stfi.stfi006,'2') 
            RETURNING  l_stbb.stbb018,l_stbb.stbb019  
         LET l_stbb009 = l_stfi.stfi004
         IF l_stae005 = '2' THEN    
            CALL s_curr_round(l_stba.stbasite,l_stbb.stbb002,l_stbb009,'2') RETURNING l_stbb009
            LET l_acount_t = l_stbb009
            #根据费用开始和截止拆分
            LET l_begin = ''
            LET l_end = ''
            LET l_sum = 0
            WHILE TRUE
               #费用下次计算开始日-下次计算截止日
               CALL s_astm301_cal_nextd('3','1',l_bdate,l_edate,l_begin,l_end,l_stfi.stfi001,'2','Y','') RETURNING l_nextd,l_begin,l_end
               IF l_end> = l_edate THEN
                  LET l_end = l_edate
                  LET l_exit = 'Y'   #退出循环标志 'Y' 退出
               ELSE
                  LET l_exit = 'N'
               END IF
               LET l_day = l_end - l_begin+1
               LET l_stbb.stbb005 = l_begin
               LET l_stbb.stbb006 = l_end
             
               CALL s_asti206_get_period(l_stbb.stbb005,l_stbb.stbb006,l_stba.stba001,"astt510") 
                     RETURNING l_success,l_stbb.stbb007, 
                               l_year,#会计期年度
                               l_month #会计期月份
               LET l_stbb.stbb008 = l_year                
               LET l_stbb.stbb014 = l_month
               IF NOT l_success THEN
                  LET l_success = FALSE
                  EXIT FOREACH
               END IF
               SELECT MAX(stbbseq)+1 INTO l_stbb.stbbseq FROM stbb_t
                WHERE stbbent = g_enterprise AND stbbdocno = l_stba.stbadocno
            
               IF cl_null(l_stbb.stbbseq) THEN
                  LET l_stbb.stbbseq = 1
               END IF
               IF l_exit = 'Y' THEN
                  LET l_stbb.stbb009 = l_acount_t -l_sum
               ELSE 
                  LET l_stbb.stbb009 = l_acount_t/(l_edate - l_bdate+1)*l_day
                  CALL s_curr_round(l_stba.stbasite,l_stbb.stbb002,l_stbb.stbb009,'2') RETURNING l_stbb.stbb009  
                  LET l_sum = l_sum+ l_stbb.stbb009
               END IF
               
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
                  EXIT WHILE
               END IF
               LET g_deteal_cnt = g_deteal_cnt + 1
               IF l_exit = 'Y' THEN     
                  EXIT WHILE
               END IF
                            
            END WHILE
            IF NOT l_success THEN 
               EXIT FOREACH 
            END IF 
         ELSE
            SELECT MAX(stbbseq) + 1 INTO l_stbb.stbbseq
              FROM stbb_t 
             WHERE stbbent = g_enterprise
               AND stbbdocno = l_stba.stbadocno
            IF cl_null(l_stbb.stbbseq) THEN 
               LET l_stbb.stbbseq = 1
            END IF 
            LET l_stbb.stbb005 = l_bdate           #起始日期
            LET l_stbb.stbb006 = l_edate           #截止日期
            CALL s_asti206_get_period(l_stbb.stbb005,l_stbb.stbb006,l_stba.stba001,"astt510") 
                           RETURNING l_success,l_stbb.stbb007, 
                                     l_year,#会计期年度
                                     l_month #会计期月份
            LET l_stbb.stbb008 = l_year                
            LET l_stbb.stbb014 = l_month           #財務會計期別    
            IF NOT l_success THEN
               LET l_success = FALSE
               EXIT FOREACH
            END IF
            LET l_stbb.stbb009 = l_stbb009         #費用金額
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
            LET g_deteal_cnt = g_deteal_cnt + 1
         END IF   
         UPDATE stfi_t SET stfi011 = l_stbb.stbbdocno,
                           stfi012 = l_stbb.stbbseq
          WHERE stfient = g_enterprise
            AND stfi001 = l_stfi.stfi001
            AND stfiseq = l_stfi.stfiseq
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = " UPD stfi_t "
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH   
         END IF
      END FOREACH 
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

#end add-point
 
{</section>}
 
