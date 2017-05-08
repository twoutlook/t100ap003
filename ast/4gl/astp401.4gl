#該程式未解開Section, 採用最新樣板產出!
{<section id="astp401.description" >}
#應用 a00 樣板自動產生(Version:3)
#+ Standard Version.....: SD版次:0007(2016-09-14 09:54:57), PR版次:0007(2016-11-16 16:28:26)
#+ Customerized Version.: SD版次:0000(1900-01-01 00:00:00), PR版次:0000(1900-01-01 00:00:00)
#+ Build......: 000062
#+ Filename...: astp401
#+ Description: 專櫃合約狀態更新批次作業
#+ Creator....: 06536(2015-07-21 14:58:57)
#+ Modifier...: 08172 -SD/PR- 06540
 
{</section>}
 
{<section id="astp401.global" >}
#應用 p01 樣板自動產生(Version:19)
#add-point:填寫註解說明 name="global.memo" name="global.memo"
#Memos
#160905-00007#16   2016/09/05 By 02599   SQL条件增加ent
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
  #zhanghr-0902  
  dateedit_1  LIKE type_t.chr500,
   #end add-point
        wc               STRING
                     END RECORD
 
DEFINE g_sql             STRING        #組 sql 用
DEFINE g_forupd_sql      STRING        #SELECT ... FOR UPDATE  SQL
DEFINE g_error_show      LIKE type_t.num5
DEFINE g_jobid           STRING
DEFINE g_wc              STRING
 
PRIVATE TYPE type_master RECORD
       steaunit LIKE type_t.chr10, 
   stea005 LIKE type_t.chr20, 
   stea010 LIKE type_t.chr10, 
   stea001 LIKE type_t.chr20, 
   dateedit_1 LIKE type_t.chr500, 
   stagenow LIKE type_t.chr80,
       wc               STRING
       END RECORD
 
#模組變數(Module Variables)
DEFINE g_master type_master
 
#add-point:自定義模組變數(Module Variable) name="global.variable"
DEFINE g_dateedit_1  LIKE type_t.dat   #预设执行日期

#end add-point
 
#add-point:自定義客戶專用模組變數(Module Variable) name="global.variable_customerization"

#end add-point
 
#add-point:傳入參數說明 name="global.argv"
 
#end add-point
 
{</section>}
 
{<section id="astp401.main" >}
MAIN
   #add-point:main段define (客製用) name="main.define_customerization"
   
   #end add-point 
   DEFINE ls_js    STRING
   DEFINE lc_param type_parameter  
   #add-point:main段define name="main.define"
    DEFINE l_success   LIKE type_t.num5
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
      CALL astp401_process(ls_js)
   ELSE
      #畫面開啟 (identifier)
      OPEN WINDOW w_astp401 WITH FORM cl_ap_formpath("ast",g_code)
 
      #瀏覽頁簽資料初始化
      CALL cl_ui_init()
 
      #程式初始化
      CALL astp401_init()
 
      #進入選單 Menu (="N")
      CALL astp401_ui_dialog()
 
      #add-point:畫面關閉前 name="main.before_close"
      
      #end add-point
      #畫面關閉
      CLOSE WINDOW w_astp401
   END IF
 
   #add-point:作業離開前 name="main.exit"
   
   #end add-point
 
   #離開作業
   CALL cl_ap_exitprogram("0")
END MAIN
 
{</section>}
 
{<section id="astp401.init" >}
#+ 初始化作業
PRIVATE FUNCTION astp401_init()
 
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
 
{<section id="astp401.ui_dialog" >}
#+ 選單功能實際執行處
PRIVATE FUNCTION astp401_ui_dialog()
 
   #add-point:ui_dialog段define (客製用) name="ui_dialog.define_customerization"
   
   #end add-point
   DEFINE li_exit  LIKE type_t.num5    #判別是否為離開作業
   DEFINE li_idx   LIKE type_t.num10
   DEFINE ls_js    STRING
   DEFINE ls_wc    STRING
   DEFINE l_dialog ui.DIALOG
   DEFINE lc_param type_parameter
   #add-point:ui_dialog段define name="ui_dialog.define"
   DEFINE l_steasite LIKE stea_t.steasite
   #end add-point
   
   #add-point:ui_dialog段before dialog name="ui_dialog.before_dialog"
   LET g_master.dateedit_1 = g_today            #预设执行日期为g_today
   DISPLAY g_master.dateedit_1 TO dateedit_1
    
   #end add-point
 
   WHILE TRUE
      #add-point:ui_dialog段before dialog2 name="ui_dialog.before_dialog2"
      
      #end add-point
 
      DIALOG ATTRIBUTES(UNBUFFERED,FIELD ORDER FORM)
         #應用 a57 樣板自動產生(Version:3)
         INPUT BY NAME g_master.dateedit_1 
            ATTRIBUTE(WITHOUT DEFAULTS)
            
            #自訂ACTION(master_input)
            
         
            BEFORE INPUT
               #add-point:資料輸入前 name="input.m.before_input"
               
               #end add-point
         
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD dateedit_1
            #add-point:BEFORE FIELD dateedit_1 name="input.b.dateedit_1"
     
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD dateedit_1
            
            #add-point:AFTER FIELD dateedit_1 name="input.a.dateedit_1"
          IF NOT cl_null(g_master.dateedit_1) THEN     #不允许大于当前日期、不允许为空
               IF g_master.dateedit_1 > g_today THEN
                  INITIALIZE g_errparam TO NULL
                  LET g_errparam.code = 'ast-00380'
                  LET g_errparam.extend = ''
                  LET g_errparam.popup = TRUE
                  CALL cl_err()                
                  NEXT FIELD dateedit_1
               END IF
           END IF
            #END add-point
            
 
 
         #應用 a04 樣板自動產生(Version:3)
         ON CHANGE dateedit_1
            #add-point:ON CHANGE dateedit_1 name="input.g.dateedit_1"
            
            #END add-point 
 
 
 
                     #Ctrlp:input.c.dateedit_1
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD dateedit_1
            #add-point:ON ACTION controlp INFIELD dateedit_1 name="input.c.dateedit_1"
            
            #END add-point
 
 
 
               
            AFTER INPUT
               #add-point:資料輸入後 name="input.m.after_input"
               
               #end add-point
               
            #add-point:其他管控(on row change, etc...) name="input.other"
            
            #end add-point
         END INPUT
 
 
 
         
         #應用 a58 樣板自動產生(Version:3)
         CONSTRUCT BY NAME g_master.wc ON steaunit,stea005,stea010,stea001
            BEFORE CONSTRUCT
               #add-point:cs段before_construct name="cs.head.before_construct"
 #              DISPLAY g_site TO steasite   #默认值为当前组织
                DISPLAY g_site TO steaunit   #mod by dengdd 150917
               #end add-point 
         
            #公用欄位開窗相關處理
            
               
            #一般欄位開窗相關處理    
                     #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD steaunit
            #add-point:BEFORE FIELD steaunit name="construct.b.steaunit"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD steaunit
            
            #add-point:AFTER FIELD steaunit name="construct.a.steaunit"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.steaunit
#         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD steaunit
            #add-point:ON ACTION controlp INFIELD steaunit name="construct.c.steaunit"
            
            #END add-point
 
 
         #Ctrlp:construct.c.stea005
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stea005
            #add-point:ON ACTION controlp INFIELD stea005 name="construct.c.stea005"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
