#該程式未解開Section, 採用最新樣板產出!
{<section id="astp404.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0003(2015-12-23 17:11:10), PR版次:0003(2016-11-15 13:49:57)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000037
#+ Filename...: astp404
#+ Description: 專櫃合約補差計算批次作業
#+ Creator....: 02003(2015-09-28 15:28:42)
#+ Modifier...: 02003 -SD/PR- 02481
 
{</section>}
 
{<section id="astp404.global" >}
#應用 p01 樣板自動產生(Version:19)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#Memos
#161024-00025#9   2016/10/27   by 08742     组织开窗调整
#161111-00028#3   2016/11/15   by 02481     标准程式定义采用宣告模式,弃用.*写法
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
   steb021              LIKE steb_t.steb021,
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
       steasite LIKE type_t.chr500, 
   mhae001 LIKE type_t.chr20, 
   pmaa001 LIKE type_t.chr10, 
   stfa054_2 LIKE type_t.chr1, 
   bdate LIKE type_t.dat, 
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
 
{<section id="astp404.main" >}
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
      CALL astp404_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp404 WITH FORM cl_ap_formpath("ast",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL astp404_init()
 
      #進入選單 Menu (="N")
      CALL astp404_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp404
   END IF
 
   #add-point:作業離開前 name="main.exit"
   CALL s_aooi500_drop_temp() RETURNING l_success
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp404.init" >}
#+ 初始化作業
PRIVATE FUNCTION astp404_init()
 
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
   CALL cl_set_combo_scc("stfa054_2","6870")
   CALL s_aooi500_create_temp() RETURNING l_success
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp404.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp404_ui_dialog()
 
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
   LET g_master.stfa054_2 = '1'
   LET g_master.bdate = g_today
   DISPLAY BY NAME g_master.stfa054_2,g_master.bdate
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.stfa054_2,g_master.bdate 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               
               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stfa054_2
            #add-point:BEFORE FIELD stfa054_2 name="input.b.stfa054_2"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stfa054_2
            
            #add-point:AFTER FIELD stfa054_2 name="input.a.stfa054_2"
            
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stfa054_2
            #add-point:ON CHANGE stfa054_2 name="input.g.stfa054_2"
            
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
 
 
 
                     #Ctrlp:input.c.stfa054_2
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stfa054_2
            #add-point:ON ACTION controlp INFIELD stfa054_2 name="input.c.stfa054_2"
            
            #END add-point
 
 
         #Ctrlp:input.c.bdate
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD bdate
            #add-point:ON ACTION controlp INFIELD bdate name="input.c.bdate"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON steasite,mhae001,pmaa001
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.steasite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steasite
            #add-point:ON ACTION controlp INFIELD steasite name="construct.c.steasite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #LET g_qryparam.where = s_aooi500_q_where(g_prog,'steasite',g_stea_m.steasite,'c')    #161024-00025#11   2016/10/27  by 08742 add
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO steasite  #顯示到畫面上
            NEXT FIELD steasite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steasite
            #add-point:BEFORE FIELD steasite name="construct.b.steasite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steasite
            
            #add-point:AFTER FIELD steasite name="construct.a.steasite"
            
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
            CALL astp404_get_buffer(l_dialog)
            #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog3"
            NEXT FIELD steasite
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
         CALL astp404_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF NOT cl_schedule_exec_check() THEN
         CONTINUE WHILE
      END IF
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog name="process.exit_dialog"
      LET lc_param.steb021 = g_master.bdate
      LET lc_param.sel = g_master.stfa054_2
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
                 CALL astp404_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = astp404_transfer_argv(ls_js)
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
 
{<section id="astp404.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION astp404_transfer_argv(ls_js)
 
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
 
{<section id="astp404.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION astp404_process(ls_js)
 
   #add-point:process段define (客製用) name="process.define_customerization"
   
   #end add-point
   DEFINE ls_js         STRING
   DEFINE lc_param      type_parameter
   DEFINE li_stus       LIKE type_t.num5
   DEFINE li_count      LIKE type_t.num10  #progressbar計量
   DEFINE ls_sql        STRING             #主SQL
   DEFINE li_p01_status LIKE type_t.num5
   #add-point:process段define name="process.define"
   DEFINE l_success     LIKE type_t.num5
   DEFINE l_msg         STRING           #160225-00040#16 20160328 add by beckxie
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
      CALL cl_progress_bar_no_window(2)   #160225-00040#17 20160328 add by beckxie
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE astp404_process_cs CURSOR FROM ls_sql
#  FOREACH astp404_process_cs INTO
   #add-point:process段process name="process.process"
   IF cl_null(lc_param.steb021) THEN 
      LET lc_param.steb021 = g_today-1                                  
   END IF
   #160225-00040#17 20160328 add by beckxie---S
   LET l_msg = cl_getmsg('ast-00330',g_lang)
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#17 20160328 add by beckxie---E
   IF lc_param.sel != '3' THEN 
      IF NOT astp404_process_1(lc_param.wc,lc_param.steb021,lc_param.sel) THEN 
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
   ELSE
      LET l_success = TRUE
      IF NOT astp404_process_1(lc_param.wc,lc_param.steb021,'1') THEN 
         LET l_success = FALSE
      END IF
      IF NOT astp404_process_1(lc_param.wc,lc_param.steb021,'2') THEN 
         LET l_success = FALSE
      END IF
      IF NOT l_success THEN 
         LET g_errparam.code = 'adz-00218'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END IF 
   END IF 
   #160225-00040#17 20160328 add by beckxie---S
   LET l_msg = cl_getmsg('std-00012',g_lang)
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#17 20160328 add by beckxie---E
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
   CALL astp404_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp404.get_buffer" >}
PRIVATE FUNCTION astp404_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.stfa054_2 = p_dialog.getFieldBuffer('stfa054_2')
   LET g_master.bdate = p_dialog.getFieldBuffer('bdate')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astp404.msgcentre_notify" >}
PRIVATE FUNCTION astp404_msgcentre_notify()
 
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
 
{<section id="astp404.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: 批次处理
# Memo...........:
# Usage..........: CALL astp404_process_1(p_wc,p_date,p_type)
# Input parameter: p_wc     查询条件
# Return code....: p_date   执行日期
#                : p_type   补差类型 1.费用补差  2.成本补差
# Date & Author..: 2015/08/01 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp404_process_1(p_wc,p_date,p_type)
DEFINE p_wc        STRING 
DEFINE p_date      LIKE steb_t.steb021
DEFINE p_type      LIKE type_t.chr1
DEFINE l_sql       STRING 
#161111-00028#3--modify----begin----------
#DEFINE l_steb      RECORD LIKE steb_t.*
#DEFINE l_stea      RECORD LIKE stea_t.*
#DEFINE l_stec      RECORD LIKE stec_t.*
#DEFINE l_stba      RECORD LIKE stba_t.*
#DEFINE l_stbb      RECORD LIKE stbb_t.*
DEFINE l_stec RECORD  #專櫃合約庫區費用申請設定檔
       stecent LIKE stec_t.stecent, #企業編號
       stecsite LIKE stec_t.stecsite, #營運據點
       stecunit LIKE stec_t.stecunit, #應用組織
       stecdocno LIKE stec_t.stecdocno, #單據編號
       stecseq LIKE stec_t.stecseq, #項次
       stec001 LIKE stec_t.stec001, #合約編號
       stec002 LIKE stec_t.stec002, #庫區編號
       stec003 LIKE stec_t.stec003, #庫區名稱
       stec004 LIKE stec_t.stec004, #經營小類
       stec005 LIKE stec_t.stec005, #經營品牌
       stec006 LIKE stec_t.stec006, #進項稅
       stec007 LIKE stec_t.stec007, #銷項稅
       stec008 LIKE stec_t.stec008, #消費稅率
       stec009 LIKE stec_t.stec009, #費用編號
       stec010 LIKE stec_t.stec010, #會計期間
       stec011 LIKE stec_t.stec011, #價款類別
       stec012 LIKE stec_t.stec012, #計算類型
       stec013 LIKE stec_t.stec013, #費用週期
       stec014 LIKE stec_t.stec014, #費用週期方式
       stec015 LIKE stec_t.stec015, #條件基準
       stec016 LIKE stec_t.stec016, #計算基準
       stec017 LIKE stec_t.stec017, #費用淨額
       stec018 LIKE stec_t.stec018, #費用比率
       stec019 LIKE stec_t.stec019, #生效日期
       stec020 LIKE stec_t.stec020, #失效日期
       stec021 LIKE stec_t.stec021, #下次計算日
       stec022 LIKE stec_t.stec022, #下次費用開始日
       stec023 LIKE stec_t.stec023, #下次費用截止日
       stec024 LIKE stec_t.stec024, #庫區用途分類
       stec025 LIKE stec_t.stec025, #對應常規庫區編號
       stec026 LIKE stec_t.stec026, #納入結算單否
       stec027 LIKE stec_t.stec027, #票扣否
       stecacti LIKE stec_t.stecacti #有效
       END RECORD
DEFINE l_steb RECORD  #專櫃合約費用申請設定檔
       stebent LIKE steb_t.stebent, #企業編號
       stebsite LIKE steb_t.stebsite, #營運據點
       stebunit LIKE steb_t.stebunit, #應用組織
       stebdocno LIKE steb_t.stebdocno, #單據編號
       stebseq LIKE steb_t.stebseq, #項次
       steb001 LIKE steb_t.steb001, #合約編號
       steb002 LIKE steb_t.steb002, #費用編號
       steb003 LIKE steb_t.steb003, #會計期間
       steb004 LIKE steb_t.steb004, #價款類別
       steb005 LIKE steb_t.steb005, #計算類型
       steb006 LIKE steb_t.steb006, #費用週期
       steb007 LIKE steb_t.steb007, #費用週期方式
       steb008 LIKE steb_t.steb008, #條件基準
       steb009 LIKE steb_t.steb009, #計算基準
       steb010 LIKE steb_t.steb010, #費用淨額
       steb011 LIKE steb_t.steb011, #費用比率
       steb012 LIKE steb_t.steb012, #供應商承擔比率
       steb013 LIKE steb_t.steb013, #生效日期
       steb014 LIKE steb_t.steb014, #失效日期
       steb015 LIKE steb_t.steb015, #下次計算日
       steb016 LIKE steb_t.steb016, #下次費用開始日
       steb017 LIKE steb_t.steb017, #下次費用截止日
       steb018 LIKE steb_t.steb018, #納入結算單否
       steb019 LIKE steb_t.steb019, #票扣否
       steb020 LIKE steb_t.steb020, #按自然月計費否
       steb021 LIKE steb_t.steb021, #上次計算日期
       steb022 LIKE steb_t.steb022, #上次費用開始日期
       steb023 LIKE steb_t.steb023, #上次費用結束日期
       steb024 LIKE steb_t.steb024, #費用單號
       steb025 LIKE steb_t.steb025, #費用項次
       steb026 LIKE steb_t.steb026  #有效
       END RECORD
DEFINE l_stea RECORD  #專櫃合約申請主檔
       steaent LIKE stea_t.steaent, #企業編號
       steasite LIKE stea_t.steasite, #申請組織
       steaunit LIKE stea_t.steaunit, #制定組織
       steadocdt LIKE stea_t.steadocdt, #單據日期
       steaacti LIKE stea_t.steaacti, #合約有效
       steadocno LIKE stea_t.steadocno, #單據編號
       stea000 LIKE stea_t.stea000, #作業方式
       stea001 LIKE stea_t.stea001, #合約編號
       stea002 LIKE stea_t.stea002, #版本
       stea003 LIKE stea_t.stea003, #經營方式
       stea004 LIKE stea_t.stea004, #合約類別
       stea005 LIKE stea_t.stea005, #专柜编号
       stea006 LIKE stea_t.stea006, #專櫃類型
       stea007 LIKE stea_t.stea007, #建築面積
       stea008 LIKE stea_t.stea008, #經營面積
       stea009 LIKE stea_t.stea009, #檔案編號
       stea010 LIKE stea_t.stea010, #供應商編號
       stea011 LIKE stea_t.stea011, #主品類
       stea012 LIKE stea_t.stea012, #主品牌
       stea013 LIKE stea_t.stea013, #模板編號
       stea014 LIKE stea_t.stea014, #簽訂法人
       stea015 LIKE stea_t.stea015, #簽訂人員
       stea016 LIKE stea_t.stea016, #簽訂日期
       stea017 LIKE stea_t.stea017, #進場日期
       stea018 LIKE stea_t.stea018, #撤場日期
       stea019 LIKE stea_t.stea019, #生效日期
       stea020 LIKE stea_t.stea020, #失效日期
       stea021 LIKE stea_t.stea021, #作廢日期
       stea022 LIKE stea_t.stea022, #甲方日期
       stea023 LIKE stea_t.stea023, #乙方日期
       stea024 LIKE stea_t.stea024, #清退日期
       stea025 LIKE stea_t.stea025, #延期日期
       stea026 LIKE stea_t.stea026, #蓋章日期
       stea027 LIKE stea_t.stea027, #文字蓋章否
       stea028 LIKE stea_t.stea028, #按天產生銷售成本
       stea029 LIKE stea_t.stea029, #收銀方式
       stea030 LIKE stea_t.stea030, #定價屬性
       stea031 LIKE stea_t.stea031, #專櫃ABC
       stea032 LIKE stea_t.stea032, #幣別
       stea033 LIKE stea_t.stea033, #進項稅
       stea034 LIKE stea_t.stea034, #銷項稅
       stea035 LIKE stea_t.stea035, #付款方式
       stea036 LIKE stea_t.stea036, #結算方式
       stea037 LIKE stea_t.stea037, #結算類別
       stea038 LIKE stea_t.stea038, #結算中心
       stea039 LIKE stea_t.stea039, #基本提成率
       stea040 LIKE stea_t.stea040, #增值稅扣率
       stea041 LIKE stea_t.stea041, #合約摘要
       stea042 LIKE stea_t.stea042, #經營範圍說明
       stea043 LIKE stea_t.stea043, #備註
       stea044 LIKE stea_t.stea044, #所屬部門
       stea045 LIKE stea_t.stea045, #管理方式
       stea046 LIKE stea_t.stea046, #業態
       stea047 LIKE stea_t.stea047, #樓棟
       stea048 LIKE stea_t.stea048, #樓層
       stea049 LIKE stea_t.stea049, #續簽日期
       steaownid LIKE stea_t.steaownid, #資料所屬者
       steaowndp LIKE stea_t.steaowndp, #資料所有部門
       steacrtid LIKE stea_t.steacrtid, #資料建立者
       steacrtdp LIKE stea_t.steacrtdp, #資料建立部門
       steacrtdt LIKE stea_t.steacrtdt, #資料創建日
       steamodid LIKE stea_t.steamodid, #資料修改者
       steamoddt LIKE stea_t.steamoddt, #最近修改日
       steastus LIKE stea_t.steastus, #狀態碼
       steacnfid LIKE stea_t.steacnfid, #資料確認者
       steacnfdt LIKE stea_t.steacnfdt, #資料確認日
       stea050 LIKE stea_t.stea050, #代扣代繳稅否
       stea051 LIKE stea_t.stea051, #管理品類
       stea052 LIKE stea_t.stea052, #最低折扣率
       stea053 LIKE stea_t.stea053, #促銷庫區參與保底否
       stea054 LIKE stea_t.stea054, #執行日期
       stea055 LIKE stea_t.stea055, #是否補差
       stea056 LIKE stea_t.stea056, #庫區商品化否
       stea057 LIKE stea_t.stea057  #工衣情況
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
DEFINE l_bdate_t   LIKE type_t.dat
DEFINE l_edate_t   LIKE type_t.dat
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
DEFINE l_stbb009_sum    LIKE stbb_t.stbb009
DEFINE l_stbb009_t LIKE stbb_t.stbb009
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
DEFINE l_stga008_old    LIKE stga_t.stga008
DEFINE l_stga009_old    LIKE stga_t.stga009
DEFINE l_stga012_old    LIKE stga_t.stga012
DEFINE l_stga012_new    LIKE stga_t.stga012
DEFINE l_stga012        LIKE stga_t.stga012
DEFINE l_where           STRING     #161024-00025#11   2016/10/27  by 08742 


   WHENEVER ERROR CONTINUE
   
   #161024-00025#11   2016/10/27  by 08742  -S
   LET l_where = ''
   CALL s_aooi500_sql_where(g_prog,'steasite') RETURNING l_where
   LET p_wc = p_wc," AND ",l_where
   #161024-00025#11   2016/10/27  by 08742   -E
   
   CALL s_transaction_begin()
   CALL cl_err_collect_init()
   LET l_bdate = ''
   LET l_edate = ''
   LET l_bdate_t = ''
   LET l_edate_t = ''
   LET l_success = TRUE
   IF cl_null(p_wc) THEN 
      LET p_wc = " 1=1"
   END IF
   INITIALIZE l_stea.* TO NULL
   #抓取需要补差的合同资料
   #LET l_sql = " SELECT DISTINCT stea_t.* FROM stea_t ",  #161111-00028#3--mark
   #161111-00028#3----add----begin-------
   LET l_sql = " SELECT DISTINCT steaent,steasite,steaunit,steadocdt,steaacti,steadocno,stea000,stea001,",
               "stea002,stea003,stea004,stea005,stea006,stea007,stea008,stea009,stea010,stea011,stea012,stea013,",
               "stea014,stea015,stea016,stea017,stea018,stea019,stea020,stea021,stea022,stea023,stea024,stea025,",
               "stea026,stea027,stea028,stea029,stea030,stea031,stea032,stea033,stea034,stea035,stea036,stea037,",
               "stea038,stea039,stea040,stea041,stea042,stea043,stea044,stea045,stea046,stea047,stea048,stea049,",
               "steaownid,steaowndp,steacrtid,steacrtdp,steacrtdt,steamodid,steamoddt,steastus,steacnfid,steacnfdt,",
               "stea050,stea051,stea052,stea053,stea054,stea055,stea056,stea057 FROM stea_t ",
   #161111-00028#3----add----end---------
               "   LEFT JOIN pmaa_t ON pmaaent = steaent AND pmaa001 = stea010 ",
               "   LEFT JOIN mhae_t ON mhaeent = steaent AND mhae001 = stea005 AND mhaesite = steasite ",
               "  WHERE steaent = ",g_enterprise,
               "    AND stea054 = '",p_date,"'",
               "    AND stea000 = 'R' ",
               "    AND stea055 = 'Y' ",
               "    AND steastus = 'Y' ",
               "    AND ",p_wc
   PREPARE sel_stea FROM l_sql
   DECLARE sel_stea_cs CURSOR FOR sel_stea
   #费用补差明细
  #LET l_sql = " SELECT * FROM steb_t ",  #161111-00028#3--mark
  #161111-00028#3----add----begin---------
   LET l_sql = " SELECT stebent,stebsite,stebunit,stebdocno,stebseq,steb001,steb002,steb003,steb004,",
               "steb005,steb006,steb007,steb008,steb009,steb010,steb011,steb012,steb013,steb014,steb015,",
               "steb016,steb017,steb018,steb019,steb020,steb021,steb022,steb023,steb024,steb025,steb026 FROM steb_t ",
  #161111-00028#3----add----end---------
               "  WHERE stebent = ",g_enterprise,
               "    AND stebdocno = ? ",
               "    AND steb023 >= ? ",
               "    AND steb026 = 'Y' "
   PREPARE sel_steb FROM l_sql
   DECLARE sel_steb_cs CURSOR FOR sel_steb
   #成本补差明细
  #LET l_sql = " SELECT * FROM stec_t ",  #161111-00028#3--mark
  #161111-00028#3----add----begin---------
   LET l_sql = " SELECT stecent,stecsite,stecunit,stecdocno,stecseq,stec001,stec002,stec003,stec004,stec005,",
               "stec006,stec007,stec008,stec009,stec010,stec011,stec012,stec013,stec014,stec015,stec016,stec017,",
               "stec018,stec019,stec020,stec021,stec022,stec023,stec024,stec025,stec026,stec027,stecacti FROM stec_t ",
  #161111-00028#3----add----end---------
               "  WHERE stecent = ",g_enterprise,
               "    AND stecdocno = ? ",
               "    AND stecacti = 'Y' ",
               "    AND stec024 IN('1','3')"
   PREPARE sel_stec FROM l_sql
   DECLARE sel_stec_cs CURSOR FOR sel_stec
   LET g_cnt = 0
   FOREACH sel_stea_cs INTO l_stea.*
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
      LET l_stba.stbasite = l_stea.steasite
      LET l_stba.stbaunit = l_stea.steasite
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
      LET l_stba.stba001 = l_stea.stea038    #結算中心
      LET l_stba.stba002 = l_stea.stea010    #供應商編號
      LET l_stba.stba003 = l_stea.stea003    #經營方式
      LET l_stba.stba004 = l_stea.stea036    #結算方式
      LET l_stba.stba005 = l_stea.stea037    #結算類型
      LET l_stba.stba006 = '2'               #來源類型
      LET l_stba.stba007 = l_stea.stea001    #來源單號
      LET l_stba.stba008 = l_stea.stea015    #人員
      SELECT ooag003 INTO l_stba.stba009     #部門
        FROM ooag_t
       WHERE ooagent = g_enterprise
         AND ooag001 = l_stba.stba008       
      LET l_stba.stbastus = 'N'              #狀態碼
      LET l_stba.stba010 = l_stea.stea001    #合同編號
      LET l_stba.stba011 = l_stea.stea032    #幣別
      LET l_stba.stba012 = l_stea.stea034    #稅別
      LET l_stba.stba013 = l_stea.stea005    #專櫃編號
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
      #费用补差
      IF p_type = '1' THEN 
         INITIALIZE l_steb.* TO NULL
         LET g_deteal_cnt = 0
         FOREACH sel_steb_cs USING l_stea.steadocno,l_stea.stea049 INTO l_steb.*
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'foreach:' 
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH
            END IF
             
            #上次费用开始日期>续签日期
            IF l_steb.steb022 > l_stea.stea049 THEN 
               #计算补差日期范围：续签日期~上次费用截止日期
               #费用计算方式：   (上次开始日期~上次截止日期之间的费用)/N天*(截止日期-续签日期)-(续签日期~截止日期费用单费用)
               #重新计算续签日期所在月份的开始和结束日期
               CALL astp404_get_date(l_steb.steb022,l_steb.steb023,l_stea.stea049,l_steb.steb006,l_steb.steb020,l_stea.stea001)
                    RETURNING l_bdate_t,l_edate_t
               IF cl_null(l_bdate_t) OR cl_null(l_edate_t) THEN 
                  EXIT FOREACH 
               END IF 
               LET l_bdate = l_stea.stea049    #续签日期
               LET l_edate = l_edate_t         #截止日期
            ELSE
               #计算补差日期范围：续签日期~上次费用截止日期
               LET l_bdate_t = l_steb.steb022
               LET l_edate_t = l_steb.steb023
               LET l_bdate = l_stea.stea049    #续签日期
               LET l_edate = l_steb.steb023
            END IF 
            WHILE TRUE
               IF l_bdate > l_steb.steb023 OR cl_null(l_bdate) THEN 
                  EXIT WHILE 
               END IF 
               CALL cl_get_para(g_enterprise,l_stea.steasite,'S-CIR-2003') RETURNING l_sys
               #开始日期按进场日期算
               IF l_sys = '1' THEN
                  IF NOT cl_null(l_stea.stea017) THEN 
                     #费用开始日期<进场日期<费用截止日赋值。则费用开始日期 = 进场日期      
                     IF l_bdate < l_stea.stea017 AND l_stea.stea017 < l_edate THEN 
                        LET l_bdate = l_stea.stea017
                     END IF 
                  END IF 
               END IF 
               #清退日期不为空且为本月，则结束日期给清退日期
               IF NOT cl_null(l_stea.stea024) THEN 
                  IF YEAR(l_stea.stea024) = YEAR(l_edate) AND MONTH(l_stea.stea024) = MONTH(l_edate) THEN 
                     LET l_edate = l_stea.stea024
                  END IF 
               END IF 
               #费用类型为"固定"
               IF l_steb.steb005 = '2' THEN 
                  CASE l_steb.steb006
                       #年
                       WHEN '1'
                           #按自然月计费
                           IF l_steb.steb020 = 'Y' THEN 
                              LET l_year = YEAR(l_bdate)
                              #获取当前年份第一天
                              LET l_first = MDY(1,1,l_year)
                              #获取当前年份最后一天
                              LET l_last = MDY(12,31,l_year)
                              #费用 = 一年的费用/一年的天数*费用天数*供应商承担比例
                              LET l_stbb009 = l_steb.steb010/(l_last-l_first+1)*(l_edate-l_bdate+1)*(l_steb.steb012/100)
                           ELSE
                              #费用 = 一年的费用/(下次费用截止日期-下次费用开始日期)*费用天数*供应商承担比例
                              LET l_stbb009 = l_steb.steb010/(l_edate_t-l_bdate_t+1)*(l_edate-l_bdate+1)*(l_steb.steb012/100)
                           END IF 
                       #季
                       WHEN '2'
                           #按自然月计费
                           IF l_steb.steb020 = 'Y' THEN 
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
                              LET l_stbb009 = l_steb.steb010/(l_last-l_first+1)*(l_edate-l_bdate+1)*(l_steb.steb012/100)
                           ELSE
                              #费用 = 一季度费用/(下次费用截止日期-下次费用开始日期)*费用天数*供应商承担比例
                              LET l_stbb009 = l_steb.steb010/(l_edate_t-l_bdate_t+1)*(l_edate-l_bdate+1)*(l_steb.steb012/100)
                           END IF 
                       #月
                       WHEN '3'
                           #按自然月计费
                           IF l_steb.steb020 = 'Y' THEN 
                              #获取当前月第一天
                              CALL s_date_get_first_date(l_bdate) RETURNING l_first
                              #获取当月最后一天
                              CALL s_date_get_last_date(l_bdate) RETURNING l_last
                              #费用 = 一月的费用/一年的天数*费用天数*供应商承担比例
                              LET l_stbb009 = l_steb.steb010/(l_last-l_first+1)*(l_edate-l_bdate+1)*(l_steb.steb012/100)
                           ELSE
                              #费用 = 一月的费用/(下次费用截止日期-下次费用开始日期)*费用天数*供应商承担比例
                              LET l_stbb009 = l_steb.steb010/(l_edate_t-l_bdate_t+1)*(l_edate-l_bdate+1)*(l_steb.steb012/100)
                           END IF 
                       #单次
                       WHEN '4'
                           LET l_stbb009 = l_steb.steb010*(l_steb.steb012/100)
                           
                       #按结算帐期
                       WHEN '5'
                           #费用 = 一结算帐期的费用/(下次费用截止日期-下次费用开始日期)*费用天数*供应商承担比例
                           LET l_stbb009 = l_steb.steb010/(l_edate_t-l_bdate_t+1)*(l_edate-l_bdate+1)*(l_steb.steb012/100)
                           
                       OTHERWISE 
                          CONTINUE FOREACH 
                  END CASE 
               #变动费用
               ELSE
                  #条件基准
                  IF NOT cl_null(l_steb.steb008) THEN 
                     #计算条件基准
                     SELECT stab008,stab009,stab010,stab013
                       INTO l_stab008_2,l_stab009_2,l_stab010_2,l_stab013_2
                       FROM stab_t
                      WHERE stabent = g_enterprise
                        AND stab001 = l_steb.steb008
                     #取原价金额
                     IF l_stab008_2 = 'Y' AND l_stab009_2 ='Y'  AND l_stab010_2 = 'Y' THEN 
                        SELECT COALESCE(SUM(debg013),0) INTO l_stbb009_2
                          FROM debg_t
                         WHERE debgent = g_enterprise
                           AND debgsite = l_stea.steasite
                           AND debg005 = l_stea.stea005
                           AND debg002 BETWEEN l_bdate AND l_edate 
                           AND debg027 != '5'     #160420-00008#1 Add By Ken 160429加上經營方式不等於租賃
                     END IF 
                     #实收金额
                     IF l_stab008_2 = 'Y' AND l_stab009_2 ='Y'  AND l_stab010_2 = 'N' THEN 
                        SELECT COALESCE(SUM(debg017),0) INTO l_stbb009_2
                          FROM debg_t
                         WHERE debgent = g_enterprise
                           AND debgsite = l_stea.steasite
                           AND debg005 = l_stea.stea005
                           AND debg002 BETWEEN l_bdate AND l_edate 
                           AND debg027 != '5'     #160420-00008#1 Add By Ken 160429加上經營方式不等於租賃
                     END IF
                     IF l_stab013_2 = 'Y' THEN 
                        SELECT COALESCE(SUM(debb030),0) INTO l_stbb009_2
                          FROM debb_t 
                         WHERE debbent = g_enterprise
                           AND debb017 = l_stea.stea005
                           AND debb002 BETWEEN l_bdate AND l_edate
                     END IF 
                     #条件基准不满足条件则更新下次计算日、下次费用开始日期，下次费用结束日期
                     IF l_stbb009_2 < l_steb.steb010 THEN 
                        #更新下次费用计算日、下次费用开始日、下次费用截止日
                        CALL s_astm301_cal_nextd(l_steb.steb006,l_steb.steb007,l_steb.steb013,l_steb.steb014,l_bdate_t,l_edate_t,l_steb.steb001,'2',l_steb.steb020,l_steb.steb003)
                             RETURNING r_nextd,l_bdate_t,l_edate_t
                        CONTINUE FOREACH 
                     END IF 
                  END IF 
                  #计算基准条件
                  SELECT stab008,stab009,stab010,stab013
                    INTO l_stab008,l_stab009,l_stab010,l_stab013
                    FROM stab_t
                   WHERE stabent = g_enterprise
                     AND stab001 = l_steb.steb009
                  #取原价金额
                  IF l_stab008 = 'Y' AND l_stab009 ='Y'  AND l_stab010 = 'Y' THEN 
                     SELECT COALESCE(SUM(debg013),0) INTO l_stbb009
                       FROM debg_t
                      WHERE debgent = g_enterprise
                        AND debgsite = l_stea.steasite
                        AND debg005 = l_stea.stea005
                        AND debg002 BETWEEN l_bdate AND l_edate 
                        AND debg027 != '5'     #160420-00008#1 Add By Ken 160429加上經營方式不等於租賃
                  END IF 
                  #实收金额
                  IF l_stab008 = 'Y' AND l_stab009 ='Y'  AND l_stab010 = 'N' THEN 
                     SELECT COALESCE(SUM(debg017),0) INTO l_stbb009
                       FROM debg_t
                      WHERE debgent = g_enterprise
                        AND debgsite = l_stea.steasite
                        AND debg005 = l_stea.stea005
                        AND debg002 BETWEEN l_bdate AND l_edate 
                        AND debg027 != '5'     #160420-00008#1 Add By Ken 160429加上經營方式不等於租賃
                  END IF 
                  IF l_stab013 = 'Y' THEN 
                     SELECT COALESCE(SUM(debb030),0) INTO l_stbb009
                       FROM debb_t 
                      WHERE debbent = g_enterprise
                        AND debb017 = l_stea.stea005
                        AND debb002 BETWEEN l_bdate AND l_edate
                  END IF 
                  IF cl_null(l_stbb009) THEN 
                     LET l_stbb009 = 0
                  END IF 
                  LET l_stbb009 = l_stbb009*(l_steb.steb011/100)*(l_steb.steb012/100)
               END IF 
               #此日期区间费用单中的费用
               SELECT SUM(stbb009) INTO l_stbb009_t
                 FROM stbb_t,stba_t
                WHERE stbbent = g_enterprise
                  AND stbbent = stbaent
                  AND stbbdocno = stbadocno
                  AND stba010 = l_stea.stea001
                  AND stbb001 = l_steb.steb002
                  AND stbb005 >= l_bdate_t
                  AND stbb006 <= l_edate_t
               IF cl_null(l_stbb009_t) THEN 
                  LET l_stbb009_t = 0
               END IF
               #续签日期-截止日期之间的费用
               LET l_stbb009_t = l_stbb009_t/(l_edate_t-l_bdate_t+1)*(l_edate-l_bdate+1)
               CALL s_curr_round(l_stba.stbasite,l_stea.stea032,l_stbb009,'2') RETURNING l_stbb009
               CALL s_curr_round(l_stba.stbasite,l_stea.stea032,l_stbb009_t,'2') RETURNING l_stbb009_t
               #补差金额                  
               IF l_stbb009 - l_stbb009_t <> 0 THEN 
                  #写入费用单---start----
                  INITIALIZE l_stbb.* TO NULL
                  LET l_stbb.stbbent = g_enterprise      #企业编号
                  LET l_stbb.stbbunit = l_stba.stbaunit  #制定组织
                  LET l_stbb.stbbsite = l_stba.stbasite  #营运组织
                  LET l_stbb.stbbdocno = l_stba.stbadocno#单据编号
                  LET l_stbb.stbb001 = l_steb.steb002    #费用编号
                  LET l_stbb.stbb002 = l_stea.stea032    #幣別
                  LET l_stbb.stbb003 = l_stea.stea034    #稅別
                  LET l_stbb.stbb004 = l_steb.steb004    #價款類別
                  LET l_stbb.stbb010 = '1'               #承擔對象
                  LET l_stbb.stbb011 = l_stea.stea051    #所屬品類
                  LET l_stbb.stbb012 = l_stea.stea044    #所屬部門
                  LET l_stbb.stbb013 = '1'               #結算對象
                  LET l_stbb.stbb015 = l_steb.steb018    #納入結算單否
                  LET l_stbb.stbb016 = l_steb.steb019    #票扣否
                  LET l_stbb.stbb017 = ''                #備註
                  #当费用核算制度为2.权责发生制 写入费用单的开始日期和截止日期，按照自然月以及天数拆分处理
                  SELECT stae005 INTO l_stae005
                    FROM stae_t 
                   WHERE staeent = g_enterprise
                     AND stae001 = l_stbb.stbb001
                  SELECT stfa050 INTO l_stbb.stbbud001
                    FROM stfa_t
                   WHERE stfaent = g_enterprise
                     AND stfa001 = l_stea.stea001
                  #根据开始日期结束日期抓取结算账期和结算日期
                  CALL s_settle_date_get_stbb019(l_stba.stba010,l_bdate_t,l_edate_t,'2') 
                  RETURNING  l_stbb.stbb018,l_stbb.stbb019  
                  
                  IF l_stae005 = '2' THEN
                     LET l_stbb009_sum = l_stbb009 - l_stbb009_t                     
                     CALL s_curr_round(l_stba.stbasite,l_stbb.stbb002,l_stbb009_sum,'2') RETURNING l_stbb009_sum
                     LET l_acount_t = l_stbb009_sum
                     #根据费用开始和截止拆分
                     LET l_begin = ''
                     LET l_end = ''
                     LET l_sum = 0
                     WHILE TRUE
                        #费用下次计算开始日-下次计算截止日
                        CALL s_astm301_cal_nextd('3',l_stec.stec014,l_bdate,l_edate,l_begin,l_end,l_stec.stec001,'2','Y',l_stec.stec010) RETURNING l_nextd,l_begin,l_end
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
                           LET l_stbb.stbb009 = l_acount_t - l_sum
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
                     LET l_stbb.stbb009 = l_stbb009 - l_stbb009_t         #費用金額
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
                  #写入费用单----end-----
               END IF 
               #更新下次费用计算日、下次费用开始日、下次费用截止日
               CALL s_astm301_cal_nextd(l_steb.steb006,l_steb.steb007,l_steb.steb013,l_steb.steb014,l_bdate_t,l_edate_t,l_steb.steb001,'2',l_steb.steb020,l_steb.steb003)
                    RETURNING r_nextd,l_bdate_t,l_edate_t
               LET l_bdate = l_bdate_t
               LET l_edate = l_edate_t
            END WHILE
         END FOREACH 
         IF g_deteal_cnt = 0 THEN 
            #删除费用单单头表
            DELETE FROM stba_t WHERE stbaent = g_enterprise AND stbadocno = l_stba.stbadocno
            LET g_cnt = g_cnt - 1
         END IF 
      END IF
      #成本补差      
      IF p_type = '2' THEN 
         INITIALIZE l_stec.* TO NULL
         LET g_deteal_cnt = 0
         FOREACH sel_stec_cs USING l_stea.steadocno INTO l_stec.* 
            IF SQLCA.sqlcode THEN
               INITIALIZE g_errparam TO NULL 
               LET g_errparam.extend = 'foreach:' 
               LET g_errparam.code   = SQLCA.sqlcode 
               LET g_errparam.popup  = TRUE 
               CALL cl_err()
               LET l_success = FALSE
               EXIT FOREACH
            END IF
            LET l_stga012_new = 0
            LET l_stga012_old = 0
            #抓取astq501从续签日期到执行日期的原价、实收、成本金额
            SELECT SUM(stga008),SUM(stga009),SUM(stga012)
              INTO l_stga008_old,l_stga009_old,l_stga012_old
              FROM stga_t
             WHERE stgaent = g_enterprise
               AND stga001 >= l_stea.stea049
               AND stga001 < l_stea.stea054
               AND stga003 = l_stec.stec002
               AND stga004 = l_stea.stea005
            IF cl_null(l_stga008_old) THEN 
               LET l_stga008_old = 0
            END IF 
            IF cl_null(l_stga009_old) THEN 
               LET l_stga009_old = 0
            END IF 
            #计算基准条件
            SELECT stab008,stab009,stab010,stab013
              INTO l_stab008,l_stab009,l_stab010,l_stab013
              FROM stab_t
             WHERE stabent = g_enterprise
               AND stab001 = l_stec.stec016
            #取原价金额
            IF l_stab008 = 'Y' AND l_stab009 ='Y'  AND l_stab010 = 'Y' THEN 
               #根据原价算成本
               LET l_stga012_new = l_stga008_old*(1-l_stec.stec018/100)
            END IF 
            #实收金额
            IF l_stab008 = 'Y' AND l_stab009 ='Y'  AND l_stab010 = 'N' THEN 
               #根据实收金额计算成本
               LET l_stga012_new = l_stga009_old*(1-l_stec.stec018/100)
            END IF 
            #补差成本=新成本金额-旧成本金额
            LET l_stga012 = l_stga012_new - l_stga012_old
            IF l_stga012 <> 0 THEN 
               #写入费用单---start----
               INITIALIZE l_stbb.* TO NULL
               LET l_stbb.stbbent = g_enterprise      #企业编号
               LET l_stbb.stbbunit = l_stba.stbaunit  #制定组织
               LET l_stbb.stbbsite = l_stba.stbasite  #营运组织
               LET l_stbb.stbbdocno = l_stba.stbadocno#单据编号
               LET l_stbb.stbb001 = l_stec.stec009    #费用编号
               LET l_stbb.stbb002 = l_stea.stea032    #幣別
               LET l_stbb.stbb003 = l_stea.stea034    #稅別
               LET l_stbb.stbb004 = l_stec.stec011    #價款類別
               LET l_stbb.stbb010 = '1'               #承擔對象
               LET l_stbb.stbb011 = l_stea.stea051    #所屬品類
               LET l_stbb.stbb012 = l_stea.stea044    #所屬部門
               LET l_stbb.stbb013 = '1'               #結算對象
               LET l_stbb.stbb015 = l_stec.stec026    #納入結算單否
               LET l_stbb.stbb016 = l_stec.stec027    #票扣否
               LET l_stbb.stbb017 = ''                #備註
               SELECT stfa050 INTO l_stbb.stbbud001
                 FROM stfa_t
                WHERE stfaent = g_enterprise
                  AND stfa001 = l_stea.stea001
               #当费用核算制度为2.权责发生制 写入费用单的开始日期和截止日期，按照自然月以及天数拆分处理
               SELECT stae005 INTO l_stae005
                 FROM stae_t 
                WHERE staeent = g_enterprise
                  AND stae001 = l_stbb.stbb001
               
               #根据开始日期结束日期抓取结算账期和结算日期
               CALL s_settle_date_get_stbb019(l_stba.stba010,l_stea.stea049,l_stea.stea054,'2') 
                  RETURNING  l_stbb.stbb018,l_stbb.stbb019  
               LET l_bdate = l_stea.stea049
               LET l_edate = l_stea.stea054
               IF l_stae005 = '2' THEN    
                  CALL s_curr_round(l_stba.stbasite,l_stbb.stbb002,l_stga012,'2') RETURNING l_stga012
                  LET l_acount_t = l_stga012
                  #根据费用开始和截止拆分
                  LET l_begin = ''
                  LET l_end = ''
                  LET l_sum = 0
                  WHILE TRUE
                     #费用下次计算开始日-下次计算截止日
                     CALL s_astm301_cal_nextd('3',l_stec.stec014,l_bdate,l_edate,l_begin,l_end,l_stec.stec001,'2','Y',l_stec.stec010) RETURNING l_nextd,l_begin,l_end
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
                        LET l_stbb.stbb009 = l_acount_t - l_sum
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
                  LET l_stbb.stbb009 = l_stga012         #費用金額
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
               #写入费用单----end-----
            END IF 
         END FOREACH 
         IF g_deteal_cnt = 0 THEN 
            #删除费用单单头表
            DELETE FROM stba_t WHERE stbaent = g_enterprise AND stbadocno = l_stba.stbadocno
            LET g_cnt = g_cnt - 1
         END IF 
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
# Descriptions...: 推算延期日期所在开始日期、截止日期
# Memo...........:
# Usage..........: CALL astp404_get_date(p_bdate,p_edate,p_stea049,p_steb006,p_steb020,p_stfj001)
#                  RETURNING r_bdate,r_edate
# Input parameter: p_bdate        上次费用计算开始日期
#                : p_edate        上次费用计算截止日期
#                : p_stea049      续签日期
#                : p_steb006      费用周期
#                : p_steb020      自然月否
#                : p_stfj001      合同编号
# Return code....: r_bdate        费用开始日期
#                : r_edate        费用结束日期
# Date & Author..: 2016/1/6 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp404_get_date(p_bdate,p_edate,p_stea049,p_steb006,p_steb020,p_stfj001)
DEFINE p_bdate      LIKE type_t.dat
DEFINE p_edate      LIKE type_t.dat
DEFINE p_stea049    LIKE stea_t.stea049
DEFINE p_steb006    LIKE steb_t.steb006
DEFINE p_steb020    LIKE steb_t.steb020
DEFINE p_stfj001    LIKE stfj_t.stfj001
DEFINE r_bdate      LIKE type_t.dat
DEFINE r_edate      LIKE type_t.dat
DEFINE l_year      LIKE type_t.num5
DEFINE l_month     LIKE type_t.num5

   LET r_bdate = ''
   LET r_edate = ''
   IF p_bdate <= p_stea049 AND p_stea049 <= p_edate THEN
      LET r_bdate = p_bdate
      LET r_edate = p_edate
      RETURN r_bdate,r_edate
   END IF 
   WHILE TRUE 
      CASE p_steb006
         #年
         WHEN '1'
             #按自然月计费
             IF p_steb020 = 'Y' THEN 
                LET l_year = YEAR(p_bdate)
                #获取当前年份第一天
                LET p_bdate = MDY(1,1,l_year-1)
                #获取当前年份最后一天
                LET p_edate = MDY(12,31,l_year-1)
             ELSE
                LET p_bdate = s_date_get_date(p_bdate,-12,0)
                LET p_edate = s_date_get_date(p_edate,-12,0)
             END IF 
         #季
         WHEN '2'
             #按自然月计费
             IF p_steb020 = 'Y' THEN 
                LET l_year = YEAR(p_bdate)
                LET l_month = MONTH(p_bdate)
                #获取当前季度第一天
                #四个季度 1-3 4-6 7-9 10-12
                IF l_month >= 1 AND l_month <= 3 THEN 
                   LET p_bdate = MDY(10, 1, l_year-1)
                   LET p_edate  = MDY(12,31, l_year-1)
                END IF 
                IF l_month >= 4 AND l_month <= 6 THEN 
                   LET p_bdate = MDY( 1, 1, l_year)
                   LET p_edate  = MDY( 3,31, l_year)
                   
                END IF 
                IF l_month >= 7 AND l_month <= 9 THEN 
                   LET p_bdate = MDY( 4, 1, l_year)
                   LET p_edate  = MDY( 6,30, l_year)
                END IF 
                IF l_month >= 10 AND l_month <= 12 THEN 
                   LET p_bdate = MDY( 7, 1, l_year)
                   LET p_edate  = MDY( 9,30, l_year)
                END IF 
             ELSE
                LET p_bdate = s_date_get_date(p_bdate,-3,0)
                LET p_edate = s_date_get_date(p_edate,-3,0)
             END IF 
         #月
         WHEN '3'
             #按自然月计费
             IF p_steb020 = 'Y' THEN 
                LET p_bdate = s_date_get_date(p_bdate,-1,0)
                #获取当前月第一天
                CALL s_date_get_first_date(p_bdate) RETURNING p_bdate
                #获取当月最后一天
                CALL s_date_get_last_date(p_bdate) RETURNING p_edate
             ELSE
                LET p_bdate = s_date_get_date(p_bdate,-1,0)
                LET p_edate = s_date_get_date(p_edate,-1,0)
             END IF 
         #单次
         WHEN '4'
             IF p_bdate < p_stea049 THEN 
                LET p_bdate = p_stea049
             END IF 
             RETURN p_bdate,p_edate
             
         #按结算帐期
         WHEN '5'
             SELECT stfj002,stfj003 
               INTO p_bdate,p_edate
               FROM stfj_t
              WHERE stfjent = g_enterprise
                AND stfj001 = p_stfj001
                AND stfj002 <= p_stea049
                AND stfj003 >= p_stea049
                
         OTHERWISE 
            EXIT WHILE 
      END CASE 
      IF p_bdate <= p_stea049 AND p_stea049 <= p_edate THEN
         LET r_bdate = p_bdate
         LET r_edate = p_edate
         EXIT WHILE
      END IF 
   END WHILE 
   RETURN r_bdate,r_edate
END FUNCTION

#end add-point
 
{</section>}
 
