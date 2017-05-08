#該程式未解開Section, 採用最新樣板產出!
{<section id="astp513.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0003(2016-09-14 10:12:52), PR版次:0003(2016-09-13 18:06:15)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000060
#+ Filename...: astp513
#+ Description: 專櫃銷售成本月匯總計算批次
#+ Creator....: 01251(2015-06-02 16:41:32)
#+ Modifier...: 08172 -SD/PR- 08172
 
{</section>}
 
{<section id="astp513.global" >}
#應用 p01 樣板自動產生(Version:19)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#Memos
#160913-00034#1    2016/09/13 by 08172   q_pmaa001開窗替换
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
   stga001 LIKE stga_t.stga001,
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       stgesite LIKE stge_t.stgesite, 
   stge002 LIKE stge_t.stge002, 
   stge003 LIKE stge_t.stge003, 
   stga001 LIKE stga_t.stga001, 
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
 
{<section id="astp513.main" >}
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
      CALL astp513_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp513 WITH FORM cl_ap_formpath("ast",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL astp513_init()
 
      #進入選單 Menu (="N")
      CALL astp513_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp513
   END IF
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp513.init" >}
#+ 初始化作業
PRIVATE FUNCTION astp513_init()
 
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
 
{<section id="astp513.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp513_ui_dialog()
 
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
   LET g_master.stga001 =g_today-1
   
#門店日結關賬日期 
   SELECT ooab002 INTO l_ooab002_1
     FROM ooab_t
    WHERE ooabent = g_enterprise 
      AND ooabsite = g_site 
      AND ooab001 = 'S-CIR-0001'  
      
#門店日結關賬日期 
   SELECT ooab002 INTO l_ooab002_2
     FROM ooab_t
    WHERE ooabent = g_enterprise 
      AND ooabsite = g_site 
      AND ooab001 = 'S-MFG-0031'  
      
   IF g_master.stga001<l_ooab002_1 OR g_master.stga001>l_ooab002_2 THEN
      LET g_master.stga001=''
   END IF   
   DISPLAY BY NAME g_master.stga001   
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.stga001 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               
               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stga001
            #add-point:BEFORE FIELD stga001 name="input.b.stga001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stga001
            
            #add-point:AFTER FIELD stga001 name="input.a.stga001"
            IF NOT cl_null(g_master.stga001) THEN
#               IF g_master.stga001<l_ooab002_1 OR g_master.stga001>l_ooab002_2 THEN            
               IF g_master.stga001<=l_ooab002_1 THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00414'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()              
                  
                  NEXT FIELD stga001
               END IF

           END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE stga001
            #add-point:ON CHANGE stga001 name="input.g.stga001"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.stga001
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stga001
            #add-point:ON ACTION controlp INFIELD stga001 name="input.c.stga001"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON stgesite,stge002,stge003
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
               DISPLAY g_site TO stgesite
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #Ctrlp:construct.c.stgesite
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stgesite
            #add-point:ON ACTION controlp INFIELD stgesite name="construct.c.stgesite"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
#            LET g_qryparam.where = s_aooi500_q_where(g_prog,'stgesite',g_site,'c')
            CALL q_ooef001_24()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stgesite  #顯示到畫面上
            NEXT FIELD stgesite                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stgesite
            #add-point:BEFORE FIELD stgesite name="construct.b.stgesite"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stgesite
            
            #add-point:AFTER FIELD stgesite name="construct.a.stgesite"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stge002
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stge002
            #add-point:ON ACTION controlp INFIELD stge002 name="construct.c.stge002"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stge002  #顯示到畫面上
            NEXT FIELD stge002                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stge002
            #add-point:BEFORE FIELD stge002 name="construct.b.stge002"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stge002
            
            #add-point:AFTER FIELD stge002 name="construct.a.stge002"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stge003
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stge003
            #add-point:ON ACTION controlp INFIELD stge003 name="construct.c.stge003"
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
            DISPLAY g_qryparam.return1 TO stge003  #顯示到畫面上
            NEXT FIELD stge003                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stge003
            #add-point:BEFORE FIELD stge003 name="construct.b.stge003"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stge003
            
            #add-point:AFTER FIELD stge003 name="construct.a.stge003"
            
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
            CALL astp513_get_buffer(l_dialog)
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
         CALL astp513_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF NOT cl_schedule_exec_check() THEN
         CONTINUE WHILE
      END IF
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog name="process.exit_dialog"
      LET lc_param.stga001=g_master.stga001
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
                 CALL astp513_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = astp513_transfer_argv(ls_js)
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
 
{<section id="astp513.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION astp513_transfer_argv(ls_js)
 
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
 
{<section id="astp513.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION astp513_process(ls_js)
 
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
   #CALL astp513_insert(lc_param.wc,lc_param.stga001) RETURNING l_success #marked by lanjj 151022
   #CALL s_astp513_insert(lc_param.wc,lc_param.stga001) RETURNING l_success #added by lanjj 151022
   
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      #160225-00040#18 Add By Ken 160314(S)
      LET l_loop = 2
      CALL cl_progress_bar_no_window(l_loop)  
      #160225-00040#18 Add By Ken 160314(E)
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE astp513_process_cs CURSOR FROM ls_sql
#  FOREACH astp513_process_cs INTO
   #add-point:process段process name="process.process"
   #160225-00040#18 Add By Ken 160314(S)   產生資料
   LET l_msg = cl_getmsg('ast-00330',g_lang)
   CALL cl_progress_no_window_ing(l_msg)   
   #160225-00040#18 Add By Ken 160314(e)  
   
   CALL s_astp513_insert(lc_param.wc,lc_param.stga001) RETURNING l_success #added by lanjj 151022
   
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
   CALL astp513_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp513.get_buffer" >}
PRIVATE FUNCTION astp513_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.stga001 = p_dialog.getFieldBuffer('stga001')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astp513.msgcentre_notify" >}
PRIVATE FUNCTION astp513_msgcentre_notify()
 
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
 
{<section id="astp513.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: p處理邏輯
# Memo...........:
# Usage..........: CALL astp512_insert(p_wc,p_stga001)
#                  RETURNING r_success
# Input parameter: p_wc           查詢條件
#                : p_stga001      統計日期
# Return code....: r_success      TRUE/FALSE
# Date & Author..: 20150602 By huangrh
# Modify.........: MODIFIED BY LANjj
################################################################################
PUBLIC FUNCTION astp513_insert(p_wc,p_stga001)
{本程序不再调用此FUNCTION---by lanjj 151022 ---}
DEFINE p_wc           STRING
DEFINE p_stga001      LIKE stga_t.stga001
DEFINE r_success      LIKE type_t.num5
DEFINE l_sql          STRING
DEFINE l_wc           STRING 
DEFINE l_year         LIKE type_t.num5
DEFINE l_month        LIKE type_t.num5
DEFINE l_day          LIKE type_t.num5
DEFINE l_bdate        LIKE type_t.dat
DEFINE l_edate        LIKE type_t.dat
DEFINE l_stfa001      LIKE stfa_t.stfa001
DEFINE l_stgeent      LIKE stge_t.stgeent
DEFINE l_stgesite     LIKE stge_t.stgesite
DEFINE l_stge001      LIKE stge_t.stge001
DEFINE l_stge002      LIKE stge_t.stge002
DEFINE l_stge003      LIKE stge_t.stge003
DEFINE l_stge004      LIKE stge_t.stge004
DEFINE l_stge005      LIKE stge_t.stge005
DEFINE l_stge006      LIKE stge_t.stge006
DEFINE l_stge007      LIKE stge_t.stge007
DEFINE l_stge008      LIKE stge_t.stge008
DEFINE l_stge009      LIKE stge_t.stge009
DEFINE l_stge010      LIKE stge_t.stge010
DEFINE l_stge011      LIKE stge_t.stge011
DEFINE l_stge012      LIKE stge_t.stge012
DEFINE l_stge013      LIKE stge_t.stge013
DEFINE l_stge014      LIKE stge_t.stge014
DEFINE l_stge015      LIKE stge_t.stge015
DEFINE l_stge016      LIKE stge_t.stge016
DEFINE l_stge017      LIKE stge_t.stge017
DEFINE l_stge018      LIKE stge_t.stge018
DEFINE l_stge019      LIKE stge_t.stge019
DEFINE l_stge020      LIKE stge_t.stge020
DEFINE l_stge021      LIKE stge_t.stge021
DEFINE l_stge022      LIKE stge_t.stge022
DEFINE l_count        LIKE type_t.num5
DEFINE l_stea007      LIKE stea_t.stea007
DEFINE l_stea007_1    LIKE stea_t.stea007
DEFINE l_stea049      LIKE stea_t.stea049
DEFINE l_stea049_1    LIKE stea_t.stea049
DEFINE l_steacnfdt    LIKE stea_t.steacnfdt
DEFINE l_steacnfdt_1  LIKE stea_t.steacnfdt
DEFINE l_stfb010      LIKE stfb_t.stfb010
DEFINE l_stfb006      LIKE stfb_t.stfb006

DEFINE l_stfa033      LIKE stfa_t.stfa013
DEFINE l_oodb006      LIKE oodb_t.oodb006 
DEFINE l_cost         LIKE stga_t.stga012
#ADDED BY LANJJ 15/10/13

# #aooi500設置的組織範圍
#   CALL s_aooi500_sql_where(g_prog,'stgesite') RETURNING l_wc 
   IF cl_null(l_wc) THEN
      LET l_wc=" 1=1"
   END IF  
   
   #開啟事務
   CALL s_transaction_begin()


   LET r_success=TRUE

   
   LET l_year=YEAR(p_stga001)
   LET l_month=MONTH(p_stga001)
   LET l_bdate=MDY(l_month,1,l_year)  #會計期間開始日期
   CALL s_date_get_max_day(l_year,l_month) RETURNING l_day #會計期間最大天數
   LET l_edate= MDY(l_month,l_day,l_year)   #會計期間結束日期
   IF l_month<10 THEN
      LET l_stge001='0'||l_month
   ELSE
      LET l_stge001=l_month
   END IF
   #會計期間
   LET l_stge001=YEAR(p_stga001)||l_stge001
   
   #根據錄入的條件，刪除stgg的資料
   LET l_sql=" DELETE FROM stge_t",
             " WHERE stgeent='",g_enterprise,"'",
             "   AND stge001='",l_stge001,"'",
             "   AND ",p_wc,
             "   AND ",l_wc
             #""會計期間

   PREPARE astp513_del_stge_pre FROM l_sql   
   EXECUTE astp513_del_stge_pre                      
   IF SQLCA.SQLcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = "del stge_t"
      LET g_errparam.popup = TRUE
      CALL cl_err()
    
      LET r_success=FALSE
      RETURN r_success
   END IF 

#查詢條件，重新整理--替換字符
   CALL cl_str_replace(p_wc,"stgesite","stgasite") RETURNING p_wc 
   CALL cl_str_replace(p_wc,"stge002","stga004") RETURNING p_wc
   CALL cl_str_replace(p_wc,"stge003","stga005") RETURNING p_wc
 
 
   CALL cl_str_replace(l_wc,"stgesite","stgasite") RETURNING l_wc 

   #定義pre
      
    #ADDED BY LANJJ 2015-10-12 （S）
    #成本
    LET l_sql=" SELECT SUM(stga012) ",
              "   FROM stga_t ",
              "  WHERE stgaent=? ",
              "    AND stga001 BETWEEN to_date('",l_bdate,"','yy/mm/dd') AND to_date('",l_edate,"','yy/mm/dd') ",
              "    AND stga004=? ",
              "    and stgasite=? ",
              "    AND ",p_wc,
              "    AND ",l_wc
    PREPARE astp513_sel_cost_pre FROM l_sql 
    #ADDED BY LANJJ 2015-10-12 （E）
    #應付成本
    LET l_sql=" SELECT SUM(stga012)",
        "   FROM stga_t",
        " WHERE stgaent=?",
        #"   AND stga001=?",   #MARKED BY LANJJ 2015-10-11
        "   AND stga001 BETWEEN to_date('",l_bdate,"','yy/mm/dd') AND to_date('",l_edate,"','yy/mm/dd') ", #ADDED BY lanjj 2015-10-11
        "   AND stga004=?",
        "   and stgasite=?",
        "   AND ",p_wc,
        "   AND ",l_wc,
        "   AND (stga013='1' OR stga013='2' OR stga013='7' OR stga013='8')"    
   PREPARE astp513_sel_stge011_pre FROM l_sql                
    
    #預扣費用金額
   LET l_sql=" SELECT SUM(stga012)",
       "   FROM stga_t",
       " WHERE stgaent=?",
        #"   AND stga001=?",   #MARKED BY LANJJ 2015-10-11
        "   AND stga001 BETWEEN to_date('",l_bdate,"','yy/mm/dd') AND to_date('",l_edate,"','yy/mm/dd') ", #ADDED BY lanjj 2015-10-11
       "   AND stga004=?",
       "   and stgasite=?",
       "   AND ",p_wc,
       "   AND ",l_wc,
       "   AND (stga013='3' OR stga013='17')" 
   PREPARE astp513_sel_stge012_pre FROM l_sql   
   
   #保底成本差額
   LET l_sql=" SELECT SUM(stga012)",
       "   FROM stga_t",
       " WHERE stgaent=?",
        #"   AND stga001=?",   #MARKED BY LANJJ 2015-10-11
        "   AND stga001 BETWEEN to_date('",l_bdate,"','yy/mm/dd') AND to_date('",l_edate,"','yy/mm/dd') ", #ADDED BY lanjj 2015-10-11
       "   AND stga004=?",
       "   and stgasite=?",
       "   AND ",p_wc,
       "   AND ",l_wc,
       "   AND (stga013='5' OR stga013='9' OR stga013='15' OR stga013='16')"    
   PREPARE astp513_sel_stge013_pre FROM l_sql         
    
   #目標銷售成本差額
   LET l_sql=" SELECT SUM(stga012)",
       "   FROM stga_t",
       " WHERE stgaent=?",
        #"   AND stga001=?",   #MARKED BY LANJJ 2015-10-11
        "   AND stga001 BETWEEN to_date('",l_bdate,"','yy/mm/dd') AND to_date('",l_edate,"','yy/mm/dd') ", #ADDED BY lanjj 2015-10-11
       "   AND stga004=?",
       "   and stgasite=?",
       "   AND ",p_wc,
       "   AND ",l_wc,
       #"   AND (stga013='8' OR stga013='10')"  #MARKED BY LANJJ 2015-10-12
       "   AND (stga013='8' OR stga013='10' OR stga013='20' OR stga013='21')"  #ADDED BY LANJJ 2015-10-12
   PREPARE astp513_sel_stge014_pre FROM l_sql    

   #返還VIP折扣
   LET l_sql=" SELECT SUM(stga012)",
       "   FROM stga_t",
       " WHERE stgaent=?",
        #"   AND stga001=?",   #MARKED BY LANJJ 2015-10-11
        "   AND stga001 BETWEEN to_date('",l_bdate,"','yy/mm/dd') AND to_date('",l_edate,"','yy/mm/dd') ", #ADDED BY lanjj 2015-10-11
       "   AND stga004=?",
       "   and stgasite=?",
       "   AND ",p_wc,
       "   AND ",l_wc,
       #"   AND (stga013='6' OR stga013='11')"   #MARKED BY LANJJ 2015-10-12  
       "   AND (stga013='6' OR stga013='11' OR stga013='19')"  #ADDED BY LANJJ 2015-10-12
   PREPARE astp513_sel_stge019_pre FROM l_sql   

   #結算調整金額
   LET l_sql=" SELECT SUM(stga012)",
       "   FROM stga_t",
       " WHERE stgaent=?",
        #"   AND stga001=?",   #MARKED BY LANJJ 2015-10-11
        "   AND stga001 BETWEEN to_date('",l_bdate,"','yy/mm/dd') AND to_date('",l_edate,"','yy/mm/dd') ", #ADDED BY lanjj 2015-10-11
       "   AND stga004=?",
       "   and stgasite=?",
       "   AND ",p_wc,
       "   AND ",l_wc,
       "   AND (stga013='12')"    
   PREPARE astp513_sel_stge020_pre FROM l_sql
     
   #退貨調整金額
   LET l_sql=" SELECT SUM(stga012)",
       "   FROM stga_t",
       " WHERE stgaent=?",
        #"   AND stga001=?",   #MARKED BY LANJJ 2015-10-11
        "   AND stga001 BETWEEN to_date('",l_bdate,"','yy/mm/dd') AND to_date('",l_edate,"','yy/mm/dd') ", #ADDED BY lanjj 2015-10-11
       "   AND stga004=?",
       "   and stgasite=?",
       "   AND ",p_wc,
       "   AND ",l_wc,
       #"   AND (stga013='13')"    #MARKED BY LANJJ 2015-10-12
       "   AND (stga013='13' OR stga013='18')"  #ADDED BY LANJJ 2015-10-12   
   PREPARE astp513_sel_stge021_pre FROM l_sql
       

#查詢資料  ---專櫃每日銷售成本統計檔
#目前SA說一個商品只能是一個專櫃的
#       一個專櫃只能歸屬於一個供應商
#       一個庫區的商品，要不全部不促銷，要不全部促銷

#    stga專櫃每日銷售成本統計檔---是個匯總單
   LET l_sql=" SELECT DISTINCT stgaent,stgasite,stga004",
             "   FROM stga_t",
             " WHERE stgaent='",g_enterprise,"'",
             #"   AND stga001='",p_stga001,"'",    #MARKED BY LANJJ 2015-09-26 
             "   AND ",p_wc,
             "   AND ",l_wc

   PREPARE astp513_sel_stga_pre FROM l_sql   
   DECLARE astp513_sel_stga CURSOR FOR astp513_sel_stga_pre 
   

   FOREACH astp513_sel_stga INTO l_stgeent,l_stgesite,l_stge002
 
 
      #樓層--品類--經營方式--專櫃面積
      LET l_stfa001=''
      LET l_stge004=''
      LET l_stge005=''
      LET l_stge006=''
      LET l_stge007=''
      SELECT stfa001,stfa048,stfa011,stfa003,stfa007 
        INTO l_stfa001,l_stge004,l_stge005,l_stge006,l_stge007   #樓層--品類--經營方式--專櫃面積
        FROM stfa_t
       WHERE stfaent=g_enterprise
         AND stfa005=l_stge002
         AND stfastus='Y'
#         AND stfa019<=p_stga001
#         AND stfa020>=p_stga001          #MARKED BY LANJJ 2015-10-08

      #追溯面積    追溯面积 = 专柜的（新面积-旧面积）/30*（本会计期间最后一天-续签日期+1）
      #        1）根据专柜编号，判断该专柜本会计期间内是否有做合同变更或续签。如果没有则为0
      #        2）如果有变更或续签，则抓取本会计期间内最新一笔变更或续签，同时抓取小于本会计期间的最新一笔变更或续签。取得两个版本的作业方式、续签日期、专柜面积。
      #        3）如果本会计期间的最大版本的变更/续签合同的续签日期为空，否则不需要面积追溯，追溯面积为0。
      #        4）如果本会计期间的最大版本的变更/续签合同的续签日期为不空时与小于本会计期间的的最新一笔变更/续签的续签日期不等，则需要做面积追索。
      #        5）如果本会计期间的最大版本的变更/续签合同的续签日期不为空时，小于本会计期间的的最新一笔变更/续签的续签日期为空时，则需要做面积追索。      
      LET l_count=0 
      SELECT COUNT(*) INTO l_count
        FROM stea_t
       WHERE steaent=g_enterprise
         AND stea005=l_stge002
         AND steastus='Y'
         AND steacnfdt>=l_bdate
         AND steacnfdt<=l_edate
      IF NOT cl_null(l_count) AND l_count>1 THEN #有變更單或續期單
         #本會計期間最新的資料
         LET l_steacnfdt=''
         SELECT MAX(l_steacnfdt) INTO l_steacnfdt
           FROM stea_t
          WHERE steaent=g_enterprise
            AND stea005=l_stge002
            AND steastus='Y'
            AND steacnfdt>=l_bdate
            AND steacnfdt<=l_edate 
         LET l_stea049=''
         LET l_stea007=''
         SELECT stea007,stea049 INTO l_stea007,l_stea049 #建筑面积，续签日期
           FROM stea_t
          WHERE steaent=g_enterprise
            AND stea005=l_stge002
            AND steastus='Y'
            AND steacnfdt=l_steacnfdt
         IF cl_null(l_stea049) THEN  #續簽日期為空
            LET l_stge008=0
         ELSE
            #小於本會計期間最新的資料
           LET l_steacnfdt_1=''
           SELECT MAX(l_steacnfdt) INTO l_steacnfdt_1
             FROM stea_t
            WHERE steaent=g_enterprise
              AND stea005=l_stge002
              AND steastus='Y'
              AND steacnfdt<l_bdate 
            LET l_stea049_1=''   
            LET l_stea007_1=''            
            SELECT stea007,stea049 INTO l_stea007_1,l_stea049_1
             FROM stea_t
            WHERE steaent=g_enterprise
              AND stea005=l_stge002
              AND steastus='Y'
              AND steacnfdt=l_steacnfdt_1
            IF NOT cl_null(l_stea049_1) AND l_stea049_1=l_stea049 THEN #續簽日期相等
               LET l_stge008=0
            ELSE
               LET l_stge008=l_stea007-l_stea007_1/30*(l_edate-l_stea049+1)          
            END IF             
          END IF       
      ELSE
         LET l_stge008=0      
      END IF
      
      
      #應收金額--實收金額
      LET l_stge009=''
      LET l_stge010=''
#      SELECT SUM(debg012),SUM(debg017) INTO l_stge009,l_stge010  #取原价金额150805-00003#44
#        FROM debg_t
#       WHERE debgent=g_enterprise
#         AND debgsite=l_stgesite
#         AND debg002>=l_bdate
#         AND debg002<=l_edate
#         AND debg005=l_stge002                                                  MARKED BY LANJJ 2015-09-26

#     SELECT SUM(debg013),SUM(debg017) INTO l_stge009,l_stge010  #取原价金额150805-00003#44
#       FROM debg_t
#      WHERE debgent=g_enterprise
#        AND debgsite=l_stgesite
#        AND debg002>=l_bdate
#        AND debg002<=l_edate
#        AND debg005=l_stge002
       SELECT SUM(stga008),SUM(stga009) INTO l_stge009,l_stge010  #取原价金额150805-00003#44
         FROM stga_t
        WHERE stgaent=g_enterprise
          AND stgasite=l_stgesite
          AND stga001>=l_bdate
          AND stga001<=l_edate
          AND stga004=l_stge002                                                 #ADDED BY LANJJ 2015-09-26
     IF cl_null(l_stge009) THEN LET l_stge009=0 END IF 
     IF cl_null(l_stge010) THEN LET l_stge010=0 END IF
      
     #應付成本
     LET l_stge011 =''
     #EXECUTE astp513_sel_stge011_pre USING g_enterprise,p_stga001,l_stge002,l_stgesite INTO l_stge011   #MARKED BY LANJJ 2015-10-11
     EXECUTE astp513_sel_stge011_pre USING g_enterprise,l_stge002,l_stgesite INTO l_stge011      #ADDED BY LANJJ 2015-10-11
     IF cl_null(l_stge011) THEN LET l_stge011=0 END IF

      #預扣費用金額  
     LET l_stge012 =''
     #EXECUTE astp513_sel_stge012_pre USING g_enterprise,p_stga001,l_stge002,l_stgesite INTO l_stge012   #MARKED BY LANJJ 2015-10-11
     EXECUTE astp513_sel_stge012_pre USING g_enterprise,l_stge002,l_stgesite INTO l_stge012      #ADDED BY LANJJ 2015-10-11
     IF cl_null(l_stge012) THEN LET l_stge012=0 END IF
     
     #保底成本差額l   
     LET l_stge013 =''
     #EXECUTE astp513_sel_stge013_pre USING g_enterprise,p_stga001,l_stge002,l_stgesite INTO l_stge013   #MARKED BY LANJJ 2015-10-11    
     EXECUTE astp513_sel_stge013_pre USING g_enterprise,l_stge002,l_stgesite INTO l_stge013      #ADDED BY LANJJ 2015-10-11
     IF cl_null(l_stge013) THEN LET l_stge013=0 END IF

     #目標銷售成本差額
     LET l_stge014 =''     
     #EXECUTE astp513_sel_stge014_pre USING g_enterprise,p_stga001,l_stge002,l_stgesite INTO l_stge014   #MARKED BY LANJJ 2015-10-11
     EXECUTE astp513_sel_stge014_pre USING g_enterprise,l_stge002,l_stgesite INTO l_stge014      #ADDED BY LANJJ 2015-10-11
     IF cl_null(l_stge014) THEN LET l_stge014=0 END IF
     
     #稅額---待定     
     #税额=成本金额*专柜合同中的进项税的税率。 ADDED BY LANJJ 2015-10-12 ----S----
     LET l_stge015 = '' 
     LET l_stfa033 = ''
     LET l_oodb006 = ''
     LET l_cost = ''
      SELECT stfa033
        INTO l_stfa033  #税别编号
        FROM stfa_t
       WHERE stfaent = g_enterprise
         AND stfa005 = l_stge002
         AND stfastus='Y'      
      
      SELECT oodb006 
        INTO l_oodb006     #税率
        FROM oodb_t 
       WHERE oodbent = g_enterprise 
         AND oodb001 = 'DLSQ'      #暂时写死为大陆税区
         AND oodb002 = l_stfa033 
      
     EXECUTE astp513_sel_cost_pre 
       USING g_enterprise,l_stge002,l_stgesite 
        INTO l_cost       #成本
     
     LET l_stge015 = l_oodb006 * l_cost/100
     IF cl_null(l_stge015) THEN
        LET l_stge015=0
     END IF  
     #税额=成本金额*专柜合同中的进项税的税率。 ADDED BY LANJJ 2015-10-12 ----E----
     
     #費用扣項金額
     SELECT SUM(stbb009) INTO l_stge016
       FROM stbb_t,stba_t
      WHERE stbbent=stbaent
        AND stbbdocno=stbadocno
        AND stba013=l_stge002
        AND stbastus='Y'
#        AND stbb005 >= p_stga001
#        AND stbb006 <= p_stga001 
#        AND stba010 = l_stfa001 #MARKED BY LANJJ 2015-10-11
        AND stbb007 = l_stge001  #会计期间 ADDED BY LANJJ 2015-10-11
      IF cl_null(l_stge016) THEN
         LET l_stge016=0
      END IF   
      
#      #租金金額
#      SELECT SUM(stfb010) INTO l_stge017
#        FROM stfa_t,stfb_t,stae_t
#       WHERE stfaent=stfbent
#         AND staeent=stfbent
#         AND stfa001=stfb001
#         AND stfb002=stae001
#         AND stfaent=g_enterprise         
#         AND stfasite=l_stgesite
#         AND stfa005=l_stge002
#         AND stae012='0001'   #租金
#         AND staestus='Y'
#         AND stfastus='Y'
#         AND stfa019<=p_stga001
#         AND stfa020>=p_stga001
#         AND stfb013<=p_stga001
#         AND stfb014>=p_stga001
#      IF cl_null(l_stge017) THEN LET l_stge017=0 END IF   
#从合约中取租金，算出每月租金
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
         AND stfasite=l_stgesite
         AND stfa005=l_stge002
         AND stae012='0001'   #租金
         AND staestus='Y'
         AND stfastus='Y'
         AND stfb026='Y'
      IF cl_null(l_stfb010) THEN
         LET l_stfb010=0
      END IF   
      LET l_stge017=''
      IF l_stfb006='3' THEN       #月
         #每月租金
         LET l_stge017=l_stfb010
      END IF
      IF l_stfb006='2' THEN       #季度 
         #每月租金      
         LET l_stge017=l_stfb010/3                 
      END IF
      IF l_stfb006='1' THEN       #年
         #每月租金
         LET l_stge017=l_stfb010/12                 
      END IF   
      IF cl_null(l_stge017) THEN LET l_stge017=0 END IF  
      
#
#      #物業管理費
#      SELECT SUM(stfb010) INTO l_stge018
#        FROM stfa_t,stfb_t,stae_t
#       WHERE stfaent=stfbent
#         AND staeent=stfbent
#         AND stfa001=stfb001
#         AND stfb002=stae001
#         AND stfaent=g_enterprise         
#         AND stfasite=l_stgesite
#         AND stfa005=l_stge002
#         AND stae012='0002'   #物業管理費
#         AND staestus='Y'
#         AND stfastus='Y'
#         AND stfa019<=p_stga001
#         AND stfa020>=p_stga001
#         AND stfb013<=p_stga001
#         AND stfb014>=p_stga001
#      IF cl_null(l_stge018) THEN LET l_stge018=0 END IF
      LET l_stfb010=''
      LET l_stfb006=''
      SELECT DISTINCT stfb010,stfb006 INTO l_stfb010,l_stfb006
        FROM stfa_t,stfb_t,stae_t
       WHERE stfaent=stfbent
         AND staeent=stfbent
         AND stfa001=stfb001
         AND stfb002=stae001
         AND stfaent=g_enterprise         
         AND stfasite=l_stgesite
         AND stfa005=l_stge002
         AND stae012='0002'   #物业管理费
         AND staestus='Y'
         AND stfastus='Y'
         AND stfb026='Y'
      IF cl_null(l_stfb010) THEN
         LET l_stfb010=0
      END IF   
      LET l_stge018=''
      IF l_stfb006='3' THEN       #月
         #每月租金
         LET l_stge018=l_stfb010
      END IF
      IF l_stfb006='2' THEN       #季度 
         #每月租金      
         LET l_stge018=l_stfb010/3                 
      END IF
      IF l_stfb006='1' THEN       #年
         #每月租金
         LET l_stge018=l_stfb010/12                 
      END IF 
      IF cl_null(l_stge018) THEN LET l_stge018=0 END IF
      
     #返還VIP折扣
     LET l_stge019=''
     #EXECUTE astp513_sel_stge019_pre USING g_enterprise,p_stga001,l_stge002,l_stgesite INTO l_stge019      #MARKED BY LANJJ 2015-10-11   
     EXECUTE astp513_sel_stge019_pre USING g_enterprise,l_stge002,l_stgesite INTO l_stge019       #ADDED BY LANJJ 2015-10-11
     IF cl_null(l_stge019) THEN LET l_stge019=0 END IF
     
     #結算調整金額
     LET l_stge020='' 
     #EXECUTE astp513_sel_stge020_pre USING g_enterprise,p_stga001,l_stge002,l_stgesite INTO l_stge020      #MARKED BY LANJJ 2015-10-11   
     EXECUTE astp513_sel_stge020_pre USING g_enterprise,l_stge002,l_stgesite INTO l_stge020       #ADDED BY LANJJ 2015-10-11
     IF cl_null(l_stge020) THEN LET l_stge020=0 END IF
     
     #退貨調整金額
     LET l_stge021=''
     #EXECUTE astp513_sel_stge021_pre USING g_enterprise,p_stga001,l_stge002,l_stgesite INTO l_stge021      #MARKED BY LANJJ 2015-10-11   
     EXECUTE astp513_sel_stge021_pre USING g_enterprise,l_stge002,l_stgesite INTO l_stge021        #ADDED BY LANJJ 2015-10-11
     IF cl_null(l_stge021) THEN LET l_stge021=0 END IF
     
      #stge022加抽/降扣金额
      LET l_stge022=''
      SELECT SUM(stgf012) INTO l_stge022
        FROM stgf_t
       WHERE stgfent=g_enterprise
         AND stgfsite=l_stgesite
         AND stgf001>=l_bdate
         AND stgf001<=p_stga001
         AND stgf004=l_stge002
      IF cl_null(l_stge022) THEN LET l_stge022=0 END IF      

#插入stgg表資料     
      INSERT INTO stge_t(stgeent,stgesite,stgeunit,stge001,stge002,
                         stge003,stge004,stge005,stge006,stge007,stge008,
                         stge009,stge010,stge011,stge012,stge013,stge014,
                         stge015,stge016,stge017,stge018,stge019,stge020,stge021,stge022)
                  VALUES(l_stgeent,l_stgesite,l_stgesite,l_stge001,l_stge002,
                         l_stge003,l_stge004,l_stge005,l_stge006,l_stge007,l_stge008,
                         l_stge009,l_stge010,l_stge011,l_stge012,l_stge013,l_stge014,
                         l_stge015,l_stge016,l_stge017,l_stge018,l_stge019,l_stge020,l_stge021,l_stge022)
      IF SQLCA.SQLcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.extend = "ins stge_t"
         LET g_errparam.popup = TRUE
         CALL cl_err()
       
         LET r_success=FALSE
         EXIT FOREACH
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

#end add-point
 
{</section>}
 