#            LET g_qryparam.arg1=l_steasite
            LET g_qryparam.arg1=g_site                 #mod by dengdd 150917
            CALL q_mhae001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stea005      #顯示到畫面上
            NEXT FIELD stea005                         #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stea005
            #add-point:BEFORE FIELD stea005 name="construct.b.stea005"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stea005
            
            #add-point:AFTER FIELD stea005 name="construct.a.stea005"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stea010
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stea010
            #add-point:ON ACTION controlp INFIELD stea010 name="construct.c.stea010"
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
            DISPLAY g_qryparam.return1 TO stea010  #顯示到畫面上
            NEXT FIELD stea010                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stea010
            #add-point:BEFORE FIELD stea010 name="construct.b.stea010"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stea010
            
            #add-point:AFTER FIELD stea010 name="construct.a.stea010"
            
            #END add-point
            
 
 
         #Ctrlp:construct.c.stea001
         #應用 a03 樣板自動產生(Version:3)
         ON ACTION controlp INFIELD stea001
            #add-point:ON ACTION controlp INFIELD stea001 name="construct.c.stea001"
            #應用 a08 樣板自動產生(Version:2)
            #開窗c段
            INITIALIZE g_qryparam.* TO NULL
            LET g_qryparam.state = 'c' 
            LET g_qryparam.reqry = FALSE
            CALL q_stfa001()                           #呼叫開窗
            DISPLAY g_qryparam.return1 TO stea001  #顯示到畫面上
            NEXT FIELD stea001                     #返回原欄位
    


            #END add-point
 
 
         #應用 a01 樣板自動產生(Version:2)
         BEFORE FIELD stea001
            #add-point:BEFORE FIELD stea001 name="construct.b.stea001"
            
            #END add-point
 
 
         #應用 a02 樣板自動產生(Version:2)
         AFTER FIELD stea001
            
            #add-point:AFTER FIELD stea001 name="construct.a.stea001"
            
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
            CALL astp401_get_buffer(l_dialog)
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
         CALL astp401_init()
         CONTINUE WHILE
      END IF
 
      #檢查批次設定是否有錯(或未設定完成)
      IF NOT cl_schedule_exec_check() THEN
         CONTINUE WHILE
      END IF
      
      LET lc_param.wc = g_master.wc    #把畫面上的wc傳遞到參數變數
      #請在下方的add-point內進行把畫面的輸入資料(g_master)轉換到傳遞參數變數(lc_param)的動作
      #add-point:ui_dialog段exit dialog name="process.exit_dialog"
      #zhanghr-0902----转换record 
      LET lc_param.wc        = g_master.wc
      LET lc_param.dateedit_1 = g_master.dateedit_1
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
                 CALL astp401_process(ls_js)
 
            WHEN g_schedule.gzpa003 = "1"
                 LET ls_js = astp401_transfer_argv(ls_js)
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
 
{<section id="astp401.transfer_argv" >}
#+ 轉換本地參數至cmdrun參數內,準備進入背景執行
PRIVATE FUNCTION astp401_transfer_argv(ls_js)
 
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
 
{<section id="astp401.process" >}
#+ 資料處理   (r類使用g_master為主處理/p類使用l_param為主)
PRIVATE FUNCTION astp401_process(ls_js)
 
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
   DEFINE l_msg         STRING           #160225-00040#17 20160328 add by beckxie
   #end add-point
 
  #INITIALIZE lc_param TO NULL           #p類不可以清空
   CALL util.JSON.parse(ls_js,lc_param)  #r類作業被t類呼叫時使用, p類主要解開參數處
   LET li_p01_status = 1
 
  #IF lc_param.wc IS NOT NULL THEN
  #   LET g_bgjob = "T"       #特殊情況,此為t類作業鬆耦合串入報表主程式使用
  #END IF
 
   #add-point:process段前處理 name="process.pre_process"
   #160225-00040#17 20160328 add by beckxie---S
   IF g_bgjob <> "Y" THEN
      CALL cl_progress_bar_no_window(2)   
   END IF
   #160225-00040#17 20160328 add by beckxie---E 
   #zhanghr-0902--参数为record(lc_param)里的参数
   IF cl_null(lc_param.dateedit_1) THEN
      LET lc_param.dateedit_1 = g_today
   END IF 
   #160225-00040#17 20160328 add by beckxie---S
   LET l_msg = cl_getmsg('ast-00330',g_lang)
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#17 20160328 add by beckxie---E
   CALL astp401_update(lc_param.wc,lc_param.dateedit_1) RETURNING l_success
   #160225-00040#17 20160328 add by beckxie---S
   LET l_msg = cl_getmsg('std-00012',g_lang)
   CALL cl_progress_no_window_ing(l_msg)
   #160225-00040#17 20160328 add by beckxie---E
   #end add-point
 
   #預先計算progressbar迴圈次數
   IF g_bgjob <> "Y" THEN
      #add-point:process段count_progress name="process.count_progress"
      
      #end add-point
   END IF
 
   #主SQL及相關FOREACH前置處理
#  DECLARE astp401_process_cs CURSOR FROM ls_sql
#  FOREACH astp401_process_cs INTO
   #add-point:process段process name="process.process"
   
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
   CALL astp401_msgcentre_notify()
 
END FUNCTION
 
{</section>}
 
{<section id="astp401.get_buffer" >}
PRIVATE FUNCTION astp401_get_buffer(p_dialog)
 
   #add-point:process段define (客製用) name="get_buffer.define_customerization"
   
   #end add-point
   DEFINE p_dialog   ui.DIALOG
   #add-point:process段define name="get_buffer.define"
   
   #end add-point
 
   
   LET g_master.dateedit_1 = p_dialog.getFieldBuffer('dateedit_1')
 
   CALL cl_schedule_get_buffer(p_dialog)
 
   #add-point:get_buffer段其他欄位處理 name="get_buffer.others"
   
   #end add-point
END FUNCTION
 
{</section>}
 
{<section id="astp401.msgcentre_notify" >}
PRIVATE FUNCTION astp401_msgcentre_notify()
 
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
 
{<section id="astp401.other_function" readonly="Y" >}
#add-point:自定義元件(Function) name="other.function"

################################################################################
# Descriptions...: 更新专柜合同异动申请的合同状态
# Memo...........:
# Usage..........: CALL astp401_update (p_wc,p_day)
#                  RETURNING r_success
# Input parameter:p_wc     查询条件
#                :p_day    执行日期
# Return code....: r_success  执行成功
# Date & Author..: 15/7/24 By zhr
# Modify.........:
################################################################################
PUBLIC FUNCTION astp401_update(p_wc,p_day)

DEFINE p_wc        STRING               #组查询条件
DEFINE p_day       DATE                 #执行日期dateedit_1
DEFINE r_success   LIKE type_t.num5      
DEFINE l_sql       STRING
DEFINE l_sql7       STRING
DEFINE l_sql2       STRING
DEFINE l_sql10       STRING
DEFINE l_sql8       STRING
DEFINE l_sql9       STRING
DEFINE l_sql3       STRING
DEFINE l_sql4       STRING
DEFINE l_sql5       STRING
DEFINE l_sql6       STRING
DEFINE l_wc        STRING
DEFINE t_day       LIKE type_t.num5
DEFINE l_success   LIKE type_t.num5
DEFINE l_cnt   LIKE type_t.num5    
DEFINE l_sys          DATE  #ADDED BY LANJJ 2015-12-22 
DEFINE l_sql_upd_date STRING#ADDED BY LANJJ 2015-12-22 
#DEFINE l_stea           RECORD
#     l_steadocno LIKE stea_t.steadocno
#END RECORD
DEFINE l_stfa           RECORD
     stfa001  LIKE stfa_t.stfa001,
     stfa019  LIKE stfa_t.stfa019,
     stfa020  LIKE stfa_t.stfa020,
    # next_b   like stfa_t.stfa020,
     stfa036  LIKE stfa_t.stfa036,
     stfasite LIKE stfa_t.stfasite,
     stfaunit LIKE stfa_t.stfaunit 
END RECORD
DEFINE  l_next_b   LIKE stfa_t.stfa020
#
DEFINE  l_stfa001   LIKE  stfa_t.stfa001
DEFINE  l_stfa036   LIKE  stfa_t.stfa036
DEFINE  l_bdate    LIKE type_t.num5
DEFINE  l_sdate    LIKE type_t.num5

DEFINE  l_site     LIKE stfa_t.stfasite
DEFINE  l_unit     LIKE stfa_t.stfaunit

