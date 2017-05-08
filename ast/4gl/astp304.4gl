#該程式未解開Section, 採用最新樣板產出!
{<section id="astp304.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0004(2016-01-22 14:06:32), PR版次:0004(2016-11-15 11:02:52)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000029
#+ Filename...: astp304
#+ Description: 自營合約補差計算批次維護作業
#+ Creator....: 02003(2016-01-18 14:58:47)
#+ Modifier...: 02003 -SD/PR- 02481
 
{</section>}
 
{<section id="astp304.global" >}
#應用 p01 樣板自動產生(Version:19)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#Memos
#161024-00025#12     2016/10/26  By 02481       组织开窗调整
#161111-00028#3      2016/11/15  by 02481       标准程式定义采用宣告模式,弃用.*写法
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
       stajsite LIKE type_t.chr10, 
   staj001 LIKE type_t.chr20, 
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
 
{<section id="astp304.main" >}
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
      CALL astp304_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp304 WITH FORM cl_ap_formpath("ast",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL astp304_init()
 
      #進入選單 Menu (="N")
      CALL astp304_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp304
   END IF
 
   #add-point:作業離開前 name="main.exit"
   LET l_success = ''
   CALL s_aooi500_drop_temp() RETURNING l_success
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp304.init" >}
#+ 初始化作業
PRIVATE FUNCTION astp304_init()
 
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
   LET l_success = ''
   CALL s_aooi500_create_temp() RETURNING l_success
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp304.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp304_ui_dialog()
 
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
         CONSTRUCT BY NAME g_master.wc ON stajsite,staj001,pmaa001
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.stajsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stajsite
            #add-point:ON ACTION controlp INFIELD stajsite name="construct.c.stajsite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
           #CALL q_ooef001_4()                           #呼叫開窗                   #161024-00025#12--mark
            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stajsite',g_site,'c')  #161024-00025#12--add
            CALL q_ooef001_24()                                                     #161024-00025#12--add

            DISPLAY g_qryparam.return1 TO stajsite  #顯示到畫面上
            NEXT FIELD stajsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stajsite
            #add-point:BEFORE FIELD stajsite name="construct.b.stajsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stajsite
            
            #add-point:AFTER FIELD stajsite name="construct.a.stajsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.staj001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD staj001
            #add-point:ON ACTION controlp INFIELD staj001 name="construct.c.staj001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stan001_1()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO staj001  #顯示到畫面上
            NEXT FIELD staj001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD staj001
            #add-point:BEFORE FIELD staj001 name="construct.b.staj001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD staj001
            
            #add-point:AFTER FIELD staj001 name="construct.a.staj001"
            
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
            CALL astp304_get_buffer(l_dialog)
            #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog3"
            NEXT FIELD stajsite
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
         CALL astp304_init()
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
                 CALL astp304_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = astp304_transfer_argv(ls_js)
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
 
{<section id="astp304.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION astp304_transfer_argv(ls_js)
 
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
 
{<section id="astp304.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION astp304_process(ls_js)
 
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
      CALL cl_progress_bar_no_window(2)   #160225-00040#16 20160328 add by beckxie
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE astp304_process_cs CURSOR FROM ls_sql
#  FOREACH astp304_process_cs INTO
   #add-point:process段process name="process.process"
   IF cl_null(lc_param.steb021) THEN 
      LET lc_param.steb021 = g_today-1                                  
   END IF
   #160225-00040#16 20160328 add by beckxie---S
   LET l_msg = cl_getmsg('ast-00330',g_lang)
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#16 20160328 add by beckxie---E
   IF lc_param.sel != '3' THEN 
      IF NOT astp304_process_1(lc_param.wc,lc_param.steb021,lc_param.sel) THEN 
         LET g_errparam.code = 'adz-00218'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END IF
   ELSE
      LET l_success = TRUE
      IF NOT astp304_process_1(lc_param.wc,lc_param.steb021,'1') THEN 
         LET l_success = FALSE
      END IF
      IF NOT astp304_process_1(lc_param.wc,lc_param.steb021,'2') THEN 
         LET l_success = FALSE
      END IF
      IF NOT l_success THEN 
         LET g_errparam.code = 'adz-00218'
         LET g_errparam.extend = ''
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END IF 
   END IF 
   #160225-00040#16 20160328 add by beckxie---S
   LET l_msg = cl_getmsg('std-00012',g_lang)
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#16 20160328 add by beckxie---E
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
   CALL astp304_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp304.get_buffer" >}
PRIVATE FUNCTION astp304_get_buffer(p_dialog)
 
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
 
{<section id="astp304.msgcentre_notify" >}
PRIVATE FUNCTION astp304_msgcentre_notify()
 
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
 
{<section id="astp304.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: 批次处理
# Memo...........:
# Usage..........: CALL astp304_process_1(p_wc,p_date,p_type)
# Input parameter: p_wc     查询条件
# Return code....: p_date   执行日期
#                : p_type   补差类型 1.费用补差  2.成本补差
# Date & Author..: 2015/08/01 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_process_1(p_wc,p_date,p_type)
DEFINE p_wc        STRING 
DEFINE p_date      LIKE steb_t.steb021
DEFINE p_type      LIKE type_t.chr1
DEFINE l_sql       STRING 
#161111-00028#3--modify---begin-----------
#DEFINE l_staj      RECORD LIKE staj_t.*
#DEFINE l_stak      RECORD LIKE stak_t.*
#DEFINE l_stba      RECORD LIKE stba_t.*
#DEFINE l_stbb      RECORD LIKE stbb_t.*
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
       stbb033 LIKE stbb_t.stbb033,  #銷售單位
       stbbud001 LIKE stbb_t.stbbud001
       END RECORD
DEFINE l_staj RECORD  #自營合約異動申請單頭檔
       stajent LIKE staj_t.stajent, #企業編號
       stajunit LIKE staj_t.stajunit, #應用組織
       stajsite LIKE staj_t.stajsite, #營運據點
       stajdocno LIKE staj_t.stajdocno, #單號
       stajdocdt LIKE staj_t.stajdocdt, #單據日期
       staj000 LIKE staj_t.staj000, #作業方式
       staj001 LIKE staj_t.staj001, #合約編號
       staj002 LIKE staj_t.staj002, #經營方式
       staj003 LIKE staj_t.staj003, #版本
       staj004 LIKE staj_t.staj004, #模板編號
       staj005 LIKE staj_t.staj005, #供應商編號
       staj006 LIKE staj_t.staj006, #幣別
       staj007 LIKE staj_t.staj007, #稅別
       staj008 LIKE staj_t.staj008, #收付款方式
       staj009 LIKE staj_t.staj009, #結算方式
       staj010 LIKE staj_t.staj010, #結算類別
       staj011 LIKE staj_t.staj011, #訂貨滿足率
       staj012 LIKE staj_t.staj012, #簽訂日期
       staj013 LIKE staj_t.staj013, #簽訂法人
       staj014 LIKE staj_t.staj014, #簽訂人員
       staj015 LIKE staj_t.staj015, #結算中心
       staj016 LIKE staj_t.staj016, #採購中心
       staj017 LIKE staj_t.staj017, #生效日期
       staj018 LIKE staj_t.staj018, #失效日期
       staj019 LIKE staj_t.staj019, #清退日期
       staj020 LIKE staj_t.staj020, #作廢日期
       staj021 LIKE staj_t.staj021, #檔案編號
       staj022 LIKE staj_t.staj022, #申請組織
       stajacti LIKE staj_t.stajacti, #合約有效碼
       stajownid LIKE staj_t.stajownid, #資料所有者
       stajowndp LIKE staj_t.stajowndp, #資料所有部門
       stajcrtid LIKE staj_t.stajcrtid, #資料建立者
       stajcrtdp LIKE staj_t.stajcrtdp, #資料建立部門
       stajcrtdt LIKE staj_t.stajcrtdt, #資料創建日
       stajmodid LIKE staj_t.stajmodid, #資料修改者
       stajmoddt LIKE staj_t.stajmoddt, #最近修改日
       stajstus LIKE staj_t.stajstus, #狀態碼
       stajcnfid LIKE staj_t.stajcnfid, #資料確認者
       stajcnfdt LIKE staj_t.stajcnfdt, #資料確認日
       staj023 LIKE staj_t.staj023, #來源單號
       staj024 LIKE staj_t.staj024, #交易條件
       staj025 LIKE staj_t.staj025, #發票類型
       staj026 LIKE staj_t.staj026, #採購價格允許人工修改
       staj027 LIKE staj_t.staj027, #修改容差率
       staj028 LIKE staj_t.staj028, #超出處理方式
       staj029 LIKE staj_t.staj029, #內外購
       staj030 LIKE staj_t.staj030, #匯率計算基準
       staj031 LIKE staj_t.staj031, #合約狀態
       staj032 LIKE staj_t.staj032, #原合約編號
       staj033 LIKE staj_t.staj033, #延期日期
       staj034 LIKE staj_t.staj034, #收銀方式
       staj035 LIKE staj_t.staj035, #續期日期
       staj036 LIKE staj_t.staj036, #文本蓋章否
       staj037 LIKE staj_t.staj037, #蓋章日期
       staj038 LIKE staj_t.staj038, #備註
       staj039 LIKE staj_t.staj039, #執行日期
       staj040 LIKE staj_t.staj040, #含發票否
       staj041 LIKE staj_t.staj041, #部門
       staj042 LIKE staj_t.staj042  #按法人結算
       END RECORD
DEFINE l_stak RECORD  #自營合約異動申請單費用設定檔
       stakent LIKE stak_t.stakent, #企業編號
       stakunit LIKE stak_t.stakunit, #應用組織
       staksite LIKE stak_t.staksite, #營運據點
       stakdocno LIKE stak_t.stakdocno, #單號
       stakseq LIKE stak_t.stakseq, #項次
       stak003 LIKE stak_t.stak003, #費用編號
       stak004 LIKE stak_t.stak004, #會計期間
       stak005 LIKE stak_t.stak005, #價款類別
       stak006 LIKE stak_t.stak006, #計算類型
       stak007 LIKE stak_t.stak007, #費用週期
       stak008 LIKE stak_t.stak008, #費用週期方式
       stak009 LIKE stak_t.stak009, #條件基準
       stak010 LIKE stak_t.stak010, #計算基準
       stak011 LIKE stak_t.stak011, #費用淨額
       stak012 LIKE stak_t.stak012, #費用比率
       stak013 LIKE stak_t.stak013, #保底否
       stak014 LIKE stak_t.stak014, #保底金額
       stak015 LIKE stak_t.stak015, #保底扣率
       stak016 LIKE stak_t.stak016, #分量扣點
       stak017 LIKE stak_t.stak017, #生效日期
       stak018 LIKE stak_t.stak018, #失效日期
       stak019 LIKE stak_t.stak019, #下次計算日
       stak020 LIKE stak_t.stak020, #下次費用開始日
       stak021 LIKE stak_t.stak021, #下次費用截止日
       stak022 LIKE stak_t.stak022, #自定義範圍
       stak023 LIKE stak_t.stak023, #納入結算單否
       stak024 LIKE stak_t.stak024, #票扣否
       stak025 LIKE stak_t.stak025, #管理品類
       stak026 LIKE stak_t.stak026, #生效月份
       stak027 LIKE stak_t.stak027, #按自然月計費否
       stakacti LIKE stak_t.stakacti, #有效
       stak028 LIKE stak_t.stak028, #固定費用是否按法人收取
       stak029 LIKE stak_t.stak029, #促銷扣率
       stak030 LIKE stak_t.stak030  #促銷銷售額占比
       END RECORD
#161111-00028#3--modify----end--------------
DEFINE l_bdate     LIKE type_t.dat
DEFINE l_edate     LIKE type_t.dat
DEFINE l_bdate_t   LIKE type_t.dat
DEFINE l_edate_t   LIKE type_t.dat
DEFINE l_ooef017   LIKE ooef_t.ooef017
DEFINE l_stbw001   LIKE stbw_t.stbw001
DEFINE l_stbw002   LIKE stbw_t.stbw002
DEFINE l_stbw003   LIKE stbw_t.stbw003
DEFINE l_stbw005   LIKE stbw_t.stbw005
DEFINE l_success   LIKE type_t.num5
DEFINE r_success   LIKE type_t.num5
DEFINE r_doctype   LIKE rtai_t.rtai004
DEFINE l_stbastus  LIKE stba_t.stbastus
DEFINE l_stbw002_min   LIKE stbw_t.stbw002
DEFINE l_errmsg        DYNAMIC ARRAY OF RECORD
           staj001     LIKE staj_t.staj001,
           staj005     LIKE staj_t.staj005,
           stbadocdt   LIKE stba_t.stbadocdt,
           stbadocno   LIKE stba_t.stbadocno
           END RECORD
DEFINE l_errmsg_n      LIKE type_t.num5

DEFINE l_where           STRING  #161024-00025#12--add

   WHENEVER ERROR CONTINUE
   
   CALL s_transaction_begin()
   CALL cl_err_collect_init()
   LET l_bdate = ''
   LET l_edate = ''
   LET l_bdate_t = ''
   LET l_edate_t = ''
   LET l_errmsg_n = 1
   LET l_success = TRUE
   IF cl_null(p_wc) THEN 
      LET p_wc = " 1=1"
   END IF
   #创建费用单单身临时表
   CALL astp304_expense_create_stbb_tmp()

   #161024-00025#12--add----begin------------
   LET l_where = ''
   CALL s_aooi500_sql_where(g_prog,'stajsite') RETURNING l_where
   LET p_wc = p_wc," AND ",l_where
   #161024-00025#12--add----end--------------
   INITIALIZE l_staj.* TO NULL
   #抓取需要补差的合同资料
#  LET l_sql = " SELECT DISTINCT staj_t.* FROM staj_t ",   #161111-00028#3-mark
#161111-00028#3---add----begin---------
   LET l_sql = " SELECT DISTINCT stajent,stajunit,stajsite,stajdocno,stajdocdt,staj000,staj001,staj002,",
               "staj003,staj004,staj005,staj006,staj007,staj008,staj009,staj010,staj011,staj012,staj013,",
               "staj014,staj015,staj016,staj017,staj018,staj019,staj020,staj021,staj022,stajacti,stajownid,",
               "stajowndp,stajcrtid,stajcrtdp,stajcrtdt,stajmodid,stajmoddt,stajstus,stajcnfid,stajcnfdt,staj023,",
               "staj024,staj025,staj026,staj027,staj028,staj029,staj030,staj031,staj032,staj033,staj034,staj035,",
               "staj036,staj037,staj038,staj039,staj040,staj041,staj042 FROM staj_t ",
#161111-00028#3---add----end-----------
               "   LEFT JOIN pmaa_t ON pmaaent = stajent AND pmaa001 = staj005 ",
               "  WHERE stajent = ",g_enterprise,
               "    AND staj039 = '",p_date,"'",
               "    AND staj000 = 'R' ",
               "    AND stajstus = 'Y' ",
               "    AND ",p_wc
   PREPARE sel_staj FROM l_sql
   DECLARE sel_staj_cs CURSOR FOR sel_staj
   #补差资料分为两种情况：
   #1.已产生费用单并且已计算截止日期大于续签日期 补差区间 续签日期-->已计算截止日期   （情况一）
   #  1.1 存在合同扣项：根据合同扣项设定计算出续签日期~已计算截止日期的费用 减去 续签日期~已计算截止日期产生费用单的费用
   #  1.2 不存在合同扣项：求和续签日期~已计算截止日期的费用单的费用（此费用为负值，退给供应商钱）
   #2.新增合同扣项未计算费用 补差日期区间 续签日期-->计算费用起始日期-1              （情况二）
   
   #抓取补差资料第一种情况
   LET l_sql = " SELECT stbw001,MAX(stbw003),stbw008 FROM stbw_t ",
               "  WHERE stbwent = ",g_enterprise,
               "    AND stbwdocno = ? ",
               "    AND stbw009 = 'Y' ",
               "  GROUP BY stbw001,stbw008 "
   PREPARE sel_stbw FROM l_sql
   DECLARE sel_stbw_cs CURSOR FOR sel_stbw
   
   #抓取补差资料第二种情况
   LET l_sql = " SELECT stbw001,stbw002,stbw008 FROM stbw_t ",
               "  WHERE stbwent = ",g_enterprise,
               "    AND stbwdocno = ? ",
               "    AND stbw009 = 'N' ",
               "    AND '",p_date,"' BETWEEN stbw002 AND stbw003 "
   PREPARE sel_stbw_2 FROM l_sql
   DECLARE sel_stbw_cs_2 CURSOR FOR sel_stbw_2
   LET g_cnt = 0
   FOREACH sel_staj_cs INTO l_staj.*
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = 'foreach:' 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET l_success = FALSE
         EXIT FOREACH
      END IF
      IF p_type = '1' OR p_type = '3' THEN 
         #检查此合同是否产生过补差单，补差单状态是否为Y
         SELECT stbastus INTO l_stbastus
           FROM stba_t
          WHERE stbaent = g_enterprise
            AND stba007 = l_staj.staj001
            AND stba006 = '2'
            AND stbadocdt = p_date
            AND stba000 = 'astt323'
         IF l_stbastus = 'Y' THEN 
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = l_staj.staj001 
            LET g_errparam.code   = 'ast-00544'
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            LET l_success = FALSE
            CONTINUE FOREACH 
         END IF 
         DELETE FROM stbb_t 
          WHERE stbbent = g_enterprise
            AND EXISTS(SELECT 1 FROM stba_t WHERE stbaent = stbbent 
                                              AND stbadocno = stbbdocno
                                              AND stba006 = '2'
                                              AND stba007 = l_staj.staj001
                                              AND stbadocdt = p_date
                                              AND stba000 = 'astt323')
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = " DEL stbb_t "
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            CONTINUE FOREACH 
         END IF
         DELETE FROM stba_t 
          WHERE stbaent = g_enterprise
            AND stba006 = '2'
            AND stba007 = l_staj.staj001
            AND stbadocdt = p_date
             AND stba000 = 'astt323'
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = " DEL stba_t "
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            CONTINUE FOREACH 
         END IF
      END IF 
      #成本补差或全部补差
      IF p_type = '2' OR p_type = '3' THEN 
         DELETE FROM stby_t 
          WHERE stbyent = g_enterprise
            AND stby001 = p_date
            AND stby013 = '17'
            AND stby020 = l_staj.staj001
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = " DEL stby_t "
            LET g_errparam.popup = TRUE
            CALL cl_err()
            LET l_success = FALSE
            CONTINUE FOREACH 
         END IF
      END IF 
      DELETE FROM stbb_tmp 
      DELETE FROM stby_tmp
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
      LET l_stba.stbasite = l_staj.stajsite
      LET l_stba.stbaunit = l_staj.stajsite
      LET l_stba.stbadocdt = p_date
      ##預設單據的單別
      LET r_success = ''
      LET r_doctype = ''
      CALL s_arti200_get_def_doc_type(l_stba.stbaunit,'astt323','1')
           RETURNING r_success,r_doctype
      LET l_stba.stbadocno = r_doctype
      CALL s_aooi200_gen_docno(g_site,l_stba.stbadocno,l_stba.stbadocdt,'astt323') RETURNING r_success,l_stba.stbadocno
      IF NOT r_success THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'apm-00003'
         LET g_errparam.extend = l_stba.stbadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
         LET l_success = FALSE
         EXIT FOREACH              
      END IF 
      LET l_stba.stba001 = l_staj.staj015    #結算中心
      LET l_stba.stba002 = l_staj.staj005    #供應商編號
      LET l_stba.stba003 = l_staj.staj002    #經營方式
      LET l_stba.stba004 = l_staj.staj009    #結算方式
      LET l_stba.stba005 = l_staj.staj010    #結算類型
      LET l_stba.stba006 = '2'               #來源類型
      LET l_stba.stba007 = l_staj.staj001    #來源單號
      LET l_stba.stba008 = l_staj.staj014    #人員
      LET l_stba.stba009 = l_staj.staj041    #部门
      LET l_stba.stbastus = 'N'              #狀態碼
      LET l_stba.stba010 = l_staj.staj001    #合同編號
      LET l_stba.stba011 = l_staj.staj006    #幣別
      LET l_stba.stba012 = l_staj.staj007    #稅別
      LET l_stba.stba014 = '1'               #費用類型
      LET l_stba.stba015 = ''                #交款狀態
      LET l_stba.stba016 = ''                #交款人
      LET l_stba.stba000 = 'astt323'         #程式編號
      LET l_stba.stba022 = l_ooef017
   #  INSERT INTO stba_t VALUES(l_stba.*)  #161111-00028#3--mark
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
      INITIALIZE l_stak.* TO NULL
      LET g_deteal_cnt = 0
      #情况一资料抓取
      FOREACH sel_stbw_cs USING l_staj.stajdocno INTO l_stbw001,l_stbw003,l_ooef017
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = 'foreach:' 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
         END IF
         #已计算费用最大截止日期小于续签日期，则无需补差
         IF l_stbw003 < l_staj.staj035 THEN 
            CONTINUE FOREACH 
         END IF 
         #抓取合同扣项资料
       # SELECT * INTO l_stak.*  #161111-00028#3--mark
       #161111-00028#3--ADD-----BEGIN-----------
         SELECT  stakent,stakunit,staksite,stakdocno,stakseq,stak003,stak004,stak005,stak006,
         stak007,stak008,stak009,stak010,stak011,stak012,stak013,
         stak014,stak015,stak016,stak017,stak018,stak019,stak020,stak021,
         stak022,stak023,stak024,stak025,stak026,stak027,stakacti,stak028,stak029,stak030 INTO l_stak.* 
       #161111-00028#3--ADD-----END-----------
           FROM stak_t 
          WHERE stakent = g_enterprise
            AND stakdocno = l_staj.stajdocno
            AND stakseq = l_stbw001
         SELECT stbw002 INTO l_stbw002
           FROM stbw_t 
          WHERE stbwent = g_enterprise
            AND stbwdocno = l_staj.stajdocno
            AND stbw001 = l_stbw001
            AND stbw008 = l_ooef017
            AND stbw003 = l_stbw003
         #如果是扣率代销，日期区间为续签日期至执行日期
         IF l_staj.staj002 = '3' AND cl_get_para(g_enterprise,g_site,'E-CIR-0045')=l_stak.stak003 
            AND (l_stak.stak007 = '3' OR l_stak.stak007 = '5') THEN
            LET l_bdate_t = l_staj.staj035
            LET l_edate_t = l_staj.staj039
            LET l_bdate = l_staj.staj035
            LET l_edate = l_staj.staj039
         ELSE
            #            当前费用帐期开始日期/截止日期/  续签日期/ 费用周期/自然月否/单据编号/  法人/      推算方式
            CALL astp304_get_date(l_stbw002,l_stbw003,l_staj.staj035,'','',l_staj.stajdocno,l_ooef017,'2')
            #      计算费用开始日期/结束日期          
                 RETURNING l_bdate,l_edate
            #总计算日期区间开始日期
            LET l_bdate_t = l_bdate
            #总计算日期区间截止日期
            LET l_edate_t = l_stbw003
         END IF 
         WHILE TRUE 
            IF l_bdate > l_edate_t OR cl_null(l_bdate) OR cl_null(l_edate) THEN 
               EXIT WHILE 
            END IF 
            #如果存在合同扣项
            IF NOT cl_null(l_stak.stak003) THEN
               #根据合同扣项计算规格产生费用写入临时表
               #                     开始日期/ 截止日期     /单据编号        /费用单编号       /法人          /合约扣项
               IF NOT astp304_expense(l_bdate,l_edate,l_staj.stajdocno,l_stba.stbadocno,l_ooef017,'1',l_stak.*) THEN 
                  LET l_success = FALSE
                  EXIT WHILE 
               END IF 
            END IF 
            IF p_type = '1' OR p_type = '3' THEN 
               SELECT stbw005 INTO l_stbw005
                 FROM stbw_t
                WHERE stbwent = g_enterprise
                  AND stbwdocno = l_staj.stajdocno
                  AND stbw001 = l_stbw001
                  AND stbw002 = l_bdate
                  AND stbw003 = l_edate
                  AND stbw008 = l_ooef017
               IF NOT cl_null(l_stbw005) THEN 
                  #将此日期区间内已产生的费用单明细写入到临时表，金额为负数
                  INSERT INTO stbb_tmp SELECT * FROM stbb_t
                                        WHERE stbbent = g_enterprise
                                          AND stbbdocno = l_stbw005
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = 'INS stbb_tmp' 
                     LET g_errparam.code   = SQLCA.sqlcode 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     LET l_success = FALSE
                     EXIT FOREACH
                  END IF  
                  #多收的钱要退回，所以金额为负数
                  UPDATE stbb_tmp SET stbb009 = stbb009*(-1)
                   WHERE stbbdocno = l_stbw005
                     AND stbbent = g_enterprise
                  IF SQLCA.sqlcode THEN
                     INITIALIZE g_errparam TO NULL 
                     LET g_errparam.extend = 'UPD stbb_tmp' 
                     LET g_errparam.code   = SQLCA.sqlcode 
                     LET g_errparam.popup  = TRUE 
                     CALL cl_err()
                     LET l_success = FALSE
                     EXIT FOREACH
                  END IF 
               END IF 
            END IF 
            IF p_type = '2' OR p_type = '3' THEN 
               #抓取日期区间内日结销售成本金额
               INSERT INTO stby_tmp SELECT * FROM stby_t
                                     WHERE stbyent = g_enterprise
                                       AND stby001 BETWEEN l_bdate AND l_edate
                                       AND stby020 = l_staj.staj001
                                       AND stby013 = '2'
                                       AND stby006 = l_stak.stak003
               IF SQLCA.sqlcode THEN
                  INITIALIZE g_errparam TO NULL 
                  LET g_errparam.extend = 'INS stby_tmp' 
                  LET g_errparam.code   = SQLCA.sqlcode 
                  LET g_errparam.popup  = TRUE 
                  CALL cl_err()
                  LET l_success = FALSE
                  EXIT FOREACH
               END IF 
            END IF 
            CALL astp304_cal_nextd(l_stak.stak007,l_bdate_t,l_edate_t,l_edate,l_stak.stak027,'2',l_staj.stajdocno,l_ooef017)
                 RETURNING l_bdate,l_edate
         END WHILE 
         IF NOT l_success THEN 
            CONTINUE FOREACH 
         END IF
      END FOREACH 
      
      #情况二资料抓取
      FOREACH sel_stbw_cs_2 USING l_staj.stajdocno INTO l_stbw001,l_stbw002,l_ooef017
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = 'foreach:' 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
         END IF
         SELECT MIN(stbw002) INTO l_stbw002_min
           FROM stbw_t
          WHERE stbwent = g_enterprise
            AND stbwdocno = l_staj.stajdocno
            AND stbw001 = l_stbw001
            AND stbw008 = l_ooef017
         #不是新增费用
         IF l_stbw002 <> l_stbw002_min THEN 
            CONTINUE FOREACH 
         END IF 
         #费用最开始日期小于续签日期，则无需补差
         IF l_stbw002 <= l_staj.staj035 THEN 
            CONTINUE FOREACH 
         END IF 
         #抓取合同扣项资料
       # SELECT * INTO l_stak.*  #161111-00028#3--mark
       #161111-00028#3--ADD-----BEGIN-----------
         SELECT  stakent,stakunit,staksite,stakdocno,stakseq,stak003,stak004,stak005,stak006,
         stak007,stak008,stak009,stak010,stak011,stak012,stak013,
         stak014,stak015,stak016,stak017,stak018,stak019,stak020,stak021,
         stak022,stak023,stak024,stak025,stak026,stak027,stakacti,stak028,stak029,stak030 INTO l_stak.* 
       #161111-00028#3--ADD-----END-----------
           FROM stak_t 
          WHERE stakent = g_enterprise
            AND stakdocno = l_staj.stajdocno
            AND stakseq = l_stbw001
         LET l_bdate = ''
         LET l_edate = ''
         LET l_bdate_t = ''
         LET l_edate_t = ''
         #如果是扣率代销，日期区间为续签日期至执行日期
         IF l_staj.staj002 = '3' AND cl_get_para(g_enterprise,g_site,'E-CIR-0045')=l_stak.stak003 
            AND (l_stak.stak007 = '3' OR l_stak.stak007 = '5') THEN
            LET l_bdate_t = l_staj.staj035
            LET l_edate_t = l_staj.staj039
            LET l_bdate = l_staj.staj035
            LET l_edate = l_staj.staj039
         ELSE
            #     当前费用帐期开始日期/  截止日期/    续签日期/       费用周期/       自然月否/      单据编号/        法人/     推算方式
            CALL astp304_get_date('',l_stbw002,l_staj.staj035,l_stak.stak007,l_stak.stak027,l_staj.stajdocno,l_ooef017,'1')
            #      计算费用开始日期/结束日期          
                 RETURNING l_bdate,l_edate
            #总计算日期区间开始日期
            LET l_bdate_t = l_bdate
            #总计算日期区间截止日期
            LET l_edate_t = l_stbw002 - 1
         END IF 
         WHILE TRUE 
            IF l_bdate > l_edate_t OR cl_null(l_bdate) OR cl_null(l_edate) THEN 
               EXIT WHILE 
            END IF 
            #根据合同扣项计算规格产生费用写入临时表
            #                     开始日期/ 截止日期 /单据编号        /费用单编号       /法人          /合约扣项
            IF NOT astp304_expense(l_bdate,l_edate,l_staj.stajdocno,l_stba.stbadocno,l_ooef017,'2',l_stak.*) THEN 
               LET l_success = FALSE
               EXIT WHILE 
            END IF 
            CALL astp304_cal_nextd(l_stak.stak007,l_bdate_t,l_edate_t,l_edate,l_stak.stak027,'1',l_staj.stajdocno,l_ooef017)
                 RETURNING l_bdate,l_edate
         END WHILE 
      END FOREACH 
      IF NOT l_success THEN 
         EXIT FOREACH 
      END IF 
      IF p_type = '1' OR p_type = '3' THEN 
         #生成费用补差费用单
         CALL astp304_sel_ins_stbb(l_staj.stajdocno,l_stba.stbadocno,l_staj.staj035) RETURNING l_success
      END IF 
      IF g_deteal_cnt = 0 THEN 
         #删除费用单单头表
         DELETE FROM stba_t WHERE stbaent = g_enterprise AND stbadocno = l_stba.stbadocno
         LET g_cnt = g_cnt - 1
      END IF 
      IF p_type = '2' OR p_type = '3' THEN 
         #抓取日期区间内日结销售成本金额
         INSERT INTO stby_tmp SELECT * FROM stby_t
                               WHERE stbyent = g_enterprise
                                 AND stby001 BETWEEN l_staj.staj035 AND l_staj.staj039
                                 AND stby020 = l_staj.staj001
                                 AND stby013 = '2'
         IF SQLCA.sqlcode THEN
            INITIALIZE g_errparam TO NULL 
            LET g_errparam.extend = 'INS stby_tmp' 
            LET g_errparam.code   = SQLCA.sqlcode 
            LET g_errparam.popup  = TRUE 
            CALL cl_err()
            LET l_success = FALSE
            EXIT FOREACH
         END IF 
         #生成成本补差
         CALL astp304_sel_ins_stby(l_staj.stajdocno,l_stba.stbadocno,l_staj.staj006,l_staj.staj039) RETURNING l_success
      END IF 
      IF NOT l_success THEN 
         EXIT FOREACH 
      END IF 
      IF g_cnt > 0 THEN 
         #提示产生费用单号
         LET l_errmsg[l_errmsg_n].staj001 = l_stba.stba010
         LET l_errmsg[l_errmsg_n].staj005 = l_stba.stba002
         LET l_errmsg[l_errmsg_n].stbadocdt = l_stba.stbadocdt
         LET l_errmsg[l_errmsg_n].stbadocno = l_stba.stbadocno
         LET l_errmsg_n = l_errmsg_n + 1
      END IF 
   END FOREACH 
   DROP TABLE stbb_tmp
   DROP TABLE stby_tmp
   IF l_success THEN 
      FOR l_errmsg_n = 1 TO l_errmsg.getLength()
         IF cl_null(l_errmsg[l_errmsg_n].staj005) THEN EXIT FOR END IF
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = 'adz-00217'
         LET g_errparam.extend = "供应商：",l_errmsg[l_errmsg_n].staj005," 日期：",l_errmsg[l_errmsg_n].stbadocdt," 已产生补差单单：",l_errmsg[l_errmsg_n].stbadocno
         LET g_errparam.popup = TRUE
         CALL cl_err()
      END FOR
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
# Usage..........: CALL astp304_get_date(p_bdate,p_edate,p_staj035,p_stak007,p_stak027,p_stajdocno,p_staw007,p_type)
#                  RETURNING r_bdate,r_edate
# Input parameter: p_bdate        开始日期
#                : p_edate        截止日期
#                : p_staj035      续签日期
#                : p_stak007      费用周期
#                : p_stak027      自然月否
#                : p_stajdocno    单据编号
#                : p_staw007      法人编号
#                : p_type         推算方式 1.按费用周期推算  2.按费用帐期取值
# Return code....: r_bdate        费用开始日期
#                : r_edate        费用结束日期
# Date & Author..: 2016/1/19 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_get_date(p_bdate,p_edate,p_staj035,p_stak007,p_stak027,p_stajdocno,p_staw007,p_type)
DEFINE p_bdate      LIKE type_t.dat
DEFINE p_edate      LIKE type_t.dat
DEFINE p_staj035    LIKE staj_t.staj035
DEFINE p_stak007    LIKE stak_t.stak007
DEFINE p_stak027    LIKE stak_t.stak027
DEFINE p_stajdocno  LIKE staj_t.stajdocno
DEFINE p_staw007    LIKE staw_t.staw007
DEFINE p_type       LIKE type_t.chr1
DEFINE r_bdate      LIKE type_t.dat
DEFINE r_edate      LIKE type_t.dat
DEFINE l_year       LIKE type_t.num5
DEFINE l_month      LIKE type_t.num5

   LET r_bdate = ''
   LET r_edate = ''
   IF NOT cl_null(p_bdate) THEN
      IF p_bdate <= p_staj035 AND p_staj035 <= p_edate THEN
         LET r_bdate = p_bdate
         LET r_edate = p_edate
         RETURN r_bdate,r_edate
      END IF 
   ELSE
      LET p_bdate = p_edate
   END IF 
   IF p_type = '1' THEN 
      WHILE TRUE 
         CASE p_stak007
            #年
            WHEN '1'
                #按自然月计费
                IF p_stak027 = 'Y' THEN 
                   LET l_year = YEAR(p_bdate)
                   #获取当前年份第一天
                   LET p_bdate = MDY(1,1,l_year-1)
                   #获取当前年份最后一天
                   LET p_edate = MDY(12,31,l_year-1)
                ELSE
                   LET p_bdate = s_date_get_date(p_bdate,-12,0)
                   LET p_edate = s_date_get_date(p_bdate,12,-1)
                END IF 
            #季
            WHEN '2'
                #按自然月计费
                IF p_stak027 = 'Y' THEN 
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
                   LET p_edate = s_date_get_date(p_bdate,3,-1)
                END IF 
            #月
            WHEN '3'
                #按自然月计费
                IF p_stak027 = 'Y' THEN 
                   LET p_bdate = s_date_get_date(p_bdate,-1,0)
                   #获取当前月第一天
                   CALL s_date_get_first_date(p_bdate) RETURNING p_bdate
                   #获取当月最后一天
                   CALL s_date_get_last_date(p_bdate) RETURNING p_edate
                ELSE
                   LET p_bdate = s_date_get_date(p_bdate,-1,0)
                   LET p_edate = s_date_get_date(p_bdate,1,-1)
                END IF 
            #单次
            WHEN '4'
                IF p_bdate < p_staj035 THEN 
                   LET p_bdate = p_staj035
                END IF 
                RETURN p_bdate,p_edate
                
            #按结算帐期
            WHEN '5'
              SELECT staw002,staw003 
                INTO r_bdate,r_edate
                FROM staw_t
               WHERE stawent = g_enterprise
                 AND staw007 = p_ooef017
                 AND stawdocno = p_stajdocno
                 AND staw002 <= p_staj035
                 AND staw003 >= p_staj035
               
            OTHERWISE 
               EXIT WHILE 
         END CASE 
         IF p_bdate <= p_staj035 AND p_staj035 <= p_edate THEN
            LET r_bdate = p_bdate
            LET r_edate = p_edate
            EXIT WHILE
         END IF 
      END WHILE 
   ELSE
      IF p_stak007 != '5' THEN 
         SELECT stbw002,stbw003
           INTO r_bdate,r_edate
           FROM stbw_t
          WHERE stbwent = g_enterprise
            AND stbw008 = p_staw007
            AND stbwdocno = p_stajdocno
            AND stbw002 <= p_staj035
            AND stbw003 >= p_staj035
      ELSE
         SELECT staw002,staw003 
           INTO r_bdate,r_edate
           FROM staw_t
          WHERE stawent = g_enterprise
            AND staw007 = p_staw007
            AND stawdocno = p_stajdocno
            AND staw002 <= p_staj035
            AND staw003 >= p_staj035
      END IF 
   END IF 
   RETURN r_bdate,r_edate
END FUNCTION

################################################################################
# Descriptions...: 根据合同产生费用到临时表
# Memo...........:
# Usage..........: CALL astp304_expense(p_bdate,p_edate,p_staj035,p_stajdocno,p_stbadocno,p_ooef017,p_type,p_stak)
#                  RETURNING 回传参数
# Input parameter: p_bdate        开始日期
#                : p_edate        结束日期
#                : p_stajdocno    单据日期
#                : p_stbadocno    费用单编号
#                : p_ooef017      法人
#                : p_type         分情况 1.情况一调用 2.情况二调用
#                : p_stak         合约扣项集合
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2015/01/19 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_expense(p_bdate,p_edate,p_stajdocno,p_stbadocno,p_ooef017,p_type,p_stak)
 DEFINE p_bdate         LIKE type_t.dat       
 DEFINE p_edate         LIKE type_t.dat
 DEFINE p_stajdocno     LIKE staj_t.stajdocno
 DEFINE p_stbadocno     LIKE stba_t.stbadocno
 DEFINE p_ooef017       LIKE ooef_t.ooef017
 DEFINE p_type          LIKE type_t.chr1
 DEFINE r_success       LIKE type_t.num5
 DEFINE r_errno         LIKE type_t.chr20
 DEFINE l_sql           STRING
 #161111-00028#3---modify----begin--------
 #DEFINE p_stak          RECORD LIKE stak_t.*
 #DEFINE l_stba          RECORD LIKE stba_t.*
 #DEFINE l_stbb          RECORD LIKE stbb_t.*
 #DEFINE l_staj          RECORD LIKE staj_t.*
 #DEFINE l_stbx          RECORD LIKE stbx_t.*
 DEFINE l_stbx RECORD  #供應商合約費用結算帳期資料表
       stbxent LIKE stbx_t.stbxent, #企業編號
       stbxsite LIKE stbx_t.stbxsite, #營運據點
       stbxunit LIKE stbx_t.stbxunit, #應用執行組織物件
       stbxseq LIKE stbx_t.stbxseq, #帳期
       stbxseq1 LIKE stbx_t.stbxseq1, #費用項次
       stbx001 LIKE stbx_t.stbx001, #合約編號
       stbx002 LIKE stbx_t.stbx002, #起始日期
       stbx003 LIKE stbx_t.stbx003, #截止日期
       stbx004 LIKE stbx_t.stbx004, #費用計算日期
       stbx005 LIKE stbx_t.stbx005, #費用單號
       stbx006 LIKE stbx_t.stbx006, #費用金額
       stbx007 LIKE stbx_t.stbx007, #費用編號
       stbx008 LIKE stbx_t.stbx008, #法人
       stbx009 LIKE stbx_t.stbx009  #已計算否
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
       stbb033 LIKE stbb_t.stbb033,  #銷售單位
       stbbud001 LIKE stbb_t.stbbud001 
       END RECORD
DEFINE l_staj RECORD  #自營合約異動申請單頭檔
       stajent LIKE staj_t.stajent, #企業編號
       stajunit LIKE staj_t.stajunit, #應用組織
       stajsite LIKE staj_t.stajsite, #營運據點
       stajdocno LIKE staj_t.stajdocno, #單號
       stajdocdt LIKE staj_t.stajdocdt, #單據日期
       staj000 LIKE staj_t.staj000, #作業方式
       staj001 LIKE staj_t.staj001, #合約編號
       staj002 LIKE staj_t.staj002, #經營方式
       staj003 LIKE staj_t.staj003, #版本
       staj004 LIKE staj_t.staj004, #模板編號
       staj005 LIKE staj_t.staj005, #供應商編號
       staj006 LIKE staj_t.staj006, #幣別
       staj007 LIKE staj_t.staj007, #稅別
       staj008 LIKE staj_t.staj008, #收付款方式
       staj009 LIKE staj_t.staj009, #結算方式
       staj010 LIKE staj_t.staj010, #結算類別
       staj011 LIKE staj_t.staj011, #訂貨滿足率
       staj012 LIKE staj_t.staj012, #簽訂日期
       staj013 LIKE staj_t.staj013, #簽訂法人
       staj014 LIKE staj_t.staj014, #簽訂人員
       staj015 LIKE staj_t.staj015, #結算中心
       staj016 LIKE staj_t.staj016, #採購中心
       staj017 LIKE staj_t.staj017, #生效日期
       staj018 LIKE staj_t.staj018, #失效日期
       staj019 LIKE staj_t.staj019, #清退日期
       staj020 LIKE staj_t.staj020, #作廢日期
       staj021 LIKE staj_t.staj021, #檔案編號
       staj022 LIKE staj_t.staj022, #申請組織
       stajacti LIKE staj_t.stajacti, #合約有效碼
       stajownid LIKE staj_t.stajownid, #資料所有者
       stajowndp LIKE staj_t.stajowndp, #資料所有部門
       stajcrtid LIKE staj_t.stajcrtid, #資料建立者
       stajcrtdp LIKE staj_t.stajcrtdp, #資料建立部門
       stajcrtdt LIKE staj_t.stajcrtdt, #資料創建日
       stajmodid LIKE staj_t.stajmodid, #資料修改者
       stajmoddt LIKE staj_t.stajmoddt, #最近修改日
       stajstus LIKE staj_t.stajstus, #狀態碼
       stajcnfid LIKE staj_t.stajcnfid, #資料確認者
       stajcnfdt LIKE staj_t.stajcnfdt, #資料確認日
       staj023 LIKE staj_t.staj023, #來源單號
       staj024 LIKE staj_t.staj024, #交易條件
       staj025 LIKE staj_t.staj025, #發票類型
       staj026 LIKE staj_t.staj026, #採購價格允許人工修改
       staj027 LIKE staj_t.staj027, #修改容差率
       staj028 LIKE staj_t.staj028, #超出處理方式
       staj029 LIKE staj_t.staj029, #內外購
       staj030 LIKE staj_t.staj030, #匯率計算基準
       staj031 LIKE staj_t.staj031, #合約狀態
       staj032 LIKE staj_t.staj032, #原合約編號
       staj033 LIKE staj_t.staj033, #延期日期
       staj034 LIKE staj_t.staj034, #收銀方式
       staj035 LIKE staj_t.staj035, #續期日期
       staj036 LIKE staj_t.staj036, #文本蓋章否
       staj037 LIKE staj_t.staj037, #蓋章日期
       staj038 LIKE staj_t.staj038, #備註
       staj039 LIKE staj_t.staj039, #執行日期
       staj040 LIKE staj_t.staj040, #含發票否
       staj041 LIKE staj_t.staj041, #部門
       staj042 LIKE staj_t.staj042  #按法人結算
       END RECORD
       
 DEFINE p_stak RECORD  #自營合約異動申請單費用設定檔
       stakent LIKE stak_t.stakent, #企業編號
       stakunit LIKE stak_t.stakunit, #應用組織
       staksite LIKE stak_t.staksite, #營運據點
       stakdocno LIKE stak_t.stakdocno, #單號
       stakseq LIKE stak_t.stakseq, #項次
       stak003 LIKE stak_t.stak003, #費用編號
       stak004 LIKE stak_t.stak004, #會計期間
       stak005 LIKE stak_t.stak005, #價款類別
       stak006 LIKE stak_t.stak006, #計算類型
       stak007 LIKE stak_t.stak007, #費用週期
       stak008 LIKE stak_t.stak008, #費用週期方式
       stak009 LIKE stak_t.stak009, #條件基準
       stak010 LIKE stak_t.stak010, #計算基準
       stak011 LIKE stak_t.stak011, #費用淨額
       stak012 LIKE stak_t.stak012, #費用比率
       stak013 LIKE stak_t.stak013, #保底否
       stak014 LIKE stak_t.stak014, #保底金額
       stak015 LIKE stak_t.stak015, #保底扣率
       stak016 LIKE stak_t.stak016, #分量扣點
       stak017 LIKE stak_t.stak017, #生效日期
       stak018 LIKE stak_t.stak018, #失效日期
       stak019 LIKE stak_t.stak019, #下次計算日
       stak020 LIKE stak_t.stak020, #下次費用開始日
       stak021 LIKE stak_t.stak021, #下次費用截止日
       stak022 LIKE stak_t.stak022, #自定義範圍
       stak023 LIKE stak_t.stak023, #納入結算單否
       stak024 LIKE stak_t.stak024, #票扣否
       stak025 LIKE stak_t.stak025, #管理品類
       stak026 LIKE stak_t.stak026, #生效月份
       stak027 LIKE stak_t.stak027, #按自然月計費否
       stakacti LIKE stak_t.stakacti, #有效
       stak028 LIKE stak_t.stak028, #固定費用是否按法人收取
       stak029 LIKE stak_t.stak029, #促銷扣率
       stak030 LIKE stak_t.stak030  #促銷銷售額占比
       END RECORD
 #161111-00028#3 ---modify----end---------
 DEFINE l_oodbl004      LIKE oodbl_t.oodbl004
 DEFINE l_oodb005       LIKE oodb_t.oodb005
 DEFINE l_oodb006       LIKE oodb_t.oodb006
 DEFINE l_oodb011       LIKE oodb_t.oodb011
 DEFINE l_success       LIKE type_t.num5
 DEFINE l_stab002       LIKE stab_t.stab002
 DEFINE l_stab003       LIKE stab_t.stab003
 DEFINE l_stab004       LIKE stab_t.stab004
 DEFINE l_stab008       LIKE stab_t.stab008
 DEFINE l_acount        LIKE dema_t.dema037
 DEFINE l_acount_t      LIKE dema_t.dema037
 DEFINE l_rate          LIKE stak_t.stak012
 DEFINE l_stae005       LIKE stae_t.stae005
 DEFINE l_begin         LIKE type_t.dat
 DEFINE l_end           LIKE type_t.dat
 DEFINE l_nextd         LIKE type_t.dat
 DEFINE l_day           LIKE type_t.num5
 DEFINE l_exit          LIKE type_t.chr1
 DEFINE l_flag          LIKE type_t.chr1
 DEFINE l_year          LIKE type_t.num5
 DEFINE l_month         LIKE type_t.num5
 DEFINE l_sum           LIKE dema_t.dema037
 DEFINE l_sum1          LIKE dema_t.dema037
 DEFINE l_sum2          LIKE dema_t.dema037
 DEFINE l_cu            LIKE type_t.num5
 DEFINE l_cm            LIKE dema_t.dema037
 DEFINE l_sm            LIKE dema_t.dema037
 DEFINE l_acount_1      LIKE dema_t.dema037 
 DEFINE l_sum_acc       LIKE dema_t.dema037 
 DEFINE l_merch         STRING
 DEFINE l_rdir_merch    STRING
 DEFINE l_join_merch    STRING
 DEFINE l_cnt           LIKE type_t.num5    
 DEFINE l_errno         LIKE type_t.chr20   
 DEFINE l_stax005       LIKE stax_t.stax005 
 DEFINE l_caldate       LIKE type_t.dat     
 DEFINE l_ooef017       LIKE ooef_t.ooef017
 DEFINE l_stao003       LIKE stao_t.stao003
 
   WHENEVER ERROR CALL cl_err_msg_log
    
   LET r_success = TRUE
   INITIALIZE l_stbb.* TO NULL
   
  #SELECT * INTO l_staj.* #161111-00028#3--mark
  #161111-00028#3--ADD----BEGIN----------
   SELECT stajent,stajunit,stajsite,stajdocno,stajdocdt,staj000,staj001,staj002,staj003,staj004,
          staj005,staj006,staj007,staj008,staj009,staj010,staj011,staj012,staj013,staj014,staj015,
          staj016,staj017,staj018,staj019,staj020,staj021,staj022,stajacti,stajownid,stajowndp,
          stajcrtid,stajcrtdp,stajcrtdt,stajmodid,stajmoddt,stajstus,stajcnfid,stajcnfdt,staj023,
          staj024,staj025,staj026,staj027,staj028,staj029,staj030,staj031,staj032,staj033,staj034,
          staj035,staj036,staj037,staj038,staj039,staj040,staj041,staj042 INTO l_staj.*
  #161111-00028#3--ADD----END----------
     FROM staj_t
    WHERE stajent = g_enterprise
      AND stajdocno = p_stajdocno

   CALL s_asti206_check(l_staj.staj015,g_today,"astt320") RETURNING r_success,r_errno
   IF NOT r_success THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = r_errno
      LET g_errparam.extend = l_staj.staj001
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success = FALSE
      RETURN r_success
   END IF

   #如果是扣率代销，先判断下扣率代销的扣率有没有设置
   IF l_staj.staj002 = '3' THEN
      LET l_stao003 = cl_get_para(g_enterprise,g_site,'E-CIR-0045')
      IF cl_null(l_stao003) THEN
         LET r_success = FALSE
         RETURN r_success
      END IF 
   END IF
      
   #获取税率
   CALL s_tax_chk(g_site,l_staj.staj007) RETURNING l_success,l_oodbl004,l_oodb005,l_oodb006,l_oodb011
   IF NOT l_success THEN
      LET r_success = l_success          
      RETURN r_success
   END IF
   LET l_flag = 'N'
   LET l_success = TRUE
   LET l_stbb.stbbent = g_enterprise 
   LET l_stbb.stbbunit = l_staj.staj015
   LET l_stbb.stbbdocno = p_stbadocno
   LET l_stbb.stbb001 = p_stak.stak003
   LET l_stbb.stbb002 = l_staj.staj006
   #税逻辑调整：如果纳入结算单否=Y AND 票扣否=Y，给合同的税别，否则给费用编号设置的税别
   IF p_stak.stak023 = 'Y' AND p_stak.stak024 = 'Y' THEN
      LET l_stbb.stbb003 = l_staj.staj007          #给合同的费用编号对应的税
   ELSE
      SELECT stae010 INTO l_stbb.stbb003 FROM stae_t WHERE staeent = g_enterprise AND stae001 = p_stak.stak003
   END IF
   LET l_stbb.stbb004 = p_stak.stak005
   LET l_stbb.stbb010 = '1'
   LET l_stbb.stbb012 = l_staj.staj041
   LET l_stbb.stbb013 = '1'
   LET l_stbb.stbb015 = p_stak.stak023
   LET l_stbb.stbb016 = p_stak.stak024 
   LET l_stbb.stbb017 = ''
   LET l_stbb.stbbud001 = l_staj.staj040
   LET l_stbb.stbb019 = l_staj.staj039
   
   IF p_stak.stak006 = '2' THEN #固定
      CALL s_curr_round(g_site,l_staj.staj006,p_stak.stak011,'2') RETURNING l_stbb.stbb009  
   ELSE 
      ###########客制添加促销扣率 促销商品销售占比
      #促销商品销售占比不能为空时，促销扣率能不为空
      #情况一若扣率不为空。销售占比为空，则计算销售*标准扣率+促销金额*促销扣率
      #情况二若扣率不为空。销售占比不为空。则l_rate = 促销金额/（标准销售 + 促销金额） 
      #                   若l_rate <= 销售占比 ，则计算销售*标准扣率+促销金额*促销扣率
      #                   若l_rate > 销售占比，则（标准销售+促销金额）*占比*促销扣率 + （标准销售+促销金额）*（1-占比）*标准扣率
      #如果有设置促销扣率，不能有保底和分段，保底需要单独设置
      IF NOT cl_null(p_stak.stak029) AND (l_staj.staj002 = '3' OR l_staj.staj002 = 'A' OR l_staj.staj002 = 'B') THEN
         CALL astp304_expense_sum_amt(p_stak.stak010,l_staj.stajdocno,p_stak.stakseq,p_bdate,p_edate,'','','1','')
            RETURNING l_sm
         CALL astp304_expense_sum_amt(p_stak.stak010,l_staj.stajdocno,p_stak.stakseq,p_bdate,p_edate,'','','2','')
            RETURNING l_cm
         LET　l_sm = l_sm - l_cm           #l_sm正价销售额，l_cm促销销售额
         LET l_sum_acc = l_cm + l_sm       
         IF NOT cl_null(p_stak.stak030) THEN  #占比不为空
            #情况二
            LET l_rate = l_cm/(l_cm+l_sm)
            IF l_rate <= p_stak.stak030/100 THEN
               LET l_stbb.stbb009 = l_sm*p_stak.stak012/100 + l_cm*p_stak.stak029/100
            ELSE
               LET l_stbb.stbb009 = (l_cm+l_sm)*(p_stak.stak030/100)*(p_stak.stak029/100) + (l_cm+l_sm)*(1-p_stak.stak030/100)*(p_stak.stak012/100)                        
            END IF                      
          
         ELSE
            #情况一
            LET l_stbb.stbb009 = l_sm*p_stak.stak012/100 + l_cm*p_stak.stak029/100                   
         END IF
         CALL s_curr_round(g_site,l_staj.staj006,l_stbb.stbb009,'2') RETURNING l_stbb.stbb009
         
         #变动费用 若经营方式为3 扣率代销 AND 费用编号是扣率代销营运提成
         IF l_staj.staj002 = '3' AND cl_get_para(g_enterprise,g_site,'E-CIR-0045')=p_stak.stak003 THEN    
            CALL astp304_expense_sum_amt(p_stak.stak010,l_staj.stajdocno,p_stak.stakseq,p_bdate,p_edate,'','','3','')
               RETURNING l_acount_1
            IF cl_null(l_acount_1) THEN LET l_acount_1 = 0 END IF
            LET l_stbb.stbb009 = l_stbb.stbb009 - l_acount_1
            CALL s_curr_round(g_site,l_staj.staj006,l_stbb.stbb009,'2') RETURNING l_stbb.stbb009
         END IF
         ########
      ELSE
      #非扣率代销，且没有促销销售扣率的费用
         #有条件基准，先判读是否满足条件基准
         IF NOT cl_null(p_stak.stak009) THEN
            CALL astp304_expense_sum_amt(p_stak.stak009,l_staj.stajdocno,p_stak.stakseq,p_bdate,p_edate,'','','1','') RETURNING l_acount
            LET l_sum_acc = l_acount
            IF l_acount < p_stak.stak011 THEN
               LET l_success = FALSE
               LET l_stbb.stbb009 = 0
            END IF
         END IF
          
         IF NOT cl_null(p_stak.stak010) AND l_success = TRUE THEN
            CALL astp304_expense_sum_amt(p_stak.stak010,l_staj.stajdocno,p_stak.stakseq,p_bdate,p_edate,'','','1','') RETURNING l_acount
            LET l_sum_acc = l_acount
            #如果金额小于0也产生费用单
            IF cl_null(l_acount) THEN  
               LET l_acount = 0
            END IF
            
            LET l_rate = p_stak.stak012
            #保底否
            CASE p_stak.stak013
               WHEN '1' #无保底
                 
               WHEN '2' #保底
                 IF l_acount <  p_stak.stak014 THEN
                    LET l_acount = p_stak.stak014        #计算费用使用保底金额
                    LET l_rate = p_stak.stak015          #计算费用使用保底比率
                 END IF
             
               WHEN '3' #保底扣减
                  IF l_acount > p_stak.stak014 THEN
                     LET l_acount = l_acount - p_stak.stak014  #（基准金额 - 保底金额） 算费用
                     LET l_rate = p_stak.stak012               #计算费用使用费用比率
                  ELSE                                         #不计算费用
                     LET l_success = FALSE   
                  END IF   
            END CASE
            
            CASE p_stak.stak016
               WHEN '1' #无分段
                  IF NOT cl_null(l_rate) THEN
                     LET l_acount = l_acount*l_rate/100       
                  END IF
                  CALL s_curr_round(g_site,l_staj.staj006,l_acount,'2') RETURNING l_stbb.stbb009
               WHEN '2' #分段变异
                  SELECT SUM(CASE WHEN (stal004<=l_acount AND stal005 >=l_acount ) THEN (l_acount-stal004+1)*stal006/100    
                                 WHEN (stal005<=l_acount) THEN (stal005 -stal004+1)*stal006/100 
                                 WHEN (stal004>l_acount) THEN 0 END ) INTO l_acount               
                  FROM stal_t
                  WHERE stalent = g_enterprise AND staldocno = l_staj.stajdocno AND stalseq1 = p_stak.stakseq
                  
                  CALL s_curr_round(g_site,l_staj.staj006,l_acount,'2') RETURNING l_stbb.stbb009
                
                                   
               WHEN '3' #全局变异
                 SELECT  l_acount*stal006/ 100 INTO l_acount               
                  FROM stal_t
                 WHERE stalent = g_enterprise AND staldocno = l_staj.stajdocno AND stalseq1 = p_stak.stakseq
                   AND stal004<=l_acount AND stal005 >= l_acount
                 IF STATUS = 100 THEN
                    LET l_acount = 0      
                    CALL s_curr_round(g_site,l_staj.staj006,l_acount,'2') RETURNING l_stbb.stbb009 
                 ELSE
                     IF cl_null(l_acount) THEN LET l_acount = 0 END IF                     
                     CALL s_curr_round(g_site,l_staj.staj006,l_acount,'2') RETURNING l_stbb.stbb009
                 END IF
                
               WHEN '4' #全段金额
                 SELECT stal006 INTO l_acount               
                   FROM stal_t
                  WHERE stalent = g_enterprise AND staldocno = l_staj.stajdocno AND stalseq1 = p_stak.stakseq
                    AND stal004<=l_acount AND stal005 >= l_acount
                 IF STATUS = 100 THEN
                    LET l_acount = 0 
                    CALL s_curr_round(g_site,l_staj.staj006,l_acount,'2') RETURNING l_stbb.stbb009 
                 ELSE
                     IF cl_null(l_acount) THEN LET l_acount = 0 END IF                     
                     CALL s_curr_round(g_site,l_staj.staj006,l_acount,'2') RETURNING l_stbb.stbb009
                 END IF                
            END CASE
         END IF                            
         ########变动费用 若经营方式为3 扣率代销 AND 费用编号是扣率代销费用的营业提成#####
         #如果没有设置促销扣率，也会根据每天销售成本补差(按月或者按账期的才补)
         IF l_staj.staj002 = '3' AND cl_get_para(g_enterprise,g_site,'E-CIR-0045')=p_stak.stak003 AND 
            (p_stak.stak007 = '3' OR p_stak.stak007 = '5') THEN 
    
            CALL astp304_expense_sum_amt(p_stak.stak010,l_staj.stajdocno,p_stak.stakseq,p_bdate,p_edate,'','','3','')
               RETURNING l_acount_1
            IF cl_null(l_acount_1) THEN LET l_acount_1 = 0 END IF
            LET l_acount = l_acount - l_acount_1
            CALL s_curr_round(g_site,l_staj.staj006,l_acount,'2') RETURNING l_stbb.stbb009
         END IF
      END IF
   END IF
         
   #当费用核算制度为2.权责发生制 写入费用单的开始日期和截止日期，按照自然月以及天数拆分处理
   SELECT stae005 INTO l_stae005 FROM stae_t 
    WHERE staeent = g_enterprise AND stae001 = p_stak.stak003
   
   IF l_success = TRUE AND l_stbb.stbb009 <> 0 THEN
      IF l_stae005 = '2' THEN    
         LET l_acount_t = l_stbb.stbb009
         #根据费用开始和截止拆分
         LET l_begin = ''
         LET l_end = ''
         LET l_sum = 0
         WHILE TRUE
            #费用下次计算开始日-下次计算截止日
            CALL astp304_cal_nextd('3',p_bdate,p_edate,l_end,p_stak.stak027,'1',p_stajdocno,p_ooef017)
                 RETURNING l_begin,l_end
            IF l_end> = p_edate THEN
               LET l_end = p_edate
               LET l_exit = 'Y'   #退出循环标志 'Y' 退出
            ELSE
               LET l_exit = 'N'
            END IF
            LET l_day = l_end - l_begin+1
            LET l_stbb.stbb005 = l_begin
            LET l_stbb.stbb006 = l_end
   
            CALL s_asti206_get_period(l_stbb.stbb005,l_stbb.stbb006,l_staj.staj015,"astt320") 
                  RETURNING r_success,l_stbb.stbb007, 
                            l_year,#会计期年度
                            l_month #会计期月份
            LET l_stbb.stbb008 = l_year                
            LET l_stbb.stbb014 = l_month
            IF NOT r_success THEN
               RETURN r_success
            END IF
            IF l_exit = 'Y' THEN
               LET l_stbb.stbb009 = l_acount_t -l_sum
            ELSE 
               LET l_stbb.stbb009 = l_acount_t/(p_edate - p_bdate+1)*l_day
               CALL s_curr_round(g_site,l_staj.staj006,l_stbb.stbb009,'2') RETURNING l_stbb.stbb009
               LET l_sum = l_sum+ l_stbb.stbb009
            END IF
            CALL astp304_expense_share(l_staj.stajdocno,p_stak.stakseq,l_stbb.*,l_sum_acc,l_ooef017,l_begin,l_end,p_type) RETURNING r_success
            IF NOT r_success THEN
               RETURN r_success
            END IF
            IF l_exit = 'Y' THEN
               EXIT WHILE
            END IF
                         
         END WHILE
      ELSE
         #费用的开始截止日
         LET l_stbb.stbb005 = p_bdate
         LET l_stbb.stbb006 = p_edate
         CALL s_asti206_get_period(l_stbb.stbb005,l_stbb.stbb006,l_staj.staj015,"astt320") 
                 RETURNING r_success,l_stbb.stbb007, 
                           l_year,#会计期年度
                           l_month #会计期月份
          LET l_stbb.stbb008 = l_year                
          LET l_stbb.stbb014 = l_month               
         IF NOT r_success THEN
            RETURN r_success
         END IF
        
         CALL astp304_expense_share(l_staj.stajdocno,p_stak.stakseq,l_stbb.*,l_sum_acc,l_ooef017,p_bdate,p_edate,p_type) RETURNING r_success
         IF NOT r_success THEN
            RETURN r_success
         END IF     
      END IF 
      LET l_flag = 'Y'
   END IF
   
   RETURN r_success
   
END FUNCTION

################################################################################
# Descriptions...: 按照门店+管理品类拆分费用单项次
# Memo...........:
# Usage..........: CALL astp304_expense_share(p_stajdocno,p_stakseq,p_stbb,p_sum_acc,p_stbddocno,p_ooef017,p_bdate,p_edate,p_type)
#                  RETURNING TRUE/FALSE
# Input parameter: p_stajdocno    单据编号
#                : p_stakseq      费用项次
#                : p_stbb         费用单单身record
#                : p_sum_acc      金额
#                : p_ooef017      法人
#                : p_bdate        开始日期
#                : p_edate        结束日期
#                : p_type         分情况 1.情况一调用 2.情况二调用
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2016/01/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_expense_share(p_stajdocno,p_stakseq,p_stbb,p_sum_acc,p_ooef017,p_bdate,p_edate,p_type)
 DEFINE p_stajdocno LIKE staj_t.stajdocno
 DEFINE p_stakseq   LIKE stak_t.stakseq
 DEFINE p_sum_acc   LIKE dema_t.dema037 
 DEFINE p_ooef017   LIKE ooef_t.ooef017
 DEFINE p_bdate     LIKE type_t.dat
 DEFINE p_edate     LIKE type_t.dat
 DEFINE p_type      LIKE type_t.chr1
 DEFINE l_ooef017   LIKE ooef_t.ooef017
 #161111-00028#3---modify----begin--------
#DEFINE l_stak      RECORD LIKE stak_t.*
#DEFINE p_stbb      RECORD LIKE stbb_t.*
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
       stbb033 LIKE stbb_t.stbb033,  #銷售單位
       stbbud001 LIKE stbb_t.stbbud001
       END RECORD
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
       stbb033 LIKE stbb_t.stbb033,  #銷售單位
       stbbud001 LIKE stbb_t.stbbud001
       END RECORD
DEFINE l_stak RECORD  #自營合約異動申請單費用設定檔
       stakent LIKE stak_t.stakent, #企業編號
       stakunit LIKE stak_t.stakunit, #應用組織
       staksite LIKE stak_t.staksite, #營運據點
       stakdocno LIKE stak_t.stakdocno, #單號
       stakseq LIKE stak_t.stakseq, #項次
       stak003 LIKE stak_t.stak003, #費用編號
       stak004 LIKE stak_t.stak004, #會計期間
       stak005 LIKE stak_t.stak005, #價款類別
       stak006 LIKE stak_t.stak006, #計算類型
       stak007 LIKE stak_t.stak007, #費用週期
       stak008 LIKE stak_t.stak008, #費用週期方式
       stak009 LIKE stak_t.stak009, #條件基準
       stak010 LIKE stak_t.stak010, #計算基準
       stak011 LIKE stak_t.stak011, #費用淨額
       stak012 LIKE stak_t.stak012, #費用比率
       stak013 LIKE stak_t.stak013, #保底否
       stak014 LIKE stak_t.stak014, #保底金額
       stak015 LIKE stak_t.stak015, #保底扣率
       stak016 LIKE stak_t.stak016, #分量扣點
       stak017 LIKE stak_t.stak017, #生效日期
       stak018 LIKE stak_t.stak018, #失效日期
       stak019 LIKE stak_t.stak019, #下次計算日
       stak020 LIKE stak_t.stak020, #下次費用開始日
       stak021 LIKE stak_t.stak021, #下次費用截止日
       stak022 LIKE stak_t.stak022, #自定義範圍
       stak023 LIKE stak_t.stak023, #納入結算單否
       stak024 LIKE stak_t.stak024, #票扣否
       stak025 LIKE stak_t.stak025, #管理品類
       stak026 LIKE stak_t.stak026, #生效月份
       stak027 LIKE stak_t.stak027, #按自然月計費否
       stakacti LIKE stak_t.stakacti, #有效
       stak028 LIKE stak_t.stak028, #固定費用是否按法人收取
       stak029 LIKE stak_t.stak029, #促銷扣率
       stak030 LIKE stak_t.stak030  #促銷銷售額占比
       END RECORD
 #161111-00028#3---modify----end--------
 DEFINE l_sql       STRING      
 DEFINE l_site      LIKE stbb_t.stbbsite
 DEFINE l_class     LIKE staq_t.staq003
 DEFINE l_part_acc  LIKE dema_t.dema037 
 DEFINE r_success   LIKE type_t.num5
 DEFINE l_n         LIKE type_t.num5
 DEFINE l_stbn001   LIKE stbn_t.stbn001
 DEFINE l_staj002   LIKE staj_t.staj002
 DEFINE l_staj006   LIKE staj_t.staj006
 DEFINE l_staj015   LIKE staj_t.staj015
 DEFINE l_oodb002   LIKE oodb_t.oodb002   #税别
 DEFINE l_stbasite  LIKE stba_t.stbasite
 
    WHENEVER ERROR CALL cl_err_msg_log
 
    LET r_success = TRUE

    #若项次对应的为固定费用，不用分摊，品类优先取管理品类，取不到取主品类   
    #若项次对应的为变动费用，根据门店+管理品类去分摊费用
    #根据合同+项次抓取 扣项单身设置的自定义范围
    #若自定义范围为1或者3 包含门店范围，则取自定义范围门店。否则取合同的经营门店范围
    LET l_stbb.* =  p_stbb.*  
    SELECT staj002,staj006,staj015 INTO l_staj002,l_staj006,l_staj015 FROM staj_t WHERE stajent = g_enterprise AND stajdocno = p_stajdocno
    #161111-00028#3----   
   #SELECT * INTO l_stak.*  #161111-00028#3--mark
    #161111-00028#3----add----begin----------
    SELECT stakent,stakunit,staksite,stakdocno,stakseq,stak003,stak004,stak005,stak006,
           stak007,stak008,stak009,stak010,stak011,stak012,stak013,stak014,stak015,
           stak016,stak017,stak018,stak019,stak020,stak021,stak022,stak023,stak024,
           stak025,stak026,stak027,stakacti,stak028,stak029,stak030 INTO l_stak.*  
    #161111-00028#3----add----end----------
         FROM stak_t WHERE stakent = g_enterprise AND stakdocno = p_stajdocno AND stakseq = p_stakseq
    IF l_stak.stak006 = '2' THEN
       IF NOT cl_null(l_stak.stak025) THEN
          LET l_stbb.stbb011 = l_stak.stak025
       ELSE
          SELECT DISTINCT stam003 INTO l_stbb.stbb011 FROM stam_t WHERE stament = g_enterprise AND stamdocno = p_stajdocno AND stam005 = 'Y'
       END IF
       LET l_sql = " SELECT DISTINCT stbn001 FROM stbn_t,ooef_t ",
                   "  WHERE stbnent = ",g_enterprise," AND stbndocno = '",p_stajdocno,"' ",
                   "    AND stbnent = ooefent AND stbn001 = ooef001 AND ooef100 = '2' AND ooef109 <='",p_stbb.stbb006,"' "
       IF l_stak.stak022 = '1' OR l_stak.stak022 = '3' THEN
          LET l_sql = l_sql," AND EXISTS (SELECT 1 FROM stay_t WHERE stayent = stbnent AND staydocno = stbndocno AND stayseq1 = ",p_stakseq," AND stbn001 = stay004 AND stay002 = '1') "
       END IF
       IF NOT cl_null(p_ooef017) THEN
          #只产生对应法人的资料，且有费用账期才产生，可能有的签约门店已经无效了
          LET l_sql = l_sql,"    AND ooef017 = '",p_ooef017,"' "
          IF p_type = '1' THEN 
             LET l_sql = l_sql,"    AND EXISTS (SELECT 1 FROM stbw_t WHERE stbwent = stbnent AND stbwdocno = stbndocno AND stbw008 = ooef017 ",
                               "                   AND stbw001= '",p_stakseq,"' AND '",p_bdate,"' BETWEEN stbw002 AND stbw003 )"
          END IF 
       END IF

       PREPARE astp304_expense_share_sel_stbn_p FROM l_sql
       DECLARE astp304_expense_share_sel_stbn_c CURSOR FOR astp304_expense_share_sel_stbn_p
       FOREACH astp304_expense_share_sel_stbn_c INTO l_stbn001
          LET l_stbb.stbbsite = l_stbn001
          CALL astp304_expense_get_stbb019(p_stajdocno,l_stbb.stbb005,l_stbb.stbb006,l_stbb.stbbsite)           
             RETURNING  l_stbb.stbb018,l_stbb.stbb019  
          SELECT MAX(stbbseq)+1 INTO l_stbb.stbbseq 
            FROM stbb_tmp
           WHERE stbbent = g_enterprise 
             AND stbbdocno = l_stbb.stbbdocno
          IF cl_null(l_stbb.stbbseq) THEN 
             LET l_stbb.stbbseq = 1
          END IF 
          CALL astp304_expense_ins_stbb_tmp(l_stbb.*) RETURNING r_success    
          IF NOT r_success THEN
             LET r_success = FALSE
             RETURN r_success
          END IF 
          IF l_stak.stak028 = 'N' THEN
             EXIT FOREACH
          END IF         
       END FOREACH
    ELSE
       SELECT COUNT(*) INTO l_n FROM stay_t
        WHERE stayent = g_enterprise
          AND staydocno = p_stajdocno
          AND stayseq1 = p_stakseq
          AND stay002 ='1' 
       
       LET l_sql = " SELECT DISTINCT stbn001,ooef017 FROM stbn_t,ooef_t ",
                   "  WHERE stbnent = ",g_enterprise," AND ooefent = stbnent AND ooef001 = stbn001 ",
                   "    AND stbndocno = '",p_stajdocno,"'"
       IF l_n > 0 AND (l_stak.stak022 = '1' OR l_stak.stak022 = '3') THEN
          LET l_sql = l_sql,
                   "    AND EXISTS (SELECT 1 FROM stay_t WHERE stayent = stbnent AND staydocno = stbndocno AND stayseq1 = ",p_stakseq,
                   "    AND stbn001 = stay004 AND stay002 = '1') "
       END IF
       IF NOT cl_null(p_ooef017) THEN
          LET l_sql = l_sql,"    AND ooef017 = '",p_ooef017,"' "
          IF p_type = '1' THEN 
             LET l_sql = l_sql," AND EXISTS (SELECT 1 FROM stbw_t WHERE stbwent = stbnent AND stbwdocno = stbndocno AND stbw008 = ooef017 ",
                               " AND stbw001 = '",p_stakseq,"' AND '",p_bdate,"' BETWEEN stbw002 AND stbw003 ) "
          END IF 
       END IF
       
       PREPARE astp304_expense_share_sel_site FROM l_sql
       DECLARE astp304_expense_share_cur_site CURSOR FOR astp304_expense_share_sel_site
       #定义抓取的经营品类
       LET l_sql = " SELECT DISTINCT stam003 FROM stam_t WHERE stament = ",g_enterprise," AND stamdocno = '",p_stajdocno,"' "
       PREPARE astp304_expense_share_sel_class FROM l_sql
       DECLARE astp304_expense_share_cur_class CURSOR FOR astp304_expense_share_sel_class
       
       #抓取出需要哪些门店一起分摊费用
       FOREACH astp304_expense_share_cur_site INTO l_site,l_ooef017
          FOREACH astp304_expense_share_cur_class INTO l_class
              CALL astp304_expense_sum_amt(l_stak.stak010,p_stajdocno,l_stak.stakseq,p_bdate,p_edate,l_site,l_class,'1','') RETURNING l_part_acc
              IF cl_null(l_part_acc) OR l_part_acc = 0 THEN
                 CONTINUE FOREACH
              END IF
              SELECT MAX(stbbseq)+1 INTO l_stbb.stbbseq
                FROM stbb_tmp
               WHERE stbbent = g_enterprise
                 AND stbbdocno = l_stbb.stbbdocno
              IF cl_null(l_stbb.stbbseq) THEN 
                 LET l_stbb.stbbseq = 1
              END IF 
              LET l_stbb.stbb009 = p_stbb.stbb009*(l_part_acc/p_sum_acc)
              CALL s_curr_round(g_site,l_staj006,l_stbb.stbb009,'2') RETURNING l_stbb.stbb009
              LET l_stbb.stbbsite = l_site
              LET l_stbb.stbb011 = l_class
              #扣率代销的费用，费用周期为3.按月和5.按帐期的费用产生成本补差
              IF l_staj002 = '3' AND cl_get_para(g_enterprise,g_site,'E-CIR-0045')=l_stak.stak003 THEN
                 IF l_stak.stak007 = '3' OR l_stak.stak007 = '5' THEN 
                    CALL astp304_expense_ins_stby_tmp(p_stajdocno,l_stbb.*) RETURNING r_success
                 END IF 
              ELSE
                 ##根据开始日期结束日期抓取结算账期和结算日期
                 CALL astp304_expense_get_stbb019(p_stajdocno,l_stbb.stbb005,l_stbb.stbb006,l_stbb.stbbsite)           
                    RETURNING  l_stbb.stbb018,l_stbb.stbb019
                 CALL astp304_expense_ins_stbb_tmp(l_stbb.*) RETURNING r_success
              END IF
              IF NOT r_success THEN
                 RETURN r_success
              END IF
          END FOREACH
       END FOREACH
    END IF

    RETURN TRUE
END FUNCTION

################################################################################
# Descriptions...: 新增费用单身临时表
# Memo...........:
# Usage..........: CALL astp304_expense_ins_stbb_tmp(p_stbb)
#                  RETURNING r_success
# Input parameter: p_stbb
# Return code....: r_success
# Date & Author..: 2016/01/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_expense_ins_stbb_tmp(p_stbb)
#161111-00028#3--modify--begin------
#DEFINE   p_stbb  RECORD LIKE stbb_t.*
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
       stbb033 LIKE stbb_t.stbb033,  #銷售單位
       stbbud001 LIKE stbb_t.stbbud001
       END RECORD
 #161111-00028#3--modify--end------      
   #INSERT INTO stbb_tmp VALUES(p_stbb.*)  #161111-00028#3-mark
   #161111-00028#3--add---begin-------
     INSERT INTO stbb_tmp (stbbent,stbbunit,stbbsite,stbbdocno,stbbseq,stbb001,stbb002,stbb003,stbb004,
                           stbb005,stbb006,stbb007,stbb008,stbb009,stbb010,stbb011,stbb012,stbb013,stbb014,
                           stbb015,stbb016,stbb017,stbb018,stbb019,stbb020,stbb021,stbb022,stbb023,stbb024,
                           stbb025,stbb026,stbb027,stbb028,stbb029,stbb030,stbb031,stbb032,stbb033,stbbud001)
        VALUES(p_stbb.stbbent,p_stbb.stbbunit,p_stbb.stbbsite,p_stbb.stbbdocno,p_stbb.stbbseq,p_stbb.stbb001,p_stbb.stbb002,p_stbb.stbb003,p_stbb.stbb004,
               p_stbb.stbb005,p_stbb.stbb006,p_stbb.stbb007,p_stbb.stbb008,p_stbb.stbb009,p_stbb.stbb010,p_stbb.stbb011,p_stbb.stbb012,p_stbb.stbb013,p_stbb.stbb014,
               p_stbb.stbb015,p_stbb.stbb016,p_stbb.stbb017,p_stbb.stbb018,p_stbb.stbb019,p_stbb.stbb020,p_stbb.stbb021,p_stbb.stbb022,p_stbb.stbb023,p_stbb.stbb024,
               p_stbb.stbb025,p_stbb.stbb026,p_stbb.stbb027,p_stbb.stbb028,p_stbb.stbb029,p_stbb.stbb030,p_stbb.stbb031,p_stbb.stbb032,p_stbb.stbb033,p_stbb.stbbud001)
   #161111-00028#3--add---end---------
    IF SQLCA.sqlcode THEN
       INITIALIZE g_errparam TO NULL
       LET g_errparam.code = SQLCA.sqlcode
       LET g_errparam.extend = 'ins stbb_tmp'
       LET g_errparam.popup = TRUE
       CALL cl_err()
       RETURN FALSE
    END IF
    RETURN TRUE
    
END FUNCTION

################################################################################
# Descriptions...: 根据基准算　计算金额/条件金额
# Memo...........: 扣率代销才计算销售额或者促销销售额
# Usage..........: CALL astp304_expense_sum_amt(p_stab001,p_stajdocno,p_stakseq,p_bdate,p_edate,p_site,p_class,p_type,p_oodb002)
#                  RETURNING r_amt
# Input parameter: p_stab001      计算基准/条件基准
#                : p_stajdocno    单据编号
#                : p_stakseq      费用项次
#                : p_bdate        开始日期
#                : p_edate        截止日期
#                : p_ste          所属组织
#                : p_class        所属品类
#                : p_type         类型 1.销售额 2.促销销售额 3.底稿销售抽成金额
#                : p_oodb002      税别
# Return code....: r_amt          金额
# Date & Author..: 2016/1/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_expense_sum_amt(p_stab001,p_stajdocno,p_stakseq,p_bdate,p_edate,p_site,p_class,p_type,p_oodb002)
 DEFINE p_stab001       LIKE stab_t.stab001   #计算基准/条件基准
 DEFINE p_stajdocno     LIKE staj_t.stajdocno #单据编号
 DEFINE p_stakseq       LIKE stak_t.stakseq   #合同费用项次
 DEFINE p_bdate         LIKE stak_t.stak020   #开始日期
 DEFINE p_edate         LIKE stak_t.stak021   #截至日期
 DEFINE p_site          LIKE stbb_t.stbbsite  #所属组织
 DEFINE p_class         LIKE stam_t.stam003   #所属品类
 DEFINE p_oodb002       LIKE oodb_t.oodb002   #税别
 DEFINE p_type         LIKE type_t.chr1       #类型 1.销售额 2.促销销售额 3.底稿销售抽成金额 A.入库金额 B.退厂金额 C.供应商往来金额
 DEFINE r_amt           LIKE pmdt_t.pmdt039   #金额
 #161111-00028#3--modify--begin------
 #DEFINE l_stab          RECORD LIKE stab_t.*
 DEFINE l_stab RECORD  #合約計算及條件基準基本資料檔
       stabent LIKE stab_t.stabent, #企業編號
       stab001 LIKE stab_t.stab001, #基準編號
       stab002 LIKE stab_t.stab002, #含稅否
       stab003 LIKE stab_t.stab003, #收貨入庫
       stab004 LIKE stab_t.stab004, #退廠
       stab005 LIKE stab_t.stab005, #配送物流
       stab006 LIKE stab_t.stab006, #跨區調撥
       stab007 LIKE stab_t.stab007, #訂貨
       stab008 LIKE stab_t.stab008, #实收金额
       stab009 LIKE stab_t.stab009, #銷退
       stab010 LIKE stab_t.stab010, #包含折扣
       stab011 LIKE stab_t.stab011, #備註
       stabownid LIKE stab_t.stabownid, #資料所有者
       stabowndp LIKE stab_t.stabowndp, #資料所屬部門
       stabcrtid LIKE stab_t.stabcrtid, #資料建立者
       stabcrtdp LIKE stab_t.stabcrtdp, #資料建立部門
       stabcrtdt LIKE stab_t.stabcrtdt, #資料創建日
       stabmodid LIKE stab_t.stabmodid, #資料修改者
       stabmoddt LIKE stab_t.stabmoddt, #最近修改日
       stabstus LIKE stab_t.stabstus, #狀態碼
       stab012 LIKE stab_t.stab012, #款別金額
       stab013 LIKE stab_t.stab013, #會員積分
       stab014 LIKE stab_t.stab014  #銷售成本
       END RECORD
 #161111-00028#3--modify--end------
 DEFINE l_staj002       LIKE staj_t.staj002   #经营方式
 DEFINE l_staj005       LIKE staj_t.staj005   #供应商
 DEFINE l_stak022       LIKE stak_t.stak022   #自定义范围
 DEFINE l_staj001       LIKE staj_t.staj001
 DEFINE l_sql           STRING
 DEFINE l_merch         STRING                #自定义商品范围-正向
 DEFINE l_rdir_merch    STRING                #自定义商品范围-反向
 DEFINE l_join_merch    STRING                #自定义商品范围
 DEFINE l_effect_month  STRING                #生效月份
 DEFINE l_where_stbc    STRING                #是否存在结算底稿
 DEFINE l_where_stajdocno STRING              #合同+原合同
 DEFINE l_stak007       LIKE stak_t.stak007   #费用周期

   WHENEVER ERROR CALL cl_err_msg_log

   #根据合同，项次抓取 自定义范围类型
   SELECT stak007,stak022 INTO l_stak007,l_stak022 FROM stak_t   
    WHERE stakent = g_enterprise AND stak001 = p_stajdocno AND stakseq = p_stakseq
     
   #抓取基准编号是含税还是未税
  #SELECT * INTO l_stab.*   #161111-00028#3--mark
  #161111-00028#3---add----begin-----------
   SELECT stabent,stab001,stab002,stab003,stab004,stab005,stab006,stab007,stab008,stab009,stab010,
          stab011,stabownid,stabowndp,stabcrtid,stabcrtdp,stabcrtdt,stabmodid,stabmoddt,stabstus,
          stab012,stab013,stab014 INTO l_stab.*
  #161111-00028#3---add----end-----------
    FROM stab_t
    WHERE stabent = g_enterprise AND stab001 = p_stab001
   
   SELECT staj001,staj002,staj005 INTO l_staj001,l_staj002,l_staj005 FROM staj_t
    WHERE stajent = g_enterprise
      AND stajdocno = p_stajdocno
   LET l_where_stajdocno = "('",l_staj001,"')"

   #生效月份
   CALL  astp304_expense_effect_month(p_stajdocno,p_stakseq) RETURNING l_effect_month
   
   #根据合同，项次抓取自定义门店范围和商品范围分别组成imaa ，where的sql条件
   #区分正向和反向
   CALL astp304_expense_merch_sel(p_stajdocno,p_stakseq) RETURNING l_merch 
   CALL astp304_expense_rdir_merch_sel(p_stajdocno,p_stakseq) RETURNING l_rdir_merch
   IF cl_null(l_merch) THEN
      LET l_merch = " 1=1"
   END IF
   IF NOT cl_null(l_rdir_merch) THEN
      LET l_join_merch = l_merch," AND NOT (",l_rdir_merch,")"
   ELSE
      LET l_join_merch = l_merch
   END IF  
   LET l_merch = l_join_merch 
   
   #1.入库/退厂金额
   #2.一般销售金额
   #3.扣率代销 销售金额
   #4.扣率代销 促销销售金额
   #5.款别金额
   
   #1.入库/退厂金额
   IF l_stab.stab003 = 'Y' THEN
      #含税抓pmdt039，未税抓pmdt038
      IF l_stab.stab002 = 'Y' THEN
         LET l_sql = " SELECT SUM(CASE pmds000 WHEN '7' THEN pmdt039*(-1) ELSE pmdt039 END)"
      ELSE
         LET l_sql = " SELECT SUM(CASE pmds000 WHEN '7' THEN pmdt038*(-1) ELSE pmdt038 END)"
      END IF
      LET l_sql = l_sql,
                     "   FROM pmds_t,pmdt_t,imaa_t",
                     "  WHERE pmdtent =pmdsent  AND pmdtdocno = pmdsdocno  AND pmdsstus = 'S' ",
                     "    AND pmdt212 IN ",l_where_stajdocno,
                     "    AND pmdsent= '",g_enterprise,"' ",
                     "    AND pmdsdocdt BETWEEN '",p_bdate,"' AND '",p_edate,"'",
                     "    AND pmdt006 = imaa001 AND imaaent = pmdtent " 
      #stab004，是否包括退厂单
      IF l_stab.stab004 = 'Y' THEN
         LET l_sql = l_sql,
                     "    AND pmds000 IN ('3','4','6','7','27') "
      ELSE
         LET l_sql = l_sql,
                     "    AND pmds000 IN ('3','4','6','27') "
      END IF
      IF p_type = 'A' THEN
         LET l_sql = l_sql,
                     "    AND pmds000 IN ('3','4','6') "
      END IF
      IF p_type = 'B' THEN
         LET l_sql = l_sql,
                     "    AND pmds000 IN ('7') "
      END IF
      IF p_type = 'C' THEN
         LET l_sql = l_sql,
                     "    AND pmds000 IN ('27') "
      END IF
      #如果有传门店，抓门店的金额
      IF NOT cl_null(p_site) THEN
         LET l_sql = l_sql,
                     "    AND pmdtsite = '",p_site,"'"
      END IF
      #如果有传管理品类，抓这个管理品类的金额
      IF NOT cl_null(p_class) THEN
         LET l_sql = l_sql,
                     "    AND imaa009 IN (SELECT rtaw002 FROM rtaw_t WHERE rtawent = ",g_enterprise," AND rtaw001 = '",p_class,"')"
      END IF
      #如果有传税别，抓这个税别的金额
      IF NOT cl_null(p_oodb002) THEN
         LET l_sql = l_sql,
                     "    AND pmdt046 = '",p_oodb002,"' "
      END IF
      #加上生效月份的条件
      IF NOT cl_null(l_effect_month) THEN
         LET l_sql = l_sql,
                     "    AND to_number(to_char(pmdsdocdt,'mm')) IN ",l_effect_month
      END IF
      #有设置门店范围/商品范围
      IF l_stak022 = '1' THEN
        LET l_sql = l_sql,
                     "    AND pmdtsite IN (SELECT stay004 FROM stay_t WHERE stayent = '",g_enterprise,"' AND staydocno = '",p_stajdocno,"'",
                     "                                                  AND stayseq1 = '",p_stakseq,"' AND stay002 = '1')"
      END IF
      IF l_stak022 = '2' THEN
         LET l_sql = l_sql,
                     "    AND ",l_join_merch
      END IF
      IF l_stak022 = '3' THEN
         LET l_sql = l_sql,
                     "    AND pmdtsite IN (SELECT stay004 FROM stay_t WHERE stayent = '",g_enterprise,"' AND staydocno = '",p_stajdocno,"'",
                     "                                                  AND stayseq1 = '",p_stakseq,"' AND stay002 = '1')",
                     "    AND ",l_join_merch
      END IF
      #是否结算单已经产生过费用了
      IF l_stak007='5' THEN
         LET l_sql = l_sql,"    AND ",l_where_stbc
      END IF
      PREPARE astp304_expense_sum_amt_pmdt039 FROM l_sql
      EXECUTE astp304_expense_sum_amt_pmdt039 INTO r_amt
      IF cl_null(r_amt) THEN LET r_amt = 0 END IF
      RETURN r_amt
   END IF
   #2.一般销售金额
   #如果是自营的合同，从debf统计销售额
   IF l_stab.stab008 = 'Y' AND l_staj002 = '1' THEN
      #含税抓 实收金额debf047，未税抓未税金额debf025
      IF l_stab.stab002 = 'Y' THEN
         LET l_sql = "  SELECT SUM(COALESCE(debf047,0))"
      ELSE
         LET l_sql = "  SELECT SUM(COALESCE(debf025,0))"
      END IF
      LET l_sql = l_sql,
                  "    FROM debf_t,imaa_t,stas_t,star_t ",
                  "   WHERE debfent = '",g_enterprise,"' AND debf002 BETWEEN '",p_bdate,"' AND '",p_edate,"'",
                  "     AND debf014 = '",l_staj005,"'",
                  "     AND stassite = starsite AND stas001 = star001 AND stas003 = debf009 and stassite = debfsite ",
                  "     AND star003 = debf014 AND star004 IN ",l_where_stajdocno,
                  "     AND debfent = imaaent AND debf009 = imaa001 "
      IF NOT cl_null(p_site) THEN
         LET l_sql = l_sql,
                  "     AND debfsite = '",p_site,"'"
      END IF
      IF NOT cl_null(p_class) THEN
         LET l_sql = l_sql,
                  "     AND imaa009 IN (SELECT rtaw002 FROM rtaw_t WHERE rtawent = ",g_enterprise," AND rtaw001 = '",p_class,"')"
      END IF
      #如果有传税别，抓这个税别的金额
      IF NOT cl_null(p_oodb002) THEN
         LET l_sql = l_sql,
                     "    AND debf018 = '",p_oodb002,"' "
      END IF
      IF NOT cl_null(l_effect_month) THEN
         LET l_sql = l_sql,
                  "     AND to_number(to_char(debf002,'mm') IN ",l_effect_month
      END IF
      IF l_stak022 = '1' THEN
         LET l_sql = l_sql,
                  "     AND debfsite IN (SELECT stay004 FROM stay_t WHERE stayent = '",g_enterprise,"' AND staydocno = '",p_stajdocno,"'",
                     "                                                  AND stayseq1 = '",p_stakseq,"' AND stay002 = '1')"
      END IF
      IF l_stak022 = '2' THEN
         LET l_sql = l_sql,
                  "     AND ",l_join_merch
      END IF
      IF l_stak022 = '3' THEN
         LET l_sql = l_sql,
                  "     AND debfsite IN (SELECT stay004 FROM stay_t WHERE stayent = '",g_enterprise,"' AND staydocno = '",p_stajdocno,"'",
                     "                                                  AND stayseq1 = '",p_stakseq,"' AND stay002 = '1')",
                  "     AND ",l_join_merch
      END IF
      PREPARE s_expense_astp321_sum_amt_debf047 FROM l_sql
      EXECUTE s_expense_astp321_sum_amt_debf047 INTO r_amt
      IF cl_null(r_amt) THEN LET r_amt = 0 END IF
      RETURN r_amt
   END IF
   
   #3.扣率代销销售金额/促销销售金额
   #如果是扣率代销,直接从stbc统计,stbc042销售金额/stbcud013促销销售金额
   IF l_stab.stab008 = 'Y' AND l_staj002 = '3' AND (p_type = '1' OR p_type = '2') THEN
      IF p_type = '1' THEN
         IF l_stab.stab002 = 'Y' THEN
            LET l_sql = "  SELECT SUM(COALESCE(stby009,0))"
         ELSE
            LET l_sql = "  SELECT SUM(COALESCE(stby009,0))"
         END IF
      ELSE
         IF l_stab.stab002 = 'Y' THEN
            LET l_sql = "  SELECT SUM(COALESCE(stby019,0))"
         ELSE
            LET l_sql = "  SELECT SUM(COALESCE(stby019,0))"
         END IF
      END IF
      LET l_sql = l_sql,
                  "    FROM stby_t,imaa_t ",
                  "   WHERE stbyent = '",g_enterprise,"' AND stby001 BETWEEN '",p_bdate,"' AND '",p_edate,"'",
                  "     AND stby005 = '",l_staj005,"'  AND stby013 IN ('1','7')",
                  "     AND stby020 IN ",l_where_stajdocno,
                  "     AND stbyent = imaaent AND stby002 = imaa001 "
      IF NOT cl_null(p_site) THEN
         LET l_sql = l_sql,
                  "     AND stbysite = '",p_site,"'"
      END IF
      IF NOT cl_null(p_class) THEN
         LET l_sql = l_sql,
                  "     AND imaa009 IN (SELECT rtaw002 FROM rtaw_t WHERE rtawent = ",g_enterprise," AND rtaw001 = '",p_class,"')"
      END IF

      IF NOT cl_null(l_effect_month) THEN
         LET l_sql = l_sql," AND to_number(to_char(stby001,'mm')) IN ",l_effect_month
      END IF
      IF l_stak022 = '1' THEN
         LET l_sql = l_sql,
                  "     AND stbysite IN (SELECT stay004 FROM stay_t WHERE stayent = '",g_enterprise,"' AND staydocno = '",p_stajdocno,"'",
                  "                                                   AND stayseq1 = '",p_stakseq,"' AND stay002 = '1')"
      END IF
      IF l_stak022 = '2' THEN
         LET l_sql = l_sql,
                  "     AND ",l_join_merch
      END IF
      IF l_stak022 = '3' THEN
         LET l_sql = l_sql,
                  "     AND stbysite IN (SELECT stay004 FROM stay_t WHERE stayent = '",g_enterprise,"' AND staydocno = '",p_stajdocno,"'",
                  "                                                  AND stayseq1 = '",p_stakseq,"' AND stay002 = '1')",
                  "     AND ",l_join_merch
      END IF
      PREPARE astp304_expense_sum_amt_stbc042 FROM l_sql
      EXECUTE astp304_expense_sum_amt_stbc042 INTO r_amt
      IF cl_null(r_amt) THEN LET r_amt = 0 END IF
      RETURN r_amt
   END IF
   
   #扣率代销每天销售成本的抽成金额
   IF l_stab.stab008 = 'Y' AND l_staj002 = '3' AND p_type = '3' THEN
      LET l_sql = " SELECT  SUM(stby011) FROM stby_t",
                  "   LEFT OUTER JOIN imaa_t ON stbyent = imaaent AND stby002 = imaa001 ", 
                  "  WHERE stbyent =",g_enterprise," AND stby013 IN ('1','7') ",
                  "    AND stby020 IN ",l_where_stajdocno,
                  "    AND stby001 BETWEEN '",p_bdate,"' AND '",p_edate,"'"
      IF l_stak022 = '1' THEN
         LET l_sql = l_sql," AND stbysite IN (SELECT stay004 FROM stay_t WHERE stayent = '",g_enterprise,"' AND staydocno = '",p_stajdocno,"'",
                  "                                                  AND stayseq1 = '",p_stakseq,"' AND stay002 = '1')"
      END IF
      IF l_stak022 = '2' THEN
         LET l_sql = l_sql," AND ",l_join_merch
      END IF
      IF l_stak022 = '3' THEN
         LET l_sql = l_sql," AND stbysite IN (SELECT stay004 FROM stay_t WHERE stayent = '",g_enterprise,"' AND staydocno = '",p_stajdocno,"'",
                  "                                                  AND stayseq1 = '",p_stakseq,"' AND stay002 = '1')",
                           " AND ",l_join_merch
      END IF            
      PREPARE astp304_expense_sum_amt_stbc042_stbc018 FROM l_sql
      EXECUTE astp304_expense_sum_amt_stbc042_stbc018 INTO r_amt
      IF cl_null(r_amt) THEN LET r_amt = 0 END IF
      RETURN r_amt
   END IF
   
   #4.联营租赁 销售金额/促销销售金额
   #如果是扣率代销,直接从stbc统计
   IF l_stab.stab008 = 'Y' AND (l_staj002 = 'A' OR l_staj002 = 'B') THEN
      LET l_sql = " SELECT SUM(COALESCE(stby009,0)) ",   #正价销售额
                  "   FROM stby_t LEFT OUTER JOIN rtdx_t ON stbysite = rtdxsite AND stbyent = rtdxent AND stby002 = rtdx001 ",
                  "               LEFT OUTER JOIN inaa_t ON stbyent = inaaent AND stbysite = inaasite AND rtdx044 = inaa001 ",
                  "               LEFT OUTER JOIN imaa_t ON (stbyent = imaaent AND stby002 = imaa001) ",
                  "  WHERE stbyent = ",g_enterprise," AND stby005 = '",l_staj005,"' ",
                  "    AND stby020 IN ",l_where_stajdocno,
                  "    AND rtdx003 = '",l_staj002,"' AND stby001 BETWEEN '",p_bdate,"'  AND '",p_edate,"' "
      #从库区判断是促销库区还是常规库区，抓对应的销售额
      IF p_type = '1' THEN
         LET l_sql = l_sql,
                     "    AND inaa135 = '1' "
      ELSE
         LET l_sql = l_sql,
                     "    AND inaa135 = '2' "
      END IF
      IF NOT cl_null(p_site) THEN
         LET l_sql = l_sql,
                  "     AND stbysite = '",p_site,"'"
      END IF
      IF NOT cl_null(p_class) THEN
         LET l_sql = l_sql,
                  "     AND imaa009 IN (SELECT rtaw002 FROM rtaw_t WHERE rtawent = ",g_enterprise," AND rtaw001 = '",p_class,"')"
      END IF

      IF NOT cl_null(l_effect_month) THEN
         LET l_sql = l_sql,
                  "     AND to_number(to_char(stby001,'mm')) IN ",l_effect_month
      END IF
      IF l_stak022 = '1' THEN
         LET l_sql = l_sql,
                  "     AND stbysite IN (SELECT stay004 FROM stay_t WHERE stayent = '",g_enterprise,"' AND staydocno = '",p_stajdocno,"'",
                  "                                                  AND stayseq1 = '",p_stakseq,"' AND stay002 = '1')"
      END IF
      IF l_stak022 = '2' THEN
         LET l_sql = l_sql,
                  "     AND ",l_join_merch
      END IF
      IF l_stak022 = '3' THEN
         LET l_sql = l_sql,
                  "     AND stbysite IN (SELECT stay004 FROM stay_t WHERE stayent = '",g_enterprise,"' AND staydocno = '",p_stajdocno,"'",
                  "                                                  AND stayseq1 = '",p_stakseq,"' AND stay002 = '1')",
                  "     AND ",l_join_merch
      END IF
      PREPARE astp304_expense_sum_amt_stbc0421 FROM l_sql
      EXECUTE astp304_expense_sum_amt_stbc0421 INTO r_amt
      IF cl_null(r_amt) THEN LET r_amt = 0 END IF
      RETURN r_amt
   END IF
   #5.款别金额
   IF l_stab.stab012 = 'Y' THEN
      #合同费用单身自定义范围要设置卡种或者款别 才能计算
      IF l_stak022 = '0' OR l_stak022 = '1' THEN
         RETURN 0
      END IF
      CALL astp304_expense_pay_sel(p_stajdocno,p_stakseq) RETURNING l_merch
      CALL astp304_expense_rdir_pay_sel(p_stajdocno,p_stakseq) RETURNING l_rdir_merch
      IF cl_null(l_merch) THEN
         LET l_merch = " 1=1"
      END IF
      IF NOT cl_null(l_rdir_merch) THEN
         LET l_join_merch = l_merch," AND NOT (",l_rdir_merch,")"
      ELSE
         LET l_join_merch = l_merch
      END IF
      SELECT staj005 INTO l_staj005 FROM staj_t WHERE stajent = g_enterprise AND stajdocno = p_stajdocno
      LET l_sql = " SELECT SUM(COALESCE(rtje003,0)) ",
                  "   FROM rtja_t,rtje_t,rtjb_t ",
                  "   LEFT OUTER JOIN imaa_t ON rtjbent = imaaent AND rtjb004 = imaa001 ",
                  "   LEFT OUTER JOIN rtdx_t ON rtjb004 = rtdx001 AND rtjbent = rtdxent AND rtjbsite = rtdxsite ",
                  "   LEFT OUTER JOIN imaf_t ON rtdxsite = imafsite AND rtdxent = imafent AND imaf001 = rtdx001 ",
                  "  WHERE rtjaent = rtjbent AND rtjadocno = rtjbdocno  ",
                  "    AND rtjbent = rtjeent AND rtjbdocno = rtjedocno AND rtjbseq = rtjeseq  ",
                  "    AND rtjeent = ",g_enterprise," AND ",l_join_merch,
                  "    AND imaf153 = '",l_staj005,"' AND rtjadocdt BETWEEN '",p_bdate,"' AND '",p_edate,"'",
                  "    AND rtja032 <> '4'"
      IF NOT cl_null(p_site) THEN
         LET l_sql = l_sql," AND rtjesite = '",p_site,"'"
      END IF
      IF NOT cl_null(p_class) THEN
         LET l_sql = l_sql," AND imaa009 IN (SELECT rtaw002 FROM rtaw_t WHERE rtawent = ",g_enterprise," AND rtaw001 = '",p_class,"')"
      END IF
      IF l_stak022 = '3' THEN
         LET l_sql = l_sql," AND rtjesite IN (SELECT stay004 FROM stay_t WHERE stayent = '",g_enterprise,"' AND staydocno = '",p_stajdocno,"'",
                           "                                               AND stayseq1 = '",p_stakseq,"' AND stay002 = '1')"
      END IF
      IF NOT cl_null(l_effect_month) THEN
         LET l_sql = l_sql," AND to_number(to_char(rtjadocdt,'mm')) IN ",l_effect_month
      END IF
      PREPARE astp304_expense_sum_amt_rtje003 FROM l_sql
      EXECUTE astp304_expense_sum_amt_rtje003 INTO r_amt
      IF cl_null(r_amt) THEN LET r_amt = 0 END IF
      RETURN r_amt
   END IF
   
   RETURN r_amt
END FUNCTION

################################################################################
# Descriptions...: 取生效月份
# Memo...........:
# Usage..........: CALL astp304_expense_effect_month(p_stajdocno,p_stakseq)
#                  RETURNING r_str
# Input parameter: p_stajdocno    单据编号
#                : p_stakseq      费用项次
# Return code....: r_str          生效月份
# Date & Author..: 2016/01/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_expense_effect_month(p_stajdocno,p_stakseq)
DEFINE   p_stajdocno LIKE staj_t.stajdocno
DEFINE   p_stakseq   LIKE stak_t.stakseq
DEFINE   l_stak026   LIKE stak_t.stak026
DEFINE   r_str       STRING  
DEFINE   i           LIKE type_t.num5  

   SELECT stak026 INTO l_stak026 FROM stak_t WHERE stakent = g_enterprise AND stakdocno = p_stajdocno AND stakseq = p_stakseq
   #l_stao026 生效月字符 例：001 000 011 000 其中3月 8月 9月计算费用。其他月份不计算
   #r_str     返回生效范围的字符串    
   IF cl_null(l_stak026) THEN
      RETURN ''
   END IF
   FOR i = 1 TO 12
      IF l_stak026[i] = 1 THEN
         IF cl_null(r_str) THEN
            LET r_str = i
         ELSE
            LET r_str = r_str||','||i
         END IF         
      END IF      
   END FOR
   
   IF cl_null(r_str) THEN
      LET r_str = 0
   END IF  
   LET r_str = "(",r_str,")"  
   RETURN r_str
END FUNCTION

################################################################################
# Descriptions...: 抓取限定条件
# Memo...........:
# Usage..........: CALL astp304_expense_merch_sel(p_stajdocno,p_stakseq)
#                  RETURNING 回传参数
# Input parameter: p_stajdocno    单据编号
#                : p_stakseq      费用项次
# Return code....: r_str
# Date & Author..: 2016/01/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_expense_merch_sel(p_stajdocno,p_stakseq)
DEFINE p_stajdocno   LIKE staj_t.stajdocno
DEFINE p_stakseq   LIKE stak_t.stakseq
DEFINE l_sql       STRING
DEFINE l_str       STRING
DEFINE l_stay003   LIKE stay_t.stay003
DEFINE l_stay003_t LIKE stay_t.stay003
DEFINE l_stay004   LIKE stay_t.stay004

   LET l_str = ''
   DECLARE sel_stay CURSOR FOR SELECT stay003,stay004 FROM stay_t
                                WHERE stayent = g_enterprise AND staydocno = p_stajdocno AND stayseq1 = p_stakseq
                                  AND stay002 = '2' AND stay005 = '1'  ORDER BY stay003
   FOREACH sel_stay INTO l_stay003,l_stay004
      IF cl_null(l_stay003) THEN
         LET l_stay003_t = l_stay003
      END IF      
      IF l_stay003 = '4' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa001 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET l_str =l_str, " OR imaa001 = '",l_stay004,"'"
            ELSE
               LET l_str =l_str, ") AND (imaa001 = '",l_stay004,"'"
            END IF
         END IF      
      END IF
      IF l_stay003 = '5' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa009 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa009 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, ") AND (imaa009 = '",l_stay004,"'" 
            END IF
         END IF      
      END IF
   
      IF l_stay003 = '6' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa122 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa122 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa122 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = '7' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa131 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa131 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa131 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = '8' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa126 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa126 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa126 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = '9' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa127 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa127 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa127 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'A' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa128 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa128 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa128 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'B' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa129 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa129 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa129 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'C' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa132 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa132 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa132 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'D' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa133 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa133 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa133 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'E' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa134 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa134 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa134 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'F' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa135 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa135 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa135 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
       IF l_stay003 = 'G' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa136 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa136 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa136 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'H' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa137 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa137 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa137 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'I' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa138 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa138 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa138 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      IF l_stay003 = 'J' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa139 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa139 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa139 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'K' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa140 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa140 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa140 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
       IF l_stay003 = 'L' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa141 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa141 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa141 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      #############添加管理品类
      IF l_stay003 = '11' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa009 IN (SELECT rtaw002 FROM rtaw_t WHERE rtawent = ",g_enterprise," AND rtaw001 = '",l_stay004,"')"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa009 IN (SELECT rtaw002 FROM rtaw_t WHERE rtawent = ",g_enterprise," AND rtaw001 = '",l_stay004,"')"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa009 IN (SELECT rtaw002 FROM rtaw_t WHERE rtawent = ",g_enterprise," AND rtaw001 = '",l_stay004,"')" 
            END IF
         END IF      
      END IF       
      #############
      
      
      LET l_stay003_t = l_stay003      
   END FOREACH
   IF NOT cl_null(l_str) THEN
      LET l_str = l_str,")"
   END IF
   RETURN l_str
END FUNCTION

################################################################################
# Descriptions...: 抓取限定条件
# Memo...........:
# Usage..........: CALL astp304_expense_rdir_merch_sel(p_stajdocno,p_stakseq)
#                  RETURNING 回传参数
# Input parameter: p_stajdocno    单据编号
#                : p_stakseq      费用项次
# Return code....: r_str
# Date & Author..: 2016/01/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_expense_rdir_merch_sel(p_stajdocno,p_stakseq)
DEFINE p_stajdocno   LIKE staj_t.stajdocno
DEFINE p_stakseq   LIKE stak_t.stakseq
DEFINE l_sql       STRING
DEFINE l_str       STRING
DEFINE l_stay003   LIKE stay_t.stay003
DEFINE l_stay003_t LIKE stay_t.stay003
DEFINE l_stay004   LIKE stay_t.stay004

   LET l_str = ''
   DECLARE sel_rdir_stay CURSOR FOR SELECT stay003,stay004 FROM stay_t
                                WHERE stayent = g_enterprise AND staydocno = p_stajdocno AND stayseq1 = p_stakseq 
                                  AND stay002 = '2' AND stay005 = '-1' ORDER BY stay003
   FOREACH sel_rdir_stay INTO l_stay003,l_stay004
      IF cl_null(l_stay003) THEN
         LET l_stay003_t = l_stay003
      END IF      
      IF l_stay003 = '4' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa001 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET l_str =l_str, " OR imaa001 = '",l_stay004,"'"
            ELSE
               LET l_str =l_str, ") AND (imaa001 = '",l_stay004,"'"
            END IF
         END IF      
      END IF
      IF l_stay003 = '5' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa009 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa009 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, ") AND (imaa009 = '",l_stay004,"'" 
            END IF
         END IF      
      END IF
   
      IF l_stay003 = '6' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa122 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa122 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa122 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = '7' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa131 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa131 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa131 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = '8' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa126 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa126 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa126 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = '9' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa127 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa127 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa127 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'A' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa128 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa128 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa128 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'B' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa129 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa129 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa129 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'C' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa132 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa132 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa132 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'D' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa133 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa133 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa133 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'E' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa134 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa134 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa134 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'F' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa135 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa135 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa135 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
       IF l_stay003 = 'G' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa136 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa136 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa136 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'H' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa137 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa137 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa137 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'I' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa138 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa138 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa138 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      IF l_stay003 = 'J' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa139 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa139 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa139 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      IF l_stay003 = 'K' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa140 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa140 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa140 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
       IF l_stay003 = 'L' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa141 = '",l_stay004,"'"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa141 = '",l_stay004,"'"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa141 = '",l_stay004,"'"  
            END IF
         END IF      
      END IF
      
      #############添加管理品类
      IF l_stay003 = '11' THEN
         IF cl_null(l_str) THEN
            LET  l_str = " (imaa009 IN (SELECT rtaw002 FROM rtaw_t WHERE rtawent = ",g_enterprise," AND rtaw001 = '",l_stay004,"')"
         ELSE
            IF l_stay003_t = l_stay003 THEN
               LET  l_str =l_str, " OR imaa009 IN (SELECT rtaw002 FROM rtaw_t WHERE rtawent = ",g_enterprise," AND rtaw001 = '",l_stay004,"')"
            ELSE
               LET  l_str =l_str, " ) AND  (imaa009 IN (SELECT rtaw002 FROM rtaw_t WHERE rtawent = ",g_enterprise," AND rtaw001 = '",l_stay004,"')" 
            END IF
         END IF      
      END IF       
      #############
      
      
      LET l_stay003_t = l_stay003      
   END FOREACH
   IF NOT cl_null(l_str) THEN
      LET l_str = l_str,")"
   END IF
   
   RETURN l_str
END FUNCTION

################################################################################
# Descriptions...: 抓取限定条件
# Memo...........:
# Usage..........: CALL astp304_expense_pay_sel(p_stajdocno,p_stakseq)
#                  RETURNING r_str
# Input parameter: p_stajdocno    单据编号
#                : p_stakseq      费用项次
# Return code....: r_str          限定条件
# Date & Author..: 2016/01/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_expense_pay_sel(p_stajdocno,p_stakseq)
DEFINE p_stajdocno   LIKE staj_t.stajdocno
DEFINE p_stakseq   LIKE stak_t.stakseq
DEFINE l_sql       STRING
DEFINE l_str       STRING
DEFINE l_stay003   LIKE stay_t.stay003
DEFINE l_stay003_t LIKE stay_t.stay003
DEFINE l_stay004   LIKE stay_t.stay004

   LET l_str = ''
   DECLARE sel_stay1 CURSOR FOR SELECT stay003,stay004 FROM stay_t
                                WHERE stayent = g_enterprise AND staydocno = p_stajdocno AND stayseq1 = p_stakseq 
                                  AND stay002 = '2' AND stay005 = '1'  ORDER BY stay003
   FOREACH sel_stay1 INTO l_stay003,l_stay004
       IF cl_null(l_stay003) THEN
          LET l_stay003_t = l_stay003
       END IF
       IF l_stay003 = 'M' THEN       #卡
          IF cl_null(l_str) THEN
             LET l_str = " (rtje002 = （SELECT mman058 FROM mman_t WHERE mmanent = ",g_enterprise," AND  mman001 ='",l_stay004,"')"
          ELSE
             IF l_stay003_t = l_stay003 THEN
                LET l_str =l_str, " OR rtje002 = （SELECT mman058 FROM mman_t WHERE mmanent = ",g_enterprise," AND  mman001 ='",l_stay004,"')"
             ELSE
                LET l_str =l_str, ") AND (rtje002 = （SELECT mman058 FROM mman_t WHERE mmanent = ",g_enterprise," AND  mman001 ='",l_stay004,"')"
             END IF
          END IF          
       END IF
       IF l_stay003 = '12' THEN      #款别
          IF cl_null(l_str) THEN
            LET  l_str = " (rtje002 = '",l_stay004,"'"
          ELSE
             IF l_stay003_t = l_stay003 THEN
                LET  l_str =l_str, " OR rtje002 = '",l_stay004,"'"
             ELSE
                LET  l_str =l_str, ") AND (rtje002 = '",l_stay004,"'" 
             END IF
          END IF          
       END IF
        
       LET l_stay003_t = l_stay003 
   END FOREACH
   IF NOT cl_null(l_str) THEN
      LET l_str = l_str,")"
   END IF
   RETURN l_str
END FUNCTION

################################################################################
# Descriptions...: 抓取限定条件
# Memo...........:
# Usage..........: CALL astp304_expense_rdir_pay_sel(p_stajdocno,p_stakseq)
#                  RETURNING r_str
# Input parameter: p_stajdocno    单据编号
#                : p_stakseq      费用项次
# Return code....: r_str          限定条件
# Date & Author..: 2016/01/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_expense_rdir_pay_sel(p_stajdocno,p_stakseq)
DEFINE p_stajdocno   LIKE staj_t.stajdocno
DEFINE p_stakseq   LIKE stak_t.stakseq
DEFINE l_sql       STRING
DEFINE l_str       STRING
DEFINE l_stay003   LIKE stay_t.stay003
DEFINE l_stay003_t LIKE stay_t.stay003
DEFINE l_stay004   LIKE stay_t.stay004

   LET l_str = ''
   DECLARE sel_rdir_stay1 CURSOR FOR SELECT stay003,stay004 FROM stay_t
                                WHERE stayent = g_enterprise AND staydocno = p_stajdocno AND stayseq1 = p_stakseq 
                                  AND stay002 = '2' AND stay005 = '-1' ORDER BY stay003
   FOREACH sel_rdir_stay1 INTO l_stay003,l_stay004
       IF cl_null(l_stay003) THEN
          LET l_stay003_t = l_stay003
       END IF
       IF l_stay003 = 'M' THEN       #卡
          IF cl_null(l_str) THEN
             LET l_str = " (rtje002 = （SELECT mman058 FROM mman_t WHERE mmanent = ",g_enterprise," AND  mman001 ='",l_stay004,"')"
          ELSE
             IF l_stay003_t = l_stay003 THEN
                LET l_str =l_str, " OR rtje002 = （SELECT mman058 FROM mman_t WHERE mmanent = ",g_enterprise," AND  mman001 ='",l_stay004,"')"
             ELSE
                LET l_str =l_str, ") AND (rtje002 = （SELECT mman058 FROM mman_t WHERE mmanent = ",g_enterprise," AND  mman001 ='",l_stay004,"')"
             END IF
          END IF          
       END IF
       IF l_stay003 = '12' THEN      #款别
          IF cl_null(l_str) THEN
            LET  l_str = " (rtje002 = '",l_stay004,"'"
          ELSE
             IF l_stay003_t = l_stay003 THEN
                LET  l_str =l_str, " OR rtje002 = '",l_stay004,"'"
             ELSE
                LET  l_str =l_str, ") AND (rtje002 = '",l_stay004,"'" 
             END IF
          END IF          
       END IF
        
       LET l_stay003_t = l_stay003 
   END FOREACH
   IF NOT cl_null(l_str) THEN
      LET l_str = l_str,")"
   END IF
   RETURN l_str
END FUNCTION

################################################################################
# Descriptions...: 自营获取结算日期
# Memo...........:
# Usage..........: CALL s_expense_get_stbb019(p_stajdocno,p_sdate,p_edate,p_site)
#                  RETURNING l_stbb018,l_stbb019
# Input parameter: p_stajdocno    单据编号
#                : p_sdate        开始日期
#                : p_edate        结束日期
#                : p_site         营运据点
# Return code....: l_stbb018      结算账期
#                : l_stbb019      结算日期
# Date & Author..: 2016/01/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_expense_get_stbb019(p_stajdocno,p_sdate,p_edate,p_site)
DEFINE p_stajdocno    LIKE staj_t.stajdocno
DEFINE p_sdate        LIKE stbb_t.stbb005 
DEFINE p_edate        LIKE stbb_t.stbb006 
DEFINE p_site         LIKE stbb_t.stbbsite 
DEFINE l_type         LIKE type_t.chr20      #获取结算会计期计算方式  1.起始日期 2.结束日期
DEFINE l_staw005      LIKE staw_t.staw005
DEFINE l_stbb018      LIKE stbb_t.stbb018
DEFINE l_stbb019      LIKE stbb_t.stbb019

   INITIALIZE l_stbb018 TO NULL
   INITIALIZE l_stbb019 TO NULL
   INITIALIZE l_staw005 TO NULL 
   #获取结算会计期计算方式
   LET l_type = cl_get_para(g_enterprise,g_site,'E-CIR-0011')
   #根据开始日期判断
   IF l_type = '1' THEN
      SELECT stawseq,staw004,staw005 INTO l_stbb018,l_stbb019,l_staw005       
        FROM staw_t,ooef_t
       WHERE stawent = g_enterprise
         AND stawdocno = p_stajdocno
         AND staw002 <= p_sdate
         AND staw003 >= p_sdate         
         AND ooefent = stawent
         AND ooef017 = staw007
         AND ooef001 = p_site
      IF l_staw005 = 'Y' THEN
         #如果合同帐期已结算归到最大已结算的帐期的下一个账期
         SELECT MAX(stawseq)+1  INTO l_stbb018  
           FROM staw_t,ooef_t
          WHERE stawent = g_enterprise
            AND stawdocno = p_stajdocno
            AND staw005 = 'Y'
            AND ooefent = stawent
            AND ooef017 = staw007
            AND ooef001 = p_site
         SELECT staw004,staw005 INTO l_stbb019,l_staw005       
           FROM staw_t,ooef_t
          WHERE stawent = g_enterprise
            AND stawdocno = p_stajdocno
            AND stawseq = l_stbb018
            AND ooefent = stawent
            AND ooef017 = staw007
            AND ooef001 = p_site               
      END IF
   ELSE
      #根据结束日期判断
      SELECT stawseq,staw004,staw005 INTO l_stbb018,l_stbb019,l_staw005      
        FROM staw_t,ooef_t
       WHERE stawent = g_enterprise
         AND stawdocno = p_stajdocno
         AND staw002 <= p_edate
         AND staw003 >= p_edate
         AND ooefent = stawent
         AND ooef017 = staw007
         AND ooef001 = p_site
      IF l_staw005 = 'Y' THEN
         #如果合同帐期已结算归到最大已结算的帐期的下一个账期
         SELECT MAX(stawseq)+1  INTO l_stbb018 
           FROM staw_t,ooef_t
          WHERE stawent = g_enterprise
            AND stawdocno = p_stajdocno
            AND staw005 = 'Y'
            AND ooefent = stawent
            AND ooef017 = staw007
            AND ooef001 = p_site
         SELECT staw004,staw005 INTO l_stbb019,l_staw005       
           FROM staw_t,ooef_t
          WHERE stawent = g_enterprise
            AND stawdocno = p_stajdocno
            AND stawseq = l_stbb018
            AND ooefent = stawent
            AND ooef017 = staw007
            AND ooef001 = p_site            
      END IF      
   END IF
   #如果结算日期为空，结算日期=截止日期
   IF l_stbb019 IS NULL THEN
      LET l_stbb019 = p_edate
   END IF
   RETURN  l_stbb018,l_stbb019
END FUNCTION

################################################################################
# Descriptions...: 计算下次费用开始日期，结束日期
# Memo...........:
# Usage..........: CALL astp304_cal_nextd(p_stak007,p_bdate,p_edate,p_end,p_stak027,p_type,p_stajdocno,p_ooef017)
#                  RETURNING r_begin,r_end
# Input parameter: p_stak007      费用周期
#                : p_bdate        开始日期
#                : p_edate        结束日期
#                : p_end          当前计算结束日期
#                : p_stak027      自然月否
#                : p_type         计算方式 1.正常计算方式 2.取费用帐期日期
#                ：p_stajdocno    单据编号
#                : p_ooef017      法人
# Return code....: r_begin        下次费用计算开始日期
#                : r_end          下次费用计算结束日期
# Date & Author..: 2016/01/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_cal_nextd(p_stak007,p_bdate,p_edate,p_end,p_stak027,p_type,p_stajdocno,p_ooef017)
DEFINE p_bdate      LIKE type_t.dat
DEFINE p_edate      LIKE type_t.dat
DEFINE p_stak007    LIKE stak_t.stak007
DEFINE p_end        LIKE type_t.dat
DEFINE p_stak027    LIKE stak_t.stak027
DEFINE p_stajdocno  LIKE staj_t.stajdocno
DEFINE p_type       LIKE type_t.chr1
DEFINE p_ooef017    LIKE ooef_t.ooef017
DEFINE r_begin      LIKE type_t.dat
DEFINE r_end        LIKE type_t.dat
DEFINE l_year       LIKE type_t.num5
DEFINE l_month      LIKE type_t.num5
DEFINE r_bdate      LIKE type_t.dat
DEFINE r_edate      LIKE type_t.dat

   LET r_bdate = ''
   LET r_edate = ''
   IF NOT cl_null(p_end) THEN 
      LET r_bdate = p_end + 1
   ELSE
      LET r_bdate = p_bdate
   END IF 
   IF r_bdate > p_edate THEN 
      RETURN '',''
   END IF 
   IF p_type = '1' THEN 
      CASE p_stak007
         #年
         WHEN '1'
             #按自然月计费
             IF p_stak027 = 'Y' THEN 
                LET l_year = YEAR(r_bdate)
                #获取当前年份第一天
                LET r_bdate = MDY(1,1,l_year+1)
                #获取当前年份最后一天
                LET r_edate = MDY(12,31,l_year+1)
             ELSE
                LET r_edate = s_date_get_date(r_bdate,12,-1)
             END IF 
         #季
         WHEN '2'
             #按自然月计费
             IF p_stak027 = 'Y' THEN 
                LET l_year = YEAR(r_bdate)
                LET l_month = MONTH(r_bdate)
                #获取当前季度第一天
                #四个季度 1-3 4-6 7-9 10-12
                IF l_month >= 1 AND l_month <= 3 THEN 
                   LET r_bdate = MDY( 1, 1, l_year)
                   LET r_edate  = MDY( 3,31, l_year)
                END IF 
                IF l_month >= 4 AND l_month <= 6 THEN 
                   LET r_bdate = MDY( 4, 1, l_year)
                   LET r_edate  = MDY( 6,30, l_year)
                END IF 
                IF l_month >= 7 AND l_month <= 9 THEN 
                   LET r_bdate = MDY( 7, 1, l_year)
                   LET r_edate  = MDY( 9,30, l_year)
                END IF 
                IF l_month >= 10 AND l_month <= 12 THEN 
                   LET r_bdate = MDY(10, 1, l_year)
                   LET r_edate  = MDY(12,31, l_year)
                END IF 
             ELSE
                LET r_edate = s_date_get_date(r_bdate,3,-1)
             END IF 
         #月
         WHEN '3'
             #按自然月计费
             IF p_stak027 = 'Y' THEN 
                #获取当前月第一天
                CALL s_date_get_first_date(r_bdate) RETURNING r_bdate
                #获取当月最后一天
                CALL s_date_get_last_date(r_bdate) RETURNING r_edate
             ELSE
                LET r_edate = s_date_get_date(r_bdate,1,-1)
             END IF 
         #单次
         WHEN '4'
             IF r_bdate > p_edate THEN 
                RETURN '',''
             END IF 
             LET r_edate = p_end
             
         #按结算帐期
         WHEN '5'
             SELECT staw002,staw003 
               INTO r_bdate,r_edate
               FROM staw_t
              WHERE stawent = g_enterprise
                AND staw007 = p_ooef017
                AND stawdocno = p_stajdocno
                AND staw002 <= r_bdate
                AND staw003 >= r_bdate
                
         OTHERWISE 
            RETURN '',''
      END CASE 
   ELSE
      IF p_stak007 != '5' THEN 
         SELECT stbw002,stbw003
           INTO r_bdate,r_edate
           FROM stbw_t
          WHERE stbwent = g_enterprise
            AND stbw008 = p_ooef017
            AND stbwdocno = p_stajdocno
            AND stbw002 <= r_bdate
            AND stbw003 >= r_bdate
      ELSE
         SELECT staw002,staw003 
           INTO r_bdate,r_edate
           FROM staw_t
          WHERE stawent = g_enterprise
            AND staw007 = p_ooef017
            AND stawdocno = p_stajdocno
            AND staw002 <= r_bdate
            AND staw003 >= r_bdate
      END IF 
   END IF 
   RETURN r_bdate,r_edate
END FUNCTION

################################################################################
# Descriptions...: 建立临时表
# Memo...........:
# Usage..........: CALL astp304_expense_create_stbb_tmp()
# Input parameter: 无
# Return code....: 无
# Date & Author..: 2016/01/20 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_expense_create_stbb_tmp()
DEFINE l_sql   STRING

   WHENEVER ERROR CALL cl_err_msg_log
   DROP TABLE stbb_tmp
   LET l_sql = "CREATE GLOBAL TEMPORARY TABLE stbb_tmp AS ",
               " SELECT * FROM stbb_t "
   PREPARE stbb_tbl FROM l_sql
   EXECUTE stbb_tbl
   FREE stbb_tbl
   
   DROP TABLE stby_tmp
   LET l_sql = "CREATE GLOBAL TEMPORARY TABLE stby_tmp AS ",
               " SELECT * FROM stby_t "
   PREPARE stby_tbl FROM l_sql
   EXECUTE stby_tbl
   FREE stby_tbl
END FUNCTION

################################################################################
# Descriptions...: 新增补差单单身
# Memo...........:
# Usage..........: CALL astp304_sel_ins_stbb(p_stajdocno,p_stbadocno,p_staj035)
#                  RETURNING r_success
# Input parameter: p_stajdocno    单据编号
#                : p_stbadocno    费用单号
#                : p_staj035      续签日期
# Return code....: r_success   
# Date & Author..: 2016/01/21 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_sel_ins_stbb(p_stajdocno,p_stbadocno,p_staj035)
DEFINE p_stajdocno     LIKE staj_t.stajdocno
DEFINE p_stbadocno     LIKE stba_t.stbadocno
DEFINE p_staj035       LIKE staj_t.staj035
DEFINE l_sql           STRING 
#161111-00028#3--modify--begin---------
#DEFINE l_stbb          RECORD LIKE stbb_t.*
#DEFINE l_staj          RECORD LIKE staj_t.*
DEFINE l_staj RECORD  #自營合約異動申請單頭檔
       stajent LIKE staj_t.stajent, #企業編號
       stajunit LIKE staj_t.stajunit, #應用組織
       stajsite LIKE staj_t.stajsite, #營運據點
       stajdocno LIKE staj_t.stajdocno, #單號
       stajdocdt LIKE staj_t.stajdocdt, #單據日期
       staj000 LIKE staj_t.staj000, #作業方式
       staj001 LIKE staj_t.staj001, #合約編號
       staj002 LIKE staj_t.staj002, #經營方式
       staj003 LIKE staj_t.staj003, #版本
       staj004 LIKE staj_t.staj004, #模板編號
       staj005 LIKE staj_t.staj005, #供應商編號
       staj006 LIKE staj_t.staj006, #幣別
       staj007 LIKE staj_t.staj007, #稅別
       staj008 LIKE staj_t.staj008, #收付款方式
       staj009 LIKE staj_t.staj009, #結算方式
       staj010 LIKE staj_t.staj010, #結算類別
       staj011 LIKE staj_t.staj011, #訂貨滿足率
       staj012 LIKE staj_t.staj012, #簽訂日期
       staj013 LIKE staj_t.staj013, #簽訂法人
       staj014 LIKE staj_t.staj014, #簽訂人員
       staj015 LIKE staj_t.staj015, #結算中心
       staj016 LIKE staj_t.staj016, #採購中心
       staj017 LIKE staj_t.staj017, #生效日期
       staj018 LIKE staj_t.staj018, #失效日期
       staj019 LIKE staj_t.staj019, #清退日期
       staj020 LIKE staj_t.staj020, #作廢日期
       staj021 LIKE staj_t.staj021, #檔案編號
       staj022 LIKE staj_t.staj022, #申請組織
       stajacti LIKE staj_t.stajacti, #合約有效碼
       stajownid LIKE staj_t.stajownid, #資料所有者
       stajowndp LIKE staj_t.stajowndp, #資料所有部門
       stajcrtid LIKE staj_t.stajcrtid, #資料建立者
       stajcrtdp LIKE staj_t.stajcrtdp, #資料建立部門
       stajcrtdt LIKE staj_t.stajcrtdt, #資料創建日
       stajmodid LIKE staj_t.stajmodid, #資料修改者
       stajmoddt LIKE staj_t.stajmoddt, #最近修改日
       stajstus LIKE staj_t.stajstus, #狀態碼
       stajcnfid LIKE staj_t.stajcnfid, #資料確認者
       stajcnfdt LIKE staj_t.stajcnfdt, #資料確認日
       staj023 LIKE staj_t.staj023, #來源單號
       staj024 LIKE staj_t.staj024, #交易條件
       staj025 LIKE staj_t.staj025, #發票類型
       staj026 LIKE staj_t.staj026, #採購價格允許人工修改
       staj027 LIKE staj_t.staj027, #修改容差率
       staj028 LIKE staj_t.staj028, #超出處理方式
       staj029 LIKE staj_t.staj029, #內外購
       staj030 LIKE staj_t.staj030, #匯率計算基準
       staj031 LIKE staj_t.staj031, #合約狀態
       staj032 LIKE staj_t.staj032, #原合約編號
       staj033 LIKE staj_t.staj033, #延期日期
       staj034 LIKE staj_t.staj034, #收銀方式
       staj035 LIKE staj_t.staj035, #續期日期
       staj036 LIKE staj_t.staj036, #文本蓋章否
       staj037 LIKE staj_t.staj037, #蓋章日期
       staj038 LIKE staj_t.staj038, #備註
       staj039 LIKE staj_t.staj039, #執行日期
       staj040 LIKE staj_t.staj040, #含發票否
       staj041 LIKE staj_t.staj041, #部門
       staj042 LIKE staj_t.staj042  #按法人結算
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
       stbb033 LIKE stbb_t.stbb033,  #銷售單位
       stbbud001 LIKE stbb_t.stbbud001
       END RECORD
#161111-00028#3--modify--end-----------
DEFINE r_success       LIKE type_t.num5
DEFINE l_stbb009_acc   LIKE stbb_t.stbb009
DEFINE l_stbb009_sum   LIKE stbb_t.stbb009
DEFINE l_stbb017_str   STRING     
DEFINE l_stbbsite      LIKE stbb_t.stbbsite
DEFINE l_stbb001       LIKE stbb_t.stbb001
DEFINE l_stbb011       LIKE stbb_t.stbb011
DEFINE l_stbb005       LIKE stbb_t.stbb005
DEFINE l_stbb006       LIKE stbb_t.stbb006
DEFINE l_stbb009       LIKE stbb_t.stbb009


   WHENEVER ERROR CALL cl_err_msg_log
    
   LET r_success = TRUE
   INITIALIZE l_stbb.* TO NULL
   INITIALIZE l_staj.* TO NULL
   
  #SELECT * INTO l_staj.* #161111-00028#3--mark
  #161111-00028#3----add--begin-------
   SELECT stajent,stajunit,stajsite,stajdocno,stajdocdt,staj000,staj001,staj002,staj003,staj004,
          staj005,staj006,staj007,staj008,staj009,staj010,staj011,staj012,staj013,staj014,staj015,
          staj016,staj017,staj018,staj019,staj020,staj021,staj022,stajacti,stajownid,stajowndp,
          stajcrtid,stajcrtdp,stajcrtdt,stajmodid,stajmoddt,stajstus,stajcnfid,stajcnfdt,staj023,
          staj024,staj025,staj026,staj027,staj028,staj029,staj030,staj031,staj032,staj033,staj034,
          staj035,staj036,staj037,staj038,staj039,staj040,staj041,staj042 INTO l_staj.*
  #161111-00028#3----add--end---------
     FROM staj_t
    WHERE stajent = g_enterprise
      AND stajdocno = p_stajdocno
   #                    门店/    费用编号/  品类/    开始日期/结束日期/ 金额
   LET l_sql = " SELECT stbbsite,stbb001,stbb011,stbb005,stbb006,SUM(COALESCE(stbb009,0)) FROM stbb_tmp ",
               " GROUP BY stbbsite,stbb001,stbb003,stbb011,stbb005,stbb006 "
   PREPARE sel_stbb_tmp FROM l_sql
   DECLARE sel_stbb_tmp_cs CURSOR FOR sel_stbb_tmp
   FOREACH sel_stbb_tmp_cs INTO l_stbbsite,l_stbb001,l_stbb011,l_stbb005,l_stbb006,l_stbb009   
   #  SELECT * INTO l_stbb.*  #161111-00028#3--mark
      #161111-00028#3----add--begin-------
      SELECT stbbent,stbbunit,stbbsite,stbbdocno,stbbseq,stbb001,stbb002,stbb003,stbb004,stbb005,
             stbb006,stbb007,stbb008,stbb009,stbb010,stbb011,stbb012,stbb013,stbb014,stbb015,stbb016,
             stbb017,stbb018,stbb019,stbb020,stbb021,stbb022,stbb023,stbb024,stbb025,stbb026,stbb027,
             stbb028,stbb029,stbb030,stbb031,stbb032,stbb033,stbbud001 INTO l_stbb.*
      #161111-00028#3----add--end---------      
        FROM stbb_tmp
       WHERE stbbent = g_enterprise
         AND stbbsite = l_stbbsite
         AND stbb001 = l_stbb001
         AND stbb011 = l_stbb011
         AND stbb005 <= l_stbb005
         AND stbb006 >= l_stbb006
         AND rownum = 1
      IF l_stbb009 = 0 THEN 
         CONTINUE FOREACH 
      END IF 
      LET l_stbb.stbbdocno = p_stbadocno
      SELECT MAX(stbbseq) + 1 INTO l_stbb.stbbseq
        FROM stbb_t
       WHERE stbbent = g_enterprise
         AND stbbdocno = p_stbadocno
      IF cl_null(l_stbb.stbbseq) THEN 
         LET l_stbb.stbbseq = 1
      END IF 
      #已生成费用单金额
      SELECT SUM(COALESCE(stbb009,0)) INTO l_stbb009_acc
        FROM stbb_tmp
       WHERE stbbent = g_enterprise
         AND stbbsite = l_stbbsite
         AND stbb001 = l_stbb001
         AND stbb011 = l_stbb011
         AND stbb005 <= l_stbb005
         AND stbb006 >= l_stbb006
         AND stbbdocno <> p_stbadocno
      #续签后计算金额
      SELECT SUM(COALESCE(stbb009,0)) INTO l_stbb009_sum
        FROM stbb_tmp
       WHERE stbbent = g_enterprise
         AND stbbsite = l_stbbsite
         AND stbb001 = l_stbb001
         AND stbb011 = l_stbb011
         AND stbb005 <= l_stbb005
         AND stbb006 >= l_stbb006
         AND stbbdocno = p_stbadocno
      IF l_stbb005 <= p_staj035 AND p_staj035 <= l_stbb006 THEN 
         LET l_stbb.stbb009 = l_stbb009/(l_stbb006-l_stbb005+1)*(l_stbb006-p_staj035+1)
         LET l_stbb009_acc = l_stbb009_acc/(l_stbb006-l_stbb005+1)*(l_stbb006-p_staj035+1)
         LET l_stbb009_sum = l_stbb009_sum/(l_stbb006-l_stbb005+1)*(l_stbb006-p_staj035+1)
      ELSE
         LET l_stbb.stbb009 = l_stbb009
      END IF 
      IF cl_null(l_stbb009_acc) THEN 
         LET l_stbb009_acc = 0
      END IF 
      IF cl_null(l_stbb009_sum) THEN 
         LET l_stbb009_sum = 0
      END IF 
      CALL s_curr_round(g_site,l_staj.staj006,l_stbb.stbb009,'2') RETURNING l_stbb.stbb009
      CALL s_curr_round(g_site,l_staj.staj006,l_stbb009_acc,'2') RETURNING l_stbb009_acc
      CALL s_curr_round(g_site,l_staj.staj006,l_stbb009_sum,'2') RETURNING l_stbb009_sum
      
      #补差金额 = 续签合同规则产生费用金额 - 已产生费用单金额
      LET l_stbb017_str = l_stbb.stbb009 USING '-----------------.##'
      LET l_stbb.stbb017 = "补差金额:",l_stbb017_str.trim()
      LET l_stbb017_str = l_stbb009_sum USING '-----------------.##'
      LET l_stbb.stbb017 = l_stbb.stbb017,"=(续签合同产生费用金额(",l_stbb017_str.trim(),")"
      LET l_stbb017_str = l_stbb009_acc USING '-----------------.##'
      LET l_stbb.stbb017 = l_stbb.stbb017,"-已产生费用单金额(",l_stbb017_str.trim(),")）"
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
      IF SQLCA.SQLcode  THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "INTO stbb_t" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()        
         LET r_success = FALSE
         EXIT FOREACH 
      END IF
      LET g_deteal_cnt = g_deteal_cnt + 1 
   END FOREACH 
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 扣率代销的费用，产生到扣率代销销售成本stby里面
# Memo...........:
# Usage..........: astp304_expense_ins_stby_tmp(p_stajdocno,p_stbb)
#                  RETURNING TRUE/FALSE
# Input parameter: p_stajdocno    单据编号
#                : p_stbb         费用单单身
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 2016/01/21 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_expense_ins_stby_tmp(p_stajdocno,p_stbb)
DEFINE p_stajdocno   LIKE stak_t.stakdocno
#161111-00028#3--modify--end-----------
#DEFINE p_stbb        RECORD LIKE stbb_t.*
#DEFINE l_staj        RECORD LIKE staj_t.*  #合同单头
#DEFINE l_stby        RECORD LIKE stby_t.* 
DEFINE l_stby RECORD  #扣率代銷每日銷售成本明細統計檔
       stbyent LIKE stby_t.stbyent, #企業編號
       stbysite LIKE stby_t.stbysite, #營運組織
       stbydocno LIKE stby_t.stbydocno, #來源單號
       stbyseq LIKE stby_t.stbyseq, #來源項次
       stby001 LIKE stby_t.stby001, #銷售日期
       stby002 LIKE stby_t.stby002, #商品編號
       stby003 LIKE stby_t.stby003, #庫區編號
       stby004 LIKE stby_t.stby004, #专柜编号
       stby005 LIKE stby_t.stby005, #供應商編號
       stby006 LIKE stby_t.stby006, #費用編號
       stby007 LIKE stby_t.stby007, #銷售數量
       stby008 LIKE stby_t.stby008, #應收金額
       stby009 LIKE stby_t.stby009, #實收金額
       stby010 LIKE stby_t.stby010, #扣率
       stby011 LIKE stby_t.stby011, #費用金額
       stby012 LIKE stby_t.stby012, #成本金額
       stby013 LIKE stby_t.stby013, #日結成本類別
       stby014 LIKE stby_t.stby014, #價款類型
       stby015 LIKE stby_t.stby015, #已結轉否
       stby016 LIKE stby_t.stby016, #成本審批單號
       stby017 LIKE stby_t.stby017, #成本審批單項次
       stby018 LIKE stby_t.stby018, #管理品類
       stby019 LIKE stby_t.stby019, #促銷銷售額
       stby020 LIKE stby_t.stby020  #合約編號
       END RECORD

DEFINE l_staj RECORD  #自營合約異動申請單頭檔
       stajent LIKE staj_t.stajent, #企業編號
       stajunit LIKE staj_t.stajunit, #應用組織
       stajsite LIKE staj_t.stajsite, #營運據點
       stajdocno LIKE staj_t.stajdocno, #單號
       stajdocdt LIKE staj_t.stajdocdt, #單據日期
       staj000 LIKE staj_t.staj000, #作業方式
       staj001 LIKE staj_t.staj001, #合約編號
       staj002 LIKE staj_t.staj002, #經營方式
       staj003 LIKE staj_t.staj003, #版本
       staj004 LIKE staj_t.staj004, #模板編號
       staj005 LIKE staj_t.staj005, #供應商編號
       staj006 LIKE staj_t.staj006, #幣別
       staj007 LIKE staj_t.staj007, #稅別
       staj008 LIKE staj_t.staj008, #收付款方式
       staj009 LIKE staj_t.staj009, #結算方式
       staj010 LIKE staj_t.staj010, #結算類別
       staj011 LIKE staj_t.staj011, #訂貨滿足率
       staj012 LIKE staj_t.staj012, #簽訂日期
       staj013 LIKE staj_t.staj013, #簽訂法人
       staj014 LIKE staj_t.staj014, #簽訂人員
       staj015 LIKE staj_t.staj015, #結算中心
       staj016 LIKE staj_t.staj016, #採購中心
       staj017 LIKE staj_t.staj017, #生效日期
       staj018 LIKE staj_t.staj018, #失效日期
       staj019 LIKE staj_t.staj019, #清退日期
       staj020 LIKE staj_t.staj020, #作廢日期
       staj021 LIKE staj_t.staj021, #檔案編號
       staj022 LIKE staj_t.staj022, #申請組織
       stajacti LIKE staj_t.stajacti, #合約有效碼
       stajownid LIKE staj_t.stajownid, #資料所有者
       stajowndp LIKE staj_t.stajowndp, #資料所有部門
       stajcrtid LIKE staj_t.stajcrtid, #資料建立者
       stajcrtdp LIKE staj_t.stajcrtdp, #資料建立部門
       stajcrtdt LIKE staj_t.stajcrtdt, #資料創建日
       stajmodid LIKE staj_t.stajmodid, #資料修改者
       stajmoddt LIKE staj_t.stajmoddt, #最近修改日
       stajstus LIKE staj_t.stajstus, #狀態碼
       stajcnfid LIKE staj_t.stajcnfid, #資料確認者
       stajcnfdt LIKE staj_t.stajcnfdt, #資料確認日
       staj023 LIKE staj_t.staj023, #來源單號
       staj024 LIKE staj_t.staj024, #交易條件
       staj025 LIKE staj_t.staj025, #發票類型
       staj026 LIKE staj_t.staj026, #採購價格允許人工修改
       staj027 LIKE staj_t.staj027, #修改容差率
       staj028 LIKE staj_t.staj028, #超出處理方式
       staj029 LIKE staj_t.staj029, #內外購
       staj030 LIKE staj_t.staj030, #匯率計算基準
       staj031 LIKE staj_t.staj031, #合約狀態
       staj032 LIKE staj_t.staj032, #原合約編號
       staj033 LIKE staj_t.staj033, #延期日期
       staj034 LIKE staj_t.staj034, #收銀方式
       staj035 LIKE staj_t.staj035, #續期日期
       staj036 LIKE staj_t.staj036, #文本蓋章否
       staj037 LIKE staj_t.staj037, #蓋章日期
       staj038 LIKE staj_t.staj038, #備註
       staj039 LIKE staj_t.staj039, #執行日期
       staj040 LIKE staj_t.staj040, #含發票否
       staj041 LIKE staj_t.staj041, #部門
       staj042 LIKE staj_t.staj042  #按法人結算
       END RECORD
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
       stbb033 LIKE stbb_t.stbb033,  #銷售單位
       stbbud001 LIKE stbb_t.stbbud001
       END RECORD
#161111-00028#3--modify--end-----------

DEFINE r_success     LIKE type_t.num5      #TRUE/FALSE

   WHENEVER ERROR CALL cl_err_msg_log
   LET r_success = TRUE

  #SELECT * INTO l_staj.*  #161111-00028#3--mark
  #161111-00028#3--add--begin-----------
   SELECT stajent,stajunit,stajsite,stajdocno,stajdocdt,staj000,staj001,staj002,staj003,staj004,
          staj005,staj006,staj007,staj008,staj009,staj010,staj011,staj012,staj013,staj014,staj015,staj016,
          staj017,staj018,staj019,staj020,staj021,staj022,stajacti,stajownid,stajowndp,stajcrtid,
          stajcrtdp,stajcrtdt,stajmodid,stajmoddt,stajstus,stajcnfid,stajcnfdt,staj023,staj024,staj025,
          staj026,staj027,staj028,staj029,staj030,staj031,staj032,staj033,staj034,staj035,staj036,staj037,
          staj038,staj039,staj040,staj041,staj042 INTO l_staj.*
  #161111-00028#3--add--end-------------
   FROM staj_t 
   WHERE stajent = g_enterprise AND stajdocno = p_stajdocno

   LET l_stby.stbyent = g_enterprise     #企业编号
   LET l_stby.stbysite = p_stbb.stbbsite #组织
   LET l_stby.stbydocno = p_stbb.stbbdocno #来源单号
   LET l_stby.stbyseq = p_stbb.stbbseq   #来源项次
   LET l_stby.stby001 = p_stbb.stbb019   #销售日期
   LET l_stby.stby002 = ''               #商品编号
   LET l_stby.stby003 = ''               #库区编号
   LET l_stby.stby004 = ''               #专柜编号
   LET l_stby.stby005 = l_staj.staj005   #供应商编号
   LET l_stby.stby006 = p_stbb.stbb001   #费用编号
   LET l_stby.stby007 = NULL             #销售数量
   LET l_stby.stby008 = NULL             #应收金额
   LET l_stby.stby009 = NULL             #实收金额
   LET l_stby.stby010 = NULL             #扣率
   LET l_stby.stby011 = p_stbb.stbb009   #费用金额
   LET l_stby.stby012 = p_stbb.stbb009*(-1)  #成本金额
   LET l_stby.stby013 = '2'              #日结成本类型
   LET l_stby.stby014 = NULL             #价款类型
   LET l_stby.stby015 = 'N'              #已结转否
   LET l_stby.stby016 = NULL             #成本审批单号
   LET l_stby.stby017 = NULL             #成本审批单项次
   LET l_stby.stby018 = p_stbb.stbb011   #管理品类
   LET l_stby.stby019 = NULL             #促销销售额
   LET l_stby.stby020 = l_staj.staj001   #合同编号

   SELECT MAX(stbyseq)+1 INTO l_stby.stbyseq FROM stby_tmp
    WHERE stbyent = g_enterprise AND stbydocno = l_stby.stbydocno
   IF cl_null(l_stby.stbyseq) THEN LET l_stby.stbyseq = 1 END IF
   INSERT INTO stby_tmp (stbyent,stbysite,stbydocno,stbyseq,
                         stby001,stby002,stby003,stby004,stby005,
                         stby006,stby007,stby008,stby009,stby010,
                         stby011,stby012,stby013,stby014,stby015,
                         stby016,stby017,stby018,stby019,stby020)
   VALUES (l_stby.stbyent,l_stby.stbysite,l_stby.stbydocno,l_stby.stbyseq,
           l_stby.stby001,l_stby.stby002,l_stby.stby003,l_stby.stby004,l_stby.stby005,
           l_stby.stby006,l_stby.stby007,l_stby.stby008,l_stby.stby009,l_stby.stby010,
           l_stby.stby011,l_stby.stby012,l_stby.stby013,l_stby.stby014,l_stby.stby015,
           l_stby.stby016,l_stby.stby017,l_stby.stby018,l_stby.stby019,l_stby.stby020)
   
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = "ins_stby" 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      LET r_success = FALSE
   END IF 
   
   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL astp304_sel_ins_stby(p_stajdocno,p_stbadocno,p_staj006,p_staj039)
#                  RETURNING TRUE/FALSE
# Input parameter: p_stajdocno    单据编号
#                : p_stbadocno    费用单编号
#                : p_staj006      币别
#                : p_staj039      执行日期
# Return code....: TRUE/FALSE
# Date & Author..: 2016/01/21 By yangxf
# Modify.........:
################################################################################
PRIVATE FUNCTION astp304_sel_ins_stby(p_stajdocno,p_stbadocno,p_staj006,p_staj039)
DEFINE p_stajdocno  LIKE staj_t.stajdocno
DEFINE p_stbadocno  LIKE stba_t.stbadocno
DEFINE p_staj006    LIKE staj_t.staj006
DEFINE p_staj039    LIKE staj_t.staj039
DEFINE l_stbysite   LIKE stby_t.stbysite
DEFINE l_stby006    LIKE stby_t.stby006
DEFINE l_stby018    LIKE stby_t.stby018
DEFINE l_stby011    LIKE stby_t.stby011
DEFINE l_stby012    LIKE stby_t.stby012
DEFINE r_success    LIKE type_t.num5
#DEFINE l_stby        RECORD LIKE stby_t.*  #161111-00028#3--amrk
#161111-00028#3--add---begin--------
DEFINE l_stby RECORD  #扣率代銷每日銷售成本明細統計檔
       stbyent LIKE stby_t.stbyent, #企業編號
       stbysite LIKE stby_t.stbysite, #營運組織
       stbydocno LIKE stby_t.stbydocno, #來源單號
       stbyseq LIKE stby_t.stbyseq, #來源項次
       stby001 LIKE stby_t.stby001, #銷售日期
       stby002 LIKE stby_t.stby002, #商品編號
       stby003 LIKE stby_t.stby003, #庫區編號
       stby004 LIKE stby_t.stby004, #专柜编号
       stby005 LIKE stby_t.stby005, #供應商編號
       stby006 LIKE stby_t.stby006, #費用編號
       stby007 LIKE stby_t.stby007, #銷售數量
       stby008 LIKE stby_t.stby008, #應收金額
       stby009 LIKE stby_t.stby009, #實收金額
       stby010 LIKE stby_t.stby010, #扣率
       stby011 LIKE stby_t.stby011, #費用金額
       stby012 LIKE stby_t.stby012, #成本金額
       stby013 LIKE stby_t.stby013, #日結成本類別
       stby014 LIKE stby_t.stby014, #價款類型
       stby015 LIKE stby_t.stby015, #已結轉否
       stby016 LIKE stby_t.stby016, #成本審批單號
       stby017 LIKE stby_t.stby017, #成本審批單項次
       stby018 LIKE stby_t.stby018, #管理品類
       stby019 LIKE stby_t.stby019, #促銷銷售額
       stby020 LIKE stby_t.stby020  #合約編號
       END RECORD
#161111-00028#3--add---end--------
DEFINE l_sql        STRING 


   WHENEVER ERROR CALL cl_err_msg_log
   LET r_success = TRUE
   

   INITIALIZE l_stby.* TO NULL
   
   #先更新astq301抓过来的费用*（-1）
   UPDATE stby_tmp SET stby011 = stby011*(-1),
                       stby012 = stby012*(-1)
    WHERE stbyent = g_enterprise
      AND stbydocno <> p_stbadocno
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL 
      LET g_errparam.extend = 'UPD stby_tmp' 
      LET g_errparam.code   = SQLCA.sqlcode 
      LET g_errparam.popup  = TRUE 
      CALL cl_err()
      LET r_success = FALSE
      RETURN FALSE
   END IF 
   
   #根据求和得到补差费用
   #                   门店/    费用编号/  品类/         费用/    成本
   LET l_sql = "SELECT stbysite,stby006,stby018,SUM(COALESCE(stby011,0)),SUM(COALESCE(stby012,0)) ",
               "  FROM stby_tmp ",
               " GROUP BY stbysite,stby006,stby018 "
   PREPARE sel_stby_tmp FROM l_sql
   DECLARE sel_stby_tmp_cs CURSOR FOR sel_stby_tmp
   FOREACH sel_stby_tmp_cs INTO l_stbysite,l_stby006,l_stby018,l_stby011,l_stby012
     # SELECT * INTO l_stby.*  #161111-00028#3-mark
     #161111-00028#3--add--begin--------
       SELECT stbyent,stbysite,stbydocno,stbyseq,stby001,stby002,stby003,stby004,stby005,stby006,
              stby007,stby008,stby009,stby010,stby011,stby012,stby013,stby014,stby015,stby016,stby017,
              stby018,stby019,stby020 INTO l_stby.*
     #161111-00028#3--add--end--------
        FROM stby_tmp
       WHERE stbyent = g_enterprise
         AND stbysite = l_stbysite
         AND stby006 = l_stby006
         AND stby018 = l_stby018
         AND rownum = 1
      IF l_stby011 = 0 THEN 
         CONTINUE FOREACH 
      END IF 
      LET l_stby.stbydocno = p_stbadocno
      SELECT MAX(stbyseq) + 1 INTO l_stby.stbyseq
        FROM stby_t
       WHERE stbyent = g_enterprise
         AND stbydocno = p_stbadocno
         AND stbysite = l_stbysite
      IF cl_null(l_stby.stbyseq) THEN 
         LET l_stby.stbyseq = 1
      END IF 
      LET l_stby.stbysite = l_stbysite
      LET l_stby.stby001 = p_staj039
      LET l_stby.stby006 = l_stby006
      LET l_stby.stby018 = l_stby018
      LET l_stby.stby011 = l_stby011
      LET l_stby.stby012 = l_stby012
      LET l_stby.stby013 = '17'
      CALL s_curr_round(g_site,p_staj006,l_stby.stby011,'2') RETURNING l_stby.stby011
      CALL s_curr_round(g_site,p_staj006,l_stby.stby012,'2') RETURNING l_stby.stby012
     #INSERT INTO stby_t VALUES(l_stby.*)   # #161111-00028#3-mark
      #161111-00028#3-add---begin-----------
      INSERT INTO stby_t (stbyent,stbysite,stbydocno,stbyseq,stby001,stby002,stby003,stby004,stby005,stby006,
                          stby007,stby008,stby009,stby010,stby011,stby012,stby013,stby014,stby015,stby016,
                          stby017,stby018,stby019,stby020)
         VALUES (l_stby.stbyent,l_stby.stbysite,l_stby.stbydocno,l_stby.stbyseq,l_stby.stby001,l_stby.stby002,l_stby.stby003,l_stby.stby004,l_stby.stby005,l_stby.stby006,
                 l_stby.stby007,l_stby.stby008,l_stby.stby009,l_stby.stby010,l_stby.stby011,l_stby.stby012,l_stby.stby013,l_stby.stby014,l_stby.stby015,l_stby.stby016,
                 l_stby.stby017,l_stby.stby018,l_stby.stby019,l_stby.stby020)
      #161111-00028#3-add---end-----------
      IF SQLCA.SQLcode  THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "INTO stby_t" 
         LET g_errparam.code   = SQLCA.sqlcode 
         LET g_errparam.popup  = TRUE 
         CALL cl_err()        
         LET r_success = FALSE
         EXIT FOREACH 
      END IF 
   END FOREACH 
   RETURN r_success
END FUNCTION

#end add-point
 
{</section>}
 
