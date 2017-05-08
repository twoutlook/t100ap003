#該程式未解開Section, 採用最新樣板產出!
{<section id="astp512.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0003(2016-09-14 10:10:06), PR版次:0003(2016-09-14 09:57:43)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000057
#+ Filename...: astp512
#+ Description: 專櫃每日效益計算批次作業
#+ Creator....: 01251(2015-06-01 15:02:22)
#+ Modifier...: 08172 -SD/PR- 08172
 
{</section>}
 
{<section id="astp512.global" >}
#應用 p01 樣板自動產生(Version:19)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#Memos
#160913-00034#1    2016/09/14 by 08172   q_pmaa001開窗替换
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
   stgg001 LIKE stgg_t.stgg001,
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       stggsite LIKE stgg_t.stggsite, 
   stgg002 LIKE stgg_t.stgg002, 
   stgg003 LIKE stgg_t.stgg003, 
   stgg004 LIKE stgg_t.stgg004, 
   stgg001 LIKE stgg_t.stgg001, 
   stagenow LIKE type_t.chr80,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
 
#add-point:自定義模組變數(Module Variable) name="global.variable"

#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"

#end add-point
 
{</section>}
 
{<section id="astp512.main" >}
MAIN
   #add-point:main段define (客製用) name="main.define_customerization"
   
   #end add-point 
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
   #add-point:main段define name="main.define"
   
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
      CALL astp512_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp512 WITH FORM cl_ap_formpath("ast",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL astp512_init()
 
      #進入選單 Menu (="N")
      CALL astp512_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp512
   END IF
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp512.init" >}
#+ 初始化作業
PRIVATE FUNCTION astp512_init()
 
   #add-point:init段define (客製用) name="init.define_customerization"
   
   #end add-point
   #add-point:ui_dialog段define name="init.define"
   
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
   
   #end add-point
   
END FUNCTION
 
{</section>}
 
{<section id="astp512.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp512_ui_dialog()
 
   #add-point:ui_dialog段define (客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num10
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   #add-point:ui_dialog段define name="ui_dialog.define"
   DEFINE l_ooab002_1      LIKE ooab_t.ooab002
   DEFINE l_ooab002_2      LIKE ooab_t.ooab002
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   LET g_master.stgg001 =g_today-1
   
#門店日結關賬日期 
   SELECT ooab002 INTO l_ooab002_1
     FROM ooab_t
    WHERE ooabent = g_enterprise 
      AND ooabsite = g_site 
      AND ooab001 = 'S-CIR-0001'  
            
   IF g_master.stgg001<l_ooab002_1 THEN
      LET g_master.stgg001=''
   END IF   
   DISPLAY BY NAME g_master.stgg001       
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.stgg001 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               
               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgg001
            #add-point:BEFORE FIELD stgg001 name="input.b.stgg001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgg001
            
            #add-point:AFTER FIELD stgg001 name="input.a.stgg001"
            IF NOT cl_null(g_master.stgg001) THEN
#               IF g_master.stgg001<l_ooab002_1 OR g_master.stgg001>l_ooab002_2 THEN
               IF g_master.stgg001<=l_ooab002_1 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00414'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()              
                  
                  NEXT FIELD stgg001
               END IF

           END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stgg001
            #add-point:ON CHANGE stgg001 name="input.g.stgg001"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.stgg001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgg001
            #add-point:ON ACTION controlp INFIELD stgg001 name="input.c.stgg001"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON stggsite,stgg002,stgg003,stgg004
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               DISPLAY g_site TO stggsite
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.stggsite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stggsite
            #add-point:ON ACTION controlp INFIELD stggsite name="construct.c.stggsite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
#            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stggsite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stggsite  #顯示到畫面上
            NEXT FIELD stggsite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stggsite
            #add-point:BEFORE FIELD stggsite name="construct.b.stggsite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stggsite
            
            #add-point:AFTER FIELD stggsite name="construct.a.stggsite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stgg002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgg002
            #add-point:ON ACTION controlp INFIELD stgg002 name="construct.c.stgg002"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_inaa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgg002  #顯示到畫面上
            NEXT FIELD stgg002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgg002
            #add-point:BEFORE FIELD stgg002 name="construct.b.stgg002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgg002
            
            #add-point:AFTER FIELD stgg002 name="construct.a.stgg002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stgg003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgg003
            #add-point:ON ACTION controlp INFIELD stgg003 name="construct.c.stgg003"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgg003  #顯示到畫面上
            NEXT FIELD stgg003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgg003
            #add-point:BEFORE FIELD stgg003 name="construct.b.stgg003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgg003
            
            #add-point:AFTER FIELD stgg003 name="construct.a.stgg003"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stgg004
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgg004
            #add-point:ON ACTION controlp INFIELD stgg004 name="construct.c.stgg004"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            #160913-00034#1 -s by 08172
            LET g_qryparam.arg1 = "('3')"
            CALL q_pmaa001_1()
#            CALL q_pmaa001()                           #呼叫開窗
            #160913-00034#1 -e by 08172
            DISPLAY g_qryparam.return1 TO stgg004  #顯示到畫面上
            NEXT FIELD stgg004                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgg004
            #add-point:BEFORE FIELD stgg004 name="construct.b.stgg004"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgg004
            
            #add-point:AFTER FIELD stgg004 name="construct.a.stgg004"
            
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
            CALL astp512_get_buffer(l_dialog)
            #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog3"
            
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
         CALL astp512_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF NOT cl_schedule_exec_check() THEN
         CONTINUE WHILE
      END IF
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog name="process.exit_dialog"
      LET lc_param.stgg001 = g_master.stgg001 
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
                 CALL astp512_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = astp512_transfer_argv(ls_js)
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
 
{<section id="astp512.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION astp512_transfer_argv(ls_js)
 
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
 
{<section id="astp512.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION astp512_process(ls_js)
 
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
   DEFINE l_loop        LIKE type_t.num5   #160225-00040#18 Add By Ken 160314
   DEFINE l_msg         STRING             #160225-00040#18 Add By Ken 160314   
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
   #IF cl_null(lc_param.stgg001) THEN
   #   LET lc_param.stgg001=g_today-1
   #END IF
   #CALL astp512_insert(lc_param.wc,lc_param.stgg001) RETURNING l_success
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      #160225-00040#18 Add By Ken 160314(S)
      LET l_loop = 3
      CALL cl_progress_bar_no_window(l_loop)  
      #160225-00040#18 Add By Ken 160314(E)
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE astp512_process_cs CURSOR FROM ls_sql
#  FOREACH astp512_process_cs INTO
   #add-point:process段process name="process.process"
   #160225-00040#18 Add By Ken 160314(S)  資料準備 
   LET l_msg = cl_getmsg('ade-00114',g_lang)   
   CALL cl_progress_no_window_ing(l_msg)
   CALL cl_err_collect_init()    
   #160225-00040#18 Add By Ken 160314(E)   
   
   IF cl_null(lc_param.stgg001) THEN
      LET lc_param.stgg001=g_today-1
   END IF
   CALL astp512_insert(lc_param.wc,lc_param.stgg001) RETURNING l_success
   
   #160225-00040#18 Add By Ken 160314(S)
   LET l_msg = cl_getmsg('std-00012',g_lang)
   CALL cl_progress_no_window_ing(l_msg) 
   CALL cl_err_collect_show()    
   #160225-00040#18 Add By Ken 160314(E)   
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
   CALL astp512_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp512.get_buffer" >}
PRIVATE FUNCTION astp512_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.stgg001 = p_dialog.getFieldBuffer('stgg001')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astp512.msgcentre_notify" >}
PRIVATE FUNCTION astp512_msgcentre_notify()
 
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
 
{<section id="astp512.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: p處理邏輯
# Memo...........:
# Usage..........: CALL astp512_insert(p_wc,p_stgg001)
#                  RETURNING r_success
# Input parameter: p_wc           查詢條件
#                : p_stgg001      統計日期
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 20150601 By huangrh
# Modify.........:
################################################################################
PRIVATE FUNCTION astp512_insert(p_wc,p_stgg001)
DEFINE p_wc           STRING
DEFINE p_stgg001      LIKE stgg_t.stgg001
DEFINE r_success      LIKE type_t.num5
DEFINE l_sql          STRING
DEFINE l_sql1         STRING
DEFINE l_sql2         STRING
DEFINE l_stfc002_d DYNAMIC ARRAY OF RECORD 
        l_stfc002     LIKE stfc_t.stfc002
       END RECORD
DEFINE l_stfc002_t    LIKE stfc_t.stfc002
DEFINE l_i            LIKE type_t.num5
DEFINE g_flag         LIKE type_t.chr1
DEFINE l_wc           STRING
DEFINE l_success      LIKE type_t.num5
DEFINE l_debcent      LIKE debc_t.debcent
DEFINE l_debcsite     LIKE debc_t.debcsite
DEFINE l_debc002      LIKE debc_t.debc002
DEFINE l_debc005      LIKE debc_t.debc005
DEFINE l_stgg003      LIKE stgg_t.stgg003
DEFINE l_stgg004      LIKE stgg_t.stgg004
DEFINE l_stgg005      LIKE stgg_t.stgg005
DEFINE l_stgg006      LIKE stgg_t.stgg006
DEFINE l_stgg007      LIKE stgg_t.stgg007
DEFINE l_stgg008      LIKE stgg_t.stgg008
DEFINE l_stgg009      LIKE stgg_t.stgg009
DEFINE l_stgg010      LIKE stgg_t.stgg010
DEFINE l_stgg011      LIKE stgg_t.stgg011
DEFINE l_stgg012      LIKE stgg_t.stgg012
DEFINE l_stgg013      LIKE stgg_t.stgg013
DEFINE l_stgg014      LIKE stgg_t.stgg014
DEFINE l_debc010      LIKE debc_t.debc010
DEFINE l_stfb010      LIKE stfb_t.stfb010
DEFINE l_stfb006      LIKE stfb_t.stfb006
DEFINE l_yy           LIKE type_t.num5
DEFINE l_mm           LIKE type_t.num5
DEFINE l_days         LIKE type_t.num5
DEFINE l_stgg002      LIKE stgg_t.stgg002
DEFINE l_stgg008_002  LIKE stgg_t.stgg008
DEFINE l_count        LIKE type_t.num5
DEFINE l_count1       LIKE type_t.num5
DEFINE l_prei057      LIKE prei_t.prei057
DEFINE l_prei058      LIKE prei_t.prei058
DEFINE l_inaa141      LIKE inaa_t.inaa141
DEFINE l_inaa135      LIKE inaa_t.inaa135

DEFINE l_ooef016      LIKE ooef_t.ooef016 #ADDED BY LANJJ 2015-10-27
DEFINE stgg009_1      LIKE stgg_t.stgg009 #ADDED BY LANJJ 2015-10-29
DEFINE stgg014_1      LIKE stgg_t.stgg014 #ADDED BY LANJJ 2015-10-29
DEFINE l_stgg002_01   LIKE stgg_t.stgg002 #add BY dengdd 15/11/3
DEFINE l_loop         LIKE type_t.num5   #160225-00040#18 Add By Ken 160314
DEFINE l_msg          STRING             #160225-00040#18 Add By Ken 160314

# #aooi500設置的組織範圍
#   CALL s_aooi500_sql_where(g_prog,'stggsite') RETURNING l_wc 
   IF cl_null(l_wc) THEN
      LET l_wc=" 1=1"
   END IF  
   IF cl_null(p_wc) THEN
      LET p_wc=" 1=1"
   END IF   
   #開啟事務
   CALL s_transaction_begin()


   LET r_success=TRUE
      
   #根據錄入的條件，刪除stgg的資料
   LET l_sql=" DELETE FROM stgg_t",
             " WHERE stggent='",g_enterprise,"'",
             "   AND stgg001='",p_stgg001,"'",
             "   AND ",p_wc,
             "   AND ",l_wc

   PREPARE astp512_del_stgg_pre FROM l_sql   
   EXECUTE astp512_del_stgg_pre                      
   IF SQLCA.SQLcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "del stgg_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
    
      LET r_success=FALSE
      RETURN r_success
   END IF 

#查詢條件，重新整理--替換字符
#   CALL cl_str_replace(p_wc,"stggsite","debcsite") RETURNING p_wc 
#   CALL cl_str_replace(p_wc,"stgg002","debc005") RETURNING p_wc
#   CALL cl_str_replace(p_wc,"stgg003","debc010") RETURNING p_wc
#   CALL cl_str_replace(l_wc,"stggsite","debcsite") RETURNING l_wc  

#LANJJ MODIFY ON 2016-03-07 替换字符debc为stga
   CALL cl_str_replace(p_wc,"stggsite","stgasite") RETURNING p_wc 
   CALL cl_str_replace(p_wc,"stgg002","stga003") RETURNING p_wc
   CALL cl_str_replace(p_wc,"stgg003","stga004") RETURNING p_wc
   CALL cl_str_replace(l_wc,"stggsite","stgasite") RETURNING l_wc
   
##查詢資料  ---門店庫區日結檔
#   LET l_sql=" SELECT debcent,debcsite,debc002,debc005,SUM(debc016),SUM(debc020),SUM(debc022) ",  #取原价金额150805-00003#44
#             "   FROM debc_t",
#             " WHERE debcent='",g_enterprise,"'",
#             "   AND debc002='",p_stgg001,"'",
#             "   AND ",p_wc,
#             "   AND ",l_wc,
#             " GROUP BY debcent,debcsite,debc002,debc005"
#查詢資料  ---astq501

   #160225-00040#18 Add By Ken 160314(S)   產生資料
   LET l_msg = cl_getmsg('ast-00330',g_lang)
   CALL cl_progress_no_window_ing(l_msg)   
   #160225-00040#18 Add By Ken 160314(e) 
   
#lanjj add on 2016-03-07  ---start---
{astq501（每日销售成本）是根据日结数据产生，astp503（每日销退成本）执行后的数据会写入astq501中13.销退成本调整，而这部分数据不会进日结档（debc_t）
   所以在astp512产生每日效益时（是用debc_t的数据）少算了13.销退成本调整的数据
   所以astp512的逻辑做以下调整：
   由原来的数据源debc_t
   改成
   根据astq501中的数据产生，取成本类型为1:合同扣率成本(专柜) 2:合同扣率调整成本 7:促销扣率成本 8:促销扣率调整成本 13:销退成本调整 的数据}
   LET l_sql=" SELECT stgaent,stgasite,stga001,stga003,SUM(stga008),SUM(stga009),SUM(stga009-stga012) ",  
             "   FROM stga_t",
             " WHERE stgaent = '",g_enterprise,"'",
             "   AND stga001 = '",p_stgg001,"'",
             "   AND stga013 IN ('1','2','7','8','13')",
             "   AND ",p_wc,
             "   AND ",l_wc,
             " GROUP BY stgaent,stgasite,stga001,stga003"
#lanjj add on 2016-03-07  ---start---

   PREPARE astp512_sel_debc_pre FROM l_sql   
   DECLARE astp512_sel_debc CURSOR FOR astp512_sel_debc_pre 

   FOREACH astp512_sel_debc INTO l_debcent,l_debcsite,l_debc002,l_debc005,l_stgg007,l_stgg008,l_stgg009  #應收金額、實收金額 #销售成本
 
      #促銷讓利額      
      CALL astp512_get_stgg(l_debcsite,l_debc002,l_debc005,l_stgg008) RETURNING l_success,l_stgg011,l_stgg013
      #IF NOT l_success THEN
      #   CONTINUE FOREACH
      #END IF
      IF cl_null(l_stgg011) THEN LET l_stgg011=0 END IF
      
#VIP折让金额
     LET l_stgg013=''
     SELECT SUM(deba046) INTO l_stgg013
       FROM deba_t
      WHERE debaent=g_enterprise
        AND debasite=l_debcsite
        AND deba002=l_debc002
        AND deba005=l_debc005      
      IF cl_null(l_stgg013) THEN LET l_stgg013=0 END IF
      
      #促銷讓利率
      LET l_stgg012=''
      IF l_stgg008=0 AND l_stgg011>0 THEN
         LET l_stgg012=100
      ELSE
         LET l_stgg012=l_stgg011/l_stgg008*100
      END IF
        
#目前SA說一個商品只能是一個專櫃的
#       一個專櫃只能歸屬於一個供應商
#       一個庫區的商品，要不全部不促銷，要不全部促銷
      LET l_stgg003=''
      LET l_stgg006=''
      SELECT inaa120,inaa106 INTO l_stgg003,l_stgg006   #專櫃 #品類
        FROM inaa_t
       WHERE inaaent=g_enterprise
         AND inaa001=l_debc005
         
         
      LET l_stgg004=''
      LET l_stgg005=''
      SELECT stfa010,stfa048 INTO l_stgg004,l_stgg005   #供應商--樓層
        FROM stfa_t
       WHERE stfaent=g_enterprise
         AND stfa005=l_stgg003
         AND stfastus='Y'

      #租金金額
      LET l_stgg014=0


      #實收毛利額
#      LET l_stgg009=''
#      SELECT SUM(stga009-stga012) INTO l_stgg009
#        FROM stga_t
#       WHERE stgaent=g_enterprise
#         AND stgasite=l_debcsite
#         AND stga001=l_debc002
#         AND stga003=l_debc005
#         AND (stga013='7' OR stga013='8' OR stga013='9' OR stga013='10' OR stga013='16')
       IF cl_null(l_stgg009) THEN LET l_stgg009=0 END IF
       LET l_stgg009=l_stgg009+l_stgg014
  
      #實收毛利率       
      LET l_stgg010=l_stgg009/l_stgg008*100
      
#插入stgg表資料   
      
   ---#ADDED BY LanJJ 2015-10-27 ----S---
      #按当前币别截取aooi150里的用户设置小数位 处理金额字段-
      SELECT ooef016 
        INTO l_ooef016
        FROM ooef_t 
       WHERE ooefent = g_enterprise 
         AND ooef001 = l_debcsite
         
      CALL s_curr_round(l_debcsite,l_ooef016,l_stgg007,'2') RETURNING l_stgg007
      CALL s_curr_round(l_debcsite,l_ooef016,l_stgg008,'2') RETURNING l_stgg008
      CALL s_curr_round(l_debcsite,l_ooef016,l_stgg009,'2') RETURNING l_stgg009
      CALL s_curr_round(l_debcsite,l_ooef016,l_stgg011,'2') RETURNING l_stgg011
      --CALL s_curr_round(l_debcsite,l_ooef016,l_stgg012,'2') RETURNING l_stgg012 #lanjj mark on 2016-07-19
      CALL s_curr_round(l_debcsite,l_ooef016,l_stgg014,'2') RETURNING l_stgg014
   ---#ADDED BY LanJJ 2015-10-27 ----E---
      
      INSERT INTO stgg_t(stggent,stggsite,stggunit,stgg001,stgg002,
                         stgg003,stgg004,stgg005,stgg006,stgg007,stgg008,
                         stgg009,stgg010,stgg011,stgg012,stgg013,stgg014)
                  VALUES(l_debcent,l_debcsite,l_debcsite,l_debc002,l_debc005,
                         l_stgg003,l_stgg004,l_stgg005,l_stgg006,l_stgg007,l_stgg008,
                         l_stgg009,l_stgg010,l_stgg011,l_stgg012,l_stgg013,l_stgg014)
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = l_stgg003,"ins stgg_t1" #lanjj modify on 2016-02-22
         LET g_errparam.popup = TRUE
         CALL cl_err()
       
         LET r_success=FALSE
         EXIT FOREACH
      END IF      
   
   END FOREACH
   

#租金，就根据专柜asti203中费用用途类型抓取001-租金对应的费用编号，再到astm401中，抓取对应费用代码的费用金额字段。
#该费用金额根据日期进行计算，计算到当天多少租金：
#计算当月天数多少天，然后计算出专柜每天租金。
#计算到每个库区，则按照库区编号对应的占该专柜的实收金额的占比将租金分摊
#-------没有销售，则按照取astm401==状态为3-6的资料，然后按照常规库区和多扣率库区均分
#------------------------------------------------若无库区，则新增一笔资料。



#租金------按照专柜为整体计算
#----------库区一定会存在合约档（astm401)中-----------
#----------专柜只会有一笔合约-----------
#----------如果有销售--则按照销售的占比率分摊每天的租金--
#----------没有销售---有库区--则常规

#查詢條件，重新整理--替換字符
#   CALL cl_str_replace(p_wc,"debcsite","stfasite") RETURNING p_wc 
#   CALL cl_str_replace(p_wc,"debc010","stfa005") RETURNING p_wc
   CALL cl_str_replace(p_wc,"stgasite","stfasite") RETURNING p_wc 
   CALL cl_str_replace(p_wc,"stga004","stfa005") RETURNING p_wc
#   CALL cl_str_replace(p_wc,"debc005","stfc002") RETURNING p_wc
   CALL cl_str_replace(l_wc,"stggsite","stfasite") RETURNING l_wc
   LET l_sql=" SELECT DISTINCT stfasite,stfa005",
             "   FROM stfa_t,stfb_t,stae_t",
             " WHERE stfaent='",g_enterprise,"'",
             "   AND stfaent=stfbent",
             "   AND staeent=stfbent",
             "   AND stfa001=stfb001",
             "   AND stfb002=stae001",
             "   AND stae012='0001'",
             "   AND staestus='Y'",
             "   AND stfastus='Y'",
             "   AND stfb026='Y'",
             "   AND (stfa004='3' OR stfa004='4' OR stfa004='5' OR stfa004='6')",
             "   AND ",p_wc,
             "   AND ",l_wc                        

   PREPARE astp512_sel_stfasite_pre FROM l_sql   
   DECLARE astp512_sel_stfasite CURSOR FOR astp512_sel_stfasite_pre 

   FOREACH astp512_sel_stfasite INTO l_debcsite,l_debc010
      #租金金額---一定会是固定类型，周期是年、季度、月---一共有一笔
      LET l_stfb010=''
      LET l_stfb006=''
      SELECT DISTINCT stfb010,stfb006 INTO l_stfb010,l_stfb006
        FROM stfa_t,stfb_t,stae_t
       WHERE stfaent=stfbent
         AND staeent=stfbent
         AND stfa001=stfb001
         AND stfb002=stae001
         AND stfaent=g_enterprise         
         AND stfasite=l_debcsite
         AND stfa005=l_debc010
         AND stae012='0001'   #租金
         AND staestus='Y'
         AND stfastus='Y'
         AND stfb026='Y'
      IF cl_null(l_stfb010) THEN
         LET l_stfb010=0
      END IF         
         
      IF l_stfb010=0 THEN #没有租金额
         CONTINUE FOREACH
      END IF         

      #总实收金额---专柜的---p_stgg001日期
      LET l_stgg008=''
      SELECT SUM(stgg008) INTO l_stgg008
        FROM stgg_t
       WHERE stggent=g_enterprise
         AND stggsite=l_debcsite
         AND stgg001=p_stgg001
         AND stgg003=l_debc010
      IF cl_null(l_stgg008) THEN
         LET l_stgg008=0
      END IF
      IF l_stfb006='3' THEN       #月
         LET l_yy = YEAR(p_stgg001)
         LET l_mm = MONTH(p_stgg001)
         CALL s_date_get_max_day(l_yy,l_mm) RETURNING l_days #当月天数
         #每天租金
         LET l_stfb010=l_stfb010/l_days
      END IF
      IF l_stfb006='2' THEN       #季度
         #当前季度的天数
         LET l_sql="SELECT (ADD_MONTHS(TRUNC(TO_DATE('",p_stgg001,"','YYYY/MM/DD'), 'Q'), +3)-1)-TRUNC(TO_DATE('",p_stgg001,"','YYYY/MM/DD'),'Q') FROM dual"
         PREPARE astp512_sel_days_pre FROM l_sql
         EXECUTE astp512_sel_days_pre INTO l_days
         
         #每天租金
         LET l_stfb010=l_stfb010/l_days                  
      END IF
      IF l_stfb006='1' THEN       #年
         #今年的天数
         LET l_sql="SELECT ADD_MONTHS(TRUNC(TO_DATE('",p_stgg001,"','YYYY/MM/DD'),'year'),12)-TRUNC(TO_DATE('",p_stgg001,"','YYYY/MM/DD'),'year') from dual "
         PREPARE astp512_sel_days2_pre FROM l_sql
         EXECUTE astp512_sel_days2_pre INTO l_days
         
         #每天租金
         LET l_stfb010=l_stfb010/l_days                  
      END IF    
      
      IF l_stgg008<>0 THEN #有销售    
      
    
         DECLARE astp512_stgg009_cur CURSOR FOR SELECT DISTINCT stgg002
                                                  FROM stgg_t
                                                 WHERE stggent=g_enterprise
                                                   AND stggsite=l_debcsite
                                                   AND stgg001=p_stgg001
                                                   AND stgg003=l_debc010
         FOREACH astp512_stgg009_cur INTO l_stgg002
            #库区实收金额
            LET l_stgg008_002=''
            SELECT SUM(stgg008) INTO l_stgg008_002
              FROM stgg_t
             WHERE stggent=g_enterprise
               AND stggsite=l_debcsite
               AND stgg001=p_stgg001
               AND stgg003=l_debc010
               AND stgg002=l_stgg002 
            
#            UPDATE stgg_t SET stgg014=l_stgg008_002/l_stgg008*l_stfb010, #租金
#                              stgg009=stgg009+(l_stgg008_002/l_stgg008*l_stfb010), #毛利额
#                              stgg010=(stgg009+(l_stgg008_002/l_stgg008*l_stfb010))/stgg008*100 #毛利率
#             WHERE stggent=g_enterprise
#               AND stggsite=l_debcsite
#               AND stgg001=p_stgg001
#               AND stgg003=l_debc010
#               AND stgg002=l_stgg002                                         MARKED BY LANJJ 2015-10-29

            ---#ADDED BY LanJJ 2015-10-27 ----S---
               #按当前币别截取aooi150里的用户设置小数位 处理金额字段-
               SELECT stgg009 INTO stgg009_1 
                 FROM stgg_t
                WHERE stggent=g_enterprise
                  AND stggsite=l_debcsite
                  AND stgg001=p_stgg001
                  AND stgg003=l_debc010
                  AND stgg002=l_stgg002  
               
               LET stgg009_1 = stgg009_1+(l_stgg008_002/l_stgg008*l_stfb010) #毛利额
               LET stgg014_1 = l_stgg008_002/l_stgg008*l_stfb010 #租金
               CALL s_curr_round(l_debcsite,l_ooef016,stgg009_1,'2') RETURNING stgg009_1
               CALL s_curr_round(l_debcsite,l_ooef016,stgg014_1,'2') RETURNING stgg014_1
            
               LET l_sql1 = "UPDATE stgg_t SET stgg014 = '",stgg014_1,"', ",#??
                            "                  stgg009 = '",stgg009_1,"', ",#???
                            "                  stgg010 = DECODE(stgg008,0,100,(stgg009+('",l_stgg008_002,"'/'",l_stgg008,"'*'",l_stfb010,"'))/stgg008*100 )",#???
                            " WHERE stggent=g_enterprise ",
                            "  AND stggsite=l_debcsite ",
                            "  AND stgg001=p_stgg001 ",
                            "  AND stgg003=l_debc010 ",
                            "  AND stgg002=l_stgg002 "
            ---#ADDED BY LanJJ 2015-10-27 ----E---

             IF SQLCA.SQLcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = "upd stgg_t"
                LET g_errparam.popup = TRUE
                CALL cl_err()
              
                LET r_success=FALSE
                RETURN r_success
                EXIT FOREACH
             END IF         
         END FOREACH  
      ELSE#没有销售
#-------没有销售，则按照取astm401==状态为2-6的资料，然后按照常规库区和多扣率库区均分
#------------------------------------------------若无库区，则新增一笔资料。

         LET l_count=0
         SELECT COUNT(*) INTO l_count
           FROM stfc_t
          WHERE stfcent=g_enterprise
            AND stfc001=l_debc010
            AND (stfc024='1' OR stfc024='3')
         
         LET l_stgg004=''
         LET l_stgg005=''
         LET l_stgg006=''
         SELECT stfa010,stfa048,stfa011,stfa005 INTO l_stgg004,l_stgg005,l_stgg006,l_stgg002_01   #供應商--樓層 #品類
           FROM stfa_t
          WHERE stfaent=g_enterprise
            AND stfa005=l_debc010
            AND stfastus='Y'            
         
           ---#ADDED BY LanJJ 2015-10-27 ----S---
              #按当前币别截取aooi150里的用户设置小数位 处理金额字段- 
              #按当前币别截取aooi150里的用户设置小数位 处理金额字段-
              SELECT ooef016  INTO l_ooef016
                FROM ooef_t 
               WHERE ooefent = g_enterprise 
                 AND ooef001 = l_debcsite
                             
              CALL s_curr_round(l_debcsite,l_ooef016,l_stfb010,'2') RETURNING l_stfb010
           ---#ADDED BY LanJJ 2015-10-27 ----E---
         
         
         
         IF cl_null(l_count) OR l_count=0 THEN  #没有库区需新增一笔资料
   
   
#       lanjj add on 2016-02-22  判断表中是否已存在库区等于 l_stgg002 的重复资料  若是 直接跳过  start
#             LET g_flag = 'Y'
#             LET l_sql1 = "  SELECT stfc002",
#                          "    FROM stfc_t",
#                          "   WHERE stfcent='",g_enterprise,"'",
#                          "     AND stfc001='",l_debc010,"'",  
#                          "     AND (stfc024='1' OR stfc024='3')" 
#             PREPARE stfc002_pb1 FROM l_sql1
#             DECLARE stfc002_curs1 CURSOR FOR stfc002_pb1 
#             
#             INITIALIZE l_stfc002_d TO NULL
#             LET l_i = 1
#             FOREACH stfc002_curs1 INTO l_stfc002_d[l_i].l_stfc002
#                LET l_stfc002_t = ''
#                SELECT DISTINCT stgg002 INTO l_stfc002_t
#                              FROM stgg_t
#                             WHERE stggent =  g_enterprise
#                               AND stggsite = l_debcsite
#                               AND stgg001 =  p_stgg001
#                               AND stgg003 =  l_debc010
#                               AND stgg002 =  l_stfc002_d[l_i].l_stfc002
#                IF NOT cl_null(l_stfc002_t) THEN 
#                   LET g_flag = 'N'
#                   EXIT FOREACH
#                END IF
#                LET l_i = l_i + 1
#             END FOREACH
#             
#             IF g_flag = 'N' THEN 
#                CONTINUE FOREACH
#             END IF 
#       lanjj add on 2016-02-22  判断表中是否已存在库区等于 l_stgg002 的重复资料  若是 直接跳过  start
 
       #插入stgg表資料   
             INSERT INTO stgg_t(stggent,stggsite,stggunit,stgg001,stgg002,
                                stgg003,stgg004,stgg005,stgg006,stgg007,stgg008,
                                stgg009,stgg010,stgg011,stgg012,stgg013,stgg014)
                         VALUES(g_enterprise,l_debcsite,l_debcsite,p_stgg001,l_debc010, #lanjj modify ' ' TO l_debc010 没有库区的，库区号赋值为柜号 2016-02-23 顾问刘鑫
                                l_debc010,l_stgg004,l_stgg005,l_stgg006,0,0,
                                l_stfb010,100,0,0,0,l_stfb010)
             IF SQLCA.SQLcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = l_debcsite," || ",l_debcsite," || ",p_stgg001," || ",' '," || ",l_debc010," || ",l_stgg004," || ",l_stgg005," || ",l_stgg006," || ",l_debc010,"ins stgg_t2" #lanjj modify on 2016-02-23
                LET g_errparam.popup = TRUE
                CALL cl_err()
              
                LET r_success=FALSE
                RETURN r_success
                EXIT FOREACH
             END IF  
          ELSE  #有库区，然后按照常规库区和多扣率库区均分

             LET l_stfb010=l_stfb010/l_count

#       lanjj add on 2016-02-22  判断表中是否已存在库区等于 l_stgg002 的重复资料  若是 直接跳过  start
             LET g_flag = 'Y'
             LET l_sql1 = "  SELECT stfc002",
                          "    FROM stfc_t",
                          "   WHERE stfcent='",g_enterprise,"'",
                          "     AND stfc001='",l_debc010,"'",  
                          "     AND (stfc024='1' OR stfc024='3')" 
             PREPARE stfc002_pb FROM l_sql1
             DECLARE stfc002_curs CURSOR FOR stfc002_pb 
             
             INITIALIZE l_stfc002_d TO NULL
             LET l_i = 1
             FOREACH stfc002_curs INTO l_stfc002_d[l_i].l_stfc002
                LET l_stfc002_t = ''
                SELECT DISTINCT stgg002 INTO l_stfc002_t
                              FROM stgg_t
                             WHERE stggent =  g_enterprise
                               AND stggsite = l_debcsite
                               AND stgg001 =  p_stgg001
                               AND stgg003 =  l_debc010
                               AND stgg002 =  l_stfc002_d[l_i].l_stfc002
                IF NOT cl_null(l_stfc002_t) THEN 
                   LET g_flag = 'N'
                   EXIT FOREACH
                END IF
                LET l_i = l_i + 1
             END FOREACH
             
             IF g_flag = 'N' THEN 
                CONTINUE FOREACH
             END IF 
#       lanjj add on 2016-02-22  判断表中是否已存在库区等于 l_stgg002 的重复资料  若是 直接跳过  start

             LET l_sql="INSERT INTO stgg_t(stggent,stggsite,stggunit,stgg001,stgg002,",
                       "                   stgg003,stgg004,stgg005,stgg006,stgg007,stgg008,",
                       "                   stgg009,stgg010,stgg011,stgg012,stgg013,stgg014)",
                       "  SELECT '",g_enterprise,"','",l_debcsite,"','",l_debcsite,"','",p_stgg001,"',stfc002,",
                       "         '",l_debc010,"','",l_stgg004,"','",l_stgg005,"',stfc004,0,0,",
                       "          ",l_stfb010,",100,0,0,0,",l_stfb010,
                       "    FROM stfc_t",
                       "   WHERE stfcent='",g_enterprise,"'",
                       "     AND stfc001='",l_debc010,"'",  
                       "     AND (stfc024='1' OR stfc024='3')" 
             PREPARE astp512_insstgg_pre FROM l_sql
             EXECUTE astp512_insstgg_pre                       
             IF SQLCA.SQLcode THEN
                INITIALIZE g_errparam TO NULL
                LET g_errparam.code = SQLCA.sqlcode
                LET g_errparam.extend = l_debc010,"ins stgg_t3"  #lanjj modify on 2016-02-22
                LET g_errparam.popup = TRUE
                CALL cl_err()
              
                LET r_success=FALSE
                RETURN r_success
                EXIT FOREACH
             END IF 
             
         END IF             
            
      END IF   
   END FOREACH   

   #事務提交
   IF r_success THEN
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF

   RETURN r_success
END FUNCTION

################################################################################
# Descriptions...: 加抽/降扣金額
# Memo...........:
# Usage..........: CALL astp511_get_stgg(p_debcsite,p_debc002,p_debc005,p_stgg008)
#                  RETURNING r_stgf012
# Input parameter: p_debcsite     營運組織
#                : p_debc002      統計日期
#                : p_debc005      庫區編號
#                : p_stgg008      實收金額
# Return code....: r_success      TRUE/FALSE
# ...............: r_stgg011      促銷讓利額
# ...............: r_stgg013      VIP折扣金額
# Date & Author..: 20150602 By huangrh
# Modify.........:
################################################################################
PRIVATE FUNCTION astp512_get_stgg(p_debcsite,p_debc002,p_debc005,p_stgg008)
DEFINE p_debcsite    LIKE debc_t.debcsite
DEFINE p_debc002     LIKE debc_t.debc002
DEFINE p_debc005     LIKE debc_t.debc005
DEFINE p_stgg008     LIKE stgg_t.stgg008
DEFINE r_success     LIKE type_t.num5
DEFINE r_stgg011     LIKE stgg_t.stgg011
DEFINE r_stgg013     LIKE stgg_t.stgg013
DEFINE l_flag        LIKE type_t.num5
DEFINE l_day         LIKE type_t.num5
DEFINE l_weekday     LIKE type_t.num5
DEFINE l_preh001     LIKE preh_t.preh001
DEFINE l_preh002     LIKE preh_t.preh002
DEFINE l_preh003     LIKE preh_t.preh003
DEFINE l_preh004     LIKE preh_t.preh004
DEFINE l_preh005     LIKE preh_t.preh005
DEFINE l_preh006     LIKE preh_t.preh006
DEFINE l_preh007     LIKE preh_t.preh007
DEFINE l_preh008     LIKE preh_t.preh008
DEFINE l_prei046     LIKE prei_t.prei046
DEFINE l_prei047     LIKE prei_t.prei047
DEFINE l_prei048     LIKE prei_t.prei048
DEFINE l_prei049     LIKE prei_t.prei049
DEFINE l_prei050     LIKE prei_t.prei050
DEFINE l_prei051     LIKE prei_t.prei051
DEFINE l_debd0260    LIKE debd_t.debd026
DEFINE l_debd0261    LIKE debd_t.debd026
DEFINE l_debd0262    LIKE debd_t.debd026
DEFINE l_debd0263    LIKE debd_t.debd026
DEFINE l_debd0264    LIKE debd_t.debd026
DEFINE l_debd0265    LIKE debd_t.debd026
DEFINE l_count       LIKE type_t.num5
DEFINE l_prei057     LIKE prei_t.prei057
DEFINE l_prei058     LIKE prei_t.prei058


      LET r_stgg011=0
      LET r_stgg013=0
      LET r_success=TRUE
      
#根据库区和日期，判断是否存在促销。
      LET l_count=0
      SELECT COUNT(*) INTO l_count
        FROM preg_t,prei_t,preh_t
       WHERE pregent=preient
         AND preg001=prei001
         AND pregent=prehent
         AND preg001=preh001
         AND pregent=g_enterprise
         AND prei003=p_debc005
         AND pregsite=p_debcsite
         AND prehacti='Y'
         AND pregstus='F'
         AND (prei081='1' OR prei081='2')
         AND preh003<=p_debc002
         AND preh004>=p_debc002
         
     IF cl_null(l_count) OR l_count=0 THEN
         LET r_stgg011=0        
         LET r_stgg013=0  
         RETURN r_success,r_stgg011,r_stgg013
     ELSE

        #合同扣率、执行扣率
        LET l_prei057=''
        LET l_prei058=''
        SELECT DISTINCT prei057,prei058 INTO l_prei057,l_prei058 #合同扣率、执行扣率
          FROM preg_t,prei_t,preh_t
         WHERE pregent=preient
           AND preg001=prei001
           AND pregent=prehent
           AND preg001=preh001
           AND pregent=g_enterprise
           AND prei003=p_debc005
           AND pregsite=p_debcsite
           AND prehacti='Y'
           AND pregstus='F'
           AND prei081='1'
           AND preh003<=p_debc002
           AND preh004>=p_debc002
        IF cl_null(l_prei057) AND cl_null(l_prei058) THEN #取不到取已经终止的促销库区
           SELECT prei057,prei058 INTO l_prei057,l_prei058
             FROM preg_t,prei_t,preh_t
            WHERE pregent=preient
              AND preg001=prei001
              AND pregent=prehent
              AND preg001=preh001
              AND pregent=g_enterprise
              AND prei003=p_debc005
              AND pregsite=p_debcsite
              AND prehacti='Y'
              AND pregstus='F'
              AND prei081='2'
              AND preh003<=p_debc002
              AND preh004>=p_debc002
              AND prei098=(SELECT MAX(prei098) 
                             FROM preg_t,prei_t,preh_t
                            WHERE pregent=preient
                              AND preg001=prei001
                              AND pregent=prehent
                              AND preg001=preh001
                              AND pregent=g_enterprise
                              AND prei003=p_debc005
                              AND pregsite=p_debcsite
                              AND prehacti='Y'
                              AND pregstus='F'
                              AND prei081='2'
                              AND preh003<=p_debc002
                              AND preh004>=p_debc002)                            
        END IF  
        
        IF cl_null(l_prei057) THEN LET l_prei057=0 END IF 
        IF cl_null(l_prei058) THEN LET l_prei058=0 END IF 
        
        #加抽/降扣率
        LET l_prei057=l_prei057-l_prei058
        IF cl_null(l_prei057) THEN LET l_prei057=0 END IF      
        #加抽/降扣金額=加抽/降扣率*实收金额
        LET r_stgg011=p_stgg008*l_prei057/100
        IF cl_null(r_stgg011) THEN
           LET r_stgg011=0
        END IF      

     END IF
               
      RETURN r_success,r_stgg011,r_stgg013
      
#      LET r_stgg011=0
#      LET r_stgg013=0
#      LET r_success=TRUE
#      
##根據統計日期和庫區，取得促銷談判結果檔資料
##應該只能取得一筆促銷規則
##正常情況下，一定可以取到對應的促銷規則，所以現沒寫異常處理代碼
#      LET l_flag=FALSE   #此庫區是否有促銷--aprm310
#      DECLARE astp511_sel_preg CURSOR FOR SELECT DISTINCT preh001,preh002,preh003,preh004,preh005,preh006,preh007,preh008
#                                            FROM preg_t,prei_t,preh_t
#                                           WHERE pregent=preient
#                                             AND preg001=prei001
#                                             AND pregent=prehent
#                                             AND preg001=preh001
#                                             AND prei003=p_debc005
#                                             AND prehacti='Y'
#                                             AND pregstus='X'
#                                             AND prei081='1'
#                                             AND preh003<=p_debc002
#                                             AND preh004>=p_debc002
#                                             
#      LET l_day=DAY(p_debc002)
#      LET l_weekday=WEEKDAY(p_debc002)
#      FOREACH astp511_sel_preg INTO l_preh001,l_preh002,l_preh003,l_preh004,l_preh005,l_preh006,l_preh007,l_preh008
#         IF cl_null(l_preh007) AND cl_null(l_preh008) THEN
#            LET l_flag=TRUE
#            EXIT FOREACH
#         END IF
#         
#         IF NOT cl_null(l_preh007) AND NOT cl_null(l_preh008) THEN
#            IF l_day=l_preh007 AND l_weekday=l_preh008 THEN
#               LET l_flag=TRUE
#               EXIT FOREACH
#            END IF
#         END IF
#      
#         IF NOT cl_null(l_preh007) AND cl_null(l_preh008) THEN
#            IF l_day=l_preh007 THEN
#               LET l_flag=TRUE
#               EXIT FOREACH
#            END IF
#         END IF
#         
#         IF cl_null(l_preh007) AND NOT cl_null(l_preh008) THEN
#            IF l_weekday=l_preh008 THEN
#               LET l_flag=TRUE
#               EXIT FOREACH
#            END IF
#         END IF        
#            
#      END FOREACH
#     
#     #150629-00016#13     
#     IF NOT l_flag THEN   #此庫區不滿足aprm310設定
#         LET r_success=FALSE  
#         LET r_stgg011=0        
#         LET r_stgg013=0
#         RETURN r_success,r_stgg011,r_stgg013
#      END IF
#
##會員價內折扣點
#      LET l_prei046='' 
#      LET l_prei047='' 
#      LET l_prei048='' 
#      LET l_prei049='' 
#      LET l_prei050='' 
#      LET l_prei051=''       
#      SELECT prei046,prei047,prei048,prei049,prei050,prei051
#        INTO l_prei046,l_prei047,l_prei048,l_prei049,l_prei050,l_prei051
#        FROM prei_t
#       WHERE preient=g_enterprise
#         AND prei001=l_preh001
#      IF cl_null(l_prei046) THEN LET l_prei046=0 END IF
#      IF cl_null(l_prei047) THEN LET l_prei047=0 END IF
#      IF cl_null(l_prei048) THEN LET l_prei048=0 END IF
#      IF cl_null(l_prei049) THEN LET l_prei049=0 END IF
#      IF cl_null(l_prei050) THEN LET l_prei050=0 END IF
#      IF cl_null(l_prei051) THEN LET l_prei051=0 END IF
#      
#      
##會員等級1~5的實收金額 
#      #會員等級一
#      LET l_debd0261=''
#      SELECT SUM(debd026) INTO l_debd0261
#        FROM debd_t
#       WHERE debdent=g_enterprise
#         AND debdsite=p_debcsite
#         AND debd002=p_debc002
#         AND debd005=p_debc005
#         AND debd013='001'   #會員等級一
#      IF cl_null(l_debd0261) THEN LET l_debd0261=0 END IF
#      #會員等級二
#      LET l_debd0262=''
#      SELECT SUM(debd026) INTO l_debd0262
#        FROM debd_t
#       WHERE debdent=g_enterprise
#         AND debdsite=p_debcsite
#         AND debd002=p_debc002
#         AND debd005=p_debc005
#         AND debd013='002'   #會員等級二
#      IF cl_null(l_debd0262) THEN LET l_debd0262=0 END IF             
#      #會員等級三
#      LET l_debd0263=''
#      SELECT SUM(debd026) INTO l_debd0263
#        FROM debd_t
#       WHERE debdent=g_enterprise
#         AND debdsite=p_debcsite
#         AND debd002=p_debc002
#         AND debd005=p_debc005
#         AND debd013='003'   #會員等級三
#      IF cl_null(l_debd0263) THEN LET l_debd0263=0 END IF                 
#      #會員等級四
#      LET l_debd0264=''
#      SELECT SUM(debd026) INTO l_debd0264
#        FROM debd_t
#       WHERE debdent=g_enterprise
#         AND debdsite=p_debcsite
#         AND debd002=p_debc002
#         AND debd005=p_debc005
#         AND debd013='004'   #會員等級四
#      IF cl_null(l_debd0264) THEN LET l_debd0264=0 END IF       
#        
#      #會員等級五
#      LET l_debd0265=''
#      SELECT SUM(debd026) INTO l_debd0265
#        FROM debd_t
#       WHERE debdent=g_enterprise
#         AND debdsite=p_debcsite
#         AND debd002=p_debc002
#         AND debd005=p_debc005
#         AND debd013='005'   #會員等級五
#      IF cl_null(l_debd0265) THEN LET l_debd0265=0 END IF           
#      #非VIP會員
#      LET l_debd0260=p_stgg008-l_debd0261-l_debd0262-l_debd0263-l_debd0264-l_debd0265
#      
##加抽/降扣金額      
#      LET l_debd0260=l_debd0260*l_prei046/100
#      LET l_debd0261=l_debd0261*l_prei047/100
#      LET l_debd0262=l_debd0262*l_prei048/100
#      LET l_debd0263=l_debd0263*l_prei049/100
#      LET l_debd0264=l_debd0264*l_prei050/100
#      LET l_debd0265=l_debd0265*l_prei051/100
#
##促銷讓利額
#      LET r_stgg011=l_debd0260+l_debd0261+l_debd0262+l_debd0263+l_debd0264+l_debd0265
##VIP折扣金額 
#      LET r_stgg013=l_debd0261+l_debd0262+l_debd0263+l_debd0264+l_debd0265
#      
#      RETURN r_success,r_stgg011,r_stgg013
END FUNCTION

#end add-point
 
{</section>}
 