DEFINE  l_stfaent   LIKE  stfa_t.stfaent
DEFINE  l_stfc002   LIKE  stfc_t.stfc002
DEFINE  l_stfcent   LIKE  stfc_t.stfcent
DEFINE  l_rteisite   LIKE  rtei_t.rteisite
DEFINE  l_rtei001   LIKE  rtei_t.rtei001
DEFINE  l_rtdxsite  LIKE  rtdx_t.rtdxsite
DEFINE  l_rtdx001   LIKE  rtdx_t.rtdx001
define  l_stea  record 
        steadocno like stea_t.steadocno,
        stea004   like stea_t.stea004
      end record
#---add by dengdd 150917-----str------------
DEFINE l_stfw     DYNAMIC ARRAY OF RECORD
        stfw001   LIKE stfw_t.stfw001
                  END RECORD
DEFINE l_steadocno  LIKE stea_t.steadocno
#DEFINE l_sql10        STRING
DEFINE l_sql11        STRING
DEFINE l_sql12        STRING
DEFINE l_sql13        STRING
DEFINE l_sql14        STRING
DEFINE l_sql15        STRING
DEFINE l_sql16        STRING
DEFINE l_sql17        STRING
DEFINE l_sql18        STRING
DEFINE l_sql19        STRING
DEFINE l_sql20        STRING
DEFINE l_sql21        STRING
DEFINE l_sql22        STRING
DEFINE l_sql23        STRING
DEFINE l_i            LIKE type_t.num5
DEFINE l_sql4_2       STRING
#---add by dengdd 150917-----end-------------
#---add by dengdd 151010-----str-------------
DEFINE l_sql13_1      STRING
DEFINE l_sql16_1      STRING
DEFINE l_sql20_1      STRING
DEFINE l_sql23_1      STRING
DEFINE l_sql10_1      STRING
DEFINE l_sql7_1       STRING
#---add by dengdd 151010-----end-------------
DEFINE l_sql24        STRING #add by dengdd 20151102
DEFINE l_sql13_2      STRING #add by dengdd 20151207
DEFINE l_sql3_1       STRING #add by dengdd 151224
DEFINE l_stfj004      LIKE stfj_t.stfj004 #add by dengdd 151224
DEFINE l_sql_sel      STRING  #ADD BY DENGDD 151228
DEFINE l_stfa017      LIKE stfa_t.stfa017 #add by dengdd 151228

   #aooi500設置的組織範圍 
#   CALL s_aooi500_sql_where(g_prog,'steasite') RETURNING l_wc 
   CALL s_aooi500_sql_where(g_prog,'steaunit') RETURNING l_wc    #add by dengdd 150917
   
   #add by dengdd 20150917(S)创建临时表
   DROP TABLE stfw_temp
   CREATE TEMP TABLE stfw_temp
               (stfw001    LIKE stfw_t.stfw001,
                stfw002    LIKE stfw_t.stfw002,
                stfw003    LIKE stfw_t.stfw003,
                stfw004    LIKE stfw_t.stfw004,
                stfw008    LIKE stfw_t.stfw008)
                
   DROP TABLE stfw_temp2
   CREATE TEMP TABLE stfw_temp2
               (stfw001    LIKE stfw_t.stfw001,
                stfw002    LIKE stfw_t.stfw002,
                stfw003    LIKE stfw_t.stfw003,
                stfw004    LIKE stfw_t.stfw004,
                stfw005    LIKE stfw_t.stfw005,
                stfw008    LIKE stfw_t.stfw008)
   #add by dengdd 20150917(E)
   
   #開啟事務
   CALL s_transaction_begin()


   LET r_success=TRUE
   
   #zhanghr2015831-start更新合同状态及库区资料等
#   LET l_sql="select steadocno,stea004 from stea_t WHERE stea004=2 AND stea000 = 'U' AND stea019 <= to_date('",p_day,"','yy/mm/dd')",
#             "                                AND steaent= '",g_enterprise,"'",
#             "                                AND ",  l_wc CLIPPED
  
#    LET l_sql="select steadocno from (SELECT stea001,steadocno,stea002,stea005,stea010,steasite,steaent,steaunit,  
#                                             rank() over(partition by stea001 order by stea002 desc) mm
#                                       FROM stea_t 
#                                      WHERE stea004='2' 
#                                       AND stea000 IN ('U','R') 
#                                       AND steastus = 'Y'
#                                       AND stea019 <= to_date('",p_day,"','yy/mm/dd') )
#                                      where mm = 1 and steaent= '",g_enterprise,"'
#                                             AND ",  p_wc CLIPPED   #add steaunit by dengdd 151022
     LET l_sql="SELECT steadocno FROM (SELECT stea001,steadocno,stea002,stea005,stea010,steasite,steaent,steaunit,  
                                             rank() over(partition by stea001 order by stea002 desc) mm
                                         FROM stea_t 
                                        WHERE stea004='2' 
                                          AND stea000 IN ('U','R') 
                                          AND steastus = 'Y'
                                          AND stea054 = to_date('",p_day,"','yy/mm/dd'))
                                 WHERE mm = 1 
                                   AND steaent= '",g_enterprise,"'
                                   AND steasite='",g_site,"'
                                   AND ", p_wc CLIPPED   #add steaunit by dengdd 151022
                                             
   PREPARE astp401_upd_pre FROM l_sql
   DECLARE b_fill_curs1 CURSOR FOR astp401_upd_pre
   FOREACH b_fill_curs1 INTO l_stea.steadocno    --,l_stea.stea004
         UPDATE stea_t set stea004 = '3' where steadocno = l_stea.steadocno
         AND steaent = g_enterprise #160905-00007#16 add
         IF SQLCA.SQLcode THEN
            INITIALIZE g_errparam TO NULL
            LET g_errparam.code = SQLCA.sqlcode
            LET g_errparam.extend = ''
            LET g_errparam.popup = TRUE
            CALL cl_err()      
           LET r_success=FALSE
           RETURN r_success
        ELSE 
           CALL s_astt401_conf_upd(l_stea.steadocno) RETURNING r_success     
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
   END FOREACH        

   #zhanghr2015831-end更新合同状态及库区资料等
   #更新专柜合同异动申请的合同状态
#add by dengdd 151230(S)
     LET p_wc=cl_replace_str(p_wc,'steaunit','stfasite')
     LET p_wc=cl_replace_str(p_wc,'stea001','stfa001')
     LET p_wc=cl_replace_str(p_wc,'stea005','stfa005')
     LET p_wc=cl_replace_str(p_wc,'stea010','stfa010')     
     LET l_sql10="  SELECT DISTINCT stfc002 FROM stfc_t,stfa_t
                    WHERE stfaent=stfcent                      
                      AND stfcsite = stfasite    
                      AND stfa001=stfc001 
                      AND stfasite ='",g_site,"'
                      AND stfc024 NOT IN ('2')
                      AND (stfa017 =  to_date('",p_day,"','yy/mm/dd') OR (stfa017 is null and stfa019= to_date('",p_day,"','yy/mm/dd')))
                      AND stfaent= '",g_enterprise,"' AND ", p_wc CLIPPED
    LET l_sql7=" UPDATE rtdx_t SET rtdx025 = 'Y' , rtdx026 = 'Y' WHERE rtdx044 IN (",l_sql10,")"
    PREPARE astp401_upd_pre7 FROM l_sql7   
    EXECUTE astp401_upd_pre7  
    IF SQLCA.SQLcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()      
      LET r_success=FALSE
      RETURN r_success
    END IF
  
   #zhanghr-------------start
   #合同状态更改成功=-----产生账期
#add by dengdd 151222(S)--调整为：抓取最大结算日期+2月内的合同更新账期
  LET p_wc = cl_replace_str(p_wc, "stea001", "stfa001")
  LET p_wc = cl_replace_str(p_wc, "stea005", "stfa005")
  LET p_wc = cl_replace_str(p_wc, "stea010", "stfa010")
  LET p_wc = cl_replace_str(p_wc, "steaunit","stfasite")
  
  LET l_sql3_1 = "SELECT DISTINCT stfa001,stfa019,stfa020,stfa036,stfasite,stfaunit,stfj004,
                       RANK() OVER(PARTITION BY stfj001 ORDER BY stfj004 DESC) rank ",
                "  FROM stfa_t ,stfj_t ",
                " WHERE stfaent = stfjent ",
                "   AND stfa001 = stfj001 ",
                "   AND stfa004 IN ('3','4')" ,
                "   AND stfaent = ",g_enterprise,
                "   AND (stfj005 = 'Y' OR stfj005='N') ",
                "   AND ", p_wc CLIPPED
  LET l_sql3 = " SELECT stfa001,stfa019,stfa020,stfa036,stfasite,stfaunit,stfj004 ",
               "   FROM (",l_sql3_1,")",
               "  WHERE rank =1 AND stfj004 <= to_date('",p_day,"','yy/mm/dd')+60"
#add by dengdd 151222(E)

   PREPARE astp401_upd_pre3 FROM l_sql3
   DECLARE b_fill_curs3 CURSOR FOR astp401_upd_pre3
   FOREACH b_fill_curs3 INTO l_stfa.stfa001,l_stfa.stfa019,l_stfa.stfa020,
                            l_stfa.stfa036,l_stfa.stfasite,
                            l_stfa.stfaunit,l_stfj004
           IF SQLCA.SQLcode THEN
              INITIALIZE g_errparam TO NULL
              LET g_errparam.code = SQLCA.sqlcode
              LET g_errparam.extend = ''
              LET g_errparam.popup = TRUE
              CALL cl_err()      
              LET r_success=FALSE
              RETURN r_success
           ELSE
              #计算下次结算日，下年账期开始日= 当前账期结束日+1，下年账期结束日=下年账期开始日+1年（按非自然月算）
#              LET l_stfa.stfa019 = l_stfa.stfa020 + 1      #mark by dengdd 160106
              #LET l_edate = s_date_get_date(l_bdate,12,-1)
              LET l_stfa.stfa019 = l_stfj004 +1             #add by dengdd 160106
              LET l_stfa.stfa020 = s_date_get_date(l_stfa.stfa019,12,-1)

              CALL astp401_cal_period(l_stfa.stfa001,l_stfa.stfa019,l_stfa.stfa020,l_stfa.stfa036,'',l_stfa.stfasite,l_stfa.stfaunit)
              RETURNING l_success
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
           #add by dengdd 15/11/1(S)
           LET l_sql10_1="  SELECT DISTINCT stfc002 FROM stfc_t,stfa_t 
                           WHERE stfaent=stfcent 
                             AND stfasite=stfcsite                              
                             AND stfa001=stfc001
                             AND stfa004='4'                      
                             AND stfc024 NOT IN ('2')
                             AND stfasite='",g_site,"'
                             AND stfa001='",l_stfa.stfa001,"'"                           
                             
           LET l_sql7_1=" UPDATE rtdx_t SET rtdx025 = 'Y' , rtdx026 = 'Y' WHERE rtdx044 IN (",l_sql10_1,")"
           PREPARE astp401_upd_pre7_1 FROM l_sql7_1
           EXECUTE astp401_upd_pre7_1  
           IF SQLCA.SQLcode THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = SQLCA.sqlcode
             LET g_errparam.extend = ''
             LET g_errparam.popup = TRUE
             CALL cl_err()      
             LET r_success=FALSE
             RETURN r_success
           END IF
           #add by dengdd 15/11/1(E)
           #add by dengdd 15/11/2(S)---更新下次计算日，下次费用开始日，下次费用截止日
           LET l_sql24=" MERGE INTO stfb_t a
                                  USING stfj_t b ON (stfjent=stfbent ",
                      "                         AND stfjsite=stfbsite           ",
                      "                         AND stfj001=stfb001             ",
                      "                         AND stfb001='",l_stfa.stfa001,"'",
                      "                         AND stfb006='5')                 ",
                      " WHEN matched THEN ",
                      "    update set a.stfb015=b.stfj004, ",
                      "               a.stfb016=b.stfj002, ",
                      "               a.stfb017=b.stfj003  ",
                      "    where b.stfj002<=a.stfb015 and b.stfj003>=a.stfb015 "
           PREPARE astp401_upd_pre24  FROM l_sql24
           EXECUTE astp401_upd_pre24  
           IF SQLCA.SQLcode THEN
             INITIALIZE g_errparam TO NULL
             LET g_errparam.code = SQLCA.sqlcode
             LET g_errparam.extend = ''
             LET g_errparam.popup = TRUE
             CALL cl_err()      
             LET r_success=FALSE
             RETURN r_success
           END IF    
           
           #add by dengdd 15/11/2(E)
    END FOREACH
                                       
   #add by dengdd 151224(S)---更新到期合同状态为“已延期”
   LET l_sql3 = "UPDATE stfa_t SET stfa004 = '4' WHERE stfaent = ",g_enterprise,
                " AND stfa020 <= to_date('",p_day,"','yy/mm/dd')",
                " AND stfa004 IN ('1','2','3','4')" #lanjj add on 2016-08-04 
   EXECUTE IMMEDIATE l_sql3
   IF SQLCA.SQLcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()      
      LET r_success=FALSE
      RETURN r_success
   END IF
   #add by dengdd 151224(E)
  
  #zhanghr-------------end
   
#mod by baogc 20151022(S)


   #lanjj modify on 2016-07-19 start 不关联stea 不判断商品库区关系表的有效否
   LET p_wc = cl_replace_str(p_wc, "stea001", "stfa001")
   LET p_wc = cl_replace_str(p_wc, "stea005", "stfa005")
   LET p_wc = cl_replace_str(p_wc, "stea010", "stfa010")
   LET p_wc = cl_replace_str(p_wc, "steaunit", "stfasite")    
    
    LET l_sql8 = "SELECT rtei002 ",
                "  FROM rtei_t,stfc_t,stfa_t ", #,stea_t
                " WHERE rtei001 = stfc002 ",
                "   AND rteient = stfcent ",
                #"   AND rteiacti = 'Y' ",    #
                "   AND stfa001 = stfc001 ", #
                "   AND stfaent = stfcent ", #
#                "   AND stfa004 = '6' ",     #状态为6.合同清退中
                "   AND stfa004 IN ('6','7') ", #lanjj modify on 2016-10-08
                "   AND stfa024 <= to_date('",p_day,"','yy/mm/dd')-1 ",
                #"   AND stfa001 = stea001 ", #合同号
                #"   AND stfa002 = stea002 ", #版本
                #"   AND stfa005 = stea005 ", #专柜号
                #"   AND stfa010 = stea010 ", #供应商
                #"   AND steaent = stfaent ",
                "   AND stfasite='",g_site,"'",
                "   AND stfaent= ",g_enterprise," ",
                "   AND ",p_wc CLIPPED
   #lanjj modify on 2016-07-19 end   不关联stea 不判断商品库区关系表的有效否
   
   #将清退日期小于今天的商品可售否更新为N
   LET l_sql4 = "UPDATE rtdx_t SET rtdx025 = 'N' WHERE rtdx001 IN (",l_sql8,") ",
                "   AND rtdx025 = 'Y' "   #lanjj add on 2016-10-09
   PREPARE astp401_upd_pre4 FROM l_sql4
   EXECUTE astp401_upd_pre4
   IF SQLCA.SQLcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'Upd rtdx025'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success=FALSE
      RETURN r_success
   END IF
   #将清退日期小于今天的商品库区关系资料有效否更新为N
   LET l_sql4_2 = "UPDATE rtei_t SET rteiacti = 'N' WHERE rtei002 IN (",l_sql8,")"
   PREPARE astp401_upd_pre4_2 FROM l_sql4_2
   EXECUTE astp401_upd_pre4_2
   IF SQLCA.SQLcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = 'Upd rteiacti'
      LET g_errparam.popup = TRUE
      CALL cl_err()
      LET r_success=FALSE
      RETURN r_success
   END IF
#mod by baogc 20151022(E)
  
 
    #更改可退否为'N'

    #获取退货期限
#    CALL cl_get_para(g_enterprise,g_master.steasite,'S-CIR-2006') RETURNING t_day
     CALL cl_get_para(g_enterprise,g_master.steaunit,'S-CIR-2006') RETURNING t_day   #mod by dengdd 150917
    #更新可退否为‘N’

  LET l_sql9 = " SELECT rtei002 FROM rtei_t,stfc_t,stfa_t",#,stea_t
               "               WHERE rtei001 = stfc002
                                 AND rteient = stfcent
                                 AND stfa001 = stfc001
                                 AND stfaent = stfcent ",
#                                 AND steasite=stfasite
#                                 AND steasite=stfcsite
#                                 AND steasite=rteisite
#                                 AND stfa004 = '6'
               "                  AND stfa004 IN ('6','7') ",
               "                  AND stfa024 <= to_date('",p_day,"','yy/mm/dd')-NVL('",t_day,"',0) ",
#                                 AND stfa001 = stea001 
#                                 AND stfa005 = stea005 
#                                 AND stfa010 = stea010  
#                                 AND steaent = stfaent 
#                                 AND steaent= '",g_enterprise,"' 
               "                  AND stfasite='",g_site,"'",
               "                  AND stfaent= ",g_enterprise," ",
               "                  AND ",p_wc CLIPPED
                                 
     LET l_sql5="UPDATE rtdx_t SET rtdx026='N'
                WHERE rtdx044 in  (",l_sql9,") AND rtdx026 = 'Y' " 
  
   PREPARE astp401_upd_pre5 FROM l_sql5
   EXECUTE astp401_upd_pre5
   IF SQLCA.SQLcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.extend = ''
      LET g_errparam.popup = TRUE
      CALL cl_err()      
      LET r_success=FALSE
      RETURN r_success
   END IF
   
#----add by dengdd 150917--------str-----------------------------
                
   #递增方式为“扣点”
   LET l_sql10=" SELECT stfw001,stfw002,stfw003,stfw004,stfw008 ",
               "   FROM stfw_t ",
               "  WHERE stfwent = '",g_enterprise,"'",
               "    AND stfwsite='",g_site,"'",
               "    AND stfwacti ='Y' AND stfw007='1'  AND stfw005 <= to_date('",p_day,"','yyyy/mm/dd')" 
                   
   LET l_sql11 =" INSERT INTO stfw_temp ",l_sql10
   PREPARE astp401_ins_stfw_tmp FROM l_sql11
   EXECUTE astp401_ins_stfw_tmp
   
   #----更新费用明细的扣点
   LET l_sql12 =" MERGE INTO stfb_t a",
                "      USING stfw_temp b ON (a.stfb001=b.stfw001 
                                         AND a.stfb002=b.stfw004 
                                         AND a.stfbseq=b.stfw003 
                                         AND b.stfw002 = '1')",
                " WHEN MATCHED THEN ",
                "      UPDATE SET a.stfb011=nvl(a.stfb011,0) + b.stfw008 "
                
   EXECUTE IMMEDIATE l_sql12
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "upd stfb_t:stfb011" 
         LET g_errparam.code   = STATUS
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success=FALSE
         RETURN
   END IF 
   
   #----更新库区设置的扣点
   LET l_sql13 =" MERGE INTO stfc_t a",
                "      USING stfw_temp b ON (a.stfc001=b.stfw001 
                                         AND a.stfc002=b.stfw004 
                                         AND a.stfcseq=b.stfw003 
                                         AND b.stfw002 = '2')",
                " WHEN MATCHED THEN ",
                "      UPDATE SET a.stfc018=nvl(a.stfc018,0) + b.stfw008 "
                
   EXECUTE IMMEDIATE l_sql13
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "upd stfc_t:stfb011" 
         LET g_errparam.code   = STATUS
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success=FALSE
         RETURN
   END IF
   
   #add by dengdd 151010
   #----更新常规库区下的所有促销库区的扣点
   LET l_sql13_1 =" MERGE INTO stfc_t a",
                  "      USING stfw_temp b ON (a.stfc001=b.stfw001
                                          AND  a.stfc025=b.stfw004 
                                          AND  a.stfc024 = '2'
                                          AND  b.stfw002 = '2')",
                  " WHEN MATCHED THEN ",
                  "      UPDATE SET a.stfc018=nvl(a.stfc018,0) + b.stfw008 "
   EXECUTE IMMEDIATE l_sql13_1
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "upd stfc_t(1):stfb011" 
         LET g_errparam.code   = STATUS
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success=FALSE
         RETURN
   END IF              
                  
   
   #----查找astt401中是否存在执行日期大于今天的异动单据，若有，则更新。
   LET l_sql14=" SELECT distinct stfw001 ",
               "   FROM stfw_t ",
               "  WHERE stfwent = '",g_enterprise,"'",
               "    AND stfwsite='",g_site,"'",
               "    AND stfwacti ='Y' AND stfw007='1'  AND stfw005 <= to_date('",p_day,"','yy/mm/dd')" 
   PREPARE astp401_sel FROM l_sql14
   DECLARE astp401_sel_stfw001 CURSOR FOR astp401_sel
   
   LET l_i=1   
   FOREACH astp401_sel_stfw001 INTO l_stfw[l_i].*
       IF STATUS THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sel stfw_t" 
         LET g_errparam.code   = STATUS
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success=FALSE
         RETURN
       END IF
       
       #---查询执行日期大于当前执行日期的单据
       SELECT steadocno INTO l_steadocno 
         FROM stea_t
        WHERE steaent=g_enterprise 
          and steasite=g_site
          AND stea001=l_stfw[l_i].stfw001
          AND stea001='2'
          AND stea054>g_today
          
       IF NOT cl_null(l_steadocno) THEN
           #----更新费用明细的扣点
           LET l_sql15 =" MERGE INTO steb_t a",
                        "      USING stfw_temp b ON (a.steb001=b.stfw001 
                                                 AND a.steb002=b.stfw004 
                                                 AND a.stebseq=b.stfw003 
                                                 AND b.stfw002 = '1' 
                                                 AND b.stfw001 = '",l_steadocno,"')",
                        " WHEN MATCHED THEN ",
                        "      UPDATE SET a.steb011=nvl(a.steb011,0) + b.stfw008 "
#                        "       WHERE b.stfw002 = '1' AND b.stfw001 = '",l_steadocno,"'"
                        
           EXECUTE IMMEDIATE l_sql15
           IF STATUS THEN
              INITIALIZE g_errparam TO NULL 
                 LET g_errparam.extend = "upd steb_t" 
                 LET g_errparam.code   = STATUS
                 LET g_errparam.popup  = TRUE 
                 CALL cl_err()
                 LET r_success=FALSE
                 RETURN
           END IF 
           
           #----更新库区设置的扣点
           LET l_sql16 =" MERGE INTO stec_t a",
                        "      USING stfw_temp b ON (a.stec001=b.stfw001 
                                                 AND a.stec002=b.stfw004 
                                                 AND a.stecseq=b.stfw003 
                                                 AND b.stfw002 = '2' 
                                                 AND b.stfw001 ='",l_steadocno,"')",
                        " WHEN MATCHED THEN ",
                        "      UPDATE SET a.stec018=nvl(a.stec018,0) + b.stfw008 "
#                        "       WHERE b.stfw002 = '2' AND b.stfw001 ='",l_steadocno,"'"
                        
           EXECUTE IMMEDIATE l_sql16
           IF STATUS THEN
              INITIALIZE g_errparam TO NULL 
                 LET g_errparam.extend = "upd stec_t" 
                 LET g_errparam.code   = STATUS
                 LET g_errparam.popup  = TRUE 
                 CALL cl_err()
                 LET r_success=FALSE
                 RETURN
           END IF
           
           #add by dengdd 151010
           #----更新常规库区下的所有促销库区的扣点
            LET l_sql16_1 =" MERGE INTO stec_t a",
                        "      USING stfw_temp b ON (a.stec001=b.stfw001 
                                                 AND a.stec025=b.stfw004 
                                                 AND a.stec024 = '2'
                                                 AND b.stfw002 = '2' 
                                                 AND b.stfw001 ='",l_steadocno,"')",
                        " WHEN MATCHED THEN ",
                        "      UPDATE SET a.stec018=nvl(a.stec018,0) + b.stfw008 "
                        
           EXECUTE IMMEDIATE l_sql16_1
           IF STATUS THEN
              INITIALIZE g_errparam TO NULL 
                 LET g_errparam.extend = "upd stec_t(1)" 
                 LET g_errparam.code   = STATUS
                 LET g_errparam.popup  = TRUE 
                 CALL cl_err()
                 LET r_success=FALSE
                 RETURN
           END IF
       END IF
       
       LET l_i=l_i+1 
   END FOREACH
   
   CALL l_stfw.deleteElement(l_i)
   
   #add by dengdd 151207(S)----更新该笔递增资料状态为‘N’
   IF r_success THEN
      LET l_sql13_2 = "UPDATE stfw_t SET stfwacti='N' WHERE stfwent =",g_enterprise,
                      "    AND stfwsite= '",g_site,"'",
                      "    AND stfwacti ='Y' AND stfw007='1'  AND stfw005 <= to_date('",p_day,"','yyyy/mm/dd')"
      IF STATUS THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "upd stfw_t:stfwacti" 
         LET g_errparam.code   = STATUS
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success=FALSE
         RETURN
      END IF
   END IF
   #add by dengdd 151207(E)
   
   #递增方式为“金额”  
                
   LET l_sql17=" SELECT stfw001,stfw002,stfw003,stfw004,stfw008 ",
               "   FROM stfw_t ",
               "  WHERE stfwent = '",g_enterprise,"'",
               "    AND stfwsite= '",g_site,"'",
               "    AND stfwacti ='Y' AND stfw007='2'  AND stfw005 <= to_date('",p_day,"','yy/mm/dd')" 
                   
   LET l_sql18 =" INSERT INTO stfw_temp2 ",l_sql17
   PREPARE astp401_ins_stfw_tmp2 FROM l_sql18
   EXECUTE astp401_ins_stfw_tmp2
   
   #----更新费用明细的费用金额
   LET l_sql19 =" MERGE INTO stfb_t a",
                "      USING stfw_temp2 b ON (a.stfb001=b.stfw001 
                                         AND a.stfb002=b.stfw004 
                                         AND a.stfbseq=b.stfw003 
                                         AND b.stfw002 = '1')",
                " WHEN MATCHED THEN ",
                "      UPDATE SET a.stfb010=nvl(a.stfb010,0) + b.stfw008 "
                
   EXECUTE IMMEDIATE l_sql19
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "upd stfb_t:stfb010" 
         LET g_errparam.code   = STATUS
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success=FALSE
         RETURN
   END IF 
   
   #----更新库区设置的费用金额
   LET l_sql20 =" MERGE INTO stfc_t a",
                "      USING stfw_temp2 b ON (a.stfc001=b.stfw001 
                                         AND a.stfc002=b.stfw004 
                                         AND a.stfcseq=b.stfw003 
                                         AND b.stfw002 = '2')",
                " WHEN MATCHED THEN ",
                "      UPDATE SET a.stfc017=nvl(a.stfc017,0) + b.stfw008 "
                
   EXECUTE IMMEDIATE l_sql20
   IF STATUS THEN
      INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "upd stfc_t:stfc017" 
         LET g_errparam.code   = STATUS
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success=FALSE
         RETURN
   END IF
   
   #add by dengdd 151010
   #----更新常规库区下的所有促销库区的费用金额
   LET l_sql20_1 =" MERGE INTO stfc_t a",
                "      USING stfw_temp2 b ON (a.stfc001=b.stfw001 
                                         AND a.stfc025=b.stfw004 
                                         AND b.stfw002 = '2')",
                " WHEN MATCHED THEN ",
                "      UPDATE SET a.stfc017=nvl(a.stfc017,0) + b.stfw008 "
                
   EXECUTE IMMEDIATE l_sql20_1
   IF STATUS THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "upd stfc_t:stfc017(2)" 
         LET g_errparam.code   = STATUS
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success=FALSE
         RETURN
   END IF
   
   #----查找astt401中是否存在执行日期大于今天的异动单据，若有，则更新。
   LET l_sql21=" SELECT distinct stfw001 ",
               "   FROM stfw_t ",
               "  WHERE stfwent = '",g_enterprise,"'",
               "    AND stfwsite ='",g_site,"'",
               "    AND stfwacti ='Y' AND stfw007='2'  AND stfw005 <= to_date('",p_day,"','yy/mm/dd')" 
   PREPARE astp401_sel2 FROM l_sql21
   DECLARE astp401_sel2_stfw001 CURSOR FOR astp401_sel2
   
   LET l_i=1 
   CALL l_stfw.clear()   
   FOREACH astp401_sel2_stfw001 INTO l_stfw[l_i].*
       IF STATUS THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "sel stfw_t" 
         LET g_errparam.code   = STATUS
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success=FALSE
         RETURN
       END IF
       
       #---查询执行日期大于当前执行日期的单据
       SELECT steadocno INTO l_steadocno 
         FROM stea_t
        WHERE steaent=g_enterprise 
          and steasite=g_site
          AND stea001=l_stfw[l_i].stfw001
          AND stea001='2'
          AND stea054>g_today
          
       IF NOT cl_null(l_steadocno) THEN
           #----更新费用明细的费用金额
           LET l_sql22 =" MERGE INTO steb_t a",
                        "      USING stfw_temp2 b ON (a.steb001=b.stfw001 
                                                 AND a.steb002=b.stfw004 
                                                 AND a.stebseq=b.stfw003 
                                                 AND b.stfw002 = '1' 
                                                 AND b.stfw001 = '",l_steadocno,"')",
                        " WHEN MATCHED THEN ",
                        "      UPDATE SET a.steb010=nvl(a.steb010,0) + b.stfw008 "
                        
           EXECUTE IMMEDIATE l_sql22
           IF STATUS THEN
              INITIALIZE g_errparam TO NULL 
                 LET g_errparam.extend = "upd steb_t" 
                 LET g_errparam.code   = STATUS
                 LET g_errparam.popup  = TRUE 
                 CALL cl_err()
                 LET r_success=FALSE
                 RETURN
           END IF 
           
           #----更新库区设置的费用金额
           LET l_sql23 =" MERGE INTO stec_t a",
                        "      USING stfw_temp2 b ON (a.stec001=b.stfw001 
                                                 AND a.stec002=b.stfw004 
                                                 AND a.stecseq=b.stfw003 
                                                 AND b.stfw002 = '2' 
                                                 AND b.stfw001 ='",l_steadocno,"')",
                        " WHEN MATCHED THEN ",
                        "      UPDATE SET a.stec017=nvl(a.stec017,0) + b.stfw008 "
                        
           EXECUTE IMMEDIATE l_sql23
           IF STATUS THEN
              INITIALIZE g_errparam TO NULL 
                 LET g_errparam.extend = "upd stec_t" 
                 LET g_errparam.code   = STATUS
                 LET g_errparam.popup  = TRUE 
                 CALL cl_err()
                 LET r_success=FALSE
                 RETURN
           END IF
           
           #add by dengdd 151010
           #----更新常规库区下的所有促销库区的费用金额
           LET l_sql23_1 =" MERGE INTO stec_t a",
                         "      USING stfw_temp2 b ON (a.stec001=b.stfw001
                                                  AND a.stec025=b.stfw004 
                                                  AND b.stfw002 = '2' 
                                                  AND b.stfw001 ='",l_steadocno,"')",
                         " WHEN MATCHED THEN ",
                         "      UPDATE SET a.stec017=nvl(a.stec017,0) + b.stfw008 "
                        
           EXECUTE IMMEDIATE l_sql23_1
           IF STATUS THEN
              INITIALIZE g_errparam TO NULL 
                 LET g_errparam.extend = "upd stec_t(2)" 
                 LET g_errparam.code   = STATUS
                 LET g_errparam.popup  = TRUE 
                 CALL cl_err()
                 LET r_success=FALSE
                 RETURN
           END IF
       END IF
       
       LET l_i=l_i+1 
   END FOREACH
   
   CALL l_stfw.deleteElement(l_i)
   #add by dengdd 151207(S)----更新该笔递增资料状态为‘N’
   IF r_success THEN
      LET l_sql13_2 = "UPDATE stfw_t SET stfwacti='N' WHERE stfwent =",g_enterprise,
                      "    AND stfwsite= '",g_site,"'",
                      "    AND stfwacti ='Y' AND stfw005 <= to_date('",p_day,"','yyyy/mm/dd')"
      EXECUTE IMMEDIATE l_sql13_2
      IF STATUS THEN
         INITIALIZE g_errparam TO NULL 
         LET g_errparam.extend = "upd stfw_t:stfwacti" 
         LET g_errparam.code   = STATUS
         LET g_errparam.popup  = TRUE 
         CALL cl_err()
         LET r_success=FALSE
         RETURN
      END IF
   END IF
   #add by dengdd 151207(E)
   
#----add by dengdd 150917--------end-----------------------------

  #ADDED BY LANJJ 2015-12-22 ---start---
   #根据（开业日期=执行日期 或 开业日期=执行日期-1 或 开业日期=执行日期-2 ）时，将开业日期，更新到astm401合同状态 < 6的合同的进场日期
   LET l_sys = cl_get_para(g_enterprise,g_site,"S-CIR-2017")
   LET p_wc = cl_replace_str(p_wc, "stea001", "stfa001")
   LET p_wc = cl_replace_str(p_wc, "stea005", "stfa005")
   LET p_wc = cl_replace_str(p_wc, "stea010", "stfa010")
   LET p_wc = cl_replace_str(p_wc, "steaunit", "stfasite")
   IF l_sys = p_day OR l_sys = p_day - 1 OR l_sys = p_day - 2 THEN 
      #ADD BY DENGDD 151228(S)
      LET l_sql_sel="SELECT stfa017 FROM stfa_t WHERE stfaent= ",g_enterprise,
                    " AND stfasite='",g_site,"'",
                    " AND stfa003 IN ('4','5')",
                    " AND stfa004 IN ('1','2','3','4','5')",
                    " AND ",p_wc CLIPPED
      PREPARE astp401_sel3 FROM l_sql_sel
      DECLARE astp401_sel_stfa017 CURSOR FOR astp401_sel3
      FOREACH astp401_sel_stfa017 INTO l_stfa017
      
          IF l_stfa017 IS NULL THEN
             LET l_sql_upd_date = "UPDATE stfa_t ",
                                  "   SET stfa017 = '",p_day ,"'",
                                  " WHERE stfaent = '",g_enterprise ,"'",
                                  "   AND stfasite = '",g_site,"'",
                                  "   AND stfa003 IN ('4','5') ",
                                  "   AND stfa004 IN ('1','2','3','4','5') ",
                                  "   AND ",p_wc CLIPPED
             EXECUTE IMMEDIATE l_sql_upd_date
          END IF
      END FOREACH
      #ADD BY DENGDD 151228(S)
  #ADDED BY LANJJ 2015-12-22 ---start---
   END IF 
   
   #事務提交
   IF r_success THEN
      CALL s_transaction_end('Y','0')
   ELSE
      CALL s_transaction_end('N','0')
   END IF

   RETURN r_success

END FUNCTION

################################################################################
# Descriptions...: 描述说明
# Memo...........:
# Usage..........: CALL astp401_cal_period (p_stfa001,p_bdate,p_edate,p_stfa036,p_next_b,p_site,p_unit)
#                  RETURNING r_success
# Input parameter:p_stfa001
#                :p_bdate,
#                :p_edate
#                :p_stfa036
#                :p_next_b
#                :p_site
#                :p_unit 
# Return code....: r_success 
# Date & Author..: 15/8/21 By zhanghr
# Modify.........:
################################################################################
PUBLIC FUNCTION astp401_cal_period(p_stfa001,p_bdate,p_edate,p_stfa036,p_next_b,p_site,p_unit)
 

DEFINE p_stfa001  LIKE stfa_t.stfa001
DEFINE p_bdate    LIKE stfa_t.stfa019
DEFINE p_edate    LIKE stfa_t.stfa020
DEFINE p_stfa036  LIKE stfa_t.stfa036
DEFINE p_next_b   LIKE stfa_t.stfa020
DEFINE p_site     LIKE stfj_t.stfjsite
DEFINE p_unit     LIKE stfj_t.stfjunit
DEFINE l_staa002  LIKE staa_t.staa002
DEFINE l_staa003  LIKE staa_t.staa003
DEFINE l_staa004  LIKE staa_t.staa004
DEFINE l_staa005  LIKE staa_t.staa005
DEFINE l_stfj003  LIKE stfj_t.stfj003
DEFINE l_n        LIKE type_t.num5
DEFINE l_cnt      LIKE type_t.num5
DEFINE l_date     LIKE type_t.dat
DEFINE l_c        LIKE type_t.num5
DEFINE r_success  LIKE type_t.num5
DEFINE l_sys      LIKE type_t.chr1

   WHENEVER ERROR CONTINUE
   
   DELETE FROM stfj_t 
    WHERE stfjent = g_enterprise 
      AND stfj001 = p_stfa001 
      AND stfj005 = 'N'
      AND stfj004 > (SELECT MAX(stfj004) FROM stfj_t WHERE stfjent = g_enterprise AND stfj001 = p_stfa001 AND stfj005='Y') #add by dengdd 160304
   IF SQLCA.sqlcode THEN
      INITIALIZE g_errparam TO NULL
      LET g_errparam.code = SQLCA.sqlcode
      LET g_errparam.popup = TRUE
      CALL cl_err()
      RETURN FALSE
   END IF
   
   LET l_n = 0
   LET l_c = 0
   SELECT MAX(stfjseq) INTO l_n FROM stfj_t
    WHERE stfjent = g_enterprise
      AND stfj001 = p_stfa001
      #AND stfj005 = 'Y'  #mark by dengdd 160304
   #如果有已结算帐期，先判断合同结束日期是否跟p_edate相同，是则不用计算，否从已结算帐期截止日期+1天开始算；
   #否则从第1帐期开始算
   IF l_n > 0 THEN
      SELECT stfj003 INTO l_stfj003 FROM stfj_t
       WHERE stfjent = g_enterprise
         AND stfj001 = p_stfa001
         AND stfjseq = l_n
      IF l_stfj003 = p_edate THEN
         RETURN TRUE
      ELSE
         LET p_bdate = l_stfj003 + 1
         LET l_n = l_n + 1
      END IF
   ELSE
      LET l_n = 1
   END IF
   
   #根据结算方式抓取出加月数和加天数（结算方式只能设置加天或者加月）
   #加月按照自然月计算，不区分残月；加天按照时间天数算
   SELECT staa002,staa003,staa004,staa005 INTO l_staa002,l_staa003,l_staa004,l_staa005 FROM staa_t
    WHERE staaent = g_enterprise AND staa001 = p_stfa036
   IF cl_null(l_staa002) THEN LET l_staa002 = 0 END IF
   IF cl_null(l_staa003) THEN LET l_staa003 = 0 END IF
   IF l_staa002 = 0 AND l_staa003 = 0 THEN RETURN FALSE END IF
   
   #add by dengdd 15/11/2(S)------
   LET l_date = p_bdate
   IF l_staa002 > 0 THEN
      IF l_staa004 = '1' THEN     #标准结算
         LET p_next_b = s_date_get_date(p_bdate,l_staa002,0)
      ELSE                        #月底结算
         LET p_next_b = s_date_get_date(p_bdate,l_staa002-1,0)
      END IF
  
      LET l_date = p_next_b        
   END IF
   IF l_staa004 = '1' THEN
      LET p_next_b = s_date_get_date(l_date,0,l_staa003-1)
   ELSE
      IF l_staa003 > 0 THEN
         IF l_staa005 >0 THEN
            #加入月拆分期的计算
            #例:加天为7 月拆分为4   2月1-28 最后一期为2月22-2月28 最后一期7天
            #例:加天为7 月拆分为4   8月1-31 最后一期为8月22-8月31 最后一期10天
#mark by dengdd 151219(S)
#            IF l_c MOD l_staa005 = 0 THEN   #月拆分最后一期。如果上期结束日期小于月底，则该期账期是 上期结束+1 到 该月月底
#               LET p_next_b = s_date_get_last_date(l_date)
#               LET l_c = 0
#            ELSE
               CALL s_astt301_cal_nextb(l_date,l_staa003,l_staa005) RETURNING l_date,p_next_b,l_c
#            END IF 
#mark by dengdd 151219(E)
            #add by yangxf 20151222 ---start----
            #如果是周结，第二期的结束日期根据参数设置来
            IF l_c = 2 AND l_staa005 = 4 THEN
#               CALL cl_get_para(g_enterprise,g_site,'E-CIR-0057') RETURNING l_sys
               CALL cl_get_para(g_enterprise,g_site,'E-CIR-0058') RETURNING l_sys #mod by dengdd 151228
               IF l_sys = '2' THEN
                  LET p_next_b = MDY(MONTH(l_date),15,YEAR(l_date))
               ELSE
                  LET p_next_b = MDY(MONTH(l_date),14,YEAR(l_date))
               END IF
            END IF
            #add by yangxf 20151222 ---end----
         ELSE
            LET p_next_b = s_date_get_date(l_date,0,l_staa003-1)
         END IF            
      END IF
   END IF
      
   IF l_staa004 = '2' AND l_staa005 = 0  THEN        #1.标准结算 2.月底结算
      LET p_next_b = s_date_get_last_date(p_next_b)
   END IF
   
   IF p_next_b >= p_edate THEN
      LET p_next_b = p_edate
   END IF
   #add by dengdd 15/11/2(E)-------
   
   #计算剩余账期
   WHILE TRUE
       
      LET l_c = l_c+1
      #插入第l_n期别的账期
      INSERT INTO stfj_t (stfjent,stfjsite,stfjunit,stfjseq,stfj001,stfj002,stfj003,stfj004,stfj005,stfj006)
       VALUES (g_enterprise,p_site,p_unit,l_n,p_stfa001,p_bdate,p_next_b,p_next_b,'N','') 
      IF SQLCA.sqlcode THEN
         INITIALIZE g_errparam TO NULL
         LET g_errparam.code = SQLCA.sqlcode
         LET g_errparam.popup = TRUE
         CALL cl_err()
         RETURN FALSE
      END IF
      
      LET p_bdate = p_next_b + 1
      IF p_bdate > p_edate THEN
         EXIT WHILE 
      END IF

      LET l_date = p_bdate
      IF l_staa002 > 0 THEN
         IF l_staa004 = '1' THEN     #标准结算
            LET p_next_b = s_date_get_date(p_bdate,l_staa002,0)
         ELSE                        #月底结算
            LET p_next_b = s_date_get_date(p_bdate,l_staa002-1,0)
         END IF
 
         LET l_date = p_next_b        
      END IF
      IF l_staa004 = '1' THEN
         LET p_next_b = s_date_get_date(l_date,0,l_staa003-1)
      ELSE
         IF l_staa003 > 0 THEN
            IF l_staa005 >0 THEN
               #加入月拆分期的计算
               #例:加天为7 月拆分为4   2月1-28 最后一期为2月22-2月28 最后一期7天
               #例:加天为7 月拆分为4   8月1-31 最后一期为8月22-8月31 最后一期10天
               IF l_c MOD l_staa005 = 0 THEN   #月拆分最后一期。如果上期结束日期小于月底，则该期账期是 上期结束+1 到 该月月底
                  LET p_next_b = s_date_get_last_date(l_date)
                  LET l_c = 0
               ELSE
                  CALL s_astt301_cal_nextb(l_date,l_staa003,l_staa005) RETURNING l_date,p_next_b,l_c
               END IF 
            ELSE
               LET p_next_b = s_date_get_date(l_date,0,l_staa003-1)
            END IF            
         END IF
      END IF
      
      IF l_staa004 = '2' AND l_staa005 = 0  THEN        #1.标准结算 2.月底结算
         LET p_next_b = s_date_get_last_date(p_next_b)
      END IF
      
      IF p_next_b >= p_edate THEN
         LET p_next_b = p_edate
      END IF
      LET l_n = l_n + 1
   
   END WHILE
   
   RETURN TRUE



END FUNCTION

################################################################################
# Descriptions...: 获取下一年开始日
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
PRIVATE FUNCTION astp401_nextday(p_stfa036,p_stfa019,p_stfa020)

DEFINE p_stfa036   LIKE stfa_t.stfa036
DEFINE p_stfa019     LIKE stfa_t.stfa019
DEFINE p_stfa020     LIKE stfa_t.stfa020
DEFINE r_nextdate  LIKE stca_t.stca017
DEFINE l_staa002   LIKE staa_t.staa002
DEFINE l_staa003   LIKE staa_t.staa003
DEFINE l_staa004   LIKE staa_t.staa004
DEFINE l_staa005   LIKE staa_t.staa005
DEFINE l_date      LIKE type_t.dat
DEFINE l_c         LIKE type_t.num5

   IF cl_null(p_stfa036) OR cl_null(p_stfa019) OR cl_null(p_stfa020) THEN
      RETURN ''
   END IF
   
   SELECT staa002,staa003,staa004,staa005 INTO l_staa002,l_staa003,l_staa004,l_staa005
     FROM staa_t
    WHERE staa001 = p_stfa036
      AND staaent = g_enterprise #160905-00007#16 add
   IF cl_null(l_staa002) THEN LET l_staa002 = 0 END IF
   IF cl_null(l_staa003) THEN LET l_staa003 = 0 END IF
   IF l_staa002 = 0 AND l_staa003 = 0 THEN RETURN '' END IF
   
   LET l_date = p_stfa019
   IF l_staa002 > 0 THEN
      IF l_staa004 = '1' THEN
         LET r_nextdate = s_date_get_date(p_stfa019,l_staa002,0)
      ELSE
         LET r_nextdate = s_date_get_date(p_stfa019,l_staa002-1,0)
      END IF
      LET l_date = r_nextdate  
   END IF
   IF l_staa004 = '1' THEN
   
      LET r_nextdate = s_date_get_date(l_date,0,l_staa003-1)
   ELSE
      IF l_staa003 > 0 THEN
         #LET r_nextdate = s_date_get_date(l_date,0,l_staa003-1)
          IF l_staa005 >0 THEN
            #加入月拆分期的计算
            #例:加天为7 月拆分为4   2月1-28 最后一期为2月22-2月28 最后一期7天
            #例:加天为7 月拆分为4   8月1-31 最后一期为8月22-8月31 最后一期10天      
            CALL s_astt301_cal_nextb(l_date,l_staa003,l_staa005) RETURNING l_date,r_nextdate,l_c
         ELSE
            LET r_nextdate = s_date_get_date(l_date,0,l_staa003-1)
         END IF   
      END IF
   END IF
   IF l_staa004 = '2' THEN
      LET r_nextdate = s_date_get_last_date(r_nextdate)
   END IF
   IF r_nextdate > p_stfa020 THEN LET r_nextdate = p_stfa020 END IF
   RETURN r_nextdate
END FUNCTION

#end add-point
 
{</section>}
 
